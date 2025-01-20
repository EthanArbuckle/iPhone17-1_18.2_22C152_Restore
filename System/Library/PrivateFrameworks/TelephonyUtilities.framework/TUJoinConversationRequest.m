@interface TUJoinConversationRequest
- (CXJoinCallAction)joinCallAction;
@end

@implementation TUJoinConversationRequest

- (CXJoinCallAction)joinCallAction
{
  v2 = self;
  v3 = [(TUJoinConversationRequest *)v2 remoteMembers];
  v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v5 = [(TUJoinConversationRequest *)v2 remoteMembers];
  id v6 = [v5 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v55;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v54 + 1) + 8 * i) handle];
        v11 = +[CXHandle handleWithTUHandle:v10];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v7);
  }

  v12 = [(TUJoinConversationRequest *)v2 otherInvitedHandles];
  v13 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v12 count]);

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v14 = [(TUJoinConversationRequest *)v2 otherInvitedHandles];
  id v15 = [v14 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v51;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = +[CXHandle handleWithTUHandle:*(void *)(*((void *)&v50 + 1) + 8 * (void)j)];
        [v13 addObject:v19];
      }
      id v16 = [v14 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v16);
  }

  v20 = [(TUJoinConversationRequest *)v2 conversationLink];
  if (v20
    && ([(TUJoinConversationRequest *)v2 isJoiningConversationWithLink] & 1) == 0)
  {
    id v23 = [(TUJoinConversationRequest *)v2 UUID];
  }
  else
  {
    v21 = [(TUJoinConversationRequest *)v2 messagesGroupUUID];
    v22 = v21;
    if (v21)
    {
      id v23 = v21;
    }
    else
    {
      v24 = [(TUJoinConversationRequest *)v2 conversationLink];
      v25 = [v24 groupUUID];
      v26 = v25;
      if (v25)
      {
        id v27 = v25;
      }
      else
      {
        id v27 = +[NSUUID UUID];
      }
      id v23 = v27;
    }
  }
  id v28 = objc_alloc((Class)CXJoinCallAction);
  v29 = [(TUJoinConversationRequest *)v2 UUID];
  id v30 = [v28 initWithCallUUID:v29 groupUUID:v23];

  if (v20)
  {
    v31 = [v20 pseudonym];
    [v30 setPseudonym:v31];

    v32 = [v20 publicKey];
    [v30 setPublicKey:v32];
  }
  [v30 setRemoteMembers:v4];
  [v30 setOtherInvitedHandles:v13];
  objc_msgSend(v30, "setVideoEnabled:", -[TUJoinConversationRequest isVideoEnabled](v2, "isVideoEnabled"));
  v33 = [(TUJoinConversationRequest *)v2 activity];
  if (v33)
  {
    v34 = [(TUJoinConversationRequest *)v2 activity];
    v35 = +[CXJoinCallActivity activityWithTUConversationActivity:v34];
    [v30 setJoinCallActivity:v35];
  }
  else
  {
    [v30 setJoinCallActivity:0];
  }

  objc_msgSend(v30, "setVideo:", -[TUJoinConversationRequest isVideo](v2, "isVideo"));
  v36 = [(TUJoinConversationRequest *)v2 callerID];
  if (v36)
  {
    v37 = [(TUJoinConversationRequest *)v2 callerID];
    v38 = +[CXHandle handleWithTUHandle:v37];
    [v30 setCallerID:v38];
  }
  else
  {
    [v30 setCallerID:0];
  }

  objc_msgSend(v30, "setAvMode:", -[TUJoinConversationRequest avMode](v2, "avMode"));
  objc_msgSend(v30, "setPresentationMode:", -[TUJoinConversationRequest presentationMode](v2, "presentationMode"));
  objc_msgSend(v30, "setUplinkMuted:", -[TUJoinConversationRequest isUplinkMuted](v2, "isUplinkMuted"));
  objc_msgSend(v30, "setShouldSuppressInCallUI:", -[TUJoinConversationRequest shouldSuppressInCallUI](v2, "shouldSuppressInCallUI"));
  v39 = [(TUJoinConversationRequest *)v2 messagesGroupUUID];
  [v30 setMessagesGroupUUID:v39];

  v40 = [(TUJoinConversationRequest *)v2 messagesGroupName];
  [v30 setMessagesGroupName:v40];

  objc_msgSend(v30, "setWantsStagingArea:", -[TUJoinConversationRequest wantsStagingArea](v2, "wantsStagingArea"));
  objc_msgSend(v30, "setLetMeIn:", -[TUJoinConversationRequest sendLetMeInRequest](v2, "sendLetMeInRequest"));
  objc_msgSend(v30, "setJoiningConversationWithLink:", -[TUJoinConversationRequest isJoiningConversationWithLink](v2, "isJoiningConversationWithLink"));
  v41 = [(TUJoinConversationRequest *)v2 provider];
  v42 = [v41 identifier];
  [v30 setConversationProviderIdentifier:v42];

  v43 = [(TUJoinConversationRequest *)v2 collaborationIdentifier];
  [v30 setCollaborationIdentifier:v43];

  v44 = [(TUJoinConversationRequest *)v2 invitationPreferences];
  id v45 = [v44 count];

  if (v45)
  {
    v46 = sub_100008DCC();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v47 = [(TUJoinConversationRequest *)v2 invitationPreferences];
      *(_DWORD *)buf = 138412290;
      v59 = v47;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Join request specifies invitation preferences: %@", buf, 0xCu);
    }
    v48 = [(TUJoinConversationRequest *)v2 notificationStylesByHandleType];
    [v30 setNotificationStylesByHandleType:v48];
  }
  objc_msgSend(v30, "setRelay:", -[TUJoinConversationRequest endpointOnCurrentDevice](v2, "endpointOnCurrentDevice") ^ 1);

  return (CXJoinCallAction *)v30;
}

@end