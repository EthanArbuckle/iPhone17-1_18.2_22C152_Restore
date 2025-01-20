@interface ICMusicSubscriptionStatusCacheKey
- (BOOL)isEqual:(id)a3;
- (ICMusicSubscriptionStatusCacheKey)init;
- (ICMusicSubscriptionStatusCacheKey)initWithDictionaryRepresentation:(id)a3 requiringDSID:(BOOL)a4;
- (ICMusicSubscriptionStatusCacheKey)initWithStringRepresentation:(id)a3;
- (NSNumber)DSID;
- (NSString)phoneNumber;
- (NSString)storefrontIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentationIncludingDSID:(BOOL)a3;
- (id)stringRepresentation;
- (unint64_t)hash;
- (void)setDSID:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setStorefrontIdentifier:(id)a3;
@end

@implementation ICMusicSubscriptionStatusCacheKey

- (void)setDSID:(id)a3
{
  v5 = (NSNumber *)a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"ICMusicSubscriptionStatusCacheKey.m", 77, @"Cannot set a nil DSID on an instance of %@", v9 object file lineNumber description];
  }
  DSID = self->_DSID;
  self->_DSID = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);

  objc_storeStrong((id *)&self->_DSID, 0);
}

- (void)setStorefrontIdentifier:(id)a3
{
  v5 = (NSString *)a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"ICMusicSubscriptionStatusCacheKey.m", 87, @"Cannot set a nil storefrontIdentifier on an instance of %@", v9 object file lineNumber description];
  }
  storefrontIdentifier = self->_storefrontIdentifier;
  self->_storefrontIdentifier = v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ICMusicSubscriptionStatusCacheKey *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(ICMusicSubscriptionStatusCacheKey *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      DSID = self->_DSID;
      v7 = v5->_DSID;
      if (DSID == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = DSID;
        int v10 = [(NSNumber *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      phoneNumber = self->_phoneNumber;
      v13 = v5->_phoneNumber;
      if (phoneNumber == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = phoneNumber;
        int v16 = [(NSString *)v15 isEqual:v14];

        if (!v16)
        {
LABEL_11:
          char v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      storefrontIdentifier = self->_storefrontIdentifier;
      v18 = v5->_storefrontIdentifier;
      v19 = storefrontIdentifier;
      v20 = v19;
      if (v19 == v18) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSString *)v19 isEqual:v18];
      }

      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)setPhoneNumber:(id)a3
{
  v5 = (NSString *)a3;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v7 handleFailureInMethod:a2, self, @"ICMusicSubscriptionStatusCacheKey.m", 82, @"Cannot set a nil phoneNumber on an instance of %@", v9 object file lineNumber description];
  }
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v5;
}

- (ICMusicSubscriptionStatusCacheKey)initWithDictionaryRepresentation:(id)a3 requiringDSID:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICMusicSubscriptionStatusCacheKey;
  v7 = [(ICMusicSubscriptionStatusCacheKey *)&v20 init];
  if (v7)
  {
    v8 = [v6 objectForKey:@"dsid"];
    if (_NSIsNSString())
    {
      uint64_t v9 = [v8 longLongValue];
      uint64_t v10 = [NSNumber numberWithUnsignedLongLong:v9];
      DSID = v7->_DSID;
      v7->_DSID = (NSNumber *)v10;
    }
    v12 = [v6 objectForKey:@"phoneNumber"];
    if (_NSIsNSString())
    {
      uint64_t v13 = [v12 copy];
      phoneNumber = v7->_phoneNumber;
      v7->_phoneNumber = (NSString *)v13;
    }
    v15 = [v6 objectForKey:@"storefrontID"];
    if (_NSIsNSString())
    {
      uint64_t v16 = [v15 copy];
      storefrontIdentifier = v7->_storefrontIdentifier;
      v7->_storefrontIdentifier = (NSString *)v16;
    }
    v18 = v7->_DSID;
    if (v4)
    {
      if (!v18)
      {
LABEL_15:

        v7 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else if (!v18)
    {
      v7->_DSID = (NSNumber *)&unk_1EF6409A8;
    }
    if (v7->_phoneNumber && v7->_storefrontIdentifier) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_17:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_alloc_init(ICMusicSubscriptionStatusCacheKey);
  if (v4)
  {
    uint64_t v5 = [(NSNumber *)self->_DSID copy];
    DSID = v4->_DSID;
    v4->_DSID = (NSNumber *)v5;

    uint64_t v7 = [(NSString *)self->_phoneNumber copy];
    phoneNumber = v4->_phoneNumber;
    v4->_phoneNumber = (NSString *)v7;

    uint64_t v9 = [(NSString *)self->_storefrontIdentifier copy];
    storefrontIdentifier = v4->_storefrontIdentifier;
    v4->_storefrontIdentifier = (NSString *)v9;
  }
  return v4;
}

- (ICMusicSubscriptionStatusCacheKey)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICMusicSubscriptionStatusCacheKey;
  v2 = [(ICMusicSubscriptionStatusCacheKey *)&v8 init];
  v3 = v2;
  if (v2)
  {
    DSID = v2->_DSID;
    v2->_DSID = (NSNumber *)&unk_1EF6409A8;

    phoneNumber = v3->_phoneNumber;
    v3->_phoneNumber = (NSString *)&stru_1EF5F5C40;

    storefrontIdentifier = v3->_storefrontIdentifier;
    v3->_storefrontIdentifier = (NSString *)&stru_1EF5F5C40;
  }
  return v3;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  BOOL v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@"; DSID = %@", self->_DSID];
  if ([(NSString *)self->_phoneNumber length]) {
    [v6 appendFormat:@"; phoneNumber = \"%@\"", self->_phoneNumber];
  }
  [v6 appendFormat:@"; storefrontIdentifier = \"%@\"", self->_storefrontIdentifier];
  [v6 appendString:@">"];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
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

  v18 = self->_DSID;
  uint64_t v19 = [(NSNumber *)v18 hash];
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

  v26 = self->_phoneNumber;
  uint64_t v27 = [(NSString *)v26 hash];
  uint64_t v28 = (v71 + v75) ^ __ROR8__(v75, 51);
  uint64_t v29 = v79 + (v83 ^ v27);
  uint64_t v30 = __ROR8__(v83 ^ v27, 48);
  uint64_t v31 = (v29 ^ v30) + __ROR8__(v71 + v75, 32);
  uint64_t v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  uint64_t v33 = v29 + v28;
  uint64_t v80 = __ROR8__(v33, 32);
  uint64_t v84 = v32;
  uint64_t v72 = v31 ^ v27;
  uint64_t v76 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_storefrontIdentifier;
  uint64_t v35 = [(NSString *)v34 hash];
  uint64_t v36 = (v72 + v76) ^ __ROR8__(v76, 51);
  uint64_t v37 = v80 + (v84 ^ v35);
  uint64_t v38 = __ROR8__(v84 ^ v35, 48);
  uint64_t v39 = (v37 ^ v38) + __ROR8__(v72 + v76, 32);
  uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  uint64_t v41 = v37 + v36;
  uint64_t v81 = __ROR8__(v41, 32);
  uint64_t v85 = v40;
  uint64_t v73 = v39 ^ v35;
  uint64_t v77 = v41 ^ __ROR8__(v36, 47);

  uint64_t v42 = (v73 + v77) ^ __ROR8__(v77, 51);
  uint64_t v43 = v81 + (v85 ^ 0x2000000000000000);
  uint64_t v44 = __ROR8__(v85 ^ 0x2000000000000000, 48);
  uint64_t v45 = (v43 ^ v44) + __ROR8__(v73 + v77, 32);
  uint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  uint64_t v47 = v43 + v42;
  uint64_t v48 = v47 ^ __ROR8__(v42, 47);
  uint64_t v49 = (v45 ^ 0x2000000000000000) + v48;
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

- (NSString)storefrontIdentifier
{
  return self->_storefrontIdentifier;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSNumber)DSID
{
  return self->_DSID;
}

- (id)stringRepresentation
{
  v2 = [(ICMusicSubscriptionStatusCacheKey *)self dictionaryRepresentationIncludingDSID:1];
  uint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  if (v3) {
    uint64_t v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (ICMusicSubscriptionStatusCacheKey)initWithStringRepresentation:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:4];
  uint64_t v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:0];
  id v6 = 0;
  if (_NSIsNSDictionary()) {
    id v6 = v5;
  }
  uint64_t v7 = [(ICMusicSubscriptionStatusCacheKey *)self initWithDictionaryRepresentation:v6 requiringDSID:1];

  return v7;
}

- (id)dictionaryRepresentationIncludingDSID:(BOOL)a3
{
  BOOL v3 = a3;
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"phoneNumber";
  v12[1] = @"storefrontID";
  storefrontIdentifier = self->_storefrontIdentifier;
  v13[0] = self->_phoneNumber;
  v13[1] = storefrontIdentifier;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  uint64_t v7 = v6;
  if (v3)
  {
    uint64_t v8 = (void *)[v6 mutableCopy];
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%lli", -[NSNumber longLongValue](self->_DSID, "longLongValue"));
    [v8 setObject:v9 forKey:@"dsid"];
    uint64_t v10 = [v8 copy];

    uint64_t v7 = (void *)v10;
  }

  return v7;
}

@end