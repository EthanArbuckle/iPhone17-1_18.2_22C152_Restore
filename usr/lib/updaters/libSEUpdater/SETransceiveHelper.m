@interface SETransceiveHelper
- (BOOL)crsSetSharingResult:(id)a3 signature:(id)a4 error:(id *)a5;
- (BOOL)getSEPK:(id *)a3 andSEID:(id *)a4 deleteExisting:(BOOL)a5 error:(id *)a6;
- (BOOL)setAuthRandom:(id)a3 mac:(id)a4 error:(id *)a5;
- (NSMutableArray)capduRecord;
- (NSMutableArray)rapduRecord;
- (SETransceiveHelper)initWithSEController:(shared_ptr<SEUpdater::P73BaseSEController>)a3;
- (id).cxx_construct;
- (id)copyA9Parameters:(id *)a3;
- (id)copyCasdCert:(id *)a3;
- (id)copySESignature:(id)a3 hsmChallengeSE:(id)a4 ecid:(id)a5 outError:(id *)a6;
- (id)copySeid:(id *)a3;
- (id)crsGetSharingRequestWithError:(id *)a3;
- (id)selectWithAID:(id)a3;
- (id)transceiveAndRecordCapdu:(void *)a3 rapdu:(void *)a4;
- (int64_t)copyDeviceType:(id *)a3;
- (shared_ptr<SEUpdater::P73BaseSEController>)fSeController;
- (void)dealloc;
- (void)invalidate;
- (void)recordApdu:(Apdu *)a3 toRecord:(id)a4;
- (void)setCapduRecord:(id)a3;
- (void)setFSeController:(shared_ptr<SEUpdater::P73BaseSEController>)a3;
- (void)setRapduRecord:(id)a3;
@end

@implementation SETransceiveHelper

- (SETransceiveHelper)initWithSEController:(shared_ptr<SEUpdater::P73BaseSEController>)a3
{
  ptr = a3.__ptr_;
  v14.receiver = self;
  v14.super_class = (Class)SETransceiveHelper;
  v4 = [(SETransceiveHelper *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(P73BaseSEController **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_fSeController.__cntrl_;
    v5->_fSeController.__ptr_ = v7;
    v5->_fSeController.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    uint64_t v9 = [MEMORY[0x263EFF980] array];
    capduRecord = v5->_capduRecord;
    v5->_capduRecord = (NSMutableArray *)v9;

    uint64_t v11 = [MEMORY[0x263EFF980] array];
    rapduRecord = v5->_rapduRecord;
    v5->_rapduRecord = (NSMutableArray *)v11;
  }
  return v5;
}

- (void)dealloc
{
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[SETransceiveHelper dealloc]", &cfstr_ReleasingTrans.isa);
  v3.receiver = self;
  v3.super_class = (Class)SETransceiveHelper;
  [(SETransceiveHelper *)&v3 dealloc];
}

- (void)invalidate
{
  _ObjCLog((SEUpdaterUtil::SELogObj *)2, "-[SETransceiveHelper invalidate]", &cfstr_InvalidatingTr.isa);
  cntrl = self->_fSeController.__cntrl_;
  self->_fSeController.__ptr_ = 0;
  self->_fSeController.__cntrl_ = 0;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)selectWithAID:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263EFF8F8] dataWithHexString:v4];
  +[APDUUtil getCXXApduWithCla:0 ins:164 p1:4 p2:0 payload:v5];

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v13, 0x2037uLL);
  v13 = &unk_26DD735C8;
  uint64_t v6 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v16 rapdu:&v13];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = _ObjCLogNSError(v6, 0, "-[SETransceiveHelper selectWithAID:]", &cfstr_ErrorEncounter.isa, v4);
  }
  else
  {
    uint64_t v9 = v14[1];
    if ((unint64_t)(v9 - *v14) >= 2)
    {
      uint64_t v10 = *(unsigned __int8 *)(v9 - 1) | (*(unsigned __int8 *)(v9 - 2) << 8);
      if (v10 == 36864)
      {
        uint64_t v11 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v10 = 43947;
    }
    uint64_t v8 = _ObjCLogNSError(0, 0, "-[SETransceiveHelper selectWithAID:]", &cfstr_BadSw0xXReceiv.isa, v10, v4);
  }
  uint64_t v11 = (void *)v8;
LABEL_9:

  v13 = &unk_26DD73620;
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  v16 = &unk_26DD73620;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }

  return v11;
}

- (id)copySeid:(id *)a3
{
  v5 = [MEMORY[0x263EFF8F8] dataWithHexString:@"DF21"];
  +[APDUUtil getCXXApduWithCla:128 ins:202 p1:0 p2:254 payload:v5];

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v30, 0x2037uLL);
  v30 = &unk_26DD735C8;
  uint64_t v10 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v33 rapdu:&v30];
  if (v10)
  {
    _ObjCLogWrapOutError(a3, v10, 0, "-[SETransceiveHelper copySeid:]", @"Error encountered when transceiving copy SEID \n", v7, v8, v9, v29);
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v12 = v31[1];
  unint64_t v13 = v12 - *v31;
  if (v13 < 2)
  {
    uint64_t v14 = 43947;
LABEL_9:
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copySeid:]", @"Bad SW 0x%x received in copy SEID\n", v6, v7, v8, v9, v14);
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v14 = *(unsigned __int8 *)(v12 - 1) | (*(unsigned __int8 *)(*v31 + v13 - 2) << 8);
  if (v14 != 36864) {
    goto LABEL_9;
  }
  [MEMORY[0x263EFF8F8] dataWithBytes:length:];
  v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  DERDecodeData(v15, 0xE00000000000001ELL);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  v21 = v16;
  if (v16)
  {
    v22 = DERDecodeData(v16, 0xC000000000000021);
    uint64_t v11 = v22;
    if (v22) {
      id v27 = v22;
    }
    else {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copySeid:]", @"Error encountered when decoding tag 0xDF21\n", v23, v24, v25, v26, v29);
    }
  }
  else
  {
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copySeid:]", @"Error encountered when decoding tag 0xFE\n", v17, v18, v19, v20, v29);
    uint64_t v11 = 0;
  }

LABEL_14:
  v30 = &unk_26DD73620;
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  v33 = &unk_26DD73620;
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  return v11;
}

- (id)copyCasdCert:(id *)a3
{
  v5 = [(SETransceiveHelper *)self selectWithAID:@"A00000015153504341534400"];
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = 0;
    _ObjCLogWrapOutError(a3, v5, 0, "-[SETransceiveHelper copyCasdCert:]", @"While selecting CASD\n", v6, v7, v8, v44);
    goto LABEL_61;
  }
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v62);
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)&v57);
  if (*((unsigned char *)self->_fSeController.__ptr_ + 16))
  {
    +[APDUUtil getCXXApduWithCla:128 ins:202 p1:127 p2:33 payload:0];
    if (v54) {
      atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v11 = v64;
    uint64_t v63 = v53;
    v64 = v54;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    long long v65 = v55;
    long long v66 = v56;
    v52 = &unk_26DD73620;
    if (v54) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v54);
    }
    +[APDUUtil getCXXApduWithCla:128 ins:192 p1:0 p2:0 payload:0];
  }
  else
  {
    +[APDUUtil getCXXApduWithCla:128 ins:202 p1:127 p2:33 payload:0];
    if (v54) {
      atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = v64;
    uint64_t v63 = v53;
    v64 = v54;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    long long v65 = v55;
    long long v66 = v56;
    v52 = &unk_26DD73620;
    if (v54) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v54);
    }
    +[APDUUtil getCXXApduWithCla:128 ins:204 p1:127 p2:33 payload:0];
  }
  if (v54) {
    atomic_fetch_add_explicit(&v54->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v13 = v59;
  uint64_t v58 = v53;
  v59 = v54;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  long long v60 = v55;
  long long v61 = v56;
  v52 = &unk_26DD73620;
  if (v54) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v54);
  }
  uint64_t v53 = v63;
  v54 = v64;
  if (v64) {
    atomic_fetch_add_explicit(&v64->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v52 = &unk_26DD73700;
  long long v55 = v65;
  long long v56 = v66;
  uint64_t v14 = (NSData *)objc_opt_new();
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v49, 0x2037uLL);
  char v15 = 0;
  v49 = &unk_26DD735C8;
  do
  {
    uint64_t v9 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v52 rapdu:&v49];
    if (v9)
    {
      uint64_t v10 = 0;
      _ObjCLogWrapOutError(a3, v9, 0, "-[SETransceiveHelper copyCasdCert:]", @"Error encountered when transceiving copyCasdCert\n", v17, v18, v19, v44);
      goto LABEL_53;
    }
    uint64_t v20 = v50[1];
    unint64_t v21 = v20 - *v50;
    if (v21 < 2)
    {
      uint64_t v23 = 43947;
LABEL_44:
      uint64_t v10 = 0;
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", @"Bad SW 0x%x received\n", v16, v17, v18, v19, v23);
      goto LABEL_53;
    }
    int v22 = *(unsigned __int8 *)(*v50 + v21 - 2);
    if ((v22 & 0xFFFFFFFD) != 0x61)
    {
      uint64_t v23 = *(unsigned __int8 *)(v20 - 1) | (v22 << 8);
      if (v23 != 36864) {
        goto LABEL_44;
      }
    }
    uint64_t v24 = [MEMORY[0x263EFF8F8] dataWithBytes:length:];
    if ((v15 & 1) == 0)
    {
      uint64_t v26 = v58;
      uint64_t v25 = v59;
      if (v59) {
        atomic_fetch_add_explicit(&v59->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      id v27 = v54;
      uint64_t v53 = v26;
      v54 = v25;
      if (v27) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
      long long v55 = v60;
      long long v56 = v61;
    }
    [(NSData *)v14 appendData:v24];

    if (v50[1] - *v50 < 2uLL) {
      break;
    }
    char v15 = 1;
  }
  while ((*(unsigned char *)(v50[1] - 2) & 0xFD) == 0x61);
  if (!*((unsigned char *)self->_fSeController.__ptr_ + 16)) {
    goto LABEL_47;
  }
  uint64_t v14 = v14;
  v48[0] = [(NSData *)v14 bytes];
  v48[1] = [(NSData *)v14 length];
  unint64_t v45 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v28 = DERDecodeItem((uint64_t)v48, &v45);
  if (!v28)
  {
    if (v45 != 0x6000000000000021)
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", @"Unexpected top level tag 0x%X expected 0x%X\n", v29, v30, v31, v32, (unsigned __int16)v45);
      goto LABEL_52;
    }
    uint64_t v33 = [MEMORY[0x263EFF990] dataWithBytes:v46 length:v47];

    uint64_t v14 = (NSData *)v33;
LABEL_47:
    v34 = splitDERSeq(v14, 0x6000000000000021);
    v39 = v34;
    if (v34)
    {
      v40 = (void *)MEMORY[0x263EFF990];
      v41 = [v34 objectAtIndexedSubscript:1];
      uint64_t v10 = [v40 dataWithData:v41];

      v42 = [v39 objectAtIndexedSubscript:2];
      [v10 appendData:v42];
    }
    else
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", @"Unable to split certificates\n", v35, v36, v37, v38, v44);
      uint64_t v10 = 0;
    }

    goto LABEL_53;
  }
  _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyCasdCert:]", @"Failed to decode top level 7F21 dr %d\n", v29, v30, v31, v32, v28);
LABEL_52:
  uint64_t v10 = 0;
LABEL_53:
  v49 = &unk_26DD73620;
  if (v51) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v51);
  }

  v52 = &unk_26DD73620;
  if (v54) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v54);
  }
  v57 = &unk_26DD73620;
  if (v59) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v59);
  }
  v62 = &unk_26DD73620;
  if (v64) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v64);
  }
LABEL_61:

  return v10;
}

- (int64_t)copyDeviceType:(id *)a3
{
  v5 = [MEMORY[0x263EFF8F8] dataWithHexString:@"DF31"];
  +[APDUUtil getCXXApduWithCla:128 ins:202 p1:0 p2:254 payload:v5];

  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v36, 0x2037uLL);
  uint64_t v36 = &unk_26DD735C8;
  uint64_t v6 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v39 rapdu:&v36];
  uint64_t v11 = v6;
  if (v6)
  {
    _ObjCLogWrapOutError(a3, v6, 0, "-[SETransceiveHelper copyDeviceType:]", @"Could not copy device type with error %@\n", v8, v9, v10, (uint64_t)v6);
  }
  else
  {
    uint64_t v12 = v37[1];
    unint64_t v13 = v12 - *v37;
    if (v13 >= 2)
    {
      uint64_t v14 = *(unsigned __int8 *)(v12 - 1) | (*(unsigned __int8 *)(*v37 + v13 - 2) << 8);
      if (v14 == 36864)
      {
        [MEMORY[0x263EFF8F8] dataWithBytes:length:];
        char v15 = (NSData *)objc_claimAutoreleasedReturnValue();
        DERDecodeData(v15, 0xE00000000000001ELL);
        uint64_t v16 = (NSData *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          unint64_t v21 = DERDecodeData(v16, 0xC000000000000031);
          uint64_t v26 = v21;
          if (v21)
          {
            id v27 = [v21 subdataWithRange:7, 1];
            uint64_t v28 = v27;
            if (v27)
            {
              int64_t v29 = *(unsigned __int8 *)[v27 bytes];
            }
            else
            {
              uint64_t v31 = [v26 asHexString];
              _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", @"Encountered error when retrieving seDeviceTypeData from %@\n", v32, v33, v34, v35, (uint64_t)v31);

              int64_t v29 = 255;
            }
          }
          else
          {
            _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", @"Encountered error when decoding top level 0x%llx\n", v22, v23, v24, v25, 0xC000000000000031);
            int64_t v29 = 255;
          }
        }
        else
        {
          _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", @"Encountered error when decoding top level 0x%llx\n", v17, v18, v19, v20, 0xE00000000000001ELL);
          int64_t v29 = 255;
        }

        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v14 = 43947;
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyDeviceType:]", @"Bad SW received when copying device type 0x%x\n", v7, v8, v9, v10, v14);
  }
  int64_t v29 = 255;
LABEL_12:

  uint64_t v36 = &unk_26DD73620;
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  v39 = &unk_26DD73620;
  if (v40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  }
  return v29;
}

- (id)copyA9Parameters:(id *)a3
{
  v61[2] = *MEMORY[0x263EF8340];
  v5 = [(SETransceiveHelper *)self selectWithAID:@"A0000001515350414141504C"];
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = 0;
    _ObjCLogWrapOutError(a3, v5, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Error encountered when selecting Star SD %@\n", v6, v7, v8, (uint64_t)v5);
    goto LABEL_34;
  }
  +[APDUUtil getCXXApduWithCla:128 ins:202 p1:127 p2:33 payload:0];
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v56, 0x2037uLL);
  long long v56 = &unk_26DD735C8;
  uint64_t v11 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v59 rapdu:&v56];
  uint64_t v9 = v11;
  if (!v11)
  {
    uint64_t v16 = v57[1];
    unint64_t v17 = v16 - *v57;
    if (v17 < 2)
    {
      uint64_t v18 = 43947;
LABEL_12:
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Bad SW encountered when gettng cert SN 0x%x\n", v12, v13, v14, v15, v18);
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      goto LABEL_30;
    }
    uint64_t v18 = *(unsigned __int8 *)(v16 - 1) | (*(unsigned __int8 *)(*v57 + v17 - 2) << 8);
    if (v18 != 36864) {
      goto LABEL_12;
    }
    [MEMORY[0x263EFF8F8] dataWithBytes:length:];
    uint64_t v19 = (NSData *)objc_claimAutoreleasedReturnValue();
    DERDecodeData(v19, 0x6000000000000021);
    uint64_t v20 = (NSData *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Error encountered when decoding top level 0x%llx\n", v21, v22, v23, v24, 0x6000000000000021);
      uint64_t v9 = 0;
      uint64_t v10 = 0;
LABEL_29:

      goto LABEL_30;
    }
    int64_t v29 = DERDecodeData(v20, 0x8000000000000013);
    if (!v29)
    {
      _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Error encountered when decoding cert SN\n", v25, v26, v27, v28, v53);
      uint64_t v9 = 0;
      uint64_t v10 = 0;
LABEL_28:

      goto LABEL_29;
    }
    uint64_t v30 = [MEMORY[0x263EFF8F8] dataWithHexString:@"DF30"];
    +[APDUUtil getCXXApduWithCla:128 ins:202 p1:0 p2:254 payload:v30];

    uint64_t v31 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v54 rapdu:&v56];
    uint64_t v9 = v31;
    if (v31)
    {
      _ObjCLogWrapOutError(a3, v31, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Error encountered when getting OBKG %@\n", v33, v34, v35, (uint64_t)v31);
      uint64_t v10 = 0;
      goto LABEL_26;
    }
    uint64_t v37 = *v57;
    uint64_t v36 = v57[1];
    unint64_t v38 = v36 - *v57;
    if (v38 >= 2)
    {
      uint64_t v39 = *(unsigned __int8 *)(v36 - 1) | (*(unsigned __int8 *)(v38 + v37 - 2) << 8);
      if (v39 == 36864)
      {
        v40 = [MEMORY[0x263EFF8F8] dataWithBytes:v37 length:SERestoreInfo::RApdu::getDataSize((SERestoreInfo::RApdu *)&v56)];
        DERDecodeData(v40, 0xE00000000000001ELL);
        v41 = (NSData *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          uint64_t v46 = DERDecodeData(v41, 0xC000000000000030);
          v51 = (void *)v46;
          if (v46)
          {
            v61[0] = v29;
            v61[1] = v46;
            uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
          }
          else
          {
            _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Unable to construct obkg data\n", v47, v48, v49, v50, v53);
            uint64_t v10 = 0;
          }
        }
        else
        {
          _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Unable to decode top level 0x%llx\n", v42, v43, v44, v45, 0xE00000000000001ELL);
          uint64_t v10 = 0;
        }

LABEL_26:
        v54 = &unk_26DD73620;
        if (v55) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v55);
        }
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v39 = 43947;
    }
    _ObjCLogOutError((uint64_t *)a3, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Bad SW encountered when gettng OBKG 0x%x\n", v32, v33, v34, v35, v39);
    uint64_t v10 = 0;
    goto LABEL_26;
  }
  _ObjCLogWrapOutError(a3, v11, 0, "-[SETransceiveHelper copyA9Parameters:]", @"Error encountered when getting cert SN %@\n", v13, v14, v15, (uint64_t)v11);
  uint64_t v10 = 0;
LABEL_30:
  long long v56 = &unk_26DD73620;
  if (v58) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v58);
  }
  v59 = &unk_26DD73620;
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
LABEL_34:

  return v10;
}

- (id)copySESignature:(id)a3 hsmChallengeSE:(id)a4 ecid:(id)a5 outError:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = [(SETransceiveHelper *)self selectWithAID:@"A00000015153504341534400"];
  if (!v16)
  {
    uint64_t v18 = objc_opt_new();
    [v18 appendData:v10];
    [v18 appendData:v11];
    uint64_t v40 = 0;
    [v12 getValue:&v40];
    [v18 appendU64LE:v40];
    memset(v41, 0, sizeof(v41));
    id v19 = v18;
    [v19 bytes];
    [v19 length];
    uint64_t v20 = AMSupportDigestSha256();
    if (v20)
    {
      _ObjCLogOutError((uint64_t *)a6, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", @"Unable to get AM Digest with error code %d\n", v21, v22, v23, v24, v20);
      uint64_t v16 = 0;
      unint64_t v17 = 0;
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v25 = [MEMORY[0x263EFF8F8] dataWithBytes:v41 length:32];
    +[APDUUtil getCXXApduWithCla:0 ins:136 p1:240 p2:3 payload:v25];

    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v35, 0x2037uLL);
    uint64_t v35 = &unk_26DD735C8;
    uint64_t v16 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v38 rapdu:&v35];
    if (v16)
    {
      _ObjCLogWrapOutError(a6, v16, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", @"Error encountered when transceiving copy SE Signature \n", v27, v28, v29, v34);
      unint64_t v17 = 0;
LABEL_12:
      uint64_t v35 = &unk_26DD73620;
      if (v37) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v37);
      }
      unint64_t v38 = &unk_26DD73620;
      if (v39) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
      goto LABEL_16;
    }
    uint64_t v30 = v36[1];
    unint64_t v31 = v30 - *v36;
    if (v31 >= 2)
    {
      uint64_t v32 = *(unsigned __int8 *)(v30 - 1) | (*(unsigned __int8 *)(*v36 + v31 - 2) << 8);
      if (v32 == 36864)
      {
        unint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:x0 length:x1];
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v32 = 43947;
    }
    _ObjCLogOutError((uint64_t *)a6, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", @"Bad SW 0x%x received in copy SE Signature\n", v26, v27, v28, v29, v32);
    unint64_t v17 = 0;
    goto LABEL_12;
  }
  unint64_t v17 = 0;
  _ObjCLogWrapOutError(a6, v16, 0, "-[SETransceiveHelper copySESignature:hsmChallengeSE:ecid:outError:]", @"Failed to select CASD\n", v13, v14, v15, v34);
LABEL_17:

  return v17;
}

- (id)crsGetSharingRequestWithError:(id *)a3
{
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v5, 0x2037uLL);
  v5 = &unk_26DD735C8;
  SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)&v4);
}

- (BOOL)crsSetSharingResult:(id)a3 signature:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v9 = (void *)[a3 mutableCopy];
  [v9 appendData:v8];
  +[APDUUtil getCXXApduWithCla:128 ins:230 p1:0 p2:0 payload:v9];
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v22, 0x2037uLL);
  uint64_t v22 = &unk_26DD735C8;
  uint64_t v13 = [(SETransceiveHelper *)self transceiveAndRecordCapdu:&v25 rapdu:&v22];
  uint64_t v15 = *v23;
  uint64_t v14 = v23[1];
  unint64_t v16 = v14 - *v23;
  if (v13)
  {
    if (v16 >= 2)
    {
      int v17 = *(unsigned __int8 *)(v14 - 1);
      int v18 = *(unsigned __int8 *)(v16 + v15 - 2);
LABEL_8:
      uint64_t v19 = v17 | (v18 << 8);
      goto LABEL_9;
    }
  }
  else if (v16 >= 2)
  {
    int v18 = *(unsigned __int8 *)(v16 + v15 - 2);
    int v17 = *(unsigned __int8 *)(v14 - 1);
    if ((v17 | (v18 << 8)) == 0x9000)
    {
      BOOL v20 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  uint64_t v19 = 43947;
LABEL_9:
  _ObjCLogWrapOutError(a5, v13, 0, "-[SETransceiveHelper crsSetSharingResult:signature:error:]", @"Bad SW 0x%x received in get sharing request\n", v10, v11, v12, v19);
  BOOL v20 = 0;
LABEL_10:

  uint64_t v22 = &unk_26DD73620;
  if (v24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v24);
  }
  uint64_t v25 = &unk_26DD73620;
  if (v26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v26);
  }

  return v20;
}

- (id)transceiveAndRecordCapdu:(void *)a3 rapdu:(void *)a4
{
  uint64_t v8 = *((void *)a3 + 1);
  uint64_t v7 = (std::__shared_weak_count *)*((void *)a3 + 2);
  v12[0] = &unk_26DD73620;
  v12[1] = v8;
  uint64_t v13 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(SETransceiveHelper *)self recordApdu:v12 toRecord:self->_capduRecord];
  v12[0] = &unk_26DD73620;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:**((void **)a3 + 1) length:*(void *)(*((void *)a3 + 1) + 8) - **((void **)a3 + 1)];
  uint64_t v10 = [v9 asHexString];
  _ObjCLog((SEUpdaterUtil::SELogObj *)3, "-[SETransceiveHelper transceiveAndRecordCapdu:rapdu:]", &cfstr_Se.isa, v10);

  SEUpdater::P73BaseSEController::transceive((uint64_t)self->_fSeController.__ptr_, (uint64_t)a3, (uint64_t)a4, 0, (SEUpdaterUtil::SELogObj *)3);
}

- (void)recordApdu:(Apdu *)a3 toRecord:(id)a4
{
  id v7 = a4;
  var0 = a3->var1.var0;
  if (var0) {
    [MEMORY[0x263EFF8F8] dataWithBytes:*var0 length:var0[1] - *var0];
  }
  else {
  uint64_t v6 = [@"No APDU" dataUsingEncoding:4];
  }
  [v7 addObject:v6];
}

- (BOOL)getSEPK:(id *)a3 andSEID:(id *)a4 deleteExisting:(BOOL)a5 error:(id *)a6
{
  if (a3 && a4)
  {
    SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v11, 0x2037uLL);
    uint64_t v11 = &unk_26DD735C8;
    SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)&v10);
  }
  _ObjCLogOutError((uint64_t *)a6, 14, "-[SETransceiveHelper getSEPK:andSEID:deleteExisting:error:]", @"Missing mandatory outparam", a5, (uint64_t)a6, v6, v7, v9);
  return 0;
}

- (BOOL)setAuthRandom:(id)a3 mac:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  SERestoreInfo::Apdu::Apdu((SERestoreInfo::Apdu *)&v10, 0x2037uLL);
  uint64_t v10 = &unk_26DD735C8;
  SEUpdater::CommandSelectCRS::CommandSelectCRS((SEUpdater::CommandSelectCRS *)&v9);
}

- (shared_ptr<SEUpdater::P73BaseSEController>)fSeController
{
  cntrl = self->_fSeController.__cntrl_;
  *v2 = self->_fSeController.__ptr_;
  v2[1] = (P73BaseSEController *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (P73BaseSEController *)self;
  return result;
}

- (void)setFSeController:(shared_ptr<SEUpdater::P73BaseSEController>)a3
{
  uint64_t v4 = *(P73BaseSEController **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_fSeController.__cntrl_;
  self->_fSeController.__ptr_ = v4;
  self->_fSeController.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (NSMutableArray)capduRecord
{
  return self->_capduRecord;
}

- (void)setCapduRecord:(id)a3
{
}

- (NSMutableArray)rapduRecord
{
  return self->_rapduRecord;
}

- (void)setRapduRecord:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_fSeController.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_rapduRecord, 0);

  objc_storeStrong((id *)&self->_capduRecord, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end