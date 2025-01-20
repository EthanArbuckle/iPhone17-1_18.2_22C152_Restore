@interface MFSendAgainTriageInteraction
- (BOOL)includeAttachments;
- (BOOL)isPermitted;
- (MFSendAgainTriageInteraction)init;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)title;
- (void)_performInteraction_Internal;
@end

@implementation MFSendAgainTriageInteraction

- (MFSendAgainTriageInteraction)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFSendAgainTriageInteraction;
  v2 = [(MFMessageCompositionTriageInteraction *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MFMessageCompositionTriageInteraction *)v2 setAttachmentPolicy:1];
  }
  return v3;
}

- (void)_performInteraction_Internal
{
  id v3 = objc_alloc((Class)_MFMailCompositionContext);
  v4 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  objc_super v5 = [(MFMessageCompositionTriageInteraction *)self message];
  id v6 = [v3 initSendAgainDraftOfMessage:v4 legacyMessage:v5];

  [(MFMessageCompositionTriageInteraction *)self presentComposeWithContext:v6];
}

- (BOOL)isPermitted
{
  v2 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  id v3 = [v2 mailboxes];
  unsigned __int8 v4 = [v3 ef_any:&stru_10060D1D0];

  return v4;
}

- (BOOL)includeAttachments
{
  return 1;
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"SEND_AGAIN" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)_iconImageName
{
  return MFImageGlyphSendAgain;
}

- (id)_previewImageName
{
  return MFImageGlyphSendAgain;
}

@end