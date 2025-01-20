@interface WBSCertificateWarningPageContext
+ (BOOL)certificateWarningCannotBeBypassedForTrust:(__SecTrust *)a3;
+ (BOOL)supportsSecureCoding;
+ (id)permanentAcceptanceConfirmationButtonTitle;
+ (id)permanentAcceptanceConfirmationTitle;
+ (int64_t)certificateWarningCategoryForError:(id)a3 trustIncludesRevokedCertificate:(BOOL)a4 clockSkew:(double)a5;
+ (int64_t)numberOfDaysBetweenCertificateValidityRangeAndNow:(id)a3;
- (BOOL)canGoBack;
- (NSString)expiredCerticateDescription;
- (NSURL)failingURL;
- (WBSCertificateWarningPageContext)init;
- (WBSCertificateWarningPageContext)initWithCoder:(id)a3;
- (WBSCertificateWarningPageContext)initWithWarningCategory:(int64_t)a3 failingURL:(id)a4 numberOfDaysInvalid:(int64_t)a5 canGoBack:(BOOL)a6 clockSkew:(double)a7;
- (double)clockSkew;
- (id)initLegacyTLSWarningWithFailingURL:(id)a3 canGoBack:(BOOL)a4;
- (id)initPrivateRelayFailClosedNavigationWarningWithFailingURL:(id)a3 isPrivateRelaySetToTrackersAndWebsites:(BOOL)a4 canGoBack:(BOOL)a5;
- (int64_t)numberOfDaysInvalid;
- (int64_t)warningCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSCertificateWarningPageContext

+ (BOOL)certificateWarningCannotBeBypassedForTrust:(__SecTrust *)a3
{
  SecTrustResultType result = kSecTrustResultInvalid;
  OSStatus TrustResult = SecTrustGetTrustResult(a3, &result);
  if (!TrustResult) {
    return result == kSecTrustResultFatalTrustFailure || result == kSecTrustResultDeny;
  }
  int v4 = TrustResult;
  v5 = WBS_LOG_CHANNEL_PREFIXKeychain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[WBSCertificateWarningPageContext certificateWarningCannotBeBypassedForTrust:](v4, v5);
  }
  return 1;
}

+ (id)permanentAcceptanceConfirmationTitle
{
  return (id)_WBSLocalizedString();
}

+ (id)permanentAcceptanceConfirmationButtonTitle
{
  return (id)_WBSLocalizedString();
}

+ (int64_t)certificateWarningCategoryForError:(id)a3 trustIncludesRevokedCertificate:(BOOL)a4 clockSkew:(double)a5
{
  id v7 = a3;
  v8 = [MEMORY[0x1E4F74230] sharedConnection];
  int v9 = [v8 effectiveBoolValueForSetting:*MEMORY[0x1E4F741A0]];

  int64_t v10 = 2;
  if (v9 != 2 && !a4)
  {
    uint64_t v11 = [v7 code];
    v12 = [v7 userInfo];
    v13 = objc_msgSend(v12, "safari_numberForKey:", *MEMORY[0x1E4F18EE0]);
    uint64_t v14 = [v13 integerValue];

    if (v11 == -1201 || v14 == -9814)
    {
      int64_t v10 = 4 * (fabs(a5) >= 86400.0);
    }
    else if (v14 == -9843)
    {
      int64_t v10 = 3;
    }
    else
    {
      int64_t v10 = 1;
    }
  }

  return v10;
}

+ (int64_t)numberOfDaysBetweenCertificateValidityRangeAndNow:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v5);
      }
      if ((SecCertificateIsValid() & 1) == 0)
      {
        SecCertificateNotValidAfter();
        if (Current > v9)
        {
          double v12 = (Current - v9) / 86400.0;
          if (v12 < 1.0) {
            double v12 = 1.0;
          }
          goto LABEL_17;
        }
        SecCertificateNotValidBefore();
        if (Current < v10)
        {
          double v12 = (Current - v10) / 86400.0;
          if (v12 > -1.0) {
            double v12 = -1.0;
          }
LABEL_17:
          int64_t v11 = (uint64_t)v12;
          goto LABEL_18;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  int64_t v11 = 0;
LABEL_18:

  return v11;
}

- (WBSCertificateWarningPageContext)init
{
  return 0;
}

- (WBSCertificateWarningPageContext)initWithWarningCategory:(int64_t)a3 failingURL:(id)a4 numberOfDaysInvalid:(int64_t)a5 canGoBack:(BOOL)a6 clockSkew:(double)a7
{
  id v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSCertificateWarningPageContext;
  long long v14 = [(WBSCertificateWarningPageContext *)&v18 init];
  long long v15 = v14;
  if (v14)
  {
    v14->_warningCategory = a3;
    objc_storeStrong((id *)&v14->_failingURL, a4);
    v15->_canGoBack = a6;
    v15->_numberOfDaysInvalid = a5;
    v15->_clockSkew = a7;
    long long v16 = v15;
  }

  return v15;
}

- (id)initLegacyTLSWarningWithFailingURL:(id)a3 canGoBack:(BOOL)a4
{
  return [(WBSCertificateWarningPageContext *)self initWithWarningCategory:5 failingURL:a3 numberOfDaysInvalid:0 canGoBack:a4 clockSkew:0.0];
}

- (id)initPrivateRelayFailClosedNavigationWarningWithFailingURL:(id)a3 isPrivateRelaySetToTrackersAndWebsites:(BOOL)a4 canGoBack:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = v8;
  if (a4)
  {
    uint64_t v10 = 7;
  }
  else if (objc_msgSend(v8, "safari_isHTTPURL"))
  {
    uint64_t v10 = 8;
  }
  else
  {
    uint64_t v10 = 7;
  }
  int64_t v11 = [(WBSCertificateWarningPageContext *)self initWithWarningCategory:v10 failingURL:v9 numberOfDaysInvalid:0 canGoBack:v5 clockSkew:0.0];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCertificateWarningPageContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"WarningCategory"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FailingURL"];
  uint64_t v7 = [v4 decodeBoolForKey:@"CanGoBack"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"NumberOfDaysInvalid"];
  [v4 decodeDoubleForKey:@"ClockSkew"];
  double v9 = -[WBSCertificateWarningPageContext initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:](self, "initWithWarningCategory:failingURL:numberOfDaysInvalid:canGoBack:clockSkew:", v5, v6, v8, v7);

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_warningCategory forKey:@"WarningCategory"];
  [v4 encodeObject:self->_failingURL forKey:@"FailingURL"];
  [v4 encodeBool:self->_canGoBack forKey:@"CanGoBack"];
  [v4 encodeInteger:self->_numberOfDaysInvalid forKey:@"NumberOfDaysInvalid"];
  [v4 encodeDouble:@"ClockSkew" forKey:self->_clockSkew];
}

- (NSString)expiredCerticateDescription
{
  expiredCertificateDescription = self->_expiredCertificateDescription;
  if (expiredCertificateDescription)
  {
LABEL_2:
    id v3 = expiredCertificateDescription;
    goto LABEL_5;
  }
  if (!self->_warningCategory)
  {
    uint64_t v6 = NSString;
    if (self->_numberOfDaysInvalid < 1)
    {
      uint64_t v7 = _WBSLocalizedString();
      int64_t numberOfDaysInvalid = self->_numberOfDaysInvalid;
      if (numberOfDaysInvalid < 0) {
        int64_t numberOfDaysInvalid = -numberOfDaysInvalid;
      }
      objc_msgSend(v6, "localizedStringWithFormat:", v7, numberOfDaysInvalid);
      uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v7 = _WBSLocalizedString();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, self->_numberOfDaysInvalid);
      uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v10 = self->_expiredCertificateDescription;
    self->_expiredCertificateDescription = v8;

    expiredCertificateDescription = self->_expiredCertificateDescription;
    goto LABEL_2;
  }
  id v3 = 0;
LABEL_5:
  return v3;
}

- (NSURL)failingURL
{
  return self->_failingURL;
}

- (int64_t)warningCategory
{
  return self->_warningCategory;
}

- (BOOL)canGoBack
{
  return self->_canGoBack;
}

- (int64_t)numberOfDaysInvalid
{
  return self->_numberOfDaysInvalid;
}

- (double)clockSkew
{
  return self->_clockSkew;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failingURL, 0);
  objc_storeStrong((id *)&self->_expiredCertificateDescription, 0);
}

+ (void)certificateWarningCannotBeBypassedForTrust:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "SecTrustGetTrustResult failed with error %d", (uint8_t *)v2, 8u);
}

@end