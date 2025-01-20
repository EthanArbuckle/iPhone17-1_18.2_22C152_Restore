@interface NSString(ML3DatabaseDatatypesBridge)
- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:;
- (uint64_t)ml_stringValueForSQL;
@end

@implementation NSString(ML3DatabaseDatatypesBridge)

- (uint64_t)ml_bindToSQLiteStatement:()ML3DatabaseDatatypesBridge atPosition:
{
  CFStringEncoding FastestEncoding = CFStringGetFastestEncoding(a1);
  if (FastestEncoding != 256)
  {
    if (FastestEncoding == 134217984)
    {
      CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
      if (CStringPtr)
      {
        v9 = CStringPtr;
        v10 = a3;
        int v11 = a4;
        uint64_t v12 = 0;
LABEL_13:
        return sqlite3_bind_text(v10, v11, v9, -1, (void (__cdecl *)(void *))v12);
      }
    }
LABEL_9:
    uint64_t v17 = [(__CFString *)a1 UTF8String];
    if (v17) {
      v9 = (const char *)v17;
    }
    else {
      v9 = "";
    }
    v10 = a3;
    int v11 = a4;
    uint64_t v12 = -1;
    goto LABEL_13;
  }
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (!CharactersPtr) {
    goto LABEL_9;
  }
  v14 = CharactersPtr;
  int v15 = 2 * CFStringGetLength(a1);

  return sqlite3_bind_text16(a3, a4, v14, v15, 0);
}

- (uint64_t)ml_stringValueForSQL
{
  return [NSString stringWithFormat:@"'%@'", a1];
}

@end