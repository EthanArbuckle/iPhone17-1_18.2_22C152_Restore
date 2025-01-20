@interface _MultiplatformDonationRecencyInfo
- (NSDate)localDonationCreationDate;
- (NSDate)remoteDonationCreationDate;
- (NSString)localBundleIdentifier;
- (NSString)remoteBundleIdentifier;
- (id)identifierForMostRecentData;
- (void)setLocalBundleIdentifier:(id)a3;
- (void)setLocalDonationCreationDate:(id)a3;
- (void)setRemoteBundleIdentifier:(id)a3;
- (void)setRemoteDonationCreationDate:(id)a3;
@end

@implementation _MultiplatformDonationRecencyInfo

- (id)identifierForMostRecentData
{
  if (self->_remoteDonationCreationDate)
  {
    localDonationCreationDate = self->_localDonationCreationDate;
    if (localDonationCreationDate)
    {
      v4 = -[NSDate laterDate:](localDonationCreationDate, "laterDate:");
      int v5 = [v4 isEqual:self->_localDonationCreationDate];

      uint64_t v6 = 8;
      if (v5) {
        uint64_t v6 = 16;
      }
    }
    else
    {
      uint64_t v6 = 8;
    }
  }
  else
  {
    uint64_t v6 = 16;
  }
  v7 = *(Class *)((char *)&self->super.isa + v6);
  return v7;
}

- (NSString)remoteBundleIdentifier
{
  return self->_remoteBundleIdentifier;
}

- (void)setRemoteBundleIdentifier:(id)a3
{
}

- (NSString)localBundleIdentifier
{
  return self->_localBundleIdentifier;
}

- (void)setLocalBundleIdentifier:(id)a3
{
}

- (NSDate)remoteDonationCreationDate
{
  return self->_remoteDonationCreationDate;
}

- (void)setRemoteDonationCreationDate:(id)a3
{
}

- (NSDate)localDonationCreationDate
{
  return self->_localDonationCreationDate;
}

- (void)setLocalDonationCreationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDonationCreationDate, 0);
  objc_storeStrong((id *)&self->_remoteDonationCreationDate, 0);
  objc_storeStrong((id *)&self->_localBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteBundleIdentifier, 0);
}

@end