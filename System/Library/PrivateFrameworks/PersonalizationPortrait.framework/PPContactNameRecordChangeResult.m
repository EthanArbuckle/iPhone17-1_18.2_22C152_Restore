@interface PPContactNameRecordChangeResult
+ (BOOL)supportsSecureCoding;
+ (id)contactNameRecordChangeResultWithChanges:(id)a3 changesTruncated:(BOOL)a4;
- (BOOL)changesTruncated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactNameRecordChangeResult:(id)a3;
- (NSArray)changes;
- (PPContactNameRecordChangeResult)initWithChanges:(id)a3 changesTruncated:(BOOL)a4;
- (PPContactNameRecordChangeResult)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPContactNameRecordChangeResult

- (void).cxx_destruct
{
}

- (BOOL)changesTruncated
{
  return self->_changesTruncated;
}

- (NSArray)changes
{
  return self->_changes;
}

- (BOOL)isEqualToContactNameRecordChangeResult:(id)a3
{
  id v4 = a3;
  v5 = (unsigned __int8 *)v4;
  if (!v4) {
    goto LABEL_4;
  }
  changes = self->_changes;
  v7 = (NSArray *)*((id *)v4 + 2);
  if (changes == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = changes;
  char v10 = [(NSArray *)v9 isEqual:v8];

  if (v10)
  {
LABEL_6:
    BOOL v11 = self->_changesTruncated == v5[8];
    goto LABEL_7;
  }
LABEL_4:
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPContactNameRecordChangeResult *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPContactNameRecordChangeResult *)self isEqualToContactNameRecordChangeResult:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  BOOL v6 = (void *)[(NSArray *)self->_changes copyWithZone:a3];
  v7 = [v5 contactNameRecordChangeResultWithChanges:v6 changesTruncated:self->_changesTruncated];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  changes = self->_changes;
  id v5 = a3;
  [v5 encodeObject:changes forKey:@"c"];
  [v5 encodeBool:self->_changesTruncated forKey:@"ct"];
}

- (PPContactNameRecordChangeResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192F97350]();
  id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"c"];
  char v10 = -[PPContactNameRecordChangeResult initWithChanges:changesTruncated:](self, "initWithChanges:changesTruncated:", v9, [v4 decodeBoolForKey:@"ct"]);

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSArray *)self->_changes hash];
  return self->_changesTruncated - v3 + 32 * v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPContactNameRecordChangeResult ct:%d c:%@>", self->_changesTruncated, self->_changes];
  return v2;
}

- (PPContactNameRecordChangeResult)initWithChanges:(id)a3 changesTruncated:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPContactNameRecordChangeResult;
  v8 = [(PPContactNameRecordChangeResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_changes, a3);
    v9->_changesTruncated = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)contactNameRecordChangeResultWithChanges:(id)a3 changesTruncated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[PPContactNameRecordChangeResult alloc] initWithChanges:v5 changesTruncated:v4];

  return v6;
}

@end