@interface PSGProactiveTrigger
+ (BOOL)supportsSecureCoding;
+ (id)getGivenNameQualifier:(id)a3;
+ (id)getSearchTerm:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTrigger:(id)a3;
- (NSDictionary)triggerAttributes;
- (NSString)triggerCategory;
- (PSGProactiveTrigger)initWithCoder:(id)a3;
- (PSGProactiveTrigger)initWithSourceType:(unint64_t)a3 category:(id)a4 attributes:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)triggerSourceType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSGProactiveTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerAttributes, 0);
  objc_storeStrong((id *)&self->_triggerCategory, 0);
}

- (NSDictionary)triggerAttributes
{
  return self->_triggerAttributes;
}

- (NSString)triggerCategory
{
  return self->_triggerCategory;
}

- (unint64_t)triggerSourceType
{
  return self->_triggerSourceType;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (void *)[[NSString alloc] initWithFormat:@"<PSGProactiveTrigger tst:%tu cat: %@ tas:{", self->_triggerSourceType, self->_triggerCategory];
  v5 = [v3 stringWithString:v4];

  triggerAttributes = self->_triggerAttributes;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__PSGProactiveTrigger_description__block_invoke;
  v9[3] = &unk_263FCFB10;
  id v7 = v5;
  id v10 = v7;
  [(NSDictionary *)triggerAttributes enumerateKeysAndObjectsUsingBlock:v9];
  [v7 appendString:@"}>"];

  return v7;
}

void __34__PSGProactiveTrigger_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithFormat:@"%@=%@; ", v7, v6];

  [v4 appendString:v8];
}

- (unint64_t)hash
{
  unint64_t triggerSourceType = self->_triggerSourceType;
  NSUInteger v4 = [(NSString *)self->_triggerCategory hash] - triggerSourceType + 32 * triggerSourceType;
  return [(NSDictionary *)self->_triggerAttributes hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (PSGProactiveTrigger *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PSGProactiveTrigger *)self isEqualToTrigger:v5];

  return v6;
}

- (BOOL)isEqualToTrigger:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || self->_triggerSourceType != *((void *)v4 + 1)) {
    goto LABEL_5;
  }
  triggerCategory = self->_triggerCategory;
  id v7 = (NSString *)*((id *)v4 + 2);
  if (triggerCategory == v7)
  {
  }
  else
  {
    id v8 = v7;
    v9 = triggerCategory;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0)
    {
LABEL_5:
      char v11 = 0;
      goto LABEL_11;
    }
  }
  v12 = self->_triggerAttributes;
  v13 = v12;
  if (v12 == (NSDictionary *)v5[3]) {
    char v11 = 1;
  }
  else {
    char v11 = -[NSDictionary isEqual:](v12, "isEqual:");
  }

LABEL_11:
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  BOOL v6 = (void *)v5;
  if (v5)
  {
    *(void *)(v5 + 8) = self->_triggerSourceType;
    uint64_t v7 = [(NSString *)self->_triggerCategory copyWithZone:a3];
    id v8 = (void *)v6[2];
    v6[2] = v7;

    uint64_t v9 = [(NSDictionary *)self->_triggerAttributes copyWithZone:a3];
    char v10 = (void *)v6[3];
    v6[3] = v9;
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t triggerSourceType = self->_triggerSourceType;
  id v5 = a3;
  [v5 encodeInt64:triggerSourceType forKey:@"tst"];
  [v5 encodeObject:self->_triggerCategory forKey:@"cat"];
  [v5 encodeObject:self->_triggerAttributes forKey:@"tas"];
}

- (PSGProactiveTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [v4 decodeObjectOfClass:v5 forKey:@"cat"];
  uint64_t v7 = (void *)MEMORY[0x2105116B0]();
  id v8 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v8, "initWithObjects:", v5, v9, v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"tas"];

  v14 = 0;
  if (v6 && v13)
  {
    self = -[PSGProactiveTrigger initWithSourceType:category:attributes:](self, "initWithSourceType:category:attributes:", [v4 decodeInt64ForKey:@"tst"], v6, v13);
    v14 = self;
  }

  return v14;
}

- (PSGProactiveTrigger)initWithSourceType:(unint64_t)a3 category:(id)a4 attributes:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSGProactiveTrigger;
  uint64_t v11 = [(PSGProactiveTrigger *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_unint64_t triggerSourceType = a3;
    objc_storeStrong((id *)&v11->_triggerCategory, a4);
    objc_storeStrong((id *)&v12->_triggerAttributes, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)getSearchTerm:(id)a3
{
  return (id)[a3 objectForKeyedSubscript:@"SearchTerm"];
}

+ (id)getGivenNameQualifier:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:*MEMORY[0x263F51200]];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F511E0]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end