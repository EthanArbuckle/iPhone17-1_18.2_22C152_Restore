@interface IPAPendingAutoSettings
- (BOOL)_applyArchiveDictionary:(id)a3;
- (BOOL)pending;
@end

@implementation IPAPendingAutoSettings

- (BOOL)pending
{
  return 1;
}

- (BOOL)_applyArchiveDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  v5 = [v3 objectForKeyedSubscript:@"pending"];

  char v6 = 0;
  if (v4 == 1 && v5)
  {
    v7 = [v3 objectForKeyedSubscript:@"pending"];
    char v6 = [v7 BOOLValue];
  }
  return v6;
}

@end