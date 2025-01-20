@interface ICMusicKitTokensResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICMusicKitTokensResponse)initWithCoder:(id)a3;
- (ICMusicKitTokensResponse)initWithDeveloperToken:(id)a3 userToken:(id)a4 userTokenFetchingError:(id)a5;
- (NSError)userTokenFetchingError;
- (NSString)developerToken;
- (NSString)userToken;
- (id)_descriptionForDebugging:(BOOL)a3;
- (id)_descriptionOfToken:(id)a3 forDebugging:(BOOL)a4;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICMusicKitTokensResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userTokenFetchingError, 0);
  objc_storeStrong((id *)&self->_userToken, 0);

  objc_storeStrong((id *)&self->_developerToken, 0);
}

- (NSError)userTokenFetchingError
{
  return self->_userTokenFetchingError;
}

- (NSString)userToken
{
  return self->_userToken;
}

- (NSString)developerToken
{
  return self->_developerToken;
}

- (void)encodeWithCoder:(id)a3
{
  developerToken = self->_developerToken;
  id v5 = a3;
  [v5 encodeObject:developerToken forKey:@"d"];
  [v5 encodeObject:self->_userToken forKey:@"u"];
  id v6 = [(NSError *)self->_userTokenFetchingError msv_errorByRemovingUnsafeUserInfo];
  [v5 encodeObject:v6 forKey:@"e"];
}

- (ICMusicKitTokensResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"d"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"u"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"e"];
  if (v5)
  {
    v8 = [(ICMusicKitTokensResponse *)self initWithDeveloperToken:v5 userToken:v6 userTokenFetchingError:v7];
  }
  else
  {
    v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A2D01000, v9, OS_LOG_TYPE_ERROR, "Failed to decode valid developer token while initializing instance of ICMusicKitTokensResponse from decoder.", v12, 2u);
    }

    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, @"Failed to decode valid developer token while initializing instance of ICMusicKitTokensResponse from decoder.");
    [v4 failWithError:v10];

    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICMusicKitTokensResponse *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(ICMusicKitTokensResponse *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      developerToken = self->_developerToken;
      v7 = v5->_developerToken;
      if (developerToken == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = developerToken;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      userToken = self->_userToken;
      v13 = v5->_userToken;
      if (userToken == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = userToken;
        int v16 = [(NSString *)v15 isEqual:v14];

        if (!v16)
        {
LABEL_11:
          char v11 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      userTokenFetchingError = self->_userTokenFetchingError;
      v18 = v5->_userTokenFetchingError;
      v19 = userTokenFetchingError;
      v20 = v19;
      if (v19 == v18) {
        char v11 = 1;
      }
      else {
        char v11 = [(NSError *)v19 isEqual:v18];
      }

      goto LABEL_17;
    }
    char v11 = 0;
  }
LABEL_18:

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
  int v10 = NSStringFromClass(v9);
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

  v18 = self->_developerToken;
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

  v26 = self->_userToken;
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

  v34 = self->_userTokenFetchingError;
  uint64_t v35 = [(NSError *)v34 hash];
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

- (id)debugDescription
{
  return [(ICMusicKitTokensResponse *)self _descriptionForDebugging:1];
}

- (id)description
{
  return [(ICMusicKitTokensResponse *)self _descriptionForDebugging:0];
}

- (id)_descriptionForDebugging:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  uint64_t v8 = (void *)[v5 initWithFormat:@"<%@: %p; {", v7, self];

  v9 = [(ICMusicKitTokensResponse *)self _descriptionOfToken:self->_developerToken forDebugging:v3];
  [v8 appendFormat:@"\n    developerToken: \"%@\",", v9];
  userToken = self->_userToken;
  if (userToken)
  {
    uint64_t v11 = [(ICMusicKitTokensResponse *)self _descriptionOfToken:userToken forDebugging:v3];
    [v8 appendFormat:@"\n    userToken: \"%@\",", v11];
  }
  if (self->_userTokenFetchingError) {
    [v8 appendFormat:@"\n    userTokenFetchingError: %@", self->_userTokenFetchingError];
  }
  [v8 appendString:@"\n}>"];

  return v8;
}

- (id)_descriptionOfToken:(id)a3 forDebugging:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  uint64_t v7 = v5;
  if (!a4)
  {
    unint64_t v8 = [v5 length];
    uint64_t v7 = v6;
    if (v8 >= 0x15)
    {
      unint64_t v9 = v8;
      int v10 = objc_msgSend(v6, "substringWithRange:", 0, 12);
      uint64_t v11 = objc_msgSend(v6, "substringWithRange:", v9 - 8, 8);
      uint64_t v7 = [NSString stringWithFormat:@"%@…%@", v10, v11];
    }
  }

  return v7;
}

- (ICMusicKitTokensResponse)initWithDeveloperToken:(id)a3 userToken:(id)a4 userTokenFetchingError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICMusicKitTokensResponse;
  uint64_t v11 = [(ICMusicKitTokensResponse *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    developerToken = v11->_developerToken;
    v11->_developerToken = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    userToken = v11->_userToken;
    v11->_userToken = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    userTokenFetchingError = v11->_userTokenFetchingError;
    v11->_userTokenFetchingError = (NSError *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end