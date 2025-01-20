@interface WBSCyclerItemRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEquivalent:(id)a3;
- (NSDictionary)extraAttributes;
- (NSString)symbolImageName;
- (NSString)title;
- (NSString)uniqueIdentifier;
- (WBSCyclerItemRepresentation)init;
- (WBSCyclerItemRepresentation)initWithCoder:(id)a3;
- (WBSCyclerItemRepresentation)initWithTitle:(id)a3 symbolImageName:(id)a4 uniqueIdentifier:(id)a5;
- (WBSCyclerItemRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pairsOfItemsWithDifferingExtraAttributesComparedTo:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExtraAttributes:(id)a3;
- (void)setSymbolImageName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
@end

@implementation WBSCyclerItemRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCyclerItemRepresentation)init
{
  return 0;
}

- (WBSCyclerItemRepresentation)initWithTitle:(id)a3 uniqueIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSCyclerItemRepresentation;
  v8 = [(WBSCyclerItemRepresentation *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    title = v8->_title;
    v8->_title = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (WBSCyclerItemRepresentation)initWithTitle:(id)a3 symbolImageName:(id)a4 uniqueIdentifier:(id)a5
{
  id v9 = a4;
  v10 = [(WBSCyclerItemRepresentation *)self initWithTitle:a3 uniqueIdentifier:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_symbolImageName, a4);
    v12 = v11;
  }

  return v11;
}

- (WBSCyclerItemRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WBSCyclerItemRepresentation;
  v5 = [(WBSCyclerItemRepresentation *)&v21 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Title"];
    uint64_t v7 = [v6 copy];
    title = v5->_title;
    v5->_title = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UniqueIdentifier"];
    uint64_t v10 = [v9 copy];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_super v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v16 = [v4 decodeObjectOfClasses:v15 forKey:@"ExtraAttributes"];
    uint64_t v17 = [v16 mutableCopy];
    extraAttributes = v5->_extraAttributes;
    v5->_extraAttributes = (NSDictionary *)v17;

    v19 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"Title"];
  [v5 encodeObject:self->_uniqueIdentifier forKey:@"UniqueIdentifier"];
  [v5 encodeObject:self->_extraAttributes forKey:@"ExtraAttributes"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (BOOL)isEquivalent:(id)a3
{
  title = self->_title;
  return title == *((NSString **)a3 + 2) || -[NSString isEqualToString:](title, "isEqualToString:");
}

- (id)pairsOfItemsWithDifferingExtraAttributesComparedTo:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_extraAttributes) {
    extraAttributes = self->_extraAttributes;
  }
  else {
    extraAttributes = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  if (v4[3]) {
    uint64_t v6 = v4[3];
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CC08];
  }
  if ([(NSDictionary *)extraAttributes isEqual:v6])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F97EE0]) initWithFirst:self second:v4];
    v10[0] = v8;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  return v7;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDictionary)extraAttributes
{
  return self->_extraAttributes;
}

- (void)setExtraAttributes:(id)a3
{
}

- (NSString)symbolImageName
{
  return self->_symbolImageName;
}

- (void)setSymbolImageName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_extraAttributes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end