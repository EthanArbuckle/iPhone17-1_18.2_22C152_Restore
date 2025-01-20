@interface MFSecureMIMECompositionManager
+ (BOOL)isRevokedCertificate:(__SecCertificate *)a3 sendingAddress:(id)a4;
+ (__SecIdentity)copyEncryptionIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5;
+ (__SecIdentity)copySigningIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5;
+ (id)copyEncryptionCertificatesForAccount:(id)a3 recipientAddress:(id)a4 error:(id *)a5;
- (BOOL)_shouldAllowSend_nts;
- (BOOL)_shouldEncrypt_nts;
- (BOOL)_shouldSign_nts;
- (BOOL)_updateEncryptionStatus_nts;
- (BOOL)_updateSigningStatus_nts;
- (BOOL)shouldAllowSend;
- (MFSecureMIMECompositionManager)init;
- (MFSecureMIMECompositionManager)initWithSendingAccount:(id)a3 signingPolicy:(int)a4 encryptionPolicy:(int)a5;
- (MFSecureMIMECompositionManager)initWithSigningPolicy:(int)a3 encryptionPolicy:(int)a4;
- (MFSecureMIMECompositionManagerDelegate)delegate;
- (MailAccount)sendingAccount;
- (NSSet)recipients;
- (NSString)sendingAddress;
- (id)compositionSpecification;
- (int)encryptionPolicy;
- (int)encryptionStatus;
- (int)signingPolicy;
- (int)signingStatus;
- (void)_determineEncryptionStatusWithNewRecipients:(id)a3;
- (void)_determineEncryptionStatusWithSendingAddress:(id)a3;
- (void)_determineIdentitiesWithSendingAddress:(id)a3 forSigning:(BOOL)a4 encryption:(BOOL)a5;
- (void)_determineRevocationStatusWithIdentity:(__SecIdentity *)a3 sendingAddress:(id)a4;
- (void)_determineSigningStatusWithSendingAddress:(id)a3;
- (void)_notifyDelegateEncryptionStatusDidChange:(int)a3 certsByRecipient:(id)a4 errorsByRecipient:(id)a5 identity:(__SecIdentity *)a6 error:(id)a7;
- (void)_notifyDelegateSigningStatusDidChange:(int)a3 identity:(__SecIdentity *)a4 error:(id)a5;
- (void)_nts_copyEncryptionIdentity:(__SecIdentity *)a3 error:(id *)a4 certificatesByRecipient:(id *)a5 errorsByRecipient:(id *)a6;
- (void)_nts_copySigningIdentity:(__SecIdentity *)a3 error:(id *)a4;
- (void)_nts_setEncryptionIdentity:(__SecIdentity *)a3 error:(id)a4;
- (void)_nts_setSigningIdentity:(__SecIdentity *)a3 error:(id)a4;
- (void)addRecipients:(id)a3;
- (void)compositionSpecification;
- (void)dealloc;
- (void)invalidate;
- (void)removeRecipients:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSendingAddress:(id)a3;
@end

@implementation MFSecureMIMECompositionManager

- (MFSecureMIMECompositionManager)init
{
  return [(MFSecureMIMECompositionManager *)self initWithSendingAccount:0 signingPolicy:0 encryptionPolicy:0];
}

- (MFSecureMIMECompositionManager)initWithSigningPolicy:(int)a3 encryptionPolicy:(int)a4
{
  return [(MFSecureMIMECompositionManager *)self initWithSendingAccount:0 signingPolicy:*(void *)&a3 encryptionPolicy:*(void *)&a4];
}

- (MFSecureMIMECompositionManager)initWithSendingAccount:(id)a3 signingPolicy:(int)a4 encryptionPolicy:(int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)MFSecureMIMECompositionManager;
  v8 = [(MFSecureMIMECompositionManager *)&v10 init];
  if (v8)
  {
    v8->_lock = (NSLock *)[objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MFSecureMIMECompositionManager_lock" andDelegate:0];
    v8->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilemail.MFSecureMIMECompositionManagerQueue", 0);
    v8->_sendingAccount = (MailAccount *)a3;
    v8->_signingPolicy = a4;
    v8->_encryptionPolicy = a5;
    [(MFSecureMIMECompositionManager *)v8 _updateSigningStatus_nts];
    [(MFSecureMIMECompositionManager *)v8 _updateEncryptionStatus_nts];
  }
  return v8;
}

- (void)dealloc
{
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }

  signingIdentity = self->_signingIdentity;
  if (signingIdentity) {
    CFRelease(signingIdentity);
  }

  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity) {
    CFRelease(encryptionIdentity);
  }

  v6.receiver = self;
  v6.super_class = (Class)MFSecureMIMECompositionManager;
  [(MFSecureMIMECompositionManager *)&v6 dealloc];
}

- (void)addRecipients:(id)a3
{
  if ([a3 count])
  {
    v5 = (void *)[a3 copy];
    [(NSLock *)self->_lock lock];
    if (self->_invalidated)
    {
      [(NSLock *)self->_lock unlock];
    }
    else
    {
      recipients = self->_recipients;
      if (!recipients)
      {
        recipients = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        self->_recipients = recipients;
      }
      [(NSMutableSet *)recipients unionSet:v5];
      int encryptionPolicy = self->_encryptionPolicy;
      if (encryptionPolicy) {
        ++self->_encryptionStatusSemaphore;
      }
      BOOL v8 = [(MFSecureMIMECompositionManager *)self _updateEncryptionStatus_nts];
      uint64_t encryptionStatus = self->_encryptionStatus;
      [(NSLock *)self->_lock unlock];
      if (v8) {
        [(MFSecureMIMECompositionManager *)self _notifyDelegateEncryptionStatusDidChange:encryptionStatus certsByRecipient:0 errorsByRecipient:0 identity:0 error:0];
      }
      if (encryptionPolicy)
      {
        queue = self->_queue;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __48__MFSecureMIMECompositionManager_addRecipients___block_invoke;
        v11[3] = &unk_1E68661E0;
        v11[4] = self;
        v11[5] = v5;
        dispatch_async(queue, v11);
      }
    }
  }
}

uint64_t __48__MFSecureMIMECompositionManager_addRecipients___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineEncryptionStatusWithNewRecipients:*(void *)(a1 + 40)];
}

- (void)removeRecipients:(id)a3
{
  [(NSLock *)self->_lock lock];
  if (self->_invalidated
    || (uint64_t v5 = [a3 allObjects],
        uint64_t v6 = [(NSMutableDictionary *)self->_errorsByRecipient count],
        uint64_t v7 = [(NSMutableDictionary *)self->_certificatesByRecipient count],
        [(NSMutableSet *)self->_recipients minusSet:a3],
        [(NSMutableDictionary *)self->_errorsByRecipient removeObjectsForKeys:v5],
        [(NSMutableDictionary *)self->_certificatesByRecipient removeObjectsForKeys:v5],
        self->_encryptionStatusSemaphore)
    || ![(MFSecureMIMECompositionManager *)self _updateEncryptionStatus_nts]
    && [(NSMutableDictionary *)self->_certificatesByRecipient count] == v7
    && [(NSMutableDictionary *)self->_errorsByRecipient count] == v6)
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
  else
  {
    uint64_t encryptionStatus = self->_encryptionStatus;
    if ([(NSMutableDictionary *)self->_errorsByRecipient count]) {
      id v10 = (id)[(NSMutableDictionary *)self->_errorsByRecipient copy];
    }
    else {
      id v10 = 0;
    }
    if ([(NSMutableDictionary *)self->_certificatesByRecipient count]) {
      id v11 = (id)[(NSMutableDictionary *)self->_certificatesByRecipient copy];
    }
    else {
      id v11 = 0;
    }
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity)
    {
      CFTypeRef v13 = CFRetain(encryptionIdentity);
      v14 = 0;
    }
    else
    {
      v14 = self->_encryptionIdentityError;
      CFTypeRef v13 = 0;
    }
    [(NSLock *)self->_lock unlock];
    [(MFSecureMIMECompositionManager *)self _notifyDelegateEncryptionStatusDidChange:encryptionStatus certsByRecipient:v11 errorsByRecipient:v10 identity:v13 error:v14];
    if (v13)
    {
      CFRelease(v13);
    }
  }
}

- (void)invalidate
{
  [(NSLock *)self->_lock lock];
  self->_delegate = 0;
  self->_invalidated = 1;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setDelegate:(id)a3
{
  [(NSLock *)self->_lock lock];
  self->_delegate = (MFSecureMIMECompositionManagerDelegate *)a3;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (MFSecureMIMECompositionManagerDelegate)delegate
{
  [(NSLock *)self->_lock lock];
  delegate = self->_delegate;
  [(NSLock *)self->_lock unlock];
  return delegate;
}

- (void)setSendingAddress:(id)a3
{
  [(NSLock *)self->_lock lock];
  if (!self->_invalidated && ![(NSString *)self->_sendingAddress isEqualToString:a3])
  {
    uint64_t v7 = (NSString *)[a3 copy];

    self->_sendingAddress = v7;
    if (self->_signingPolicy) {
      BOOL v9 = v7 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    char v5 = !v9;
    if (!v9) {
      ++self->_signingStatusSemaphore;
    }
    BOOL v10 = [(MFSecureMIMECompositionManager *)self _updateSigningStatus_nts];
    if (self->_encryptionPolicy && self->_sendingAddress)
    {
      ++self->_encryptionStatusSemaphore;
      int v6 = 1;
    }
    else
    {
      int v6 = 0;
    }
    uint64_t signingStatus = self->_signingStatus;
    BOOL v12 = [(MFSecureMIMECompositionManager *)self _updateEncryptionStatus_nts];
    uint64_t encryptionStatus = self->_encryptionStatus;
    [(NSLock *)self->_lock unlock];
    if (v10)
    {
      [(MFSecureMIMECompositionManager *)self _notifyDelegateSigningStatusDidChange:signingStatus identity:0 error:0];
      if (!v12) {
        goto LABEL_4;
      }
    }
    else if (!v12)
    {
      goto LABEL_4;
    }
    [(MFSecureMIMECompositionManager *)self _notifyDelegateEncryptionStatusDidChange:encryptionStatus certsByRecipient:0 errorsByRecipient:0 identity:0 error:0];
    goto LABEL_4;
  }
  [(NSLock *)self->_lock unlock];
  char v5 = 0;
  int v6 = 0;
  uint64_t v7 = 0;
LABEL_4:
  if ((v5 & 1) != 0 || v6)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke;
    v14[3] = &unk_1E6867858;
    v14[4] = self;
    v14[5] = v7;
    char v15 = v5;
    char v16 = v6;
    v14[6] = a3;
    dispatch_async(queue, v14);
  }
}

uint64_t __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _determineIdentitiesWithSendingAddress:*(void *)(a1 + 40) forSigning:*(unsigned __int8 *)(a1 + 56) encryption:1];
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t result = [*(id *)(a1 + 32) _determineSigningStatusWithSendingAddress:*(void *)(a1 + 40)];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    return [v3 _determineEncryptionStatusWithSendingAddress:v4];
  }
  return result;
}

- (NSString)sendingAddress
{
  [(NSLock *)self->_lock lock];
  sendingAddress = self->_sendingAddress;
  [(NSLock *)self->_lock unlock];
  return sendingAddress;
}

- (MailAccount)sendingAccount
{
  return self->_sendingAccount;
}

- (int)signingPolicy
{
  return self->_signingPolicy;
}

- (int)encryptionPolicy
{
  return self->_encryptionPolicy;
}

- (void)_determineIdentitiesWithSendingAddress:(id)a3 forSigning:(BOOL)a4 encryption:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v9 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  if (a4)
  {
    BOOL v9 = (const void *)[(id)objc_opt_class() copySigningIdentityForAccount:self->_sendingAccount sendingAddress:a3 error:&v12];
    if (v5) {
      goto LABEL_3;
    }
  }
  else if (a5)
  {
LABEL_3:
    BOOL v10 = (const void *)[(id)objc_opt_class() copyEncryptionIdentityForAccount:self->_sendingAccount sendingAddress:a3 error:&v11];
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_6:
  [(NSLock *)self->_lock lock];
  if (!self->_invalidated)
  {
    if (v6) {
      [(MFSecureMIMECompositionManager *)self _nts_setSigningIdentity:v9 error:v12];
    }
    if (v5) {
      [(MFSecureMIMECompositionManager *)self _nts_setEncryptionIdentity:v10 error:v11];
    }
  }
  [(NSLock *)self->_lock unlock];
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
}

- (void)_determineRevocationStatusWithIdentity:(__SecIdentity *)a3 sendingAddress:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  SecCertificateRef certificateRef = 0;
  SecIdentityCopyCertificate(a3, &certificateRef);
  if (certificateRef)
  {
    if ([(id)objc_opt_class() isRevokedCertificate:certificateRef sendingAddress:a4])
    {
      uint64_t v7 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1052 localizedDescription:0];
      [(NSLock *)self->_lock lock];
      if (!self->_signingStatusSemaphore
        && (signingIdentity = self->_signingIdentity) != 0
        && CFEqual(a3, signingIdentity))
      {
        [(MFSecureMIMECompositionManager *)self _nts_setSigningIdentity:0 error:v7];
        BOOL v10 = [(MFSecureMIMECompositionManager *)self _updateSigningStatus_nts];
        int signingStatus = self->_signingStatus;
        [(NSLock *)self->_lock unlock];
        if (v10)
        {
          queue = self->_queue;
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __88__MFSecureMIMECompositionManager__determineRevocationStatusWithIdentity_sendingAddress___block_invoke;
          v13[3] = &unk_1E6867880;
          int v14 = signingStatus;
          v13[4] = self;
          v13[5] = v7;
          dispatch_async(queue, v13);
        }
      }
      else
      {
        [(NSLock *)self->_lock unlock];
      }
    }
  }
  else
  {
    BOOL v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = a4;
      _os_log_impl(&dword_1CFCFE000, v8, OS_LOG_TYPE_INFO, "#SMIMEErrors SecIdentityCopyCertificate could not find certificate for %@", buf, 0xCu);
    }
  }
}

uint64_t __88__MFSecureMIMECompositionManager__determineRevocationStatusWithIdentity_sendingAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyDelegateSigningStatusDidChange:*(unsigned int *)(a1 + 48) identity:0 error:*(void *)(a1 + 40)];
}

- (void)_determineSigningStatusWithSendingAddress:(id)a3
{
  CFTypeRef v11 = 0;
  uint64_t v12 = 0;
  [(NSLock *)self->_lock lock];
  unint64_t signingStatusSemaphore = self->_signingStatusSemaphore;
  if (!signingStatusSemaphore) {
    -[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:]();
  }
  self->_unint64_t signingStatusSemaphore = signingStatusSemaphore - 1;
  if (self->_invalidated
    || ([(MFSecureMIMECompositionManager *)self _nts_copySigningIdentity:&v11 error:&v12], self->_signingStatusSemaphore))
  {
    [(NSLock *)self->_lock unlock];
  }
  else
  {
    CFTypeRef v6 = v11;
    if (v11)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke;
      block[3] = &unk_1E68678A8;
      block[5] = a3;
      block[6] = v6;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
    BOOL v8 = [(MFSecureMIMECompositionManager *)self _updateSigningStatus_nts];
    uint64_t signingStatus = self->_signingStatus;
    [(NSLock *)self->_lock unlock];
    if (v8) {
      [(MFSecureMIMECompositionManager *)self _notifyDelegateSigningStatusDidChange:signingStatus identity:v11 error:v12];
    }
  }
  if (v11) {
    CFRelease(v11);
  }
}

uint64_t __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _determineRevocationStatusWithIdentity:*(void *)(a1 + 48) sendingAddress:*(void *)(a1 + 40)];
}

- (void)_notifyDelegateSigningStatusDidChange:(int)a3 identity:(__SecIdentity *)a4 error:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  v17[1] = *MEMORY[0x1E4F143B8];
  BOOL v9 = [(MFSecureMIMECompositionManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (a4)
    {
      char v16 = @"IdentityRef";
      v17[0] = a4;
      BOOL v10 = (void *)MEMORY[0x1E4F1C9E8];
      CFTypeRef v11 = (id *)v17;
      uint64_t v12 = &v16;
    }
    else
    {
      if (!a5)
      {
        uint64_t v13 = 0;
        goto LABEL_7;
      }
      int v14 = @"IdentityError";
      id v15 = a5;
      BOOL v10 = (void *)MEMORY[0x1E4F1C9E8];
      CFTypeRef v11 = &v15;
      uint64_t v12 = &v14;
    }
    uint64_t v13 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:1];
LABEL_7:
    [(MFSecureMIMECompositionManagerDelegate *)v9 secureMIMECompositionManager:self signingStatusDidChange:v7 context:v13];
  }
}

- (BOOL)_updateSigningStatus_nts
{
  int signingStatus = self->_signingStatus;
  if (self->_signingPolicy)
  {
    if (self->_signingStatusSemaphore) {
      int v3 = 1;
    }
    else {
      int v3 = 2 * (self->_signingIdentity == 0);
    }
  }
  else
  {
    int v3 = 2;
  }
  self->_int signingStatus = v3;
  return signingStatus != v3;
}

- (void)_nts_setSigningIdentity:(__SecIdentity *)a3 error:(id)a4
{
  signingIdentity = self->_signingIdentity;
  if (signingIdentity != a3)
  {
    if (signingIdentity) {
      CFRelease(signingIdentity);
    }
    if (a3) {
      BOOL v8 = (__SecIdentity *)CFRetain(a3);
    }
    else {
      BOOL v8 = 0;
    }
    self->_signingIdentity = v8;
  }
  signingIdentityError = self->_signingIdentityError;
  if (signingIdentityError != a4)
  {

    self->_signingIdentityError = (MFError *)a4;
  }
}

- (void)_nts_copySigningIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  if (a3)
  {
    signingIdentity = self->_signingIdentity;
    if (signingIdentity) {
      signingIdentity = (void *)CFRetain(signingIdentity);
    }
    *a3 = (__SecIdentity *)signingIdentity;
  }
  if (a4) {
    *a4 = self->_signingIdentityError;
  }
}

- (int)signingStatus
{
  [(NSLock *)self->_lock lock];
  int signingStatus = self->_signingStatus;
  [(NSLock *)self->_lock unlock];
  return signingStatus;
}

- (void)_determineEncryptionStatusWithSendingAddress:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  CFTypeRef cf = 0;
  uint64_t v10 = 0;
  [(NSLock *)self->_lock lock];
  unint64_t encryptionStatusSemaphore = self->_encryptionStatusSemaphore;
  if (!encryptionStatusSemaphore) {
    -[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:]();
  }
  unint64_t v5 = encryptionStatusSemaphore - 1;
  self->_unint64_t encryptionStatusSemaphore = v5;
  if (v5) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = !self->_invalidated;
  }
  if (v6 && [(MFSecureMIMECompositionManager *)self _updateEncryptionStatus_nts])
  {
    uint64_t encryptionStatus = self->_encryptionStatus;
    [(MFSecureMIMECompositionManager *)self _nts_copyEncryptionIdentity:&cf error:&v10 certificatesByRecipient:&v11 errorsByRecipient:&v12];
    [(NSLock *)self->_lock unlock];
    [(MFSecureMIMECompositionManager *)self _notifyDelegateEncryptionStatusDidChange:encryptionStatus certsByRecipient:v11 errorsByRecipient:v12 identity:cf error:v10];
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    lock = self->_lock;
    [(NSLock *)lock unlock];
  }
}

- (void)_determineEncryptionStatusWithNewRecipients:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  uint64_t v35 = 0;
  CFTypeRef cf = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v30 = 0;
        uint64_t v12 = [(id)objc_opt_class() copyEncryptionCertificatesForAccount:self->_sendingAccount recipientAddress:v11 error:&v30];
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          [v5 setObject:v12 forKey:v11];
        }
        else if (v30)
        {
          [v6 setObject:v30 forKey:v11];
        }
      }
      uint64_t v8 = [a3 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v8);
  }
  [(NSLock *)self->_lock lock];
  unint64_t encryptionStatusSemaphore = self->_encryptionStatusSemaphore;
  if (!encryptionStatusSemaphore) {
    -[MFSecureMIMECompositionManager _determineEncryptionStatusWithNewRecipients:]();
  }
  self->_unint64_t encryptionStatusSemaphore = encryptionStatusSemaphore - 1;
  if (self->_invalidated) {
    goto LABEL_26;
  }
  id v15 = (void *)[a3 mutableCopy];
  [v15 minusSet:self->_recipients];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        [v5 removeObjectForKey:v20];
        [v6 removeObjectForKey:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v39 count:16];
    }
    while (v17);
  }

  errorsByRecipient = self->_errorsByRecipient;
  if (!errorsByRecipient)
  {
    errorsByRecipient = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_errorsByRecipient = errorsByRecipient;
  }
  [(NSMutableDictionary *)errorsByRecipient addEntriesFromDictionary:v6];
  certificatesByRecipient = self->_certificatesByRecipient;
  if (!certificatesByRecipient)
  {
    certificatesByRecipient = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    self->_certificatesByRecipient = certificatesByRecipient;
  }
  [(NSMutableDictionary *)certificatesByRecipient addEntriesFromDictionary:v5];
  if (self->_encryptionStatusSemaphore)
  {
LABEL_26:
    int v23 = 0;
    uint64_t encryptionStatus = 1;
  }
  else
  {
    BOOL v25 = [(MFSecureMIMECompositionManager *)self _updateEncryptionStatus_nts];
    uint64_t encryptionStatus = self->_encryptionStatus;
    if (v25)
    {
      [(MFSecureMIMECompositionManager *)self _nts_copyEncryptionIdentity:&cf error:&v35 certificatesByRecipient:&v37 errorsByRecipient:&v38];
      int v23 = 1;
    }
    else
    {
      int v23 = 0;
    }
  }
  [(NSLock *)self->_lock unlock];

  if (v23) {
    [(MFSecureMIMECompositionManager *)self _notifyDelegateEncryptionStatusDidChange:encryptionStatus certsByRecipient:v37 errorsByRecipient:v38 identity:cf error:v35];
  }
  if (cf) {
    CFRelease(cf);
  }
}

- (BOOL)_updateEncryptionStatus_nts
{
  int encryptionStatus = self->_encryptionStatus;
  if (!self->_encryptionPolicy) {
    goto LABEL_7;
  }
  if (!self->_encryptionStatusSemaphore)
  {
    if (self->_encryptionIdentity)
    {
      uint64_t v5 = [(NSMutableSet *)self->_recipients count];
      if (v5 == [(NSMutableDictionary *)self->_certificatesByRecipient count])
      {
        int v4 = 0;
        goto LABEL_8;
      }
    }
LABEL_7:
    int v4 = 2;
    goto LABEL_8;
  }
  int v4 = 1;
LABEL_8:
  self->_int encryptionStatus = v4;
  return encryptionStatus != v4;
}

- (void)_nts_setEncryptionIdentity:(__SecIdentity *)a3 error:(id)a4
{
  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity != a3)
  {
    if (encryptionIdentity) {
      CFRelease(encryptionIdentity);
    }
    if (a3) {
      uint64_t v8 = (__SecIdentity *)CFRetain(a3);
    }
    else {
      uint64_t v8 = 0;
    }
    self->_encryptionIdentity = v8;
  }
  encryptionIdentityError = self->_encryptionIdentityError;
  if (encryptionIdentityError != a4)
  {

    self->_encryptionIdentityError = (MFError *)a4;
  }
}

- (void)_nts_copyEncryptionIdentity:(__SecIdentity *)a3 error:(id *)a4 certificatesByRecipient:(id *)a5 errorsByRecipient:(id *)a6
{
  if (a3)
  {
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity) {
      encryptionIdentity = (void *)CFRetain(encryptionIdentity);
    }
    *a3 = (__SecIdentity *)encryptionIdentity;
  }
  if (a4) {
    *a4 = self->_encryptionIdentityError;
  }
  if (a5)
  {
    id v12 = (id)[(NSMutableDictionary *)self->_certificatesByRecipient count];
    if (v12) {
      id v12 = (id)[(NSMutableDictionary *)self->_certificatesByRecipient copy];
    }
    *a5 = v12;
  }
  if (a6)
  {
    id v13 = (id)[(NSMutableDictionary *)self->_errorsByRecipient count];
    if (v13) {
      id v13 = (id)[(NSMutableDictionary *)self->_errorsByRecipient copy];
    }
    *a6 = v13;
  }
}

- (void)_notifyDelegateEncryptionStatusDidChange:(int)a3 certsByRecipient:(id)a4 errorsByRecipient:(id)a5 identity:(__SecIdentity *)a6 error:(id)a7
{
  uint64_t v11 = *(void *)&a3;
  id v13 = [(MFSecureMIMECompositionManager *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v15 = v14;
  if (a4) {
    [v14 setObject:a4 forKey:@"CertificatesByRecipient"];
  }
  if (a5) {
    [v15 setObject:a5 forKey:@"ErrorsByRecipient"];
  }
  if (a6)
  {
    uint64_t v16 = @"IdentityRef";
    uint64_t v17 = v15;
    uint64_t v18 = a6;
LABEL_11:
    [v17 setObject:v18 forKey:v16];
    goto LABEL_12;
  }
  if (a7)
  {
    uint64_t v16 = @"IdentityError";
    uint64_t v17 = v15;
    uint64_t v18 = a7;
    goto LABEL_11;
  }
LABEL_12:
  if ([v15 count])
  {
    id v19 = v15;
  }
  else
  {

    id v15 = 0;
  }
  [(MFSecureMIMECompositionManagerDelegate *)v13 secureMIMECompositionManager:self encryptionStatusDidChange:v11 context:v15];
}

- (int)encryptionStatus
{
  [(NSLock *)self->_lock lock];
  int encryptionStatus = self->_encryptionStatus;
  [(NSLock *)self->_lock unlock];
  return encryptionStatus;
}

- (NSSet)recipients
{
  [(NSLock *)self->_lock lock];
  int v3 = (NSSet *)(id)[(NSMutableSet *)self->_recipients copy];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (id)compositionSpecification
{
  [(NSLock *)self->_lock lock];
  if (*(_OWORD *)&self->_encryptionStatusSemaphore == 0
    && [(MFSecureMIMECompositionManager *)self _shouldAllowSend_nts])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v4 = [(MFSecureMIMECompositionManager *)self _shouldSign_nts];
    BOOL v5 = [(MFSecureMIMECompositionManager *)self _shouldEncrypt_nts];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v4), @"ShouldSign");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v5), @"ShouldEncrypt");
    if (v4)
    {
      signingIdentity = self->_signingIdentity;
      if (!signingIdentity) {
        -[MFSecureMIMECompositionManager compositionSpecification]();
      }
      [v3 setObject:signingIdentity forKeyedSubscript:@"SigningIdentity"];
      encryptionIdentity = self->_encryptionIdentity;
      if (encryptionIdentity) {
        [v3 setObject:encryptionIdentity forKeyedSubscript:@"EncryptionIdentity"];
      }
    }
    if (v5)
    {
      uint64_t v8 = self->_encryptionIdentity;
      if (!v8) {
        -[MFSecureMIMECompositionManager compositionSpecification]();
      }
      [v3 setObject:v8 forKeyedSubscript:@"EncryptionIdentity"];
      if ([(NSMutableDictionary *)self->_certificatesByRecipient count])
      {
        uint64_t v9 = (void *)[(NSMutableDictionary *)self->_certificatesByRecipient copy];
        [v3 setObject:v9 forKeyedSubscript:@"RecipientCertificates"];
      }
    }
  }
  else
  {
    id v3 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)shouldAllowSend
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = [(MFSecureMIMECompositionManager *)self _shouldAllowSend_nts];
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)_shouldSign_nts
{
  return self->_signingPolicy && self->_signingStatus == 0;
}

- (BOOL)_shouldEncrypt_nts
{
  return self->_encryptionPolicy && self->_encryptionStatus == 0;
}

- (BOOL)_shouldAllowSend_nts
{
  if (self->_signingPolicy == 2 && self->_signingStatus) {
    return 0;
  }
  if (self->_encryptionPolicy == 2) {
    return self->_encryptionStatus == 0;
  }
  return 1;
}

+ (__SecIdentity)copySigningIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v7 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", [a3 signingIdentityPersistentReferenceForAddress:a4], &v11);
  uint64_t v8 = v7;
  if (a5 && !v7)
  {
    if (v11)
    {
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v13[0] = v11;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    *a5 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1052, [NSString stringWithFormat:MFLookupLocalizedString(@"SMIME_MISSING_SIGNING_IDENTITY_FORMAT", @"You can’t send signed messages because a signing identity for the address “%@” could not be found.  Go to the Advanced settings for this account to choose a signing identity.", @"Delayed", a4], 0, v9);
  }
  return v8;
}

+ (__SecIdentity)copyEncryptionIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  uint64_t v7 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", [a3 encryptionIdentityPersistentReferenceForAddress:a4], &v11);
  uint64_t v8 = v7;
  if (a5 && !v7)
  {
    if (v11)
    {
      uint64_t v12 = *MEMORY[0x1E4F28A50];
      v13[0] = v11;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    *a5 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", @"MFMessageErrorDomain", 1052, [NSString stringWithFormat:MFLookupLocalizedString(@"SMIME_MISSING_ENCRYPTION_IDENTITY_FORMAT", @"You can’t send encrypted messages because an encryption identity for the address “%@” could not be found.  Go to the Advanced settings for this account to choose an encryption identity.", @"Delayed", a4], 0, v9);
  }
  return v8;
}

+ (id)copyEncryptionCertificatesForAccount:(id)a3 recipientAddress:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v27 = 0;
  uint64_t v7 = (void *)[a3 copyDataForRemoteEncryptionCertificatesForAddress:a4 error:&v27];
  if ([v7 count])
  {
    v22 = a5;
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v7);
          }
          CFDataRef v13 = *(const __CFData **)(*((void *)&v23 + 1) + 8 * i);
          SecCertificateRef v14 = SecCertificateCreateWithData(0, v13);
          if (v14)
          {
            SecCertificateRef v15 = v14;
            long long v27 = checkCertificateExpiration((uint64_t)v14, (uint64_t)a4);
            if (!v27) {
              [v8 addObject:v15];
            }
            CFRelease(v15);
          }
          else
          {
            uint64_t v16 = MFLogGeneral();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v13;
              _os_log_impl(&dword_1CFCFE000, v16, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCertificateCreateWithData() failed for %@", buf, 0xCu);
            }
            long long v27 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:MFLookupLocalizedString(@"MIME_GENERIC_REMOTE_ENCRYPTION_CERT_MESSAGE", @"An error occurred while retrieving the encryption certificate.", @"Delayed") title:0 userInfo:0];
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v10);
    }
    if (![v8 count])
    {

      uint64_t v8 = 0;
    }
    a5 = v22;
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v17 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:a4 error:buf];
    if (v17)
    {
      uint64_t v18 = v17;
      long long v27 = checkCertificateExpiration((uint64_t)v17, (uint64_t)a4);
      if (v27) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v18, 0);
      }
      CFRelease(v18);
    }
    else if (v27)
    {
      uint64_t v8 = 0;
    }
    else
    {
      if (*(void *)buf)
      {
        uint64_t v28 = *MEMORY[0x1E4F28A50];
        uint64_t v29 = *(void *)buf;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        uint64_t v21 = [NSString stringWithFormat:MFLookupLocalizedString(@"SMIME_OTHER_ENCRYPTION_CERT_ERROR_MESSAGE", @"An error occurred while searching for an encryption certificate for “%@” in your keychain.", @"Delayed", a4];
      }
      else
      {
        uint64_t v21 = [NSString stringWithFormat:MFLookupLocalizedString(@"SMIME_MISSING_ENCRYPTION_CERT_MESSAGE", @"You can’t send encrypted messages because an encryption certificate for the address “%@” could not be found.", @"Delayed", a4];
        uint64_t v20 = 0;
      }
      uint64_t v8 = 0;
      long long v27 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v21 title:MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_TITLE", @"Unable to Encrypt", @"Delayed") userInfo:v20];
    }
  }

  if (a5 && !v8 && v27) {
    *a5 = v27;
  }
  return v8;
}

+ (BOOL)isRevokedCertificate:(__SecCertificate *)a3 sendingAddress:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v7 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:a4];
  if (v7)
  {
    uint64_t v8 = v7;
    [v6 addObject:v7];
    CFRelease(v8);
  }
  SecPolicyRef Revocation = SecPolicyCreateRevocation(3uLL);
  if (Revocation)
  {
    SecPolicyRef v10 = Revocation;
    [v6 addObject:Revocation];
    CFRelease(v10);
  }
  SecTrustRef trust = 0;
  OSStatus v11 = SecTrustCreateWithCertificates(a3, v6, &trust);

  if (v11) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = trust == 0;
  }
  if (v12)
  {
    CFDataRef v13 = MFLogGeneral();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      +[MFSecureMIMECompositionManager isRevokedCertificate:sendingAddress:](v11, v13);
LABEL_15:
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    int v15 = MEMORY[0x1D25DD520]();
    CFRelease(trust);
    uint64_t v16 = MFLogGeneral();
    uint64_t v17 = v16;
    if (v15)
    {
      BOOL v14 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v14)
      {
        +[MFSecureMIMECompositionManager isRevokedCertificate:sendingAddress:](v15, v17);
        goto LABEL_15;
      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v21 = 0;
        _os_log_impl(&dword_1CFCFE000, v17, OS_LOG_TYPE_INFO, "#SMIMEErrors Revocation check succeeded (SecTrustResultType: %d)", buf, 8u);
      }
      LOBYTE(v14) = 1;
    }
  }
  return v14;
}

- (void)_determineSigningStatusWithSendingAddress:.cold.1()
{
}

- (void)_determineEncryptionStatusWithSendingAddress:.cold.1()
{
}

- (void)_determineEncryptionStatusWithNewRecipients:.cold.1()
{
}

- (void)compositionSpecification
{
}

+ (void)isRevokedCertificate:(int)a1 sendingAddress:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "#SMIMEErrors Revocation check failed with status %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)isRevokedCertificate:(int)a1 sendingAddress:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %ld", (uint8_t *)&v2, 0xCu);
}

@end