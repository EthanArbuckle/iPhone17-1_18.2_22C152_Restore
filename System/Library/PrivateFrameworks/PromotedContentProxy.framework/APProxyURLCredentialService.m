@interface APProxyURLCredentialService
- (APMescalSigning)mescalSigningObject;
- (APProxyURLCredentialService)init;
- (id)_signedCredentialForUrl:(id)a3 userAgent:(id)a4 withPersistence:(unint64_t)a5;
- (id)signedCredentialForRequest:(id)a3 withPersistence:(unint64_t)a4;
- (id)signedCredentialForUrl:(id)a3 userAgent:(id)a4 request:(id)a5 withPersistence:(unint64_t)a6;
- (id)signedCredentialForUrl:(id)a3 userAgent:(id)a4 withPersistence:(unint64_t)a5;
@end

@implementation APProxyURLCredentialService

- (APProxyURLCredentialService)init
{
  v6.receiver = self;
  v6.super_class = (Class)APProxyURLCredentialService;
  v2 = [(APProxyURLCredentialService *)&v6 init];
  if (v2)
  {
    v3 = (APMescalSigning *)objc_alloc_init(MEMORY[0x263F24298]);
    mescalSigningObject = v2->_mescalSigningObject;
    v2->_mescalSigningObject = v3;
  }
  return v2;
}

- (id)signedCredentialForRequest:(id)a3 withPersistence:(unint64_t)a4
{
  id v6 = a3;
  v11 = objc_msgSend_URL(v6, v7, v8, v9, v10);
  v15 = objc_msgSend_valueForHTTPHeaderField_(v6, v12, @"user-agent", v13, v14);
  v17 = objc_msgSend_signedCredentialForUrl_userAgent_request_withPersistence_(self, v16, (uint64_t)v11, (uint64_t)v15, (uint64_t)v6, a4);

  return v17;
}

- (id)signedCredentialForUrl:(id)a3 userAgent:(id)a4 withPersistence:(unint64_t)a5
{
  return (id)objc_msgSend_signedCredentialForUrl_userAgent_request_withPersistence_(self, a2, (uint64_t)a3, (uint64_t)a4, 0, a5);
}

- (id)signedCredentialForUrl:(id)a3 userAgent:(id)a4 request:(id)a5 withPersistence:(unint64_t)a6
{
  return (id)MEMORY[0x270F9A6D0](self, sel__signedCredentialForUrl_userAgent_withPersistence_, a3, a4, a6);
}

- (id)_signedCredentialForUrl:(id)a3 userAgent:(id)a4 withPersistence:(unint64_t)a5
{
  uint64_t v8 = NSString;
  id v9 = a4;
  uint64_t v14 = objc_msgSend_absoluteString(a3, v10, v11, v12, v13);
  v19 = objc_msgSend_date(MEMORY[0x263EFF910], v15, v16, v17, v18);
  objc_msgSend_timeIntervalSince1970(v19, v20, v21, v22, v23);
  v28 = objc_msgSend_stringWithFormat_(v8, v24, @"%@_*##*_%@_*##*_%f", v25, v26, v9, v14, v27);

  v33 = objc_msgSend_sha256hash(v28, v29, v30, v31, v32);

  if (v33)
  {
    v37 = objc_msgSend_dataUsingEncoding_(v33, v34, 4, v35, v36);
    v41 = v37;
    if (v37)
    {
      v42 = objc_msgSend_base64EncodedStringWithOptions_(v37, v38, 0, v39, v40);
      if (objc_msgSend_length(v42, v43, v44, v45, v46))
      {
        v51 = objc_msgSend_mescalSigningObject(self, v47, v48, v49, v50);
        v55 = objc_msgSend_signatureForData_(v51, v52, (uint64_t)v41, v53, v54);

        if (objc_msgSend_length(v55, v56, v57, v58, v59))
        {
          v61 = objc_msgSend_credentialWithUser_password_persistence_(MEMORY[0x263EFC610], v60, (uint64_t)v42, (uint64_t)v55, a5);
        }
        else
        {
          v62 = APLogForCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2397A4000, v62, OS_LOG_TYPE_ERROR, "Failed to get a signature for proxy authentication.", buf, 2u);
          }

          v61 = 0;
        }
      }
      else
      {
        v61 = 0;
      }
    }
    else
    {
      v61 = 0;
    }
  }
  else
  {
    v61 = 0;
  }

  return v61;
}

- (APMescalSigning)mescalSigningObject
{
  return self->_mescalSigningObject;
}

- (void).cxx_destruct
{
}

@end