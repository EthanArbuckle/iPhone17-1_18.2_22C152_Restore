@interface CSDOwnNumberCallFilter
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (CSDOwnNumberCallFilter)initWithQueue:(id)a3;
@end

@implementation CSDOwnNumberCallFilter

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100378B14(v6);

  return v9 & 1;
}

- (CSDOwnNumberCallFilter)initWithQueue:(id)a3
{
  return (CSDOwnNumberCallFilter *)sub_100379060(a3);
}

- (void).cxx_destruct
{
}

@end