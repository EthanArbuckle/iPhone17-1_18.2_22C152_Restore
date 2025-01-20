void sub_100004CB8(id a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void v5[6];

  v5[0] = CNContactPhoneNumbersKey;
  v5[1] = CNContactEmailAddressesKey;
  v5[2] = CNContactPhonemeDataKey;
  v1 = +[NSPersonNameComponents descriptorForUsedKeys];
  v5[3] = v1;
  v2 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v5[4] = v2;
  v5[5] = CNContactIdentifierKey;
  v3 = +[NSArray arrayWithObjects:v5 count:6];
  v4 = (void *)qword_100058928;
  qword_100058928 = v3;
}

uint64_t sub_100005720(uint64_t a1)
{
  qword_100058938 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_1000062D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) groupId];
  if ([v4 length])
  {
    v5 = [v3 messagesGroupName];
    if ([v5 length])
    {
      v6 = [v3 messagesGroupName];
      v7 = [*(id *)(a1 + 32) groupName];
      id v8 = [v6 isEqualToIgnoringCase:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  v9 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"NO";
    if (v8) {
      CFStringRef v10 = @"YES";
    }
    int v12 = 138412290;
    CFStringRef v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SimpleConversationFilter: matchesCallGroup=%@", (uint8_t *)&v12, 0xCu);
  }

  return v8;
}

BOOL sub_1000064C0(uint64_t a1, void *a2)
{
  id v3 = [a2 remoteMembers];
  id v4 = [v3 count];
  id v5 = *(id *)(a1 + 32);

  v6 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (v4 == v5) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138412290;
    CFStringRef v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SimpleConversationFilter: matchesParticipantCount=%@", (uint8_t *)&v9, 0xCu);
  }

  return v4 == v5;
}

void sub_100009840(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000A5A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isDeleted] & 1) != 0 || objc_msgSend(v3, "isTrashed"))
  {
    id v4 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v3;
      id v5 = "Rejecting voicemail because it is deleted or trashed: %@";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    }
  }
  else
  {
    if (!*(void *)(a1 + 32))
    {
LABEL_23:
      if (*(void *)(a1 + 48))
      {
        v18 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Rejecting voicemail because voicemail.date is before requested startDate: %@", buf, 0xCu);
        }

        v19 = [v3 date];
        id v20 = [v19 compare:*(void *)(a1 + 48)];

        if (v20 == (id)-1) {
          goto LABEL_7;
        }
      }
      if (*(void *)(a1 + 56))
      {
        v21 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v33 = v3;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting voicemail because voicemail.date is after requested endDate: %@", buf, 0xCu);
        }

        v22 = [v3 date];
        id v23 = [v22 compare:*(void *)(a1 + 56)];

        if (v23 == (id)1) {
          goto LABEL_7;
        }
      }
      v24 = *(void **)(a1 + 64);
      if (v24)
      {
        unsigned int v25 = [v24 BOOLValue];
        unsigned int v26 = [v3 isUnread];
        if (v25)
        {
          if ((v26 & 1) == 0)
          {
            id v4 = IntentHandlerDefaultLog();
            if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_6;
            }
            *(_DWORD *)buf = 138412290;
            id v33 = v3;
            id v5 = "Rejecting voicemail because only unread voicemails were requested, but this one is marked as read: %@";
            goto LABEL_5;
          }
        }
        else if (v26)
        {
          id v4 = IntentHandlerDefaultLog();
          if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_6;
          }
          *(_DWORD *)buf = 138412290;
          id v33 = v3;
          id v5 = "Rejecting voicemail because only read voicemails were requested, but this one is marked as unread: %@";
          goto LABEL_5;
        }
      }
      uint64_t v6 = 1;
      goto LABEL_8;
    }
    id v8 = [v3 senderDestinationID];
    id v9 = [v8 length];

    if (v9)
    {
      id v10 = objc_alloc((Class)TUHandle);
      v11 = [v3 senderDestinationID];
      id v4 = [v10 initWithType:2 value:v11];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v12 = *(id *)(a1 + 40);
      CFStringRef v13 = (char *)[v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13)
      {
        v14 = v13;
        uint64_t v15 = *(void *)v28;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v12);
            }
            if (TUHandlesAreCanonicallyEqual())
            {

              goto LABEL_23;
            }
          }
          v14 = (char *)[v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      v17 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v3;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting voicemail because senderDestinationID does not match requested recipient: %@", buf, 0xCu);
      }

      goto LABEL_6;
    }
    id v4 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v3;
      id v5 = "Rejecting voicemail because a recipient was specified, but this voicemail has no senderDestinationID: %@";
      goto LABEL_5;
    }
  }
LABEL_6:

LABEL_7:
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

void sub_10000A9C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    CFStringRef v7 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100030D08((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v14 = &__NSArray0__struct;
    uint64_t v15 = 3;
  }
  else
  {
    if ((unint64_t)[v5 count] <= *(void *)(a1 + 48))
    {
      CFStringRef v7 = v5;
    }
    else
    {
      CFStringRef v7 = [v5 subarrayWithRange:0];
      v16 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(void **)(a1 + 48);
        int v20 = 134218242;
        id v21 = v17;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Truncated matching voicemails to %ld objects: %@", (uint8_t *)&v20, 0x16u);
      }
    }
    v14 = [*(id *)(a1 + 32) callRecordsForVoicemails:v7];
    v18 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412546;
      id v21 = v5;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Voicemails (%@) -> callRecords (%@)", (uint8_t *)&v20, 0x16u);
    }

    uint64_t v15 = 7;
  }

  id v19 = [objc_alloc((Class)INSearchCallHistoryIntentResponse) initWithCode:v15 userActivity:0];
  [v19 setCallRecords:v14];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_10000BCA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"siriMatchesCount";
  v4[1] = @"matchesByIdCount";
  long long v6 = *(_OWORD *)(a1 + 40);
  v4[2] = @"matchesByNameCount";
  v4[3] = @"siriLocale";
  uint64_t v5 = v1;
  uint64_t v7 = *(void *)(a1 + 56);
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:4];

  return v2;
}

void sub_10000BEC0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setItemURL:v2];
  [v4 setNumberOfLoops:0];
  LODWORD(v3) = 1.0;
  [v4 setVolume:v3];
  [v4 setFadeInDuration:0.0];
  [v4 setFadeOutDuration:0.0];
  [v4 setUserInfo:0];
}

void sub_10000C298(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      v14 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100030ECC();
      }
    }
    uint64_t v9 = IntentHandlerDefaultLog();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 136315138;
    int v20 = "-[PlayVoicemailIntentHandler handlePlayVoicemail:completion:]_block_invoke";
    uint64_t v11 = "%s [WARN] Voicemail with the given identifier was not found";
    uint64_t v12 = v9;
    uint32_t v13 = 12;
    goto LABEL_11;
  }
  unsigned __int8 v8 = [*(id *)(a1 + 32) isRestrictedMessage:v5];
  uint64_t v9 = IntentHandlerDefaultLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (!v10)
    {
LABEL_12:

      id v15 = [objc_alloc((Class)INPlayVoicemailIntentResponse) initWithCode:4 userActivity:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_16;
    }
    *(_DWORD *)buf = 136315394;
    int v20 = "-[PlayVoicemailIntentHandler handlePlayVoicemail:completion:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v5;
    uint64_t v11 = "%s [WARN] Screen time restricted playback of voicemail: %@";
    uint64_t v12 = v9;
    uint32_t v13 = 22;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, v11, buf, v13);
    goto LABEL_12;
  }
  if (v10)
  {
    *(_DWORD *)buf = 136315394;
    int v20 = "-[PlayVoicemailIntentHandler handlePlayVoicemail:completion:]_block_invoke";
    __int16 v21 = 2112;
    id v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Found voicemail with the given identifier (%@). Returning success", buf, 0x16u);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000C504;
  v17[3] = &unk_10004CDA8;
  v16 = *(void **)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  [v16 _playVoicemail:v5 completion:v17];
  id v15 = v18;
LABEL_16:
}

void sub_10000C504(uint64_t a1, int a2)
{
  id v4 = objc_alloc((Class)INPlayVoicemailIntentResponse);
  if (a2) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 4;
  }
  id v6 = [v4 initWithCode:v5 userActivity:0];
  uint64_t v7 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[PlayVoicemailIntentHandler handlePlayVoicemail:completion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Voicemail completed playing. Calling completion block with success response: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

void sub_10000C780(uint64_t a1)
{
  id v5 = +[TUHandle handleWithDestinationID:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v3 = [WeakRetained callCenter];
  id v4 = [v3 callFilterController];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 containsRestrictedHandle:v5 forBundleIdentifier:TUBundleIdentifierMobilePhoneApplication performSynchronously:1];
}

void sub_10000C9A8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = IntentHandlerDefaultLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100030F4C();
    }

    id v6 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = "-[PlayVoicemailIntentHandler _playVoicemail:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Voicemail completed successfully", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1[4] + 16) markRead:a1[5]];
    id v6 = *(void (**)(void))(a1[6] + 16);
  }
  v6();
}

void sub_10000CE50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[AddCallParticipantIntentHandler handleAddCallParticipant:completion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Handled with INAddCallParticipantIntentResponse: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000CF30(uint64_t a1)
{
  uint64_t v2 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    int v20 = 136315394;
    __int16 v21 = "-[AddCallParticipantIntentHandler handleAddCallParticipant:completion:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s Handling INAddCallParticipantIntent: %@", (uint8_t *)&v20, 0x16u);
  }

  id v4 = [*(id *)(a1 + 32) participants];
  int v5 = [v4 firstObject];

  id v6 = [*(id *)(a1 + 40) callCenter];
  __int16 v7 = [v6 frontmostAudioOrVideoCall];

  id v8 = [*(id *)(a1 + 40) callCenter];
  uint64_t v9 = [v8 activeConversationForCall:v7];

  __int16 v10 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 136315906;
    __int16 v21 = "-[AddCallParticipantIntentHandler handleAddCallParticipant:completion:]_block_invoke";
    __int16 v22 = 2112;
    id v23 = v5;
    __int16 v24 = 2112;
    unsigned int v25 = v7;
    __int16 v26 = 2112;
    long long v27 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Adding %@ to call=%@, conversation=%@", (uint8_t *)&v20, 0x2Au);
  }

  if (v7
    && ([v5 personHandle], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11)
    && v9)
  {
    uint64_t v12 = [v5 personHandle];
    uint32_t v13 = [*(id *)(a1 + 40) dataSource];
    v14 = [v13 isoCountryCodes];
    id v15 = [v14 firstObject];
    objc_msgSend(v12, "tu_normalizedHandleForISOCountryCode:", v15);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    id v17 = [objc_alloc((Class)TUConversationMember) initWithHandle:v16];
    id v18 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100030FCC();
    }

    id v19 = [*(id *)(a1 + 40) _checkRestrictionsForCall:v7 conversation:v9 personToAdd:v5 asMember:v17];
    if (v19) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else {
      [*(id *)(a1 + 40) _addCallParticipant:v5 asConversationMember:v17 toConversation:v9 completion:*(void *)(a1 + 48)];
    }
  }
  else
  {
    id v16 = [objc_alloc((Class)INAddCallParticipantIntentResponse) initWithCode:4 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_10000D5F0(uint64_t a1, void *a2, unsigned char *a3)
{
  int v5 = [a2 handle];
  id v6 = [*(id *)(a1 + 32) handle];
  uint64_t v7 = TUHandlesAreCanonicallyEqual();
  *a3 = v7;

  return v7;
}

void sub_10000D75C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 URL];

  if (v7)
  {
    id v8 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100031228(v5, v8);
    }

    id v9 = objc_alloc((Class)INCallInvite);
    uint64_t v17 = *(void *)(a1 + 32);
    __int16 v10 = +[NSArray arrayWithObjects:&v17 count:1];
    id v11 = [v5 URL];
    id v12 = [v9 initWithParticipants:v10 inviteType:3 callURL:v11];

    id v13 = [objc_alloc((Class)INAddCallParticipantIntentResponse) initWithCode:3 userActivity:0];
    id v16 = v12;
    v14 = +[NSArray arrayWithObjects:&v16 count:1];
    [v13 setInvites:v14];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v6)
    {
      id v15 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000311A8();
      }
    }
    id v12 = [objc_alloc((Class)INAddCallParticipantIntentResponse) initWithCode:13 userActivity:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_10000DCC0(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = [a2 handle];
  id v6 = [*(id *)(a1 + 32) handle];
  uint64_t v7 = TUHandlesAreCanonicallyEqual();
  *a3 = v7;

  return v7;
}

void sub_10000E300(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_10000EA24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000EC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v7);
  _Unwind_Resume(a1);
}

void sub_10000EC64(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 handler];
  id v8 = [*(id *)(a1 + 32) handler];

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void sub_10000EE64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = IntentHandlerDefaultLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100031690();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registered for drop-in calls", buf, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 16));
  id v6 = IntentHandlerDefaultLog();
  uint64_t v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 40);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)id v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v8, "HangUpIntentHandlerRegisterForProvider", "", v9, 2u);
  }
}

void sub_10000F710(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [*(id *)(a1 + 32) callCenter];
  uint64_t v3 = [v2 incomingCall];
  if (v3)
  {
    uint64_t v4 = (void *)v3;

LABEL_4:
    id v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 handle];
      *(_DWORD *)buf = 138412290;
      uint64_t v61 = (uint64_t)v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "An incoming call exists with handle %@", buf, 0xCu);
    }
    id v8 = [objc_alloc((Class)INIdentifyIncomingCallerIntentResponse) initWithCode:3 userActivity:0];
    [v8 setStatusCode:2];
    id v9 = [v4 handle];
    __int16 v10 = [v9 value];
    id v11 = [v10 length];

    v54 = v8;
    if (v11)
    {
      id v12 = [v4 handle];
      id v13 = [*(id *)(v1 + 32) dataSource];
      v14 = [v13 contactsDataSource];
      id v15 = [*(id *)(v1 + 32) dataSource];
      id v16 = [v15 coreTelephonyDataSource];
      uint64_t v17 = [v16 allRelevantISOCountryCodes];
      uint64_t v18 = +[INPerson tu_personMatchingHandle:v12 contactsDataSource:v14 isoCountryCodes:v17];

      id v19 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Incoming call is from person: %@", buf, 0xCu);
      }
    }
    else
    {
      id v19 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Incoming caller is a private number", buf, 2u);
      }
      uint64_t v18 = 0;
    }

    uint64_t v55 = v1;
    int v20 = *(void **)(v1 + 32);
    __int16 v21 = [v4 provider];
    id v53 = [v20 preferredCallProviderFor:v21];

    id v22 = objc_alloc_init((Class)NSMutableArray);
    id v23 = v22;
    if (v18) {
      [v22 addObject:v18];
    }
    id v52 = objc_alloc((Class)INCallRecord);
    __int16 v24 = [v4 callUUID];
    unsigned int v25 = [v4 dateCreated];
    v56 = v23;
    if ([v4 isVideo]) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 1;
    }
    long long v27 = [v4 provider];
    long long v28 = [v27 identifier];
    [v4 provider];
    v30 = long long v29 = (void *)v18;
    v31 = [v30 bundleIdentifier];
    v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isBlocked]);
    id v33 = [v52 initWithIdentifier:v24 dateCreated:v25 callRecordType:6 callCapability:v26 callDuration:0 unseen:&__kCFBooleanTrue preferredCallProvider:v53 participants:v56 numberOfCalls:&off_10004EB20 providerId:v28 providerBundleId:v31 isCallerIdBlocked:v32];

    v34 = v29;
    id v59 = v33;
    v35 = +[NSArray arrayWithObjects:&v59 count:1];
    id v36 = v54;
    [v54 setCallRecords:v35];

    uint64_t v1 = v55;
    v37 = v56;
    goto LABEL_18;
  }
  id v5 = [*(id *)(v1 + 32) callCenter];
  uint64_t v4 = [v5 incomingVideoCall];

  if (v4) {
    goto LABEL_4;
  }
  v38 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "No incoming call exists. Looking up last missed call...", buf, 2u);
  }

  id v36 = [objc_alloc((Class)INIdentifyIncomingCallerIntentResponse) initWithCode:3 userActivity:0];
  [v36 setStatusCode:1];
  uint64_t v39 = +[CallHistoryDataSourcePredicate predicateForJustMissedCalls];
  v40 = [*(id *)(v1 + 32) dataSource];
  v41 = [v40 callHistoryDataSource];
  v42 = (void *)v39;
  v43 = [v41 callsWithPredicate:v39 limit:1 offset:0 batchSize:1];
  uint64_t v44 = [v43 firstObject];

  v57 = (void *)v44;
  if (v44)
  {
    v45 = +[CallRecordConverter sharedInstance];
    uint64_t v58 = v44;
    v46 = +[NSArray arrayWithObjects:&v58 count:1];
    v47 = [*(id *)(v1 + 32) dataSource];
    v48 = [v47 contactsDataSource];
    v49 = [*(id *)(v1 + 32) dataSource];
    v50 = [v49 providerManager];
    uint64_t v4 = [v45 callRecordsForRecentCalls:v46 withContactsDataSource:v48 withCallProviderManager:v50];
  }
  else
  {
    uint64_t v4 = 0;
  }
  v51 = IntentHandlerDefaultLog();
  v34 = v42;
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v61 = (uint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Last missed call is: %@", buf, 0xCu);
  }

  [v36 setCallRecords:v4];
  v37 = v57;
LABEL_18:

  (*(void (**)(void))(*(void *)(v1 + 40) + 16))();
}

void sub_100011AE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [objc_alloc((Class)TUHandle) initWithType:2 value:v6];

  id v7 = [objc_alloc((Class)TULabeledHandle) initWithHandle:v8 label:v5 isSuggested:0];
  [*(id *)(a1 + 32) addObject:v7];
}

void sub_100016980(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = IntentHandlerDefaultLog();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "resolveFaceTimeLink", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100017BBC(id a1)
{
  uint64_t v1 = (void *)qword_100058948;
  qword_100058948 = (uint64_t)&off_10004ED08;
}

id sub_10001A800(uint64_t a1, void *a2)
{
  id v3 = [a2 person];
  uint64_t v4 = [*(id *)(a1 + 32) dataSource];
  id v5 = [v4 coreTelephonyDataSource];
  os_signpost_id_t v6 = [v5 allRelevantISOCountryCodes];
  id v7 = objc_msgSend(v3, "tu_personWithFormattedHandleForISOCountryCodes:", v6);

  return v7;
}

void sub_10001EC20(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  os_signpost_id_t v6 = +[NSPredicate predicateWithBlock:&stru_10004D038];
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  if ([v7 count]) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

BOOL sub_10001ECD4(id a1, INPerson *a2, NSDictionary *a3)
{
  id v3 = [(INPerson *)a2 personHandle];
  BOOL v4 = [v3 type] == (id)2;

  return v4;
}

void sub_10002144C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021464(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) callCenter];
  uint64_t v2 = [v3 callFilterController];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 callFilterStatusForDialRequest:*(void *)(a1 + 40)];
}

void sub_100021628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021640(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021650(uint64_t a1)
{
}

void sub_100021658(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) callCenter];
  uint64_t v2 = [v6 callFilterController];
  uint64_t v3 = [v2 restrictedContacts:*(void *)(a1 + 40) callProvider:*(void *)(a1 + 48)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10002186C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002188C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) incomingCall];
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 64) incomingVideoCall];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 != 0;

    uint64_t v2 = 0;
  }
}

void sub_100021AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100021AC8(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 64) hasCurrentCalls];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100021BAC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) videoDeviceController];
  id v3 = [v2 inputDevices];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count] != 0;
}

void sub_100022374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000223A0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000224E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100022510(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10002252C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000233A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000233CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000233DC(uint64_t a1)
{
}

void sub_1000233E4(uint64_t a1)
{
  uint64_t v2 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    id v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Searching for conversationId: %@ among active conversations.", buf, 0xCu);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend(*(id *)(a1 + 40), "callCenter", 0);
  id v5 = [v4 conversationManager];
  id v6 = [v5 activeConversations];

  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 UUID];
        id v13 = [v12 UUIDString];
        unsigned int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

        if (v14)
        {
          id v15 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found matching conversation %@", buf, 0xCu);
          }

          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
          goto LABEL_15;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

void sub_100023B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023B38(uint64_t a1)
{
  uint64_t v2 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Searching among active conversations for a matching call.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) groupConversationFilter];
  id v4 = [*(id *)(a1 + 40) contactsDataSource];
  id v5 = +[ConversationFilterFactory makeFilterForINCallGroupConversationFilter:v3 contactsDataSource:v4];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = [*(id *)(a1 + 40) callCenter];
  id v7 = [v6 conversationManager];
  id v8 = [v7 activeConversations];

  id v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v38 = a1;
    id v11 = 0;
    uint64_t v12 = *(void *)v42;
    uint64_t v39 = v5;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(v8);
        }
        unsigned int v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        unsigned int v15 = [v5 matches:v14];
        long long v16 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v17 = v12;
          long long v18 = v8;
          if (v15) {
            CFStringRef v19 = @"YES";
          }
          else {
            CFStringRef v19 = @"NO";
          }
          [v14 UUID];
          int v20 = v40 = v11;
          __int16 v21 = [v20 UUIDString];
          *(_DWORD *)buf = 138412546;
          CFStringRef v46 = v19;
          id v8 = v18;
          uint64_t v12 = v17;
          __int16 v47 = 2112;
          v48 = v21;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "doesConversationMatch = %@ for TUConversation: %@", buf, 0x16u);

          id v5 = v39;
          id v11 = v40;
        }

        if (v15)
        {
          if (v11)
          {

            v31 = IntentHandlerDefaultLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Found more than one matching conversation.", buf, 2u);
            }

            uint64_t v32 = +[INCallGroupConversationResolutionResult unsupported];
            uint64_t v33 = *(void *)(*(void *)(v38 + 48) + 8);
            v34 = *(void **)(v33 + 40);
            *(void *)(v33 + 40) = v32;

            goto LABEL_29;
          }
          id v11 = v14;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    a1 = v38;
    if (v11)
    {
      id v22 = v5;
      id v23 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found one matching conversation.", buf, 2u);
      }

      id v24 = objc_alloc((Class)INCallGroupConversation);
      unsigned int v25 = [v11 UUID];
      uint64_t v26 = [v25 UUIDString];
      id v27 = [v24 initWithConversationId:v26 caller:0 otherParticipants:0 callGroup:0];

      uint64_t v28 = +[INCallGroupConversationResolutionResult successWithResolvedCallGroupConversation:v27];
      uint64_t v29 = *(void *)(*(void *)(v38 + 48) + 8);
      long long v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      id v5 = v22;
      goto LABEL_29;
    }
  }
  else
  {
  }
  v35 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found no matching conversations.", buf, 2u);
  }

  uint64_t v36 = +[INCallGroupConversationResolutionResult unsupported];
  uint64_t v37 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(id *)(v37 + 40);
  *(void *)(v37 + 40) = v36;
LABEL_29:
}

void sub_1000246AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callCenter];
  unsigned __int8 v3 = [v2 hasCurrentCalls];

  id v4 = IntentHandlerDefaultLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Call exists, proceeding to handle HangUp intent.", v8, 2u);
    }
    uint64_t v6 = 1;
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000321DC(v5);
    }
    uint64_t v6 = 6;
  }

  id v7 = [objc_alloc((Class)INHangUpCallIntentResponse) initWithCode:v6 userActivity:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000248F0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callCenter];
  uint64_t v3 = [v2 incomingCall];
  if (v3)
  {
    id v4 = (void *)v3;

LABEL_4:
    uint64_t v6 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      CFStringRef v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "An incoming call exists: %@", (uint8_t *)&v18, 0xCu);
    }

    unsigned int v7 = [v4 isEligibleForScreening];
    id v8 = IntentHandlerDefaultLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sending call to automatic screening", (uint8_t *)&v18, 2u);
      }

      id v10 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v4];
      [v10 setSendToScreening:1];
      id v11 = [*(id *)(a1 + 32) callCenter];
      [v11 answerWithRequest:v10];
    }
    else
    {
      if (v9)
      {
        LOWORD(v18) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Declining it and returning success", (uint8_t *)&v18, 2u);
      }

      id v10 = [*(id *)(a1 + 32) callCenter];
      [v10 disconnectCall:v4 withReason:2];
    }

    id v12 = [objc_alloc((Class)INHangUpCallIntentResponse) initWithCode:3 userActivity:0];
    [v12 setHungUpCallType:6];
    goto LABEL_14;
  }
  id v5 = [*(id *)(a1 + 32) callCenter];
  id v4 = [v5 incomingVideoCall];

  if (v4) {
    goto LABEL_4;
  }
  id v13 = [*(id *)(a1 + 32) callCenter];
  unsigned int v14 = [v13 hasCurrentCalls];

  unsigned int v15 = IntentHandlerDefaultLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "At least one call exists. Hanging up and returning success", (uint8_t *)&v18, 2u);
    }

    uint64_t v17 = [*(id *)(a1 + 32) callCenter];
    [v17 disconnectCurrentCallAndActivateHeld];

    id v12 = [objc_alloc((Class)INHangUpCallIntentResponse) initWithCode:3 userActivity:0];
    [v12 setHungUpCallType:7];
  }
  else
  {
    if (v16)
    {
      LOWORD(v18) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No calls exist. Since call was hung up between confirm and handle, return success.", (uint8_t *)&v18, 2u);
    }

    id v12 = [objc_alloc((Class)INHangUpCallIntentResponse) initWithCode:3 userActivity:0];
  }
  id v4 = 0;
LABEL_14:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100025164()
{
  qword_100058958 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

intptr_t sub_1000253FC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100025804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002581C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002582C(uint64_t a1)
{
}

void sub_100025834(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = IntentHandlerDefaultLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to generate FaceTime link with error %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully generated FaceTime link: %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = v5;
    id v10 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100025D8C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callCenter];
  uint64_t v3 = [v2 incomingCall];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) callCenter];
    id v4 = [v5 incomingVideoCall];

    if (!v4)
    {
      id v15 = +[CallHistoryDataSourcePredicate predicateForJustMissedCalls];
      id v24 = [*(id *)(a1 + 32) dataSource];
      unsigned int v25 = [v24 callHistoryDataSource];
      uint64_t v26 = [v25 callsWithPredicate:v15 limit:1 offset:0 batchSize:1];
      id v27 = [v26 firstObject];

      if (v27)
      {
        uint64_t v28 = +[CallRecordConverter sharedInstance];
        long long v44 = v27;
        uint64_t v29 = +[NSArray arrayWithObjects:&v44 count:1];
        long long v30 = [*(id *)(a1 + 32) dataSource];
        v31 = [v30 contactsDataSource];
        uint64_t v32 = [*(id *)(a1 + 32) dataSource];
        uint64_t v33 = [v32 providerManager];
        id v4 = [v28 callRecordsForRecentCalls:v29 withContactsDataSource:v31 withCallProviderManager:v33];
      }
      else
      {
        id v4 = 0;
      }
      long long v43 = IntentHandlerDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v46 = v4;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "No incoming call exists. Returning no incoming call. Recent Missed Calls: %@", buf, 0xCu);
      }

      id v13 = [objc_alloc((Class)INAnswerCallIntentResponse) initWithCode:4 userActivity:0];
      [v13 setStatusCode:1];
      [v13 setCallRecords:v4];

      goto LABEL_38;
    }
  }
  id v6 = (id *)(a1 + 40);
  unsigned int v7 = [*(id *)(a1 + 40) callIdentifier];
  if (![v7 length])
  {

LABEL_12:
    id v14 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "An incoming call exists. Answering it and returning success", buf, 2u);
    }

    id v15 = [objc_alloc((Class)TUAnswerRequest) initWithCall:v4];
    if ([*v6 _idiom] == (id)4)
    {
      [v15 setBehavior:4];
      BOOL v16 = [*v6 _originatingDeviceIDSIdentifier];
      if ([v16 length])
      {
        uint64_t v17 = [*v6 _isOwnedByCurrentUser];
        unsigned int v18 = [v17 BOOLValue];

        if (v18)
        {
          CFStringRef v19 = [*v6 _originatingDeviceIDSIdentifier];
          int v20 = IntentHandlerDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v46 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Setting endpointIDSDestination: %@", buf, 0xCu);
          }

          __int16 v21 = +[IDSDestination destinationWithURI:v19];
          [v15 setEndpointIDSDestination:v21];
          goto LABEL_35;
        }
      }
      else
      {
      }
      v34 = [*v6 _originatingDeviceRapportMediaSystemIdentifier];
      id v35 = [v34 length];

      if (v35)
      {
        uint64_t v36 = [*v6 _originatingDeviceRapportMediaSystemIdentifier];
        [v15 setEndpointRapportMediaSystemIdentifier:v36];

        uint64_t v37 = IntentHandlerDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = [v15 endpointRapportMediaSystemIdentifier];
          *(_DWORD *)buf = 138412290;
          CFStringRef v46 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Intent contains an originatingDeviceRapportMediaSystemIdentifier: %@", buf, 0xCu);
        }
      }
      uint64_t v39 = [*v6 _originatingDeviceRapportEffectiveIdentifier];
      id v40 = [v39 length];

      if (!v40) {
        goto LABEL_37;
      }
      long long v41 = [*v6 _originatingDeviceRapportEffectiveIdentifier];
      [v15 setEndpointRapportEffectiveIdentifier:v41];

      CFStringRef v19 = IntentHandlerDefaultLog();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      __int16 v21 = [v15 endpointRapportEffectiveIdentifier];
      *(_DWORD *)buf = 138412290;
      CFStringRef v46 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Intent contains an originatingDeviceRapportEffectiveIdentifier: %@", buf, 0xCu);
LABEL_35:

LABEL_36:
      goto LABEL_37;
    }
    if ([*v6 audioRoute] == (id)1)
    {
      id v22 = &TUCallSourceIdentifierSpeakerRoute;
    }
    else
    {
      id v23 = [*v6 audioRoute];
      if (v23 != (id)_INCallAudioRouteHeySiriAudioRoute)
      {
LABEL_37:
        long long v42 = [*(id *)(a1 + 32) callCenter];
        [v42 answerWithRequest:v15];

        id v13 = [objc_alloc((Class)INAnswerCallIntentResponse) initWithCode:4 userActivity:0];
        [v13 setStatusCode:2];
LABEL_38:

        goto LABEL_39;
      }
      id v22 = &TUCallSourceIdentifierHeySiri;
    }
    [v15 setSourceIdentifier:*v22];
    goto LABEL_37;
  }
  BOOL v8 = [*v6 callIdentifier];
  uint64_t v9 = [v4 callUUID];
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if (v10) {
    goto LABEL_12;
  }
  uint64_t v11 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100032360(v11);
  }

  id v12 = IntentHandlerDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100032298((id *)(a1 + 40), v4, v12);
  }

  id v13 = [objc_alloc((Class)INAnswerCallIntentResponse) initWithCode:5 userActivity:0];
LABEL_39:

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

id IntentHandlerDefaultLog()
{
  if (qword_100058970 != -1) {
    dispatch_once(&qword_100058970, &stru_10004D1D8);
  }
  v0 = (void *)qword_100058968;

  return v0;
}

void sub_100026624(id a1)
{
  qword_100058968 = (uint64_t)os_log_create("com.apple.calls.intenthandler", "Default");

  _objc_release_x1();
}

uint64_t sub_100026D7C(uint64_t a1)
{
  qword_100058978 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_100027DC8()
{
  uint64_t v0 = sub_100032780();
  sub_100027E40(v0, qword_100058990);
  sub_100027EA4(v0, (uint64_t)qword_100058990);
  return sub_100032770();
}

uint64_t *sub_100027E40(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100027EA4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100027EE8(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  uint64_t v4 = sub_10002B504(&qword_100058798);
  v3[7] = v4;
  v3[8] = *(void *)(v4 - 8);
  v3[9] = swift_task_alloc();
  return _swift_task_switch(sub_100027FB0, 0, 0);
}

uint64_t sub_100027FB0()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10002805C;
  return MessageStoreController.getMessages(providers:types:)(&off_10004D310, &off_10004D338);
}

uint64_t sub_10002805C(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  *(void *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 96) = a1;
    return _swift_task_switch(sub_1000281B4, 0, 0);
  }
}

uint64_t sub_1000281B4()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[4];
  uint64_t v4 = (void **)v0[5];
  uint64_t v6 = sub_100028374(v0[12]);
  swift_bridgeObjectRelease();
  v0[3] = sub_10002BB2C((unint64_t)v6, v5, v4);
  swift_getKeyPath();
  sub_10002BCF4(&qword_1000587A0, (void (*)(uint64_t))&type metadata accessor for Date);
  sub_1000325A0();
  sub_10002B504(&qword_1000587A8);
  sub_10002BD84(&qword_1000587B0, &qword_1000587A8);
  sub_10002BD84(&qword_1000587B8, &qword_100058798);
  uint64_t v7 = sub_100032860();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(uint64_t))v0[1];
  return v8(v7);
}

void *sub_100028374(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    id result = &_swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t v11 = &_swiftEmptyArrayStorage;
    id result = (void *)sub_100032960();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100032920();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      uint64_t v7 = (objc_class *)type metadata accessor for VoicemailMessageWrapper();
      uint64_t v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR____TtC18PhoneIntentHandler23VoicemailMessageWrapper_wrapped] = v6;
      v10.receiver = v8;
      v10.super_class = v7;
      id v9 = v6;
      objc_msgSendSuper2(&v10, "init");

      sub_100032940();
      sub_100032970();
      sub_100032980();
      sub_100032950();
      if (v2 == v4) {
        return v11;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000329B0();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1000284EC(id *a1)
{
  id v1 = [*a1 date];
  sub_100032600();
}

uint64_t sub_1000286D4(const void *a1, const void *a2, uint64_t a3)
{
  v3[2] = a3;
  id v5 = _Block_copy(a1);
  v3[3] = _Block_copy(a2);
  uint64_t v6 = swift_allocObject();
  v3[4] = v6;
  *(void *)(v6 + 16) = v5;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_1000287CC;
  return sub_100027EE8((uint64_t)sub_10002C1D4, v6);
}

uint64_t sub_1000287CC()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1;
  swift_task_dealloc();
  swift_release();
  swift_release();
  if (v2)
  {
    uint64_t v5 = sub_1000325B0();
    swift_errorRelease();
    Class isa = 0;
    uint64_t v7 = (void *)v5;
  }
  else
  {
    sub_10002B504(&qword_1000587F8);
    Class isa = sub_100032870().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    uint64_t v7 = isa;
  }
  uint64_t v8 = *(void (***)(void, void, void))(v3 + 24);
  ((void (**)(void, Class, uint64_t))v8)[2](v8, isa, v5);

  _Block_release(v8);
  uint64_t v9 = *(uint64_t (**)(void))(v4 + 8);
  return v9();
}

uint64_t sub_100028988(uint64_t a1, uint64_t a2)
{
  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  sub_10002B504(&qword_100058850);
  v3[11] = swift_task_alloc();
  uint64_t v4 = sub_100032640();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  return _swift_task_switch(sub_100028A7C, 0, 0);
}

uint64_t sub_100028A7C()
{
  int v20 = v0;
  uint64_t v1 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[11];
  sub_100032620();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_10002B8EC(v0[11], &qword_100058850);
    if (qword_100058570 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_100032780();
    sub_100027EA4(v4, (uint64_t)qword_100058990);
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_100032760();
    os_log_type_t v6 = sub_1000328D0();
    BOOL v7 = os_log_type_enabled(v5, v6);
    unint64_t v8 = v0[9];
    if (v7)
    {
      uint64_t v9 = v0[8];
      objc_super v10 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)objc_super v10 = 136315138;
      swift_bridgeObjectRetain();
      v0[4] = sub_10002F33C(v9, v8, &v19);
      sub_1000328E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Expected UUID vmIdentifier: %s", v10, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = (uint64_t (*)(void))v0[1];
    return v17(0);
  }
  else
  {
    uint64_t v12 = v0[13];
    uint64_t v11 = v0[14];
    uint64_t v13 = v0[12];
    (*(void (**)(uint64_t, void, uint64_t))(v12 + 32))(v11, v0[11], v13);
    sub_10002B504(&qword_100058790);
    unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    uint64_t v15 = swift_allocObject();
    v0[15] = v15;
    *(_OWORD *)(v15 + 16) = xmmword_100039E70;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v12 + 16))(v15 + v14, v11, v13);
    BOOL v16 = (void *)swift_task_alloc();
    v0[16] = v16;
    void *v16 = v0;
    v16[1] = sub_100028DC8;
    return MessageStoreController.getMessages(recordUUIDs:)(v15);
  }
}

uint64_t sub_100028DC8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_100029214;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_100028EE4;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100028EE4()
{
  id v24 = v0;
  Class super_class = v0[8].super_class;
  if (!((unint64_t)super_class >> 62))
  {
    if (*(void *)(((unint64_t)super_class & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    if (qword_100058570 == -1)
    {
LABEL_9:
      uint64_t v10 = sub_100032780();
      sub_100027EA4(v10, (uint64_t)qword_100058990);
      swift_bridgeObjectRetain_n();
      uint64_t v11 = sub_100032760();
      os_log_type_t v12 = sub_1000328D0();
      BOOL v13 = os_log_type_enabled(v11, v12);
      Class v15 = v0[6].super_class;
      id receiver = v0[7].receiver;
      id v16 = v0[6].receiver;
      unint64_t v17 = (unint64_t)v0[4].super_class;
      if (v13)
      {
        uint64_t v21 = (uint64_t)v0[4].receiver;
        id v22 = v0[6].receiver;
        unsigned int v18 = (uint8_t *)swift_slowAlloc();
        uint64_t v23 = swift_slowAlloc();
        *(_DWORD *)unsigned int v18 = 136315138;
        swift_bridgeObjectRetain();
        v0[3].Class super_class = (Class)sub_10002F33C(v21, v17, &v23);
        sub_1000328E0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Coudln't find voicemail for: %s", v18, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*((void (**)(id, id))v15 + 1))(receiver, v22);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*((void (**)(id, id))v15 + 1))(receiver, v16);
      }
      id v8 = 0;
      goto LABEL_13;
    }
LABEL_18:
    swift_once();
    goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1000329B0();
  swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_8;
  }
LABEL_3:
  if (((unint64_t)super_class & 0xC000000000000001) != 0)
  {
    id v2 = (id)sub_100032920();
    goto LABEL_6;
  }
  if (!*(void *)(((unint64_t)super_class & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_18;
  }
  id v2 = *((id *)v0[8].super_class + 4);
LABEL_6:
  Class v4 = v0[6].super_class;
  id v3 = v0[7].receiver;
  id v5 = v0[6].receiver;
  swift_bridgeObjectRelease();
  uint64_t v6 = (objc_class *)type metadata accessor for VoicemailMessageWrapper();
  BOOL v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC18PhoneIntentHandler23VoicemailMessageWrapper_wrapped] = v2;
  v0[1].id receiver = v7;
  v0[1].Class super_class = v6;
  id v8 = objc_msgSendSuper2(v0 + 1, "init");
  (*((void (**)(id, id))v4 + 1))(v3, v5);
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = (uint64_t (*)(id))v0->super_class;
  return v19(v8);
}

uint64_t sub_100029214()
{
  unint64_t v17 = v0;
  swift_bridgeObjectRelease();
  if (qword_100058570 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100032780();
  sub_100027EA4(v1, (uint64_t)qword_100058990);
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  id v2 = sub_100032760();
  os_log_type_t v3 = sub_1000328D0();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v6 = v0[13];
  uint64_t v5 = v0[14];
  uint64_t v7 = v0[12];
  unint64_t v8 = v0[9];
  if (v4)
  {
    uint64_t v15 = v0[12];
    uint64_t v9 = v0[8];
    uint64_t v10 = swift_slowAlloc();
    unint64_t v14 = (void *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315394;
    swift_bridgeObjectRetain();
    v0[5] = sub_10002F33C(v9, v8, &v16);
    sub_1000328E0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    v0[6] = v11;
    sub_1000328E0();
    void *v14 = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error fetching voicemail for: %s, error: %@", (uint8_t *)v10, 0x16u);
    sub_10002B504(&qword_100058788);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v15);
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  os_log_type_t v12 = (uint64_t (*)(void))v0[1];
  return v12(0);
}

uint64_t sub_1000296A0(int a1, void *aBlock, uint64_t a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v4 = sub_1000327A0();
  uint64_t v6 = v5;
  v3[4] = v5;
  swift_retain();
  uint64_t v7 = (void *)swift_task_alloc();
  v3[5] = v7;
  void *v7 = v3;
  v7[1] = sub_100029774;
  return sub_100028988(v4, v6);
}

uint64_t sub_100029774(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *v2;
  swift_task_dealloc();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    unint64_t v8 = (void *)sub_1000325B0();
    swift_errorRelease();
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);

    _Block_release(v7);
  }
  else
  {
    v7[2](v7, a1, 0);
    _Block_release(v7);
    swift_unknownObjectRelease();
  }
  uint64_t v9 = *(uint64_t (**)(void))(v6 + 8);
  return v9();
}

void sub_100029938(void *a1)
{
  sub_10002B504(&qword_100058870);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B504(&qword_100058850);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100032640();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  os_log_type_t v12 = (char *)&v27 - v11;
  uint64_t v28 = a1;
  id v13 = [a1 vmIdentifier];
  sub_1000327A0();

  sub_100032620();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_10002B8EC((uint64_t)v5, &qword_100058850);
    if (qword_100058570 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_100032780();
    sub_100027EA4(v14, (uint64_t)qword_100058990);
    uint64_t v15 = v28;
    swift_unknownObjectRetain_n();
    uint64_t v16 = sub_100032760();
    os_log_type_t v17 = sub_1000328D0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = 136315138;
      id v19 = [v15 vmIdentifier];
      uint64_t v20 = sub_1000327A0();
      unint64_t v22 = v21;

      uint64_t v29 = sub_10002F33C(v20, v22, &v30);
      sub_1000328E0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Expected UUID vmIdentifier: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
  else
  {
    uint64_t v23 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v23(v12, v5, v6);
    uint64_t v24 = sub_1000328C0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v3, 1, 1, v24);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
    unint64_t v25 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v26 = (char *)swift_allocObject();
    *((void *)v26 + 2) = 0;
    *((void *)v26 + 3) = 0;
    *((void *)v26 + 4) = v27;
    v23(&v26[v25], v10, v6);
    swift_retain();
    sub_10002A640((uint64_t)v3, (uint64_t)&unk_100058768, (uint64_t)v26);
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

uint64_t sub_100029DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = sub_100032780();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  sub_10002B504(&qword_100058740);
  v5[10] = swift_task_alloc();
  sub_10002B504(&qword_100058850);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  uint64_t v7 = sub_100032640();
  v5[13] = v7;
  v5[14] = *(void *)(v7 - 8);
  v5[15] = swift_task_alloc();
  return _swift_task_switch(sub_100029F5C, 0, 0);
}

uint64_t sub_100029F5C()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[12];
  uint64_t v4 = v0[13];
  uint64_t v6 = v0[10];
  uint64_t v5 = v0[11];
  uint64_t v7 = v0[6];
  sub_10002B504(&qword_100058780);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100039E80;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v7, v4);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
  v9(v3, 1, 1, v4);
  v9(v5, 1, 1, v4);
  uint64_t v10 = sub_1000325E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  id v11 = objc_allocWithZone((Class)sub_1000326E0());
  *(void *)(v8 + 32) = sub_1000326D0();
  sub_100032890();
  v0[16] = v8;
  os_log_type_t v12 = (void *)swift_task_alloc();
  v0[17] = v12;
  *os_log_type_t v12 = v0;
  v12[1] = sub_10002A170;
  return MessageStoreController.updateMessages(_:)(v8);
}

uint64_t sub_10002A170()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_10002A2E8, 0, 0);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_10002A2E8()
{
  id v19 = v0;
  swift_bridgeObjectRelease();
  if (qword_100058570 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v3 = v0[7];
  uint64_t v4 = sub_100027EA4(v3, (uint64_t)qword_100058990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_100032760();
  os_log_type_t v6 = sub_1000328D0();
  BOOL v7 = os_log_type_enabled(v5, v6);
  uint64_t v9 = v0[8];
  uint64_t v8 = v0[9];
  uint64_t v10 = v0[7];
  if (v7)
  {
    uint64_t v16 = v0[9];
    uint64_t v17 = v0[7];
    uint64_t v11 = swift_slowAlloc();
    os_log_type_t v12 = (void *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315650;
    v0[2] = sub_10002F33C(0xD00000000000005BLL, 0x800000010003B1A0, &v18);
    sub_1000328E0();
    *(_WORD *)(v11 + 12) = 2080;
    v0[3] = sub_10002F33C(0x646165526B72616DLL, 0xEC000000293A5F28, &v18);
    sub_1000328E0();
    *(_WORD *)(v11 + 22) = 2112;
    swift_errorRetain();
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v13;
    sub_1000328E0();
    *os_log_type_t v12 = v13;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s:%s %@", (uint8_t *)v11, 0x20u);
    sub_10002B504(&qword_100058788);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v17);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = (uint64_t (*)(void))v0[1];
  return v14();
}

uint64_t sub_10002A640(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000328C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000328B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10002B8EC(a1, &qword_100058870);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000328A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002A844()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for MessageStoreWrapper()
{
  return self;
}

uint64_t sub_10002AD20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_1000325E0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002B504(&qword_100058740);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)sub_100032650();
  uint64_t v10 = (void *)sub_100032750();

  if (v10)
  {
    sub_1000325D0();

    uint64_t v11 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v11(v8, v5, v2);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1) {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v11)(a1, v8, v2);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  sub_100032690();
  return sub_10002B8EC((uint64_t)v8, &qword_100058740);
}

uint64_t sub_10002AF80()
{
  uint64_t v0 = sub_1000325E0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v33 = v0;
  uint64_t v34 = v1;
  __chkstk_darwin(v0);
  uint64_t v32 = (uint64_t)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100032610();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100032640();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37[0] = 0;
  v37[1] = 0xE000000000000000;
  sub_100032900(16);
  swift_bridgeObjectRelease();
  strcpy((char *)v37, "vmIdentifier=");
  HIWORD(v37[1]) = -4864;
  sub_100032660();
  uint64_t v11 = sub_100032630();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v38._countAndFlagsBits = v11;
  v38._object = v13;
  sub_1000327D0(v38);
  swift_bridgeObjectRelease();
  v39._countAndFlagsBits = 32;
  v39._object = (void *)0xE100000000000000;
  sub_1000327D0(v39);
  v40._countAndFlagsBits = v37[0];
  uint64_t v14 = (void *)v37[1];
  v37[0] = 0xD000000000000018;
  v37[1] = 0x800000010003B160;
  v40._object = v14;
  sub_1000327D0(v40);
  swift_bridgeObjectRelease();
  uint64_t v15 = v37[0];
  uint64_t v16 = v37[1];
  v37[0] = 0x3D65746164;
  v37[1] = 0xE500000000000000;
  sub_100032670();
  sub_10002BCF4(&qword_100058748, (void (*)(uint64_t))&type metadata accessor for Date);
  v41._countAndFlagsBits = sub_1000329D0();
  sub_1000327D0(v41);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v42._countAndFlagsBits = 32;
  v42._object = (void *)0xE100000000000000;
  sub_1000327D0(v42);
  uint64_t v17 = v37[0];
  uint64_t v18 = (void *)v37[1];
  v37[0] = v15;
  v37[1] = v16;
  swift_bridgeObjectRetain();
  v43._countAndFlagsBits = v17;
  v43._object = v18;
  sub_1000327D0(v43);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = v37[0];
  uint64_t v20 = v37[1];
  v37[0] = 0;
  v37[1] = 0xE000000000000000;
  sub_100032900(23);
  swift_bridgeObjectRelease();
  v37[0] = 0xD000000000000014;
  v37[1] = 0x800000010003B180;
  uint64_t v35 = sub_1000326A0();
  uint64_t v36 = v21;
  sub_10002B504(&qword_100058750);
  v44._countAndFlagsBits = sub_1000327B0();
  sub_1000327D0(v44);
  swift_bridgeObjectRelease();
  v45._countAndFlagsBits = 32;
  v45._object = (void *)0xE100000000000000;
  sub_1000327D0(v45);
  uint64_t v22 = v37[0];
  uint64_t v23 = (void *)v37[1];
  v37[0] = v19;
  v37[1] = v20;
  swift_bridgeObjectRetain();
  v46._countAndFlagsBits = v22;
  v46._object = v23;
  sub_1000327D0(v46);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = v37[0];
  uint64_t v24 = v37[1];
  strcpy((char *)v37, "dataURL=");
  BYTE1(v37[1]) = 0;
  WORD1(v37[1]) = 0;
  HIDWORD(v37[1]) = -402653184;
  uint64_t v26 = v32;
  sub_10002AD20(v32);
  sub_10002BCF4(&qword_100058758, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v27 = v33;
  v47._countAndFlagsBits = sub_1000329D0();
  sub_1000327D0(v47);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v26, v27);
  uint64_t v28 = v37[0];
  uint64_t v29 = (void *)v37[1];
  v37[0] = v25;
  v37[1] = v24;
  swift_bridgeObjectRetain();
  v48._countAndFlagsBits = v28;
  v48._object = v29;
  sub_1000327D0(v48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v49._countAndFlagsBits = 41;
  v49._object = (void *)0xE100000000000000;
  sub_1000327D0(v49);
  swift_bridgeObjectRelease();
  return v37[0];
}

id sub_10002B49C()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for VoicemailMessageWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for VoicemailMessageWrapper()
{
  return self;
}

uint64_t sub_10002B504(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10002B548(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10002B624;
  return v6(a1);
}

uint64_t sub_10002B624()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002B71C()
{
  uint64_t v1 = sub_100032640();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002B7F0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100032640() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_10002C1DC;
  return sub_100029DD0(a1, v5, v6, v7, v8);
}

uint64_t sub_10002B8EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10002B504(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002B948()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002B980(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10002BA38;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100058770 + dword_100058770);
  return v6(a1, v4);
}

uint64_t sub_10002BA38()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void **sub_10002BB2C(unint64_t a1, uint64_t (*a2)(uint64_t), void **a3)
{
  unint64_t v7 = a1;
  uint64_t v17 = (void **)&_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_18:
    uint64_t v8 = sub_1000329B0();
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v8)
    {
LABEL_3:
      unint64_t v9 = 0;
      uint64_t v15 = v7 & 0xFFFFFFFFFFFFFF8;
      unint64_t v16 = v7 & 0xC000000000000001;
      unint64_t v14 = v7;
      while (1)
      {
        if (v16)
        {
          uint64_t v10 = sub_100032920();
          unint64_t v11 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
LABEL_14:
            __break(1u);
LABEL_15:
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            swift_release();
            return v3;
          }
        }
        else
        {
          if (v9 >= *(void *)(v15 + 16))
          {
            __break(1u);
            goto LABEL_18;
          }
          uint64_t v10 = *(void *)(v7 + 8 * v9 + 32);
          swift_unknownObjectRetain();
          unint64_t v11 = v9 + 1;
          if (__OFADD__(v9, 1)) {
            goto LABEL_14;
          }
        }
        uint64_t v3 = a3;
        char v12 = a2(v10);
        if (v4) {
          goto LABEL_15;
        }
        if (v12)
        {
          sub_100032940();
          sub_100032970();
          unint64_t v7 = v14;
          sub_100032980();
          uint64_t v3 = (void **)&v17;
          sub_100032950();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        ++v9;
        if (v11 == v8)
        {
          uint64_t v3 = v17;
          goto LABEL_20;
        }
      }
    }
  }
  uint64_t v3 = (void **)&_swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return v3;
}

const char *sub_10002BCE4()
{
  return "date";
}

uint64_t sub_10002BCF4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002BD3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10002BD84(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002BD3C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10002BDC8()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002BE10()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002BA38;
  uint64_t v6 = (uint64_t (*)(int, void *, uint64_t))((char *)&dword_1000587C0 + dword_1000587C0);
  return v6(v2, v3, v4);
}

uint64_t sub_10002BEC8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002C1DC;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000588D8 + dword_1000588D8);
  return v6(v2, v3, v4);
}

uint64_t sub_10002BF8C()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002BFD4()
{
  uint64_t v2 = (const void *)v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002C1DC;
  uint64_t v6 = (uint64_t (*)(const void *, const void *, uint64_t))((char *)&dword_1000587D8 + dword_1000587D8);
  return v6(v2, v3, v4);
}

uint64_t sub_10002C090()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002C0D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10002C1DC;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000588E0 + dword_1000588E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10002C19C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002C1D4(uint64_t a1)
{
  return sub_10002E13C(a1, *(void *)(v1 + 16));
}

id sub_10002C1E0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for IntentHandlerMessageStore()) init];
  qword_1000589A8 = (uint64_t)result;
  return result;
}

id sub_10002C270()
{
  id v0 = [objc_allocWithZone((Class)VMVoicemailManager) init];
  sub_100032730();
  uint64_t v1 = sub_100032720();
  type metadata accessor for MessageStoreWrapper();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = v1;
  id v3 = [objc_allocWithZone((Class)IntentHandlerFeatureFlags) init];
  uint64_t v4 = (objc_class *)type metadata accessor for IntentHandlerMessageStore();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___IntentHandlerMessageStore_vmManager] = v0;
  *(void *)&v5[OBJC_IVAR___IntentHandlerMessageStore_messageStore] = v2;
  *(void *)&v5[OBJC_IVAR___IntentHandlerMessageStore_featureFlags] = v3;
  v8.id receiver = v5;
  v8.Class super_class = v4;
  id v6 = objc_msgSendSuper2(&v8, "init");
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

uint64_t sub_10002C408(uint64_t a1, uint64_t a2)
{
  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return _swift_task_switch(sub_10002C42C, 0, 0);
}

uint64_t sub_10002C42C()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 2;
  id v3 = v0 + 10;
  uint64_t v5 = v1[18];
  uint64_t v4 = v1[19];
  uint64_t v6 = v1[17];
  unsigned int v7 = [*(id *)(v4 + OBJC_IVAR___IntentHandlerMessageStore_featureFlags) vmdEnabled];
  objc_super v8 = &OBJC_IVAR___IntentHandlerMessageStore_vmManager;
  if (!v7) {
    objc_super v8 = &OBJC_IVAR___IntentHandlerMessageStore_messageStore;
  }
  unint64_t v9 = *(void **)(v4 + *v8);
  v1[20] = v9;
  v1[14] = v6;
  v1[15] = v5;
  v1[10] = _NSConcreteStackBlock;
  v1[11] = 1107296256;
  v1[12] = sub_10002C7E8;
  v1[13] = &unk_10004D4F8;
  uint64_t v10 = _Block_copy(v3);
  v1[21] = v10;
  swift_unknownObjectRetain();
  swift_retain();
  swift_release();
  v1[2] = v1;
  v1[7] = v1 + 16;
  v1[3] = sub_10002C5E4;
  uint64_t v11 = swift_continuation_init();
  v1[10] = _NSConcreteStackBlock;
  v1[11] = 0x40000000;
  v1[12] = sub_10002C844;
  v1[13] = &unk_10004D520;
  v1[14] = v11;
  [v9 fetchVoicemailsMatching:v10 completion:v3];
  return _swift_continuation_await(v2);
}

uint64_t sub_10002C5E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    uint64_t v2 = sub_10002C768;
  }
  else {
    uint64_t v2 = sub_10002C6F4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002C6F4()
{
  uint64_t v1 = (const void *)v0[21];
  uint64_t v2 = v0[16];
  swift_unknownObjectRelease();
  _Block_release(v1);
  id v3 = (uint64_t (*)(uint64_t))v0[1];
  return v3(v2);
}

uint64_t sub_10002C768()
{
  uint64_t v1 = *(const void **)(v0 + 168);
  swift_willThrow();
  swift_unknownObjectRelease();
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10002C7E8(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  swift_unknownObjectRelease();
  return v1 & 1;
}

uint64_t sub_10002C844(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10002B504((uint64_t *)&unk_100058860);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10002B504(&qword_1000587F8);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_100032880();
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_10002CA98(const void *a1, const void *a2, void *a3)
{
  v3[2] = a3;
  uint64_t v6 = _Block_copy(a1);
  v3[3] = _Block_copy(a2);
  uint64_t v7 = swift_allocObject();
  v3[4] = v7;
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  unint64_t v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  void *v9 = v3;
  v9[1] = sub_10002CBA8;
  v9[18] = v7;
  v9[19] = v8;
  v9[17] = sub_10002C1D4;
  return _swift_task_switch(sub_10002C42C, 0, 0);
}

uint64_t sub_10002CBA8()
{
  uint64_t v2 = v0;
  uint64_t v3 = *v1;
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v5 = *v1;
  swift_task_dealloc();

  swift_release();
  if (v2)
  {
    uint64_t v6 = sub_1000325B0();
    swift_errorRelease();
    Class isa = 0;
    id v8 = (void *)v6;
  }
  else
  {
    sub_10002B504(&qword_1000587F8);
    Class isa = sub_100032870().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v6 = 0;
    id v8 = isa;
  }
  unint64_t v9 = *(void (***)(void, void, void))(v3 + 24);
  ((void (**)(void, Class, uint64_t))v9)[2](v9, isa, v6);

  _Block_release(v9);
  uint64_t v10 = *(uint64_t (**)(void))(v5 + 8);
  return v10();
}

uint64_t sub_10002CD60(uint64_t a1, uint64_t a2)
{
  v3[31] = a2;
  v3[32] = v2;
  v3[30] = a1;
  sub_10002B504(&qword_100058850);
  v3[33] = swift_task_alloc();
  return _swift_task_switch(sub_10002CDF8, 0, 0);
}

uint64_t sub_10002CDF8()
{
  Swift::String v46 = v0;
  uint64_t v1 = v0[33];
  sub_100032620();
  uint64_t v2 = sub_100032640();
  int v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48))(v1, 1, v2);
  uint64_t v4 = sub_10002DE1C(v1);
  if (v3 != 1)
  {
    uint64_t v12 = *(void **)(v0[32] + OBJC_IVAR___IntentHandlerMessageStore_messageStore);
    NSString v13 = sub_100032790();
    v0[34] = v13;
    v0[10] = v0;
    v0[15] = v0 + 29;
    v0[11] = sub_10002D3E8;
    uint64_t v14 = swift_continuation_init();
    v0[23] = _NSConcreteStackBlock;
    v0[24] = 0x40000000;
    v0[25] = sub_10002D7E0;
    v0[26] = &unk_10004D4E0;
    v0[27] = v14;
    [v12 fetchVoicemailWithIdentifier:v13 completion:v0 + 23];
    uint64_t v4 = (uint64_t)(v0 + 10);
    goto LABEL_50;
  }
  uint64_t v6 = v0[30];
  unint64_t v5 = v0[31];
  uint64_t v7 = HIBYTE(v5) & 0xF;
  uint64_t v8 = v6 & 0xFFFFFFFFFFFFLL;
  if ((v5 & 0x2000000000000000) != 0) {
    uint64_t v9 = HIBYTE(v5) & 0xF;
  }
  else {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9) {
    goto LABEL_27;
  }
  if ((v5 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    sub_10002FD2C(v6, v5, 10);
    char v44 = v43;
    swift_bridgeObjectRelease();
    if (v44) {
      goto LABEL_27;
    }
    goto LABEL_49;
  }
  if ((v5 & 0x2000000000000000) == 0)
  {
    if ((v6 & 0x1000000000000000) != 0) {
      uint64_t v10 = (unsigned __int8 *)((v5 & 0xFFFFFFFFFFFFFFFLL) + 32);
    }
    else {
      uint64_t v10 = (unsigned __int8 *)sub_100032930();
    }
    sub_10002FD14(v10, v8, 10);
    if (v11) {
      goto LABEL_27;
    }
    goto LABEL_49;
  }
  v45[0] = v0[30];
  v45[1] = v5 & 0xFFFFFFFFFFFFFFLL;
  if (v6 == 43)
  {
    if (v7)
    {
      if (v7 != 1)
      {
        if ((BYTE1(v6) - 48) > 9u) {
          goto LABEL_27;
        }
        if (v7 != 2)
        {
          if ((BYTE2(v6) - 48) > 9u) {
            goto LABEL_27;
          }
          uint64_t v28 = v7 - 3;
          if (v7 != 3)
          {
            uint64_t v29 = (unsigned __int8 *)v45 + 3;
            uint64_t v30 = 10 * (BYTE1(v6) - 48) + (BYTE2(v6) - 48);
            while (1)
            {
              unsigned int v31 = *v29 - 48;
              if (v31 > 9) {
                goto LABEL_27;
              }
              uint64_t v32 = (unsigned __int128)(v30 * (__int128)10) >> 64;
              uint64_t v33 = 10 * v30;
              if (v32 != v33 >> 63) {
                goto LABEL_27;
              }
              BOOL v21 = __OFADD__(v33, v31);
              uint64_t v30 = v33 + v31;
              if (v21) {
                goto LABEL_27;
              }
              LOBYTE(v7) = 0;
              ++v29;
              if (!--v28) {
                goto LABEL_62;
              }
            }
          }
        }
        goto LABEL_49;
      }
      goto LABEL_62;
    }
LABEL_68:
    __break(1u);
    return _swift_continuation_await(v4);
  }
  if (v6 != 45)
  {
    if (!v7 || (v6 - 48) > 9u) {
      goto LABEL_27;
    }
    if (v7 != 1)
    {
      if ((BYTE1(v6) - 48) > 9u) {
        goto LABEL_27;
      }
      uint64_t v37 = v7 - 2;
      if (v7 != 2)
      {
        Swift::String v38 = (unsigned __int8 *)v45 + 2;
        uint64_t v39 = 10 * (v6 - 48) + (BYTE1(v6) - 48);
        while (1)
        {
          unsigned int v40 = *v38 - 48;
          if (v40 > 9) {
            goto LABEL_27;
          }
          uint64_t v41 = (unsigned __int128)(v39 * (__int128)10) >> 64;
          uint64_t v42 = 10 * v39;
          if (v41 != v42 >> 63) {
            goto LABEL_27;
          }
          BOOL v21 = __OFADD__(v42, v40);
          uint64_t v39 = v42 + v40;
          if (v21) {
            goto LABEL_27;
          }
          LOBYTE(v7) = 0;
          ++v38;
          if (!--v37) {
            goto LABEL_62;
          }
        }
      }
    }
    goto LABEL_49;
  }
  if (!v7)
  {
    __break(1u);
    goto LABEL_68;
  }
  if (v7 == 1)
  {
LABEL_62:
    if (v7) {
      goto LABEL_27;
    }
LABEL_49:
    uint64_t v34 = *(void **)(v0[32] + OBJC_IVAR___IntentHandlerMessageStore_vmManager);
    NSString v35 = sub_100032790();
    v0[36] = v35;
    v0[2] = v0;
    v0[7] = v0 + 28;
    v0[3] = sub_10002D56C;
    uint64_t v36 = swift_continuation_init();
    v0[18] = _NSConcreteStackBlock;
    v0[19] = 0x40000000;
    v0[20] = sub_10002D7E0;
    v0[21] = &unk_10004D4C8;
    v0[22] = v36;
    [v34 fetchVoicemailWithIdentifier:v35 completion:v0 + 18];
    uint64_t v4 = (uint64_t)(v0 + 2);
LABEL_50:
    return _swift_continuation_await(v4);
  }
  if ((BYTE1(v6) - 48) > 9u) {
    goto LABEL_27;
  }
  if (v7 == 2) {
    goto LABEL_49;
  }
  if ((BYTE2(v6) - 48) <= 9u)
  {
    uint64_t v15 = v7 - 3;
    if (v7 != 3)
    {
      unint64_t v16 = (unsigned __int8 *)v45 + 3;
      uint64_t v17 = -10 * (BYTE1(v6) - 48) - (BYTE2(v6) - 48);
      while (1)
      {
        unsigned int v18 = *v16 - 48;
        if (v18 > 9) {
          goto LABEL_27;
        }
        uint64_t v19 = (unsigned __int128)(v17 * (__int128)10) >> 64;
        uint64_t v20 = 10 * v17;
        if (v19 != v20 >> 63) {
          goto LABEL_27;
        }
        BOOL v21 = __OFSUB__(v20, v18);
        uint64_t v17 = v20 - v18;
        if (v21) {
          goto LABEL_27;
        }
        LOBYTE(v7) = 0;
        ++v16;
        if (!--v15) {
          goto LABEL_62;
        }
      }
    }
    goto LABEL_49;
  }
LABEL_27:
  if (qword_100058570 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_100032780();
  sub_100027EA4(v22, (uint64_t)qword_100058990);
  uint64_t v23 = sub_100032760();
  os_log_type_t v24 = sub_1000328D0();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Unrecognized identifier, returning nil", v25, 2u);
    swift_slowDealloc();
  }

  swift_task_dealloc();
  uint64_t v26 = (uint64_t (*)(void))v0[1];
  return v26(0);
}

uint64_t sub_10002D3E8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 280) = v1;
  if (v1) {
    uint64_t v2 = sub_10002D6F0;
  }
  else {
    uint64_t v2 = sub_10002D4F8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002D4F8()
{
  uint64_t v1 = *(void *)(v0 + 232);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10002D56C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1) {
    uint64_t v2 = sub_10002D768;
  }
  else {
    uint64_t v2 = sub_10002D67C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10002D67C()
{
  uint64_t v1 = *(void *)(v0 + 224);

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_10002D6F0()
{
  uint64_t v1 = *(void **)(v0 + 272);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10002D768()
{
  uint64_t v1 = *(void **)(v0 + 288);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10002D7E0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_10002B504((uint64_t *)&unk_100058860);
    uint64_t v5 = swift_allocError();
    void *v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    uint64_t v10 = a2;
    uint64_t v8 = *(void *)(*(void *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    sub_10002DE7C((uint64_t)&v10, v8);
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_10002DA24(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_1000327A0();
  uint64_t v7 = v6;
  v3[4] = v6;
  a3;
  uint64_t v8 = (void *)swift_task_alloc();
  v3[5] = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_10002DAF8;
  return sub_10002CD60(v5, v7);
}

uint64_t sub_10002DAF8(uint64_t a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 16);
  uint64_t v7 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (***)(void, void, void))(v5 + 24);
  if (v3)
  {
    uint64_t v9 = (void *)sub_1000325B0();
    swift_errorRelease();
    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);

    _Block_release(v8);
  }
  else
  {
    v8[2](v8, a1, 0);
    _Block_release(v8);
    swift_unknownObjectRelease();
  }
  uint64_t v10 = *(uint64_t (**)(void))(v7 + 8);
  return v10();
}

id sub_10002DD68()
{
  v2.id receiver = v0;
  v2.Class super_class = (Class)type metadata accessor for IntentHandlerMessageStore();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IntentHandlerMessageStore()
{
  return self;
}

uint64_t sub_10002DE1C(uint64_t a1)
{
  uint64_t v2 = sub_10002B504(&qword_100058850);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002DE7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002B504(&qword_100058858);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002DEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002DEF4()
{
  return swift_release();
}

uint64_t sub_10002DEFC()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002DF44()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002BA38;
  uint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_100058878 + dword_100058878);
  return v6(v2, v3, v4);
}

uint64_t sub_10002E000()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002E048()
{
  uint64_t v2 = (const void *)v0[2];
  uint64_t v3 = (const void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002C1DC;
  uint64_t v6 = (uint64_t (*)(const void *, const void *, void *))((char *)&dword_100058898 + dword_100058898);
  return v6(v2, v3, v4);
}

uint64_t sub_10002E104()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002E13C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_10002E1C0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_10002E218(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_10002B504(&qword_1000587F8);
    uint64_t v3 = sub_1000329A0();
    swift_bridgeObjectRelease();
    return v3;
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_1000329E0();
    return a1;
  }
}

uint64_t sub_10002E418(const void *a1, const void *a2, void *a3)
{
  v3[8] = a3;
  uint64_t v6 = _Block_copy(a1);
  v3[9] = _Block_copy(a2);
  uint64_t v7 = swift_allocObject();
  v3[10] = v7;
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  return _swift_task_switch(sub_10002E4C4, 0, 0);
}

uint64_t sub_10002E4C4()
{
  uint64_t v2 = (void (**)(void, void, void))v0[9];
  uint64_t v1 = v0[10];
  uint64_t v3 = (void *)v0[8];
  v0[6] = sub_100030784;
  v0[7] = v1;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10002E1C0;
  v0[5] = &unk_10004D790;
  id v4 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  id v5 = [v3 voicemailsPassingTest:v4];
  _Block_release(v4);
  sub_1000307C4();
  unint64_t v6 = sub_100032880();

  sub_10002E218(v6);
  swift_bridgeObjectRelease();

  swift_release();
  sub_10002B504(&qword_1000587F8);
  Class isa = sub_100032870().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class, void))v2)[2](v2, isa, 0);

  _Block_release(v2);
  id v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10002E654(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_10002E678, 0, 0);
}

void sub_10002E678()
{
  uint64_t v31 = v0;
  uint64_t v1 = *(void *)(v0 + 16);
  unint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFLL;
  if ((v2 & 0x2000000000000000) != 0) {
    uint64_t v5 = HIBYTE(v2) & 0xF;
  }
  else {
    uint64_t v5 = v1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    goto LABEL_55;
  }
  if ((v2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = (uint64_t)sub_10002FD2C(v1, v2, 10);
    char v24 = v23;
    swift_bridgeObjectRelease();
    if ((v24 & 1) == 0) {
      goto LABEL_37;
    }
    goto LABEL_55;
  }
  if ((v2 & 0x2000000000000000) != 0)
  {
    v30[0] = *(void *)(v0 + 16);
    v30[1] = v2 & 0xFFFFFFFFFFFFFFLL;
    if (v1 == 43)
    {
      if (!v3) {
        goto LABEL_66;
      }
      if (v3 == 1) {
        goto LABEL_64;
      }
      if ((BYTE1(v1) - 48) > 9u) {
        goto LABEL_33;
      }
      uint64_t v9 = (BYTE1(v1) - 48);
      if (v3 != 2)
      {
        if ((BYTE2(v1) - 48) > 9u) {
          goto LABEL_33;
        }
        uint64_t v9 = 10 * (BYTE1(v1) - 48) + (BYTE2(v1) - 48);
        uint64_t v10 = v3 - 3;
        if (v3 != 3)
        {
          char v11 = (unsigned __int8 *)v30 + 3;
          while (1)
          {
            unsigned int v12 = *v11 - 48;
            if (v12 > 9) {
              goto LABEL_33;
            }
            uint64_t v13 = 10 * v9;
            if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63) {
              goto LABEL_33;
            }
            uint64_t v9 = v13 + v12;
            if (__OFADD__(v13, v12)) {
              goto LABEL_33;
            }
            LOBYTE(v3) = 0;
            ++v11;
            if (!--v10) {
              goto LABEL_36;
            }
          }
        }
      }
    }
    else
    {
      if (v1 == 45)
      {
        if (v3)
        {
          if (v3 != 1)
          {
            if ((BYTE1(v1) - 48) > 9u) {
              goto LABEL_33;
            }
            if (v3 == 2)
            {
              LOBYTE(v3) = 0;
              uint64_t v9 = -(uint64_t)(BYTE1(v1) - 48);
              goto LABEL_36;
            }
            if ((BYTE2(v1) - 48) > 9u) {
              goto LABEL_33;
            }
            uint64_t v9 = -10 * (BYTE1(v1) - 48) - (BYTE2(v1) - 48);
            uint64_t v19 = v3 - 3;
            if (v3 != 3)
            {
              uint64_t v20 = (unsigned __int8 *)v30 + 3;
              while (1)
              {
                unsigned int v21 = *v20 - 48;
                if (v21 > 9) {
                  goto LABEL_33;
                }
                uint64_t v22 = 10 * v9;
                if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63) {
                  goto LABEL_33;
                }
                uint64_t v9 = v22 - v21;
                if (__OFSUB__(v22, v21)) {
                  goto LABEL_33;
                }
                LOBYTE(v3) = 0;
                ++v20;
                if (!--v19) {
                  goto LABEL_36;
                }
              }
            }
            goto LABEL_35;
          }
LABEL_64:
          uint64_t v9 = 0;
LABEL_36:
          if ((v3 & 1) == 0) {
            goto LABEL_37;
          }
LABEL_55:
          if (qword_100058570 != -1) {
            swift_once();
          }
          uint64_t v25 = sub_100032780();
          sub_100027EA4(v25, (uint64_t)qword_100058990);
          uint64_t v26 = sub_100032760();
          os_log_type_t v27 = sub_1000328D0();
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v28 = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, v27, "Expected Int vmIdentifier to query for VMVoicemail", v28, 2u);
            swift_slowDealloc();
          }

          id v14 = 0;
          goto LABEL_60;
        }
        __break(1u);
LABEL_66:
        __break(1u);
        return;
      }
      if (!v3 || (v1 - 48) > 9u)
      {
LABEL_33:
        uint64_t v9 = 0;
        LOBYTE(v3) = 1;
        goto LABEL_36;
      }
      uint64_t v9 = (v1 - 48);
      if (v3 != 1)
      {
        if ((BYTE1(v1) - 48) > 9u) {
          goto LABEL_33;
        }
        uint64_t v9 = 10 * (v1 - 48) + (BYTE1(v1) - 48);
        uint64_t v15 = v3 - 2;
        if (v3 != 2)
        {
          unint64_t v16 = (unsigned __int8 *)v30 + 2;
          while (1)
          {
            unsigned int v17 = *v16 - 48;
            if (v17 > 9) {
              goto LABEL_33;
            }
            uint64_t v18 = 10 * v9;
            if ((unsigned __int128)(v9 * (__int128)10) >> 64 != (10 * v9) >> 63) {
              goto LABEL_33;
            }
            uint64_t v9 = v18 + v17;
            if (__OFADD__(v18, v17)) {
              goto LABEL_33;
            }
            LOBYTE(v3) = 0;
            ++v16;
            if (!--v15) {
              goto LABEL_36;
            }
          }
        }
      }
    }
LABEL_35:
    LOBYTE(v3) = 0;
    goto LABEL_36;
  }
  if ((v1 & 0x1000000000000000) != 0) {
    unint64_t v6 = (unsigned __int8 *)((v2 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else {
    unint64_t v6 = (unsigned __int8 *)sub_100032930();
  }
  uint64_t v7 = sub_10002FE14(v6, v4, 10);
  if (v8) {
    goto LABEL_55;
  }
  uint64_t v9 = (uint64_t)v7;
LABEL_37:
  id v14 = [*(id *)(v0 + 32) voicemailWithIdentifier:v9];
LABEL_60:
  uint64_t v29 = *(void (**)(id))(v0 + 8);
  v29(v14);
}

uint64_t sub_10002EBEC(int a1, void *aBlock, void *a3)
{
  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  uint64_t v5 = sub_1000327A0();
  uint64_t v7 = v6;
  v3[4] = v6;
  id v8 = a3;
  uint64_t v9 = (void *)swift_task_alloc();
  v3[5] = v9;
  void *v9 = v3;
  v9[3] = v7;
  v9[4] = v8;
  v9[1] = sub_10002DAF8;
  v9[2] = v5;
  return _swift_task_switch(sub_10002E678, 0, 0);
}

void sub_10002ECD4()
{
  self;
  uint64_t v1 = swift_dynamicCastObjCClass();
  if (v1)
  {
    uint64_t v2 = v1;
    swift_unknownObjectRetain();
    id v9 = [v0 markVoicemailAsRead:v2];
    swift_unknownObjectRelease();
  }
  else
  {
    if (qword_100058570 != -1) {
      swift_once();
    }
    uint64_t v3 = sub_100032780();
    sub_100027EA4(v3, (uint64_t)qword_100058990);
    swift_unknownObjectRetain_n();
    uint64_t v4 = sub_100032760();
    os_log_type_t v5 = sub_1000328D0();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_getObjectType();
      uint64_t v7 = sub_1000329F0();
      sub_10002F33C(v7, v8, &v10);
      sub_1000328E0();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Received %s but feature flag is off", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

uint64_t sub_10002F000(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10002C1DC;
  return v6();
}

uint64_t sub_10002F0CC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  os_log_type_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_10002C1DC;
  return v7();
}

uint64_t sub_10002F198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000328C0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000328B0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10002FBC4(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000328A0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10002F33C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002F410(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002FA60((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10002FA60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002FA10((uint64_t)v12);
  return v7;
}

uint64_t sub_10002F410(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1000328F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002F5CC(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100032930();
  if (!v8)
  {
    sub_100032990();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000329C0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10002F5CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002F664(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002F8C0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002F8C0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002F664(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10002F7DC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100032910();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100032990();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000327E0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000329C0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100032990();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002F7DC(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_10002B504(&qword_1000588C0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002F844(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_100032830();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = sub_100032800();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_10002F8C0(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_10002B504(&qword_1000588C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1000329C0();
  __break(1u);
  return result;
}

uint64_t sub_10002FA10(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10002FA60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002FAC0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002FB08()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002C1DC;
  unint64_t v6 = (uint64_t (*)(int, void *, void *))((char *)&dword_1000588C8 + dword_1000588C8);
  return v6(v2, v3, v4);
}

uint64_t sub_10002FBC4(uint64_t a1)
{
  uint64_t v2 = sub_10002B504(&qword_100058870);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002FC24()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002FC5C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_10002BA38;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000588E8 + dword_1000588E8);
  return v6(a1, v4);
}

unsigned __int8 *sub_10002FD14(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_10002FE14(a1, a2, a3);
}

unsigned __int8 *sub_10002FD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100032840();
  unint64_t v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v8 = HIBYTE(v6) & 0xF;
    uint64_t v13 = v5;
    uint64_t v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    int64_t v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  uint64_t v5 = sub_100030090();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  unint64_t v6 = v10;
  if ((v10 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    int64_t v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    int64_t v7 = (unsigned __int8 *)sub_100032930();
  }
LABEL_7:
  size_t v11 = sub_10002FE14(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_10002FE14(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            uint64_t v9 = 0;
            for (i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8) {
                    return 0;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              uint64_t v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
                return 0;
              }
              uint64_t v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12))) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      unsigned __int8 v22 = a3 + 48;
      unsigned __int8 v23 = a3 + 55;
      unsigned __int8 v24 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v22 = 58;
      }
      else
      {
        unsigned __int8 v24 = 97;
        unsigned __int8 v23 = 65;
      }
      if (result)
      {
        uint64_t v25 = 0;
        do
        {
          unsigned int v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24) {
                return 0;
              }
              char v27 = -87;
            }
            else
            {
              char v27 = -55;
            }
          }
          else
          {
            char v27 = -48;
          }
          uint64_t v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63) {
            return 0;
          }
          uint64_t v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27))) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  uint64_t v14 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v15 = a3 + 48;
  unsigned __int8 v16 = a3 + 55;
  unsigned __int8 v17 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v15 = 58;
  }
  else
  {
    unsigned __int8 v17 = 97;
    unsigned __int8 v16 = 65;
  }
  if (!result) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v18 = result + 1;
  do
  {
    unsigned int v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17) {
          return 0;
        }
        char v20 = -87;
      }
      else
      {
        char v20 = -55;
      }
    }
    else
    {
      char v20 = -48;
    }
    uint64_t v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63) {
      return 0;
    }
    uint64_t v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20))) {
      return 0;
    }
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100030090()
{
  unint64_t v0 = sub_100032850();
  uint64_t v4 = sub_100030110(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100030110(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = sub_100030268(a1, a2, a3, a4);
    if (!v9
      || (uint64_t v10 = v9,
          unsigned int v11 = sub_10002F7DC(v9, 0),
          unint64_t v12 = sub_100030368((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRelease(),
          v12 == v10))
    {
      uint64_t v13 = sub_1000327C0();
      swift_release();
      return v13;
    }
    __break(1u);
  }
  else
  {
    if ((a4 & 0x2000000000000000) != 0)
    {
      v14[0] = a3;
      v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
      return sub_1000327C0();
    }
    if ((a3 & 0x1000000000000000) != 0) {
      goto LABEL_4;
    }
  }
  sub_100032930();
LABEL_4:

  return sub_1000327C0();
}

uint64_t sub_100030268(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = a3;
  unint64_t v6 = a2;
  unint64_t v7 = a1;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    a1 = sub_10002F844(a1, a3, a4);
    unint64_t v7 = a1;
  }
  if ((v6 & 0xC) == v9)
  {
    a1 = sub_10002F844(v6, v5, v4);
    unint64_t v6 = a1;
    if ((v4 & 0x1000000000000000) == 0) {
      return (v6 >> 16) - (v7 >> 16);
    }
  }
  else if ((v4 & 0x1000000000000000) == 0)
  {
    return (v6 >> 16) - (v7 >> 16);
  }
  unint64_t v11 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    unint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v11 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v11 >= v6 >> 16)
  {
    a1 = v7;
    a2 = v6;
    a3 = v5;
    a4 = v4;
    return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
  }
  __break(1u);
  return String.UTF8View._foreignDistance(from:to:)(a1, a2, a3, a4);
}

unint64_t sub_100030368(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    void *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    uint64_t result = v12;
    if (v17 == v15) {
      uint64_t result = sub_10002F844(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      uint64_t result = sub_100032820();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          uint64_t result = sub_100032930();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    uint64_t result = sub_10002F844(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_1000327F0();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_10003057C()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000305C4()
{
  unint64_t v2 = (const void *)v0[2];
  unint64_t v3 = (const void *)v0[3];
  unint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_10002C1DC;
  unint64_t v6 = (uint64_t (*)(const void *, const void *, void *))((char *)&dword_100058900 + dword_100058900);
  return v6(v2, v3, v4);
}

uint64_t sub_100030680(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  unint64_t v6 = (int *)v1[4];
  unint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10002BA38;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000588E0 + dword_1000588E0);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10003074C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100030784()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000307AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000307BC()
{
  return swift_release();
}

unint64_t sub_1000307C4()
{
  unint64_t result = qword_100058920;
  if (!qword_100058920)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100058920);
  }
  return result;
}

uint64_t INCallCapability.debugDescription.getter()
{
  uint64_t BackingType = INCallCapabilityGetBackingType();
  if (BackingType == 2)
  {
    uint64_t v1 = @"VIDEO_CALL";
    unint64_t v3 = @"VIDEO_CALL";
  }
  else if (BackingType == 1)
  {
    uint64_t v1 = @"AUDIO_CALL";
    uint64_t v2 = @"AUDIO_CALL";
  }
  else
  {
    uint64_t v1 = +[NSString stringWithFormat:@"(unknown: %i)", BackingType];
  }
  uint64_t v4 = v1;
  uint64_t v5 = sub_1000327A0();

  return v5;
}

void sub_1000308B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "siriMatches contactIDs don't correspond to any contacts in address book.", v1, 2u);
}

void sub_1000308F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error performing contact search: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100030970(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found %ld contacts in search by name", (uint8_t *)&v3, 0xCu);
}

void sub_1000309FC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error performing contact search by name: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100030A74(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not determine Core Telephony Subscription Info. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100030AEC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found ISO Country Code override: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100030B64(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030BD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030C3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "App supports INStartCallIntent - prefer this over deprecated calling intents.", v1, 2u);
}

void sub_100030C80(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error when fetching application record for appId: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100030D08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030D74(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030DE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100030E4C()
{
  v1[0] = 136315394;
  sub_10000CB4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s Attempting to play url %@ via assistantd", (uint8_t *)v1, 0x16u);
}

void sub_100030ECC()
{
  v1[0] = 136315394;
  sub_10000CB4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Error fetching voicemails: %@", (uint8_t *)v1, 0x16u);
}

void sub_100030F4C()
{
  v1[0] = 136315394;
  sub_10000CB4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Error playing voicemail: %@", (uint8_t *)v1, 0x16u);
}

void sub_100030FCC()
{
  v1[0] = 136315394;
  sub_10000CB4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s memberToAdd %@", (uint8_t *)v1, 0x16u);
}

void sub_10003104C()
{
  int v2 = 136315650;
  sub_10000E2E4();
  sub_10000E300((void *)&_mh_execute_header, v0, v1, "%s Ringing participant %@ in conversation: %@", v2);
}

void sub_1000310C0()
{
  int v2 = 136315650;
  sub_10000E2E4();
  sub_10000E300((void *)&_mh_execute_header, v0, v1, "%s Adding participant %@ to the conversation: %@", v2);
}

void sub_100031134()
{
  int v2 = 136315650;
  sub_10000E2E4();
  sub_10000E300((void *)&_mh_execute_header, v0, v1, "%s Generating link for participant %@ for conversation: %@", v2);
}

void sub_1000311A8()
{
  v1[0] = 136315394;
  sub_10000CB4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s Error generating FT Link for conversation: %@", (uint8_t *)v1, 0x16u);
}

void sub_100031228(void *a1, NSObject *a2)
{
  int v3 = [a1 URL];
  v4[0] = 136315394;
  sub_10000CB4C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s Link: %@", (uint8_t *)v4, 0x16u);
}

void sub_1000312C8(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AddCallParticipantIntentHandler _checkSelfAdd:toConversation:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s Found memberToAdd in FaceTime account aliases", (uint8_t *)&v1, 0xCu);
}

void sub_10003134C(void *a1, NSObject *a2)
{
  int v3 = [a1 localMember];
  v4[0] = 136315394;
  sub_10000CB4C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s localMember %@ matches memberToAdd", (uint8_t *)v4, 0x16u);
}

void sub_1000313EC()
{
  v1[0] = 136315394;
  sub_10000CB4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s Resolving participants: %@", (uint8_t *)v1, 0x16u);
}

void sub_10003146C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AddCallParticipantIntentHandler interpretContactResolutionRecommendation:participant:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s CRR chose 1 INPerson but contact has no handle.", (uint8_t *)&v1, 0xCu);
}

void sub_1000314F0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Intent Extension initialized", v1, 2u);
}

void sub_100031534()
{
  sub_10000F104();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "No handler for intent: %@", v1, 0xCu);
}

void sub_1000315A8()
{
  sub_10000F104();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Existing handler not found for intent identifier: %@. Creating new handler.", v1, 0xCu);
}

void sub_10003161C()
{
  sub_10000F104();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Found existing handler for intent identifier: %@.", v1, 0xCu);
}

void sub_100031690()
{
  sub_10000F104();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to register for drop-in calls: %{public}@", v1, 0xCu);
}

void sub_100031704(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected callTypes received, ignoring value.", v1, 2u);
}

void sub_100031748(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unrecognized PreferredCallProvider enum value, skipping provider predicate.", v1, 2u);
}

void sub_10003178C(void *a1, NSObject *a2)
{
  [a1 count];
  sub_10000F104();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#EmergencyServicesOverrideProvider found %lu handles in emergencyServicesOverride. Transforming them to TULabeledHandle.", v3, 0xCu);
}

void sub_100031814()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial request was restricted due to screen time policy.", v2, v3, v4, v5, v6);
}

void sub_100031848()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial request was restricted due to downtime policy.", v2, v3, v4, v5, v6);
}

void sub_10003187C()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "The call is initiated on a HomePod but the companion device already has a call ringing.", v2, v3, v4, v5, v6);
}

void sub_1000318B0()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "The call is initiated on a HomePod but the companion device already has a call in progress.", v2, v3, v4, v5, v6);
}

void sub_1000318E4()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "User activity was nil. Returning failure.", v2, v3, v4, v5, v6);
}

void sub_100031918()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "Call requested from Watch, will always try to place the call, skipping provider and cellular service availability checks.", v2, v3, v4, v5, v6);
}

void sub_10003194C()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial request was for telephony provider but airplane mode is enabled", v2, v3, v4, v5, v6);
}

void sub_100031980()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial request was for telephony provider but no cellular service was available", v2, v3, v4, v5, v6);
}

void sub_1000319B4()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial Request was for Telephony, but supportsTelephonyCalls was not true", v2, v3, v4, v5, v6);
}

void sub_1000319E8()
{
  sub_10000F104();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Dial Request invalid: %@", v1, 0xCu);
}

void sub_100031A5C()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial request was for FaceTime provider and audio but FaceTime audio is not enabled. Returning reponse that app configuration is required", v2, v3, v4, v5, v6);
}

void sub_100031A90()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Dial request was for FaceTime provider and video but FaceTime video is not enabled. Returning reponse that app configuration is required", v2, v3, v4, v5, v6);
}

void sub_100031AC4()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Join request was for FaceTime provider and audio but FaceTime audio is not enabled. Returning reponse that app configuration is required", v2, v3, v4, v5, v6);
}

void sub_100031AF8()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Join request was for FaceTime provider and video but FaceTime video is not enabled. Returning reponse that app configuration is required", v2, v3, v4, v5, v6);
}

void sub_100031B2C()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Join request was restricted due to some restrictions from all members.", v2, v3, v4, v5, v6);
}

void sub_100031B60()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "Airplane mode is enabled and cannot attempt telephony call without cellular connection. Returning Failure (AirplaneModeEnabled).", v2, v3, v4, v5, v6);
}

void sub_100031B94()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Converted INCallRecord has no caller. Returning unsupported", v2, v3, v4, v5, v6);
}

void sub_100031BC8()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Facetime Video calling is unavailable, returning call capability unsupported reason video call unsupported.", v2, v3, v4, v5, v6);
}

void sub_100031BFC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 providerId];
  sub_10000F104();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "The call provider %@ for redial or call back is not supported", v4, 0xCu);
}

void sub_100031C90(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Telephony call was requested from a watch or for an emergency call and telephony is not supported. isWatch: %d, isEmergencyCall: %d", (uint8_t *)v3, 0xEu);
}

void sub_100031D20()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Telephony call was requested, but supportsTelephonyCalls was false", v2, v3, v4, v5, v6);
}

void sub_100031D54()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime provider is blocked in settings or by managed configuration", v2, v3, v4, v5, v6);
}

void sub_100031D88()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime audio call was requested, but supportsFaceTimeAudioCalls was false, and the request passed checks for FT settings-based restrictions and FT provider availability.", v2, v3, v4, v5, v6);
}

void sub_100031DBC()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime audio calling service is not available, likely because user is not signed in", v2, v3, v4, v5, v6);
}

void sub_100031DF0()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime is not supported by this device's hardware or carrier configuration", v2, v3, v4, v5, v6);
}

void sub_100031E24()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime video call was requested, but supportsFaceTimeVideoCalls was false, and the request passed checks for FT settings-based restrictions and FT provider availability.", v2, v3, v4, v5, v6);
}

void sub_100031E58()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime video calling service is not available, likely because user is not signed in", v2, v3, v4, v5, v6);
}

void sub_100031E8C()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Group FaceTime video calls are not supported by this device's hardware or carrier configuration", v2, v3, v4, v5, v6);
}

void sub_100031EC0()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "FaceTime provider is turned off in the Settings App", v2, v3, v4, v5, v6);
}

void sub_100031EF4()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "Looking up recentCall by constructing query from intent", v2, v3, v4, v5, v6);
}

void sub_100031F28()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "Looking up recentCall by constructing query from callRecordFilter", v2, v3, v4, v5, v6);
}

void sub_100031F5C()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "Using previously-resolved INCallRecord from callRecordToCallBack", v2, v3, v4, v5, v6);
}

void sub_100031F90()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "Looking up recentCallRecordToRedial", v2, v3, v4, v5, v6);
}

void sub_100031FC4()
{
  sub_100022504();
  sub_1000224E8((void *)&_mh_execute_header, v0, v1, "Expected to map CHRecentCall to INCallRecord 1:1", v2, v3, v4, v5, v6);
}

void sub_100031FF8()
{
  sub_10000F104();
  sub_10002252C((void *)&_mh_execute_header, v0, v1, "Found recentCall: %@", v2, v3, v4, v5, v6);
}

void sub_100032060()
{
  sub_10000F104();
  sub_10002252C((void *)&_mh_execute_header, v0, v1, "predicate for recentCall: %@", v2, v3, v4, v5, v6);
}

void sub_1000320C8()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "#StartCallIntentHandler emergencyServicesOverrideEnabled==true and emergencyProvider.emergencyLabeledHandles is empty. Checking override.", v2, v3, v4, v5, v6);
}

void sub_1000320FC()
{
  sub_10000F104();
  sub_10002252C((void *)&_mh_execute_header, v0, v1, "#StartCallIntentHandler emergencyServicesOverrideEnabled==true and emergencyProvider shared %lu emergencyLabeledHandles. Using those.", v2, v3, v4, v5, v6);
}

void sub_100032164()
{
  sub_100022504();
  sub_100022510((void *)&_mh_execute_header, v0, v1, "#StartCallIntentHandler not internal build or emergency services override disabled. Using handles from emergency provider.", v2, v3, v4, v5, v6);
}

void sub_100032198(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "UserActivity was nil", v1, 2u);
}

void sub_1000321DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No calls exist. Returning failure.", v1, 2u);
}

void sub_100032220(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "FT aliases: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100032298(id *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [*a1 callIdentifier];
  uint8_t v6 = [a2 callUUID];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Requested identifier: %@, actual identifier: %@", (uint8_t *)&v7, 0x16u);
}

void sub_100032360(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Requested to answer specific call but UUID did not match identifier of requested call", v1, 2u);
}

void sub_1000323A4(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  int v7 = [a2 uniqueId];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Converting CHRecentCall %@ to INCallRecord.", a1, 0xCu);
}

void sub_10003241C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Converted this CHRecentCall previously, using cached converted INCallRecord.", buf, 2u);
}

void sub_10003245C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No serviceProvider found on CHRecentCall - setting preferredCallProvider to unknown.", v1, 2u);
}

void sub_1000324A0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "serviceProvider is not FT or telephony - must be a 3P provider.", v1, 2u);
}

void sub_1000324E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "SiriInference recommended resolution result: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003255C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unrecognized INScoredPersonRecommendation", v1, 2u);
}

uint64_t sub_1000325A0()
{
  return KeyPathComparator.init<A>(_:order:)();
}

uint64_t sub_1000325B0()
{
  return _convertErrorToNSError(_:)();
}

void sub_1000325C0(NSURL *retstr@<X8>)
{
}

uint64_t sub_1000325D0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000325E0()
{
  return type metadata accessor for URL();
}

NSDate sub_1000325F0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100032600()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032610()
{
  return type metadata accessor for Date();
}

uint64_t sub_100032620()
{
  return UUID.init(uuidString:)();
}

uint64_t sub_100032630()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100032640()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100032650()
{
  return dispatch thunk of Message.sandboxMessageFile.getter();
}

uint64_t sub_100032660()
{
  return dispatch thunk of Message.recordUUID.getter();
}

uint64_t sub_100032670()
{
  return dispatch thunk of Message.dateCreated.getter();
}

uint64_t sub_100032680()
{
  return dispatch thunk of Message.mailboxType.getter();
}

uint64_t sub_100032690()
{
  return dispatch thunk of Message.messageFile.getter();
}

uint64_t sub_1000326A0()
{
  return dispatch thunk of Message.from.getter();
}

uint64_t sub_1000326B0()
{
  return dispatch thunk of Message.isRead.getter();
}

uint64_t sub_1000326C0()
{
  return dispatch thunk of Message.duration.getter();
}

uint64_t sub_1000326D0()
{
  return MessageUpdate.init(recordUUID:callUUID:conversationID:from:provider:isRead:duration:mailboxType:recipient:transcriptionStatus:isRTT:transcriptURL:simID:undelete:)();
}

uint64_t sub_1000326E0()
{
  return type metadata accessor for MessageUpdate();
}

uint64_t sub_100032720()
{
  return static MessageStoreController.shared.getter();
}

uint64_t sub_100032730()
{
  return type metadata accessor for MessageStoreController();
}

uint64_t sub_100032740()
{
  return MailboxType.rawValue.getter();
}

uint64_t sub_100032750()
{
  return dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();
}

uint64_t sub_100032760()
{
  return Logger.logObject.getter();
}

uint64_t sub_100032770()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100032780()
{
  return type metadata accessor for Logger();
}

NSString sub_100032790()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000327A0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000327B0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_1000327C0()
{
  return static String._uncheckedFromUTF8(_:)();
}

void sub_1000327D0(Swift::String a1)
{
}

Swift::Int sub_1000327E0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000327F0()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t sub_100032800()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_100032820()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t sub_100032830()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_100032840()
{
  return String.init<A>(_:)();
}

uint64_t sub_100032850()
{
  return String.subscript.getter();
}

uint64_t sub_100032860()
{
  return Sequence.sorted<A>(using:)();
}

NSArray sub_100032870()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100032880()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100032890()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000328A0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1000328B0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000328C0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000328D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000328E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000328F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

void sub_100032900(Swift::Int a1)
{
}

uint64_t sub_100032910()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100032920()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100032930()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100032940()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100032950()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100032960()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100032970()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100032980()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100032990()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000329A0()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000329B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000329C0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000329D0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_1000329E0()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_1000329F0()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t IMSPIQueryChatWithGuid()
{
  return _IMSPIQueryChatWithGuid();
}

uint64_t INCallCapabilityGetBackingType()
{
  return _INCallCapabilityGetBackingType();
}

uint64_t INCallRecordTypeGetBackingType()
{
  return _INCallRecordTypeGetBackingType();
}

uint64_t INCallRecordTypeOptionsAddBackingType()
{
  return _INCallRecordTypeOptionsAddBackingType();
}

uint64_t INPersonHandleLabelEqualsCNLabeledValue()
{
  return _INPersonHandleLabelEqualsCNLabeledValue();
}

uint64_t INPersonHandleLabelForCNLabeledValue()
{
  return _INPersonHandleLabelForCNLabeledValue();
}

uint64_t INPreferredCallProviderGetName()
{
  return _INPreferredCallProviderGetName();
}

uint64_t INSupportedIntentsByExtensions()
{
  return _INSupportedIntentsByExtensions();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t TUCopyIDSCanonicalAddressForDestinationID()
{
  return _TUCopyIDSCanonicalAddressForDestinationID();
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

uint64_t TUHandlesAreCanonicallyEqual()
{
  return _TUHandlesAreCanonicallyEqual();
}

uint64_t TUHomeCountryCode()
{
  return _TUHomeCountryCode();
}

uint64_t TUISOCountryCodeForMCC()
{
  return _TUISOCountryCodeForMCC();
}

uint64_t TUNetworkCountryCode()
{
  return _TUNetworkCountryCode();
}

uint64_t TUShouldUseSuperboxTelephonyProvider()
{
  return _TUShouldUseSuperboxTelephonyProvider();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _TUIsInternalInstall()
{
  return __TUIsInternalInstall();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_throwingResume()
{
  return _swift_continuation_throwingResume();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__addCallParticipant_asConversationMember_toConversation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addCallParticipant:asConversationMember:toConversation:completion:");
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return _[a1 _appearsToBePhoneNumber];
}

id objc_msgSend__applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact_requestedHandleType_preferredCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyImpliedFilterToPhoneNumberOnlyMatchesIfApplicableForPersonsByContact:requestedHandleType:preferredCallProvider:");
}

id objc_msgSend__cachedSiriLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 _cachedSiriLanguageCode];
}

id objc_msgSend__checkParticipantAlreadyActive_inConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkParticipantAlreadyActive:inConversation:");
}

id objc_msgSend__checkParticipantLimitedByScreenTimeDownTime_forCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkParticipantLimitedByScreenTimeDownTime:forCall:");
}

id objc_msgSend__checkRestrictionsForCall_conversation_personToAdd_asMember_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkRestrictionsForCall:conversation:personToAdd:asMember:");
}

id objc_msgSend__checkSelfAdd_toConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkSelfAdd:toConversation:");
}

id objc_msgSend__contactPoolForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactPoolForConversation:");
}

id objc_msgSend__contactsMatchingIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactsMatchingIdentifiers:");
}

id objc_msgSend__contactsMatchingNamesForPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactsMatchingNamesForPerson:");
}

id objc_msgSend__executionContext(void *a1, const char *a2, ...)
{
  return _[a1 _executionContext];
}

id objc_msgSend__generateLinkResponseForConversation_person_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_generateLinkResponseForConversation:person:completion:");
}

id objc_msgSend__identifiersForRecommendedPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_identifiersForRecommendedPerson:");
}

id objc_msgSend__idiom(void *a1, const char *a2, ...)
{
  return _[a1 _idiom];
}

id objc_msgSend__inPersonsFromContact_withRequestedType_requestedLabel_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_inPersonsFromContact:withRequestedType:requestedLabel:isoCountryCodes:");
}

id objc_msgSend__initWithIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithIntent:");
}

id objc_msgSend__isOwnedByCurrentUser(void *a1, const char *a2, ...)
{
  return _[a1 _isOwnedByCurrentUser];
}

id objc_msgSend__isPrimaryDisplayDisabled(void *a1, const char *a2, ...)
{
  return _[a1 _isPrimaryDisplayDisabled];
}

id objc_msgSend__lookup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lookup:");
}

id objc_msgSend__matchesCallerFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_matchesCallerFilter:");
}

id objc_msgSend__matchesParticipantsFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_matchesParticipantsFilter:");
}

id objc_msgSend__originatingDeviceIDSIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _originatingDeviceIDSIdentifier];
}

id objc_msgSend__originatingDeviceRapportEffectiveIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _originatingDeviceRapportEffectiveIdentifier];
}

id objc_msgSend__originatingDeviceRapportMediaSystemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _originatingDeviceRapportMediaSystemIdentifier];
}

id objc_msgSend__playVoicemail_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_playVoicemail:completion:");
}

id objc_msgSend__responseForMatchingConversation_intent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_responseForMatchingConversation:intent:");
}

id objc_msgSend__sendSiriMatchAnalyticsEventForIdentifiers_contactsMatchingId_contactsMatchingName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendSiriMatchAnalyticsEventForIdentifiers:contactsMatchingId:contactsMatchingName:");
}

id objc_msgSend__userInput(void *a1, const char *a2, ...)
{
  return _[a1 _userInput];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_actionType(void *a1, const char *a2, ...)
{
  return _[a1 actionType];
}

id objc_msgSend_activeConversationForCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeConversationForCall:");
}

id objc_msgSend_activeConversations(void *a1, const char *a2, ...)
{
  return _[a1 activeConversations];
}

id objc_msgSend_activeRemoteParticipants(void *a1, const char *a2, ...)
{
  return _[a1 activeRemoteParticipants];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addRemoteMembers_otherInvitedHandles_toConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRemoteMembers:otherInvitedHandles:toConversation:");
}

id objc_msgSend_addScore_forEntities_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScore:forEntities:reason:");
}

id objc_msgSend_addScore_forEntity_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addScore:forEntity:reason:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_allContactIds(void *a1, const char *a2, ...)
{
  return _[a1 allContactIds];
}

id objc_msgSend_allContacts(void *a1, const char *a2, ...)
{
  return _[a1 allContacts];
}

id objc_msgSend_allCountryCodesRelevantToCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allCountryCodesRelevantToCall:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allRelevantISOCountryCodes(void *a1, const char *a2, ...)
{
  return _[a1 allRelevantISOCountryCodes];
}

id objc_msgSend_allTUHandles(void *a1, const char *a2, ...)
{
  return _[a1 allTUHandles];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alternatives(void *a1, const char *a2, ...)
{
  return _[a1 alternatives];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_answerWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "answerWithRequest:");
}

id objc_msgSend_anyContactsHaveSameName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyContactsHaveSameName:");
}

id objc_msgSend_appResolver(void *a1, const char *a2, ...)
{
  return _[a1 appResolver];
}

id objc_msgSend_appSupportsDeprecatedCallingIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appSupportsDeprecatedCallingIntents:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_audioRoute(void *a1, const char *a2, ...)
{
  return _[a1 audioRoute];
}

id objc_msgSend_availableContacts(void *a1, const char *a2, ...)
{
  return _[a1 availableContacts];
}

id objc_msgSend_beginQueryWithDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginQueryWithDestinations:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_buildConfirmationResultForContact_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildConfirmationResultForContact:withReason:");
}

id objc_msgSend_buildDisambiguationResultForContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildDisambiguationResultForContacts:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_buzzMember_conversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buzzMember:conversation:");
}

id objc_msgSend_callCapabilities(void *a1, const char *a2, ...)
{
  return _[a1 callCapabilities];
}

id objc_msgSend_callCapability(void *a1, const char *a2, ...)
{
  return _[a1 callCapability];
}

id objc_msgSend_callCapabilityFromRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCapabilityFromRecentCall:");
}

id objc_msgSend_callCapabilityPredicate(void *a1, const char *a2, ...)
{
  return _[a1 callCapabilityPredicate];
}

id objc_msgSend_callCenter(void *a1, const char *a2, ...)
{
  return _[a1 callCenter];
}

id objc_msgSend_callCenterWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCenterWithQueue:");
}

id objc_msgSend_callCountWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callCountWithPredicate:");
}

id objc_msgSend_callFilterController(void *a1, const char *a2, ...)
{
  return _[a1 callFilterController];
}

id objc_msgSend_callFilterStatusForDialRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callFilterStatusForDialRequest:");
}

id objc_msgSend_callGroup(void *a1, const char *a2, ...)
{
  return _[a1 callGroup];
}

id objc_msgSend_callGroups(void *a1, const char *a2, ...)
{
  return _[a1 callGroups];
}

id objc_msgSend_callHistoryDataSource(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryDataSource];
}

id objc_msgSend_callIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callIdentifier];
}

id objc_msgSend_callRecordFilter(void *a1, const char *a2, ...)
{
  return _[a1 callRecordFilter];
}

id objc_msgSend_callRecordForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordForRecentCall:");
}

id objc_msgSend_callRecordForRecentCall_withContactsDataSource_withCallProviderManager_withCurrentISOCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordForRecentCall:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:");
}

id objc_msgSend_callRecordIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callRecordIdentifier];
}

id objc_msgSend_callRecordToCallBack(void *a1, const char *a2, ...)
{
  return _[a1 callRecordToCallBack];
}

id objc_msgSend_callRecordTypePredicates(void *a1, const char *a2, ...)
{
  return _[a1 callRecordTypePredicates];
}

id objc_msgSend_callRecordsForRecentCalls_withContactsDataSource_withCallProviderManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:");
}

id objc_msgSend_callRecordsForRecentCalls_withContactsDataSource_withCallProviderManager_withCurrentISOCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordsForRecentCalls:withContactsDataSource:withCallProviderManager:withCurrentISOCountryCodes:");
}

id objc_msgSend_callRecordsForRecentCallsWithRecordTypeOptions_startDate_endDate_recipient_capabilities_preferredProvider_maximumRecordCount_unseen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordsForRecentCallsWithRecordTypeOptions:startDate:endDate:recipient:capabilities:preferredProvider:maximumRecordCount:unseen:");
}

id objc_msgSend_callRecordsForVoicemails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callRecordsForVoicemails:");
}

id objc_msgSend_callRinging(void *a1, const char *a2, ...)
{
  return _[a1 callRinging];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_callTypes(void *a1, const char *a2, ...)
{
  return _[a1 callTypes];
}

id objc_msgSend_callUUID(void *a1, const char *a2, ...)
{
  return _[a1 callUUID];
}

id objc_msgSend_caller(void *a1, const char *a2, ...)
{
  return _[a1 caller];
}

id objc_msgSend_callerIdIsBlocked(void *a1, const char *a2, ...)
{
  return _[a1 callerIdIsBlocked];
}

id objc_msgSend_callerPool(void *a1, const char *a2, ...)
{
  return _[a1 callerPool];
}

id objc_msgSend_callerPoolContainsOneOf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callerPoolContainsOneOf:");
}

id objc_msgSend_callingBlocked(void *a1, const char *a2, ...)
{
  return _[a1 callingBlocked];
}

id objc_msgSend_callsInProgress(void *a1, const char *a2, ...)
{
  return _[a1 callsInProgress];
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnection(void *a1, const char *a2, ...)
{
  return _[a1 canAttemptEmergencyCallsWithoutCellularConnection];
}

id objc_msgSend_canAttemptTelephonyCallsWithoutCellularConnection(void *a1, const char *a2, ...)
{
  return _[a1 canAttemptTelephonyCallsWithoutCellularConnection];
}

id objc_msgSend_canonicalAddressesForAddresses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalAddressesForAddresses:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_coalescedCallsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coalescedCallsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return _[a1 compatibilityObject];
}

id objc_msgSend_componentsForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsForContact:");
}

id objc_msgSend_confirmationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 confirmationEnabled];
}

id objc_msgSend_confirmationMargin(void *a1, const char *a2, ...)
{
  return _[a1 confirmationMargin];
}

id objc_msgSend_confirmationRequiredWithPersonToConfirm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmationRequiredWithPersonToConfirm:");
}

id objc_msgSend_confirmationRequiredWithPersonToConfirm_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmationRequiredWithPersonToConfirm:forReason:");
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToType:");
}

id objc_msgSend_contactByIdCache(void *a1, const char *a2, ...)
{
  return _[a1 contactByIdCache];
}

id objc_msgSend_contactForIdentifier_keysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForIdentifier:keysToFetch:");
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifier];
}

id objc_msgSend_contactIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifiers];
}

id objc_msgSend_contactIdentifiersConfirmed(void *a1, const char *a2, ...)
{
  return _[a1 contactIdentifiersConfirmed];
}

id objc_msgSend_contactProperty(void *a1, const char *a2, ...)
{
  return _[a1 contactProperty];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactWithId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactWithId:");
}

id objc_msgSend_contactWithMostHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactWithMostHandles:");
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return _[a1 contacts];
}

id objc_msgSend_contactsAvailableInPool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsAvailableInPool:");
}

id objc_msgSend_contactsDataSource(void *a1, const char *a2, ...)
{
  return _[a1 contactsDataSource];
}

id objc_msgSend_contactsShareHandleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsShareHandleValue:");
}

id objc_msgSend_contactsWithIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactsWithIds:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsRestrictedHandle_forBundleIdentifier_performSynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsRestrictedHandle:forBundleIdentifier:performSynchronously:");
}

id objc_msgSend_conversationId(void *a1, const char *a2, ...)
{
  return _[a1 conversationId];
}

id objc_msgSend_conversationLink(void *a1, const char *a2, ...)
{
  return _[a1 conversationLink];
}

id objc_msgSend_conversationLinkForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkForURL:");
}

id objc_msgSend_conversationManager(void *a1, const char *a2, ...)
{
  return _[a1 conversationManager];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyMobileCountryCode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyMobileCountryCode:error:");
}

id objc_msgSend_copyRegistrationStatus_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyRegistrationStatus:error:");
}

id objc_msgSend_coreAnalyticsLogger(void *a1, const char *a2, ...)
{
  return _[a1 coreAnalyticsLogger];
}

id objc_msgSend_coreTelephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyClient];
}

id objc_msgSend_coreTelephonyClientQueue(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyClientQueue];
}

id objc_msgSend_coreTelephonyDataSource(void *a1, const char *a2, ...)
{
  return _[a1 coreTelephonyDataSource];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crrFullRecommendation(void *a1, const char *a2, ...)
{
  return _[a1 crrFullRecommendation];
}

id objc_msgSend_crrHandleRecommendation(void *a1, const char *a2, ...)
{
  return _[a1 crrHandleRecommendation];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataURL(void *a1, const char *a2, ...)
{
  return _[a1 dataURL];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateCreated(void *a1, const char *a2, ...)
{
  return _[a1 dateCreated];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dedupeINPersons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dedupeINPersons:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_descriptorForUsedKeys(void *a1, const char *a2, ...)
{
  return _[a1 descriptorForUsedKeys];
}

id objc_msgSend_destinationIDWithoutControlOrPhoneNumberSeparatorCharacters(void *a1, const char *a2, ...)
{
  return _[a1 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters];
}

id objc_msgSend_destinationType(void *a1, const char *a2, ...)
{
  return _[a1 destinationType];
}

id objc_msgSend_destinationWithURI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationWithURI:");
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return _[a1 dialType];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disambiguationItems(void *a1, const char *a2, ...)
{
  return _[a1 disambiguationItems];
}

id objc_msgSend_disambiguationWithPeopleToDisambiguate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disambiguationWithPeopleToDisambiguate:");
}

id objc_msgSend_disconnectCall_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectCall:withReason:");
}

id objc_msgSend_disconnectCurrentCallAndActivateHeld(void *a1, const char *a2, ...)
{
  return _[a1 disconnectCurrentCallAndActivateHeld];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 emailAddresses];
}

id objc_msgSend_emergencyHandles(void *a1, const char *a2, ...)
{
  return _[a1 emergencyHandles];
}

id objc_msgSend_emergencyLabeledHandles(void *a1, const char *a2, ...)
{
  return _[a1 emergencyLabeledHandles];
}

id objc_msgSend_emergencyProvider(void *a1, const char *a2, ...)
{
  return _[a1 emergencyProvider];
}

id objc_msgSend_emergencyServicesOverrideEnabled(void *a1, const char *a2, ...)
{
  return _[a1 emergencyServicesOverrideEnabled];
}

id objc_msgSend_emergencyServicesOverrideProvider(void *a1, const char *a2, ...)
{
  return _[a1 emergencyServicesOverrideProvider];
}

id objc_msgSend_emergencyServicesOverrides(void *a1, const char *a2, ...)
{
  return _[a1 emergencyServicesOverrides];
}

id objc_msgSend_emergencyType(void *a1, const char *a2, ...)
{
  return _[a1 emergencyType];
}

id objc_msgSend_emergencyTypeToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emergencyTypeToString:");
}

id objc_msgSend_endDateComponents(void *a1, const char *a2, ...)
{
  return _[a1 endDateComponents];
}

id objc_msgSend_endPlayback(void *a1, const char *a2, ...)
{
  return _[a1 endPlayback];
}

id objc_msgSend_endpointRapportEffectiveIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 endpointRapportEffectiveIdentifier];
}

id objc_msgSend_endpointRapportMediaSystemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 endpointRapportMediaSystemIdentifier];
}

id objc_msgSend_entities(void *a1, const char *a2, ...)
{
  return _[a1 entities];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return _[a1 entries];
}

id objc_msgSend_entriesForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesForContact:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_existingHandlerForIntentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingHandlerForIntentIdentifier:");
}

id objc_msgSend_expectUpstreamContactRecommendation(void *a1, const char *a2, ...)
{
  return _[a1 expectUpstreamContactRecommendation];
}

id objc_msgSend_extractHandlesFromIntent_faceTimeMemberHandles_nonFaceTimeMemberHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractHandlesFromIntent:faceTimeMemberHandles:nonFaceTimeMemberHandles:");
}

id objc_msgSend_extractRecommendation(void *a1, const char *a2, ...)
{
  return _[a1 extractRecommendation];
}

id objc_msgSend_faceTimeBlocked(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeBlocked];
}

id objc_msgSend_faceTimeInvitationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeInvitationEnabled];
}

id objc_msgSend_faceTimeLink(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeLink];
}

id objc_msgSend_faceTimeNoFanOutEnabled(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeNoFanOutEnabled];
}

id objc_msgSend_faceTimeType(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeType];
}

id objc_msgSend_faceTimeUtilities(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeUtilities];
}

id objc_msgSend_favoritesController(void *a1, const char *a2, ...)
{
  return _[a1 favoritesController];
}

id objc_msgSend_favoritesDataSource(void *a1, const char *a2, ...)
{
  return _[a1 favoritesDataSource];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_fetchFaceTimeAccountAliases(void *a1, const char *a2, ...)
{
  return _[a1 fetchFaceTimeAccountAliases];
}

id objc_msgSend_fetchSPIHandlesForGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSPIHandlesForGroupID:");
}

id objc_msgSend_fetchVoicemailWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchVoicemailWithIdentifier:completion:");
}

id objc_msgSend_fetchVoicemailsMatching_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchVoicemailsMatching:completion:");
}

id objc_msgSend_filterForCallGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterForCallGroup:");
}

id objc_msgSend_filterForParticipantCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filterForParticipantCount:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filters(void *a1, const char *a2, ...)
{
  return _[a1 filters];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_formattedInternationalStringValue(void *a1, const char *a2, ...)
{
  return _[a1 formattedInternationalStringValue];
}

id objc_msgSend_formattedStringValue(void *a1, const char *a2, ...)
{
  return _[a1 formattedStringValue];
}

id objc_msgSend_frontmostAudioOrVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 frontmostAudioOrVideoCall];
}

id objc_msgSend_generateAdditionalMatchingHandles_resolvedContacts_requestedHandleType_requestedHandleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAdditionalMatchingHandles:resolvedContacts:requestedHandleType:requestedHandleLabel:");
}

id objc_msgSend_generateFaceTimeLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateFaceTimeLink:");
}

id objc_msgSend_generateLinkForConversation_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateLinkForConversation:completionHandler:");
}

id objc_msgSend_generateLinkWithInvitedMemberHandles_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateLinkWithInvitedMemberHandles:completionHandler:");
}

id objc_msgSend_getAlternativesForContact_forRequestedHandleType_forCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAlternativesForContact:forRequestedHandleType:forCallProvider:");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_globalEmergencyNumbers(void *a1, const char *a2, ...)
{
  return _[a1 globalEmergencyNumbers];
}

id objc_msgSend_groupConversation(void *a1, const char *a2, ...)
{
  return _[a1 groupConversation];
}

id objc_msgSend_groupConversationFilter(void *a1, const char *a2, ...)
{
  return _[a1 groupConversationFilter];
}

id objc_msgSend_groupId(void *a1, const char *a2, ...)
{
  return _[a1 groupId];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _[a1 groupName];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleSearchVoicemailForRecipient_fromStartDate_toEndDate_unread_maximumRecordCount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSearchVoicemailForRecipient:fromStartDate:toEndDate:unread:maximumRecordCount:completion:");
}

id objc_msgSend_handleToPersonCache(void *a1, const char *a2, ...)
{
  return _[a1 handleToPersonCache];
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithDestinationID:");
}

id objc_msgSend_handleWithPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleWithPerson:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return _[a1 handler];
}

id objc_msgSend_handles(void *a1, const char *a2, ...)
{
  return _[a1 handles];
}

id objc_msgSend_handlesConfirmed(void *a1, const char *a2, ...)
{
  return _[a1 handlesConfirmed];
}

id objc_msgSend_hasCamera(void *a1, const char *a2, ...)
{
  return _[a1 hasCamera];
}

id objc_msgSend_hasCurrentCalls(void *a1, const char *a2, ...)
{
  return _[a1 hasCurrentCalls];
}

id objc_msgSend_hasFavoritesEntryForContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFavoritesEntryForContact:");
}

id objc_msgSend_hasFavoritesEntryForTelephonyCallWithPhoneNumber_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasFavoritesEntryForTelephonyCallWithPhoneNumber:isoCountryCodes:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_haveAlreadyConfirmedRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "haveAlreadyConfirmedRecipient:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierToContactCache(void *a1, const char *a2, ...)
{
  return _[a1 identifierToContactCache];
}

id objc_msgSend_inPerson(void *a1, const char *a2, ...)
{
  return _[a1 inPerson];
}

id objc_msgSend_inPersonFromContact_handleValue_handleType_handleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inPersonFromContact:handleValue:handleType:handleLabel:");
}

id objc_msgSend_includeAllEntitiesInDisambiguation(void *a1, const char *a2, ...)
{
  return _[a1 includeAllEntitiesInDisambiguation];
}

id objc_msgSend_includeThirdPartyCalls(void *a1, const char *a2, ...)
{
  return _[a1 includeThirdPartyCalls];
}

id objc_msgSend_incomingCall(void *a1, const char *a2, ...)
{
  return _[a1 incomingCall];
}

id objc_msgSend_incomingVideoCall(void *a1, const char *a2, ...)
{
  return _[a1 incomingVideoCall];
}

id objc_msgSend_inferCallCapabilityForPreferredCallProvider_recentCall_initialCallCapability_idiom_isDisplayDisabled_executionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inferCallCapabilityForPreferredCallProvider:recentCall:initialCallCapability:idiom:isDisplayDisabled:executionContext:");
}

id objc_msgSend_initWithAudioPlaybackService_voicemailManager_callCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAudioPlaybackService:voicemailManager:callCenter:");
}

id objc_msgSend_initWithBuilder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBuilder:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCall:");
}

id objc_msgSend_initWithCallCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCenter:");
}

id objc_msgSend_initWithCallCenter_contactsDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCenter:contactsDataSource:");
}

id objc_msgSend_initWithCallCenter_dataSource_faceTimeUtilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCallCenter:dataSource:faceTimeUtilities:");
}

id objc_msgSend_initWithCaller_participants_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCaller:participants:dataSource:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithContactStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContactStore:");
}

id objc_msgSend_initWithContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContacts:");
}

id objc_msgSend_initWithConversation_originatingUIType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversation:originatingUIType:");
}

id objc_msgSend_initWithConversationId_caller_otherParticipants_callGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationId:caller:otherParticipants:callGroup:");
}

id objc_msgSend_initWithConversationLink_otherInvitedHandles_sendLetMeInRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConversationLink:otherInvitedHandles:sendLetMeInRequest:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDataSource_logger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:logger:");
}

id objc_msgSend_initWithDeferredFormat_fromTable_bundle_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeferredFormat:fromTable:bundle:arguments:");
}

id objc_msgSend_initWithDialIntent_providerManager_contactsDataSource_senderIdentityClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:");
}

id objc_msgSend_initWithDialIntent_providerManager_contactsDataSource_senderIdentityClient_isEmergencyServicesOverrideEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDialIntent:providerManager:contactsDataSource:senderIdentityClient:isEmergencyServicesOverrideEnabled:");
}

id objc_msgSend_initWithDispatchQueue_featureFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDispatchQueue:featureFlags:");
}

id objc_msgSend_initWithEntities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntities:");
}

id objc_msgSend_initWithFeatureFlags_faceTimeUtilities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureFlags:faceTimeUtilities:");
}

id objc_msgSend_initWithFilters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFilters:");
}

id objc_msgSend_initWithFullyResolvedPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFullyResolvedPerson:");
}

id objc_msgSend_initWithHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:");
}

id objc_msgSend_initWithHandle_label_isSuggested_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:label:isSuggested:");
}

id objc_msgSend_initWithHandleType_notificationStyles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandleType:notificationStyles:");
}

id objc_msgSend_initWithHandler_intentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandler:intentIdentifier:");
}

id objc_msgSend_initWithINPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithINPerson:");
}

id objc_msgSend_initWithIdentifier_dateCreated_callRecordType_callCapability_callDuration_unseen_participants_numberOfCalls_isCallerIdBlocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:participants:numberOfCalls:isCallerIdBlocked:");
}

id objc_msgSend_initWithIdentifier_dateCreated_callRecordType_callCapability_callDuration_unseen_preferredCallProvider_participants_numberOfCalls_providerId_providerBundleId_isCallerIdBlocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:dateCreated:callRecordType:callCapability:callDuration:unseen:preferredCallProvider:participants:numberOfCalls:providerId:providerBundleId:isCallerIdBlocked:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithParticipants_destinationType_callTypes_callCapability_preferredCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:");
}

id objc_msgSend_initWithParticipants_destinationType_callTypes_callCapability_preferredCallProvider_includeThirdPartyCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParticipants:destinationType:callTypes:callCapability:preferredCallProvider:includeThirdPartyCalls:");
}

id objc_msgSend_initWithParticipants_inviteType_callURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParticipants:inviteType:callURL:");
}

id objc_msgSend_initWithPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPerson:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_isMe_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:isMe:");
}

id objc_msgSend_initWithPersonResolutionResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonResolutionResult:");
}

id objc_msgSend_initWithPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPredicate:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRecommendationType_persons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecommendationType:persons:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSet:");
}

id objc_msgSend_initWithSiriInferencePerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSiriInferencePerson:");
}

id objc_msgSend_initWithStringValue_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStringValue:countryCode:");
}

id objc_msgSend_initWithType_contactIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:contactIdentifiers:");
}

id objc_msgSend_initWithType_resolvedEntities_resolutionSummary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:resolvedEntities:resolutionSummary:");
}

id objc_msgSend_initWithType_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:value:");
}

id objc_msgSend_initWithUnresolvedPerson_availableContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnresolvedPerson:availableContacts:");
}

id objc_msgSend_initWithUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserActivity:");
}

id objc_msgSend_initWithValue_type_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:type:label:");
}

id objc_msgSend_initWithValue_type_label_emergencyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:type:label:emergencyType:");
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return _[a1 initiator];
}

id objc_msgSend_inputDevices(void *a1, const char *a2, ...)
{
  return _[a1 inputDevices];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intentHasUnresolvedLocalEmergencyContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intentHasUnresolvedLocalEmergencyContact:");
}

id objc_msgSend_intentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 intentIdentifier];
}

id objc_msgSend_interpretContactResolutionRecommendation_participant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interpretContactResolutionRecommendation:participant:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_isAirplaneModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAirplaneModeEnabled];
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isBlocked];
}

id objc_msgSend_isCanonicallyEqualToHandle_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCanonicallyEqualToHandle:isoCountryCode:");
}

id objc_msgSend_isCellularServiceAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isCellularServiceAvailable];
}

id objc_msgSend_isChinaSKUDevice(void *a1, const char *a2, ...)
{
  return _[a1 isChinaSKUDevice];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDirectFaceTimeAudioCallingCurrentlyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDirectFaceTimeAudioCallingCurrentlyAvailable];
}

id objc_msgSend_isDirectFaceTimeVideoCallingCurrentlyAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDirectFaceTimeVideoCallingCurrentlyAvailable];
}

id objc_msgSend_isEligibleForScreening(void *a1, const char *a2, ...)
{
  return _[a1 isEligibleForScreening];
}

id objc_msgSend_isEmergencyCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmergencyCall:");
}

id objc_msgSend_isEmergencyHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmergencyHandle:");
}

id objc_msgSend_isEmergencyNumberForDigits_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEmergencyNumberForDigits:senderIdentityUUID:");
}

id objc_msgSend_isEqualToIgnoringCase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToIgnoringCase:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeAudioAvailableForAnyDestinationInDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeAudioAvailableForAnyDestinationInDestinations:");
}

id objc_msgSend_isFaceTimeAudioBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeAudioBlocked];
}

id objc_msgSend_isFaceTimeEnabledInSettings(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeEnabledInSettings];
}

id objc_msgSend_isFaceTimeInvitationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeInvitationEnabled];
}

id objc_msgSend_isFaceTimeMultiwayAvailableForAnyDestinationInDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeMultiwayAvailableForAnyDestinationInDestinations:");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isFaceTimeVideoAvailableForAnyDestinationInDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeVideoAvailableForAnyDestinationInDestinations:");
}

id objc_msgSend_isFaceTimeVideoBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeVideoBlocked];
}

id objc_msgSend_isFaceTimeable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFaceTimeable:");
}

id objc_msgSend_isGFTDisabledForChinaSKU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGFTDisabledForChinaSKU:");
}

id objc_msgSend_isGreenTea(void *a1, const char *a2, ...)
{
  return _[a1 isGreenTea];
}

id objc_msgSend_isGroupCall(void *a1, const char *a2, ...)
{
  return _[a1 isGroupCall];
}

id objc_msgSend_isMMIOrUSSDNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMMIOrUSSDNumber:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isOnlineAndSubscribed(void *a1, const char *a2, ...)
{
  return _[a1 isOnlineAndSubscribed];
}

id objc_msgSend_isRestrictedMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRestrictedMessage:");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isSuggested(void *a1, const char *a2, ...)
{
  return _[a1 isSuggested];
}

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyProvider];
}

id objc_msgSend_isTrashed(void *a1, const char *a2, ...)
{
  return _[a1 isTrashed];
}

id objc_msgSend_isUnread(void *a1, const char *a2, ...)
{
  return _[a1 isUnread];
}

id objc_msgSend_isUnresolvedLocalEmergencyContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnresolvedLocalEmergencyContact:");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isValidForISOCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidForISOCountryCode:");
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return _[a1 isVideo];
}

id objc_msgSend_isVideoEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isVideoEnabled];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_isoCountryCodeOverride(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCodeOverride];
}

id objc_msgSend_isoCountryCodes(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCodes];
}

id objc_msgSend_itemToConfirm(void *a1, const char *a2, ...)
{
  return _[a1 itemToConfirm];
}

id objc_msgSend_keysToFetch(void *a1, const char *a2, ...)
{
  return _[a1 keysToFetch];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localMember(void *a1, const char *a2, ...)
{
  return _[a1 localMember];
}

id objc_msgSend_localizeForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizeForLanguage:");
}

id objc_msgSend_localizedEmergencyString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedEmergencyString:");
}

id objc_msgSend_localizedStringForLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForLabel:");
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromPersonNameComponents:style:options:");
}

id objc_msgSend_logOutgoingCallToHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logOutgoingCallToHandle:");
}

id objc_msgSend_logSiriMatchEvent_matchesByIdCount_matchesByNameCount_siriLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logSiriMatchEvent:matchesByIdCount:matchesByNameCount:siriLocale:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_makeActivityWithIntent_dialRequestAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeActivityWithIntent:dialRequestAttachment:");
}

id objc_msgSend_makeActivityWithIntent_joinRequestAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeActivityWithIntent:joinRequestAttachment:");
}

id objc_msgSend_makeFilterForINCallGroupConversationFilter_contactsDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeFilterForINCallGroupConversationFilter:contactsDataSource:");
}

id objc_msgSend_markRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markRead:");
}

id objc_msgSend_matchCallerAndParticipantsExactly(void *a1, const char *a2, ...)
{
  return _[a1 matchCallerAndParticipantsExactly];
}

id objc_msgSend_matches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matches:");
}

id objc_msgSend_matchingContactsForPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchingContactsForPerson:");
}

id objc_msgSend_maximumRecordCountForCallRecordTypeOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumRecordCountForCallRecordTypeOptions:");
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_messagesGroupName(void *a1, const char *a2, ...)
{
  return _[a1 messagesGroupName];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return _[a1 nameComponents];
}

id objc_msgSend_nameForResolutionResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForResolutionResultType:");
}

id objc_msgSend_needsValue(void *a1, const char *a2, ...)
{
  return _[a1 needsValue];
}

id objc_msgSend_normalizedEmailAddressHandleForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedEmailAddressHandleForValue:");
}

id objc_msgSend_normalizedGenericHandleForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedGenericHandleForValue:");
}

id objc_msgSend_normalizedHandleWithDestinationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedHandleWithDestinationID:");
}

id objc_msgSend_normalizedPhoneNumberHandleForValue_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedPhoneNumberHandleForValue:isoCountryCode:");
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notPredicateWithSubpredicate:");
}

id objc_msgSend_notRequired(void *a1, const char *a2, ...)
{
  return _[a1 notRequired];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfOccurrences(void *a1, const char *a2, ...)
{
  return _[a1 numberOfOccurrences];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_parseEmergencyContacts_usingExistingResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseEmergencyContacts:usingExistingResult:");
}

id objc_msgSend_participants(void *a1, const char *a2, ...)
{
  return _[a1 participants];
}

id objc_msgSend_participantsPool(void *a1, const char *a2, ...)
{
  return _[a1 participantsPool];
}

id objc_msgSend_participantsPoolContainsOneOf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantsPoolContainsOneOf:");
}

id objc_msgSend_participantsPredicatesWithContactsDataSource_contactIdentifierCache_coreTelephonyDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "participantsPredicatesWithContactsDataSource:contactIdentifierCache:coreTelephonyDataSource:");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_person(void *a1, const char *a2, ...)
{
  return _[a1 person];
}

id objc_msgSend_personHandle(void *a1, const char *a2, ...)
{
  return _[a1 personHandle];
}

id objc_msgSend_personResolutionResultsForIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personResolutionResultsForIntent:");
}

id objc_msgSend_persons(void *a1, const char *a2, ...)
{
  return _[a1 persons];
}

id objc_msgSend_phoneNumberWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithDigits:countryCode:");
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneNumberWithStringValue:");
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_phonemeData(void *a1, const char *a2, ...)
{
  return _[a1 phonemeData];
}

id objc_msgSend_plugInKitPlugins(void *a1, const char *a2, ...)
{
  return _[a1 plugInKitPlugins];
}

id objc_msgSend_populatePersonsByTUHandleFrom_personsByTUHandle_tuHandleOrderedSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populatePersonsByTUHandleFrom:personsByTUHandle:tuHandleOrderedSet:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateFilteringOutCallTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateFilteringOutCallTypes:");
}

id objc_msgSend_predicateForAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 predicateForAudioCalls];
}

id objc_msgSend_predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:");
}

id objc_msgSend_predicateForCallsAfterDate_beforeDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsAfterDate:beforeDate:");
}

id objc_msgSend_predicateForCallsThatAreRead_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsThatAreRead:");
}

id objc_msgSend_predicateForCallsThatWereAnswered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsThatWereAnswered:");
}

id objc_msgSend_predicateForCallsThatWereOriginated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsThatWereOriginated:");
}

id objc_msgSend_predicateForCallsWithAnyOfTheseRemoteParticipantHandles_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithAnyOfTheseRemoteParticipantHandles:isoCountryCodes:");
}

id objc_msgSend_predicateForCallsWithDurationLongerThanImmediateHangUp(void *a1, const char *a2, ...)
{
  return _[a1 predicateForCallsWithDurationLongerThanImmediateHangUp];
}

id objc_msgSend_predicateForCallsWithNoDuration(void *a1, const char *a2, ...)
{
  return _[a1 predicateForCallsWithNoDuration];
}

id objc_msgSend_predicateForCallsWithNumberOfRemoteParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForCallsWithNumberOfRemoteParticipants:");
}

id objc_msgSend_predicateForContactsMatchingEmailAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingEmailAddress:");
}

id objc_msgSend_predicateForContactsMatchingName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingName:options:");
}

id objc_msgSend_predicateForContactsMatchingPhoneNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsMatchingPhoneNumber:");
}

id objc_msgSend_predicateForContactsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForContactsWithIdentifiers:");
}

id objc_msgSend_predicateForFaceTimeCalls(void *a1, const char *a2, ...)
{
  return _[a1 predicateForFaceTimeCalls];
}

id objc_msgSend_predicateForJustMissedCalls(void *a1, const char *a2, ...)
{
  return _[a1 predicateForJustMissedCalls];
}

id objc_msgSend_predicateForMissedCallsSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForMissedCallsSinceDate:");
}

id objc_msgSend_predicateForRecentCallWithContactsDataSource_contactIdentifierCache_coreTelephonyDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRecentCallWithContactsDataSource:contactIdentifierCache:coreTelephonyDataSource:");
}

id objc_msgSend_predicateForRemoteParticipantsWithNormalizedValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRemoteParticipantsWithNormalizedValues:");
}

id objc_msgSend_predicateForRemoteParticipantsWithValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRemoteParticipantsWithValues:");
}

id objc_msgSend_predicateForRemoteParticipantsWithValues_caseInsensitiveValues_normalizedValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRemoteParticipantsWithValues:caseInsensitiveValues:normalizedValues:");
}

id objc_msgSend_predicateForRemoteParticipantsWithValuesCaseInsensitive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateForRemoteParticipantsWithValuesCaseInsensitive:");
}

id objc_msgSend_predicateForTelephonyCalls(void *a1, const char *a2, ...)
{
  return _[a1 predicateForTelephonyCalls];
}

id objc_msgSend_predicateForTelephonyOrFaceTimeCalls(void *a1, const char *a2, ...)
{
  return _[a1 predicateForTelephonyOrFaceTimeCalls];
}

id objc_msgSend_predicateForVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 predicateForVideoCalls];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:");
}

id objc_msgSend_preferredCallProvider(void *a1, const char *a2, ...)
{
  return _[a1 preferredCallProvider];
}

id objc_msgSend_preferredCallProviderFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredCallProviderFor:");
}

id objc_msgSend_preferredCallProviderFromRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredCallProviderFromRecentCall:");
}

id objc_msgSend_preferredCallProviderPredicate(void *a1, const char *a2, ...)
{
  return _[a1 preferredCallProviderPredicate];
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedSenderIdentities];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerForRecentCall:");
}

id objc_msgSend_providerId(void *a1, const char *a2, ...)
{
  return _[a1 providerId];
}

id objc_msgSend_providerManager(void *a1, const char *a2, ...)
{
  return _[a1 providerManager];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_radiosPreferences(void *a1, const char *a2, ...)
{
  return _[a1 radiosPreferences];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return _[a1 raise];
}

id objc_msgSend_read(void *a1, const char *a2, ...)
{
  return _[a1 read];
}

id objc_msgSend_recentCallIdToCallRecordCache(void *a1, const char *a2, ...)
{
  return _[a1 recentCallIdToCallRecordCache];
}

id objc_msgSend_recentCallRecordToRedialForIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallRecordToRedialForIntent:");
}

id objc_msgSend_recentCallToRedialForQuery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallToRedialForQuery:");
}

id objc_msgSend_recentCallsWithHandles_telephonyOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentCallsWithHandles:telephonyOnly:");
}

id objc_msgSend_recentIntentHandlersAndIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 recentIntentHandlersAndIdentifiers];
}

id objc_msgSend_recipient(void *a1, const char *a2, ...)
{
  return _[a1 recipient];
}

id objc_msgSend_recommendation(void *a1, const char *a2, ...)
{
  return _[a1 recommendation];
}

id objc_msgSend_recommendationType(void *a1, const char *a2, ...)
{
  return _[a1 recommendationType];
}

id objc_msgSend_recommendedResult(void *a1, const char *a2, ...)
{
  return _[a1 recommendedResult];
}

id objc_msgSend_recordTypeForRedialing(void *a1, const char *a2, ...)
{
  return _[a1 recordTypeForRedialing];
}

id objc_msgSend_registerForCallbacksForProvider_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForCallbacksForProvider:completionHandler:");
}

id objc_msgSend_registerForProvider(void *a1, const char *a2, ...)
{
  return _[a1 registerForProvider];
}

id objc_msgSend_relationship(void *a1, const char *a2, ...)
{
  return _[a1 relationship];
}

id objc_msgSend_relayCRRRecommendationForPerson_intent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relayCRRRecommendationForPerson:intent:");
}

id objc_msgSend_remoteMembers(void *a1, const char *a2, ...)
{
  return _[a1 remoteMembers];
}

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_requireScoreBasedResolutionForGFT_numberOfContactsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireScoreBasedResolutionForGFT:numberOfContactsCount:");
}

id objc_msgSend_resolutionResultCode(void *a1, const char *a2, ...)
{
  return _[a1 resolutionResultCode];
}

id objc_msgSend_resolutionResultDisambiguationWithItemsToDisambiguate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolutionResultDisambiguationWithItemsToDisambiguate:");
}

id objc_msgSend_resolutionResultForCallCapability_idiom_withDisplayDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolutionResultForCallCapability:idiom:withDisplayDisabled:");
}

id objc_msgSend_resolutionResultForEmergency(void *a1, const char *a2, ...)
{
  return _[a1 resolutionResultForEmergency];
}

id objc_msgSend_resolutionResultForPersonWithResolvedContactName_resolvedPerson_resolvedContact_contactIdentifiersRequiringConfirmation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolutionResultForPersonWithResolvedContactName:resolvedPerson:resolvedContact:contactIdentifiersRequiringConfirmation:");
}

id objc_msgSend_resolutionResultForPersonWithResolvedHandleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolutionResultForPersonWithResolvedHandleValue:");
}

id objc_msgSend_resolutionResultType(void *a1, const char *a2, ...)
{
  return _[a1 resolutionResultType];
}

id objc_msgSend_resolutionResultUnsupportedWithReason_alternativeItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolutionResultUnsupportedWithReason:alternativeItems:");
}

id objc_msgSend_resolutionSummary(void *a1, const char *a2, ...)
{
  return _[a1 resolutionSummary];
}

id objc_msgSend_resolveContactsFromCallGroups_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveContactsFromCallGroups:");
}

id objc_msgSend_resolvePreferredContactFromContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvePreferredContactFromContacts:");
}

id objc_msgSend_resolvePreferredHandleFromHandles_contactIdentifiersRequiringConfirmation_telephonyOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolvePreferredHandleFromHandles:contactIdentifiersRequiringConfirmation:telephonyOnly:");
}

id objc_msgSend_resolvedEntities(void *a1, const char *a2, ...)
{
  return _[a1 resolvedEntities];
}

id objc_msgSend_resolvedValue(void *a1, const char *a2, ...)
{
  return _[a1 resolvedValue];
}

id objc_msgSend_responseForDialRequest_intent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseForDialRequest:intent:");
}

id objc_msgSend_responseForJoinRequest_intent_callProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseForJoinRequest:intent:callProvider:");
}

id objc_msgSend_restrictedCallTypes(void *a1, const char *a2, ...)
{
  return _[a1 restrictedCallTypes];
}

id objc_msgSend_restrictedContacts_callProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictedContacts:callProvider:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_runIDSQueryForStartCallIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runIDSQueryForStartCallIntent:");
}

id objc_msgSend_runNativeContactResolutionOnParticipant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runNativeContactResolutionOnParticipant:");
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return _[a1 score];
}

id objc_msgSend_scoreByEntity(void *a1, const char *a2, ...)
{
  return _[a1 scoreByEntity];
}

id objc_msgSend_scoredAlternatives(void *a1, const char *a2, ...)
{
  return _[a1 scoredAlternatives];
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 senderDestinationID];
}

id objc_msgSend_senderIdentityClient(void *a1, const char *a2, ...)
{
  return _[a1 senderIdentityClient];
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return _[a1 serviceProvider];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAllowedProtectedAppBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedProtectedAppBundleIDs:");
}

id objc_msgSend_setBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBehavior:");
}

id objc_msgSend_setCallCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallCapability:");
}

id objc_msgSend_setCallRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallRecords:");
}

id objc_msgSend_setCallTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallTypes:");
}

id objc_msgSend_setCallerPool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallerPool:");
}

id objc_msgSend_setConfirmationEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationEnabled:");
}

id objc_msgSend_setConfirmationMargin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationMargin:");
}

id objc_msgSend_setConfirmationReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationReason:");
}

id objc_msgSend_setContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContacts:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationType:");
}

id objc_msgSend_setEndpointIDSDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointIDSDestination:");
}

id objc_msgSend_setEndpointRapportEffectiveIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointRapportEffectiveIdentifier:");
}

id objc_msgSend_setEndpointRapportMediaSystemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpointRapportMediaSystemIdentifier:");
}

id objc_msgSend_setFadeInDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFadeInDuration:");
}

id objc_msgSend_setFadeOutDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFadeOutDuration:");
}

id objc_msgSend_setHungUpCallType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHungUpCallType:");
}

id objc_msgSend_setIncludeThirdPartyCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludeThirdPartyCalls:");
}

id objc_msgSend_setInvitationPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationPreferences:");
}

id objc_msgSend_setInvites_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvites:");
}

id objc_msgSend_setItemURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemURL:");
}

id objc_msgSend_setNumberOfLoops_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLoops:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParticipants_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipants:");
}

id objc_msgSend_setParticipantsPool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParticipantsPool:");
}

id objc_msgSend_setPersonHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonHandle:");
}

id objc_msgSend_setPhonemeData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhonemeData:");
}

id objc_msgSend_setPreferredCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredCallProvider:");
}

id objc_msgSend_setRestrictedContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRestrictedContacts:");
}

id objc_msgSend_setSendToScreening_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSendToScreening:");
}

id objc_msgSend_setShouldDoEmergencyCountdown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldDoEmergencyCountdown:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setSubscriberCountryCodeDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriberCountryCodeDidChange:");
}

id objc_msgSend_setSuccessfulResolutionMargin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuccessfulResolutionMargin:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVideoEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVideoEnabled:");
}

id objc_msgSend_setVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolume:");
}

id objc_msgSend_setWantsStagingArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsStagingArea:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_shouldForceAudioOnlyWithIdiom_withDisplayDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceAudioOnlyWithIdiom:withDisplayDisabled:");
}

id objc_msgSend_shouldInferAudioCapabilityForRequestedCallCapability_idiom_isDisplayDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInferAudioCapabilityForRequestedCallCapability:idiom:isDisplayDisabled:");
}

id objc_msgSend_shouldRequireInvalidNumberConfirmationForRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRequireInvalidNumberConfirmationForRecipient:");
}

id objc_msgSend_shouldRequireUnknownRecipientConfirmationForRequestedRecipient_resolvedToRecipient_contact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRequireUnknownRecipientConfirmationForRequestedRecipient:resolvedToRecipient:contact:");
}

id objc_msgSend_siriEmergencyServices(void *a1, const char *a2, ...)
{
  return _[a1 siriEmergencyServices];
}

id objc_msgSend_siriLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 siriLanguageCode];
}

id objc_msgSend_siriManagerForIntentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriManagerForIntentType:");
}

id objc_msgSend_siriMatches(void *a1, const char *a2, ...)
{
  return _[a1 siriMatches];
}

id objc_msgSend_sortContacts_withIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortContacts:withIdentifiers:");
}

id objc_msgSend_sortFaceTimeHandles_faceTimeHandles_nonFaceTimeHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortFaceTimeHandles:faceTimeHandles:nonFaceTimeHandles:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAudioPlaybackOfURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAudioPlaybackOfURL:completion:");
}

id objc_msgSend_startAudioPlaybackRequest_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAudioPlaybackRequest:options:completion:");
}

id objc_msgSend_startDateComponents(void *a1, const char *a2, ...)
{
  return _[a1 startDateComponents];
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromContact_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromContact:style:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subscriberCountryCodeDidChange(void *a1, const char *a2, ...)
{
  return _[a1 subscriberCountryCodeDidChange];
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionsInUse];
}

id objc_msgSend_successWithResolvedCallCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedCallCapability:");
}

id objc_msgSend_successWithResolvedCallDestinationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedCallDestinationType:");
}

id objc_msgSend_successWithResolvedCallGroupConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedCallGroupConversation:");
}

id objc_msgSend_successWithResolvedCallRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedCallRecord:");
}

id objc_msgSend_successWithResolvedPerson_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedPerson:");
}

id objc_msgSend_successWithResolvedPreferredCallProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedPreferredCallProvider:");
}

id objc_msgSend_successWithResolvedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "successWithResolvedString:");
}

id objc_msgSend_successfulResolutionMargin(void *a1, const char *a2, ...)
{
  return _[a1 successfulResolutionMargin];
}

id objc_msgSend_supportsDisplayingFaceTimeAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsDisplayingFaceTimeAudioCalls];
}

id objc_msgSend_supportsDisplayingFaceTimeVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsDisplayingFaceTimeVideoCalls];
}

id objc_msgSend_supportsFaceTimeAudioCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsFaceTimeAudioCalls];
}

id objc_msgSend_supportsFaceTimeVideoCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsFaceTimeVideoCalls];
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return _[a1 supportsPrimaryCalling];
}

id objc_msgSend_supportsTelephonyCalls(void *a1, const char *a2, ...)
{
  return _[a1 supportsTelephonyCalls];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 telephonyProvider];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _[a1 tuHandle];
}

id objc_msgSend_tu_allContactIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_allContactIdentifiers");
}

id objc_msgSend_tu_contactsForHandles_keyDescriptors_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_contactsForHandles:keyDescriptors:error:");
}

id objc_msgSend_tu_contactsMatchingIdentifiers_contactsDataSource_identifierToContactCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_contactsMatchingIdentifiers:contactsDataSource:identifierToContactCache:");
}

id objc_msgSend_tu_containsObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_containsObjectPassingTest:");
}

id objc_msgSend_tu_defaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_defaults");
}

id objc_msgSend_tu_emailAddressesMatchingPersonHandleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_emailAddressesMatchingPersonHandleLabel:");
}

id objc_msgSend_tu_handlesMatchingPersonWithContactsDataSource_identifierToContactCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_handlesMatchingPersonWithContactsDataSource:identifierToContactCache:");
}

id objc_msgSend_tu_initUnlabledPersonHandleWithTUHandle_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_initUnlabledPersonHandleWithTUHandle:isoCountryCodes:");
}

id objc_msgSend_tu_labeledValue_matchesPersonHandleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_labeledValue:matchesPersonHandleLabel:");
}

id objc_msgSend_tu_mapObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_mapObjectsUsingBlock:");
}

id objc_msgSend_tu_matchingINPersonHandlesByContactIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_matchingINPersonHandlesByContactIdentifier");
}

id objc_msgSend_tu_normalizedCHHandlesFromTUHandle_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:");
}

id objc_msgSend_tu_normalizedHandleForISOCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_normalizedHandleForISOCountryCode:");
}

id objc_msgSend_tu_personHandleMatchingHandle_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_personHandleMatchingHandle:isoCountryCodes:");
}

id objc_msgSend_tu_personMatchingHandle_contactsDataSource_isoCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_personMatchingHandle:contactsDataSource:isoCountryCodes:");
}

id objc_msgSend_tu_personWithFormattedHandleForISOCountryCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_personWithFormattedHandleForISOCountryCodes:");
}

id objc_msgSend_tu_phoneNumbersMatchingPersonHandleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_phoneNumbersMatchingPersonHandleLabel:");
}

id objc_msgSend_tu_tuHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_tuHandle");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_unformattedInternationalStringValue(void *a1, const char *a2, ...)
{
  return _[a1 unformattedInternationalStringValue];
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_unresolvedPerson(void *a1, const char *a2, ...)
{
  return _[a1 unresolvedPerson];
}

id objc_msgSend_unseen(void *a1, const char *a2, ...)
{
  return _[a1 unseen];
}

id objc_msgSend_unsupported(void *a1, const char *a2, ...)
{
  return _[a1 unsupported];
}

id objc_msgSend_unsupportedForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsupportedForReason:");
}

id objc_msgSend_updateHandlerStateForContactResolutionResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHandlerStateForContactResolutionResults:");
}

id objc_msgSend_updateRecentlyUsedHandlersWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecentlyUsedHandlersWithHandler:");
}

id objc_msgSend_updateScoreBasedContactResolver_forFavoritesAmongContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScoreBasedContactResolver:forFavoritesAmongContacts:");
}

id objc_msgSend_updateScoreBasedContactResolver_forRecentCallsMatchingContacts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScoreBasedContactResolver:forRecentCallsMatchingContacts:");
}

id objc_msgSend_updateScoreBasedHandleResolver_forFavoritesAmongHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScoreBasedHandleResolver:forFavoritesAmongHandles:");
}

id objc_msgSend_updateScoreBasedHandleResolver_forRecentCallsMatchingHandles_telephonyOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScoreBasedHandleResolver:forRecentCallsMatchingHandles:telephonyOnly:");
}

id objc_msgSend_useLegacyContactResolution(void *a1, const char *a2, ...)
{
  return _[a1 useLegacyContactResolution];
}

id objc_msgSend_useLegacyHandleResolution(void *a1, const char *a2, ...)
{
  return _[a1 useLegacyHandleResolution];
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return _[a1 userActivity];
}

id objc_msgSend_userActivityUsingDeprecatedCallingIntents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivityUsingDeprecatedCallingIntents:");
}

id objc_msgSend_usesScoreBasedEncoding(void *a1, const char *a2, ...)
{
  return _[a1 usesScoreBasedEncoding];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vettedAliases(void *a1, const char *a2, ...)
{
  return _[a1 vettedAliases];
}

id objc_msgSend_videoDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 videoDeviceController];
}

id objc_msgSend_vmIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 vmIdentifier];
}

id objc_msgSend_voicemailDataSource(void *a1, const char *a2, ...)
{
  return _[a1 voicemailDataSource];
}