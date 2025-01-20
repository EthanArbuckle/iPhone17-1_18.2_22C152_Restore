@interface PXSearchTokenRepresentedObject
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSString)priorityAssetUUID;
- (NSString)title;
- (PSIQueryToken)queryToken;
- (PXSearchTokenRepresentedObject)init;
- (PXSearchTokenRepresentedObject)initWithCoder:(id)a3;
- (PXSearchTokenRepresentedObject)initWithDictionary:(id)a3;
- (PXSearchTokenRepresentedObject)initWithTitle:(id)a3 queryToken:(id)a4;
- (PXSearchTokenRepresentedObject)initWithTitle:(id)a3 queryToken:(id)a4 priorityAssetUUID:(id)a5;
- (id)description;
- (id)dictionaryForArchiving;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PXSearchTokenRepresentedObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong((id *)&self->_queryToken, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (PSIQueryToken)queryToken
{
  return self->_queryToken;
}

- (NSString)title
{
  return self->_title;
}

- (PXSearchTokenRepresentedObject)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSearchTokenRepresentedObject.m", 124, @"%s is not available as initializer", "-[PXSearchTokenRepresentedObject init]");

  abort();
}

- (void)encodeWithCoder:(id)a3
{
}

- (PXSearchTokenRepresentedObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PXSearchTokenRepresentedObject;
  v5 = [(PXSearchTokenRepresentedObject *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"queryRepresentedObject"];
    queryToken = v5->_queryToken;
    v5->_queryToken = (PSIQueryToken *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v13;
  }
  return v5;
}

- (id)description
{
  v3 = objc_opt_new();
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"%@:%p\n", v5, self];

  [v3 appendFormat:@"Title: %@\n", self->_title];
  [v3 appendFormat:@"Priority Asset UUID: %@\n", self->_priorityAssetUUID];
  [v3 appendFormat:@"QueryToken: %@\n", self->_queryToken];
  return v3;
}

- (unint64_t)hash
{
  v3 = [(PXSearchTokenRepresentedObject *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(PXSearchTokenRepresentedObject *)self queryToken];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(PXSearchTokenRepresentedObject *)self title];
    id v7 = [v5 title];
    if (v6 == v7)
    {
    }
    else
    {
      int v8 = [v6 isEqualToString:v7];

      if (!v8)
      {
        char v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v10 = [(PXSearchTokenRepresentedObject *)self queryToken];
    uint64_t v11 = [v5 queryToken];
    if (v10 == v11) {
      char v9 = 1;
    }
    else {
      char v9 = [v10 isEqual:v11];
    }

    goto LABEL_11;
  }
  char v9 = 0;
LABEL_12:

  return v9;
}

- (id)dictionaryForArchiving
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(PXSearchTokenRepresentedObject *)self title];
  [v3 setObject:v4 forKeyedSubscript:@"title"];

  id v5 = (void *)MEMORY[0x1E4F28DB0];
  id v6 = [(PXSearchTokenRepresentedObject *)self queryToken];
  id v12 = 0;
  id v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v12];
  id v8 = v12;

  if (v7)
  {
    [v3 setObject:v7 forKeyedSubscript:@"queryRepresentedObject"];
    char v9 = (void *)[v3 copy];
  }
  else
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Failed to encode Query Token, error: %@", buf, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (PXSearchTokenRepresentedObject)initWithDictionary:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"title"];
  id v6 = [v4 objectForKeyedSubscript:@"queryRepresentedObject"];

  id v12 = 0;
  id v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v12];
  id v8 = v12;
  if (v7)
  {
    self = [(PXSearchTokenRepresentedObject *)self initWithTitle:v5 queryToken:v7];
    char v9 = self;
  }
  else
  {
    v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "Failed to unarchive Query Token. Unable to initalize PXSearchTokenRepresentedObject, error: %@", buf, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (PXSearchTokenRepresentedObject)initWithTitle:(id)a3 queryToken:(id)a4 priorityAssetUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchTokenRepresentedObject;
  uint64_t v11 = [(PXSearchTokenRepresentedObject *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queryToken, a4);
    uint64_t v14 = [v10 copy];
    priorityAssetUUID = v11->_priorityAssetUUID;
    v11->_priorityAssetUUID = (NSString *)v14;
  }
  return v11;
}

- (PXSearchTokenRepresentedObject)initWithTitle:(id)a3 queryToken:(id)a4
{
  return [(PXSearchTokenRepresentedObject *)self initWithTitle:a3 queryToken:a4 priorityAssetUUID:0];
}

+ (id)new
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXSearchTokenRepresentedObject.m", 120, @"%s is not available as initializer", "+[PXSearchTokenRepresentedObject new]");

  abort();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end