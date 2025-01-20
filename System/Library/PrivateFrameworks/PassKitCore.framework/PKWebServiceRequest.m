@interface PKWebServiceRequest
+ (BOOL)supportsSecureCoding;
+ (id)_HTTPBodyWithDictionary:(id)a3;
- (NSArray)diagnosticReasons;
- (NSString)boundInterfaceIdentifier;
- (NSString)sourceApplicationIdentifier;
- (PKWebServiceRequest)initWithCoder:(id)a3;
- (double)timeoutOverride;
- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6;
- (id)_murlRequestWithURL:(id)a3;
- (id)_murlRequestWithURL:(id)a3 appleAccountInformation:(id)a4;
- (unint64_t)cachePolicyOverride;
- (void)addDiagnosticReason:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundInterfaceIdentifier:(id)a3;
- (void)setCachePolicyOverride:(unint64_t)a3;
- (void)setDiagnosticReasons:(id)a3;
- (void)setSourceApplicationIdentifier:(id)a3;
- (void)setTimeoutOverride:(double)a3;
@end

@implementation PKWebServiceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKWebServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKWebServiceRequest;
  v5 = [(PKWebServiceRequest *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"boundInterfaceIdentifier"];
    boundInterfaceIdentifier = v5->_boundInterfaceIdentifier;
    v5->_boundInterfaceIdentifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"diagnosticReasonsList"];
    diagnosticReasonsList = v5->_diagnosticReasonsList;
    v5->_diagnosticReasonsList = (NSMutableArray *)v11;

    v5->_cachePolicyOverride = [v4 decodeIntegerForKey:@"cachePolicyOverride"];
    [v4 decodeDoubleForKey:@"timeoutOverride"];
    v5->_timeoutOverride = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  boundInterfaceIdentifier = self->_boundInterfaceIdentifier;
  id v5 = a3;
  [v5 encodeObject:boundInterfaceIdentifier forKey:@"boundInterfaceIdentifier"];
  [v5 encodeObject:self->_diagnosticReasonsList forKey:@"diagnosticReasonsList"];
  [v5 encodeInteger:self->_cachePolicyOverride forKey:@"cachePolicyOverride"];
  [v5 encodeDouble:@"timeoutOverride" forKey:self->_timeoutOverride];
}

+ (id)_HTTPBodyWithDictionary:(id)a3
{
  if (a3)
  {
    id v6 = 0;
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:a3 options:1 error:&v6];
    id v4 = v6;
    if (!v3) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Could not create ; data for %@: %@",
    }
        objc_opt_class(),
        v4);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)addDiagnosticReason:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    diagnosticReasonsList = self->_diagnosticReasonsList;
    id v8 = v4;
    if (!diagnosticReasonsList)
    {
      id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = self->_diagnosticReasonsList;
      self->_diagnosticReasonsList = v6;

      diagnosticReasonsList = self->_diagnosticReasonsList;
    }
    [(NSMutableArray *)diagnosticReasonsList addObject:v8];
    id v4 = v8;
  }
}

- (void)setDiagnosticReasons:(id)a3
{
  id v4 = (NSMutableArray *)[a3 mutableCopy];
  diagnosticReasonsList = self->_diagnosticReasonsList;
  self->_diagnosticReasonsList = v4;
}

- (NSArray)diagnosticReasons
{
  v2 = (void *)[(NSMutableArray *)self->_diagnosticReasonsList copy];
  return (NSArray *)v2;
}

- (id)_murlRequestWithURL:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_190E10000, v5, OS_LOG_TYPE_ERROR, "Warning: No url passed when creating NSMutableURLRequest. The NSURLRequest should not be performed while the URL remains nil.", v12, 2u);
    }
  }
  id v6 = [MEMORY[0x1E4F18D50] requestWithURL:v4];
  v7 = +[PKPaymentDevice clientInfoHTTPHeader];
  [v6 setValue:v7 forHTTPHeaderField:@"X-Apple-Client-Info"];

  id v8 = +[PKPaymentDevice clientHardwarePlatformInfoHTTPHeader];
  if (v8) {
    [v6 setValue:v8 forHTTPHeaderField:@"x-apple-soc-type"];
  }
  if (os_variant_has_internal_ui()) {
    [v6 setValue:@"true" forHTTPHeaderField:@"X-Apple-Internal-Install"];
  }
  if ([(NSMutableArray *)self->_diagnosticReasonsList count])
  {
    uint64_t v9 = [(NSMutableArray *)self->_diagnosticReasonsList componentsJoinedByString:@", "];
    if (v9) {
      [v6 setValue:v9 forHTTPHeaderField:@"X-Apple-Diagnostic-Reasons"];
    }
  }
  if (self->_cachePolicyOverride) {
    objc_msgSend(v6, "setCachePolicy:");
  }
  if (self->_timeoutOverride > 0.0) {
    objc_msgSend(v6, "setTimeoutInterval:");
  }
  sourceApplicationIdentifier = self->_sourceApplicationIdentifier;
  if (sourceApplicationIdentifier) {
    [v6 setValue:sourceApplicationIdentifier forHTTPHeaderField:@"x-apple-forwarded-for-application-identifier"];
  }
  [v6 setBoundInterfaceIdentifier:self->_boundInterfaceIdentifier];

  return v6;
}

- (id)_murlRequestWithURL:(id)a3 appleAccountInformation:(id)a4
{
  id v6 = a4;
  v7 = [(PKWebServiceRequest *)self _murlRequestWithURL:a3];
  id v8 = [v6 authorizationHeader];

  if (v8) {
    [v7 setValue:v8 forHTTPHeaderField:@"Authorization"];
  }
  objc_msgSend(MEMORY[0x1E4F1CA20], "pk_deviceLanguage");
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v9 length])
  {
    v10 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Error: No device language returned. Defaulting to en", v12, 2u);
    }

    uint64_t v9 = @"en";
  }
  [v7 setValue:v9 forHTTPHeaderField:@"Accept-Language"];

  return v7;
}

- (id)_murlRequestWithServiceURL:(id)a3 endpointComponents:(id)a4 queryParameters:(id)a5 appleAccountInformation:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v40 = a5;
  id v36 = a6;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      uint64_t v14 = 0;
      objc_super v15 = v9;
      do
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
        v17 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
        v18 = [v16 stringByAddingPercentEncodingWithAllowedCharacters:v17];
        id v9 = [v15 URLByAppendingPathComponent:v18];

        ++v14;
        objc_super v15 = v9;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v12);
  }
  v38 = v10;
  v19 = [MEMORY[0x1E4F28E78] string];
  v20 = [MEMORY[0x1E4F28B88] URLQueryAllowedCharacterSet];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [v40 allKeys];
  uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v42;
    v24 = @"?";
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        v27 = [v26 stringByAddingPercentEncodingWithAllowedCharacters:v20];
        v28 = [v40 objectForKey:v26];
        v29 = [v28 stringByAddingPercentEncodingWithAllowedCharacters:v20];

        [v19 appendFormat:@"%@%@=%@", v24, v27, v29];
        v24 = @"&";
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v22);
  }

  v30 = [v9 absoluteString];
  v31 = (void *)MEMORY[0x1E4F1CB10];
  v32 = [v30 stringByAppendingString:v19];
  v33 = [v31 URLWithString:v32];

  v34 = [(PKWebServiceRequest *)self _murlRequestWithURL:v33 appleAccountInformation:v36];

  return v34;
}

- (NSString)boundInterfaceIdentifier
{
  return self->_boundInterfaceIdentifier;
}

- (void)setBoundInterfaceIdentifier:(id)a3
{
}

- (unint64_t)cachePolicyOverride
{
  return self->_cachePolicyOverride;
}

- (void)setCachePolicyOverride:(unint64_t)a3
{
  self->_cachePolicyOverride = a3;
}

- (double)timeoutOverride
{
  return self->_timeoutOverride;
}

- (void)setTimeoutOverride:(double)a3
{
  self->_timeoutOverride = a3;
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void)setSourceApplicationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_boundInterfaceIdentifier, 0);
  objc_storeStrong((id *)&self->_diagnosticReasonsList, 0);
}

@end