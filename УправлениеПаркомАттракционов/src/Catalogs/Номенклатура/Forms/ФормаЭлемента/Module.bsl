
#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы																																																																																																																																																																																																																																																																																																																																																																	

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	УправлениеВидимостьюЭлементовФормы();
КонецПроцедуры


																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																															


#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ВидНоменклатурыПриИзменении(Элемент)
	УправлениеВидимостьюЭлементовФормы();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>

// Код процедур и функций

#КонецОбласти

#Область ОбработчикиКомандФормы

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура УправлениеВидимостьюЭлементовФормы()
	
	ЭтоПосещениеАтрракциона = (Объект.ВидНоменклатуры = Перечисления.ВидНоменклатуры.ПосещениеАттракциона);
	Элементы.ВидАттракциона.Видимость = ЭтоПосещениеАтрракциона;
	Элементы.КоличествоПосещений.Видимость = ЭтоПосещениеАтрракциона;

КонецПроцедуры






;

#КонецОбласти
