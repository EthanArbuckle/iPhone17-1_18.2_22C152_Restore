@interface AMSupportOSURLConnectionDelegate
- (AMSupportOSURLConnectionDelegate)init;
- (AMSupportOSURLConnectionDelegate)initWithData:(id)a3 Options:(id)a4;
- (NSData)data;
- (NSError)error;
- (id)waitForResponseOrError:(id *)a3;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4;
- (void)connectionDidFinishLoading:(id)a3;
- (void)dealloc;
@end

@implementation AMSupportOSURLConnectionDelegate

- (AMSupportOSURLConnectionDelegate)init
{
  uint64_t v3 = [MEMORY[0x263EFF990] dataWithCapacity:0];

  return [(AMSupportOSURLConnectionDelegate *)self initWithData:v3 Options:0];
}

- (AMSupportOSURLConnectionDelegate)initWithData:(id)a3 Options:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate initWithData:Options:]", (uint64_t)"init-ing delegate with data=%@ options=%@", (uint64_t)a4, v4, v5, v6, v7, (char)a3);
  if (!libSecurity)
  {
    strcpy(__path, "Security.framework/Versions/Current/Security");
    strcpy(__symbol, "kSecImportExportPassphrase");
    strcpy(v34, "kSecImportItemIdentity");
    strcpy(v33, "SecPKCS12Import");
    v11 = dlopen(__path, 261);
    v12 = v11;
    if (v11)
    {
      dlhandle_kSecImportExportPassphrase = (uint64_t)dlsym(v11, __symbol);
      dlhandle_kSecImportItemIdentity = (uint64_t)dlsym(v12, v34);
      v13 = dlsym(v12, v33);
      dlhandle_SecPKCS12Import = v13;
      if (dlhandle_kSecImportExportPassphrase && dlhandle_kSecImportItemIdentity && v13)
      {
LABEL_6:
        libSecurity = (uint64_t)v12;
        goto LABEL_7;
      }
      AMSupportLogInternal(3, (uint64_t)"libAMSupportLoadLibrary", (uint64_t)"Missing symbols.", v14, v15, v16, v17, v18, v31);
    }
    else
    {
      v23 = (FILE *)*MEMORY[0x263EF8348];
      v24 = dlerror();
      fprintf(v23, "failed to load %s: %s\n", __path, v24);
    }
    char v25 = dlerror();
    AMSupportLogInternal(3, (uint64_t)"libAMSupportLoadLibrary", (uint64_t)"Security Framework does not have expected symbols, aborting. %s", v26, v27, v28, v29, v30, v25);
    if (v12)
    {
      dlclose(v12);
      v12 = 0;
    }
    goto LABEL_6;
  }
LABEL_7:
  v32.receiver = self;
  v32.super_class = (Class)AMSupportOSURLConnectionDelegate;
  v19 = [(AMSupportOSURLConnectionDelegate *)&v32 init];
  v20 = v19;
  if (v19)
  {
    v19->requestComplete = 0;
    v19->options = (NSDictionary *)a4;
    v20->response = 0;
    v21 = (NSMutableData *)a3;
    v20->_data = v21;
    [(NSMutableData *)v21 setLength:0];
  }
  return v20;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate dealloc]", (uint64_t)"dealloc-ing delegate", v2, v3, v4, v5, v6, v8);
  if (libSecurity)
  {
    dlclose((void *)libSecurity);
    libSecurity = 0;
  }

  self->response = 0;
  self->_data = 0;

  self->_error = 0;
  v9.receiver = self;
  v9.super_class = (Class)AMSupportOSURLConnectionDelegate;
  [(AMSupportOSURLConnectionDelegate *)&v9 dealloc];
}

- (id)waitForResponseOrError:(id *)a3
{
  uint64_t v5 = *MEMORY[0x263EFF478];
  do
  {
    if (self->requestComplete) {
      break;
    }
    uint64_t v6 = (void *)[MEMORY[0x263EFF9F0] currentRunLoop];
  }
  while (([v6 runMode:v5 beforeDate:[MEMORY[0x263EFF910] distantFuture]] & 1) != 0);
  error = self->_error;
  if (!error) {
    return self->response;
  }
  if (!a3) {
    return 0;
  }
  char v8 = error;
  id result = 0;
  *a3 = v8;
  return result;
}

- (void)connection:(id)a3 willSendRequestForAuthenticationChallenge:(id)a4
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  uint64_t v6 = [[(id)objc_msgSend(a4, "protectionSpace", a3) authenticationMethod];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Authentication challenge received.  Method: %@", v7, v8, v9, v10, v11, (char)v6);
  if ([a4 previousFailureCount] >= 1)
  {
    [objc_msgSend((id)objc_msgSend(a4, "sender"), "cancelAuthenticationChallenge:", a4);
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Multiple challenge failures.  Aborting.", v12, v13, v14, v15, v16, v116);
    return;
  }
  if ([v6 isEqual:*MEMORY[0x263EFC568]]
    && [(NSDictionary *)self->options objectForKey:@"ClientIdentity"])
  {
    AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Received client certificate challenge.", v17, v18, v19, v20, v21, v99);
    if (libSecurity)
    {
      CFDataRef v27 = [(NSDictionary *)self->options objectForKey:@"ClientIdentity"];
      CFArrayRef theArray = 0;
      uint64_t v28 = [(NSDictionary *)self->options objectForKey:@"ClientIdentityPassphrase"];
      uint64_t v29 = &stru_26C5FD2E8;
      uint64_t v30 = *(void **)dlhandle_kSecImportExportPassphrase;
      if (v28) {
        uint64_t v29 = v28;
      }
      values = v29;
      keys[0] = v30;
      CFDictionaryRef v31 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
      char Length = CFDataGetLength(v27);
      AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"P12 Identity data length=%d", v33, v34, v35, v36, v37, Length);
      int v38 = dlhandle_SecPKCS12Import(v27, v31, &theArray);
      CFRelease(v31);
      if (!v38)
      {
        AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Successfully imported PKCS12 identity", v39, v40, v41, v42, v43, v101);
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, 0);
        Value = (__SecIdentity *)CFDictionaryGetValue(ValueAtIndex, *(const void **)dlhandle_kSecImportItemIdentity);
        SecCertificateRef certificateRef = 0;
        SecIdentityCopyCertificate(Value, &certificateRef);
        v112 = certificateRef;
        CFArrayRef v60 = CFArrayCreate(0, (const void **)&v112, 1, 0);
        CFRelease(certificateRef);
        uint64_t v61 = [MEMORY[0x263EFC610] credentialWithIdentity:Value certificates:v60 persistence:2];
        CFRelease(v60);
        [[(id)objc_msgSend(a4, "sender") useCredential:v61 forAuthenticationChallenge:a4];
        AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Returned credentials for challenge.", v62, v63, v64, v65, v66, v102);
        return;
      }
      AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Unable to import client identity, aborting challenge.", v39, v40, v41, v42, v43, v101);
      v44 = (void *)[a4 sender];
      id v45 = a4;
      goto LABEL_44;
    }
    AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Security framework (10.6?) unsupported in libamsupport.", v22, v23, v24, v25, v26, v100);
    v57 = (void *)[a4 sender];
    [v57 cancelAuthenticationChallenge:a4];
  }
  else
  {
    if ([v6 isEqual:*MEMORY[0x263EFC5A0]])
    {
      id v46 = [(NSDictionary *)self->options objectForKey:@"DisableSSLValidation"];
      if (objc_msgSend(v46, "isEqual:", objc_msgSend(NSNumber, "numberWithBool:", 1)))
      {
        AMSupportLogInternal(6, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"SSL validation disabled.  Attempting to continue without authentication.", v47, v48, v49, v50, v51, v99);
        v52 = (void *)[a4 sender];
        uint64_t v53 = [MEMORY[0x263EFC610] credentialForTrust:[objc_msgSend((id)objc_msgSend(a4, "protectionSpace"), "serverTrust")]];
        [v52 useCredential:v53 forAuthenticationChallenge:a4];
        return;
      }
      [(NSDictionary *)self->options objectForKey:@"TrustedServerCAs"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || ([(NSDictionary *)self->options objectForKey:@"TrustedServerCAs"],
            objc_opt_class(),
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        [(NSDictionary *)self->options objectForKey:@"TrustedServerCAs"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v55 = [(NSDictionary *)self->options objectForKey:@"TrustedServerCAs"];
        id v104 = a4;
        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v55 = [(id)[MEMORY[0x263EFF8C0] arrayWithObject:-[NSDictionary objectForKey:](self->options, "objectForKey:", @"TrustedServerCAs")];
          }
          else {
            id v55 = 0;
          }
        }
        v67 = [MEMORY[0x263EFF980] arrayWithCapacity:[v55 count]];
        long long v108 = 0u;
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        uint64_t v68 = [v55 countByEnumeratingWithState:&v108 objects:v107 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v109;
          CFAllocatorRef v71 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          do
          {
            for (uint64_t i = 0; i != v69; ++i)
            {
              if (*(void *)v109 != v70) {
                objc_enumerationMutation(v55);
              }
              CFDataRef v73 = *(const __CFData **)(*((void *)&v108 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                SecCertificateRef v74 = SecCertificateCreateWithData(v71, v73);
                if (v74)
                {
                  SecCertificateRef v80 = v74;
                  [v67 addObject:v74];
                  CFRelease(v80);
                }
                else
                {
                  AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"trusted certificate could not be loaded %@", v75, v76, v77, v78, v79, (char)v73);
                }
              }
            }
            uint64_t v69 = [v55 countByEnumeratingWithState:&v108 objects:v107 count:16];
          }
          while (v69);
        }
        v81 = (__SecTrust *)[v104 protectionSpace serverTrust];
        LODWORD(theArray) = 0;
        AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Attempting trust evaluate", v82, v83, v84, v85, v86, v99);
        int v92 = AMSupportX509ChainEvaluateTrust(v81, (CFArrayRef)v67, &theArray, v87, v88, v89, v90, v91);
        if (v92)
        {
          AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"trust evaluation failed (OSStatus=%d)", v93, v94, v95, v96, v97, v92);
        }
        else
        {
          if (theArray == 4 || theArray == 1)
          {
            AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"Trust evaluation succeeded, proceeding..", v93, v94, v95, v96, v97, v103);
            v98 = (void *)[v104 sender];
            [v98 useCredential:[MEMORY[0x263EFC610] credentialForTrust:v81] forAuthenticationChallenge:v104];
            return;
          }
          AMSupportLogInternal(4, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:willSendRequestForAuthenticationChallenge:]", (uint64_t)"trust evaluation did not result in okay to proceed (result=%d)", v93, v94, v95, v96, v97, (char)theArray);
        }
        v44 = (void *)[v104 sender];
        id v45 = v104;
LABEL_44:
        [v44 cancelAuthenticationChallenge:v45];
        return;
      }
    }
    v56 = (void *)[a4 sender];
    [v56 performDefaultHandlingForAuthenticationChallenge:a4];
  }
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  uint64_t v5 = (NSURLResponse *)a4;
  self->response = v5;
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didReceiveResponse:]", (uint64_t)"Received response from URL: %@", v6, v7, v8, v9, v10, (char)v5);
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  char v6 = [a4 length];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didReceiveData:]", (uint64_t)"Receiving %d bytes of data from URL", v7, v8, v9, v10, v11, v6);
  data = self->_data;

  [(NSMutableData *)data appendData:a4];
}

- (void)connectionDidFinishLoading:(id)a3
{
  char v4 = [(NSMutableData *)self->_data length];
  AMSupportLogInternal(7, (uint64_t)"-[AMSupportOSURLConnectionDelegate connectionDidFinishLoading:]", (uint64_t)"Finished loading URL.  Total bytes: %d", v5, v6, v7, v8, v9, v4);
  self->requestComplete = 1;
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  char v4 = (char)a4;
  self->_error = (NSError *)a4;
  AMSupportLogInternal(3, (uint64_t)"-[AMSupportOSURLConnectionDelegate connection:didFailWithError:]", (uint64_t)"Connection error %@ for URL", v6, v7, v8, v9, v10, v4);
  self->requestComplete = 1;
}

- (NSData)data
{
  return &self->_data->super;
}

- (NSError)error
{
  return self->_error;
}

@end