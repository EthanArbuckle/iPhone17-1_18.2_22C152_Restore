@interface UIKBCacheToken_KeyMask
+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5;
- (id)_stringWithAdditionalValues:(id)a3;
@end

@implementation UIKBCacheToken_KeyMask

+ (id)tokenForKey:(id)a3 style:(id)a4 displayInsets:(UIEdgeInsets)a5
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  uint64_t v9 = *(void *)&a4;
  id v10 = a3;
  v11 = (unsigned char *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithKey:style:displayInsets:", v10, v9, top, left, bottom, right);

  v11[136] = 1;
  return v11;
}

- (id)_stringWithAdditionalValues:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__UIKBCacheToken_KeyMask__stringWithAdditionalValues___block_invoke;
  v8[3] = &unk_1E52F3D88;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  v6 = [(UIKBCacheToken *)self stringForConstruction:v8];

  return v6;
}

@end