@interface NFAssertSuppressPresentmentIntentToDefaultApp
- (BOOL)isEntitled:(id)a3;
- (void)onAssertWithCompletion:(id)a3;
- (void)onDeassertWithCompletion:(id)a3;
@end

@implementation NFAssertSuppressPresentmentIntentToDefaultApp

- (BOOL)isEntitled:(id)a3
{
  id v3 = a3;
  v4 = [v3 NF_userInfo];
  v5 = [v4 objectForKey:@"serviceType"];

  if (!v5)
  {
    v9 = [v3 NF_whitelistChecker];
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_11;
  }
  id v6 = [v5 unsignedIntegerValue];
  id v7 = [v5 unsignedIntegerValue];
  v8 = [v3 NF_whitelistChecker];
  v9 = v8;
  if (v6 == (id)2)
  {
    unsigned __int8 v10 = [v8 nfcCardSessionAccess];
LABEL_10:
    BOOL v11 = v10;
    goto LABEL_11;
  }
  if (v7 != (id)1) {
    goto LABEL_8;
  }
  if (([v8 seCredentialManagerAccess] & 1) == 0)
  {
    unsigned __int8 v10 = [v9 internalAccess];
    goto LABEL_10;
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (void)onAssertWithCompletion:(id)a3
{
  v5 = (void (**)(id, void))a3;
  uint64_t v6 = +[_NFHardwareManager sharedHardwareManager];
  uint64_t v7 = v6;
  char v24 = 0;
  if (self)
  {
    BOOL fieldDetectOnly = self->_fieldDetectOnly;
    if (self->_fieldDetectOnly) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL fieldDetectOnly = 0;
    uint64_t v9 = 1;
    if (v6)
    {
LABEL_6:
      unsigned __int8 v10 = *(void **)(v6 + 120);
      goto LABEL_7;
    }
  }
  unsigned __int8 v10 = 0;
LABEL_7:
  id v11 = v10;
  unsigned int v12 = [v11 assert:v9 isFirst:&v24];

  if (v12)
  {
    if (v24) {
      char v13 = fieldDetectOnly;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      if (v7)
      {
        id v14 = *(id *)(v7 + 408);
        [v14 suspend];

        v15 = *(void **)(v7 + 24);
      }
      else
      {
        [0 suspend];
        v15 = 0;
      }
      v16 = v15;
      sub_10004360C(v16, 1u, 0);
    }
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else if (v5)
  {
    id v17 = objc_alloc((Class)NSError);
    v18 = +[NSString stringWithUTF8String:"nfcd"];
    v25[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithUTF8String:"Invalid State"];
    v26[0] = v19;
    v26[1] = &off_10031C990;
    v25[1] = @"Line";
    v25[2] = @"Method";
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v26[2] = v20;
    v25[3] = NSDebugDescriptionErrorKey;
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 87];
    v26[3] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    id v23 = [v17 initWithDomain:v18 code:12 userInfo:v22];
    ((void (**)(id, id))v5)[2](v5, v23);
  }
}

- (void)onDeassertWithCompletion:(id)a3
{
  v5 = (void (**)(id, void))a3;
  uint64_t v6 = +[_NFHardwareManager sharedHardwareManager];
  uint64_t v7 = v6;
  char v24 = 0;
  if (self)
  {
    BOOL fieldDetectOnly = self->_fieldDetectOnly;
    if (self->_fieldDetectOnly) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    if (v6) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL fieldDetectOnly = 0;
    uint64_t v9 = 1;
    if (v6)
    {
LABEL_6:
      unsigned __int8 v10 = *(void **)(v6 + 120);
      goto LABEL_7;
    }
  }
  unsigned __int8 v10 = 0;
LABEL_7:
  id v11 = v10;
  unsigned int v12 = [v11 deassert:v9 isLast:&v24];

  if (v12)
  {
    if (v24) {
      char v13 = fieldDetectOnly;
    }
    else {
      char v13 = 1;
    }
    if ((v13 & 1) == 0)
    {
      if (v7)
      {
        id v14 = *(id *)(v7 + 408);
        [v14 resume];

        v15 = *(void **)(v7 + 24);
      }
      else
      {
        [0 resume];
        v15 = 0;
      }
      v16 = v15;
      sub_10004360C(v16, 0, 0);
    }
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else if (v5)
  {
    id v17 = objc_alloc((Class)NSError);
    v18 = +[NSString stringWithUTF8String:"nfcd"];
    v25[0] = NSLocalizedDescriptionKey;
    v19 = +[NSString stringWithUTF8String:"Invalid State"];
    v26[0] = v19;
    v26[1] = &off_10031C9A8;
    v25[1] = @"Line";
    v25[2] = @"Method";
    id v20 = [objc_alloc((Class)NSString) initWithFormat:@"%s", sel_getName(a2)];
    v26[2] = v20;
    v25[3] = NSDebugDescriptionErrorKey;
    id v21 = [objc_alloc((Class)NSString) initWithFormat:@"%s:%d", sel_getName(a2), 118];
    v26[3] = v21;
    v22 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    id v23 = [v17 initWithDomain:v18 code:12 userInfo:v22];
    ((void (**)(id, id))v5)[2](v5, v23);
  }
}

- (void).cxx_destruct
{
}

@end