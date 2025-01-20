@interface TUContactsDataProviderResult
- (NSArray)contacts;
- (NSString)companyName;
- (NSString)contactLabel;
- (NSString)localizedName;
- (id)description;
- (int)legacyAddressBookIdentifier;
- (void)setCompanyName:(id)a3;
- (void)setContactLabel:(id)a3;
- (void)setContacts:(id)a3;
- (void)setLegacyAddressBookIdentifier:(int)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation TUContactsDataProviderResult

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(TUContactsDataProviderResult *)self contacts];
  [v3 appendFormat:@" contacts=%@", v4];

  v5 = [(TUContactsDataProviderResult *)self localizedName];
  [v3 appendFormat:@" localizedName=%@", v5];

  v6 = [(TUContactsDataProviderResult *)self companyName];
  [v3 appendFormat:@" companyName=%@", v6];

  v7 = [(TUContactsDataProviderResult *)self contactLabel];
  [v3 appendFormat:@" contactLabel=%@", v7];

  objc_msgSend(v3, "appendFormat:", @" legacyAddressBookIdentifier=%d", -[TUContactsDataProviderResult legacyAddressBookIdentifier](self, "legacyAddressBookIdentifier"));
  [v3 appendString:@">"];
  v8 = (void *)[v3 copy];

  return v8;
}

- (NSArray)contacts
{
  contacts = self->_contacts;
  if (!contacts)
  {
    self->_contacts = (NSArray *)MEMORY[0x1E4F1CBF0];

    contacts = self->_contacts;
  }

  return contacts;
}

- (void)setContacts:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setCompanyName:(id)a3
{
}

- (NSString)contactLabel
{
  return self->_contactLabel;
}

- (void)setContactLabel:(id)a3
{
}

- (int)legacyAddressBookIdentifier
{
  return self->_legacyAddressBookIdentifier;
}

- (void)setLegacyAddressBookIdentifier:(int)a3
{
  self->_legacyAddressBookIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactLabel, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

@end