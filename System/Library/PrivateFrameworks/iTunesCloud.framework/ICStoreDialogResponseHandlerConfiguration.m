@interface ICStoreDialogResponseHandlerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsHandlingNonAuthenticationDialogs;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRecordLastAuthenticationDialogResponseTime;
- (ICStoreDialogResponseHandlerConfiguration)init;
- (ICStoreDialogResponseHandlerConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsHandlingNonAuthenticationDialogs:(BOOL)a3;
- (void)setShouldRecordLastAuthenticationDialogResponseTime:(BOOL)a3;
@end

@implementation ICStoreDialogResponseHandlerConfiguration

- (void)setAllowsHandlingNonAuthenticationDialogs:(BOOL)a3
{
  self->_allowsHandlingNonAuthenticationDialogs = a3;
}

- (ICStoreDialogResponseHandlerConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICStoreDialogResponseHandlerConfiguration;
  result = [(ICStoreDialogResponseHandlerConfiguration *)&v3 init];
  if (result) {
    *(_WORD *)&result->_allowsHandlingNonAuthenticationDialogs = 1;
  }
  return result;
}

- (BOOL)shouldRecordLastAuthenticationDialogResponseTime
{
  return self->_shouldRecordLastAuthenticationDialogResponseTime;
}

- (BOOL)allowsHandlingNonAuthenticationDialogs
{
  return self->_allowsHandlingNonAuthenticationDialogs;
}

- (void)setShouldRecordLastAuthenticationDialogResponseTime:(BOOL)a3
{
  self->_shouldRecordLastAuthenticationDialogResponseTime = a3;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL allowsHandlingNonAuthenticationDialogs = self->_allowsHandlingNonAuthenticationDialogs;
  id v5 = a3;
  [v5 encodeBool:allowsHandlingNonAuthenticationDialogs forKey:@"allowsHandlingNonAuthenticationDialogs"];
  [v5 encodeBool:self->_shouldRecordLastAuthenticationDialogResponseTime forKey:@"shouldRecordLastAuthenticationDialogResponseTime"];
}

- (ICStoreDialogResponseHandlerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICStoreDialogResponseHandlerConfiguration;
  id v5 = [(ICStoreDialogResponseHandlerConfiguration *)&v7 init];
  if (v5)
  {
    v5->_BOOL allowsHandlingNonAuthenticationDialogs = [v4 decodeBoolForKey:@"allowsHandlingNonAuthenticationDialogs"];
    v5->_shouldRecordLastAuthenticationDialogResponseTime = [v4 decodeBoolForKey:@"shouldRecordLastAuthenticationDialogResponseTime"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((unsigned char *)result + 8) = self->_allowsHandlingNonAuthenticationDialogs;
    *((unsigned char *)result + 9) = self->_shouldRecordLastAuthenticationDialogResponseTime;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICStoreDialogResponseHandlerConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if (![(ICStoreDialogResponseHandlerConfiguration *)v4 isMemberOfClass:objc_opt_class()]|| !self->_allowsHandlingNonAuthenticationDialogs == v4->_allowsHandlingNonAuthenticationDialogs)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = !self->_shouldRecordLastAuthenticationDialogResponseTime ^ v4->_shouldRecordLastAuthenticationDialogResponseTime;
  }

  return v5;
}

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
  uint64_t v17 = v14 + v13;
  uint64_t v58 = __ROR8__(v17, 32);
  uint64_t v59 = v16 ^ __ROR8__(v15, 43);
  uint64_t v54 = v16 ^ v11;
  uint64_t v56 = v17 ^ __ROR8__(v13, 47);

  uint64_t v60 = self->_allowsHandlingNonAuthenticationDialogs | 0xC00000000000000;
  unint64_t v18 = v60 & 0xFFFFFFFFFFFFFFLL | ((unint64_t)self->_shouldRecordLastAuthenticationDialogResponseTime << 32);
  uint64_t v19 = (v54 + v56) ^ __ROR8__(v56, 51);
  uint64_t v20 = v58 + (v18 ^ v59);
  uint64_t v21 = __ROR8__(v18 ^ v59, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v54 + v56, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  unint64_t v55 = v22 ^ v18;
  uint64_t v57 = v24 ^ __ROR8__(v19, 47);
  unint64_t v25 = ((v22 ^ v18) + v57) ^ __ROR8__(v57, 51);
  unint64_t v26 = __ROR8__(v24, 32) + (v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000));
  uint64_t v27 = __ROR8__(v23 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000), 48);
  unint64_t v28 = (v26 ^ v27) + __ROR8__(v55 + v57, 32);
  unint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  unint64_t v30 = v26 + v25;
  unint64_t v31 = v30 ^ __ROR8__(v25, 47);
  unint64_t v32 = (v28 ^ ((v60 & 0xFF00000000000000) + 0x400000000000000)) + v31;
  uint64_t v33 = v32 ^ __ROR8__(v31, 51);
  unint64_t v34 = (__ROR8__(v30, 32) ^ 0xFFLL) + v29;
  uint64_t v35 = __ROR8__(v29, 48);
  uint64_t v36 = __ROR8__(v32, 32) + (v34 ^ v35);
  uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  unint64_t v38 = v33 + v34;
  uint64_t v39 = v38 ^ __ROR8__(v33, 47);
  uint64_t v40 = v39 + v36;
  uint64_t v41 = v40 ^ __ROR8__(v39, 51);
  uint64_t v42 = __ROR8__(v38, 32) + v37;
  uint64_t v43 = __ROR8__(v37, 48);
  uint64_t v44 = __ROR8__(v40, 32) + (v42 ^ v43);
  uint64_t v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
  uint64_t v46 = v41 + v42;
  uint64_t v47 = v46 ^ __ROR8__(v41, 47);
  uint64_t v48 = v47 + v44;
  uint64_t v49 = v48 ^ __ROR8__(v47, 51);
  uint64_t v50 = __ROR8__(v46, 32) + v45;
  uint64_t v51 = __ROR8__(v45, 48);
  uint64_t v52 = __ROR8__(v48, 32) + (v50 ^ v51);
  return (v49 + v50) ^ __ROR8__(v49, 47) ^ v52 ^ __ROR8__(v49 + v50, 32) ^ v52 ^ __ROR8__(v50 ^ v51, 43);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end