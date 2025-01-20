@interface UICellAccessoryMultiselect
+ (BOOL)supportsSecureCoding;
- (UICellAccessoryMultiselect)init;
- (id)_identifier;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
@end

@implementation UICellAccessoryMultiselect

- (int64_t)_systemType
{
  return 5;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 103;
}

- (id)_identifier
{
  return @"Multiselect";
}

- (UICellAccessoryMultiselect)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICellAccessoryMultiselect;
  v2 = [(UICellAccessory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UICellAccessory *)v2 setDisplayedState:1];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end