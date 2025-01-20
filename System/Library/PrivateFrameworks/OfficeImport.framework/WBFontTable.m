@interface WBFontTable
+ (void)readFrom:(id)a3 fontTable:(id)a4;
+ (void)readFromFontTable:(id)a3 wrdFontTable:(void *)a4 fontTable:(id)a5;
@end

@implementation WBFontTable

+ (void)readFrom:(id)a3 fontTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  WrdFontFamilyNameTable::WrdFontFamilyNameTable((WrdFontFamilyNameTable *)v9);
  uint64_t v8 = [v6 wrdReader];
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v8 + 232))(v8, v9);
  [a1 readFromFontTable:v6 wrdFontTable:v9 fontTable:v7];
  WrdFontFamilyNameTable::~WrdFontFamilyNameTable((WrdFontFamilyNameTable *)v9);
}

+ (void)readFromFontTable:(id)a3 wrdFontTable:(void *)a4 fontTable:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  [v7 clear];
  uint64_t v8 = (*((void *)a4 + 2) - *((void *)a4 + 1)) >> 3;
  if ((int)v8 >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = +[WBFont readFrom:WrdEmbeddedTTFRecordTable::getEmbeddedFontReference((WrdEmbeddedTTFRecordTable *)a4, v9) withFontTable:v7];
      if (v10) {
        [v11 addFont:v10 index:v9];
      }

      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
}

@end