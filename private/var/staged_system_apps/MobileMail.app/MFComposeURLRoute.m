@interface MFComposeURLRoute
- (BOOL)canRouteRequest:(id)a3;
- (ComposeCapable)scene;
- (MFComposeURLRoute)initWithScene:(id)a3;
- (MFComposeURLRoute)initWithScene:(id)a3 senderResolver:(id)a4;
- (MFComposeURLRouteSenderResolver)senderResolver;
- (NSString)ef_publicDescription;
- (id)preferredSenderFromMessage:(id)a3;
- (id)routeRequest:(id)a3;
- (int64_t)priority;
- (void)setScene:(id)a3;
- (void)setSenderResolver:(id)a3;
@end

@implementation MFComposeURLRoute

- (MFComposeURLRoute)initWithScene:(id)a3
{
  return [(MFComposeURLRoute *)self initWithScene:a3 senderResolver:self];
}

- (MFComposeURLRoute)initWithScene:(id)a3 senderResolver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MFComposeURLRoute;
  v8 = [(MFComposeURLRoute *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    v9->_priority = 0;
    objc_storeWeak((id *)&v9->_senderResolver, v7);
  }

  return v9;
}

- (BOOL)canRouteRequest:(id)a3
{
  v3 = [a3 URL];
  unsigned __int8 v4 = [v3 ef_hasScheme:EMMailToURLScheme];

  return v4;
}

- (id)routeRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)_MFMailCompositionContext);
  id v6 = [v4 URL];
  id v7 = [v5 initWithURL:v6 composeType:0 originalMessage:0 legacyMessage:0];

  v8 = [v4 sourceMessageListItem];
  v9 = [v8 displayMessage];
  v10 = [v9 resultIfAvailable];

  unsigned __int8 v11 = [v4 isExternal];
  if (v10) {
    char v12 = v11;
  }
  else {
    char v12 = 1;
  }
  if (v12)
  {
    v13 = +[MFURLRoutingRequest log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = [v4 ef_publicDescription];
      sub_10045C500(v14, buf, v13);
    }
  }
  else
  {
    v15 = +[MFURLRoutingRequest log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = [v4 ef_publicDescription];
      sub_10045C558(v16, buf, v15);
    }

    v13 = [(MFComposeURLRoute *)self senderResolver];
    v17 = [v13 preferredSenderFromMessage:v10];
    [v7 setPreferredSendingEmailAddress:v17];
  }
  [v7 setShowKeyboardImmediately:1];
  v18 = +[EFPromise promise];
  v19 = [(MFComposeURLRoute *)self scene];
  v20 = v19;
  if (v19)
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001833B8;
    v25[3] = &unk_100604668;
    id v26 = v19;
    id v27 = v7;
    id v28 = v18;
    v21 = +[EFScheduler mainThreadScheduler];
    [v21 performBlock:v25];

    v22 = v26;
  }
  else
  {
    v22 = +[NSError mf_generalRoutingErrorWithDescription:@"Can't present compose, scene is nil." request:v4];
    [v18 finishWithError:v22];
  }

  v23 = [v18 future];

  return v23;
}

- (id)preferredSenderFromMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(MFComposeURLRoute *)self scene];
  id v6 = [v5 mailboxProvider];
  id v7 = [v4 mailboxObjectIDs];
  v8 = [v7 firstObject];
  v9 = [v6 legacyMailboxForObjectID:v8];

  id v10 = [objc_alloc((Class)MFEMMessageStore) initWithEMMessage:v4 messageClass:objc_opt_class() mailboxUid:v9 skipAttachmentDownload:1];
  unsigned __int8 v11 = [v10 legacyMessage];
  char v12 = [v11 preferredEmailAddressToReplyWith];

  return v12;
}

- (NSString)ef_publicDescription
{
  return +[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (int64_t)priority
{
  return self->_priority;
}

- (ComposeCapable)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (ComposeCapable *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (MFComposeURLRouteSenderResolver)senderResolver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_senderResolver);

  return (MFComposeURLRouteSenderResolver *)WeakRetained;
}

- (void)setSenderResolver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_senderResolver);

  objc_destroyWeak((id *)&self->_scene);
}

@end