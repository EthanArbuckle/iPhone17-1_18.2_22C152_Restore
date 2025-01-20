@interface VSImageScaleValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (CGSize)preferredSize;
- (id)transformedValue:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
@end

@implementation VSImageScaleValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  CGFloat v5 = *MEMORY[0x263F001A8];
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  [(VSImageScaleValueTransformer *)self preferredSize];
  double v8 = v7;
  double v10 = v9;
  [v4 size];
  double v13 = fmin(v8 / v11, v10 / v12);
  double v14 = v11 * v13;
  double v15 = v12 * v13;
  v30.origin.x = v5;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  double MidX = CGRectGetMidX(v30);
  v31.origin.x = v5;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  CGFloat v17 = CGRectGetMidY(v31) + v15 * -0.5;
  id v18 = objc_alloc(MEMORY[0x263F1C680]);
  [(VSImageScaleValueTransformer *)self preferredSize];
  v19 = objc_msgSend(v18, "initWithSize:");
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __49__VSImageScaleValueTransformer_transformedValue___block_invoke;
  v23[3] = &unk_265076950;
  id v24 = v4;
  double v25 = MidX + v14 * -0.5;
  CGFloat v26 = v17;
  double v27 = v14;
  double v28 = v15;
  id v20 = v4;
  v21 = [v19 imageWithActions:v23];

  return v21;
}

uint64_t __49__VSImageScaleValueTransformer_transformedValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  self->_preferredSize = a3;
}

@end