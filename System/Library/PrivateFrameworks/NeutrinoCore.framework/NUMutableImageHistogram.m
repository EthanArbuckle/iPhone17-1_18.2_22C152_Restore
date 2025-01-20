@interface NUMutableImageHistogram
+ (Class)_histogramClass;
- (id)copyWithZone:(_NSZone *)a3;
- (void)smoothWithFunction:(int64_t)a3 windowSize:(int64_t)a4 sampleMode:(int64_t)a5;
- (void)write:(id)a3;
@end

@implementation NUMutableImageHistogram

- (void)smoothWithFunction:(int64_t)a3 windowSize:(int64_t)a4 sampleMode:(int64_t)a5
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v9 = [(NUMutableImageHistogram *)self _red];
  v21[0] = v9;
  v10 = [(NUMutableImageHistogram *)self _green];
  v21[1] = v10;
  v11 = [(NUMutableImageHistogram *)self _blue];
  v21[2] = v11;
  v12 = [(NUMutableImageHistogram *)self _luminance];
  v21[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  size_t v14 = [v13 count];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NUMutableImageHistogram_smoothWithFunction_windowSize_sampleMode___block_invoke;
  block[3] = &unk_1E5D95250;
  id v17 = v13;
  int64_t v18 = a3;
  int64_t v19 = a4;
  int64_t v20 = a5;
  id v15 = v13;
  dispatch_apply(v14, 0, block);
}

void __68__NUMutableImageHistogram_smoothWithFunction_windowSize_sampleMode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  [v3 smoothWithFunction:*(void *)(a1 + 40) windowSize:*(void *)(a1 + 48) sampleMode:*(void *)(a1 + 56)];
}

- (void)write:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v5 = [(NUMutableImageHistogram *)self _red];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__NUMutableImageHistogram_write___block_invoke;
  v7[3] = &unk_1E5D95228;
  v7[4] = self;
  v9 = &v10;
  id v6 = v4;
  id v8 = v6;
  [v5 write:v7];

  self->super._sampleCount += v11[3];
  _Block_object_dispose(&v10, 8);
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _green];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__NUMutableImageHistogram_write___block_invoke_2;
  v9[3] = &unk_1E5D95200;
  v9[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v8;
  long long v10 = v8;
  uint64_t v11 = a2;
  [v4 write:v9];

  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v6;
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _blue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__NUMutableImageHistogram_write___block_invoke_3;
  v9[3] = &unk_1E5D951D8;
  v9[4] = *(void *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v8;
  long long v10 = v8;
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = a2;
  [v4 write:v9];

  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v6;
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _luminance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__NUMutableImageHistogram_write___block_invoke_4;
  v9[3] = &unk_1E5D951B0;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = (id)v8;
  long long v10 = v8;
  long long v11 = *(_OWORD *)(a1 + 56);
  uint64_t v12 = a2;
  v9[4] = *(void *)(a1 + 32);
  [v4 write:v9];

  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  return v6;
}

uint64_t __33__NUMutableImageHistogram_write___block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void, void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), a2, [*(id *)(a1 + 32) binCount]);
  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)_histogramClass
{
  return (Class)objc_opt_class();
}

@end