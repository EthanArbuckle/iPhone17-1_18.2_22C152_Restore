@interface PXSharedAlbumRecipient
- (NSArray)allEmailsArray;
- (NSArray)allPhonesArray;
- (NSNumber)stateNumber;
- (NSString)description;
- (NSString)displayAddress;
- (NSString)displayName;
- (NSString)fullName;
- (NSString)personID;
- (NSString)stateDescription;
- (PLCloudSharedAlbumInvitationRecord)invitationRecord;
- (PXSharedAlbumRecipient)initWithInvitationRecord:(id)a3;
- (PXSharedAlbumRecipient)initWithPersonID:(id)a3 firstName:(id)a4 lastName:(id)a5 fullName:(id)a6 emails:(id)a7 phones:(id)a8 state:(int)a9;
- (id)matchingContactWithKeysToFetch:(id)a3 outMatchingKey:(id *)a4 outMatchingIdentifier:(id *)a5;
- (int)state;
@end

@implementation PXSharedAlbumRecipient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_invitationRecord, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (int)state
{
  return self->_state;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (PLCloudSharedAlbumInvitationRecord)invitationRecord
{
  return self->_invitationRecord;
}

- (NSString)personID
{
  return self->_personID;
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

  uint64_t v14 = [(PXRecipient *)self firstName];
  uint64_t v15 = [(PXRecipient *)self lastName];
  v16 = [(PXRecipient *)self emailAddressString];
  v61 = [(PXRecipient *)self phoneNumberString];
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
          v78 = "-[PXSharedAlbumRecipient matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
          __int16 v79 = 2112;
          id v80 = v53;
          _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts from phone : %@", buf, 0x16u);
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
      v78 = "-[PXSharedAlbumRecipient matchingContactWithKeysToFetch:outMatchingKey:outMatchingIdentifier:]";
      __int16 v79 = 2112;
      id v80 = v58;
      _os_log_impl(&dword_1A9AE7000, v20, OS_LOG_TYPE_ERROR, "%s: Error attempting to fetch unified contacts from email : %@", buf, 0x16u);
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

- (NSString)displayAddress
{
  v3 = [(PXRecipient *)self suggestedTransport];
  v4 = [v3 address];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(PXRecipient *)self invalidAddressString];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(PXSharedAlbumRecipient *)self displayName];
  id v5 = [(PXRecipient *)self allEmails];
  v6 = [(PXRecipient *)self allPhones];
  v7 = [v3 stringWithFormat:@"displayName: \"%@\", emails: %@, phones: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (NSString)stateDescription
{
  v3 = [(PXSharedAlbumRecipient *)self invitationRecord];

  v4 = self;
  if (v3)
  {
    id v5 = [(PXSharedAlbumRecipient *)self invitationRecord];
    v6 = [v5 invitationStateDescription];
  }
  else
  {
    v6 = 0;
    switch([(PXSharedAlbumRecipient *)v4 state])
    {
      case 0:
      case 2:
        break;
      default:
        v6 = PLLocalizedFrameworkString();
        break;
    }
  }
  return (NSString *)v6;
}

- (NSNumber)stateNumber
{
  v2 = NSNumber;
  uint64_t v3 = [(PXSharedAlbumRecipient *)self state];
  return (NSNumber *)[v2 numberWithInt:v3];
}

- (NSArray)allPhonesArray
{
  v2 = [(PXRecipient *)self allPhones];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSArray)allEmailsArray
{
  v2 = [(PXRecipient *)self allEmails];
  uint64_t v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (NSString)displayName
{
  uint64_t v3 = [(PXSharedAlbumRecipient *)self fullName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PXRecipient *)self localizedName];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (PXSharedAlbumRecipient)initWithPersonID:(id)a3 firstName:(id)a4 lastName:(id)a5 fullName:(id)a6 emails:(id)a7 phones:(id)a8 state:(int)a9
{
  id v27 = a3;
  unint64_t v16 = (unint64_t)a4;
  unint64_t v17 = (unint64_t)a5;
  id v25 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v16 | v17)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    objc_msgSend(v20, "setFamilyName:", v17, v25, v27);
    [v20 setGivenName:v16];
  }
  else
  {
    id v20 = 0;
  }
  v21 = objc_msgSend(v18, "firstObject", v25);
  v22 = [v19 firstObject];
  v28.receiver = self;
  v28.super_class = (Class)PXSharedAlbumRecipient;
  v23 = [(PXRecipient *)&v28 initWithEmailAddress:v21 phoneNumber:v22 nameComponents:v20];

  if (v23)
  {
    objc_storeStrong((id *)&v23->_personID, a3);
    objc_storeStrong((id *)&v23->_fullName, a6);
    v23->_state = a9;
  }

  return v23;
}

- (PXSharedAlbumRecipient)initWithInvitationRecord:(id)a3
{
  id v5 = a3;
  v6 = [v5 inviteeHashedPersonID];
  v7 = [v5 inviteeFirstName];
  id v8 = [v5 inviteeLastName];
  v9 = [v5 inviteeFullName];
  v10 = [v5 inviteeEmails];
  v11 = [v5 inviteePhones];
  v12 = [v5 invitationState];
  LODWORD(v15) = [v12 intValue];
  v13 = [(PXSharedAlbumRecipient *)self initWithPersonID:v6 firstName:v7 lastName:v8 fullName:v9 emails:v10 phones:v11 state:v15];

  if (v13) {
    objc_storeStrong((id *)&v13->_invitationRecord, a3);
  }

  return v13;
}

@end