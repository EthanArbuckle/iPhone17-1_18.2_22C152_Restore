id VSBaseLocalizedString(uint64_t a1, uint64_t a2)
{
  NSBundle *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t vars8;

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = VSRecognitionModelCopyResourceURL();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v5];
    v8 = [v7 objectForKey:a2];

    if (v8) {
      return v8;
    }
  }

  return [(NSBundle *)v4 localizedStringForKey:a2 value:&stru_41D8 table:a1];
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t VSRecognitionModelCopyResourceURL()
{
  return _VSRecognitionModelCopyResourceURL();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_msgSend_confirmedAction(void *a1, const char *a2, ...)
{
  return [a1 confirmedAction];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deniedAction(void *a1, const char *a2, ...)
{
  return [a1 deniedAction];
}

id objc_msgSend_elementCount(void *a1, const char *a2, ...)
{
  return [a1 elementCount];
}

id objc_msgSend_recognitionAction(void *a1, const char *a2, ...)
{
  return [a1 recognitionAction];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}