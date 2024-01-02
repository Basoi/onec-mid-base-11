Процедура ПриСозданииНаСервере(Форма)Экспорт
	
	Если ОбщегоНазначенияКлиентСервер.ЕстьРеквизитИлиСвойствоОбъекта(Форма, "Объект") Тогда        
		Попытка
			ДобавитьПолеКонтактногоЛица(Форма);
			
			Если ТипЗнч(Форма.Объект.Ссылка) = Тип("ДокументСсылка.ЗаказПокупателя") Тогда
				ЗаказПокупателяПриСоздании(Форма);
			КонецЕсли;
		Исключение
		КонецПопытки;
	КонецЕсли;
	
КонецПроцедуры

Процедура ДобавитьПолеКонтактногоЛица(Форма)
	
	Если Форма.Элементы.Договор.Родитель = Форма Тогда
		Основание = Форма.Элементы.Найти("Основание");
		Если Основание <> Неопределено Тогда
			ПолеВвода = Форма.Элементы.Вставить("Расш1_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.Договор.Родитель, Основание);
		Иначе
			СуммаДокумента = Форма.Элементы.Найти("СуммаДокумента");
			Если СуммаДокумента <> Неопределено Тогда
				ПолеВвода = Форма.Элементы.Вставить("Расш1_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.Договор.Родитель, СуммаДокумента);
			Иначе
				ПолеВвода = Форма.Элементы.Добавить("Расш1_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.Договор.Родитель);	
			КонецЕсли;	
		КонецЕсли;
	Иначе
		ПолеВвода = Форма.Элементы.Добавить("Расш1_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.Договор.Родитель); 
	КонецЕсли;
	ПолеВвода.Заголовок = "Контактное лицо";
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Расш1_КонтактноеЛицо";	

КонецПроцедуры

Процедура ЗаказПокупателяПриСоздании(Форма)
	
	ПолеВвода = Форма.Элементы.Добавить("Расш1_СогласованнаяСкидка", Тип("ПолеФормы"), Форма.Элементы.ГруппаСуммаДокумента);	      	
	ПолеВвода.Заголовок = "Согласованная скидка";
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Расш1_СогласованнаяСкидка";	
	ПолеВвода.УстановитьДействие("ПриИзменении", "ПриИзмененииСогласованнаяСкидка");
	
	Команда = Форма.Команды.Добавить("ПересчитатьСогласованнуюСкидку"); 
	Команда.Заголовок = "Пересчитать согласованную скидку";
	Команда.Действие  = "ПересчитатьСогласованнуюСкидкуКоманда"; 

	КнопкаФормы = Форма.Элементы.Добавить("КнопкаПересчитатьСогласованнуюСкидку", Тип("КнопкаФормы"), Форма);		
	КнопкаФормы.ИмяКоманды = "ПересчитатьСогласованнуюСкидку";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка; 

КонецПроцедуры
