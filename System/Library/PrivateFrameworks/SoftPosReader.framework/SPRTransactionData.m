@interface SPRTransactionData
+ (BOOL)supportsSecureCoding;
- (BOOL)forFallback;
- (BOOL)isPINBypassAllowed;
- (BOOL)isPINBypassEnabled;
- (BOOL)isPinSupported;
- (BOOL)isSAF;
- (BOOL)pinRequired;
- (BOOL)switchInterfaceOrNoCVMSuccess;
- (NSArray)vasResponses;
- (NSData)cardHolderData;
- (NSData)cvmResult;
- (NSData)ecdsaCertificate;
- (NSData)errorIndicationStatusWord;
- (NSData)fingerprint;
- (NSData)kernelIdentityKeyAttestation;
- (NSData)languagePreference;
- (NSData)merchantCategoryCode;
- (NSData)transactionCipherBlob;
- (NSData)transactionKeyBlob;
- (NSData)transactionResultData;
- (NSString)fallbackAmount;
- (NSString)kekId;
- (NSString)network;
- (NSString)payAppType;
- (NSString)pinKekId;
- (NSString)transactionId;
- (SPRTransactionData)initWithCoder:(id)a3;
- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 cvmType:(unsigned __int8)a7 cvmResult:(id)a8 merchantCategoryCode:(id)a9 pinRequired:(BOOL)a10 kernelIdentityKeyAttestation:(id)a11 ecdsaCertificate:(id)a12 transactionResultData:(id)a13 kekId:(id)a14 pinKekId:(id)a15 isPinSupported:(BOOL)a16 languagePreference:(id)a17 transactionId:(id)a18 readError:(int64_t)a19 payAppletFinalStatus:(unsigned __int8)a20;
- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 cvmType:(unsigned __int8)a7 cvmResult:(id)a8 merchantCategoryCode:(id)a9 pinRequired:(BOOL)a10 kernelIdentityKeyAttestation:(id)a11 ecdsaCertificate:(id)a12 transactionResultData:(id)a13 kekId:(id)a14 pinKekId:(id)a15 isPinSupported:(BOOL)a16 languagePreference:(id)a17 transactionId:(id)a18 readError:(int64_t)a19 payAppletFinalStatus:(unsigned __int8)a20 isPINBypassAllowed:(BOOL)a21 forFallback:(BOOL)a22 fallbackAmount:(id)a23;
- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 errorIndicationStatusWord:(id)a7 errorIndicationMsgOnError:(unsigned __int8)a8 cvmType:(unsigned __int8)a9 cvmResult:(id)a10 merchantCategoryCode:(id)a11 pinRequired:(BOOL)a12 kernelIdentityKeyAttestation:(id)a13 ecdsaCertificate:(id)a14 transactionResultData:(id)a15 kekId:(id)a16 pinKekId:(id)a17 isPinSupported:(BOOL)a18 languagePreference:(id)a19 transactionId:(id)a20 readError:(int64_t)a21 payAppletFinalStatus:(unsigned __int8)a22 isPINBypassAllowed:(BOOL)a23 forFallback:(BOOL)a24 fallbackAmount:(id)a25;
- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 errorIndicationStatusWord:(id)a7 errorIndicationMsgOnError:(unsigned __int8)a8 cvmType:(unsigned __int8)a9 cvmResult:(id)a10 merchantCategoryCode:(id)a11 pinRequired:(BOOL)a12 kernelIdentityKeyAttestation:(id)a13 ecdsaCertificate:(id)a14 transactionResultData:(id)a15 kekId:(id)a16 pinKekId:(id)a17 isPinSupported:(BOOL)a18 languagePreference:(id)a19 transactionId:(id)a20 readError:(int64_t)a21 payAppletFinalStatus:(unsigned __int8)a22 isPINBypassAllowed:(BOOL)a23 forFallback:(BOOL)a24 fallbackAmount:(id)a25 switchInterfaceOrNoCVMSuccess:(BOOL)a26;
- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassAllowed:(BOOL)a24 forFallback:(BOOL)a25 fallbackAmount:(id)a26 switchInterfaceOrNoCVMSuccess:(BOOL)a27;
- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28;
- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30;
- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30 payAppType:(id)a31;
- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30 payAppType:(id)a31 isSAF:(BOOL)a32;
- (id)debugDescription;
- (id)description;
- (int64_t)readError;
- (unsigned)cardEffectiveState;
- (unsigned)cardExpirationState;
- (unsigned)cvmType;
- (unsigned)errorIndicationMsgOnError;
- (unsigned)outcomeStatus;
- (unsigned)payAppletFinalStatus;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SPRTransactionData

- (id)description
{
  if (objc_msgSend_length(self->_transactionCipherBlob, a2, v2, v3, v4, v5)) {
    v7 = @"present";
  }
  else {
    v7 = &stru_26D31DBA0;
  }
  transactionCipherBlob = self->_transactionCipherBlob;
  v59 = v7;
  if (objc_msgSend_length(transactionCipherBlob, v9, v10, v11, v12, v13)) {
    v14 = @"present";
  }
  else {
    v14 = &stru_26D31DBA0;
  }
  uint64_t outcomeStatus = self->_outcomeStatus;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  network = self->_network;
  v58 = NSString;
  v16 = v14;
  v22 = objc_msgSend_asHexString(errorIndicationStatusWord, v17, v18, v19, v20, v21);
  uint64_t errorIndicationMsgOnError = self->_errorIndicationMsgOnError;
  uint64_t cvmType = self->_cvmType;
  v28 = objc_msgSend_asHexString(self->_cvmResult, v23, v24, v25, v26, v27);
  v39 = objc_msgSend_asHexString(self->_merchantCategoryCode, v29, v30, v31, v32, v33);
  if (self->_pinRequired) {
    v40 = @"true";
  }
  else {
    v40 = @"false";
  }
  if (self->_isPinSupported) {
    v41 = @"true";
  }
  else {
    v41 = @"false";
  }
  v46 = objc_msgSend_asHexString(self->_languagePreference, v34, v35, v36, v37, v38);
  if (self->_isPINBypassEnabled) {
    v47 = @"true";
  }
  else {
    v47 = @"false";
  }
  if (self->_isPINBypassAllowed) {
    v48 = @"true";
  }
  else {
    v48 = @"false";
  }
  if (self->_forFallback) {
    v49 = @"true";
  }
  else {
    v49 = @"false";
  }
  if (self->_switchInterfaceOrNoCVMSuccess) {
    v50 = @"true";
  }
  else {
    v50 = @"false";
  }
  if (self->_isSAF) {
    v51 = @"true";
  }
  else {
    v51 = @"false";
  }
  objc_msgSend_stringWithFormat_(v58, v42, @"{vasResponses: see earlier log, transactionCipherBlob: %@, transactionKeyBlob: %@, network(50): %@, outcomeStatus: 0x%02X, errorIndicationStatusWord: %@, errorIndicationMsgOnError: 0x%02X, cvmType: 0x%02X, cvmResult(9F34): %@, merchantCategoryCode(9F15): %@, pinRequired: %@, transactionResultData(DF81FE): see earlier log, isPinSupported: %@, languagePreference(5F2D): %@, readError: %ld, payAppletFinalStatus: 0x%02X, isPINBypassEnabled: %@, isPINBypassAllowed: %@, forFallback: %@, fallbackAmount: %@, switchInterfaceOrNoCVMSuccess: %@, cardExpirationState: 0x%02X, cardEffectiveState: 0x%02X, payAppType: %@, isSAF: %@}", v43, v44, v45, v59, v16, network, outcomeStatus, v22, errorIndicationMsgOnError, cvmType, v28, v39, v40, v41, v46, self->_readError,
    self->_payAppletFinalStatus,
    v47,
    v48,
    v49,
    self->_fallbackAmount,
    v50,
    self->_cardExpirationState,
    self->_cardEffectiveState,
    self->_payAppType,
  v52 = v51);

  return v52;
}

- (id)debugDescription
{
  if (objc_msgSend_count(self->_vasResponses, a2, v2, v3, v4, v5))
  {
    objc_msgSend_componentsJoinedByString_(self->_vasResponses, v7, @" ", v9, v10, v11);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v12 = &stru_26D31DBA0;
  }
  uint64_t v13 = NSString;
  v14 = objc_msgSend_asHexString(self->_transactionCipherBlob, v7, v8, v9, v10, v11);
  uint64_t v20 = objc_msgSend_asHexString(self->_transactionKeyBlob, v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_asHexString(self->_kernelIdentityKeyAttestation, v21, v22, v23, v24, v25);
  uint64_t v32 = objc_msgSend_asHexString(self->_ecdsaCertificate, v27, v28, v29, v30, v31);
  uint64_t v38 = objc_msgSend_asHexString(self->_transactionResultData, v33, v34, v35, v36, v37);
  uint64_t v43 = objc_msgSend_stringWithFormat_(v13, v39, @"{vasResponses=%@, transactionCipherBlob=%@, transactionKeyBlob=%@, kernelIdentityKeyAttestation=%@, ecdsaCertificate=%@, transactionResultData(DF81FE)=%@, kekId=%@, pinKekId=%@, transactionId=%@}", v40, v41, v42, v12, v14, v20, v26, v32, v38, self->_kekId, self->_pinKekId, self->_transactionId);

  return v43;
}

- (NSData)fingerprint
{
  v6 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], a2, 32, v2, v3, v4);
  uint64_t v11 = objc_msgSend_dataUsingEncoding_(self->_transactionId, v7, 4, v8, v9, v10);
  memset(&v69, 0, sizeof(v69));
  CC_SHA256_Init(&v69);
  uint64_t v17 = (const void *)objc_msgSend_bytes(self->_transactionCipherBlob, v12, v13, v14, v15, v16);
  CC_LONG v23 = objc_msgSend_length(self->_transactionCipherBlob, v18, v19, v20, v21, v22);
  CC_SHA256_Update(&v69, v17, v23);
  uint64_t v29 = (const void *)objc_msgSend_bytes(self->_transactionKeyBlob, v24, v25, v26, v27, v28);
  CC_LONG v35 = objc_msgSend_length(self->_transactionKeyBlob, v30, v31, v32, v33, v34);
  CC_SHA256_Update(&v69, v29, v35);
  uint64_t v41 = (const void *)objc_msgSend_bytes(self->_cvmResult, v36, v37, v38, v39, v40);
  CC_LONG v47 = objc_msgSend_length(self->_cvmResult, v42, v43, v44, v45, v46);
  CC_SHA256_Update(&v69, v41, v47);
  id v48 = v11;
  v54 = (const void *)objc_msgSend_bytes(v48, v49, v50, v51, v52, v53);
  CC_LONG v60 = objc_msgSend_length(v48, v55, v56, v57, v58, v59);
  CC_SHA256_Update(&v69, v54, v60);
  id v61 = v6;
  v67 = (unsigned __int8 *)objc_msgSend_mutableBytes(v61, v62, v63, v64, v65, v66);
  CC_SHA256_Final(v67, &v69);

  return (NSData *)v61;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30 payAppType:(id)a31 isSAF:(BOOL)a32
{
  uint64_t v36 = (NSArray *)a3;
  uint64_t v37 = (NSData *)a4;
  uint64_t v38 = (NSData *)a5;
  uint64_t v39 = (NSString *)a6;
  v70 = (NSData *)a8;
  v71 = (NSData *)a11;
  v72 = (NSData *)a12;
  v73 = (NSData *)a14;
  uint64_t v40 = (NSData *)a15;
  v74 = (NSData *)a16;
  uint64_t v41 = (NSString *)a17;
  uint64_t v42 = (NSString *)a18;
  uint64_t v43 = (NSData *)a20;
  v78 = (NSString *)a21;
  v81 = (NSString *)a27;
  v82 = (NSString *)a31;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v36;
  v86 = v36;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v37;
  v85 = v37;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v38;
  v84 = v38;

  network = self->_network;
  self->_network = v39;
  v83 = v39;

  self->_uint64_t outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v70;
  v80 = v70;

  self->_uint64_t errorIndicationMsgOnError = a9;
  self->_uint64_t cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v71;
  v76 = v71;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v72;
  v75 = v72;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v73;
  uint64_t v53 = v73;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v40;
  v55 = v40;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v74;
  uint64_t v57 = v74;

  kekId = self->_kekId;
  self->_kekId = v41;
  uint64_t v59 = v41;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v42;
  id v61 = v42;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v43;
  uint64_t v63 = v43;

  transactionId = self->_transactionId;
  self->_transactionId = v78;
  uint64_t v65 = v78;

  self->_payAppletFinalStatus = a23;
  self->_isPINBypassEnabled = a24;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v81;
  v67 = v81;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  self->_cardExpirationState = a29;
  self->_cardEffectiveState = a30;
  payAppType = self->_payAppType;
  self->_payAppType = v82;

  self->_isSAF = a32;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 cvmType:(unsigned __int8)a7 cvmResult:(id)a8 merchantCategoryCode:(id)a9 pinRequired:(BOOL)a10 kernelIdentityKeyAttestation:(id)a11 ecdsaCertificate:(id)a12 transactionResultData:(id)a13 kekId:(id)a14 pinKekId:(id)a15 isPinSupported:(BOOL)a16 languagePreference:(id)a17 transactionId:(id)a18 readError:(int64_t)a19 payAppletFinalStatus:(unsigned __int8)a20
{
  uint64_t v24 = (NSArray *)a3;
  uint64_t v25 = (NSData *)a4;
  uint64_t v26 = (NSString *)a5;
  uint64_t v27 = (NSData *)a8;
  uint64_t v28 = (NSData *)a9;
  uint64_t v29 = (NSData *)a11;
  uint64_t v30 = (NSData *)a12;
  uint64_t v31 = (NSData *)a13;
  v54 = (NSString *)a14;
  uint64_t v56 = (NSString *)a15;
  uint64_t v57 = (NSData *)a17;
  uint64_t v58 = (NSString *)a18;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v24;
  uint64_t v63 = v24;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v25;
  v62 = v25;

  network = self->_network;
  self->_network = v26;
  id v61 = v26;

  self->_uint64_t outcomeStatus = a6;
  self->_uint64_t cvmType = a7;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v27;
  CC_LONG v60 = v27;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v28;
  uint64_t v37 = v28;

  self->_pinRequired = a10;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v29;
  uint64_t v39 = v29;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v30;
  uint64_t v41 = v30;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v31;
  uint64_t v43 = v31;

  kekId = self->_kekId;
  self->_kekId = v54;
  uint64_t v45 = v54;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v56;
  CC_LONG v47 = v56;

  self->_isPinSupported = a16;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v57;
  v49 = v57;

  transactionId = self->_transactionId;
  self->_transactionId = v58;
  uint64_t v51 = v58;

  self->_payAppletFinalStatus = a20;
  *(_WORD *)&self->_isPINBypassAllowed = 0;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a19;
  self->_fallbackAmount = (NSString *)@"000000000000";

  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 cvmType:(unsigned __int8)a7 cvmResult:(id)a8 merchantCategoryCode:(id)a9 pinRequired:(BOOL)a10 kernelIdentityKeyAttestation:(id)a11 ecdsaCertificate:(id)a12 transactionResultData:(id)a13 kekId:(id)a14 pinKekId:(id)a15 isPinSupported:(BOOL)a16 languagePreference:(id)a17 transactionId:(id)a18 readError:(int64_t)a19 payAppletFinalStatus:(unsigned __int8)a20 isPINBypassAllowed:(BOOL)a21 forFallback:(BOOL)a22 fallbackAmount:(id)a23
{
  uint64_t v27 = (NSArray *)a3;
  uint64_t v28 = (NSData *)a4;
  uint64_t v29 = (NSString *)a5;
  uint64_t v30 = (NSData *)a8;
  uint64_t v31 = (NSData *)a9;
  uint64_t v32 = (NSData *)a11;
  uint64_t v63 = (NSData *)a12;
  uint64_t v65 = (NSData *)a13;
  uint64_t v66 = (NSString *)a14;
  uint64_t v33 = (NSString *)a15;
  uint64_t v34 = (NSData *)a17;
  CC_SHA256_CTX v69 = (NSString *)a18;
  v70 = (NSString *)a23;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v27;
  v73 = v27;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v28;
  v72 = v28;

  network = self->_network;
  self->_network = v29;
  v71 = v29;

  self->_uint64_t outcomeStatus = a6;
  objc_msgSend_dataWithHexString_(MEMORY[0x263EFF8F8], v38, @"0000", v39, v40, v41);
  uint64_t v42 = (NSData *)objc_claimAutoreleasedReturnValue();
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v42;

  self->_uint64_t errorIndicationMsgOnError = 0;
  self->_uint64_t cvmType = a7;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v30;
  v68 = v30;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v31;
  uint64_t v46 = v31;

  self->_pinRequired = a10;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v32;
  id v48 = v32;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v63;
  uint64_t v50 = v63;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v65;
  uint64_t v52 = v65;

  kekId = self->_kekId;
  self->_kekId = v66;
  v54 = v66;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v33;
  uint64_t v56 = v33;

  self->_isPinSupported = a16;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v34;
  uint64_t v58 = v34;

  transactionId = self->_transactionId;
  self->_transactionId = v69;
  CC_LONG v60 = v69;

  self->_payAppletFinalStatus = a20;
  self->_isPINBypassAllowed = a21;
  self->_forFallback = a22;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a19;
  self->_fallbackAmount = v70;

  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 errorIndicationStatusWord:(id)a7 errorIndicationMsgOnError:(unsigned __int8)a8 cvmType:(unsigned __int8)a9 cvmResult:(id)a10 merchantCategoryCode:(id)a11 pinRequired:(BOOL)a12 kernelIdentityKeyAttestation:(id)a13 ecdsaCertificate:(id)a14 transactionResultData:(id)a15 kekId:(id)a16 pinKekId:(id)a17 isPinSupported:(BOOL)a18 languagePreference:(id)a19 transactionId:(id)a20 readError:(int64_t)a21 payAppletFinalStatus:(unsigned __int8)a22 isPINBypassAllowed:(BOOL)a23 forFallback:(BOOL)a24 fallbackAmount:(id)a25
{
  uint64_t v29 = (NSArray *)a3;
  uint64_t v30 = (NSData *)a4;
  uint64_t v31 = (NSString *)a5;
  uint64_t v32 = (NSData *)a7;
  uint64_t v33 = (NSData *)a10;
  uint64_t v34 = (NSData *)a11;
  CC_LONG v35 = (NSData *)a13;
  uint64_t v59 = (NSData *)a14;
  CC_LONG v60 = (NSData *)a15;
  id v61 = (NSString *)a16;
  v62 = (NSString *)a17;
  uint64_t v63 = (NSData *)a19;
  uint64_t v66 = (NSString *)a20;
  v67 = (NSString *)a25;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v29;
  v72 = v29;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v30;
  v71 = v30;

  network = self->_network;
  self->_network = v31;
  v70 = v31;

  self->_uint64_t outcomeStatus = a6;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v32;
  CC_SHA256_CTX v69 = v32;

  self->_uint64_t errorIndicationMsgOnError = a8;
  self->_uint64_t cvmType = a9;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v33;
  uint64_t v65 = v33;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v34;
  uint64_t v42 = v34;

  self->_pinRequired = a12;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v35;
  uint64_t v44 = v35;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v59;
  uint64_t v46 = v59;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v60;
  id v48 = v60;

  kekId = self->_kekId;
  self->_kekId = v61;
  uint64_t v50 = v61;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v62;
  uint64_t v52 = v62;

  self->_isPinSupported = a18;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v63;
  v54 = v63;

  transactionId = self->_transactionId;
  self->_transactionId = v66;
  uint64_t v56 = v66;

  self->_payAppletFinalStatus = a22;
  self->_isPINBypassAllowed = a23;
  self->_forFallback = a24;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a21;
  self->_fallbackAmount = v67;

  self->_switchInterfaceOrNoCVMSuccess = 0;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 cardHolderData:(id)a4 network:(id)a5 outcomeStatus:(unsigned __int8)a6 errorIndicationStatusWord:(id)a7 errorIndicationMsgOnError:(unsigned __int8)a8 cvmType:(unsigned __int8)a9 cvmResult:(id)a10 merchantCategoryCode:(id)a11 pinRequired:(BOOL)a12 kernelIdentityKeyAttestation:(id)a13 ecdsaCertificate:(id)a14 transactionResultData:(id)a15 kekId:(id)a16 pinKekId:(id)a17 isPinSupported:(BOOL)a18 languagePreference:(id)a19 transactionId:(id)a20 readError:(int64_t)a21 payAppletFinalStatus:(unsigned __int8)a22 isPINBypassAllowed:(BOOL)a23 forFallback:(BOOL)a24 fallbackAmount:(id)a25 switchInterfaceOrNoCVMSuccess:(BOOL)a26
{
  uint64_t v30 = (NSArray *)a3;
  uint64_t v31 = (NSData *)a4;
  uint64_t v32 = (NSString *)a5;
  uint64_t v33 = (NSData *)a7;
  uint64_t v34 = (NSData *)a10;
  uint64_t v63 = (NSData *)a11;
  CC_LONG v35 = (NSData *)a13;
  uint64_t v64 = (NSData *)a14;
  uint64_t v65 = (NSData *)a15;
  uint64_t v36 = (NSString *)a16;
  uint64_t v66 = (NSString *)a17;
  uint64_t v37 = (NSData *)a19;
  v71 = (NSString *)a20;
  v72 = (NSString *)a25;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v30;
  v75 = v30;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v31;
  v74 = v31;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = 0;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = 0;

  network = self->_network;
  self->_network = v32;
  v73 = v32;

  self->_uint64_t outcomeStatus = a6;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v33;
  v70 = v33;

  self->_uint64_t errorIndicationMsgOnError = a8;
  self->_uint64_t cvmType = a9;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v34;
  v68 = v34;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v63;
  uint64_t v46 = v63;

  self->_pinRequired = a12;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v35;
  id v48 = v35;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v64;
  uint64_t v50 = v64;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v65;
  uint64_t v52 = v65;

  kekId = self->_kekId;
  self->_kekId = v36;
  v54 = v36;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v66;
  uint64_t v56 = v66;

  self->_isPinSupported = a18;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v37;
  uint64_t v58 = v37;

  transactionId = self->_transactionId;
  self->_transactionId = v71;
  CC_LONG v60 = v71;

  self->_payAppletFinalStatus = a22;
  self->_isPINBypassAllowed = a23;
  self->_forFallback = a24;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a21;
  self->_fallbackAmount = v72;

  self->_switchInterfaceOrNoCVMSuccess = a26;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassAllowed:(BOOL)a24 forFallback:(BOOL)a25 fallbackAmount:(id)a26 switchInterfaceOrNoCVMSuccess:(BOOL)a27
{
  uint64_t v32 = (NSArray *)a3;
  uint64_t v33 = (NSData *)a4;
  uint64_t v34 = (NSData *)a5;
  CC_LONG v35 = (NSString *)a6;
  uint64_t v36 = (NSData *)a8;
  uint64_t v64 = (NSData *)a11;
  uint64_t v65 = (NSData *)a12;
  uint64_t v66 = (NSData *)a14;
  v67 = (NSData *)a15;
  v68 = (NSData *)a16;
  uint64_t v37 = (NSString *)a17;
  uint64_t v38 = (NSString *)a18;
  v70 = (NSData *)a20;
  v73 = (NSString *)a21;
  v74 = (NSString *)a26;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v32;
  v78 = v32;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v33;
  v77 = v33;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v34;
  v76 = v34;

  network = self->_network;
  self->_network = v35;
  v75 = v35;

  self->_uint64_t outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v36;
  v72 = v36;

  self->_uint64_t errorIndicationMsgOnError = a9;
  self->_uint64_t cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v64;
  CC_SHA256_CTX v69 = v64;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v65;
  CC_LONG v47 = v65;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v66;
  v49 = v66;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v67;
  uint64_t v51 = v67;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v68;
  uint64_t v53 = v68;

  kekId = self->_kekId;
  self->_kekId = v37;
  v55 = v37;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v38;
  uint64_t v57 = v38;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v70;
  uint64_t v59 = v70;

  transactionId = self->_transactionId;
  self->_transactionId = v73;
  id v61 = v73;

  *(_WORD *)&self->_payAppletFinalStatus = a23;
  self->_isPINBypassAllowed = a24;
  self->_forFallback = a25;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v74;

  self->_switchInterfaceOrNoCVMSuccess = a27;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28
{
  uint64_t v33 = (NSArray *)a3;
  uint64_t v34 = (NSData *)a4;
  CC_LONG v35 = (NSData *)a5;
  uint64_t v36 = (NSString *)a6;
  uint64_t v37 = (NSData *)a8;
  uint64_t v65 = (NSData *)a11;
  uint64_t v66 = (NSData *)a12;
  v67 = (NSData *)a14;
  v68 = (NSData *)a15;
  CC_SHA256_CTX v69 = (NSData *)a16;
  uint64_t v38 = (NSString *)a17;
  uint64_t v39 = (NSString *)a18;
  v71 = (NSData *)a20;
  v74 = (NSString *)a21;
  v75 = (NSString *)a27;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v33;
  v79 = v33;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v34;
  v78 = v34;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v35;
  v77 = v35;

  network = self->_network;
  self->_network = v36;
  v76 = v36;

  self->_uint64_t outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v37;
  v73 = v37;

  self->_uint64_t errorIndicationMsgOnError = a9;
  self->_uint64_t cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v65;
  v70 = v65;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v66;
  id v48 = v66;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v67;
  uint64_t v50 = v67;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v68;
  uint64_t v52 = v68;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v69;
  v54 = v69;

  kekId = self->_kekId;
  self->_kekId = v38;
  uint64_t v56 = v38;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v39;
  uint64_t v58 = v39;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v71;
  CC_LONG v60 = v71;

  transactionId = self->_transactionId;
  self->_transactionId = v74;
  v62 = v74;

  *(_WORD *)&self->_payAppletFinalStatus = a23;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v75;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  *(_WORD *)&self->_cardExpirationState = 0;
  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30
{
  CC_LONG v35 = (NSArray *)a3;
  uint64_t v36 = (NSData *)a4;
  uint64_t v37 = (NSData *)a5;
  uint64_t v38 = (NSString *)a6;
  uint64_t v39 = (NSData *)a8;
  CC_SHA256_CTX v69 = (NSData *)a11;
  v70 = (NSData *)a12;
  v71 = (NSData *)a14;
  v72 = (NSData *)a15;
  v73 = (NSData *)a16;
  uint64_t v40 = (NSString *)a17;
  uint64_t v41 = (NSString *)a18;
  uint64_t v42 = (NSData *)a20;
  v76 = (NSString *)a21;
  v77 = (NSString *)a27;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v35;
  v83 = v35;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v36;
  v82 = v36;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v37;
  v81 = v37;

  network = self->_network;
  self->_network = v38;
  v80 = v38;

  self->_uint64_t outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v39;
  v79 = v39;

  self->_uint64_t errorIndicationMsgOnError = a9;
  self->_uint64_t cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v69;
  v75 = v69;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v70;
  v74 = v70;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v71;
  uint64_t v52 = v71;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v72;
  v54 = v72;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v73;
  uint64_t v56 = v73;

  kekId = self->_kekId;
  self->_kekId = v40;
  uint64_t v58 = v40;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v41;
  CC_LONG v60 = v41;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v42;
  v62 = v42;

  transactionId = self->_transactionId;
  self->_transactionId = v76;
  uint64_t v64 = v76;

  self->_payAppletFinalStatus = a23;
  self->_isPINBypassEnabled = a24;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v77;
  uint64_t v66 = v77;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  self->_cardExpirationState = a29;
  self->_cardEffectiveState = a30;
  payAppType = self->_payAppType;
  self->_payAppType = 0;

  return self;
}

- (SPRTransactionData)initWithVasResponses:(id)a3 transactionCipherBlob:(id)a4 transactionKeyBlob:(id)a5 network:(id)a6 outcomeStatus:(unsigned __int8)a7 errorIndicationStatusWord:(id)a8 errorIndicationMsgOnError:(unsigned __int8)a9 cvmType:(unsigned __int8)a10 cvmResult:(id)a11 merchantCategoryCode:(id)a12 pinRequired:(BOOL)a13 kernelIdentityKeyAttestation:(id)a14 ecdsaCertificate:(id)a15 transactionResultData:(id)a16 kekId:(id)a17 pinKekId:(id)a18 isPinSupported:(BOOL)a19 languagePreference:(id)a20 transactionId:(id)a21 readError:(int64_t)a22 payAppletFinalStatus:(unsigned __int8)a23 isPINBypassEnabled:(BOOL)a24 isPINBypassAllowed:(BOOL)a25 forFallback:(BOOL)a26 fallbackAmount:(id)a27 switchInterfaceOrNoCVMSuccess:(BOOL)a28 cardExpirationState:(unsigned __int8)a29 cardEffectiveState:(unsigned __int8)a30 payAppType:(id)a31
{
  uint64_t v36 = (NSArray *)a3;
  uint64_t v37 = (NSData *)a4;
  uint64_t v38 = (NSData *)a5;
  uint64_t v39 = (NSString *)a6;
  uint64_t v40 = (NSData *)a8;
  v70 = (NSData *)a11;
  v71 = (NSData *)a12;
  v72 = (NSData *)a14;
  v73 = (NSData *)a15;
  v74 = (NSData *)a16;
  uint64_t v41 = (NSString *)a17;
  uint64_t v42 = (NSString *)a18;
  uint64_t v43 = (NSData *)a20;
  v77 = (NSString *)a21;
  v80 = (NSString *)a27;
  v81 = (NSString *)a31;
  vasResponses = self->_vasResponses;
  self->_vasResponses = v36;
  v85 = v36;

  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = 0;

  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v37;
  v84 = v37;

  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v38;
  v83 = v38;

  network = self->_network;
  self->_network = v39;
  v82 = v39;

  self->_uint64_t outcomeStatus = a7;
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v40;
  v79 = v40;

  self->_uint64_t errorIndicationMsgOnError = a9;
  self->_uint64_t cvmType = a10;
  cvmResult = self->_cvmResult;
  self->_cvmResult = v70;
  v76 = v70;

  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v71;
  v75 = v71;

  self->_pinRequired = a13;
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v72;
  uint64_t v53 = v72;

  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v73;
  v55 = v73;

  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v74;
  uint64_t v57 = v74;

  kekId = self->_kekId;
  self->_kekId = v41;
  uint64_t v59 = v41;

  pinKekId = self->_pinKekId;
  self->_pinKekId = v42;
  id v61 = v42;

  self->_isPinSupported = a19;
  languagePreference = self->_languagePreference;
  self->_languagePreference = v43;
  uint64_t v63 = v43;

  transactionId = self->_transactionId;
  self->_transactionId = v77;
  uint64_t v65 = v77;

  self->_payAppletFinalStatus = a23;
  self->_isPINBypassEnabled = a24;
  self->_isPINBypassAllowed = a25;
  self->_forFallback = a26;
  fallbackAmount = self->_fallbackAmount;
  self->_readError = a22;
  self->_fallbackAmount = v80;
  v67 = v80;

  self->_switchInterfaceOrNoCVMSuccess = a28;
  self->_cardExpirationState = a29;
  self->_cardEffectiveState = a30;
  payAppType = self->_payAppType;
  self->_payAppType = v81;

  self->_isSAF = 0;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPRTransactionData)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v12 = objc_msgSend_setWithObjects_(v4, v8, v6, v9, v10, v11, v7, 0);
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v13, (uint64_t)v12, @"vasResponses", v14, v15);
  uint64_t v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  vasResponses = self->_vasResponses;
  self->_vasResponses = v16;

  uint64_t v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v19, v18, @"cardHolderData", v20, v21);
  uint64_t v22 = (NSData *)objc_claimAutoreleasedReturnValue();
  cardHolderData = self->_cardHolderData;
  self->_cardHolderData = v22;

  uint64_t v24 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v25, v24, @"transactionCipherBlob", v26, v27);
  uint64_t v28 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionCipherBlob = self->_transactionCipherBlob;
  self->_transactionCipherBlob = v28;

  uint64_t v30 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v31, v30, @"transactionKeyBlob", v32, v33);
  uint64_t v34 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionKeyBlob = self->_transactionKeyBlob;
  self->_transactionKeyBlob = v34;

  uint64_t v36 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v37, v36, @"network", v38, v39);
  uint64_t v40 = (NSString *)objc_claimAutoreleasedReturnValue();
  network = self->_network;
  self->_network = v40;

  self->_uint64_t outcomeStatus = objc_msgSend_decodeIntegerForKey_(v5, v42, @"outcomeStatus", v43, v44, v45);
  uint64_t v46 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v47, v46, @"errorIndicationStatusWord", v48, v49);
  uint64_t v50 = (NSData *)objc_claimAutoreleasedReturnValue();
  errorIndicationStatusWord = self->_errorIndicationStatusWord;
  self->_errorIndicationStatusWord = v50;

  self->_uint64_t errorIndicationMsgOnError = objc_msgSend_decodeIntegerForKey_(v5, v52, @"errorIndicationMsgOnError", v53, v54, v55);
  self->_uint64_t cvmType = objc_msgSend_decodeIntegerForKey_(v5, v56, @"cvmType", v57, v58, v59);
  uint64_t v60 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v61, v60, @"cvmResult", v62, v63);
  uint64_t v64 = (NSData *)objc_claimAutoreleasedReturnValue();
  cvmResult = self->_cvmResult;
  self->_cvmResult = v64;

  uint64_t v66 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v67, v66, @"merchantCategoryCode", v68, v69);
  v70 = (NSData *)objc_claimAutoreleasedReturnValue();
  merchantCategoryCode = self->_merchantCategoryCode;
  self->_merchantCategoryCode = v70;

  self->_pinRequired = objc_msgSend_decodeBoolForKey_(v5, v72, @"pinRequired", v73, v74, v75);
  uint64_t v76 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v77, v76, @"kernelIdentityKeyAttestation", v78, v79);
  v80 = (NSData *)objc_claimAutoreleasedReturnValue();
  kernelIdentityKeyAttestation = self->_kernelIdentityKeyAttestation;
  self->_kernelIdentityKeyAttestation = v80;

  uint64_t v82 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v83, v82, @"ecdsaCertificate", v84, v85);
  v86 = (NSData *)objc_claimAutoreleasedReturnValue();
  ecdsaCertificate = self->_ecdsaCertificate;
  self->_ecdsaCertificate = v86;

  uint64_t v88 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v89, v88, @"transactionResultData", v90, v91);
  v92 = (NSData *)objc_claimAutoreleasedReturnValue();
  transactionResultData = self->_transactionResultData;
  self->_transactionResultData = v92;

  uint64_t v94 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v95, v94, @"kekId", v96, v97);
  v98 = (NSString *)objc_claimAutoreleasedReturnValue();
  kekId = self->_kekId;
  self->_kekId = v98;

  uint64_t v100 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v101, v100, @"pinKekId", v102, v103);
  v104 = (NSString *)objc_claimAutoreleasedReturnValue();
  pinKekId = self->_pinKekId;
  self->_pinKekId = v104;

  self->_isPinSupported = objc_msgSend_decodeBoolForKey_(v5, v106, @"isPinSupported", v107, v108, v109);
  uint64_t v110 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v111, v110, @"languagePreference", v112, v113);
  v114 = (NSData *)objc_claimAutoreleasedReturnValue();
  languagePreference = self->_languagePreference;
  self->_languagePreference = v114;

  uint64_t v116 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v117, v116, @"transactionId", v118, v119);
  v120 = (NSString *)objc_claimAutoreleasedReturnValue();
  transactionId = self->_transactionId;
  self->_transactionId = v120;

  self->_readError = objc_msgSend_decodeIntegerForKey_(v5, v122, @"readError", v123, v124, v125);
  self->_payAppletFinalStatus = objc_msgSend_decodeIntegerForKey_(v5, v126, @"payAppletFinalStatus", v127, v128, v129);
  self->_isPINBypassEnabled = objc_msgSend_decodeBoolForKey_(v5, v130, @"isPINBypassEnabled", v131, v132, v133);
  self->_isPINBypassAllowed = objc_msgSend_decodeBoolForKey_(v5, v134, @"isPINBypassAllowed", v135, v136, v137);
  self->_forFallback = objc_msgSend_decodeBoolForKey_(v5, v138, @"forFallback", v139, v140, v141);
  uint64_t v142 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v143, v142, @"fallbackAmount", v144, v145);
  v146 = (NSString *)objc_claimAutoreleasedReturnValue();
  fallbackAmount = self->_fallbackAmount;
  self->_fallbackAmount = v146;

  self->_switchInterfaceOrNoCVMSuccess = objc_msgSend_decodeBoolForKey_(v5, v148, @"switchInterfaceOrNoCVMSuccess", v149, v150, v151);
  self->_cardExpirationState = objc_msgSend_decodeIntegerForKey_(v5, v152, @"cardExpirationState", v153, v154, v155);
  self->_cardEffectiveState = objc_msgSend_decodeIntegerForKey_(v5, v156, @"cardEffectiveState", v157, v158, v159);
  uint64_t v160 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v5, v161, v160, @"payAppType", v162, v163);
  v164 = (NSString *)objc_claimAutoreleasedReturnValue();
  payAppType = self->_payAppType;
  self->_payAppType = v164;

  LOBYTE(v12) = objc_msgSend_decodeBoolForKey_(v5, v166, @"isSAF", v167, v168, v169);
  self->_isSAF = (char)v12;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  vasResponses = self->_vasResponses;
  id v98 = a3;
  objc_msgSend_encodeObject_forKey_(v98, v5, (uint64_t)vasResponses, @"vasResponses", v6, v7);
  objc_msgSend_encodeObject_forKey_(v98, v8, (uint64_t)self->_cardHolderData, @"cardHolderData", v9, v10);
  objc_msgSend_encodeObject_forKey_(v98, v11, (uint64_t)self->_transactionCipherBlob, @"transactionCipherBlob", v12, v13);
  objc_msgSend_encodeObject_forKey_(v98, v14, (uint64_t)self->_transactionKeyBlob, @"transactionKeyBlob", v15, v16);
  objc_msgSend_encodeObject_forKey_(v98, v17, (uint64_t)self->_network, @"network", v18, v19);
  objc_msgSend_encodeInteger_forKey_(v98, v20, self->_outcomeStatus, @"outcomeStatus", v21, v22);
  objc_msgSend_encodeObject_forKey_(v98, v23, (uint64_t)self->_errorIndicationStatusWord, @"errorIndicationStatusWord", v24, v25);
  objc_msgSend_encodeInteger_forKey_(v98, v26, self->_errorIndicationMsgOnError, @"errorIndicationMsgOnError", v27, v28);
  objc_msgSend_encodeInteger_forKey_(v98, v29, self->_cvmType, @"cvmType", v30, v31);
  objc_msgSend_encodeObject_forKey_(v98, v32, (uint64_t)self->_cvmResult, @"cvmResult", v33, v34);
  objc_msgSend_encodeObject_forKey_(v98, v35, (uint64_t)self->_merchantCategoryCode, @"merchantCategoryCode", v36, v37);
  objc_msgSend_encodeBool_forKey_(v98, v38, self->_pinRequired, @"pinRequired", v39, v40);
  objc_msgSend_encodeObject_forKey_(v98, v41, (uint64_t)self->_kernelIdentityKeyAttestation, @"kernelIdentityKeyAttestation", v42, v43);
  objc_msgSend_encodeObject_forKey_(v98, v44, (uint64_t)self->_ecdsaCertificate, @"ecdsaCertificate", v45, v46);
  objc_msgSend_encodeObject_forKey_(v98, v47, (uint64_t)self->_transactionResultData, @"transactionResultData", v48, v49);
  objc_msgSend_encodeObject_forKey_(v98, v50, (uint64_t)self->_kekId, @"kekId", v51, v52);
  objc_msgSend_encodeObject_forKey_(v98, v53, (uint64_t)self->_pinKekId, @"pinKekId", v54, v55);
  objc_msgSend_encodeBool_forKey_(v98, v56, self->_isPinSupported, @"isPinSupported", v57, v58);
  objc_msgSend_encodeObject_forKey_(v98, v59, (uint64_t)self->_languagePreference, @"languagePreference", v60, v61);
  objc_msgSend_encodeObject_forKey_(v98, v62, (uint64_t)self->_transactionId, @"transactionId", v63, v64);
  objc_msgSend_encodeInteger_forKey_(v98, v65, self->_readError, @"readError", v66, v67);
  objc_msgSend_encodeInteger_forKey_(v98, v68, self->_payAppletFinalStatus, @"payAppletFinalStatus", v69, v70);
  objc_msgSend_encodeBool_forKey_(v98, v71, self->_isPINBypassEnabled, @"isPINBypassEnabled", v72, v73);
  objc_msgSend_encodeBool_forKey_(v98, v74, self->_isPINBypassAllowed, @"isPINBypassAllowed", v75, v76);
  objc_msgSend_encodeBool_forKey_(v98, v77, self->_forFallback, @"forFallback", v78, v79);
  objc_msgSend_encodeObject_forKey_(v98, v80, (uint64_t)self->_fallbackAmount, @"fallbackAmount", v81, v82);
  objc_msgSend_encodeBool_forKey_(v98, v83, self->_switchInterfaceOrNoCVMSuccess, @"switchInterfaceOrNoCVMSuccess", v84, v85);
  objc_msgSend_encodeInteger_forKey_(v98, v86, self->_cardExpirationState, @"cardExpirationState", v87, v88);
  objc_msgSend_encodeInteger_forKey_(v98, v89, self->_cardEffectiveState, @"cardEffectiveState", v90, v91);
  objc_msgSend_encodeObject_forKey_(v98, v92, (uint64_t)self->_payAppType, @"payAppType", v93, v94);
  objc_msgSend_encodeBool_forKey_(v98, v95, self->_isSAF, @"isSAF", v96, v97);
}

- (NSArray)vasResponses
{
  return self->_vasResponses;
}

- (NSData)cardHolderData
{
  return self->_cardHolderData;
}

- (NSData)transactionCipherBlob
{
  return self->_transactionCipherBlob;
}

- (NSData)transactionKeyBlob
{
  return self->_transactionKeyBlob;
}

- (NSString)network
{
  return self->_network;
}

- (unsigned)outcomeStatus
{
  return self->_outcomeStatus;
}

- (NSData)errorIndicationStatusWord
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (unsigned)errorIndicationMsgOnError
{
  return self->_errorIndicationMsgOnError;
}

- (unsigned)cvmType
{
  return self->_cvmType;
}

- (NSData)cvmResult
{
  return self->_cvmResult;
}

- (NSData)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (BOOL)pinRequired
{
  return self->_pinRequired;
}

- (NSData)kernelIdentityKeyAttestation
{
  return self->_kernelIdentityKeyAttestation;
}

- (NSData)ecdsaCertificate
{
  return self->_ecdsaCertificate;
}

- (NSData)transactionResultData
{
  return self->_transactionResultData;
}

- (NSString)kekId
{
  return self->_kekId;
}

- (NSString)pinKekId
{
  return self->_pinKekId;
}

- (BOOL)isPinSupported
{
  return self->_isPinSupported;
}

- (NSData)languagePreference
{
  return self->_languagePreference;
}

- (NSString)transactionId
{
  return self->_transactionId;
}

- (int64_t)readError
{
  return self->_readError;
}

- (unsigned)payAppletFinalStatus
{
  return self->_payAppletFinalStatus;
}

- (BOOL)isPINBypassEnabled
{
  return self->_isPINBypassEnabled;
}

- (BOOL)isPINBypassAllowed
{
  return self->_isPINBypassAllowed;
}

- (BOOL)forFallback
{
  return self->_forFallback;
}

- (NSString)fallbackAmount
{
  return self->_fallbackAmount;
}

- (BOOL)switchInterfaceOrNoCVMSuccess
{
  return self->_switchInterfaceOrNoCVMSuccess;
}

- (unsigned)cardExpirationState
{
  return self->_cardExpirationState;
}

- (unsigned)cardEffectiveState
{
  return self->_cardEffectiveState;
}

- (NSString)payAppType
{
  return self->_payAppType;
}

- (BOOL)isSAF
{
  return self->_isSAF;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payAppType, 0);
  objc_storeStrong((id *)&self->_fallbackAmount, 0);
  objc_storeStrong((id *)&self->_transactionId, 0);
  objc_storeStrong((id *)&self->_languagePreference, 0);
  objc_storeStrong((id *)&self->_pinKekId, 0);
  objc_storeStrong((id *)&self->_kekId, 0);
  objc_storeStrong((id *)&self->_transactionResultData, 0);
  objc_storeStrong((id *)&self->_ecdsaCertificate, 0);
  objc_storeStrong((id *)&self->_kernelIdentityKeyAttestation, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_cvmResult, 0);
  objc_storeStrong((id *)&self->_errorIndicationStatusWord, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_transactionKeyBlob, 0);
  objc_storeStrong((id *)&self->_transactionCipherBlob, 0);
  objc_storeStrong((id *)&self->_cardHolderData, 0);
  objc_storeStrong((id *)&self->_vasResponses, 0);
}

@end