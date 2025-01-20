@interface NCMutableNotificationContent
- (NSString)message;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAttachmentImage:(id)a3;
- (void)setAttributedMessage:(id)a3;
- (void)setCarPlayIcons:(id)a3;
- (void)setCategorySummaryFormat:(id)a3;
- (void)setCommunicationContext:(id)a3;
- (void)setContentType:(id)a3;
- (void)setCustomHeader:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDefaultHeader:(id)a3;
- (void)setFooter:(id)a3;
- (void)setFullScreenIcons:(id)a3;
- (void)setHiddenPreviewsBodyPlaceholder:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIcons:(id)a3;
- (void)setMessage:(id)a3;
- (void)setSpotlightIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryArgument:(id)a3;
- (void)setSummaryArgumentCount:(unint64_t)a3;
- (void)setThreadSummary:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NCMutableNotificationContent

- (void)setContentType:(id)a3
{
  self->super._contentType = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setCustomHeader:(id)a3
{
  self->super._customHeader = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setDefaultHeader:(id)a3
{
  self->super._defaultHeader = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setTitle:(id)a3
{
  self->super._title = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSubtitle:(id)a3
{
  self->super._subtitle = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setMessage:(id)a3
{
  objc_msgSend(MEMORY[0x263F086A0], "nc_safeAttributedStringWithString:", a3);
  self->super._attributedMessage = (NSAttributedString *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x270F9A758]();
}

- (NSString)message
{
  return [(NSAttributedString *)self->super._attributedMessage string];
}

- (void)setAttributedMessage:(id)a3
{
  self->super._attributedMessage = (NSAttributedString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSummary:(id)a3
{
  self->super._summary = (NSAttributedString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setThreadSummary:(id)a3
{
  self->super._threadSummary = (NSAttributedString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSpotlightIdentifier:(id)a3
{
  self->super._spotlightIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setFooter:(id)a3
{
  self->super._footer = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setHiddenPreviewsBodyPlaceholder:(id)a3
{
  self->super._hiddenPreviewsBodyPlaceholder = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setCategorySummaryFormat:(id)a3
{
  self->super._categorySummaryFormat = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setCommunicationContext:(id)a3
{
  self->super._communicationContext = (_UNNotificationCommunicationContext *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIcon:(id)a3
{
  v8[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v8[0] = v4;
    v6 = [MEMORY[0x263EFF9D0] null];
    v8[1] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    [(NCMutableNotificationContent *)self setIcons:v7];
  }
  else
  {
    [(NCMutableNotificationContent *)self setIcons:0];
  }
}

- (void)setIcons:(id)a3
{
}

- (void)setCarPlayIcons:(id)a3
{
}

- (void)setFullScreenIcons:(id)a3
{
}

- (void)setAttachmentImage:(id)a3
{
}

- (void)setDate:(id)a3
{
}

- (void)setDateAllDay:(BOOL)a3
{
  self->super._dateAllDay = a3;
}

- (void)setTimeZone:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [NCNotificationContent alloc];

  return [(NCNotificationContent *)v4 initWithNotificationContent:self];
}

- (void)setSummaryArgument:(id)a3
{
  self->super._summaryArgument = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSummaryArgumentCount:(unint64_t)a3
{
  self->super._summaryArgumentCount = a3;
}

@end