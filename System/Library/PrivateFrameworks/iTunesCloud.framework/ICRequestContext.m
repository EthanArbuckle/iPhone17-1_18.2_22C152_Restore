@interface ICRequestContext
+ (BOOL)supportsSecureCoding;
- (BOOL)_allowsMutation;
- (BOOL)isEqual:(id)a3;
- (ICClientInfo)clientInfo;
- (ICDeviceInfo)deviceInfo;
- (ICNetworkConstraints)networkConstraints;
- (ICRequestContext)initWithBlock:(id)a3;
- (ICRequestContext)initWithClientInfo:(id)a3;
- (ICRequestContext)initWithClientInfo:(id)a3 authenticationProvider:(id)a4;
- (ICRequestContext)initWithCoder:(id)a3;
- (ICURLResponseAuthenticationProvider)authenticationProvider;
- (NSString)userAgent;
- (id)_genericUserAgent;
- (id)_userAgentWithPlatformVersion;
- (id)_webkitUserAgentVersion;
- (id)copyWithBlock:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthenticationProvider:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setNetworkConstraints:(id)a3;
@end

@implementation ICRequestContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationProvider, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);

  objc_storeStrong((id *)&self->_networkConstraints, 0);
}

- (ICClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (ICRequestContext)initWithBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v14.receiver = self;
  v14.super_class = (Class)ICRequestContext;
  v5 = [(ICRequestContext *)&v14 init];
  v6 = v5;
  if (v5)
  {
    *((unsigned char *)v5 + 8) |= 1u;
    uint64_t v7 = +[ICURLResponseAuthenticationProvider defaultProvider];
    authenticationProvider = v6->_authenticationProvider;
    v6->_authenticationProvider = (ICURLResponseAuthenticationProvider *)v7;

    uint64_t v9 = +[ICClientInfo defaultInfo];
    clientInfo = v6->_clientInfo;
    v6->_clientInfo = (ICClientInfo *)v9;

    uint64_t v11 = +[ICDeviceInfo currentDeviceInfo];
    deviceInfo = v6->_deviceInfo;
    v6->_deviceInfo = (ICDeviceInfo *)v11;

    ((void (**)(id, ICRequestContext *))v4)[2](v4, v6);
    *((unsigned char *)v6 + 8) &= ~1u;
  }

  return v6;
}

- (void)setClientInfo:(id)a3
{
  id v8 = a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICRequestContext.m" lineNumber:182 description:@"Mutation not allowed beyond initialization."];
  }
  v5 = (ICClientInfo *)[v8 copy];
  clientInfo = self->_clientInfo;
  self->_clientInfo = v5;
}

- (void)setAuthenticationProvider:(id)a3
{
  v5 = (ICURLResponseAuthenticationProvider *)a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICRequestContext.m" lineNumber:177 description:@"Mutation not allowed beyond initialization."];
  }
  authenticationProvider = self->_authenticationProvider;
  self->_authenticationProvider = v5;
}

- (BOOL)_allowsMutation
{
  return *((unsigned char *)self + 8) & 1;
}

void __34__ICRequestContext_copyWithBlock___block_invoke(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 3, *(id *)(*(void *)(a1 + 32) + 24));
  v4 = a2;
  objc_storeStrong(v4 + 4, *(id *)(*(void *)(a1 + 32) + 32));
  objc_storeStrong(v4 + 5, *(id *)(*(void *)(a1 + 32) + 40));
  objc_storeStrong(v4 + 2, *(id *)(*(void *)(a1 + 32) + 16));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)copyWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__ICRequestContext_copyWithBlock___block_invoke;
  v9[3] = &unk_1E5AC95A0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)[v5 initWithBlock:v9];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 encodeObject:self->_clientInfo forKey:@"clientInfo"];
  [v4 encodeObject:self->_networkConstraints forKey:@"networkConstraints"];
  if (self->_authenticationProvider)
  {
    id v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    if (_ICURLResponseAuthenticationProviderIsAllowedForClassName(v6))
    {
      [v4 encodeObject:v6 forKey:@"authenticationProviderClassName"];
      [v4 encodeObject:self->_authenticationProvider forKey:@"authenticationProvider"];
    }
    else
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, @"Attempted to encode an instance of ICRequestContext with an unallowed class name for authenticationProvider: %@.", v6);
      id v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_msgSend(v7, "msv_description");
        *(_DWORD *)buf = 138543362;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1A2D01000, v8, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      [v4 failWithError:v7];
    }
  }
}

- (ICRequestContext)initWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ICRequestContext;
  id v5 = [(ICRequestContext *)&v25 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientInfo"];
    uint64_t v7 = [v6 copy];
    clientInfo = v5->_clientInfo;
    v5->_clientInfo = (ICClientInfo *)v7;

    uint64_t v9 = +[ICDeviceInfo currentDeviceInfo];
    deviceInfo = v5->_deviceInfo;
    v5->_deviceInfo = (ICDeviceInfo *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"networkConstraints"];
    uint64_t v12 = [v11 copy];
    networkConstraints = v5->_networkConstraints;
    v5->_networkConstraints = (ICNetworkConstraints *)v12;

    objc_super v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authenticationProviderClassName"];
    if (_ICURLResponseAuthenticationProviderIsAllowedForClassName(v14))
    {
      Class v15 = NSClassFromString(v14);
      if (v15)
      {
        uint64_t v16 = [v4 decodeObjectOfClass:v15 forKey:@"authenticationProvider"];
        authenticationProvider = v5->_authenticationProvider;
        v5->_authenticationProvider = (ICURLResponseAuthenticationProvider *)v16;

        goto LABEL_11;
      }
      v18 = @"Failed to look up class of authentication provider with name: %@.";
    }
    else
    {
      v18 = @"Attempted to decode an instance of ICRequestContext with an unallowed class name for authenticationProvider: %@.";
    }
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28C58], "msv_errorWithDomain:code:debugDescription:", @"ICError", -7005, v18, v14);
    if (v19)
    {
      v20 = (void *)v19;
      v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = objc_msgSend(v20, "msv_description");
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_1A2D01000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      [v4 failWithError:v20];

      id v5 = 0;
      goto LABEL_13;
    }
LABEL_11:
    if (v5->_authenticationProvider)
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v23 = +[ICURLResponseAuthenticationProvider defaultProvider];
    v20 = v5->_authenticationProvider;
    v5->_authenticationProvider = (ICURLResponseAuthenticationProvider *)v23;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (ICNetworkConstraints)networkConstraints
{
  return self->_networkConstraints;
}

- (ICURLResponseAuthenticationProvider)authenticationProvider
{
  return self->_authenticationProvider;
}

- (NSString)userAgent
{
  if ([(ICDeviceInfo *)self->_deviceInfo isInternalBuild]) {
    [(ICRequestContext *)self _genericUserAgent];
  }
  else {
  v3 = [(ICRequestContext *)self _userAgentWithPlatformVersion];
  }

  return (NSString *)v3;
}

- (ICDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (id)_userAgentWithPlatformVersion
{
  v3 = [(ICRequestContext *)self _genericUserAgent];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(ICDeviceInfo *)self->_deviceInfo productPlatform];
  id v6 = [(ICDeviceInfo *)self->_deviceInfo productVersion];
  uint64_t v7 = +[ICDeviceInfo currentDeviceInfo];
  int v8 = [v7 isMac];

  if (v8)
  {
    if ([v6 length]) {
      [v4 appendFormat:@" (Macintosh; OS X %@)", v6];
    }
    uint64_t v9 = [(ICRequestContext *)self _webkitUserAgentVersion];
    if ([v9 length]) {
      [v4 appendFormat:@" AppleWebKit/%@", v9];
    }
LABEL_14:

    goto LABEL_15;
  }
  id v10 = +[ICDeviceInfo currentDeviceInfo];
  int v11 = [v10 isAppleTV];

  if (v11)
  {

    id v5 = @"iOS";
  }
  if (-[__CFString length](v5, "length") && [v6 length]) {
    [v4 appendFormat:@" %@/%@", v5, v6];
  }
  if ([(ICDeviceInfo *)self->_deviceInfo isAppleTV])
  {
    uint64_t v9 = [(ICDeviceInfo *)self->_deviceInfo productVersion];
    if ([v9 length]) {
      [v4 appendFormat:@" AppleTV/%@", v9];
    }
    goto LABEL_14;
  }
LABEL_15:

  return v4;
}

- (id)_genericUserAgent
{
  id v3 = [NSString alloc];
  id v4 = [(ICClientInfo *)self->_clientInfo _clientIdentifierForUserAgent];
  id v5 = [(ICClientInfo *)self->_clientInfo clientVersion];
  id v6 = (void *)[v3 initWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (id)_webkitUserAgentVersion
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__18839;
  id v10 = __Block_byref_object_dispose__18840;
  id v11 = 0;
  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  if ([v2 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__ICRequestContext__webkitUserAgentVersion__block_invoke;
    v5[3] = &unk_1E5AC95C8;
    v5[4] = &v6;
    [v2 enumerateObjectsUsingBlock:v5];
  }
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__ICRequestContext__webkitUserAgentVersion__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = NSString;
  v20[0] = v6;
  v20[1] = @"Frameworks";
  v20[2] = @"WebKit.framework";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  uint64_t v9 = [v7 pathWithComponents:v8];

  id v10 = [MEMORY[0x1E4F28B50] bundleWithPath:v9];
  id v11 = [v10 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D020]];

  if (v11)
  {
    *a4 = 1;
    uint64_t v12 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    v13 = [v12 invertedSet];
    unint64_t v14 = [v11 rangeOfCharacterFromSet:v13];

    if (v14 < 4 || v14 == 0x7FFFFFFFFFFFFFFFLL && (unint64_t)[v11 length] < 4)
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
      id v16 = v11;
      v17 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
    }
    else
    {
      uint64_t v18 = [v11 substringFromIndex:1];
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
      v17 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
}

- (void)setNetworkConstraints:(id)a3
{
  id v8 = a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICRequestContext.m" lineNumber:192 description:@"Mutation not allowed beyond initialization."];
  }
  id v5 = (ICNetworkConstraints *)[v8 copy];
  networkConstraints = self->_networkConstraints;
  self->_networkConstraints = v5;
}

- (void)setDeviceInfo:(id)a3
{
  id v5 = (ICDeviceInfo *)a3;
  if (![(ICRequestContext *)self _allowsMutation])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"ICRequestContext.m" lineNumber:187 description:@"Mutation not allowed beyond initialization."];
  }
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICRequestContext *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(ICRequestContext *)v4 isMemberOfClass:objc_opt_class()])
    {
      id v5 = v4;
      clientInfo = self->_clientInfo;
      uint64_t v7 = v5->_clientInfo;
      if (clientInfo == v7)
      {
      }
      else
      {
        id v8 = v7;
        uint64_t v9 = clientInfo;
        BOOL v10 = [(ICClientInfo *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_15;
        }
      }
      deviceInfo = self->_deviceInfo;
      v13 = v5->_deviceInfo;
      if (deviceInfo == v13)
      {
      }
      else
      {
        unint64_t v14 = v13;
        uint64_t v15 = deviceInfo;
        int v16 = [(ICDeviceInfo *)v15 isEqual:v14];

        if (!v16) {
          goto LABEL_15;
        }
      }
      authenticationProvider = self->_authenticationProvider;
      uint64_t v18 = v5->_authenticationProvider;
      if (authenticationProvider == v18)
      {
      }
      else
      {
        uint64_t v19 = v18;
        v20 = authenticationProvider;
        BOOL v21 = [(ICURLResponseAuthenticationProvider *)v20 isEqual:v19];

        if (!v21)
        {
LABEL_15:
          char v11 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      networkConstraints = self->_networkConstraints;
      uint64_t v23 = v5->_networkConstraints;
      v24 = networkConstraints;
      objc_super v25 = v24;
      if (v24 == v23) {
        char v11 = 1;
      }
      else {
        char v11 = [(ICNetworkConstraints *)v24 isEqual:v23];
      }

      goto LABEL_21;
    }
    char v11 = 0;
  }
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  uint64_t v9 = (objc_class *)objc_opt_class();
  BOOL v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v88 = __ROR8__(v14 + v13, 32);
  uint64_t v93 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v83 = (v14 + v13) ^ __ROR8__(v13, 47);

  uint64_t v18 = self->_clientInfo;
  uint64_t v19 = [(ICClientInfo *)v18 hash];
  uint64_t v20 = (v17 + v83) ^ __ROR8__(v83, 51);
  uint64_t v21 = v88 + (v93 ^ v19);
  uint64_t v22 = __ROR8__(v93 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v83, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v89 = __ROR8__(v25, 32);
  uint64_t v94 = v24;
  uint64_t v79 = v23 ^ v19;
  uint64_t v84 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_deviceInfo;
  uint64_t v27 = [(ICDeviceInfo *)v26 hash];
  uint64_t v28 = (v79 + v84) ^ __ROR8__(v84, 51);
  uint64_t v29 = v89 + (v94 ^ v27);
  uint64_t v30 = __ROR8__(v94 ^ v27, 48);
  uint64_t v31 = (v29 ^ v30) + __ROR8__(v79 + v84, 32);
  uint64_t v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  uint64_t v33 = v29 + v28;
  uint64_t v90 = __ROR8__(v33, 32);
  uint64_t v95 = v32;
  uint64_t v80 = v31 ^ v27;
  uint64_t v85 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_authenticationProvider;
  uint64_t v35 = [(ICURLResponseAuthenticationProvider *)v34 hash];
  uint64_t v36 = (v80 + v85) ^ __ROR8__(v85, 51);
  uint64_t v37 = v90 + (v95 ^ v35);
  uint64_t v38 = __ROR8__(v95 ^ v35, 48);
  uint64_t v39 = (v37 ^ v38) + __ROR8__(v80 + v85, 32);
  uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  uint64_t v41 = v37 + v36;
  uint64_t v91 = __ROR8__(v41, 32);
  uint64_t v96 = v40;
  uint64_t v81 = v39 ^ v35;
  uint64_t v86 = v41 ^ __ROR8__(v36, 47);

  v42 = self->_networkConstraints;
  uint64_t v43 = [(ICNetworkConstraints *)v42 hash];
  uint64_t v44 = (v81 + v86) ^ __ROR8__(v86, 51);
  uint64_t v45 = v91 + (v96 ^ v43);
  uint64_t v46 = __ROR8__(v96 ^ v43, 48);
  uint64_t v47 = (v45 ^ v46) + __ROR8__(v81 + v86, 32);
  uint64_t v48 = v47 ^ __ROR8__(v45 ^ v46, 43);
  uint64_t v49 = v45 + v44;
  uint64_t v92 = __ROR8__(v49, 32);
  uint64_t v97 = v48;
  uint64_t v82 = v47 ^ v43;
  uint64_t v87 = v49 ^ __ROR8__(v44, 47);

  uint64_t v50 = (v82 + v87) ^ __ROR8__(v87, 51);
  uint64_t v51 = v92 + (v97 ^ 0x2800000000000000);
  uint64_t v52 = __ROR8__(v97 ^ 0x2800000000000000, 48);
  uint64_t v53 = (v51 ^ v52) + __ROR8__(v82 + v87, 32);
  uint64_t v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  uint64_t v55 = v51 + v50;
  uint64_t v56 = v55 ^ __ROR8__(v50, 47);
  uint64_t v57 = (v53 ^ 0x2800000000000000) + v56;
  uint64_t v58 = v57 ^ __ROR8__(v56, 51);
  uint64_t v59 = (__ROR8__(v55, 32) ^ 0xFFLL) + v54;
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
  uint64_t v70 = v69 ^ __ROR8__(v67 ^ v68, 43);
  uint64_t v71 = v66 + v67;
  uint64_t v72 = v71 ^ __ROR8__(v66, 47);
  uint64_t v73 = v72 + v69;
  uint64_t v74 = v73 ^ __ROR8__(v72, 51);
  uint64_t v75 = __ROR8__(v71, 32) + v70;
  uint64_t v76 = __ROR8__(v70, 48);
  uint64_t v77 = __ROR8__(v73, 32) + (v75 ^ v76);
  return (v74 + v75) ^ __ROR8__(v74, 47) ^ v77 ^ __ROR8__(v74 + v75, 32) ^ v77 ^ __ROR8__(v75 ^ v76, 43);
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(ICClientInfo *)self->_clientInfo clientIdentifier];
  uint64_t v6 = [(ICClientInfo *)self->_clientInfo clientVersion];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p [%@/%@]>", v4, self, v5, v6];

  return v7;
}

- (ICRequestContext)initWithClientInfo:(id)a3 authenticationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__ICRequestContext_initWithClientInfo_authenticationProvider___block_invoke;
  v12[3] = &unk_1E5AC9578;
  id v13 = v6;
  id v14 = v7;
  id v8 = v7;
  id v9 = v6;
  BOOL v10 = [(ICRequestContext *)self initWithBlock:v12];

  return v10;
}

void __62__ICRequestContext_initWithClientInfo_authenticationProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setClientInfo:v3];
  [v4 setAuthenticationProvider:*(void *)(a1 + 40)];
}

- (ICRequestContext)initWithClientInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[ICURLResponseAuthenticationProvider defaultProvider];
  id v6 = [(ICRequestContext *)self initWithClientInfo:v4 authenticationProvider:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end