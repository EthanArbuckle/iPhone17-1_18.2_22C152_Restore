@interface MFConversationAssistantContextProvider
+ (id)log;
- (BOOL)allowContextProvider:(id)a3;
- (EMCachingContactStore)contactStore;
- (MFConversationAssistantContextProvider)initWithCurrentVisibileMessageStrategy:(id)a3 contactStore:(id)a4;
- (MFCurrentVisibleMessageStrategy)visibleMessageStrategy;
- (id)_saPersonAttributesFromEmailAddresses:(id)a3;
- (id)getCurrentContext;
- (void)dealloc;
- (void)setContactStore:(id)a3;
- (void)setVisibleMessageStrategy:(id)a3;
@end

@implementation MFConversationAssistantContextProvider

- (MFConversationAssistantContextProvider)initWithCurrentVisibileMessageStrategy:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFConversationAssistantContextProvider;
  v9 = [(MFConversationAssistantContextProvider *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a4);
    objc_storeStrong((id *)&v10->_visibleMessageStrategy, a3);
    v11 = +[AFContextManager defaultContextManager];
    [v11 addContextProvider:v10];
  }
  return v10;
}

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10018435C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699A18 != -1) {
    dispatch_once(&qword_100699A18, block);
  }
  v2 = (void *)qword_100699A10;

  return v2;
}

- (void)dealloc
{
  v3 = +[AFContextManager defaultContextManager];
  [v3 removeContextProvider:self];

  v4.receiver = self;
  v4.super_class = (Class)MFConversationAssistantContextProvider;
  [(MFConversationAssistantContextProvider *)&v4 dealloc];
}

- (BOOL)allowContextProvider:(id)a3
{
  v3 = +[MFConversationAssistantContextProvider log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    CFStringRef v6 = @"YES";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "allowContextProvider %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return 1;
}

- (id)getCurrentContext
{
  v3 = [(objc_class *)off_100690088() email];
  if (v3)
  {
    objc_super v4 = [(MFConversationAssistantContextProvider *)self visibleMessageStrategy];
    int v5 = [v4 currentVisibleMessageContentRequest];

    v36 = v5;
    CFStringRef v6 = [v5 waitForResult];
    if (v6)
    {
      id v7 = [v5 message];
      id v8 = [v7 date];
      [v3 setDateSent:v8];

      v9 = [v7 toList];
      v10 = [(MFConversationAssistantContextProvider *)self _saPersonAttributesFromEmailAddresses:v9];
      [v3 setRecipientsTo:v10];

      v11 = [v7 ccList];
      v12 = [(MFConversationAssistantContextProvider *)self _saPersonAttributesFromEmailAddresses:v11];
      [v3 setRecipientsCc:v12];

      objc_super v13 = [v7 bccList];
      v14 = [(MFConversationAssistantContextProvider *)self _saPersonAttributesFromEmailAddresses:v13];
      [v3 setRecipientsBcc:v14];

      v15 = [v7 senderList];
      v16 = [(MFConversationAssistantContextProvider *)self _saPersonAttributesFromEmailAddresses:v15];
      v17 = [v16 lastObject];
      [v3 setFromEmail:v17];

      v18 = [v7 mailboxes];
      v19 = [v18 ef_map:&stru_10060B038];
      v20 = [v19 ef_flatten];
      v21 = [v20 ef_compactMap:&stru_10060B078];
      v22 = +[NSSet setWithArray:v21];
      v23 = [v22 allObjects];
      [v3 setReceivingAddresses:v23];

      v24 = [v7 mailboxes];
      v25 = [NSNumber numberWithBool:[v24 ef_any:&stru_10060B098]];
      [v3 setOutgoing:v25];

      v26 = [v6 publicMessageURL];
      [v3 setIdentifier:v26];
    }
    else
    {
      v28 = +[MFConversationAssistantContextProvider log];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = [(MFConversationAssistantContextProvider *)self visibleMessageStrategy];
        v30 = [v29 currentVisibleMessageContentRequest];
        sub_10045C5B0(v30, v42, v28, v29);
      }
    }
    v31 = +[MFConversationAssistantContextProvider log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = [v3 dictionary];
      v33 = [v3 identifier];
      *(_DWORD *)buf = 138412546;
      v39 = v32;
      __int16 v40 = 2114;
      v41 = v33;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Returning %@, %{public}@.", buf, 0x16u);
    }
    v34 = [v3 dictionary];
    v37 = v34;
    v27 = +[NSArray arrayWithObjects:&v37 count:1];
  }
  else
  {
    v27 = +[NSArray array];
  }

  return v27;
}

- (id)_saPersonAttributesFromEmailAddresses:(id)a3
{
  id v18 = a3;
  v19 = +[NSMutableArray array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v18;
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v21 + 1) + 8 * i) emailAddressValue];
        id v8 = v7;
        if (v7)
        {
          v9 = [v7 simpleAddress];
          v10 = [v8 displayName];
          if ([v9 length])
          {
            v11 = [(objc_class *)off_100690090() personAttribute];
            [v11 setData:v9];
            v12 = [(MFConversationAssistantContextProvider *)self contactStore];
            objc_super v13 = [v12 displayNameForEmailAddress:v9];

            if ([v13 length]) {
              v14 = v13;
            }
            else {
              v14 = v10;
            }
            [v11 setDisplayText:v14];
            [v19 addObject:v11];
          }
        }
        else
        {
          v9 = 0;
          v10 = 0;
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  if ([v19 count]) {
    v15 = v19;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  return v16;
}

- (EMCachingContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (MFCurrentVisibleMessageStrategy)visibleMessageStrategy
{
  return self->_visibleMessageStrategy;
}

- (void)setVisibleMessageStrategy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleMessageStrategy, 0);

  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end