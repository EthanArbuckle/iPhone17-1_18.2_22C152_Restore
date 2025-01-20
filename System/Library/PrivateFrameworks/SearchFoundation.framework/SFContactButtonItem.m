@interface SFContactButtonItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)actionTypesToShow;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)contactIdentifier;
- (SFContactButtonItem)initWithCoder:(id)a3;
- (SFContactButtonItem)initWithProtobuf:(id)a3;
- (SFPerson)person;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActionTypesToShow:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setPerson:(id)a3;
@end

@implementation SFContactButtonItem

- (SFContactButtonItem)initWithProtobuf:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SFContactButtonItem;
  v5 = [(SFContactButtonItem *)&v25 init];
  if (v5)
  {
    v6 = [v4 contactIdentifier];

    if (v6)
    {
      v7 = [v4 contactIdentifier];
      [(SFContactButtonItem *)v5 setContactIdentifier:v7];
    }
    v8 = [v4 person];

    if (v8)
    {
      v9 = [SFPerson alloc];
      v10 = [v4 person];
      v11 = [(SFPerson *)v9 initWithProtobuf:v10];
      [(SFContactButtonItem *)v5 setPerson:v11];
    }
    v12 = [v4 actionTypesToShows];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v14 = objc_msgSend(v4, "actionTypesToShows", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          if (*(void *)(*((void *)&v21 + 1) + 8 * i)) {
            objc_msgSend(v13, "addObject:");
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v16);
    }

    [(SFContactButtonItem *)v5 setActionTypesToShow:v13];
    if ([v4 uniqueId]) {
      -[SFButtonItem setUniqueId:](v5, "setUniqueId:", [v4 uniqueId]);
    }
    v19 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTypesToShow, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)setActionTypesToShow:(id)a3
{
}

- (NSArray)actionTypesToShow
{
  return self->_actionTypesToShow;
}

- (void)setPerson:(id)a3
{
}

- (SFPerson)person
{
  return self->_person;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)SFContactButtonItem;
  unint64_t v3 = [(SFButtonItem *)&v12 hash];
  id v4 = [(SFContactButtonItem *)self contactIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(SFContactButtonItem *)self person];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFContactButtonItem *)self actionTypesToShow];
  uint64_t v9 = v7 ^ [v8 hash];
  unint64_t v10 = v9 ^ [(SFButtonItem *)self uniqueId] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFContactButtonItem *)a3;
  if (self == v5)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(SFContactButtonItem *)v5 isMemberOfClass:objc_opt_class()])
    {
      v33.receiver = self;
      v33.super_class = (Class)SFContactButtonItem;
      if ([(SFButtonItem *)&v33 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFContactButtonItem *)self contactIdentifier];
        v8 = [(SFContactButtonItem *)v6 contactIdentifier];
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v9 = [(SFContactButtonItem *)self contactIdentifier];
        if (v9)
        {
          unint64_t v10 = [(SFContactButtonItem *)self contactIdentifier];
          unint64_t v3 = [(SFContactButtonItem *)v6 contactIdentifier];
          if (![v10 isEqual:v3])
          {
            BOOL v11 = 0;
            goto LABEL_31;
          }
          v32 = v10;
        }
        objc_super v12 = [(SFContactButtonItem *)self person];
        id v13 = [(SFContactButtonItem *)v6 person];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          BOOL v11 = 0;
          goto LABEL_30;
        }
        uint64_t v15 = [(SFContactButtonItem *)self person];
        if (v15)
        {
          v26 = v12;
          uint64_t v16 = [(SFContactButtonItem *)self person];
          v29 = [(SFContactButtonItem *)v6 person];
          v30 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            BOOL v11 = 0;
            objc_super v12 = v26;
            goto LABEL_28;
          }
          v28 = v3;
          v31 = v15;
          objc_super v12 = v26;
        }
        else
        {
          v28 = v3;
          v31 = 0;
        }
        uint64_t v17 = [(SFContactButtonItem *)self actionTypesToShow];
        v18 = [(SFContactButtonItem *)v6 actionTypesToShow];
        if ((v17 == 0) == (v18 != 0))
        {

          BOOL v11 = 0;
          uint64_t v15 = v31;
          unint64_t v3 = v28;
          if (!v31) {
            goto LABEL_29;
          }
          goto LABEL_28;
        }
        long long v24 = v18;
        objc_super v25 = v17;
        [(SFContactButtonItem *)self actionTypesToShow];
        v27 = uint64_t v15 = v31;
        if (!v27
          || ([(SFContactButtonItem *)self actionTypesToShow],
              v19 = objc_claimAutoreleasedReturnValue(),
              [(SFContactButtonItem *)v6 actionTypesToShow],
              long long v22 = objc_claimAutoreleasedReturnValue(),
              long long v23 = v19,
              objc_msgSend(v19, "isEqual:")))
        {
          unint64_t v3 = v28;
          unint64_t v20 = [(SFButtonItem *)self uniqueId];
          BOOL v11 = v20 == [(SFButtonItem *)v6 uniqueId];
          if (!v27) {
            goto LABEL_27;
          }
        }
        else
        {
          BOOL v11 = 0;
          unint64_t v3 = v28;
        }

LABEL_27:
        if (!v31)
        {
LABEL_29:

LABEL_30:
          unint64_t v10 = v32;
          if (!v9)
          {
LABEL_32:

            goto LABEL_33;
          }
LABEL_31:

          goto LABEL_32;
        }
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v11 = 0;
  }
LABEL_34:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFContactButtonItem;
  id v4 = [(SFButtonItem *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFContactButtonItem *)self contactIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setContactIdentifier:v6];

  uint64_t v7 = [(SFContactButtonItem *)self person];
  v8 = (void *)[v7 copy];
  [v4 setPerson:v8];

  uint64_t v9 = [(SFContactButtonItem *)self actionTypesToShow];
  unint64_t v10 = (void *)[v9 copy];
  [v4 setActionTypesToShow:v10];

  objc_msgSend(v4, "setUniqueId:", -[SFButtonItem uniqueId](self, "uniqueId"));
  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBContactButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBContactButtonItem *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBContactButtonItem alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBContactButtonItem *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBContactButtonItem alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBContactButtonItem *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFContactButtonItem)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBContactButtonItem alloc] initWithData:v5];
  uint64_t v7 = [(SFContactButtonItem *)self initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end