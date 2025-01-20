@interface SSBiometricAuthenticationContext
- (BOOL)didAuthenticate;
- (BOOL)didBuyParamsChange;
- (BOOL)didFallbackToPassword;
- (BOOL)isExtendedAction;
- (BOOL)isIdentityMapInvalid;
- (BOOL)isPayment;
- (BOOL)shouldContinueTouchIDSession;
- (BOOL)shouldSendFallbackHeader;
- (BOOL)touchIDDelayEnabled;
- (NSData)paymentTokenData;
- (NSNumber)accountIdentifier;
- (NSString)accountName;
- (NSString)challenge;
- (NSString)dialogId;
- (NSString)fpanID;
- (NSString)passwordEquivalentToken;
- (NSString)signature;
- (NSString)userAgent;
- (NSString)xAppleAMDHeader;
- (NSString)xAppleAMDMHeader;
- (NSURL)redirectURL;
- (SSBiometricAuthenticationContext)init;
- (SSBiometricAuthenticationContext)initWithXPCEncoding:(id)a3;
- (SSConsolidatedDialog)consolidatedDialog;
- (SSPaymentSheet)paymentSheet;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int64_t)biometricAuthorizationAttempts;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setBiometricAuthorizationAttempts:(int64_t)a3;
- (void)setChallenge:(id)a3;
- (void)setConsolidatedDialog:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setDidAuthenticate:(BOOL)a3;
- (void)setDidBuyParamsChange:(BOOL)a3;
- (void)setDidFallbackToPassword:(BOOL)a3;
- (void)setFpanID:(id)a3;
- (void)setIsExtendedAction:(BOOL)a3;
- (void)setIsIdentityMapInvalid:(BOOL)a3;
- (void)setIsPayment:(BOOL)a3;
- (void)setPasswordEquivalentToken:(id)a3;
- (void)setPaymentSheet:(id)a3;
- (void)setPaymentTokenData:(id)a3;
- (void)setRedirectURL:(id)a3;
- (void)setShouldContinueTouchIDSession:(BOOL)a3;
- (void)setShouldSendFallbackHeader:(BOOL)a3;
- (void)setSignature:(id)a3;
- (void)setTouchIDDelayEnabled:(BOOL)a3;
- (void)setUserAgent:(id)a3;
- (void)setXAppleAMDHeader:(id)a3;
- (void)setXAppleAMDMHeader:(id)a3;
@end

@implementation SSBiometricAuthenticationContext

- (SSBiometricAuthenticationContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)SSBiometricAuthenticationContext;
  v2 = [(SSBiometricAuthenticationContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_isExtendedAction = 0;
    v2->_isPayment = 0;
    v4 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v3->_lock;
    v3->_lock = v4;
  }
  return v3;
}

- (SSPaymentSheet)paymentSheet
{
  [(NSLock *)self->_lock lock];
  v3 = self->_paymentSheet;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (void)setPaymentSheet:(id)a3
{
  v5 = (SSPaymentSheet *)a3;
  [(NSLock *)self->_lock lock];
  if (self->_paymentSheet != v5) {
    objc_storeStrong((id *)&self->_paymentSheet, a3);
  }
  self->_isPayment = v5 != 0;
  [(NSLock *)self->_lock unlock];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSNumber *)self->_accountIdentifier copyWithZone:a3];
  objc_super v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_accountName copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  *(void *)(v5 + 56) = self->_biometricAuthorizationAttempts;
  uint64_t v10 = [(NSString *)self->_challenge copyWithZone:a3];
  v11 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v10;

  id v12 = [(SSConsolidatedDialog *)self->_consolidatedDialog copyWithZone:a3];
  v13 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_dialogId copyWithZone:a3];
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  *(unsigned char *)(v5 + 17) = self->_didAuthenticate;
  *(unsigned char *)(v5 + 18) = self->_didBuyParamsChange;
  *(unsigned char *)(v5 + 19) = self->_didFallbackToPassword;
  uint64_t v16 = [(NSString *)self->_fpanID copyWithZone:a3];
  v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  *(unsigned char *)(v5 + 20) = self->_isExtendedAction;
  *(unsigned char *)(v5 + 21) = self->_isIdentityMapInvalid;
  *(unsigned char *)(v5 + 22) = self->_isPayment;
  *(unsigned char *)(v5 + 23) = self->_shouldContinueTouchIDSession;
  *(unsigned char *)(v5 + 24) = self->_shouldSendFallbackHeader;
  uint64_t v18 = [(NSString *)self->_signature copyWithZone:a3];
  v19 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v18;

  *(unsigned char *)(v5 + 16) = self->_touchIDDelayEnabled;
  id v20 = [(SSPaymentSheet *)self->_paymentSheet copyWithZone:a3];
  v21 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v20;

  id v22 = [(SSPaymentSheet *)self->_paymentSheet copyWithZone:a3];
  v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  uint64_t v24 = [(NSString *)self->_userAgent copyWithZone:a3];
  v25 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v24;

  uint64_t v26 = [(NSString *)self->_xAppleAMDHeader copyWithZone:a3];
  v27 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v26;

  uint64_t v28 = [(NSString *)self->_xAppleAMDMHeader copyWithZone:a3];
  v29 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v28;

  return (id)v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_accountIdentifier);
  SSXPCDictionarySetObject(v3, "1", self->_accountName);
  xpc_dictionary_set_int64(v3, "12", self->_biometricAuthorizationAttempts);
  SSXPCDictionarySetObject(v3, "2", self->_challenge);
  SSXPCDictionarySetObject(v3, "3", self->_consolidatedDialog);
  SSXPCDictionarySetObject(v3, "14", self->_dialogId);
  xpc_dictionary_set_BOOL(v3, "4", self->_didAuthenticate);
  xpc_dictionary_set_BOOL(v3, "5", self->_didBuyParamsChange);
  xpc_dictionary_set_BOOL(v3, "6", self->_didFallbackToPassword);
  SSXPCDictionarySetObject(v3, "21", self->_fpanID);
  xpc_dictionary_set_BOOL(v3, "19", self->_isExtendedAction);
  xpc_dictionary_set_BOOL(v3, "13", self->_isIdentityMapInvalid);
  xpc_dictionary_set_BOOL(v3, "18", self->_isPayment);
  SSXPCDictionarySetObject(v3, "7", self->_paymentSheet);
  SSXPCDictionarySetObject(v3, "20", self->_paymentTokenData);
  SSXPCDictionarySetObject(v3, "8", self->_redirectURL);
  xpc_dictionary_set_BOOL(v3, "9", self->_shouldContinueTouchIDSession);
  xpc_dictionary_set_BOOL(v3, "10", self->_shouldSendFallbackHeader);
  SSXPCDictionarySetObject(v3, "11", self->_signature);
  SSXPCDictionarySetObject(v3, "15", self->_userAgent);
  SSXPCDictionarySetObject(v3, "16", self->_xAppleAMDHeader);
  SSXPCDictionarySetObject(v3, "17", self->_xAppleAMDMHeader);
  return v3;
}

- (SSBiometricAuthenticationContext)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v49.receiver = self;
    v49.super_class = (Class)SSBiometricAuthenticationContext;
    uint64_t v6 = [(SSBiometricAuthenticationContext *)&v49 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = SSXPCDictionaryCopyObjectWithClass(v5, "0", v8);
      accountIdentifier = v6->_accountIdentifier;
      v6->_accountIdentifier = (NSNumber *)v9;

      uint64_t v11 = objc_opt_class();
      uint64_t v12 = SSXPCDictionaryCopyObjectWithClass(v5, "1", v11);
      accountName = v6->_accountName;
      v6->_accountName = (NSString *)v12;

      v6->_biometricAuthorizationAttempts = xpc_dictionary_get_int64(v5, "12");
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = SSXPCDictionaryCopyObjectWithClass(v5, "2", v14);
      challenge = v6->_challenge;
      v6->_challenge = (NSString *)v15;

      v17 = [SSConsolidatedDialog alloc];
      uint64_t v18 = xpc_dictionary_get_value(v5, "3");
      uint64_t v19 = [(SSConsolidatedDialog *)v17 initWithXPCEncoding:v18];
      consolidatedDialog = v6->_consolidatedDialog;
      v6->_consolidatedDialog = (SSConsolidatedDialog *)v19;

      uint64_t v21 = objc_opt_class();
      uint64_t v22 = SSXPCDictionaryCopyObjectWithClass(v5, "14", v21);
      dialogId = v6->_dialogId;
      v6->_dialogId = (NSString *)v22;

      v6->_didAuthenticate = xpc_dictionary_get_BOOL(v5, "4");
      v6->_didBuyParamsChange = xpc_dictionary_get_BOOL(v5, "5");
      v6->_didFallbackToPassword = xpc_dictionary_get_BOOL(v5, "6");
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = SSXPCDictionaryCopyObjectWithClass(v5, "21", v24);
      fpanID = v6->_fpanID;
      v6->_fpanID = (NSString *)v25;

      v6->_isExtendedAction = xpc_dictionary_get_BOOL(v5, "19");
      v6->_isIdentityMapInvalid = xpc_dictionary_get_BOOL(v5, "13");
      v6->_isPayment = xpc_dictionary_get_BOOL(v5, "18");
      v27 = [SSPaymentSheet alloc];
      uint64_t v28 = xpc_dictionary_get_value(v5, "7");
      uint64_t v29 = [(SSPaymentSheet *)v27 initWithXPCEncoding:v28];
      paymentSheet = v6->_paymentSheet;
      v6->_paymentSheet = (SSPaymentSheet *)v29;

      uint64_t v31 = objc_opt_class();
      uint64_t v32 = SSXPCDictionaryCopyObjectWithClass(v5, "20", v31);
      paymentTokenData = v6->_paymentTokenData;
      v6->_paymentTokenData = (NSData *)v32;

      uint64_t v34 = objc_opt_class();
      uint64_t v35 = SSXPCDictionaryCopyObjectWithClass(v5, "8", v34);
      redirectURL = v6->_redirectURL;
      v6->_redirectURL = (NSURL *)v35;

      v6->_shouldContinueTouchIDSession = xpc_dictionary_get_BOOL(v5, "9");
      v6->_shouldSendFallbackHeader = xpc_dictionary_get_BOOL(v5, "10");
      uint64_t v37 = objc_opt_class();
      uint64_t v38 = SSXPCDictionaryCopyObjectWithClass(v5, "11", v37);
      signature = v6->_signature;
      v6->_signature = (NSString *)v38;

      uint64_t v40 = objc_opt_class();
      uint64_t v41 = SSXPCDictionaryCopyObjectWithClass(v5, "15", v40);
      userAgent = v6->_userAgent;
      v6->_userAgent = (NSString *)v41;

      uint64_t v43 = objc_opt_class();
      uint64_t v44 = SSXPCDictionaryCopyObjectWithClass(v5, "16", v43);
      xAppleAMDHeader = v6->_xAppleAMDHeader;
      v6->_xAppleAMDHeader = (NSString *)v44;

      uint64_t v46 = objc_opt_class();
      uint64_t v47 = SSXPCDictionaryCopyObjectWithClass(v5, "17", v46);
      xAppleAMDMHeader = v6->_xAppleAMDMHeader;
      v6->_xAppleAMDMHeader = (NSString *)v47;
    }
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountName:(id)a3
{
}

- (int64_t)biometricAuthorizationAttempts
{
  return self->_biometricAuthorizationAttempts;
}

- (void)setBiometricAuthorizationAttempts:(int64_t)a3
{
  self->_biometricAuthorizationAttempts = a3;
}

- (NSString)challenge
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setChallenge:(id)a3
{
}

- (BOOL)touchIDDelayEnabled
{
  return self->_touchIDDelayEnabled;
}

- (void)setTouchIDDelayEnabled:(BOOL)a3
{
  self->_touchIDDelayEnabled = a3;
}

- (SSConsolidatedDialog)consolidatedDialog
{
  return (SSConsolidatedDialog *)objc_getProperty(self, a2, 72, 1);
}

- (void)setConsolidatedDialog:(id)a3
{
}

- (NSString)dialogId
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDialogId:(id)a3
{
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (BOOL)didBuyParamsChange
{
  return self->_didBuyParamsChange;
}

- (void)setDidBuyParamsChange:(BOOL)a3
{
  self->_didBuyParamsChange = a3;
}

- (BOOL)didFallbackToPassword
{
  return self->_didFallbackToPassword;
}

- (void)setDidFallbackToPassword:(BOOL)a3
{
  self->_didFallbackToPassword = a3;
}

- (NSString)fpanID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFpanID:(id)a3
{
}

- (BOOL)isExtendedAction
{
  return self->_isExtendedAction;
}

- (void)setIsExtendedAction:(BOOL)a3
{
  self->_isExtendedAction = a3;
}

- (BOOL)isIdentityMapInvalid
{
  return self->_isIdentityMapInvalid;
}

- (void)setIsIdentityMapInvalid:(BOOL)a3
{
  self->_isIdentityMapInvalid = a3;
}

- (BOOL)isPayment
{
  return self->_isPayment;
}

- (void)setIsPayment:(BOOL)a3
{
  self->_isPayment = a3;
}

- (NSString)passwordEquivalentToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPasswordEquivalentToken:(id)a3
{
}

- (NSData)paymentTokenData
{
  return (NSData *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPaymentTokenData:(id)a3
{
}

- (NSURL)redirectURL
{
  return (NSURL *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRedirectURL:(id)a3
{
}

- (BOOL)shouldContinueTouchIDSession
{
  return self->_shouldContinueTouchIDSession;
}

- (void)setShouldContinueTouchIDSession:(BOOL)a3
{
  self->_shouldContinueTouchIDSession = a3;
}

- (BOOL)shouldSendFallbackHeader
{
  return self->_shouldSendFallbackHeader;
}

- (void)setShouldSendFallbackHeader:(BOOL)a3
{
  self->_shouldSendFallbackHeader = a3;
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSignature:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)xAppleAMDHeader
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setXAppleAMDHeader:(id)a3
{
}

- (NSString)xAppleAMDMHeader
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setXAppleAMDMHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xAppleAMDMHeader, 0);
  objc_storeStrong((id *)&self->_xAppleAMDHeader, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_paymentTokenData, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_fpanID, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong((id *)&self->_consolidatedDialog, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end