@interface _UICellAccessory
+ (id)accessoryWithIdentifier:(id)a3;
- (BOOL)alwaysNeedsLayout;
- (BOOL)isEqual:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)identifier;
- (UIView)view;
- (_UICellAccessory)init;
- (double)reservedLayoutWidth;
- (id)description;
- (void)setIdentifier:(id)a3;
- (void)setReservedLayoutWidth:(double)a3;
@end

@implementation _UICellAccessory

- (NSString)identifier
{
  return self->_identifier;
}

- (UIView)view
{
  return self->_view;
}

- (double)reservedLayoutWidth
{
  return self->_reservedLayoutWidth;
}

- (void)setReservedLayoutWidth:(double)a3
{
  self->_reservedLayoutWidth = a3;
}

+ (id)accessoryWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setIdentifier:v4];

  return v5;
}

- (void)setIdentifier:(id)a3
{
}

- (_UICellAccessory)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UICellAccessory;
  result = [(_UICellAccessory *)&v3 init];
  if (result) {
    result->_reservedLayoutWidth = 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    identifier = self->_identifier;
    v6 = [v4 identifier];
    v7 = identifier;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [(NSString *)v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)description
{
  v7[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = NSStringFromSelector(sel_identifier);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  id v5 = +[UIDescriptionBuilder descriptionForObject:self keys:v4];

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)alwaysNeedsLayout
{
  return self->_alwaysNeedsLayout;
}

@end