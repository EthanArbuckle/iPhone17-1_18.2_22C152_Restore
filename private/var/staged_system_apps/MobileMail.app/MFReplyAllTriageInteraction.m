@interface MFReplyAllTriageInteraction
- (BOOL)isPermitted;
- (MFReplyAllTriageInteraction)init;
- (id)_iconImageName;
- (id)_previewImageName;
- (id)accessibilityIdentifer;
- (id)title;
- (void)_performInteraction_Internal;
@end

@implementation MFReplyAllTriageInteraction

- (MFReplyAllTriageInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFReplyAllTriageInteraction;
  return [(MFReplyTriageInteraction *)&v3 init];
}

- (void)_performInteraction_Internal
{
  id v8 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
  objc_super v3 = [(MFMessageCompositionTriageInteraction *)self daemonInterface];
  v4 = [v3 interactionLogger];
  [v4 composeReplyStartedForMessage:v8];

  id v5 = objc_alloc((Class)_MFMailCompositionContext);
  v6 = [(MFMessageCompositionTriageInteraction *)self message];
  id v7 = [v5 initReplyAllToMessage:v8 legacyMessage:v6 isEML:[self isActingOnEML]];

  [(MFMessageCompositionTriageInteraction *)self presentComposeWithContext:v7];
}

- (BOOL)isPermitted
{
  objc_super v3 = [(MFMessageCompositionTriageInteraction *)self emailMessage];

  if (v3)
  {
    v4 = [(MFMessageCompositionTriageInteraction *)self emailMessage];
    id v5 = +[MFEmailSet set];
    v6 = [v4 toList];
    id v7 = [v6 ef_map:&stru_10060CD50];
    [v5 addObjectsFromArray:v7];

    id v8 = [v4 ccList];
    v9 = [v8 ef_map:&stru_10060CD70];
    [v5 addObjectsFromArray:v9];

    v10 = [v4 senderList];
    v11 = [v10 ef_map:&stru_10060CD90];
    [v5 addObjectsFromArray:v11];

    v12 = +[UIApplication sharedApplication];
    v13 = [v12 accountsProvider];
    v14 = [v4 mailboxes];
    v15 = [v14 firstObject];
    v16 = [v15 account];
    v17 = [v16 objectID];
    v18 = [v13 legacyMailAccountForObjectID:v17];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = +[MailAccount defaultMailAccountForDelivery];
    }
    v23 = v20;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v24 = [v23 emailAddressesAndAliasesList];
    id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v30;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v30 != v26) {
            objc_enumerationMutation(v24);
          }
          [v5 removeObject:*(void *)(*((void *)&v29 + 1) + 8 * i)];
        }
        id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v25);
    }

    unsigned __int8 v22 = [v5 count] != 0;
  }
  else
  {
    v21 = [(MFMessageCompositionTriageInteraction *)self message];
    unsigned __int8 v22 = [v21 canReplyAll];
  }
  return v22;
}

- (id)title
{
  v2 = +[NSBundle mainBundle];
  objc_super v3 = [v2 localizedStringForKey:@"REPLY_ALL" value:&stru_100619928 table:@"Main"];

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerReplyAll;
}

- (id)_iconImageName
{
  return MFImageGlyphReplyAllFill;
}

- (id)_previewImageName
{
  return MFImageGlyphReplyAll;
}

@end