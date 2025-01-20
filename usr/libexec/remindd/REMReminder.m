@interface REMReminder
- (BOOL)isPhantom;
@end

@implementation REMReminder

- (BOOL)isPhantom
{
  v3 = [(REMReminder *)self list];
  if (v3)
  {
    v4 = [(REMReminder *)self list];
    v5 = [v4 account];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

@end