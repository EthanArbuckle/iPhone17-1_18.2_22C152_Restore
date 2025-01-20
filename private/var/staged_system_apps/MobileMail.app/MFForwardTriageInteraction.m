@interface MFForwardTriageInteraction
- (BOOL)includeAttachmentsWithoutPrompting;
- (MFForwardTriageInteraction)init;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (unint64_t)includeAttachmentsByDefault;
- (void)_performInteraction_Internal;
@end

@implementation MFForwardTriageInteraction

- (MFForwardTriageInteraction)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFForwardTriageInteraction;
  v2 = [(MFMessageCompositionTriageInteraction *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MFMessageCompositionTriageInteraction *)v2 setAttachmentPolicy:2];
  }
  return v3;
}

- (void)_performInteraction_Internal
{
  id v8 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  v3 = [(MFMessageCompositionTriageInteraction *)self daemonInterface];
  v4 = [v3 interactionLogger];
  [v4 composeFowardStartedForMessage:v8];

  id v5 = objc_alloc((Class)_MFMailCompositionContext);
  v6 = [(MFMessageCompositionTriageInteraction *)self message];
  id v7 = [v5 initForwardOfMessage:v8 legacyMessage:v6 isEML:[self isActingOnEML]];

  [v7 setPrefersFirstLineSelection:1];
  [(MFMessageCompositionTriageInteraction *)self presentComposeWithContext:v7];
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"FORWARD" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerFoward;
}

- (id)_iconImageName
{
  return MFImageGlyphForwardFill;
}

- (id)_previewImageName
{
  return MFImageGlyphForward;
}

- (unint64_t)includeAttachmentsByDefault
{
  return 0;
}

- (BOOL)includeAttachmentsWithoutPrompting
{
  return 1;
}

@end