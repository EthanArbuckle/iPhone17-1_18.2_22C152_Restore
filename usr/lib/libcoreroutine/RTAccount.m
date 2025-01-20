@interface RTAccount
- (BOOL)primaryEmailVerified;
- (NSArray)appleIDAliases;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)appleIDAlias;
- (NSString)dsid;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)primaryEmail;
- (RTAccount)init;
- (RTAccount)initWithACAccount:(id)a3;
- (id)appleIDs;
- (id)description;
- (void)setAltDSID:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAppleIDAlias:(id)a3;
- (void)setAppleIDAliases:(id)a3;
- (void)setDsid:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setLastName:(id)a3;
- (void)setPrimaryEmail:(id)a3;
- (void)setPrimaryEmailVerified:(BOOL)a3;
@end

@implementation RTAccount

- (RTAccount)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithACAccount_);
}

- (RTAccount)initWithACAccount:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RTAccount;
  v5 = [(RTAccount *)&v15 init];
  if (v5)
  {
    v6 = [v4 aa_personID];
    [(RTAccount *)v5 setDsid:v6];

    v7 = [v4 aa_firstName];
    [(RTAccount *)v5 setFirstName:v7];

    v8 = [v4 aa_lastName];
    [(RTAccount *)v5 setLastName:v8];

    [v5 setPrimaryEmailVerified:[v4 aa_isPrimaryEmailVerified]];
    v9 = [v4 username];
    [(RTAccount *)v5 setAppleID:v9];

    v10 = [v4 aa_altDSID];
    [(RTAccount *)v5 setAltDSID:v10];

    v11 = [v4 aa_primaryEmail];
    [(RTAccount *)v5 setPrimaryEmail:v11];

    v12 = [v4 appleID];
    [(RTAccount *)v5 setAppleIDAlias:v12];

    v13 = [v4 aa_appleIDAliases];
    [(RTAccount *)v5 setAppleIDAliases:v13];
  }
  return v5;
}

- (id)appleIDs
{
  v3 = objc_opt_new();
  id v4 = [(RTAccount *)self dsid];

  if (v4)
  {
    v5 = [(RTAccount *)self dsid];
    [v3 addObject:v5];
  }
  v6 = [(RTAccount *)self appleID];

  if (v6)
  {
    v7 = [(RTAccount *)self appleID];
    [v3 addObject:v7];
  }
  if ([(RTAccount *)self primaryEmailVerified])
  {
    v8 = [(RTAccount *)self primaryEmail];

    if (v8)
    {
      v9 = [(RTAccount *)self primaryEmail];
      [v3 addObject:v9];
    }
  }
  v10 = [(RTAccount *)self appleIDAlias];

  if (v10)
  {
    v11 = [(RTAccount *)self appleIDAlias];
    [v3 addObject:v11];
  }
  v12 = [(RTAccount *)self appleIDAliases];
  [v3 addObjectsFromArray:v12];

  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"DSID: %@, Apple ID: %@, Primary Email: %@, Apple ID Alias: %@, Apple ID Aliases, %@", self->_dsid, self->_appleID, self->_primaryEmail, self->_appleIDAlias, self->_appleIDAliases];
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (BOOL)primaryEmailVerified
{
  return self->_primaryEmailVerified;
}

- (void)setPrimaryEmailVerified:(BOOL)a3
{
  self->_primaryEmailVerified = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)primaryEmail
{
  return self->_primaryEmail;
}

- (void)setPrimaryEmail:(id)a3
{
}

- (NSString)appleIDAlias
{
  return self->_appleIDAlias;
}

- (void)setAppleIDAlias:(id)a3
{
}

- (NSArray)appleIDAliases
{
  return self->_appleIDAliases;
}

- (void)setAppleIDAliases:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleIDAliases, 0);
  objc_storeStrong((id *)&self->_appleIDAlias, 0);
  objc_storeStrong((id *)&self->_primaryEmail, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end