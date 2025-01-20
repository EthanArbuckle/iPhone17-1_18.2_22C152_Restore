@interface UICellAccessorySeparator
+ (BOOL)supportsSecureCoding;
- (UICellAccessorySeparator)init;
- (id)_identifier;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
@end

@implementation UICellAccessorySeparator

- (UICellAccessorySeparator)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessorySeparator;
  v2 = [(UICellAccessory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(UICellAccessory *)v2 setDisplayedState:1];
    [(UICellAccessory *)v3 setReservedLayoutWidth:0.0];
  }
  return v3;
}

- (int64_t)_systemType
{
  return 8;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 207;
}

- (id)_identifier
{
  return @"Separator";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end