@interface PCDisambiguationContext
+ (BOOL)supportsSecureCoding;
- (PCActivity)activity;
- (PCDeviceIdentifier)deviceIdentifier;
- (PCDisambiguationContext)initWithCoder:(id)a3;
- (PCDisambiguationContext)initWithIdentifier:(id)a3 direction:(int64_t)a4 activityData:(id)a5;
- (PCHomeKitIdentifier)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)leadingImage;
- (id)subtitleText;
- (id)titleText;
- (int64_t)interactionDirection;
- (void)cacheActivityData:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PCDisambiguationContext

- (PCDisambiguationContext)initWithIdentifier:(id)a3 direction:(int64_t)a4 activityData:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PCDisambiguationContext;
  v11 = [(PCDisambiguationContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_deviceIdentifier, a3);
    v12->_interactionDirection = a4;
    [(PCDisambiguationContext *)v12 cacheActivityData:v10];
  }

  return v12;
}

- (void)cacheActivityData:(id)a3
{
  v4 = (NSData *)[a3 copy];
  activityData = self->_activityData;
  self->_activityData = v4;

  id v8 = (id)[objc_alloc(MEMORY[0x263F08D38]) _initWithUserActivityData:self->_activityData];
  v6 = +[PCActivityUtility activityFrom:v8];
  activity = self->_activity;
  self->_activity = v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [PCDisambiguationContext alloc];
  deviceIdentifier = self->_deviceIdentifier;
  int64_t interactionDirection = self->_interactionDirection;
  activityData = self->_activityData;
  return [(PCDisambiguationContext *)v4 initWithIdentifier:deviceIdentifier direction:interactionDirection activityData:activityData];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  deviceIdentifier = self->_deviceIdentifier;
  id v8 = v4;
  if (deviceIdentifier)
  {
    [v4 encodeObject:deviceIdentifier forKey:@"did"];
    id v4 = v8;
  }
  int64_t interactionDirection = self->_interactionDirection;
  if (interactionDirection)
  {
    [v8 encodeInteger:interactionDirection forKey:@"id"];
    id v4 = v8;
  }
  activityData = self->_activityData;
  if (activityData)
  {
    [v8 encodeObject:activityData forKey:@"act"];
    id v4 = v8;
  }
}

- (PCDisambiguationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCDisambiguationContext;
  id v9 = 0;
  v5 = [(PCDisambiguationContext *)&v8 init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    if ([v6 containsValueForKey:@"id"]) {
      v5->_int64_t interactionDirection = [v6 decodeIntegerForKey:@"id"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    [(PCDisambiguationContext *)v5 cacheActivityData:v9];
  }

  return v5;
}

- (id)titleText
{
  if ([(PCDisambiguationContext *)self interactionDirection] == 2)
  {
    v3 = +[PCLocalizedString localizedStringForKey:13];
    id v4 = (id)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v3];
LABEL_5:

    goto LABEL_7;
  }
  if ([(PCDisambiguationContext *)self interactionDirection] == 1)
  {
    v3 = +[PCLocalizedString localizedStringForKey:12];
    v5 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v3];
    id v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"iphone"];
    v7 = [MEMORY[0x263F1C550] systemBlueColor];
    objc_super v8 = [v6 imageWithTintColor:v7];

    id v9 = objc_alloc_init(MEMORY[0x263F1C370]);
    [v9 setImage:v8];
    id v10 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v9];
    id v11 = objc_alloc_init(MEMORY[0x263F089B8]);
    [v11 appendAttributedString:v10];
    [v11 appendAttributedString:v5];
    id v4 = (id)[v11 copy];

    goto LABEL_5;
  }
  id v4 = objc_alloc_init(MEMORY[0x263F086A0]);
LABEL_7:
  return v4;
}

- (id)subtitleText
{
  if ([(PCDisambiguationContext *)self interactionDirection] == 2) {
    goto LABEL_2;
  }
  v3 = [(PCDisambiguationContext *)self activity];

  if (v3)
  {
    id v4 = [(PCDisambiguationContext *)self activity];
    uint64_t v5 = [v4 pcactivityType];

    if (v5)
    {
      if (v5 != 1)
      {
LABEL_2:
        v3 = 0;
        goto LABEL_9;
      }
      id v6 = [(PCDisambiguationContext *)self activity];
      uint64_t v7 = [v6 shortDescription];
    }
    else
    {
      id v6 = [(PCDisambiguationContext *)self activity];
      uint64_t v7 = [v6 description];
    }
    v3 = (void *)v7;
  }
LABEL_9:
  return v3;
}

- (id)leadingImage
{
  v3 = [(PCDisambiguationContext *)self activity];

  if (!v3)
  {
    id v14 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    goto LABEL_14;
  }
  id v4 = (void *)MEMORY[0x263F1C6C8];
  uint64_t v5 = [MEMORY[0x263F1C658] systemFontOfSize:26.0];
  id v6 = [v4 configurationWithFont:v5];

  uint64_t v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"iphone.and.arrow.forward" withConfiguration:v6];
  objc_super v8 = [MEMORY[0x263F1C550] systemBlueColor];
  id v9 = [v7 imageWithTintColor:v8];

  id v10 = [(PCDisambiguationContext *)self activity];
  uint64_t v11 = [v10 pcactivityType];

  v12 = [(PCDisambiguationContext *)self activity];
  v13 = v12;
  if (v11 == 1)
  {
    if ([v12 direction] == 2)
    {
      id v14 = v9;
    }
    else
    {
      v17 = [(PCDisambiguationContext *)self activity];
      id v14 = +[PCActivityUtility disambiguationButtonImageForActivity:v17];
    }
    goto LABEL_13;
  }
  uint64_t v15 = [v12 pcactivityType];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F1C6B0]);
  }
  else
  {
    if ([(PCDisambiguationContext *)self interactionDirection] != 2)
    {
      v19 = [(PCDisambiguationContext *)self activity];
      id v14 = +[PCActivityUtility disambiguationButtonImageForActivity:v19];

      goto LABEL_13;
    }
    id v16 = v9;
  }
  id v14 = v16;
LABEL_13:

LABEL_14:
  return v14;
}

- (PCHomeKitIdentifier)identifier
{
  return self->_identifier;
}

- (PCDeviceIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)interactionDirection
{
  return self->_interactionDirection;
}

- (PCActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityData, 0);
}

@end