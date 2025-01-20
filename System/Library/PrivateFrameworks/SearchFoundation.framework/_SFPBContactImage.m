@interface _SFPBContactImage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)threeDTouchEnabled;
- (NSArray)contactIdentifiers;
- (NSData)jsonData;
- (NSString)appIconBadgeBundleIdentifier;
- (_SFPBContactImage)initWithDictionary:(id)a3;
- (_SFPBContactImage)initWithFacade:(id)a3;
- (_SFPBContactImage)initWithJSON:(id)a3;
- (id)contactIdentifiersAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)contactIdentifiersCount;
- (unint64_t)hash;
- (void)addContactIdentifiers:(id)a3;
- (void)clearContactIdentifiers;
- (void)setAppIconBadgeBundleIdentifier:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setThreeDTouchEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBContactImage

- (_SFPBContactImage)initWithFacade:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBContactImage *)self init];
  if (v5)
  {
    v6 = [v4 contactIdentifiers];
    if (v6) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v7 = 0;
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = objc_msgSend(v4, "contactIdentifiers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          if (*(void *)(*((void *)&v17 + 1) + 8 * i)) {
            objc_msgSend(v7, "addObject:");
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    [(_SFPBContactImage *)v5 setContactIdentifiers:v7];
    if ([v4 hasThreeDTouchEnabled]) {
      -[_SFPBContactImage setThreeDTouchEnabled:](v5, "setThreeDTouchEnabled:", [v4 threeDTouchEnabled]);
    }
    v13 = [v4 appIconBadgeBundleIdentifier];

    if (v13)
    {
      v14 = [v4 appIconBadgeBundleIdentifier];
      [(_SFPBContactImage *)v5 setAppIconBadgeBundleIdentifier:v14];
    }
    v15 = v5;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIconBadgeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

- (NSString)appIconBadgeBundleIdentifier
{
  return self->_appIconBadgeBundleIdentifier;
}

- (BOOL)threeDTouchEnabled
{
  return self->_threeDTouchEnabled;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (_SFPBContactImage)initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_SFPBContactImage;
  v5 = [(_SFPBContactImage *)&v23 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactIdentifiers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v13 = objc_msgSend(v12, "copy", (void)v19);
              [(_SFPBContactImage *)v5 addContactIdentifiers:v13];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v9);
      }
    }
    v14 = objc_msgSend(v4, "objectForKeyedSubscript:", @"threeDTouchEnabled", (void)v19);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBContactImage setThreeDTouchEnabled:](v5, "setThreeDTouchEnabled:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"appIconBadgeBundleIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(_SFPBContactImage *)v5 setAppIconBadgeBundleIdentifier:v16];
    }
    long long v17 = v5;
  }
  return v5;
}

- (_SFPBContactImage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBContactImage *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBContactImage *)self dictionaryRepresentation];
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
  if (self->_appIconBadgeBundleIdentifier)
  {
    id v4 = [(_SFPBContactImage *)self appIconBadgeBundleIdentifier];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"appIconBadgeBundleIdentifier"];
  }
  if (self->_contactIdentifiers)
  {
    v6 = [(_SFPBContactImage *)self contactIdentifiers];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"contactIdentifiers"];
  }
  if (self->_threeDTouchEnabled)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_SFPBContactImage threeDTouchEnabled](self, "threeDTouchEnabled"));
    [v3 setObject:v8 forKeyedSubscript:@"threeDTouchEnabled"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_contactIdentifiers hash];
  if (self->_threeDTouchEnabled) {
    uint64_t v4 = 2654435761;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(NSString *)self->_appIconBadgeBundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBContactImage *)self contactIdentifiers];
  v6 = [v4 contactIdentifiers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_12;
  }
  uint64_t v7 = [(_SFPBContactImage *)self contactIdentifiers];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(_SFPBContactImage *)self contactIdentifiers];
    uint64_t v10 = [v4 contactIdentifiers];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  int threeDTouchEnabled = self->_threeDTouchEnabled;
  if (threeDTouchEnabled != [v4 threeDTouchEnabled]) {
    goto LABEL_13;
  }
  v5 = [(_SFPBContactImage *)self appIconBadgeBundleIdentifier];
  v6 = [v4 appIconBadgeBundleIdentifier];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v13 = [(_SFPBContactImage *)self appIconBadgeBundleIdentifier];
  if (!v13)
  {

LABEL_16:
    BOOL v18 = 1;
    goto LABEL_14;
  }
  v14 = (void *)v13;
  v15 = [(_SFPBContactImage *)self appIconBadgeBundleIdentifier];
  v16 = [v4 appIconBadgeBundleIdentifier];
  char v17 = [v15 isEqual:v16];

  if (v17) {
    goto LABEL_16;
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBContactImage *)self contactIdentifiers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if ([(_SFPBContactImage *)self threeDTouchEnabled]) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v10 = [(_SFPBContactImage *)self appIconBadgeBundleIdentifier];
  if (v10) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBContactImageReadFrom(self, (uint64_t)a3);
}

- (void)setAppIconBadgeBundleIdentifier:(id)a3
{
  self->_appIconBadgeBundleIdentifier = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setThreeDTouchEnabled:(BOOL)a3
{
  self->_int threeDTouchEnabled = a3;
}

- (id)contactIdentifiersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contactIdentifiers objectAtIndexedSubscript:a3];
}

- (unint64_t)contactIdentifiersCount
{
  return [(NSArray *)self->_contactIdentifiers count];
}

- (void)addContactIdentifiers:(id)a3
{
  id v4 = a3;
  contactIdentifiers = self->_contactIdentifiers;
  id v8 = v4;
  if (!contactIdentifiers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contactIdentifiers;
    self->_contactIdentifiers = v6;

    id v4 = v8;
    contactIdentifiers = self->_contactIdentifiers;
  }
  [(NSArray *)contactIdentifiers addObject:v4];
}

- (void)clearContactIdentifiers
{
}

- (void)setContactIdentifiers:(id)a3
{
  self->_contactIdentifiers = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end