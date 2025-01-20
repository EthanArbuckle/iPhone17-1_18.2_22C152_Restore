@interface EBHyperlinkTable
+ (void)readWithState:(id)a3;
@end

@implementation EBHyperlinkTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  v16 = &unk_26EBDB1B8;
  uint64_t v4 = [v3 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v4 + 480))(v4, &v16);
  unint64_t v5 = v18 - (void)v17;
  if (((unint64_t)(v18 - (void)v17) >> 3))
  {
    v6 = [v3 edSheet];
    v7 = [v6 hyperlinks];
    unint64_t v8 = (v5 >> 3);

    unint64_t v9 = 0;
    do
    {
      if (v9 >= ((unint64_t)(v18 - (void)v17) >> 3)) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v10 = v17[v9];
      if (*(_WORD *)(v10 + 12) == 2048)
      {
        v11 = 0;
      }
      else
      {
        v12 = [v3 resources];
        v11 = +[EBHyperlink edHyperlinkFromXlHLink:v10 edResources:v12];
      }
      unint64_t v13 = v9 + 1;
      if (v9 + 1 < v8)
      {
        if (v13 >= ((unint64_t)(v18 - (void)v17) >> 3)) {
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v14 = v17[v13];
        if (*(_WORD *)(v14 + 12) == 2048)
        {
          v15 = [v3 resources];
          +[EBHyperlink addToolTip:v14 toEdHyperLink:v11 edResources:v15];

          ++v9;
        }
      }
      [v7 addObject:v11];

      ++v9;
    }
    while (v9 < v8);
  }
  v16 = &unk_26EBDAF88;
  CsSimpleHeapVector<XlRecord>::~CsSimpleHeapVector((void **)&v17);
}

@end