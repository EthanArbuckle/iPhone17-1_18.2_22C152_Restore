@interface UICellAccessoryCheckmark
+ (BOOL)supportsSecureCoding;
- (id)_identifier;
- (int64_t)_systemType;
- (int64_t)_systemTypePlacementForHeader:(BOOL)a3;
@end

@implementation UICellAccessoryCheckmark

- (int64_t)_systemType
{
  return 1;
}

- (int64_t)_systemTypePlacementForHeader:(BOOL)a3
{
  return 202;
}

- (id)_identifier
{
  return @"Checkmark";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end