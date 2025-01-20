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
+ (id)predicateForJustMissedCalls;
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

+ (id)predicateForJustMissedCalls
{
  v2 = +[NSDate dateWithTimeIntervalSinceNow:-15.0];
  v3 = +[CallHistoryDataSourcePredicate predicateForMissedCallsSinceDate:v2];

  return v3;
}

+ (id)predicateForMissedCallsSinceDate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
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
  v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v5];

  return v10;
}

+ (id)predicateForCallsThatWereAnswered:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:@"answered = %d", a3];
}

+ (id)predicateForCallsThatWereOriginated:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:@"originated = %d", a3];
}

+ (id)predicateForCallsWithNoDuration
{
  return +[NSPredicate predicateWithFormat:@"duration = 0"];
}

+ (id)predicateForCallsWithDurationGreaterThan:(double)a3
{
  return +[NSPredicate predicateWithFormat:@"duration > %f", *(void *)&a3];
}

+ (id)predicateForCallsWithDurationLongerThanImmediateHangUp
{
  return _[a1 predicateForCallsWithDurationGreaterThan:3.0];
}

+ (id)predicateForCallsAfterDate:(id)a3 beforeDate:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    if (v5)
    {
      v8 = +[NSPredicate predicateWithFormat:@"date > %@", v5];
      [v7 addObject:v8];
    }
    if (v6)
    {
      v9 = +[NSPredicate predicateWithFormat:@"date < %@", v6];
      [v7 addObject:v9];
    }
    v10 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  }
  else
  {
    v10 = +[NSPredicate predicateWithValue:1];
  }

  return v10;
}

+ (id)predicateForCallsWithNumberOfRemoteParticipants:(int64_t)a3
{
  return +[NSPredicate predicateWithFormat:@"remoteParticipantHandles.@count = %d", a3];
}

+ (id)predicateForCallToCallBackWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4
{
  id v5 = a3;
  id v30 = a4;
  id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v27 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v28 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v12 = +[CHHandle tu_normalizedCHHandlesFromTUHandle:v11 isoCountryCodes:v30];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v32;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v32 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)j) normalizedValue];
              if ([v17 length]) {
                [v6 addObject:v17];
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v14);
        }
        id v18 = [v11 type];
        if (v18 == (id)1 || v18 == (id)3)
        {
          v20 = [v11 value];
          v21 = [v20 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters];
          v22 = v28;
        }
        else
        {
          if (v18 != (id)2) {
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
      id v8 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v8);
  }

  v24 = [a1 predicateForRemoteParticipantsWithValues:v27 caseInsensitiveValues:v28 normalizedValues:v6];

  return v24;
}

+ (id)predicateForCallsWithAnyOfTheseRemoteParticipantHandles:(id)a3 isoCountryCodes:(id)a4
{
  id v24 = a1;
  id v5 = a3;
  id v29 = a4;
  id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v26 = objc_alloc_init((Class)NSMutableOrderedSet);
  id v25 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v28 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v11 = +[CHHandle tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:](CHHandle, "tu_normalizedCHHandlesFromTUHandle:isoCountryCodes:", v10, v29, v24);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v12 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v12)
        {
          id v13 = v12;
          char v14 = 0;
          uint64_t v15 = *(void *)v31;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v31 != v15) {
                objc_enumerationMutation(v11);
              }
              v17 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)j) normalizedValue];
              if ([v17 length]) {
                [v6 addObject:v17];
              }
              else {
                char v14 = 1;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v13);
        }
        else
        {
          char v14 = 0;
        }
        if (![v11 count] || (v14 & 1) != 0)
        {
          id v18 = [v10 value];
          v19 = [v18 destinationIDWithoutControlOrPhoneNumberSeparatorCharacters];

          if ([v19 length])
          {
            id v20 = [v10 type];
            if (v20 == (id)3) {
              goto LABEL_24;
            }
            v21 = v26;
            if (v20 == (id)2)
            {
LABEL_25:
              [v21 addObject:v19];
            }
            else if (v20 == (id)1)
            {
LABEL_24:
              v21 = v25;
              goto LABEL_25;
            }
          }
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }

  v22 = [v24 predicateForRemoteParticipantsWithValues:v26 caseInsensitiveValues:v25 normalizedValues:v6];

  return v22;
}

+ (id)predicateForRemoteParticipantsWithValues:(id)a3 caseInsensitiveValues:(id)a4 normalizedValues:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v11 = [(id)objc_opt_class() predicateForRemoteParticipantsWithNormalizedValues:v7];

  if (v11) {
    [v10 addObject:v11];
  }
  id v12 = [(id)objc_opt_class() predicateForRemoteParticipantsWithValues:v9];

  if (v12) {
    [v10 addObject:v12];
  }
  id v13 = [(id)objc_opt_class() predicateForRemoteParticipantsWithValuesCaseInsensitive:v8];

  [v10 addObjectsFromArray:v13];
  if ([v10 count] == (id)1)
  {
    char v14 = [v10 firstObject];
  }
  else
  {
    id v15 = [v10 copy];
    char v14 = +[NSCompoundPredicate orPredicateWithSubpredicates:v15];
  }

  return v14;
}

+ (id)predicateForRemoteParticipantsWithNormalizedValues:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    id v4 = [v3 firstObject];
    +[NSPredicate predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue == %@", v4];
    id v5 = LABEL_5:;

    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = [v3 array];
    +[NSPredicate predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue IN %@", v4];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

+ (id)predicateForRemoteParticipantsWithValues:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    id v4 = [v3 firstObject];
    +[NSPredicate predicateWithFormat:@"ANY remoteParticipantHandles.value == %@", v4];
    id v5 = LABEL_5:;

    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v4 = [v3 array];
    +[NSPredicate predicateWithFormat:@"ANY remoteParticipantHandles.value IN %@", v4];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

+ (id)predicateForRemoteParticipantsWithValuesCaseInsensitive:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[NSPredicate predicateWithFormat:@"ANY remoteParticipantHandles.value ==[c] %@", *(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return v11;
}

+ (id)predicateForCallsWithServiceProvider:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"service_provider = %@", a3];
}

+ (id)predicateForTelephonyCalls
{
  return _[a1 predicateForCallsWithServiceProvider:kCHServiceProviderTelephony];
}

+ (id)predicateForFaceTimeCalls
{
  return _[a1 predicateForCallsWithServiceProvider:kCHServiceProviderFaceTime];
}

+ (id)predicateForTelephonyOrFaceTimeCalls
{
  id v3 = [a1 predicateForTelephonyCalls];
  v8[0] = v3;
  id v4 = [a1 predicateForFaceTimeCalls];
  v8[1] = v4;
  id v5 = +[NSArray arrayWithObjects:v8 count:2];
  id v6 = +[NSCompoundPredicate orPredicateWithSubpredicates:v5];

  return v6;
}

+ (id)predicateForCallsWithCallCategory:(unsigned int)a3
{
  id v3 = +[NSNumber numberWithInteger:a3];
  id v4 = +[NSPredicate predicateWithFormat:@"call_category == %@", v3];

  return v4;
}

+ (id)predicateForAudioCalls
{
  return _[a1 predicateForCallsWithCallCategory:kCHCallCategoryAudio];
}

+ (id)predicateForVideoCalls
{
  return _[a1 predicateForCallsWithCallCategory:kCHCallCategoryVideo];
}

+ (id)predicateForCallsThatAreRead:(BOOL)a3
{
  return +[NSPredicate predicateWithFormat:@"read == %d", a3];
}

+ (id)predicateFilteringOutCallTypes:(unint64_t)a3
{
  int v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if (v3)
  {
    id v5 = +[CallHistoryDataSourcePredicate predicateForTelephonyCalls];
    [v4 addObject:v5];
  }
  if ((~v3 & 6) != 0)
  {
    if ((v3 & 2) != 0)
    {
      id v7 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
      v15[0] = v7;
      uint64_t v8 = +[CallHistoryDataSourcePredicate predicateForAudioCalls];
      v15[1] = v8;
      id v9 = v15;
    }
    else
    {
      if ((v3 & 4) == 0) {
        goto LABEL_11;
      }
      id v7 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
      v14[0] = v7;
      uint64_t v8 = +[CallHistoryDataSourcePredicate predicateForVideoCalls];
      v14[1] = v8;
      id v9 = v14;
    }
    id v10 = +[NSArray arrayWithObjects:v9 count:2];
    id v6 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v6 = +[CallHistoryDataSourcePredicate predicateForFaceTimeCalls];
  }
  [v4 addObject:v6];

LABEL_11:
  if ([v4 count])
  {
    id v11 = +[NSCompoundPredicate orPredicateWithSubpredicates:v4];
    id v12 = +[NSCompoundPredicate notPredicateWithSubpredicate:v11];
  }
  else
  {
    id v12 = +[NSPredicate predicateWithValue:1];
  }

  return v12;
}

@end