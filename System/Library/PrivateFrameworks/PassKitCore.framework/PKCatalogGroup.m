@interface PKCatalogGroup
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqualToGroup:(id)a3;
- (BOOL)isUbiquitous;
- (NSMutableArray)uniqueIDs;
- (NSNumber)groupID;
- (PKCatalogGroup)init;
- (PKCatalogGroup)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setIsUbiquitous:(BOOL)a3;
- (void)setUniqueIDs:(id)a3;
@end

@implementation PKCatalogGroup

- (void)setIsUbiquitous:(BOOL)a3
{
  self->_isUbiquitous = a3;
}

- (void)setGroupID:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (NSMutableArray)uniqueIDs
{
  uniqueIDs = self->_uniqueIDs;
  if (!uniqueIDs)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5 = self->_uniqueIDs;
    self->_uniqueIDs = v4;

    uniqueIDs = self->_uniqueIDs;
  }
  return uniqueIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDs, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

- (void)encodeWithCoder:(id)a3
{
  groupID = self->_groupID;
  id v5 = a3;
  [v5 encodeObject:groupID forKey:@"groupID"];
  [v5 encodeObject:self->_uniqueIDs forKey:@"uniqueIDs"];
  objc_msgSend(NSNumber, "numberWithInteger:", -[PKCatalogGroup isUbiquitous](self, "isUbiquitous"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v6 forKey:@"isUbiquitous"];
}

- (BOOL)isUbiquitous
{
  return self->_isUbiquitous;
}

- (PKCatalogGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKCatalogGroup;
  result = [(PKCatalogGroup *)&v3 init];
  if (result) {
    result->_isUbiquitous = 1;
  }
  return result;
}

- (PKCatalogGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCatalogGroup;
  id v5 = [(PKCatalogGroup *)&v16 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x192FDC630]();
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    groupID = v5->_groupID;
    v5->_groupID = (NSNumber *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"uniqueIDs"];
    uniqueIDs = v5->_uniqueIDs;
    v5->_uniqueIDs = (NSMutableArray *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isUbiquitous"];
    v5->_isUbiquitous = [v14 BOOLValue];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToGroup:(id)a3
{
  id v4 = a3;
  groupID = self->_groupID;
  id v6 = (NSNumber *)*((void *)v4 + 2);
  if (groupID) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (groupID != v6) {
      goto LABEL_16;
    }
  }
  else if ((-[NSNumber isEqual:](groupID, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  if (!-[NSMutableArray count](self->_uniqueIDs, "count") && ![*((id *)v4 + 3) count]) {
    goto LABEL_14;
  }
  uniqueIDs = self->_uniqueIDs;
  id v9 = (NSMutableArray *)*((void *)v4 + 3);
  if (!uniqueIDs || !v9)
  {
    if (uniqueIDs == v9) {
      goto LABEL_14;
    }
LABEL_16:
    BOOL v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSMutableArray isEqual:](uniqueIDs, "isEqual:") & 1) == 0) {
    goto LABEL_16;
  }
LABEL_14:
  BOOL v10 = 1;
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCatalogGroup allocWithZone:](PKCatalogGroup, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_groupID copyWithZone:a3];
  groupID = v5->_groupID;
  v5->_groupID = (NSNumber *)v6;

  uint64_t v8 = [(NSMutableArray *)self->_uniqueIDs mutableCopyWithZone:a3];
  uniqueIDs = v5->_uniqueIDs;
  v5->_uniqueIDs = (NSMutableArray *)v8;

  v5->_isUbiquitous = self->_isUbiquitous;
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(%@) Passes: %@", self->_groupID, self->_uniqueIDs];
}

- (void)setUniqueIDs:(id)a3
{
}

@end