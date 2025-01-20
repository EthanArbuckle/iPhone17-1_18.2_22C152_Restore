@interface PXDisplayAssetCountsByPlaybackStyle
- (BOOL)isEqual:(id)a3;
- (PXDisplayAssetCountsByPlaybackStyle)init;
- (PXDisplayAssetCountsByPlaybackStyle)initWithAssetFetchResult:(id)a3;
- (PXDisplayAssetCountsByPlaybackStyle)initWithCountsByPlaybackStyle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)countForPlaybackStyle:(int64_t)a3;
- (int64_t)totalCount;
- (unint64_t)hash;
- (void)addPlaybackStyle:(int64_t)a3;
- (void)enumerateCountsUsingBlock:(id)a3;
- (void)setCount:(int64_t)a3 forPlaybackStyle:(int64_t)a4;
@end

@implementation PXDisplayAssetCountsByPlaybackStyle

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  countsByPlaybackStyle = self->_countsByPlaybackStyle;

  return (id)[v4 initWithCountsByPlaybackStyle:countsByPlaybackStyle];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PXDisplayAssetCountsByPlaybackStyle *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = [(NSMutableDictionary *)self->_countsByPlaybackStyle isEqualToDictionary:v4->_countsByPlaybackStyle];
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_countsByPlaybackStyle hash];
}

- (int64_t)totalCount
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__PXDisplayAssetCountsByPlaybackStyle_totalCount__block_invoke;
  v4[3] = &unk_26545AC40;
  v4[4] = &v5;
  [(PXDisplayAssetCountsByPlaybackStyle *)self enumerateCountsUsingBlock:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__PXDisplayAssetCountsByPlaybackStyle_totalCount__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  return result;
}

- (void)enumerateCountsUsingBlock:(id)a3
{
  id v4 = a3;
  countsByPlaybackStyle = self->_countsByPlaybackStyle;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__PXDisplayAssetCountsByPlaybackStyle_enumerateCountsUsingBlock___block_invoke;
  v7[3] = &unk_26545AC18;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)countsByPlaybackStyle enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __65__PXDisplayAssetCountsByPlaybackStyle_enumerateCountsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = [a2 integerValue];
  uint64_t v9 = [v7 integerValue];

  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16);

  return v10(v6, v8, v9, a4);
}

- (void)setCount:(int64_t)a3 forPlaybackStyle:(int64_t)a4
{
  id v8 = [NSNumber numberWithInteger:a3];
  countsByPlaybackStyle = self->_countsByPlaybackStyle;
  id v7 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)countsByPlaybackStyle setObject:v8 forKeyedSubscript:v7];
}

- (void)addPlaybackStyle:(int64_t)a3
{
  int64_t v5 = -[PXDisplayAssetCountsByPlaybackStyle countForPlaybackStyle:](self, "countForPlaybackStyle:") + 1;

  [(PXDisplayAssetCountsByPlaybackStyle *)self setCount:v5 forPlaybackStyle:a3];
}

- (int64_t)countForPlaybackStyle:(int64_t)a3
{
  countsByPlaybackStyle = self->_countsByPlaybackStyle;
  id v4 = [NSNumber numberWithInteger:a3];
  int64_t v5 = [(NSMutableDictionary *)countsByPlaybackStyle objectForKeyedSubscript:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (PXDisplayAssetCountsByPlaybackStyle)initWithAssetFetchResult:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXDisplayAssetCountsByPlaybackStyle *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 count];
    if (v6 >= 1)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [v4 objectAtIndex:i];
        -[PXDisplayAssetCountsByPlaybackStyle addPlaybackStyle:](v5, "addPlaybackStyle:", [v9 playbackStyle]);
      }
    }
  }

  return v5;
}

- (PXDisplayAssetCountsByPlaybackStyle)initWithCountsByPlaybackStyle:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXDisplayAssetCountsByPlaybackStyle;
  int64_t v5 = [(PXDisplayAssetCountsByPlaybackStyle *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = v6;
    if (v6) {
      id v8 = v6;
    }
    else {
      id v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:6];
    }
    countsByPlaybackStyle = v5->_countsByPlaybackStyle;
    v5->_countsByPlaybackStyle = v8;
  }
  return v5;
}

- (PXDisplayAssetCountsByPlaybackStyle)init
{
  return [(PXDisplayAssetCountsByPlaybackStyle *)self initWithCountsByPlaybackStyle:0];
}

@end