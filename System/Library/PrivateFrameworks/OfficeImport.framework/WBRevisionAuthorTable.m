@interface WBRevisionAuthorTable
+ (void)readFrom:(id)a3 revisionAuthorTable:(id)a4;
@end

@implementation WBRevisionAuthorTable

+ (void)readFrom:(id)a3 revisionAuthorTable:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  v6 = +[WBObjectFactory create:55];
  if (v6) {
  else
  }
    v7 = 0;
  *((_DWORD *)v7 + 2) = 51;
  uint64_t v8 = [v14 wrdReader];
  (*(void (**)(uint64_t, void *))(*(void *)v8 + 312))(v8, v7);
  v9 = [v5 authors];
  uint64_t v10 = *((void *)v7 + 2);
  int v11 = *(unsigned __int16 *)(v10 + 8);
  if (*(_WORD *)(v10 + 8))
  {
    int v12 = 0;
    do
    {
      v13 = objc_msgSend([NSString alloc], "initWithCsString:", WrdStringWithDataTable::getStringDataReference(*((WrdStringWithDataTable **)v7 + 2), (unsigned __int16)v12)+ 8);
      [v9 addObject:v13];

      ++v12;
    }
    while (v11 != v12);
  }
  (*(void (**)(void *))(*(void *)v7 + 8))(v7);
}

@end