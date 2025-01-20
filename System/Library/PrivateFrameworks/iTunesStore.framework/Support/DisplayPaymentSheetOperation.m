@interface DisplayPaymentSheetOperation
- (AKAppleIDAuthenticationContext)authenticationContext;
- (BOOL)_isChallengeReadyToBeSigned;
- (BOOL)_presentPaymentSheetWithPaymentRequest:(id)a3 error:(id *)a4;
- (BOOL)touchIDDelayEnabled;
- (CGImage)_createDefaultImageWithImageRef:(CGImage *)a3 size:(CGSize)a4 borderPath:(CGPath *)a5;
- (CGImage)_createImageMaskRefWithSize:(CGSize)a3 andPath:(CGPath *)a4;
- (CGImage)_createImageRefWithURL:(id)a3 adornmentStyle:(int64_t)a4 designVersion:(id)a5;
- (CGImage)_createMaskedImageRefForImageRef:(CGImage *)a3 withPathRef:(CGPath *)a4 andAdornmentStyle:(int64_t)a5;
- (CGImage)_createRGBImageRefForGreyScaleImageRef:(CGImage *)a3 width:(unint64_t)a4 height:(unint64_t)a5;
- (CGImage)_createRatingImageWithStringValue:(id)a3 assetScale:(float *)a4;
- (CGImage)_createResizedImageWithOriginalImage:(CGImage *)a3 targetHeight:(double)a4;
- (CGPath)_createBorderPathForAdornmentStyle:(int64_t)a3 iconWidth:(double)a4 iconHeight:(double)a5 designVersion:(id)a6;
- (DisplayPaymentSheetOperation)initWithPaymentSheet:(id)a3;
- (LAContext)localAuthContext;
- (NSData)challenge;
- (NSDictionary)localAuthOptions;
- (NSNumber)accountIdentifier;
- (NSString)accountName;
- (NSString)dialogId;
- (NSString)userAgent;
- (SSPaymentSheet)paymentSheet;
- (__SecAccessControl)localAuthAccessControlRef;
- (float)_challengeSigningDelay;
- (id)_metricsDialogEvent;
- (id)_paymentRequest;
- (id)completionHandler;
- (id)completionHandlerForAutoEnrollment;
- (id)containerCompletionHandler;
- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3;
- (int64_t)_imageTypeForURL:(id)a3;
- (int64_t)_paymentSheetStyle;
- (unint64_t)_paymentRequestorTypeForPayeeType:(int64_t)a3;
- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_loadURLBag;
- (void)_postMetricsWithDialogEvent:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4;
- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4;
- (void)paymentAuthorizationControllerDidFinish:(id)a3;
- (void)run;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountName:(id)a3;
- (void)setAuthenticationContext:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionHandlerForAutoEnrollment:(id)a3;
- (void)setContainerCompletionHandler:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setLocalAuthAccessControlRef:(__SecAccessControl *)a3;
- (void)setLocalAuthContext:(id)a3;
- (void)setLocalAuthOptions:(id)a3;
- (void)setTouchIDDelayEnabled:(BOOL)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation DisplayPaymentSheetOperation

- (DisplayPaymentSheetOperation)initWithPaymentSheet:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DisplayPaymentSheetOperation;
  v6 = [(DisplayPaymentSheetOperation *)&v14 init];
  v7 = v6;
  if (v6)
  {
    v6->_didAuthorizePayment = 0;
    v6->_didBiometricsLockout = 0;
    v6->_didCancelHomeButton = 0;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunesstored.DisplayPaymentSheetOperation.dispatchQueue", 0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v8;

    fpanID = v7->_fpanID;
    v7->_fpanID = 0;

    v7->_isASNPurchase = 0;
    objc_storeStrong((id *)&v7->_paymentSheet, a3);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    userActions = v7->_userActions;
    v7->_userActions = v11;

    v7->_assetScaleIndex = -1;
    v7->_assetScaleRef = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v7->_imageArrayIndex = -1;
    v7->_imageArrayRef = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v7->_inlineImageArrayIndex = -1;
    v7->_inlineImageArrayRef = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v7->_tintArrayIndex = -1;
    v7->_tintArrayRef = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  }

  return v7;
}

- (void)dealloc
{
  [(PKPaymentAuthorizationController *)self->_controller setDelegate:0];
  [(PKPaymentAuthorizationController *)self->_controller setPrivateDelegate:0];
  assetScaleRef = self->_assetScaleRef;
  if (assetScaleRef) {
    CFRelease(assetScaleRef);
  }
  imageArrayRef = self->_imageArrayRef;
  if (imageArrayRef) {
    CFRelease(imageArrayRef);
  }
  inlineImageArrayRef = self->_inlineImageArrayRef;
  if (inlineImageArrayRef) {
    CFRelease(inlineImageArrayRef);
  }
  localAuthAccessControlRef = self->_localAuthAccessControlRef;
  if (localAuthAccessControlRef) {
    CFRelease(localAuthAccessControlRef);
  }
  tintArrayRef = self->_tintArrayRef;
  if (tintArrayRef) {
    CFRelease(tintArrayRef);
  }
  v8.receiver = self;
  v8.super_class = (Class)DisplayPaymentSheetOperation;
  [(DisplayPaymentSheetOperation *)&v8 dealloc];
}

- (__SecAccessControl)localAuthAccessControlRef
{
  return self->_localAuthAccessControlRef;
}

- (void)dismiss
{
}

- (SSPaymentSheet)paymentSheet
{
  return self->_paymentSheet;
}

- (void)setLocalAuthAccessControlRef:(__SecAccessControl *)a3
{
  localAuthAccessControlRef = self->_localAuthAccessControlRef;
  if (localAuthAccessControlRef) {
    CFRelease(localAuthAccessControlRef);
  }
  self->_localAuthAccessControlRef = (__SecAccessControl *)CFRetain(a3);
}

- (void)run
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_13;
  }
  v7 = objc_opt_class();
  paymentSheet = self->_paymentSheet;
  id v9 = v7;
  unsigned int v10 = [(SSPaymentSheet *)paymentSheet shouldUppercaseText];
  CFStringRef v11 = @"NO";
  if (v10) {
    CFStringRef v11 = @"YES";
  }
  int v47 = 138543618;
  v48 = v7;
  __int16 v49 = 2114;
  CFStringRef v50 = v11;
  LODWORD(v45) = 22;
  v43 = &v47;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v47, v45);
    free(v12);
    v43 = (int *)v6;
    SSFileLog();
LABEL_13:
  }
  authenticationContext = self->_authenticationContext;
  if (authenticationContext)
  {
    objc_super v14 = [(AKAppleIDAuthenticationContext *)authenticationContext username];

    if (!v14)
    {
      v36 = +[SSLogConfig sharedDaemonConfig];
      if (!v36)
      {
        v36 = +[SSLogConfig sharedConfig];
      }
      unsigned int v37 = objc_msgSend(v36, "shouldLog", v43);
      if ([v36 shouldLogToDisk]) {
        int v38 = v37 | 2;
      }
      else {
        int v38 = v37;
      }
      v39 = [v36 OSLogObject];
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        v38 &= 2u;
      }
      if (v38)
      {
        v40 = objc_opt_class();
        int v47 = 138543362;
        v48 = v40;
        id v41 = v40;
        LODWORD(v45) = 12;
        v42 = (void *)_os_log_send_and_compose_impl();

        if (!v42)
        {
LABEL_63:

          ISError();
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          [(DisplayPaymentSheetOperation *)self _completeWithSuccess:0 error:v25];
          goto LABEL_64;
        }
        v39 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v42, 4, &v47, v45);
        free(v42);
        SSFileLog();
      }

      goto LABEL_63;
    }
  }
  v15 = [(DisplayPaymentSheetOperation *)self _paymentRequest];
  if (!v15)
  {
    ISError();
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v32 = [v26 shouldLog];
    if ([v26 shouldLogToDisk]) {
      int v33 = v32 | 2;
    }
    else {
      int v33 = v32;
    }
    v29 = [v26 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      v33 &= 2u;
    }
    if (!v33) {
      goto LABEL_49;
    }
    v34 = objc_opt_class();
    int v47 = 138543362;
    v48 = v34;
    id v31 = v34;
    LODWORD(v45) = 12;
    goto LABEL_47;
  }
  v16 = +[SSLogConfig sharedDaemonConfig];
  if (!v16)
  {
    v16 = +[SSLogConfig sharedConfig];
  }
  unsigned int v17 = [v16 shouldLog];
  if ([v16 shouldLogToDisk]) {
    int v18 = v17 | 2;
  }
  else {
    int v18 = v17;
  }
  v19 = [v16 OSLogObject];
  if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    v18 &= 2u;
  }
  if (v18)
  {
    v20 = objc_opt_class();
    id v21 = v20;
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v15 requestType]);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v47 = 138543618;
    v48 = v20;
    __int16 v49 = 2114;
    CFStringRef v50 = v22;
    LODWORD(v45) = 22;
    v44 = &v47;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (!v23) {
      goto LABEL_28;
    }
    v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v47, v45);
    free(v23);
    v44 = (int *)v19;
    SSFileLog();
  }

LABEL_28:
  id v46 = 0;
  unsigned __int8 v24 = [(DisplayPaymentSheetOperation *)self _presentPaymentSheetWithPaymentRequest:v15 error:&v46];
  v25 = (__CFString *)v46;
  if ((v24 & 1) == 0)
  {
    v26 = +[SSLogConfig sharedDaemonConfig];
    if (!v26)
    {
      v26 = +[SSLogConfig sharedConfig];
    }
    unsigned int v27 = objc_msgSend(v26, "shouldLog", v44);
    if ([v26 shouldLogToDisk]) {
      int v28 = v27 | 2;
    }
    else {
      int v28 = v27;
    }
    v29 = [v26 OSLogObject];
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      v28 &= 2u;
    }
    if (!v28) {
      goto LABEL_49;
    }
    v30 = objc_opt_class();
    int v47 = 138543618;
    v48 = v30;
    __int16 v49 = 2114;
    CFStringRef v50 = v25;
    id v31 = v30;
    LODWORD(v45) = 22;
LABEL_47:
    v35 = (void *)_os_log_send_and_compose_impl();

    if (!v35)
    {
LABEL_50:

      [(DisplayPaymentSheetOperation *)self _completeWithSuccess:0 error:v25];
      goto LABEL_51;
    }
    v29 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v35, 4, &v47, v45);
    free(v35);
    SSFileLog();
LABEL_49:

    goto LABEL_50;
  }
LABEL_51:

LABEL_64:
}

- (void)_completeWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  unsigned int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_13;
  }
  CFStringRef v11 = objc_opt_class();
  CFStringRef v12 = @"NO";
  int v28 = 138543874;
  v29 = v11;
  __int16 v30 = 2114;
  if (v4) {
    CFStringRef v12 = @"YES";
  }
  CFStringRef v31 = v12;
  __int16 v32 = 2114;
  id v33 = v6;
  id v13 = v11;
  LODWORD(v25) = 32;
  unsigned __int8 v24 = &v28;
  objc_super v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v28, v25);
    free(v14);
    unsigned __int8 v24 = (int *)v10;
    SSFileLog();
LABEL_13:
  }
  v15 = [(DisplayPaymentSheetOperation *)self _metricsDialogEvent];
  v16 = v15;
  if (v15)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006FFC8;
    block[3] = &unk_1003A3268;
    block[4] = self;
    id v27 = v15;
    dispatch_async(dispatchQueue, block);
  }
  -[PKPaymentAuthorizationController setDelegate:](self->_controller, "setDelegate:", 0, v24);
  [(PKPaymentAuthorizationController *)self->_controller setPrivateDelegate:0];
  [(DisplayPaymentSheetOperation *)self setError:v6];
  [(DisplayPaymentSheetOperation *)self setSuccess:v4];
  uint64_t v18 = [(DisplayPaymentSheetOperation *)self completionHandlerForAutoEnrollment];
  v19 = (void *)v18;
  if (v18)
  {
    (*(void (**)(uint64_t, NSData *, NSString *, BOOL, NSData *, NSString *, id))(v18 + 16))(v18, self->_signedChallenge, self->_passwordEquivalentToken, self->_didAuthorizePayment, self->_paymentTokenData, self->_fpanID, v6);
  }
  else
  {
    uint64_t v20 = [(DisplayPaymentSheetOperation *)self completionHandler];
    id v21 = (void *)v20;
    if (v20) {
      (*(void (**)(uint64_t, NSData *, NSString *, BOOL, id))(v20 + 16))(v20, self->_signedChallenge, self->_passwordEquivalentToken, self->_didAuthorizePayment, v6);
    }
  }
  [(DisplayPaymentSheetOperation *)self setCompletionHandler:0];
  [(DisplayPaymentSheetOperation *)self setCompletionHandlerForAutoEnrollment:0];
  uint64_t v22 = [(DisplayPaymentSheetOperation *)self containerCompletionHandler];
  v23 = (void *)v22;
  if (v22) {
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  }
  [(DisplayPaymentSheetOperation *)self setContainerCompletionHandler:0];
}

- (int64_t)_imageTypeForURL:(id)a3
{
  v3 = [a3 absoluteString];
  BOOL v4 = [v3 lowercaseString];

  if ([v4 hasSuffix:@"jpg"]) {
    int64_t v5 = 2;
  }
  else {
    int64_t v5 = [v4 hasSuffix:@"png"];
  }

  return v5;
}

- (BOOL)_isChallengeReadyToBeSigned
{
  v3 = [(DisplayPaymentSheetOperation *)self challenge];
  if (v3)
  {
    BOOL v4 = [(DisplayPaymentSheetOperation *)self accountIdentifier];
    if (v4 && [(DisplayPaymentSheetOperation *)self localAuthAccessControlRef])
    {
      int64_t v5 = [(DisplayPaymentSheetOperation *)self localAuthContext];
      if (v5)
      {
        id v6 = [(DisplayPaymentSheetOperation *)self localAuthOptions];
        BOOL v7 = v6 != 0;
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_loadURLBag
{
  id v3 = objc_alloc_init((Class)ISLoadURLBagOperation);
  id v17 = 0;
  unsigned int v4 = [(DisplayPaymentSheetOperation *)self runSubOperation:v3 returningError:&v17];
  id v5 = v17;
  id v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v15 = [v3 URLBag];
    urlBag = self->_urlBag;
    self->_urlBag = v15;
    goto LABEL_17;
  }
  urlBag = +[SSLogConfig sharedDaemonConfig];
  if (!urlBag)
  {
    urlBag = +[SSLogConfig sharedConfig];
  }
  unsigned int v9 = [urlBag shouldLog];
  if ([urlBag shouldLogToDisk]) {
    int v10 = v9 | 2;
  }
  else {
    int v10 = v9;
  }
  CFStringRef v11 = [urlBag OSLogObject];
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    v10 &= 2u;
  }
  if (!v10) {
    goto LABEL_15;
  }
  CFStringRef v12 = objc_opt_class();
  int v18 = 138543618;
  v19 = v12;
  __int16 v20 = 2114;
  id v21 = v6;
  id v13 = v12;
  LODWORD(v16) = 22;
  objc_super v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    CFStringRef v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v18, v16);
    free(v14);
    SSFileLog();
LABEL_15:
  }
LABEL_17:
}

- (id)_paymentRequest
{
  id v3 = (objc_class *)ISWeakLinkedClassForString();
  v235 = (void *)ISWeakLinkedClassForString();
  v236 = (objc_class *)ISWeakLinkedClassForString();
  id v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "setAccesssControlRef:", -[DisplayPaymentSheetOperation localAuthAccessControlRef](self, "localAuthAccessControlRef"));
  id v5 = [(DisplayPaymentSheetOperation *)self authenticationContext];
  [v4 setAppleIDAuthenticationContext:v5];

  id v6 = [(DisplayPaymentSheetOperation *)self localAuthContext];
  BOOL v7 = [v6 externalizedContext];
  [v4 setExternalizedContext:v7];

  unsigned int v8 = [(DisplayPaymentSheetOperation *)self paymentSheet];
  LODWORD(v7) = [v8 isApplePayClassic];

  unsigned int v9 = &syslog_ptr;
  if (v7)
  {
    int v10 = [(DisplayPaymentSheetOperation *)self paymentSheet];
    CFStringRef v11 = [v10 merchantSession];

    uint64_t v12 = +[SSLogConfig sharedDaemonConfig];
    id v13 = (void *)v12;
    if (v11)
    {
      if (!v12)
      {
        id v13 = +[SSLogConfig sharedConfig];
      }
      unsigned int v14 = [v13 shouldLog];
      if ([v13 shouldLogToDisk]) {
        int v15 = v14 | 2;
      }
      else {
        int v15 = v14;
      }
      uint64_t v16 = [v13 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        int v17 = v15;
      }
      else {
        int v17 = v15 & 2;
      }
      if (v17)
      {
        id v18 = (id)objc_opt_class();
        int v263 = 138543362;
        id v264 = v18;
        LODWORD(v230) = 12;
        v226 = &v263;
        v19 = (void *)_os_log_send_and_compose_impl();

        if (!v19)
        {
LABEL_15:
          uint64_t v20 = 0;
          goto LABEL_39;
        }
        uint64_t v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v263, v230);
        free(v19);
        v226 = (int *)v16;
        SSFileLog();
      }

      goto LABEL_15;
    }
    if (!v12)
    {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    v23 = [v13 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      int v27 = v26;
    }
    else {
      int v27 = v26 & 2;
    }
    if (!v27) {
      goto LABEL_37;
    }
  }
  else
  {
    id v13 = +[SSLogConfig sharedDaemonConfig];
    if (!v13)
    {
      id v13 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    v23 = [v13 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      int v24 = v22;
    }
    else {
      int v24 = v22 & 2;
    }
    if (!v24) {
      goto LABEL_37;
    }
  }
  id v28 = (id)objc_opt_class();
  int v263 = 138543362;
  id v264 = v28;
  LODWORD(v230) = 12;
  v226 = &v263;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v263, v230);
    free(v29);
    v226 = (int *)v23;
    SSFileLog();
LABEL_37:
  }
  uint64_t v20 = 1;
LABEL_39:

  [v4 setRequestType:v20];
  __int16 v30 = [v4 externalizedContext];
  if (v30)
  {
  }
  else
  {
    CFStringRef v31 = [v4 appleIDAuthenticationContext];

    if (!v31) {
      self->_isASNPurchase = 1;
    }
  }
  __int16 v32 = self->_paymentSheet;
  id v33 = [(SSPaymentSheet *)v32 currencyCode];
  [v4 setCurrencyCode:v33];

  v34 = [(SSPaymentSheet *)v32 countryCode];
  [v4 setCountryCode:v34];

  if ([(SSPaymentSheet *)v32 titleType] == (id)2)
  {
    if ([(SSPaymentSheet *)v32 isApplePayClassic])
    {
      objc_msgSend(v4, "setRequestor:", -[DisplayPaymentSheetOperation _paymentRequestorTypeForPayeeType:](self, "_paymentRequestorTypeForPayeeType:", -[SSPaymentSheet payeeType](v32, "payeeType")));
      v35 = [(SSPaymentSheet *)v32 title];
      [v4 setLocalizedNavigationTitle:v35];

      goto LABEL_50;
    }
    v39 = v4;
    unint64_t v38 = 0;
  }
  else
  {
    v36 = [(SSPaymentSheet *)v32 title];
    [v4 setLocalizedNavigationTitle:v36];

    unint64_t v37 = [(DisplayPaymentSheetOperation *)self _paymentRequestorTypeForPayeeType:[(SSPaymentSheet *)v32 payeeType]];
    if (!v37) {
      goto LABEL_50;
    }
    unint64_t v38 = v37;
    v39 = v4;
  }
  objc_msgSend(v39, "setRequestor:", v38, v226);
LABEL_50:
  v40 = +[SSLogConfig sharedDaemonConfig];
  if (!v40)
  {
    v40 = +[SSLogConfig sharedConfig];
  }
  unsigned int v41 = [v40 shouldLog];
  if ([v40 shouldLogToDisk]) {
    int v42 = v41 | 2;
  }
  else {
    int v42 = v41;
  }
  v43 = [v40 OSLogObject];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
    int v44 = v42;
  }
  else {
    int v44 = v42 & 2;
  }
  v242 = v32;
  if (!v44) {
    goto LABEL_61;
  }
  id v45 = (id)objc_opt_class();
  id v46 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 requestor]);
  id v47 = [v4 localizedNavigationTitle];
  int v263 = 138543874;
  id v264 = v45;
  __int16 v265 = 2114;
  id v266 = v46;
  __int16 v267 = 2114;
  id v268 = v47;
  LODWORD(v230) = 32;
  v227 = &v263;
  v48 = (void *)_os_log_send_and_compose_impl();

  __int16 v32 = v242;
  if (v48)
  {
    v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v48, 4, &v263, v230);
    free(v48);
    v227 = (int *)v43;
    SSFileLog();
LABEL_61:
  }
  if ((+[ISBiometricStore shouldUseAutoEnrollment](ISBiometricStore, "shouldUseAutoEnrollment") & 1) != 0|| +[ISBiometricStore shouldUseApplePayClassic])
  {
    if (!+[AMSBiometrics isActionSupported:withAccessControl:](AMSBiometrics, "isActionSupported:withAccessControl:", 4, self->_localAuthAccessControlRef, v227))
    {
      __int16 v49 = +[AMSBiometrics ACLVersionForAccessControl:self->_localAuthAccessControlRef];
      v58 = +[SSLogConfig sharedDaemonConfig];
      if (!v58)
      {
        v58 = +[SSLogConfig sharedConfig];
      }
      unsigned int v59 = [v58 shouldLog];
      if ([v58 shouldLogToDisk]) {
        int v60 = v59 | 2;
      }
      else {
        int v60 = v59;
      }
      v61 = [v58 OSLogObject];
      if (!os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT)) {
        v60 &= 2u;
      }
      if (v60)
      {
        id v62 = (id)objc_opt_class();
        int v263 = 138543618;
        id v264 = v62;
        __int16 v265 = 2114;
        id v266 = v49;
        LODWORD(v230) = 22;
        v227 = &v263;
        v63 = (void *)_os_log_send_and_compose_impl();

        if (!v63)
        {
LABEL_140:

          goto LABEL_141;
        }
        v61 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v63, 4, &v263, v230);
        free(v63);
        v227 = (int *)v61;
        SSFileLog();
      }
LABEL_139:

      goto LABEL_140;
    }
    __int16 v49 = [(SSPaymentSheet *)v32 merchantSession];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v50 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithDictionary:v49];
      uint64_t v51 = +[SSLogConfig sharedDaemonConfig];
      v52 = v51;
      if (v50)
      {
        if (!v51)
        {
          v52 = +[SSLogConfig sharedConfig];
        }
        unsigned int v53 = [v52 shouldLog];
        if ([v52 shouldLogToDisk]) {
          int v54 = v53 | 2;
        }
        else {
          int v54 = v53;
        }
        v55 = [v52 OSLogObject];
        if (!os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT)) {
          v54 &= 2u;
        }
        if (v54)
        {
          id v56 = (id)objc_opt_class();
          int v263 = 138543362;
          id v264 = v56;
          LODWORD(v230) = 12;
          v227 = &v263;
          v57 = (void *)_os_log_send_and_compose_impl();

          if (!v57)
          {
LABEL_78:

            [v4 setMerchantSession:v50];
            [v4 setMerchantCapabilities:13];
            self->_didAttemptDualActionBuy = 1;
            goto LABEL_111;
          }
          v55 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v57, 4, &v263, v230);
          free(v57);
          v227 = (int *)v55;
          SSFileLog();
        }

        goto LABEL_78;
      }
      if (!v51)
      {
        v52 = +[SSLogConfig sharedConfig];
      }
      unsigned int v68 = [v52 shouldLog];
      if ([v52 shouldLogToDisk]) {
        int v69 = v68 | 2;
      }
      else {
        int v69 = v68;
      }
      v70 = [v52 OSLogObject];
      if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        v69 &= 2u;
      }
      if (!v69) {
        goto LABEL_109;
      }
      id v71 = (id)objc_opt_class();
      int v263 = 138543362;
      id v264 = v71;
      LODWORD(v230) = 12;
      v227 = &v263;
      v72 = (void *)_os_log_send_and_compose_impl();

      if (v72)
      {
        v70 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v72, 4, &v263, v230);
        free(v72);
        v227 = (int *)v70;
        SSFileLog();
LABEL_109:
      }
    }
    else
    {
      id v50 = +[SSLogConfig sharedDaemonConfig];
      if (!v50)
      {
        id v50 = +[SSLogConfig sharedConfig];
      }
      unsigned int v64 = [v50 shouldLog];
      if ([v50 shouldLogToDisk]) {
        int v65 = v64 | 2;
      }
      else {
        int v65 = v64;
      }
      v52 = [v50 OSLogObject];
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
        v65 &= 2u;
      }
      if (v65)
      {
        id v66 = (id)objc_opt_class();
        int v263 = 138543362;
        id v264 = v66;
        LODWORD(v230) = 12;
        v227 = &v263;
        v67 = (void *)_os_log_send_and_compose_impl();

        if (!v67) {
          goto LABEL_111;
        }
        v52 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v67, 4, &v263, v230);
        free(v67);
        v227 = (int *)v52;
        SSFileLog();
      }
    }

LABEL_111:
    if (![(SSPaymentSheet *)v242 isApplePayClassic])
    {
LABEL_141:

      __int16 v32 = v242;
      goto LABEL_142;
    }
    v58 = [(SSPaymentSheet *)v242 countryCode];
    if (v58)
    {
      v73 = +[NSSet setWithObject:v58];
      [v4 setSupportedCountries:v73];
      goto LABEL_125;
    }
    v73 = +[SSLogConfig sharedDaemonConfig];
    if (!v73)
    {
      v73 = +[SSLogConfig sharedConfig];
    }
    unsigned int v74 = objc_msgSend(v73, "shouldLog", v227);
    if ([v73 shouldLogToDisk]) {
      int v75 = v74 | 2;
    }
    else {
      int v75 = v74;
    }
    v76 = [v73 OSLogObject];
    if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
      v75 &= 2u;
    }
    if (v75)
    {
      id v77 = (id)objc_opt_class();
      int v263 = 138543362;
      id v264 = v77;
      LODWORD(v230) = 12;
      v227 = &v263;
      v78 = (void *)_os_log_send_and_compose_impl();

      if (!v78) {
        goto LABEL_125;
      }
      v76 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v78, 4, &v263, v230);
      free(v78);
      v227 = (int *)v76;
      SSFileLog();
    }

LABEL_125:
    v61 = +[ISBiometricStore applePayClassicNetworks];
    if (v61)
    {
      [v4 setSupportedNetworks:v61];
      goto LABEL_139;
    }
    v79 = +[SSLogConfig sharedDaemonConfig];
    if (!v79)
    {
      v79 = +[SSLogConfig sharedConfig];
    }
    unsigned int v80 = objc_msgSend(v79, "shouldLog", v227);
    if ([v79 shouldLogToDisk]) {
      int v81 = v80 | 2;
    }
    else {
      int v81 = v80;
    }
    v82 = [v79 OSLogObject];
    if (!os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      v81 &= 2u;
    }
    if (v81)
    {
      id v83 = (id)objc_opt_class();
      int v263 = 138543362;
      id v264 = v83;
      LODWORD(v230) = 12;
      v227 = &v263;
      v84 = (void *)_os_log_send_and_compose_impl();

      unsigned int v9 = &syslog_ptr;
      if (!v84)
      {
LABEL_138:

        goto LABEL_139;
      }
      v82 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v84, 4, &v263, v230);
      free(v84);
      v227 = (int *)v82;
      SSFileLog();
    }

    goto LABEL_138;
  }
LABEL_142:
  v241 = objc_opt_new();
  v85 = [(SSPaymentSheet *)v32 salableInfoLabel];

  v247 = self;
  if (!v85) {
    goto LABEL_238;
  }
  id v86 = objc_alloc_init(v236);
  [(SSPaymentSheet *)v32 salableIconURL];
  v233 = v231 = v86;
  if (v233)
  {
    if ([(SSPaymentSheet *)self->_paymentSheet payeeType] == (id)3
      && ![(SSPaymentSheet *)self->_paymentSheet salableIconType])
    {
      uint64_t v88 = 1;
    }
    else
    {
      unint64_t v87 = (unint64_t)[(SSPaymentSheet *)self->_paymentSheet salableIconType] - 1;
      if (v87 > 3) {
        uint64_t v88 = 0;
      }
      else {
        uint64_t v88 = qword_10031F8B0[v87];
      }
    }
    v89 = [(DisplayPaymentSheetOperation *)self paymentSheet];
    v90 = [v89 designVersion];
    v91 = [(DisplayPaymentSheetOperation *)self _createImageRefWithURL:v233 adornmentStyle:v88 designVersion:v90];

    if (v91)
    {
      CFArrayAppendValue(self->_imageArrayRef, v91);
      int64_t v92 = self->_imageArrayIndex + 1;
      self->_imageArrayIndex = v92;
      objc_msgSend(v86, "setImage:", CFArrayGetValueAtIndex(self->_imageArrayRef, v92));
      CGImageRelease(v91);
      goto LABEL_165;
    }
    v93 = +[SSLogConfig sharedDaemonConfig];
    if (!v93)
    {
      v93 = +[SSLogConfig sharedConfig];
    }
    unsigned int v94 = [v93 shouldLog];
    if ([v93 shouldLogToDisk]) {
      int v95 = v94 | 2;
    }
    else {
      int v95 = v94;
    }
    v96 = [v93 OSLogObject];
    if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR)) {
      int v97 = v95;
    }
    else {
      int v97 = v95 & 2;
    }
    if (v97)
    {
      id v98 = (id)objc_opt_class();
      int v263 = 138543618;
      id v264 = v98;
      __int16 v265 = 2114;
      id v266 = v233;
      LODWORD(v230) = 22;
      v227 = &v263;
      v99 = (void *)_os_log_send_and_compose_impl();

      if (!v99)
      {
LABEL_164:

        goto LABEL_165;
      }
      v96 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v99, 4, &v263, v230);
      free(v99);
      v227 = (int *)v96;
      SSFileLog();
    }

    goto LABEL_164;
  }
LABEL_165:
  id v232 = v4;
  v100 = [(SSPaymentSheet *)v32 inlineImages];
  id v101 = [v100 count];
  uint64_t v102 = +[SSLogConfig sharedDaemonConfig];
  v103 = (void *)v102;
  if (!v101)
  {
    if (!v102)
    {
      v103 = +[SSLogConfig sharedConfig];
    }
    unsigned int v112 = [v103 shouldLog];
    if ([v103 shouldLogToDisk]) {
      int v113 = v112 | 2;
    }
    else {
      int v113 = v112;
    }
    v114 = [v103 OSLogObject];
    if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT)) {
      int v115 = v113;
    }
    else {
      int v115 = v113 & 2;
    }
    if (v115)
    {
      id v116 = (id)objc_opt_class();
      int v263 = 138543362;
      id v264 = v116;
      LODWORD(v230) = 12;
      v228 = &v263;
      v117 = (void *)_os_log_send_and_compose_impl();

      v109 = &syslog_ptr;
      if (!v117)
      {
LABEL_193:

        goto LABEL_194;
      }
      v114 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v117, 4, &v263, v230);
      free(v117);
      v228 = (int *)v114;
      SSFileLog();
    }
    else
    {
      v109 = &syslog_ptr;
    }

    goto LABEL_193;
  }
  if (!v102)
  {
    v103 = +[SSLogConfig sharedConfig];
  }
  unsigned int v104 = [v103 shouldLog];
  if ([v103 shouldLogToDisk]) {
    int v105 = v104 | 2;
  }
  else {
    int v105 = v104;
  }
  v106 = [v103 OSLogObject];
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT)) {
    int v107 = v105;
  }
  else {
    int v107 = v105 & 2;
  }
  if (!v107)
  {
    v109 = &syslog_ptr;
    goto LABEL_189;
  }
  id v108 = (id)objc_opt_class();
  v109 = &syslog_ptr;
  v110 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v100 count]);
  int v263 = 138543618;
  id v264 = v108;
  __int16 v265 = 2114;
  id v266 = v110;
  LODWORD(v230) = 22;
  v228 = &v263;
  v111 = (void *)_os_log_send_and_compose_impl();

  __int16 v32 = v242;
  if (v111)
  {
    v106 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v111, 4, &v263, v230);
    free(v111);
    v228 = (int *)v106;
    SSFileLog();
LABEL_189:
  }
  v260[0] = _NSConcreteStackBlock;
  v260[1] = 3221225472;
  v260[2] = sub_100072904;
  v260[3] = &unk_1003A4BF0;
  v260[4] = self;
  [v100 enumerateObjectsUsingBlock:v260];
LABEL_194:
  v245 = [(SSPaymentSheet *)v32 salableInfoLabel];
  if ([v100 count])
  {
    CFIndex v118 = 0;
    while (1)
    {
      if (v118 <= self->_inlineImageArrayIndex)
      {
        ValueAtIndex = (CGImage *)CFArrayGetValueAtIndex(self->_inlineImageArrayRef, v118);
        Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
        v129 = CGImageDestinationCreateWithData(Mutable, kUTTypePNG, 1uLL, 0);
        CGImageDestinationAddImage(v129, ValueAtIndex, 0);
        if (CGImageDestinationFinalize(v129))
        {
          v130 = [v109[333] numberWithLong:v118];
          v131 = +[NSString stringWithFormat:@"%@", v130];

          self = v247;
          if (v118 <= v247->_assetScaleIndex) {
            objc_msgSend((id)CFArrayGetValueAtIndex(v247->_assetScaleRef, v118), "floatValue");
          }
          if (v118 <= v247->_tintArrayIndex) {
            CFArrayGetValueAtIndex(v247->_tintArrayRef, v118);
          }
          v134 = v245;
          v245 = SSPaymentSheetImagePlaceholderReplaceTagWithImageDataAndTint();
LABEL_229:

LABEL_230:
          if (Mutable) {
            CFRelease(Mutable);
          }
          unsigned int v9 = &syslog_ptr;
          if (v129) {
            CFRelease(v129);
          }
          goto LABEL_234;
        }
        v131 = [v9[405] sharedDaemonConfig];
        if (!v131)
        {
          v131 = +[SSLogConfig sharedConfig];
        }
        unsigned int v132 = [v131 shouldLog];
        if ([v131 shouldLogToDisk]) {
          int v133 = v132 | 2;
        }
        else {
          int v133 = v132;
        }
        v134 = [v131 OSLogObject];
        if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
          int v135 = v133;
        }
        else {
          int v135 = v133 & 2;
        }
        if (v135)
        {
          id v136 = (id)objc_opt_class();
          int v263 = 138543362;
          id v264 = v136;
          LODWORD(v230) = 12;
          v227 = &v263;
          v137 = (void *)_os_log_send_and_compose_impl();

          if (!v137)
          {
            self = v247;
            v109 = &syslog_ptr;
            goto LABEL_230;
          }
          v134 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v137, 4, &v263, v230);
          free(v137);
          v227 = (int *)v134;
          SSFileLog();
        }
        self = v247;
        v109 = &syslog_ptr;
        goto LABEL_229;
      }
      v119 = [v9[405] sharedDaemonConfig];
      if (!v119)
      {
        v119 = [v9[405] sharedConfig];
      }
      int v120 = [v119 shouldLog];
      if ([v119 shouldLogToDisk]) {
        v120 |= 2u;
      }
      v121 = [v119 OSLogObject];
      if (!(os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT) ? v120 : v120 & 2)) {
        break;
      }
      id v123 = (id)objc_opt_class();
      v124 = +[NSNumber numberWithLong:v118];
      v125 = +[NSNumber numberWithLong:self->_inlineImageArrayIndex];
      int v263 = 138412802;
      id v264 = v123;
      __int16 v265 = 2112;
      id v266 = v124;
      __int16 v267 = 2112;
      id v268 = v125;
      LODWORD(v230) = 32;
      v227 = &v263;
      v126 = (void *)_os_log_send_and_compose_impl();

      v109 = &syslog_ptr;
      if (v126)
      {
        v121 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v126, 4, &v263, v230);
        free(v126);
        v227 = (int *)v121;
        SSFileLog();
LABEL_225:
      }
      self = v247;
      unsigned int v9 = &syslog_ptr;
LABEL_234:
      if (++v118 >= (unint64_t)objc_msgSend(v100, "count", v227)) {
        goto LABEL_237;
      }
    }
    v109 = &syslog_ptr;
    goto LABEL_225;
  }
LABEL_237:
  v138 = SSPaymentSheetImagePlaceholderRemoveAllTags();

  id v139 = [objc_alloc((Class)NSAttributedString) initWithString:&stru_1003B9B00];
  [v231 setTitle:v139];

  [v231 setLabel:v138];
  [v241 addObject:v231];

  id v4 = v232;
  __int16 v32 = v242;
LABEL_238:
  v140 = [(SSPaymentSheet *)v32 ratingHeader];
  uint64_t v141 = [(SSPaymentSheet *)v32 ratingValue];
  uint64_t v142 = v141;
  if (v140 && v141)
  {
    id v143 = objc_alloc_init(v236);
    id v144 = [objc_alloc((Class)NSAttributedString) initWithString:v140];
    [v143 setTitle:v144];

    id v145 = [objc_alloc((Class)NSAttributedString) initWithString:v142];
    [v143 setLabel:v145];

    [v241 addObject:v143];
  }
  v146 = [(SSPaymentSheet *)v32 flexList];
  if (v146)
  {
    v257[0] = _NSConcreteStackBlock;
    v257[1] = 3221225472;
    v257[2] = sub_100073010;
    v257[3] = &unk_1003A4C18;
    v257[4] = self;
    v259 = v236;
    id v258 = v241;
    [(__CFString *)v146 enumerateObjectsUsingBlock:v257];
  }
  type = v146;
  v147 = [(SSPaymentSheet *)v32 attributedList];
  v246 = (void *)v142;
  if (v147)
  {
    v254[0] = _NSConcreteStackBlock;
    v254[1] = 3221225472;
    v254[2] = sub_100073420;
    v254[3] = &unk_1003A4C90;
    v256 = v235;
    v148 = objc_alloc_init((Class)NSMutableArray);
    v255 = v148;
    [v147 enumerateObjectsUsingBlock:v254];
    v149 = [(DisplayPaymentSheetOperation *)v247 paymentSheet];
    v150 = [v149 paymentSummary];

    v151 = [(DisplayPaymentSheetOperation *)v247 paymentSheet];
    v152 = v151;
    if (v150)
    {
      uint64_t v153 = [v151 paymentSummary];
    }
    else
    {
      v160 = [v151 storeName];

      if (v160)
      {
        v152 = +[NSBundle bundleForClass:objc_opt_class()];
        v161 = [v152 localizedStringForKey:@"CONFIRMATION_TITLE_PAY" value:&stru_1003B9B00 table:@"Mesa"];
        v162 = self;
        [v162 paymentSheet];
        v163 = v147;
        v165 = v164 = v140;
        v166 = [v165 storeName];
        v154 = +[NSString stringWithFormat:@"%@ %@", v161, v166];

        unsigned int v9 = &syslog_ptr;
        v140 = v164;
        v147 = v163;

        goto LABEL_260;
      }
      v152 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v153 = [v152 localizedStringForKey:@"CONFIRMATION_TITLE_PAY" value:&stru_1003B9B00 table:@"Mesa"];
    }
    v154 = (void *)v153;
LABEL_260:

    v167 = [(DisplayPaymentSheetOperation *)v247 paymentSheet];
    uint64_t v168 = [v167 price];
    v169 = (void *)v168;
    if (v168) {
      v170 = (_UNKNOWN **)v168;
    }
    else {
      v170 = &off_1003C9090;
    }
    v171 = v170;

    [v171 decimalValue];
    v172 = +[NSDecimalNumber decimalNumberWithDecimal:v253];
    v173 = [v235 summaryItemWithLabel:v154 amount:v172];

    [v148 addObject:v173];
    id v159 = [v148 copy];

    v156 = v255;
    __int16 v32 = v242;
    goto LABEL_264;
  }
  v148 = [v9[405] sharedDaemonConfig];
  if (!v148)
  {
    v148 = [v9[405] sharedConfig];
  }
  unsigned int v155 = [v148 shouldLog];
  if ([v148 shouldLogToDisk]) {
    v155 |= 2u;
  }
  v156 = [v148 OSLogObject];
  if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT)) {
    int v157 = v155;
  }
  else {
    int v157 = v155 & 2;
  }
  if (v157)
  {
    id v158 = (id)objc_opt_class();
    int v263 = 138543362;
    id v264 = v158;
    LODWORD(v230) = 12;
    v229 = &v263;
    id v159 = (id)_os_log_send_and_compose_impl();

    if (!v159) {
      goto LABEL_265;
    }
    v156 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v159, 4, &v263, v230);
    free(v159);
    v229 = (int *)v156;
    SSFileLog();
  }
  id v159 = 0;
LABEL_264:

LABEL_265:
  v174 = [(DisplayPaymentSheetOperation *)v247 paymentSheet];
  v175 = [v174 designVersion];
  uint64_t v176 = AMSPaymentSheetDesignVersion_2_0;
  unsigned __int8 v177 = [v175 isEqualToNumber:AMSPaymentSheetDesignVersion_2_0];

  CFAllocatorRef allocator = (CFAllocatorRef)v159;
  if (v177) {
    goto LABEL_285;
  }
  v178 = [(SSPaymentSheet *)v32 accountHeader];
  if (v178)
  {
    v179 = [(DisplayPaymentSheetOperation *)v247 accountName];
    v180 = +[SSPaymentSheet stringWithFormattedUsernameForString:SSPaymentSheetAppleIDUppercaseReplacementPattern username:v179];
    if (v180)
    {
      id v181 = objc_alloc_init(v236);
      id v182 = [objc_alloc((Class)NSAttributedString) initWithString:v178];
      [v181 setTitle:v182];

      id v183 = [objc_alloc((Class)NSAttributedString) initWithString:v180];
      [v181 setLabel:v183];

      [v241 addObject:v181];
LABEL_283:
      id v159 = allocator;

      unsigned int v9 = &syslog_ptr;
      __int16 v32 = v242;
      goto LABEL_284;
    }
    v238 = v147;
    v184 = v140;
    id v185 = v4;
    id v181 = [v9[405] sharedDaemonConfig];
    if (!v181)
    {
      id v181 = +[SSLogConfig sharedConfig];
    }
    unsigned int v186 = objc_msgSend(v181, "shouldLog", v229);
    if ([v181 shouldLogToDisk]) {
      v186 |= 2u;
    }
    v187 = [v181 OSLogObject];
    if (os_log_type_enabled(v187, OS_LOG_TYPE_ERROR)) {
      int v188 = v186;
    }
    else {
      int v188 = v186 & 2;
    }
    if (v188)
    {
      id v189 = (id)objc_opt_class();
      int v263 = 138543362;
      id v264 = v189;
      LODWORD(v230) = 12;
      v229 = &v263;
      v190 = (void *)_os_log_send_and_compose_impl();

      if (!v190)
      {
        id v4 = v185;
        goto LABEL_282;
      }
      v187 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v190, 4, &v263, v230);
      free(v190);
      v229 = (int *)v187;
      SSFileLog();
    }
    id v4 = v185;

LABEL_282:
    v140 = v184;
    v147 = v238;
    goto LABEL_283;
  }
LABEL_284:

LABEL_285:
  objc_msgSend(v4, "setPaymentContentItems:", v241, v229);
  if ([v159 count])
  {
    [v4 setPaymentSummaryItems:v159];
    [v4 setPaymentSummaryPinned:1];
    [v4 setSuppressTotal:1];
  }
  else
  {
    v191 = [(SSPaymentSheet *)v32 paymentSummary];
    uint64_t v192 = [(SSPaymentSheet *)v32 storeName];
    v234 = v140;
    v237 = (void *)v192;
    v239 = v147;
    v193 = v4;
    if (v191)
    {
      id v194 = v191;
    }
    else
    {
      uint64_t v195 = v192;
      if (v192)
      {
        v196 = +[NSBundle bundleForClass:objc_opt_class()];
        v197 = [v196 localizedStringForKey:@"CONFIRMATION_TITLE_PAY" value:&stru_1003B9B00 table:@"Mesa"];
        id v194 = +[NSString stringWithFormat:@"%@ %@", v197, v195];
      }
      else
      {
        v198 = +[NSBundle bundleForClass:objc_opt_class()];
        id v194 = [v198 localizedStringForKey:@"CONFIRMATION_TITLE_PAY" value:&stru_1003B9B00 table:@"Mesa"];
      }
    }
    uint64_t v199 = [(SSPaymentSheet *)v242 price];
    v200 = (void *)v199;
    v201 = &off_1003C9090;
    if (v199) {
      v201 = (_UNKNOWN **)v199;
    }
    v202 = v201;

    [v202 decimalValue];
    v203 = +[NSDecimalNumber decimalNumberWithDecimal:v252];
    v204 = [v235 summaryItemWithLabel:v194 amount:v203];

    id v205 = objc_alloc_init((Class)NSMutableArray);
    v206 = [(SSPaymentSheet *)v242 priceSectionItems];
    v249[0] = _NSConcreteStackBlock;
    v249[1] = 3221225472;
    v249[2] = sub_1000738BC;
    v249[3] = &unk_1003A4CB8;
    v251 = v235;
    id v207 = v205;
    id v250 = v207;
    [v206 enumerateObjectsUsingBlock:v249];
    if (v191 && v206) {
      [v193 setLocalizedSummaryItemsTitle:v191];
    }
    [v207 addObject:v204];
    [v193 setPaymentSummaryItems:v207];
    uint64_t v208 = [(SSPaymentSheet *)v242 price];
    if (!v208
      || (v209 = (void *)v208,
          unsigned int v210 = [(SSPaymentSheet *)v242 shouldSuppressPrice],
          v209,
          v210))
    {
      [v193 setSuppressTotal:1];
    }

    id v4 = v193;
    unsigned int v9 = &syslog_ptr;
    __int16 v32 = v242;
    v140 = v234;
    v147 = v239;
  }
  id v211 = [(SSPaymentSheet *)v32 confirmationTitleType];
  if ((unint64_t)v211 <= 5) {
    [v4 setConfirmationStyle:v211];
  }
  v212 = [(SSPaymentSheet *)v32 designVersion];
  unsigned int v213 = [v212 isEqualToNumber:v176];

  v214 = v246;
  if (v213)
  {
    [v4 setClientViewSourceIdentifier:@"AMSUIPaymentSheetViewProvider"];
    id v248 = 0;
    v215 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v248];
    id v216 = v248;
    if (!v216)
    {
      if (!v215)
      {
LABEL_321:

        goto LABEL_322;
      }
      CFStringRef v261 = @"AMSPaymentSheetPaymentRequest";
      v262 = v215;
      v218 = +[NSDictionary dictionaryWithObjects:&v262 forKeys:&v261 count:1];
      [v4 setClientViewSourceParameter:v218];
LABEL_320:

      v214 = v246;
      goto LABEL_321;
    }
    v240 = v147;
    v217 = v140;
    v218 = [v9[405] sharedDaemonConfig];
    if (!v218)
    {
      v218 = [v9[405] sharedConfig];
    }
    unsigned int v219 = [v218 shouldLog];
    if ([v218 shouldLogToDisk]) {
      v219 |= 2u;
    }
    v220 = [v218 OSLogObject];
    if (os_log_type_enabled(v220, OS_LOG_TYPE_ERROR)) {
      int v221 = v219;
    }
    else {
      int v221 = v219 & 2;
    }
    if (v221)
    {
      id v222 = (id)objc_opt_class();
      int v263 = 138543618;
      id v264 = v222;
      __int16 v265 = 2114;
      id v266 = v216;
      LODWORD(v230) = 22;
      v223 = (void *)_os_log_send_and_compose_impl();

      if (!v223)
      {
        __int16 v32 = v242;
        v140 = v217;
        goto LABEL_319;
      }
      v220 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v223, 4, &v263, v230);
      free(v223);
      SSFileLog();
    }
    v140 = v217;

    __int16 v32 = v242;
LABEL_319:
    v147 = v240;
    goto LABEL_320;
  }
LABEL_322:
  id v224 = v4;

  return v224;
}

- (unint64_t)_paymentRequestorTypeForPayeeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return qword_10031F8D0[a3 - 1];
  }
}

- (int64_t)_paymentSheetStyle
{
  uint64_t v3 = [(DisplayPaymentSheetOperation *)self localAuthContext];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(DisplayPaymentSheetOperation *)self authenticationContext];

    if (v5) {
      return 1;
    }
  }
  BOOL v7 = [(DisplayPaymentSheetOperation *)self authenticationContext];

  if (v7) {
    return 2;
  }
  else {
    return 3;
  }
}

- (BOOL)_presentPaymentSheetWithPaymentRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    BOOL v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_opt_class();
    id v11 = *(id *)((char *)location + 4);
    LODWORD(v34) = 12;
    id v33 = location;
    uint64_t v12 = (void *)_os_log_send_and_compose_impl();

    if (v12)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, location, v34);
      id v13 = (id *)objc_claimAutoreleasedReturnValue();
      free(v12);
      id v33 = v13;
      SSFileLog();
    }
  }
  else
  {
  }
  unsigned int v14 = (PKPaymentAuthorizationController *)[objc_alloc((Class)ISWeakLinkedClassForString()) initWithPaymentRequest:v6];
  controller = self->_controller;
  self->_controller = v14;

  if (self->_controller)
  {
    uint64_t v16 = +[SSLogConfig sharedDaemonConfig];
    if (!v16)
    {
      uint64_t v16 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = objc_msgSend(v16, "shouldLog", v33);
    if ([v16 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    v19 = [v16 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      v18 &= 2u;
    }
    if (v18)
    {
      uint64_t v20 = objc_opt_class();
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v20;
      id v21 = v20;
      LODWORD(v34) = 12;
      int v22 = (void *)_os_log_send_and_compose_impl();

      if (!v22)
      {
LABEL_24:

        [(PKPaymentAuthorizationController *)self->_controller setDelegate:self];
        [(PKPaymentAuthorizationController *)self->_controller setPrivateDelegate:self];
        objc_initWeak(location, self);
        v23 = self->_controller;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_100073F40;
        v35[3] = &unk_1003A4CE0;
        objc_copyWeak(&v36, location);
        v35[4] = self;
        [(PKPaymentAuthorizationController *)v23 presentWithCompletion:v35];
        objc_destroyWeak(&v36);
        objc_destroyWeak(location);
        int v24 = 0;
        goto LABEL_37;
      }
      v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, location, v34);
      free(v22);
      SSFileLog();
    }

    goto LABEL_24;
  }
  int v24 = ISError();
  unsigned int v25 = +[SSLogConfig sharedDaemonConfig];
  if (!v25)
  {
    unsigned int v25 = +[SSLogConfig sharedConfig];
  }
  unsigned int v26 = objc_msgSend(v25, "shouldLog", v33);
  if ([v25 shouldLogToDisk]) {
    int v27 = v26 | 2;
  }
  else {
    int v27 = v26;
  }
  id v28 = [v25 OSLogObject];
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    v27 &= 2u;
  }
  if (!v27) {
    goto LABEL_35;
  }
  v29 = objc_opt_class();
  LODWORD(location[0]) = 138543362;
  *(id *)((char *)location + 4) = v29;
  id v30 = v29;
  LODWORD(v34) = 12;
  CFStringRef v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    id v28 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v31, 4, location, v34);
    free(v31);
    SSFileLog();
LABEL_35:
  }
LABEL_37:
  if (a4) {
    *a4 = v24;
  }

  return v24 == 0;
}

- (float)_challengeSigningDelay
{
  uint64_t v3 = +[ISDevice sharedInstance];
  id v4 = [v3 deviceBiometricStyle];

  if (self->_touchIDDelayEnabled && v4 == (id)2)
  {
    urlBag = self->_urlBag;
    if (urlBag || ([(DisplayPaymentSheetOperation *)self _loadURLBag], (urlBag = self->_urlBag) != 0))
    {
      id v6 = [(ISURLBag *)urlBag valueForKey:@"touchIDChallengeSigningDelay"];
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 floatValue];
          float v12 = 0.0;
          if (v15 <= 0.0) {
            goto LABEL_44;
          }
          float v16 = v15;
          unsigned int v17 = +[SSLogConfig sharedDaemonConfig];
          if (!v17)
          {
            unsigned int v17 = +[SSLogConfig sharedConfig];
          }
          unsigned int v18 = [v17 shouldLog];
          if ([v17 shouldLogToDisk]) {
            int v19 = v18 | 2;
          }
          else {
            int v19 = v18;
          }
          uint64_t v20 = [v17 OSLogObject];
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            v19 &= 2u;
          }
          if (v19)
          {
            *(_DWORD *)__int16 v32 = 138543618;
            *(void *)&v32[4] = objc_opt_class();
            *(_WORD *)&v32[12] = 2114;
            *(void *)&v32[14] = v6;
            id v21 = *(id *)&v32[4];
            LODWORD(v31) = 22;
            int v22 = (void *)_os_log_send_and_compose_impl();

            if (!v22)
            {
LABEL_31:

              float v12 = v16;
              goto LABEL_44;
            }
            uint64_t v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v22, 4, v32, v31, *(void *)v32, *(_OWORD *)&v32[8]);
            free(v22);
            SSFileLog();
          }

          goto LABEL_31;
        }
      }
      int v9 = +[SSLogConfig sharedDaemonConfig];
      if (!v9)
      {
        int v9 = +[SSLogConfig sharedConfig];
      }
      unsigned int v23 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v24 = v23 | 2;
      }
      else {
        int v24 = v23;
      }
      unsigned int v25 = [v9 OSLogObject];
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
        v24 &= 2u;
      }
      if (!v24) {
        goto LABEL_42;
      }
      *(_DWORD *)__int16 v32 = 138543362;
      *(void *)&v32[4] = objc_opt_class();
      id v26 = *(id *)&v32[4];
      LODWORD(v31) = 12;
      int v27 = (void *)_os_log_send_and_compose_impl();

      if (v27)
      {
        unsigned int v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, v32, v31, *(void *)v32, *(void *)&v32[8]);
        free(v27);
        SSFileLog();
LABEL_42:
      }
    }
    else
    {
      id v6 = +[SSLogConfig sharedDaemonConfig];
      if (!v6)
      {
        id v6 = +[SSLogConfig sharedConfig];
      }
      unsigned int v29 = [v6 shouldLog];
      if ([v6 shouldLogToDisk]) {
        int v30 = v29 | 2;
      }
      else {
        int v30 = v29;
      }
      int v9 = [v6 OSLogObject];
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        v30 &= 2u;
      }
      if (v30) {
        goto LABEL_13;
      }
    }
LABEL_43:

    float v12 = 0.0;
    goto LABEL_44;
  }
  id v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    id v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  int v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (!v8) {
    goto LABEL_43;
  }
LABEL_13:
  *(_DWORD *)__int16 v32 = 138543362;
  *(void *)&v32[4] = objc_opt_class();
  id v10 = *(id *)&v32[4];
  LODWORD(v31) = 12;
  id v11 = (void *)_os_log_send_and_compose_impl();

  float v12 = 0.0;
  if (v11)
  {
    id v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v32, v31, *(_OWORD *)v32);
    free(v11);
    SSFileLog();
  }
LABEL_44:

  return v12;
}

- (id)_metricsDialogEvent
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  int64_t v4 = [(DisplayPaymentSheetOperation *)self _paymentSheetStyle];
  if (v4 == 3)
  {
    uint64_t v5 = SSAuthorizationMetricsKeyEventType;
    id v6 = &off_1003C9108;
  }
  else
  {
    if (v4 != 2)
    {
      if (v4 == 1)
      {
        [v3 setObject:&off_1003C90A8 forKeyedSubscript:SSAuthorizationMetricsKeyEventType];
        if (self->_didAuthorizePayment)
        {
          [v3 setObject:&off_1003C90D8 forKeyedSubscript:SSAuthorizationMetricsKeyBiometricMatchState];
        }
        else
        {
          [v3 setObject:&off_1003C90C0 forKeyedSubscript:SSAuthorizationMetricsKeyBiometricMatchState];
          if (self->_didCancelHomeButton) {
            uint64_t v9 = 32;
          }
          else {
            uint64_t v9 = 8;
          }
          id v10 = +[SSAuthorizationMetricsController userActionDictionaryForBiometricMatchState:v9 didBiometricsLockout:self->_didBiometricsLockout];
          if (v10) {
            [(NSMutableArray *)self->_userActions addObject:v10];
          }
        }
        if (self->_didAttemptDualActionBuy)
        {
          if (self->_paymentTokenData) {
            id v11 = &SSMetricsDialogEventResultSuccess;
          }
          else {
            id v11 = &SSMetricsDialogEventResultFailure;
          }
          [v3 setObject:*v11 forKeyedSubscript:SSAuthorizationMetricsKeyDualAction];
        }
      }
      goto LABEL_26;
    }
    uint64_t v5 = SSAuthorizationMetricsKeyEventType;
    id v6 = &off_1003C90F0;
  }
  [v3 setObject:v6 forKeyedSubscript:v5];
  if (!self->_didAuthorizePayment)
  {
    if (self->_didCancelHomeButton) {
      uint64_t v7 = 9;
    }
    else {
      uint64_t v7 = 4;
    }
    int v8 = +[SSAuthorizationMetricsController userActionDictionaryForUserAction:v7 didBiometricsLockout:self->_didBiometricsLockout];
    if (v8) {
      [(NSMutableArray *)self->_userActions addObject:v8];
    }
  }
LABEL_26:
  float v12 = [(DisplayPaymentSheetOperation *)self paymentSheet];
  id v13 = [v12 buyParams];

  if (v13) {
    [v3 setObject:v13 forKeyedSubscript:SSAuthorizationMetricsKeyBuyParams];
  }
  unsigned int v14 = [(DisplayPaymentSheetOperation *)self dialogId];
  if (v14) {
    [v3 setObject:v14 forKeyedSubscript:SSAuthorizationMetricsKeyDialogID];
  }
  float v15 = [(DisplayPaymentSheetOperation *)self userAgent];
  if (v15) {
    [v3 setObject:v15 forKeyedSubscript:SSAuthorizationMetricsKeyUserAgent];
  }
  float v16 = +[SSAuthorizationMetricsController authorizationDialogEventForParameters:v3];
  [v16 setUserActions:self->_userActions];

  return v16;
}

- (void)_postMetricsWithDialogEvent:(id)a3
{
  id v4 = a3;
  urlBag = self->_urlBag;
  if (urlBag || ([(DisplayPaymentSheetOperation *)self _loadURLBag], (urlBag = self->_urlBag) != 0))
  {
    id v6 = [(ISURLBag *)urlBag valueForKey:SSMetricsURLBagKey];
    if ([v6 count])
    {
      objc_initWeak(location, self);
      id v7 = [objc_alloc((Class)SSMetricsConfiguration) initWithGlobalConfiguration:v6];
      id v8 = objc_alloc_init((Class)SSMetricsController);
      [v8 setGlobalConfiguration:v7];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100074F60;
      v25[3] = &unk_1003A4D08;
      objc_copyWeak(&v26, location);
      [v8 insertEvent:v4 withCompletionHandler:v25];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100075110;
      v23[3] = &unk_1003A4D08;
      objc_copyWeak(&v24, location);
      [v8 flushUnreportedEventsWithCompletionHandler:v23];
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v26);

      objc_destroyWeak(location);
    }
    else
    {
      uint64_t v9 = +[SSLogConfig sharedDaemonConfig];
      if (!v9)
      {
        uint64_t v9 = +[SSLogConfig sharedConfig];
      }
      unsigned int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      float v12 = [v9 OSLogObject];
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        v11 &= 2u;
      }
      if (v11)
      {
        LODWORD(location[0]) = 138543362;
        *(id *)((char *)location + 4) = (id)objc_opt_class();
        id v13 = *(id *)((char *)location + 4);
        LODWORD(v22) = 12;
        unsigned int v14 = (void *)_os_log_send_and_compose_impl();

        if (v14)
        {
          float v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, location, v22);
          free(v14);
          SSFileLog();
        }
      }
      else
      {
      }
    }
  }
  else
  {
    id v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      id v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    unsigned int v18 = [v6 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v19 = *(id *)((char *)location + 4);
      LODWORD(v22) = 12;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl();

      if (v20)
      {
        id v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, location, v22);
        free(v20);
        SSFileLog();
      }
    }
    else
    {
    }
  }
}

- (CGImage)_createDefaultImageWithImageRef:(CGImage *)a3 size:(CGSize)a4 borderPath:(CGPath *)a5
{
  double height = a4.height;
  double width = a4.width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  unsigned int v10 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, vcvtd_n_u64_f64(width, 2uLL), DeviceRGB, 2u);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.double width = width;
  v15.size.double height = height;
  CGContextDrawImage(v10, v15, a3);
  v14[0] = xmmword_10031F870;
  v14[1] = unk_10031F880;
  int v11 = CGColorCreate(DeviceRGB, (const CGFloat *)v14);
  CGContextSetStrokeColorWithColor(v10, v11);
  CGContextSetLineWidth(v10, 1.0);
  CGContextAddPath(v10, a5);
  CGContextDrawPath(v10, kCGPathStroke);
  Image = CGBitmapContextCreateImage(v10);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v11);
  CGContextRelease(v10);
  return Image;
}

- (CGPath)_createBorderPathForAdornmentStyle:(int64_t)a3 iconWidth:(double)a4 iconHeight:(double)a5 designVersion:(id)a6
{
  id v9 = a6;
  unsigned int v10 = v9;
  if (a3 == 4)
  {
    v24.size.double width = a4 + -1.0;
    v24.size.double height = a5 + -1.0;
    v24.origin.x = 0.5;
    v24.origin.y = 0.5;
    unsigned int v14 = CGPathCreateWithRoundedRect(v24, (a4 + -1.0) * 0.5, (a5 + -1.0) * 0.5, 0);
    MutableCopy = CGPathCreateMutableCopy(v14);
    CGPathRelease(v14);
  }
  else if (a3 == 1)
  {
    unsigned int v15 = [v9 isEqualToNumber:AMSPaymentSheetDesignVersion_2_0];
    double v16 = 0.236842111;
    if (v15) {
      double v16 = 0.185185185;
    }
    double v17 = v16 * a4;
    MutableCopy = CGPathCreateMutable();
    CGFloat v18 = v17 + 0.0 + 0.5;
    CGPathMoveToPoint(MutableCopy, 0, 0.5, v18);
    CGFloat v19 = a5 - v17 + -0.5;
    CGPathAddLineToPoint(MutableCopy, 0, 0.5, v19);
    CGFloat v20 = a5 + -0.5;
    CGPathAddQuadCurveToPoint(MutableCopy, 0, 0.5, v20, v18, v20);
    CGFloat v21 = a4 - v17 + -0.5;
    CGPathAddLineToPoint(MutableCopy, 0, v21, v20);
    CGFloat v22 = a4 + -0.5;
    CGPathAddQuadCurveToPoint(MutableCopy, 0, v22, v20, v22, v19);
    CGPathAddLineToPoint(MutableCopy, 0, v22, v18);
    CGPathAddQuadCurveToPoint(MutableCopy, 0, v22, 0.5, v21, 0.5);
    CGPathAddLineToPoint(MutableCopy, 0, v18, 0.5);
    CGPathAddQuadCurveToPoint(MutableCopy, 0, 0.5, 0.5, 0.5, v18);
  }
  else if (a3)
  {
    MutableCopy = 0;
  }
  else
  {
    MutableCopy = CGPathCreateMutable();
    CGPathMoveToPoint(MutableCopy, 0, 0.5, 0.5);
    CGFloat v12 = a5 + -0.5;
    CGPathAddLineToPoint(MutableCopy, 0, 0.5, v12);
    CGFloat v13 = a4 + -0.5;
    CGPathAddLineToPoint(MutableCopy, 0, v13, v12);
    CGPathAddLineToPoint(MutableCopy, 0, v13, 0.5);
    CGPathAddLineToPoint(MutableCopy, 0, 0.5, 0.5);
  }

  return MutableCopy;
}

- (CGImage)_createImageMaskRefWithSize:(CGSize)a3 andPath:(CGPath *)a4
{
  double height = a3.height;
  double width = a3.width;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  id v8 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, DeviceGray, 7u);
  long long v19 = xmmword_10031F860;
  id v9 = CGColorCreate(DeviceGray, (const CGFloat *)&v19);
  CGContextSetFillColorWithColor(v8, v9);
  v20.origin.x = 0.0;
  v20.origin.y = 0.0;
  v20.size.double width = width;
  v20.size.double height = height;
  CGContextFillRect(v8, v20);
  CGContextBeginPath(v8);
  CGContextAddPath(v8, a4);
  CGContextClip(v8);
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  v21.size.double width = width;
  v21.size.double height = height;
  CGContextClearRect(v8, v21);
  Image = CGBitmapContextCreateImage(v8);
  size_t v11 = CGImageGetWidth(Image);
  size_t v12 = CGImageGetHeight(Image);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(Image);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(Image);
  size_t BytesPerRow = CGImageGetBytesPerRow(Image);
  DataProvider = CGImageGetDataProvider(Image);
  double v17 = CGImageMaskCreate(v11, v12, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  CGImageRelease(Image);
  CGColorRelease(v9);
  CGContextRelease(v8);
  CGColorSpaceRelease(DeviceGray);
  return v17;
}

- (CGImage)_createImageRefWithURL:(id)a3 adornmentStyle:(int64_t)a4 designVersion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    unsigned int v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  CGFloat v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_11;
  }
  int v78 = 138543618;
  id v79 = (id)objc_opt_class();
  __int16 v80 = 2114;
  id v81 = v8;
  id v14 = v79;
  LODWORD(v73) = 22;
  id v71 = &v78;
  unsigned int v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    CGFloat v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v78, v73);
    free(v15);
    id v71 = (int *)v13;
    SSFileLog();
LABEL_11:
  }
  id v16 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v16 setHTTPMethod:@"GET"];
  [v16 setITunesStoreRequest:1];
  [v16 setURL:v8];
  id v17 = objc_alloc_init((Class)ISStoreURLOperation);
  CGFloat v18 = +[ISDataProvider provider];
  [v17 setDataProvider:v18];

  [v17 setNeedsAuthentication:0];
  [v17 setNeedsURLBag:0];
  [v17 setRequestProperties:v16];
  id v77 = 0;
  [(DisplayPaymentSheetOperation *)self runSubOperation:v17 returningError:&v77];
  id v19 = v77;
  if (!v19 && ([v17 success] & 1) != 0)
  {
    v76 = v9;
    CGRect v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20)
    {
      CGRect v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = objc_msgSend(v20, "shouldLog", v71);
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    unsigned int v23 = [v20 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      int v24 = v22;
    }
    else {
      int v24 = v22 & 2;
    }
    if (v24)
    {
      unsigned int v25 = objc_opt_class();
      int v78 = 138543618;
      id v79 = v25;
      __int16 v80 = 2114;
      id v81 = v8;
      id v26 = v25;
      LODWORD(v73) = 22;
      v72 = &v78;
      int v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27) {
        goto LABEL_26;
      }
      unsigned int v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v78, v73);
      free(v27);
      v72 = (int *)v23;
      SSFileLog();
    }

LABEL_26:
    id v28 = [v17 dataProvider];
    CFDataRef v29 = [v28 output];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v41 = 0;
LABEL_43:
      id v9 = v76;
      goto LABEL_75;
    }
    CGDataProviderRef v30 = CGDataProviderCreateWithCFData(v29);
    unint64_t v31 = [(DisplayPaymentSheetOperation *)self _imageTypeForURL:v8];
    if (v31 >= 2)
    {
      if (v31 != 2)
      {
        int v42 = 0;
        if (!v30)
        {
LABEL_48:
          size_t v43 = CGImageGetWidth(v42);
          size_t Height = CGImageGetHeight(v42);
          size_t v45 = Height;
          double v46 = (double)v43;
          double v47 = (double)Height;
          switch(a4)
          {
            case 0:
              [(DisplayPaymentSheetOperation *)self paymentSheet];
              __int16 v49 = v48 = v42;
              id v50 = [v49 designVersion];
              uint64_t v51 = [(DisplayPaymentSheetOperation *)self _createBorderPathForAdornmentStyle:0 iconWidth:v50 iconHeight:v46 designVersion:v47];

              int v42 = v48;
              v52 = -[DisplayPaymentSheetOperation _createDefaultImageWithImageRef:size:borderPath:](self, "_createDefaultImageWithImageRef:size:borderPath:", v48, v51, v46, v47);
              goto LABEL_69;
            case 1:
              unsigned int v66 = [v76 isEqualToNumber:AMSPaymentSheetDesignVersion_2_0];
              double v67 = 0.236842111;
              if (v66) {
                double v67 = 0.185185185;
              }
              CGFloat v68 = v67 * v46;
              CGFloat v69 = v67 * v47;
              v88.origin.x = 0.0;
              v88.origin.y = 0.0;
              v88.size.unint64_t width = (double)v43;
              v88.size.double height = v47;
              uint64_t v51 = CGPathCreateWithRoundedRect(v88, v68, v69, 0);
              id v62 = self;
              v63 = v42;
              unsigned int v64 = v51;
              uint64_t v65 = 1;
              goto LABEL_68;
            case 2:
              unint64_t width = v43;
              Mutable = CGPathCreateMutable();
              CGPathMoveToPoint(Mutable, 0, 0.0, v46 * 0.032);
              CGPathAddLineToPoint(Mutable, 0, 0.0, v47 - v46 * 0.032);
              CGPathAddArcToPoint(Mutable, 0, 0.0, v47, v46 * 0.032, v47, v46 * 0.032);
              CGPathAddLineToPoint(Mutable, 0, v46 - v46 * 0.473684222, v47);
              CGPathAddArcToPoint(Mutable, 0, (double)v43, v47, (double)v43, v47 - v46 * 0.473684222, v46 * 0.473684222);
              CGPathAddLineToPoint(Mutable, 0, (double)v43, v46 * 0.032);
              CGPathAddArcToPoint(Mutable, 0, (double)v43, 0.0, v46 - v46 * 0.032, 0.0, v46 * 0.032);
              CGPathAddLineToPoint(Mutable, 0, v46 * 0.032, 0.0);
              CGPathAddArcToPoint(Mutable, 0, 0.0, 0.0, 0.0, v46 * 0.032, v46 * 0.032);
              Copy = CGPathCreateCopy(Mutable);
              image = [(DisplayPaymentSheetOperation *)self _createMaskedImageRefForImageRef:v42 withPathRef:Copy andAdornmentStyle:2];
              if (Mutable) {
                CGPathRelease(Mutable);
              }
              if (Copy) {
                CGPathRelease(Copy);
              }
              DeviceRGB = CGColorSpaceCreateDeviceRGB();
              id v56 = CGBitmapContextCreate(0, width, v45, 8uLL, 4 * width, DeviceRGB, 2u);
              CGContextSetRGBFillColor(v56, 0.0, 0.0, 0.0, 0.0);
              v84.origin.x = 0.0;
              v84.origin.y = 0.0;
              v84.size.unint64_t width = v46;
              v84.size.double height = v47;
              CGContextFillRect(v56, v84);
              CGContextSetRGBFillColor(v56, 0.827000022, 0.827000022, 0.827000022, 1.0);
              v85.origin.x = 0.0;
              v85.origin.y = 0.0;
              v85.size.unint64_t width = v46;
              v85.size.double height = v47;
              v57 = CGPathCreateWithRoundedRect(v85, v46 * 0.0579999983, v47 * 0.0579999983, 0);
              CGContextBeginPath(v56);
              CGContextAddPath(v56, v57);
              CGContextFillPath(v56);
              if (DeviceRGB) {
                CGColorSpaceRelease(DeviceRGB);
              }
              if (v57) {
                CGPathRelease(v57);
              }
              v86.size.unint64_t width = v46 + v46 * 0.0813999996 * -2.0;
              v86.size.double height = v47 + v47 * 0.0813999996 * -2.0;
              v86.origin.x = v46 * 0.0813999996;
              v86.origin.y = v47 * 0.0813999996;
              CGContextDrawImage(v56, v86, image);
              CGImageRelease(image);
              double v58 = v46 * 0.0813999996 * 0.550000012;
              double v59 = v47 * 0.0813999996 * 0.550000012;
              CGFloat v60 = v46 - v46 * 0.0813999996 - v58;
              CGFloat v61 = v47 - v47 * 0.0813999996 - v59;
              CGContextSetRGBStrokeColor(v56, 0.707, 0.707, 0.707, 1.0);
              CGContextSetLineWidth(v56, (float)((float)width * 0.020833));
              CGContextMoveToPoint(v56, v60, v59 + v61);
              CGContextAddLineToPoint(v56, v60, v61 - v59);
              CGContextStrokePath(v56);
              CGContextMoveToPoint(v56, v60 - v58, v61);
              CGContextAddLineToPoint(v56, v58 + v60, v61);
              CGContextStrokePath(v56);
              unsigned int v41 = CGBitmapContextCreateImage(v56);
              if (v56) {
                CGContextRelease(v56);
              }
              goto LABEL_71;
            case 3:
              v89.origin.y = v47 * 0.125;
              v89.size.double height = v47 * 0.75;
              v89.origin.x = 0.0;
              v89.size.unint64_t width = (double)v43;
              uint64_t v51 = CGPathCreateWithRoundedRect(v89, v47 * 0.375, v47 * 0.375, 0);
              id v62 = self;
              v63 = v42;
              unsigned int v64 = v51;
              uint64_t v65 = 3;
              goto LABEL_68;
            case 4:
              v87.origin.x = 0.0;
              v87.origin.y = 0.0;
              v87.size.unint64_t width = (double)v43;
              v87.size.double height = (double)Height;
              uint64_t v51 = CGPathCreateWithRoundedRect(v87, v46 * 0.5, v47 * 0.5, 0);
              id v62 = self;
              v63 = v42;
              unsigned int v64 = v51;
              uint64_t v65 = 4;
LABEL_68:
              v52 = -[DisplayPaymentSheetOperation _createMaskedImageRefForImageRef:withPathRef:andAdornmentStyle:](v62, "_createMaskedImageRefForImageRef:withPathRef:andAdornmentStyle:", v63, v64, v65, v72);
LABEL_69:
              unsigned int v41 = v52;
              if (v51) {
                CGPathRelease(v51);
              }
LABEL_71:
              id v9 = v76;
              if (v41)
              {
                if (v42) {
                  CGImageRelease(v42);
                }
              }
              else
              {
                unsigned int v41 = v42;
              }
              break;
            default:
              unsigned int v41 = v42;
              goto LABEL_43;
          }
          goto LABEL_75;
        }
LABEL_47:
        CFRelease(v30);
        goto LABEL_48;
      }
      CGImageRef v32 = CGImageCreateWithJPEGDataProvider(v30, 0, 1, kCGRenderingIntentDefault);
    }
    else
    {
      CGImageRef v32 = CGImageCreateWithPNGDataProvider(v30, 0, 1, kCGRenderingIntentDefault);
    }
    int v42 = v32;
    if (!v30) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  CFDataRef v29 = +[SSLogConfig sharedDaemonConfig];
  if (!v29)
  {
    CFDataRef v29 = +[SSLogConfig sharedConfig];
  }
  unsigned int v33 = [(__CFData *)v29 shouldLog];
  if ([(__CFData *)v29 shouldLogToDisk]) {
    int v34 = v33 | 2;
  }
  else {
    int v34 = v33;
  }
  v35 = [(__CFData *)v29 OSLogObject];
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
    int v36 = v34;
  }
  else {
    int v36 = v34 & 2;
  }
  if (v36)
  {
    id v37 = v9;
    unint64_t v38 = objc_opt_class();
    int v78 = 138543874;
    id v79 = v38;
    __int16 v80 = 2114;
    id v81 = v8;
    __int16 v82 = 2114;
    id v83 = v19;
    id v39 = v38;
    LODWORD(v73) = 32;
    v40 = (void *)_os_log_send_and_compose_impl();

    if (!v40)
    {
      unsigned int v41 = 0;
      id v9 = v37;
      goto LABEL_75;
    }
    v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v40, 4, &v78, v73);
    free(v40);
    SSFileLog();
    id v9 = v37;
  }

  unsigned int v41 = 0;
LABEL_75:

  return v41;
}

- (CGImage)_createMaskedImageRefForImageRef:(CGImage *)a3 withPathRef:(CGPath *)a4 andAdornmentStyle:(int64_t)a5
{
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  double v11 = (double)Width;
  double v12 = (double)Height;
  ColorSpace = CGImageGetColorSpace(a3);
  uint64_t Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == 1)
  {
    Copy = CGImageCreateCopy(a3);
    goto LABEL_5;
  }
  uint64_t v15 = Model;
  if (!Model)
  {
    Copy = [(DisplayPaymentSheetOperation *)self _createRGBImageRefForGreyScaleImageRef:a3 width:Width height:Height];
LABEL_5:
    id v17 = Copy;
    goto LABEL_16;
  }
  CGFloat v18 = +[SSLogConfig sharedConfig];
  unsigned int v19 = [v18 shouldLog];
  if ([v18 shouldLogToDisk]) {
    int v20 = v19 | 2;
  }
  else {
    int v20 = v19;
  }
  unsigned int v21 = [v18 OSLogObject];
  if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    v20 &= 2u;
  }
  if (!v20) {
    goto LABEL_14;
  }
  int v22 = objc_opt_class();
  id v40 = v22;
  unsigned int v23 = +[NSNumber numberWithInt:v15];
  *(_DWORD *)components = 138412546;
  *(void *)&components[4] = v22;
  *(_WORD *)&components[12] = 2114;
  *(void *)&components[14] = v23;
  LODWORD(v39) = 22;
  unint64_t v38 = components;
  int v24 = (void *)_os_log_send_and_compose_impl();

  if (v24)
  {
    unsigned int v21 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v24, 4, components, v39);
    free(v24);
    unint64_t v38 = v21;
    SSFileLog();
LABEL_14:
  }
  id v17 = 0;
LABEL_16:
  unsigned int v25 = -[DisplayPaymentSheetOperation _createImageMaskRefWithSize:andPath:](self, "_createImageMaskRefWithSize:andPath:", a4, v11, v12, v38);
  id v26 = CGImageCreateWithMask(v17, v25);
  size_t v27 = CGImageGetWidth(v26);
  size_t v28 = CGImageGetHeight(v26);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v26);
  size_t BytesPerRow = CGImageGetBytesPerRow(v26);
  unint64_t v31 = CGBitmapContextCreate(0, v27, v28, BitsPerComponent, BytesPerRow, ColorSpace, 1u);
  CGContextSetRGBFillColor(v31, 1.0, 0.0, 0.0, 0.0);
  v42.origin.x = 0.0;
  v42.origin.y = 0.0;
  v42.size.unint64_t width = v11;
  v42.size.double height = v12;
  CGContextFillRect(v31, v42);
  v43.origin.x = 0.0;
  v43.origin.y = 0.0;
  v43.size.unint64_t width = v11;
  v43.size.double height = v12;
  CGContextDrawImage(v31, v43, v26);
  CGImageRef v32 = [(DisplayPaymentSheetOperation *)self paymentSheet];
  unsigned int v33 = [v32 designVersion];
  int v34 = [(DisplayPaymentSheetOperation *)self _createBorderPathForAdornmentStyle:a5 iconWidth:v33 iconHeight:v11 designVersion:v12];

  if (v34)
  {
    *(_OWORD *)components = xmmword_10031F870;
    *(_OWORD *)&components[16] = unk_10031F880;
    v35 = CGColorCreate(ColorSpace, (const CGFloat *)components);
    CGContextSetStrokeColorWithColor(v31, v35);
    CGContextSetLineWidth(v31, 1.0);
    CGContextAddPath(v31, v34);
    CGContextDrawPath(v31, kCGPathStroke);
    CGPathRelease(v34);
    CGColorRelease(v35);
  }
  Image = CGBitmapContextCreateImage(v31);
  CGContextRelease(v31);
  CGImageRelease(v25);
  CGImageRelease(v26);
  CGImageRelease(v17);
  return Image;
}

- (CGImage)_createRatingImageWithStringValue:(id)a3 assetScale:(float *)a4
{
  id v4 = (__CFString *)a3;
  uint64_t v5 = +[AMSDevice screenScale];
  [v5 floatValue];
  float v7 = v6;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)components = xmmword_10031F890;
  long long v28 = unk_10031F8A0;
  CGColorRef v9 = CGColorCreate(DeviceRGB, components);
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontLabel, v7 * 9.0, 0);
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryAddValue(Mutable, kCTFontAttributeName, UIFontForLanguage);
  CFDictionaryAddValue(Mutable, kCTForegroundColorAttributeName, v9);
  CFAttributedStringRef v12 = CFAttributedStringCreate(0, v4, Mutable);
  CGFloat v13 = CTFramesetterCreateWithAttributedString(v12);
  id v14 = [(__CFString *)v4 length];

  v30.float width = 1.79769313e308;
  v29.location = 0;
  v29.length = (CFIndex)v14;
  v30.float height = 1.79769313e308;
  CGSize v15 = CTFramesetterSuggestFrameSizeWithConstraints(v13, v29, 0, v30, 0);
  float height = v15.height;
  CGFloat v17 = ceilf(height);
  float v18 = v17 * 0.352941176;
  float width = v15.width;
  double v20 = ceilf(width) + ceilf(v18) * 2.0;
  unsigned int v21 = CGBitmapContextCreate(0, (unint64_t)v20, vcvtps_u32_f32(height), 8uLL, vcvtd_n_u64_f64(v20, 3uLL), DeviceRGB, 2u);
  CGContextSetShouldAntialias(v21, 1);
  CGContextSetInterpolationQuality(v21, kCGInterpolationHigh);
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.float width = v20;
  v31.size.float height = v17;
  CGRect v32 = CGRectInset(v31, 1.0, 1.0);
  int v22 = CGPathCreateWithRoundedRect(v32, 6.0, 6.0, 0);
  CGContextAddPath(v21, v22);
  CGContextSetStrokeColorWithColor(v21, v9);
  CGContextSetLineWidth(v21, 1.0);
  CGContextStrokePath(v21);
  unsigned int v23 = CTLineCreateWithAttributedString(v12);
  CGContextSetTextPosition(v21, v20 * 0.5 - v15.width * 0.5, v17 * 0.5 + v15.height * -0.25 + -1.0);
  CTLineDraw(v23, v21);
  Image = CGBitmapContextCreateImage(v21);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(v9);
  CGContextRelease(v21);
  CGPathRelease(v22);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (UIFontForLanguage) {
    CFRelease(UIFontForLanguage);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (a4) {
    *a4 = v7;
  }
  return Image;
}

- (CGImage)_createResizedImageWithOriginalImage:(CGImage *)a3 targetHeight:(double)a4
{
  double Width = (double)CGImageGetWidth(a3);
  float v7 = Width / (double)CGImageGetHeight(a3) * a4;
  size_t v8 = vcvtas_u32_f32(v7);
  float v9 = a4;
  size_t v10 = vcvtas_u32_f32(v9);
  ColorSpace = CGImageGetColorSpace(a3);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a3);
  size_t v13 = (unint64_t)((double)CGImageGetBytesPerRow(a3) / Width * (double)v8);
  uint32_t AlphaInfo = CGImageGetAlphaInfo(a3);
  CGSize v15 = CGBitmapContextCreate(0, v8, v10, BitsPerComponent, v13, ColorSpace, AlphaInfo);
  CGRect ClipBoundingBox = CGContextGetClipBoundingBox(v15);
  CGContextDrawImage(v15, ClipBoundingBox, a3);
  Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  return Image;
}

- (CGImage)_createRGBImageRefForGreyScaleImageRef:(CGImage *)a3 width:(unint64_t)a4 height:(unint64_t)a5
{
  CGFloat v7 = (double)a4;
  CGFloat v8 = (double)a5;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  size_t Width = CGImageGetWidth(a3);
  size_t Height = CGImageGetHeight(a3);
  CFAttributedStringRef v12 = CGBitmapContextCreate(0, Width, Height, 8uLL, 4 * a4, DeviceRGB, 1u);
  CGContextSetRGBFillColor(v12, 0.0, 0.0, 0.0, 1.0);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.float width = v7;
  v15.size.float height = v8;
  CGContextFillRect(v12, v15);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.float width = v7;
  v16.size.float height = v8;
  CGContextDrawImage(v12, v16, a3);
  Image = CGBitmapContextCreateImage(v12);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v12);
  return Image;
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  self->_didAuthorizePayment = 1;
  float v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9)
  {
    float v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  CFAttributedStringRef v12 = [v9 OSLogObject];
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
    v11 &= 2u;
  }
  if (v11)
  {
    int v102 = 138543362;
    id v103 = (id)objc_opt_class();
    id v13 = v103;
    LODWORD(v91) = 12;
    CGRect v89 = &v102;
    id v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14) {
      goto LABEL_12;
    }
    CFAttributedStringRef v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v102, v91);
    free(v14);
    CGRect v89 = (int *)v12;
    SSFileLog();
  }

LABEL_12:
  CGRect v15 = [v7 authKitAuthenticationResults];

  if (v15)
  {
    CGRect v16 = [v7 authKitAuthenticationResults];
    CGFloat v17 = [v16 valueForKey:AKAuthenticationPasswordKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v18 = +[SSAuthorizationMetricsController userActionDictionaryForUserAction:6 didBiometricsLockout:self->_didBiometricsLockout];
      if (v18) {
        [(NSMutableArray *)self->_userActions addObject:v18];
      }
      id v19 = v8;
      objc_storeStrong((id *)&self->_passwordEquivalentToken, v17);
      double v20 = +[SSLogConfig sharedDaemonConfig];
      if (!v20)
      {
        double v20 = +[SSLogConfig sharedConfig];
      }
      unsigned int v21 = objc_msgSend(v20, "shouldLog", v89);
      if ([v20 shouldLogToDisk]) {
        int v22 = v21 | 2;
      }
      else {
        int v22 = v21;
      }
      unsigned int v23 = [v20 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        int v24 = v22;
      }
      else {
        int v24 = v22 & 2;
      }
      if (v24)
      {
LABEL_54:
        int v44 = objc_opt_class();
        int v102 = 138543362;
        id v103 = v44;
        id v45 = v44;
        LODWORD(v91) = 12;
        double v46 = (void *)_os_log_send_and_compose_impl();

        if (!v46)
        {
          uint64_t v47 = 0;
          id v31 = 0;
          goto LABEL_58;
        }
        unsigned int v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v46, 4, &v102, v91);
        free(v46);
        SSFileLog();
      }
    }
    else
    {
      if (!self->_isASNPurchase)
      {
        id v19 = v8;
        ISError();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        double v20 = +[SSLogConfig sharedDaemonConfig];
        if (!v20)
        {
          double v20 = +[SSLogConfig sharedConfig];
        }
        unsigned int v58 = objc_msgSend(v20, "shouldLog", v89);
        if ([v20 shouldLogToDisk]) {
          int v59 = v58 | 2;
        }
        else {
          int v59 = v58;
        }
        unsigned int v23 = [v20 OSLogObject];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          int v60 = v59;
        }
        else {
          int v60 = v59 & 2;
        }
        if (v60)
        {
          CGFloat v61 = objc_opt_class();
          int v102 = 138543362;
          id v103 = v61;
          id v62 = v61;
          LODWORD(v91) = 12;
          float v18 = (void *)_os_log_send_and_compose_impl();

          if (!v18)
          {
            uint64_t v47 = 1;
            goto LABEL_58;
          }
          unsigned int v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v102, v91);
          free(v18);
          SSFileLog();
        }
        float v18 = 0;
        uint64_t v47 = 1;
        goto LABEL_57;
      }
      float v18 = +[SSAuthorizationMetricsController userActionDictionaryForUserAction:1 didBiometricsLockout:self->_didBiometricsLockout];
      if (v18) {
        [(NSMutableArray *)self->_userActions addObject:v18];
      }
      id v19 = v8;
      double v20 = +[SSLogConfig sharedDaemonConfig];
      if (!v20)
      {
        double v20 = +[SSLogConfig sharedConfig];
      }
      unsigned int v41 = [v20 shouldLog];
      if ([v20 shouldLogToDisk]) {
        int v42 = v41 | 2;
      }
      else {
        int v42 = v41;
      }
      unsigned int v23 = [v20 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
        int v43 = v42;
      }
      else {
        int v43 = v42 & 2;
      }
      if (v43) {
        goto LABEL_54;
      }
    }
    uint64_t v47 = 0;
    id v31 = 0;
LABEL_57:

LABEL_58:
    id v8 = v19;
LABEL_59:
    if (v31)
    {
      id v101 = v31;
      v48 = +[NSArray arrayWithObjects:&v101 count:1];
    }
    else
    {
      v48 = &__NSArray0__struct;
    }
    goto LABEL_75;
  }
  if ([(DisplayPaymentSheetOperation *)self _isChallengeReadyToBeSigned])
  {
    int v95 = v8;
    v96 = v7;
    float v18 = +[SSAuthorizationMetricsController userActionDictionaryForBiometricMatchState:2 didBiometricsLockout:self->_didBiometricsLockout];
    if (v18) {
      [(NSMutableArray *)self->_userActions addObject:v18];
    }
    unsigned int v25 = +[DaemonBiometricKeychain sharedInstance];
    id v26 = [(DisplayPaymentSheetOperation *)self challenge];
    size_t v27 = [(DisplayPaymentSheetOperation *)self accountIdentifier];
    long long v28 = [(DisplayPaymentSheetOperation *)self localAuthContext];
    CFRange v29 = [(DisplayPaymentSheetOperation *)self localAuthOptions];
    id v100 = 0;
    unsigned int v94 = v25;
    CGSize v30 = [v25 signDataWithKeychain:v26 accountIdentifier:v27 purpose:0 localAuthContext:v28 localAuthOptions:v29 error:&v100];
    id v31 = v100;

    v93 = v30;
    if (v31)
    {
      [(DisplayPaymentSheetOperation *)self setError:v31];
      CGRect v32 = +[SSLogConfig sharedDaemonConfig];
      if (!v32)
      {
        CGRect v32 = +[SSLogConfig sharedConfig];
      }
      unsigned int v33 = [v32 shouldLog];
      if ([v32 shouldLogToDisk]) {
        int v34 = v33 | 2;
      }
      else {
        int v34 = v33;
      }
      v35 = [v32 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        int v36 = v34;
      }
      else {
        int v36 = v34 & 2;
      }
      if (v36)
      {
        id v37 = objc_opt_class();
        int v102 = 138543618;
        id v103 = v37;
        __int16 v104 = 2114;
        id v105 = v31;
        id v38 = v37;
        LODWORD(v91) = 22;
        v90 = &v102;
LABEL_40:
        uint64_t v39 = (void *)_os_log_send_and_compose_impl();

        id v40 = v96;
        if (!v39)
        {
LABEL_105:

          char v92 = 0;
          uint64_t v47 = 1;
LABEL_106:
          CGFloat v69 = objc_msgSend(v40, "token", v90);
          v70 = [v69 paymentData];

          uint64_t v71 = +[SSLogConfig sharedDaemonConfig];
          v72 = (void *)v71;
          if (!v70)
          {
            if (!v71)
            {
              v72 = +[SSLogConfig sharedConfig];
            }
            unsigned int v83 = [v72 shouldLog];
            if ([v72 shouldLogToDisk]) {
              int v84 = v83 | 2;
            }
            else {
              int v84 = v83;
            }
            __int16 v80 = [v72 OSLogObject];
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT)) {
              int v85 = v84;
            }
            else {
              int v85 = v84 & 2;
            }
            if (v85)
            {
              CGRect v86 = objc_opt_class();
              int v102 = 138543362;
              id v103 = v86;
              id v87 = v86;
              LODWORD(v91) = 12;
              CGRect v88 = (void *)_os_log_send_and_compose_impl();

              if (!v88)
              {
LABEL_121:

                id v8 = v95;
                id v7 = v96;
                if (v92) {
                  goto LABEL_76;
                }
                goto LABEL_59;
              }
              __int16 v80 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v88, 4, &v102, v91);
              free(v88);
              SSFileLog();
            }
LABEL_120:

            goto LABEL_121;
          }
          if (!v71)
          {
            v72 = +[SSLogConfig sharedConfig];
          }
          unsigned int v73 = [v72 shouldLog];
          if ([v72 shouldLogToDisk]) {
            int v74 = v73 | 2;
          }
          else {
            int v74 = v73;
          }
          int v75 = [v72 OSLogObject];
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT)) {
            int v76 = v74;
          }
          else {
            int v76 = v74 & 2;
          }
          if (v76)
          {
            id v77 = objc_opt_class();
            int v102 = 138543362;
            id v103 = v77;
            id v78 = v77;
            LODWORD(v91) = 12;
            id v79 = (void *)_os_log_send_and_compose_impl();

            if (!v79)
            {
LABEL_119:

              v72 = [v96 token];
              __int16 v80 = [v72 paymentData];
              id v81 = [v80 copy];
              paymentTokenData = self->_paymentTokenData;
              self->_paymentTokenData = v81;

              goto LABEL_120;
            }
            int v75 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v79, 4, &v102, v91);
            free(v79);
            SSFileLog();
          }

          goto LABEL_119;
        }
        v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v39, 4, &v102, v91);
        free(v39);
        v90 = (int *)v35;
        SSFileLog();
LABEL_104:

        goto LABEL_105;
      }
    }
    else
    {
      id v40 = v96;
      if (v30)
      {
        self->_didAuthorizePayment = 0;
        [(DisplayPaymentSheetOperation *)self _challengeSigningDelay];
        dispatch_time_t v64 = dispatch_time(0, (uint64_t)(float)(v63 * 1000000000.0));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10007798C;
        block[3] = &unk_1003A4D30;
        block[4] = self;
        id v98 = v30;
        id v99 = v95;
        dispatch_after(v64, (dispatch_queue_t)&_dispatch_main_q, block);

        uint64_t v47 = 0;
        id v31 = 0;
        char v92 = 1;
        goto LABEL_106;
      }
      ISError();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      [(DisplayPaymentSheetOperation *)self setError:v31];
      CGRect v32 = +[SSLogConfig sharedDaemonConfig];
      if (!v32)
      {
        CGRect v32 = +[SSLogConfig sharedConfig];
      }
      unsigned int v65 = [v32 shouldLog];
      if ([v32 shouldLogToDisk]) {
        int v66 = v65 | 2;
      }
      else {
        int v66 = v65;
      }
      v35 = [v32 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        int v67 = v66;
      }
      else {
        int v67 = v66 & 2;
      }
      if (v67)
      {
        CGFloat v68 = objc_opt_class();
        int v102 = 138543362;
        id v103 = v68;
        id v38 = v68;
        LODWORD(v91) = 12;
        v90 = &v102;
        goto LABEL_40;
      }
    }
    id v40 = v96;
    goto LABEL_104;
  }
  self->_didAuthorizePayment = 0;
  __int16 v49 = +[SSLogConfig sharedDaemonConfig];
  if (!v49)
  {
    __int16 v49 = +[SSLogConfig sharedConfig];
  }
  unsigned int v50 = objc_msgSend(v49, "shouldLog", v89);
  if ([v49 shouldLogToDisk]) {
    int v51 = v50 | 2;
  }
  else {
    int v51 = v50;
  }
  v52 = [v49 OSLogObject];
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
    int v53 = v51;
  }
  else {
    int v53 = v51 & 2;
  }
  if (!v53) {
    goto LABEL_73;
  }
  int v54 = objc_opt_class();
  int v102 = 138543362;
  id v103 = v54;
  id v55 = v54;
  LODWORD(v91) = 12;
  id v56 = (void *)_os_log_send_and_compose_impl();

  if (v56)
  {
    v52 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v56, 4, &v102, v91);
    free(v56);
    SSFileLog();
LABEL_73:
  }
  float v18 = 0;
  id v31 = 0;
  v48 = &__NSArray0__struct;
  uint64_t v47 = 1;
LABEL_75:
  id v57 = [objc_alloc((Class)ISWeakLinkedClassForString()) initWithStatus:v47 errors:v48];
  (*((void (**)(id, id))v8 + 2))(v8, v57);

LABEL_76:
}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  self->_didFinishPayment = 1;
  id v4 = a3;
  uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    uint64_t v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_11;
  }
  int v13 = 138543362;
  id v14 = (id)objc_opt_class();
  id v9 = v14;
  LODWORD(v11) = 12;
  unsigned int v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v13, v11);
    free(v10);
    SSFileLog();
LABEL_11:
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100077EB8;
  v12[3] = &unk_1003A3140;
  v12[4] = self;
  [v4 dismissWithCompletion:v12];
  [v4 setDelegate:0];
}

- (void)paymentAuthorizationController:(id)a3 didEncounterAuthorizationEvent:(unint64_t)a4
{
  unsigned int v6 = +[SSLogConfig sharedDaemonConfig];
  if (!v6)
  {
    unsigned int v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v7 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v8 = v7 | 2;
  }
  else {
    int v8 = v7;
  }
  id v9 = [v6 OSLogObject];
  if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    v8 &= 2u;
  }
  if (v8)
  {
    unsigned int v10 = objc_opt_class();
    id v11 = v10;
    CFAttributedStringRef v12 = +[NSNumber numberWithUnsignedInteger:a4];
    int v21 = 138543618;
    int v22 = v10;
    __int16 v23 = 2114;
    int v24 = v12;
    LODWORD(v20) = 22;
    id v19 = &v21;
    int v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13) {
      goto LABEL_12;
    }
    id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v21, v20);
    free(v13);
    id v19 = (int *)v9;
    SSFileLog();
  }

LABEL_12:
  switch(a4)
  {
    case 1uLL:
      uint64_t v14 = +[SSAuthorizationMetricsController userActionDictionaryForBiometricMatchState:16 didBiometricsLockout:self->_didBiometricsLockout];
      goto LABEL_23;
    case 2uLL:
      uint64_t v15 = 170;
      goto LABEL_19;
    case 3uLL:
      BOOL didBiometricsLockout = self->_didBiometricsLockout;
      uint64_t v17 = 3;
      goto LABEL_22;
    case 4uLL:
      BOOL didBiometricsLockout = self->_didBiometricsLockout;
      uint64_t v17 = 2;
      goto LABEL_22;
    case 5uLL:
      BOOL didBiometricsLockout = self->_didBiometricsLockout;
      uint64_t v17 = 5;
      goto LABEL_22;
    case 6uLL:
      uint64_t v15 = 171;
LABEL_19:
      self->ISOperation_opaque[v15] = 1;
      return;
    case 7uLL:
      BOOL didBiometricsLockout = self->_didBiometricsLockout;
      uint64_t v17 = 8;
      goto LABEL_22;
    case 8uLL:
      BOOL didBiometricsLockout = self->_didBiometricsLockout;
      uint64_t v17 = 7;
LABEL_22:
      uint64_t v14 = +[SSAuthorizationMetricsController userActionDictionaryForUserAction:didBiometricsLockout:](SSAuthorizationMetricsController, "userActionDictionaryForUserAction:didBiometricsLockout:", v17, didBiometricsLockout, v19);
LABEL_23:
      float v18 = (void *)v14;
      if (v14)
      {
        [(NSMutableArray *)self->_userActions addObject:v14];
      }
      break;
    default:
      return;
  }
}

- (void)paymentAuthorizationController:(id)a3 willFinishWithError:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    unsigned int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  unsigned int v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  id v11 = objc_opt_class();
  id v12 = v11;
  [v5 localizedDescription];
  int v15 = 138543618;
  CGRect v16 = v11;
  __int16 v17 = 2114;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 22;
  int v13 = (void *)_os_log_send_and_compose_impl();

  if (v13)
  {
    unsigned int v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v15, v14);
    free(v13);
    SSFileLog();
LABEL_11:
  }
  [v6 setPrivateDelegate:0];
}

- (id)presentationSceneIdentifierForPaymentAuthorizationController:(id)a3
{
  return [(SSPaymentSheet *)self->_paymentSheet presentingSceneIdentifier];
}

- (NSNumber)accountIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 264, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setAccountName:(id)a3
{
}

- (AKAppleIDAuthenticationContext)authenticationContext
{
  return (AKAppleIDAuthenticationContext *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAuthenticationContext:(id)a3
{
}

- (NSData)challenge
{
  return (NSData *)objc_getProperty(self, a2, 288, 1);
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

- (id)containerCompletionHandler
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setContainerCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandlerForAutoEnrollment
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setCompletionHandlerForAutoEnrollment:(id)a3
{
}

- (NSString)dialogId
{
  return (NSString *)objc_getProperty(self, a2, 320, 1);
}

- (void)setDialogId:(id)a3
{
}

- (NSDictionary)localAuthOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 328, 1);
}

- (void)setLocalAuthOptions:(id)a3
{
}

- (LAContext)localAuthContext
{
  return (LAContext *)objc_getProperty(self, a2, 336, 1);
}

- (void)setLocalAuthContext:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 344, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_localAuthContext, 0);
  objc_storeStrong((id *)&self->_localAuthOptions, 0);
  objc_storeStrong((id *)&self->_dialogId, 0);
  objc_storeStrong(&self->_completionHandlerForAutoEnrollment, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_containerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_authenticationContext, 0);
  objc_storeStrong((id *)&self->_accountName, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_userActions, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_signedChallenge, 0);
  objc_storeStrong((id *)&self->_passwordEquivalentToken, 0);
  objc_storeStrong((id *)&self->_paymentTokenData, 0);
  objc_storeStrong((id *)&self->_paymentSheet, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_fpanID, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end