@interface MRLanguageOption
+ (BOOL)supportsSecureCoding;
+ (id)automaticLanguageOptionWithType:(unsigned int)a3;
- (BOOL)hasType;
- (BOOL)isAutomaticLanguageOptionWithType:(unsigned int)a3;
- (BOOL)isEqual:(id)a3;
- (MRLanguageOption)initWithCoder:(id)a3;
- (MRLanguageOption)initWithData:(id)a3;
- (MRLanguageOption)initWithProtobuf:(id)a3;
- (MRLanguageOption)initWithType:(unsigned int)a3 languageTag:(id)a4 characteristics:(id)a5 displayName:(id)a6 identifier:(id)a7;
- (NSArray)characteristics;
- (NSData)data;
- (NSDictionary)dictionaryRepresentation;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)languageTag;
- (_MRLanguageOptionProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCharacteristics:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguageTag:(id)a3;
- (void)setType:(unsigned int)a3;
@end

@implementation MRLanguageOption

+ (id)automaticLanguageOptionWithType:(unsigned int)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithType:*(void *)&a3 languageTag:@"__AUTO__" characteristics:0 displayName:0 identifier:0];

  return v3;
}

- (MRLanguageOption)initWithType:(unsigned int)a3 languageTag:(id)a4 characteristics:(id)a5 displayName:(id)a6 identifier:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MRLanguageOption;
  v16 = [(MRLanguageOption *)&v27 init];
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_hasType = 1;
    uint64_t v18 = [v12 copy];
    languageTag = v17->_languageTag;
    v17->_languageTag = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    characteristics = v17->_characteristics;
    v17->_characteristics = (NSArray *)v20;

    uint64_t v22 = [v14 copy];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v24;
  }
  return v17;
}

- (MRLanguageOption)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)MRLanguageOption;
    v5 = [(MRLanguageOption *)&v20 init];
    if (v5)
    {
      v5->_type = [v4 type];
      v5->_hasType = [v4 hasType];
      v6 = [v4 languageTag];
      uint64_t v7 = [v6 copy];
      languageTag = v5->_languageTag;
      v5->_languageTag = (NSString *)v7;

      v9 = [v4 characteristics];
      uint64_t v10 = [v9 copy];
      characteristics = v5->_characteristics;
      v5->_characteristics = (NSArray *)v10;

      id v12 = [v4 displayName];
      uint64_t v13 = [v12 copy];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v13;

      id v15 = [v4 identifier];
      uint64_t v16 = [v15 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v16;
    }
    self = v5;
    uint64_t v18 = self;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (MRLanguageOption)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[_MRLanguageOptionProtobuf alloc] initWithData:v4];

    self = [(MRLanguageOption *)self initWithProtobuf:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_MRLanguageOptionProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRLanguageOptionProtobuf);
  v3->_type = [(MRLanguageOption *)self type];
  *(unsigned char *)&v3->_has = *(unsigned char *)&v3->_has & 0xFE | [(MRLanguageOption *)self hasType];
  id v4 = [(MRLanguageOption *)self languageTag];
  [(_MRLanguageOptionProtobuf *)v3 setLanguageTag:v4];

  v5 = [(MRLanguageOption *)self characteristics];
  v6 = (void *)[v5 mutableCopy];
  [(_MRLanguageOptionProtobuf *)v3 setCharacteristics:v6];

  uint64_t v7 = [(MRLanguageOption *)self displayName];
  [(_MRLanguageOptionProtobuf *)v3 setDisplayName:v7];

  v8 = [(MRLanguageOption *)self identifier];
  [(_MRLanguageOptionProtobuf *)v3 setIdentifier:v8];

  return v3;
}

- (NSData)data
{
  v2 = [(MRLanguageOption *)self protobuf];
  v3 = [v2 data];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MRLanguageOption *)self hasType])
  {
    id v4 = MRLanguageOptionTypeCopyDescription([(MRLanguageOption *)self type]);
    [v3 setObject:v4 forKeyedSubscript:@"type"];
  }
  v5 = [(MRLanguageOption *)self languageTag];
  [v3 setObject:v5 forKeyedSubscript:@"languageTag"];

  v6 = [(MRLanguageOption *)self characteristics];
  [v3 setObject:v6 forKeyedSubscript:@"characteristics"];

  uint64_t v7 = [(MRLanguageOption *)self displayName];
  [v3 setObject:v7 forKeyedSubscript:@"displayName"];

  v8 = [(MRLanguageOption *)self identifier];
  [v3 setObject:v8 forKeyedSubscript:@"identifier"];

  return (NSDictionary *)v3;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
  self->_hasType = 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRLanguageOption *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_18;
    }
    BOOL v5 = [(MRLanguageOption *)v4 hasType];
    if (v5 != [(MRLanguageOption *)self hasType]) {
      goto LABEL_18;
    }
    if ([(MRLanguageOption *)v4 hasType])
    {
      if ([(MRLanguageOption *)self hasType])
      {
        unsigned int v6 = [(MRLanguageOption *)v4 type];
        if (v6 != [(MRLanguageOption *)self type]) {
          goto LABEL_18;
        }
      }
    }
    id v7 = [(MRLanguageOption *)v4 languageTag];
    id v8 = [(MRLanguageOption *)self languageTag];
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      char v10 = [v7 isEqual:v8];

      if ((v10 & 1) == 0) {
        goto LABEL_18;
      }
    }
    id v12 = [(MRLanguageOption *)v4 displayName];
    id v13 = [(MRLanguageOption *)self displayName];
    if (v12 == v13)
    {
    }
    else
    {
      id v14 = v13;
      char v15 = [v12 isEqual:v13];

      if ((v15 & 1) == 0) {
        goto LABEL_18;
      }
    }
    id v16 = [(MRLanguageOption *)v4 identifier];
    id v17 = [(MRLanguageOption *)self identifier];
    if (v16 == v17)
    {
    }
    else
    {
      uint64_t v18 = v17;
      char v19 = [v16 isEqual:v17];

      if ((v19 & 1) == 0)
      {
LABEL_18:
        char v11 = 0;
        goto LABEL_19;
      }
    }
    v21 = [(MRLanguageOption *)v4 characteristics];
    uint64_t v22 = [(MRLanguageOption *)self characteristics];
    if (v21 == v22) {
      char v11 = 1;
    }
    else {
      char v11 = [v21 isEqual:v22];
    }
  }
LABEL_19:

  return v11;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MRLanguageOption *)self dictionaryRepresentation];
  unsigned int v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ([(MRLanguageOption *)self hasType]) {
    objc_msgSend(v5, "setType:", -[MRLanguageOption type](self, "type"));
  }
  unsigned int v6 = [(MRLanguageOption *)self languageTag];
  id v7 = (void *)[v6 copyWithZone:a3];
  [v5 setLanguageTag:v7];

  id v8 = [(MRLanguageOption *)self characteristics];
  v9 = (void *)[v8 copyWithZone:a3];
  [v5 setCharacteristics:v9];

  char v10 = [(MRLanguageOption *)self displayName];
  char v11 = (void *)[v10 copyWithZone:a3];
  [v5 setDisplayName:v11];

  id v12 = [(MRLanguageOption *)self identifier];
  id v13 = (void *)[v12 copyWithZone:a3];
  [v5 setIdentifier:v13];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if ([v9 allowsKeyedCoding])
  {
    objc_msgSend(v9, "encodeInt32:forKey:", -[MRLanguageOption type](self, "type"), @"kMRLanguageOptionType");
    uint64_t v4 = [(MRLanguageOption *)self languageTag];
    [v9 encodeObject:v4 forKey:@"kMRLanguageOptionLanguageTag"];

    BOOL v5 = [(MRLanguageOption *)self characteristics];
    [v9 encodeObject:v5 forKey:@"KMRLanguageOptionCharacteristics"];

    unsigned int v6 = [(MRLanguageOption *)self displayName];
    [v9 encodeObject:v6 forKey:@"kMRLanguageOptionDisplayName"];

    id v7 = [(MRLanguageOption *)self identifier];
    [v9 encodeObject:v7 forKey:@"kMRLanguageOptionIdentifier"];

    id v8 = [(MRLanguageOption *)self protobuf];
    [v9 encodeObject:v8 forKey:@"protobuf"];
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"coder must support key-value coding"];
  }
}

- (MRLanguageOption)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRLanguageOption;
  BOOL v5 = [(MRLanguageOption *)&v15 init];
  if (!v5) {
    goto LABEL_12;
  }
  if (![v4 allowsKeyedCoding])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:38];
    [v4 failWithError:v8];
LABEL_11:

LABEL_12:
    id v7 = v5;
    goto LABEL_13;
  }
  unsigned int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = _MRLogForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MRLanguageOption initWithCoder:]((uint64_t)v6, v9);
    }

    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_10:
    -[MRLanguageOption setType:](v5, "setType:", [v4 decodeInt32ForKey:@"kMRLanguageOptionType"]);
    char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMRLanguageOptionLanguageTag"];
    [(MRLanguageOption *)v5 setLanguageTag:v10];

    char v11 = MSVPropertyListDataClasses();
    id v12 = [v4 decodeObjectOfClasses:v11 forKey:@"KMRLanguageOptionCharacteristics"];
    [(MRLanguageOption *)v5 setCharacteristics:v12];

    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMRLanguageOptionDisplayName"];
    [(MRLanguageOption *)v5 setDisplayName:v13];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kMRLanguageOptionIdentifier"];
    [(MRLanguageOption *)v5 setIdentifier:v8];
    goto LABEL_11;
  }
  id v7 = [(MRLanguageOption *)v5 initWithProtobuf:v6];

LABEL_13:
  return v7;
}

- (BOOL)isAutomaticLanguageOptionWithType:(unsigned int)a3
{
  if ([(MRLanguageOption *)self type] != a3) {
    return 0;
  }
  id v4 = [(MRLanguageOption *)self characteristics];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 0;
  }
  unsigned int v6 = [(MRLanguageOption *)self displayName];
  uint64_t v7 = [v6 length];

  if (v7) {
    return 0;
  }
  id v8 = [(MRLanguageOption *)self identifier];
  uint64_t v9 = [v8 length];

  if (v9) {
    return 0;
  }
  char v11 = [(MRLanguageOption *)self languageTag];
  char v12 = [v11 isEqualToString:@"__AUTO__"];

  return v12;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)hasType
{
  return self->_hasType;
}

- (void)setHasType:(BOOL)a3
{
  self->_hasType = a3;
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);

  objc_storeStrong((id *)&self->_languageTag, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 138543362;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl(&dword_194F3C000, a2, OS_LOG_TYPE_ERROR, "Unable to decode object, got class %{public}@", (uint8_t *)&v4, 0xCu);
}

@end