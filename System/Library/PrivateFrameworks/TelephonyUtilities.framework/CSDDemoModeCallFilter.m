@interface CSDDemoModeCallFilter
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (CSDDemoModeCallFilter)initWithQueue:(id)a3;
@end

@implementation CSDDemoModeCallFilter

- (CSDDemoModeCallFilter)initWithQueue:(id)a3
{
  return (CSDDemoModeCallFilter *)sub_100309F78(a3);
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10030A170(v6);

  return v9 & 1;
}

- (void).cxx_destruct
{
}

@end