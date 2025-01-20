@interface SYDStoreID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (SYDStoreID)initWithCoder:(id)a3;
- (SYDStoreID)initWithIdentifier:(id)a3 type:(int64_t)a4;
- (SYDTestConfiguration)testConfiguration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setTestConfiguration:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SYDStoreID

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v7 = a3;
  [v7 encodeObject:identifier forKey:@"identifier"];
  [v7 encodeInteger:self->_type forKey:@"type"];
  testConfiguration = self->_testConfiguration;
  v6 = NSStringFromSelector(sel_testConfiguration);
  [v7 encodeObject:testConfiguration forKey:v6];

  [v7 encodeObject:self->_personaUniqueString forKey:@"persona"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_testConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SYDStoreID)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYDStoreID;
  v5 = [(SYDStoreID *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v8 = objc_opt_class();
    v9 = NSStringFromSelector(sel_testConfiguration);
    uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];
    testConfiguration = v5->_testConfiguration;
    v5->_testConfiguration = (SYDTestConfiguration *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"persona"];
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v12;
  }
  return v5;
}

- (unint64_t)hash
{
  v3 = [(SYDStoreID *)self identifier];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(SYDStoreID *)self type] ^ v4;
  uint64_t v6 = [(SYDStoreID *)self testConfiguration];
  unint64_t v7 = v5 ^ [v6 hash];

  uint64_t v8 = [(SYDStoreID *)self personaUniqueString];

  if (v8)
  {
    v9 = [(SYDStoreID *)self personaUniqueString];
    v7 ^= [v9 hash];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [v5 type];
    if (v6 == [(SYDStoreID *)self type])
    {
      unint64_t v7 = [v5 identifier];
      uint64_t v8 = [(SYDStoreID *)self identifier];
      int v9 = [v7 isEqualToString:v8];

      if (v9)
      {
        uint64_t v10 = [(SYDStoreID *)self personaUniqueString];
        if (!v10) {
          goto LABEL_6;
        }
        v11 = (void *)v10;
        uint64_t v12 = [(SYDStoreID *)self personaUniqueString];
        v13 = [v5 personaUniqueString];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
LABEL_6:
          objc_super v15 = [(SYDStoreID *)self personaUniqueString];
          if (v15)
          {

LABEL_13:
            v19 = [(SYDStoreID *)self testConfiguration];
            v20 = [v5 testConfiguration];
            char v16 = SYDObjectsAreBothNilOrEqual(v19, v20);

            goto LABEL_11;
          }
          v17 = [v5 personaUniqueString];

          if (!v17) {
            goto LABEL_13;
          }
        }
      }
    }
    char v16 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v16 = 0;
LABEL_12:

  return v16;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SYDStoreID *)self identifier];
  unint64_t v7 = SYDStringForStoreType([(SYDStoreID *)self type]);
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p identifier=%@ type=%@", v5, self, v6, v7];;

  int v9 = [(SYDStoreID *)self personaUniqueString];

  if (v9)
  {
    uint64_t v10 = [(SYDStoreID *)self personaUniqueString];
    [v8 appendFormat:@" persona=%@", v10];
  }
  v11 = [(SYDStoreID *)self testConfiguration];

  if (v11)
  {
    uint64_t v12 = [(SYDStoreID *)self testConfiguration];
    [v8 appendFormat:@" testConfiguration=%@", v12];
  }
  [v8 appendString:@">"];
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (SYDTestConfiguration)testConfiguration
{
  return self->_testConfiguration;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYDStoreID)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v8 = a3;
  if (!v8)
  {
    char v16 = [MEMORY[0x263F08690] currentHandler];
    v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    [v16 handleFailureInMethod:a2, self, @"SYDStoreID.m", 37, @"Trying to instantiate a %@ without an identifier", v18 object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)SYDStoreID;
  int v9 = [(SYDStoreID *)&v19 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_type = a4;
    if (SYDIsDataSeparatedPersona())
    {
      v11 = [MEMORY[0x263F841B8] currentPersona];
      uint64_t v12 = [v11 userPersonaUniqueString];
      uint64_t v13 = [v12 copy];
      personaUniqueString = v10->_personaUniqueString;
      v10->_personaUniqueString = (NSString *)v13;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SYDStoreID allocWithZone:a3];
  id v5 = [(SYDStoreID *)self identifier];
  uint64_t v6 = [(SYDStoreID *)v4 initWithIdentifier:v5 type:[(SYDStoreID *)self type]];

  unint64_t v7 = [(SYDStoreID *)self testConfiguration];
  id v8 = (void *)[v7 copy];
  [(SYDStoreID *)v6 setTestConfiguration:v8];

  int v9 = [(SYDStoreID *)self personaUniqueString];
  uint64_t v10 = (void *)[v9 copy];
  [(SYDStoreID *)v6 setPersonaUniqueString:v10];

  return v6;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setTestConfiguration:(id)a3
{
}

- (void)setPersonaUniqueString:(id)a3
{
}

@end