@interface MBDomainRecordQuota
+ (id)domainRecordQuotaWithBaseRecordID:(id)a3 quota:(int64_t)a4;
- (MBDomainRecordQuota)initWithBaseRecordID:(id)a3 domainHmac:(id)a4 quota:(int64_t)a5;
- (NSString)baseRecordID;
- (NSString)domainHmac;
- (int64_t)quota;
- (void)addQuota:(int64_t)a3;
@end

@implementation MBDomainRecordQuota

- (MBDomainRecordQuota)initWithBaseRecordID:(id)a3 domainHmac:(id)a4 quota:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MBDomainRecordQuota;
  v11 = [(MBDomainRecordQuota *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_baseRecordID, a3);
    objc_storeStrong((id *)&v12->_domainHmac, a4);
    v12->_quota = a5;
  }

  return v12;
}

- (void)addQuota:(int64_t)a3
{
  self->_quota += a3;
}

+ (id)domainRecordQuotaWithBaseRecordID:(id)a3 quota:(int64_t)a4
{
  id v5 = a3;
  v6 = +[MBDomainRecord domainHmacFromBaseRecordID:v5];
  v7 = [[MBDomainRecordQuota alloc] initWithBaseRecordID:v5 domainHmac:v6 quota:a4];

  return v7;
}

- (NSString)baseRecordID
{
  return self->_baseRecordID;
}

- (NSString)domainHmac
{
  return self->_domainHmac;
}

- (int64_t)quota
{
  return self->_quota;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainHmac, 0);
  objc_storeStrong((id *)&self->_baseRecordID, 0);
}

@end