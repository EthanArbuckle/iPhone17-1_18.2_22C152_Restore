@interface PDBarcodeServiceConnectionTask
+ (BOOL)supportsSecureCoding;
- (BOOL)isValid;
- (NSString)passUniqueIdentifier;
- (NSURL)barcodeServiceURL;
- (PDBarcodeServiceConnectionTask)initWithCoder:(id)a3;
- (const)backoffLevels;
- (id)bodyDictionary;
- (id)endpointComponents;
- (id)headerFields;
- (id)method;
- (id)queryFields;
- (id)request;
- (unint64_t)numberOfBackoffLevels;
- (void)encodeWithCoder:(id)a3;
- (void)handleResponse:(id)a3 data:(id)a4;
- (void)setBarcodeServiceURL:(id)a3;
- (void)setPassUniqueIdentifier:(id)a3;
@end

@implementation PDBarcodeServiceConnectionTask

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDBarcodeServiceConnectionTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDBarcodeServiceConnectionTask;
  v5 = [(PDNetworkTask *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"barcodeServiceURL"];
    barcodeServiceURL = v5->_barcodeServiceURL;
    v5->_barcodeServiceURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
    passUniqueIdentifier = v5->_passUniqueIdentifier;
    v5->_passUniqueIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDBarcodeServiceConnectionTask;
  id v4 = a3;
  [(PDNetworkTask *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_barcodeServiceURL, @"barcodeServiceURL", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
}

- (id)method
{
  return 0;
}

- (id)endpointComponents
{
  return 0;
}

- (id)queryFields
{
  return 0;
}

- (id)headerFields
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = +[NSDate date];
  id v4 = PKRFC1123StringForDate();
  [v2 setObject:v4 forKeyedSubscript:@"Date"];

  id v5 = [v2 copy];
  return v5;
}

- (id)bodyDictionary
{
  return 0;
}

- (const)backoffLevels
{
  return (const $82EDB067EE6F192B39F18594CC8676AD *)&_FasterBackoffLevels;
}

- (unint64_t)numberOfBackoffLevels
{
  return 7;
}

- (id)request
{
  v3 = [(PDBarcodeServiceConnectionTask *)self barcodeServiceURL];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v4 = [(PDBarcodeServiceConnectionTask *)self endpointComponents];
  id v5 = [v4 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v64;
    do
    {
      uint64_t v8 = 0;
      v9 = v3;
      do
      {
        if (*(void *)v64 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v8);
        objc_super v11 = +[NSCharacterSet URLPathAllowedCharacterSet];
        v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];
        v3 = [v9 URLByAppendingPathComponent:v12];

        uint64_t v8 = (char *)v8 + 1;
        v9 = v3;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v6);
  }

  v50 = self;
  v13 = [(PDBarcodeServiceConnectionTask *)self queryFields];
  +[NSMutableString string];
  v53 = v52 = v13;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = [v13 allKeys];
  id v14 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v60;
    CFStringRef v17 = @"?";
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v60 != v16) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        v20 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        v21 = [v19 stringByAddingPercentEncodingWithAllowedCharacters:v20];

        v22 = [v52 objectForKey:v19];
        v23 = +[NSCharacterSet URLQueryAllowedCharacterSet];
        v24 = [v22 stringByAddingPercentEncodingWithAllowedCharacters:v23];

        [v53 appendFormat:@"%@%@=%@", v17, v21, v24];
        CFStringRef v17 = @"&";
      }
      id v15 = [obj countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v15);
  }

  v25 = [v3 absoluteString];
  v26 = [v25 stringByAppendingString:v53];
  v27 = +[NSURL URLWithString:v26];

  id v28 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v27];
  v29 = [(PDBarcodeServiceConnectionTask *)v50 method];
  [v28 setHTTPMethod:v29];

  [v28 setHTTPShouldHandleCookies:0];
  [v28 setCachePolicy:1];
  v30 = [(PDBarcodeServiceConnectionTask *)v50 headerFields];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v31 = [v30 allKeys];
  id v32 = [v31 countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v56;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v55 + 1) + 8 * (void)j);
        v37 = [v30 objectForKey:v36];
        [v28 setValue:v37 forHTTPHeaderField:v36];
      }
      id v33 = [v31 countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v33);
  }

  v38 = [(PDBarcodeServiceConnectionTask *)v50 bodyDictionary];
  if (v38)
  {
    id v54 = 0;
    v39 = +[NSJSONSerialization dataWithJSONObject:v38 options:0 error:&v54];
    id v40 = v54;
    if (v39)
    {
      [v28 setHTTPBody:v39];
      [v28 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
      [v28 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    else
    {
      v41 = v27;
      v42 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v50;
        __int16 v69 = 2112;
        id v70 = v40;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Could not create body data task for task %@: %@", buf, 0x16u);
      }

      id v28 = 0;
      v27 = v41;
    }
  }
  v43 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = [v28 URL];
    v45 = [v28 allHTTPHeaderFields];
    [v45 debugDescription];
    v47 = v46 = v27;
    v48 = [v38 debugDescription];
    *(_DWORD *)buf = 138412802;
    v68 = v44;
    __int16 v69 = 2112;
    id v70 = v47;
    __int16 v71 = 2112;
    v72 = v48;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Auxiliary capability connection request:\n%@\n%@\n%@\n", buf, 0x20u);

    v27 = v46;
  }

  return v28;
}

- (void)handleResponse:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = +[NSJSONSerialization JSONObjectWithData:a4 options:0 error:0];
  uint64_t v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 URL];
    id v9 = [v5 statusCode];
    v10 = [v5 allHeaderFields];
    objc_super v11 = [v10 debugDescription];
    v12 = [v6 debugDescription];
    int v13 = 138413058;
    id v14 = v8;
    __int16 v15 = 2048;
    id v16 = v9;
    __int16 v17 = 2112;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Auxiliary capability connection response:\n%@ %ld\n%@\n%@\n", (uint8_t *)&v13, 0x2Au);
  }
}

- (BOOL)isValid
{
  return self->_barcodeServiceURL != 0;
}

- (NSURL)barcodeServiceURL
{
  return self->_barcodeServiceURL;
}

- (void)setBarcodeServiceURL:(id)a3
{
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (void)setPassUniqueIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_barcodeServiceURL, 0);
}

@end