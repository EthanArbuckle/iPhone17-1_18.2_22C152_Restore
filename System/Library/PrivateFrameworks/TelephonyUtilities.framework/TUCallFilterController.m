@interface TUCallFilterController
- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5;
- (BOOL)isUnknownHandle:(id)a3;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5;
- (BOOL)shouldRestrictAddresses:(id)a3 performSynchronously:(BOOL)a4;
- (BOOL)shouldRestrictConversation:(id)a3 performSynchronously:(BOOL)a4;
- (BOOL)shouldRestrictDialRequest:(id)a3;
- (BOOL)shouldRestrictDialRequest:(id)a3 performSynchronously:(BOOL)a4;
- (BOOL)shouldRestrictJoinConversationRequest:(id)a3 performSynchronously:(BOOL)a4;
- (BOOL)silenceUnknownCallersEnabled;
- (BOOL)silenceUnknownFaceTimeCallersEnabled;
- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (OS_dispatch_queue)queue;
- (TUCallFilterController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4;
- (TUCallFilterControllerActions)actionsDelegate;
- (id)addressesToCheckForRestrictionsInConversation:(id)a3;
- (id)bundleIdentifierForCallProvider:(id)a3;
- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4;
- (id)restrictedContacts:(id)a3 callProvider:(id)a4;
- (unint64_t)callFilterStatusForDialRequest:(id)a3;
@end

@implementation TUCallFilterController

- (TUCallFilterController)initWithActionsDelegate:(id)a3 serialQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TUCallFilterController;
  v8 = [(TUCallFilterController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a4);
    objc_storeWeak((id *)&v9->_actionsDelegate, v6);
  }

  return v9;
}

- (BOOL)silenceUnknownCallersEnabled
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  char v3 = [v2 BOOLForKey:@"allowContactsOnly"];

  return v3;
}

- (BOOL)silenceUnknownFaceTimeCallersEnabled
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  char v3 = [v2 BOOLForKey:@"silenceUnknownFaceTimeCallers"];

  return v3;
}

- (BOOL)isUnknownHandle:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 value];
  LOBYTE(self) = [(TUCallFilterController *)self isUnknownAddress:v4 normalizedAddress:v4 forBundleIdentifier:&stru_1EECEA668];

  return (char)self;
}

- (BOOL)shouldRestrictDialRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v5);

  LOBYTE(self) = [(TUCallFilterController *)self shouldRestrictDialRequest:v4 performSynchronously:0];
  return (char)self;
}

- (BOOL)shouldRestrictDialRequest:(id)a3 performSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([v6 dialType] == 1 || (objc_msgSend(v6, "isSOS") & 1) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    v9 = [v6 provider];
    v10 = [(TUCallFilterController *)self bundleIdentifierForCallProvider:v9];

    if ([v10 length])
    {
      objc_super v11 = [v6 handle];
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }
      else
      {
        id v13 = +[TUHandle handleWithDestinationID:&stru_1EECEA668];
      }
      v14 = v13;

      BOOL v8 = [(TUCallFilterController *)self containsRestrictedHandle:v14 forBundleIdentifier:v10 performSynchronously:v4];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (unint64_t)callFilterStatusForDialRequest:(id)a3
{
  id v4 = a3;
  v5 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([v4 dialType] == 1 || (objc_msgSend(v4, "isSOS") & 1) != 0)
  {
    unint64_t v6 = 0;
  }
  else
  {
    id v7 = [v4 handle];
    BOOL v8 = [v7 value];
    if ([v8 length])
    {
      v9 = [v4 handle];
      v10 = [v9 value];
    }
    else
    {
      v10 = &stru_1EECEA668;
    }

    objc_super v11 = [v4 provider];
    v12 = [(TUCallFilterController *)self bundleIdentifierForCallProvider:v11];

    if ([v12 length])
    {
      id v13 = [(TUCallFilterController *)self actionsDelegate];
      v14 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
      unint64_t v6 = [v13 filterStatusForAddresses:v14 forBundleIdentifier:v12];
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  return v6;
}

- (id)restrictedContacts:(id)a3 callProvider:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v28 = [MEMORY[0x1E4F1CA48] array];
  v9 = [(TUCallFilterController *)self bundleIdentifierForCallProvider:v7];
  if ([v9 length])
  {
    id v25 = v7;
    id v26 = v6;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (!v10) {
      goto LABEL_25;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "personHandle", v25, v26);
        v16 = [v15 value];
        if ([v16 length])
        {
          v17 = [v14 personHandle];
          v18 = [v17 value];
        }
        else
        {
          v18 = &stru_1EECEA668;
        }

        v19 = [(TUCallFilterController *)self actionsDelegate];
        v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
        uint64_t v21 = [v19 filterStatusForAddresses:v20 forBundleIdentifier:v9];

        switch(v21)
        {
          case 1:
            v22 = TUDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              -[TUCallFilterController restrictedContacts:callProvider:].cold.4((uint64_t)v34, (uint64_t)v14);
            }
            goto LABEL_19;
          case 2:
            v22 = TUDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              -[TUCallFilterController restrictedContacts:callProvider:]((uint64_t)v35, (uint64_t)v14);
            }
            goto LABEL_19;
          case 3:
            v22 = TUDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              -[TUCallFilterController restrictedContacts:callProvider:]((uint64_t)v36, (uint64_t)v14);
            }
LABEL_19:

            [v28 addObject:v14];
            goto LABEL_23;
        }
        v23 = TUDefaultLog();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[TUCallFilterController restrictedContacts:callProvider:]((uint64_t)v33, (uint64_t)v14);
        }

LABEL_23:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (!v11)
      {
LABEL_25:

        id v7 = v25;
        id v6 = v26;
        break;
      }
    }
  }

  return v28;
}

- (id)policyForAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(TUCallFilterController *)self actionsDelegate];
  uint64_t v10 = [v9 policyForAddresses:v7 forBundleIdentifier:v6];

  return v10;
}

- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [(TUCallFilterController *)self actionsDelegate];
  LOBYTE(v8) = [v9 containsRestrictedHandle:v7 forBundleIdentifier:v6 performSynchronously:0];

  return (char)v8;
}

- (id)addressesToCheckForRestrictionsInConversation:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = [v4 mergedActiveRemoteParticipants];
  BOOL v8 = objc_msgSend(v6, "setWithCapacity:", objc_msgSend(v7, "count"));

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v31 = v4;
  v9 = [v4 mergedActiveRemoteParticipants];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v15 = [v14 handle];
        v16 = [v15 value];
        if ([v16 length])
        {
          v17 = [v14 handle];
          v18 = [v17 value];
        }
        else
        {
          v18 = &stru_1EECEA668;
        }

        [v8 addObject:v18];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v11);
  }

  if (![v8 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v19 = [v31 mergedRemoteMembers];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
          id v25 = [v24 handle];
          id v26 = [v25 value];
          if ([v26 length])
          {
            v27 = [v24 handle];
            id v28 = [v27 value];
          }
          else
          {
            id v28 = &stru_1EECEA668;
          }

          [v8 addObject:v28];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v21);
    }
  }
  long long v29 = (void *)[v8 copy];

  return v29;
}

- (BOOL)shouldRestrictConversation:(id)a3 performSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v7);

  BOOL v8 = [(TUCallFilterController *)self addressesToCheckForRestrictionsInConversation:v6];

  LOBYTE(v4) = [(TUCallFilterController *)self shouldRestrictAddresses:v8 performSynchronously:v4];
  return v4;
}

- (BOOL)shouldRestrictAddresses:(id)a3 performSynchronously:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v7);

  LOBYTE(v4) = [(TUCallFilterController *)self shouldRestrictAddresses:v6 forBundleIdentifier:@"com.apple.facetime" performSynchronously:v4];
  return v4;
}

- (BOOL)containsRestrictedHandle:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(TUCallFilterController *)self actionsDelegate];
  LOBYTE(v5) = [v11 containsRestrictedHandle:v9 forBundleIdentifier:v8 performSynchronously:v5];

  return v5;
}

- (BOOL)shouldRestrictJoinConversationRequest:(id)a3 performSynchronously:(BOOL)a4
{
  BOOL v24 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23 = self;
  id v6 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)MEMORY[0x1E4F1CA80];
  id v8 = [v5 remoteMembers];
  id v9 = objc_msgSend(v7, "setWithCapacity:", objc_msgSend(v8, "count"));

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v25 = v5;
  uint64_t v10 = [v5 remoteMembers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = [v15 handle];
        v17 = [v16 value];
        if ([v17 length])
        {
          v18 = [v15 handle];
          v19 = [v18 value];
        }
        else
        {
          v19 = &stru_1EECEA668;
        }

        [v9 addObject:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }

  uint64_t v20 = [(TUCallFilterController *)v23 actionsDelegate];
  char v21 = [v20 shouldRestrictAddresses:v9 forBundleIdentifier:@"com.apple.facetime" performSynchronously:v24];

  return v21;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4 performSynchronously:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v10);

  uint64_t v11 = [(TUCallFilterController *)self actionsDelegate];
  LOBYTE(v5) = [v11 shouldRestrictAddresses:v9 forBundleIdentifier:v8 performSynchronously:v5];

  return v5;
}

- (BOOL)shouldRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  return [(TUCallFilterController *)self shouldRestrictAddresses:a3 forBundleIdentifier:a4 performSynchronously:0];
}

- (BOOL)willRestrictAddresses:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v8);

  id v9 = [(TUCallFilterController *)self actionsDelegate];
  LOBYTE(v8) = [v9 willRestrictAddresses:v7 forBundleIdentifier:v6];

  return (char)v8;
}

- (BOOL)isUnknownAddress:(id)a3 normalizedAddress:(id)a4 forBundleIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(TUCallFilterController *)self queue];
  dispatch_assert_queue_V2(v11);

  uint64_t v12 = [(TUCallFilterController *)self actionsDelegate];
  LOBYTE(v11) = [v12 isUnknownAddress:v10 normalizedAddress:v9 forBundleIdentifier:v8];

  return (char)v11;
}

- (id)bundleIdentifierForCallProvider:(id)a3
{
  id v3 = a3;
  if ([v3 isTelephonyProvider])
  {
    BOOL v4 = TUBundleIdentifierMobilePhoneApplication;
LABEL_5:
    uint64_t v5 = *v4;
    goto LABEL_7;
  }
  if ([v3 isFaceTimeProvider])
  {
    BOOL v4 = TUBundleIdentifierFaceTimeApplication;
    goto LABEL_5;
  }
  uint64_t v5 = [v3 bundleIdentifier];
LABEL_7:
  id v6 = v5;

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (TUCallFilterControllerActions)actionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);

  return (TUCallFilterControllerActions *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionsDelegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_0_2(a1, a2), "personHandle");
  id v3 = [v2 value];
  OUTLINED_FUNCTION_2_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_19C496000, v4, v5, "Member with handle (%@) doesn't have a restricted status");
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_0_2(a1, a2), "personHandle");
  id v3 = [v2 value];
  OUTLINED_FUNCTION_2_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_19C496000, v4, v5, "Member with handle (%@) has a restricted status");
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.3(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_0_2(a1, a2), "personHandle");
  id v3 = [v2 value];
  OUTLINED_FUNCTION_2_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_19C496000, v4, v5, "Member with handle (%@) has a status limited by downtime");
}

- (void)restrictedContacts:(uint64_t)a1 callProvider:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_0_2(a1, a2), "personHandle");
  id v3 = [v2 value];
  OUTLINED_FUNCTION_2_1((uint64_t)v3, 5.7779e-34);
  OUTLINED_FUNCTION_1_2(&dword_19C496000, v4, v5, "Member with handle (%@) has a status limited by screentime");
}

@end