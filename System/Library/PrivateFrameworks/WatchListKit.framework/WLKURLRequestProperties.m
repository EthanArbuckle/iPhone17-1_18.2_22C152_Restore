@interface WLKURLRequestProperties
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3;
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 caller:(id)a6;
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 apiVersion:(id)a9 options:(int64_t)a10;
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9;
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9 clientProtocolVersion:(id)a10;
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 apiVersion:(id)a10 options:(int64_t)a11;
+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 apiVersion:(id)a10 options:(int64_t)a11 clientProtocolVersion:(id)a12;
+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9;
+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 options:(int64_t)a10;
+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 options:(int64_t)a10 clientProtocolVersion:(id)a11;
- (BOOL)isEqual:(id)a3;
- (NSData)httpBody;
- (NSDictionary)headers;
- (NSDictionary)queryParameters;
- (NSNumber)apiVersion;
- (NSNumber)clientProtocolVersion;
- (NSNumber)timeout;
- (NSString)caller;
- (NSString)endpoint;
- (NSString)httpMethod;
- (NSString)routeName;
- (id)URLRequestWithConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (int64_t)options;
- (unint64_t)hash;
- (void)setApiVersion:(id)a3;
- (void)setCaller:(id)a3;
- (void)setClientProtocolVersion:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setHeaders:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpMethod:(id)a3;
- (void)setOptions:(int64_t)a3;
- (void)setQueryParameters:(id)a3;
- (void)setRouteName:(id)a3;
- (void)setTimeout:(id)a3;
@end

@implementation WLKURLRequestProperties

- (NSString)endpoint
{
  return self->_endpoint;
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 apiVersion:(id)a9 options:(int64_t)a10
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithEndpoint:a3 queryParameters:a4 httpMethod:a5 httpBody:0 headers:a6 caller:a7 timeout:0 apiVersion:a9 options:a10];
}

- (int64_t)options
{
  return self->_options;
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 apiVersion:(id)a10 options:(int64_t)a11
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithEndpoint:a3 queryParameters:a4 httpMethod:a5 httpBody:a6 headers:a7 caller:a8 timeout:a9 apiVersion:a10 options:a11 clientProtocolVersion:0];
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 apiVersion:(id)a10 options:(int64_t)a11 clientProtocolVersion:(id)a12
{
  v17 = (__CFString *)a5;
  id v29 = a10;
  id v18 = a12;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a4;
  id v24 = a3;
  v25 = objc_alloc_init(WLKURLRequestProperties);
  [(WLKURLRequestProperties *)v25 setEndpoint:v24];

  [(WLKURLRequestProperties *)v25 setQueryParameters:v23];
  if (![(__CFString *)v17 length])
  {

    v17 = @"GET";
  }
  -[WLKURLRequestProperties setHttpMethod:](v25, "setHttpMethod:", v17, v29);
  [(WLKURLRequestProperties *)v25 setHttpBody:v22];

  [(WLKURLRequestProperties *)v25 setHeaders:v21];
  [(WLKURLRequestProperties *)v25 setCaller:v20];

  [(WLKURLRequestProperties *)v25 setTimeout:v19];
  [(WLKURLRequestProperties *)v25 setClientProtocolVersion:v18];

  if (requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__once == -1)
  {
    if (v30)
    {
LABEL_5:
      id v26 = v30;
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__once, &__block_literal_global_0);
    if (v30) {
      goto LABEL_5;
    }
  }
  id v26 = [NSNumber numberWithUnsignedInteger:WLKCurrentAPIVersion()];
LABEL_8:
  v27 = v26;
  [(WLKURLRequestProperties *)v25 setApiVersion:v26];
  [(WLKURLRequestProperties *)v25 setOptions:a11];

  return v25;
}

- (void)setTimeout:(id)a3
{
}

- (void)setQueryParameters:(id)a3
{
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void)setHttpMethod:(id)a3
{
}

- (void)setHttpBody:(id)a3
{
}

- (void)setHeaders:(id)a3
{
}

- (void)setEndpoint:(id)a3
{
}

- (void)setClientProtocolVersion:(id)a3
{
}

- (void)setCaller:(id)a3
{
}

- (void)setApiVersion:(id)a3
{
}

- (id)shortDescription
{
  endpoint = self->_endpoint;
  if (!endpoint) {
    endpoint = self->_routeName;
  }
  return endpoint;
}

- (id)URLRequestWithConfiguration:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  endpoint = self->_endpoint;
  routeName = self->_routeName;
  if (endpoint) {
    BOOL v7 = routeName == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7 && (endpoint || routeName == 0)) {
    -[WLKURLRequestProperties URLRequestWithConfiguration:]();
  }
  v9 = (void *)[(NSDictionary *)self->_queryParameters mutableCopy];
  if (!v9)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v10 = [(WLKURLRequestProperties *)self clientProtocolVersion];

  if (v10)
  {
    v11 = [(WLKURLRequestProperties *)self clientProtocolVersion];
    [v9 setObject:v11 forKeyedSubscript:@"v"];
  }
  if ((self->_options & 0x100000) == 0 && [(NSString *)self->_caller length]) {
    [v9 setObject:self->_caller forKeyedSubscript:@"caller"];
  }
  unint64_t options = self->_options;
  if (!self->_endpoint)
  {
    id v18 = self->_routeName;
    if (!v18) {
      goto LABEL_23;
    }
    v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "wlk_URLWithServerConfig:routeName:queryParameters:suppressParameterEncoding:", v4, v18, v9, (options >> 1) & 1);
    if (!v17) {
      goto LABEL_23;
    }
LABEL_21:
    timeout = self->_timeout;
    if (timeout) {
      [(NSNumber *)timeout doubleValue];
    }
    else {
      double v20 = 30.0;
    }
    id v22 = objc_msgSend(MEMORY[0x1E4F18DA8], "wlk_requestWithURL:httpMethod:httpBody:httpHeaders:cachePolicy:timeout:", v17, self->_httpMethod, self->_httpBody, self->_headers, 0, v20);
    goto LABEL_28;
  }
  uint64_t v13 = (options >> 1) & 1;
  v14 = [NSString stringWithFormat:@"/uts/v%@/", self->_apiVersion];
  v26[0] = self->_endpoint;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  v16 = objc_msgSend(v14, "wlk_stringByAppendingPathComponents:", v15);

  v17 = objc_msgSend(MEMORY[0x1E4F1CB10], "wlk_URLWithServerConfig:endpoint:relativeToBaseURL:queryParameters:suppressParameterEncoding:", v4, v16, 1, v9, v13);

  if (v17) {
    goto LABEL_21;
  }
LABEL_23:
  id v21 = WLKNetworkingLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = self;
    _os_log_impl(&dword_1BA2E8000, v21, OS_LOG_TYPE_DEFAULT, "%@: unable to resolve URL", buf, 0xCu);
  }

  v17 = 0;
  id v22 = 0;
LABEL_28:

  return v22;
}

- (NSNumber)clientProtocolVersion
{
  return self->_clientProtocolVersion;
}

void __157__WLKURLRequestProperties_requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion___block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v2 = @"channels";
  v3[0] = &unk_1F13D95F0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  v1 = (void *)requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__migratedEndpoints;
  requestPropertiesWithEndpoint_queryParameters_httpMethod_httpBody_headers_caller_timeout_apiVersion_options_clientProtocolVersion__migratedEndpoints = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientProtocolVersion, 0);
  objc_storeStrong((id *)&self->_apiVersion, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_caller, 0);
  objc_storeStrong((id *)&self->_httpBody, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_queryParameters, 0);
  objc_storeStrong((id *)&self->_httpMethod, 0);
  objc_storeStrong((id *)&self->_routeName, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithServerRoute:a3 queryParameters:a4 httpMethod:a5 httpBody:0 headers:a6 caller:a7 timeout:a8 options:a9];
}

+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 options:(int64_t)a10 clientProtocolVersion:(id)a11
{
  v16 = (__CFString *)a5;
  id v17 = a11;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v23 = a3;
  id v24 = objc_alloc_init(WLKURLRequestProperties);
  [(WLKURLRequestProperties *)v24 setRouteName:v23];

  [(WLKURLRequestProperties *)v24 setQueryParameters:v22];
  if (![(__CFString *)v16 length])
  {

    v16 = @"GET";
  }
  [(WLKURLRequestProperties *)v24 setHttpMethod:v16];
  [(WLKURLRequestProperties *)v24 setHttpBody:v21];

  [(WLKURLRequestProperties *)v24 setHeaders:v20];
  [(WLKURLRequestProperties *)v24 setCaller:v19];

  [(WLKURLRequestProperties *)v24 setTimeout:v18];
  [(WLKURLRequestProperties *)v24 setOptions:a10];
  [(WLKURLRequestProperties *)v24 setClientProtocolVersion:v17];

  return v24;
}

+ (WLKURLRequestProperties)requestPropertiesWithServerRoute:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 httpBody:(id)a6 headers:(id)a7 caller:(id)a8 timeout:(id)a9 options:(int64_t)a10
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithServerRoute:a3 queryParameters:a4 httpMethod:a5 httpBody:a6 headers:a7 caller:a8 timeout:a9 options:a10 clientProtocolVersion:0];
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithEndpoint:a3 queryParameters:0 httpMethod:0 httpBody:0 headers:0 caller:0 timeout:0 apiVersion:0 options:0];
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 caller:(id)a6
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithEndpoint:a3 queryParameters:a4 httpMethod:a5 httpBody:0 headers:0 caller:a6 timeout:0 apiVersion:0 options:0];
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithEndpoint:a3 queryParameters:a4 httpMethod:a5 httpBody:0 headers:a6 caller:a7 timeout:0 apiVersion:0 options:a9];
}

+ (WLKURLRequestProperties)requestPropertiesWithEndpoint:(id)a3 queryParameters:(id)a4 httpMethod:(id)a5 headers:(id)a6 caller:(id)a7 timeout:(id)a8 options:(int64_t)a9 clientProtocolVersion:(id)a10
{
  return (WLKURLRequestProperties *)[a1 requestPropertiesWithEndpoint:a3 queryParameters:a4 httpMethod:a5 httpBody:0 headers:a6 caller:a7 timeout:a8 apiVersion:0 options:a9 clientProtocolVersion:a10];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WLKURLRequestProperties);
  uint64_t v5 = [(NSString *)self->_endpoint copy];
  endpoint = v4->_endpoint;
  v4->_endpoint = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_routeName copy];
  routeName = v4->_routeName;
  v4->_routeName = (NSString *)v7;

  v9 = v4->_endpoint;
  v10 = v4->_routeName;
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (v12) {
      -[WLKURLRequestProperties copyWithZone:]();
    }
  }
  uint64_t v13 = [(NSString *)self->_httpMethod copy];
  httpMethod = v4->_httpMethod;
  v4->_httpMethod = (NSString *)v13;

  uint64_t v15 = [(NSDictionary *)self->_queryParameters copy];
  queryParameters = v4->_queryParameters;
  v4->_queryParameters = (NSDictionary *)v15;

  uint64_t v17 = [(NSDictionary *)self->_headers copy];
  headers = v4->_headers;
  v4->_headers = (NSDictionary *)v17;

  uint64_t v19 = [(NSString *)self->_caller copy];
  caller = v4->_caller;
  v4->_caller = (NSString *)v19;

  uint64_t v21 = [(NSNumber *)self->_timeout copy];
  timeout = v4->_timeout;
  v4->_timeout = (NSNumber *)v21;

  uint64_t v23 = [(NSNumber *)self->_apiVersion copy];
  apiVersion = v4->_apiVersion;
  v4->_apiVersion = (NSNumber *)v23;

  v4->_unint64_t options = self->_options;
  return v4;
}

- (unint64_t)hash
{
  v3 = [(WLKURLRequestProperties *)self endpoint];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(WLKURLRequestProperties *)self routeName];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(WLKURLRequestProperties *)self httpMethod];
  uint64_t v8 = [v7 hash];

  v9 = [(WLKURLRequestProperties *)self httpBody];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  BOOL v11 = [(WLKURLRequestProperties *)self queryParameters];
  uint64_t v12 = [v11 hash];

  uint64_t v13 = [(WLKURLRequestProperties *)self headers];
  uint64_t v14 = v12 ^ [v13 hash];

  uint64_t v15 = [(WLKURLRequestProperties *)self caller];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];

  uint64_t v17 = [(WLKURLRequestProperties *)self timeout];
  uint64_t v18 = [v17 hash];

  uint64_t v19 = [(WLKURLRequestProperties *)self apiVersion];
  uint64_t v20 = v18 ^ [v19 hash];

  return v16 ^ v20 ^ [(WLKURLRequestProperties *)self options];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (WLKURLRequestProperties *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(WLKURLRequestProperties *)self endpoint];
    uint64_t v8 = [(WLKURLRequestProperties *)v6 endpoint];
    id v9 = v7;
    id v10 = v8;
    BOOL v11 = v10;
    if (v9 == v10)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v9 && v10) {
        char v12 = [v9 isEqual:v10];
      }
    }

    uint64_t v14 = [(WLKURLRequestProperties *)self routeName];
    uint64_t v15 = [(WLKURLRequestProperties *)v6 routeName];
    id v16 = v14;
    id v17 = v15;
    uint64_t v18 = v17;
    if (v16 == v17)
    {
      char v19 = 1;
    }
    else
    {
      char v19 = 0;
      if (v16 && v17) {
        char v19 = [v16 isEqual:v17];
      }
    }

    char v20 = v12 & v19;
    uint64_t v21 = [(WLKURLRequestProperties *)self httpMethod];
    id v22 = [(WLKURLRequestProperties *)v6 httpMethod];
    id v23 = v21;
    id v24 = v22;
    v25 = v24;
    if (v23 == v24)
    {
      char v26 = 1;
    }
    else
    {
      char v26 = 0;
      if (v23 && v24) {
        char v26 = [v23 isEqual:v24];
      }
    }

    char v27 = v20 & v26;
    v28 = [(WLKURLRequestProperties *)self httpBody];
    id v29 = [(WLKURLRequestProperties *)v6 httpBody];
    id v30 = v28;
    id v31 = v29;
    v32 = v31;
    if (v30 == v31)
    {
      char v33 = 1;
    }
    else
    {
      char v33 = 0;
      if (v30 && v31) {
        char v33 = [v30 isEqual:v31];
      }
    }

    char v34 = v27 & v33;
    v35 = [(WLKURLRequestProperties *)self queryParameters];
    v36 = [(WLKURLRequestProperties *)v6 queryParameters];
    id v37 = v35;
    id v38 = v36;
    v39 = v38;
    if (v37 == v38)
    {
      char v40 = 1;
    }
    else
    {
      char v40 = 0;
      if (v37 && v38) {
        char v40 = [v37 isEqual:v38];
      }
    }

    char v41 = v34 & v40;
    v42 = [(WLKURLRequestProperties *)self headers];
    v43 = [(WLKURLRequestProperties *)v6 headers];
    id v44 = v42;
    id v45 = v43;
    v46 = v45;
    if (v44 == v45)
    {
      char v47 = 1;
    }
    else
    {
      char v47 = 0;
      if (v44 && v45) {
        char v47 = [v44 isEqual:v45];
      }
    }

    char v48 = v41 & v47;
    v49 = [(WLKURLRequestProperties *)self caller];
    v50 = [(WLKURLRequestProperties *)v6 caller];
    id v51 = v49;
    id v52 = v50;
    v53 = v52;
    if (v51 == v52)
    {
      char v54 = 1;
    }
    else
    {
      char v54 = 0;
      if (v51 && v52) {
        char v54 = [v51 isEqual:v52];
      }
    }

    char v55 = v48 & v54;
    v56 = [(WLKURLRequestProperties *)self timeout];
    v57 = [(WLKURLRequestProperties *)v6 timeout];
    id v58 = v56;
    id v59 = v57;
    v60 = v59;
    if (v58 == v59)
    {
      char v61 = 1;
    }
    else
    {
      char v61 = 0;
      if (v58 && v59) {
        char v61 = [v58 isEqual:v59];
      }
    }

    char v62 = v55 & v61;
    v63 = [(WLKURLRequestProperties *)self apiVersion];
    v64 = [(WLKURLRequestProperties *)v6 apiVersion];
    id v65 = v63;
    id v66 = v64;
    v67 = v66;
    if (v65 == v66)
    {
      char v68 = 1;
    }
    else
    {
      char v68 = 0;
      if (v65 && v66) {
        char v68 = [v65 isEqual:v66];
      }
    }

    char v69 = v62 & v68;
    int64_t v70 = [(WLKURLRequestProperties *)self options];
    if (v70 == [(WLKURLRequestProperties *)v6 options]) {
      BOOL v13 = v69;
    }
    else {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WLKURLRequestProperties;
  uint64_t v4 = [(WLKURLRequestProperties *)&v8 description];
  uint64_t v5 = [(WLKURLRequestProperties *)self shortDescription];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (void)setRouteName:(id)a3
{
}

- (NSString)httpMethod
{
  return self->_httpMethod;
}

- (NSDictionary)queryParameters
{
  return self->_queryParameters;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (NSData)httpBody
{
  return self->_httpBody;
}

- (NSString)caller
{
  return self->_caller;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (NSNumber)apiVersion
{
  return self->_apiVersion;
}

- (void)URLRequestWithConfiguration:.cold.1()
{
}

- (void)copyWithZone:.cold.1()
{
}

@end