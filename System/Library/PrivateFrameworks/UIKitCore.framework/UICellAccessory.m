@interface UICellAccessory
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)_isDisplayedForEditingState:(BOOL)a3;
- (BOOL)_isSystemType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (CGFloat)reservedLayoutWidth;
- (NSString)_identifier;
- (UICellAccessory)init;
- (UICellAccessory)initWithCoder:(NSCoder *)coder;
- (UICellAccessoryDisplayedState)displayedState;
- (UIColor)_backgroundColor;
- (UIColor)tintColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_compare:(id)a3;
- (int64_t)_defaultPlacementForHeader:(BOOL)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (unint64_t)hash;
- (void)_setBackgroundColor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayedState:(UICellAccessoryDisplayedState)displayedState;
- (void)setHidden:(BOOL)hidden;
- (void)setReservedLayoutWidth:(CGFloat)reservedLayoutWidth;
- (void)setTintColor:(UIColor *)tintColor;
@end

@implementation UICellAccessory

- (void)_setBackgroundColor:(id)a3
{
}

- (UIColor)_backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (CGFloat)reservedLayoutWidth
{
  return self->_reservedLayoutWidth;
}

- (BOOL)_isSystemType
{
  return 1;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (UICellAccessoryDisplayedState)displayedState
{
  return self->_displayedState;
}

- (int64_t)_defaultPlacementForHeader:(BOOL)a3
{
  return [(UICellAccessory *)self _systemTypePlacementForHeader:a3] > 199;
}

- (void)setTintColor:(UIColor *)tintColor
{
}

- (void)setHidden:(BOOL)hidden
{
  self->_hidden = hidden;
}

- (void)setReservedLayoutWidth:(CGFloat)reservedLayoutWidth
{
  self->_reservedLayoutWidth = reservedLayoutWidth;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    *(void *)(v4 + 24) = self->_displayedState;
    *(unsigned char *)(v4 + 8) = self->_hidden;
    *(double *)(v4 + 32) = self->_reservedLayoutWidth;
    objc_storeStrong((id *)(v4 + 40), self->_tintColor);
    objc_storeStrong(v5 + 2, self->_backgroundColor);
  }
  return v5;
}

- (void)setDisplayedState:(UICellAccessoryDisplayedState)displayedState
{
  self->_displayedState = displayedState;
}

- (UICellAccessory)init
{
  v9.receiver = self;
  v9.super_class = (Class)UICellAccessory;
  v3 = [(UICellAccessory *)&v9 init];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    if ([v4 isMemberOfClass:objc_opt_class()])
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      [v6 handleFailureInMethod:a2, v3, @"UICellAccessory.m", 30, @"%@ is an abstract base class and should not be instantiated directly.", v8 object file lineNumber description];
    }
    v3->_displayedState = 0;
    v3->_reservedLayoutWidth = -1.79769313e308;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (int64_t)_systemType
{
  return 0;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 0;
}

- (BOOL)_isDisplayedForEditingState:(BOOL)a3
{
  int64_t displayedState = self->_displayedState;
  if (!displayedState) {
    return 1;
  }
  if (displayedState == 2) {
    return !a3;
  }
  if (displayedState != 1)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICellAccessory.m", 64, @"Unknown UICellAccessoryDisplayedState value (%ld)", self->_displayedState);

    return 0;
  }
  return a3;
}

- (NSString)_identifier
{
  return (NSString *)&stru_1ED0E84C0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessory)initWithCoder:(NSCoder *)coder
{
  uint64_t v4 = coder;
  v12.receiver = self;
  v12.super_class = (Class)UICellAccessory;
  v5 = [(UICellAccessory *)&v12 init];
  if (v5)
  {
    v5->_int64_t displayedState = [(NSCoder *)v4 decodeIntegerForKey:@"displayedState"];
    v5->_hidden = [(NSCoder *)v4 decodeBoolForKey:@"hidden"];
    [(NSCoder *)v4 decodeDoubleForKey:@"reservedLayoutWidth"];
    v5->_reservedLayoutWidth = v6;
    uint64_t v7 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"tintColor"];
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v7;

    uint64_t v9 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t displayedState = self->_displayedState;
  id v5 = a3;
  [v5 encodeInteger:displayedState forKey:@"displayedState"];
  [v5 encodeBool:self->_hidden forKey:@"hidden"];
  [v5 encodeDouble:@"reservedLayoutWidth" forKey:self->_reservedLayoutWidth];
  [v5 encodeObject:self->_tintColor forKey:@"tintColor"];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UICellAccessory *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    double v6 = v5;
    uint64_t v7 = v6;
    if ((void *)self->_displayedState == v6[3]
      && self->_hidden == *((unsigned __int8 *)v6 + 8)
      && self->_reservedLayoutWidth == *((double *)v6 + 4)
      && UIEqual(self->_tintColor, v6[5]))
    {
      char v8 = UIEqual(self->_backgroundColor, v7[2]);
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  uint64_t v4 = (UICellAccessory *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_displayedState == v5->_displayedState
      && self->_hidden == v5->_hidden
      && self->_reservedLayoutWidth == v5->_reservedLayoutWidth;

  return v6;
}

- (int64_t)_compare:(id)a3
{
  id v5 = (UICellAccessory *)a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UICellAccessory.m", 148, @"Invalid parameter not satisfying: %@", @"other != nil" object file lineNumber description];
  }
  if (self == v5)
  {
    int64_t v8 = 0;
  }
  else
  {
    BOOL v6 = [(UICellAccessory *)self _identifier];
    uint64_t v7 = [(UICellAccessory *)v5 _identifier];
    int64_t v8 = [v6 compare:v7];
  }
  return v8;
}

- (unint64_t)hash
{
  return self->_displayedState ^ self->_hidden ^ (unint64_t)self->_reservedLayoutWidth;
}

@end