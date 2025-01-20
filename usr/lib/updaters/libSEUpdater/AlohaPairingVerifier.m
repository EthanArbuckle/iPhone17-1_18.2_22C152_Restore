@interface AlohaPairingVerifier
- (AlohaPairingVerifier)initWithController:(shared_ptr<SEUpdater:(const AlohaVerificationOptions *)a4 :P73BaseSEController>)a3 options:;
- (BOOL)injectSEPKtoSSE:(id *)a3;
- (BOOL)injectSEPKtoSSE_Debug:(id *)a3;
- (BOOL)injectSEPKtoSSE_FDR:(id *)a3;
- (id)getSharingRequestWithSignature:(id *)a3 withError:(id *)a4;
- (id)performAlohaVerification;
- (id)performAuthKeySharingWithAppleSSE:(id)a3 sharingRequest:(id)a4 requestSignature:(id)a5 resultSignature:(id *)a6 withError:(id *)a7;
- (void)invalidate;
@end

@implementation AlohaPairingVerifier

- (AlohaPairingVerifier)initWithController:(shared_ptr<SEUpdater:(const AlohaVerificationOptions *)a4 :P73BaseSEController>)a3 options:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v15.receiver = self;
  v15.super_class = (Class)AlohaPairingVerifier;
  v6 = [(AlohaPairingVerifier *)&v15 init];
  if (v6)
  {
    v7 = [SETransceiveHelper alloc];
    v8 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v13 = *(void *)ptr;
    v14 = v8;
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = [(SETransceiveHelper *)v7 initWithSEController:&v13];
    transceiver = v6->_transceiver;
    v6->_transceiver = (SETransceiveHelper *)v9;

    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
    seid = v6->_seid;
    v6->_seid = 0;

    v6->_options = (const AlohaVerificationOptions *)cntrl;
  }
  return v6;
}

- (void)invalidate
{
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier invalidate]", &cfstr_Alohapairingve_0.isa);
  transceiver = self->_transceiver;

  [(SETransceiveHelper *)transceiver invalidate];
}

- (id)performAlohaVerification
{
  transceiver = self->_transceiver;
  id v44 = 0;
  v4 = [(SETransceiveHelper *)transceiver copySeid:&v44];
  v5 = (NSError *)v44;
  seid = self->_seid;
  self->_seid = v4;

  if (self->_seid) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7)
  {
    uint64_t v8 = _ObjCLogNSError(v5, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Copyseid.isa);
LABEL_25:
    v26 = (void *)v8;
    goto LABEL_32;
  }
  id v43 = 0;
  BOOL v9 = [(AlohaPairingVerifier *)self injectSEPKtoSSE:&v43];
  v10 = (NSError *)v43;
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v9;
  }
  if (!v11)
  {
    v5 = v10;
    uint64_t v8 = _ObjCLogNSError(v10, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Injectsepktoss.isa);
    goto LABEL_25;
  }
  id v42 = 0;
  id v41 = 0;
  v12 = [(AlohaPairingVerifier *)self getSharingRequestWithSignature:&v42 withError:&v41];
  id v13 = v42;
  v14 = (NSError *)v41;
  v5 = v14;
  if (!v14 && v12 && v13)
  {
    objc_super v15 = self->_seid;
    id v39 = 0;
    id v40 = 0;
    v16 = [(AlohaPairingVerifier *)self performAuthKeySharingWithAppleSSE:v15 sharingRequest:v12 requestSignature:v13 resultSignature:&v40 withError:&v39];
    id v17 = v40;
    v18 = (NSError *)v39;
    v5 = v18;
    if (!v18 && v16 && v17)
    {
      v19 = self->_transceiver;
      id v38 = 0;
      BOOL v20 = [(SETransceiveHelper *)v19 crsSetSharingResult:v16 signature:v17 error:&v38];
      v21 = (NSError *)v38;
      if (v21) {
        BOOL v22 = 0;
      }
      else {
        BOOL v22 = v20;
      }
      if (v22)
      {
        v36 = 0;
        v37 = 0;
        v23 = self->_seid;
        v35[0] = 0;
        v35[1] = &v37;
        v34[0] = 0;
        v34[1] = &v36;
        uint64_t v24 = SSEGetEntangledAuthorizationRandom(-1, (const __CFData *)v23, 0, (CFDataRef *)v35, (CFDataRef *)v34);
        ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy(v34);
        ctu::cf::detail::TakeOwnershipProxy<__CFData const>::~TakeOwnershipProxy(v35);
        if (!v24
          && (v37
            ? (v29 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get)
            : (v29 = 0),
              v29
           && (v36
             ? (v30 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get)
             : (v30 = 0),
               v30)))
        {
          BOOL v31 = -[SETransceiveHelper setAuthRandom:mac:error:](self->_transceiver, "setAuthRandom:mac:error:");
          v32 = (NSError *)0;
          if (v32) {
            BOOL v33 = 0;
          }
          else {
            BOOL v33 = v31;
          }
          if (v33)
          {
            v5 = 0;
            v26 = 0;
            goto LABEL_23;
          }
          v5 = v32;
          uint64_t v25 = _ObjCLogNSError(v32, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Setauthrandom.isa);
        }
        else
        {
          v5 = 0;
          uint64_t v25 = _ObjCLogNSError(0, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Ssegetauthoriz.isa, v24);
        }
        v26 = (void *)v25;
LABEL_23:
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v36);
        ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::~SharedRef(&v37);
LABEL_30:

        goto LABEL_31;
      }
      v5 = v21;
      uint64_t v27 = _ObjCLogNSError(v21, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Crssetsharingr.isa);
    }
    else
    {
      uint64_t v27 = _ObjCLogNSError(v18, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Performauthkey.isa);
    }
    v26 = (void *)v27;
    goto LABEL_30;
  }
  v26 = _ObjCLogNSError(v14, 14, "-[AlohaPairingVerifier performAlohaVerification]", &cfstr_Getsharingrequ.isa);
LABEL_31:

LABEL_32:

  return v26;
}

- (BOOL)injectSEPKtoSSE:(id *)a3
{
  if (self->_options->var0) {
    return [(AlohaPairingVerifier *)self injectSEPKtoSSE_Debug:a3];
  }
  else {
    return [(AlohaPairingVerifier *)self injectSEPKtoSSE_FDR:a3];
  }
}

- (BOOL)injectSEPKtoSSE_Debug:(id *)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  transceiver = self->_transceiver;
  id v35 = 0;
  id v36 = 0;
  id v34 = 0;
  BOOL v5 = [(SETransceiveHelper *)transceiver getSEPK:&v36 andSEID:&v35 deleteExisting:0 error:&v34];
  id v6 = v36;
  id v7 = v35;
  id v8 = v34;
  id v13 = v8;
  if (!v5 || v8 != 0 || v6 == 0 || v7 == 0)
  {
    _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_Debug:]", @"Failed to getSEPK : %@", v9, v10, v11, v12, (uint64_t)v8);
  }
  else
  {
    memset(&inputStruct[1], 0, 94);
    inputStruct[0] = 1397966179;
    LOBYTE(inputStruct[1]) = -10;
    LOWORD(inputStruct[2]) = 258;
    mach_port_t SSEIOConnect = getSSEIOConnect();
    uint64_t v18 = IOConnectCallStructMethod(SSEIOConnect, 0, inputStruct, 0x62uLL, 0, 0);
    if (v18)
    {
      v23 = @"Unable to EnableTestSEContext %d";
    }
    else
    {
      LOBYTE(inputStruct[2]) = 3;
      id v24 = v7;
      uint64_t v25 = [v24 bytes];
      long long v26 = *(_OWORD *)v25;
      *(void *)((char *)&inputStruct[6] + 1) = *(void *)(v25 + 16);
      *(_OWORD *)((char *)&inputStruct[2] + 1) = v26;
      uint64_t v27 = [v6 bytes];
      *(_OWORD *)((char *)&inputStruct[8] + 1) = *(_OWORD *)v27;
      long long v28 = *(_OWORD *)(v27 + 16);
      long long v29 = *(_OWORD *)(v27 + 32);
      long long v30 = *(_OWORD *)(v27 + 48);
      BYTE1(inputStruct[24]) = *(unsigned char *)(v27 + 64);
      *(_OWORD *)((char *)&inputStruct[20] + 1) = v30;
      *(_OWORD *)((char *)&inputStruct[16] + 1) = v29;
      *(_OWORD *)((char *)&inputStruct[12] + 1) = v28;
      mach_port_t v31 = getSSEIOConnect();
      uint64_t v18 = IOConnectCallStructMethod(v31, 0, inputStruct, 0x62uLL, 0, 0);
      if (!v18)
      {
        _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier injectSEPKtoSSE_Debug:]", &cfstr_SuccessfullyDe.isa, v24);
        BOOL v32 = 1;
        goto LABEL_19;
      }
      v23 = @"Error code %d received when setting SE PK in SSE";
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_Debug:]", v23, v19, v20, v21, v22, v18);
  }
  BOOL v32 = 0;
LABEL_19:

  return v32;
}

- (BOOL)injectSEPKtoSSE_FDR:(id *)a3
{
  v38[3] = *MEMORY[0x263EF8340];
  id v36 = 0;
  v37[0] = @"VerifyData";
  BOOL v5 = [NSNumber numberWithBool:0];
  v38[0] = v5;
  v37[1] = @"StripImg4";
  id v6 = [NSNumber numberWithBool:0];
  v38[1] = v6;
  v37[2] = @"GetCombined";
  id v7 = [NSNumber numberWithBool:1];
  v38[2] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
  uint64_t v9 = (void *)[v8 mutableCopy];

  transceiver = self->_transceiver;
  id v35 = 0;
  id v11 = [(SETransceiveHelper *)transceiver copySeid:&v35];
  id v12 = v35;
  v16 = v12;
  if (!v11 || v12)
  {
    _ObjCLogWrapOutError(a3, v12, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", @"Failed to copy SEID", v13, v14, v15, v31);
    BOOL v24 = 0;
    goto LABEL_12;
  }
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", &cfstr_PassingFdropti.isa, v9);
  id v17 = [v11 asHexString];
  uint64_t v18 = [v17 uppercaseString];

  BOOL v33 = 0;
  id v34 = &v36;
  CFDataRef v19 = (const __CFData *)AMFDRSealingMapCopyLocalData();
  ctu::cf::detail::TakeOwnershipProxy<__CFError>::~TakeOwnershipProxy(&v33);
  if (v19
    && (v36
      ? (uint64_t v20 = ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::get)
      : (uint64_t v20 = 0),
        !v20))
  {
    uint64_t v26 = SSESetSEPubKey((const __CFData *)self->_seid, v19);
    if (!v26)
    {
      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", &cfstr_SuccessfullyFd.isa, self->_seid, v33, v34);
      BOOL v24 = 1;
      goto LABEL_10;
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", @"SSESetSEPubKey returned %d\n", v27, v28, v29, v30, v26);
  }
  else
  {
    _ObjCLog(0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", &cfstr_ErrorFromAmfdr.isa, v36, v33, v34);
    _ObjCLogWrapOutError(a3, v36, 0, "-[AlohaPairingVerifier injectSEPKtoSSE_FDR:]", @"AMFDRSealingMapCopyLocalData", v21, v22, v23, v32);
  }
  BOOL v24 = 0;
LABEL_10:

LABEL_12:
  ctu::SharedRef<__CFError,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFError>::~SharedRef((const void **)&v36);
  return v24;
}

- (id)getSharingRequestWithSignature:(id *)a3 withError:(id *)a4
{
  transceiver = self->_transceiver;
  id v22 = 0;
  id v7 = [(SETransceiveHelper *)transceiver crsGetSharingRequestWithError:&v22];
  id v8 = v22;
  id v12 = v8;
  if (v7) {
    BOOL v13 = v8 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    if ((unint64_t)[v7 length] > 0x40)
    {
      [v7 subdataWithRange:65, [v7 length] - 65];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v7 subdataWithRange:0, 65];
    }
    else
    {
      uint64_t v15 = [v7 length];
      _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingVerifier getSharingRequestWithSignature:withError:]", @"Unexpected length for sharing request %u\n", v16, v17, v18, v19, v15);
      uint64_t v14 = 0;
    }
  }
  else
  {
    _ObjCLogWrapOutError(a4, v8, 0, "-[AlohaPairingVerifier getSharingRequestWithSignature:withError:]", @"Failed to get sharing request\n", v9, v10, v11, v21);
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)performAuthKeySharingWithAppleSSE:(id)a3 sharingRequest:(id)a4 requestSignature:(id)a5 resultSignature:(id *)a6 withError:(id *)a7
{
  CFDataRef v11 = (const __CFData *)a3;
  CFDataRef v12 = (const __CFData *)a4;
  CFDataRef v13 = (const __CFData *)a5;
  CFDataRef v23 = 0;
  CFDataRef v24 = 0;
  uint64_t v14 = SSEPerformAuthKeySharing(v11, v12, v13, &v24, &v23);
  CFDataRef v15 = v24;
  CFDataRef v16 = v23;
  *a6 = v16;
  if (!v14 && v15 && v16)
  {
    CFDataRef v17 = v15;
  }
  else
  {
    _ObjCLog(0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", &cfstr_PerformedShari.isa, v11);
    _ObjCLog(0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", &cfstr_Request.isa, v12);
    _ObjCLog(0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", &cfstr_Requestsig.isa, v13);
    _ObjCLogOutError((uint64_t *)a7, 0, "-[AlohaPairingVerifier performAuthKeySharingWithAppleSSE:sharingRequest:requestSignature:resultSignature:withError:]", @"Bad status received when sharing auth key %d or nil for sharing result %d or nil for sharing result signature %d\n", v18, v19, v20, v21, v14);
    CFDataRef v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seid, 0);

  objc_storeStrong((id *)&self->_transceiver, 0);
}

@end