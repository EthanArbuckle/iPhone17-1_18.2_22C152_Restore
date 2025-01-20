@interface AluminiumAuthenticator
+ (id)_defaultIncludedHeaders;
- (AluminiumAuthenticator)initWithASCIIEncodedKey:(id)a3;
- (AluminiumAuthenticator)initWithHexEncodedKey:(id)a3;
- (BOOL)addAuthenticationHeadersToRequest:(id)a3 error:(id *)a4;
- (BOOL)addAuthenticationHeadersToRequest:(id)a3 includedHeaders:(id)a4 body:(id)a5 algorithm:(unsigned int)defaultAlgorithm error:(id *)a7;
- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 error:(id *)a4;
- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 includedHeaders:(id)a4 algorithm:(unsigned int)defaultAlgorithm error:(id *)a6;
- (NSSet)defaultIncludedHeaders;
- (unsigned)defaultAlgorithm;
- (void)setDefaultAlgorithm:(unsigned int)a3;
- (void)setDefaultIncludedHeaders:(id)a3;
@end

@implementation AluminiumAuthenticator

+ (id)_defaultIncludedHeaders
{
  if (qword_100189BD8 != -1) {
    dispatch_once(&qword_100189BD8, &stru_1001536C0);
  }
  v2 = (void *)qword_100189BD0;

  return v2;
}

- (AluminiumAuthenticator)initWithHexEncodedKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AluminiumAuthenticator.m", 157, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)AluminiumAuthenticator;
  v6 = [(AluminiumAuthenticator *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [v5 _dataUsingHexEncoding];
    key = v6->_key;
    v6->_key = (NSData *)v7;

    v9 = v6->_key;
    if (!v9 || ![(NSData *)v9 length])
    {
      v12 = 0;
      goto LABEL_9;
    }
    uint64_t v10 = +[AluminiumAuthenticator _defaultIncludedHeaders];
    defaultIncludedHeaders = v6->_defaultIncludedHeaders;
    v6->_defaultIncludedHeaders = (NSSet *)v10;

    v6->_defaultAlgorithm = 0;
  }
  v12 = v6;
LABEL_9:

  return v12;
}

- (AluminiumAuthenticator)initWithASCIIEncodedKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"AluminiumAuthenticator.m", 171, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)AluminiumAuthenticator;
  v6 = [(AluminiumAuthenticator *)&v15 init];
  if (v6)
  {
    uint64_t v7 = [v5 dataUsingEncoding:1];
    key = v6->_key;
    v6->_key = (NSData *)v7;

    v9 = v6->_key;
    if (!v9 || ![(NSData *)v9 length])
    {
      v12 = 0;
      goto LABEL_9;
    }
    uint64_t v10 = +[AluminiumAuthenticator _defaultIncludedHeaders];
    defaultIncludedHeaders = v6->_defaultIncludedHeaders;
    v6->_defaultIncludedHeaders = (NSSet *)v10;

    v6->_defaultAlgorithm = 0;
  }
  v12 = v6;
LABEL_9:

  return v12;
}

- (BOOL)addAuthenticationHeadersToRequest:(id)a3 error:(id *)a4
{
  return [(AluminiumAuthenticator *)self addAuthenticationHeadersToRequest:a3 includedHeaders:0 body:0 algorithm:0xFFFFFFFFLL error:a4];
}

- (BOOL)addAuthenticationHeadersToRequest:(id)a3 includedHeaders:(id)a4 body:(id)a5 algorithm:(unsigned int)defaultAlgorithm error:(id *)a7
{
  id v13 = a3;
  v14 = (NSSet *)a4;
  id v15 = a5;
  if (v13)
  {
    if (!a7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v72 = +[NSAssertionHandler currentHandler];
  [v72 handleFailureInMethod:a2, self, @"AluminiumAuthenticator.m", 204, @"Invalid parameter not satisfying: %@", @"request != nil" object file lineNumber description];

  if (a7) {
LABEL_3:
  }
    *a7 = 0;
LABEL_4:
  if (defaultAlgorithm == -1) {
    defaultAlgorithm = self->_defaultAlgorithm;
  }
  if (defaultAlgorithm < 6)
  {
    unint64_t v16 = qword_1001027B0[defaultAlgorithm];
    if ([(NSData *)self->_key length] < v16)
    {
      if (a7)
      {
        NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
        CFStringRef v93 = @"Key size too short";
        v17 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
        uint64_t v18 = 6;
LABEL_12:
        +[NSError errorWithDomain:@"AluminiumAuthenticatorErrorDomain" code:v18 userInfo:v17];
        BOOL v19 = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_63:

        goto LABEL_64;
      }
      goto LABEL_13;
    }
    if (!v14) {
      v14 = self->_defaultIncludedHeaders;
    }
    v20 = v14;
    v21 = [(NSSet *)v14 _lowercaseSet];

    if (qword_100189BE0 != -1) {
      dispatch_once(&qword_100189BE0, &stru_1001536E0);
    }
    id v79 = v15;
    unint64_t v76 = v16;
    v77 = self;
    if (![(NSSet *)v21 containsObject:qword_100189BE8])
    {
      uint64_t v22 = [(NSSet *)v21 setByAddingObject:qword_100189BE8];

      v21 = (NSSet *)v22;
    }
    v23 = [(NSSet *)v21 allObjects];
    v17 = [v23 sortedArrayUsingSelector:"compare:"];

    v24 = [v13 valueForHTTPHeaderField:@"X-Apple-HMAC-Sent-Timestamp"];
    v25 = v24;
    if (!v24 || ![v24 length])
    {
      v26 = +[NSDate date];
      [v26 timeIntervalSince1970];
      uint64_t v28 = (uint64_t)(v27 * 1000.0);

      v29 = +[NSString stringWithFormat:@"%lld", v28];
      [v13 addValue:v29 forHTTPHeaderField:@"X-Apple-HMAC-Sent-Timestamp"];
    }
    v78 = v25;
    v30 = [v13 URL];
    v31 = [v13 valueForHTTPHeaderField:@"Host"];
    v81 = v21;
    if (-[NSSet containsObject:](v21, "containsObject:", @"host") && (!v31 || ![v31 length]))
    {
      v32 = [v30 host];

      if (v32)
      {
        v33 = [v30 host];
        [v13 addValue:v33 forHTTPHeaderField:@"Host"];
      }
    }
    id v80 = v31;
    id v82 = v30;
    v34 = objc_opt_new();
    v35 = [v13 HTTPMethod];
    v36 = [v35 lowercaseString];
    unsigned int v37 = [v34 _addHMACComponent:v36 error:a7];

    id v84 = v34;
    if (v37)
    {
      id v38 = v82;
      v39 = [v82 path];
      v40 = v39;
      if (!v39) {
        v39 = @"/";
      }
      v41 = [(__CFString *)v39 lowercaseString];
      unsigned int v42 = [v34 _addHMACComponent:v41 error:a7];

      if (v42)
      {
        v43 = [v82 query];
        v14 = v81;
        id v75 = v43;
        if (v43
          && (v44 = v43, [v43 length])
          && ![v84 _addHMACComponent:v44 error:a7])
        {
          BOOL v19 = 0;
          v55 = v78;
          id v15 = v79;
        }
        else
        {
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          v74 = v17;
          id v45 = v17;
          id v46 = [v45 countByEnumeratingWithState:&v85 objects:v91 count:16];
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = *(void *)v86;
            id v83 = v45;
            while (2)
            {
              for (i = 0; i != v47; i = (char *)i + 1)
              {
                if (*(void *)v86 != v48) {
                  objc_enumerationMutation(v83);
                }
                uint64_t v50 = *(void *)(*((void *)&v85 + 1) + 8 * i);
                v51 = [v13 valueForHTTPHeaderField:v50];
                v52 = v51;
                if (v51
                  && [v51 length]
                  && (![v84 _addHMACComponent:v50 error:a7]
                   || ![v84 _addHMACComponent:v52 error:a7]))
                {

                  BOOL v19 = 0;
                  v55 = v78;
                  id v15 = v79;
                  v17 = v74;
                  id v38 = v82;
                  goto LABEL_60;
                }
              }
              id v45 = v83;
              id v47 = [v83 countByEnumeratingWithState:&v85 objects:v91 count:16];
              if (v47) {
                continue;
              }
              break;
            }
          }

          id v15 = v79;
          if (v79 && [v79 length])
          {
            v53 = [v79 base64EncodedStringWithOptions:0];
            id v54 = v84;
            [v84 addObject:v53];
          }
          else
          {
            id v54 = v84;
            [v84 addObject:&stru_100155450];
          }
          id v38 = v82;
          v56 = [v54 componentsJoinedByString:@"|"];
          v57 = [v56 dataUsingEncoding:1];

          if (v57)
          {
            uint64_t v73 = (uint64_t)&v73;
            id v59 = v79;
            unint64_t v60 = v76;
            __chkstk_darwin(v58);
            v61 = v77;
            id v62 = [(NSData *)v77->_key bytes];
            NSUInteger v63 = [(NSData *)v61->_key length];
            id v64 = v57;
            id v65 = [v64 bytes];
            id v83 = v64;
            CCHmac(defaultAlgorithm, v62, v63, v65, (size_t)[v64 length], (char *)&v73 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
            v66 = (char *)&v73 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
            unint64_t v67 = v60;
            id v15 = v59;
            id v38 = v82;
            v68 = +[NSData dataWithBytesNoCopy:v66 length:v67 freeWhenDone:0];
            v69 = [v68 base64EncodedStringWithOptions:0];

            [v13 addValue:v69 forHTTPHeaderField:@"X-Apple-HMAC-Digest"];
            BOOL v19 = 1;
            v17 = v74;
            v55 = v78;
            v14 = v81;
          }
          else
          {
            id v83 = 0;
            v14 = v81;
            if (a7)
            {
              NSErrorUserInfoKey v89 = NSLocalizedDescriptionKey;
              CFStringRef v90 = @"Cannot encode HMAC text";
              v70 = +[NSDictionary dictionaryWithObjects:&v90 forKeys:&v89 count:1];
              *a7 = +[NSError errorWithDomain:@"AluminiumAuthenticatorErrorDomain" code:1 userInfo:v70];
            }
            BOOL v19 = 0;
            v17 = v74;
            v55 = v78;
          }
LABEL_60:
        }
        goto LABEL_62;
      }
      BOOL v19 = 0;
      v55 = v78;
    }
    else
    {
      BOOL v19 = 0;
      v55 = v78;
      id v38 = v82;
    }
    id v15 = v79;
    v14 = v81;
LABEL_62:

    goto LABEL_63;
  }
  if (a7)
  {
    NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
    CFStringRef v95 = @"Invalid HMAC algorithm";
    v17 = +[NSDictionary dictionaryWithObjects:&v95 forKeys:&v94 count:1];
    uint64_t v18 = 2;
    goto LABEL_12;
  }
LABEL_13:
  BOOL v19 = 0;
LABEL_64:

  return v19;
}

- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 error:(id *)a4
{
  return [(AluminiumAuthenticator *)self verifyAuthenticationWithRequest:a3 includedHeaders:0 algorithm:0xFFFFFFFFLL error:a4];
}

- (BOOL)verifyAuthenticationWithRequest:(__CFHTTPMessage *)a3 includedHeaders:(id)a4 algorithm:(unsigned int)defaultAlgorithm error:(id *)a6
{
  v11 = (NSSet *)a4;
  if (!a3)
  {
    id v64 = +[NSAssertionHandler currentHandler];
    [v64 handleFailureInMethod:a2, self, @"AluminiumAuthenticator.m", 354, @"Invalid parameter not satisfying: %@", @"request != NULL" object file lineNumber description];

    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a6) {
LABEL_3:
  }
    *a6 = 0;
LABEL_4:
  v12 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, @"X-Apple-HMAC-Digest");
  id v13 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, @"X-Apple-HMAC-Sent-Timestamp");
  if (!v12 || ![(__CFString *)v12 length])
  {
    if (a6)
    {
      NSErrorUserInfoKey v96 = NSLocalizedDescriptionKey;
      CFStringRef v97 = @"Missing digest header in HTTP request";
      uint64_t v18 = &v97;
      BOOL v19 = &v96;
LABEL_19:
      v14 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:1];
      +[NSError errorWithDomain:@"AluminiumAuthenticatorErrorDomain" code:3 userInfo:v14];
      BOOL v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_21:
    BOOL v20 = 0;
    goto LABEL_22;
  }
  if (!v13 || ![(__CFString *)v13 length])
  {
    if (a6)
    {
      NSErrorUserInfoKey v94 = NSLocalizedDescriptionKey;
      CFStringRef v95 = @"Missing timestamp header in HTTP request";
      uint64_t v18 = &v95;
      BOOL v19 = &v94;
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  v14 = +[NSDate dateWithTimeIntervalSince1970:(double)(uint64_t)[(__CFString *)v13 integerValue] / 1000.0];
  if (v14)
  {
    if (defaultAlgorithm == -1) {
      defaultAlgorithm = self->_defaultAlgorithm;
    }
    if (defaultAlgorithm >= 6)
    {
      if (a6)
      {
        NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
        CFStringRef v91 = @"Invalid HMAC algorithm";
        id v16 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
        uint64_t v17 = 2;
        goto LABEL_27;
      }
    }
    else
    {
      unint64_t v15 = qword_1001027B0[defaultAlgorithm];
      if ([(NSData *)self->_key length] >= v15)
      {
        if (!v11) {
          v11 = self->_defaultIncludedHeaders;
        }
        v71 = self;
        uint64_t v22 = v11;
        v23 = [(NSSet *)v11 _lowercaseSet];

        if (qword_100189BE0 != -1) {
          dispatch_once(&qword_100189BE0, &stru_100153700);
        }
        unint64_t v70 = v15;
        if (![(NSSet *)v23 containsObject:qword_100189BE8])
        {
          uint64_t v24 = [(NSSet *)v23 setByAddingObject:qword_100189BE8];

          v23 = (NSSet *)v24;
        }
        v72 = v23;
        v25 = [(NSSet *)v23 allObjects];
        id v74 = [v25 sortedArrayUsingSelector:"compare:"];

        CFURLRef v26 = CFHTTPMessageCopyRequestURL(a3);
        double v27 = (__CFString *)CFHTTPMessageCopyRequestMethod(a3);
        uint64_t v28 = objc_opt_new();
        uint64_t v73 = v27;
        v29 = [(__CFString *)v27 lowercaseString];
        LODWORD(v78) = [v28 _addHMACComponent:v29 error:a6];

        id v76 = v28;
        if (!v78) {
          goto LABEL_56;
        }
        v30 = [(__CFURL *)v26 path];
        v78 = v30;
        if (!v30) {
          v30 = @"/";
        }
        v31 = [(__CFString *)v30 lowercaseString];
        unsigned int v32 = [v28 _addHMACComponent:v31 error:a6];

        if (v32)
        {
          v33 = [(__CFURL *)v26 query];
          v34 = v33;
          CFURLRef v35 = v26;
          if (v33
            && [v33 length]
            && ![v76 _addHMACComponent:v34 error:a6])
          {
            BOOL v20 = 0;
            v11 = v72;
            uint64_t v48 = v73;
          }
          else
          {
            unint64_t v67 = v34;
            v68 = v14;
            CFURLRef v69 = v26;
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            CFDataRef v36 = (CFDataRef)v74;
            v78 = (__CFString *)[(__CFData *)v36 countByEnumeratingWithState:&v79 objects:v87 count:16];
            if (v78)
            {
              v77 = *(uint64_t **)v80;
              CFDataRef v75 = v36;
LABEL_44:
              uint64_t v37 = 0;
              while (1)
              {
                if (*(uint64_t **)v80 != v77) {
                  objc_enumerationMutation(v36);
                }
                CFStringRef v38 = *(const __CFString **)(*((void *)&v79 + 1) + 8 * v37);
                v39 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(a3, v38);
                id v40 = v39;
                if (v39)
                {
                  v41 = v39;
                  id v42 = [(__CFString *)v39 length];
                  id v40 = v41;
                  if (v42)
                  {
                    if (![v76 _addHMACComponent:v38 error:a6])
                    {
                      BOOL v20 = 0;
                      v11 = v72;
                      uint64_t v48 = v73;
                      id v40 = v41;
LABEL_59:
                      v34 = v67;
                      v14 = v68;
                      goto LABEL_71;
                    }
                    unsigned int v43 = [v76 _addHMACComponent:v41 error:a6];
                    id v40 = v41;
                    CFDataRef v36 = v75;
                    if (!v43)
                    {
                      BOOL v20 = 0;
                      v11 = v72;
                      uint64_t v48 = v73;
                      goto LABEL_59;
                    }
                  }
                }

                if (v78 == (__CFString *)++v37)
                {
                  v78 = (__CFString *)[(__CFData *)v36 countByEnumeratingWithState:&v79 objects:v87 count:16];
                  if (v78) {
                    goto LABEL_44;
                  }
                  break;
                }
              }
            }

            CFDataRef v44 = CFHTTPMessageCopyBody(a3);
            CFDataRef v45 = v44;
            if (v44 && [(__CFData *)v44 length])
            {
              id v46 = [(__CFData *)v45 base64EncodedStringWithOptions:0];
              id v47 = v76;
              [v76 addObject:v46];
            }
            else
            {
              id v47 = v76;
              [v76 addObject:&stru_100155450];
            }
            v49 = [v47 componentsJoinedByString:@"|"];
            uint64_t v50 = [v49 dataUsingEncoding:1];

            id v40 = (id)v50;
            v14 = v68;
            CFDataRef v75 = v45;
            if (v50)
            {
              v77 = &v65;
              unint64_t v52 = v70;
              __chkstk_darwin(v51);
              v53 = v71;
              v55 = v54;
              id v66 = [(NSData *)v71->_key bytes];
              v71 = [(NSData *)v53->_key length];
              v78 = v55;
              v56 = v55;
              id v57 = [(__CFString *)v56 bytes];
              id v58 = [(__CFString *)v56 length];
              CCHmac(defaultAlgorithm, v66, (size_t)v71, v57, (size_t)v58, (char *)&v65 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0));
              id v59 = +[NSData dataWithBytesNoCopy:(char *)&v65 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0) length:v52 freeWhenDone:0];
              unint64_t v60 = [v59 base64EncodedStringWithOptions:0];

              unsigned __int8 v61 = [v60 isEqualToString:v12];
              BOOL v20 = v61;
              if (a6 && (v61 & 1) == 0)
              {
                NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
                CFStringRef v84 = @"HMAC verification failed";
                id v62 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
                *a6 = +[NSError errorWithDomain:@"AluminiumAuthenticatorErrorDomain" code:5 userInfo:v62];
              }
              id v40 = v78;
              v11 = v72;
              uint64_t v48 = v73;
            }
            else
            {
              uint64_t v48 = v73;
              if (a6)
              {
                NSErrorUserInfoKey v85 = NSLocalizedDescriptionKey;
                CFStringRef v86 = @"Cannot encode HMAC text";
                NSUInteger v63 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
                *a6 = +[NSError errorWithDomain:@"AluminiumAuthenticatorErrorDomain" code:1 userInfo:v63];

                id v40 = 0;
              }
              BOOL v20 = 0;
              v11 = v72;
            }
            v34 = v67;
LABEL_71:

            CFURLRef v35 = v69;
          }
        }
        else
        {
LABEL_56:
          BOOL v20 = 0;
          CFURLRef v35 = v26;
          v11 = v72;
          uint64_t v48 = v73;
        }

        id v16 = v74;
        goto LABEL_74;
      }
      if (a6)
      {
        NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
        CFStringRef v89 = @"Key size too short";
        id v16 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
        uint64_t v17 = 6;
LABEL_27:
        +[NSError errorWithDomain:@"AluminiumAuthenticatorErrorDomain" code:v17 userInfo:v16];
        BOOL v20 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_74:

        goto LABEL_20;
      }
    }
  }
  else if (a6)
  {
    NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
    CFStringRef v93 = @"Invalid timestamp value in HTTP request";
    id v16 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];
    uint64_t v17 = 4;
    goto LABEL_27;
  }
  BOOL v20 = 0;
LABEL_20:

LABEL_22:
  return v20;
}

- (NSSet)defaultIncludedHeaders
{
  return self->_defaultIncludedHeaders;
}

- (void)setDefaultIncludedHeaders:(id)a3
{
}

- (unsigned)defaultAlgorithm
{
  return self->_defaultAlgorithm;
}

- (void)setDefaultAlgorithm:(unsigned int)a3
{
  self->_defaultAlgorithm = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultIncludedHeaders, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end