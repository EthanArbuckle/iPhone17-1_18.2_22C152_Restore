@interface TIHistogram
- (TIHistogram)init;
- (id)descriptionOfCumulativeDistributionFunction;
- (id)sortedNumbers;
- (int64_t)countForNumber:(id)a3;
- (int64_t)totalCount;
- (void)addNumber:(id)a3;
- (void)enumerateCumulativeDistributionFunctionUsingBlock:(id)a3;
- (void)enumerateNumbersUsingBlock:(id)a3;
@end

@implementation TIHistogram

- (void).cxx_destruct
{
}

- (id)descriptionOfCumulativeDistributionFunction
{
  v3 = [MEMORY[0x263F089D8] string];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__TIHistogram_descriptionOfCumulativeDistributionFunction__block_invoke;
  v6[3] = &unk_265050218;
  id v4 = v3;
  id v7 = v4;
  [(TIHistogram *)self enumerateCumulativeDistributionFunctionUsingBlock:v6];

  return v4;
}

uint64_t __58__TIHistogram_descriptionOfCumulativeDistributionFunction__block_invoke(uint64_t a1, void *a2, float a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%ld : %f\n", objc_msgSend(a2, "integerValue"), a3);
}

- (void)enumerateCumulativeDistributionFunctionUsingBlock:(id)a3
{
  id v4 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__TIHistogram_enumerateCumulativeDistributionFunctionUsingBlock___block_invoke;
  v6[3] = &unk_2650501F0;
  v8 = v9;
  id v5 = v4;
  void v6[4] = self;
  id v7 = v5;
  [(TIHistogram *)self enumerateNumbersUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

uint64_t __65__TIHistogram_enumerateCumulativeDistributionFunctionUsingBlock___block_invoke(void *a1, uint64_t a2, unint64_t a3)
{
  *(float *)(*(void *)(a1[6] + 8) + 24) = *(float *)(*(void *)(a1[6] + 8) + 24) + (float)a3;
  return (*(uint64_t (**)(void, float))(a1[5] + 16))(a1[5], *(float *)(*(void *)(a1[6] + 8) + 24) / (float)*(uint64_t *)(a1[4] + 16));
}

- (void)enumerateNumbersUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(TIHistogram *)self sortedNumbers];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__TIHistogram_enumerateNumbersUsingBlock___block_invoke;
  v7[3] = &unk_2650501C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __42__TIHistogram_enumerateNumbersUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = a2;
  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v4, [v3 countForNumber:v4]);
}

- (id)sortedNumbers
{
  uint64_t v2 = [(NSMutableDictionary *)self->_counts allKeys];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_2865];

  return v3;
}

uint64_t __28__TIHistogram_sortedNumbers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 integerValue];
  if (v6 <= [v5 integerValue])
  {
    uint64_t v8 = [v4 integerValue];
    if (v8 >= [v5 integerValue]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = -1;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (int64_t)countForNumber:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_counts objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)addNumber:(id)a3
{
  counts = self->_counts;
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)counts objectForKey:v5];
  objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(NSMutableDictionary *)self->_counts setObject:v7 forKey:v5];
  ++self->_totalCount;
}

- (TIHistogram)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIHistogram;
  uint64_t v2 = [(TIHistogram *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    counts = v2->_counts;
    v2->_counts = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end