@interface SCMLModelBase
- (NSDictionary)options;
- (SCMLModelBase)initWithOptions:(id)a3;
- (SCMLPerformance)perfResults;
- (id)performanceResults;
- (unint64_t)_blob_size:(id *)a3;
- (void)_copy_data_from_blob:(id *)a3 to:(void *)a4;
- (void)_copy_data_from_blob:(id *)a3 toPtr:(float *)a4;
- (void)_copy_data_to_blob:(float *)a3 to:(id *)a4;
- (void)_copy_data_to_blob:(id)a3 toBuffer:(id *)a4;
- (void)_copy_data_to_blob_repeated:(id)a3 to:(id *)a4;
@end

@implementation SCMLModelBase

- (SCMLModelBase)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCMLModelBase;
  v5 = [(SCMLModelBase *)&v11 init];
  if (v5)
  {
    v6 = [[SCMLPerformance alloc] initWithOptions:v4];
    perfResults = v5->_perfResults;
    v5->_perfResults = v6;

    uint64_t v8 = [v4 copy];
    options = v5->_options;
    v5->_options = (NSDictionary *)v8;
  }
  return v5;
}

- (unint64_t)_blob_size:(id *)a3
{
  return a3->var2[1] * a3->var2[0] * a3->var2[2] * a3->var2[3];
}

- (void)_copy_data_from_blob:(id *)a3 to:(void *)a4
{
  long long v7 = *(_OWORD *)&a3->var12;
  v19[8] = *(_OWORD *)&a3->var10;
  v19[9] = v7;
  uint64_t v20 = *(void *)&a3->var14;
  long long v8 = *(_OWORD *)&a3->var4;
  v19[4] = *(_OWORD *)&a3->var3[2];
  v19[5] = v8;
  long long v9 = *(_OWORD *)&a3->var8;
  v19[6] = *(_OWORD *)&a3->var6;
  v19[7] = v9;
  long long v10 = *(_OWORD *)a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v10;
  long long v11 = *(_OWORD *)a3->var3;
  v19[2] = *(_OWORD *)&a3->var2[2];
  v19[3] = v11;
  std::vector<float>::resize((uint64_t)a4, [(SCMLModelBase *)self _blob_size:v19]);
  long long v12 = *(_OWORD *)&a3->var12;
  v17[8] = *(_OWORD *)&a3->var10;
  v17[9] = v12;
  uint64_t v18 = *(void *)&a3->var14;
  long long v13 = *(_OWORD *)&a3->var4;
  v17[4] = *(_OWORD *)&a3->var3[2];
  v17[5] = v13;
  long long v14 = *(_OWORD *)&a3->var8;
  v17[6] = *(_OWORD *)&a3->var6;
  v17[7] = v14;
  long long v15 = *(_OWORD *)a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v15;
  long long v16 = *(_OWORD *)a3->var3;
  v17[2] = *(_OWORD *)&a3->var2[2];
  v17[3] = v16;
  [(SCMLModelBase *)self _copy_data_from_blob:v17 toPtr:*(void *)a4];
}

- (void)_copy_data_from_blob:(id *)a3 toPtr:(float *)a4
{
  long long v4 = *(_OWORD *)&a3->var12;
  v9[8] = *(_OWORD *)&a3->var10;
  v9[9] = v4;
  uint64_t v10 = *(void *)&a3->var14;
  long long v5 = *(_OWORD *)&a3->var4;
  v9[4] = *(_OWORD *)&a3->var3[2];
  v9[5] = v5;
  long long v6 = *(_OWORD *)&a3->var8;
  v9[6] = *(_OWORD *)&a3->var6;
  v9[7] = v6;
  long long v7 = *(_OWORD *)a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v7;
  long long v8 = *(_OWORD *)a3->var3;
  v9[2] = *(_OWORD *)&a3->var2[2];
  v9[3] = v8;
  memcpy(a4, a3->var0, 4 * [(SCMLModelBase *)self _blob_size:v9]);
}

- (void)_copy_data_to_blob:(float *)a3 to:(id *)a4
{
  var0 = a4->var0;
  long long v5 = *(_OWORD *)&a4->var12;
  v10[8] = *(_OWORD *)&a4->var10;
  v10[9] = v5;
  uint64_t v11 = *(void *)&a4->var14;
  long long v6 = *(_OWORD *)&a4->var4;
  v10[4] = *(_OWORD *)&a4->var3[2];
  v10[5] = v6;
  long long v7 = *(_OWORD *)&a4->var8;
  v10[6] = *(_OWORD *)&a4->var6;
  v10[7] = v7;
  long long v8 = *(_OWORD *)a4->var2;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v8;
  long long v9 = *(_OWORD *)a4->var3;
  v10[2] = *(_OWORD *)&a4->var2[2];
  v10[3] = v9;
  memcpy(var0, a3, 4 * [(SCMLModelBase *)self _blob_size:v10]);
}

- (void)_copy_data_to_blob:(id)a3 toBuffer:(id *)a4
{
  id v6 = a3;
  var0 = a4->var0;
  long long v8 = *(_OWORD *)&a4->var12;
  v15[8] = *(_OWORD *)&a4->var10;
  v15[9] = v8;
  uint64_t v16 = *(void *)&a4->var14;
  long long v9 = *(_OWORD *)&a4->var4;
  v15[4] = *(_OWORD *)&a4->var3[2];
  v15[5] = v9;
  long long v10 = *(_OWORD *)&a4->var8;
  v15[6] = *(_OWORD *)&a4->var6;
  v15[7] = v10;
  long long v11 = *(_OWORD *)a4->var2;
  v15[0] = *(_OWORD *)&a4->var0;
  v15[1] = v11;
  long long v12 = *(_OWORD *)a4->var3;
  v15[2] = *(_OWORD *)&a4->var2[2];
  v15[3] = v12;
  unint64_t v13 = [(SCMLModelBase *)self _blob_size:v15];
  id v14 = v6;
  memcpy(var0, (const void *)[v14 bytes], 4 * v13);
}

- (void)_copy_data_to_blob_repeated:(id)a3 to:(id *)a4
{
  id v6 = a3;
  var0 = (char *)a4->var0;
  long long v8 = *(_OWORD *)&a4->var12;
  v19[8] = *(_OWORD *)&a4->var10;
  v19[9] = v8;
  uint64_t v20 = *(void *)&a4->var14;
  long long v9 = *(_OWORD *)&a4->var4;
  v19[4] = *(_OWORD *)&a4->var3[2];
  v19[5] = v9;
  long long v10 = *(_OWORD *)&a4->var8;
  v19[6] = *(_OWORD *)&a4->var6;
  v19[7] = v10;
  long long v11 = *(_OWORD *)a4->var2;
  v19[0] = *(_OWORD *)&a4->var0;
  v19[1] = v11;
  long long v12 = *(_OWORD *)a4->var3;
  v19[2] = *(_OWORD *)&a4->var2[2];
  v19[3] = v12;
  unint64_t v13 = [(SCMLModelBase *)self _blob_size:v19];
  id v14 = v6;
  long long v15 = (const void *)[v14 bytes];
  unint64_t v16 = [v14 length];
  if (v16 >> 2 <= v13)
  {
    size_t v17 = v16 & 0xFFFFFFFFFFFFFFFCLL;
    if (v13 / (v16 >> 2) <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v13 / (v16 >> 2);
    }
    do
    {
      memcpy(var0, v15, v17);
      var0 += v17;
      --v18;
    }
    while (v18);
  }
}

- (id)performanceResults
{
  v2 = [(SCMLModelBase *)self perfResults];
  v3 = [v2 results];

  return v3;
}

- (SCMLPerformance)perfResults
{
  return self->_perfResults;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_perfResults, 0);
}

@end