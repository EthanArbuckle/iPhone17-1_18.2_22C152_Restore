@interface PCDisplayContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)legacyBodyText;
- (NSString)localizedPrimaryAltText;
- (NSString)localizedSecondaryAltText;
- (NSURL)legacyAttachmentURL;
- (PCDisplayContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)interactionBehavior;
- (int64_t)interactionDirection;
- (void)encodeWithCoder:(id)a3;
- (void)setInteractionBehavior:(int64_t)a3;
- (void)setInteractionDirection:(int64_t)a3;
- (void)setLegacyAttachmentURL:(id)a3;
- (void)setLegacyBodyText:(id)a3;
- (void)setLocalizedPrimaryAltText:(id)a3;
- (void)setLocalizedSecondaryAltText:(id)a3;
@end

@implementation PCDisplayContext

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 legacyAttachmentURL];
    legacyAttachmentURL = self->_legacyAttachmentURL;
    v8 = v6;
    v9 = legacyAttachmentURL;
    if (v8 == v9)
    {
    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0)) {
        goto LABEL_22;
      }
      int v11 = [(NSURL *)v8 isEqual:v9];

      if (!v11) {
        goto LABEL_23;
      }
    }
    v13 = [v5 legacyBodyText];
    legacyBodyText = self->_legacyBodyText;
    v8 = v13;
    v15 = legacyBodyText;
    if (v8 == (NSURL *)v15)
    {
    }
    else
    {
      v10 = (NSURL *)v15;
      if ((v8 == 0) == (v15 != 0)) {
        goto LABEL_22;
      }
      int v16 = [(NSURL *)v8 isEqual:v15];

      if (!v16) {
        goto LABEL_23;
      }
    }
    v17 = [v5 localizedPrimaryAltText];
    localizedPrimaryAltText = self->_localizedPrimaryAltText;
    v8 = v17;
    v19 = localizedPrimaryAltText;
    if (v8 == (NSURL *)v19)
    {
    }
    else
    {
      v10 = (NSURL *)v19;
      if ((v8 == 0) == (v19 != 0)) {
        goto LABEL_22;
      }
      int v20 = [(NSURL *)v8 isEqual:v19];

      if (!v20) {
        goto LABEL_23;
      }
    }
    v21 = [v5 localizedSecondaryAltText];
    localizedSecondaryAltText = self->_localizedSecondaryAltText;
    v8 = v21;
    v23 = localizedSecondaryAltText;
    if (v8 == (NSURL *)v23)
    {

LABEL_27:
      if ([v5 interactionBehavior] == self->_interactionBehavior)
      {
        BOOL v12 = [v5 interactionDirection] == self->_interactionDirection;
        goto LABEL_24;
      }
LABEL_23:
      BOOL v12 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v10 = (NSURL *)v23;
    if ((v8 == 0) != (v23 != 0))
    {
      int v24 = [(NSURL *)v8 isEqual:v23];

      if (!v24) {
        goto LABEL_23;
      }
      goto LABEL_27;
    }
LABEL_22:

    goto LABEL_23;
  }
  BOOL v12 = 0;
LABEL_25:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PCDisplayContext);
  [(PCDisplayContext *)v4 setInteractionBehavior:self->_interactionBehavior];
  [(PCDisplayContext *)v4 setInteractionDirection:self->_interactionDirection];
  [(PCDisplayContext *)v4 setLegacyAttachmentURL:self->_legacyAttachmentURL];
  [(PCDisplayContext *)v4 setLegacyBodyText:self->_legacyBodyText];
  [(PCDisplayContext *)v4 setLocalizedPrimaryAltText:self->_localizedPrimaryAltText];
  [(PCDisplayContext *)v4 setLocalizedSecondaryAltText:self->_localizedSecondaryAltText];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t interactionBehavior = self->_interactionBehavior;
  id v11 = v4;
  if (interactionBehavior)
  {
    [v4 encodeInteger:interactionBehavior forKey:@"be"];
    id v4 = v11;
  }
  int64_t interactionDirection = self->_interactionDirection;
  if (interactionDirection)
  {
    [v11 encodeInteger:interactionDirection forKey:@"dir"];
    id v4 = v11;
  }
  legacyAttachmentURL = self->_legacyAttachmentURL;
  if (legacyAttachmentURL)
  {
    [v11 encodeObject:legacyAttachmentURL forKey:@"lu"];
    id v4 = v11;
  }
  legacyBodyText = self->_legacyBodyText;
  if (legacyBodyText)
  {
    [v11 encodeObject:legacyBodyText forKey:@"lb"];
    id v4 = v11;
  }
  localizedPrimaryAltText = self->_localizedPrimaryAltText;
  if (localizedPrimaryAltText)
  {
    [v11 encodeObject:localizedPrimaryAltText forKey:@"prime"];
    id v4 = v11;
  }
  localizedSecondaryAltText = self->_localizedSecondaryAltText;
  if (localizedSecondaryAltText)
  {
    [v11 encodeObject:localizedSecondaryAltText forKey:@"sec"];
    id v4 = v11;
  }
}

- (PCDisplayContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCDisplayContext;
  id v5 = [(PCDisplayContext *)&v9 init];
  if (v5)
  {
    id v6 = v4;
    if ([v6 containsValueForKey:@"be"]) {
      v5->_int64_t interactionBehavior = [v6 decodeIntegerForKey:@"be"];
    }

    id v7 = v6;
    if ([v7 containsValueForKey:@"dir"]) {
      v5->_int64_t interactionDirection = [v7 decodeIntegerForKey:@"dir"];
    }

    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }

  return v5;
}

- (NSURL)legacyAttachmentURL
{
  return self->_legacyAttachmentURL;
}

- (void)setLegacyAttachmentURL:(id)a3
{
}

- (NSString)legacyBodyText
{
  return self->_legacyBodyText;
}

- (void)setLegacyBodyText:(id)a3
{
}

- (NSString)localizedPrimaryAltText
{
  return self->_localizedPrimaryAltText;
}

- (void)setLocalizedPrimaryAltText:(id)a3
{
}

- (NSString)localizedSecondaryAltText
{
  return self->_localizedSecondaryAltText;
}

- (void)setLocalizedSecondaryAltText:(id)a3
{
}

- (int64_t)interactionBehavior
{
  return self->_interactionBehavior;
}

- (void)setInteractionBehavior:(int64_t)a3
{
  self->_int64_t interactionBehavior = a3;
}

- (int64_t)interactionDirection
{
  return self->_interactionDirection;
}

- (void)setInteractionDirection:(int64_t)a3
{
  self->_int64_t interactionDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSecondaryAltText, 0);
  objc_storeStrong((id *)&self->_localizedPrimaryAltText, 0);
  objc_storeStrong((id *)&self->_legacyBodyText, 0);
  objc_storeStrong((id *)&self->_legacyAttachmentURL, 0);
}

@end