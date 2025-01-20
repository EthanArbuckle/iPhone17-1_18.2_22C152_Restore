@interface CLKUITexture
+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4;
+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4 nullTexture:(id)a5;
+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:;
+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:(id)a5 nullTexture:;
+ (id)nullTexture2D;
+ (id)nullTextureCube;
- (BOOL)isNull;
- (CLKUIAtlas)atlas;
- (CLKUITexture)initWithAtlas:(id)a3 rect:;
- (NSString)uuid;
- (__n128)rect;
- (unint64_t)status;
- (void)dealloc;
@end

@implementation CLKUITexture

+ (id)nullTexture2D
{
  if (nullTexture2D_onceToken != -1) {
    dispatch_once(&nullTexture2D_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)__nullTexture2D;
  return v2;
}

void __29__CLKUITexture_nullTexture2D__block_invoke()
{
  v0 = [CLKUITexture alloc];
  id v4 = +[CLKUIResourceManager sharedInstance];
  v1 = [v4 nullAtlas2D];
  uint64_t v2 = [(CLKUITexture *)v0 initWithAtlas:v1 rect:*(double *)vdupq_n_s64(0x7FC000007FC00000uLL).i64];
  v3 = (void *)__nullTexture2D;
  __nullTexture2D = v2;
}

+ (id)nullTextureCube
{
  if (nullTextureCube_onceToken != -1) {
    dispatch_once(&nullTextureCube_onceToken, &__block_literal_global_74);
  }
  uint64_t v2 = (void *)__nullTextureCube;
  return v2;
}

void __31__CLKUITexture_nullTextureCube__block_invoke()
{
  v0 = [CLKUITexture alloc];
  id v4 = +[CLKUIResourceManager sharedInstance];
  v1 = [v4 nullAtlasCube];
  uint64_t v2 = [(CLKUITexture *)v0 initWithAtlas:v1 rect:*(double *)vdupq_n_s64(0x7FC000007FC00000uLL).i64];
  v3 = (void *)__nullTextureCube;
  __nullTextureCube = v2;
}

+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[CLKUITexture nullTexture2D];
  v9 = [a1 textureWithProviderDelegate:v7 uuid:v6 rect:v8 nullTexture:0.0];

  return (CLKUITexture *)v9;
}

+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:
{
  double v12 = v4;
  id v7 = a4;
  id v8 = a3;
  v9 = +[CLKUITexture nullTexture2D];
  v10 = [a1 textureWithProviderDelegate:v8 uuid:v7 rect:v9 nullTexture:v12];

  return (CLKUITexture *)v10;
}

+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4 nullTexture:(id)a5
{
  return (CLKUITexture *)[a1 textureWithProviderDelegate:a3 uuid:a4 rect:a5 nullTexture:0.0];
}

+ (CLKUITexture)textureWithProviderDelegate:(id)a3 uuid:(id)a4 rect:(id)a5 nullTexture:
{
  double v14 = v5;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[CLKUIResourceManager sharedInstance];
  double v12 = [v11 textureForUuid:v9 delegate:v10 rect:v8 nullTexture:v14];

  return (CLKUITexture *)v12;
}

- (CLKUITexture)initWithAtlas:(id)a3 rect:
{
  long long v10 = v3;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKUITexture;
  id v7 = [(CLKUITexture *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_atlas, a3);
    *(_OWORD *)v8->_rect = v10;
    [v6 incrementInstanceCount];
    v8->_null = v8->_atlas == 0;
  }

  return v8;
}

- (void)dealloc
{
  [(CLKUIAtlas *)self->_atlas decrementInstanceCount];
  v3.receiver = self;
  v3.super_class = (Class)CLKUITexture;
  [(CLKUITexture *)&v3 dealloc];
}

- (NSString)uuid
{
  return [(CLKUIAtlas *)self->_atlas uuid];
}

- (unint64_t)status
{
  return [(CLKUIAtlas *)self->_atlas status];
}

- (CLKUIAtlas)atlas
{
  return self->_atlas;
}

- (__n128)rect
{
  return a1[2];
}

- (BOOL)isNull
{
  return self->_null;
}

- (void).cxx_destruct
{
}

@end