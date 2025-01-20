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
    v6 = [MEMORY[0x1E4FBA858] coder:v4 decodeArrayOfArrayOfClass:objc_opt_class() forKey:@"localValidations"];
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
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v22 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v24 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v28 = 45;
      if (isMetaClass) {
        uint64_t v28 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier", v28, ClassName, Name, 272);
    }
    dispatch_get_specific(*v22);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    v29 = object_getClass(a1);
    if (class_isMetaClass(v29)) {
      int v30 = 43;
    }
    else {
      int v30 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v76 = v30;
    __int16 v77 = 2082;
    v78 = object_getClassName(a1);
    __int16 v79 = 2082;
    v80 = sel_getName(a2);
    __int16 v81 = 1024;
    int v82 = 272;
    v31 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with nil subjectIdentifier";
    goto LABEL_54;
  }
  if (v13)
  {
    if (![v13 count])
    {
      v45 = (const void **)MEMORY[0x1E4FBA898];
      dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
      uint64_t v46 = NFLogGetLogger();
      if (v46)
      {
        v47 = (void (*)(uint64_t, const char *, ...))v46;
        v48 = object_getClass(a1);
        BOOL v49 = class_isMetaClass(v48);
        v50 = object_getClassName(a1);
        v68 = sel_getName(a2);
        uint64_t v51 = 45;
        if (v49) {
          uint64_t v51 = 43;
        }
        v47(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation", v51, v50, v68, 279);
      }
      dispatch_get_specific(*v45);
      v15 = NFSharedLogGetLogger();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      v52 = object_getClass(a1);
      if (class_isMetaClass(v52)) {
        int v53 = 43;
      }
      else {
        int v53 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v76 = v53;
      __int16 v77 = 2082;
      v78 = object_getClassName(a1);
      __int16 v79 = 2082;
      v80 = sel_getName(a2);
      __int16 v81 = 1024;
      int v82 = 279;
      v31 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest non nil but empty NFTrustOrLocalValidation";
      goto LABEL_54;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v71;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v71 != v18) {
            objc_enumerationMutation(v15);
          }
          if (![*(id *)(*((void *)&v70 + 1) + 8 * i) count])
          {
            v32 = (const void **)MEMORY[0x1E4FBA898];
            dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
            uint64_t v33 = NFLogGetLogger();
            if (v33)
            {
              v34 = (void (*)(uint64_t, const char *, ...))v33;
              v35 = object_getClass(a1);
              BOOL v36 = class_isMetaClass(v35);
              v37 = object_getClassName(a1);
              v67 = sel_getName(a2);
              BOOL v38 = !v36;
              v32 = (const void **)MEMORY[0x1E4FBA898];
              uint64_t v39 = 45;
              if (!v38) {
                uint64_t v39 = 43;
              }
              v34(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", v39, v37, v67, 285, (void)v70);
            }
            dispatch_get_specific(*v32);
            v40 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v41 = object_getClass(a1);
              if (class_isMetaClass(v41)) {
                int v42 = 43;
              }
              else {
                int v42 = 45;
              }
              v43 = object_getClassName(a1);
              v44 = sel_getName(a2);
              *(_DWORD *)buf = 67109890;
              int v76 = v42;
              __int16 v77 = 2082;
              v78 = v43;
              __int16 v79 = 2082;
              v80 = v44;
              __int16 v81 = 1024;
              int v82 = 285;
              _os_log_impl(&dword_19D636000, v40, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with empty NFTrustAndLocalValidation", buf, 0x22u);
            }

            goto LABEL_55;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v70 objects:v74 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
  }
  if (v14 && ![v14 unsignedIntegerValue])
  {
    v54 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v55 = NFLogGetLogger();
    if (v55)
    {
      v56 = (void (*)(uint64_t, const char *, ...))v55;
      v57 = object_getClass(a1);
      BOOL v58 = class_isMetaClass(v57);
      v59 = object_getClassName(a1);
      v69 = sel_getName(a2);
      uint64_t v60 = 45;
      if (v58) {
        uint64_t v60 = 43;
      }
      v56(3, "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0", v60, v59, v69, 294, (void)v70);
    }
    dispatch_get_specific(*v54);
    v15 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_55;
    }
    v61 = object_getClass(a1);
    if (class_isMetaClass(v61)) {
      int v62 = 43;
    }
    else {
      int v62 = 45;
    }
    v63 = object_getClassName(a1);
    v64 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    int v76 = v62;
    __int16 v77 = 2082;
    v78 = v63;
    __int16 v79 = 2082;
    v80 = v64;
    __int16 v81 = 1024;
    int v82 = 294;
    v31 = "%c[%{public}s %{public}s]:%i Could not create NFTrustCreateKeyRequest with counterLimit of 0";
LABEL_54:
    _os_log_impl(&dword_19D636000, v15, OS_LOG_TYPE_ERROR, v31, buf, 0x22u);
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