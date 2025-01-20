@interface ICLocalStoreAccountProperties
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICLocalStoreAccountProperties)initWithCoder:(id)a3;
- (ICLocalStoreAccountProperties)initWithPropertyListRepresentation:(id)a3;
- (NSDictionary)propertyListRepresentation;
- (NSString)storefrontIdentifier;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_copyLocalStoreAccountPropertiesToOtherInstance:(id)a3 withZone:(_NSZone *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICLocalStoreAccountProperties

- (void).cxx_destruct
{
}

- (NSString)storefrontIdentifier
{
  if (self->_storefrontIdentifier) {
    return self->_storefrontIdentifier;
  }
  else {
    return (NSString *)&stru_1EF5F5C40;
  }
}

- (void)_copyLocalStoreAccountPropertiesToOtherInstance:(id)a3 withZone:(_NSZone *)a4
{
  storefrontIdentifier = self->_storefrontIdentifier;
  v6 = a3;
  uint64_t v7 = [(NSString *)storefrontIdentifier copyWithZone:a4];
  id v8 = (id)v6[1];
  v6[1] = v7;
}

- (NSDictionary)propertyListRepresentation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"storefrontIdentifier";
  v2 = [(ICLocalStoreAccountProperties *)self storefrontIdentifier];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (ICLocalStoreAccountProperties)initWithPropertyListRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(ICLocalStoreAccountProperties *)self init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"storefrontIdentifier"];
    if (_NSIsNSString())
    {
      uint64_t v7 = [v6 copy];
      storefrontIdentifier = v5->_storefrontIdentifier;
      v5->_storefrontIdentifier = (NSString *)v7;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICLocalStoreAccountProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICLocalStoreAccountProperties;
  v5 = [(ICLocalStoreAccountProperties *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storefrontID"];
    uint64_t v7 = [v6 copy];
    storefrontIdentifier = v5->_storefrontIdentifier;
    v5->_storefrontIdentifier = (NSString *)v7;
  }
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[ICMutableLocalStoreAccountProperties allocWithZone:](ICMutableLocalStoreAccountProperties, "allocWithZone:") init];
  if (v5) {
    [(ICLocalStoreAccountProperties *)self _copyLocalStoreAccountPropertiesToOtherInstance:v5 withZone:a3];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLocalStoreAccountProperties *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if ([(ICLocalStoreAccountProperties *)v4 isMemberOfClass:objc_opt_class()])
  {
    storefrontIdentifier = self->_storefrontIdentifier;
    v6 = v4->_storefrontIdentifier;
    uint64_t v7 = storefrontIdentifier;
    id v8 = v7;
    if (v7 == v6) {
      char v9 = 1;
    }
    else {
      char v9 = [(NSString *)v7 isEqual:v6];
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v3 ^ 0x6C7967656E657261;
  uint64_t v8 = v4 ^ 0x646F72616E646F6DLL;
  char v9 = (objc_class *)objc_opt_class();
  objc_super v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v8) ^ __ROR8__(v8, 51);
  uint64_t v14 = v7 + v12;
  uint64_t v15 = (v7 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v8, 32);
  uint64_t v58 = __ROR8__(v14 + v13, 32);
  uint64_t v60 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v56 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_storefrontIdentifier;
  uint64_t v19 = [(NSString *)v18 hash];
  uint64_t v20 = (v17 + v56) ^ __ROR8__(v56, 51);
  uint64_t v21 = v58 + (v60 ^ v19);
  uint64_t v22 = __ROR8__(v60 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v56, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v59 = __ROR8__(v25, 32);
  uint64_t v61 = v24;
  uint64_t v55 = v23 ^ v19;
  uint64_t v57 = v25 ^ __ROR8__(v20, 47);

  uint64_t v26 = (v55 + v57) ^ __ROR8__(v57, 51);
  uint64_t v27 = v59 + (v61 ^ 0x1000000000000000);
  uint64_t v28 = __ROR8__(v61 ^ 0x1000000000000000, 48);
  uint64_t v29 = (v27 ^ v28) + __ROR8__(v55 + v57, 32);
  uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  uint64_t v31 = v27 + v26;
  uint64_t v32 = v31 ^ __ROR8__(v26, 47);
  uint64_t v33 = (v29 ^ 0x1000000000000000) + v32;
  uint64_t v34 = v33 ^ __ROR8__(v32, 51);
  uint64_t v35 = (__ROR8__(v31, 32) ^ 0xFFLL) + v30;
  uint64_t v36 = __ROR8__(v30, 48);
  uint64_t v37 = __ROR8__(v33, 32) + (v35 ^ v36);
  uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  uint64_t v39 = v34 + v35;
  uint64_t v40 = v39 ^ __ROR8__(v34, 47);
  uint64_t v41 = v40 + v37;
  uint64_t v42 = v41 ^ __ROR8__(v40, 51);
  uint64_t v43 = __ROR8__(v39, 32) + v38;
  uint64_t v44 = __ROR8__(v38, 48);
  uint64_t v45 = __ROR8__(v41, 32) + (v43 ^ v44);
  uint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  uint64_t v47 = v42 + v43;
  uint64_t v48 = v47 ^ __ROR8__(v42, 47);
  uint64_t v49 = v48 + v45;
  uint64_t v50 = v49 ^ __ROR8__(v48, 51);
  uint64_t v51 = __ROR8__(v47, 32) + v46;
  uint64_t v52 = __ROR8__(v46, 48);
  uint64_t v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  return (v50 + v51) ^ __ROR8__(v50, 47) ^ v53 ^ __ROR8__(v50 + v51, 32) ^ v53 ^ __ROR8__(v51 ^ v52, 43);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  if ([(NSString *)self->_storefrontIdentifier length]) {
    [v6 appendFormat:@"; storefrontIdentifier = \"%@\"", self->_storefrontIdentifier];
  }
  [v6 appendString:@">"];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end