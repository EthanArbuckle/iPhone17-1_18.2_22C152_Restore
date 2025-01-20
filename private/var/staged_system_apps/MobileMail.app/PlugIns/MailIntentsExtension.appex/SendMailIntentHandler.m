@interface SendMailIntentHandler
+ (OS_os_log)log;
- (MFMailAccountProxyGenerator)accountProxyGenerator;
- (SendMailIntentHandler)init;
- (id)_emailAddressesFromPersons:(id)a3;
- (id)_messageFromSendMailIntent:(id)a3;
- (id)_resolutionResultForPerson:(id)a3;
- (id)defaultSenderForSendMail:(id)a3;
- (int64_t)_validateIntent:(id)a3;
- (void)confirmSendMail:(id)a3 completion:(id)a4;
- (void)handleSendMail:(id)a3 completion:(id)a4;
- (void)provideSenderOptionsForSendMail:(id)a3 withCompletion:(id)a4;
- (void)resolveBccForSendMail:(id)a3 withCompletion:(id)a4;
- (void)resolveBodyForSendMail:(id)a3 withCompletion:(id)a4;
- (void)resolveCcForSendMail:(id)a3 withCompletion:(id)a4;
- (void)resolveSenderForSendMail:(id)a3 withCompletion:(id)a4;
- (void)resolveSubjectForSendMail:(id)a3 withCompletion:(id)a4;
- (void)resolveToForSendMail:(id)a3 withCompletion:(id)a4;
- (void)setAccountProxyGenerator:(id)a3;
@end

@implementation SendMailIntentHandler

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051C8;
  block[3] = &unk_10000C3A0;
  block[4] = a1;
  if (qword_100012368 != -1) {
    dispatch_once(&qword_100012368, block);
  }
  v2 = (void *)qword_100012360;

  return (OS_os_log *)v2;
}

- (SendMailIntentHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)SendMailIntentHandler;
  v2 = [(SendMailIntentHandler *)&v6 init];
  if (v2)
  {
    v3 = (MFMailAccountProxyGenerator *)[objc_alloc((Class)MFMailAccountProxyGenerator) initWithAllowsRestrictedAccounts:0];
    accountProxyGenerator = v2->_accountProxyGenerator;
    v2->_accountProxyGenerator = v3;
  }
  return v2;
}

- (void)resolveSenderForSendMail:(id)a3 withCompletion:(id)a4
{
  id v13 = a3;
  objc_super v6 = (void (**)(id, void *))a4;
  v7 = [v13 sender];

  if (v7)
  {
    v8 = [(SendMailIntentHandler *)self accountProxyGenerator];
    v9 = [v13 sender];
    v10 = [v8 accountProxyContainingEmailAddress:v9 includingInactive:0];

    if (v10)
    {
      v11 = [v13 sender];
      v12 = +[INStringResolutionResult successWithResolvedString:v11];
      v6[2](v6, v12);
    }
    else
    {
      v11 = +[INStringResolutionResult unsupported];
      v6[2](v6, v11);
    }
  }
  else
  {
    v10 = +[INStringResolutionResult notRequired];
    v6[2](v6, v10);
  }
}

- (void)provideSenderOptionsForSendMail:(id)a3 withCompletion:(id)a4
{
  v8 = (void (**)(id, void *, void))a4;
  v5 = [(SendMailIntentHandler *)self accountProxyGenerator];
  objc_super v6 = [v5 activeAccountProxiesOriginatingBundleID:0 sourceAccountManagement:0];

  v7 = [v6 ef_flatMap:&stru_10000C6F8];
  v8[2](v8, v7, 0);
}

- (id)defaultSenderForSendMail:(id)a3
{
  v3 = [(SendMailIntentHandler *)self accountProxyGenerator];
  v4 = [v3 defaultMailAccountProxyForDeliveryOriginatingBundleID:0 sourceAccountManagement:0];

  v5 = [v4 firstEmailAddress];

  return v5;
}

- (void)resolveToForSendMail:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 to];
  id v9 = [v8 count];

  if (v9)
  {
    v10 = [v6 to];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100005810;
    v14[3] = &unk_10000C720;
    v14[4] = self;
    v11 = [v10 ef_map:v14];

    v7[2](v7, v11);
  }
  else
  {
    v12 = +[INPersonResolutionResult needsValue];
    v15 = v12;
    id v13 = +[NSArray arrayWithObjects:&v15 count:1];
    v7[2](v7, v13);
  }
}

- (void)resolveCcForSendMail:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 cc];

  if (v8)
  {
    id v9 = [v6 cc];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005A04;
    v13[3] = &unk_10000C720;
    v13[4] = self;
    v10 = [v9 ef_map:v13];

    v7[2](v7, v10);
  }
  else
  {
    v11 = +[INPersonResolutionResult notRequired];
    v14 = v11;
    v12 = +[NSArray arrayWithObjects:&v14 count:1];
    v7[2](v7, v12);
  }
}

- (void)resolveBccForSendMail:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 bcc];

  if (v8)
  {
    id v9 = [v6 bcc];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100005BF8;
    v13[3] = &unk_10000C720;
    v13[4] = self;
    v10 = [v9 ef_map:v13];

    v7[2](v7, v10);
  }
  else
  {
    v11 = +[INPersonResolutionResult notRequired];
    v14 = v11;
    v12 = +[NSArray arrayWithObjects:&v14 count:1];
    v7[2](v7, v12);
  }
}

- (void)resolveSubjectForSendMail:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, void *))a4;
  id v6 = [v9 subject];

  if (v6)
  {
    v7 = [v9 subject];
    v8 = +[INStringResolutionResult successWithResolvedString:v7];
    v5[2](v5, v8);
  }
  else
  {
    v7 = +[INStringResolutionResult needsValue];
    v5[2](v5, v7);
  }
}

- (void)resolveBodyForSendMail:(id)a3 withCompletion:(id)a4
{
  id v9 = a3;
  v5 = (void (**)(id, void *))a4;
  id v6 = [v9 body];

  if (v6)
  {
    v7 = [v9 body];
    v8 = +[INStringResolutionResult successWithResolvedString:v7];
    v5[2](v5, v8);
  }
  else
  {
    v7 = +[INStringResolutionResult notRequired];
    v5[2](v5, v7);
  }
}

- (void)confirmSendMail:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = [objc_alloc((Class)MSSendMailIntentResponse) initWithCode:[self _validateIntent:v8] userActivity:0];
  v6[2](v6, v7);
}

- (void)handleSendMail:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SendMailIntentHandler *)self _messageFromSendMailIntent:v6];
  id v9 = [v8 messageData];
  v10 = [v6 isDraft];
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    v12 = [(SendMailIntentHandler *)self accountProxyGenerator];
    id v13 = [v6 sender];
    v14 = [v12 accountProxyContainingEmailAddress:v13 includingInactive:0];

    v15 = [v14 uniqueID];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100006190;
    v19[3] = &unk_10000C748;
    id v20 = v7;
    +[MSSaveEmail saveMessageData:v9 forAccountWithID:v15 autosaveIdentifier:0 completionBlock:v19];
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006268;
    v17[3] = &unk_10000C770;
    id v18 = v7;
    id v16 = +[MSSendEmail sendMessageData:v9 autosaveIdentifier:0 isHMEMessage:0 sendLaterDate:0 completionBlock:v17];
    v14 = v18;
  }
}

- (id)_resolutionResultForPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 personHandle];
  id v6 = [v5 type];

  if (v6 == (id)1)
  {
    id v13 = v4;
    id v7 = +[NSArray arrayWithObjects:&v13 count:1];
    id v8 = [(SendMailIntentHandler *)self _emailAddressesFromPersons:v7];
    id v9 = [v8 firstObject];

    id v10 = [objc_alloc((Class)ECEmailAddress) initWithString:v9];
    if (v10) {
      +[INPersonResolutionResult successWithResolvedPerson:v4];
    }
    else {
    unsigned int v11 = +[INPersonResolutionResult unsupported];
    }
  }
  else
  {
    unsigned int v11 = +[INPersonResolutionResult unsupported];
  }

  return v11;
}

- (id)_emailAddressesFromPersons:(id)a3
{
  id v3 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006638;
  v9[3] = &unk_10000C798;
  id v4 = objc_alloc_init((Class)MFPersonTransformer);
  id v10 = v4;
  v5 = objc_retainBlock(v9);
  id v6 = [v3 ef_map:v5];
  id v7 = [v6 ef_filter:EFIsNotNull];

  return v7;
}

- (int64_t)_validateIntent:(id)a3
{
  id v3 = a3;
  if (!v3 || (MSCanSendMailWithOptions() & 1) == 0)
  {
    int64_t v6 = 6;
    goto LABEL_8;
  }
  id v4 = [v3 to];
  if ([v4 count]) {
    goto LABEL_6;
  }
  v5 = [v3 cc];
  if ([v5 count])
  {

LABEL_6:
    int64_t v6 = 1;
    goto LABEL_8;
  }
  id v8 = [v3 bcc];
  id v9 = [v8 count];

  if (v9) {
    int64_t v6 = 1;
  }
  else {
    int64_t v6 = 6;
  }
LABEL_8:

  return v6;
}

- (id)_messageFromSendMailIntent:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MFMutableMessageHeaders);
  int64_t v6 = [v4 to];
  id v7 = [(SendMailIntentHandler *)self _emailAddressesFromPersons:v6];
  [v5 setAddressListForTo:v7];

  id v8 = [v4 cc];
  id v9 = [(SendMailIntentHandler *)self _emailAddressesFromPersons:v8];
  [v5 setAddressListForCc:v9];

  id v10 = [v4 bcc];
  unsigned int v11 = [(SendMailIntentHandler *)self _emailAddressesFromPersons:v10];
  [v5 setAddressListForBcc:v11];

  v12 = [v4 sender];
  id v13 = [(SendMailIntentHandler *)self accountProxyGenerator];
  v14 = [v13 accountProxyContainingEmailAddress:v12 includingInactive:0];

  if (v14)
  {
    id v15 = [objc_alloc((Class)ECEmailAddressComponents) initWithString:v12];
    id v16 = [v14 fullUserName];
    [v15 setDisplayName:v16];

    v17 = [v15 emailAddressValue];
    uint64_t v18 = [v17 stringValue];

    v19 = (void *)v18;
  }
  else
  {
    [(SendMailIntentHandler *)self defaultSenderForSendMail:v4];
    v19 = id v15 = v12;
  }

  v34 = v19;
  id v20 = +[NSArray arrayWithObjects:&v34 count:1];
  [v5 setAddressListForSender:v20];

  v21 = +[NSDate date];
  v22 = [v21 ec_descriptionForMimeHeaders];

  [v5 setHeader:v22 forKey:ECMessageHeaderKeyDate];
  v23 = [v4 subject];
  [v5 setHeader:v23 forKey:ECMessageHeaderKeySubject];

  v24 = [v4 attachments];
  v25 = [v24 ef_map:&stru_10000C7D8];

  v26 = [v4 body];
  v27 = +[ECHTMLStringAndMIMECharset mf_utf8HTMLStringWithString:v26];

  v33 = v27;
  v28 = +[NSArray arrayWithObjects:&v33 count:1];
  if ([v25 count])
  {
    uint64_t v29 = [v28 arrayByAddingObjectsFromArray:v25];

    v28 = (void *)v29;
  }
  id v30 = objc_alloc_init((Class)MFMessageWriter);
  id v31 = [v30 createMessageWithHTMLStringAndMIMECharset:0 plainTextAlternative:0 otherHtmlStringsAndAttachments:v28 headers:v5];

  return v31;
}

- (MFMailAccountProxyGenerator)accountProxyGenerator
{
  return self->_accountProxyGenerator;
}

- (void)setAccountProxyGenerator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end