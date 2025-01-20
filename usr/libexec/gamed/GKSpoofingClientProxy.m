@interface GKSpoofingClientProxy
- (BOOL)conformsToMultiUserRestrictions;
- (id)adamID;
- (id)bundleIdentifier;
- (id)bundleShortVersion;
- (id)bundleVersion;
- (id)externalVersion;
- (id)transportWithCredential:(id)a3;
@end

@implementation GKSpoofingClientProxy

- (id)bundleVersion
{
  v2 = +[GKClientProxy gameCenterClient];
  v3 = [v2 bundleVersion];

  return v3;
}

- (id)bundleShortVersion
{
  v2 = +[GKClientProxy gameCenterClient];
  v3 = [v2 bundleShortVersion];

  return v3;
}

- (id)transportWithCredential:(id)a3
{
  id v3 = a3;
  v4 = +[GKClientProxy gameCenterClient];
  v5 = [v4 transportWithCredential:v3];

  return v5;
}

- (id)bundleIdentifier
{
  v2 = +[GKClientProxy gameCenterClient];
  id v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)adamID
{
  v2 = +[GKClientProxy gameCenterClient];
  id v3 = [v2 adamID];

  return v3;
}

- (id)externalVersion
{
  v2 = +[GKClientProxy gameCenterClient];
  id v3 = [v2 externalVersion];

  return v3;
}

- (BOOL)conformsToMultiUserRestrictions
{
  return 0;
}

@end