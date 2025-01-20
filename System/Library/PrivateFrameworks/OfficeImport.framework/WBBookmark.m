@interface WBBookmark
+ (void)readFrom:(id)a3 index:(unsigned int)a4 type:(int)a5 paragraph:(id)a6;
- (int)runType;
@end

@implementation WBBookmark

+ (void)readFrom:(id)a3 index:(unsigned int)a4 type:(int)a5 paragraph:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v13 = a3;
  id v9 = a6;
  v10 = (WrdBookmarkTable *)[v13 bookmarkTable];
  if (a4 < (unsigned __int16)((*((_DWORD *)v10 + 6) - *((_DWORD *)v10 + 4)) >> 3))
  {
    v11 = objc_msgSend([NSString alloc], "initWithCsString:", WrdBookmarkTable::getBookmark(v10, a4) + 8);
    id v12 = (id)[v9 addBookmark:v11 type:v7];
  }
}

- (int)runType
{
  return 12;
}

@end