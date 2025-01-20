@interface DMDiPhoneOSTaskServerDelegate
- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7;
@end

@implementation DMDiPhoneOSTaskServerDelegate

- (id)operationForRequest:(id)a3 targetUID:(unsigned int)a4 appleID:(id)a5 transport:(id)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)DMDiPhoneOSTaskServerDelegate;
  id v29 = 0;
  v14 = [(DMDTaskServerDelegate *)&v28 operationForRequest:a3 targetUID:v9 appleID:v12 transport:v13 error:&v29];
  id v15 = v29;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_27;
  }
  unsigned int v16 = [v13 effectiveUserIdentifier];
  uid_t v17 = getuid();
  v18 = +[DMDAccountUtilities primaryAppleID];
  unsigned __int8 v19 = [v12 isEqualToString:v18];

  if (!v16 || v16 == v9)
  {
    BOOL v20 = v12 != 0;
    if (v12) {
      char v21 = v19;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0) {
      goto LABEL_22;
    }
    if (!v9) {
      goto LABEL_23;
    }
  }
  else
  {
    if (!v9 && !v12)
    {
      BOOL v20 = 0;
      goto LABEL_23;
    }
    if (!v12) {
      goto LABEL_20;
    }
    if ((v19 & 1) == 0)
    {
      BOOL v20 = 1;
      goto LABEL_22;
    }
    if (v16 != v17)
    {
LABEL_20:
      BOOL v20 = v12 != 0;
      goto LABEL_22;
    }
    BOOL v20 = 1;
    if (!v9) {
      goto LABEL_23;
    }
  }
  if (!v20 && v17 != v9)
  {
    BOOL v20 = 0;
LABEL_22:
    uint64_t v22 = DMFErrorWithCodeAndUserInfo();

    id v15 = (id)v22;
  }
LABEL_23:
  if (v9) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = v20;
  }
  v24 = [v14 context];
  [v24 setRunAsUser:v23];

LABEL_27:
  if (a7) {
    *a7 = v15;
  }
  if (v15) {
    v25 = 0;
  }
  else {
    v25 = v14;
  }
  id v26 = v25;

  return v26;
}

@end