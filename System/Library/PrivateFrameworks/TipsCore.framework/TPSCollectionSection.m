@interface TPSCollectionSection
+ (BOOL)supportsSecureCoding;
+ (id)identifierForDictionary:(id)a3;
- (BOOL)isFeatured;
- (NSArray)collections;
- (NSString)identifier;
- (NSString)text;
- (TPSCollectionSection)initWithCoder:(id)a3;
- (TPSCollectionSection)initWithDictionary:(id)a3 collections:(id)a4;
- (TPSCollectionSection)initWithIdentifier:(id)a3 text:(id)a4 collections:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)removeCollection:(id)a3;
- (void)setCollections:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setText:(id)a3;
@end

@implementation TPSCollectionSection

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TPSCollectionSection;
  id v4 = [(TPSSerializableObject *)&v9 copyWithZone:a3];
  v5 = [(TPSCollectionSection *)self identifier];
  [v4 setIdentifier:v5];

  v6 = [(TPSCollectionSection *)self text];
  [v4 setText:v6];

  v7 = [(TPSCollectionSection *)self collections];
  [v4 setCollections:v7];

  return v4;
}

- (void)setCollections:(id)a3
{
}

- (void)setText:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)removeCollection:(id)a3
{
  id v9 = a3;
  id v4 = [(TPSCollectionSection *)self collections];
  int v5 = [v4 containsObject:v9];

  if (v5)
  {
    v6 = [(TPSCollectionSection *)self collections];
    v7 = (void *)[v6 mutableCopy];

    [v7 removeObject:v9];
    v8 = (void *)[v7 copy];
    [(TPSCollectionSection *)self setCollections:v8];
  }
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TPSCollectionSection;
  id v4 = a3;
  [(TPSSerializableObject *)&v8 encodeWithCoder:v4];
  int v5 = [(TPSCollectionSection *)self identifier];
  [v4 encodeObject:v5 forKey:@"collectionId"];

  v6 = [(TPSCollectionSection *)self text];
  [v4 encodeObject:v6 forKey:@"collectionTitle"];

  v7 = [(TPSCollectionSection *)self collections];
  [v4 encodeObject:v7 forKey:@"collections"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)collections
{
  return self->_collections;
}

- (NSString)text
{
  return self->_text;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSCollectionSection)initWithDictionary:(id)a3 collections:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TPSCollectionSection;
  objc_super v8 = [(TPSSerializableObject *)&v16 initWithDictionary:v6];
  if (v8)
  {
    uint64_t v9 = +[TPSCollectionSection identifierForDictionary:v6];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    if (![(NSString *)v8->_identifier length])
    {
      v14 = 0;
      goto LABEL_6;
    }
    v11 = [v6 TPSSafeDictionaryForKey:@"content"];
    uint64_t v12 = [v11 TPSSafeStringForKey:@"collectionTitle"];
    text = v8->_text;
    v8->_text = (NSString *)v12;

    objc_storeStrong((id *)&v8->_collections, a4);
  }
  v14 = v8;
LABEL_6:

  return v14;
}

- (TPSCollectionSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TPSCollectionSection;
  int v5 = [(TPSSerializableObject *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionId"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collectionTitle"];
    text = v5->_text;
    v5->_text = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"collections"];
    collections = v5->_collections;
    v5->_collections = (NSArray *)v13;
  }
  return v5;
}

+ (id)identifierForDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 TPSSafeStringForKey:@"collectionLabel"];
  int v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v3 TPSSafeStringForKey:@"collectionId"];
  }
  id v7 = v6;

  return v7;
}

- (TPSCollectionSection)initWithIdentifier:(id)a3 text:(id)a4 collections:(id)a5
{
  id v9 = a3;
  v10 = (__CFString *)a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TPSCollectionSection;
  uint64_t v12 = [(TPSCollectionSection *)&v16 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    if (v10) {
      v14 = v10;
    }
    else {
      v14 = &stru_1EED877F8;
    }
    objc_storeStrong((id *)&v13->_text, v14);
    objc_storeStrong((id *)&v13->_collections, a5);
  }

  return v13;
}

- (BOOL)isFeatured
{
  v2 = [(TPSCollectionSection *)self identifier];
  char v3 = [v2 isEqualToString:@"Featured"];

  return v3;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v10.receiver = self;
  v10.super_class = (Class)TPSCollectionSection;
  id v4 = [(TPSSerializableObject *)&v10 debugDescription];
  int v5 = (void *)[v3 initWithString:v4];

  id v6 = [(TPSCollectionSection *)self identifier];
  [v5 appendFormat:@"\n  %@ = %@", @"collectionId", v6];

  id v7 = [(TPSCollectionSection *)self text];
  [v5 appendFormat:@"\n  %@ = %@", @"collectionTitle", v7];

  uint64_t v8 = [(TPSCollectionSection *)self collections];
  [v5 appendFormat:@"\n  %@ = %@", @"collections", v8];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end