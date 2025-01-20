@interface ICInlineAttachmentView(Accessibility_iOS)
- (id)supportedRotorTypes;
- (uint64_t)textRangeInNote;
- (void)supportedRotorTypes;
@end

@implementation ICInlineAttachmentView(Accessibility_iOS)

- (uint64_t)textRangeInNote
{
  v1 = [a1 textAttachment];
  v2 = [v1 attachment];

  v3 = [v2 note];
  uint64_t v4 = [v3 rangeForAttachment:v2];

  return v4;
}

- (id)supportedRotorTypes
{
  v9[1] = *MEMORY[0x263EF8340];
  v1 = [a1 textAttachment];
  v2 = [v1 attachment];

  if ([v2 isMentionAttachment])
  {
    v9[0] = @"ICAccessibilityRotorTypeMentions";
    v3 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v4 = (__CFString **)v9;
LABEL_5:
    v5 = [v3 arrayWithObjects:v4 count:1];
    goto LABEL_9;
  }
  if ([v2 isHashtagAttachment])
  {
    v8 = @"ICAccessibilityRotorTypeTags";
    v3 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v4 = &v8;
    goto LABEL_5;
  }
  v6 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ICInlineAttachmentView(Accessibility_iOS) supportedRotorTypes](v6);
  }

  v5 = (void *)MEMORY[0x263EFFA68];
LABEL_9:

  return v5;
}

- (void)supportedRotorTypes
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Unsupported inline attachment type for the accessibility rotor", v1, 2u);
}

@end