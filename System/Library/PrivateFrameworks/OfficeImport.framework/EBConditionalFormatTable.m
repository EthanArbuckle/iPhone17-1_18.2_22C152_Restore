@interface EBConditionalFormatTable
+ (void)readWithState:(id)a3;
@end

@implementation EBConditionalFormatTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v4 = objc_msgSend(v3, "xlReader", &unk_26EBE2448);
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 464))(v4, &v10);
  unint64_t v5 = (unint64_t)(v12 - v11) >> 3;
  if (v5)
  {
    v6 = [v3 edSheet];
    v7 = [v6 conditionalFormattings];

    unsigned int v8 = 0;
    do
    {
      v9 = objc_alloc_init(EDConditionalFormatting);
      +[EBConditionalFormat readXlConditionalFormat:XlConditionalFormatTable::at((XlConditionalFormatTable *)&v10, v8) toEDConditionalFormatting:v9 state:v3];
      [v7 addObject:v9];

      ++v8;
    }
    while (v5 != v8);
  }
  XlConditionalFormatTable::~XlConditionalFormatTable((XlConditionalFormatTable *)&v10);
}

@end