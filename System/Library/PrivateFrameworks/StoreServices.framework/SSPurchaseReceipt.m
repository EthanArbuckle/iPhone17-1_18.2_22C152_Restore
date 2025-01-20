@interface SSPurchaseReceipt
+ (id)receiptPathForProxy:(id)a3;
+ (int)vppStateFlagsWithProxy:(id)a3;
+ (void)getReceiptPathWithCompletionBlock:(id)a3;
- (BOOL)isRevoked;
- (BOOL)isVPPLicensed;
- (BOOL)isValid;
- (BOOL)receiptExpired;
- (NSDate)expirationDate;
- (SSPurchaseReceipt)initWithContainerPath:(id)a3;
- (SSPurchaseReceipt)initWithContentsOfFile:(id)a3;
@end

@implementation SSPurchaseReceipt

- (SSPurchaseReceipt)initWithContentsOfFile:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSPurchaseReceipt;
  v5 = [(SSPurchaseReceipt *)&v10 init];
  if (v5
    && (v6 = [[ISPurchaseReceipt alloc] initWithContentsOfFile:v4], purchaseReceipt = v5->_purchaseReceipt, v5->_purchaseReceipt = v6, purchaseReceipt, !v5->_purchaseReceipt))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (SSPurchaseReceipt)initWithContainerPath:(id)a3
{
  id v4 = [a3 stringByAppendingPathComponent:@"StoreKit"];
  v5 = [v4 stringByAppendingPathComponent:@"receipt"];

  v6 = [(SSPurchaseReceipt *)self initWithContentsOfFile:v5];
  return v6;
}

+ (void)getReceiptPathWithCompletionBlock:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (SSIsInternalBuild() && _os_feature_enabled_impl())
  {
    id v4 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v4)
    {
      id v4 = +[SSLogConfig sharedConfig];
    }
    int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    v7 = [v4 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      int v8 = v6;
    }
    else {
      int v8 = v6 & 2;
    }
    if (v8)
    {
      int v22 = 136446210;
      v23 = "+[SSPurchaseReceipt getReceiptPathWithCompletionBlock:]";
      LODWORD(v19) = 12;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
      {
LABEL_15:

        goto LABEL_16;
      }
      v7 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, 4, &v22, v19);
      free(v9);
      SSFileLog(v4, @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_15;
  }
LABEL_16:
  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"nil block"];
  }
  v16 = [[SSXPCConnection alloc] initWithServiceName:@"com.apple.itunesstored.xpc"];
  xpc_object_t v17 = SSXPCCreateMessageDictionary(700);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__SSPurchaseReceipt_getReceiptPathWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E5BA92C8;
  id v21 = v3;
  id v18 = v3;
  [(SSXPCConnection *)v16 sendMessage:v17 withReply:v20];
}

void __55__SSPurchaseReceipt_getReceiptPathWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict && MEMORY[0x1A62689E0]() == MEMORY[0x1E4F14590])
  {
    xpc_dictionary_get_BOOL(xdict, "0");
    objc_opt_class();
    CFArrayRef v3 = SSXPCDictionaryCopyCFObjectWithClass(xdict, "1");
  }
  else
  {
    CFArrayRef v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isVPPLicensed
{
  return [(ISPurchaseReceipt *)self->_purchaseReceipt isVPPLicensed];
}

- (BOOL)isRevoked
{
  return [(ISPurchaseReceipt *)self->_purchaseReceipt isRevoked];
}

- (NSDate)expirationDate
{
  return [(ISPurchaseReceipt *)self->_purchaseReceipt expirationDate];
}

- (BOOL)receiptExpired
{
  v2 = [(SSPurchaseReceipt *)self expirationDate];
  CFArrayRef v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v2 compare:v3] == -1;

  return v4;
}

+ (id)receiptPathForProxy:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 dataContainerURL];
  int v5 = [v4 path];
  int v6 = [v5 stringByAppendingPathComponent:@"StoreKit"];

  LODWORD(v4) = [v3 profileValidated];
  if (v4) {
    v7 = @"sandboxReceipt";
  }
  else {
    v7 = @"receipt";
  }
  int v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v9 fileExistsAtPath:v8]) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (int)vppStateFlagsWithProxy:(id)a3
{
  id v3 = +[SSPurchaseReceipt receiptPathForProxy:a3];
  if (v3)
  {
    BOOL v4 = [[SSPurchaseReceipt alloc] initWithContentsOfFile:v3];
    int v5 = v4;
    if (v4)
    {
      if ([(SSPurchaseReceipt *)v4 isVPPLicensed])
      {
        if ([(SSPurchaseReceipt *)v5 isRevoked])
        {
          int v6 = 11;
        }
        else if ([(SSPurchaseReceipt *)v5 receiptExpired])
        {
          int v6 = 7;
        }
        else
        {
          int v6 = 3;
        }
      }
      else
      {
        int v6 = 1;
      }
    }
    else
    {
      int v6 = 0x80000000;
    }
  }
  else
  {
    int v6 = 0x40000000;
  }

  return v6;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void).cxx_destruct
{
}

@end