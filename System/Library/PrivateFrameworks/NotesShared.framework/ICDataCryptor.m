@interface ICDataCryptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICDataCryptor)initWithCoder:(id)a3;
- (ICDataCryptor)initWithObjectIdentifier:(id)a3;
- (ICDataCryptor)initWithObjectIdentifier:(id)a3 context:(id)a4;
- (NSManagedObjectContext)context;
- (NSString)objectIdentifier;
- (id)decryptData:(id)a3;
- (id)description;
- (id)encryptData:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setObjectIdentifier:(id)a3;
@end

@implementation ICDataCryptor

- (ICDataCryptor)initWithObjectIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[ICNoteContext sharedContext];
  v6 = [v5 snapshotManagedObjectContext];

  v7 = [(ICDataCryptor *)self initWithObjectIdentifier:v4 context:v6];
  return v7;
}

- (ICDataCryptor)initWithObjectIdentifier:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDataCryptor;
  v9 = [(ICDataCryptor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectIdentifier, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICDataCryptor *)self objectIdentifier];
  id v7 = [v3 stringWithFormat:@"<%@: %p, objectIdentifier: %@>", v5, self, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  v5 = ICDynamicCast();

  v6 = [(ICDataCryptor *)self objectIdentifier];
  id v7 = [v5 objectIdentifier];
  id v8 = (void *)*MEMORY[0x1E4F1D260];
  if ((void *)*MEMORY[0x1E4F1D260] == v6) {
    v9 = 0;
  }
  else {
    v9 = v6;
  }
  unint64_t v10 = v9;
  if (v8 == v7) {
    v11 = 0;
  }
  else {
    v11 = v7;
  }
  unint64_t v12 = v11;
  v13 = (void *)v12;
  if (v10 | v12)
  {
    if (v10) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14) {
      char v15 = 0;
    }
    else {
      char v15 = [(id)v10 isEqual:v12];
    }
  }
  else
  {
    char v15 = 1;
  }

  return v15;
}

- (unint64_t)hash
{
  v2 = [(ICDataCryptor *)self objectIdentifier];
  uint64_t v3 = [v2 hash];
  unint64_t v11 = ICHashWithHashKeys(v3, v4, v5, v6, v7, v8, v9, v10, 0);

  return v11;
}

- (id)encryptData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  uint64_t v5 = [(ICDataCryptor *)self context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__ICDataCryptor_encryptData___block_invoke;
  v9[3] = &unk_1E64A6068;
  v9[4] = self;
  unint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __29__ICDataCryptor_encryptData___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectIdentifier];
  uint64_t v3 = [*(id *)(a1 + 32) context];
  id v8 = +[ICCloudSyncingObject cloudObjectWithIdentifier:v2 context:v3];

  id v4 = [v8 cryptoStrategy];
  uint64_t v5 = [v4 encryptSidecarData:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)decryptData:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  id v17 = 0;
  uint64_t v5 = [(ICDataCryptor *)self context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __29__ICDataCryptor_decryptData___block_invoke;
  v9[3] = &unk_1E64A6068;
  v9[4] = self;
  unint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __29__ICDataCryptor_decryptData___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectIdentifier];
  uint64_t v3 = [*(id *)(a1 + 32) context];
  id v8 = +[ICCloudSyncingObject cloudObjectWithIdentifier:v2 context:v3];

  id v4 = [v8 cryptoStrategy];
  uint64_t v5 = [v4 decryptSidecarData:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICDataCryptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDataCryptor;
  uint64_t v5 = [(ICDataCryptor *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_objectIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    objectIdentifier = v5->_objectIdentifier;
    v5->_objectIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(ICDataCryptor *)self objectIdentifier];
  uint64_t v5 = NSStringFromSelector(sel_objectIdentifier);
  [v4 encodeObject:v6 forKey:v5];
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end