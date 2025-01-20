@interface PXCMMMomentsParticipant
- (PHPerson)person;
- (PXCMMMomentsParticipant)initWithEmailAddress:(id)a3 phoneNumber:(id)a4 localizedName:(id)a5;
- (PXCMMMomentsParticipant)initWithPerson:(id)a3;
- (id)localizedName;
@end

@implementation PXCMMMomentsParticipant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_additionalLocalizedName, 0);
}

- (PHPerson)person
{
  return self->_person;
}

- (id)localizedName
{
  additionalLocalizedName = self->_additionalLocalizedName;
  if (additionalLocalizedName)
  {
    v3 = additionalLocalizedName;
  }
  else
  {
    v3 = [(PXCMMMomentsParticipant *)self localizedName];
  }
  return v3;
}

- (PXCMMMomentsParticipant)initWithPerson:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PXCMMMomentsInvitation.m", 55, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  uint64_t v7 = *MEMORY[0x1E4F1AEE0];
  v21[0] = *MEMORY[0x1E4F1ADC8];
  v21[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v9 = [v6 linkedContactWithKeysToFetch:v8];

  if (v9)
  {
    v10 = [v9 emailAddresses];
    v11 = [v10 firstObject];
    uint64_t v12 = [v11 value];

    v13 = [v9 phoneNumbers];
    v14 = [v13 firstObject];
    v15 = [v14 value];
    uint64_t v16 = [v15 stringValue];
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v12 = 0;
  }
  if (!(v12 | v16)) {
    uint64_t v12 = @"foo@bar.com";
  }
  v17 = objc_msgSend(v6, "px_localizedName");
  v18 = [(PXCMMMomentsParticipant *)self initWithEmailAddress:v12 phoneNumber:v16 localizedName:v17];

  if (v18) {
    objc_storeStrong((id *)&v18->_person, a3);
  }

  return v18;
}

- (PXCMMMomentsParticipant)initWithEmailAddress:(id)a3 phoneNumber:(id)a4 localizedName:(id)a5
{
  unint64_t v9 = (unint64_t)a3;
  unint64_t v10 = (unint64_t)a4;
  id v11 = a5;
  if (!(v9 | v10))
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PXCMMMomentsInvitation.m", 42, @"Invalid parameter not satisfying: %@", @"emailAddress || phoneNumber" object file lineNumber description];
  }
  if (v9) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  if (v9) {
    unint64_t v13 = v9;
  }
  else {
    unint64_t v13 = v10;
  }
  v19.receiver = self;
  v19.super_class = (Class)PXCMMMomentsParticipant;
  v14 = [(PXRecipient *)&v19 initWithAddress:v13 nameComponents:0 recipientKind:v12];
  if (v14)
  {
    uint64_t v15 = [v11 copy];
    additionalLocalizedName = v14->_additionalLocalizedName;
    v14->_additionalLocalizedName = (NSString *)v15;
  }
  return v14;
}

@end