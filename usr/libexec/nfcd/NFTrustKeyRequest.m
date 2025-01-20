@interface NFTrustKeyRequest
+ (BOOL)supportsSecureCoding;
+ (id)keyRequestWithSubjectIdentifier:(id)a3 discretionaryData:(id)a4 localValidations:(id)a5 counterLimit:(id)a6;
- (NFTrustKeyRequest)initWithCoder:(id)a3;
- (NSArray)localValidations;
- (NSData)discretionaryData;
- (NSData)subjectIdentifier;
- (NSNumber)counterLimit;
- (void)encodeWithCoder:(id)a3;
- (void)setCounterLimit:(id)a3;
- (void)setDiscretionaryData:(id)a3;
- (void)setLocalValidations:(id)a3;
- (void)setSubjectIdentifier:(id)a3;
@end

@implementation NFTrustKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustKeyRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFTrustKeyRequest;
  v5 = [(NFTrustObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = +[NFNSCheckedDecoder coder:v4 decodeArrayOfArrayOfClass:objc_opt_class() forKey:@"localValidations"];
    [(NFTrustKeyRequest *)v5 setValue:v6 forKey:@"localValidations"];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterLimit"];
    [(NFTrustKeyRequest *)v5 setValue:v7 forKey:@"counterLimit"];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subjectIdentifier"];
    [(NFTrustKeyRequest *)v5 setValue:v8 forKey:@"subjectIdentifier"];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionaryData"];
    [(NFTrustKeyRequest *)v5 setValue:v9 forKey:@"discretionaryData"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NFTrustKeyRequest *)self localValidations];
  [v4 encodeObject:v5 forKey:@"localValidations"];

  v6 = [(NFTrustKeyRequest *)self counterLimit];
  [v4 encodeObject:v6 forKey:@"counterLimit"];

  v7 = [(NFTrustKeyRequest *)self subjectIdentifier];
  [v4 encodeObject:v7 forKey:@"subjectIdentifier"];

  id v8 = [(NFTrustKeyRequest *)self discretionaryData];
  [v4 encodeObject:v8 forKey:@"discretionaryData"];
}

+ (id)keyRequestWithSubjectIdentifier:(id)a3 discretionaryData:(id)a4 localValidations:(id)a5 counterLimit:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v27 = 45;
      if (isMetaClass) {
        uint64_t v27 = 43;
      }
      v23(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier", v27, ClassName, Name, 272);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    v28 = object_getClass(a1);
    if (class_isMetaClass(v28)) {
      int v29 = 43;
    }
    else {
      int v29 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v71 = v29;
    __int16 v72 = 2082;
    v73 = object_getClassName(a1);
    __int16 v74 = 2082;
    v75 = sel_getName(a2);
    __int16 v76 = 1024;
    int v77 = 272;
    v30 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier";
    goto LABEL_54;
  }
  if (v13)
  {
    if (![v13 count])
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v42 = NFLogGetLogger();
      if (v42)
      {
        v43 = (void (*)(uint64_t, const char *, ...))v42;
        v44 = object_getClass(a1);
        BOOL v45 = class_isMetaClass(v44);
        v46 = object_getClassName(a1);
        v63 = sel_getName(a2);
        uint64_t v47 = 45;
        if (v45) {
          uint64_t v47 = 43;
        }
        v43(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation", v47, v46, v63, 279);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v15 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      v48 = object_getClass(a1);
      if (class_isMetaClass(v48)) {
        int v49 = 43;
      }
      else {
        int v49 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v71 = v49;
      __int16 v72 = 2082;
      v73 = object_getClassName(a1);
      __int16 v74 = 2082;
      v75 = sel_getName(a2);
      __int16 v76 = 1024;
      int v77 = 279;
      v30 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation";
      goto LABEL_54;
    }
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v65 objects:v69 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v66;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v66 != v18) {
            objc_enumerationMutation(v15);
          }
          if (![*(id *)(*((void *)&v65 + 1) + 8 * i) count])
          {
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t v31 = NFLogGetLogger();
            if (v31)
            {
              v32 = (void (*)(uint64_t, const char *, ...))v31;
              v33 = object_getClass(a1);
              BOOL v34 = class_isMetaClass(v33);
              v35 = object_getClassName(a1);
              v62 = sel_getName(a2);
              uint64_t v36 = 45;
              if (v34) {
                uint64_t v36 = 43;
              }
              v32(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", v36, v35, v62, 285, (void)v65);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v37 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v38 = object_getClass(a1);
              if (class_isMetaClass(v38)) {
                int v39 = 43;
              }
              else {
                int v39 = 45;
              }
              v40 = object_getClassName(a1);
              v41 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v71 = v39;
              __int16 v72 = 2082;
              v73 = v40;
              __int16 v74 = 2082;
              v75 = v41;
              __int16 v76 = 1024;
              int v77 = 285;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", buf, 0x22u);
            }

            goto LABEL_55;
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v65 objects:v69 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
  }
  if (v14 && ![v14 unsignedIntegerValue])
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v50 = NFLogGetLogger();
    if (v50)
    {
      v51 = (void (*)(uint64_t, const char *, ...))v50;
      v52 = object_getClass(a1);
      BOOL v53 = class_isMetaClass(v52);
      v54 = object_getClassName(a1);
      v64 = sel_getName(a2);
      uint64_t v55 = 45;
      if (v53) {
        uint64_t v55 = 43;
      }
      v51(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0", v55, v54, v64, 294, (void)v65);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    v56 = object_getClass(a1);
    if (class_isMetaClass(v56)) {
      int v57 = 43;
    }
    else {
      int v57 = 45;
    }
    v58 = object_getClassName(a1);
    v59 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v71 = v57;
    __int16 v72 = 2082;
    v73 = v58;
    __int16 v74 = 2082;
    v75 = v59;
    __int16 v76 = 1024;
    int v77 = 294;
    v30 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0";
LABEL_54:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v30, buf, 0x22u);
LABEL_55:

    v21 = 0;
    goto LABEL_56;
  }
  v20 = [NFTrustKeyRequest alloc];
  v21 = v20;
  if (v20)
  {
    [(NFTrustKeyRequest *)v20 setDiscretionaryData:v12];
    [(NFTrustKeyRequest *)v21 setSubjectIdentifier:v11];
    [(NFTrustKeyRequest *)v21 setLocalValidations:v13];
    [(NFTrustKeyRequest *)v21 setCounterLimit:v14];
  }
LABEL_56:

  return v21;
}

- (NSData)subjectIdentifier
{
  return self->_subjectIdentifier;
}

- (void)setSubjectIdentifier:(id)a3
{
}

- (NSData)discretionaryData
{
  return self->_discretionaryData;
}

- (void)setDiscretionaryData:(id)a3
{
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
}

- (NSNumber)counterLimit
{
  return self->_counterLimit;
}

- (void)setCounterLimit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_discretionaryData, 0);

  objc_storeStrong((id *)&self->_subjectIdentifier, 0);
}

@end