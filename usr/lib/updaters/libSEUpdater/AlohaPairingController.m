@interface AlohaPairingController
- (AlohaPairingController)initWithOptions:(const void *)a3 seController:(shared_ptr<SEUpdater::P73BaseSEController>)a4;
- (BOOL)submitPairingRecord:(id *)a3;
- (BOOL)useReverseProxy;
- (NSData)seid;
- (NSDictionary)reverseProxySettings;
- (NSMutableArray)alohaPlistRecord;
- (NSNumber)alohaVersion;
- (NSNumber)apChipId;
- (NSNumber)ecid;
- (NSString)alohaHostname;
- (NSString)debugRecordPath;
- (NSString)fullServerSessionID;
- (NSString)serverSessionID;
- (SETransceiveHelper)transceiver;
- (id)beginPair:(id *)a3;
- (id)getReverseProxySettings:(id)a3 outError:(id *)a4;
- (id)performHTTPRequestWithRequestDict:(id)a3 outError:(id *)a4;
- (id)processApduReqPayload:(id)a3 outError:(id *)a4;
- (id)processAuthReqPayload:(id)a3 outError:(id *)a4;
- (id)processEndPair:(id)a3;
- (id)verifyAndRetrieveServerSessionId:(id)a3;
- (int)performAlohaPairing;
- (unint64_t)state;
- (void)dealloc;
- (void)invalidate;
- (void)setAlohaHostname:(id)a3;
- (void)setAlohaPlistRecord:(id)a3;
- (void)setAlohaVersion:(id)a3;
- (void)setApChipId:(id)a3;
- (void)setDebugRecordPath:(id)a3;
- (void)setEcid:(id)a3;
- (void)setFullServerSessionID:(id)a3;
- (void)setReverseProxySettings:(id)a3;
- (void)setSeid:(id)a3;
- (void)setServerSessionID:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTransceiver:(id)a3;
- (void)setUseReverseProxy:(BOOL)a3;
- (void)writeRecord:(id)a3 fileExtension:(id)a4;
@end

@implementation AlohaPairingController

- (AlohaPairingController)initWithOptions:(const void *)a3 seController:(shared_ptr<SEUpdater::P73BaseSEController>)a4
{
  ptr = a4.__ptr_;
  v21.receiver = self;
  v21.super_class = (Class)AlohaPairingController;
  v6 = [(AlohaPairingController *)&v21 init];
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_alohaHostname, *((id *)a3 + 2));
    v9 = (void *)*((void *)a3 + 3);
    if (v9) {
      v10 = ctu::SharedRef<__CFString const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFString const>::get;
    }
    else {
      v10 = 0;
    }
    if (v10) {
      objc_storeStrong((id *)&v7->_debugRecordPath, v9);
    }
    objc_storeStrong((id *)&v7->_alohaVersion, *((id *)a3 + 1));
    v11 = [SETransceiveHelper alloc];
    v12 = (std::__shared_weak_count *)*((void *)ptr + 1);
    uint64_t v19 = *(void *)ptr;
    v20 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v13 = [(SETransceiveHelper *)v11 initWithSEController:&v19];
    transceiver = v8->_transceiver;
    v8->_transceiver = (SETransceiveHelper *)v13;

    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    v8->_useReverseProxy = *((unsigned char *)a3 + 32);
    uint64_t v15 = [MEMORY[0x263EFF980] array:v19];
    alohaPlistRecord = v8->_alohaPlistRecord;
    v8->_alohaPlistRecord = (NSMutableArray *)v15;

    v8->_state = 1;
    alohaServerIP = v8->_alohaServerIP;
    v8->_alohaServerIP = 0;

    v8->_restoreEnvironment = 1;
  }
  return v8;
}

- (void)dealloc
{
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController dealloc]", &cfstr_Alohapairingco_0.isa);
  v3.receiver = self;
  v3.super_class = (Class)AlohaPairingController;
  [(AlohaPairingController *)&v3 dealloc];
}

- (void)invalidate
{
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController invalidate]", &cfstr_Alohapairingco_2.isa);
  [(SETransceiveHelper *)self->_transceiver invalidate];
  transceiver = self->_transceiver;
  self->_transceiver = 0;
}

- (int)performAlohaPairing
{
  if (self->_useReverseProxy)
  {
    alohaHostname = self->_alohaHostname;
    id v36 = 0;
    v4 = [(AlohaPairingController *)self getReverseProxySettings:alohaHostname outError:&v36];
    id v5 = v36;
    reverseProxySettings = self->_reverseProxySettings;
    self->_reverseProxySettings = v4;

    int v7 = 26;
    if (!self->_reverseProxySettings || v5) {
      goto LABEL_45;
    }
  }
  v8 = 0;
  while (2)
  {
    for (unint64_t i = self->_state; ; unint64_t i = 4)
    {
      if (i != 3)
      {
        switch(i)
        {
          case 4uLL:
            uint64_t v28 = [(AlohaPairingController *)self processEndPair:v8];
            v29 = (void *)v28;
            if (v28)
            {
              uint64_t v15 = 0;
              _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_ErrorEncounter_14.isa, v28);
              int v7 = 37;
              id v5 = v29;
              goto LABEL_44;
            }
            id v5 = 0;
            _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController performAlohaPairing]", &cfstr_PairingEndedWi.isa);
            int v7 = 0;
            goto LABEL_43;
          case 2uLL:
            v18 = [v8 objectForKeyedSubscript:@"Command"];
            if (![v18 isEqualToString:@"AUTHREQ"]
              || ([v8 objectForKeyedSubscript:@"SessionId"],
                  (uint64_t v19 = objc_claimAutoreleasedReturnValue()) == 0))
            {

              goto LABEL_42;
            }
            v20 = [v8 objectForKeyedSubscript:@"DATA"];

            if (!v20)
            {
LABEL_42:
              id v5 = 0;
              _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_MalformedReply.isa, v8);
              int v7 = 37;
              goto LABEL_43;
            }
            objc_super v21 = [v8 objectForKeyedSubscript:@"DATA"];
            id v34 = 0;
            uint64_t v15 = [(AlohaPairingController *)self processAuthReqPayload:v21 outError:&v34];
            id v5 = v34;

            if (!v5 && v15)
            {
              unint64_t v17 = 3;
              goto LABEL_24;
            }
            _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_ErrorEncounter_11.isa, v5);
            break;
          case 1uLL:
            id v35 = 0;
            uint64_t v15 = [(AlohaPairingController *)self beginPair:&v35];
            id v16 = v35;
            id v5 = v16;
            if (!v16 && v15)
            {
              unint64_t v17 = 2;
LABEL_24:
              self->_state = v17;
              v22 = v15;
              goto LABEL_28;
            }
            _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_ErrorEncounter_10.isa, v16);
            break;
          default:
            id v5 = 0;
            _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_UnexpectedStat.isa, i);
            int v7 = 39;
LABEL_43:
            uint64_t v15 = 0;
            goto LABEL_44;
        }
        int v7 = 39;
        goto LABEL_44;
      }
      v10 = [v8 objectForKeyedSubscript:@"Command"];
      if ([v10 isEqualToString:@"APDUREQ"])
      {
      }
      else
      {
        v11 = [v8 objectForKeyedSubscript:@"Command"];
        char v12 = [v11 isEqualToString:@"EndPair"];

        if ((v12 & 1) == 0)
        {
          v30 = [v8 objectForKeyedSubscript:@"Command"];
          _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_UnexpectedComm.isa, v30);

          id v5 = 0;
          uint64_t v15 = 0;
          int v7 = 37;
          goto LABEL_44;
        }
      }
      uint64_t v13 = [v8 objectForKeyedSubscript:@"Command"];
      int v14 = [v13 isEqualToString:@"EndPair"];

      if (!v14) {
        break;
      }
      self->_state = 4;
    }
    v23 = [v8 objectForKeyedSubscript:@"DATA"];

    if (!v23) {
      goto LABEL_42;
    }
    v24 = [v8 objectForKeyedSubscript:@"DATA"];
    id v33 = 0;
    v22 = [(AlohaPairingController *)self processApduReqPayload:v24 outError:&v33];
    id v5 = v33;

    if (v5 || !v22)
    {
      _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_ErrorEncounter_12.isa, v5);
      int v7 = 39;
      uint64_t v15 = v22;
    }
    else
    {
LABEL_28:

      id v32 = 0;
      v25 = [(AlohaPairingController *)self performHTTPRequestWithRequestDict:v22 outError:&v32];
      id v26 = v32;
      id v5 = v26;
      if (v26 || !v25)
      {
        _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_ErrorEncounter_13.isa, v22, v25, v26);
      }
      else
      {
        v27 = [v25 objectForKeyedSubscript:@"SessionId"];
        id v5 = [(AlohaPairingController *)self verifyAndRetrieveServerSessionId:v27];

        if (!v5 && self->_serverSessionID)
        {

          v8 = v25;
          continue;
        }
        _ObjCLog(0, "-[AlohaPairingController performAlohaPairing]", &cfstr_ErrorWhenVerif.isa, v5);
      }
      int v7 = 37;
      uint64_t v15 = v22;
      v8 = v25;
    }
    break;
  }
LABEL_44:

LABEL_45:
  return v7;
}

- (id)beginPair:(id *)a3
{
  v60[16] = *MEMORY[0x263EF8340];
  id v5 = [(SETransceiveHelper *)self->_transceiver selectWithAID:@"A00000015153504341534400"];
  id v9 = v5;
  if (v5)
  {
    _ObjCLogWrapOutError(a3, v5, 0, "-[AlohaPairingController beginPair:]", @"Error encountered when selecting CASD %@\n", v6, v7, v8, (uint64_t)v5);
    v10 = 0;
  }
  else
  {
    transceiver = self->_transceiver;
    id v58 = 0;
    char v12 = [(SETransceiveHelper *)transceiver copySeid:&v58];
    id v9 = v58;
    seid = self->_seid;
    self->_seid = v12;

    if (v9 || !self->_seid)
    {
      _ObjCLogWrapOutError(a3, v9, 0, "-[AlohaPairingController beginPair:]", @"Error encountered when copying SEID %@\n", v14, v15, v16, (uint64_t)v9);
      v10 = 0;
    }
    else
    {
      unint64_t v17 = self->_transceiver;
      id v57 = 0;
      id v18 = [(SETransceiveHelper *)v17 copyCasdCert:&v57];
      id v19 = v57;
      id v9 = v19;
      if (v19 || !v18)
      {
        v10 = 0;
        _ObjCLogWrapOutError(a3, v19, 0, "-[AlohaPairingController beginPair:]", @"Error encountered when retrieving casdCertificate %@\n", v20, v21, v22, (uint64_t)v19);
      }
      else
      {
        v23 = self->_transceiver;
        id v56 = 0;
        uint64_t v24 = [(SETransceiveHelper *)v23 copyDeviceType:&v56];
        id v25 = v56;
        id v30 = v25;
        if (v25 || v24 == 255)
        {
          _ObjCLogWrapOutError(a3, v25, 0, "-[AlohaPairingController beginPair:]", @"Unable to retrieve seDeviceType with error %@\n", v27, v28, v29, (uint64_t)v25);
          v10 = 0;
          id v9 = v30;
        }
        else if (v24 == 32 || v24 == 115 || v24 == 100)
        {
          _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingController beginPair:]", @"seDeviceType does not support A9\n", v26, v27, v28, v29, v51);
          id v9 = 0;
          v10 = 0;
        }
        else
        {
          id v32 = self->_transceiver;
          id v55 = 0;
          id v33 = [(SETransceiveHelper *)v32 copyA9Parameters:&v55];
          id v9 = v55;
          if (!v9 && v33 && [v33 count] == 2)
          {
            v38 = [NSNumber numberWithLongLong:MGGetSInt64Answer()];
            ecid = self->_ecid;
            self->_ecid = v38;

            v40 = [NSNumber numberWithUnsignedInt:MGGetSInt64Answer()];
            apChipId = self->_apChipId;
            self->_apChipId = v40;

            v59[0] = @"Command";
            v59[1] = @"ECID";
            v42 = self->_ecid;
            v60[0] = @"BeginPair";
            v60[1] = v42;
            v60[2] = self->_apChipId;
            v59[2] = @"ApChipId";
            v59[3] = @"ApBoardId";
            v54 = [NSNumber numberWithUnsignedInt:MGGetSInt64Answer()];
            v60[3] = v54;
            v60[4] = _MergedGlobals_4;
            v59[4] = @"ApSecurityDomain";
            v59[5] = @"SOCProductionMode";
            v53 = [NSNumber numberWithBool:MGGetBoolAnswer()];
            v60[5] = v53;
            v59[6] = @"SOCSecurityMode";
            v52 = [NSNumber numberWithBool:MGGetBoolAnswer()];
            v60[6] = v52;
            v59[7] = @"ApEffectiveProductionMode";
            v43 = [NSNumber numberWithBool:MGGetBoolAnswer()];
            v60[7] = v43;
            v59[8] = @"ApEffectiveSecurityMode";
            v44 = [NSNumber numberWithBool:MGGetBoolAnswer()];
            v60[8] = v44;
            v59[9] = @"SEPEffectiveProductionMode";
            v45 = [NSNumber numberWithBool:MGGetBoolAnswer()];
            v60[9] = v45;
            v59[10] = @"SEPEffectiveSecurityMode";
            v46 = [NSNumber numberWithBool:MGGetBoolAnswer()];
            v47 = self->_seid;
            v60[10] = v46;
            v60[11] = v47;
            v59[11] = @"SEID";
            v59[12] = @"CASDCert";
            v60[12] = v18;
            v59[13] = @"OBKG";
            v48 = [v33 objectAtIndexedSubscript:1];
            v60[13] = v48;
            v59[14] = @"ServerA9CertSN";
            v49 = [v33 objectAtIndexedSubscript:0];
            v59[15] = @"AlohaVersion";
            alohaVersion = self->_alohaVersion;
            v60[14] = v49;
            v60[15] = alohaVersion;
            v10 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:16];
          }
          else
          {
            _ObjCLogOutError((uint64_t *)a3, 0, "-[AlohaPairingController beginPair:]", @"Error when copying a9 params %@\n", v34, v35, v36, v37, (uint64_t)v9);
            v10 = 0;
          }
        }
      }
    }
  }

  return v10;
}

- (id)processAuthReqPayload:(id)a3 outError:(id *)a4
{
  v75[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  [v7 setValue:@"AUTHRESP" forKey:@"Command"];
  [v7 setValue:qword_26AD829E0 forKey:@"ErrorCode"];
  [v7 setValue:@"Failure" forKey:@"ErrorMessage"];
  [v7 setValue:self->_fullServerSessionID forKey:@"SessionId"];
  [v7 setValue:*MEMORY[0x263EFFA70] forKey:@"DATA"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"HSMChallengeSE"];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"HSMChallengeSEP"];
  CFDataRef v14 = (const __CFData *)v9;
  if (!v8 || !v9)
  {
    _ObjCLogOutError((uint64_t *)a4, 1, "-[AlohaPairingController processAuthReqPayload:outError:]", @"Payload dictionary is wrong %@\n", v10, v11, v12, v13, (uint64_t)v6);
    goto LABEL_6;
  }
  uint64_t v15 = SSEIsFeatureSupported(45);
  if (v15)
  {
    _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", @"Get Attestation V2 Auth Key feature is not supported on this device with status %d\n", v16, v17, v18, v19, v15);
LABEL_6:
    id v20 = v7;
    goto LABEL_7;
  }
  CFDataRef v73 = 0;
  uint64_t v22 = SSEGetAttV2AuthKey((const __CFData *)self->_seid, v14, &v73);
  CFDataRef v65 = v73;
  v62 = [(__CFData *)v14 asHexString];
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController processAuthReqPayload:outError:]", &cfstr_CalledSsgetatt.isa);

  if (!v22 && v65)
  {
    v63 = objc_opt_new();
    [v63 setValue:v65 forKey:@"attV2AuthKey"];
    uint64_t v72 = 0;
    v74[0] = @"VerifyData";
    uint64_t v27 = [NSNumber numberWithBool:0];
    v75[0] = v27;
    v74[1] = @"StripImg4";
    uint64_t v28 = [NSNumber numberWithBool:0];
    v75[1] = v28;
    v74[2] = @"GetCombined";
    uint64_t v29 = [NSNumber numberWithBool:0];
    v75[2] = v29;
    id v30 = [NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];
    v64 = (void *)[v30 mutableCopy];

    v31 = (void *)AMFDRSealingMapCopyLocalDataForClass();
    uint64_t v35 = v31;
    id v36 = 0;
    if (v31)
    {
      memset(v71, 0, sizeof(v71));
      long long v70 = 0u;
      v69[0] = [v31 DERItem];
      v69[1] = v37;
      uint64_t v38 = DERParseSequence((uint64_t)v69, (uint64_t)&img4BlobSpec, 0x2000000000000010, &v70, 0x30uLL);
      if (v38)
      {
        _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", @"Error encountered when parsing IMG4Blob %d\n", v39, v40, v41, v42, v38);
      }
      else
      {
        long long v68 = 0u;
        memset(v67, 0, sizeof(v67));
        v45 = DERParseSequenceContent((unint64_t *)v71, 4u, (uint64_t)&scrtBlobSpecItems, (unint64_t)v67, 0x40uLL);
        if (!v45)
        {
          id v55 = [MEMORY[0x263EFF8F8] dataWithBytes:v68];
          if (v55)
          {
            [v63 setValue:v55 forKey:@"SCRT"];
            transceiver = self->_transceiver;
            id v57 = [v6 objectForKeyedSubscript:@"HSMChallengeSE"];
            id v58 = [NSNumber numberWithLongLong:MGGetSInt64Answer()];
            id v66 = 0;
            id v59 = [(SETransceiveHelper *)transceiver copySESignature:v65 hsmChallengeSE:v57 ecid:v58 outError:&v66];
            id v36 = v66;

            [v63 setValue:v59 forKey:@"SESignature"];
            [v7 setValue:v63 forKey:@"DATA"];
            [v7 setValue:qword_26AD829E8 forKey:@"ErrorCode"];
            [v7 setValue:@"Success" forKey:@"ErrorMessage"];
            id v60 = v7;
          }
          else
          {
            _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", @"SCRT is nil\n", v51, v52, v53, v54, (uint64_t)v62);
            id v61 = v7;
            id v36 = 0;
          }

          goto LABEL_21;
        }
        _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", @"Error encountered when parsing SCRTBlob %d\n", v46, v47, v48, v49, (uint64_t)v45);
      }
      id v50 = v7;
      id v36 = 0;
    }
    else
    {
      _ObjCLogWrapOutError(a4, 0, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", @"Error encountered when geting scrt %@ or scrt absent %d\n", v32, v33, v34, v72);
      id v44 = v7;
    }
LABEL_21:

    goto LABEL_22;
  }
  _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController processAuthReqPayload:outError:]", @"Bad status received when getting Auth Key V2 %d or nil for AuthKey %d\n", v23, v24, v25, v26, v22);
  id v43 = v7;
LABEL_22:

LABEL_7:

  return v7;
}

- (id)processApduReqPayload:(id)a3 outError:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (id)objc_opt_new();
  [v9 setValue:@"APDURESP" forKey:@"Command"];
  [v9 setValue:qword_26AD829E8 forKey:@"ErrorCode"];
  [v9 setValue:@"Success" forKey:@"ErrorMessage"];
  [v9 setValue:self->_fullServerSessionID forKey:@"SessionId"];
  [v9 setValue:*MEMORY[0x263EFFA60] forKey:@"DATA"];
  id v5 = objc_opt_new();
  memset(v12, 0, sizeof(v12));
  id obj = v8;
  if ([obj countByEnumeratingWithState:v12 objects:v13 count:16])
  {
    id v6 = **((id **)&v12[0] + 1);
    SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v11, (const unsigned __int8 *)[v6 bytes], [v6 length]);
  }

  [v9 setValue:v5 forKey:@"DATA"];

  return v9;
}

- (id)processEndPair:(id)a3
{
  id v4 = a3;
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController processEndPair:]", &cfstr_EndpairPayload.isa, v4);
  id v5 = [v4 objectForKeyedSubscript:@"ECID"];
  if ([(NSNumber *)self->_ecid isEqualToNumber:v5])
  {
    id v6 = 0;
  }
  else
  {
    id v6 = _ObjCLogNSError(0, 0, "-[AlohaPairingController processEndPair:]", &cfstr_EcidFromEndpai.isa, v5, self->_ecid);
  }

  return v6;
}

- (id)performHTTPRequestWithRequestDict:(id)a3 outError:(id *)a4
{
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__5;
  id v55 = __Block_byref_object_dispose__5;
  id v56 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__5;
  uint64_t v49 = __Block_byref_object_dispose__5;
  id v50 = 0;
  id obj = 0;
  id v6 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:100 options:0 error:&obj];
  objc_storeStrong(&v50, obj);
  uint64_t v10 = (void *)v46[5];
  if (v10 || !v6)
  {
    _ObjCLogWrapOutError(a4, v10, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", @"Error encountered when forming request body %@\n", v7, v8, v9, v46[5]);
    id v26 = 0;
    goto LABEL_20;
  }
  [(NSMutableArray *)self->_alohaPlistRecord addObject:v6];
  uint64_t v11 = (void *)MEMORY[0x263F089E0];
  uint64_t v12 = [NSURL URLWithString:self->_alohaHostname];
  uint64_t v13 = [v11 requestWithURL:v12 cachePolicy:1 timeoutInterval:60.0];

  uint64_t v14 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  uint64_t v15 = v14;
  if (self->_useReverseProxy) {
    [v14 setConnectionProxyDictionary:self->_reverseProxySettings];
  }
  [v13 setHTTPMethod:@"POST"];
  alohaServerIP = self->_alohaServerIP;
  if (alohaServerIP)
  {
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", &cfstr_AddingHeader.isa, @"X-Apple-Aloha-IP", alohaServerIP);
    [v13 setValue:self->_alohaServerIP forHTTPHeaderField:@"X-Apple-Aloha-IP"];
  }
  [v13 setHTTPBody:v6];
  dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
  uint64_t v18 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v15];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __69__AlohaPairingController_performHTTPRequestWithRequestDict_outError___block_invoke;
  v40[3] = &unk_264863718;
  uint64_t v42 = &v51;
  v40[4] = self;
  id v43 = &v45;
  uint64_t v19 = v17;
  uint64_t v41 = v19;
  id v20 = [v18 dataTaskWithRequest:v13 completionHandler:v40];

  [v20 resume];
  if (v20) {
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  }
  uint64_t v25 = (id *)(v46 + 5);
  uint64_t v24 = (void *)v46[5];
  if (!v24)
  {
    id v38 = 0;
    uint64_t v39 = 0;
    uint64_t v27 = [MEMORY[0x263F08AC0] propertyListWithData:v52[5] options:0 format:&v39 error:&v38];
    objc_storeStrong(v25, v38);
    if (v39 == 100)
    {
      if (v27)
      {
        id v26 = v27;
LABEL_18:

        goto LABEL_19;
      }
      uint64_t v32 = [(id)v52[5] asHexString];
      _ObjCLogOutError((uint64_t *)a4, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", @"Unable to form plist from data %@\n", v33, v34, v35, v36, (uint64_t)v32);
    }
    else
    {
      _ObjCLogOutError((uint64_t *)a4, 1, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", @"Was expecting XML format but received %lu\n", v28, v29, v30, v31, v39);
    }
    id v26 = 0;
    goto LABEL_18;
  }
  _ObjCLogWrapOutError(a4, v24, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]", @"Encountered error when talking to server %@\n", v21, v22, v23, v46[5]);
  id v26 = 0;
LABEL_19:

LABEL_20:
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v51, 8);

  return v26;
}

void __69__AlohaPairingController_performHTTPRequestWithRequestDict_outError___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  uint64_t v11 = [v10 statusCode];
  if ([v16 length])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v12 = [*(id *)(a1 + 32) alohaPlistRecord];
    [v12 addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  if (v11 == 200)
  {
    uint64_t v13 = [v9 copy];
  }
  else
  {
    uint64_t v13 = _ObjCLogNSError(0, 0, "-[AlohaPairingController performHTTPRequestWithRequestDict:outError:]_block_invoke", &cfstr_BadHttpStatusC.isa, v11);
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)getReverseProxySettings:(id)a3 outError:(id *)a4
{
  id v4 = a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3812000000;
  v6[3] = __Block_byref_object_copy__187;
  v6[4] = __Block_byref_object_dispose__188;
  v6[5] = "";
  operator new();
}

void __59__AlohaPairingController_getReverseProxySettings_outError___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    _ObjCLogNSError(0, 8, "-[AlohaPairingController getReverseProxySettings:outError:]_block_invoke", &cfstr_ProxyUnavailab.isa);
  }
  else
  {
    if (a2 == 1)
    {
      _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController getReverseProxySettings:outError:]_block_invoke", &cfstr_ProxyAvailable.isa);
      uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48);
      if (!v3) {
        std::__throw_future_error[abi:ne180100](3u);
      }
      std::mutex::lock((std::mutex *)(v3 + 24));
      if ((*(unsigned char *)(v3 + 136) & 1) != 0
        || (v5.__ptr_ = 0, uint64_t v4 = *(void *)(v3 + 16), std::exception_ptr::~exception_ptr(&v5), v4))
      {
        std::__throw_future_error[abi:ne180100](2u);
      }
      *(unsigned char *)(v3 + 140) = 1;
      *(_DWORD *)(v3 + 136) |= 5u;
      std::condition_variable::notify_all((std::condition_variable *)(v3 + 88));
      std::mutex::unlock((std::mutex *)(v3 + 24));
      return;
    }
    _ObjCLogNSError(0, 0, "-[AlohaPairingController getReverseProxySettings:outError:]_block_invoke", &cfstr_ProxyAbortedD.isa, a2);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = };

  MEMORY[0x270F9A758]();
}

- (id)verifyAndRetrieveServerSessionId:(id)a3
{
  id v5 = a3;
  id v6 = [v5 componentsSeparatedByString:@"/"];
  if ([v6 count] == 3)
  {
    objc_storeStrong((id *)&self->_fullServerSessionID, a3);
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    alohaServerIP = self->_alohaServerIP;
    self->_alohaServerIP = v7;

    serverSessionID = self->_serverSessionID;
    if (serverSessionID)
    {
      id v10 = [v6 objectAtIndexedSubscript:2];
      BOOL v11 = [(NSString *)serverSessionID isEqualToString:v10];

      if (v11)
      {
        uint64_t v12 = 0;
        goto LABEL_9;
      }
      uint64_t v14 = [v6 objectAtIndexedSubscript:2];
      uint64_t v12 = _ObjCLogNSError(0, 1, "-[AlohaPairingController verifyAndRetrieveServerSessionId:]", &cfstr_WrongSessionid.isa, v14, self->_serverSessionID);
    }
    else
    {
      uint64_t v13 = [v6 objectAtIndexedSubscript:2];
      uint64_t v12 = 0;
      uint64_t v14 = self->_serverSessionID;
      self->_serverSessionID = v13;
    }
  }
  else
  {
    uint64_t v12 = _ObjCLogNSError(0, 1, "-[AlohaPairingController verifyAndRetrieveServerSessionId:]", &cfstr_MalformedSessi.isa, v5);
  }
LABEL_9:

  return v12;
}

- (void)writeRecord:(id)a3 fileExtension:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  for (unint64_t i = 0; [v15 count] > i; ++i)
  {
    id v8 = [NSNumber numberWithInt:i];
    id v9 = [v8 stringValue];
    id v10 = [@"AlohaV2Pairing-" stringByAppendingString:v9];
    BOOL v11 = [v10 stringByAppendingPathExtension:v6];

    uint64_t v12 = [(NSString *)self->_debugRecordPath stringByAppendingPathComponent:v11];
    uint64_t v13 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v14 = [v15 objectAtIndexedSubscript:i];
    [v13 createFileAtPath:v12 contents:v14 attributes:0];
  }
}

- (NSString)alohaHostname
{
  return self->_alohaHostname;
}

- (void)setAlohaHostname:(id)a3
{
}

- (SETransceiveHelper)transceiver
{
  return self->_transceiver;
}

- (void)setTransceiver:(id)a3
{
}

- (BOOL)useReverseProxy
{
  return self->_useReverseProxy;
}

- (void)setUseReverseProxy:(BOOL)a3
{
  self->_useReverseProxy = a3;
}

- (NSDictionary)reverseProxySettings
{
  return self->_reverseProxySettings;
}

- (void)setReverseProxySettings:(id)a3
{
}

- (NSData)seid
{
  return self->_seid;
}

- (void)setSeid:(id)a3
{
}

- (NSString)fullServerSessionID
{
  return self->_fullServerSessionID;
}

- (void)setFullServerSessionID:(id)a3
{
}

- (NSString)serverSessionID
{
  return self->_serverSessionID;
}

- (void)setServerSessionID:(id)a3
{
}

- (NSNumber)alohaVersion
{
  return self->_alohaVersion;
}

- (void)setAlohaVersion:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSNumber)ecid
{
  return self->_ecid;
}

- (void)setEcid:(id)a3
{
}

- (NSNumber)apChipId
{
  return self->_apChipId;
}

- (void)setApChipId:(id)a3
{
}

- (NSString)debugRecordPath
{
  return self->_debugRecordPath;
}

- (void)setDebugRecordPath:(id)a3
{
}

- (NSMutableArray)alohaPlistRecord
{
  return self->_alohaPlistRecord;
}

- (void)setAlohaPlistRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alohaPlistRecord, 0);
  objc_storeStrong((id *)&self->_debugRecordPath, 0);
  objc_storeStrong((id *)&self->_apChipId, 0);
  objc_storeStrong((id *)&self->_ecid, 0);
  objc_storeStrong((id *)&self->_alohaVersion, 0);
  objc_storeStrong((id *)&self->_serverSessionID, 0);
  objc_storeStrong((id *)&self->_fullServerSessionID, 0);
  objc_storeStrong((id *)&self->_seid, 0);
  objc_storeStrong((id *)&self->_reverseProxySettings, 0);
  objc_storeStrong((id *)&self->_transceiver, 0);
  objc_storeStrong((id *)&self->_alohaHostname, 0);

  objc_storeStrong((id *)&self->_alohaServerIP, 0);
}

- (BOOL)submitPairingRecord:(id *)a3
{
  transceiver = self->_transceiver;
  id v25 = 0;
  id v26 = 0;
  id v24 = 0;
  BOOL v5 = [(SETransceiveHelper *)transceiver getSEPK:&v26 andSEID:&v25 deleteExisting:1 error:&v24];
  id v6 = v26;
  id v7 = v25;
  id v8 = v24;
  if (v5 && v6 != 0 && v7 != 0 && v8 == 0)
  {
    dispatch_semaphore_t v17 = [v7 asHexString];
    uint64_t v18 = [v17 uppercaseString];

    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", &cfstr_SubmittingSepk.isa);
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", &cfstr_Seid_1.isa, v18);
    uint64_t v19 = [v6 base64Encoding];
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", &cfstr_Sepk_0.isa, v19);

    unsigned int v16 = AMFDRDataPutForRestore();
    id v15 = 0;
    _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[AlohaPairingController(FDR) submitPairingRecord:]", &cfstr_ResponseFromAm.isa, v16, 0);
    if ((v16 & 1) == 0) {
      _ObjCLogWrapOutError(a3, 0, 0, "-[AlohaPairingController(FDR) submitPairingRecord:]", @"Failed to AMFDRDataPutForRestore : %@", v20, v21, v22, 0);
    }
  }
  else
  {
    id v15 = v8;
    _ObjCLogWrapOutError(a3, v8, 0, "-[AlohaPairingController(FDR) submitPairingRecord:]", @"Failed to get SEPK+SEID: %@", v9, v10, v11, (uint64_t)v8);
    LOBYTE(v16) = 0;
  }

  return v16;
}

@end