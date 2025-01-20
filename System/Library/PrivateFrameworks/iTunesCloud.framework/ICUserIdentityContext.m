@interface ICUserIdentityContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICUserIdentity)identity;
- (ICUserIdentityContext)initWithCoder:(id)a3;
- (ICUserIdentityContext)initWithIdentity:(id)a3 identityStore:(id)a4;
- (ICUserIdentityStore)identityStore;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICUserIdentityContext

- (ICUserIdentity)identity
{
  return self->_identity;
}

- (ICUserIdentityStore)identityStore
{
  return self->_identityStore;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICUserIdentityContext *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(ICUserIdentityContext *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      identityStore = self->_identityStore;
      v7 = v5->_identityStore;
      if (identityStore == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = identityStore;
        BOOL v10 = [(ICUserIdentityStore *)v9 isEqual:v8];

        if (!v10)
        {
          char v11 = 0;
LABEL_15:

          goto LABEL_16;
        }
      }
      identity = v5->_identity;
      v13 = self->_identityStore;
      v14 = self->_identity;
      v15 = identity;
      v16 = v13;
      if (v14 == v15)
      {
        char v11 = 1;
      }
      else
      {
        char v11 = 0;
        if (v14 && v15) {
          char v11 = [(ICUserIdentity *)v14 isEqualToIdentity:v15 inStore:v16];
        }
      }

      goto LABEL_15;
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v66 = __ROR8__(v14 + v13, 32);
  uint64_t v69 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v63 = (v14 + v13) ^ __ROR8__(v13, 47);

  unint64_t v18 = [(ICUserIdentity *)self->_identity hashInStore:self->_identityStore];
  uint64_t v19 = (v17 + v63) ^ __ROR8__(v63, 51);
  uint64_t v20 = v66 + (v69 ^ v18);
  uint64_t v21 = __ROR8__(v69 ^ v18, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v17 + v63, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  uint64_t v67 = __ROR8__(v24, 32);
  uint64_t v70 = v23;
  unint64_t v61 = v22 ^ v18;
  uint64_t v64 = v24 ^ __ROR8__(v19, 47);
  v25 = self->_identityStore;
  uint64_t data = [(ICUserIdentityStore *)v25 hash];
  unint64_t v26 = (v61 + v64) ^ __ROR8__(v64, 51);
  uint64_t v27 = v67 + (v70 ^ data);
  uint64_t v28 = __ROR8__(v70 ^ data, 48);
  uint64_t v29 = (v27 ^ v28) + __ROR8__(v61 + v64, 32);
  uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  uint64_t v31 = v27 + v26;
  uint64_t v68 = __ROR8__(v31, 32);
  uint64_t v71 = v30;
  uint64_t v62 = v29 ^ data;
  uint64_t v65 = v31 ^ __ROR8__(v26, 47);

  uint64_t v32 = (v62 + v65) ^ __ROR8__(v65, 51);
  uint64_t v33 = v68 + (v71 ^ 0x1800000000000000);
  uint64_t v34 = __ROR8__(v71 ^ 0x1800000000000000, 48);
  uint64_t v35 = (v33 ^ v34) + __ROR8__(v62 + v65, 32);
  uint64_t v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  uint64_t v37 = v33 + v32;
  uint64_t v38 = v37 ^ __ROR8__(v32, 47);
  uint64_t v39 = (v35 ^ 0x1800000000000000) + v38;
  uint64_t v40 = v39 ^ __ROR8__(v38, 51);
  uint64_t v41 = (__ROR8__(v37, 32) ^ 0xFFLL) + v36;
  uint64_t v42 = __ROR8__(v36, 48);
  uint64_t v43 = __ROR8__(v39, 32) + (v41 ^ v42);
  uint64_t v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  uint64_t v45 = v40 + v41;
  uint64_t v46 = v45 ^ __ROR8__(v40, 47);
  uint64_t v47 = v46 + v43;
  uint64_t v48 = v47 ^ __ROR8__(v46, 51);
  uint64_t v49 = __ROR8__(v45, 32) + v44;
  uint64_t v50 = __ROR8__(v44, 48);
  uint64_t v51 = __ROR8__(v47, 32) + (v49 ^ v50);
  uint64_t v52 = v51 ^ __ROR8__(v49 ^ v50, 43);
  uint64_t v53 = v48 + v49;
  uint64_t v54 = v53 ^ __ROR8__(v48, 47);
  uint64_t v55 = v54 + v51;
  uint64_t v56 = v55 ^ __ROR8__(v54, 51);
  uint64_t v57 = __ROR8__(v53, 32) + v52;
  uint64_t v58 = __ROR8__(v52, 48);
  uint64_t v59 = __ROR8__(v55, 32) + (v57 ^ v58);
  return (v56 + v57) ^ __ROR8__(v56, 47) ^ v59 ^ __ROR8__(v56 + v57, 32) ^ v59 ^ __ROR8__(v57 ^ v58, 43);
}

- (ICUserIdentityContext)initWithIdentity:(id)a3 identityStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICUserIdentityContext;
  v9 = [(ICUserIdentityContext *)&v12 init];
  BOOL v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_identityStore, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityStore, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)encodeWithCoder:(id)a3
{
  identity = self->_identity;
  id v5 = a3;
  [v5 encodeObject:identity forKey:@"i"];
  [v5 encodeObject:self->_identityStore forKey:@"s"];
}

- (ICUserIdentityContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICUserIdentityContext;
  id v5 = [(ICUserIdentityContext *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    identity = v5->_identity;
    v5->_identity = (ICUserIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    identityStore = v5->_identityStore;
    v5->_identityStore = (ICUserIdentityStore *)v8;
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identity = %@; identityStore = %@>",
    v5,
    self,
    self->_identity,
  uint64_t v6 = self->_identityStore);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end