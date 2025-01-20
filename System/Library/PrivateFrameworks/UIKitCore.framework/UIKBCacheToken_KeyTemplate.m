@interface UIKBCacheToken_KeyTemplate
+ (id)tokenTemplateForKey:(id)a3 name:(id)a4 style:(int)a5 size:(CGSize)a6;
- (id)_stringWithAdditionalValues:(id)a3;
@end

@implementation UIKBCacheToken_KeyTemplate

+ (id)tokenTemplateForKey:(id)a3 name:(id)a4 style:(int)a5 size:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc((Class)objc_opt_class());
  if ((a5 & 0xFFFFFFFE) == 0x6A) {
    uint64_t v13 = 129;
  }
  else {
    uint64_t v13 = 1;
  }
  v14 = objc_msgSend(v12, "_initWithKey:style:displayInsets:", v11, v13, 0.0, 0.0, 0.0, 0.0);

  [v14 setName:v10];
  [v14 setEmptyFields:4];
  *((CGFloat *)v14 + 12) = width;
  *((CGFloat *)v14 + 13) = height;
  return v14;
}

- (id)_stringWithAdditionalValues:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__UIKBCacheToken_KeyTemplate__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E52F3D88;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = [(UIKBCacheToken *)self stringForConstruction:v8];

  return v6;
}

@end