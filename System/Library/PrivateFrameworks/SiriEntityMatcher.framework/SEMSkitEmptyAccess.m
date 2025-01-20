@interface SEMSkitEmptyAccess
- (BOOL)isEmpty;
- (id)indexLocale;
- (id)matchSpans:(id)a3 error:(id *)a4;
@end

@implementation SEMSkitEmptyAccess

- (id)matchSpans:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[SEMSkitEmptyAccess matchSpans:error:]";
    _os_log_impl(&dword_25C7CA000, v4, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v10, 0xCu);
  }
  v8 = objc_msgSend_array(MEMORY[0x263EFF980], v5, v6, v7);
  return v8;
}

- (id)indexLocale
{
  return 0;
}

- (BOOL)isEmpty
{
  return 1;
}

@end