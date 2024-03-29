


#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда


#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиСобытий

Процедура ОбработкаПроведения(Отказ,Режим)
	СвойстваНоменклатуры = СвойстваНоменклатуры(Номенклатура);
	// регистр АктивныеПосещения
	Движения.АктивныеПосещения.Записывать = Истина;
	Движение = Движения.АктивныеПосещения.Добавить();
	Движение.Период = Дата;
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Основание = Ссылка;
	Движение.ВидАттракциона = СвойстваНоменклатуры.ВидАттракциона;
	Движение.КоличествоПосещений = СвойстваНоменклатуры.КоличествоПосещений;

	// регистр Продажи
	Движения.Продажи.Записывать = Истина;
	Движение = Движения.Продажи.Добавить();
	Движение.Период = Дата;	
	Движение.ВидАттракциона = СвойстваНоменклатуры.ВидАттракциона;
	Движение.Сумма = СуммаДокумента;

КонецПроцедуры

Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	МаксимальнаяДоля = Константы.МаксимальнаяДоляОплатыБаллами.Получить();
	Если БаллыКСписанию <> 0 Тогда
		Если БаллыКСписанию > Цена Тогда
			Отказ = Истина;
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Баллы превышают цену, а не должны";
			Сообщение.УстановитьДанные(ЭтотОбъект);
			Сообщение.Поле = "БаллыКСписанию";
			Сообщение.Сообщить();
			
		КонецЕсли;
		Доля = БаллыКСписанию/Цена*100;
		Если Доля > МаксимальнаяДоля Тогда
			Отказ = Истина;
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = СтрШаблон("Доля списываемых баллов больше допустимой (%1%%)",МаксимальнаяДоля);
			Сообщение.УстановитьДанные(ЭтотОбъект);
			Сообщение.Поле = "БаллыКСписанию";
			Сообщение.Сообщить();
			
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СвойстваНоменклатуры(Номенклатура)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	|	Номенклатура.ВидАттракциона,
	|	Номенклатура.КоличествоПосещений
	|ИЗ
	|	Справочник.Номенклатура КАК Номенклатура
	|ГДЕ
	|	Номенклатура.Ссылка = &Ссылка";
	Запрос.УстановитьПараметр("Ссылка", Номенклатура);
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Результат = Новый Структура;
	Результат.Вставить("ВидАттракциона",Выборка.ВидАттракциона);
	Результат.Вставить("КоличествоПосещений", Выборка.КоличествоПосещений);
	Возврат Результат;
	
КонецФункции

#КонецОбласти

#Область Инициализация

#КонецОбласти

#КонецЕсли
