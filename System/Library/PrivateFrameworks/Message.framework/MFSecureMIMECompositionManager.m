@interface MFSecureMIMECompositionManager
+ (__SecIdentity)copyEncryptionIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5;
+ (__SecIdentity)copySigningIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5;
+ (id)copyEncryptionCertificatesForAccount:(id)a3 recipientAddresses:(id)a4 errorsByAddress:(id *)a5;
+ (unsigned)evaluateTrustForSigningCertificate:(__SecCertificate *)a3 sendingAddress:(id)a4;
- (BOOL)_updateEncryptionStatus_nts;
- (BOOL)shouldAllowSend;
- (MFSecureMIMECompositionManager)init;
- (MFSecureMIMECompositionManager)initWithSendingAccount:(id)a3 signingPolicy:(int64_t)a4 encryptionPolicy:(int64_t)a5;
- (MFSecureMIMECompositionManager)initWithSigningPolicy:(int64_t)a3 encryptionPolicy:(int64_t)a4;
- (MFSecureMIMECompositionManagerDelegate)delegate;
- (MailAccount)sendingAccount;
- (NSSet)recipients;
- (NSString)sendingAddress;
- (id)compositionSpecification;
- (int64_t)encryptionPolicy;
- (int64_t)encryptionStatus;
- (int64_t)signingPolicy;
- (int64_t)signingStatus;
- (void)_determineEncryptionStatusWithNewRecipients:(uint64_t)a1;
- (void)_determineEncryptionStatusWithSendingAddress:(uint64_t)a1;
- (void)_determineIdentitiesWithSendingAddress:(int)a3 forSigning:(int)a4 encryption:;
- (void)_determineSigningStatusWithSendingAddress:(uint64_t)a1;
- (void)_determineTrustStatusForSigningIdentity:(void *)a3 sendingAddress:;
- (void)_notifyDelegateEncryptionStatusDidChange:(void *)a3 certsByRecipient:(void *)a4 errorsByRecipient:(id)a5 identity:(void *)a6 error:;
- (void)_notifyDelegateSigningStatusDidChange:(uint64_t)a3 identity:(void *)a4 error:;
- (void)_nts_copyEncryptionIdentity:(void *)a3 error:(void *)a4 certificatesByRecipient:(void *)a5 errorsByRecipient:;
- (void)_nts_setEncryptionIdentity:(void *)a3 error:;
- (void)_nts_setSigningIdentity:(void *)a3 error:;
- (void)addRecipients:(id)a3;
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

- (MFSecureMIMECompositionManager)initWithSigningPolicy:(int64_t)a3 encryptionPolicy:(int64_t)a4
{
  return [(MFSecureMIMECompositionManager *)self initWithSendingAccount:0 signingPolicy:a3 encryptionPolicy:a4];
}

- (MFSecureMIMECompositionManager)initWithSendingAccount:(id)a3 signingPolicy:(int64_t)a4 encryptionPolicy:(int64_t)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MFSecureMIMECompositionManager;
  v10 = [(MFSecureMIMECompositionManager *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MFSecureMIMECompositionManager_lock" andDelegate:0];
    lock = v10->_lock;
    v10->_lock = (NSLock *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.mobilemail.MFSecureMIMECompositionManagerQueue", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_sendingAccount, a3);
    v10->_signingPolicy = a4;
    v10->_encryptionPolicy = a5;
    if (a4)
    {
      if (v10->_signingStatusSemaphore) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 2 * (v10->_signingIdentity == 0);
      }
    }
    else
    {
      uint64_t v15 = 2;
    }
    v10->_signingStatus = v15;
    -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((BOOL)v10);
  }

  return v10;
}

- (BOOL)_updateEncryptionStatus_nts
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 120);
    if (*(void *)(result + 104))
    {
      if (*(void *)(result + 128))
      {
        uint64_t v3 = 1;
LABEL_9:
        *(void *)(v1 + 120) = v3;
        return v2 != v3;
      }
      if (*(void *)(result + 56))
      {
        uint64_t v4 = [*(id *)(result + 72) count];
        if (v4 == [*(id *)(v1 + 88) count])
        {
          uint64_t v3 = 0;
          goto LABEL_9;
        }
      }
    }
    uint64_t v3 = 2;
    goto LABEL_9;
  }
  return result;
}

- (void)dealloc
{
  signingIdentity = self->_signingIdentity;
  if (signingIdentity) {
    CFRelease(signingIdentity);
  }
  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity) {
    CFRelease(encryptionIdentity);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFSecureMIMECompositionManager;
  [(MFSecureMIMECompositionManager *)&v5 dealloc];
}

- (void)addRecipients:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    objc_super v5 = (void *)[v4 copy];
    [(NSLock *)self->_lock lock];
    if (self->_invalidated)
    {
      BOOL updated = 0;
      BOOL v7 = 0;
      int64_t encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
    }
    else
    {
      recipients = self->_recipients;
      if (!recipients)
      {
        v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        uint64_t v11 = self->_recipients;
        self->_recipients = v10;

        recipients = self->_recipients;
      }
      [(NSMutableSet *)recipients unionSet:v5];
      int64_t encryptionPolicy = self->_encryptionPolicy;
      BOOL v7 = encryptionPolicy != 0;
      if (encryptionPolicy) {
        ++self->_encryptionStatusSemaphore;
      }
      BOOL updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((BOOL)self);
      int64_t encryptionStatus = self->_encryptionStatus;
    }
    [(NSLock *)self->_lock unlock];
    if (updated) {
      -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, encryptionStatus, 0, 0, 0, 0);
    }
    if (v7)
    {
      queue = self->_queue;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__MFSecureMIMECompositionManager_addRecipients___block_invoke;
      v14[3] = &unk_1E5D3B6E0;
      v14[4] = self;
      id v15 = v5;
      dispatch_async(queue, v14);
    }
  }
}

- (void)_notifyDelegateEncryptionStatusDidChange:(void *)a3 certsByRecipient:(void *)a4 errorsByRecipient:(id)a5 identity:(void *)a6 error:
{
  id v16 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a1)
  {
    dispatch_queue_t v13 = [a1 delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v16) {
      [v14 setObject:v16 forKey:@"CertificatesByRecipient"];
    }
    if (v11) {
      [v14 setObject:v11 forKey:@"ErrorsByRecipient"];
    }
    if (a5)
    {
      id v15 = @"IdentityRef";
    }
    else
    {
      if (!v12)
      {
LABEL_12:
        if (![v14 count])
        {

          id v14 = 0;
        }
        [v13 secureMIMECompositionManager:a1 encryptionStatusDidChange:a2 context:v14];

        goto LABEL_15;
      }
      id v15 = @"IdentityError";
      a5 = v12;
    }
    [v14 setObject:a5 forKey:v15];
    goto LABEL_12;
  }
LABEL_16:
}

void __48__MFSecureMIMECompositionManager_addRecipients___block_invoke(uint64_t a1)
{
}

- (void)_determineEncryptionStatusWithNewRecipients:(uint64_t)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  if (a1)
  {
    CFTypeRef cf = 0;
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 24);
    objc_super v5 = [v29 allObjects];
    id v37 = 0;
    v6 = (void *)[v3 copyEncryptionCertificatesForAccount:v4 recipientAddresses:v5 errorsByAddress:&v37];
    id v7 = v37;
    v8 = (void *)[v6 mutableCopy];

    id v9 = (void *)[v7 mutableCopy];
    [*(id *)(a1 + 8) lock];
    uint64_t v10 = *(void *)(a1 + 128);
    if (!v10) {
      __assert_rtn("-[MFSecureMIMECompositionManager _determineEncryptionStatusWithNewRecipients:]", "MFSecureMIMECompositionManager.m", 571, "_encryptionStatusSemaphore > 0");
    }
    *(void *)(a1 + 128) = v10 - 1;
    if (*(unsigned char *)(a1 + 144))
    {
      int v11 = 0;
      id v12 = 0;
      id v13 = 0;
      id v14 = 0;
      uint64_t v15 = 1;
    }
    else
    {
      id v16 = (void *)[v29 mutableCopy];
      [v16 minusSet:*(void *)(a1 + 72)];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            objc_msgSend(v8, "removeObjectForKey:", v21, v29);
            [v9 removeObjectForKey:v21];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v18);
      }

      v22 = *(void **)(a1 + 80);
      if (!v22)
      {
        id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v24 = *(void **)(a1 + 80);
        *(void *)(a1 + 80) = v23;

        v22 = *(void **)(a1 + 80);
      }
      objc_msgSend(v22, "addEntriesFromDictionary:", v9, v29);
      v25 = *(void **)(a1 + 88);
      if (!v25)
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v27 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = v26;

        v25 = *(void **)(a1 + 88);
      }
      [v25 addEntriesFromDictionary:v8];
      if (*(void *)(a1 + 128))
      {
        int v11 = 0;
        id v12 = 0;
        id v13 = 0;
        id v14 = 0;
        uint64_t v15 = 1;
      }
      else
      {
        BOOL updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](a1);
        uint64_t v15 = *(void *)(a1 + 120);
        if (updated)
        {
          id v31 = 0;
          id v32 = 0;
          id v30 = 0;
          -[MFSecureMIMECompositionManager _nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:](a1, &cf, &v32, &v31, &v30);
          id v14 = v32;
          id v13 = v31;
          id v12 = v30;
          int v11 = 1;
        }
        else
        {
          int v11 = 0;
          id v12 = 0;
          id v13 = 0;
          id v14 = 0;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 8), "unlock", v29);
    if (v11) {
      -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:]((void *)a1, v15, v13, v12, (id)cf, v14);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (void)removeRecipients:(id)a3
{
  id v15 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_invalidated)
  {
    int v4 = 0;
    objc_super v5 = 0;
    v6 = 0;
    id v7 = 0;
    v8 = 0;
    int64_t encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_21;
  }
  uint64_t v10 = [v15 allObjects];
  uint64_t v11 = [(NSMutableDictionary *)self->_errorsByRecipient count];
  uint64_t v12 = [(NSMutableDictionary *)self->_certificatesByRecipient count];
  [(NSMutableSet *)self->_recipients minusSet:v15];
  [(NSMutableDictionary *)self->_errorsByRecipient removeObjectsForKeys:v10];
  [(NSMutableDictionary *)self->_certificatesByRecipient removeObjectsForKeys:v10];
  if (!self->_encryptionStatusSemaphore)
  {
    if (-[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((BOOL)self)
      || [(NSMutableDictionary *)self->_certificatesByRecipient count] != v12)
    {
      int64_t encryptionStatus = self->_encryptionStatus;
    }
    else
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_errorsByRecipient count];
      int64_t encryptionStatus = self->_encryptionStatus;
      if (v13 == v11)
      {
        int v4 = 0;
        objc_super v5 = 0;
        v6 = 0;
        id v7 = 0;
        v8 = 0;
        goto LABEL_20;
      }
    }
    if ([(NSMutableDictionary *)self->_errorsByRecipient count]) {
      objc_super v5 = (void *)[(NSMutableDictionary *)self->_errorsByRecipient copy];
    }
    else {
      objc_super v5 = 0;
    }
    if ([(NSMutableDictionary *)self->_certificatesByRecipient count]) {
      v6 = (void *)[(NSMutableDictionary *)self->_certificatesByRecipient copy];
    }
    else {
      v6 = 0;
    }
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity)
    {
      id v7 = (void *)CFRetain(encryptionIdentity);
      v8 = 0;
    }
    else
    {
      v8 = self->_encryptionIdentityError;
      id v7 = 0;
    }
    int v4 = 1;
    goto LABEL_20;
  }
  int v4 = 0;
  objc_super v5 = 0;
  v6 = 0;
  id v7 = 0;
  v8 = 0;
  int64_t encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
LABEL_20:

LABEL_21:
  [(NSLock *)self->_lock unlock];
  if (v4) {
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, encryptionStatus, v6, v5, v7, v8);
  }
  if (v7) {
    CFRelease(v7);
  }
}

- (void)invalidate
{
  [(NSLock *)self->_lock lock];
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_invalidated = 1;
  lock = self->_lock;
  [(NSLock *)lock unlock];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  [(NSLock *)self->_lock lock];
  objc_storeWeak((id *)&self->_delegate, obj);
  [(NSLock *)self->_lock unlock];
}

- (MFSecureMIMECompositionManagerDelegate)delegate
{
  [(NSLock *)self->_lock lock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [(NSLock *)self->_lock unlock];
  return (MFSecureMIMECompositionManagerDelegate *)WeakRetained;
}

- (void)setSendingAddress:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_invalidated || [(NSString *)self->_sendingAddress isEqualToString:v4])
  {
    BOOL v5 = 0;
    BOOL updated = 0;
    BOOL v7 = 0;
    int v8 = 0;
    id v9 = 0;
    int64_t encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
    int64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  else
  {
    id v9 = (void *)[v4 copy];
    objc_storeStrong((id *)&self->_sendingAddress, v9);
    if (self->_signingPolicy)
    {
      sendingAddress = self->_sendingAddress;
      BOOL v7 = sendingAddress != 0;
      unint64_t signingStatusSemaphore = self->_signingStatusSemaphore;
      if (sendingAddress) {
        self->_unint64_t signingStatusSemaphore = ++signingStatusSemaphore;
      }
      int64_t signingStatus = self->_signingStatus;
      if (signingStatusSemaphore) {
        int64_t v11 = 1;
      }
      else {
        int64_t v11 = 2 * (self->_signingIdentity == 0);
      }
    }
    else
    {
      BOOL v7 = 0;
      int64_t signingStatus = self->_signingStatus;
      int64_t v11 = 2;
    }
    self->_int64_t signingStatus = v11;
    BOOL v5 = signingStatus != v11;
    if (self->_encryptionPolicy && self->_sendingAddress)
    {
      ++self->_encryptionStatusSemaphore;
      int v8 = 1;
    }
    else
    {
      int v8 = 0;
    }
    BOOL updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((BOOL)self);
    int64_t encryptionStatus = self->_encryptionStatus;
  }
  [(NSLock *)self->_lock unlock];
  if (v5) {
    -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:](self, v11, 0, 0);
  }
  if (updated) {
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, encryptionStatus, 0, 0, 0, 0);
  }
  if ((v7 | v8) == 1)
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke;
    v16[3] = &unk_1E5D408F8;
    v16[4] = self;
    id v17 = v9;
    BOOL v19 = v7;
    char v20 = v8;
    id v18 = v4;
    dispatch_async(queue, v16);
  }
}

- (void)_notifyDelegateSigningStatusDidChange:(uint64_t)a3 identity:(void *)a4 error:
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (a1)
  {
    int v8 = [a1 delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (a3)
    {
      id v14 = @"IdentityRef";
      v15[0] = a3;
      id v9 = &v14;
      uint64_t v10 = (id *)v15;
    }
    else
    {
      if (!v7)
      {
        int64_t v11 = 0;
        goto LABEL_8;
      }
      uint64_t v12 = @"IdentityError";
      id v13 = v7;
      id v9 = &v12;
      uint64_t v10 = &v13;
    }
    int64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:1];
LABEL_8:
    [v8 secureMIMECompositionManager:a1 signingStatusDidChange:a2 context:v11];

    goto LABEL_9;
  }
LABEL_10:
}

void __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke(uint64_t a1)
{
  -[MFSecureMIMECompositionManager _determineIdentitiesWithSendingAddress:forSigning:encryption:](*(void *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 1);
  if (*(unsigned char *)(a1 + 56)) {
    -[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  }
  if (*(unsigned char *)(a1 + 57))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(a1 + 48);
    -[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:](v2, v3);
  }
}

- (void)_determineIdentitiesWithSendingAddress:(int)a3 forSigning:(int)a4 encryption:
{
  id v7 = a2;
  if (!a1) {
    goto LABEL_17;
  }
  if (!a3)
  {
    uint64_t v10 = 0;
    id v11 = 0;
    if (!a4) {
      goto LABEL_4;
    }
LABEL_6:
    id v14 = objc_opt_class();
    uint64_t v15 = *(void *)(a1 + 24);
    id v16 = 0;
    id v13 = (const void *)[v14 copyEncryptionIdentityForAccount:v15 sendingAddress:v7 error:&v16];
    id v12 = v16;
    goto LABEL_7;
  }
  int v8 = objc_opt_class();
  uint64_t v9 = *(void *)(a1 + 24);
  id v17 = 0;
  uint64_t v10 = (const void *)[v8 copySigningIdentityForAccount:v9 sendingAddress:v7 error:&v17];
  id v11 = v17;
  if (a4) {
    goto LABEL_6;
  }
LABEL_4:
  id v12 = 0;
  id v13 = 0;
LABEL_7:
  [*(id *)(a1 + 8) lock];
  if (!*(unsigned char *)(a1 + 144))
  {
    if (a3) {
      -[MFSecureMIMECompositionManager _nts_setSigningIdentity:error:](a1, v10, v11);
    }
    if (a4) {
      -[MFSecureMIMECompositionManager _nts_setEncryptionIdentity:error:](a1, v13, v12);
    }
  }
  [*(id *)(a1 + 8) unlock];
  if (v10) {
    CFRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }

LABEL_17:
}

- (void)_determineSigningStatusWithSendingAddress:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_16;
  }
  [*(id *)(a1 + 8) lock];
  uint64_t v4 = *(void *)(a1 + 136);
  if (!v4) {
    __assert_rtn("-[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:]", "MFSecureMIMECompositionManager.m", 417, "_signingStatusSemaphore > 0");
  }
  *(void *)(a1 + 136) = v4 - 1;
  if (*(unsigned char *)(a1 + 144))
  {
    CFTypeRef v5 = 0;
    BOOL v6 = 0;
    id v7 = 0;
  }
  else
  {
    int v8 = *(const void **)(a1 + 40);
    if (v8) {
      CFTypeRef v5 = CFRetain(v8);
    }
    else {
      CFTypeRef v5 = 0;
    }
    id v7 = *(id *)(a1 + 48);
    if (!*(void *)(a1 + 136))
    {
      if (v5)
      {
        uint64_t v10 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke;
        block[3] = &unk_1E5D3D240;
        block[4] = a1;
        CFTypeRef v14 = v5;
        id v13 = v3;
        dispatch_async(v10, block);
      }
      uint64_t v11 = *(void *)(a1 + 112);
      if (*(void *)(a1 + 96))
      {
        if (*(void *)(a1 + 136)) {
          uint64_t v9 = 1;
        }
        else {
          uint64_t v9 = 2 * (*(void *)(a1 + 40) == 0);
        }
      }
      else
      {
        uint64_t v9 = 2;
      }
      *(void *)(a1 + 112) = v9;
      BOOL v6 = v11 != v9;
      goto LABEL_11;
    }
    BOOL v6 = 0;
  }
  uint64_t v9 = 1;
LABEL_11:
  [*(id *)(a1 + 8) unlock];
  if (v6) {
    -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:]((void *)a1, v9, (uint64_t)v5, v7);
  }
  if (v5) {
    CFRelease(v5);
  }

LABEL_16:
}

- (void)_determineEncryptionStatusWithSendingAddress:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    CFTypeRef cf = 0;
    [*(id *)(a1 + 8) lock];
    uint64_t v4 = *(void *)(a1 + 128);
    if (!v4) {
      __assert_rtn("-[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:]", "MFSecureMIMECompositionManager.m", 533, "_encryptionStatusSemaphore > 0");
    }
    id v5 = 0;
    int v6 = 0;
    uint64_t v7 = 1;
    uint64_t v8 = v4 - 1;
    *(void *)(a1 + 128) = v8;
    if (v8)
    {
      id v9 = 0;
      id v10 = 0;
    }
    else
    {
      id v9 = 0;
      id v10 = 0;
      if (!*(unsigned char *)(a1 + 144))
      {
        BOOL updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](a1);
        uint64_t v7 = *(void *)(a1 + 120);
        if (updated)
        {
          id v13 = 0;
          id v14 = 0;
          id v12 = 0;
          -[MFSecureMIMECompositionManager _nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:](a1, &cf, &v14, &v13, &v12);
          id v10 = v14;
          id v9 = v13;
          id v5 = v12;
          int v6 = 1;
        }
        else
        {
          int v6 = 0;
          id v5 = 0;
          id v9 = 0;
          id v10 = 0;
        }
      }
    }
    [*(id *)(a1 + 8) unlock];
    if (v6) {
      -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:]((void *)a1, v7, v9, v5, (id)cf, v10);
    }
    if (cf) {
      CFRelease(cf);
    }
  }
}

- (NSString)sendingAddress
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_sendingAddress;
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (MailAccount)sendingAccount
{
  return self->_sendingAccount;
}

- (int64_t)signingPolicy
{
  return self->_signingPolicy;
}

- (int64_t)encryptionPolicy
{
  return self->_encryptionPolicy;
}

- (void)_nts_setSigningIdentity:(void *)a3 error:
{
  id v6 = a3;
  if (a1)
  {
    id v9 = v6;
    uint64_t v7 = *(const void **)(a1 + 40);
    if (v7 != a2)
    {
      if (v7) {
        CFRelease(v7);
      }
      if (a2) {
        CFTypeRef v8 = CFRetain(a2);
      }
      else {
        CFTypeRef v8 = 0;
      }
      *(void *)(a1 + 40) = v8;
    }
    objc_storeStrong((id *)(a1 + 48), a3);
    id v6 = v9;
  }
}

- (void)_nts_setEncryptionIdentity:(void *)a3 error:
{
  id v6 = a3;
  if (a1)
  {
    id v9 = v6;
    uint64_t v7 = *(const void **)(a1 + 56);
    if (v7 != a2)
    {
      if (v7) {
        CFRelease(v7);
      }
      if (a2) {
        CFTypeRef v8 = CFRetain(a2);
      }
      else {
        CFTypeRef v8 = 0;
      }
      *(void *)(a1 + 56) = v8;
    }
    objc_storeStrong((id *)(a1 + 64), a3);
    id v6 = v9;
  }
}

- (void)_determineTrustStatusForSigningIdentity:(void *)a3 sendingAddress:
{
  id v5 = a3;
  if (a1)
  {
    SecCertificateRef certificateRef = 0;
    OSStatus v6 = SecIdentityCopyCertificate(a2, &certificateRef);
    if (!certificateRef)
    {
      int v12 = v6;
      CFTypeRef v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MFSecureMIMECompositionManager _determineTrustStatusForSigningIdentity:sendingAddress:]((uint64_t)v5, v12, v8);
      }
      goto LABEL_11;
    }
    unsigned int v7 = [(id)objc_opt_class() evaluateTrustForSigningCertificate:certificateRef sendingAddress:v5];
    CFRelease(certificateRef);
    if (v7 <= 7 && ((1 << v7) & 0xCD) != 0)
    {
      CFTypeRef v8 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1052 localizedDescription:0];
      [*(id *)(a1 + 8) lock];
      if (!*(void *)(a1 + 136) && (id v13 = *(const void **)(a1 + 40)) != 0 && CFEqual(a2, v13))
      {
        -[MFSecureMIMECompositionManager _nts_setSigningIdentity:error:](a1, 0, v8);
        uint64_t v14 = *(void *)(a1 + 112);
        if (*(void *)(a1 + 96))
        {
          if (*(void *)(a1 + 136)) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = 2 * (*(void *)(a1 + 40) == 0);
          }
        }
        else
        {
          uint64_t v10 = 2;
        }
        *(void *)(a1 + 112) = v10;
        BOOL v9 = v14 != v10;
      }
      else
      {
        BOOL v9 = 0;
        uint64_t v10 = 1;
      }
      [*(id *)(a1 + 8) unlock];
      if (v9)
      {
        uint64_t v11 = *(NSObject **)(a1 + 16);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        void v15[2] = __89__MFSecureMIMECompositionManager__determineTrustStatusForSigningIdentity_sendingAddress___block_invoke;
        v15[3] = &unk_1E5D3D240;
        v15[4] = a1;
        uint64_t v17 = v10;
        CFTypeRef v8 = v8;
        id v16 = v8;
        dispatch_async(v11, v15);
      }
LABEL_11:
    }
  }
}

void __89__MFSecureMIMECompositionManager__determineTrustStatusForSigningIdentity_sendingAddress___block_invoke(uint64_t a1)
{
}

void __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke(uint64_t a1)
{
}

- (int64_t)signingStatus
{
  [(NSLock *)self->_lock lock];
  int64_t signingStatus = self->_signingStatus;
  [(NSLock *)self->_lock unlock];
  return signingStatus;
}

- (void)_nts_copyEncryptionIdentity:(void *)a3 error:(void *)a4 certificatesByRecipient:(void *)a5 errorsByRecipient:
{
  if (!a1) {
    return;
  }
  if (a2)
  {
    CFTypeRef v10 = *(CFTypeRef *)(a1 + 56);
    if (v10) {
      CFTypeRef v10 = CFRetain(v10);
    }
    *a2 = v10;
  }
  if (a3) {
    *a3 = *(id *)(a1 + 64);
  }
  if (a4)
  {
    if (![*(id *)(a1 + 88) count])
    {
      *a4 = 0;
      if (!a5) {
        return;
      }
      goto LABEL_12;
    }
    id v11 = (id) [*(id *)(a1 + 88) copy];
    *a4 = v11;
  }
  if (!a5) {
    return;
  }
LABEL_12:
  if ([*(id *)(a1 + 80) count])
  {
    id v12 = (id) [*(id *)(a1 + 80) copy];
    *a5 = v12;
  }
  else
  {
    *a5 = 0;
  }
}

- (int64_t)encryptionStatus
{
  [(NSLock *)self->_lock lock];
  int64_t encryptionStatus = self->_encryptionStatus;
  [(NSLock *)self->_lock unlock];
  return encryptionStatus;
}

- (NSSet)recipients
{
  [(NSLock *)self->_lock lock];
  id v3 = (void *)[(NSMutableSet *)self->_recipients copy];
  [(NSLock *)self->_lock unlock];
  return (NSSet *)v3;
}

- (id)compositionSpecification
{
  [(NSLock *)self->_lock lock];
  if (*(_OWORD *)&self->_encryptionStatusSemaphore != 0
    || self->_signingPolicy == 2 && self->_signingStatus
    || self->_encryptionPolicy == 2 && self->_encryptionStatus)
  {
    id v3 = 0;
    goto LABEL_3;
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (self->_signingPolicy) {
    BOOL v6 = self->_signingStatus == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (self->_encryptionPolicy) {
    BOOL v7 = self->_encryptionStatus == 0;
  }
  else {
    BOOL v7 = 0;
  }
  CFTypeRef v8 = [MEMORY[0x1E4F28ED0] numberWithBool:v6];
  [v5 setObject:v8 forKeyedSubscript:@"ShouldSign"];

  BOOL v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v7];
  [v5 setObject:v9 forKeyedSubscript:@"ShouldEncrypt"];

  if (v6)
  {
    signingIdentity = self->_signingIdentity;
    if (!signingIdentity)
    {
      uint64_t v14 = "_signingIdentity";
      int v15 = 735;
      goto LABEL_27;
    }
    [v5 setObject:signingIdentity forKeyedSubscript:@"SigningIdentity"];
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity) {
      [v5 setObject:encryptionIdentity forKeyedSubscript:@"EncryptionIdentity"];
    }
  }
  if (v7)
  {
    id v12 = self->_encryptionIdentity;
    if (v12)
    {
      [v5 setObject:v12 forKeyedSubscript:@"EncryptionIdentity"];
      if ([(NSMutableDictionary *)self->_certificatesByRecipient count])
      {
        id v13 = (void *)[(NSMutableDictionary *)self->_certificatesByRecipient copy];
        [v5 setObject:v13 forKeyedSubscript:@"RecipientCertificates"];
      }
      goto LABEL_24;
    }
    uint64_t v14 = "_encryptionIdentity";
    int v15 = 746;
LABEL_27:
    __assert_rtn("-[MFSecureMIMECompositionManager compositionSpecification]", "MFSecureMIMECompositionManager.m", v15, v14);
  }
LABEL_24:
  id v3 = v5;
LABEL_3:
  [(NSLock *)self->_lock unlock];
  return v3;
}

- (BOOL)shouldAllowSend
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = (self->_signingPolicy != 2 || !self->_signingStatus)
    && (self->_encryptionPolicy != 2 || self->_encryptionStatus == 0);
  [(NSLock *)self->_lock unlock];
  return v3;
}

+ (__SecIdentity)copySigningIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  CFTypeRef v8 = [a3 signingIdentityPersistentReferenceForAddress:v7];
  id v17 = 0;
  BOOL v9 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v8 error:&v17];
  id v10 = v17;
  id v11 = v10;
  if (a5 && !v9)
  {
    if (v10)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v19[0] = v10;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
    else
    {
      id v12 = 0;
    }
    id v13 = NSString;
    uint64_t v14 = MFLookupLocalizedString(@"SMIME_MISSING_SIGNING_IDENTITY_FORMAT", @"You can’t send signed messages because a signing identity for the address “%@” could not be found. Go to the Advanced settings for this account to choose a signing identity.", @"Delayed");
    int v15 = objc_msgSend(v13, "stringWithFormat:", v14, v7);

    *a5 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1052 localizedDescription:v15 title:0 userInfo:v12];
  }
  return v9;
}

+ (__SecIdentity)copyEncryptionIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  CFTypeRef v8 = [a3 encryptionIdentityPersistentReferenceForAddress:v7];
  id v17 = 0;
  BOOL v9 = +[MFMessageKeychainManager copyIdentityForPersistentReference:v8 error:&v17];
  id v10 = v17;
  id v11 = v10;
  if (a5 && !v9)
  {
    if (v10)
    {
      uint64_t v18 = *MEMORY[0x1E4F28A50];
      v19[0] = v10;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
    else
    {
      id v12 = 0;
    }
    id v13 = NSString;
    uint64_t v14 = MFLookupLocalizedString(@"SMIME_MISSING_ENCRYPTION_IDENTITY_FORMAT", @"You can’t send encrypted messages because an encryption identity for the address “%@” could not be found. Go to the Advanced settings for this account to choose an encryption identity.", @"Delayed");
    int v15 = objc_msgSend(v13, "stringWithFormat:", v14, v7);

    *a5 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1052 localizedDescription:v15 title:0 userInfo:v12];
  }
  return v9;
}

+ (id)copyEncryptionCertificatesForAccount:(id)a3 recipientAddresses:(id)a4 errorsByAddress:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v49 = 0;
  id v30 = a4;
  long long v35 = objc_msgSend(a3, "copyDataForRemoteEncryptionCertificatesForAddresses:errors:");
  id v37 = 0;
  if (!v37) {
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v30;
  uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v46;
    uint64_t v31 = *MEMORY[0x1E4F28A50];
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v39 = [v35 objectForKeyedSubscript:v6];
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v39 count])
        {
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          id v8 = v39;
          BOOL v9 = 0;
          uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v54 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v42;
            do
            {
              uint64_t v12 = 0;
              id v13 = v9;
              do
              {
                if (*(void *)v42 != v11) {
                  objc_enumerationMutation(v8);
                }
                CFDataRef v14 = *(const __CFData **)(*((void *)&v41 + 1) + 8 * v12);
                SecCertificateRef v15 = SecCertificateCreateWithData(0, v14);
                SecCertificateRef v16 = v15;
                if (v15)
                {
                  BOOL v9 = checkCertificateExpiration((uint64_t)v15, v6);

                  if (!v9) {
                    [v7 addObject:v16];
                  }
                  CFRelease(v16);
                }
                else
                {
                  id v17 = MFLogGeneral();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    CFDataRef v53 = v14;
                    _os_log_impl(&dword_1A7EFF000, v17, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCertificateCreateWithData() failed for %@", buf, 0xCu);
                  }

                  uint64_t v18 = MFLookupLocalizedString(@"MIME_GENERIC_REMOTE_ENCRYPTION_CERT_MESSAGE", @"An error occurred while retrieving the encryption certificate.", @"Delayed");
                  BOOL v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v18 title:0 userInfo:0];
                }
                ++v12;
                id v13 = v9;
              }
              while (v10 != v12);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v54 count:16];
            }
            while (v10);
          }
        }
        else
        {
          id v40 = 0;
          BOOL v19 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:v6 error:&v40];
          id v20 = v40;
          id v8 = v20;
          if (v19)
          {
            BOOL v9 = checkCertificateExpiration((uint64_t)v19, v6);
            if (!v9) {
              [v7 addObject:v19];
            }
            CFRelease(v19);
          }
          else
          {
            if (v20)
            {
              uint64_t v50 = v31;
              id v51 = v20;
              uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
              v22 = NSString;
              id v23 = MFLookupLocalizedString(@"SMIME_OTHER_ENCRYPTION_CERT_ERROR_MESSAGE", @"An error occurred while searching for an encryption certificate for “%@” in your keychain.", @"Delayed");
              v24 = objc_msgSend(v22, "stringWithFormat:", v23, v6);
              v25 = (void *)v21;
            }
            else
            {
              id v26 = NSString;
              id v23 = MFLookupLocalizedString(@"SMIME_MISSING_ENCRYPTION_CERT_MESSAGE", @"You can’t send encrypted messages because an encryption certificate for the address “%@” could not be found.", @"Delayed");
              v24 = objc_msgSend(v26, "stringWithFormat:", v23, v6);
              v25 = 0;
            }

            v27 = MFLookupLocalizedString(@"SMIME_CANT_ENCRYPT_TITLE", @"Unable to Encrypt", @"Delayed");
            BOOL v9 = +[MFError errorWithDomain:@"MFMessageErrorDomain" code:1035 localizedDescription:v24 title:v27 userInfo:v25];
          }
        }

        if (v9) {
          [v37 setObject:v9 forKeyedSubscript:v6];
        }
        if ([v7 count])
        {
          [v33 setObject:v7 forKeyedSubscript:v6];
          [v37 setObject:0 forKeyedSubscript:v6];
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v36);
  }

  if (a5) {
    *a5 = (id)[v37 copy];
  }

  return v33;
}

+ (unsigned)evaluateTrustForSigningCertificate:(__SecCertificate *)a3 sendingAddress:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  id v7 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:v5];
  if (v7)
  {
    [v6 addObject:v7];
    CFRelease(v7);
  }
  SecPolicyRef Revocation = SecPolicyCreateRevocation(3uLL);
  if (Revocation)
  {
    [v6 addObject:Revocation];
    CFRelease(Revocation);
  }
  SecTrustRef trust = 0;
  OSStatus v9 = SecTrustCreateWithCertificates(a3, v6, &trust);
  if (v9 || !trust)
  {
    uint64_t v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[MFSecureMIMECompositionManager evaluateTrustForSigningCertificate:sendingAddress:](v9, v10);
    }
    unsigned int v11 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F608D0] evaluateTrust:trust withOptions:0 signerEmailAddress:v5];
    unsigned int v11 = [v10 trustResult];
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_certificatesByRecipient, 0);
  objc_storeStrong((id *)&self->_errorsByRecipient, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_encryptionIdentityError, 0);
  objc_storeStrong((id *)&self->_signingIdentityError, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_sendingAccount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_determineTrustStatusForSigningIdentity:(os_log_t)log sendingAddress:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecIdentityCopyCertificate could not find certificate for %@, returned %d", (uint8_t *)&v3, 0x12u);
}

+ (void)evaluateTrustForSigningCertificate:(int)a1 sendingAddress:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, a2, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %ld", (uint8_t *)&v2, 0xCu);
}

@end