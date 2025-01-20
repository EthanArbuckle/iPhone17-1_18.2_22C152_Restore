@interface CKShare(IC)
+ (CKShareSystemFieldsTransformer)ic_systemFieldsValueTransformer;
- (BOOL)ic_isPublicShare;
- (id)ic_acceptedParticipants;
- (id)ic_nonCurrentUserAcceptedParticipants;
- (id)ic_nonCurrentUserParticipants;
- (id)ic_participantWithHandle:()IC;
- (id)ic_participantWithUserRecordName:()IC;
- (uint64_t)_nonCurrentUserParticipantsCountWithAcceptanceStatus:()IC;
- (uint64_t)_nonOwnerParticipantsCountWithAcceptanceStatus:()IC;
- (uint64_t)ic_nonOwnerAcceptedParticipantsCount;
- (uint64_t)ic_nonOwnerInvitedParticipantsCount;
- (uint64_t)ic_nonOwnerPendingParticipantsCount;
@end

@implementation CKShare(IC)

+ (CKShareSystemFieldsTransformer)ic_systemFieldsValueTransformer
{
  uint64_t v0 = objc_opt_class();
  if (v0 != objc_opt_class()) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[self class] == [CKShare class]", "+[CKShare(IC) ic_systemFieldsValueTransformer]", 1, 0, @"-ic_systemFieldsValueTransformer must be overridden, and must not call super: %@", objc_opt_class() functionName simulateCrash showAlert format];
  }
  v1 = objc_alloc_init(CKShareSystemFieldsTransformer);
  return v1;
}

- (uint64_t)ic_nonOwnerInvitedParticipantsCount
{
  uint64_t v2 = [a1 _nonOwnerParticipantsCountWithAcceptanceStatus:1];
  return [a1 _nonOwnerParticipantsCountWithAcceptanceStatus:2] + v2;
}

- (uint64_t)ic_nonOwnerAcceptedParticipantsCount
{
  return [a1 _nonOwnerParticipantsCountWithAcceptanceStatus:2];
}

- (uint64_t)ic_nonOwnerPendingParticipantsCount
{
  return [a1 _nonOwnerParticipantsCountWithAcceptanceStatus:1];
}

- (id)ic_nonCurrentUserParticipants
{
  v1 = (void *)MEMORY[0x1E4F1A3B0];
  uint64_t v2 = [a1 participants];
  v3 = objc_msgSend(v1, "ic_nonCurrentUserParticipants:", v2);

  return v3;
}

- (id)ic_acceptedParticipants
{
  v1 = [a1 participants];
  uint64_t v2 = objc_msgSend(v1, "ic_objectsPassingTest:", &__block_literal_global_45);

  return v2;
}

- (id)ic_nonCurrentUserAcceptedParticipants
{
  v1 = [a1 participants];
  uint64_t v2 = objc_msgSend(v1, "ic_objectsPassingTest:", &__block_literal_global_7);

  return v2;
}

- (BOOL)ic_isPublicShare
{
  return [a1 publicPermission] == 2 || objc_msgSend(a1, "publicPermission") == 3;
}

- (id)ic_participantWithUserRecordName:()IC
{
  id v4 = a3;
  if ([v4 length])
  {
    v5 = [a1 allParticipants];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CKShare_IC__ic_participantWithUserRecordName___block_invoke;
    v8[3] = &unk_1E64A7728;
    id v9 = v4;
    v6 = objc_msgSend(v5, "ic_objectPassingTest:", v8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)ic_participantWithHandle:()IC
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FADBD8], "normalizedHandleWithDestinationID:");
  if (v2)
  {
    v3 = [a1 allParticipants];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__CKShare_IC__ic_participantWithHandle___block_invoke;
    v6[3] = &unk_1E64A7728;
    id v7 = v2;
    id v4 = objc_msgSend(v3, "ic_objectPassingTest:", v6);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (uint64_t)_nonCurrentUserParticipantsCountWithAcceptanceStatus:()IC
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(a1, "participants", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [a1 owner];
        if (v11 == (void *)v12)
        {
        }
        else
        {
          v13 = (void *)v12;
          uint64_t v14 = [v11 acceptanceStatus];

          if (v14 == a3) {
            ++v8;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)_nonOwnerParticipantsCountWithAcceptanceStatus:()IC
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(a1, "participants", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = [a1 owner];
        if (v11 == (void *)v12)
        {
        }
        else
        {
          v13 = (void *)v12;
          uint64_t v14 = [v11 acceptanceStatus];

          if (v14 == a3) {
            ++v8;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end