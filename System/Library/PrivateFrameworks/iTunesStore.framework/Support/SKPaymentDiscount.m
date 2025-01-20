@interface SKPaymentDiscount
- (NSNumber)timestamp;
- (NSString)identifier;
- (NSString)keyIdentifier;
- (NSString)signature;
- (NSUUID)nonce;
- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp;
@end

@implementation SKPaymentDiscount

- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp
{
  v12 = identifier;
  v13 = keyIdentifier;
  v14 = nonce;
  v15 = signature;
  v16 = timestamp;
  v17 = v16;
  if (!v12 || !v13 || !v14 || !v15 || !v16)
  {
    v30 = +[SSLogConfig sharedConfig];
    unsigned int v31 = [v30 shouldLog];
    if ([v30 shouldLogToDisk]) {
      int v32 = v31 | 2;
    }
    else {
      int v32 = v31;
    }
    v33 = [v30 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      int v34 = v32;
    }
    else {
      int v34 = v32 & 2;
    }
    if (v34)
    {
      v39[0] = 0;
      LODWORD(v37) = 2;
      v35 = (void *)_os_log_send_and_compose_impl();

      if (!v35)
      {
LABEL_19:

        v29 = 0;
        goto LABEL_20;
      }
      v33 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, v39, v37);
      free(v35);
      SSFileLog();
    }

    goto LABEL_19;
  }
  v38.receiver = self;
  v38.super_class = (Class)SKPaymentDiscount;
  v18 = [(SKPaymentDiscount *)&v38 init];
  if (v18)
  {
    v19 = (NSString *)[(NSString *)v12 copy];
    v20 = v18->_identifier;
    v18->_identifier = v19;

    v21 = (NSString *)[(NSString *)v13 copy];
    v22 = v18->_keyIdentifier;
    v18->_keyIdentifier = v21;

    v23 = (NSUUID *)[(NSUUID *)v14 copy];
    v24 = v18->_nonce;
    v18->_nonce = v23;

    v25 = (NSString *)[(NSString *)v15 copy];
    v26 = v18->_signature;
    v18->_signature = v25;

    v27 = (NSNumber *)[(NSNumber *)v17 copy];
    v28 = v18->_timestamp;
    v18->_timestamp = v27;
  }
  self = v18;
  v29 = self;
LABEL_20:

  return v29;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSUUID)nonce
{
  return self->_nonce;
}

- (NSString)signature
{
  return self->_signature;
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end