@interface RBSHandshakeResponse
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)assertionErrorsByOldIdentifier;
- (NSDictionary)assertionIdentifiersByOldIdentifier;
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (RBSHandshakeResponse)initWithRBSXPCCoder:(id)a3;
- (RBSProcessHandle)handle;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setAssertionErrorsByOldIdentifier:(id)a3;
- (void)setAssertionIdentifiersByOldIdentifier:(id)a3;
- (void)setHandle:(id)a3;
- (void)setManagedEndpointByLaunchIdentifier:(id)a3;
@end

@implementation RBSHandshakeResponse

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  handle = self->_handle;
  id v9 = a3;
  [(RBSProcessHandle *)handle fullEncode:v9 forKey:@"_handle"];
  v5 = [(NSDictionary *)self->_assertionIdentifiersByOldIdentifier allKeys];
  [v9 encodeObject:v5 forKey:@"success-keys"];

  v6 = [(NSDictionary *)self->_assertionIdentifiersByOldIdentifier allValues];
  [v9 encodeObject:v6 forKey:@"success-values"];

  v7 = [(NSDictionary *)self->_assertionErrorsByOldIdentifier allKeys];
  [v9 encodeObject:v7 forKey:@"fail-keys"];

  v8 = [(NSDictionary *)self->_assertionErrorsByOldIdentifier allValues];
  [v9 encodeObject:v8 forKey:@"fail-values"];

  [v9 encodeDictionary:self->_managedEndpointByLaunchIdentifier forKey:@"_managedEndpointByLaunchIdentifier"];
}

- (NSDictionary)assertionIdentifiersByOldIdentifier
{
  return self->_assertionIdentifiersByOldIdentifier;
}

- (NSDictionary)assertionErrorsByOldIdentifier
{
  return self->_assertionErrorsByOldIdentifier;
}

- (void)setManagedEndpointByLaunchIdentifier:(id)a3
{
}

- (void)setHandle:(id)a3
{
}

- (void)setAssertionIdentifiersByOldIdentifier:(id)a3
{
}

- (void)setAssertionErrorsByOldIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedEndpointByLaunchIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionErrorsByOldIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionIdentifiersByOldIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (RBSHandshakeResponse)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RBSHandshakeResponse;
  v5 = [(RBSHandshakeResponse *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (RBSProcessHandle *)v6;

    if ([v4 containsValueForKey:@"success-values"])
    {
      v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = objc_opt_class();
      v10 = [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"success-values"];
      uint64_t v11 = objc_opt_class();
      v12 = [v4 decodeCollectionOfClass:v11 containingClass:objc_opt_class() forKey:@"success-keys"];
      uint64_t v13 = [v8 dictionaryWithObjects:v10 forKeys:v12];
      assertionIdentifiersByOldIdentifier = v5->_assertionIdentifiersByOldIdentifier;
      v5->_assertionIdentifiersByOldIdentifier = (NSDictionary *)v13;
    }
    if ([v4 containsValueForKey:@"fail-values"])
    {
      v15 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v16 = objc_opt_class();
      v17 = [v4 decodeCollectionOfClass:v16 containingClass:objc_opt_class() forKey:@"fail-values"];
      uint64_t v18 = objc_opt_class();
      v19 = [v4 decodeCollectionOfClass:v18 containingClass:objc_opt_class() forKey:@"fail-keys"];
      uint64_t v20 = [v15 dictionaryWithObjects:v17 forKeys:v19];
      assertionErrorsByOldIdentifier = v5->_assertionErrorsByOldIdentifier;
      v5->_assertionErrorsByOldIdentifier = (NSDictionary *)v20;
    }
    uint64_t v22 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"_managedEndpointByLaunchIdentifier"];
    managedEndpointByLaunchIdentifier = v5->_managedEndpointByLaunchIdentifier;
    v5->_managedEndpointByLaunchIdentifier = (NSDictionary *)v22;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (RBSHandshakeResponse *)a3;
  if (self == v4) {
    goto LABEL_29;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    BOOL v6 = 0;
    goto LABEL_30;
  }
  handle = self->_handle;
  v8 = v4->_handle;
  if (handle != v8)
  {
    BOOL v6 = 0;
    if (!handle || !v8) {
      goto LABEL_30;
    }
    if (!-[RBSProcessHandle isEqual:](handle, "isEqual:")) {
      goto LABEL_3;
    }
  }
  assertionIdentifiersByOldIdentifier = self->_assertionIdentifiersByOldIdentifier;
  v10 = v4->_assertionIdentifiersByOldIdentifier;
  if (assertionIdentifiersByOldIdentifier != v10)
  {
    BOOL v6 = 0;
    if (!assertionIdentifiersByOldIdentifier || !v10) {
      goto LABEL_30;
    }
    if (!-[NSDictionary isEqual:](assertionIdentifiersByOldIdentifier, "isEqual:")) {
      goto LABEL_3;
    }
  }
  assertionErrorsByOldIdentifier = self->_assertionErrorsByOldIdentifier;
  v12 = v4->_assertionErrorsByOldIdentifier;
  if (assertionErrorsByOldIdentifier != v12)
  {
    BOOL v6 = 0;
    if (!assertionErrorsByOldIdentifier || !v12) {
      goto LABEL_30;
    }
    if (!-[NSDictionary isEqual:](assertionErrorsByOldIdentifier, "isEqual:")) {
      goto LABEL_3;
    }
  }
  managedEndpointByLaunchIdentifier = self->_managedEndpointByLaunchIdentifier;
  CFDictionaryRef v14 = (const __CFDictionary *)v4->_managedEndpointByLaunchIdentifier;
  if (managedEndpointByLaunchIdentifier == (NSDictionary *)v14)
  {
LABEL_29:
    BOOL v6 = 1;
    goto LABEL_30;
  }
  BOOL v6 = 0;
  if (managedEndpointByLaunchIdentifier && v14)
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)managedEndpointByLaunchIdentifier);
    if (Count != CFDictionaryGetCount(v14)) {
      goto LABEL_3;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v16 = managedEndpointByLaunchIdentifier;
    uint64_t v17 = [(NSDictionary *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v22 = -[NSDictionary objectForKey:](v16, "objectForKey:", v21, (void)v26);
          v23 = [(__CFDictionary *)v14 objectForKey:v21];
          int v24 = [v22 _isEquivalentToEndpoint:v23];

          if (!v24)
          {
            BOOL v6 = 0;
            goto LABEL_32;
          }
        }
        uint64_t v18 = [(NSDictionary *)v16 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 1;
LABEL_32:
  }
LABEL_30:

  return v6;
}

@end