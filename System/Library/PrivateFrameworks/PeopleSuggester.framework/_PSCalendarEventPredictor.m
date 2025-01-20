@interface _PSCalendarEventPredictor
+ (BOOL)currentUserIsEligibleForEvent:(id)a3;
+ (BOOL)hasFaceTimeSignalInEvent:(id)a3;
+ (BOOL)isCorecipientParticipant:(id)a3 seedRecipients:(id)a4 contactsMap:(id)a5;
+ (BOOL)isEligibleParticipant:(id)a3 context:(id)a4 contactsMap:(id)a5;
+ (BOOL)isMaybeFaceTimeEvent:(id)a3 earliestStartDate:(id)a4 latestStartDate:(id)a5 maxParticipants:(unint64_t)a6;
+ (id)_handleFromParticipant:(id)a3;
+ (id)createFinalSuggestions:(id)a3 context:(id)a4;
+ (id)eventComparatorWithPredictionContext:(id)a3 contactsMap:(id)a4;
+ (id)getZKWSuggestionForCalendarEvent:(id)a3 context:(id)a4 contactsMap:(id)a5;
+ (id)participantComparatorWithContactsMap:(id)a3;
+ (unint64_t)_numOfOtherParticipantsInEvent:(id)a3;
- (_PSCalendarEventPredictor)init;
- (_PSCalendarEventPredictor)initWithEventStore:(id)a3 contactStore:(id)a4;
- (id)contactKeysToFetch;
- (id)getParticipantContactsMapFromEvent:(id)a3;
- (id)zkwSuggestionsFromCalendarWithPredictionContext:(id)a3 startDate:(id)a4 endDate:(id)a5 maxParticipants:(unint64_t)a6;
@end

@implementation _PSCalendarEventPredictor

- (_PSCalendarEventPredictor)init
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v3 = (void *)getEKEventStoreClass_softClass_0;
  uint64_t v20 = getEKEventStoreClass_softClass_0;
  if (!getEKEventStoreClass_softClass_0)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getEKEventStoreClass_block_invoke_0;
    v15 = &unk_1E5ADE858;
    v16 = &v17;
    __getEKEventStoreClass_block_invoke_0((uint64_t)&v12);
    v3 = (void *)v18[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v17, 8);
  v5 = objc_opt_new();
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v6 = (void *)getCNContactStoreClass_softClass_9;
  uint64_t v20 = getCNContactStoreClass_softClass_9;
  if (!getCNContactStoreClass_softClass_9)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __getCNContactStoreClass_block_invoke_9;
    v15 = &unk_1E5ADE858;
    v16 = &v17;
    ContactsLibraryCore_9();
    Class Class = objc_getClass("CNContactStore");
    *(void *)(v16[1] + 24) = Class;
    getCNContactStoreClass_softClass_9 = *(void *)(v16[1] + 24);
    v6 = (void *)v18[3];
  }
  id v8 = v6;
  _Block_object_dispose(&v17, 8);
  v9 = objc_opt_new();
  v10 = [(_PSCalendarEventPredictor *)self initWithEventStore:v5 contactStore:v9];

  return v10;
}

- (_PSCalendarEventPredictor)initWithEventStore:(id)a3 contactStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSCalendarEventPredictor;
  v9 = [(_PSCalendarEventPredictor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

+ (id)_handleFromParticipant:(id)a3
{
  id v3 = a3;
  id v4 = [v3 phoneNumber];
  uint64_t v5 = [v4 length];

  if (v5) {
    [v3 phoneNumber];
  }
  else {
  v6 = [v3 emailAddress];
  }

  return v6;
}

+ (BOOL)isCorecipientParticipant:(id)a3 seedRecipients:(id)a4 contactsMap:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 count] && _os_feature_enabled_impl())
  {
    v10 = objc_opt_new();
    v11 = [v7 phoneNumber];

    if (v11)
    {
      objc_super v12 = [v7 phoneNumber];
      [v10 addObject:v12];
    }
    uint64_t v13 = [v7 emailAddress];

    if (v13)
    {
      v14 = [v7 emailAddress];
      [v10 addObject:v14];
    }
    v15 = [v9 objectForKeyedSubscript:v7];
    v16 = [v15 firstObject];

    if (v16)
    {
      uint64_t v17 = [v16 identifier];
      [v10 addObject:v17];

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v18 = [v16 emailAddresses];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v39 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [*(id *)(*((void *)&v38 + 1) + 8 * i) value];
            [v10 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v20);
      }

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      v33 = v16;
      v24 = [v16 phoneNumbers];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v35 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = [*(id *)(*((void *)&v34 + 1) + 8 * j) value];
            v30 = [v29 fullyQualifiedDigits];

            if (v30) {
              [v10 addObject:v30];
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
        }
        while (v26);
      }

      v16 = v33;
    }
    char v31 = [v10 intersectsSet:v8];
  }
  else
  {
    char v31 = 0;
  }

  return v31;
}

+ (BOOL)isEligibleParticipant:(id)a3 context:(id)a4 contactsMap:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 isCurrentUser])
  {
    v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:]();
    }
  }
  else if ([v7 participantType] == 1)
  {
    v11 = [v8 seedRecipients];
    if ([v11 count] && (_os_feature_enabled_impl() & 1) != 0)
    {
      objc_super v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = [v8 seedRecipients];
      v14 = [v12 setWithArray:v13];
      BOOL v15 = +[_PSCalendarEventPredictor isCorecipientParticipant:v7 seedRecipients:v14 contactsMap:v9];

      if (v15) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([v7 participantStatus] != 3)
    {
      BOOL v16 = 1;
      goto LABEL_17;
    }
    v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:]();
    }
  }
  else
  {
    v10 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[_PSCalendarEventPredictor isEligibleParticipant:context:contactsMap:]();
    }
  }

LABEL_16:
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

+ (BOOL)hasFaceTimeSignalInEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 title];
  uint64_t v5 = [v4 lowercaseString];
  if ([v5 containsString:@"facetime"])
  {
    BOOL v6 = 1;
  }
  else
  {
    id v7 = [v3 location];
    id v8 = [v7 lowercaseString];
    if ([v8 containsString:@"facetime"])
    {
      BOOL v6 = 1;
    }
    else
    {
      id v9 = [v3 notes];
      v10 = [v9 lowercaseString];
      if ([v10 containsString:@"facetime"])
      {
        BOOL v6 = 1;
      }
      else
      {
        v11 = [v3 location];
        BOOL v6 = [v11 length] == 0;
      }
    }
  }
  return v6;
}

+ (id)eventComparatorWithPredictionContext:(id)a3 contactsMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78___PSCalendarEventPredictor_eventComparatorWithPredictionContext_contactsMap___block_invoke;
  v13[3] = &unk_1E5AE12F8;
  id v14 = v5;
  id v15 = v7;
  id v16 = v6;
  id v8 = v6;
  id v9 = v7;
  id v10 = v5;
  v11 = (void *)MEMORY[0x1A6243AD0](v13);

  return v11;
}

+ (id)participantComparatorWithContactsMap:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66___PSCalendarEventPredictor_participantComparatorWithContactsMap___block_invoke;
  v7[3] = &unk_1E5AE1320;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x1A6243AD0](v7);

  return v5;
}

+ (unint64_t)_numOfOtherParticipantsInEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = objc_msgSend(a3, "attendees", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      id v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      uint64_t v10 = [v9 participantType];
      if (v10 == 4) {
        break;
      }
      uint64_t v11 = v10;
      LODWORD(v12) = [v9 isCurrentUser] ^ 1;
      if (v11 == 1) {
        uint64_t v12 = v12;
      }
      else {
        uint64_t v12 = 0;
      }
      v6 += v12;
      if (v5 == ++v8)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }
  }
  unint64_t v6 = 0;
LABEL_14:

  return v6;
}

+ (BOOL)currentUserIsEligibleForEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = objc_msgSend(v3, "attendees", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        if ([v10 isCurrentUser]) {
          break;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v11 = v10;

      if (!v11) {
        goto LABEL_16;
      }
      if ([v11 participantType] == 1)
      {
        if ([v11 participantRole] == 3 || objc_msgSend(v11, "participantStatus") == 2)
        {
          BOOL v12 = 1;
          goto LABEL_23;
        }
        uint64_t v13 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          +[_PSCalendarEventPredictor currentUserIsEligibleForEvent:](v4);
        }
      }
      else
      {
        uint64_t v13 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          +[_PSCalendarEventPredictor currentUserIsEligibleForEvent:](v4);
        }
      }
    }
    else
    {
LABEL_10:

LABEL_16:
      uint64_t v13 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        +[_PSCalendarEventPredictor currentUserIsEligibleForEvent:](v4);
      }
      id v11 = 0;
    }

    BOOL v12 = 0;
LABEL_23:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)isMaybeFaceTimeEvent:(id)a3 earliestStartDate:(id)a4 latestStartDate:(id)a5 maxParticipants:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    uint64_t v12 = [v9 startDate];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      long long v14 = [v9 startDate];
      if ([v14 compare:v10] == -1)
      {
      }
      else
      {
        long long v15 = [v9 startDate];
        uint64_t v16 = [v15 compare:v11];

        if (v16 != 1)
        {
          if ([v9 isAllDay])
          {
            long long v17 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:]();
            }
LABEL_12:
            BOOL v18 = 0;
LABEL_13:

            goto LABEL_14;
          }
          if ([v9 status] == 3)
          {
            long long v17 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:]();
            }
            goto LABEL_12;
          }
          uint64_t v20 = [v9 attendees];
          if ((unint64_t)[v20 count] < 2)
          {

            goto LABEL_21;
          }
          unint64_t v21 = +[_PSCalendarEventPredictor _numOfOtherParticipantsInEvent:v9];

          if (v21 > a6)
          {
LABEL_21:
            long long v17 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.4();
            }
            goto LABEL_12;
          }
          v22 = [v9 virtualConference];

          if (v22)
          {
            long long v17 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.8(v9);
            }
            goto LABEL_12;
          }
          v23 = [v9 location];
          long long v17 = [v23 lowercaseString];

          if (([v17 hasPrefix:@"http://"] & 1) != 0
            || [v17 hasPrefix:@"https://"])
          {
            v24 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.5(v9);
            }
            goto LABEL_30;
          }
          uint64_t v25 = [v9 URL];
          uint64_t v26 = [v25 scheme];
          v24 = [v26 lowercaseString];

          if (([v24 hasPrefix:@"http"] & 1) != 0
            || [v24 hasPrefix:@"https"])
          {
            uint64_t v27 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.6(v9);
            }
            BOOL v18 = 0;
          }
          else
          {
            if (!+[_PSCalendarEventPredictor currentUserIsEligibleForEvent:v9])
            {
LABEL_30:
              BOOL v18 = 0;
LABEL_37:

              goto LABEL_13;
            }
            uint64_t v27 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
              +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:].cold.7();
            }
            BOOL v18 = 1;
          }

          goto LABEL_37;
        }
      }
    }
    long long v17 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      +[_PSCalendarEventPredictor isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:]();
    }
    goto LABEL_12;
  }
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

+ (id)getZKWSuggestionForCalendarEvent:(id)a3 context:(id)a4 contactsMap:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v37 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = [v7 attendees];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        if (+[_PSCalendarEventPredictor isEligibleParticipant:v15 context:v8 contactsMap:v9])
        {
          [v37 addObject:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v12);
  }

  uint64_t v16 = v37;
  if ([v37 count])
  {
    long long v34 = v8;
    long long v35 = v7;
    long long v17 = +[_PSCalendarEventPredictor participantComparatorWithContactsMap:v9];
    BOOL v18 = [v37 sortedArrayUsingComparator:v17];

    uint64_t v19 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v18;
    uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(obj);
          }
          v24 = *(void **)(*((void *)&v38 + 1) + 8 * j);
          uint64_t v25 = +[_PSCalendarEventPredictor _handleFromParticipant:v24];
          uint64_t v26 = [v24 name];
          uint64_t v27 = [v9 objectForKeyedSubscript:v24];
          v28 = [v27 firstObject];

          v29 = [[_PSRecipient alloc] initWithIdentifier:v25 handle:v25 displayName:v26 contact:v28];
          [v19 addObject:v29];
        }
        uint64_t v21 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v21);
    }

    if ([v19 count])
    {
      v30 = [_PSSuggestion alloc];
      id v8 = v34;
      char v31 = [v34 bundleID];
      v32 = [(_PSSuggestion *)v30 initWithBundleID:v31 conversationIdentifier:0 groupName:0 recipients:v19 reason:@"Calendar Event Participants" reasonType:0];
      id v7 = v35;
    }
    else
    {
      char v31 = +[_PSLogging generalChannel];
      id v8 = v34;
      id v7 = v35;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        +[_PSCalendarEventPredictor getZKWSuggestionForCalendarEvent:context:contactsMap:](v35);
      }
      v32 = 0;
    }
    uint64_t v16 = v37;
  }
  else
  {
    obuint64_t j = +[_PSLogging generalChannel];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
      +[_PSCalendarEventPredictor getZKWSuggestionForCalendarEvent:context:contactsMap:](v7);
    }
    v32 = 0;
  }

  return v32;
}

+ (id)createFinalSuggestions:(id)a3 context:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a4 seedRecipients];
  if (![v6 count])
  {

    goto LABEL_21;
  }
  char v7 = _os_feature_enabled_impl();

  if ((v7 & 1) == 0)
  {
LABEL_21:
    id v32 = v5;
    goto LABEL_22;
  }
  id v8 = objc_opt_new();
  id v32 = (id)objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = v5;
  obuint64_t j = v5;
  uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v41;
    char v31 = v8;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v9;
        id v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v33 = v10;
        objc_msgSend(v10, "recipients", v26);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [v35 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v37;
          do
          {
            uint64_t v14 = 0;
            uint64_t v34 = v12;
            do
            {
              if (*(void *)v37 != v13) {
                objc_enumerationMutation(v35);
              }
              uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
              uint64_t v16 = [v15 identifier];
              if (([v8 containsObject:v16] & 1) == 0)
              {
                long long v17 = [_PSSuggestion alloc];
                BOOL v18 = [v33 bundleID];
                uint64_t v19 = [v33 conversationIdentifier];
                uint64_t v20 = [v33 groupName];
                long long v44 = v15;
                uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
                uint64_t v22 = [v33 reason];
                v23 = [v33 reasonType];
                v24 = [(_PSSuggestion *)v17 initWithBundleID:v18 conversationIdentifier:v19 groupName:v20 recipients:v21 reason:v22 reasonType:v23];

                uint64_t v12 = v34;
                id v8 = v31;

                [v32 addObject:v24];
                [v31 addObject:v16];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v35 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v30 + 1;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v29);
  }

  id v5 = v26;
LABEL_22:

  return v32;
}

- (id)getParticipantContactsMapFromEvent:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v19 = (id)objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v18 = v4;
  obuint64_t j = [v4 attendees];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        contactStore = self->_contactStore;
        uint64_t v11 = [v9 contactPredicate];
        uint64_t v12 = [(_PSCalendarEventPredictor *)self contactKeysToFetch];
        id v21 = 0;
        uint64_t v13 = [(CNContactStore *)contactStore unifiedContactsMatchingPredicate:v11 keysToFetch:v12 error:&v21];
        id v14 = v21;

        if ([v13 count]) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 0;
        }
        if (v15)
        {
          [v19 setObject:v13 forKeyedSubscript:v9];
        }
        else
        {
          uint64_t v16 = +[_PSLogging generalChannel];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v27 = v9;
            __int16 v28 = 2112;
            id v29 = v14;
            _os_log_debug_impl(&dword_1A314B000, v16, OS_LOG_TYPE_DEBUG, "Unable to find Contact for participant %@ w/ error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  return v19;
}

- (id)zkwSuggestionsFromCalendarWithPredictionContext:(id)a3 startDate:(id)a4 endDate:(id)a5 maxParticipants:(unint64_t)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(EKEventStore *)self->_eventStore calendarsForEntityType:0];
  uint64_t v13 = [(EKEventStore *)self->_eventStore predicateForEventsWithStartDate:v10 endDate:v11 calendars:v12];
  id v14 = objc_opt_new();
  eventStore = self->_eventStore;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __111___PSCalendarEventPredictor_zkwSuggestionsFromCalendarWithPredictionContext_startDate_endDate_maxParticipants___block_invoke;
  v55[3] = &unk_1E5AE1348;
  id v16 = v10;
  id v56 = v16;
  id v17 = v11;
  id v57 = v17;
  unint64_t v59 = a6;
  id v18 = v14;
  id v58 = v18;
  [(EKEventStore *)eventStore enumerateEventsMatchingPredicate:v13 usingBlock:v55];
  if ([v18 count])
  {
    id v42 = v17;
    id v43 = v16;
    long long v45 = v12;
    id v19 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v41 = v18;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v51 objects:v63 count:16];
    long long v22 = v46;
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v20);
          }
          id v26 = [(_PSCalendarEventPredictor *)self getParticipantContactsMapFromEvent:*(void *)(*((void *)&v51 + 1) + 8 * i)];
          [v19 addEntriesFromDictionary:v26];
        }
        uint64_t v23 = [v20 countByEnumeratingWithState:&v51 objects:v63 count:16];
      }
      while (v23);
    }
    long long v44 = v13;

    uint64_t v27 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:]();
    }

    __int16 v28 = +[_PSCalendarEventPredictor eventComparatorWithPredictionContext:v46 contactsMap:v19];
    id v29 = [v20 sortedArrayUsingComparator:v28];

    uint64_t v30 = objc_opt_new();
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v31 = v29;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v47 objects:v62 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v48 != v34) {
            objc_enumerationMutation(v31);
          }
          long long v36 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          long long v37 = +[_PSCalendarEventPredictor getZKWSuggestionForCalendarEvent:v36 context:v22 contactsMap:v19];
          if (v37)
          {
            [v30 addObject:v37];
          }
          else
          {
            long long v38 = +[_PSLogging generalChannel];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
              -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:](v60, v36, &v61, v38);
            }

            long long v22 = v46;
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v47 objects:v62 count:16];
      }
      while (v33);
    }

    long long v39 = +[_PSCalendarEventPredictor createFinalSuggestions:v30 context:v22];

    uint64_t v13 = v44;
    uint64_t v12 = v45;
    id v17 = v42;
    id v16 = v43;
    id v18 = v41;
  }
  else
  {
    id v19 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[_PSCalendarEventPredictor zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:]();
    }
    long long v39 = (void *)MEMORY[0x1E4F1CBF0];
    long long v22 = v46;
  }

  return v39;
}

- (id)contactKeysToFetch
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_6;
  uint64_t v20 = getCNContactFormatterClass_softClass_6;
  if (!getCNContactFormatterClass_softClass_6)
  {
    ContactsLibraryCore_9();
    v18[3] = (uint64_t)objc_getClass("CNContactFormatter");
    getCNContactFormatterClass_softClass_6 = v18[3];
    v2 = (void *)v18[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v17, 8);
  id v4 = [v3 descriptorForRequiredKeysForStyle:0];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v5 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_8;
  uint64_t v20 = getCNContactIdentifierKeySymbolLoc_ptr_8;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_8)
  {
    uint64_t v6 = (void *)ContactsLibrary_8();
    v18[3] = (uint64_t)dlsym(v6, "CNContactIdentifierKey");
    getCNContactIdentifierKeySymbolLoc_ptr_8 = v18[3];
    uint64_t v5 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v5) {
    goto LABEL_15;
  }
  id v7 = *v5;
  v21[0] = v7;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v8 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_7;
  uint64_t v20 = getCNContactPhoneNumbersKeySymbolLoc_ptr_7;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_7)
  {
    uint64_t v9 = (void *)ContactsLibrary_8();
    v18[3] = (uint64_t)dlsym(v9, "CNContactPhoneNumbersKey");
    getCNContactPhoneNumbersKeySymbolLoc_ptr_7 = v18[3];
    id v8 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v8) {
    goto LABEL_15;
  }
  id v10 = *v8;
  v21[1] = v10;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v11 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_7;
  uint64_t v20 = getCNContactEmailAddressesKeySymbolLoc_ptr_7;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_7)
  {
    uint64_t v12 = (void *)ContactsLibrary_8();
    v18[3] = (uint64_t)dlsym(v12, "CNContactEmailAddressesKey");
    getCNContactEmailAddressesKeySymbolLoc_ptr_7 = v18[3];
    id v11 = (id *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v11)
  {
LABEL_15:
    -[_PSBlockedHandlesCache beginSyncingWithTU]();
    __break(1u);
  }
  id v22 = *v11;
  uint64_t v23 = v4;
  uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = v22;
  BOOL v15 = [v13 arrayWithObjects:v21 count:4];

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

+ (void)isEligibleParticipant:context:contactsMap:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "Participant %@ is self. Skipping", v2);
}

+ (void)isEligibleParticipant:context:contactsMap:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "Participant %@ is not eligible because declined", v2);
}

+ (void)isEligibleParticipant:context:contactsMap:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "Participant %@ is not a person. Skipping", v2);
}

+ (void)currentUserIsEligibleForEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 title];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "User not eligible for %@ since user is not a participant", v4, v5, v6, v7, v8);
}

+ (void)currentUserIsEligibleForEvent:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 title];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_1A314B000, v2, v3, "User not eligible for %@ since participant has not accepted and is not the host: %@", v4, v5, v6, v7, v8);
}

+ (void)currentUserIsEligibleForEvent:(void *)a1 .cold.3(void *a1)
{
  uint64_t v1 = [a1 title];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_1A314B000, v2, v3, "User not eligible for %@ since participant is invalid state: %@", v4, v5, v6, v7, v8);
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Event start time not within time window. Skipping", v2, v3, v4, v5, v6);
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "All-day event. Skipping", v2, v3, v4, v5, v6);
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Cancelled event. Skipping", v2, v3, v4, v5, v6);
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "Non-(<= %tu)-person event. Skipping", v2);
}

+ (void)isMaybeFaceTimeEvent:(void *)a1 earliestStartDate:latestStartDate:maxParticipants:.cold.5(void *a1)
{
  uint64_t v1 = [a1 location];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Event has likely designated virtual conference using url in location %@. Skipping", v4, v5, v6, v7, v8);
}

+ (void)isMaybeFaceTimeEvent:(void *)a1 earliestStartDate:latestStartDate:maxParticipants:.cold.6(void *a1)
{
  uint64_t v1 = [a1 URL];
  uint64_t v2 = [v1 absoluteString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v3, v4, "Event has likely designated virtual conference using url in URL %@. Skipping", v5, v6, v7, v8, v9);
}

+ (void)isMaybeFaceTimeEvent:earliestStartDate:latestStartDate:maxParticipants:.cold.7()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6_0(&dword_1A314B000, v0, v1, "[isMaybeFaceTimeEvent => YES] %@", v2);
}

+ (void)isMaybeFaceTimeEvent:(void *)a1 earliestStartDate:latestStartDate:maxParticipants:.cold.8(void *a1)
{
  uint64_t v1 = [a1 virtualConference];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Event already has designated virtual conference using %@. Skipping", v4, v5, v6, v7, v8);
}

+ (void)getZKWSuggestionForCalendarEvent:(void *)a1 context:contactsMap:.cold.1(void *a1)
{
  uint64_t v1 = [a1 title];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Event %@ has no FaceTimeable participants. Skipping", v4, v5, v6, v7, v8);
}

+ (void)getZKWSuggestionForCalendarEvent:(void *)a1 context:contactsMap:.cold.2(void *a1)
{
  uint64_t v1 = [a1 title];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_1A314B000, v2, v3, "Event %@ has no eligible participants found. Skipping", v4, v5, v6, v7, v8);
}

- (void)zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "No candidate events found for Calendar extraction. Returning empty result", v2, v3, v4, v5, v6);
}

- (void)zkwSuggestionsFromCalendarWithPredictionContext:(uint8_t *)a1 startDate:(void *)a2 endDate:(void *)a3 maxParticipants:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 title];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A314B000, a4, OS_LOG_TYPE_DEBUG, "Event %@ has no suggestions found. Skipping", a1, 0xCu);
}

- (void)zkwSuggestionsFromCalendarWithPredictionContext:startDate:endDate:maxParticipants:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "Proceeding to rank events and build suggestions from their extractions", v2, v3, v4, v5, v6);
}

@end