void start()
{
  +[NSError _setFileNameLocalizationEnabled:0];
  APDServerEntry();
  APDServerEntry();
}

uint64_t APDServerEntry()
{
  return _APDServerEntry();
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setFileNameLocalizationEnabled:];
}