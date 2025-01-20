@interface XpcSession
- (MapHandler)mapHandler;
- (XpcSession)initWithConnection:(id)a3;
- (id)serializeIMMessageNotification:(id)a3;
- (id)serializeIMSPIMessage:(id)a3;
- (void)dealloc;
- (void)getImCoreSeedMessages:(id)a3;
- (void)handleMsg:(id)a3;
- (void)markMessageAsRead:(id)a3;
- (void)messageReceivedNotification:(id)a3;
- (void)messageSentNotification:(id)a3;
- (void)registerForIMCoreNotifications;
- (void)sendMsg:(id)a3 args:(id)a4;
- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5;
- (void)sendTextMessage:(id)a3;
- (void)setMapHandler:(id)a3;
@end

@implementation XpcSession

- (XpcSession)initWithConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)XpcSession;
  v3 = [(BTXpcSession *)&v7 initWithConnection:a3];
  if (v3)
  {
    v4 = objc_alloc_init(MapHandler);
    mapHandler = v3->_mapHandler;
    v3->_mapHandler = v4;

    [(MapHandler *)v3->_mapHandler setDelegate:v3];
  }
  return v3;
}

- (void)handleMsg:(id)a3
{
  id v5 = a3;
  string = xpc_dictionary_get_string(v5, "kMsgId");
  if (!strcmp(string, "kStart"))
  {
    [(XpcSession *)self registerForIMCoreNotifications];
  }
  else if (!strcmp(string, "kMarkMessageRead"))
  {
    [(XpcSession *)self markMessageAsRead:v5];
  }
  else if (!strcmp(string, "kSendTextMessage"))
  {
    [(XpcSession *)self sendTextMessage:v5];
  }
  else if (!strcmp(string, "kGetImCoreInitialMessages"))
  {
    [(XpcSession *)self getImCoreSeedMessages:v5];
  }

  _objc_release_x1();
}

- (void)sendMsg:(id)a3 args:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  id v8 = v6;
  v9 = (const char *)[v8 cStringUsingEncoding:4];

  xpc_dictionary_set_string(v7, "kMsgId", v9);
  if (v11)
  {
    v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v7, "kMsgArgs", v10);
  }
  [(BTXpcSession *)self sendMsg:v7];
}

- (void)sendReplyToMsg:(id)a3 status:(unsigned __int8)a4 args:(id)a5
{
  unsigned int v5 = a4;
  id v8 = a5;
  xpc_object_t xdict = xpc_dictionary_create_reply(a3);
  xpc_dictionary_set_int64(xdict, "kMsgStatus", v5);
  v9 = (void *)_CFXPCCreateXPCObjectFromCFObject();

  xpc_dictionary_set_value(xdict, "kMsgArgs", v9);
  [(BTXpcSession *)self sendReply:xdict];
}

- (void)messageReceivedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 object];
  if ([v5 isMuted])
  {
    id v6 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dropping text message as chat session is muted", buf, 2u);
    }
  }
  else
  {
    xpc_object_t v7 = [v4 userInfo];
    id v8 = [v7 objectForKey:IMChatValueKey];

    v9 = (void *)qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      id v11 = [v8 guid];
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Sending received text message with GUID %@ to bluetoothd", buf, 0xCu);
    }
    v12 = +[NSMutableArray array];
    v13 = [(XpcSession *)self serializeIMMessageNotification:v4];
    [v12 addObject:v13];

    CFStringRef v15 = @"kMessagesInfo";
    v16 = v12;
    v14 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [(XpcSession *)self sendMsg:@"kMessageAdded" args:v14];
  }
}

- (void)messageSentNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 userInfo];
  id v6 = [v5 objectForKey:IMChatValueKey];

  xpc_object_t v7 = [v6 guid];
  id v8 = [(MapHandler *)self->_mapHandler pendingSendGuids];
  if (![v8 containsObject:v7])
  {
LABEL_6:

    goto LABEL_7;
  }
  unsigned int v9 = [v6 isSent];

  if (v9)
  {
    v10 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Guid %@ has sent, updating CK", buf, 0xCu);
    }
    id v8 = +[NSMutableArray array];
    id v11 = [(XpcSession *)self serializeIMMessageNotification:v4];
    [v8 addObject:v11];

    CFStringRef v14 = @"kMessagesInfo";
    CFStringRef v15 = v8;
    v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [(XpcSession *)self sendMsg:@"kMessageSent" args:v12];
    v13 = [(MapHandler *)self->_mapHandler pendingSendGuids];
    [v13 removeObject:v7];

    goto LABEL_6;
  }
LABEL_7:
}

- (void)markMessageAsRead:(id)a3
{
  v3 = xpc_dictionary_get_value(a3, "kMsgArgs");
  id v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kMessageGUID")];
  unsigned int v5 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    xpc_object_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asking IMCore to mark message with messageGUID: %@ as read", (uint8_t *)&v6, 0xCu);
  }
  IMSPIQueryMessageWithGUID();
}

- (void)sendTextMessage:(id)a3
{
  v3 = xpc_dictionary_get_value(a3, "kMsgArgs");
  id v4 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v3, "kBody")];
  string = (void *)xpc_dictionary_get_string(v3, "kRecipientPhoneNumber");
  int v6 = (void *)xpc_dictionary_get_string(v3, "kRecipientEmail");
  xpc_object_t v7 = +[NSMutableArray array];
  if (string)
  {
    string = +[NSString stringWithUTF8String:string];
    [v7 addObject:string];
  }
  if (v6)
  {
    int v6 = +[NSString stringWithUTF8String:v6];
    [v7 addObject:v6];
  }
  id v8 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending message through IMCore", buf, 2u);
  }
  unsigned int v9 = [v7 objectAtIndex:0];
  id v10 = v4;
  id v11 = string;
  id v12 = v6;
  int v13 = IMSPISendMessageWithAttachmentsReturningGUID();

  CFStringRef v14 = qword_10000D088;
  BOOL v15 = os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "Message handed off to ImCore for sending";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    v16 = "Message failed to send through IMCore, could not send new chat";
    goto LABEL_12;
  }
}

- (void)getImCoreSeedMessages:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IMSPIQueryMessages();
}

- (id)serializeIMSPIMessage:(id)a3
{
  id v3 = a3;
  id v4 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing added text message", buf, 2u);
  }
  uint64_t v5 = [v3 date];
  unsigned int v6 = [v3 isAudioMessage];
  if (v6)
  {
    id v4 = [v3 text];
    if (![v4 length])
    {
      xpc_object_t v7 = @"Audio Message";
      goto LABEL_8;
    }
  }
  xpc_object_t v7 = [v3 text];
  if (v6) {
LABEL_8:
  }

  id v8 = [v3 sender];
  unsigned int v9 = [v8 displayName];

  id v10 = [v3 sender];
  id v11 = [v10 address];

  uint64_t v12 = [v3 guid];
  v43 = [v3 service];
  v41 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isRead]);
  unsigned int v13 = [v11 containsString:@"@"];
  id v14 = v11;
  if (v13) {
    id v15 = 0;
  }
  else {
    id v15 = v14;
  }
  v42 = v15;
  v38 = v14;
  if (v13) {
    v16 = v14;
  }
  else {
    v16 = 0;
  }
  uint64_t v17 = [(__CFString *)v7 UTF8StringWithMaxLength:128];
  v45[0] = @"kDate";
  uint64_t v18 = v5;
  if (!v5)
  {
    uint64_t v18 = +[NSDate date];
  }
  v34 = (void *)v18;
  v46[0] = v18;
  v45[1] = @"kBody";
  uint64_t v19 = (uint64_t)v7;
  if (!v7)
  {
    uint64_t v19 = +[NSNull null];
  }
  v33 = (void *)v19;
  v46[1] = v19;
  v45[2] = @"kSenderFirstName";
  v37 = +[NSNull null];
  v46[2] = v37;
  v45[3] = @"kSubject";
  uint64_t v20 = v17;
  if (!v17)
  {
    uint64_t v20 = +[NSNull null];
  }
  v40 = (void *)v5;
  v32 = (void *)v20;
  v46[3] = v20;
  v45[4] = @"kSenderLastName";
  v36 = +[NSNull null];
  v46[4] = v36;
  v45[5] = @"kSenderFormattedName";
  uint64_t v21 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v21 = +[NSNull null];
  }
  uint64_t v30 = v21;
  v46[5] = v21;
  v45[6] = @"kMessageGUID";
  v22 = (void *)v12;
  if (!v12)
  {
    v22 = +[NSNull null];
  }
  v39 = (void *)v12;
  v46[6] = v22;
  v45[7] = @"kSenderEmail";
  v23 = v16;
  if (!v16)
  {
    v23 = +[NSNull null];
  }
  v24 = v7;
  v46[7] = v23;
  v45[8] = @"kSenderPhoneNumber";
  v25 = v42;
  if (!v42)
  {
    v25 = +[NSNull null];
  }
  v26 = (void *)v17;
  v46[8] = v25;
  v45[9] = @"kAppType";
  v27 = v43;
  if (!v43)
  {
    v27 = +[NSNull null];
  }
  v46[9] = v27;
  v45[10] = @"kIsRead";
  v28 = v41;
  if (!v41)
  {
    v28 = +[NSNull null];
  }
  v46[10] = v28;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 11, v30);
  id v35 = (id)objc_claimAutoreleasedReturnValue();
  if (!v41) {

  }
  if (!v43) {
  if (!v42)
  }

  if (!v16) {
  if (v39)
  }
  {
    if (v9) {
      goto LABEL_43;
    }
  }
  else
  {

    if (v9) {
      goto LABEL_43;
    }
  }

LABEL_43:
  if (!v26) {

  }
  if (v24)
  {
    if (v40) {
      goto LABEL_47;
    }
  }
  else
  {

    if (v40) {
      goto LABEL_47;
    }
  }

LABEL_47:

  return v35;
}

- (id)serializeIMMessageNotification:(id)a3
{
  id v3 = a3;
  id v4 = [v3 object];
  uint64_t v5 = [v3 userInfo];

  unsigned int v6 = [v5 objectForKey:IMChatValueKey];

  xpc_object_t v7 = qword_10000D088;
  if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Processing added text message", buf, 2u);
  }
  id v8 = [v6 sender];
  uint64_t v9 = [v8 name];

  id v10 = [v6 sender];
  id v11 = [v10 ID];

  unsigned int v12 = [v11 containsString:@"@"];
  id v13 = v11;
  if (v12) {
    id v14 = 0;
  }
  else {
    id v14 = v13;
  }
  v55 = v13;
  if (v12) {
    id v15 = v13;
  }
  else {
    id v15 = 0;
  }
  v16 = 0;
  v62 = 0;
  v63 = 0;
  if ([v6 isFromMe])
  {
    uint64_t v17 = [v4 recipient];
    uint64_t v18 = [v17 name];

    uint64_t v19 = [v4 recipient];
    uint64_t v20 = [v19 ID];

    unsigned int v21 = [v20 containsString:@"@"];
    if (v21) {
      v22 = 0;
    }
    else {
      v22 = v20;
    }
    if (v21) {
      v23 = v20;
    }
    else {
      v23 = 0;
    }
    v62 = v23;
    v63 = v22;
    v16 = (void *)v18;
  }
  v58 = [v6 timeDelivered];
  v24 = [v6 plainBody];
  v57 = v4;
  if (![v24 length])
  {
    v25 = v16;
    v26 = qword_10000D088;
    if (os_log_type_enabled((os_log_t)qword_10000D088, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No body, using message summary instead", buf, 2u);
    }
    v27 = [v6 _imMessageItem];
    uint64_t v28 = IMSPIMessageSummary();

    v24 = (void *)v28;
    v16 = v25;
  }
  v61 = [v24 UTF8StringWithMaxLength:128];
  v60 = [v6 guid];
  v29 = [v6 subject];
  v59 = [v29 accountTypeName];

  uint64_t v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isRead]);
  v65[0] = @"kDate";
  uint64_t v31 = (uint64_t)v58;
  if (!v58)
  {
    uint64_t v31 = +[NSDate date];
  }
  v51 = (void *)v31;
  v66[0] = v31;
  v65[1] = @"kBody";
  uint64_t v32 = (uint64_t)v24;
  if (!v24)
  {
    uint64_t v32 = +[NSNull null];
  }
  v50 = (void *)v32;
  v66[1] = v32;
  v65[2] = @"kSubject";
  uint64_t v33 = (uint64_t)v61;
  if (!v61)
  {
    uint64_t v33 = +[NSNull null];
  }
  v66[2] = v33;
  v65[3] = @"kSenderFormattedName";
  uint64_t v34 = v9;
  if (!v9)
  {
    uint64_t v34 = +[NSNull null];
  }
  v48 = (void *)v34;
  v66[3] = v34;
  v65[4] = @"kSenderEmail";
  uint64_t v35 = (uint64_t)v15;
  if (!v15)
  {
    uint64_t v35 = +[NSNull null];
  }
  v47 = (void *)v35;
  v66[4] = v35;
  v65[5] = @"kSenderPhoneNumber";
  uint64_t v36 = (uint64_t)v14;
  if (!v14)
  {
    uint64_t v36 = +[NSNull null];
  }
  v56 = (void *)v9;
  uint64_t v45 = v36;
  v66[5] = v36;
  v65[6] = @"kRecipientFormattedName";
  v37 = v16;
  if (!v16)
  {
    v37 = +[NSNull null];
  }
  v53 = v16;
  v66[6] = v37;
  v65[7] = @"kRecipientEmail";
  v38 = v62;
  if (!v62)
  {
    v38 = +[NSNull null];
  }
  v54 = v14;
  v66[7] = v38;
  v65[8] = @"kRecipientPhoneNumber";
  v39 = v63;
  if (!v63)
  {
    v39 = +[NSNull null];
  }
  v40 = v15;
  v66[8] = v39;
  v65[9] = @"kMessageGUID";
  v41 = v60;
  if (!v60)
  {
    v41 = +[NSNull null];
  }
  v49 = (void *)v33;
  v66[9] = v41;
  v65[10] = @"kAppType";
  v42 = v59;
  if (!v59)
  {
    v42 = +[NSNull null];
  }
  v66[10] = v42;
  v65[11] = @"kIsRead";
  v43 = v30;
  if (!v30)
  {
    v43 = +[NSNull null];
  }
  v66[11] = v43;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v66, v65, 12, v45);
  id v52 = (id)objc_claimAutoreleasedReturnValue();
  if (!v30) {

  }
  if (!v59) {
  if (!v60)
  }

  if (!v63) {
  if (!v62)
  }

  if (!v53) {
  if (!v54)
  }

  if (v40)
  {
    if (v56) {
      goto LABEL_61;
    }
  }
  else
  {

    if (v56) {
      goto LABEL_61;
    }
  }

LABEL_61:
  if (v61)
  {
    if (v24) {
      goto LABEL_63;
    }
LABEL_70:

    if (v58) {
      goto LABEL_64;
    }
    goto LABEL_71;
  }

  if (!v24) {
    goto LABEL_70;
  }
LABEL_63:
  if (v58) {
    goto LABEL_64;
  }
LABEL_71:

LABEL_64:

  return v52;
}

- (void)registerForIMCoreNotifications
{
  id v3 = +[IMDaemonController sharedInstance];
  [v3 addListenerID:@"BTMapListener" capabilities:kFZListenerCapNotifications | kFZListenerCapChats | (kFZListenerCapTruncatedChatRegistry | kFZListenerCapEvenMoreTruncatedChatRegistry)];

  id v4 = +[IMDaemonController sharedInstance];
  [v4 blockUntilConnected];

  uint64_t v5 = +[IMDaemonController sharedInstance];
  [v5 _setBlocksConnectionAtResume:1];

  unsigned int v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"messageReceivedNotification:" name:IMChatMessageReceivedNotification object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"messageSentNotification:" name:IMChatMessageDidChangeNotification object:0];
}

- (void)dealloc
{
  id v3 = +[IMDaemonController sharedInstance];
  [v3 removeListenerID:@"BTMapListener"];

  id v4 = +[IMDaemonController sharedInstance];
  [v4 disconnectFromDaemon];

  v5.receiver = self;
  v5.super_class = (Class)XpcSession;
  [(XpcSession *)&v5 dealloc];
}

- (MapHandler)mapHandler
{
  return self->_mapHandler;
}

- (void)setMapHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end