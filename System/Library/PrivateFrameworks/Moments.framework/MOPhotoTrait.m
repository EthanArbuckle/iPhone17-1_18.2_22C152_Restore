@interface MOPhotoTrait
+ (BOOL)supportsSecureCoding;
- (MOPhotoTrait)initWithCoder:(id)a3;
- (MOPhotoTrait)initWithIdentifier:(id)a3 name:(id)a4 relevantAssetUUIDs:(id)a5;
- (NSArray)relevantAssetUUIDs;
- (NSString)name;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setRelevantAssetUUIDs:(id)a3;
@end

@implementation MOPhotoTrait

- (MOPhotoTrait)initWithIdentifier:(id)a3 name:(id)a4 relevantAssetUUIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MOPhotoTrait;
  v12 = [(MOPhotoTrait *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_name, a4);
    uint64_t v14 = [v11 copy];
    relevantAssetUUIDs = v13->_relevantAssetUUIDs;
    v13->_relevantAssetUUIDs = (NSArray *)v14;
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MOPhotoTrait *)self identifier];
  v5 = [(MOPhotoTrait *)self name];
  v6 = [(MOPhotoTrait *)self relevantAssetUUIDs];
  v7 = [v3 stringWithFormat:@"<MOPhotoTrait localIdentifier, %@, name, %@, relevantAssetUUIDs, %@,>", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  [v5 encodeObject:self->_relevantAssetUUIDs forKey:@"relevantAssetUUIDs"];
}

- (MOPhotoTrait)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"relevantAssetUUIDs"];

  id v11 = [(MOPhotoTrait *)self initWithIdentifier:v5 name:v6 relevantAssetUUIDs:v10];
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOPhotoTrait alloc];
  id v5 = [(MOPhotoTrait *)self identifier];
  v6 = (void *)[v5 copy];
  v7 = [(MOPhotoTrait *)self name];
  uint64_t v8 = (void *)[v7 copy];
  id v9 = [(MOPhotoTrait *)self relevantAssetUUIDs];
  id v10 = (void *)[v9 copy];
  id v11 = [(MOPhotoTrait *)v4 initWithIdentifier:v6 name:v8 relevantAssetUUIDs:v10];

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)relevantAssetUUIDs
{
  return self->_relevantAssetUUIDs;
}

- (void)setRelevantAssetUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end