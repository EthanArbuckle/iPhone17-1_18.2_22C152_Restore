@interface TUIKey
+ (id)keyFromKBTree:(id)a3;
+ (id)keyFromKBTree:(id)a3 layoutType:(int64_t)a4 layoutShape:(int64_t)a5 multiplier:(double)a6;
+ (int64_t)layoutTypeForKey:(id)a3;
- (BOOL)inGridLayout;
- (CGRect)frame;
- (CGRect)paddedFrame;
- (NSString)displayString;
- (NSString)representedString;
- (UIKBShape)keyShape;
- (UIKBTree)backingTree;
- (UIKBTree)keyplane;
- (double)multiplier;
- (id)description;
- (id)stringFromLayoutType:(int64_t)a3;
- (id)stringFromShape:(int64_t)a3;
- (int64_t)layoutShape;
- (int64_t)layoutType;
- (int64_t)style;
- (void)setBackingTree:(id)a3;
- (void)setDisplayString:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInGridLayout:(BOOL)a3;
- (void)setKeyShape:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setLayoutShape:(int64_t)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setMultiplier:(double)a3;
- (void)setPaddedFrame:(CGRect)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation TUIKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_backingTree, 0);
}

- (void)setInGridLayout:(BOOL)a3
{
  self->_inGridLayout = a3;
}

- (BOOL)inGridLayout
{
  return self->_inGridLayout;
}

- (void)setLayoutShape:(int64_t)a3
{
  self->_layoutShape = a3;
}

- (int64_t)layoutShape
{
  return self->_layoutShape;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setMultiplier:(double)a3
{
  self->_multiplier = a3;
}

- (double)multiplier
{
  return self->_multiplier;
}

- (void)setDisplayString:(id)a3
{
}

- (NSString)displayString
{
  return self->_displayString;
}

- (void)setKeyplane:(id)a3
{
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (void)setBackingTree:(id)a3
{
}

- (UIKBTree)backingTree
{
  return self->_backingTree;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(TUIKey *)self stringFromShape:[(TUIKey *)self layoutShape]];
  v6 = [(TUIKey *)self stringFromLayoutType:[(TUIKey *)self layoutType]];
  [(TUIKey *)self multiplier];
  uint64_t v8 = v7;
  v9 = [(TUIKey *)self displayString];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; shape = %@; type = %@; multiplier = %0.2f; display = %@",
    v4,
    self,
    v5,
    v6,
    v8,
  v10 = v9);

  return v10;
}

- (id)stringFromLayoutType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 4) {
    return @"Unknown";
  }
  else {
    return *(&off_1E5593740 + a3 - 2);
  }
}

- (id)stringFromShape:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_1E5593728 + a3);
  }
}

- (UIKBShape)keyShape
{
  return (UIKBShape *)[(UIKBTree *)self->_backingTree shape];
}

- (void)setKeyShape:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(UIKBTree *)self->_backingTree shape];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0) {
    [(UIKBTree *)self->_backingTree setShape:v6];
  }
}

- (CGRect)frame
{
  [(UIKBTree *)self->_backingTree frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)paddedFrame
{
  [(UIKBTree *)self->_backingTree paddedFrame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (void)setPaddedFrame:(CGRect)a3
{
}

- (NSString)representedString
{
  return (NSString *)[(UIKBTree *)self->_backingTree representedString];
}

+ (int64_t)layoutTypeForKey:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 displayType];
  unsigned int v5 = [v3 interactionType];
  if (v4 <= 0x35)
  {
    if (((1 << v4) & 0x38000304A4703CLL) != 0)
    {
      int64_t v6 = 3;
      goto LABEL_4;
    }
    if (v4 == 25)
    {
      int64_t v6 = 4;
      goto LABEL_4;
    }
    if (v4 == 50)
    {
      uint64_t v8 = [v3 name];
      unsigned int v9 = [v8 containsString:@"Middle"];

      int64_t v6 = v9;
      goto LABEL_4;
    }
  }
  uint64_t v10 = 4;
  if (v5 != 15) {
    uint64_t v10 = 2;
  }
  if (((1 << v5) & 0x26000026E70) != 0) {
    uint64_t v10 = 3;
  }
  if (v5 <= 0x29) {
    int64_t v6 = v10;
  }
  else {
    int64_t v6 = 2;
  }
LABEL_4:

  return v6;
}

+ (id)keyFromKBTree:(id)a3 layoutType:(int64_t)a4 layoutShape:(int64_t)a5 multiplier:(double)a6
{
  id v9 = a3;
  uint64_t v10 = +[TUIKey keyFromKBTree:v9];
  [v10 setLayoutType:a4];
  [v10 setLayoutShape:a5];
  [v10 setMultiplier:a6];
  [v10 setBackingTree:v9];
  v11 = [v9 displayString];

  [v10 setDisplayString:v11];
  return v10;
}

+ (id)keyFromKBTree:(id)a3
{
  id v3 = a3;
  unsigned int v4 = objc_alloc_init(TUIKey);
  [(TUIKey *)v4 setLayoutType:-1];
  [(TUIKey *)v4 setLayoutShape:0];
  [(TUIKey *)v4 setMultiplier:0.0];
  [(TUIKey *)v4 setBackingTree:v3];
  unsigned int v5 = [v3 displayString];

  [(TUIKey *)v4 setDisplayString:v5];
  return v4;
}

@end