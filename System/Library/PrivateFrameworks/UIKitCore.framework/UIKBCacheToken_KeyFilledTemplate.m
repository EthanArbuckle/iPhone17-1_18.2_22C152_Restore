@interface UIKBCacheToken_KeyFilledTemplate
+ (id)tokenTemplateFilledForKey:(id)a3 style:(int)a4 size:(CGSize)a5;
- (id)_stringWithAdditionalValues:(id)a3;
@end

@implementation UIKBCacheToken_KeyFilledTemplate

+ (id)tokenTemplateFilledForKey:(id)a3 style:(int)a4 size:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v8 = a3;
  id v9 = objc_alloc((Class)objc_opt_class());
  if ((a4 & 0xFFFFFFFE) == 0x6A) {
    uint64_t v10 = 129;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = objc_msgSend(v9, "_initWithKey:style:displayInsets:", v8, v10, 0.0, 0.0, 0.0, 0.0);

  [v11 setEmptyFields:1];
  *((CGFloat *)v11 + 12) = width;
  *((CGFloat *)v11 + 13) = height;
  return v11;
}

- (id)_stringWithAdditionalValues:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__UIKBCacheToken_KeyFilledTemplate__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E52F3D88;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = [(UIKBCacheToken *)self stringForConstruction:v8];

  return v6;
}

@end