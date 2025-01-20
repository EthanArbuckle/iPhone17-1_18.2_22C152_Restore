@interface MFReplyTriageInteraction
- (BOOL)includeAttachmentsWithoutPrompting;
- (MFReplyTriageInteraction)init;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (unint64_t)includeAttachmentsByDefault;
- (void)_performInteraction_Internal;
@end

@implementation MFReplyTriageInteraction

- (MFReplyTriageInteraction)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFReplyTriageInteraction;
  v2 = [(MFMessageCompositionTriageInteraction *)&v6 init];
  if (v2)
  {
    v3 = sub_100216908(0);
    unsigned int v4 = [v3 isEqualToString:IncludeAttachmentRepliesWhenAdding];

    if (v4) {
      [(MFMessageCompositionTriageInteraction *)v2 setAttachmentPolicy:0];
    }
  }
  return v2;
}

- (void)_performInteraction_Internal
{
  id v8 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  v3 = [(MFMessageCompositionTriageInteraction *)self daemonInterface];
  unsigned int v4 = [v3 interactionLogger];
  [v4 composeReplyStartedForMessage:v8];

  id v5 = objc_alloc((Class)_MFMailCompositionContext);
  objc_super v6 = [(MFMessageCompositionTriageInteraction *)self message];
  id v7 = [v5 initReplyToMessage:v8 legacyMessage:v6 isEML:[self isActingOnEML]];

  [(MFMessageCompositionTriageInteraction *)self presentComposeWithContext:v7];
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"REPLY" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerReply;
}

- (id)_iconImageName
{
  return MFImageGlyphReplyFill;
}

- (id)_previewImageName
{
  return MFImageGlyphReply;
}

- (unint64_t)includeAttachmentsByDefault
{
  v2 = sub_100216908(0);
  if ([v2 isEqualToString:IncludeAttachmentRepliesAlways])
  {
    unint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:IncludeAttachmentRepliesNever])
  {
    unint64_t v3 = 1;
  }
  else
  {
    unint64_t v3 = [v2 isEqualToString:IncludeAttachmentRepliesWhenAdding];
  }

  return v3;
}

- (BOOL)includeAttachmentsWithoutPrompting
{
  v2 = sub_100216908(0);
  if ([v2 isEqualToString:IncludeAttachmentRepliesAlways]) {
    unsigned __int8 v3 = 1;
  }
  else {
    unsigned __int8 v3 = [v2 isEqualToString:IncludeAttachmentRepliesAsk];
  }

  return v3;
}

@end