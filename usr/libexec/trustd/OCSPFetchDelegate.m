@interface OCSPFetchDelegate
- (BOOL)fetchNext:(id)a3 context:(id)a4;
- (id)createNextRequest:(id)a3 context:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation OCSPFetchDelegate

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7 = a5;
  v8 = [a4 originalRequest];
  v9 = [v8 taskId];

  v10 = [(TrustURLSessionDelegate *)self contextForTask:v9];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 context];
    if (v12)
    {
      v13 = (void *)*((void *)v12 + 2);
      if (v13)
      {
        CFRetain(*((CFTypeRef *)v12 + 2));
        uint64_t v14 = v13[34];
        if (v14)
        {
          v15 = [v7 taskInterval];
          [v15 duration];
          *(void *)(v14 + 56) += (unint64_t)(v16 * 1000000000.0);
        }
        CFRelease(v13);
      }
    }
  }
  else
  {
    v17 = sub_10001CB28("http");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (id)createNextRequest:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *((void *)[v7 context] + 4);
  if (!v8)
  {
    CFDataRef Copy = 0;
    goto LABEL_39;
  }
  CFDataRef Copy = *(CFDataRef *)(v8 + 16);
  if (Copy)
  {
LABEL_37:
    CFRetain(Copy);
    goto LABEL_39;
  }
  memset(v50, 0, sizeof(v50));
  long long v54 = 0u;
  long long v53 = 0u;
  memset(v52, 0, sizeof(v52));
  memset(v56, 0, 32);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v63[2] = 0;
  v63[3] = 0;
  v63[0] = &unk_100067E7A;
  v63[1] = 5;
  unint64_t v62 = 0;
  if (DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v63, 0x20uLL, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, &v62))goto LABEL_58; {
  if (v62 > 0x7FFFFFFFFFFFFFFELL)
  }
    goto LABEL_58;
  Mutable = CFDataCreateMutable(0, v62);
  if (!Mutable) {
    goto LABEL_58;
  }
  v11 = Mutable;
  CFDataSetLength(Mutable, v62);
  MutableBytePtr = CFDataGetMutableBytePtr(v11);
  CFIndex v13 = CFDataGetLength(v11);
  if (DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v63, 0x20uLL, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)MutableBytePtr, v13, &v62)|| CFDataGetLength(v11) < 1|| (CFDataRef v14 = (const __CFData *)SecCertificateCopyIssuerSHA1Digest()) == 0)
  {
LABEL_54:
    v46 = v11;
    goto LABEL_57;
  }
  CFDataRef v15 = v14;
  if (CFDataGetLength(v14) >= 1)
  {
    CFDataRef v16 = (const __CFData *)SecCertificateCopyPublicKeySHA1Digest();
    if (v16)
    {
      CFDataRef v17 = v16;
      if (CFDataGetLength(v16) < 1)
      {
        CFDataRef v19 = 0;
      }
      else
      {
        CFDataRef v18 = SecCertificateCopySerialNumberData(*(SecCertificateRef *)v8, 0);
        CFDataRef v19 = v18;
        if (v18)
        {
          if (CFDataGetLength(v18) >= 1)
          {
            CFRetain(v15);
            *(void *)(v8 + 40) = v15;
            CFRetain(v17);
            *(void *)(v8 + 48) = v17;
            CFRetain(v19);
            *(void *)(v8 + 56) = v19;
            *(void *)&long long v58 = CFDataGetBytePtr(v11);
            *((void *)&v58 + 1) = CFDataGetLength(v11);
            *(void *)&long long v59 = CFDataGetBytePtr(v15);
            *((void *)&v59 + 1) = CFDataGetLength(v15);
            *(void *)&long long v60 = CFDataGetBytePtr(v17);
            *((void *)&v60 + 1) = CFDataGetLength(v17);
            *(void *)&long long v61 = CFDataGetBytePtr(v19);
            *((void *)&v61 + 1) = CFDataGetLength(v19);
            unint64_t v57 = 0;
            if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)&v58, 0x40uLL, 4, (uint64_t)&unk_100069C90, &v57)&& v57 <= 0x7FFFFFFFFFFFFFFELL)
            {
              v20 = CFDataCreateMutable(0, v57);
              v21 = v20;
              if (!v20
                || (CFDataSetLength(v20, v57),
                    v22 = CFDataGetMutableBytePtr(v21),
                    CFIndex v23 = CFDataGetLength(v21),
                    !DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)&v58, 0x40uLL, 4u, (uint64_t)&unk_100069C90, (unint64_t)v22, v23, &v57)))
              {
LABEL_18:
                CFRelease(v15);
                CFRelease(v17);
                CFDataRef v15 = v19;
                if (!v19) {
                  goto LABEL_20;
                }
                goto LABEL_19;
              }
              CFRelease(v21);
            }
          }
        }
      }
      v21 = 0;
      goto LABEL_18;
    }
  }
  v21 = 0;
LABEL_19:
  CFRelease(v15);
LABEL_20:
  CFRelease(v11);
  if (v21)
  {
    if (CFDataGetLength(v21) >= 1)
    {
      v56[0] = CFDataGetBytePtr(v21);
      v56[1] = CFDataGetLength(v21);
      CFIndex capacity = 0;
      if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v56, 0x20uLL, 2, (uint64_t)&unk_100069A70, (unint64_t *)&capacity)&& (unint64_t)capacity <= 0x7FFFFFFFFFFFFFFELL)
      {
        v24 = CFDataCreateMutable(0, capacity);
        if (v24)
        {
          v11 = v24;
          CFDataSetLength(v24, capacity);
          v25 = CFDataGetMutableBytePtr(v11);
          CFIndex v26 = CFDataGetLength(v11);
          if (!DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v56, 0x20uLL, 2u, (uint64_t)&unk_100069A70, (unint64_t)v25, v26, (unint64_t *)&capacity))
          {
            CFRelease(v21);
            if (CFDataGetLength(v11) >= 1)
            {
              *(void *)&long long v53 = CFDataGetBytePtr(v11);
              *((void *)&v53 + 1) = CFDataGetLength(v11);
              CFIndex length = 0;
              if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v52, 0x40uLL, 4, (uint64_t)&unk_100069A10, (unint64_t *)&length)&& (unint64_t)length <= 0x7FFFFFFFFFFFFFFELL)
              {
                v27 = CFDataCreateMutable(0, length);
                if (v27)
                {
                  v28 = v27;
                  CFDataSetLength(v27, length);
                  v29 = CFDataGetMutableBytePtr(v28);
                  CFIndex v30 = CFDataGetLength(v28);
                  if (!DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v52, 0x40uLL, 4u, (uint64_t)&unk_100069A10, (unint64_t)v29, v30, (unint64_t *)&length))
                  {
                    CFRelease(v11);
                    if (CFDataGetLength(v28) >= 1)
                    {
                      *(void *)&v50[0] = CFDataGetBytePtr(v28);
                      *((void *)&v50[0] + 1) = CFDataGetLength(v28);
                      CFIndex v49 = 0;
                      if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v50, 0x20uLL, 2, (uint64_t)&unk_1000699E0, (unint64_t *)&v49)&& (unint64_t)v49 <= 0x7FFFFFFFFFFFFFFELL)
                      {
                        v31 = CFDataCreateMutable(0, v49);
                        if (v31)
                        {
                          v32 = v31;
                          CFDataSetLength(v31, v49);
                          v33 = CFDataGetMutableBytePtr(v32);
                          CFIndex v34 = CFDataGetLength(v32);
                          if (!DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v50, 0x20uLL, 2u, (uint64_t)&unk_1000699E0, (unint64_t)v33, v34, (unint64_t *)&v49))
                          {
                            CFRelease(v28);
                            CFDataRef Copy = CFDataCreateCopy(0, v32);
                            CFRelease(v32);
                            *(void *)(v8 + 16) = Copy;
                            if (!Copy) {
                              goto LABEL_39;
                            }
                            goto LABEL_37;
                          }
                          CFRelease(v32);
                        }
                      }
                    }
                    v46 = v28;
                    goto LABEL_57;
                  }
                  CFRelease(v28);
                }
              }
            }
            goto LABEL_54;
          }
          CFRelease(v11);
        }
      }
    }
    v46 = v21;
LABEL_57:
    CFRelease(v46);
  }
LABEL_58:
  CFDataRef Copy = 0;
  *(void *)(v8 + 16) = 0;
LABEL_39:
  v35 = [(__CFData *)Copy base64EncodedStringWithOptions:0];
  if (qword_10008AD58 != -1) {
    dispatch_once(&qword_10008AD58, &stru_10007F480);
  }
  v36 = [v35 stringByAddingPercentEncodingWithAllowedCharacters:qword_10008AD50];
  v37 = [v6 absoluteString];
  id v38 = [v37 length];
  v39 = (char *)[v36 length] + (void)v38 + 1;

  if ((unint64_t)v39 > 0xFF)
  {
    v47.receiver = self;
    v47.super_class = (Class)OCSPFetchDelegate;
    v44 = [(TrustURLSessionDelegate *)&v47 createNextRequest:v6 context:v7];
    id v43 = [v44 mutableCopy];

    [v43 setHTTPMethod:@"POST"];
    [v43 setHTTPBody:Copy];
  }
  else
  {
    v40 = [v6 absoluteString];
    v41 = +[NSString stringWithFormat:@"%@/%@", v40, v36];

    v42 = +[NSURL URLWithString:v41];
    v48.receiver = self;
    v48.super_class = (Class)OCSPFetchDelegate;
    id v43 = [(TrustURLSessionDelegate *)&v48 createNextRequest:v42 context:v7];
  }

  return v43;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)OCSPFetchDelegate;
  [(TrustURLSessionDelegate *)&v31 URLSession:v8 task:v9 didCompleteWithError:v10];
  v11 = [v9 originalRequest];
  id v12 = [v11 taskId];

  CFIndex v13 = [(TrustURLSessionDelegate *)self contextForTask:v12];
  CFDataRef v14 = v13;
  if (v13)
  {
    *(void *)&long long v36 = 0;
    *((void *)&v36 + 1) = &v36;
    uint64_t v37 = 0x2020000000;
    id v38 = (id)0xAAAAAAAAAAAAAAAALL;
    id v38 = [v13 context];
    uint64_t v15 = *(void *)(*((void *)&v36 + 1) + 24);
    if (!v15 || (uint64_t v16 = *(void *)(v15 + 16)) == 0)
    {
      [(TrustURLSessionDelegate *)self removeTask:v12];
LABEL_18:
      _Block_object_dispose(&v36, 8);
      goto LABEL_22;
    }
    uint64_t v17 = *(void *)(v16 + 272);
    if (v10)
    {
      CFDataRef v18 = sub_10001CB28("rvc");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        CFDataRef v19 = [v9 originalRequest];
        v20 = [v19 URL];
        *(_DWORD *)buf = 138412546;
        v33 = v20;
        __int16 v34 = 2112;
        id v35 = v10;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to download ocsp response %@, with error %@", buf, 0x16u);
      }
    }
    else
    {
      CFDataRef v26 = [v14 response];
      v27 = sub_10000E30C(v26, -1);

      if (v27)
      {
        uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 24);
        [v14 maxAge];
        sub_10000D574(v28, (uint64_t)v27, 1, 0, v29);
        if (v17 && !*(unsigned char *)(*(void *)(*((void *)&v36 + 1) + 24) + 88)) {
          *(unsigned char *)(v17 + 68) = 1;
        }
        goto LABEL_10;
      }
    }
    if (v17) {
      ++*(_DWORD *)(v17 + 64);
    }
LABEL_10:
    uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 24);
    if (*(unsigned char *)(v22 + 88)
      || ([(OCSPFetchDelegate *)self fetchNext:v8 context:v14],
          uint64_t v22 = *(void *)(*((void *)&v36 + 1) + 24),
          *(unsigned char *)(v22 + 88)))
    {
      sub_10000CDBC(v22, v21);
      if (atomic_fetch_add((atomic_uint *volatile)(*(void *)(*(void *)(*((void *)&v36 + 1) + 24) + 16) + 208), 0xFFFFFFFF) == 1)
      {
        CFIndex v23 = *(void **)(*(void *)(*((void *)&v36 + 1) + 24) + 16);
        if (v23) {
          CFIndex v23 = (void *)v23[2];
        }
        v24 = v23;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100040038;
        block[3] = &unk_10007F3B0;
        block[4] = &v36;
        dispatch_async(v24, block);
      }
    }
    [(TrustURLSessionDelegate *)self removeTask:v12];
    goto LABEL_18;
  }
  v25 = sub_10001CB28("http");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v36) = 138412290;
    *(void *)((char *)&v36 + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", (uint8_t *)&v36, 0xCu);
  }

LABEL_22:
}

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 context];
  uint64_t v9 = v8[2];
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 272);
  }
  else {
    uint64_t v10 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)OCSPFetchDelegate;
  BOOL v11 = [(TrustURLSessionDelegate *)&v17 fetchNext:v7 context:v6];

  if (v11)
  {
    *((unsigned char *)v8 + 88) = 1;
  }
  else
  {
    id v12 = [v6 URIix];
    CFIndex v13 = [v6 URIs];
    if (v12) {
      CFDataRef v14 = (char *)[v6 URIix] - 1;
    }
    else {
      CFDataRef v14 = 0;
    }
    uint64_t v15 = [v13 objectAtIndexedSubscript:v14];
    v8[10] = v15;

    if (v10) {
      ++*(_DWORD *)(v10 + 52);
    }
  }

  return v11;
}

@end