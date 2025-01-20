@interface ML3PersistentIDsPredicate
+ (BOOL)supportsSecureCoding;
+ (id)predicateWithPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 shouldContain:(BOOL)a5;
+ (id)predicateWithPersistentIDs:(id)a3 shouldContain:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldContain;
- (ML3PersistentIDsPredicate)initWithCoder:(id)a3;
- (ML3PersistentIDsPredicate)initWithPersistentIDs:(id)a3 shouldContain:(BOOL)a4;
- (id)databaseStatementParameters;
- (unint64_t)hash;
- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ML3PersistentIDsPredicate

- (void).cxx_destruct
{
}

- (BOOL)shouldContain
{
  return self->_shouldContain;
}

- (id)databaseStatementParameters
{
  return self->_persistentIDs;
}

- (void)appendSQLToMutableString:(id)a3 entityClass:(Class)a4
{
  id v9 = a3;
  v6 = [(objc_class *)a4 databaseTable];
  [v9 appendString:v6];

  if (self->_shouldContain) {
    v7 = &stru_1F08D4D70;
  }
  else {
    v7 = @" NOT";
  }
  objc_msgSend(v9, "appendFormat:", @".ROWID%@ IN ("), v7;
  if ([(NSArray *)self->_persistentIDs count]) {
    [v9 appendString:@"?"];
  }
  if ([(NSArray *)self->_persistentIDs count] >= 2)
  {
    unint64_t v8 = 1;
    do
    {
      [v9 appendString:@",?"];
      ++v8;
    }
    while (v8 < [(NSArray *)self->_persistentIDs count]);
  }
  [v9 appendString:@""]);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ML3PersistentIDsPredicate *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ML3PersistentIDsPredicate;
    BOOL v6 = [(ML3Predicate *)&v8 isEqual:v4]
      && (NSUInteger v5 = [(NSArray *)self->_persistentIDs count], v5 == [(NSArray *)v4->_persistentIDs count])
      && self->_shouldContain == v4->_shouldContain
      && [(NSArray *)self->_persistentIDs isEqualToArray:v4->_persistentIDs];
  }

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)ML3PersistentIDsPredicate;
  unint64_t v3 = [(ML3Predicate *)&v5 hash] ^ self->_shouldContain;
  return v3 ^ [(NSArray *)self->_persistentIDs hash];
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ML3PersistentIDsPredicate;
  id v4 = a3;
  [(ML3Predicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldContain, @"shouldContain", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_persistentIDs forKey:@"persistentIDs"];
}

- (ML3PersistentIDsPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ML3PersistentIDsPredicate;
  objc_super v5 = [(ML3Predicate *)&v12 initWithCoder:v4];
  if (v5)
  {
    v5->_shouldContain = [v4 decodeBoolForKey:@"shouldContain"];
    BOOL v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"persistentIDs"];
    persistentIDs = v5->_persistentIDs;
    v5->_persistentIDs = (NSArray *)v9;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ML3PersistentIDsPredicate;
  [(ML3PersistentIDsPredicate *)&v2 dealloc];
}

- (ML3PersistentIDsPredicate)initWithPersistentIDs:(id)a3 shouldContain:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ML3PersistentIDsPredicate;
  objc_super v8 = [(ML3PersistentIDsPredicate *)&v11 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_shouldContain = a4;
    objc_storeStrong((id *)&v8->_persistentIDs, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)predicateWithPersistentIDs:(id)a3 shouldContain:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = [[ML3PersistentIDsPredicate alloc] initWithPersistentIDs:v5 shouldContain:v4];

  return v6;
}

+ (id)predicateWithPersistentIDs:(const int64_t *)a3 count:(unint64_t)a4 shouldContain:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v6 = a4;
  for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  {
    uint64_t v9 = *a3++;
    v10 = [NSNumber numberWithLongLong:v9];
    [i addObject:v10];
  }
  objc_super v11 = [[ML3PersistentIDsPredicate alloc] initWithPersistentIDs:i shouldContain:v5];

  return v11;
}

@end