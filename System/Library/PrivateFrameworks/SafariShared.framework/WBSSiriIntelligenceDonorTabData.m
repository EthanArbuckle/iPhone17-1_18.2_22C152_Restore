@interface WBSSiriIntelligenceDonorTabData
- (NSDate)lastVisitedDate;
- (NSString)profileIdentifier;
- (NSString)tabGroupUUID;
- (NSString)title;
- (NSString)uuidString;
- (NSURL)url;
- (void)setLastVisitedDate:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setTabGroupUUID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation WBSSiriIntelligenceDonorTabData

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSDate)lastVisitedDate
{
  return self->_lastVisitedDate;
}

- (void)setLastVisitedDate:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)tabGroupUUID
{
  return self->_tabGroupUUID;
}

- (void)setTabGroupUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupUUID, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_lastVisitedDate, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end