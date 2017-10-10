﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"УМеняЕстьИсходноеСлогаемоеРавное(Парам01)","УМеняЕстьИсходноеСлогаемоеРавное","Допустим у меня есть исходное слогаемое равное 54","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"РезультатРасчетаВозрастаВМесяцахБудетРавен(Парам01)","РезультатРасчетаВозрастаВМесяцахБудетРавен","Тогда результат расчета возраста в месяцах будет равен 648","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Допустим у меня есть исходное слогаемое равное 54
//@УМеняЕстьИсходноеСлогаемоеРавное(Парам01)
Процедура УМеняЕстьИсходноеСлогаемоеРавное(Слогаемое) Экспорт
Контекст.Вставить("Слогаемое", Слогаемое) 
КонецПроцедуры

&НаКлиенте
//Тогда результат расчета возраста в месяцах будет равен 648
//@РезультатРасчетаВозрастаВМесяцахБудетРавен(Парам01)
Процедура РезультатРасчетаВозрастаВМесяцахБудетРавен(ОжидаемыйРезультат) Экспорт
Результат = ОбщийМодуль1.ПолучитьРезульатРасчетаВозрастаВМесяцах(Контекст.Слогаемое);
Если Не Результат = ОжидаемыйРезультат Тогда
	ВызватьИсключение "Результат расчитан не верно"
КонецЕсли;
КонецПроцедуры
