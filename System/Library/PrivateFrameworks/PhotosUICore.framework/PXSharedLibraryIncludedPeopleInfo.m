@interface PXSharedLibraryIncludedPeopleInfo
+ (id)personForParticipant:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)name;
- (PHPerson)person;
- (PXSharedLibraryIncludedPeopleInfo)initWithParticipant:(id)a3;
- (PXSharedLibraryIncludedPeopleInfo)initWithParticipant:(id)a3 person:(id)a4;
- (PXSharedLibraryIncludedPeopleInfo)initWithPerson:(id)a3;
- (PXSharedLibraryUIParticipant)participant;
- (id)_initWithParticipant:(id)a3 person:(id)a4;
- (unint64_t)hash;
@end

@implementation PXSharedLibraryIncludedPeopleInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

- (PHPerson)person
{
  return self->_person;
}

- (PXSharedLibraryUIParticipant)participant
{
  return self->_participant;
}

- (NSPersonNameComponents)nameComponents
{
  v3 = [(PXSharedLibraryIncludedPeopleInfo *)self participant];
  v4 = [v3 nameComponents];

  if (!v4)
  {
    v5 = [(PXSharedLibraryIncludedPeopleInfo *)self person];
    v4 = objc_msgSend(v5, "px_nameComponents");
  }
  return (NSPersonNameComponents *)v4;
}

- (NSString)name
{
  v3 = [(PXSharedLibraryIncludedPeopleInfo *)self participant];
  v4 = [(PXSharedLibraryIncludedPeopleInfo *)self person];
  objc_msgSend(v4, "px_localizedName");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (![(__CFString *)v5 length])
  {
    v6 = [v3 name];

    if ([(__CFString *)v6 length])
    {
      v5 = v6;
    }
    else
    {
      v5 = [v3 appleIDAddress];
    }
  }
  if (!v5) {
    v5 = &stru_1F00B0030;
  }

  return (NSString *)v5;
}

- (unint64_t)hash
{
  v3 = [(PXSharedLibraryIncludedPeopleInfo *)self participant];
  uint64_t v4 = [v3 hash];
  v5 = [(PXSharedLibraryIncludedPeopleInfo *)self person];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(PXSharedLibraryIncludedPeopleInfo *)self person];
    uint64_t v7 = [v5 person];
    if (v6 | v7)
    {
      v8 = [(id)v6 localIdentifier];
      [(id)v7 localIdentifier];
    }
    else
    {
      v8 = [(PXSharedLibraryIncludedPeopleInfo *)self participant];
      [v5 participant];
    uint64_t v9 = };
    if (v8 == (void *)v9)
    {
      char v10 = 1;
      v11 = v8;
    }
    else
    {
      v11 = (void *)v9;
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_initWithParticipant:(id)a3 person:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryIncludedPeopleInfo;
  uint64_t v9 = [(PXSharedLibraryIncludedPeopleInfo *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_participant, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (PXSharedLibraryIncludedPeopleInfo)initWithParticipant:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 61, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];
  }
  uint64_t v6 = [(PXSharedLibraryIncludedPeopleInfo *)self _initWithParticipant:v5 person:0];

  return v6;
}

- (PXSharedLibraryIncludedPeopleInfo)initWithParticipant:(id)a3 person:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (!v7)
  {
    objc_super v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 55, @"Invalid parameter not satisfying: %@", @"participant" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 56, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  char v10 = [(PXSharedLibraryIncludedPeopleInfo *)self _initWithParticipant:v7 person:v9];

  return v10;
}

- (PXSharedLibraryIncludedPeopleInfo)initWithPerson:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PXSharedLibraryIncludedPeopleDataSourceManager.m", 50, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  uint64_t v6 = [(PXSharedLibraryIncludedPeopleInfo *)self _initWithParticipant:0 person:v5];

  return v6;
}

+ (id)personForParticipant:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [a3 contact];
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_systemPhotoLibrary");
    id v5 = [v4 librarySpecificFetchOptions];

    uint64_t v6 = (void *)MEMORY[0x1E4F391F0];
    v11[0] = v3;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    id v8 = [v6 fetchPersonsForContacts:v7 options:v5];

    uint64_t v9 = [v8 firstObject];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end