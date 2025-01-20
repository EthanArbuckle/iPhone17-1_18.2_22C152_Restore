@interface SFPerson
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contactIdentifier;
- (NSString)displayName;
- (NSString)personIdentifier;
- (NSString)photosIdentifier;
- (SFPerson)initWithCoder:(id)a3;
- (SFPerson)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setPersonIdentifier:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPhotosIdentifier:(id)a3;
@end

@implementation SFPerson

- (SFPerson)initWithProtobuf:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SFPerson;
  v5 = [(SFPerson *)&v38 init];
  if (v5)
  {
    v6 = [v4 personIdentifier];

    if (v6)
    {
      v7 = [v4 personIdentifier];
      [(SFPerson *)v5 setPersonIdentifier:v7];
    }
    v8 = [v4 contactIdentifier];

    if (v8)
    {
      v9 = [v4 contactIdentifier];
      [(SFPerson *)v5 setContactIdentifier:v9];
    }
    v10 = [v4 displayName];

    if (v10)
    {
      v11 = [v4 displayName];
      [(SFPerson *)v5 setDisplayName:v11];
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
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v40 count:16];
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
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v40 count:16];
      }
      while (v16);
    }

    [(SFPerson *)v5 setPhoneNumbers:v13];
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
    uint64_t v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
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
        uint64_t v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v23);
    }

    [(SFPerson *)v5 setEmailAddresses:v20];
    v26 = [v4 photosIdentifier];

    if (v26)
    {
      v27 = [v4 photosIdentifier];
      [(SFPerson *)v5 setPhotosIdentifier:v27];
    }
    v28 = v5;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

- (void)setPhotosIdentifier:(id)a3
{
}

- (NSString)photosIdentifier
{
  return self->_photosIdentifier;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setPersonIdentifier:(id)a3
{
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (unint64_t)hash
{
  v3 = [(SFPerson *)self personIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(SFPerson *)self contactIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFPerson *)self displayName];
  uint64_t v8 = [v7 hash];
  v9 = [(SFPerson *)self phoneNumbers];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(SFPerson *)self emailAddresses];
  uint64_t v12 = [v11 hash];
  id v13 = [(SFPerson *)self photosIdentifier];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SFPerson *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFPerson *)v5 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v6 = v5;
      v7 = [(SFPerson *)self personIdentifier];
      uint64_t v8 = [(SFPerson *)v6 personIdentifier];
      if ((v7 == 0) == (v8 != 0))
      {
        char v11 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v9 = [(SFPerson *)self personIdentifier];
      if (v9)
      {
        uint64_t v10 = [(SFPerson *)self personIdentifier];
        v57 = [(SFPerson *)v6 personIdentifier];
        if (!objc_msgSend(v10, "isEqual:"))
        {
          char v11 = 0;
          goto LABEL_34;
        }
        v54 = v10;
      }
      v56 = [(SFPerson *)self contactIdentifier];
      v55 = [(SFPerson *)v6 contactIdentifier];
      if ((v56 == 0) == (v55 != 0)) {
        goto LABEL_32;
      }
      uint64_t v12 = [(SFPerson *)self contactIdentifier];
      if (v12)
      {
        id v13 = [(SFPerson *)self contactIdentifier];
        v3 = [(SFPerson *)v6 contactIdentifier];
        if (([v13 isEqual:v3] & 1) == 0)
        {

LABEL_31:
LABEL_32:

          char v11 = 0;
          goto LABEL_33;
        }
        v51 = v13;
        v53 = v8;
        unint64_t v14 = v57;
        uint64_t v15 = v12;
      }
      else
      {
        v53 = v8;
        unint64_t v14 = v57;
        uint64_t v15 = 0;
      }
      v52 = v3;
      v57 = v14;
      uint64_t v16 = [(SFPerson *)self displayName];
      uint64_t v17 = [(SFPerson *)v6 displayName];
      uint64_t v12 = v15;
      uint64_t v8 = v53;
      if ((v16 == 0) != (v17 != 0))
      {
        id v50 = v17;
        v49 = [(SFPerson *)self displayName];
        if (v49)
        {
          v18 = [(SFPerson *)self displayName];
          v46 = [(SFPerson *)v6 displayName];
          v47 = v18;
          if (!objc_msgSend(v18, "isEqual:"))
          {
            char v11 = 0;
            uint64_t v24 = v49;
            goto LABEL_56;
          }
          v48 = v15;
        }
        else
        {
          v48 = v15;
        }
        v19 = [(SFPerson *)self phoneNumbers];
        id v20 = [(SFPerson *)v6 phoneNumbers];
        if ((v19 == 0) != (v20 != 0))
        {
          v45 = v20;
          [(SFPerson *)self phoneNumbers];
          v43 = uint64_t v12 = v48;
          v44 = v19;
          if (v43)
          {
            v21 = [(SFPerson *)self phoneNumbers];
            uint64_t v41 = [(SFPerson *)v6 phoneNumbers];
            v42 = v21;
            if (!objc_msgSend(v21, "isEqual:"))
            {
              char v11 = 0;
              uint64_t v22 = (void *)v43;
LABEL_54:

LABEL_55:
              uint64_t v24 = v49;
              if (!v49)
              {
LABEL_57:

                if (v12)
                {
                }
LABEL_33:
                uint64_t v10 = v54;
                if (!v9)
                {
LABEL_35:

                  goto LABEL_36;
                }
LABEL_34:

                goto LABEL_35;
              }
LABEL_56:

              goto LABEL_57;
            }
          }
          v25 = [(SFPerson *)self emailAddresses];
          v26 = [(SFPerson *)v6 emailAddresses];
          if ((v25 == 0) == (v26 != 0))
          {

            char v11 = 0;
            uint64_t v12 = v48;
            goto LABEL_53;
          }
          v39 = v25;
          v40 = v26;
          [(SFPerson *)self emailAddresses];
          uint64_t v38 = v12 = v48;
          if (v38
            && ([(SFPerson *)self emailAddresses],
                v27 = objc_claimAutoreleasedReturnValue(),
                [(SFPerson *)v6 emailAddresses],
                long long v36 = objc_claimAutoreleasedReturnValue(),
                long long v37 = v27,
                !objc_msgSend(v27, "isEqual:")))
          {
            char v11 = 0;
            long long v32 = (void *)v38;
          }
          else
          {
            v28 = [(SFPerson *)self photosIdentifier];
            v29 = [(SFPerson *)v6 photosIdentifier];
            if ((v28 == 0) == (v29 != 0))
            {

              char v11 = 0;
              uint64_t v12 = v48;
            }
            else
            {
              long long v35 = v29;
              uint64_t v30 = [(SFPerson *)self photosIdentifier];
              uint64_t v12 = v48;
              if (v30)
              {
                long long v34 = (void *)v30;
                long long v33 = [(SFPerson *)self photosIdentifier];
                long long v31 = [(SFPerson *)v6 photosIdentifier];
                char v11 = objc_msgSend(v33, "isEqual:");
              }
              else
              {

                char v11 = 1;
              }
            }
            long long v32 = (void *)v38;
            if (!v38) {
              goto LABEL_52;
            }
          }

LABEL_52:
LABEL_53:
          uint64_t v22 = (void *)v43;
          if (!v43) {
            goto LABEL_55;
          }
          goto LABEL_54;
        }

        uint64_t v12 = v48;
        if (v49)
        {
        }
        uint64_t v17 = v50;
      }

      if (v12)
      {
      }
      goto LABEL_31;
    }
    char v11 = 0;
  }
LABEL_37:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFPerson *)self personIdentifier];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setPersonIdentifier:v6];

  v7 = [(SFPerson *)self contactIdentifier];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setContactIdentifier:v8];

  v9 = [(SFPerson *)self displayName];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setDisplayName:v10];

  char v11 = [(SFPerson *)self phoneNumbers];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setPhoneNumbers:v12];

  id v13 = [(SFPerson *)self emailAddresses];
  unint64_t v14 = (void *)[v13 copy];
  [v4 setEmailAddresses:v14];

  uint64_t v15 = [(SFPerson *)self photosIdentifier];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setPhotosIdentifier:v16];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBPerson alloc] initWithFacade:self];
  v3 = [(_SFPBPerson *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBPerson alloc] initWithFacade:self];
  v3 = [(_SFPBPerson *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBPerson alloc] initWithFacade:self];
  v5 = [(_SFPBPerson *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBPerson alloc] initWithData:v5];
  v7 = [(SFPerson *)self initWithProtobuf:v6];

  return v7;
}

@end