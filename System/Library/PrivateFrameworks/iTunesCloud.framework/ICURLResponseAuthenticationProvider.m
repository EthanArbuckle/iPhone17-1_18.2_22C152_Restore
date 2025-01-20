@interface ICURLResponseAuthenticationProvider
+ (BOOL)supportsSecureCoding;
+ (id)defaultProvider;
- (BOOL)isEqual:(id)a3;
- (ICURLResponseAuthenticationProvider)initWithCoder:(id)a3;
- (ICURLResponseAuthenticationProvider)initWithUserInteractionLevel:(int64_t)a3;
- (int64_t)interactionLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)performAuthenticationToHandleResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5;
- (void)performAuthenticationUsingRequestContext:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation ICURLResponseAuthenticationProvider

+ (id)defaultProvider
{
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) initWithUserInteractionLevel:0];

  return v2;
}

- (ICURLResponseAuthenticationProvider)initWithUserInteractionLevel:(int64_t)a3
{
  result = [(ICURLResponseAuthenticationProvider *)self init];
  if (result) {
    result->_interactionLevel = a3;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICURLResponseAuthenticationProvider)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICURLResponseAuthenticationProvider;
  v5 = [(ICURLResponseAuthenticationProvider *)&v7 init];
  if (v5) {
    v5->_interactionLevel = [v4 decodeIntegerForKey:@"interactionLevel"];
  }

  return v5;
}

- (int64_t)interactionLevel
{
  return self->_interactionLevel;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICURLResponseAuthenticationProvider *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else if ([(ICURLResponseAuthenticationProvider *)v4 isMemberOfClass:objc_opt_class()])
  {
    BOOL v5 = self->_interactionLevel == v4->_interactionLevel;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v3 ^ 0x6C7967656E657261;
  uint64_t v8 = v4 ^ 0x646F72616E646F6DLL;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v8) ^ __ROR8__(v8, 51);
  uint64_t v14 = v7 + v12;
  uint64_t v15 = (v7 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v8, 32);
  uint64_t v57 = __ROR8__(v14 + v13, 32);
  uint64_t v58 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v55 = (v14 + v13) ^ __ROR8__(v13, 47);

  int64_t interactionLevel = self->_interactionLevel;
  uint64_t v19 = (v17 + v55) ^ __ROR8__(v55, 51);
  uint64_t v20 = v57 + (v58 ^ interactionLevel);
  uint64_t v21 = __ROR8__(v58 ^ interactionLevel, 48);
  uint64_t v22 = (v20 ^ v21) + __ROR8__(v17 + v55, 32);
  uint64_t v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  uint64_t v24 = v20 + v19;
  int64_t v54 = v22 ^ interactionLevel;
  uint64_t v56 = v24 ^ __ROR8__(v19, 47);
  int64_t v25 = ((v22 ^ interactionLevel) + v56) ^ __ROR8__(v56, 51);
  uint64_t v26 = __ROR8__(v24, 32) + (v23 ^ 0x1000000000000000);
  uint64_t v27 = __ROR8__(v23 ^ 0x1000000000000000, 48);
  uint64_t v28 = (v26 ^ v27) + __ROR8__(v54 + v56, 32);
  uint64_t v29 = v28 ^ __ROR8__(v26 ^ v27, 43);
  uint64_t v30 = v26 + v25;
  uint64_t v31 = v30 ^ __ROR8__(v25, 47);
  uint64_t v32 = (v28 ^ 0x1000000000000000) + v31;
  uint64_t v33 = v32 ^ __ROR8__(v31, 51);
  uint64_t v34 = (__ROR8__(v30, 32) ^ 0xFFLL) + v29;
  uint64_t v35 = __ROR8__(v29, 48);
  uint64_t v36 = __ROR8__(v32, 32) + (v34 ^ v35);
  uint64_t v37 = v36 ^ __ROR8__(v34 ^ v35, 43);
  uint64_t v38 = v33 + v34;
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

- (void)performAuthenticationUsingRequestContext:(id)a3 withCompletionHandler:(id)a4
{
}

- (void)performAuthenticationToHandleResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end