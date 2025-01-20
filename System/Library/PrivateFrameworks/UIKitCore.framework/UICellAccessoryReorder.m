@interface UICellAccessoryReorder
+ (BOOL)supportsSecureCoding;
- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsVerticalSeparator;
- (UICellAccessoryReorder)init;
- (UICellAccessoryReorder)initWithCoder:(id)a3;
- (id)_identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setShowsVerticalSeparator:(BOOL)showsVerticalSeparator;
@end

@implementation UICellAccessoryReorder

- (BOOL)showsVerticalSeparator
{
  return self->_showsVerticalSeparator;
}

- (void)setShowsVerticalSeparator:(BOOL)showsVerticalSeparator
{
  self->_showsVerticalSeparator = showsVerticalSeparator;
}

- (int64_t)_systemType
{
  return 4;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 208;
}

- (id)_identifier
{
  return @"Reorder";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryReorder;
  id result = [(UICellAccessory *)&v5 copyWithZone:a3];
  if (result) {
    *((unsigned char *)result + 48) = self->_showsVerticalSeparator;
  }
  return result;
}

- (UICellAccessoryReorder)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryReorder;
  v2 = [(UICellAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UICellAccessory *)v2 setDisplayedState:1];
    v3->_showsVerticalSeparator = 1;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UICellAccessoryReorder)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryReorder;
  objc_super v5 = [(UICellAccessory *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_showsVerticalSeparator = [v4 decodeBoolForKey:@"showsVerticalSeparator"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryReorder;
  id v4 = a3;
  [(UICellAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_showsVerticalSeparator, @"showsVerticalSeparator", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryReorder;
  if ([(UICellAccessory *)&v7 isEqual:v4]) {
    BOOL v5 = self->_showsVerticalSeparator == v4[48];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_canDirectlyUpdateExistingAccessoryViewFrom:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)UICellAccessoryReorder;
  if ([(UICellAccessory *)&v7 _canDirectlyUpdateExistingAccessoryViewFrom:v4])
  {
    BOOL v5 = self->_showsVerticalSeparator == v4[48];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end