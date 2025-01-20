@interface UICellAccessoryDisclosureIndicator
+ (BOOL)supportsSecureCoding;
- (UICellAccessoryDisclosureIndicator)init;
- (id)_identifier;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
@end

@implementation UICellAccessoryDisclosureIndicator

- (int64_t)_systemType
{
  return 0;
}

- (id)_identifier
{
  return @"DisclosureIndicator";
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 205;
}

- (UICellAccessoryDisclosureIndicator)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryDisclosureIndicator;
  v2 = [(UICellAccessory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICellAccessory *)v2 setReservedLayoutWidth:0.0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end