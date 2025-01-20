@interface CKAssistantUIIntentViewController
+ (void)connectIfNeeded;
- (BOOL)displaysMessage;
- (CGSize)desiredSize;
- (CKAssistantUIChatController)chatController;
- (CKAssistantUIContentView)snippetContentView;
- (void)_configureSnippetContentViewWithChatAndContactsForAvatarView;
- (void)_configureSnippetContentViewWithToField:(id)a3 contactsForAvatarView:(id)a4 messageContent:(id)a5 sent:(BOOL)a6;
- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6;
- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5;
- (void)desiresInteractivity:(id)a3;
- (void)setChatController:(id)a3;
- (void)setSnippetContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation CKAssistantUIIntentViewController

+ (void)connectIfNeeded
{
  if (qword_10000D068 != -1) {
    dispatch_once(&qword_10000D068, &stru_100008288);
  }
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKAssistantUIIntentViewController;
  [(CKAssistantUIIntentViewController *)&v5 viewDidLayoutSubviews];
  snippetContentView = self->_snippetContentView;
  if (snippetContentView)
  {
    v4 = [(CKAssistantUIIntentViewController *)self view];
    [v4 bounds];
    -[CKAssistantUIContentView setFrame:](snippetContentView, "setFrame:");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKAssistantUIIntentViewController;
  [(CKAssistantUIIntentViewController *)&v5 viewDidAppear:a3];
  v4 = [(CKAssistantUIIntentViewController *)self chatController];

  if (!v4) {
    [(CKAssistantUIIntentViewController *)self _configureSnippetContentViewWithChatAndContactsForAvatarView];
  }
}

- (BOOL)displaysMessage
{
  return 1;
}

- (void)desiresInteractivity:(id)a3
{
}

- (void)configureViewForParameters:(id)a3 ofInteraction:(id)a4 context:(unint64_t)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  v11 = +[INParameter parameterForClass:objc_opt_class() keyPath:@"recipients"];
  v12 = +[INParameter parameterForClass:objc_opt_class() keyPath:@"content"];
  v13 = +[INParameter parameterForClass:objc_opt_class() keyPath:@"speakableGroupName"];
  v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, 0);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100003DF0;
  v17[3] = &unk_1000082B0;
  id v18 = v14;
  id v19 = v9;
  id v15 = v14;
  id v16 = v9;
  [(CKAssistantUIIntentViewController *)self configureWithInteraction:v10 context:a5 completion:v17];
}

- (void)configureWithInteraction:(id)a3 context:(unint64_t)a4 completion:(id)a5
{
  id v6 = a3;
  v7 = (void (**)(void))a5;
  v8 = [v6 intent];
  v29 = [v6 intentResponse];
  id v9 = +[NSMutableArray array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (IMGetDomainBoolForKey())
    {
      p_configuredIntent = &self->_configuredIntent;
      objc_storeStrong((id *)&self->_configuredIntent, v8);
      v11 = [(INSendMessageIntent *)self->_configuredIntent recipients];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v31;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(v11);
            }
            id v15 = [*(id *)(*((void *)&v30 + 1) + 8 * i) displayName];
            [v9 addObject:v15];
          }
          id v12 = [v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v12);
      }
      id v16 = [(INSendMessageIntent *)*p_configuredIntent speakableGroupName];
      v17 = [v16 spokenPhrase];

      uint64_t v18 = [(INSendMessageIntent *)*p_configuredIntent content];
      id v19 = (void *)v18;
      v20 = &stru_100008390;
      if (v18) {
        v20 = (__CFString *)v18;
      }
      v21 = v20;

      BOOL v22 = v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v29 code] == (id)3;
      if (v17)
      {
        v26 = +[NSString stringWithFormat:@"%@", v17];
      }
      else
      {
        v27 = [v9 componentsJoinedByString:@", "];
        v26 = +[NSString stringWithFormat:@"%@", v27];
      }
      [(CKAssistantUIIntentViewController *)self _configureSnippetContentViewWithToField:v26 contactsForAvatarView:0 messageContent:v21 sent:v22];
      [(CKAssistantUIContentView *)self->_snippetContentView setNeedsLayout];
      if (v7)
      {
        [(CKAssistantUIIntentViewController *)self desiredSize];
        v7[2](v7);
      }

      goto LABEL_34;
    }
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = +[NSUserDefaults standardUserDefaults];
        *(_DWORD *)buf = 138412290;
        v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "EnableEnhancedSiriUI not enabled, not using Assistant UI extension : %@", buf, 0xCu);
      }
    }
    if (v7) {
LABEL_20:
    }
      ((void (*)(void (**)(void), CGFloat, CGFloat))v7[2])(v7, CGSizeZero.width, CGSizeZero.height);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Unhandled intent: %@, not using Assistant UI extension", buf, 0xCu);
      }
    }
    if (v7) {
      goto LABEL_20;
    }
  }
LABEL_34:
}

- (CGSize)desiredSize
{
  v3 = [(CKAssistantUIIntentViewController *)self extensionContext];
  [v3 hostedViewMaximumAllowedSize];
  double v5 = v4;
  double v7 = v6;

  snippetContentView = self->_snippetContentView;

  -[CKAssistantUIContentView sizeThatFits:](snippetContentView, "sizeThatFits:", v5, v7);
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)_configureSnippetContentViewWithToField:(id)a3 contactsForAvatarView:(id)a4 messageContent:(id)a5 sent:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  snippetContentView = self->_snippetContentView;
  if (!snippetContentView)
  {
    uint64_t v13 = -[CKAssistantUIContentView initWithFrame:]([CKAssistantUIContentView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v14 = self->_snippetContentView;
    self->_snippetContentView = v13;

    id v15 = [(CKAssistantUIIntentViewController *)self view];
    [v15 addSubview:self->_snippetContentView];

    snippetContentView = self->_snippetContentView;
  }
  [(CKAssistantUIContentView *)snippetContentView setToFieldText:v16];
  [(CKAssistantUIContentView *)self->_snippetContentView setContactsForAvatarView:v10];
  [(CKAssistantUIContentView *)self->_snippetContentView setMessageContent:v11 sent:v6];
}

- (void)_configureSnippetContentViewWithChatAndContactsForAvatarView
{
  if (self->_snippetContentView)
  {
    v3 = +[NSMutableArray array];
    double v4 = +[NSMutableArray array];
    [(INSendMessageIntent *)self->_configuredIntent recipients];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v38;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v38 != v7) {
            objc_enumerationMutation(v5);
          }
          double v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          id v10 = [v9 customIdentifier];

          if (v10)
          {
            id v11 = [v9 customIdentifier];
            [v3 addObject:v11];
          }
          id v12 = [v9 contactIdentifier];

          if (v12)
          {
            uint64_t v13 = [v9 contactIdentifier];
            [v4 addObject:v13];
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v6);
    }

    [(id)objc_opt_class() connectIfNeeded];
    v34 = [(INSendMessageIntent *)self->_configuredIntent conversationIdentifier];
    v14 = +[IMChatRegistry sharedRegistry];
    id v15 = v14;
    if (v34) {
      [v14 existingChatWithChatIdentifier:v34];
    }
    else {
    v35 = [v14 existingChatForAddresses:v3 allowRetargeting:0 bestHandles:0];
    }

    if (v35) {
      goto LABEL_21;
    }
    if ([v3 count] != (id)1) {
      goto LABEL_26;
    }
    v21 = +[IMChatRegistry sharedRegistry];
    BOOL v22 = [v3 firstObject];
    v35 = [v21 existingChatWithChatIdentifier:v22];

    if (v35)
    {
LABEL_21:
      id v17 = [objc_alloc((Class)CKConversation) initWithChat:v35];
      uint64_t v18 = v17;
      if (v17)
      {
        id v19 = [v17 displayName];
        BOOL v20 = v19 == 0;

        if (!v20)
        {
          long long v33 = [v18 orderedContactsForAvatarView];
          [(CKAssistantUIContentView *)self->_snippetContentView setContactsForAvatarView:v33];
LABEL_35:
          [v18 setLoadedMessageCount:10];
          v29 = [[CKAssistantUIChatController alloc] initWithConversation:v18];
          [(CKAssistantUIChatController *)v29 beginHoldingScrollGeometryUpdatesForReason:CKScrollViewHoldingScrollGeometryReasonTypeSiriKitUIExtensionPermanentHold];
          [(CKAssistantUIIntentViewController *)self setChatController:v29];
          snippetContentView = self->_snippetContentView;
          long long v31 = [(CKAssistantUIChatController *)v29 view];
          [(CKAssistantUIContentView *)snippetContentView setChatContent:v31];

LABEL_36:
          return;
        }
        char v32 = 0;
LABEL_29:
        id v23 = objc_alloc_init((Class)CNContactStore);
        v24 = +[CNContact predicateForContactsWithIdentifiers:v4];
        v25 = +[CNAvatarView descriptorForRequiredKeys];
        v45 = v25;
        v26 = +[NSArray arrayWithObjects:&v45 count:1];
        id v36 = 0;
        long long v33 = [v23 unifiedContactsMatchingPredicate:v24 keysToFetch:v26 error:&v36];
        id v27 = v36;

        if (v27 && IMOSLoggingEnabled())
        {
          v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            int v41 = 138412546;
            v42 = v4;
            __int16 v43 = 2112;
            id v44 = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Error fetching contact with identifiers %@. Error: %@", (uint8_t *)&v41, 0x16u);
          }
        }
        [(CKAssistantUIContentView *)self->_snippetContentView setContactsForAvatarView:v33];
        if (v32) {
          goto LABEL_36;
        }
        goto LABEL_35;
      }
    }
    else
    {
LABEL_26:
      uint64_t v18 = 0;
      v35 = 0;
    }
    char v32 = 1;
    goto LABEL_29;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v41) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "SnippetContentView must exist before configuring chat and contact avatars", (uint8_t *)&v41, 2u);
    }
  }
}

- (CKAssistantUIContentView)snippetContentView
{
  return self->_snippetContentView;
}

- (void)setSnippetContentView:(id)a3
{
}

- (CKAssistantUIChatController)chatController
{
  return self->_chatController;
}

- (void)setChatController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_snippetContentView, 0);

  objc_storeStrong((id *)&self->_configuredIntent, 0);
}

@end