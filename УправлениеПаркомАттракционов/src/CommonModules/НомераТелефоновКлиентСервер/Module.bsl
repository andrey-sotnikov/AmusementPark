
#Область ПрограммныйИнтерфейс

// Нормализованный номер телефона.
// 
// Параметры:
// Телефон Строка
// 
// Возвращаемое значение: Строка
//  
Функция НормализованныйНомерТелефона(Телефон, ВызыватьИсключение = Ложь) Экспорт
	Цифры = "0123456789";
	ЦифрыТелефона = "";
	Для индекс = 1 По СтрДлина(Телефон) Цикл
		Символ = Сред(Телефон, индекс,1);
		Если СтрНайти(Цифры, Символ) <> 0 Тогда
			ЦифрыТелефона = ЦифрыТелефона + Символ;
		КонецЕсли;
	КонецЦикла;
	
	Если СтрНачинаетсяС(ЦифрыТелефона, "8") Тогда
		ЦифрыТелефона = "7"+Сред(ЦифрыТелефона, 2);
	КонецЕсли;
	
	Ошибки = Новый Массив;
	
	Если Не СтрНачинаетсяС(ЦифрыТелефона, "7") Тогда
		Ошибки.Добавить("Первая цифра номера телефона должна быть 7 или 8");
	КонецЕсли;
	
	Если Не СтрДлина(ЦифрыТелефона) = 11 Тогда
		Ошибки.Добавить("Количество цифр в номере не соответствует шаблону (должно быть 11 цифр)");		
	КонецЕсли;
	Если Ошибки.Количество() > 0 Тогда
		Если ВызыватьИсключение Тогда
			ВызватьИсключение СтрСоединить(Ошибки, "; ");
		Иначе
			Возврат "";
		КонецЕсли;
	КонецЕсли;
	Возврат ЦифрыТелефона;
КонецФункции
#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Код процедур и функций

#КонецОбласти
