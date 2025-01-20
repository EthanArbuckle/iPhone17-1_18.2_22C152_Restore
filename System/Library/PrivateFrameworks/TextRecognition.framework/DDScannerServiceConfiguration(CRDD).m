@interface DDScannerServiceConfiguration(CRDD)
+ (id)_crConfigForLocale:()CRDD;
@end

@implementation DDScannerServiceConfiguration(CRDD)

+ (id)_crConfigForLocale:()CRDD
{
  id v3 = a3;
  v4 = v3;
  if (_MergedGlobals_29 == -1)
  {
    if (!v3)
    {
LABEL_4:
      v6 = &stru_1F38EED68;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&_MergedGlobals_29, &__block_literal_global_30);
    if (!v4) {
      goto LABEL_4;
    }
  }
  uint64_t v5 = [(id)qword_1EB58CCB8 indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  v7 = (void *)MEMORY[0x1E4F1CA20];
  v8 = [(id)qword_1EB58CCB8 objectAtIndexedSubscript:v5];
  v9 = [v7 localeWithLocaleIdentifier:v8];
  v6 = [v9 languageCode];

LABEL_6:
  id v10 = (id)qword_1EB58CCB0;
  objc_sync_enter(v10);
  v11 = [(id)qword_1EB58CCB0 objectForKeyedSubscript:v6];
  if (!v11)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F5F160]) initWithScannerType:0 passiveIntent:1];
    if ([(__CFString *)v6 length]) {
      [v11 setValue:v6 forKey:@"language"];
    }
    [(id)qword_1EB58CCB0 setObject:v11 forKeyedSubscript:v6];
  }
  objc_sync_exit(v10);

  return v11;
}

@end