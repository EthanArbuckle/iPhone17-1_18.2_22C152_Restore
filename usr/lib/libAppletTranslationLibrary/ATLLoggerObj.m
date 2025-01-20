@interface ATLLoggerObj
+ (id)FormatLogWithLine:(int)a3 fmt:(id)a4;
+ (void)Log:(int)a3 msg:(id)a4;
@end

@implementation ATLLoggerObj

+ (void)Log:(int)a3 msg:(id)a4
{
  os_log_type_t v4 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = ATLLogObject();
  if (os_log_type_enabled(v6, v4))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1CA552000, v6, v4, "%@", (uint8_t *)&v7, 0xCu);
  }
}

+ (id)FormatLogWithLine:(int)a3 fmt:(id)a4
{
  os_log_type_t v4 = FormatLogv((uint64_t)"OVM", *(uint64_t *)&a3, a4, (uint64_t)&v7);

  return v4;
}

@end