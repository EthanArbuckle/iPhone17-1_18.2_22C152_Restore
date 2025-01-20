@interface _PSInteractionStoreUtils
+ (id)allAirDropInteractionsFromStore:(id)a3 fetchLimit:(unint64_t)a4;
+ (id)conversationIdFromInteraction:(id)a3;
+ (id)conversationIdFromInteraction:(id)a3 bundleIds:(id)a4;
+ (id)conversationIdWithExactMatchWithContactHandles:(id)a3 store:(id)a4 bundleIds:(id)a5 messageInteractionCache:(id)a6;
+ (id)conversationIdWithMaximalIntersectionWithContactIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6;
+ (id)groupInteractionsContainingSearchStringInDisplayName:(id)a3 excludingInteractionUUIDs:(id)a4 account:(id)a5 directions:(id)a6 bundleIds:(id)a7 excludedDomainIdentifiers:(id)a8 startDate:(id)a9 store:(id)a10 fetchLimit:(unint64_t)a11 offset:(unint64_t)a12;
+ (id)interactionCacheFromStore:(id)a3 size:(unint64_t)a4 queryPredicate:(id)a5 filterBlock:(id)a6;
+ (id)interactionsContainingSearchStringInDisplayName:(id)a3 account:(id)a4 directions:(id)a5 bundleIds:(id)a6 store:(id)a7 fetchLimit:(unint64_t)a8;
+ (id)interactionsFromStore:(id)a3 referenceDate:(id)a4 withMechanisms:(id)a5 withAccount:(id)a6 withBundleIds:(id)a7 withTargetBundleIds:(id)a8 withDirections:(id)a9 fetchLimit:(unint64_t)a10;
+ (id)interactionsFromStore:(id)a3 referenceDate:(id)a4 withMechanisms:(id)a5 withAccount:(id)a6 withBundleIds:(id)a7 withTargetBundleIds:(id)a8 withDirections:(id)a9 singleRecipient:(BOOL)a10 fetchLimit:(unint64_t)a11;
+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 singleRecipient:(BOOL)a11 fetchLimit:(unint64_t)a12;
+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 withNsUserName:(id)a11 singleRecipient:(BOOL)a12 excludeAnonymousTemporaryRecipients:(BOOL)a13 fetchLimit:(unint64_t)a14 fetchOffset:(unint64_t)a15 sortAscending:(BOOL)a16;
+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 withNsUserName:(id)a11 singleRecipient:(BOOL)a12 fetchLimit:(unint64_t)a13;
+ (id)interactionsHyperRecentFromReferenceDate:(id)a3 bundleIds:(id)a4 recencyMargin:(double)a5 store:(id)a6;
+ (id)interactionsMatchingAnyHandles:(id)a3 account:(id)a4 directions:(id)a5 mechanisms:(id)a6 bundleIds:(id)a7 store:(id)a8 fetchLimit:(unint64_t)a9 messageInteractionCache:(id)a10;
+ (id)interactionsMatchingAnyHandles:(id)a3 directions:(id)a4 mechanisms:(id)a5 interactionDuration:(double)a6 store:(id)a7 fetchLimit:(unint64_t)a8;
+ (id)interactionsMatchingAnyHandlesOrContactIds:(id)a3 identifiers:(id)a4 account:(id)a5 directions:(id)a6 mechanisms:(id)a7 bundleIds:(id)a8 store:(id)a9 fetchLimit:(unint64_t)a10 messageInteractionCache:(id)a11;
+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 account:(id)a4 directions:(id)a5 bundleIds:(id)a6 store:(id)a7 fetchLimit:(unint64_t)a8 singleRecipientOnly:(BOOL)a9;
+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 account:(id)a4 directions:(id)a5 mechanisms:(id)a6 bundleIds:(id)a7 store:(id)a8 fetchLimit:(unint64_t)a9;
+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 store:(id)a4 fetchLimit:(unint64_t)a5 messageInteractionCache:(id)a6;
+ (id)interactionsMatchingAnySender:(id)a3 store:(id)a4 fetchLimit:(unint64_t)a5 messageInteractionCache:(id)a6;
+ (id)interactionsMostRecentForBundleId:(id)a3 store:(id)a4 resultLimit:(unint64_t)a5 interactions:(id)a6;
+ (id)interactionsWithContactIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6;
+ (id)metadataFromFeedbackEvent:(id)a3;
+ (id)mostRecentInteractionInvolvingMatchingIdentifier:(id)a3 store:(id)a4 bundleIds:(id)a5;
+ (id)mostRecentInteractionWithExactMatchingIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6;
+ (id)mostRecentInteractionWithRecipientMatchingContactIdentifier:(id)a3 bundleIds:(id)a4 store:(id)a5 singleRecipient:(BOOL)a6;
+ (id)mostRecentInteractionWithSenderOrRecipientMatchingContactIdentifier:(id)a3 bundleIds:(id)a4 store:(id)a5 singleRecipient:(BOOL)a6;
+ (id)mostRecentInteractionWithSingleRecipientMatchingContactIdentifier:(id)a3 store:(id)a4;
+ (id)mostRecentInteractionWithSingleRecipientMatchingHandle:(id)a3 store:(id)a4;
+ (id)recentInteractionsFromStore:(id)a3 bundleIDs:(id)a4;
+ (id)someIMessageInteractionInvolvingContactIdentifier:(id)a3 store:(id)a4 contactType:(unint64_t)a5 afterStartDate:(id)a6;
+ (id)someInteractionWithMatchingIdentifier:(id)a3 store:(id)a4 bundleIds:(id)a5 afterStartDate:(id)a6;
+ (int64_t)getHandleTypeFromHandleString:(id)a3;
@end

@implementation _PSInteractionStoreUtils

+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 withNsUserName:(id)a11 singleRecipient:(BOOL)a12 excludeAnonymousTemporaryRecipients:(BOOL)a13 fetchLimit:(unint64_t)a14 fetchOffset:(unint64_t)a15 sortAscending:(BOOL)a16
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v24 = v21;
  id v56 = v23;
  id v55 = a7;
  id v54 = a8;
  id v53 = a9;
  id v25 = a10;
  id v26 = a11;
  v27 = (void *)MEMORY[0x1E4F1CA48];
  id v28 = a3;
  v29 = [v27 array];
  if (v24)
  {
    v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", v24];
    [v29 addObject:v30];
  }
  if (v22)
  {
    v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate <= %@)", v22];
    [v29 addObject:v31];
  }
  if (v56)
  {
    v32 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", v56];
    [v29 addObject:v32];
  }
  if (v54)
  {
    v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v54];
    [v29 addObject:v33];
  }
  if (v55)
  {
    v34 = (void *)MEMORY[0x1E4F28F60];
    v35 = [MEMORY[0x1E4F1CAD0] setWithObject:v55];
    v36 = [v34 predicateWithFormat:@"(account IN %@)", v35];

    [v29 addObject:v36];
  }
  if (v53)
  {
    v37 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(targetBundleId IN %@)", v53];
    [v29 addObject:v37];
  }
  if (v25)
  {
    v38 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction IN %@)", v25];
    [v29 addObject:v38];
  }
  if (v26)
  {
    v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(nsUserName == nil OR nsUserName == %@ OR nsUserName == %@)", @"root", v26];
    [v29 addObject:v39];
  }
  v40 = v25;
  if (a12)
  {
    v41 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(recipientCount == 1)"];
    [v29 addObject:v41];
  }
  v42 = v22;
  v52 = v24;
  if (a13)
  {
    v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.identifier BEGINSWITH %@).@count == 0)", @"temp:"];
    [v29 addObject:v43];
  }
  v44 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v29];
  v45 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:a16];
  v58[0] = v45;
  v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  id v57 = 0;
  v47 = [v28 queryInteractionsUsingPredicate:v44 sortDescriptors:v46 limit:a14 offset:a15 error:&v57];

  id v48 = v57;
  if (v48)
  {
    v49 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v50 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v50 = v47;
  }

  return v50;
}

+ (id)interactionsFromStore:(id)a3 referenceDate:(id)a4 withMechanisms:(id)a5 withAccount:(id)a6 withBundleIds:(id)a7 withTargetBundleIds:(id)a8 withDirections:(id)a9 singleRecipient:(BOOL)a10 fetchLimit:(unint64_t)a11
{
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOBYTE(v26) = a10;
  id v24 = [(id)objc_opt_class() interactionsFromStore:v23 startDate:v22 tillDate:0 withMechanisms:v21 withAccount:v20 withBundleIds:v19 withTargetBundleIds:v18 withDirections:v17 singleRecipient:v26 fetchLimit:a11];

  return v24;
}

+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 singleRecipient:(BOOL)a11 fetchLimit:(unint64_t)a12
{
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  LOBYTE(v28) = a11;
  uint64_t v26 = [(id)objc_opt_class() interactionsFromStore:v25 startDate:v24 tillDate:v23 withMechanisms:v22 withAccount:v21 withBundleIds:v20 withTargetBundleIds:v19 withDirections:v18 withNsUserName:0 singleRecipient:v28 fetchLimit:a12];

  return v26;
}

+ (id)interactionsFromStore:(id)a3 startDate:(id)a4 tillDate:(id)a5 withMechanisms:(id)a6 withAccount:(id)a7 withBundleIds:(id)a8 withTargetBundleIds:(id)a9 withDirections:(id)a10 withNsUserName:(id)a11 singleRecipient:(BOOL)a12 fetchLimit:(unint64_t)a13
{
  id v19 = a11;
  id v20 = a10;
  id v21 = a9;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  LOBYTE(v31) = 0;
  BYTE1(v30) = 1;
  LOBYTE(v30) = a12;
  uint64_t v28 = objc_msgSend((id)objc_opt_class(), "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:withNsUserName:singleRecipient:excludeAnonymousTemporaryRecipients:fetchLimit:fetchOffset:sortAscending:", v27, v26, v25, v24, v23, v22, v21, v20, v19, v30, a13, 0, v31);

  return v28;
}

+ (id)recentInteractionsFromStore:(id)a3 bundleIDs:(id)a4
{
  v45[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a4;
  id v7 = a3;
  v34 = [v5 predicateWithFormat:@"(NOT derivedIntentIdentifier == NULL)"];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675B40];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v6];
  v10 = (void *)MEMORY[0x1E4F28BA0];
  v38 = (void *)v9;
  v39 = (void *)v8;
  v45[0] = v9;
  v45[1] = v8;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  uint64_t v12 = [v10 andPredicateWithSubpredicates:v11];

  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675B58];
  uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(targetBundleId IN %@)", v6];

  v15 = (void *)MEMORY[0x1E4F28BA0];
  v35 = (void *)v14;
  v36 = (void *)v13;
  v44[0] = v13;
  v44[1] = v14;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
  id v17 = [v15 andPredicateWithSubpredicates:v16];

  id v18 = (void *)MEMORY[0x1E4F28BA0];
  v37 = (void *)v12;
  v43[0] = v12;
  v43[1] = v17;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  id v20 = [v18 orPredicateWithSubpredicates:v19];

  id v21 = (void *)MEMORY[0x1E4F28F60];
  id v22 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF676518];
  id v23 = [v21 predicateWithFormat:@"(direction IN %@)", v22];

  id v24 = (void *)MEMORY[0x1E4F28BA0];
  v42[0] = v20;
  v42[1] = v34;
  v42[2] = v23;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  id v26 = [v24 andPredicateWithSubpredicates:v25];

  id v27 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v41 = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  id v40 = 0;
  v29 = [v7 queryInteractionsUsingPredicate:v26 sortDescriptors:v28 limit:500 error:&v40];

  id v30 = v40;
  if (v30)
  {
    uint64_t v31 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v32 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v32 = v29;
  }

  return v32;
}

+ (id)interactionCacheFromStore:(id)a3 size:(unint64_t)a4 queryPredicate:(id)a5 filterBlock:(id)a6
{
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [v9 array];
  [v13 addObject:v11];

  uint64_t v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F5B3F0]) initWithInteractionStore:v12 size:a4 queryPredicate:v14 filterBlock:v10];

  return v15;
}

+ (id)interactionsFromStore:(id)a3 referenceDate:(id)a4 withMechanisms:(id)a5 withAccount:(id)a6 withBundleIds:(id)a7 withTargetBundleIds:(id)a8 withDirections:(id)a9 fetchLimit:(unint64_t)a10
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  LOBYTE(v25) = 0;
  id v23 = [(id)objc_opt_class() interactionsFromStore:v22 referenceDate:v21 withMechanisms:v20 withAccount:v19 withBundleIds:v18 withTargetBundleIds:v17 withDirections:v16 singleRecipient:v25 fetchLimit:a10];

  return v23;
}

+ (id)interactionsHyperRecentFromReferenceDate:(id)a3 bundleIds:(id)a4 recencyMargin:(double)a5 store:(id)a6
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void *)MEMORY[0x1E4F1CA48];
  id v12 = a6;
  uint64_t v13 = [v11 array];
  if (v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v10];
    [v13 addObject:v14];
  }
  if (v9)
  {
    v15 = (void *)MEMORY[0x1E4F28F60];
    id v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:-a5];
    id v17 = [v15 predicateWithFormat:@"(startDate >= %@)", v16];

    id v18 = (void *)MEMORY[0x1E4F28F60];
    id v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v9 sinceDate:-0.5];
    id v20 = [v18 predicateWithFormat:@"(startDate <= %@)", v19];

    id v21 = (void *)MEMORY[0x1E4F28BA0];
    v34[0] = v17;
    v34[1] = v20;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    id v23 = [v21 andPredicateWithSubpredicates:v22];
    [v13 addObject:v23];
  }
  id v24 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];
  uint64_t v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v33 = v25;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  id v32 = 0;
  id v27 = [v12 queryInteractionsUsingPredicate:v24 sortDescriptors:v26 limit:1 error:&v32];

  id v28 = v32;
  if (v28)
  {
    v29 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v30 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v30 = v27;
  }

  return v30;
}

+ (id)mostRecentInteractionWithSenderOrRecipientMatchingContactIdentifier:(id)a3 bundleIds:(id)a4 store:(id)a5 singleRecipient:(BOOL)a6
{
  BOOL v6 = a6;
  v36[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 length])
  {
    if (v6) {
      id v12 = @"recipientCount == 1 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0";
    }
    else {
      id v12 = @"recipientCount > 0 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0";
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v12, v9);
    uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sender.personId == %@", v9];
    v15 = (void *)MEMORY[0x1E4F28BA0];
    id v30 = (void *)v14;
    uint64_t v31 = (void *)v13;
    v36[0] = v14;
    v36[1] = v13;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    id v17 = [v15 orPredicateWithSubpredicates:v16];

    id v32 = v10;
    id v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v10];
    id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF676530];
    id v20 = (void *)MEMORY[0x1E4F28BA0];
    v35[0] = v17;
    v35[1] = v18;
    v35[2] = v19;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    id v22 = [v20 andPredicateWithSubpredicates:v21];

    id v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v34 = v23;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    id v33 = 0;
    uint64_t v25 = [v11 queryInteractionsUsingPredicate:v22 sortDescriptors:v24 limit:1 error:&v33];
    id v26 = v33;

    if (v26)
    {
      id v27 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v28 = 0;
    }
    else
    {
      id v28 = [v25 firstObject];
    }

    id v10 = v32;
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

+ (id)mostRecentInteractionWithRecipientMatchingContactIdentifier:(id)a3 bundleIds:(id)a4 store:(id)a5 singleRecipient:(BOOL)a6
{
  BOOL v6 = a6;
  v29[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 length])
  {
    if (v6) {
      id v12 = @"recipientCount == 1 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0";
    }
    else {
      id v12 = @"recipientCount > 0 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0";
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v12, v9);
    uint64_t v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v10];
    v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism IN %@)", &unk_1EF676548];
    id v16 = (void *)MEMORY[0x1E4F28BA0];
    id v26 = (void *)v13;
    v29[0] = v13;
    v29[1] = v14;
    v29[2] = v15;
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
    id v18 = [v16 andPredicateWithSubpredicates:v17];

    id v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    id v28 = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    id v27 = 0;
    id v21 = [v11 queryInteractionsUsingPredicate:v18 sortDescriptors:v20 limit:1 error:&v27];
    id v22 = v27;

    if (v22)
    {
      id v23 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v24 = 0;
    }
    else
    {
      id v24 = [v21 firstObject];
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

+ (id)mostRecentInteractionWithSingleRecipientMatchingContactIdentifier:(id)a3 store:(id)a4
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"recipientCount == 1 AND SUBQUERY(recipients, $recipient, ANY $recipient.personId == %@).@count > 0", v5];
    uint64_t v8 = (void *)MEMORY[0x1E4F28F60];
    id v9 = +[_PSConstants eligibleShareSheetTargets];
    id v10 = [v8 predicateWithFormat:@"(bundleId IN %@)", v9];

    id v11 = (void *)MEMORY[0x1E4F28BA0];
    v23[0] = v7;
    v23[1] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    uint64_t v13 = [v11 andPredicateWithSubpredicates:v12];

    uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    id v22 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    id v21 = 0;
    id v16 = [v6 queryInteractionsUsingPredicate:v13 sortDescriptors:v15 limit:500 error:&v21];
    id v17 = v21;

    if (v17)
    {
      id v18 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v19 = 0;
    }
    else
    {
      id v19 = [v16 firstObject];
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

+ (id)mostRecentInteractionWithSingleRecipientMatchingHandle:(id)a3 store:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 length])
  {
    v12[0] = v6;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    id v10 = [a1 interactionsMatchingAnyHandlesOrDomainIds:v9 account:0 directions:&unk_1EF676560 mechanisms:0 bundleIds:0 store:v7 fetchLimit:1];
    uint64_t v8 = [v10 firstObject];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 account:(id)a4 directions:(id)a5 mechanisms:(id)a6 bundleIds:(id)a7 store:(id)a8 fetchLimit:(unint64_t)a9
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v66 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v65 = a8;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  if (v17)
  {
    id v19 = (void *)MEMORY[0x1E4F28F60];
    id v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    id v21 = [v19 predicateWithFormat:@"(bundleId IN %@)", v20];

    [v18 addObject:v21];
  }
  if (v66)
  {
    id v22 = (void *)MEMORY[0x1E4F28F60];
    id v23 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v24 = [v22 predicateWithFormat:@"(account IN %@)", v23];

    [v18 addObject:v24];
  }
  if (v15)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
    id v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    id v27 = [v25 predicateWithFormat:@"(direction IN %@)", v26];

    [v18 addObject:v27];
  }
  unint64_t v28 = 0x1E4F28000;
  unint64_t v29 = 0x1E4F1C000;
  if (v14)
  {
    id v62 = v17;
    id v63 = v16;
    id v30 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v14];
    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    v61 = v30;
    id v32 = [v30 allValues];
    id v33 = [v31 setWithArray:v32];
    uint64_t v34 = [v33 mutableCopy];

    v60 = (void *)v34;
    v59 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v34];
    v58 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"domainIdentifier IN %@", v14];
    v35 = objc_opt_new();
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v64 = v14;
    id v36 = v14;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v68 objects:v74 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v69 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = *(void **)(*((void *)&v68 + 1) + 8 * i);
          v42 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          v43 = [v41 stringByAddingPercentEncodingWithAllowedCharacters:v42];

          v44 = [NSString stringWithFormat:@"conversationIdentifier(%@)", v43];
          [v35 addObject:v44];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v68 objects:v74 count:16];
      }
      while (v38);
    }

    v45 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"derivedIntentIdentifier IN %@", v35];
    v46 = (void *)MEMORY[0x1E4F28BA0];
    v73[0] = v58;
    v73[1] = v59;
    v73[2] = v45;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    id v48 = [v46 orPredicateWithSubpredicates:v47];
    [v18 addObject:v48];

    unint64_t v29 = 0x1E4F1C000uLL;
    unint64_t v28 = 0x1E4F28000uLL;

    id v14 = v64;
    id v17 = v62;
    id v16 = v63;
  }
  if (v16)
  {
    v49 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"mechanism IN %@", v16];
    [v18 addObject:v49];
  }
  id v50 = v18;
  v51 = [*(id *)(v28 + 2976) andPredicateWithSubpredicates:v18];
  v52 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v72 = v52;
  id v53 = [*(id *)(v29 + 2424) arrayWithObjects:&v72 count:1];
  id v67 = 0;
  id v54 = [v65 queryInteractionsUsingPredicate:v51 sortDescriptors:v53 limit:a9 error:&v67];
  id v55 = v67;

  if (v55)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:]();
    }
    id v56 = 0;
  }
  else
  {
    id v56 = v54;
  }

  return v56;
}

+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 store:(id)a4 fetchLimit:(unint64_t)a5 messageInteractionCache:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = (void *)v12;
  unint64_t v14 = 0x1E4F28000;
  unint64_t v15 = 0x1E4F1C000;
  if (v9)
  {
    unint64_t v46 = a5;
    v47 = (void *)v12;
    id v48 = v10;
    id v16 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v9];
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    v45 = v16;
    id v18 = [v16 allValues];
    id v19 = [v17 setWithArray:v18];
    uint64_t v20 = [v19 mutableCopy];

    v44 = (void *)v20;
    v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v20];
    v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"domainIdentifier IN %@", v9];
    id v21 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v49 = v9;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v52 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          unint64_t v28 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          unint64_t v29 = [v27 stringByAddingPercentEncodingWithAllowedCharacters:v28];

          id v30 = [NSString stringWithFormat:@"conversationIdentifier(%@)", v29];
          [v21 addObject:v30];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v24);
    }

    uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"derivedIntentIdentifier IN %@", v21];
    unint64_t v14 = 0x1E4F28000uLL;
    id v32 = (void *)MEMORY[0x1E4F28BA0];
    v56[0] = v42;
    v56[1] = v43;
    v56[2] = v31;
    unint64_t v15 = 0x1E4F1C000uLL;
    id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
    uint64_t v34 = [v32 orPredicateWithSubpredicates:v33];
    uint64_t v13 = v47;
    [v47 addObject:v34];

    id v10 = v48;
    id v9 = v49;
    a5 = v46;
  }
  v35 = [*(id *)(v14 + 2976) andPredicateWithSubpredicates:v13];
  if (v11)
  {
    id v36 = [v11 interactions];
    id v37 = [v36 filteredArrayUsingPredicate:v35];
  }
  else
  {
    id v36 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    id v55 = v36;
    uint64_t v38 = [*(id *)(v15 + 2424) arrayWithObjects:&v55 count:1];
    id v50 = 0;
    uint64_t v39 = [v10 queryInteractionsUsingPredicate:v35 sortDescriptors:v38 limit:a5 error:&v50];
    id v40 = v50;

    if (v40)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:]();
      }
      id v37 = 0;
    }
    else
    {
      id v37 = v39;
    }
  }

  return v37;
}

+ (id)interactionsMatchingAnyHandlesOrDomainIds:(id)a3 account:(id)a4 directions:(id)a5 bundleIds:(id)a6 store:(id)a7 fetchLimit:(unint64_t)a8 singleRecipientOnly:(BOOL)a9
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v45 = a5;
  id v15 = a6;
  id v16 = (void *)MEMORY[0x1E4F1CA48];
  id v17 = a7;
  id v18 = [v16 array];
  if (v15)
  {
    id v19 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    id v21 = [v19 predicateWithFormat:@"(bundleId IN %@)", v20];

    [v18 addObject:v21];
  }
  if (v14)
  {
    id v22 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
    uint64_t v24 = [v22 predicateWithFormat:@"(account IN %@)", v23];

    [v18 addObject:v24];
  }
  if (v45)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
    id v26 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
    id v27 = [v25 predicateWithFormat:@"(direction IN %@)", v26];

    [v18 addObject:v27];
  }
  v44 = v14;
  if (a9)
  {
    unint64_t v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"recipientCount == 1"];
    [v18 addObject:v28];
  }
  if (v13)
  {
    unint64_t v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v13];
    id v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"domainIdentifier IN %@", v13];
    uint64_t v31 = (void *)MEMORY[0x1E4F28BA0];
    v48[0] = v30;
    v48[1] = v29;
    id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
    id v33 = [v31 orPredicateWithSubpredicates:v32];
    [v18 addObject:v33];
  }
  uint64_t v34 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];
  v35 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v47 = v35;
  id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  id v46 = 0;
  id v37 = [v17 queryInteractionsUsingPredicate:v34 sortDescriptors:v36 limit:a8 error:&v46];

  id v38 = v46;
  if (v38)
  {
    uint64_t v39 = v45;
    id v40 = v15;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:]();
    }
    id v41 = 0;
  }
  else
  {
    id v41 = v37;
    uint64_t v39 = v45;
    id v40 = v15;
  }

  return v41;
}

+ (id)allAirDropInteractionsFromStore:(id)a3 fetchLimit:(unint64_t)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  id v7 = [v5 predicateWithFormat:@"(targetBundleId == %@)", @"com.apple.UIKit.activity.AirDrop"];
  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(mechanism == %@)", &unk_1EF675B58];
  id v9 = (void *)MEMORY[0x1E4F28BA0];
  v20[0] = v8;
  v20[1] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  id v11 = [v9 andPredicateWithSubpredicates:v10];

  uint64_t v12 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  id v19 = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  id v18 = 0;
  id v14 = [v6 queryInteractionsUsingPredicate:v11 sortDescriptors:v13 limit:a4 error:&v18];

  id v15 = v18;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:]();
    }
    id v16 = 0;
  }
  else
  {
    id v16 = v14;
  }

  return v16;
}

+ (id)interactionsMatchingAnySender:(id)a3 store:(id)a4 fetchLimit:(unint64_t)a5 messageInteractionCache:(id)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  if (v9)
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sender.identifier IN %@", v9];
    [v12 addObject:v13];
  }
  id v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v12];
  if (v11)
  {
    id v15 = [v11 interactions];
    id v16 = [v15 filteredArrayUsingPredicate:v14];
  }
  else
  {
    id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v24[0] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    id v23 = 0;
    id v19 = [v10 queryInteractionsUsingPredicate:v14 sortDescriptors:v18 limit:a5 error:&v23];
    id v20 = v23;

    if (v20)
    {
      id v21 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v16 = 0;
    }
    else
    {
      id v16 = v19;
    }
  }

  return v16;
}

+ (id)interactionsMatchingAnyHandles:(id)a3 directions:(id)a4 mechanisms:(id)a5 interactionDuration:(double)a6 store:(id)a7 fetchLimit:(unint64_t)a8
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:a3];
  id v17 = (void *)MEMORY[0x1E4F1CAD0];
  id v18 = [v16 allValues];
  id v19 = [v17 setWithArray:v18];
  id v20 = (void *)[v19 mutableCopy];

  id v21 = [MEMORY[0x1E4F1CA48] array];
  if (v13)
  {
    id v22 = (void *)MEMORY[0x1E4F28F60];
    id v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    uint64_t v24 = [v22 predicateWithFormat:@"(direction IN %@)", v23];

    [v21 addObject:v24];
  }
  uint64_t v25 = [v20 allObjects];

  if (v25)
  {
    id v26 = (void *)MEMORY[0x1E4F28F60];
    id v27 = [v20 allObjects];
    unint64_t v28 = [v26 predicateWithFormat:@"ANY recipients.identifier IN %@", v27];

    [v21 addObject:v28];
  }
  if (v14)
  {
    unint64_t v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"mechanism IN %@", v14];
    [v21 addObject:v29];
  }
  if (a6 > 0.0)
  {
    id v30 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"endDate - startDate >= %f", *(void *)&a6);
    [v21 addObject:v30];
  }
  uint64_t v31 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v21];
  id v32 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v40[0] = v32;
  id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  id v39 = 0;
  uint64_t v34 = [v15 queryInteractionsUsingPredicate:v31 sortDescriptors:v33 limit:a8 error:&v39];

  id v35 = v39;
  if (v35)
  {
    id v36 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v37 = 0;
  }
  else
  {
    id v37 = v34;
  }

  return v37;
}

+ (id)interactionsMatchingAnyHandles:(id)a3 account:(id)a4 directions:(id)a5 mechanisms:(id)a6 bundleIds:(id)a7 store:(id)a8 fetchLimit:(unint64_t)a9 messageInteractionCache:(id)a10
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v45 = a6;
  id v18 = a7;
  id v44 = a8;
  id v19 = a10;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  if (v18)
  {
    id v21 = (void *)MEMORY[0x1E4F28F60];
    id v22 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
    id v23 = [v21 predicateWithFormat:@"(bundleId IN %@)", v22];

    [v20 addObject:v23];
  }
  uint64_t v24 = v16;
  if (v16)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
    id v26 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
    id v27 = [v25 predicateWithFormat:@"(account IN %@)", v26];

    uint64_t v24 = v16;
    [v20 addObject:v27];
  }
  if (v17)
  {
    unint64_t v28 = (void *)MEMORY[0x1E4F28F60];
    unint64_t v29 = [MEMORY[0x1E4F1CAD0] setWithArray:v17];
    id v30 = [v28 predicateWithFormat:@"(direction IN %@)", v29];

    uint64_t v24 = v16;
    [v20 addObject:v30];
  }
  if (v15)
  {
    uint64_t v31 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY recipients.identifier IN %@", v15];
    [v20 addObject:v31];
  }
  v43 = v15;
  id v32 = v17;
  if (v45)
  {
    id v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"mechanism IN %@", v45];
    [v20 addObject:v33];
  }
  uint64_t v34 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v20];
  if (v19)
  {
    id v35 = [v19 interactions];
    id v36 = [v35 filteredArrayUsingPredicate:v34];
  }
  else
  {
    id v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v47[0] = v37;
    id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    id v46 = 0;
    id v39 = [v44 queryInteractionsUsingPredicate:v34 sortDescriptors:v38 limit:a9 error:&v46];
    id v40 = v46;

    if (v40)
    {
      id v41 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v36 = 0;
    }
    else
    {
      id v36 = v39;
    }

    uint64_t v24 = v16;
    id v32 = v17;
  }

  return v36;
}

+ (id)interactionsMatchingAnyHandlesOrContactIds:(id)a3 identifiers:(id)a4 account:(id)a5 directions:(id)a6 mechanisms:(id)a7 bundleIds:(id)a8 store:(id)a9 fetchLimit:(unint64_t)a10 messageInteractionCache:(id)a11
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v76 = a9;
  id v75 = a11;
  id v22 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v23 = 0x1E4F28000;
  if (v21)
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v25 = [MEMORY[0x1E4F1CAD0] setWithArray:v21];
    id v26 = [v24 predicateWithFormat:@"(bundleId IN %@)", v25];

    [v22 addObject:v26];
    unint64_t v23 = 0x1E4F28000;
  }
  if (v18)
  {
    id v27 = (void *)MEMORY[0x1E4F28F60];
    unint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithObject:v18];
    unint64_t v29 = [v27 predicateWithFormat:@"(account IN %@)", v28];

    [v22 addObject:v29];
    unint64_t v23 = 0x1E4F28000;
  }
  if (v19)
  {
    id v30 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
    id v32 = [v30 predicateWithFormat:@"(direction IN %@)", v31];

    [v22 addObject:v32];
    unint64_t v23 = 0x1E4F28000uLL;
  }
  unint64_t v33 = 0x1E4F28000;
  v77 = v22;
  id v73 = v21;
  id v74 = v20;
  if (v16)
  {
    id v69 = v19;
    id v70 = v18;
    id v71 = v17;
    uint64_t v34 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v16];
    unint64_t v35 = v23;
    id v36 = (void *)MEMORY[0x1E4F1CAD0];
    long long v68 = v34;
    id v37 = [v34 allValues];
    id v38 = [v36 setWithArray:v37];
    uint64_t v39 = [v38 mutableCopy];

    id v67 = (void *)v39;
    id v66 = [*(id *)(v35 + 3936) predicateWithFormat:@"ANY recipients.identifier IN %@", v39];
    id v40 = objc_opt_new();
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    id v72 = v16;
    id v41 = v16;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v79 objects:v85 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v80 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = *(void **)(*((void *)&v79 + 1) + 8 * i);
          v47 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          id v48 = [v46 stringByAddingPercentEncodingWithAllowedCharacters:v47];

          id v49 = [NSString stringWithFormat:@"conversationIdentifier(%@)", v48];
          [v40 addObject:v49];
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v79 objects:v85 count:16];
      }
      while (v43);
    }

    id v50 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"derivedIntentIdentifier IN %@", v40];
    long long v51 = (void *)MEMORY[0x1E4F28BA0];
    v84[0] = v66;
    v84[1] = v50;
    long long v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:2];
    long long v53 = [v51 orPredicateWithSubpredicates:v52];
    [v77 addObject:v53];

    id v22 = v77;
    unint64_t v23 = 0x1E4F28000uLL;

    unint64_t v33 = 0x1E4F28000uLL;
    id v17 = v71;
    id v16 = v72;
    id v19 = v69;
    id v18 = v70;
  }
  if (v17)
  {
    long long v54 = [*(id *)(v23 + 3936) predicateWithFormat:@"ANY recipients.personId IN %@", v17];
    [v22 addObject:v54];
  }
  if (v20)
  {
    id v55 = [*(id *)(v23 + 3936) predicateWithFormat:@"mechanism IN %@", v20];
    [v22 addObject:v55];
  }
  id v56 = [*(id *)(v33 + 2976) andPredicateWithSubpredicates:v22];
  id v57 = v75;
  if (v75)
  {
    uint64_t v58 = [v75 interactions];
    id v59 = [v58 filteredArrayUsingPredicate:v56];
  }
  else
  {
    id v60 = v19;
    uint64_t v58 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    v83 = v58;
    v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    id v78 = 0;
    id v62 = [v76 queryInteractionsUsingPredicate:v56 sortDescriptors:v61 limit:a10 error:&v78];
    id v63 = v78;

    if (v63)
    {
      id v64 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v59 = 0;
    }
    else
    {
      id v59 = v62;
    }
    id v57 = 0;

    id v19 = v60;
    id v21 = v73;
    id v20 = v74;
  }

  return v59;
}

+ (id)interactionsContainingSearchStringInDisplayName:(id)a3 account:(id)a4 directions:(id)a5 bundleIds:(id)a6 store:(id)a7 fetchLimit:(unint64_t)a8
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)MEMORY[0x1E4F1CA48];
  id v17 = a7;
  id v18 = [v16 array];
  if (v15)
  {
    id v19 = (void *)MEMORY[0x1E4F28F60];
    id v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
    id v21 = [v19 predicateWithFormat:@"(bundleId IN %@)", v20];

    [v18 addObject:v21];
  }
  if (v13)
  {
    id v22 = (void *)MEMORY[0x1E4F28F60];
    unint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
    uint64_t v24 = [v22 predicateWithFormat:@"(account IN %@)", v23];

    [v18 addObject:v24];
  }
  if (v14)
  {
    uint64_t v25 = (void *)MEMORY[0x1E4F28F60];
    id v26 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
    id v27 = [v25 predicateWithFormat:@"(direction IN %@)", v26];

    [v18 addObject:v27];
  }
  if (v12)
  {
    unint64_t v28 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"recipientCount > 0 AND SUBQUERY(recipients, $recipient, ANY $recipient.displayName CONTAINS[cd] %@).@count > 0", v12];
    [v18 addObject:v28];
  }
  unint64_t v29 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v18];
  id v30 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v39[0] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  id v38 = 0;
  id v32 = [v17 queryInteractionsUsingPredicate:v29 sortDescriptors:v31 limit:a8 error:&v38];

  id v33 = v38;
  if (v33)
  {
    uint64_t v34 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v35 = 0;
  }
  else
  {
    id v35 = v32;
  }

  return v35;
}

+ (id)groupInteractionsContainingSearchStringInDisplayName:(id)a3 excludingInteractionUUIDs:(id)a4 account:(id)a5 directions:(id)a6 bundleIds:(id)a7 excludedDomainIdentifiers:(id)a8 startDate:(id)a9 store:(id)a10 fetchLimit:(unint64_t)a11 offset:(unint64_t)a12
{
  v73[2] = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v70 = a5;
  id v19 = a6;
  id v69 = a7;
  id v68 = a8;
  id v20 = a9;
  id v64 = a10;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  id v22 = (void *)MEMORY[0x1E4F28F60];
  unint64_t v23 = NSUserName();
  uint64_t v24 = [v22 predicateWithFormat:@"(noindex:(nsUserName) = %@)", v23];

  id v63 = (void *)v24;
  [v21 addObject:v24];
  if (v20)
  {
    uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate > %@)", v20];
    [v21 addObject:v25];
  }
  id v67 = v20;
  if ([v18 count])
  {
    id v26 = (void *)MEMORY[0x1E4F28F60];
    id v27 = [MEMORY[0x1E4F1CAD0] setWithArray:v18];
    unint64_t v28 = [v26 predicateWithFormat:@"(uuid != %@)", v27];

    [v21 addObject:v28];
  }
  if (v69)
  {
    unint64_t v29 = @"(noindex:(bundleId) IN %@)";
    if (!v20) {
      unint64_t v29 = @"(bundleId IN %@)";
    }
    id v30 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
    id v32 = v19;
    id v33 = v29;
    uint64_t v34 = [v31 setWithArray:v69];
    id v35 = objc_msgSend(v30, "predicateWithFormat:", v33, v34);

    id v19 = v32;
    [v21 addObject:v35];
  }
  if (v70)
  {
    id v36 = (void *)MEMORY[0x1E4F28F60];
    id v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:");
    id v38 = [v36 predicateWithFormat:@"(account IN %@)", v37];

    [v21 addObject:v38];
  }
  if (v19)
  {
    uint64_t v39 = (void *)MEMORY[0x1E4F28F60];
    id v40 = [MEMORY[0x1E4F1CAD0] setWithArray:v19];
    id v41 = [v39 predicateWithFormat:@"(direction IN %@)", v40];

    [v21 addObject:v41];
  }
  id v65 = v19;
  id v66 = v18;
  uint64_t v42 = v68;
  if ([v68 count])
  {
    uint64_t v43 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"!(domainIdentifier IN %@)", v68];
    [v21 addObject:v43];
  }
  unint64_t v44 = 0x1E4F1C000;
  if (v17)
  {
    id v45 = (void *)MEMORY[0x1A6243860]();
    id v46 = [@" " stringByAppendingString:v17];
    v47 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(   (recipientCount > 1)   OR    (recipientCount >= 1 AND sender != nil)) AND(  (SUBQUERY(recipients, $recipient, ANY $recipient.displayName BEGINSWITH[cd] %@).@count > 0)   OR    (direction != %d AND sender != nil AND sender.displayName BEGINSWITH[cd] %@))", v17, 1, v17];
    id v48 = [NSString alloc];
    id v49 = [MEMORY[0x1E4F28FD8] escapedPatternForString:v17];
    id v50 = (void *)[v48 initWithFormat:@"(^|.*(?w:\\b))(?:.\\N{VARIATION SELECTOR-16})?\\P{alnum}+(?i)%@.*", v49];

    long long v51 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(groupName BEGINSWITH[cd] %@ OR groupName CONTAINS[cd] %@ OR groupName MATCHES %@)", v17, v46, v50];
    long long v52 = (void *)MEMORY[0x1E4F28BA0];
    v73[0] = v51;
    v73[1] = v47;
    long long v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:2];
    long long v54 = [v52 orPredicateWithSubpredicates:v53];
    [v21 addObject:v54];

    uint64_t v42 = v68;
    unint64_t v44 = 0x1E4F1C000uLL;
  }
  id v55 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v21];
  id v56 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  id v72 = v56;
  id v57 = [*(id *)(v44 + 2424) arrayWithObjects:&v72 count:1];
  id v71 = 0;
  uint64_t v58 = [v64 queryInteractionsUsingPredicate:v55 sortDescriptors:v57 limit:a11 offset:a12 error:&v71];
  id v59 = v71;

  if (v59)
  {
    id v60 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v61 = 0;
  }
  else
  {
    id v61 = v58;
  }

  return v61;
}

+ (id)interactionsMostRecentForBundleId:(id)a3 store:(id)a4 resultLimit:(unint64_t)a5 interactions:(id)a6
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  if (v9)
  {
    id v46 = v10;
    id v13 = (void *)MEMORY[0x1E4F28F60];
    id v14 = (void *)MEMORY[0x1E4F1CAD0];
    id v44 = v9;
    v55[0] = v9;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    id v16 = [v14 setWithArray:v15];
    id v17 = [v13 predicateWithFormat:@"(bundleId IN %@)", v16];

    id v18 = (void *)MEMORY[0x1E4F28F60];
    id v19 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF676578];
    uint64_t v20 = [v18 predicateWithFormat:@"(direction IN %@)", v19];

    uint64_t v21 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    id v45 = v11;
    uint64_t v42 = (void *)v21;
    uint64_t v43 = (void *)v20;
    if (v11)
    {
      id v22 = [v11 filteredArrayUsingPredicate:v17];
      id v41 = 0;
    }
    else
    {
      uint64_t v23 = v21;
      uint64_t v24 = (void *)MEMORY[0x1E4F28BA0];
      v54[0] = v17;
      v54[1] = v20;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
      id v26 = [v24 andPredicateWithSubpredicates:v25];
      uint64_t v53 = v23;
      id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
      id v51 = 0;
      id v22 = [v46 queryInteractionsUsingPredicate:v26 sortDescriptors:v27 limit:500 error:&v51];
      id v41 = v51;
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v28 = v22;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v48;
LABEL_7:
      uint64_t v32 = 0;
      while (1)
      {
        id v33 = v17;
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v34 = *(void **)(*((void *)&v47 + 1) + 8 * v32);
        id v35 = [v34 domainIdentifier];

        if (v35)
        {
          id v36 = [v34 domainIdentifier];
          char v37 = [v12 containsObject:v36];

          if ((v37 & 1) == 0)
          {
            id v38 = [v34 domainIdentifier];
            [v12 addObject:v38];
          }
        }
        id v17 = v33;
        if ([v12 count] >= a5) {
          break;
        }
        if (v30 == ++v32)
        {
          uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v52 count:16];
          if (v30) {
            goto LABEL_7;
          }
          break;
        }
      }
    }

    id v11 = v45;
    id v10 = v46;
    id v9 = v44;
  }
  uint64_t v39 = (void *)[v12 copy];

  return v39;
}

+ (id)conversationIdFromInteraction:(id)a3 bundleIds:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v10 = [a1 conversationIdFromInteraction:v6];
LABEL_7:
    id v14 = (void *)v10;
    goto LABEL_8;
  }
  uint64_t v8 = [v6 bundleId];
  id v9 = +[_PSConstants mobileMessagesBundleId];
  if ([v8 isEqualToString:v9])
  {

LABEL_6:
    uint64_t v10 = [v6 domainIdentifier];
    goto LABEL_7;
  }
  id v11 = [v6 targetBundleId];
  id v12 = +[_PSConstants shareSheetTargetBundleIdMessages];
  int v13 = [v11 isEqualToString:v12];

  if (v13) {
    goto LABEL_6;
  }
  id v16 = [v6 bundleId];
  id v17 = +[_PSConstants mobileMailBundleId];
  if ([v16 isEqualToString:v17])
  {

LABEL_14:
    uint64_t v21 = (void *)MEMORY[0x1E4F5B3D8];
    id v22 = [v6 recipients];
    id v14 = [v21 generateConversationIdFromInteractionRecipients:v22];

    goto LABEL_8;
  }
  id v18 = [v6 targetBundleId];
  id v19 = +[_PSConstants shareSheetTargetBundleIdMail];
  int v20 = [v18 isEqualToString:v19];

  if (v20) {
    goto LABEL_14;
  }
  uint64_t v23 = [v6 bundleId];
  if ([v7 containsObject:v23])
  {

LABEL_18:
    uint64_t v10 = [v6 derivedIntentIdentifier];
    goto LABEL_7;
  }
  uint64_t v24 = [v6 targetBundleId];
  int v25 = [v7 containsObject:v24];

  if (v25) {
    goto LABEL_18;
  }
  id v14 = 0;
LABEL_8:

  return v14;
}

+ (id)conversationIdFromInteraction:(id)a3
{
  id v3 = a3;
  v4 = [v3 bundleId];
  id v5 = +[_PSConstants mobileMessagesBundleId];
  if ([v4 isEqualToString:v5])
  {

LABEL_4:
    uint64_t v9 = [v3 domainIdentifier];
LABEL_5:
    uint64_t v10 = (void *)v9;
    goto LABEL_6;
  }
  id v6 = [v3 targetBundleId];
  id v7 = +[_PSConstants shareSheetTargetBundleIdMessages];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    goto LABEL_4;
  }
  id v12 = [v3 bundleId];
  int v13 = +[_PSConstants mobileMailBundleId];
  if ([v12 isEqualToString:v13])
  {
  }
  else
  {
    id v14 = [v3 targetBundleId];
    id v15 = +[_PSConstants shareSheetTargetBundleIdMail];
    int v16 = [v14 isEqualToString:v15];

    if (!v16)
    {
      uint64_t v9 = [v3 derivedIntentIdentifier];
      goto LABEL_5;
    }
  }
  id v17 = (void *)MEMORY[0x1E4F5B3D8];
  id v18 = [v3 recipients];
  uint64_t v10 = [v17 generateConversationIdFromInteractionRecipients:v18];

LABEL_6:

  return v10;
}

+ (id)interactionsWithContactIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6
{
  void v35[3] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)[a3 mutableCopy];
  int v13 = v12;
  if (v11) {
    [v12 removeObject:v11];
  }
  if ((unint64_t)[v13 count] >= 2)
  {
    id v15 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v31 = [MEMORY[0x1E4F1CAD0] setWithArray:v10];
    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v31];
    uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"recipientCount > 1 AND SUBQUERY(recipients, $recipient, $recipient.personId IN %@).@count > 1", v13];
    id v18 = (void *)MEMORY[0x1E4F28F60];
    id v19 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EF676590];
    int v20 = [v18 predicateWithFormat:@"(direction IN %@)", v19];

    v35[0] = v20;
    v35[1] = v16;
    uint64_t v29 = (void *)v17;
    uint64_t v30 = (void *)v16;
    v35[2] = v17;
    uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
    [v15 addObjectsFromArray:v21];

    id v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
    uint64_t v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    uint64_t v34 = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    id v32 = v9;
    id v33 = 0;
    int v25 = [v9 queryInteractionsUsingPredicate:v22 sortDescriptors:v24 limit:1000 error:&v33];
    id v26 = v33;

    if (v26)
    {
      id v27 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      id v14 = 0;
    }
    else
    {
      id v14 = v25;
    }

    id v9 = v32;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)conversationIdWithMaximalIntersectionWithContactIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = &off_1E5ADE000;
  id v45 = v9;
  int v13 = +[_PSInteractionStoreUtils interactionsWithContactIdentifiers:v9 store:a4 bundleIds:v10 meContactIdentifier:v11];
  id v14 = v13;
  if (v13 && [v13 count])
  {
    id v41 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    id v15 = [MEMORY[0x1E4F1CA80] set];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v40 = v14;
    id obj = v14;
    uint64_t v16 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      int v50 = 0;
      uint64_t v18 = *(void *)v57;
      unint64_t v49 = 1;
      uint64_t v43 = v15;
      id v44 = v10;
      uint64_t v42 = *(void *)v57;
      do
      {
        uint64_t v19 = 0;
        uint64_t v46 = v17;
        do
        {
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(obj);
          }
          int v20 = *(void **)(*((void *)&v56 + 1) + 8 * v19);
          uint64_t v21 = objc_msgSend(v12[165], "conversationIdFromInteraction:bundleIds:", v20, v10, v40);
          if (v21 && ([v15 containsObject:v21] & 1) == 0)
          {
            id v51 = v21;
            id v22 = [MEMORY[0x1E4F1CA80] set];
            long long v52 = 0u;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v48 = v20;
            uint64_t v23 = [v20 recipients];
            uint64_t v24 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v53;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v53 != v26) {
                    objc_enumerationMutation(v23);
                  }
                  id v28 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                  uint64_t v29 = [v28 personId];
                  if (v29)
                  {
                    uint64_t v30 = (void *)v29;
                    id v31 = [v28 personId];

                    if (v31 != v11)
                    {
                      id v32 = [v28 personId];
                      [v22 addObject:v32];
                    }
                  }
                }
                uint64_t v25 = [v23 countByEnumeratingWithState:&v52 objects:v60 count:16];
              }
              while (v25);
            }

            [v22 intersectSet:v45];
            uint64_t v33 = [v22 count];
            uint64_t v34 = [v45 count];
            if ([v22 count] <= v49)
            {
              BOOL v37 = v33 != v34;
              id v15 = v43;
              id v10 = v44;
              id v12 = &off_1E5ADE000;
              uint64_t v18 = v42;
              uint64_t v17 = v46;
              uint64_t v21 = v51;
              if (((v50 | v37) & 1) == 0)
              {
                id v38 = [v48 bundleId];
                [v41 setObject:v51 forKeyedSubscript:v38];

                unint64_t v49 = [v22 count];
                int v50 = 1;
              }
            }
            else
            {
              BOOL v35 = v33 == v34;
              id v36 = [v48 bundleId];
              uint64_t v21 = v51;
              [v41 setObject:v51 forKeyedSubscript:v36];

              unint64_t v49 = [v22 count];
              v50 |= v35;
              id v15 = v43;
              id v10 = v44;
              id v12 = &off_1E5ADE000;
              uint64_t v18 = v42;
              uint64_t v17 = v46;
            }
            [v15 addObject:v21];
          }
          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v17);
    }

    id v14 = v40;
  }
  else
  {
    id v41 = 0;
  }

  return v41;
}

+ (id)conversationIdWithExactMatchWithContactHandles:(id)a3 store:(id)a4 bundleIds:(id)a5 messageInteractionCache:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v51 = v9;
  int v13 = [v9 allObjects];
  id v14 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v13];

  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = [v14 allValues];
  uint64_t v17 = [v15 setWithArray:v16];
  uint64_t v18 = (void *)[v17 mutableCopy];

  uint64_t v19 = &off_1E5ADE000;
  int v20 = [v18 allObjects];
  uint64_t v21 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v20 account:0 directions:0 mechanisms:0 bundleIds:v11 store:v10 fetchLimit:500 messageInteractionCache:v12];

  if (v21 && [v21 count])
  {
    uint64_t v42 = v18;
    uint64_t v43 = v14;
    id v44 = v12;
    id v45 = v10;
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v22 = [MEMORY[0x1E4F1CA80] set];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v41 = v21;
    id obj = v21;
    uint64_t v23 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v58;
      long long v48 = v22;
      id v49 = v11;
      uint64_t v47 = *(void *)v58;
      while (2)
      {
        uint64_t v26 = 0;
        uint64_t v50 = v24;
        do
        {
          if (*(void *)v58 != v25) {
            objc_enumerationMutation(obj);
          }
          id v27 = *(void **)(*((void *)&v57 + 1) + 8 * v26);
          id v28 = [v19[165] conversationIdFromInteraction:v27 bundleIds:v11];
          if (v28 && ([v22 containsObject:v28] & 1) == 0)
          {
            uint64_t v29 = [MEMORY[0x1E4F1CA80] set];
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            uint64_t v30 = [v27 recipients];
            uint64_t v31 = [v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
            if (v31)
            {
              uint64_t v32 = v31;
              uint64_t v33 = *(void *)v54;
              do
              {
                for (uint64_t i = 0; i != v32; ++i)
                {
                  if (*(void *)v54 != v33) {
                    objc_enumerationMutation(v30);
                  }
                  BOOL v35 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                  id v36 = [v35 handle];

                  if (v36)
                  {
                    BOOL v37 = [v35 handle];
                    [v29 addObject:v37];
                  }
                }
                uint64_t v32 = [v30 countByEnumeratingWithState:&v53 objects:v61 count:16];
              }
              while (v32);
            }

            if ([v29 isEqualToSet:v51])
            {
              uint64_t v39 = [v27 bundleId];
              [v46 setObject:v28 forKeyedSubscript:v39];

              id v22 = v48;
              id v11 = v49;
              goto LABEL_26;
            }
            id v22 = v48;
            [v48 addObject:v28];

            id v11 = v49;
            uint64_t v24 = v50;
            uint64_t v19 = &off_1E5ADE000;
            uint64_t v25 = v47;
          }

          ++v26;
        }
        while (v26 != v24);
        uint64_t v24 = [obj countByEnumeratingWithState:&v57 objects:v62 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
LABEL_26:

    id v12 = v44;
    id v10 = v45;
    uint64_t v18 = v42;
    id v14 = v43;
    id v38 = v46;
    uint64_t v21 = v41;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

+ (id)someIMessageInteractionInvolvingContactIdentifier:(id)a3 store:(id)a4 contactType:(unint64_t)a5 afterStartDate:(id)a6
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = a4;
  id v11 = a3;
  id v12 = [v9 predicateWithFormat:@"(startDate >= %@)", a6];
  int v13 = (void *)MEMORY[0x1E4F28F60];
  id v14 = +[_PSConstants mobileMessagesBundleId];
  id v15 = [v13 predicateWithFormat:@"(bundleId = %@)", v14];

  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(domainIdentifier BEGINSWITH 'iMessage')"];
  uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v18 = NSUserName();
  uint64_t v19 = [v17 predicateWithFormat:@"(nsUserName = nil OR nsUserName = %@ OR nsUserName = %@)", @"root", v18];

  int v20 = (void *)MEMORY[0x1E4F1CA48];
  v32[0] = v12;
  v32[1] = v15;
  v32[2] = v16;
  v32[3] = v19;
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  id v22 = [v20 arrayWithArray:v21];

  if (a5 - 1 > 1) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.personId = %@).@count > 0)", v11, v30];
  }
  else {
  uint64_t v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.personId = %@ AND $recipient.type = %d).@count > 0)", v11, a5];
  }

  [v22 addObject:v23];
  uint64_t v24 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v22];
  id v31 = 0;
  uint64_t v25 = [v10 queryInteractionsUsingPredicate:v24 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:1 error:&v31];

  id v26 = v31;
  if (v26)
  {
    id v27 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v28 = 0;
  }
  else
  {
    id v28 = [v25 firstObject];
  }

  return v28;
}

+ (id)someInteractionWithMatchingIdentifier:(id)a3 store:(id)a4 bundleIds:(id)a5 afterStartDate:(id)a6
{
  void v29[4] = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E4F28F60];
  id v10 = (void *)MEMORY[0x1E4F1CAD0];
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 setWithArray:a5];
  id v15 = [v9 predicateWithFormat:@"(bundleId IN %@)", v14];

  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(recipientCount == 1)"];
  uint64_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.personId = %@ OR $recipient.identifier = %@).@count == 1)", v13, v13];

  uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(startDate >= %@)", v11];

  uint64_t v19 = (void *)MEMORY[0x1E4F1CA48];
  v29[0] = v15;
  v29[1] = v16;
  v29[2] = v17;
  v29[3] = v18;
  int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  uint64_t v21 = [v19 arrayWithArray:v20];

  id v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v21];
  id v28 = 0;
  uint64_t v23 = [v12 queryInteractionsUsingPredicate:v22 sortDescriptors:MEMORY[0x1E4F1CBF0] limit:1 error:&v28];

  id v24 = v28;
  if (v24)
  {
    uint64_t v25 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    id v26 = 0;
  }
  else
  {
    id v26 = [v23 firstObject];
  }

  return v26;
}

+ (id)mostRecentInteractionInvolvingMatchingIdentifier:(id)a3 store:(id)a4 bundleIds:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  int v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 setWithArray:a5];
  id v12 = [v7 predicateWithFormat:@"(bundleId IN %@)", v11];

  id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.personId = %@ or $recipient.identifier = %@).@count > 0)", v10, v10];

  id v14 = (void *)MEMORY[0x1E4F1CA48];
  v27[0] = v12;
  v27[1] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  uint64_t v16 = [v14 arrayWithArray:v15];

  uint64_t v17 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v16];
  uint64_t v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  id v26 = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  id v25 = 0;
  int v20 = [v9 queryInteractionsUsingPredicate:v17 sortDescriptors:v19 limit:1 error:&v25];

  id v21 = v25;
  if (v21)
  {
    id v22 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
    }

    uint64_t v23 = 0;
  }
  else
  {
    uint64_t v23 = [v20 firstObject];
  }

  return v23;
}

+ (id)mostRecentInteractionWithExactMatchingIdentifiers:(id)a3 store:(id)a4 bundleIds:(id)a5 meContactIdentifier:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = v9;
  id v14 = v13;
  id v15 = v13;
  if (v12)
  {
    id v15 = (void *)[v13 mutableCopy];
    [v15 removeObject:v12];
  }
  if ([v15 count])
  {
    id v53 = v12;
    long long v54 = v14;
    id v55 = v11;
    long long v52 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
    uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(bundleId IN %@)", v52];
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction = %@)", &unk_1EF675B88];
    uint64_t v19 = (void *)MEMORY[0x1E4F28F60];
    long long v56 = v10;
    int v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    uint64_t v21 = [v19 predicateWithFormat:@"(recipientCount = %@)", v20];

    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.personId IN %@ or $recipient.identifier IN %@).@count = %d)", v15, v15, objc_msgSend(v15, "count")];
    long long v48 = (void *)v21;
    id v49 = (void *)v18;
    v61[0] = v18;
    v61[1] = v16;
    uint64_t v62 = v61[2] = v21;
    uint64_t v47 = (void *)v62;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
    [v17 addObjectsFromArray:v22];

    uint64_t v50 = v17;
    uint64_t v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v17];
    id v24 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(direction = %@)", &unk_1EF675BA0];
    id v26 = (void *)MEMORY[0x1E4F28F60];
    id v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count") - 1);
    uint64_t v28 = [v26 predicateWithFormat:@"(recipientCount = %@)", v27];

    uint64_t v29 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(SUBQUERY(recipients, $recipient, $recipient.personId IN %@ or $recipient.identifier IN %@).@count = %d)", v15, v15, objc_msgSend(v15, "count") - 1];
    uint64_t v30 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"((sender.personId IN %@) OR (sender.identifier IN %@))", v15, v15];
    id v44 = (void *)v29;
    id v45 = (void *)v25;
    v60[0] = v25;
    v60[1] = v16;
    id v31 = (void *)v28;
    id v51 = (void *)v16;
    v60[2] = v28;
    v60[3] = v29;
    v60[4] = v30;
    uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:5];
    [v24 addObjectsFromArray:v32];

    uint64_t v33 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v24];
    uint64_t v34 = (void *)MEMORY[0x1E4F28BA0];
    id v46 = (void *)v23;
    v59[0] = v23;
    v59[1] = v33;
    BOOL v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    id v36 = [v34 orPredicateWithSubpredicates:v35];

    BOOL v37 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
    long long v58 = v37;
    id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    id v57 = 0;
    uint64_t v39 = [v56 queryInteractionsUsingPredicate:v36 sortDescriptors:v38 limit:1 error:&v57];
    id v40 = v57;

    if (v40)
    {
      id v41 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        +[_PSInteractionStoreUtils recentInteractionsFromStore:bundleIDs:]();
      }

      uint64_t v42 = 0;
    }
    else
    {
      uint64_t v42 = [v39 firstObject];
    }

    id v11 = v55;
    id v10 = v56;
    id v12 = v53;
    id v14 = v54;
  }
  else
  {
    uint64_t v42 = 0;
  }

  return v42;
}

+ (int64_t)getHandleTypeFromHandleString:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v4 = (void *)getCNHandleStringClassifierClass_softClass;
    uint64_t v19 = getCNHandleStringClassifierClass_softClass;
    if (!getCNHandleStringClassifierClass_softClass)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __getCNHandleStringClassifierClass_block_invoke;
      v15[3] = &unk_1E5ADE858;
      v15[4] = &v16;
      __getCNHandleStringClassifierClass_block_invoke((uint64_t)v15);
      v4 = (void *)v17[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v16, 8);
    v20[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v7 = [v5 classificationOfHandleStrings:v6];

    int v8 = [v7 emailAddresses];
    if (!v8
      || ([v7 emailAddresses],
          id v9 = objc_claimAutoreleasedReturnValue(),
          BOOL v10 = [v9 count] == 0,
          v9,
          v8,
          v10))
    {
      int64_t v11 = [v7 phoneNumbers];
      if (v11)
      {
        id v12 = [v7 phoneNumbers];
        BOOL v13 = [v12 count] == 0;

        if (v13) {
          int64_t v11 = 0;
        }
        else {
          int64_t v11 = 2;
        }
      }
    }
    else
    {
      int64_t v11 = 1;
    }
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

+ (id)metadataFromFeedbackEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 derivedIntentIdentifier];

  if (v5)
  {
    id v6 = [v3 derivedIntentIdentifier];
    id v7 = [MEMORY[0x1E4F5B5E0] derivedIntentIdentifier];
    [v4 setObject:v6 forKeyedSubscript:v7];
  }
  int v8 = [v3 targetBundleID];

  if (v8)
  {
    id v9 = [v3 targetBundleID];
    BOOL v10 = [MEMORY[0x1E4F5B5E0] targetBundleID];
    [v4 setObject:v9 forKeyedSubscript:v10];
  }
  int64_t v11 = [v3 extensionContextUUID];

  if (v11)
  {
    id v12 = [v3 extensionContextUUID];
    BOOL v13 = [MEMORY[0x1E4F5B5E0] extensionContextUUID];
    [v4 setObject:v12 forKeyedSubscript:v13];
  }
  id v14 = [v3 attachments];

  if (v14)
  {
    id v15 = [v3 attachments];
    uint64_t v16 = [MEMORY[0x1E4F5B5E0] attachments];
    [v4 setObject:v15 forKeyedSubscript:v16];
  }
  uint64_t v17 = [v3 locationUUIDs];

  if (v17)
  {
    uint64_t v18 = [v3 locationUUIDs];
    uint64_t v19 = [MEMORY[0x1E4F5B5E0] locationUUIDs];
    [v4 setObject:v18 forKeyedSubscript:v19];
  }
  int v20 = [v3 photoSuggestedContacts];

  if (v20)
  {
    uint64_t v21 = [v3 photoSuggestedContacts];
    id v22 = [MEMORY[0x1E4F5B5E0] photoSuggestedContacts];
    [v4 setObject:v21 forKeyedSubscript:v22];
  }
  uint64_t v23 = [v3 sourceBundleID];

  if (v23)
  {
    id v24 = [v3 sourceBundleID];
    uint64_t v25 = [MEMORY[0x1E4F5B5E0] sourceBundleID];
    [v4 setObject:v24 forKeyedSubscript:v25];
  }
  id v26 = [v3 modelSuggestionProxies];

  if (v26)
  {
    id v27 = [v3 modelSuggestionProxies];
    uint64_t v28 = [MEMORY[0x1E4F5B5E0] modelSuggestionProxies];
    [v4 setObject:v27 forKeyedSubscript:v28];
  }
  uint64_t v29 = [v3 adaptedModelRecipeID];

  if (v29)
  {
    uint64_t v30 = [v3 adaptedModelRecipeID];
    id v31 = [MEMORY[0x1E4F5B5E0] adaptedModelRecipeID];
    [v4 setObject:v30 forKeyedSubscript:v31];
  }
  uint64_t v32 = [v3 supportedBundleIDs];

  if (v32)
  {
    uint64_t v33 = [v3 supportedBundleIDs];
    uint64_t v34 = [MEMORY[0x1E4F5B5E0] supportedBundleIDs];
    [v4 setObject:v33 forKeyedSubscript:v34];
  }
  BOOL v35 = [v3 reasonType];

  if (v35)
  {
    id v36 = [v3 reasonType];
    BOOL v37 = [MEMORY[0x1E4F5B5E0] reasonType];
    [v4 setObject:v36 forKeyedSubscript:v37];
  }
  id v38 = [v3 reason];

  if (v38)
  {
    uint64_t v39 = [v3 reason];
    id v40 = [MEMORY[0x1E4F5B5E0] reason];
    [v4 setObject:v39 forKeyedSubscript:v40];
  }
  id v41 = [v3 transportBundleID];

  if (v41)
  {
    uint64_t v42 = [v3 transportBundleID];
    uint64_t v43 = [MEMORY[0x1E4F5B5E0] transportBundleID];
    [v4 setObject:v42 forKeyedSubscript:v43];
  }
  id v44 = [v3 trackingID];

  if (v44)
  {
    id v45 = [v3 trackingID];
    id v46 = [MEMORY[0x1E4F5B5E0] trackingID];
    [v4 setObject:v45 forKeyedSubscript:v46];
  }
  uint64_t v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAdaptedModelUsed"));
  long long v48 = [MEMORY[0x1E4F5B5E0] isAdaptedModelUsed];
  [v4 setObject:v47 forKeyedSubscript:v48];

  id v49 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isAdaptedModelCreated"));
  uint64_t v50 = [MEMORY[0x1E4F5B5E0] isAdaptedModelCreated];
  [v4 setObject:v49 forKeyedSubscript:v50];

  id v51 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "indexSelected"));
  long long v52 = [MEMORY[0x1E4F5B5E0] indexSelected];
  [v4 setObject:v51 forKeyedSubscript:v52];

  id v53 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "engagementType"));
  long long v54 = [MEMORY[0x1E4F5B5E0] engagementType];
  [v4 setObject:v53 forKeyedSubscript:v54];

  id v55 = NSNumber;
  [v3 numberOfVisibleSuggestions];
  long long v56 = objc_msgSend(v55, "numberWithDouble:");
  id v57 = [MEMORY[0x1E4F5B5E0] numberOfVisibleSuggestions];
  [v4 setObject:v56 forKeyedSubscript:v57];

  long long v58 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "iCloudFamilyInvocation"));
  long long v59 = [MEMORY[0x1E4F5B5E0] iCloudFamilyInvocation];
  [v4 setObject:v58 forKeyedSubscript:v59];

  long long v60 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "peopleSuggestionsDisabled"));
  id v61 = [MEMORY[0x1E4F5B5E0] peopleSuggestionsDisabled];
  [v4 setObject:v60 forKeyedSubscript:v61];

  return v4;
}

+ (void)recentInteractionsFromStore:bundleIDs:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error querying interactions database: %@", v2, v3, v4, v5, v6);
}

+ (void)interactionsMatchingAnyHandlesOrDomainIds:account:directions:mechanisms:bundleIds:store:fetchLimit:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, MEMORY[0x1E4F14500], v0, "Error querying interactions database: %@", v1, v2, v3, v4, v5);
}

@end