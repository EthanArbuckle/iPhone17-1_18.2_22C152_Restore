@interface MRGroupSessionProvider
+ (id)remoteControlGroupSessionWithIdentifier:(id)a3 delegate:(id)a4;
@end

@implementation MRGroupSessionProvider

+ (id)remoteControlGroupSessionWithIdentifier:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[MRRemoteControlGroupSession alloc] initWithIdentifier:v6 delegate:v5];

  return v7;
}

@end