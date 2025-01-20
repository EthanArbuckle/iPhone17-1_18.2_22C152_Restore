@interface NTPBUserOnboardingScreenView
- (BOOL)fromPersonalizeNews;
- (BOOL)hasChannelPickerPresentationReason;
- (BOOL)hasCountOfNotificationsSelected;
- (BOOL)hasFromPersonalizeNews;
- (BOOL)hasOnboardingScreenType;
- (BOOL)hasPreviouslyCompletedOnboardingOsVersion;
- (BOOL)hasReferringSourceApplication;
- (BOOL)hasReferringUrl;
- (BOOL)hasUserAction;
- (BOOL)hasUserActivityType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)referringSourceApplication;
- (NSString)referringUrl;
- (NSString)userActivityType;
- (id)channelPickerPresentationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsChannelPickerPresentationReason:(id)a3;
- (int)channelPickerPresentationReason;
- (int)countOfNotificationsSelected;
- (int)onboardingScreenType;
- (int)previouslyCompletedOnboardingOsVersion;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setChannelPickerPresentationReason:(int)a3;
- (void)setCountOfNotificationsSelected:(int)a3;
- (void)setFromPersonalizeNews:(BOOL)a3;
- (void)setHasChannelPickerPresentationReason:(BOOL)a3;
- (void)setHasCountOfNotificationsSelected:(BOOL)a3;
- (void)setHasFromPersonalizeNews:(BOOL)a3;
- (void)setHasOnboardingScreenType:(BOOL)a3;
- (void)setHasPreviouslyCompletedOnboardingOsVersion:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setOnboardingScreenType:(int)a3;
- (void)setPreviouslyCompletedOnboardingOsVersion:(int)a3;
- (void)setReferringSourceApplication:(id)a3;
- (void)setReferringUrl:(id)a3;
- (void)setUserAction:(int)a3;
- (void)setUserActivityType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserOnboardingScreenView

- (int)onboardingScreenType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_onboardingScreenType;
  }
  else {
    return 0;
  }
}

- (void)setOnboardingScreenType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_onboardingScreenType = a3;
}

- (void)setHasOnboardingScreenType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOnboardingScreenType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (int)userAction
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasUserAction
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setCountOfNotificationsSelected:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_countOfNotificationsSelected = a3;
}

- (void)setHasCountOfNotificationsSelected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCountOfNotificationsSelected
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)previouslyCompletedOnboardingOsVersion
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_previouslyCompletedOnboardingOsVersion;
  }
  else {
    return 0;
  }
}

- (void)setPreviouslyCompletedOnboardingOsVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_previouslyCompletedOnboardingOsVersion = a3;
}

- (void)setHasPreviouslyCompletedOnboardingOsVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreviouslyCompletedOnboardingOsVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFromPersonalizeNews:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_fromPersonalizeNews = a3;
}

- (void)setHasFromPersonalizeNews:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFromPersonalizeNews
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)channelPickerPresentationReason
{
  if (*(unsigned char *)&self->_has) {
    return self->_channelPickerPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setChannelPickerPresentationReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_channelPickerPresentationReason = a3;
}

- (void)setHasChannelPickerPresentationReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasChannelPickerPresentationReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)channelPickerPresentationReasonAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C3A8[a3];
  }

  return v3;
}

- (int)StringAsChannelPickerPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CHANNEL_PICKER_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PICK_FAVORITES_FOR_YOU_CHANNEL_PICKER_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PICK_FAVORITES_FAVORITES_CHANNEL_PICKER_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserOnboardingScreenView;
  int v4 = [(NTPBUserOnboardingScreenView *)&v8 description];
  v5 = [(NTPBUserOnboardingScreenView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = [NSNumber numberWithInt:self->_onboardingScreenType];
    [v3 setObject:v4 forKey:@"onboarding_screen_type"];
  }
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication) {
    [v3 setObject:referringSourceApplication forKey:@"referring_source_application"];
  }
  referringUrl = self->_referringUrl;
  if (referringUrl) {
    [v3 setObject:referringUrl forKey:@"referring_url"];
  }
  userActivityType = self->_userActivityType;
  if (userActivityType) {
    [v3 setObject:userActivityType forKey:@"user_activity_type"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v9 forKey:@"user_action"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v10 = [NSNumber numberWithInt:self->_countOfNotificationsSelected];
  [v3 setObject:v10 forKey:@"count_of_notifications_selected"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
LABEL_18:
    v12 = [NSNumber numberWithBool:self->_fromPersonalizeNews];
    [v3 setObject:v12 forKey:@"from_personalize_news"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_23;
    }
LABEL_19:
    uint64_t channelPickerPresentationReason = self->_channelPickerPresentationReason;
    if (channelPickerPresentationReason >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_channelPickerPresentationReason);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_26444C3A8[channelPickerPresentationReason];
    }
    [v3 setObject:v14 forKey:@"channel_picker_presentation_reason"];

    goto LABEL_23;
  }
LABEL_17:
  v11 = [NSNumber numberWithInt:self->_previouslyCompletedOnboardingOsVersion];
  [v3 setObject:v11 forKey:@"previously_completed_onboarding_os_version"];

  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if (has) {
    goto LABEL_19;
  }
LABEL_23:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserOnboardingScreenViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_referringSourceApplication) {
    PBDataWriterWriteStringField();
  }
  if (self->_referringUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_userActivityType) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  if (*(unsigned char *)&self->_has) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_onboardingScreenType;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_referringSourceApplication copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_referringUrl copyWithZone:a3];
  v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_userActivityType copyWithZone:a3];
  v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_userAction;
    *(unsigned char *)(v6 + 60) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 12) = self->_countOfNotificationsSelected;
  *(unsigned char *)(v6 + 60) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(unsigned char *)(v6 + 56) = self->_fromPersonalizeNews;
    *(unsigned char *)(v6 + 60) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(_DWORD *)(v6 + 20) = self->_previouslyCompletedOnboardingOsVersion;
  *(unsigned char *)(v6 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if (has)
  {
LABEL_8:
    *(_DWORD *)(v6 + 8) = self->_channelPickerPresentationReason;
    *(unsigned char *)(v6 + 60) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_onboardingScreenType != *((_DWORD *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_40;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((void *)v4 + 3)
    && !-[NSString isEqual:](referringSourceApplication, "isEqual:"))
  {
    goto LABEL_40;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:")) {
      goto LABEL_40;
    }
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_userAction != *((_DWORD *)v4 + 10)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_countOfNotificationsSelected != *((_DWORD *)v4 + 3)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_previouslyCompletedOnboardingOsVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
    {
      if (self->_fromPersonalizeNews)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_40;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_36;
      }
    }
LABEL_40:
    BOOL v8 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 60) & 0x20) != 0) {
    goto LABEL_40;
  }
LABEL_36:
  BOOL v8 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_channelPickerPresentationReason != *((_DWORD *)v4 + 2)) {
      goto LABEL_40;
    }
    BOOL v8 = 1;
  }
LABEL_41:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_onboardingScreenType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_referringSourceApplication hash];
  NSUInteger v5 = [(NSString *)self->_referringUrl hash];
  NSUInteger v6 = [(NSString *)self->_userActivityType hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v7 = 2654435761 * self->_userAction;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_countOfNotificationsSelected;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_previouslyCompletedOnboardingOsVersion;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v10 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_12:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_fromPersonalizeNews;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_channelPickerPresentationReason;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    self->_onboardingScreenType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBUserOnboardingScreenView setReferringSourceApplication:](self, "setReferringSourceApplication:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBUserOnboardingScreenView setReferringUrl:](self, "setReferringUrl:");
    id v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBUserOnboardingScreenView setUserActivityType:](self, "setUserActivityType:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 0x10) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_countOfNotificationsSelected = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_previouslyCompletedOnboardingOsVersion = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_21:
  self->_fromPersonalizeNews = *((unsigned char *)v4 + 56);
  *(unsigned char *)&self->_has |= 0x20u;
  if (*((unsigned char *)v4 + 60))
  {
LABEL_14:
    self->_uint64_t channelPickerPresentationReason = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_15:
}

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
}

- (int)countOfNotificationsSelected
{
  return self->_countOfNotificationsSelected;
}

- (BOOL)fromPersonalizeNews
{
  return self->_fromPersonalizeNews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);

  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
}

@end