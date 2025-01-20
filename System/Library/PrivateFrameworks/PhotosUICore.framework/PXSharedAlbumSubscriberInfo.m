@interface PXSharedAlbumSubscriberInfo
+ (id)_allSubscribersForAlbum:(id)a3 includeMyself:(BOOL)a4;
+ (id)allSubscribersForAlbum:(id)a3;
+ (id)allSubscribersForAlbumWithObjectID:(id)a3 includingCurrentUser:(BOOL)a4 managedObjectContext:(id)a5;
- (BOOL)isOwner;
- (NSString)displayName;
- (NSString)email;
- (NSString)firstName;
- (NSString)identifier;
- (NSString)lastName;
- (NSString)phone;
- (PLCloudSharedAlbumInvitationRecord)invitationRecord;
- (PXSharedAlbumSubscriberInfo)init;
- (PXSharedAlbumSubscriberInfo)initWithInvitationRecord:(id)a3 identifier:(id)a4 email:(id)a5 phone:(id)a6 firstName:(id)a7 lastName:(id)a8 displayName:(id)a9 isOwner:(BOOL)a10;
- (id)matchingContactWithKeysToFetch:(id)a3 outMatchingKey:(id *)a4 outMatchingIdentifier:(id *)a5;
@end

@implementation PXSharedAlbumSubscriberInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invitationRecord, 0);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)phone
{
  return self->_phone;
}

- (NSString)email
{
  return self->_email;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (PLCloudSharedAlbumInvitationRecord)invitationRecord
{
  return self->_invitationRecord;
}

- (id)matchingContactWithKeysToFetch:(id)a3 outMatchingKey:(id *)a4 outMatchingIdentifier:(id *)a5
{
  v81[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = +[PXPeopleUtilities sharedContactStore];
  v10 = [MEMORY[0x1E4F1CA48] arrayWithArray:v8];
  v11 = (void *)*MEMORY[0x1E4F1ADC8];
  v12 = (void *)*MEMORY[0x1E4F1AEE0];
  v81[0] = *MEMORY[0x1E4F1ADC8];
  v81[1] = v12;
  v50 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  [v10 addObjectsFromArray:v13];

  uint64_t v14 = [(PXSharedAlbumSubscriberInfo *)self firstName];
  uint64_t v15 = [(PXSharedAlbumSubscriberInfo *)self lastName];
  v16 = [(PXSharedAlbumSubscriberInfo *)self email];
  v61 = [(PXSharedAlbumSubscriberInfo *)self phone];
  if (v14 | v15 && (id v17 = objc_alloc_init(MEMORY[0x1E4F1B910])) != 0)
  {
    v62 = v17;
    [v17 setStyle:0];
    v18 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    [v10 addObject:v18];
  }
  else
  {
    v62 = 0;
  }
  v60 = (void *)v15;
  if (![v16 length])
  {
    id v63 = 0;
    v23 = 0;
LABEL_28:
    if ([v61 length])
    {
      uint64_t v55 = v14;
      v29 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v61];
      v30 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v29];
      id v69 = 0;
      v59 = [v9 unifiedContactsMatchingPredicate:v30 keysToFetch:v10 error:&v69];
      id v53 = v69;
      if (v53)
      {
        v31 = PLUIGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v78 = "-[PXSharedAlbumSubscriberInfo matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
          __int16 v79 = 2112;
          id v80 = v53;
          _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts : %@", buf, 0x16u);
        }
      }
      if ([v59 count])
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1B8F8], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v59, v55, v60, v62);
        if (v21)
        {
          v49 = a5;
          v47 = v10;
          id v51 = v50;

          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v32 = [v21 phoneNumbers];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v65 objects:v75 count:16];
          if (v33)
          {
            uint64_t v34 = v33;
            id v64 = v30;
            v57 = a4;
            v43 = v9;
            id v45 = v8;
            uint64_t v35 = *(void *)v66;
            while (2)
            {
              for (uint64_t i = 0; i != v34; ++i)
              {
                if (*(void *)v66 != v35) {
                  objc_enumerationMutation(v32);
                }
                v37 = *(void **)(*((void *)&v65 + 1) + 8 * i);
                v38 = objc_msgSend(v37, "value", v43, v45);
                if ([v38 isLikePhoneNumber:v29])
                {
                  uint64_t v39 = [v37 identifier];

                  v23 = (void *)v39;
                  goto LABEL_48;
                }
              }
              uint64_t v34 = [v32 countByEnumeratingWithState:&v65 objects:v75 count:16];
              if (v34) {
                continue;
              }
              break;
            }
LABEL_48:
            v9 = v43;
            id v8 = v45;
            a4 = v57;
            v30 = v64;
          }

          a5 = v49;
          id v63 = v51;
          v10 = v47;
        }
      }
      else
      {
        v21 = 0;
      }

      uint64_t v14 = v55;
    }
    else
    {
      v21 = 0;
    }
    goto LABEL_51;
  }
  v56 = a4;
  [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v16];
  v52 = uint64_t v74 = 0;
  v19 = objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:");
  id v58 = 0;
  if (v58)
  {
    v20 = PLUIGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v78 = "-[PXSharedAlbumSubscriberInfo matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
      __int16 v79 = 2112;
      id v80 = v58;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts : %@", buf, 0x16u);
    }
  }
  if ([v19 count])
  {
    v21 = objc_msgSend(MEMORY[0x1E4F1B8F8], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v19, v14, v15, v62);
    if (v21)
    {
      v48 = a5;
      id v63 = v11;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v22 = [v21 emailAddresses];
      v23 = (void *)[v22 countByEnumeratingWithState:&v70 objects:v76 count:16];
      if (v23)
      {
        uint64_t v54 = v14;
        id v44 = v8;
        v46 = v10;
        v42 = v9;
        uint64_t v24 = *(void *)v71;
        while (2)
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v71 != v24) {
              objc_enumerationMutation(v22);
            }
            v26 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);
            v27 = objc_msgSend(v26, "value", v42, v44);
            int v28 = [v27 isEqualToString:v16];

            if (v28)
            {
              v23 = [v26 identifier];
              goto LABEL_24;
            }
          }
          v23 = (void *)[v22 countByEnumeratingWithState:&v70 objects:v76 count:16];
          if (v23) {
            continue;
          }
          break;
        }
LABEL_24:
        v9 = v42;
        id v8 = v44;
        v10 = v46;
        uint64_t v14 = v54;
      }

      a5 = v48;
    }
    else
    {
      v23 = 0;
      id v63 = 0;
    }
  }
  else
  {
    v23 = 0;
    id v63 = 0;
    v21 = 0;
  }

  a4 = v56;
  if (!v21) {
    goto LABEL_28;
  }
LABEL_51:
  if (a4) {
    *a4 = v63;
  }
  if (a5) {
    *a5 = v23;
  }
  id v40 = v21;

  return v40;
}

- (PXSharedAlbumSubscriberInfo)initWithInvitationRecord:(id)a3 identifier:(id)a4 email:(id)a5 phone:(id)a6 firstName:(id)a7 lastName:(id)a8 displayName:(id)a9 isOwner:(BOOL)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  v39.receiver = self;
  v39.super_class = (Class)PXSharedAlbumSubscriberInfo;
  uint64_t v24 = [(PXSharedAlbumSubscriberInfo *)&v39 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_invitationRecord, a3);
    uint64_t v26 = [v18 copy];
    identifier = v25->_identifier;
    v25->_identifier = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    email = v25->_email;
    v25->_email = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    phone = v25->_phone;
    v25->_phone = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    firstName = v25->_firstName;
    v25->_firstName = (NSString *)v32;

    uint64_t v34 = [v22 copy];
    lastName = v25->_lastName;
    v25->_lastName = (NSString *)v34;

    uint64_t v36 = [v23 copy];
    displayName = v25->_displayName;
    v25->_displayName = (NSString *)v36;

    v25->_isOwner = a10;
  }

  return v25;
}

- (PXSharedAlbumSubscriberInfo)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedAlbumSubscriberInfo.m", 90, @"%s is not available as initializer", "-[PXSharedAlbumSubscriberInfo init]");

  return 0;
}

+ (id)_allSubscribersForAlbum:(id)a3 includeMyself:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v7 = [v5 isOwnedCloudSharedAlbum];
  v37 = v5;
  id v8 = [v5 cloudAlbumSubscriberRecords];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (a4 || ([*(id *)(*((void *)&v38 + 1) + 8 * i) isMine] & 1) == 0)
        {
          uint64_t v14 = [v13 invitationState];
          uint64_t v15 = [v14 integerValue];

          if (!v7)
          {
            if (v15 != 2) {
              continue;
            }
LABEL_12:
            [v6 addObject:v13];
            continue;
          }
          if ((unint64_t)(v15 - 1) < 4) {
            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v10);
  }

  uint64_t v16 = [v6 count];
  id v17 = v37;
  uint64_t v18 = v16 + ([v37 isOwnedCloudSharedAlbum] ^ 1);
  uint64_t v19 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
  id v20 = (void *)v19;
  if (v18)
  {
    uint64_t v21 = 0;
    uint64_t v35 = v18;
    uint64_t v36 = (void *)v19;
    do
    {
      id v22 = v17;
      id v23 = v6;
      if ([v22 isOwnedCloudSharedAlbum])
      {
        uint64_t v24 = v23;
        uint64_t v25 = v21;
      }
      else
      {
        if (!v21)
        {
          id v27 = v22;
          uint64_t v28 = [v27 cloudOwnerEmail];
          v29 = [v27 cloudOwnerFirstName];
          uint64_t v30 = [v27 cloudOwnerLastName];
          v31 = [v27 cloudOwnerDisplayNameIncludingEmail:0 allowsEmail:1];
          uint64_t v32 = [v27 cloudOwnerHashedPersonID];

          LOBYTE(v34) = 1;
          uint64_t v26 = [[PXSharedAlbumSubscriberInfo alloc] initWithInvitationRecord:0 identifier:v32 email:v28 phone:0 firstName:v29 lastName:v30 displayName:v31 isOwner:v34];

          uint64_t v18 = v35;
          id v20 = v36;

          id v17 = v37;
          goto LABEL_22;
        }
        uint64_t v25 = v21 - 1;
        uint64_t v24 = v23;
      }
      _subscriberInfoForAdjustedIndex(v24, v25);
      uint64_t v26 = (PXSharedAlbumSubscriberInfo *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      [v20 addObject:v26];
      ++v21;
    }
    while (v18 != v21);
  }

  return v20;
}

+ (id)allSubscribersForAlbumWithObjectID:(id)a3 includingCurrentUser:(BOOL)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__17347;
  uint64_t v24 = __Block_byref_object_dispose__17348;
  id v25 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __108__PXSharedAlbumSubscriberInfo_allSubscribersForAlbumWithObjectID_includingCurrentUser_managedObjectContext___block_invoke;
  v14[3] = &unk_1E5DB0AD0;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v17 = &v20;
  id v18 = a1;
  BOOL v19 = a4;
  [v11 performBlockAndWait:v14];
  id v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __108__PXSharedAlbumSubscriberInfo_allSubscribersForAlbumWithObjectID_includingCurrentUser_managedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F8A720] cloudSharedAlbumWithObjectID:*(void *)(a1 + 32) managedObjectContext:*(void *)(a1 + 40)];
  id v6 = (id)v2;
  if (v2)
  {
    id v3 = [*(id *)(a1 + 56) _allSubscribersForAlbum:v2 includeMyself:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (id)allSubscribersForAlbum:(id)a3
{
  return (id)[a1 _allSubscribersForAlbum:a3 includeMyself:1];
}

@end