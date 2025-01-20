@interface EBLinkTable
+ (int)mapEDLinkTypeToXl:(int)a3;
+ (int)mapXlLinkTypeToED:(int)a3;
+ (void)createXlLinkTableFromLinksCollection:(id)a3 workbook:(id)a4 state:(id)a5;
+ (void)readFromState:(id)a3;
@end

@implementation EBLinkTable

+ (void)readFromState:(id)a3
{
  id v24 = a3;
  v3 = [v24 resources];
  v27 = [v3 links];
  v4 = (_DWORD *)[v24 xlLinkTable];
  unsigned int v5 = v4[8] - v4[6];
  int v6 = (unsigned __int16)(v5 >> 3);
  if ((unsigned __int16)(v5 >> 3))
  {
    unsigned int v7 = 0;
    do
    {
      MergeRegion = (unsigned __int16 *)XlMerge::getMergeRegion((XlMerge *)(v4 + 2), v7);
      int v9 = MergeRegion[1];
      int v10 = MergeRegion[2];
      if (v9 == 65534) {
        uint64_t v11 = -2;
      }
      else {
        uint64_t v11 = MergeRegion[1];
      }
      if (v9 == 0xFFFF) {
        uint64_t v12 = -1;
      }
      else {
        uint64_t v12 = v11;
      }
      if (v10 == 65534) {
        uint64_t v13 = -2;
      }
      else {
        uint64_t v13 = MergeRegion[2];
      }
      if (v10 == 0xFFFF) {
        uint64_t v14 = -1;
      }
      else {
        uint64_t v14 = v13;
      }
      v15 = +[EDLinkReference linkReferenceWithLinkIndex:*MergeRegion firstSheetIndex:v12 lastSheetIndex:v14];
      [v27 addReference:v15];

      ++v7;
    }
    while (v6 != v7);
  }
  int v25 = (unsigned __int16)((v4[14] - v4[12]) >> 3);
  if ((unsigned __int16)((v4[14] - v4[12]) >> 3))
  {
    int v16 = 0;
    do
    {
      uint64_t Link = XlLinkTable::getLink((XlLinkTable *)v4, (unsigned __int16)v16);
      v18 = +[EDLink linkWithType:](EDLink, "linkWithType:", [a1 mapXlLinkTypeToED:*(unsigned int *)(Link + 16)]);
      uint64_t v19 = (*(void *)(Link + 64) - *(void *)(Link + 56)) >> 3;
      if (v19)
      {
        unsigned int v20 = 0;
        v21 = 0;
        do
        {
          if (!v21)
          {
            v21 = [v18 externalNames];
          }
          uint64_t v22 = *(void *)(XlLink::getExternalName((XlLink *)Link, v20) + 32);
          if (v22) {
            +[EBString edStringFromXlString:v22 edResources:v3];
          }
          else {
          v23 = +[EDString string];
          }
          [v21 addObject:v23];

          ++v20;
        }
        while (v19 != v20);
      }
      else
      {
        v21 = 0;
      }
      [v27 addLink:v18];

      ++v16;
    }
    while (v16 != v25);
  }
}

+ (int)mapXlLinkTypeToED:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return dword_238EDF4B0[a3 - 1];
  }
}

+ (void)createXlLinkTableFromLinksCollection:(id)a3 workbook:(id)a4 state:(id)a5
{
}

+ (int)mapEDLinkTypeToXl:(int)a3
{
  if ((a3 - 1) > 3) {
    return 0;
  }
  else {
    return dword_238EDF4B0[a3 - 1];
  }
}

@end