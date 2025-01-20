@interface SSKSeededDisplayConfigurationBuilder
- (SSKSeededDisplayConfigurationBuilder)initWithSeed:(unint64_t)a3 builder:(id)a4;
- (id)buildConfigurationWithError:(id *)a3;
- (void)setCloningSupported:(BOOL)a3;
- (void)setCurrentMode:(id)a3 preferredMode:(id)a4 otherModes:(id)a5;
- (void)setExpectsSecureRendering;
- (void)setOverscanned:(BOOL)a3 compensation:(int64_t)a4 safeRatio:(CGSize)a5;
- (void)setPixelSize:(CGSize)a3 nativeBounds:(CGRect)a4 bounds:(CGRect)a5;
- (void)setUIKitMainLike;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation SSKSeededDisplayConfigurationBuilder

- (SSKSeededDisplayConfigurationBuilder)initWithSeed:(unint64_t)a3 builder:(id)a4
{
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKSeededDisplayConfigurationBuilder.m", 18, @"Invalid parameter not satisfying: %@", @"builder" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SSKSeededDisplayConfigurationBuilder;
  v9 = [(SSKSeededDisplayConfigurationBuilder *)&v13 init];
  v10 = v9;
  if (v9)
  {
    v9->_seed = a3;
    objc_storeStrong((id *)&v9->_builder, a4);
  }

  return v10;
}

- (id)buildConfigurationWithError:(id *)a3
{
  return (id)[(SSKDisplayConfigurationBuilding *)self->_builder buildConfigurationWithError:a3];
}

- (void)setCloningSupported:(BOOL)a3
{
}

- (void)setCurrentMode:(id)a3 preferredMode:(id)a4 otherModes:(id)a5
{
}

- (void)setExpectsSecureRendering
{
}

- (void)setOverscanned:(BOOL)a3 compensation:(int64_t)a4 safeRatio:(CGSize)a5
{
}

- (void)setPixelSize:(CGSize)a3 nativeBounds:(CGRect)a4 bounds:(CGRect)a5
{
}

- (void)setUIKitMainLike
{
}

- (void)setUniqueIdentifier:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@_%lu", a3, self->_seed];
  [(SSKDisplayConfigurationBuilding *)self->_builder setUniqueIdentifier:v4];
}

- (void).cxx_destruct
{
}

@end