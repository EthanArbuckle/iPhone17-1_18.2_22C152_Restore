@interface MailStatusInfo
- (BOOL)hasAccountError;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldShowSubtitle;
- (NSAttributedString)accountErrorString;
- (NSAttributedString)iCloudQuotaOfferLink;
- (NSAttributedString)iCloudQuotaOfferText;
- (NSAttributedString)networkingAccountErrorString;
- (NSDate)lastUpdateTime;
- (NSDate)showQuotaOfferInformationTimestamp;
- (NSError)error;
- (NSProgress)progress;
- (NSString)accountErrorTitle;
- (NSString)debugDescription;
- (NSString)ef_publicDescription;
- (NSString)failureReasonDescription;
- (NSString)status;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)badgeCount;
- (int64_t)state;
- (int64_t)unsentCount;
- (unint64_t)hash;
- (void)setAccountErrorString:(id)a3;
- (void)setAccountErrorTitle:(id)a3;
- (void)setBadgeCount:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setFailureReasonDescription:(id)a3;
- (void)setHasAccountError:(BOOL)a3;
- (void)setICloudQuotaOfferLink:(id)a3;
- (void)setICloudQuotaOfferText:(id)a3;
- (void)setLastUpdateTime:(id)a3;
- (void)setNetworkingAccountErrorString:(id)a3;
- (void)setProgress:(id)a3;
- (void)setShouldShowSubtitle:(BOOL)a3;
- (void)setShowQuotaOfferInformationTimestamp:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStatus:(id)a3;
- (void)setUnsentCount:(int64_t)a3;
@end

@implementation MailStatusInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showQuotaOfferInformationTimestamp, 0);
  objc_storeStrong((id *)&self->_iCloudQuotaOfferLink, 0);
  objc_storeStrong((id *)&self->_iCloudQuotaOfferText, 0);
  objc_storeStrong((id *)&self->_networkingAccountErrorString, 0);
  objc_storeStrong((id *)&self->_accountErrorString, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_failureReasonDescription, 0);
  objc_storeStrong((id *)&self->_accountErrorTitle, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_lastUpdateTime, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

- (void)setStatus:(id)a3
{
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setProgress:(id)a3
{
}

- (void)setLastUpdateTime:(id)a3
{
}

- (void)setUnsentCount:(int64_t)a3
{
  self->_unsentCount = a3;
}

- (void)setShouldShowSubtitle:(BOOL)a3
{
  self->_shouldShowSubtitle = a3;
}

- (void)setNetworkingAccountErrorString:(id)a3
{
}

- (void)setICloudQuotaOfferText:(id)a3
{
}

- (void)setICloudQuotaOfferLink:(id)a3
{
}

- (void)setHasAccountError:(BOOL)a3
{
  self->_hasAccountError = a3;
}

- (void)setBadgeCount:(int64_t)a3
{
  self->_badgeCount = a3;
}

- (void)setAccountErrorString:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MailStatusInfo *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MailStatusInfo *)self state];
      if (v6 == (id)[(MailStatusInfo *)v5 state]
        && (unsigned int v7 = [(MailStatusInfo *)self shouldShowSubtitle],
            v7 == [(MailStatusInfo *)v5 shouldShowSubtitle])
        && (id v8 = [(MailStatusInfo *)self badgeCount],
            v8 == (id)[(MailStatusInfo *)v5 badgeCount])
        && (id v9 = [(MailStatusInfo *)self unsentCount],
            v9 == (id)[(MailStatusInfo *)v5 unsentCount])
        && (unsigned int v10 = [(MailStatusInfo *)self hasAccountError],
            v10 == [(MailStatusInfo *)v5 hasAccountError]))
      {
        v13 = [(MailStatusInfo *)self status];
        v14 = [(MailStatusInfo *)v5 status];
        if (EFObjectsAreEqual())
        {
          v15 = [(MailStatusInfo *)self lastUpdateTime];
          v16 = [(MailStatusInfo *)v5 lastUpdateTime];
          if (EFObjectsAreEqual())
          {
            v17 = [(MailStatusInfo *)self progress];
            v18 = [(MailStatusInfo *)v5 progress];
            if (EFObjectsAreEqual())
            {
              v34 = [(MailStatusInfo *)self accountErrorTitle];
              v19 = [(MailStatusInfo *)v5 accountErrorTitle];
              if (EFObjectsAreEqual())
              {
                v33 = [(MailStatusInfo *)self failureReasonDescription];
                v32 = [(MailStatusInfo *)v5 failureReasonDescription];
                if (EFObjectsAreEqual())
                {
                  v31 = [(MailStatusInfo *)self error];
                  v30 = [(MailStatusInfo *)v5 error];
                  if (EFObjectsAreEqual())
                  {
                    v29 = [(MailStatusInfo *)self accountErrorString];
                    v28 = [(MailStatusInfo *)v5 accountErrorString];
                    if (EFObjectsAreEqual())
                    {
                      v27 = [(MailStatusInfo *)self networkingAccountErrorString];
                      v26 = [(MailStatusInfo *)v5 networkingAccountErrorString];
                      if (EFObjectsAreEqual())
                      {
                        v25 = [(MailStatusInfo *)self iCloudQuotaOfferText];
                        v24 = [(MailStatusInfo *)v5 iCloudQuotaOfferText];
                        if (EFObjectsAreEqual())
                        {
                          v23 = [(MailStatusInfo *)self iCloudQuotaOfferLink];
                          v22 = [(MailStatusInfo *)v5 iCloudQuotaOfferLink];
                          if (EFObjectsAreEqual())
                          {
                            v21 = [(MailStatusInfo *)self showQuotaOfferInformationTimestamp];
                            v20 = [(MailStatusInfo *)v5 showQuotaOfferInformationTimestamp];
                            char v11 = EFObjectsAreEqual();
                          }
                          else
                          {
                            char v11 = 0;
                          }
                        }
                        else
                        {
                          char v11 = 0;
                        }
                      }
                      else
                      {
                        char v11 = 0;
                      }
                    }
                    else
                    {
                      char v11 = 0;
                    }
                  }
                  else
                  {
                    char v11 = 0;
                  }
                }
                else
                {
                  char v11 = 0;
                }
              }
              else
              {
                char v11 = 0;
              }
            }
            else
            {
              char v11 = 0;
            }
          }
          else
          {
            char v11 = 0;
          }
        }
        else
        {
          char v11 = 0;
        }
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)ef_publicDescription
{
  uint64_t v15 = objc_opt_class();
  int64_t v3 = [(MailStatusInfo *)self state];
  uint64_t v4 = [(MailStatusInfo *)self status];
  v5 = (void *)v4;
  if (v4) {
    CFStringRef v6 = (const __CFString *)v4;
  }
  else {
    CFStringRef v6 = &stru_100619928;
  }
  unsigned int v7 = [(MailStatusInfo *)self lastUpdateTime];
  BOOL v8 = [(MailStatusInfo *)self shouldShowSubtitle];
  id v9 = +[EFPrivacy bucketMessageCount:[(MailStatusInfo *)self badgeCount]];
  unsigned int v10 = [(MailStatusInfo *)self progress];
  char v11 = [(MailStatusInfo *)self accountErrorString];
  v12 = [(MailStatusInfo *)self networkingAccountErrorString];
  v13 = +[NSString stringWithFormat:@"<%@: %p> state:%ld status:%@ lastUpdateTime:%@ shouldShowSubtitle:%d badgeCount:%u progress:%@ accountErrorString:%@ networkingErrorString:%@", v15, self, v3, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v13;
}

- (NSString)status
{
  return self->_status;
}

- (BOOL)shouldShowSubtitle
{
  return self->_shouldShowSubtitle;
}

- (int64_t)badgeCount
{
  return self->_badgeCount;
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSAttributedString)networkingAccountErrorString
{
  return self->_networkingAccountErrorString;
}

- (NSAttributedString)accountErrorString
{
  return self->_accountErrorString;
}

- (BOOL)hasAccountError
{
  return self->_hasAccountError;
}

- (int64_t)unsentCount
{
  return self->_unsentCount;
}

- (NSAttributedString)iCloudQuotaOfferText
{
  return self->_iCloudQuotaOfferText;
}

- (NSAttributedString)iCloudQuotaOfferLink
{
  return self->_iCloudQuotaOfferLink;
}

- (void)setError:(id)a3
{
}

- (void)setAccountErrorTitle:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [+[MailStatusInfo allocWithZone:a3] init];
  [(MailStatusInfo *)v4 setState:[(MailStatusInfo *)self state]];
  v5 = [(MailStatusInfo *)self status];
  id v6 = [v5 copy];
  [(MailStatusInfo *)v4 setStatus:v6];

  unsigned int v7 = [(MailStatusInfo *)self lastUpdateTime];
  id v8 = [v7 copy];
  [(MailStatusInfo *)v4 setLastUpdateTime:v8];

  [(MailStatusInfo *)v4 setShouldShowSubtitle:[(MailStatusInfo *)self shouldShowSubtitle]];
  [(MailStatusInfo *)v4 setBadgeCount:[(MailStatusInfo *)self badgeCount]];
  [(MailStatusInfo *)v4 setUnsentCount:[(MailStatusInfo *)self unsentCount]];
  id v9 = [(MailStatusInfo *)self progress];
  [(MailStatusInfo *)v4 setProgress:v9];

  [(MailStatusInfo *)v4 setHasAccountError:[(MailStatusInfo *)self hasAccountError]];
  unsigned int v10 = [(MailStatusInfo *)self accountErrorTitle];
  [(MailStatusInfo *)v4 setAccountErrorTitle:v10];

  char v11 = [(MailStatusInfo *)self failureReasonDescription];
  [(MailStatusInfo *)v4 setFailureReasonDescription:v11];

  v12 = [(MailStatusInfo *)self error];
  id v13 = [v12 copy];
  [(MailStatusInfo *)v4 setError:v13];

  v14 = [(MailStatusInfo *)self accountErrorString];
  [(MailStatusInfo *)v4 setAccountErrorString:v14];

  uint64_t v15 = [(MailStatusInfo *)self networkingAccountErrorString];
  [(MailStatusInfo *)v4 setNetworkingAccountErrorString:v15];

  v16 = [(MailStatusInfo *)self iCloudQuotaOfferText];
  [(MailStatusInfo *)v4 setICloudQuotaOfferText:v16];

  v17 = [(MailStatusInfo *)self iCloudQuotaOfferLink];
  [(MailStatusInfo *)v4 setICloudQuotaOfferLink:v17];

  v18 = [(MailStatusInfo *)self showQuotaOfferInformationTimestamp];
  id v19 = [v18 copy];
  [(MailStatusInfo *)v4 setShowQuotaOfferInformationTimestamp:v19];

  return v4;
}

- (unint64_t)hash
{
  int64_t v3 = [(MailStatusInfo *)self state];
  int64_t v4 = [(MailStatusInfo *)self badgeCount];
  int64_t v5 = [(MailStatusInfo *)self unsentCount];
  unsigned int v6 = [(MailStatusInfo *)self hasAccountError];
  unsigned int v7 = [(MailStatusInfo *)self status];
  id v8 = [v7 hash];

  id v9 = [(MailStatusInfo *)self lastUpdateTime];
  id v10 = [v9 hash];

  char v11 = [(MailStatusInfo *)self iCloudQuotaOfferText];
  v12 = (char *)[v11 hash]
      + 33 * ((void)v10 + 33 * ((void)v8 + 1185921 * v3 + 35937 * v4 + 1089 * v5 + 33 * v6))
      + 0x9EC41D4E1;

  return (unint64_t)v12;
}

- (NSString)debugDescription
{
  int64_t v3 = [(MailStatusInfo *)self ef_publicDescription];
  int64_t v4 = [(MailStatusInfo *)self error];
  int64_t v5 = [v3 stringByAppendingFormat:@" error:%@", v4];

  return (NSString *)v5;
}

- (NSString)accountErrorTitle
{
  return self->_accountErrorTitle;
}

- (NSString)failureReasonDescription
{
  return self->_failureReasonDescription;
}

- (void)setFailureReasonDescription:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (NSDate)showQuotaOfferInformationTimestamp
{
  return self->_showQuotaOfferInformationTimestamp;
}

- (void)setShowQuotaOfferInformationTimestamp:(id)a3
{
}

@end