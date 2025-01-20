@interface WBListDefinition
+ (void)readFrom:(id)a3 listDefinition:(id)a4 listFormat:(void *)a5 document:(id)a6;
@end

@implementation WBListDefinition

+ (void)readFrom:(id)a3 listDefinition:(id)a4 listFormat:(void *)a5 document:(id)a6
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a6;
  int v11 = *((unsigned __int8 *)a5 + 52);
  if (*((unsigned char *)a5 + 52))
  {
    int v12 = 0;
    do
    {
      v13 = [v9 addLevel];
      +[WBListLevel readFrom:v17 listLevel:v13 format:WrdEmbeddedTTFRecordTable::getEmbeddedFontReference((WrdEmbeddedTTFRecordTable *)a5, v12) document:v10];

      ++v12;
    }
    while (v11 != v12);
  }
  __int16 v14 = *((_WORD *)a5 + 25);
  if ((v14 & 0x10) != 0) {
    unsigned int v15 = 2;
  }
  else {
    unsigned int v15 = 1;
  }
  if (v14) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = v15;
  }
  [v9 setType:v16];
}

@end