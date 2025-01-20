@interface AddCallParticipantIntentHandler
- (AddCallParticipantIntentHandler)init;
- (AddCallParticipantIntentHandler)initWithCallCenter:(id)a3 dataSource:(id)a4 faceTimeUtilities:(id)a5;
- (AddCallParticipantIntentHandlerDataSource)dataSource;
- (BOOL)_checkParticipantAlreadyActive:(id)a3 inConversation:(id)a4;
- (BOOL)_checkParticipantLimitedByScreenTimeDownTime:(id)a3 forCall:(id)a4;
- (BOOL)_checkSelfAdd:(id)a3 toConversation:(id)a4;
- (FaceTimeUtilities)ftUtilities;
- (TUCallCenter)callCenter;
- (id)_checkRestrictionsForCall:(id)a3 conversation:(id)a4 personToAdd:(id)a5 asMember:(id)a6;
- (id)interpretContactResolutionRecommendation:(id)a3 participant:(id)a4;
- (id)runNativeContactResolutionOnParticipant:(id)a3;
- (void)_addCallParticipant:(id)a3 asConversationMember:(id)a4 toConversation:(id)a5 completion:(id)a6;
- (void)_generateLinkResponseForConversation:(id)a3 person:(id)a4 completion:(id)a5;
- (void)handleAddCallParticipant:(id)a3 completion:(id)a4;
- (void)resolveParticipantsForAddCallParticipant:(id)a3 withCompletion:(id)a4;
@end

@implementation AddCallParticipantIntentHandler

- (AddCallParticipantIntentHandler)init
{
  id v3 = +[NSString stringWithFormat:@"com.apple.TelephonyUtilities.PhoneIntentHandler.%@", objc_opt_class()];
  dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);

  v5 = +[TUCallCenter callCenterWithQueue:v4];
  v6 = objc_alloc_init(AddCallParticipantIntentHandlerDataSource);
  v7 = +[FaceTimeUtilities sharedInstance];
  v8 = [(AddCallParticipantIntentHandler *)self initWithCallCenter:v5 dataSource:v6 faceTimeUtilities:v7];

  return v8;
}

- (AddCallParticipantIntentHandler)initWithCallCenter:(id)a3 dataSource:(id)a4 faceTimeUtilities:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AddCallParticipantIntentHandler;
  v12 = [(AddCallParticipantIntentHandler *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_callCenter, a3);
    objc_storeStrong((id *)&v13->_dataSource, a4);
    objc_storeStrong((id *)&v13->_ftUtilities, a5);
  }

  return v13;
}

- (void)handleAddCallParticipant:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000CE50;
  v17[3] = &unk_10004CE48;
  id v18 = a4;
  id v7 = v18;
  v8 = objc_retainBlock(v17);
  id v9 = [(AddCallParticipantIntentHandler *)self callCenter];
  id v10 = [v9 queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000CF30;
  v13[3] = &unk_10004CE70;
  id v14 = v6;
  objc_super v15 = self;
  id v16 = v8;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v10, v13);
}

- (void)_addCallParticipant:(id)a3 asConversationMember:(id)a4 toConversation:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id))a6;
  id v14 = [(AddCallParticipantIntentHandler *)self callCenter];
  objc_super v15 = [v14 queue];
  dispatch_assert_queue_V2(v15);

  uint64_t v16 = [v10 personHandle];
  if (v16
    && (v17 = (void *)v16,
        [v10 personHandle],
        id v18 = objc_claimAutoreleasedReturnValue(),
        id v19 = [v18 faceTimeType],
        v18,
        v17,
        v19 == (id)2))
  {
    v20 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_100031134();
    }

    [(AddCallParticipantIntentHandler *)self _generateLinkResponseForConversation:v12 person:v10 completion:v13];
  }
  else
  {
    v21 = [v12 remoteMembers];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_10000D5F0;
    v41[3] = &unk_10004CE98;
    id v22 = v11;
    id v42 = v22;
    unsigned int v23 = objc_msgSend(v21, "tu_containsObjectPassingTest:", v41);

    v24 = IntentHandlerDefaultLog();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v25) {
        sub_10003104C();
      }

      v26 = [(AddCallParticipantIntentHandler *)self callCenter];
      v27 = [v26 conversationManager];
      [v27 buzzMember:v22 conversation:v12];

      id v28 = objc_alloc((Class)INCallInvite);
      id v45 = v10;
      v29 = +[NSArray arrayWithObjects:&v45 count:1];
      v30 = v28;
      v31 = v29;
      uint64_t v32 = 2;
    }
    else
    {
      if (v25) {
        sub_1000310C0();
      }

      v33 = [(AddCallParticipantIntentHandler *)self callCenter];
      v34 = [v33 conversationManager];
      v35 = +[NSSet setWithObject:v22];
      v36 = +[NSSet set];
      [v34 addRemoteMembers:v35 otherInvitedHandles:v36 toConversation:v12];

      id v37 = objc_alloc((Class)INCallInvite);
      id v44 = v10;
      v29 = +[NSArray arrayWithObjects:&v44 count:1];
      v30 = v37;
      v31 = v29;
      uint64_t v32 = 1;
    }
    id v38 = [v30 initWithParticipants:v31 inviteType:v32 callURL:0];

    id v39 = [objc_alloc((Class)INAddCallParticipantIntentResponse) initWithCode:3 userActivity:0];
    id v43 = v38;
    v40 = +[NSArray arrayWithObjects:&v43 count:1];
    [v39 setInvites:v40];

    v13[2](v13, v39);
  }
}

- (void)_generateLinkResponseForConversation:(id)a3 person:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(AddCallParticipantIntentHandler *)self callCenter];
  id v12 = [v11 conversationManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D75C;
  v15[3] = &unk_10004CEC0;
  id v16 = v8;
  id v17 = v9;
  id v13 = v9;
  id v14 = v8;
  [v12 generateLinkForConversation:v10 completionHandler:v15];
}

- (id)_checkRestrictionsForCall:(id)a3 conversation:(id)a4 personToAdd:(id)a5 asMember:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(AddCallParticipantIntentHandler *)self _checkSelfAdd:v13 toConversation:v11])
  {
    uint64_t v14 = 8;
LABEL_7:
    id v15 = [objc_alloc((Class)INAddCallParticipantIntentResponse) initWithCode:v14 userActivity:0];
    goto LABEL_8;
  }
  if ([(AddCallParticipantIntentHandler *)self _checkParticipantAlreadyActive:v13 inConversation:v11])
  {
    uint64_t v14 = 9;
    goto LABEL_7;
  }
  if ([(AddCallParticipantIntentHandler *)self _checkParticipantLimitedByScreenTimeDownTime:v12 forCall:v10])
  {
    uint64_t v14 = 13;
    goto LABEL_7;
  }
  id v15 = 0;
LABEL_8:

  return v15;
}

- (BOOL)_checkSelfAdd:(id)a3 toConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 localMember];
  uint64_t v9 = [v8 handle];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [v7 localMember];
    id v12 = [v11 handle];
    id v13 = [v6 handle];
    int v14 = TUHandlesAreCanonicallyEqual();

    if (v14)
    {
      id v15 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10003134C(v7, v15);
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v15 = [(FaceTimeUtilities *)self->_ftUtilities fetchFaceTimeAccountAliases];
  id v16 = [v6 handle];
  id v17 = [v16 value];
  if ([v15 containsObject:v17])
  {
  }
  else
  {
    id v18 = [v6 handle];
    id v19 = [v18 normalizedValue];
    unsigned int v20 = [v15 containsObject:v19];

    if (!v20)
    {
      BOOL v22 = 0;
      goto LABEL_13;
    }
  }
  v21 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_1000312C8(v21);
  }

LABEL_12:
  BOOL v22 = 1;
LABEL_13:

  return v22;
}

- (BOOL)_checkParticipantAlreadyActive:(id)a3 inConversation:(id)a4
{
  id v5 = a3;
  id v6 = [a4 activeRemoteParticipants];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000DCC0;
  v10[3] = &unk_10004CEE8;
  id v11 = v5;
  id v7 = v5;
  unsigned __int8 v8 = objc_msgSend(v6, "tu_containsObjectPassingTest:", v10);

  return v8;
}

- (BOOL)_checkParticipantLimitedByScreenTimeDownTime:(id)a3 forCall:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v8 = [(AddCallParticipantIntentHandler *)self callCenter];
  uint64_t v9 = [v8 callFilterController];
  id v14 = v7;
  id v10 = +[NSArray arrayWithObjects:&v14 count:1];

  id v11 = [v6 provider];

  id v12 = [v9 restrictedContacts:v10 callProvider:v11];
  LOBYTE(v6) = [v12 count] != 0;

  return (char)v6;
}

- (void)resolveParticipantsForAddCallParticipant:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v9 = [v6 participants];
  id v10 = [v9 count];

  if (!v10)
  {
    uint64_t v13 = +[INAddCallParticipantParticipantResolutionResult needsValue];
    goto LABEL_5;
  }
  id v11 = [v6 participants];
  id v12 = [v11 count];

  if ((unint64_t)v12 >= 2)
  {
    uint64_t v13 = +[INAddCallParticipantParticipantResolutionResult unsupportedForReason:2];
LABEL_5:
    id v14 = (void *)v13;
    goto LABEL_7;
  }
  id v15 = [v6 participants];
  id v16 = [v15 objectAtIndexedSubscript:0];
  id v14 = [(AddCallParticipantIntentHandler *)self runNativeContactResolutionOnParticipant:v16];

LABEL_7:
  [v8 addObject:v14];

  id v17 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_1000313EC();
  }

  v7[2](v7, v8);
}

- (id)runNativeContactResolutionOnParticipant:(id)a3
{
  id v4 = a3;
  id v5 = [[CRRRecommendation alloc] initWithPerson:v4];
  id v6 = [(CRRRecommendation *)v5 recommendedResult];
  id v7 = [(AddCallParticipantIntentHandler *)self interpretContactResolutionRecommendation:v6 participant:v4];

  return v7;
}

- (id)interpretContactResolutionRecommendation:(id)a3 participant:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)INAddCallParticipantParticipantResolutionResult) initWithPersonResolutionResult:v6];
  id v8 = [v6 resolutionResultCode];

  if (!v8 || v8 == (id)3)
  {
    id v14 = [v7 resolvedValue];
    id v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v7 itemToConfirm];
    }
    id v17 = v16;

    id v18 = [v17 personHandle];
    id v19 = [v18 value];
    id v20 = [v19 length];

    if (!v20)
    {
      v21 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10003146C(v21);
      }

      uint64_t v22 = +[INAddCallParticipantParticipantResolutionResult unsupportedForReason:3];

      id v7 = (id)v22;
    }
  }
  else if (v8 == (id)1)
  {
    uint64_t v9 = [v5 personHandle];
    id v10 = [v9 label];
    id v11 = [v10 length];

    if (v11) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 1;
    }
    uint64_t v13 = +[INAddCallParticipantParticipantResolutionResult unsupportedForReason:v12];

    id v7 = (id)v13;
  }

  return v7;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (FaceTimeUtilities)ftUtilities
{
  return self->_ftUtilities;
}

- (AddCallParticipantIntentHandlerDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_ftUtilities, 0);

  objc_storeStrong((id *)&self->_callCenter, 0);
}

@end