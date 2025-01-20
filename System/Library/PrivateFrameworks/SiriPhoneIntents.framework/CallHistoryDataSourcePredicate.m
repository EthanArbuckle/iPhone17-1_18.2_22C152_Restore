@interface CallHistoryDataSourcePredicate
+ (id)predicateFilteringOutCallTypes:(unint64_t)a3;
+ (id)predicateForAudioCalls;
+ (id)predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4;
+ (id)predicateForCallsAfterDate:(id)a3 beforeDate:(id)a4;
+ (id)predicateForCallsThatAreRead:(BOOL)a3;
+ (id)predicateForCallsThatWereAnswered:(BOOL)a3;
+ (id)predicateForCallsThatWereOriginated:(BOOL)a3;
+ (id)predicateForCallsWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4;
+ (id)predicateForCallsWithCallCategory:(unsigned int)a3;
+ (id)predicateForCallsWithDurationGreaterThan:(double)a3;
+ (id)predicateForCallsWithDurationLongerThanImmediateHangUp;
+ (id)predicateForCallsWithNoDuration;
+ (id)predicateForCallsWithNumberOfRemoteParticipants:(int64_t)a3;
+ (id)predicateForCallsWithServiceProvider:(id)a3;
+ (id)predicateForFaceTimeCalls;
+ (id)predicateForMissedCallsSinceDate:(id)a3;
+ (id)predicateForRemoteParticipantsWithNormalizedValues:(id)a3;
+ (id)predicateForRemoteParticipantsWithValues:(id)a3;
+ (id)predicateForRemoteParticipantsWithValues:(id)a3 caseInsensitiveValues:(id)a4 normalizedValues:(id)a5;
+ (id)predicateForRemoteParticipantsWithValuesCaseInsensitive:(id)a3;
+ (id)predicateForTelephonyCalls;
+ (id)predicateForTelephonyOrFaceTimeCalls;
+ (id)predicateForVideoCalls;
@end

@implementation CallHistoryDataSourcePredicate

+ (id)predicateForMissedCallsSinceDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [a1 predicateForCallsThatWereAnswered:0];
  [v5 addObject:v6];

  v7 = [a1 predicateForCallsThatWereOriginated:0];
  [v5 addObject:v7];

  v8 = [a1 predicateForCallsWithNoDuration];
  [v5 addObject:v8];

  if (v4)
  {
    v9 = [a1 predicateForCallsAfterDate:v4 beforeDate:0];
    [v5 addObject:v9];
  }
  v10 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v5];

  return v10;
}

+ (id)predicateForCallsThatWereAnswered:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"answered = %d", a3);
}

+ (id)predicateForCallsThatWereOriginated:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"originated = %d", a3);
}

+ (id)predicateForCallsWithNoDuration
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"duration = 0"];
}

+ (id)predicateForCallsWithDurationGreaterThan:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"duration > %f", *(void *)&a3);
}

+ (id)predicateForCallsWithDurationLongerThanImmediateHangUp
{
  return (id)[a1 predicateForCallsWithDurationGreaterThan:3.0];
}

+ (id)predicateForCallsAfterDate:(id)a3 beforeDate:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v5)
    {
      v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"date > %@", v5];
      [v7 addObject:v8];
    }
    if (v6)
    {
      v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"date < %@", v6];
      [v7 addObject:v9];
    }
    v10 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v7];
  }
  else
  {
    v10 = [MEMORY[0x263F08A98] predicateWithValue:1];
  }

  return v10;
}

+ (id)predicateForCallsWithNumberOfRemoteParticipants:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"remoteParticipantHandles.@count = %d", a3);
}

+ (id)predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v27 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v28 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v12 = objc_msgSend(MEMORY[0x263F30578], "tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:", v11, v30);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v31 + 1) + 8 * j) normalizedValue];
              if ([v17 length]) {
                [v6 addObject:v17];
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }
        uint64_t v18 = [v11 type];
        if (v18 == 1 || v18 == 3)
        {
          v20 = [v11 value];
          v21 = [v20 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters];
          v22 = v28;
        }
        else
        {
          if (v18 != 2) {
            goto LABEL_24;
          }
          v23 = [v11 value];
          [v27 addObject:v23];

          v20 = [v11 value];
          v21 = [v20 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters];
          v22 = v27;
        }
        [v22 addObject:v21];

LABEL_24:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  v24 = [a1 predicateForRemoteParticipantsWithValues:v27 caseInsensitiveValues:v28 normalizedValues:v6];

  return v24;
}

+ (id)predicateForCallsWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4
{
  id v24 = a1;
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v29 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v26 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  id v25 = objc_alloc_init(MEMORY[0x263EFF9B0]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v11 = objc_msgSend(MEMORY[0x263F30578], "tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:", v10, v29, v24);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          char v14 = 0;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v11);
              }
              v17 = [*(id *)(*((void *)&v30 + 1) + 8 * j) normalizedValue];
              if ([v17 length]) {
                [v6 addObject:v17];
              }
              else {
                char v14 = 1;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v13);
        }
        else
        {
          char v14 = 0;
        }
        if (![v11 count] || (v14 & 1) != 0)
        {
          uint64_t v18 = [v10 value];
          v19 = [v18 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters];

          if ([v19 length])
          {
            uint64_t v20 = [v10 type];
            if (v20 == 3) {
              goto LABEL_24;
            }
            v21 = v26;
            if (v20 == 2)
            {
LABEL_25:
              [v21 addObject:v19];
            }
            else if (v20 == 1)
            {
LABEL_24:
              v21 = v25;
              goto LABEL_25;
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }

  v22 = [v24 predicateForRemoteParticipantsWithValues:v26 caseInsensitiveValues:v25 normalizedValues:v6];

  return v22;
}

+ (id)predicateForRemoteParticipantsWithValues:(id)a3 caseInsensitiveValues:(id)a4 normalizedValues:(id)a5
{
  uint64_t v7 = (objc_class *)MEMORY[0x263EFF980];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(v7);
  uint64_t v12 = [(id)objc_opt_class() predicateForRemoteParticipantsWithNormalizedValues:v8];

  if (v12) {
    [v11 addObject:v12];
  }
  uint64_t v13 = [(id)objc_opt_class() predicateForRemoteParticipantsWithValues:v10];

  if (v13) {
    [v11 addObject:v13];
  }
  char v14 = [(id)objc_opt_class() predicateForRemoteParticipantsWithValuesCaseInsensitive:v9];

  [v11 addObjectsFromArray:v14];
  if ([v11 count] == 1)
  {
    uint64_t v15 = [v11 firstObject];
  }
  else
  {
    v16 = (void *)MEMORY[0x263F08730];
    v17 = (void *)[v11 copy];
    uint64_t v15 = [v16 orPredicateWithSubpredicates:v17];
  }
  return v15;
}

+ (id)predicateForRemoteParticipantsWithNormalizedValues:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    [MEMORY[0x263F08A98] predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue == %@", v4];
    id v6 = LABEL_5:;

    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x263F08A98];
    id v4 = [v3 array];
    [v5 predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue IN %@", v4];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

+ (id)predicateForRemoteParticipantsWithValues:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    [MEMORY[0x263F08A98] predicateWithFormat:@"ANY remoteParticipantHandles.value == %@", v4];
    id v6 = LABEL_5:;

    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = (void *)MEMORY[0x263F08A98];
    id v4 = [v3 array];
    [v5 predicateWithFormat:@"ANY remoteParticipantHandles.value IN %@", v4];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

+ (id)predicateForRemoteParticipantsWithValuesCaseInsensitive:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"ANY remoteParticipantHandles.value ==[c] %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = (void *)[v4 copy];
  return v11;
}

+ (id)predicateForCallsWithServiceProvider:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"service_provider = %@", a3];
}

+ (id)predicateForTelephonyCalls
{
  return (id)[a1 predicateForCallsWithServiceProvider:*MEMORY[0x263F30628]];
}

+ (id)predicateForFaceTimeCalls
{
  return (id)[a1 predicateForCallsWithServiceProvider:*MEMORY[0x263F30620]];
}

+ (id)predicateForTelephonyOrFaceTimeCalls
{
  v9[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263F08730];
  id v4 = [a1 predicateForTelephonyCalls];
  v9[0] = v4;
  id v5 = [a1 predicateForFaceTimeCalls];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  uint64_t v7 = [v3 orPredicateWithSubpredicates:v6];

  return v7;
}

+ (id)predicateForCallsWithCallCategory:(unsigned int)a3
{
  id v3 = (void *)MEMORY[0x263F08A98];
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [v3 predicateWithFormat:@"call_category == %@", v4];

  return v5;
}

+ (id)predicateForAudioCalls
{
  return (id)[a1 predicateForCallsWithCallCategory:*MEMORY[0x263F305A0]];
}

+ (id)predicateForVideoCalls
{
  return (id)[a1 predicateForCallsWithCallCategory:*MEMORY[0x263F305A8]];
}

+ (id)predicateForCallsThatAreRead:(BOOL)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"read == %d", a3);
}

+ (id)predicateFilteringOutCallTypes:(unint64_t)a3
{
  int v3 = a3;
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (v3)
  {
    id v5 = +[CallHistoryDataSourcePredicate predicateForTelephonyCalls];
    [v4 addObject:v5];
  }
  if ((~v3 & 6) != 0)
  {
    if ((v3 & 2) != 0)
    {
      uint64_t v7 = (void *)MEMORY[0x263F08730];
      uint64_t v8 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
      v18[0] = v8;
      id v9 = +[CallHistoryDataSourcePredicate predicateForAudioCalls];
      v18[1] = v9;
      id v10 = (void *)MEMORY[0x263EFF8C0];
      id v11 = v18;
    }
    else
    {
      if ((v3 & 4) == 0) {
        goto LABEL_11;
      }
      uint64_t v7 = (void *)MEMORY[0x263F08730];
      uint64_t v8 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
      v17[0] = v8;
      id v9 = +[CallHistoryDataSourcePredicate predicateForVideoCalls];
      v17[1] = v9;
      id v10 = (void *)MEMORY[0x263EFF8C0];
      id v11 = v17;
    }
    uint64_t v12 = [v10 arrayWithObjects:v11 count:2];
    uint64_t v6 = [v7 andPredicateWithSubpredicates:v12];
  }
  else
  {
    uint64_t v6 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
  }
  [v4 addObject:v6];

LABEL_11:
  if ([v4 count])
  {
    long long v13 = (void *)MEMORY[0x263F08730];
    long long v14 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v4];
    long long v15 = [v13 notPredicateWithSubpredicate:v14];
  }
  else
  {
    long long v15 = [MEMORY[0x263F08A98] predicateWithValue:1];
  }

  return v15;
}

@end