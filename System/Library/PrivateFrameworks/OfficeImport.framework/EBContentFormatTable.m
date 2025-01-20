@interface EBContentFormatTable
+ (void)readWithState:(id)a3;
@end

@implementation EBContentFormatTable

+ (void)readWithState:(id)a3
{
  id v3 = a3;
  v4 = [v3 resources];
  v5 = [v4 contentFormats];

  XlContentFormatTable::XlContentFormatTable((XlContentFormatTable *)&v12);
  uint64_t v6 = [v3 xlReader];
  (*(void (**)(uint64_t, void **))(*(void *)v6 + 176))(v6, &v12);
  if (((v14 - v13) & 0x7FFFFFFF8) != 0)
  {
    unint64_t v7 = 0;
    uint64_t v8 = ((unint64_t)(v14 - v13) >> 3);
    do
    {
      if (v7 >= ((unint64_t)(v14 - v13) >> 3)) {
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v9 = *(void *)(v13 + 8 * v7);
      v10 = [v3 resources];
      v11 = +[EBContentFormat edContentFormatFromXlFormat:v9 edResources:v10];

      [v5 addOrEquivalentObject:v11];
      ++v7;
    }
    while (v8 != v7);
  }
  XlContentFormatTable::~XlContentFormatTable(&v12);
}

@end