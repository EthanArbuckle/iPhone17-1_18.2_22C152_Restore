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
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v16 = 45;
      if (isMetaClass) {
        uint64_t v16 = 43;
      }
      v12(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge", v16, ClassName, Name, 344);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v18 = object_getClass(a1);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v33 = v19;
    __int16 v34 = 2082;
    v35 = object_getClassName(a1);
    __int16 v36 = 2082;
    v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 344;
    v20 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with nil challenge";
    goto LABEL_25;
  }
  if ([v7 length] != (id)8)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t v21 = NFLogGetLogger();
    if (v21)
    {
      v22 = (void (*)(uint64_t, const char *, ...))v21;
      v23 = object_getClass(a1);
      BOOL v24 = class_isMetaClass(v23);
      v25 = object_getClassName(a1);
      v31 = sel_getName(a2);
      uint64_t v26 = 45;
      if (v24) {
        uint64_t v26 = 43;
      }
      v22(3, "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08", v26, v25, v31, 349);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v17 = NFSharedLogGetLogger();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    v27 = object_getClass(a1);
    if (class_isMetaClass(v27)) {
      int v28 = 43;
    }
    else {
      int v28 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v33 = v28;
    __int16 v34 = 2082;
    v35 = object_getClassName(a1);
    __int16 v36 = 2082;
    v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 349;
    v20 = "%c[%{public}s %{public}s]:%i Could not create SignRequest with challenge length != 0x08";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v20, buf, 0x22u);
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