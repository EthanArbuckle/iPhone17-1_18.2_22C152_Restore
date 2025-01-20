@interface CCDValidationKeyInfo
- (BOOL)_validateCertificateArrayInDictionary:(id)a3;
- (BOOL)_validateCredentialTokenInDictionary:(id)a3;
- (BOOL)_validateDictionaryInDictionary:(id)a3 resultsDictionary:(id)a4;
- (BOOL)_validateHttpsURLStringInDictionary:(id)a3;
- (BOOL)_validateNumberInDictionary:(id)a3;
- (BOOL)_validateStringArrayInDictionary:(id)a3;
- (BOOL)_validateStringInDictionary:(id)a3;
- (BOOL)_validateUnstructureddDictionaryInDictionary:(id)a3;
- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4;
- (CCDValidationKeyInfo)initWithName:(id)a3 validationInfo:(id)a4;
- (NSArray)subKeys;
- (NSString)destinationKey;
- (id)_certificateDataFromBase64EncodedString:(id)a3;
- (id)description;
- (unint64_t)validationType;
- (void)setDestinationKey:(id)a3;
- (void)setSubKeys:(id)a3;
- (void)setValidationType:(unint64_t)a3;
@end

@implementation CCDValidationKeyInfo

- (CCDValidationKeyInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CCDValidationKeyInfo;
  v7 = [(CCDValidationInfo *)&v31 initWithName:a3 validationInfo:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"validationType"];
    v7->_validationType = (unint64_t)[v8 integerValue];

    uint64_t v9 = [v6 objectForKeyedSubscript:@"destinationKey"];
    destinationKey = v7->_destinationKey;
    v7->_destinationKey = (NSString *)v9;

    if (v7->_validationType == 8)
    {
      v11 = [v6 objectForKeyedSubscript:@"subKey"];

      if (v11)
      {
        id v26 = v6;
        v12 = [v6 objectForKeyedSubscript:@"subKey"];
        v13 = objc_opt_new();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v14 = v12;
        id v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v28;
          do
          {
            v18 = 0;
            do
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v18);
              v20 = [CCDValidationKeyInfo alloc];
              v21 = [v14 objectForKeyedSubscript:v19];
              v22 = [(CCDValidationKeyInfo *)v20 initWithName:v19 validationInfo:v21];
              [v13 addObject:v22];

              v18 = (char *)v18 + 1;
            }
            while (v16 != v18);
            id v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
          }
          while (v16);
        }

        v23 = (NSArray *)[v13 copy];
        subKeys = v7->_subKeys;
        v7->_subKeys = v23;

        id v6 = v26;
      }
    }
  }

  return v7;
}

- (id)description
{
  v3 = [(CCDValidationInfo *)self name];
  if ([(CCDValidationInfo *)self isRequired]) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  v5 = [(CCDValidationInfo *)self validationInfo];
  id v6 = [v5 objectForKeyedSubscript:@"validationType"];
  v7 = [(CCDValidationKeyInfo *)self destinationKey];
  v8 = +[NSString stringWithFormat:@"\n***********\nCloud Config Key Name: %@\nRequired: %@\nValidation Type: %@\nDestination Key: %@\n***********\n", v3, v4, v6, v7];

  return v8;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch([(CCDValidationKeyInfo *)self validationType])
  {
    case 0uLL:
    case 3uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateBooleanInDictionary:v6];
      goto LABEL_13;
    case 1uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateCertificateArrayInDictionary:v6];
      goto LABEL_13;
    case 2uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateHttpsURLStringInDictionary:v6];
      goto LABEL_13;
    case 4uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateNumberInDictionary:v6];
      goto LABEL_13;
    case 5uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateStringInDictionary:v6];
      goto LABEL_13;
    case 6uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateStringArrayInDictionary:v6];
      goto LABEL_13;
    case 7uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateCredentialTokenInDictionary:v6];
      goto LABEL_13;
    case 8uLL:
      v10 = objc_opt_new();
      LODWORD(v9) = [(CCDValidationKeyInfo *)self _validateDictionaryInDictionary:v6 resultsDictionary:v10];
      if (!v7) {
        break;
      }
      goto LABEL_14;
    case 9uLL:
      unsigned int v8 = [(CCDValidationKeyInfo *)self _validateUnstructureddDictionaryInDictionary:v6];
LABEL_13:
      LODWORD(v9) = v8;
      v10 = 0;
      if (v7)
      {
LABEL_14:
        if (v9)
        {
          v11 = [(CCDValidationInfo *)self name];
          uint64_t v9 = [v6 objectForKeyedSubscript:v11];

          if (v9)
          {
            switch([(CCDValidationKeyInfo *)self validationType])
            {
              case 1uLL:
                long long v28 = v9;
                id v12 = v9;
                v13 = objc_opt_new();
                long long v29 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                long long v32 = 0u;
                id v14 = v12;
                id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
                if (v15)
                {
                  id v16 = v15;
                  uint64_t v17 = *(void *)v30;
                  do
                  {
                    for (i = 0; i != v16; i = (char *)i + 1)
                    {
                      if (*(void *)v30 != v17) {
                        objc_enumerationMutation(v14);
                      }
                      uint64_t v19 = [(CCDValidationKeyInfo *)self _certificateDataFromBase64EncodedString:*(void *)(*((void *)&v29 + 1) + 8 * i)];
                      if (v19) {
                        [v13 addObject:v19];
                      }
                    }
                    id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
                  }
                  while (v16);
                }

                v20 = [(CCDValidationKeyInfo *)self destinationKey];
                [v7 setObject:v13 forKeyedSubscript:v20];

                uint64_t v9 = v28;
                break;
              case 3uLL:
                +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 BOOLValue] ^ 1);
                id v24 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_32;
              case 7uLL:
                v21 = [(CCDValidationKeyInfo *)self destinationKey];
                v23 = &__kCFBooleanTrue;
                v22 = v7;
                goto LABEL_30;
              case 8uLL:
                id v24 = [v10 copy];
LABEL_32:
                v25 = v24;
                id v26 = [(CCDValidationKeyInfo *)self destinationKey];
                [v7 setObject:v25 forKeyedSubscript:v26];

                break;
              default:
                v21 = [(CCDValidationKeyInfo *)self destinationKey];
                v22 = v7;
                v23 = v9;
LABEL_30:
                [v22 setObject:v23 forKeyedSubscript:v21];

                break;
            }
          }

          LOBYTE(v9) = 1;
        }
      }
      break;
    default:
      LOBYTE(v9) = 0;
      v10 = 0;
      break;
  }

  return (char)v9;
}

- (id)_certificateDataFromBase64EncodedString:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = +[CCDCertificateSupport decodeCertificateFromBase64String:v3];
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return v4;
}

- (BOOL)_validateCertificateArrayInDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CCDValidationInfo *)self name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = -[CCDValidationKeyInfo _certificateDataFromBase64EncodedString:](self, "_certificateDataFromBase64EncodedString:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);

          if (!v12)
          {
            BOOL v13 = 0;
            goto LABEL_13;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_13:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_validateHttpsURLStringInDictionary:(id)a3
{
  id v4 = a3;
  if ([(CCDValidationKeyInfo *)self _validateStringInDictionary:v4])
  {
    v5 = [(CCDValidationInfo *)self name];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      id v7 = +[NSURL URLWithString:v6];
      id v8 = [v7 scheme];
      unsigned __int8 v9 = [@"https" isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_validateNumberInDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CCDValidationInfo *)self name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  return v4 & 1;
}

- (BOOL)_validateStringInDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CCDValidationInfo *)self name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  objc_opt_class();
  LOBYTE(v4) = objc_opt_isKindOfClass();

  return v4 & 1;
}

- (BOOL)_validateStringArrayInDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CCDValidationInfo *)self name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    id v8 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      unsigned __int8 v9 = v8;
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v12 = 0;
            goto LABEL_13;
          }
        }
        unsigned __int8 v9 = (char *)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_13:
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_validateCredentialTokenInDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(CCDValidationInfo *)self name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  id v7 = +[CCDKeychain dataFromString:v6];
  id v14 = 0;
  LOWORD(v13) = 0;
  +[CCDKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:](CCDKeychain, "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:", v7, @"DEP-FastTime-Service", @"DEP-FastTime-Account", 0, 0, kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly, 0, v13, &v14);
  id v8 = v14;

  if (v8)
  {
    unsigned __int8 v9 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = v9;
      v11 = [v8 description];
      *(_DWORD *)buf = 138543362;
      long long v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error trying to store credentials in keychain!! \n Error:  %{public}@ \n Failing CloudConfig Validation...", buf, 0xCu);
    }
  }

  return v8 == 0;
}

- (BOOL)_validateDictionaryInDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CCDValidationInfo *)self name];
  unsigned __int8 v9 = [v6 objectForKeyedSubscript:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v10 = [v9 allKeys];
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v12 == (id)++v14)
        {
          id v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
          if (v12) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v10 = [(CCDValidationKeyInfo *)self subKeys];
      id v15 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (!v15)
      {
        BOOL v19 = 1;
        goto LABEL_21;
      }
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
LABEL_12:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v10);
        }
        if (![*(id *)(*((void *)&v21 + 1) + 8 * v18) validateSelfWithDictionary:v9 resultsDictionary:v7])break; {
        if (v16 == (id)++v18)
        }
        {
          id v16 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          BOOL v19 = 1;
          if (v16) {
            goto LABEL_12;
          }
          goto LABEL_21;
        }
      }
    }
    BOOL v19 = 0;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v19 = 0;
LABEL_22:

  return v19;
}

- (BOOL)_validateUnstructureddDictionaryInDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CCDValidationInfo *)self name];
  id v6 = [v4 objectForKeyedSubscript:v5];

  objc_opt_class();
  LOBYTE(v5) = objc_opt_isKindOfClass();

  return v5 & 1;
}

- (unint64_t)validationType
{
  return self->_validationType;
}

- (void)setValidationType:(unint64_t)a3
{
  self->_validationType = a3;
}

- (NSString)destinationKey
{
  return self->_destinationKey;
}

- (void)setDestinationKey:(id)a3
{
}

- (NSArray)subKeys
{
  return self->_subKeys;
}

- (void)setSubKeys:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subKeys, 0);

  objc_storeStrong((id *)&self->_destinationKey, 0);
}

@end