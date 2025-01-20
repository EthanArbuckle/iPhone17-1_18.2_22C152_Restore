@interface MRDGroupSessionApprovalManager
+ (id)hashForIdentity:(id)a3;
+ (void)donateApprovedIdentity:(id)a3;
+ (void)donateRemovedIdentity:(id)a3;
+ (void)shouldAutoApproveIdentity:(id)a3 completion:(id)a4;
+ (void)shouldAutoApproveOOBKeys:(id)a3 withSession:(id)a4 completion:(id)a5;
+ (void)shouldAutoApproveRequest:(id)a3 withSession:(id)a4 completion:(id)a5;
@end

@implementation MRDGroupSessionApprovalManager

+ (id)hashForIdentity:(id)a3
{
  id v3 = a3;
  long long v66 = 0u;
  long long v65 = 0u;
  long long v64 = 0u;
  long long v63 = 0u;
  long long v62 = 0u;
  long long v61 = 0u;
  long long v60 = 0u;
  memset(&v59, 0, sizeof(v59));
  CC_SHA1_Init(&v59);
  v4 = [v3 identifier];
  v5 = +[MRUserSettings currentSettings];
  v6 = [v5 recentGroupSessionParticipantsPepper];
  id v7 = [v4 stringByAppendingString:v6];
  CC_SHA1_Update(&v59, [v7 UTF8String], (CC_LONG)objc_msgSend(v7, "length"));

  memset(&v67[8], 0, 64);
  *(void *)v67 = 4001;
  CC_SHA1_Final(&v67[8], &v59);
  v68[0] = *(_OWORD *)v67;
  v68[1] = *(_OWORD *)&v67[16];
  v68[2] = *(_OWORD *)&v67[32];
  v68[3] = *(_OWORD *)&v67[48];
  uint64_t v69 = *(void *)&v67[64];
  if (*(uint64_t *)v67 > 3999)
  {
    if (*(uint64_t *)v67 > 4255)
    {
      if (*(void *)v67 == 4256)
      {
        v48 = (unsigned __int8 *)v68 + 8;
        v49 = (char *)malloc_type_calloc(0x40uLL, 1uLL, 0x100004077774924uLL);
        v50 = v49;
        for (uint64_t i = 0; i != 64; i += 2)
        {
          unsigned int v52 = *v48++;
          v53 = &v49[i];
          char *v53 = a0123456789abcd[(unint64_t)v52 >> 4];
          v53[1] = a0123456789abcd[v52 & 0xF];
        }
        id v20 = objc_alloc((Class)NSString);
        v21 = v50;
        uint64_t v22 = 64;
      }
      else
      {
        if (*(void *)v67 != 4512) {
          goto LABEL_44;
        }
        v27 = (unsigned __int8 *)v68 + 8;
        v28 = (char *)malloc_type_calloc(0x80uLL, 1uLL, 0x100004077774924uLL);
        v29 = v28;
        for (uint64_t j = 0; j != 128; j += 2)
        {
          unsigned int v31 = *v27++;
          v32 = &v28[j];
          char *v32 = a0123456789abcd[(unint64_t)v31 >> 4];
          v32[1] = a0123456789abcd[v31 & 0xF];
        }
        id v20 = objc_alloc((Class)NSString);
        v21 = v29;
        uint64_t v22 = 128;
      }
    }
    else if (*(void *)v67 == 4000)
    {
      v38 = (unsigned __int8 *)v68 + 8;
      v39 = (char *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
      v40 = v39;
      for (uint64_t k = 0; k != 32; k += 2)
      {
        unsigned int v42 = *v38++;
        v43 = &v39[k];
        char *v43 = a0123456789abcd[(unint64_t)v42 >> 4];
        v43[1] = a0123456789abcd[v42 & 0xF];
      }
      id v20 = objc_alloc((Class)NSString);
      v21 = v40;
      uint64_t v22 = 32;
    }
    else
    {
      if (*(void *)v67 != 4001) {
        goto LABEL_44;
      }
      v14 = (unsigned __int8 *)v68 + 8;
      v15 = (char *)malloc_type_calloc(0x28uLL, 1uLL, 0x100004077774924uLL);
      v16 = v15;
      for (uint64_t m = 0; m != 40; m += 2)
      {
        unsigned int v18 = *v14++;
        v19 = &v15[m];
        char *v19 = a0123456789abcd[(unint64_t)v18 >> 4];
        v19[1] = a0123456789abcd[v18 & 0xF];
      }
      id v20 = objc_alloc((Class)NSString);
      v21 = v16;
      uint64_t v22 = 40;
    }
  }
  else
  {
    if (*(uint64_t *)v67 <= 2999)
    {
      if (*(void *)v67 == 1000)
      {
        uint64_t v33 = *((void *)&v68[0] + 1);
        v34 = (UInt8 *)&v71;
        uint64_t quot = *((void *)&v68[0] + 1);
        do
        {
          lldiv_t v36 = lldiv(quot, 10);
          uint64_t quot = v36.quot;
          if (v36.rem >= 0) {
            LOBYTE(v37) = v36.rem;
          }
          else {
            uint64_t v37 = -v36.rem;
          }
          *v34-- = v37 + 48;
        }
        while (v36.quot);
        if (v33 < 0) {
          UInt8 *v34 = 45;
        }
        else {
          ++v34;
        }
        CFIndex v12 = (char *)v72 - (char *)v34;
        v13 = v34;
        goto LABEL_47;
      }
      if (*(void *)v67 == 2000)
      {
        uint64_t v8 = 0;
        uint64_t v9 = DWORD2(v68[0]);
        do
        {
          ldiv_t v10 = ldiv(v9, 10);
          uint64_t v9 = v10.quot;
          if (v10.rem >= 0) {
            LOBYTE(v11) = v10.rem;
          }
          else {
            uint64_t v11 = -v10.rem;
          }
          *(&v71 + v8--) = v11 + 48;
        }
        while (v10.quot);
        CFIndex v12 = -v8;
        v13 = (const UInt8 *)v72 + v8;
LABEL_47:
        CFStringRef v54 = CFStringCreateWithBytes(0, v13, v12, 0x8000100u, 0);
        goto LABEL_48;
      }
LABEL_44:
      v55 = +[NSAssertionHandler currentHandler];
      v56 = +[NSString stringWithUTF8String:"NSString * _Nonnull _MSVHashGetDigest(MSVHash)"];
      [v55 handleFailureInFunction:v56 file:@"MSVHasher+Algorithms.h" lineNumber:356 description:@"Cannot obtain digest from unknown hasher algorithm"];

      v57 = &stru_10042ACB0;
      goto LABEL_49;
    }
    if (*(void *)v67 == 3000)
    {
      LODWORD(v70[0]) = bswap32(DWORD2(v68[0]));
      v44 = (char *)malloc_type_calloc(8uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v45 = 0;
      v46 = v44 + 1;
      do
      {
        unint64_t v47 = *((unsigned __int8 *)v70 + v45);
        *(v46 - 1) = a0123456789abcd[v47 >> 4];
        unsigned char *v46 = a0123456789abcd[v47 & 0xF];
        v46 += 2;
        ++v45;
      }
      while (v45 != 4);
      id v20 = objc_alloc((Class)NSString);
      v21 = v44;
      uint64_t v22 = 8;
    }
    else
    {
      if (*(void *)v67 != 3001) {
        goto LABEL_44;
      }
      v70[0] = bswap64(*((unint64_t *)&v68[0] + 1));
      v23 = (char *)malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
      uint64_t v24 = 0;
      v25 = v23 + 1;
      do
      {
        unint64_t v26 = *((unsigned __int8 *)v70 + v24);
        *(v25 - 1) = a0123456789abcd[v26 >> 4];
        unsigned char *v25 = a0123456789abcd[v26 & 0xF];
        v25 += 2;
        ++v24;
      }
      while (v24 != 8);
      id v20 = objc_alloc((Class)NSString);
      v21 = v23;
      uint64_t v22 = 16;
    }
  }
  CFStringRef v54 = (CFStringRef)[v20 initWithBytesNoCopy:v21 length:v22 encoding:4 freeWhenDone:1];
LABEL_48:
  v57 = (__CFString *)v54;
LABEL_49:

  return v57;
}

+ (void)donateApprovedIdentity:(id)a3
{
  id v9 = a3;
  if ([v9 type])
  {
    id v3 = +[MRDGroupSessionApprovalManager hashForIdentity:v9];
    v4 = BiomeLibrary();
    v5 = [v4 MediaRemote];
    v6 = [v5 GroupSessionRecentParticipant];

    id v7 = [objc_alloc((Class)BMMediaRemoteGroupSessionRecentParticipant) initWithHashedUserIdentityIdentifier:v3];
    uint64_t v8 = [v6 source];
    [v8 sendEvent:v7];
  }
}

+ (void)donateRemovedIdentity:(id)a3
{
  id v3 = a3;
  if ([v3 type])
  {
    v4 = +[MRDGroupSessionApprovalManager hashForIdentity:v3];
    v5 = BiomeLibrary();
    v6 = [v5 MediaRemote];
    id v7 = [v6 GroupSessionRecentParticipant];

    uint64_t v8 = [v7 pruner];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100034E48;
    v10[3] = &unk_100416CD0;
    id v11 = v4;
    id v9 = v4;
    [v8 deleteEventsPassingTest:v10];
  }
}

+ (void)shouldAutoApproveRequest:(id)a3 withSession:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  ldiv_t v10 = (void (**)(id, void, uint64_t, uint64_t))a5;
  if (sub_10016AA00()
    || (+[MRUserSettings currentSettings],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 supportGroupSessionAutoApproval],
        v11,
        (v12 & 1) == 0))
  {
    v10[2](v10, 0, -1, 1);
  }
  else
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000350A0;
    v22[3] = &unk_100416CF8;
    id v13 = v8;
    id v23 = v13;
    v14 = v10;
    id v24 = v14;
    v15 = objc_retainBlock(v22);
    v16 = [v13 identity];
    if ([v16 type])
    {
      v17 = [v13 oobKeys];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1000351C4;
      v18[3] = &unk_100416D48;
      id v20 = v15;
      id v21 = a1;
      id v19 = v16;
      [a1 shouldAutoApproveOOBKeys:v17 withSession:v9 completion:v18];
    }
    else
    {
      v14[2](v14, 0, 0, 1);
    }
  }
}

+ (void)shouldAutoApproveIdentity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[MRDGroupSessionApprovalManager hashForIdentity:v5];
  id v8 = BiomeLibrary();
  id v9 = [v8 MediaRemote];
  ldiv_t v10 = [v9 GroupSessionRecentParticipant];

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  id v11 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:0 endDate:0 maxEvents:0 lastN:0 reversed:1];
  unsigned __int8 v12 = [v10 publisherWithOptions:v11];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000354D4;
  v20[3] = &unk_100416D70;
  id v13 = v6;
  id v21 = v13;
  uint64_t v22 = v25;
  id v23 = v24;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000354FC;
  v16[3] = &unk_100416D98;
  id v14 = v7;
  id v17 = v14;
  unsigned int v18 = v24;
  id v19 = v25;
  id v15 = [v12 sinkWithCompletion:v20 shouldContinue:v16];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
}

+ (void)shouldAutoApproveOOBKeys:(id)a3 withSession:(id)a4 completion:(id)a5
{
}

@end