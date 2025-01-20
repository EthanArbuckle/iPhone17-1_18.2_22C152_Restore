@interface TCCDAttributionChain
- (BOOL)accessingProcessIsValid;
- (BOOL)accessingProcessSpecified;
- (BOOL)responsibleProcessIsDistinct;
- (BOOL)responsibleProcessIsValid;
- (TCCDAttributionChain)initWithMessage:(id)a3;
- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4;
- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4 processInfo:(id)a5;
- (TCCDProcess)accessingProcess;
- (TCCDProcess)requestingProcess;
- (TCCDProcess)responsibleProcess;
- (id)attributedBundleUsingOutermostBundle:(BOOL)a3 computedStaticCodeRef:(const void *)a4 computedNonIdentifiableBundleURL:(id *)a5;
- (id)createProcessFromAuditToken:(id *)a3 processInfo:(id)a4;
- (id)description;
- (void)getAuditToken:(id *)a3 fromMessage:(id)a4;
- (void)setAccessingProcessIsValid:(BOOL)a3;
- (void)setAccessingProcessSpecified:(BOOL)a3;
- (void)setRequestingProcess:(id)a3;
- (void)setResponsibleProcessIsDistinct:(BOOL)a3;
@end

@implementation TCCDAttributionChain

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingProcess, 0);
  objc_storeStrong((id *)&self->_responsibleProcess, 0);
  objc_storeStrong((id *)&self->_accessingProcess, 0);
}

- (id)attributedBundleUsingOutermostBundle:(BOOL)a3 computedStaticCodeRef:(const void *)a4 computedNonIdentifiableBundleURL:(id *)a5
{
  BOOL v6 = a3;
  v7 = [(TCCDAttributionChain *)self responsibleProcess];
  v8 = [v7 responsiblePath];
  v9 = +[NSURL fileURLWithPath:v8];

  if (a5) {
    *a5 = 0;
  }
  if (v9)
  {
    v10 = +[TCCDPlatform currentPlatform];
    v11 = v10;
    if (v6) {
      [v10 appBundleURLContainingExecutableURL:v9];
    }
    else {
    v13 = [v10 bundleURLContainingExecutableURL:v9];
    }

    if (v13)
    {
      v14 = +[TCCDBundle bundleWithURL:v13];
      if (v14)
      {
        v12 = v14;
        v15 = [v14 bundleIdentifier];

        if (v15)
        {
LABEL_19:

          goto LABEL_20;
        }
        v16 = +[TCCDPlatform currentPlatform];
        v17 = [v16 server];
        v18 = [v17 logHandle];

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 138543362;
          v23 = v13;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "BUNDLE_ATTRIBUTION: attributed bundle %{public}@ has no identifier and is not valid.", (uint8_t *)&v22, 0xCu);
        }

        if (a5) {
          *a5 = v13;
        }
      }
      else
      {
        v19 = +[TCCDPlatform currentPlatform];
        v20 = [v19 server];
        v12 = [v20 logHandle];

        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000555EC((uint64_t)v13, v12);
        }
      }
    }
    v12 = 0;
    goto LABEL_19;
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (TCCDProcess)responsibleProcess
{
  responsibleProcess = self->_responsibleProcess;
  if (responsibleProcess)
  {
    v3 = responsibleProcess;
  }
  else
  {
    v3 = [(TCCDAttributionChain *)self accessingProcess];
  }
  return v3;
}

- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4
{
  return [(TCCDAttributionChain *)self initWithMessage:a3 evaluateResponsibility:a4 processInfo:0];
}

- (TCCDAttributionChain)initWithMessage:(id)a3
{
  return [(TCCDAttributionChain *)self initWithMessage:a3 evaluateResponsibility:1];
}

- (TCCDAttributionChain)initWithMessage:(id)a3 evaluateResponsibility:(BOOL)a4 processInfo:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v37.receiver = self;
  v37.super_class = (Class)TCCDAttributionChain;
  v9 = [(TCCDAttributionChain *)&v37 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_13;
  }
  *(_OWORD *)buf = 0u;
  long long v39 = 0u;
  [(TCCDAttributionChain *)v9 getAuditToken:buf fromMessage:v7];
  long long v35 = *(_OWORD *)buf;
  long long v36 = v39;
  v11 = [(TCCDAttributionChain *)v10 createProcessFromAuditToken:&v35 processInfo:v8];
  [(TCCDAttributionChain *)v10 setRequestingProcess:v11];

  v12 = [(TCCDAttributionChain *)v10 requestingProcess];

  if (!v12) {
    goto LABEL_19;
  }
  [(TCCDAttributionChain *)v10 setAccessingProcessSpecified:0];
  size_t length = 0;
  v13 = "target_token";
  data = (long long *)xpc_dictionary_get_data(v7, "target_token", &length);
  if (data
    || (v13 = "indirect_object_token",
        (data = (long long *)xpc_dictionary_get_data(v7, "indirect_object_token", &length)) != 0))
  {
    v15 = data;
LABEL_6:
    [(TCCDAttributionChain *)v10 setAccessingProcessSpecified:1];
    [(TCCDAttributionChain *)v10 setAccessingProcessIsValid:0];
    if (length != 32)
    {
      v19 = +[TCCDPlatform currentPlatform];
      v20 = [v19 server];
      v21 = [v20 logHandle];

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_100055548((uint64_t)v13, v10);
      }

      goto LABEL_12;
    }
    long long v16 = v15[1];
    long long v35 = *v15;
    long long v36 = v16;
    uint64_t v17 = [(TCCDAttributionChain *)v10 createProcessFromAuditToken:&v35 processInfo:v8];
    accessingProcess = v10->_accessingProcess;
    v10->_accessingProcess = (TCCDProcess *)v17;

    if (v10->_accessingProcess)
    {
      [(TCCDAttributionChain *)v10 setAccessingProcessIsValid:1];
      goto LABEL_12;
    }
    v27 = +[TCCDPlatform currentPlatform];
    v28 = [v27 server];
    v29 = [v28 logHandle];

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1000554A4((uint64_t)v13, v10);
    }

LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  v31 = xpc_dictionary_get_value(v7, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");

  if (v31)
  {
    v32 = xpc_dictionary_get_value(v7, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
    v33 = v32;
    if (!v32 || xpc_dictionary_get_uint64(v32, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") != 1)
    {

      goto LABEL_12;
    }
    v15 = (long long *)xpc_dictionary_get_data(v33, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY", &length);

    if (v15)
    {
      v13 = "indirect_object_token";
      goto LABEL_6;
    }
  }
LABEL_12:
  v10->_responsibleProcessIsValid = 1;
  responsibleProcess = v10->_responsibleProcess;
  v10->_responsibleProcess = 0;

LABEL_13:
  v23 = +[TCCDPlatform currentPlatform];
  v24 = [v23 server];
  v25 = [v24 logHandle];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = [(TCCDAttributionChain *)v10 description];
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "AttributionChain: %{public}@", buf, 0xCu);
  }
LABEL_20:

  return v10;
}

- (void)setAccessingProcessSpecified:(BOOL)a3
{
  self->_accessingProcessSpecified = a3;
}

- (id)createProcessFromAuditToken:(id *)a3 processInfo:(id)a4
{
  v5 = [TCCDProcess alloc];
  long long v6 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v6;
  id v7 = [(TCCDProcess *)v5 initWithAuditToken:v9 responsibleIdentity:0];
  return v7;
}

- (void)setRequestingProcess:(id)a3
{
}

- (void)getAuditToken:(id *)a3 fromMessage:(id)a4
{
}

- (TCCDProcess)accessingProcess
{
  accessingProcess = self->_accessingProcess;
  if (accessingProcess)
  {
    v3 = accessingProcess;
  }
  else
  {
    v3 = [(TCCDAttributionChain *)self requestingProcess];
  }
  return v3;
}

- (id)description
{
  v3 = objc_opt_new();
  v4 = v3;
  if (self->_responsibleProcessIsValid)
  {
    responsibleProcess = self->_responsibleProcess;
    if (responsibleProcess)
    {
      long long v6 = [(TCCDProcess *)responsibleProcess description];
      [v4 appendFormat:@"responsible={%@}, ", v6];
    }
  }
  else
  {
    [v3 appendString:@"Invalid Responsible Process, "];
  }
  if (self->_accessingProcessSpecified)
  {
    if (self->_accessingProcessIsValid)
    {
      accessingProcess = self->_accessingProcess;
      if (accessingProcess)
      {
        id v8 = [(TCCDProcess *)accessingProcess description];
        [v4 appendFormat:@"accessing={%@}, ", v8];
      }
    }
    else
    {
      [v4 appendString:@"Invalid Accessing Process, "];
    }
  }
  v9 = [(TCCDAttributionChain *)self requestingProcess];

  if (v9)
  {
    v10 = [(TCCDAttributionChain *)self requestingProcess];
    v11 = [v10 description];
    [v4 appendFormat:@"requesting={%@}, ", v11];
  }
  return v4;
}

- (TCCDProcess)requestingProcess
{
  return (TCCDProcess *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)accessingProcessSpecified
{
  return self->_accessingProcessSpecified;
}

- (void)setAccessingProcessIsValid:(BOOL)a3
{
  self->_accessingProcessIsValid = a3;
}

- (BOOL)accessingProcessIsValid
{
  return self->_accessingProcessIsValid;
}

- (BOOL)responsibleProcessIsValid
{
  return self->_responsibleProcessIsValid;
}

- (BOOL)responsibleProcessIsDistinct
{
  return self->_responsibleProcessIsDistinct;
}

- (void)setResponsibleProcessIsDistinct:(BOOL)a3
{
  self->_responsibleProcessIsDistinct = a3;
}

@end