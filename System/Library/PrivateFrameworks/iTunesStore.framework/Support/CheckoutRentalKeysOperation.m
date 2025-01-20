@interface CheckoutRentalKeysOperation
- (BOOL)_handleResponse:(id)a3 error:(id *)a4;
- (BOOL)_haveValidRentalInformation;
- (BOOL)_performCheckout:(id *)a3;
- (BOOL)isBackgroundCheckout;
- (BOOL)shouldCheckoutWithPlay;
- (BOOL)shouldValidateRentalInfo;
- (CheckoutRentalKeysOperation)init;
- (CheckoutRentalKeysOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4;
- (CheckoutRentalKeysOperation)initWithSinfs:(id)a3;
- (CheckoutRentalKeysOperation)initWithStoreDownloadSinfs:(id)a3;
- (NSArray)sinfs;
- (NSNumber)accountIdentifier;
- (NSNumber)rentalKeyIdentifier;
- (NSString)clientIdentifierHeader;
- (NSString)userAgent;
- (SSURLConnectionResponse)URLResponse;
- (id)_bodyData;
- (id)_copyAccountIdentifier;
- (id)_copyRentalIdentifier;
- (id)_primarySINF;
- (unint64_t)checkoutType;
- (void)_run;
- (void)_showErrorDialogForOutput:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setBackgroundCheckout:(BOOL)a3;
- (void)setCheckoutType:(unint64_t)a3;
- (void)setCheckoutWithPlay:(BOOL)a3;
- (void)setClientIdentifierHeader:(id)a3;
- (void)setShouldValidateRentalInfo:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation CheckoutRentalKeysOperation

- (CheckoutRentalKeysOperation)init
{
  return [(CheckoutRentalKeysOperation *)self initWithSinfs:0];
}

- (CheckoutRentalKeysOperation)initWithSinfs:(id)a3
{
  if (![a3 count]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CheckoutRentalKeysOperation.m" lineNumber:75 description:@"Must have sinfs"];
  }
  v8.receiver = self;
  v8.super_class = (Class)CheckoutRentalKeysOperation;
  v6 = [(CheckoutRentalKeysOperation *)&v8 init];
  if (v6)
  {
    v6->_sinfs = (NSArray *)[a3 copy];
    v6->_shouldValidateRentalInfo = 1;
  }
  return v6;
}

- (CheckoutRentalKeysOperation)initWithAccountIdentifier:(id)a3 rentalKeyIdentifier:(id)a4
{
  if (![a3 unsignedLongLongValue] || !objc_msgSend(a4, "unsignedLongLongValue")) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CheckoutRentalKeysOperation.m" lineNumber:84 description:@"Must have account and rental key identifier"];
  }
  v10.receiver = self;
  v10.super_class = (Class)CheckoutRentalKeysOperation;
  objc_super v8 = [(CheckoutRentalKeysOperation *)&v10 init];
  if (v8)
  {
    v8->_accountIdentifier = (NSNumber *)[a3 copy];
    v8->_rentalKeyIdentifier = (NSNumber *)[a4 copy];
    v8->_shouldValidateRentalInfo = 1;
  }
  return v8;
}

- (CheckoutRentalKeysOperation)initWithStoreDownloadSinfs:(id)a3
{
  v4 = [[DownloadDRM alloc] initWithSinfArray:a3];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = [(DownloadDRM *)v4 sinfs];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v10) dataForSinfDataKey:off_100400C68];
        if (v11) {
          [v5 addObject:v11];
        }
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  v12 = [(CheckoutRentalKeysOperation *)self initWithSinfs:v5];

  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CheckoutRentalKeysOperation;
  [(CheckoutRentalKeysOperation *)&v3 dealloc];
}

- (NSNumber)accountIdentifier
{
  v2 = self->_accountIdentifier;

  return v2;
}

- (NSString)clientIdentifierHeader
{
  [(CheckoutRentalKeysOperation *)self lock];
  objc_super v3 = self->_clientIdentifierHeader;
  [(CheckoutRentalKeysOperation *)self unlock];
  return v3;
}

- (NSNumber)rentalKeyIdentifier
{
  v2 = self->_rentalKeyIdentifier;

  return v2;
}

- (void)setClientIdentifierHeader:(id)a3
{
  [(CheckoutRentalKeysOperation *)self lock];
  clientIdentifierHeader = self->_clientIdentifierHeader;
  if (clientIdentifierHeader != a3)
  {

    self->_clientIdentifierHeader = (NSString *)[a3 copy];
  }

  [(CheckoutRentalKeysOperation *)self unlock];
}

- (void)setUserAgent:(id)a3
{
  [(CheckoutRentalKeysOperation *)self lock];
  userAgent = self->_userAgent;
  if (userAgent != a3)
  {

    self->_userAgent = (NSString *)[a3 copy];
  }

  [(CheckoutRentalKeysOperation *)self unlock];
}

- (NSArray)sinfs
{
  v2 = self->_sinfs;

  return v2;
}

- (SSURLConnectionResponse)URLResponse
{
  [(CheckoutRentalKeysOperation *)self lock];
  objc_super v3 = self->_urlResponse;
  [(CheckoutRentalKeysOperation *)self unlock];
  return v3;
}

- (NSString)userAgent
{
  [(CheckoutRentalKeysOperation *)self lock];
  objc_super v3 = self->_userAgent;
  [(CheckoutRentalKeysOperation *)self unlock];

  return v3;
}

- (void)run
{
}

- (id)_bodyData
{
  if (!objc_msgSend(-[CheckoutRentalKeysOperation _primarySINF](self, "_primarySINF"), "length")
    && (![(NSNumber *)self->_accountIdentifier unsignedLongLongValue]
     || ![(NSNumber *)self->_rentalKeyIdentifier unsignedLongLongValue]))
  {
    id v15 = +[SSLogConfig sharedDaemonConfig];
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v17 &= 2u;
    }
    if (!v17) {
      goto LABEL_41;
    }
    goto LABEL_39;
  }
  id v3 = sub_10002D778();
  if (v3)
  {
    v4 = v3;
    id v55 = 0;
    id v56 = 0;
    if (sub_10002D9F0(&v56, &v55))
    {
      id v5 = [(CheckoutRentalKeysOperation *)self _copyAccountIdentifier];
      if (v5)
      {
        v6 = v5;
        id v7 = [(CheckoutRentalKeysOperation *)self _copyRentalIdentifier];
        if (!v7)
        {
          id v38 = +[SSLogConfig sharedDaemonConfig];
          if (!v38) {
            id v38 = +[SSLogConfig sharedConfig];
          }
          unsigned int v39 = [v38 shouldLog];
          if ([v38 shouldLogToDisk]) {
            int v40 = v39 | 2;
          }
          else {
            int v40 = v39;
          }
          if (!os_log_type_enabled((os_log_t)[v38 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            v40 &= 2u;
          }
          if (v40)
          {
            uint64_t v41 = objc_opt_class();
            int v57 = 138412290;
            uint64_t v58 = v41;
            LODWORD(v54) = 12;
            v53 = &v57;
            uint64_t v42 = _os_log_send_and_compose_impl();
            if (v42)
            {
              v43 = (void *)v42;
              v44 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v57, v54);
              free(v43);
              v53 = (int *)v44;
              SSFileLog();
            }
          }
          goto LABEL_62;
        }
        id v8 = v7;
        id v9 = objc_alloc_init((Class)NSMutableDictionary);
        CFStringRef v10 = @"play";
        if (MGGetSInt32Answer() != 4
          && ![(CheckoutRentalKeysOperation *)self shouldCheckoutWithPlay])
        {
          CFStringRef v10 = @"download-done";
        }
        objc_msgSend(v9, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), v10);
        [v9 setObject:v6 forKey:@"dsid"];
        id v11 = [+[ISDevice sharedInstance] guid];
        if (v11) {
          [v9 setObject:v11 forKey:@"guid"];
        }
        id v12 = objc_msgSend(+[SSDevice currentDevice](SSDevice, "currentDevice"), "productType");
        if (v12) {
          [v9 setObject:v12 forKey:@"hw.model"];
        }
        if (v56) {
          [v9 setObject:v56 forKey:@"device-diversity"];
        }
        if (v55) {
          [v9 setObject:v55 forKey:@"rbsync"];
        }
        [v9 setObject:v4 forKey:@"rental-bag"];
        [v9 setObject:v8 forKey:@"rental-id"];
        unint64_t v13 = [(CheckoutRentalKeysOperation *)self checkoutType];
        if (v13 == 1)
        {
          CFStringRef v14 = @"download";
        }
        else
        {
          if (v13 != 2)
          {
LABEL_86:
            id v45 = +[SSLogConfig sharedWriteToDiskConfig];
            if (!v45) {
              id v45 = +[SSLogConfig sharedConfig];
            }
            unsigned int v46 = [v45 shouldLog];
            if ([v45 shouldLogToDisk]) {
              int v47 = v46 | 2;
            }
            else {
              int v47 = v46;
            }
            if (!os_log_type_enabled((os_log_t)[v45 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
              v47 &= 2u;
            }
            if (v47)
            {
              uint64_t v48 = objc_opt_class();
              int v57 = 138412546;
              uint64_t v58 = v48;
              __int16 v59 = 2112;
              id v60 = v9;
              LODWORD(v54) = 22;
              v53 = &v57;
              uint64_t v49 = _os_log_send_and_compose_impl();
              if (v49)
              {
                v50 = (void *)v49;
                v51 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v49, 4, &v57, v54);
                free(v50);
                v53 = (int *)v51;
                SSFileLog();
              }
            }
            v37 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v9, 100, 0, 0, v53);

            goto LABEL_97;
          }
          CFStringRef v14 = @"stream";
        }
        [v9 setObject:v14 forKey:@"checkout-type"];
        goto LABEL_86;
      }
      id v26 = +[SSLogConfig sharedDaemonConfig];
      if (!v26) {
        id v26 = +[SSLogConfig sharedConfig];
      }
      unsigned int v27 = [v26 shouldLog];
      if ([v26 shouldLogToDisk]) {
        int v28 = v27 | 2;
      }
      else {
        int v28 = v27;
      }
      if (!os_log_type_enabled((os_log_t)[v26 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v28 &= 2u;
      }
      if (!v28)
      {
LABEL_61:
        v6 = 0;
        goto LABEL_62;
      }
    }
    else
    {
      id v23 = +[SSLogConfig sharedDaemonConfig];
      if (!v23) {
        id v23 = +[SSLogConfig sharedConfig];
      }
      unsigned int v24 = [v23 shouldLog];
      if ([v23 shouldLogToDisk]) {
        int v25 = v24 | 2;
      }
      else {
        int v25 = v24;
      }
      if (!os_log_type_enabled((os_log_t)[v23 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v25 &= 2u;
      }
      if (!v25) {
        goto LABEL_61;
      }
    }
    uint64_t v29 = objc_opt_class();
    int v57 = 138412290;
    uint64_t v58 = v29;
    LODWORD(v54) = 12;
    v53 = &v57;
    uint64_t v30 = _os_log_send_and_compose_impl();
    if (v30)
    {
      v31 = (void *)v30;
      v32 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v57, v54);
      free(v31);
      v53 = (int *)v32;
      SSFileLog();
    }
    goto LABEL_61;
  }
  id v18 = +[SSLogConfig sharedDaemonConfig];
  if (!v18) {
    id v18 = +[SSLogConfig sharedConfig];
  }
  unsigned int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_41;
  }
LABEL_39:
  int v57 = 138412290;
  uint64_t v58 = objc_opt_class();
  LODWORD(v54) = 12;
  v53 = &v57;
  v21 = (void *)_os_log_send_and_compose_impl();
  if (v21)
  {
    v22 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v57, v54);
    free(v21);
    v53 = (int *)v22;
    SSFileLog();
  }
LABEL_41:
  v6 = 0;
  v4 = 0;
  id v55 = 0;
  id v56 = 0;
LABEL_62:
  id v33 = +[SSLogConfig sharedDaemonConfig];
  if (!v33) {
    id v33 = +[SSLogConfig sharedConfig];
  }
  unsigned int v34 = [v33 shouldLog];
  if ([v33 shouldLogToDisk]) {
    int v35 = v34 | 2;
  }
  else {
    int v35 = v34;
  }
  if (!os_log_type_enabled((os_log_t)[v33 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v35 &= 2u;
  }
  if (v35)
  {
    uint64_t v36 = objc_opt_class();
    int v57 = 138412290;
    uint64_t v58 = v36;
    LODWORD(v54) = 12;
    v37 = (NSData *)_os_log_send_and_compose_impl();
    if (!v37)
    {
      id v8 = 0;
      goto LABEL_97;
    }
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v37, 4, &v57, v54);
    free(v37);
    SSFileLog();
  }
  id v8 = 0;
  v37 = 0;
LABEL_97:

  return v37;
}

- (id)_copyAccountIdentifier
{
  accountIdentifier = self->_accountIdentifier;
  if (accountIdentifier)
  {
    return [(NSNumber *)accountIdentifier copy];
  }
  else
  {
    id v5 = [[SinfsArray alloc] initWithSINFs:self->_sinfs];
    id v6 = [(SinfsArray *)v5 copyValueForProperty:@"SinfPropertyAccountIdentifier" error:0];

    return v6;
  }
}

- (id)_copyRentalIdentifier
{
  rentalKeyIdentifier = self->_rentalKeyIdentifier;
  if (rentalKeyIdentifier)
  {
    return [(NSNumber *)rentalKeyIdentifier copy];
  }
  else
  {
    id v5 = [[SinfsArray alloc] initWithSINFs:self->_sinfs];
    id v6 = [(SinfsArray *)v5 copyValueForProperty:@"SinfPropertyFairPlayKeyIdentifier" error:0];

    return v6;
  }
}

- (BOOL)_handleResponse:(id)a3 error:(id *)a4
{
  id v7 = [a3 objectForKey:kISFailureTypeKey];
  id v8 = [a3 objectForKey:@"rental-bag-response"];
  if (v7)
  {
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v40 = 138412546;
      uint64_t v41 = objc_opt_class();
      __int16 v42 = 2112;
      id v43 = v7;
      LODWORD(v39) = 22;
      id v38 = &v40;
      uint64_t v12 = _os_log_send_and_compose_impl();
      if (v12)
      {
        unint64_t v13 = (void *)v12;
        CFStringRef v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v40, v39);
        free(v13);
        id v38 = (int *)v14;
        SSFileLog();
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 intValue] == 5102)
    {
      id v15 = [(id)ISError() errorBySettingFatalError:1];
      [(CheckoutRentalKeysOperation *)self _showErrorDialogForOutput:a3];
LABEL_32:
      BOOL v24 = 0;
      goto LABEL_33;
    }
    uint64_t v16 = ISError();
LABEL_31:
    id v15 = (id)v16;
    goto LABEL_32;
  }
  if (v8)
  {
    if (!sub_10002E5AC(v8)
      || (id v17 = [a3 objectForKey:@"device-diversity"]) != 0 && !sub_10002E704(v17))
    {
      id v18 = +[SSLogConfig sharedDaemonConfig];
      if (!v18) {
        id v18 = +[SSLogConfig sharedConfig];
      }
      unsigned int v19 = [v18 shouldLog];
      if ([v18 shouldLogToDisk]) {
        int v20 = v19 | 2;
      }
      else {
        int v20 = v19;
      }
      if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v20 &= 2u;
      }
      if (v20)
      {
        int v40 = 138412290;
        uint64_t v41 = objc_opt_class();
        LODWORD(v39) = 12;
        id v38 = &v40;
        uint64_t v21 = _os_log_send_and_compose_impl();
        if (v21)
        {
          v22 = (void *)v21;
          id v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v40, v39);
          free(v22);
          id v38 = (int *)v23;
          SSFileLog();
        }
      }
      ISError();
      +[NSNumber numberWithBool:1];
      uint64_t v16 = SSErrorBySettingUserInfoValue();
      goto LABEL_31;
    }
    goto LABEL_56;
  }
  id v32 = +[SSLogConfig sharedDaemonConfig];
  if (!v32) {
    id v32 = +[SSLogConfig sharedConfig];
  }
  unsigned int v33 = [v32 shouldLog];
  if ([v32 shouldLogToDisk]) {
    int v34 = v33 | 2;
  }
  else {
    int v34 = v33;
  }
  BOOL v24 = 1;
  if (!os_log_type_enabled((os_log_t)[v32 OSLogObject], OS_LOG_TYPE_INFO)) {
    v34 &= 2u;
  }
  if (v34)
  {
    int v40 = 138412290;
    uint64_t v41 = objc_opt_class();
    LODWORD(v39) = 12;
    id v38 = &v40;
    uint64_t v35 = _os_log_send_and_compose_impl();
    if (v35)
    {
      uint64_t v36 = (void *)v35;
      v37 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v40, v39);
      free(v36);
      id v38 = (int *)v37;
      SSFileLog();
LABEL_56:
      id v15 = 0;
      BOOL v24 = 1;
      goto LABEL_33;
    }
  }
  id v15 = 0;
LABEL_33:
  id v25 = +[SSLogConfig sharedWriteToDiskConfig];
  if (!v25) {
    id v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = [v25 shouldLog];
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  if (!os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v27 &= 2u;
  }
  if (v27)
  {
    uint64_t v28 = objc_opt_class();
    int v40 = 138412546;
    uint64_t v41 = v28;
    __int16 v42 = 2112;
    id v43 = a3;
    LODWORD(v39) = 22;
    uint64_t v29 = _os_log_send_and_compose_impl();
    if (v29)
    {
      uint64_t v30 = (void *)v29;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v40, v39);
      free(v30);
      SSFileLog();
    }
  }
  if (a4) {
    *a4 = v15;
  }
  return v24;
}

- (BOOL)_haveValidRentalInformation
{
  if ([(NSArray *)self->_sinfs count])
  {
    id v3 = [[SinfsArray alloc] initWithSINFs:self->_sinfs];
    v4 = [(SinfsArray *)v3 copyValueForProperty:@"SinfPropertyRentalInformation" error:0];

    if (!v4) {
      goto LABEL_37;
    }
  }
  else
  {
    v4 = sub_10002DD60([(NSNumber *)self->_accountIdentifier unsignedLongLongValue], [(NSNumber *)self->_rentalKeyIdentifier unsignedLongLongValue]);
    if (!v4) {
      goto LABEL_37;
    }
  }
  if (!objc_msgSend(+[SSLogConfig sharedWriteToDiskConfig](SSLogConfig, "sharedWriteToDiskConfig"), "shouldLog"))goto LABEL_37; {
  id v5 = +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", +[NSDate dateWithTimeIntervalSince1970:(double)[(ISFairPlayRentalInfo *)v4 rentalStartTime]], (double)[(ISFairPlayRentalInfo *)v4 rentalDuration]);
  }
  id v6 = +[SSLogConfig sharedWriteToDiskConfig];
  if (!v6) {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  if (!os_log_type_enabled((os_log_t)[v6 OSLogObject], OS_LOG_TYPE_DEBUG)) {
    v8 &= 2u;
  }
  if (v8)
  {
    uint64_t v9 = objc_opt_class();
    [(NSDate *)v5 timeIntervalSinceNow];
    *(_DWORD *)uint64_t v29 = 138412802;
    *(void *)&v29[4] = v9;
    *(_WORD *)&v29[12] = 2048;
    *(void *)&v29[14] = v10;
    *(_WORD *)&v29[22] = 2112;
    uint64_t v30 = v5;
    LODWORD(v28) = 32;
    int v27 = (NSString *)v29;
    uint64_t v11 = _os_log_send_and_compose_impl();
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      unint64_t v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v29, v28);
      free(v12);
      int v27 = v13;
      SSFileLog();
    }
  }
  if ([(ISFairPlayRentalInfo *)v4 playbackStartTime] == -1)
  {
    id v20 = +[SSLogConfig sharedWriteToDiskConfig];
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v22 &= 2u;
    }
    if (v22)
    {
      uint64_t v23 = objc_opt_class();
      unsigned int v24 = [(ISFairPlayRentalInfo *)v4 playbackDuration];
      *(_DWORD *)uint64_t v29 = 138412546;
      *(void *)&v29[4] = v23;
      *(_WORD *)&v29[12] = 2048;
      *(void *)&v29[14] = v24;
      LODWORD(v28) = 22;
LABEL_35:
      id v25 = (void *)_os_log_send_and_compose_impl();
      if (v25)
      {
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, v29, v28, *(_OWORD *)v29, *(void *)&v29[16]);
        free(v25);
        SSFileLog();
      }
    }
  }
  else
  {
    CFStringRef v14 = +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", +[NSDate dateWithTimeIntervalSince1970:(double)[(ISFairPlayRentalInfo *)v4 playbackStartTime]], (double)[(ISFairPlayRentalInfo *)v4 playbackDuration]);
    id v15 = +[SSLogConfig sharedWriteToDiskConfig];
    if (!v15) {
      id v15 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v15 shouldLog];
    if ([v15 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    if (!os_log_type_enabled((os_log_t)[v15 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v17 &= 2u;
    }
    if (v17)
    {
      uint64_t v18 = objc_opt_class();
      [(NSDate *)v14 timeIntervalSinceNow];
      *(_DWORD *)uint64_t v29 = 138412802;
      *(void *)&v29[4] = v18;
      *(_WORD *)&v29[12] = 2048;
      *(void *)&v29[14] = v19;
      *(_WORD *)&v29[22] = 2112;
      uint64_t v30 = v14;
      LODWORD(v28) = 32;
      goto LABEL_35;
    }
  }
LABEL_37:

  return v4 != 0;
}

- (BOOL)_performCheckout:(id *)a3
{
  unsigned int v24 = 0;
  id v5 = [(CheckoutRentalKeysOperation *)self _bodyData];
  if (!v5)
  {
    unsigned int v24 = (void *)ISError();
    if (!a3) {
      return (char)v5;
    }
    goto LABEL_22;
  }
  id v6 = objc_alloc_init((Class)ISStoreURLOperation);
  id v7 = [(CheckoutRentalKeysOperation *)self _copyAccountIdentifier];
  if (v7)
  {
    int v8 = v7;
    id v9 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:v7];
    [v6 setAuthenticationContext:v9];
  }
  uint64_t v10 = objc_alloc_init(DaemonProtocolDataProvider);
  [v6 setDataProvider:v10];
  if ([(CheckoutRentalKeysOperation *)self isBackgroundCheckout]) {
    [(DaemonProtocolDataProvider *)v10 setShouldProcessDialogs:0];
  }
  id v11 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v11 setCachePolicy:1];
  objc_msgSend(v11, "setClientIdentifier:", -[CheckoutRentalKeysOperation clientIdentifierHeader](self, "clientIdentifierHeader"));
  [v11 setHTTPBody:v5];
  [v11 setHTTPMethod:@"POST"];
  [v11 setURLBagKey:@"rental-checkout"];
  uint64_t v12 = [(CheckoutRentalKeysOperation *)self userAgent];
  [v11 setValue:v12 forHTTPHeaderField:SSHTTPHeaderUserAgent];
  [v6 setRequestProperties:v11];

  id v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13) {
    id v13 = +[SSLogConfig sharedConfig];
  }
  unsigned int v14 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v15 = v14 | 2;
  }
  else {
    int v15 = v14;
  }
  if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_INFO)) {
    v15 &= 2u;
  }
  if (v15)
  {
    int v25 = 138412290;
    uint64_t v26 = objc_opt_class();
    LODWORD(v23) = 12;
    int v22 = &v25;
    uint64_t v16 = _os_log_send_and_compose_impl();
    if (v16)
    {
      int v17 = (void *)v16;
      uint64_t v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v25, v23);
      free(v17);
      int v22 = (int *)v18;
      SSFileLog();
    }
  }
  if (-[CheckoutRentalKeysOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, &v24, v22))
  {
    id v19 = [(DaemonProtocolDataProvider *)v10 output];
    LOBYTE(v5) = [(CheckoutRentalKeysOperation *)self _handleResponse:v19 error:&v24];
    id v20 = +[NSPropertyListSerialization dataWithPropertyList:v19 format:100 options:0 error:0];
    [(CheckoutRentalKeysOperation *)self lock];

    self->_urlResponse = (SSURLConnectionResponse *)objc_msgSend(objc_alloc((Class)SSURLConnectionResponse), "initWithURLResponse:bodyData:", objc_msgSend(v6, "response"), v20);
    [(CheckoutRentalKeysOperation *)self unlock];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  if (a3) {
LABEL_22:
  }
    *a3 = v24;
  return (char)v5;
}

- (id)_primarySINF
{
  id result = [(NSArray *)self->_sinfs count];
  if (result)
  {
    sinfs = self->_sinfs;
    return [(NSArray *)sinfs objectAtIndex:0];
  }
  return result;
}

- (void)_run
{
  id v37 = 0;
  uint64_t v3 = SSErrorAllowRetryKey;
  uint64_t v4 = 1;
  while (1)
  {
    id v5 = +[SSLogConfig sharedDaemonConfig];
    if (!v5) {
      id v5 = +[SSLogConfig sharedConfig];
    }
    unsigned int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    if (!os_log_type_enabled((os_log_t)[v5 OSLogObject], OS_LOG_TYPE_INFO)) {
      v7 &= 2u;
    }
    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      int v38 = 138412802;
      uint64_t v39 = v8;
      __int16 v40 = 2048;
      uint64_t v41 = v4;
      __int16 v42 = 1024;
      int v43 = 3;
      LODWORD(v36) = 28;
      uint64_t v35 = &v38;
      uint64_t v9 = _os_log_send_and_compose_impl();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        id v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v38, v36);
        free(v10);
        uint64_t v35 = (int *)v11;
        SSFileLog();
      }
    }
    if (-[CheckoutRentalKeysOperation _performCheckout:](self, "_performCheckout:", &v37, v35))
    {
      if (!self->_shouldValidateRentalInfo
        || [(CheckoutRentalKeysOperation *)self _haveValidRentalInformation])
      {
        id v21 = +[SSLogConfig sharedDaemonConfig];
        if (!v21) {
          id v21 = +[SSLogConfig sharedConfig];
        }
        unsigned int v22 = [v21 shouldLog];
        if ([v21 shouldLogToDisk]) {
          int v23 = v22 | 2;
        }
        else {
          int v23 = v22;
        }
        if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_INFO)) {
          v23 &= 2u;
        }
        if (v23)
        {
          uint64_t v24 = objc_opt_class();
          int v38 = 138412290;
          uint64_t v39 = v24;
          LODWORD(v36) = 12;
          uint64_t v35 = &v38;
          uint64_t v25 = _os_log_send_and_compose_impl();
          if (v25)
          {
            uint64_t v26 = (void *)v25;
            int v27 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v25, 4, &v38, v36);
            free(v26);
            uint64_t v35 = (int *)v27;
            SSFileLog();
          }
        }
        if ([(CheckoutRentalKeysOperation *)self isBackgroundCheckout]) {
          objc_msgSend(+[DistributedNotificationCenter defaultCenter](DistributedNotificationCenter, "defaultCenter"), "postNotificationName:", @"com.apple.itunesstored.RentalAdded");
        }
        uint64_t v20 = 1;
        goto LABEL_53;
      }
      goto LABEL_17;
    }
    if ((objc_msgSend(objc_msgSend(objc_msgSend(v37, "userInfo"), "objectForKey:", v3), "BOOLValue") & 1) == 0) {
      break;
    }
LABEL_17:
    unint64_t v12 = v4++ - 1;
    if (v12 >= 2)
    {
      id v13 = +[SSLogConfig sharedDaemonConfig];
      if (!v13) {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v14 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        int v15 = v14 | 2;
      }
      else {
        int v15 = v14;
      }
      if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v15 &= 2u;
      }
      if (v15)
      {
        uint64_t v16 = objc_opt_class();
        int v38 = 138412290;
        uint64_t v39 = v16;
        LODWORD(v36) = 12;
        uint64_t v35 = &v38;
        uint64_t v17 = _os_log_send_and_compose_impl();
        if (v17)
        {
          uint64_t v18 = (void *)v17;
          id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v38, v36);
          free(v18);
          uint64_t v35 = (int *)v19;
          SSFileLog();
        }
      }
      uint64_t v20 = 0;
      id v37 = (id)ISError();
      goto LABEL_53;
    }
  }
  id v28 = +[SSLogConfig sharedDaemonConfig];
  if (!v28) {
    id v28 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v30 &= 2u;
  }
  if (v30)
  {
    uint64_t v31 = objc_opt_class();
    int v38 = 138412290;
    uint64_t v39 = v31;
    LODWORD(v36) = 12;
    uint64_t v35 = &v38;
    uint64_t v32 = _os_log_send_and_compose_impl();
    if (v32)
    {
      unsigned int v33 = (void *)v32;
      int v34 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v32, 4, &v38, v36);
      free(v33);
      uint64_t v35 = (int *)v34;
      SSFileLog();
    }
  }
  uint64_t v20 = 0;
LABEL_53:
  -[CheckoutRentalKeysOperation setError:](self, "setError:", v37, v35);
  [(CheckoutRentalKeysOperation *)self setSuccess:v20];
}

- (void)_showErrorDialogForOutput:(id)a3
{
  id v5 = [a3 objectForKey:@"customerMessage"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v5 length]
    && v5
    && ![a3 objectForKey:kISDialogKey]
    && ![(CheckoutRentalKeysOperation *)self isBackgroundCheckout])
  {
    unsigned int v6 = +[ISDialogOperation operationWithError:ISError()];
    id v7 = +[ISOperationQueue mainQueue];
    [v7 addOperation:v6];
  }
}

- (BOOL)isBackgroundCheckout
{
  return self->_backgroundCheckout;
}

- (void)setBackgroundCheckout:(BOOL)a3
{
  self->_backgroundCheckout = a3;
}

- (BOOL)shouldValidateRentalInfo
{
  return self->_shouldValidateRentalInfo;
}

- (void)setShouldValidateRentalInfo:(BOOL)a3
{
  self->_shouldValidateRentalInfo = a3;
}

- (BOOL)shouldCheckoutWithPlay
{
  return self->_checkoutWithPlay;
}

- (void)setCheckoutWithPlay:(BOOL)a3
{
  self->_checkoutWithPlay = a3;
}

- (unint64_t)checkoutType
{
  return self->_checkoutType;
}

- (void)setCheckoutType:(unint64_t)a3
{
  self->_checkoutType = a3;
}

@end