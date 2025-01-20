@interface PLCloudSharedAlbumInvitationRecord
+ (id)cloudSharedAlbumInvitationRecordsWithAlbumGUID:(id)a3 inLibrary:(id)a4;
+ (id)cloudSharedAlbumInvitationRecordsWithGUIDs:(id)a3 inLibrary:(id)a4;
+ (id)entityName;
+ (id)insertNewInvitationRecordIntoAlbum:(id)a3 withFirstName:(id)a4 lastName:(id)a5 fullName:(id)a6 emails:(id)a7 phones:(id)a8 inLibrary:(id)a9;
- (NSArray)inviteeEmails;
- (NSArray)inviteePhones;
- (PLCloudSharedAlbumInvitationRecord)init;
- (id)invitationStateDescription;
- (id)inviteeDisplayNameIncludingEmail:(BOOL)a3;
- (void)awakeFromInsert;
- (void)delete;
- (void)prepareForDeletion;
- (void)setInviteeEmails:(id)a3 phones:(id)a4;
- (void)willSave;
@end

@implementation PLCloudSharedAlbumInvitationRecord

- (id)invitationStateDescription
{
  v3 = [(PLCloudSharedAlbumInvitationRecord *)self invitationState];
  uint64_t v4 = [v3 integerValue];

  v5 = 0;
  switch(v4)
  {
    case 0:
    case 2:
      break;
    case 1:
      v6 = [(PLCloudSharedAlbumInvitationRecord *)self invitationStateLocal];
      [v6 integerValue];

      goto LABEL_3;
    default:
LABEL_3:
      v5 = PLLocalizedFrameworkString();
      break;
  }
  return v5;
}

- (void)setInviteeEmails:(id)a3 phones:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(PLManagedObject *)self photoLibrary];
  v8 = [v10 personInfoManager];
  v9 = [(PLCloudSharedAlbumInvitationRecord *)self cloudGUID];
  [v8 setEmails:v7 phones:v6 forInvitationRecordGUID:v9];
}

- (NSArray)inviteePhones
{
  v3 = [(PLManagedObject *)self photoLibrary];
  uint64_t v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedAlbumInvitationRecord *)self cloudGUID];
  id v6 = [v4 phonesForInvitationRecordGUID:v5];

  return (NSArray *)v6;
}

- (NSArray)inviteeEmails
{
  v3 = [(PLManagedObject *)self photoLibrary];
  uint64_t v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedAlbumInvitationRecord *)self cloudGUID];
  id v6 = [v4 emailsForInvitationRecordGUID:v5];

  return (NSArray *)v6;
}

- (id)inviteeDisplayNameIncludingEmail:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v5 = [(PLCloudSharedAlbumInvitationRecord *)self inviteeFirstName];
  id v6 = [(PLCloudSharedAlbumInvitationRecord *)self inviteeLastName];
  id v7 = [(PLCloudSharedAlbumInvitationRecord *)self inviteeFullName];
  v8 = [(PLCloudSharedAlbumInvitationRecord *)self inviteeEmails];
  v9 = [v8 firstObject];

  id v10 = [(PLCloudSharedAlbumInvitationRecord *)self inviteePhones];
  if ([v7 length])
  {
    v11 = v7;
    goto LABEL_3;
  }
  if ([v5 length] && objc_msgSend(v6, "length"))
  {
    v11 = [NSString stringWithFormat:@"%@ %@", v5, v6];
    goto LABEL_3;
  }
  if ([v5 length])
  {
    v11 = v5;
    goto LABEL_3;
  }
  if ([v6 length])
  {
    v11 = v6;
LABEL_3:
    v12 = v11;
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  if ([v9 length])
  {
    v12 = v9;
    goto LABEL_6;
  }
  if (v10 && [v10 count])
  {
    BOOL v21 = v3;
    v22 = v10;
    v23 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v12 = 0;
      uint64_t v18 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          if (v12)
          {
            uint64_t v20 = [(__CFString *)v12 stringByAppendingFormat:@" / %@", *(void *)(*((void *)&v24 + 1) + 8 * i)];

            v12 = (__CFString *)v20;
          }
          else
          {
            v12 = (__CFString *)*(id *)(*((void *)&v24 + 1) + 8 * i);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }
    else
    {
      v12 = 0;
    }

    id v10 = v22;
    id v6 = v23;
    if (!v21)
    {
LABEL_6:
      if (v12) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
LABEL_4:
    if ([v9 length])
    {
      uint64_t v13 = [(__CFString *)v12 stringByAppendingFormat:@" (%@)", v9];

      v12 = (__CFString *)v13;
    }
    goto LABEL_6;
  }
  if (v3)
  {
    v12 = 0;
    goto LABEL_4;
  }
LABEL_7:
  v12 = &stru_1EEB2EB80;
LABEL_8:

  return v12;
}

- (void)delete
{
  BOOL v3 = [(PLManagedObject *)self photoLibrary];
  uint64_t v4 = [v3 personInfoManager];
  v5 = [(PLCloudSharedAlbumInvitationRecord *)self cloudGUID];
  [v4 deleteEmailsAndPhonesForInvitationRecordGUID:v5];

  id v6 = [(PLCloudSharedAlbumInvitationRecord *)self managedObjectContext];
  [v6 deleteObject:self];
}

- (void)prepareForDeletion
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  [(PLManagedObject *)&v5 prepareForDeletion];
  BOOL v3 = [(PLCloudSharedAlbumInvitationRecord *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0)
  {
    uint64_t v4 = [v3 delayedSaveActions];
    [v4 recordInvitationRecordForCloudFeedUpdate:self];
  }
}

- (void)willSave
{
  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  [(PLManagedObject *)&v5 willSave];
  BOOL v3 = [(PLCloudSharedAlbumInvitationRecord *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 delayedSaveActions];
    [v4 recordInvitationRecordForCloudFeedUpdate:self];
  }
}

- (void)awakeFromInsert
{
  v6.receiver = self;
  v6.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  [(PLCloudSharedAlbumInvitationRecord *)&v6 awakeFromInsert];
  BOOL v3 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLCloudSharedAlbumInvitationRecord *)self setUuid:v3];

  uint64_t v4 = [MEMORY[0x1E4F8BA08] UUIDString];
  [(PLCloudSharedAlbumInvitationRecord *)self setCloudGUID:v4];

  objc_super v5 = [NSNumber numberWithInteger:1];
  [(PLCloudSharedAlbumInvitationRecord *)self setInvitationState:v5];
}

- (PLCloudSharedAlbumInvitationRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLCloudSharedAlbumInvitationRecord;
  return [(PLCloudSharedAlbumInvitationRecord *)&v3 init];
}

+ (id)cloudSharedAlbumInvitationRecordsWithAlbumGUID:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F38D3B0]();
  v9 = [v7 managedObjectContext];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"albumGUID == %@", v6];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v12 = [a1 entityInManagedObjectContext:v9];
  [v11 setEntity:v12];

  [v11 setPredicate:v10];
  uint64_t v15 = 0;
  uint64_t v13 = [v9 executeFetchRequest:v11 error:&v15];

  return v13;
}

+ (id)cloudSharedAlbumInvitationRecordsWithGUIDs:(id)a3 inLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x19F38D3B0]();
  v9 = [v7 managedObjectContext];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"cloudGUID in %@", v6];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  v12 = [a1 entityInManagedObjectContext:v9];
  [v11 setEntity:v12];

  [v11 setPredicate:v10];
  uint64_t v15 = 0;
  uint64_t v13 = [v9 executeFetchRequest:v11 error:&v15];

  return v13;
}

+ (id)insertNewInvitationRecordIntoAlbum:(id)a3 withFirstName:(id)a4 lastName:(id)a5 fullName:(id)a6 emails:(id)a7 phones:(id)a8 inLibrary:(id)a9
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v42 = a4;
  id v41 = a5;
  id v40 = a6;
  id v15 = a7;
  id v16 = a8;
  id v39 = a9;
  uint64_t v17 = [v14 cloudAlbumSubscriberRecords];
  uint64_t v18 = [v17 array];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v44 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v25 = [v24 inviteeEmails];
        int IsEqual = PLObjectIsEqual();

        long long v27 = [v24 inviteePhones];
        char v28 = PLObjectIsEqual();

        if (IsEqual && (v28 & 1) != 0)
        {
          v32 = 0;
          v36 = v19;
          v34 = v41;
          v33 = v42;
          v30 = v39;
          v35 = v40;
          goto LABEL_13;
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  uint64_t v29 = [a1 entityName];
  v30 = v39;
  v31 = [v39 managedObjectContext];
  v32 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v29, (uint64_t)v31, 0);

  [v32 setInviteeEmails:v15 phones:v16];
  v33 = v42;
  [v32 setInviteeFirstName:v42];
  v34 = v41;
  [v32 setInviteeLastName:v41];
  v35 = v40;
  [v32 setInviteeFullName:v40];
  if (v14)
  {
    [v32 setAlbum:v14];
    v36 = [v14 cloudGUID];
    [v32 setAlbumGUID:v36];
LABEL_13:
  }
  return v32;
}

+ (id)entityName
{
  return @"CloudSharedAlbumInvitationRecord";
}

@end