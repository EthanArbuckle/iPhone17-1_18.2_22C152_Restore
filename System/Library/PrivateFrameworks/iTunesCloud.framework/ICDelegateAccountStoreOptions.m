@interface ICDelegateAccountStoreOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptionsWithServiceEndpoint:(id)a3;
+ (id)defaultOptionsWithServiceName:(id)a3;
+ (id)singleWriterOptionsWithDatabasePath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSingleWriter;
- (ICDelegateAccountStoreOptions)initWithCoder:(id)a3;
- (NSString)XPCServiceName;
- (NSString)databasePath;
- (NSXPCListenerEndpoint)XPCEndpoint;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDatabasePath:(id)a3;
- (void)setSingleWriter:(BOOL)a3;
- (void)setXPCEndpoint:(id)a3;
- (void)setXPCServiceName:(id)a3;
@end

@implementation ICDelegateAccountStoreOptions

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v78 = __ROR8__(v14 + v13, 32);
  uint64_t v82 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v74 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_databasePath;
  uint64_t v19 = [(NSString *)v18 hash];
  uint64_t v20 = (v17 + v74) ^ __ROR8__(v74, 51);
  uint64_t v21 = v78 + (v82 ^ v19);
  uint64_t v22 = __ROR8__(v82 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v74, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v79 = __ROR8__(v25, 32);
  uint64_t v83 = v24;
  uint64_t v71 = v23 ^ v19;
  uint64_t v75 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_listenerEndpoint;
  uint64_t data = [(NSXPCListenerEndpoint *)v26 hash];
  uint64_t v27 = (v71 + v75) ^ __ROR8__(v75, 51);
  uint64_t v28 = v79 + (v83 ^ data);
  uint64_t v29 = __ROR8__(v83 ^ data, 48);
  uint64_t v30 = (v28 ^ v29) + __ROR8__(v71 + v75, 32);
  uint64_t v31 = v30 ^ __ROR8__(v28 ^ v29, 43);
  uint64_t v32 = v28 + v27;
  uint64_t v80 = __ROR8__(v32, 32);
  uint64_t v84 = v31;
  uint64_t v72 = v30 ^ data;
  uint64_t v76 = v32 ^ __ROR8__(v27, 47);

  v33 = self->_serviceName;
  uint64_t v34 = [(NSString *)v33 hash];
  uint64_t v35 = (v72 + v76) ^ __ROR8__(v76, 51);
  uint64_t v36 = v80 + (v84 ^ v34);
  uint64_t v37 = __ROR8__(v84 ^ v34, 48);
  uint64_t v38 = (v36 ^ v37) + __ROR8__(v72 + v76, 32);
  uint64_t v39 = v38 ^ __ROR8__(v36 ^ v37, 43);
  uint64_t v40 = v36 + v35;
  uint64_t v81 = __ROR8__(v40, 32);
  uint64_t v85 = v39;
  uint64_t v73 = v38 ^ v34;
  uint64_t v77 = v40 ^ __ROR8__(v35, 47);

  uint64_t v41 = self->_singleWriter | 0x2000000000000000;
  uint64_t v42 = (v73 + v77) ^ __ROR8__(v77, 51);
  uint64_t v43 = v81 + (v85 ^ (v41 + 0x400000000000000));
  uint64_t v44 = __ROR8__(v85 ^ (v41 + 0x400000000000000), 48);
  uint64_t v45 = (v43 ^ v44) + __ROR8__(v73 + v77, 32);
  uint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  uint64_t v47 = v43 + v42;
  uint64_t v48 = v47 ^ __ROR8__(v42, 47);
  uint64_t v49 = (v45 ^ (v41 + 0x400000000000000)) + v48;
  uint64_t v50 = v49 ^ __ROR8__(v48, 51);
  uint64_t v51 = (__ROR8__(v47, 32) ^ 0xFFLL) + v46;
  uint64_t v52 = __ROR8__(v46, 48);
  uint64_t v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  uint64_t v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  uint64_t v55 = v50 + v51;
  uint64_t v56 = v55 ^ __ROR8__(v50, 47);
  uint64_t v57 = v56 + v53;
  uint64_t v58 = v57 ^ __ROR8__(v56, 51);
  uint64_t v59 = __ROR8__(v55, 32) + v54;
  uint64_t v60 = __ROR8__(v54, 48);
  uint64_t v61 = __ROR8__(v57, 32) + (v59 ^ v60);
  uint64_t v62 = v61 ^ __ROR8__(v59 ^ v60, 43);
  uint64_t v63 = v58 + v59;
  uint64_t v64 = v63 ^ __ROR8__(v58, 47);
  uint64_t v65 = v64 + v61;
  uint64_t v66 = v65 ^ __ROR8__(v64, 51);
  uint64_t v67 = __ROR8__(v63, 32) + v62;
  uint64_t v68 = __ROR8__(v62, 48);
  uint64_t v69 = __ROR8__(v65, 32) + (v67 ^ v68);
  return (v66 + v67) ^ __ROR8__(v66, 47) ^ v69 ^ __ROR8__(v66 + v67, 32) ^ v69 ^ __ROR8__(v67 ^ v68, 43);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_databasePath copyWithZone:a3];
    uint64_t v7 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v6;

    objc_storeStrong((id *)(v5 + 16), self->_listenerEndpoint);
    uint64_t v8 = [(NSString *)self->_serviceName copyWithZone:a3];
    v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    *(unsigned char *)(v5 + 32) = self->_singleWriter;
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  databasePath = self->_databasePath;
  id v5 = a3;
  [v5 encodeObject:databasePath forKey:@"dp"];
  [v5 encodeObject:self->_listenerEndpoint forKey:@"le"];
  [v5 encodeObject:self->_serviceName forKey:@"sn"];
  [v5 encodeBool:self->_singleWriter forKey:@"sw"];
}

+ (id)defaultOptionsWithServiceName:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uint64_t v7 = (void *)v5[3];
    v5[3] = v6;
  }

  return v5;
}

- (ICDelegateAccountStoreOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICDelegateAccountStoreOptions;
  id v5 = [(ICDelegateAccountStoreOptions *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dp"];
    databasePath = v5->_databasePath;
    v5->_databasePath = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"le"];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sn"];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v10;

    v5->_singleWriter = [v4 decodeBoolForKey:@"sw"];
  }

  return v5;
}

- (void)setXPCServiceName:(id)a3
{
}

- (void)setXPCEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)XPCEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setSingleWriter:(BOOL)a3
{
  self->_singleWriter = a3;
}

- (BOOL)isSingleWriter
{
  return self->_singleWriter;
}

- (void)setDatabasePath:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICDelegateAccountStoreOptions *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([(ICDelegateAccountStoreOptions *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      databasePath = self->_databasePath;
      uint64_t v7 = v5->_databasePath;
      if (databasePath == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        v9 = databasePath;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_15;
        }
      }
      listenerEndpoint = self->_listenerEndpoint;
      objc_super v13 = v5->_listenerEndpoint;
      if (listenerEndpoint == v13)
      {
      }
      else
      {
        uint64_t v14 = v13;
        uint64_t v15 = listenerEndpoint;
        int v16 = [(NSXPCListenerEndpoint *)v15 isEqual:v14];

        if (!v16) {
          goto LABEL_15;
        }
      }
      serviceName = self->_serviceName;
      v18 = v5->_serviceName;
      if (serviceName == v18)
      {
      }
      else
      {
        uint64_t v19 = v18;
        uint64_t v20 = serviceName;
        int v21 = [(NSString *)v20 isEqual:v19];

        if (!v21)
        {
LABEL_15:
          BOOL v11 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      BOOL v11 = !self->_singleWriter ^ v5->_singleWriter;
      goto LABEL_18;
    }
    BOOL v11 = 0;
  }
LABEL_19:

  return v11;
}

- (NSString)XPCServiceName
{
  if (self->_serviceName) {
    return self->_serviceName;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (NSString)databasePath
{
  if (self->_databasePath) {
    return self->_databasePath;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

+ (id)singleWriterOptionsWithDatabasePath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    uint64_t v7 = (void *)v5[1];
    v5[1] = v6;

    *((unsigned char *)v5 + 32) = 1;
  }

  return v5;
}

+ (id)defaultOptionsWithServiceEndpoint:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (id *)objc_alloc_init((Class)a1);
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong(v6 + 2, a3);
  }

  return v7;
}

@end