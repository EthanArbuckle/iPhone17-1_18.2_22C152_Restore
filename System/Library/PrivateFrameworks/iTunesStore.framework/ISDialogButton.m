@interface ISDialogButton
+ (id)buttonWithTitle:(id)a3;
- (BOOL)isEqual:(id)a3 superficial:(BOOL)a4;
- (BOOL)shouldContinueTouchIDSession;
- (ISDialogButton)init;
- (ISDialogButton)initWithXPCEncoding:(id)a3;
- (NSDictionary)dictionary;
- (NSString)subtarget;
- (NSString)title;
- (id)copyXPCEncoding;
- (id)parameter;
- (int)_actionTypeForString:(id)a3;
- (int)actionType;
- (int64_t)_urlTypeForString:(id)a3;
- (int64_t)tag;
- (int64_t)urlType;
- (void)_openURLWithRequest:(id)a3;
- (void)loadFromDictionary:(id)a3;
- (void)performDefaultActionForDialog:(id)a3;
- (void)setActionType:(int)a3;
- (void)setActionTypeWithString:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setParameter:(id)a3;
- (void)setSubtarget:(id)a3;
- (void)setTag:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUrlType:(int64_t)a3;
@end

@implementation ISDialogButton

- (ISDialogButton)init
{
  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDialogButton;
  return [(ISDialogButton *)&v4 init];
}

+ (id)buttonWithTitle:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setTitle:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3 superficial:(BOOL)a4
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(ISDialogButton *)self title];
    v8 = [v6 title];
    if (v7 == v8)
    {
      if (a4)
      {
        LOBYTE(v10) = 1;
        v11 = v7;
        goto LABEL_16;
      }
    }
    else
    {
      int v9 = [v7 isEqual:v8];
      int v10 = v9;
      if (a4)
      {
        v11 = v8;
        goto LABEL_16;
      }
      if (!v9)
      {
LABEL_12:
        v14 = [(ISDialogButton *)self parameter];

        v11 = [v6 parameter];

        if (v10)
        {
          if (v14 == v11)
          {
            LOBYTE(v10) = 1;
            v7 = v14;
            v11 = v14;
            goto LABEL_16;
          }
          LOBYTE(v10) = [v14 isEqual:v11];
        }
        v7 = v14;
LABEL_16:

        goto LABEL_17;
      }
    }
    int v12 = [(ISDialogButton *)self actionType];
    if (v12 == [v6 actionType])
    {
      int64_t v13 = [(ISDialogButton *)self urlType];
      int v10 = v13 == [v6 urlType];
    }
    else
    {
      int v10 = 0;
    }
    goto LABEL_12;
  }
  LOBYTE(v10) = 0;
LABEL_17:

  return v10;
}

- (void)loadFromDictionary:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_dictionary, a3);
  v5 = [v13 objectForKey:@"kind"];
  if (!v5)
  {
    v5 = [v13 objectForKey:@"action"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISDialogButton *)self setActionType:[(ISDialogButton *)self _actionTypeForString:v5]];
  }
  id v6 = [v13 objectForKey:@"buyParams"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [v13 objectForKey:@"buy-params"];

    id v6 = (void *)v7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISDialogButton *)self setParameter:v6];
  }
  v8 = [v13 objectForKey:@"code"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ISDialogButton *)self setParameter:v8];
  }
  int v9 = [v13 objectForKey:@"subtarget"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(ISDialogButton *)self setSubtarget:v9];
    [(ISDialogButton *)self setUrlType:[(ISDialogButton *)self _urlTypeForString:v9]];
  }
  int v10 = [v13 objectForKey:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [NSURL URLWithString:v10];
    [(ISDialogButton *)self setParameter:v11];
  }
  int v12 = [v13 objectForKey:@"tidContinue"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_tidContinue = [v12 BOOLValue];
    if ([v12 BOOLValue]) {
      [(ISDialogButton *)self setUrlType:1];
    }
  }
}

- (void)performDefaultActionForDialog:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  switch([(ISDialogButton *)self actionType])
  {
    case 1:
    case 2:
      v5 = [(ISDialogButton *)self parameter];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [NSURL URLWithString:v5];

        v5 = (void *)v6;
      }
      uint64_t v7 = [v4 authenticationContext];
      v8 = (void *)[v7 mutableCopy];

      if ([(ISDialogButton *)self shouldContinueTouchIDSession])
      {
        int v9 = [v4 touchIDContinueToken];
        [v8 setTouchIDContinueToken:v9];
      }
      int64_t v10 = [(ISDialogButton *)self urlType];
      if (v10 == 2)
      {
        uint64_t v22 = [v5 schemeSwizzledURL];

        if (SSIsDaemon())
        {
          int v12 = objc_alloc_init(ISStoreURLOperation);
          v23 = +[ISDataProvider provider];
          [(ISURLOperation *)v12 setDataProvider:v23];

          v24 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:v22];
          [(ISURLOperation *)v12 setRequestProperties:v24];
          v25 = +[ISOperationQueue mainQueue];
          [v25 addOperation:v12];
        }
        else
        {
          id v32 = objc_alloc(MEMORY[0x263F7B290]);
          v33 = [MEMORY[0x263F08BD8] requestWithURL:v22];
          int v12 = (ISStoreURLOperation *)[v32 initWithURLRequest:v33];

          [(ISStoreURLOperation *)v12 setITunesStoreRequest:1];
          [(ISStoreURLOperation *)v12 setShouldProcessProtocol:1];
          v24 = (void *)[objc_alloc(MEMORY[0x263F7B360]) initWithRequestProperties:v12];
          [v24 start];
        }

        v5 = (void *)v22;
      }
      else
      {
        if (v10 == 1)
        {
          v11 = ISAccountURLWithURL(v5, v8);
          int v12 = +[ISOpenURLRequest openURLRequestWithURL:v11];

          if (!v12) {
            goto LABEL_34;
          }
        }
        else
        {
          int v12 = +[ISOpenURLRequest openURLRequestWithURL:v5];
          if (!v12) {
            goto LABEL_34;
          }
        }
        v26 = [v8 preferredITunesStoreClient];
        [(ISStoreURLOperation *)v12 setTargetIdentifier:v26];

        if ([(ISDialogButton *)self actionType] == 2)
        {
          v27 = [(ISStoreURLOperation *)v12 URL];
          v28 = [v27 urlByReplacingSchemeWithScheme:@"itms-ui"];

          [(ISStoreURLOperation *)v12 setURL:v28];
        }
        [(ISDialogButton *)self _openURLWithRequest:v12];
      }

LABEL_34:
LABEL_39:

      return;
    case 3:
      id v13 = (void *)MEMORY[0x263F7B2D8];
      v14 = [(ISDialogButton *)self parameter];
      v15 = [v13 purchaseWithBuyParameters:v14];

      if (SSIsDaemon())
      {
        v16 = [NSClassFromString(&cfstr_Purchasecontro.isa) sharedController];
        v34[0] = v15;
        v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
        [v16 addPurchases:v17];
        goto LABEL_23;
      }
      id v29 = objc_alloc(MEMORY[0x263F7B2E8]);
      v30 = [MEMORY[0x263EFF8C0] arrayWithObject:v15];
      v16 = (void *)[v29 initWithPurchases:v30];

      v31 = v16;
      goto LABEL_36;
    case 4:
      v15 = [(ISDialogButton *)self parameter];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [NSURL URLWithString:v15];

        v15 = (ISQRCodeDialog *)v18;
      }
      v19 = [[ISOpenURLRequest alloc] initWithURL:v15];
      [(ISOpenURLRequest *)v19 setITunesStoreURL:0];
      [(ISDialogButton *)self _openURLWithRequest:v19];

      goto LABEL_38;
    case 6:
      v15 = [(ISDialog *)[ISQRCodeDialog alloc] initWithDialogDictionary:self->_dictionary];
      uint64_t v20 = +[ISDialogOperation operationWithDialog:v15];
      goto LABEL_22;
    case 9:
      [MEMORY[0x263F7B178] retryAllRestoreDownloads];
      goto LABEL_39;
    case 0xB:
      v15 = [(ISDialogButton *)self parameter];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v21 = [NSURL URLWithString:v15];

        v15 = (ISQRCodeDialog *)v21;
      }
      if (!v15) {
        goto LABEL_38;
      }
      if (SSIsDaemon())
      {
        uint64_t v20 = [objc_alloc(NSClassFromString(&cfstr_Askpermissiona.isa)) initWithURL:v15];
LABEL_22:
        v16 = (void *)v20;
        v17 = +[ISOperationQueue mainQueue];
        [v17 addOperation:v16];
LABEL_23:
      }
      else
      {
        v31 = (void *)[objc_alloc(MEMORY[0x263F7B110]) initWithURL:v15];
        v16 = v31;
LABEL_36:
        [v31 start];
      }

LABEL_38:
      goto LABEL_39;
    default:
      goto LABEL_39;
  }
}

- (void)setActionTypeWithString:(id)a3
{
  uint64_t v4 = [(ISDialogButton *)self _actionTypeForString:a3];

  [(ISDialogButton *)self setActionType:v4];
}

- (int)_actionTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Buy"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"OpenURL"])
  {
    int v4 = 4;
  }
  else if ([v3 caseInsensitiveCompare:@"goback"])
  {
    if ([v3 isEqualToString:@"QRCode"])
    {
      int v4 = 6;
    }
    else if ([v3 isEqualToString:@"redeem-code"])
    {
      int v4 = 7;
    }
    else if ([v3 isEqualToString:@"RetryRestoreAll"])
    {
      int v4 = 9;
    }
    else if ([v3 isEqualToString:@"Review"])
    {
      int v4 = 8;
    }
    else if ([v3 isEqualToString:@"Goto"])
    {
      int v4 = 1;
    }
    else if ([v3 isEqualToString:@"GotoFinance"])
    {
      int v4 = 2;
    }
    else if ([v3 isEqualToString:@"ServiceAction"])
    {
      int v4 = 10;
    }
    else if ([v3 isEqualToString:@"FamilyPermissionAction"])
    {
      int v4 = 11;
    }
    else
    {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 5;
  }

  return v4;
}

- (void)_openURLWithRequest:(id)a3
{
  id v3 = a3;
  v5 = [[ISOpenURLOperation alloc] initWithOpenURLRequest:v3];

  int v4 = +[ISOperationQueue mainQueue];
  [v4 addOperation:v5];
}

- (int64_t)_urlTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:*MEMORY[0x263F7B4E0]])
  {
    int64_t v4 = 1;
  }
  else if ([v3 hasPrefix:*MEMORY[0x263F7B4E8]])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (ISDialogButton)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || MEMORY[0x2166C7F80](v4) != MEMORY[0x263EF8708])
  {
    uint64_t v6 = 0;
LABEL_4:

    goto LABEL_5;
  }
  uint64_t v6 = [(ISDialogButton *)self init];
  if (v6)
  {
    v6->_unsigned int actionType = xpc_dictionary_get_int64(v5, "0");
    objc_opt_class();
    uint64_t v8 = SSXPCDictionaryCopyCFObjectWithClass();
    dictionary = v6->_dictionary;
    v6->_dictionary = (NSDictionary *)v8;

    objc_opt_class();
    uint64_t v10 = SSXPCDictionaryCopyCFObjectWithClass();
    subtarget = v6->_subtarget;
    v6->_subtarget = (NSString *)v10;

    v6->_tidContinue = xpc_dictionary_get_BOOL(v5, "6");
    objc_opt_class();
    uint64_t v12 = SSXPCDictionaryCopyCFObjectWithClass();
    title = v6->_title;
    v6->_title = (NSString *)v12;

    v6->_urlType = xpc_dictionary_get_int64(v5, "5");
    unsigned int actionType = v6->_actionType;
    if (actionType <= 0xB)
    {
      int v15 = 1 << actionType;
      if ((v15 & 0xC12) != 0)
      {
        objc_opt_class();
        self = (ISDialogButton *)SSXPCDictionaryCopyCFObjectWithClass();
        if (self)
        {
          uint64_t v16 = [objc_alloc(NSURL) initWithString:self];
          id parameter = v6->_parameter;
          v6->_id parameter = (id)v16;
        }
      }
      else
      {
        if ((v15 & 0x88) == 0) {
          goto LABEL_5;
        }
        objc_opt_class();
        uint64_t v18 = SSXPCDictionaryCopyCFObjectWithClass();
        self = (ISDialogButton *)v6->_parameter;
        v6->_id parameter = (id)v18;
      }
      goto LABEL_4;
    }
  }
LABEL_5:

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", self->_actionType);
  SSXPCDictionarySetCFObject();
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_BOOL(v3, "6", self->_tidContinue);
  SSXPCDictionarySetCFObject();
  xpc_dictionary_set_int64(v3, "5", self->_urlType);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [self->_parameter absoluteString];
    SSXPCDictionarySetCFObject();
  }
  else
  {
    SSXPCDictionarySetCFObject();
  }
  return v3;
}

- (int)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int)a3
{
  self->_unsigned int actionType = a3;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDictionary:(id)a3
{
}

- (id)parameter
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setParameter:(id)a3
{
}

- (BOOL)shouldContinueTouchIDSession
{
  return self->_tidContinue;
}

- (NSString)subtarget
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubtarget:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTitle:(id)a3
{
}

- (int64_t)urlType
{
  return self->_urlType;
}

- (void)setUrlType:(int64_t)a3
{
  self->_urlType = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_subtarget, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong(&self->_parameter, 0);
}

@end