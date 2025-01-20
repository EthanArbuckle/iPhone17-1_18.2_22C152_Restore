@interface PXPeopleConfirmationInfo
- (BOOL)wasNaming;
- (NSSet)otherPersons;
- (NSString)localizedName;
- (PHPerson)sourcePerson;
- (PHPerson)targetPerson;
- (PXPeopleConfirmationInfo)initWithBootstrapContext:(id)a3;
- (PXPeopleConfirmationInfo)initWithSourcePerson:(id)a3 targetPerson:(id)a4 confirmedSuggestions:(id)a5;
- (id)description;
@end

@implementation PXPeopleConfirmationInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_otherPersons, 0);
  objc_storeStrong((id *)&self->_targetPerson, 0);
  objc_storeStrong((id *)&self->_sourcePerson, 0);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)wasNaming
{
  return self->_wasNaming;
}

- (NSSet)otherPersons
{
  return self->_otherPersons;
}

- (PHPerson)targetPerson
{
  return self->_targetPerson;
}

- (PHPerson)sourcePerson
{
  return self->_sourcePerson;
}

- (id)description
{
  v23.receiver = self;
  v23.super_class = (Class)PXPeopleConfirmationInfo;
  v3 = [(PXPeopleConfirmationInfo *)&v23 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = NSString;
  v6 = [(PXPeopleConfirmationInfo *)self sourcePerson];
  v7 = [v5 stringWithFormat:@"\nsourcePerson: %@\n", v6];
  [v4 appendString:v7];

  v8 = NSString;
  v9 = [(PXPeopleConfirmationInfo *)self targetPerson];
  v10 = [v8 stringWithFormat:@"targetPerson: %@\n", v9];
  [v4 appendString:v10];

  v11 = NSString;
  v12 = [(PXPeopleConfirmationInfo *)self otherPersons];
  v13 = [v11 stringWithFormat:@"otherPersons: %@\n", v12];
  [v4 appendString:v13];

  v14 = NSString;
  BOOL v15 = [(PXPeopleConfirmationInfo *)self wasNaming];
  v16 = @"NO";
  if (v15) {
    v16 = @"YES";
  }
  v17 = v16;
  v18 = [v14 stringWithFormat:@"wasNaming: %@\n", v17];
  [v4 appendString:v18];

  v19 = NSString;
  v20 = [(PXPeopleConfirmationInfo *)self localizedName];
  v21 = [v19 stringWithFormat:@"localizedName: %@\n", v20];
  [v4 appendString:v21];

  return v4;
}

- (PXPeopleConfirmationInfo)initWithBootstrapContext:(id)a3
{
  id v4 = a3;
  [v4 sourcePerson];
  objc_claimAutoreleasedReturnValue();
  [v4 targetPerson];
  objc_claimAutoreleasedReturnValue();
  [v4 suggestionManager];
  [(id)objc_claimAutoreleasedReturnValue() currentSuggestions];
  objc_claimAutoreleasedReturnValue();
  self;
  PXMap();
}

id __53__PXPeopleConfirmationInfo_initWithBootstrapContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v12 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v12);
    v13 = objc_msgSend(v3, "px_descriptionForAssertionMessage");
    [v5 handleFailureInMethod:v10, v11, @"PXPeopleConfirmationInfo.m", 38, @"%@ should be an instance inheriting from %@, but it is %@", @"person", v9, v13 object file lineNumber description];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v5 handleFailureInMethod:v6, v7, @"PXPeopleConfirmationInfo.m", 38, @"%@ should be an instance inheriting from %@, but it is nil", @"person", v9 object file lineNumber description];
  }

LABEL_3:
  return v3;
}

- (PXPeopleConfirmationInfo)initWithSourcePerson:(id)a3 targetPerson:(id)a4 confirmedSuggestions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleConfirmationInfo;
  v12 = [(PXPeopleConfirmationInfo *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sourcePerson, a3);
    objc_storeStrong((id *)&v13->_targetPerson, a4);
    v14 = (void *)[v11 mutableCopy];
    [v14 removeObject:v13->_sourcePerson];
    [v14 removeObject:v13->_targetPerson];
    uint64_t v15 = [v14 copy];
    otherPersons = v13->_otherPersons;
    v13->_otherPersons = (NSSet *)v15;
  }
  return v13;
}

@end