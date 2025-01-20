@interface WKLayeredStripeWallpaperInput
+ (WKLayeredStripeWallpaperInput)new;
- (BOOL)isEqual:(id)a3;
- (NADescriptionBuilder)wk_descriptionBuilder;
- (NSString)description;
- (UIColor)backgroundColor;
- (WKLayeredStripeWallpaperInput)init;
- (WKLayeredStripeWallpaperInput)initWithBackgroundColor:(id)a3 stripeAngleDegrees:(double)a4 stripeHeightFactor:(double)a5 firstStripeOffsetScaleFactor:(double)a6;
- (double)firstStripeOffsetScaleFactor;
- (double)stripeAngleDegrees;
- (double)stripeHeightFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderBlock;
- (unint64_t)hash;
@end

@implementation WKLayeredStripeWallpaperInput

+ (WKLayeredStripeWallpaperInput)new
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

- (WKLayeredStripeWallpaperInput)init
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

- (WKLayeredStripeWallpaperInput)initWithBackgroundColor:(id)a3 stripeAngleDegrees:(double)a4 stripeHeightFactor:(double)a5 firstStripeOffsetScaleFactor:(double)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WKLayeredStripeWallpaperInput;
  v11 = [(WKLayeredStripeWallpaperInput *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    backgroundColor = v11->_backgroundColor;
    v11->_backgroundColor = (UIColor *)v12;

    v11->_stripeAngleDegrees = a4;
    v11->_stripeHeightFactor = a5;
    v11->_firstStripeOffsetScaleFactor = a6;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WKLayeredStripeWallpaperInput *)self backgroundColor];
  [(WKLayeredStripeWallpaperInput *)self stripeAngleDegrees];
  double v7 = v6;
  [(WKLayeredStripeWallpaperInput *)self stripeHeightFactor];
  double v9 = v8;
  [(WKLayeredStripeWallpaperInput *)self firstStripeOffsetScaleFactor];
  v11 = (void *)[v4 initWithBackgroundColor:v5 stripeAngleDegrees:v7 stripeHeightFactor:v9 firstStripeOffsetScaleFactor:v10];

  return v11;
}

id __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_0_13 != -1) {
    dispatch_once(&_block_invoke_na_once_token_0_13, &__block_literal_global_5_2);
  }
  v0 = (void *)_block_invoke_na_once_object_0_13;
  return v0;
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_2()
{
  _block_invoke_na_once_object_0_13 = __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_3();
  return MEMORY[0x1F41817F8]();
}

id __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_3()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_12_1];
  id v2 = (id)[v0 appendDoubleCharacteristic:&__block_literal_global_15_0];
  id v3 = (id)[v0 appendDoubleCharacteristic:&__block_literal_global_17_1];
  id v4 = (id)[v0 appendDoubleCharacteristic:&__block_literal_global_19_0];
  v5 = [v0 build];

  return v5;
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 backgroundColor];
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 stripeAngleDegrees];
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 stripeHeightFactor];
}

uint64_t __44__WKLayeredStripeWallpaperInput_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 firstStripeOffsetScaleFactor];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (unint64_t)hash
{
  id v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (NADescriptionBuilder)wk_descriptionBuilder
{
  id v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  objc_initWeak(&location, self);
  unint64_t v4 = [v3 activeMultilinePrefix];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__WKLayeredStripeWallpaperInput_wk_descriptionBuilder__block_invoke;
  v7[3] = &unk_1E6376718;
  objc_copyWeak(&v9, &location);
  id v5 = v3;
  id v8 = v5;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return (NADescriptionBuilder *)v5;
}

void __54__WKLayeredStripeWallpaperInput_wk_descriptionBuilder__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained descriptionBuilderBlock];
  v2[2](v2, *(void *)(a1 + 32));
}

- (NSString)description
{
  id v2 = [(WKLayeredStripeWallpaperInput *)self wk_descriptionBuilder];
  id v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilderBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__WKLayeredStripeWallpaperInput_descriptionBuilderBlock__block_invoke;
  v4[3] = &unk_1E6376740;
  objc_copyWeak(&v5, &location);
  id v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

void __56__WKLayeredStripeWallpaperInput_descriptionBuilderBlock__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v4 = [WeakRetained backgroundColor];
  id v5 = (id)[v9 appendObject:v4 withName:@"backgroundColor"];

  [WeakRetained stripeAngleDegrees];
  id v6 = (id)objc_msgSend(v9, "appendDouble:withName:decimalPrecision:", @"stripeAngleDegrees", 8);
  [WeakRetained stripeHeightFactor];
  id v7 = (id)objc_msgSend(v9, "appendDouble:withName:decimalPrecision:", @"stripeHeightFactor", 8);
  [WeakRetained firstStripeOffsetScaleFactor];
  id v8 = (id)objc_msgSend(v9, "appendDouble:withName:decimalPrecision:", @"firstStripeOffsetScaleFactor", 8);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)stripeAngleDegrees
{
  return self->_stripeAngleDegrees;
}

- (double)stripeHeightFactor
{
  return self->_stripeHeightFactor;
}

- (double)firstStripeOffsetScaleFactor
{
  return self->_firstStripeOffsetScaleFactor;
}

- (void).cxx_destruct
{
}

@end