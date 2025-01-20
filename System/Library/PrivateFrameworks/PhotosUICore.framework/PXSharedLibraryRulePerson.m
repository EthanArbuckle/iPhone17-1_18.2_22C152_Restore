@interface PXSharedLibraryRulePerson
+ (id)rulePersonWithParticipant:(id)a3;
+ (id)rulePersonWithPerson:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)displayName;
- (PHPerson)person;
- (PXSharedLibraryParticipant)participant;
- (unint64_t)hash;
- (void)fetchStatusWithCompletion:(id)a3;
@end

@implementation PXSharedLibraryRulePerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

- (PXSharedLibraryParticipant)participant
{
  return self->_participant;
}

- (unint64_t)hash
{
  v3 = [(PXSharedLibraryRulePerson *)self participant];
  uint64_t v4 = [v3 hash];

  v5 = [(PXSharedLibraryRulePerson *)self person];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PXSharedLibraryRulePerson *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(PXSharedLibraryRulePerson *)v5 participant];
      id v7 = [(PXSharedLibraryRulePerson *)self participant];
      if (v6 == v7)
      {
      }
      else
      {
        v8 = v7;
        char v9 = [v6 isEqual:v7];

        if ((v9 & 1) == 0)
        {
          char v10 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v11 = [(PXSharedLibraryRulePerson *)v5 person];
      v12 = [(PXSharedLibraryRulePerson *)self person];
      if (v11 == v12) {
        char v10 = 1;
      }
      else {
        char v10 = [v11 isEqual:v12];
      }

      goto LABEL_13;
    }
    char v10 = 0;
  }
LABEL_14:

  return v10;
}

- (void)fetchStatusWithCompletion:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSharedLibraryRulePerson.m", 58, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [(PXSharedLibraryRulePerson *)self person];
  id v7 = v6;
  if (v6)
  {
    v8 = [v6 photoLibrary];
    id v9 = +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:v8];

    char v10 = [v9 sharedLibrary];
    v11 = [v10 sourceLibraryInfo];
    v12 = [v10 rule];
    v13 = [v12 startDate];
    v14 = [v7 uuid];
    v22[0] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke;
    v20[3] = &unk_1E5DC3EE8;
    id v21 = v5;
    id v16 = v5;
    [v11 fetchEstimatedAssetsCountsForStartDate:v13 personUUIDs:v15 completion:v20];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke_2;
    block[3] = &unk_1E5DD3128;
    id v19 = v5;
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
    char v10 = v19;
  }
}

void __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)a2;
  uint64_t v5 = *(void *)(a2 + 16);
  PXSharedLibraryTitleForCounts(&v4);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__PXSharedLibraryRulePerson_fetchStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PHPerson)person
{
  id v3 = [(PXSharedLibraryParticipant *)self->_participant person];
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    long long v4 = 0;
    person = self->_person;
    goto LABEL_7;
  }
  long long v4 = v3;

  person = v4;
  if (!v4) {
    goto LABEL_6;
  }
LABEL_7:
  id v6 = person;

  return v6;
}

- (NSString)displayName
{
  if ([(PXSharedLibraryParticipant *)self->_participant isCurrentUser])
  {
    PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Rules_You");
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    participant = self->_participant;
    if (participant)
    {
      PXSharedLibraryShortNameForParticipant(participant);
      id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      person = self->_person;
      if (person)
      {
        id v3 = [(PHPerson *)person px_localizedName];
      }
      else
      {
        id v3 = &stru_1F00B0030;
      }
    }
  }
  return (NSString *)v3;
}

+ (id)rulePersonWithPerson:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init((Class)a1);
  id v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

+ (id)rulePersonWithParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init((Class)a1);
  id v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

@end