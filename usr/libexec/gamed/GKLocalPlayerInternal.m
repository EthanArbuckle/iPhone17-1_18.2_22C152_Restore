@interface GKLocalPlayerInternal
+ (id)_profileArchiveURLEnsuringDirectory:(BOOL)a3;
+ (id)archivedProfile;
+ (void)archiveProfile:(id)a3;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKLocalPlayerInternal

+ (id)_profileArchiveURLEnsuringDirectory:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = +[GKClientProxy cacheDirectoryForBundleID:0];
  if (v3) {
    id v5 = (id)gkEnsureDirectory();
  }
  v6 = [v4 stringByAppendingPathComponent:@"GKLocalPlayer.offline"];

  v7 = +[NSURL fileURLWithPath:v6];

  return v7;
}

+ (void)archiveProfile:(id)a3
{
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  id v5 = [a1 _profileArchiveURLEnsuringDirectory:1];
  id v9 = 0;
  unsigned __int8 v6 = [v4 writeToURL:v5 options:1 error:&v9];
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    if (!os_log_GKGeneral) {
      id v8 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100034DF0();
    }
  }
}

+ (id)archivedProfile
{
  v2 = [a1 _profileArchiveURLEnsuringDirectory:0];
  BOOL v3 = +[NSData dataWithContentsOfURL:v2];

  if (v3)
  {
    id v8 = 0;
    v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (v5)
    {
      if (!os_log_GKGeneral) {
        id v6 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
        sub_100034E68();
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateWithCacheObject:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)GKLocalPlayerInternal;
  id v4 = a3;
  [(GKLocalPlayerInternal *)&v9 updateWithCacheObject:v4];
  -[GKLocalPlayerInternal setUnderage:](self, "setUnderage:", [v4 isUnderage:v9.receiver super_class]);
  -[GKLocalPlayerInternal setPurpleBuddyAccount:](self, "setPurpleBuddyAccount:", [v4 purpleBuddyAccount]);
  -[GKLocalPlayerInternal setDefaultNickname:](self, "setDefaultNickname:", [v4 defaultNickname]);
  -[GKLocalPlayerInternal setDefaultPrivacyVisibility:](self, "setDefaultPrivacyVisibility:", [v4 defaultPrivacyVisibility]);
  -[GKLocalPlayerInternal setDefaultContactsIntegrationConsent:](self, "setDefaultContactsIntegrationConsent:", [v4 defaultContactsIntegrationConsent]);
  -[GKLocalPlayerInternal setFindable:](self, "setFindable:", [v4 isFindable]);
  id v5 = [v4 friendRequestList];
  id v6 = [v5 entries];
  -[GKLocalPlayerInternal setNumberOfRequests:](self, "setNumberOfRequests:", (unsigned __int16)[v6 count]);

  id v7 = [v4 challengeList];
  id v8 = [v7 entries];
  -[GKLocalPlayerInternal setNumberOfChallenges:](self, "setNumberOfChallenges:", (unsigned __int16)[v8 count]);

  LOWORD(v7) = (unsigned __int16)[v4 numberOfTurns];
  [(GKLocalPlayerInternal *)self setNumberOfTurns:(unsigned __int16)v7];
}

@end