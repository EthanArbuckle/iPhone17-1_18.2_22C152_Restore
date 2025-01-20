@interface ICLiveLinkIdentity
+ (BOOL)supportsSecureCoding;
+ (ICLiveLinkIdentity)identityWithIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICLiveLinkIdentity)initWithCoder:(id)a3;
- (NSPersonNameComponents)nameComponents;
- (NSString)description;
- (NSString)externalIdentifier;
- (NSURL)imageURL;
- (NSUUID)identifier;
- (id)_initWithBlock:(id)a3;
- (int64_t)serverID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageURL:(id)a3;
- (void)setNameComponents:(id)a3;
- (void)setServerID:(int64_t)a3;
@end

@implementation ICLiveLinkIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setImageURL:(id)a3
{
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setNameComponents:(id)a3
{
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void)setExternalIdentifier:(id)a3
{
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setServerID:(int64_t)a3
{
  self->_serverID = a3;
}

- (int64_t)serverID
{
  return self->_serverID;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t serverID = self->_serverID;
  id v5 = a3;
  [v5 encodeInteger:serverID forKey:@"sid"];
  [v5 encodeObject:self->_identifier forKey:@"iid"];
  [v5 encodeObject:self->_externalIdentifier forKey:@"eid"];
  [v5 encodeObject:self->_nameComponents forKey:@"nc"];
  [v5 encodeObject:self->_imageURL forKey:@"iurl"];
}

- (ICLiveLinkIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ICLiveLinkIdentity *)self init];
  if (v5)
  {
    v5->_int64_t serverID = [v4 decodeIntegerForKey:@"sid"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iid"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eid"];
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nc"];
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iurl"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (NSURL *)v12;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  int64_t serverID = self->_serverID;
  uint64_t v6 = v4 ^ 0x7465646279746573 ^ serverID;
  uint64_t v7 = (v3 ^ 0x736F6D6570736575) + (v4 ^ 0x646F72616E646F6DLL);
  uint64_t v8 = __ROR8__(v7, 32);
  uint64_t v9 = v7 ^ __ROR8__(v4 ^ 0x646F72616E646F6DLL, 51);
  uint64_t v10 = ((v3 ^ 0x6C7967656E657261) + v6) ^ __ROR8__(v6, 48);
  uint64_t v11 = (v10 + v8) ^ __ROR8__(v10, 43);
  uint64_t v12 = (v3 ^ 0x6C7967656E657261) + v6 + v9;
  uint64_t v13 = v12 ^ __ROR8__(v9, 47);
  uint64_t v14 = __ROR8__(v12, 32);
  uint64_t v15 = (v10 + v8) ^ serverID;
  uint64_t v16 = [(NSUUID *)self->_identifier hash];
  uint64_t v17 = (v15 + v13) ^ __ROR8__(v13, 51);
  uint64_t v18 = v14 + (v11 ^ v16);
  uint64_t v19 = __ROR8__(v11 ^ v16, 48);
  uint64_t v20 = (v18 ^ v19) + __ROR8__(v15 + v13, 32);
  uint64_t v82 = __ROR8__(v18 + v17, 32);
  uint64_t v86 = v20 ^ __ROR8__(v18 ^ v19, 43);
  uint64_t v21 = v20 ^ v16;
  uint64_t v78 = (v18 + v17) ^ __ROR8__(v17, 47);
  v22 = self->_externalIdentifier;
  uint64_t v23 = [(NSString *)v22 hash];
  uint64_t v24 = (v21 + v78) ^ __ROR8__(v78, 51);
  uint64_t v25 = v82 + (v86 ^ v23);
  uint64_t v26 = __ROR8__(v86 ^ v23, 48);
  uint64_t v27 = (v25 ^ v26) + __ROR8__(v21 + v78, 32);
  uint64_t v28 = v27 ^ __ROR8__(v25 ^ v26, 43);
  uint64_t v29 = v25 + v24;
  uint64_t v83 = __ROR8__(v29, 32);
  uint64_t v87 = v28;
  uint64_t v75 = v27 ^ v23;
  uint64_t v79 = v29 ^ __ROR8__(v24, 47);

  v30 = self->_nameComponents;
  uint64_t v31 = [(NSPersonNameComponents *)v30 hash];
  uint64_t v32 = (v75 + v79) ^ __ROR8__(v79, 51);
  uint64_t v33 = v83 + (v87 ^ v31);
  uint64_t v34 = __ROR8__(v87 ^ v31, 48);
  uint64_t v35 = (v33 ^ v34) + __ROR8__(v75 + v79, 32);
  uint64_t v36 = v35 ^ __ROR8__(v33 ^ v34, 43);
  uint64_t v37 = v33 + v32;
  uint64_t v84 = __ROR8__(v37, 32);
  uint64_t v88 = v36;
  uint64_t v76 = v35 ^ v31;
  uint64_t v80 = v37 ^ __ROR8__(v32, 47);

  v38 = self->_imageURL;
  uint64_t v39 = [(NSURL *)v38 hash];
  uint64_t v40 = (v76 + v80) ^ __ROR8__(v80, 51);
  uint64_t v41 = v84 + (v88 ^ v39);
  uint64_t v42 = __ROR8__(v88 ^ v39, 48);
  uint64_t v43 = (v41 ^ v42) + __ROR8__(v76 + v80, 32);
  uint64_t v44 = v43 ^ __ROR8__(v41 ^ v42, 43);
  uint64_t v45 = v41 + v40;
  uint64_t v85 = __ROR8__(v45, 32);
  uint64_t v89 = v44;
  uint64_t v77 = v43 ^ v39;
  uint64_t v81 = v45 ^ __ROR8__(v40, 47);

  uint64_t v46 = (v77 + v81) ^ __ROR8__(v81, 51);
  uint64_t v47 = v85 + (v89 ^ 0x2800000000000000);
  uint64_t v48 = __ROR8__(v89 ^ 0x2800000000000000, 48);
  uint64_t v49 = (v47 ^ v48) + __ROR8__(v77 + v81, 32);
  uint64_t v50 = v49 ^ __ROR8__(v47 ^ v48, 43);
  uint64_t v51 = v47 + v46;
  uint64_t v52 = v51 ^ __ROR8__(v46, 47);
  uint64_t v53 = (v49 ^ 0x2800000000000000) + v52;
  uint64_t v54 = v53 ^ __ROR8__(v52, 51);
  uint64_t v55 = (__ROR8__(v51, 32) ^ 0xFFLL) + v50;
  uint64_t v56 = __ROR8__(v50, 48);
  uint64_t v57 = __ROR8__(v53, 32) + (v55 ^ v56);
  uint64_t v58 = v57 ^ __ROR8__(v55 ^ v56, 43);
  uint64_t v59 = v54 + v55;
  uint64_t v60 = v59 ^ __ROR8__(v54, 47);
  uint64_t v61 = v60 + v57;
  uint64_t v62 = v61 ^ __ROR8__(v60, 51);
  uint64_t v63 = __ROR8__(v59, 32) + v58;
  uint64_t v64 = __ROR8__(v58, 48);
  uint64_t v65 = __ROR8__(v61, 32) + (v63 ^ v64);
  uint64_t v66 = v65 ^ __ROR8__(v63 ^ v64, 43);
  uint64_t v67 = v62 + v63;
  uint64_t v68 = v67 ^ __ROR8__(v62, 47);
  uint64_t v69 = v68 + v65;
  uint64_t v70 = v69 ^ __ROR8__(v68, 51);
  uint64_t v71 = __ROR8__(v67, 32) + v66;
  uint64_t v72 = __ROR8__(v66, 48);
  uint64_t v73 = __ROR8__(v69, 32) + (v71 ^ v72);
  return (v70 + v71) ^ __ROR8__(v70, 47) ^ v73 ^ __ROR8__(v70 + v71, 32) ^ v73 ^ __ROR8__(v71 ^ v72, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICLiveLinkIdentity *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = v5;
      if (self->_serverID == v5->_serverID)
      {
        identifier = self->_identifier;
        uint64_t v8 = v5->_identifier;
        if (identifier == v8)
        {
        }
        else
        {
          uint64_t v9 = v8;
          uint64_t v10 = identifier;
          int v11 = [(NSUUID *)v10 isEqual:v9];

          if (!v11) {
            goto LABEL_16;
          }
        }
        externalIdentifier = self->_externalIdentifier;
        uint64_t v14 = v6->_externalIdentifier;
        if (externalIdentifier == v14)
        {
        }
        else
        {
          uint64_t v15 = v14;
          uint64_t v16 = externalIdentifier;
          int v17 = [(NSString *)v16 isEqual:v15];

          if (!v17) {
            goto LABEL_16;
          }
        }
        nameComponents = self->_nameComponents;
        uint64_t v19 = v6->_nameComponents;
        if (nameComponents == v19)
        {
        }
        else
        {
          uint64_t v20 = v19;
          uint64_t v21 = nameComponents;
          int v22 = [(NSPersonNameComponents *)v21 isEqual:v20];

          if (!v22) {
            goto LABEL_16;
          }
        }
        imageURL = self->_imageURL;
        uint64_t v25 = v6->_imageURL;
        uint64_t v26 = imageURL;
        uint64_t v27 = v26;
        if (v26 == v25) {
          char v12 = 1;
        }
        else {
          char v12 = [(NSURL *)v26 isEqual:v25];
        }

        goto LABEL_17;
      }
LABEL_16:
      char v12 = 0;
LABEL_17:

      goto LABEL_18;
    }
    char v12 = 0;
  }
LABEL_18:

  return v12;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p serverID=%ld participantID=%@ externalID=%@>", objc_opt_class(), self, self->_serverID, self->_identifier, self->_externalIdentifier];
}

- (id)_initWithBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, ICLiveLinkIdentity *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ICLiveLinkIdentity;
  id v5 = [(ICLiveLinkIdentity *)&v7 init];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (ICLiveLinkIdentity)identityWithIdentifier:(id)a3
{
  uint64_t v3 = objc_alloc_init(ICLiveLinkIdentity);

  return v3;
}

@end