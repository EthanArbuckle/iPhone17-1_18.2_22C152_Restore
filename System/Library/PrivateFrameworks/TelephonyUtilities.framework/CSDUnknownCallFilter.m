@interface CSDUnknownCallFilter
- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)containsRecentsRestrictedHandle:(id)a3;
- (BOOL)containsRestrictedHandle:(id)a3;
- (BOOL)isSilenceUnknownFaceTimeCallersEnabled;
- (BOOL)isSilenceUnknownTelephonyCallersEnabled;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownCaller:(id)a3;
- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4;
- (int64_t)maxJunkLevel;
@end

@implementation CSDUnknownCallFilter

- (BOOL)isSilenceUnknownTelephonyCallersEnabled
{
  v3 = +[NSUserDefaults tu_defaults];
  unsigned int v4 = [v3 silenceUnknownCallersEnabled];

  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 1024;
    unsigned int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ isSilenceUnknownCallersEnabled(Telephony): %d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (BOOL)isSilenceUnknownFaceTimeCallersEnabled
{
  v3 = +[NSUserDefaults tu_defaults];
  unsigned int v4 = [v3 silenceUnknownFaceTimeCallersEnabled];

  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 1024;
    unsigned int v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ isSilenceUnknownFaceTimeCallersEnabled: %d", (uint8_t *)&v7, 0x12u);
  }

  return v4;
}

- (int64_t)maxJunkLevel
{
  v3 = +[NSUserDefaults tu_defaults];
  id v4 = [v3 maxJunkLevel];

  v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 2048;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ maxJunkLevel: %ld", (uint8_t *)&v7, 0x16u);
  }

  return (int64_t)v4;
}

- (BOOL)containsOutgoingRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  return 0;
}

- (BOOL)containsRecentsRestrictedHandle:(id)a3
{
  return 0;
}

- (BOOL)containsRestrictedHandle:(id)a3
{
  return 0;
}

- (int64_t)filterStatusForAddresses:(id)a3 withBundleIdentifier:(id)a4
{
  return 0;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  return 0;
}

- (BOOL)isUnknownCaller:(id)a3
{
  return 0;
}

- (BOOL)shouldFilterIncomingCall:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isSystemProvider] & 1) == 0)
  {
    v18 = sub_100008DCC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v6 UUID];
      int v29 = 138412290;
      v30 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not a system call; call filter will allow update with identifier %@",
        (uint8_t *)&v29,
        0xCu);
    }
    goto LABEL_13;
  }
  unsigned int v8 = [(CSDUnknownCallFilter *)self isSilenceUnknownTelephonyCallersEnabled];
  unsigned int v9 = [(CSDUnknownCallFilter *)self isSilenceUnknownFaceTimeCallersEnabled];
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138413058;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 1024;
    unsigned int v34 = v8;
    __int16 v35 = 1024;
    unsigned int v36 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ shouldFilterIncoming update=%@ isSilenceUnknownTelephonyCallersEnabled=%d isSilenceUnknownFaceTimeCallersEnabled=%d", (uint8_t *)&v29, 0x22u);
  }

  unsigned int v11 = [v7 isTelephonyProvider] & v8;
  if ((v11 & 1) == 0 && ((v9 ^ 1) & 1) == 0)
  {
    if ([v7 isFaceTimeProvider])
    {
      v12 = +[TUCallCenter sharedInstance];
      v13 = [v12 conversationManager];
      v14 = [v6 participantGroupUUID];
      v15 = [v13 activeConversationWithGroupUUID:v14];

      if (!v15
        || ([v15 provider],
            v16 = objc_claimAutoreleasedReturnValue(),
            unsigned int v17 = [v16 isDefaultProvider],
            v16,
            v15,
            v17))
      {
        unsigned int v11 = 1;
        goto LABEL_15;
      }
LABEL_13:
      LOBYTE(v20) = 0;
      goto LABEL_26;
    }
    unsigned int v11 = 0;
  }
LABEL_15:
  v21 = [v6 remoteHandle];
  v22 = [v21 value];
  id v23 = [v22 length];

  if (!v23)
  {
    v25 = sub_100008DCC();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412546;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@ update does not have a valid handle, by definition this is an unknown caller update %@", (uint8_t *)&v29, 0x16u);
    }

    goto LABEL_21;
  }
  if ([(CSDUnknownCallFilter *)self isUnknownCaller:v6])
  {
LABEL_21:
    uint64_t v24 = (uint64_t)[v6 isKnownCaller];
    BOOL v20 = 1;
    goto LABEL_22;
  }
  BOOL v20 = 0;
  uint64_t v24 = 1;
LABEL_22:
  [v6 setIsKnownCaller:v24];
  uint64_t v26 = [(CSDUnknownCallFilter *)self maxJunkLevel];
  v27 = sub_100008DCC();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138413314;
    v30 = self;
    __int16 v31 = 2112;
    id v32 = v6;
    __int16 v33 = 1024;
    unsigned int v34 = v20;
    __int16 v35 = 1024;
    unsigned int v36 = v11;
    __int16 v37 = 2048;
    uint64_t v38 = v26;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ shouldFilterIncoming update=%@ unknownCaller=%d maybeSilenceCall=%d shouldBlockJunk=%ld", (uint8_t *)&v29, 0x2Cu);
  }

  if (((v11 | !v20) & 1) == 0) {
    LOBYTE(v20) = (uint64_t)[v6 junkConfidence] > v26;
  }
LABEL_26:

  return v20;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  return 0;
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  return 0;
}

@end