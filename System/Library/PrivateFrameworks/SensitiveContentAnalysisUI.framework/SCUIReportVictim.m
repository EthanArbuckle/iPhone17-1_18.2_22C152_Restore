@interface SCUIReportVictim
- (NSArray)mediaFiles;
- (NSDate)dateOfBirth;
- (NSString)accountID;
- (NSString)appleID;
- (NSString)displayName;
- (NSString)emailAddress;
- (NSString)fullName;
- (NSString)phoneNumber;
- (SCUIReportAddress)address;
- (SCUIReportVictim)initWithDisplayName:(id)a3 mediaFiles:(id)a4;
- (void)setAccountID:(id)a3;
- (void)setAddress:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setFullName:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation SCUIReportVictim

- (SCUIReportVictim)initWithDisplayName:(id)a3 mediaFiles:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCUIReportVictim;
  v8 = [(SCUIReportVictim *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    displayName = v8->_displayName;
    v8->_displayName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    mediaFiles = v8->_mediaFiles;
    v8->_mediaFiles = (NSArray *)v11;
  }
  return v8;
}

- (NSString)accountID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountID:(id)a3
{
}

- (NSString)emailAddress
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)fullName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFullName:(id)a3
{
}

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAppleID:(id)a3
{
}

- (NSString)phoneNumber
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSDate)dateOfBirth
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDateOfBirth:(id)a3
{
}

- (SCUIReportAddress)address
{
  return (SCUIReportAddress *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAddress:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)mediaFiles
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaFiles, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end