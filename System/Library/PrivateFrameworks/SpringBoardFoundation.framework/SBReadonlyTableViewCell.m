@interface SBReadonlyTableViewCell
+ (int64_t)cellStyleForRow:(id)a3;
- (void)updateDisplayedValue;
@end

@implementation SBReadonlyTableViewCell

+ (int64_t)cellStyleForRow:(id)a3
{
  return 1;
}

- (void)updateDisplayedValue
{
  id v5 = [(SBReadonlyTableViewCell *)self detailTextLabel];
  v3 = [(PTUIRowTableViewCell *)self row];
  v4 = [v3 value];
  [v5 setText:v4];
}

@end