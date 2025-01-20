@interface SFNotificationInfo
+ (BOOL)supportsSecureCoding;
- (NSString)body;
- (NSString)header;
- (NSString)title;
- (NSURL)attachmentURL;
- (SFNotificationError)error;
- (SFNotificationInfo)initWithCoder:(id)a3;
- (SFNotificationInfo)mediumBubbleVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)homePodType;
- (unsigned)deviceClass;
- (unsigned)interactionBehavior;
- (unsigned)interactionDirection;
- (unsigned)notificationType;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachmentURL:(id)a3;
- (void)setBody:(id)a3;
- (void)setDeviceClass:(unsigned __int8)a3;
- (void)setError:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHomePodType:(unint64_t)a3;
- (void)setInteractionBehavior:(unsigned __int8)a3;
- (void)setInteractionDirection:(unsigned __int8)a3;
- (void)setNotificationType:(unsigned int)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFNotificationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = [(SFNotificationInfo *)self attachmentURL];
    v6 = (void *)[v5 copy];
    [v4 setAttachmentURL:v6];

    v7 = [(SFNotificationInfo *)self body];
    v8 = (void *)[v7 copy];
    [v4 setBody:v8];

    objc_msgSend(v4, "setDeviceClass:", -[SFNotificationInfo deviceClass](self, "deviceClass"));
    v9 = [(SFNotificationInfo *)self error];
    v10 = (void *)[v9 copy];
    [v4 setError:v10];

    v11 = [(SFNotificationInfo *)self header];
    v12 = (void *)[v11 copy];
    [v4 setHeader:v12];

    objc_msgSend(v4, "setInteractionBehavior:", -[SFNotificationInfo interactionBehavior](self, "interactionBehavior"));
    objc_msgSend(v4, "setInteractionDirection:", -[SFNotificationInfo interactionDirection](self, "interactionDirection"));
    objc_msgSend(v4, "setNotificationType:", -[SFNotificationInfo notificationType](self, "notificationType"));
    v13 = [(SFNotificationInfo *)self title];
    v14 = (void *)[v13 copy];
    [v4 setTitle:v14];

    objc_msgSend(v4, "setHomePodType:", -[SFNotificationInfo homePodType](self, "homePodType"));
  }
  return v4;
}

- (SFNotificationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFNotificationInfo;
  v5 = [(SFNotificationInfo *)&v12 init];
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v13 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_deviceClass = v13;
    }
    objc_opt_class();
    NSDecodeObjectIfPresent();
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    uint64_t v13 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_interactionBehavior = v13;
    }
    uint64_t v13 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_interactionDirection = v13;
    }
    uint64_t v13 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_notificationType = v13;
    }
    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    if ([v9 containsValueForKey:@"homePodType"]) {
      v5->_homePodType = [v9 decodeIntegerForKey:@"homePodType"];
    }

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  attachmentURL = self->_attachmentURL;
  id v12 = v4;
  if (attachmentURL)
  {
    [v4 encodeObject:attachmentURL forKey:@"url"];
    id v4 = v12;
  }
  body = self->_body;
  if (body)
  {
    [v12 encodeObject:body forKey:@"bod"];
    id v4 = v12;
  }
  if (self->_deviceClass)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    id v4 = v12;
  }
  error = self->_error;
  if (error)
  {
    [v12 encodeObject:error forKey:@"er"];
    id v4 = v12;
  }
  header = self->_header;
  if (header)
  {
    [v12 encodeObject:header forKey:@"hea"];
    id v4 = v12;
  }
  if (self->_interactionBehavior)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    id v4 = v12;
  }
  if (self->_interactionDirection)
  {
    objc_msgSend(v12, "encodeInteger:forKey:");
    id v4 = v12;
  }
  uint64_t notificationType = self->_notificationType;
  if (notificationType)
  {
    [v12 encodeInt64:notificationType forKey:@"nt"];
    id v4 = v12;
  }
  title = self->_title;
  if (title)
  {
    [v12 encodeObject:title forKey:@"tit"];
    id v4 = v12;
  }
  unint64_t homePodType = self->_homePodType;
  if (homePodType)
  {
    [v12 encodeInteger:homePodType forKey:@"homePodType"];
    id v4 = v12;
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"SFNotificationInfo"];
  id v4 = v3;
  if (self->_body) {
    [v3 appendFormat:@", b=%@", self->_body];
  }
  if (self->_header) {
    [v4 appendFormat:@", h=%@", self->_header];
  }
  if (self->_title) {
    [v4 appendFormat:@", t=%@", self->_title];
  }
  unint64_t deviceClass = (char)self->_deviceClass;
  if (deviceClass > 8) {
    id v6 = "?";
  }
  else {
    id v6 = off_1E5BBFD38[deviceClass];
  }
  [v4 appendFormat:@", d=%s", v6];
  if (self->_attachmentURL) {
    [v4 appendFormat:@", u=%@", self->_attachmentURL];
  }
  int interactionDirection = self->_interactionDirection;
  id v8 = @"?";
  id v9 = @"Push";
  if (interactionDirection != 2) {
    id v9 = @"?";
  }
  if (interactionDirection == 1) {
    v10 = @"Pull";
  }
  else {
    v10 = v9;
  }
  [v4 appendFormat:@", %@", v10];
  unsigned int v11 = self->_interactionBehavior - 1;
  if (v11 <= 2) {
    id v8 = off_1E5BBFD80[(char)v11];
  }
  [v4 appendFormat:@", %@", v8];
  if (self->_error) {
    [v4 appendFormat:@", e=%@", self->_error];
  }
  if (self->_homePodType) {
    [v4 appendFormat:@", e=%lx", self->_homePodType];
  }

  return v4;
}

- (SFNotificationInfo)mediumBubbleVersion
{
  v3 = self->_cachedMediumBubbleVersion;
  if (!v3)
  {
    if (SFDeviceClassCodeGet_sOnce != -1) {
      dispatch_once(&SFDeviceClassCodeGet_sOnce, &__block_literal_global_36);
    }
    int v4 = SFDeviceClassCodeGet_sResult;
    if (SFDeviceClassCodeGet_sResult == 1)
    {
      CFStringRef v5 = @"HOMEPOD_HANDOFF_MEDIUM_BODY_IPHONE";
    }
    else
    {
      if (SFDeviceClassCodeGet_sResult != 2)
      {
        v3 = 0;
        id v6 = &stru_1EF9BDC68;
LABEL_18:

        goto LABEL_19;
      }
      CFStringRef v5 = @"HOMEPOD_HANDOFF_MEDIUM_BODY_IPOD";
    }
    SFLocalizedStringForKey(v5);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int interactionDirection = self->_interactionDirection;
    if (interactionDirection == 2)
    {
      CFStringRef v8 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFER";
    }
    else
    {
      if (interactionDirection != 1)
      {
        v3 = 0;
        id v9 = &stru_1EF9BDC68;
LABEL_17:

        goto LABEL_18;
      }
      if (v4 == 1) {
        CFStringRef v8 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFER_IPHONE";
      }
      else {
        CFStringRef v8 = @"HOMEPOD_HANDOFF_SUBTITLE_TRANSFER_IPOD";
      }
    }
    SFLocalizedStringForKey(v8);
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(SFNotificationInfo);
    [(SFNotificationInfo *)v10 setBody:v6];
    [(SFNotificationInfo *)v10 setTitle:v9];
    unsigned int v11 = SFLocalizedStringForKey(@"HOMEPOD_HANDOFF_HEADER_DEFAULT");
    [(SFNotificationInfo *)v10 setHeader:v11];

    [(SFNotificationInfo *)v10 setInteractionBehavior:self->_interactionBehavior];
    [(SFNotificationInfo *)v10 setInteractionDirection:self->_interactionDirection];
    [(SFNotificationInfo *)v10 setNotificationType:self->_notificationType];
    [(SFNotificationInfo *)v10 setHomePodType:self->_homePodType];
    cachedMediumBubbleVersion = self->_cachedMediumBubbleVersion;
    self->_cachedMediumBubbleVersion = v10;
    uint64_t v13 = v10;

    v3 = self->_cachedMediumBubbleVersion;
    goto LABEL_17;
  }
LABEL_19:

  return v3;
}

- (NSURL)attachmentURL
{
  return self->_attachmentURL;
}

- (void)setAttachmentURL:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unsigned __int8)a3
{
  self->_unint64_t deviceClass = a3;
}

- (SFNotificationError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (unsigned)interactionBehavior
{
  return self->_interactionBehavior;
}

- (void)setInteractionBehavior:(unsigned __int8)a3
{
  self->_interactionBehavior = a3;
}

- (unsigned)interactionDirection
{
  return self->_interactionDirection;
}

- (void)setInteractionDirection:(unsigned __int8)a3
{
  self->_int interactionDirection = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)homePodType
{
  return self->_homePodType;
}

- (void)setHomePodType:(unint64_t)a3
{
  self->_unint64_t homePodType = a3;
}

- (unsigned)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(unsigned int)a3
{
  self->_uint64_t notificationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_attachmentURL, 0);

  objc_storeStrong((id *)&self->_cachedMediumBubbleVersion, 0);
}

@end