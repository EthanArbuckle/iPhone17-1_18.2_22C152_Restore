@interface WKBokehWallpaperInput
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)backgroundColors;
- (NSArray)bubbleColors;
- (WKBokehWallpaperInput)init;
- (WKBokehWallpaperInput)initWithBackgroundColors:(id)a3 bubbleColors:(id)a4 bubbleCount:(unint64_t)a5 bubbleScale:(double)a6 parallaxMultiplier:(double)a7 thumbnailSeed:(unint64_t)a8;
- (double)bubbleScale;
- (double)parallaxMultiplier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionBuilderBlock;
- (id)wk_descriptionBuilder;
- (unint64_t)bubbleCount;
- (unint64_t)hash;
- (unint64_t)thumbnailSeed;
@end

@implementation WKBokehWallpaperInput

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"Attempted to initialize %@ without using designated initializer.", v6];
  id v8 = [v2 exceptionWithName:v3 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (WKBokehWallpaperInput)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"Attempted to initialize %@ without using designated initializer.", v6];
  id v8 = [v2 exceptionWithName:v3 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (WKBokehWallpaperInput)initWithBackgroundColors:(id)a3 bubbleColors:(id)a4 bubbleCount:(unint64_t)a5 bubbleScale:(double)a6 parallaxMultiplier:(double)a7 thumbnailSeed:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WKBokehWallpaperInput;
  v16 = [(WKBokehWallpaperInput *)&v22 init];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    backgroundColors = v16->_backgroundColors;
    v16->_backgroundColors = (NSArray *)v17;

    uint64_t v19 = [v15 copy];
    bubbleColors = v16->_bubbleColors;
    v16->_bubbleColors = (NSArray *)v19;

    v16->_bubbleCount = a5;
    v16->_bubbleScale = a6;
    v16->_parallaxMultiplier = a7;
    v16->_thumbnailSeed = a8;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKBokehWallpaperInput *)self backgroundColors];
  v6 = [(WKBokehWallpaperInput *)self bubbleColors];
  unint64_t v7 = [(WKBokehWallpaperInput *)self bubbleCount];
  [(WKBokehWallpaperInput *)self bubbleScale];
  double v9 = v8;
  [(WKBokehWallpaperInput *)self parallaxMultiplier];
  v11 = objc_msgSend(v4, "initWithBackgroundColors:bubbleColors:bubbleCount:bubbleScale:parallaxMultiplier:thumbnailSeed:", v5, v6, v7, -[WKBokehWallpaperInput thumbnailSeed](self, "thumbnailSeed"), v9, v10);

  return v11;
}

id __36__WKBokehWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_1 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_1, &__block_literal_global_5);
  }
  v0 = (void *)_block_invoke_na_once_object_0_1;

  return v0;
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_2()
{
  _block_invoke_na_once_object_0_1 = __36__WKBokehWallpaperInput_na_identity__block_invoke_3();

  return MEMORY[0x1F41817F8]();
}

id __36__WKBokehWallpaperInput_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_12];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_14];
  id v3 = (id)[v0 appendUnsignedIntegerCharacteristic:&__block_literal_global_17];
  id v4 = (id)[v0 appendDoubleCharacteristic:&__block_literal_global_20];
  id v5 = (id)[v0 appendDoubleCharacteristic:&__block_literal_global_22_0];
  id v6 = (id)[v0 appendUnsignedIntegerCharacteristic:&__block_literal_global_24];
  unint64_t v7 = [v0 build];

  return v7;
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 backgroundColors];
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 bubbleColors];
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 bubbleCount];
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 bubbleScale];
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 parallaxMultiplier];
}

uint64_t __36__WKBokehWallpaperInput_na_identity__block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 thumbnailSeed];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (id)wk_descriptionBuilder
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__WKBokehWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v5;
}

void __46__WKBokehWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (id)description
{
  id v2 = [(WKBokehWallpaperInput *)self wk_descriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__WKBokehWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __48__WKBokehWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = [WeakRetained backgroundColors];
  id v5 = (id)[v12 appendObject:v4 withName:@"backgroundColors"];

  id v6 = [WeakRetained bubbleColors];
  id v7 = (id)[v12 appendObject:v6 withName:@"bubbleColors"];

  id v8 = (id)objc_msgSend(v12, "appendUnsignedInteger:withName:", objc_msgSend(WeakRetained, "bubbleCount"), @"bubbleCount");
  [WeakRetained bubbleScale];
  id v9 = (id)objc_msgSend(v12, "appendDouble:withName:decimalPrecision:", @"bubbleScale", 2);
  [WeakRetained parallaxMultiplier];
  id v10 = (id)objc_msgSend(v12, "appendDouble:withName:decimalPrecision:", @"parallaxMultiplier", 2);
  id v11 = (id)objc_msgSend(v12, "appendUnsignedInteger:withName:", objc_msgSend(WeakRetained, "thumbnailSeed"), @"thumbnailSeed");
}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (NSArray)bubbleColors
{
  return self->_bubbleColors;
}

- (unint64_t)bubbleCount
{
  return self->_bubbleCount;
}

- (double)bubbleScale
{
  return self->_bubbleScale;
}

- (double)parallaxMultiplier
{
  return self->_parallaxMultiplier;
}

- (unint64_t)thumbnailSeed
{
  return self->_thumbnailSeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleColors, 0);

  objc_storeStrong((id *)&self->_backgroundColors, 0);
}

@end