@interface NFTrustSignRequest
+ (BOOL)supportsSecureCoding;
+ (id)signRequestWithChallenge:(id)a3 data:(id)a4;
- (NFTrustSignRequest)initWithCoder:(id)a3;
- (NSData)challenge;
- (NSData)data;
- (void)encodeWithCoder:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setData:(id)a3;
@end

@implementation NFTrustSignRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustSignRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFTrustSignRequest;
  v5 = [(NFTrustObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
    [(NFTrustSignRequest *)v5 setValue:v6 forKey:@"challenge"];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(NFTrustSignRequest *)v5 setValue:v7 forKey:@"data"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NFTrustSignRequest *)self challenge];
  [v4 encodeObject:v5 forKey:@"challenge"];

  id v6 = [(NFTrustSignRequest *)self data];
  [v4 encodeObject:v6 forKey:@"data"];
}

+ (id)signRequestWithChallenge:(id)a3 data:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v17 = 45;
      if (isMetaClass) {
        uint64_t v17 = 43;
      }
      v13(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge", v17, ClassName, Name, 344);
    }
    dispatch_get_specific(*v11);
    v18 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v19 = object_getClass(a1);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v35 = v20;
    __int16 v36 = 2082;
    v37 = object_getClassName(a1);
    __int16 v38 = 2082;
    v39 = sel_getName(a2);
    __int16 v40 = 1024;
    int v41 = 344;
    v21 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge";
    goto LABEL_25;
  }
  if ([v7 length] != 8)
  {
    v22 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = object_getClass(a1);
      BOOL v26 = class_isMetaClass(v25);
      v27 = object_getClassName(a1);
      v33 = sel_getName(a2);
      uint64_t v28 = 45;
      if (v26) {
        uint64_t v28 = 43;
      }
      v24(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08", v28, v27, v33, 349);
    }
    dispatch_get_specific(*v22);
    v18 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v29 = object_getClass(a1);
    if (class_isMetaClass(v29)) {
      int v30 = 43;
    }
    else {
      int v30 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v35 = v30;
    __int16 v36 = 2082;
    v37 = object_getClassName(a1);
    __int16 v38 = 2082;
    v39 = sel_getName(a2);
    __int16 v40 = 1024;
    int v41 = 349;
    v21 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08";
LABEL_25:
    _os_log_impl(&dword_19D636000, v18, OS_LOG_TYPE_ERROR, v21, buf, 0x22u);
LABEL_26:

    v10 = 0;
    goto LABEL_27;
  }
  if (![v8 length])
  {

    id v8 = 0;
  }
  id v9 = objc_alloc((Class)a1);
  v10 = v9;
  if (v9)
  {
    [v9 setChallenge:v7];
    [v10 setData:v8];
  }
LABEL_27:

  return v10;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

@end