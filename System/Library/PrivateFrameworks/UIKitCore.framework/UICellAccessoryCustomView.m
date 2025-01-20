@interface UICellAccessoryCustomView
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)_isSystemType;
- (BOOL)isEqual:(id)a3;
- (BOOL)maintainsFixedSize;
- (UICellAccessoryCustomView)initWithCoder:(NSCoder *)coder;
- (UICellAccessoryCustomView)initWithCustomView:(UIView *)customView placement:(UICellAccessoryPlacement)placement;
- (UICellAccessoryPlacement)placement;
- (UICellAccessoryPosition)position;
- (UIView)customView;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_defaultPlacementForHeader:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMaintainsFixedSize:(BOOL)maintainsFixedSize;
- (void)setPosition:(UICellAccessoryPosition)position;
@end

@implementation UICellAccessoryCustomView

- (UICellAccessoryCustomView)initWithCustomView:(UIView *)customView placement:(UICellAccessoryPlacement)placement
{
  v8 = customView;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UICellAccessory.m", 846, @"Invalid parameter not satisfying: %@", @"customView != nil" object file lineNumber description];
  }
  if (![(UIView *)v8 translatesAutoresizingMaskIntoConstraints])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UICellAccessory.m", 847, @"Custom view accessories must have translatesAutoresizingMaskIntoConstraints enabled, even if auto layout constraints are used inside them. Custom view: %@", v8 object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)UICellAccessoryCustomView;
  v9 = [(UICellAccessory *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_customView, customView);
    v10->_placement = placement;
    objc_opt_class();
    double v11 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (_UICellAccessoryCustomViewDefaultUsesStandardLayoutWidthForCustomButton(v8)) {
            double v11 = -1.79769313e308;
          }
          else {
            double v11 = 0.0;
          }
        }
        else
        {
          double v11 = -1.79769313e308;
        }
      }
    }
    [(UICellAccessory *)v10 setReservedLayoutWidth:v11];
  }

  return v10;
}

- (BOOL)_isSystemType
{
  return 0;
}

- (int64_t)_defaultPlacementForHeader:(BOOL)a3
{
  return self->_placement;
}

- (id)_identifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"CustomView-%p", self->_customView);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryCustomView)initWithCoder:(NSCoder *)coder
{
  v4 = coder;
  if ([(NSCoder *)v4 requiresSecureCoding]
    || ([(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"customView"],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    v8 = 0;
    v6 = 0;
  }
  else
  {
    v6 = (void *)v5;
    v10.receiver = self;
    v10.super_class = (Class)UICellAccessoryCustomView;
    v7 = [(UICellAccessory *)&v10 initWithCoder:v4];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_customView, v6);
      v8->_placement = [(NSCoder *)v4 decodeIntegerForKey:@"placement"];
      v8->_maintainsFixedSize = [(NSCoder *)v4 decodeBoolForKey:@"maintainsFixedSize"];
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryCustomView;
  [(UICellAccessory *)&v5 encodeWithCoder:v4];
  if (([v4 requiresSecureCoding] & 1) == 0) {
    [v4 encodeObject:self->_customView forKey:@"customView"];
  }
  [v4 encodeInteger:self->_placement forKey:@"placement"];
  [v4 encodeBool:self->_maintainsFixedSize forKey:@"maintainsFixedSize"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UICellAccessoryCustomView;
  id v4 = [(UICellAccessory *)&v9 copyWithZone:a3];
  objc_super v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_customView);
    v5[8] = self->_placement;
    *((unsigned char *)v5 + 48) = self->_maintainsFixedSize;
    uint64_t v6 = [self->_position copy];
    id v7 = v5[9];
    v5[9] = (id)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UICellAccessoryCustomView;
  if ([(UICellAccessory *)&v8 isEqual:v4])
  {
    objc_super v5 = v4;
    BOOL v6 = self->_customView == (UIView *)v5[7]
      && self->_placement == v5[8]
      && self->_maintainsFixedSize == *((unsigned __int8 *)v5 + 48)
      && self->_position == (id)v5[9];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryCustomView;
  unint64_t v3 = [(UICellAccessory *)&v5 hash];
  return [(UIView *)self->_customView hash] ^ v3 ^ self->_placement ^ self->_maintainsFixedSize;
}

- (UICellAccessoryPosition)position
{
  unint64_t v3 = _Block_copy(self->_position);
  if (!v3)
  {
    if (self->_placement) {
      unint64_t v3 = &__block_literal_global_328_0;
    }
    else {
      unint64_t v3 = &__block_literal_global_366;
    }
  }
  id v4 = _Block_copy(v3);

  return v4;
}

uint64_t __37__UICellAccessoryCustomView_position__block_invoke(uint64_t a1, void *a2)
{
  return [a2 count];
}

uint64_t __37__UICellAccessoryCustomView_position__block_invoke_2()
{
  return 0;
}

- (UIView)customView
{
  return self->_customView;
}

- (UICellAccessoryPlacement)placement
{
  return self->_placement;
}

- (BOOL)maintainsFixedSize
{
  return self->_maintainsFixedSize;
}

- (void)setMaintainsFixedSize:(BOOL)maintainsFixedSize
{
  self->_maintainsFixedSize = maintainsFixedSize;
}

- (void)setPosition:(UICellAccessoryPosition)position
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_position, 0);
  objc_storeStrong((id *)&self->_customView, 0);
}

@end