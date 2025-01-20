@interface SLDHighlightDisambiguationPillSlotTag
+ (id)tagForHighlightAttribution:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isGroupConversation;
- (BOOL)isPinned;
- (NSNumber)otherRecipientCount;
- (NSNumber)widthNumber;
- (NSString)groupDisplayName;
- (SLDHighlightDisambiguationPillSlotTag)initWithCoder:(id)a3;
- (SLDHighlightDisambiguationPillSlotTag)initWithHighlightAttribution:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5;
- (SLPerson)sender;
- (double)maxWidth;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolvedStyleForStyle:(id)a3;
- (unint64_t)hash;
- (unint64_t)variant;
- (void)encodeWithCoder:(id)a3;
- (void)setFromMe:(BOOL)a3;
- (void)setGroupDisplayName:(id)a3;
- (void)setIsGroupConversation:(BOOL)a3;
- (void)setMaxWidth:(double)a3;
- (void)setOtherRecipientCount:(id)a3;
- (void)setPinned:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setVariant:(unint64_t)a3;
- (void)setWidthNumber:(id)a3;
@end

@implementation SLDHighlightDisambiguationPillSlotTag

+ (id)tagForHighlightAttribution:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5
{
  id v7 = a3;
  v8 = [[SLDHighlightDisambiguationPillSlotTag alloc] initWithHighlightAttribution:v7 maxWidth:a5 variant:a4];

  return v8;
}

- (SLDHighlightDisambiguationPillSlotTag)initWithHighlightAttribution:(id)a3 maxWidth:(double)a4 variant:(unint64_t)a5
{
  id v8 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SLDHighlightDisambiguationPillSlotTag;
  v9 = [(SLDHighlightDisambiguationPillSlotTag *)&v27 init];
  v11 = v9;
  if (v9)
  {
    v9->_maxWidth = a4;
    *(float *)&double v10 = a4;
    uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithFloat:v10];
    widthNumber = v11->_widthNumber;
    v11->_widthNumber = (NSNumber *)v12;

    v11->_variant = a5;
    uint64_t v14 = [v8 sender];
    sender = v11->_sender;
    v11->_sender = (SLPerson *)v14;

    v11->_fromMe = [v8 isFromMe];
    int v16 = [v8 isGroupConversation];
    v11->_isGroupConversation = v16;
    if (!v16)
    {
      v21 = SLDaemonLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[SLDHighlightDisambiguationPillSlotTag initWithHighlightAttribution:maxWidth:variant:]((uint64_t)v11, v8, v21);
      }
      goto LABEL_10;
    }
    v17 = [v8 groupDisplayName];
    uint64_t v18 = [v17 length];

    if (v18)
    {
      uint64_t v19 = [v8 groupDisplayName];
      uint64_t v20 = 40;
    }
    else
    {
      v22 = [v8 relatedPersons];
      unint64_t v23 = [v22 count];

      if (v23 < 3)
      {
        v21 = SLDaemonLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[SLDHighlightDisambiguationPillSlotTag initWithHighlightAttribution:maxWidth:variant:]((uint64_t)v11, v8, v21);
        }
        goto LABEL_10;
      }
      v24 = [v8 relatedPersons];
      uint64_t v25 = [v24 count] - 2;

      uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v25];
      uint64_t v20 = 48;
    }
    v21 = *(NSObject **)((char *)&v11->super.super.super.isa + v20);
    *(Class *)((char *)&v11->super.super.super.isa + v20) = (Class)v19;
LABEL_10:
  }
  return v11;
}

- (id)description
{
  v3 = NSString;
  v4 = [(SLDHighlightDisambiguationPillSlotTag *)self widthNumber];
  v5 = [v3 stringWithFormat:@"<SLDHighlightDisambiguationPillSlotTag: %p> maxWidth:[%@]", self, v4];

  return v5;
}

- (id)resolvedStyleForStyle:(id)a3
{
  v15 = (void *)MEMORY[0x1E4FB3490];
  id v3 = a3;
  uint64_t v4 = [v3 accessibilityButtonShapes];
  uint64_t v5 = [v3 accessibilityContrast];
  uint64_t v6 = [v3 displayScale];
  uint64_t v7 = [v3 layoutDirection];
  id v8 = [v3 localization];
  uint64_t v9 = [v3 preferredContentSizeCategory];
  CGColorRef ConstantColor = CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB68]);
  uint64_t v11 = [v3 userInterfaceIdiom];
  uint64_t v12 = [v3 userInterfaceStyle];

  v13 = [v15 slotStyleWithAccessibilityButtonShapes:v4 accessibilityContrast:v5 displayRange:1 displayScale:v6 layoutDirection:v7 legibilityWeight:0 localization:v8 preferredContentSizeCategory:v9 tintColor:ConstantColor userInterfaceIdiom:v11 userInterfaceStyle:v12];

  return v13;
}

- (SLDHighlightDisambiguationPillSlotTag)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SLDHighlightDisambiguationPillSlotTag;
  uint64_t v5 = [(SLDHighlightDisambiguationPillSlotTag *)&v16 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"maxWidth"];
    v5->_maxWidth = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maxWidthNumber"];
    widthNumber = v5->_widthNumber;
    v5->_widthNumber = (NSNumber *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sender"];
    sender = v5->_sender;
    v5->_sender = (SLPerson *)v9;

    v5->_isGroupConversation = [v4 decodeBoolForKey:@"isGroup"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    groupDisplayName = v5->_groupDisplayName;
    v5->_groupDisplayName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientCount"];
    otherRecipientCount = v5->_otherRecipientCount;
    v5->_otherRecipientCount = (NSNumber *)v13;

    v5->_variant = [v4 decodeIntegerForKey:@"variant"];
    v5->_pinned = [v4 decodeBoolForKey:@"pinned"];
    v5->_fromMe = [v4 decodeBoolForKey:@"fromMe"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  [(SLDHighlightDisambiguationPillSlotTag *)self maxWidth];
  objc_msgSend(v8, "encodeDouble:forKey:", @"maxWidth");
  id v4 = [(SLDHighlightDisambiguationPillSlotTag *)self widthNumber];
  [v8 encodeObject:v4 forKey:@"maxWidthNumber"];

  uint64_t v5 = [(SLDHighlightDisambiguationPillSlotTag *)self sender];
  [v8 encodeObject:v5 forKey:@"sender"];

  objc_msgSend(v8, "encodeBool:forKey:", -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](self, "isGroupConversation"), @"isGroup");
  double v6 = [(SLDHighlightDisambiguationPillSlotTag *)self groupDisplayName];
  [v8 encodeObject:v6 forKey:@"groupName"];

  uint64_t v7 = [(SLDHighlightDisambiguationPillSlotTag *)self otherRecipientCount];
  [v8 encodeObject:v7 forKey:@"recipientCount"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[SLDHighlightDisambiguationPillSlotTag variant](self, "variant"), @"variant");
  objc_msgSend(v8, "encodeBool:forKey:", -[SLDHighlightDisambiguationPillSlotTag isPinned](self, "isPinned"), @"pinned");
  objc_msgSend(v8, "encodeBool:forKey:", -[SLDHighlightDisambiguationPillSlotTag isFromMe](self, "isFromMe"), @"fromMe");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(SLDHighlightDisambiguationPillSlotTag *)self maxWidth];
  objc_msgSend(v4, "setMaxWidth:");
  uint64_t v5 = [(SLDHighlightDisambiguationPillSlotTag *)self widthNumber];
  [v4 setWidthNumber:v5];

  double v6 = [(SLDHighlightDisambiguationPillSlotTag *)self sender];
  [v4 setSender:v6];

  objc_msgSend(v4, "setIsGroupConversation:", -[SLDHighlightDisambiguationPillSlotTag isGroupConversation](self, "isGroupConversation"));
  uint64_t v7 = [(SLDHighlightDisambiguationPillSlotTag *)self groupDisplayName];
  [v4 setGroupDisplayName:v7];

  id v8 = [(SLDHighlightDisambiguationPillSlotTag *)self otherRecipientCount];
  [v4 setOtherRecipientCount:v8];

  objc_msgSend(v4, "setVariant:", -[SLDHighlightDisambiguationPillSlotTag variant](self, "variant"));
  objc_msgSend(v4, "setPinned:", -[SLDHighlightDisambiguationPillSlotTag isPinned](self, "isPinned"));
  objc_msgSend(v4, "setFromMe:", -[SLDHighlightDisambiguationPillSlotTag isFromMe](self, "isFromMe"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v6 = (SLDHighlightDisambiguationPillSlotTag *)v5;
    uint64_t v7 = v6;
    if (v6 == self)
    {
      BOOL v15 = 1;
LABEL_28:

      goto LABEL_29;
    }
    [(SLDHighlightDisambiguationPillSlotTag *)v6 maxWidth];
    double v9 = v8;
    [(SLDHighlightDisambiguationPillSlotTag *)self maxWidth];
    if (SL_CGFloatApproximatelyEqualToFloat(v9, v10))
    {
      uint64_t v11 = [(SLDHighlightDisambiguationPillSlotTag *)self sender];
      if (v11
        || ([(SLDHighlightDisambiguationPillSlotTag *)v7 sender],
            (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v12 = [(SLDHighlightDisambiguationPillSlotTag *)self sender];
        uint64_t v13 = [(SLDHighlightDisambiguationPillSlotTag *)v7 sender];
        int v14 = [v12 isEqual:v13];

        if (v11)
        {

          if (!v14) {
            goto LABEL_27;
          }
        }
        else
        {

          if ((v14 & 1) == 0) {
            goto LABEL_27;
          }
        }
      }
      BOOL v16 = [(SLDHighlightDisambiguationPillSlotTag *)self isGroupConversation];
      if (v16 == [(SLDHighlightDisambiguationPillSlotTag *)v7 isGroupConversation])
      {
        v17 = [(SLDHighlightDisambiguationPillSlotTag *)self groupDisplayName];
        if (v17
          || ([(SLDHighlightDisambiguationPillSlotTag *)v7 groupDisplayName],
              (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v18 = [(SLDHighlightDisambiguationPillSlotTag *)self groupDisplayName];
          uint64_t v19 = [(SLDHighlightDisambiguationPillSlotTag *)v7 groupDisplayName];
          int v20 = [v18 isEqualToString:v19];

          if (v17)
          {

            if (!v20) {
              goto LABEL_27;
            }
          }
          else
          {

            if ((v20 & 1) == 0) {
              goto LABEL_27;
            }
          }
        }
        v21 = [(SLDHighlightDisambiguationPillSlotTag *)self otherRecipientCount];
        if (!v21)
        {
          id v3 = [(SLDHighlightDisambiguationPillSlotTag *)v7 otherRecipientCount];
          if (!v3) {
            goto LABEL_25;
          }
        }
        v22 = [(SLDHighlightDisambiguationPillSlotTag *)self otherRecipientCount];
        unint64_t v23 = [(SLDHighlightDisambiguationPillSlotTag *)v7 otherRecipientCount];
        int v24 = [v22 isEqualToNumber:v23];

        if (v21)
        {

          if (!v24) {
            goto LABEL_27;
          }
LABEL_25:
          BOOL v25 = [(SLDHighlightDisambiguationPillSlotTag *)self isPinned];
          if (v25 == [(SLDHighlightDisambiguationPillSlotTag *)v7 isPinned])
          {
            BOOL v26 = [(SLDHighlightDisambiguationPillSlotTag *)self isFromMe];
            if (v26 == [(SLDHighlightDisambiguationPillSlotTag *)v7 isFromMe])
            {
              unint64_t v28 = [(SLDHighlightDisambiguationPillSlotTag *)self variant];
              BOOL v15 = v28 == [(SLDHighlightDisambiguationPillSlotTag *)v7 variant];
              goto LABEL_28;
            }
          }
          goto LABEL_27;
        }

        if (v24) {
          goto LABEL_25;
        }
      }
    }
LABEL_27:
    BOOL v15 = 0;
    goto LABEL_28;
  }
  BOOL v15 = 0;
LABEL_29:

  return v15;
}

- (unint64_t)hash
{
  BOOL v15 = [(SLDHighlightDisambiguationPillSlotTag *)self isPinned];
  BOOL v14 = [(SLDHighlightDisambiguationPillSlotTag *)self isFromMe];
  id v3 = [(SLDHighlightDisambiguationPillSlotTag *)self widthNumber];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLDHighlightDisambiguationPillSlotTag *)self sender];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [(SLDHighlightDisambiguationPillSlotTag *)self isGroupConversation];
  double v8 = [(SLDHighlightDisambiguationPillSlotTag *)self groupDisplayName];
  uint64_t v9 = [v8 hash];
  double v10 = [(SLDHighlightDisambiguationPillSlotTag *)self otherRecipientCount];
  uint64_t v11 = [v10 hash];
  unint64_t v12 = v4 ^ v6 ^ v7 ^ v14 ^ v15 ^ v9 ^ v11 ^ [(SLDHighlightDisambiguationPillSlotTag *)self variant];

  return v12;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (SLPerson)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (void)setIsGroupConversation:(BOOL)a3
{
  self->_isGroupConversation = a3;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (void)setGroupDisplayName:(id)a3
{
}

- (NSNumber)otherRecipientCount
{
  return self->_otherRecipientCount;
}

- (void)setOtherRecipientCount:(id)a3
{
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (void)setFromMe:(BOOL)a3
{
  self->_fromMe = a3;
}

- (NSNumber)widthNumber
{
  return self->_widthNumber;
}

- (void)setWidthNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthNumber, 0);
  objc_storeStrong((id *)&self->_otherRecipientCount, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

- (void)initWithHighlightAttribution:(uint64_t)a1 maxWidth:(void *)a2 variant:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 uniqueIdentifier];
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "[SLDHighlightDisambiguationPillSlotTag: %p] Initialized with an attribution (%@) for a group conversation without a display name, and with less than 3 related persons!", v5, 0x16u);
}

- (void)initWithHighlightAttribution:(uint64_t)a1 maxWidth:(void *)a2 variant:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 uniqueIdentifier];
  OUTLINED_FUNCTION_0_2();
  _os_log_debug_impl(&dword_19BE17000, a3, OS_LOG_TYPE_DEBUG, "[SLDHighlightDisambiguationPillSlotTag: %p] SLAttribuition is not set as a group conversation: %@", v5, 0x16u);
}

@end