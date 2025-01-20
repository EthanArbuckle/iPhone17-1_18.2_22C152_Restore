@interface TTKKey
- (CGPoint)center;
- (CGRect)frame;
- (NSString)string;
- (TTKKey)initWithUIKBTree:(id)a3 layoutUtils:(id)a4;
- (id)description;
- (signed)keyCode;
@end

@implementation TTKKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutUtils, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (signed)keyCode
{
  return self->_keyCode;
}

- (CGPoint)center
{
  [(UIKBTree *)self->_key frame];
  double v4 = v3;
  [(UIKBTree *)self->_key frame];
  double v6 = v4 + v5 * 0.5;
  [(UIKBTree *)self->_key frame];
  double v8 = v7;
  [(UIKBTree *)self->_key frame];
  double v10 = v8 + v9 * 0.5;
  double v11 = v6;
  result.y = v10;
  result.x = v11;
  return result;
}

- (CGRect)frame
{
  [(UIKBTree *)self->_key frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)string
{
  double v3 = [(UIKBTree *)self->_key representedString];
  layoutUtils = self->_layoutUtils;
  if (layoutUtils)
  {
    id v5 = [(ACTKeyboardLayoutUtils *)layoutUtils representedStringForKey:self->_key shifted:0];
  }
  else
  {
    id v5 = v3;
  }
  double v6 = v5;

  return (NSString *)v6;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TTKKey *)self string];
  [(UIKBTree *)self->_key frame];
  uint64_t v7 = v6;
  [(UIKBTree *)self->_key frame];
  uint64_t v9 = v8;
  [(UIKBTree *)self->_key frame];
  uint64_t v11 = v10;
  [(UIKBTree *)self->_key frame];
  v13 = [v3 stringWithFormat:@"<%@: %p '%@' @ {{%g, %g}, {%g, %g}}>", v4, self, v5, v7, v9, v11, v12];

  return v13;
}

- (TTKKey)initWithUIKBTree:(id)a3 layoutUtils:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TTKKey;
  uint64_t v7 = [(TTKKey *)&v10 init];
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_key, a3);
  }

  return v8;
}

@end