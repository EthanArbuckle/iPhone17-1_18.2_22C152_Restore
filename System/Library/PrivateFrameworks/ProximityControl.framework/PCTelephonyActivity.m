@interface PCTelephonyActivity
- (BOOL)hostedOnCurrentDevice;
- (BOOL)hostedOnCurrentDeviceIsValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)isVideo;
- (PCTelephonyActivity)initWithActivity:(id)a3;
- (PCTelephonyActivity)initWithCallUUID:(id)a3 conversationUUID:(id)a4 isVideo:(BOOL)a5 service:(int)a6;
- (id)bundleIdentifier;
- (id)callImage;
- (id)callUUID;
- (id)contactIdentifier;
- (id)conversationUUID;
- (id)dateConnected;
- (id)description;
- (id)displayName;
- (id)image;
- (id)initFromKnownCall:(id)a3;
- (id)initFromKnownConversation:(id)a3;
- (id)initFromSensitiveCall:(id)a3;
- (id)initFromSensitiveConversation:(id)a3;
- (id)title;
- (int)service;
- (unint64_t)pcactivityType;
@end

@implementation PCTelephonyActivity

- (PCTelephonyActivity)initWithCallUUID:(id)a3 conversationUUID:(id)a4 isVideo:(BOOL)a5 service:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PCTelephonyActivity;
  v12 = [(PCTelephonyActivity *)&v19 initWithActivityType:@"com.apple.ProximityControl.activity.call"];
  v13 = v12;
  if (v12)
  {
    makeIneligibleForProcessing(v12);
    id v14 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v15 = v14;
    if (v10) {
      [v14 setObject:v10 forKey:@"callUUID"];
    }
    if (v11) {
      [v15 setObject:v11 forKey:@"conversationUUID"];
    }
    v16 = [NSNumber numberWithInt:v6];
    [v15 setObject:v16 forKey:@"service"];

    v17 = (void *)[v15 copy];
    [(PCTelephonyActivity *)v13 setUserInfo:v17];

    v13->_hostedOnCurrentDeviceIsValid = 0;
    v13->_hostedOnCurrentDevice = 0;
    v13->_isVideo = a5;
  }
  return v13;
}

- (id)initFromSensitiveCall:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PCTelephonyActivity;
  v5 = [(PCTelephonyActivity *)&v17 initWithActivityType:@"com.apple.ProximityControl.activity.call"];
  uint64_t v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = [v4 callUUID];
    [v7 setObject:v8 forKey:@"callUUID"];

    v9 = [MEMORY[0x263F7E1A0] sharedInstance];
    id v10 = [v9 activeConversationForCall:v4];

    if (v10)
    {
      id v11 = [v10 UUID];
      [v7 setObject:v11 forKey:@"conversationUUID"];
    }
    v12 = [v4 sourceIdentifier];

    if (v12)
    {
      v13 = [v4 sourceIdentifier];
      [v7 setObject:v13 forKey:@"sourceAppID"];
    }
    if ([v4 service])
    {
      id v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "service"));
      [v7 setObject:v14 forKey:@"service"];
    }
    v15 = (void *)[v7 copy];
    [(PCTelephonyActivity *)v6 setUserInfo:v15];

    v6->_hostedOnCurrentDeviceIsValid = 0;
    v6->_hostedOnCurrentDevice = 0;
    v6->_isVideo = [v4 isVideo];
  }
  return v6;
}

- (id)initFromKnownCall:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PCTelephonyActivity;
  v5 = [(PCTelephonyActivity *)&v26 initWithActivityType:@"com.apple.ProximityControl.activity.call"];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_20;
  }
  makeIneligibleForProcessing(v5);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [v4 callUUID];
  [v7 setObject:v8 forKey:@"callUUID"];

  v9 = [MEMORY[0x263F7E1A0] sharedInstance];
  id v10 = [v9 activeConversationForCall:v4];

  if (v10)
  {
    id v11 = [v10 UUID];
    [v7 setObject:v11 forKey:@"conversationUUID"];
  }
  v12 = [v4 sourceIdentifier];

  if (v12)
  {
    v13 = [v4 sourceIdentifier];
    [v7 setObject:v13 forKey:@"sourceAppID"];
  }
  id v14 = [v4 dateConnected];

  if (v14)
  {
    v15 = [v4 dateConnected];
    [v7 setObject:v15 forKey:@"dateCon"];
  }
  if ([v4 service])
  {
    v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "service"));
    [v7 setObject:v16 forKey:@"service"];
  }
  objc_super v17 = [v4 suggestedDisplayName];

  if (v17)
  {
    uint64_t v18 = [v4 suggestedDisplayName];
LABEL_16:
    v21 = (void *)v18;
    [v7 setObject:v18 forKey:@"displayName"];

    goto LABEL_17;
  }
  objc_super v19 = [v4 displayName];

  if (v19)
  {
    uint64_t v18 = [v4 displayName];
    goto LABEL_16;
  }
  v20 = [v4 displayFirstName];

  if (v20)
  {
    uint64_t v18 = [v4 displayFirstName];
    goto LABEL_16;
  }
LABEL_17:
  v22 = [v4 contactIdentifiers];
  v23 = [v22 firstObject];

  if (v23) {
    [v7 setObject:v23 forKey:@"contactID"];
  }

  v24 = (void *)[v7 copy];
  [(PCTelephonyActivity *)v6 setUserInfo:v24];

  v6->_hostedOnCurrentDeviceIsValid = 1;
  v6->_hostedOnCurrentDevice = [v4 isHostedOnCurrentDevice];
  v6->_isVideo = [v4 isVideo];

LABEL_20:
  return v6;
}

- (id)initFromSensitiveConversation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PCTelephonyActivity;
  v5 = [(PCTelephonyActivity *)&v14 initWithActivityType:@"com.apple.ProximityControl.activity.call"];
  uint64_t v6 = v5;
  if (v5)
  {
    makeIneligibleForProcessing(v5);
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = [v4 UUID];
    [v7 setObject:v8 forKey:@"conversationUUID"];

    v9 = [v4 bundleIdentifier];

    if (v9) {
      [v7 setObject:*MEMORY[0x263F7E2B8] forKey:@"sourceAppID"];
    }
    uint64_t v10 = [v4 resolvedAudioVideoMode];
    if (v10 == 1)
    {
      id v11 = &unk_26CD954A0;
    }
    else
    {
      if (v10 != 2)
      {
LABEL_9:
        v12 = (void *)[v7 copy];
        [(PCTelephonyActivity *)v6 setUserInfo:v12];

        v6->_hostedOnCurrentDeviceIsValid = 0;
        v6->_hostedOnCurrentDevice = 0;
        v6->_isVideo = [v4 resolvedAudioVideoMode] == 3;

        goto LABEL_10;
      }
      id v11 = &unk_26CD954B8;
    }
    [v7 setObject:v11 forKey:@"service"];
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (id)initFromKnownConversation:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PCTelephonyActivity;
  v5 = [(PCTelephonyActivity *)&v16 initWithActivityType:@"com.apple.ProximityControl.activity.call"];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_12;
  }
  makeIneligibleForProcessing(v5);
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v8 = [v4 UUID];
  [v7 setObject:v8 forKey:@"conversationUUID"];

  v9 = [v4 bundleIdentifier];

  if (v9) {
    [v7 setObject:*MEMORY[0x263F7E2B8] forKey:@"sourceAppID"];
  }
  uint64_t v10 = [v4 resolvedAudioVideoMode];
  if (v10 == 1)
  {
    id v11 = &unk_26CD954A0;
    goto LABEL_8;
  }
  if (v10 == 2)
  {
    id v11 = &unk_26CD954B8;
LABEL_8:
    [v7 setObject:v11 forKey:@"service"];
  }
  v12 = [v4 displayName];
  if (v12) {
    [v7 setObject:v12 forKey:@"displayName"];
  }

  v13 = (void *)[v7 copy];
  [(PCTelephonyActivity *)v6 setUserInfo:v13];

  v6->_hostedOnCurrentDeviceIsValid = 1;
  objc_super v14 = [v4 presentationContext];
  v6->_hostedOnCurrentDevice = [v14 mode] == 2;

  v6->_isVideo = [v4 resolvedAudioVideoMode] == 3;
LABEL_12:

  return v6;
}

- (PCTelephonyActivity)initWithActivity:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityType];
  int v6 = [@"com.apple.ProximityControl.activity.call" isEqualToString:v5];

  if (v6)
  {
    id v7 = [v4 activityType];
    v12.receiver = self;
    v12.super_class = (Class)PCTelephonyActivity;
    v8 = [(PCTelephonyActivity *)&v12 initWithActivityType:v7];

    if (v8)
    {
      makeIneligibleForProcessing(v8);
      v9 = [v4 userInfo];
      [(PCTelephonyActivity *)v8 setUserInfo:v9];
    }
    self = v8;
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)title
{
  int v2 = [(PCTelephonyActivity *)self service];
  uint64_t v3 = 2;
  if (v2 == 2) {
    uint64_t v3 = 4;
  }
  if (v2 == 3) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = v3;
  }
  return +[PCLocalizedString localizedStringForKey:v4];
}

- (id)description
{
  uint64_t v3 = [(PCTelephonyActivity *)self displayName];
  uint64_t v4 = [(PCTelephonyActivity *)self dateConnected];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    int v6 = [MEMORY[0x263EFF910] date];
    [v6 timeIntervalSinceDate:v5];
    id v7 = +[PCActivityUtility formattedDurationFor:](PCActivityUtility, "formattedDurationFor:");

    v8 = [NSString stringWithFormat:@"%@ - %@", v3, v7];
  }
  else
  {
    v8 = [(PCTelephonyActivity *)self title];
  }

  return v8;
}

- (BOOL)isValid
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(PCTelephonyActivity *)self userInfo];
  v5 = [v4 allKeys];
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (id)dateConnected
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];

  if (v3)
  {
    uint64_t v4 = [(PCTelephonyActivity *)self userInfo];
    v5 = [v4 objectForKey:@"dateCon"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)displayName
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];

  if (v3)
  {
    uint64_t v4 = [(PCTelephonyActivity *)self userInfo];
    v5 = [v4 objectForKey:@"displayName"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)callUUID
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];

  if (v3)
  {
    uint64_t v4 = [(PCTelephonyActivity *)self userInfo];
    v5 = [v4 objectForKey:@"callUUID"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)conversationUUID
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];

  if (v3)
  {
    uint64_t v4 = [(PCTelephonyActivity *)self userInfo];
    v5 = [v4 objectForKey:@"conversationUUID"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)contactIdentifier
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];

  if (v3)
  {
    uint64_t v4 = [(PCTelephonyActivity *)self userInfo];
    v5 = [v4 objectForKey:@"contactID"];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)callImage
{
  v27[2] = *MEMORY[0x263EF8340];
  callImage = self->_callImage;
  if (!callImage)
  {
    v24 = [MEMORY[0x263F7E1A0] sharedInstance];
    uint64_t v4 = [v24 contactStore];
    v5 = [MEMORY[0x263EFEBA0] descriptorForRequiredKeys];
    uint64_t v6 = *MEMORY[0x263EFDFF8];
    v27[0] = v5;
    v27[1] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:2];

    v8 = [(PCTelephonyActivity *)self contactIdentifier];
    id v25 = 0;
    v9 = [v4 unifiedContactWithIdentifier:v8 keysToFetch:v7 error:&v25];
    id v10 = v25;

    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = (id)objc_opt_new();
    }
    objc_super v12 = v11;
    id v13 = objc_alloc(MEMORY[0x263EFEBA0]);
    objc_super v14 = [MEMORY[0x263EFEBA8] defaultSettings];
    v15 = (void *)[v13 initWithSettings:v14];

    objc_super v16 = (void *)MEMORY[0x263EFEBB0];
    objc_super v17 = [MEMORY[0x263F1C920] mainScreen];
    [v17 scale];
    objc_super v19 = objc_msgSend(v16, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, 44.0, 44.0, v18);

    objc_super v26 = v12;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    v21 = [v15 avatarImageForContacts:v20 scope:v19];
    v22 = self->_callImage;
    self->_callImage = v21;

    callImage = self->_callImage;
  }
  return callImage;
}

- (BOOL)hostedOnCurrentDeviceIsValid
{
  return self->_hostedOnCurrentDeviceIsValid;
}

- (BOOL)hostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (int)service
{
  int v2 = [(PCTelephonyActivity *)self userInfo];
  uint64_t v3 = [v2 objectForKey:@"service"];

  if (!v3) {
    return 0;
  }
  int v4 = [v3 integerValue];

  return v4;
}

- (unint64_t)pcactivityType
{
  return 0;
}

- (id)bundleIdentifier
{
  uint64_t v3 = [(PCTelephonyActivity *)self userInfo];
  int v4 = [v3 objectForKey:@"sourceAppID"];

  if (!v4)
  {
    v5 = [(PCTelephonyActivity *)self userInfo];
    uint64_t v6 = [v5 objectForKey:@"service"];

    int v4 = @"com.apple.mobilephone";
    if (v6 && [v6 integerValue] == 3) {
      int v4 = @"com.apple.facetime";
    }
  }
  return v4;
}

- (id)image
{
  int v2 = [(PCTelephonyActivity *)self bundleIdentifier];
  uint64_t v3 = +[PCActivityUtility iconForBundleIdentifier:v2];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 pcactivityType];
  if (v5 == [(PCTelephonyActivity *)self pcactivityType])
  {
    uint64_t v6 = [v4 dateConnected];
    id v7 = [(PCTelephonyActivity *)self dateConnected];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end