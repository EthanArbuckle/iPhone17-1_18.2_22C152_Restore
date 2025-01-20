@interface EBStringTable
+ (void)readWithState:(id)a3;
@end

@implementation EBStringTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  v4 = [v3 resources];
  v5 = [v4 strings];

  XlStringTable::XlStringTable((XlStringTable *)v12);
  uint64_t v6 = [v3 xlReader];
  (*(void (**)(uint64_t, unsigned char *))(*(void *)v6 + 248))(v6, v12);
  int DocumentStringCount = XlStringTable::getDocumentStringCount((XlStringTable *)v12);
  if (DocumentStringCount)
  {
    unsigned int v8 = 0;
    do
    {
      uint64_t ExternRef = XlExternSheet::getExternRef((XlExternSheet *)v12, v8);
      v10 = [v3 resources];
      v11 = +[EBString edStringFromXlString:ExternRef edResources:v10];

      [v5 addObject:v11];
      ++v8;
    }
    while (DocumentStringCount != v8);
  }
  XlStringTable::~XlStringTable((XlStringTable *)v12);
}

@end