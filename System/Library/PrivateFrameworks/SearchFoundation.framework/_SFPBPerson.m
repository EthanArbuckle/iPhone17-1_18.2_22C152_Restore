@interface _SFPBPerson
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSData)jsonData;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (NSString)personIdentifier;
- (NSString)photosIdentifier;
- (_SFPBPerson)initWithDictionary:(id)a3;
- (_SFPBPerson)initWithFacade:(id)a3;
- (_SFPBPerson)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)emailAddressesAtIndex:(unint64_t)a3;
- (id)phoneNumbersAtIndex:(unint64_t)a3;
- (unint64_t)emailAddressesCount;
- (unint64_t)hash;
- (unint64_t)phoneNumbersCount;
- (void)addEmailAddresses:(id)a3;
- (void)addPhoneNumbers:(id)a3;
- (void)clearEmailAddresses;
- (void)clearPhoneNumbers;
- (void)setContactIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPhotosIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBPerson

- (_SFPBPerson)initWithFacade:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBPerson *)self init];
  if (v5)
  {
    v6 = [v4 personIdentifier];

    if (v6)
    {
      v7 = [v4 personIdentifier];
      [(_SFPBPerson *)v5 setPersonIdentifier:v7];
    }
    v8 = [v4 contactIdentifier];

    if (v8)
    {
      v9 = [v4 contactIdentifier];
      [(_SFPBPerson *)v5 setContactIdentifier:v9];
    }
    v10 = [v4 displayName];

    if (v10)
    {
      v11 = [v4 displayName];
      [(_SFPBPerson *)v5 setDisplayName:v11];
    }
    v12 = [v4 phoneNumbers];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v14 = [v4 phoneNumbers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v17) {
            objc_enumerationMutation(v14);
          }
          if (*(void *)(*((void *)&v34 + 1) + 8 * i)) {
            objc_msgSend(v13, "addObject:");
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v16);
    }

    [(_SFPBPerson *)v5 setPhoneNumbers:v13];
    v19 = [v4 emailAddresses];
    if (v19) {
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v20 = 0;
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = objc_msgSend(v4, "emailAddresses", 0);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v21);
          }
          if (*(void *)(*((void *)&v30 + 1) + 8 * j)) {
            objc_msgSend(v20, "addObject:");
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v23);
    }

    [(_SFPBPerson *)v5 setEmailAddresses:v20];
    v26 = [v4 photosIdentifier];

    if (v26)
    {
      v27 = [v4 photosIdentifier];
      [(_SFPBPerson *)v5 setPhotosIdentifier:v27];
    }
    v28 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosIdentifier, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
}

- (NSString)photosIdentifier
{
  return self->_photosIdentifier;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (_SFPBPerson)initWithDictionary:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)_SFPBPerson;
  v5 = [(_SFPBPerson *)&v43 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"personIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBPerson *)v5 setPersonIdentifier:v7];
    }
    long long v34 = v6;
    v8 = [v4 objectForKeyedSubscript:@"contactIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBPerson *)v5 setContactIdentifier:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"displayName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBPerson *)v5 setDisplayName:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"phoneNumbers"];
    objc_opt_class();
    long long v32 = v10;
    long long v33 = v8;
    if (objc_opt_isKindOfClass())
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v40;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v40 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v39 + 1) + 8 * v17);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = (void *)[v18 copy];
              [(_SFPBPerson *)v5 addPhoneNumbers:v19];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v15);
      }

      v10 = v32;
      v8 = v33;
    }
    id v20 = [v4 objectForKeyedSubscript:@"emailAddresses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v36;
        do
        {
          uint64_t v25 = 0;
          do
          {
            if (*(void *)v36 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v35 + 1) + 8 * v25);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v27 = (void *)[v26 copy];
              [(_SFPBPerson *)v5 addEmailAddresses:v27];
            }
            ++v25;
          }
          while (v23 != v25);
          uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v23);
      }

      v10 = v32;
      v8 = v33;
    }
    v28 = [v4 objectForKeyedSubscript:@"photosIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v29 = (void *)[v28 copy];
      [(_SFPBPerson *)v5 setPhotosIdentifier:v29];
    }
    long long v30 = v5;
  }
  return v5;
}

- (_SFPBPerson)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBPerson *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBPerson *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_contactIdentifier)
  {
    id v4 = [(_SFPBPerson *)self contactIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"contactIdentifier"];
  }
  if (self->_displayName)
  {
    v6 = [(_SFPBPerson *)self displayName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"displayName"];
  }
  if (self->_emailAddresses)
  {
    v8 = [(_SFPBPerson *)self emailAddresses];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"emailAddresses"];
  }
  if (self->_personIdentifier)
  {
    v10 = [(_SFPBPerson *)self personIdentifier];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"personIdentifier"];
  }
  if (self->_phoneNumbers)
  {
    v12 = [(_SFPBPerson *)self phoneNumbers];
    id v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"phoneNumbers"];
  }
  if (self->_photosIdentifier)
  {
    uint64_t v14 = [(_SFPBPerson *)self photosIdentifier];
    uint64_t v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"photosIdentifier"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_personIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_contactIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_phoneNumbers hash];
  uint64_t v7 = [(NSArray *)self->_emailAddresses hash];
  return v6 ^ v7 ^ [(NSString *)self->_photosIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  NSUInteger v5 = [(_SFPBPerson *)self personIdentifier];
  uint64_t v6 = [v4 personIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v7 = [(_SFPBPerson *)self personIdentifier];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_SFPBPerson *)self personIdentifier];
    v10 = [v4 personIdentifier];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPerson *)self contactIdentifier];
  uint64_t v6 = [v4 contactIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v12 = [(_SFPBPerson *)self contactIdentifier];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(_SFPBPerson *)self contactIdentifier];
    uint64_t v15 = [v4 contactIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPerson *)self displayName];
  uint64_t v6 = [v4 displayName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v17 = [(_SFPBPerson *)self displayName];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(_SFPBPerson *)self displayName];
    id v20 = [v4 displayName];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPerson *)self phoneNumbers];
  uint64_t v6 = [v4 phoneNumbers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v22 = [(_SFPBPerson *)self phoneNumbers];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBPerson *)self phoneNumbers];
    uint64_t v25 = [v4 phoneNumbers];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPerson *)self emailAddresses];
  uint64_t v6 = [v4 emailAddresses];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_31;
  }
  uint64_t v27 = [(_SFPBPerson *)self emailAddresses];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [(_SFPBPerson *)self emailAddresses];
    long long v30 = [v4 emailAddresses];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_32;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBPerson *)self photosIdentifier];
  uint64_t v6 = [v4 photosIdentifier];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v32 = [(_SFPBPerson *)self photosIdentifier];
    if (!v32)
    {

LABEL_35:
      BOOL v37 = 1;
      goto LABEL_33;
    }
    long long v33 = (void *)v32;
    long long v34 = [(_SFPBPerson *)self photosIdentifier];
    long long v35 = [v4 photosIdentifier];
    char v36 = [v34 isEqual:v35];

    if (v36) {
      goto LABEL_35;
    }
  }
  else
  {
LABEL_31:
  }
LABEL_32:
  BOOL v37 = 0;
LABEL_33:

  return v37;
}

- (void)writeTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBPerson *)self personIdentifier];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBPerson *)self contactIdentifier];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBPerson *)self displayName];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  v8 = [(_SFPBPerson *)self phoneNumbers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteStringField();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v10);
  }

  id v13 = [(_SFPBPerson *)self emailAddresses];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }

  v18 = [(_SFPBPerson *)self photosIdentifier];
  if (v18) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPersonReadFrom(self, (uint64_t)a3);
}

- (void)setPhotosIdentifier:(id)a3
{
  self->_photosIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_emailAddresses objectAtIndexedSubscript:a3];
}

- (unint64_t)emailAddressesCount
{
  return [(NSArray *)self->_emailAddresses count];
}

- (void)addEmailAddresses:(id)a3
{
  id v4 = a3;
  emailAddresses = self->_emailAddresses;
  id v8 = v4;
  if (!emailAddresses)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    id v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  [(NSArray *)emailAddresses addObject:v4];
}

- (void)clearEmailAddresses
{
}

- (void)setEmailAddresses:(id)a3
{
  self->_emailAddresses = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_phoneNumbers objectAtIndexedSubscript:a3];
}

- (unint64_t)phoneNumbersCount
{
  return [(NSArray *)self->_phoneNumbers count];
}

- (void)addPhoneNumbers:(id)a3
{
  id v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  id v8 = v4;
  if (!phoneNumbers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    id v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  [(NSArray *)phoneNumbers addObject:v4];
}

- (void)clearPhoneNumbers
{
}

- (void)setPhoneNumbers:(id)a3
{
  self->_phoneNumbers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDisplayName:(id)a3
{
  self->_displayName = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setContactIdentifier:(id)a3
{
  self->_contactIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setPersonIdentifier:(id)a3
{
  self->_personIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end