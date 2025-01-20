@interface EBFontTable
+ (unint64_t)edFontIndexFromXlFontIndex:(unsigned int)a3;
+ (unsigned)xlFontIndexFromEDFontIndex:(unint64_t)a3;
+ (void)readWithState:(id)a3;
@end

@implementation EBFontTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  v4 = [v3 resources];
  v5 = [v4 fonts];
  XlFontTable::XlFontTable((XlFontTable *)&v10);
  uint64_t v6 = [v3 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v6 + 168))(v6, &v10);
  int v7 = XlFontTable::size((XlFontTable *)&v10);
  if (v7)
  {
    unsigned int v8 = 0;
    do
    {
      if (v8 != 4)
      {
        v9 = +[EBFont edFontFromXlFont:XlFontTable::at((XlFontTable *)&v10, v8) edResources:v4];
        [v5 addObject:v9];
      }
      ++v8;
    }
    while (v7 != v8);
  }
  v10 = &unk_26EBDB030;
  CsSimpleHeapVector<XlFont>::~CsSimpleHeapVector(&v12);
  OcText::~OcText(&v11);
}

+ (unint64_t)edFontIndexFromXlFontIndex:(unsigned int)a3
{
  return a3 - (a3 > 3);
}

+ (unsigned)xlFontIndexFromEDFontIndex:(unint64_t)a3
{
  if (a3 <= 3) {
    return a3;
  }
  else {
    return a3 + 1;
  }
}

@end