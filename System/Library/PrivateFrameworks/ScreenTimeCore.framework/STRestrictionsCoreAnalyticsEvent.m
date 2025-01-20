@interface STRestrictionsCoreAnalyticsEvent
+ (id)description;
- (BOOL)contentAndPrivacyRestrictionsEnabled;
- (BOOL)gameCenterAddingFriendsIsRestricted;
- (BOOL)gameCenterAvatarAndNicknameChangesIsRestricted;
- (BOOL)gameCenterConnectWithFriendsIsRestricted;
- (BOOL)gameCenterMultiplayerGamesIsRestricted;
- (BOOL)gameCenterNearbyMultiplayerIsRestricted;
- (BOOL)gameCenterPrivateMessagingIsRestricted;
- (BOOL)gameCenterProfilePrivacyChangesIsRestricted;
- (BOOL)gameCenterScreenRecordingIsRestricted;
- (BOOL)mediaAndAppleMusicIsRestricted;
- (BOOL)userIsManaged;
- (NSDictionary)payload;
- (NSString)name;
- (STRestrictionsCoreAnalyticsEvent)initWithContentAndPrivacyRestrictionsEnabled:(BOOL)a3 mediaAndAppleMusicIsRestricted:(BOOL)a4 gameCenterMultiplayerGamesIsRestricted:(BOOL)a5 gameCenterAddingFriendsIsRestricted:(BOOL)a6 gameCenterConnectWithFriendsIsRestricted:(BOOL)a7 gameCenterScreenRecordingIsRestricted:(BOOL)a8 gameCenterNearbyMultiplayerIsRestricted:(BOOL)a9 gameCenterPrivateMessagingIsRestricted:(BOOL)a10 gameCenterProfilePrivacyChangesIsRestricted:(BOOL)a11 gameCenterAvatarAndNicknameChangesIsRestricted:(BOOL)a12 userAgeGroup:(int64_t)a13 userIsManaged:(BOOL)a14;
- (int64_t)userAgeGroup;
@end

@implementation STRestrictionsCoreAnalyticsEvent

- (STRestrictionsCoreAnalyticsEvent)initWithContentAndPrivacyRestrictionsEnabled:(BOOL)a3 mediaAndAppleMusicIsRestricted:(BOOL)a4 gameCenterMultiplayerGamesIsRestricted:(BOOL)a5 gameCenterAddingFriendsIsRestricted:(BOOL)a6 gameCenterConnectWithFriendsIsRestricted:(BOOL)a7 gameCenterScreenRecordingIsRestricted:(BOOL)a8 gameCenterNearbyMultiplayerIsRestricted:(BOOL)a9 gameCenterPrivateMessagingIsRestricted:(BOOL)a10 gameCenterProfilePrivacyChangesIsRestricted:(BOOL)a11 gameCenterAvatarAndNicknameChangesIsRestricted:(BOOL)a12 userAgeGroup:(int64_t)a13 userIsManaged:(BOOL)a14
{
  v21.receiver = self;
  v21.super_class = (Class)STRestrictionsCoreAnalyticsEvent;
  result = [(STRestrictionsCoreAnalyticsEvent *)&v21 init];
  result->_contentAndPrivacyRestrictionsEnabled = a3;
  result->_mediaAndAppleMusicIsRestricted = a4;
  result->_gameCenterMultiplayerGamesIsRestricted = a5;
  result->_gameCenterAddingFriendsIsRestricted = a6;
  result->_gameCenterConnectWithFriendsIsRestricted = a7;
  result->_gameCenterScreenRecordingIsRestricted = a8;
  result->_gameCenterNearbyMultiplayerIsRestricted = a9;
  result->_gameCenterPrivateMessagingIsRestricted = a10;
  result->_gameCenterProfilePrivacyChangesIsRestricted = a11;
  result->_gameCenterAvatarAndNicknameChangesIsRestricted = a12;
  result->_userAgeGroup = a13;
  result->_userIsManaged = a14;
  return result;
}

- (NSString)name
{
  return (NSString *)@"com.apple.ScreenTime.contentAndPrivacyRestrictionsChanged";
}

+ (id)description
{
  return @"ContentAndPrivacyRestrictionsChanged";
}

- (NSDictionary)payload
{
  v18[12] = *MEMORY[0x1E4F143B8];
  v17[0] = @"contentAndPrivacyRestrictionsEnabled";
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent contentAndPrivacyRestrictionsEnabled](self, "contentAndPrivacyRestrictionsEnabled"));
  v18[0] = v16;
  v17[1] = @"mediaAndAppleMusicIsRestricted";
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent mediaAndAppleMusicIsRestricted](self, "mediaAndAppleMusicIsRestricted"));
  v18[1] = v15;
  v17[2] = @"gameCenterMultiplayerGamesIsRestricted";
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterMultiplayerGamesIsRestricted](self, "gameCenterMultiplayerGamesIsRestricted"));
  v18[2] = v14;
  v17[3] = @"gameCenterAddingFriendsIsRestricted";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterAddingFriendsIsRestricted](self, "gameCenterAddingFriendsIsRestricted"));
  v18[3] = v3;
  v17[4] = @"gameCenterConnectWithFriendsIsRestricted";
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterConnectWithFriendsIsRestricted](self, "gameCenterConnectWithFriendsIsRestricted"));
  v18[4] = v4;
  v17[5] = @"gameCenterScreenRecordingIsRestricted";
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterScreenRecordingIsRestricted](self, "gameCenterScreenRecordingIsRestricted"));
  v18[5] = v5;
  v17[6] = @"gameCenterNearbyMultiplayerIsRestricted";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterNearbyMultiplayerIsRestricted](self, "gameCenterNearbyMultiplayerIsRestricted"));
  v18[6] = v6;
  v17[7] = @"gameCenterPrivateMessagingIsRestricted";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterPrivateMessagingIsRestricted](self, "gameCenterPrivateMessagingIsRestricted"));
  v18[7] = v7;
  v17[8] = @"gameCenterProfilePrivacyChangesIsRestricted";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterProfilePrivacyChangesIsRestricted](self, "gameCenterProfilePrivacyChangesIsRestricted"));
  v18[8] = v8;
  v17[9] = @"gameCenterAvatarAndNicknameChangesIsRestricted";
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent gameCenterAvatarAndNicknameChangesIsRestricted](self, "gameCenterAvatarAndNicknameChangesIsRestricted"));
  v18[9] = v9;
  v17[10] = @"userAgeGroup";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[STRestrictionsCoreAnalyticsEvent userAgeGroup](self, "userAgeGroup"));
  v18[10] = v10;
  v17[11] = @"userIsManaged";
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[STRestrictionsCoreAnalyticsEvent userIsManaged](self, "userIsManaged"));
  v18[11] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:12];

  return (NSDictionary *)v12;
}

- (BOOL)contentAndPrivacyRestrictionsEnabled
{
  return self->_contentAndPrivacyRestrictionsEnabled;
}

- (BOOL)mediaAndAppleMusicIsRestricted
{
  return self->_mediaAndAppleMusicIsRestricted;
}

- (BOOL)gameCenterMultiplayerGamesIsRestricted
{
  return self->_gameCenterMultiplayerGamesIsRestricted;
}

- (BOOL)gameCenterAddingFriendsIsRestricted
{
  return self->_gameCenterAddingFriendsIsRestricted;
}

- (BOOL)gameCenterConnectWithFriendsIsRestricted
{
  return self->_gameCenterConnectWithFriendsIsRestricted;
}

- (BOOL)gameCenterScreenRecordingIsRestricted
{
  return self->_gameCenterScreenRecordingIsRestricted;
}

- (BOOL)gameCenterNearbyMultiplayerIsRestricted
{
  return self->_gameCenterNearbyMultiplayerIsRestricted;
}

- (BOOL)gameCenterPrivateMessagingIsRestricted
{
  return self->_gameCenterPrivateMessagingIsRestricted;
}

- (BOOL)gameCenterProfilePrivacyChangesIsRestricted
{
  return self->_gameCenterProfilePrivacyChangesIsRestricted;
}

- (BOOL)gameCenterAvatarAndNicknameChangesIsRestricted
{
  return self->_gameCenterAvatarAndNicknameChangesIsRestricted;
}

- (int64_t)userAgeGroup
{
  return self->_userAgeGroup;
}

- (BOOL)userIsManaged
{
  return self->_userIsManaged;
}

@end