@interface WBListTable
+ (void)readFrom:(id)a3 listTable:(id)a4;
@end

@implementation WBListTable

+ (void)readFrom:(id)a3 listTable:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  v6 = +[WBObjectFactory create:33];
  if (v6) {
  else
  }
    v7 = 0;
  uint64_t v8 = [v13 wrdReader];
  (*(void (**)(uint64_t, WrdEmbeddedTTFRecordTable *))(*(void *)v8 + 288))(v8, v7);
  uint64_t v9 = (*((void *)v7 + 2) - *((void *)v7 + 1)) >> 3;
  if ((int)v9 < 1) {
    goto LABEL_8;
  }
  LODWORD(v10) = 0;
  do
  {
    uint64_t EmbeddedFontReference = WrdEmbeddedTTFRecordTable::getEmbeddedFontReference(v7, v10);
    uint64_t v10 = (v10 + 1);
    v12 = [v5 addListWithListId:v10 listDefinitionId:*(unsigned int *)(EmbeddedFontReference + 16)];
    +[WBList readFrom:v13 list:v12 override:EmbeddedFontReference];
  }
  while (v9 != v10);
  if (v7) {
LABEL_8:
  }
    (*(void (**)(WrdEmbeddedTTFRecordTable *))(*(void *)v7 + 8))(v7);
}

@end