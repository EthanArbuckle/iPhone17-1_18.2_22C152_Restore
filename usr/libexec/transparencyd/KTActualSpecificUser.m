@interface KTActualSpecificUser
- (KTActualSpecificUser)initWithACAccount:(id)a3;
- (NSString)altDSID;
- (NSString)contextID;
- (NSString)dsid;
- (void)setAltDSID:(id)a3;
- (void)setContextID:(id)a3;
- (void)setDsid:(id)a3;
@end

@implementation KTActualSpecificUser

- (KTActualSpecificUser)initWithACAccount:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTActualSpecificUser;
  v5 = [(KTActualSpecificUser *)&v10 init];
  if (v5)
  {
    v6 = [v4 aa_personID];
    [(KTActualSpecificUser *)v5 setDsid:v6];

    v7 = [v4 aa_altDSID];
    [(KTActualSpecificUser *)v5 setAltDSID:v7];

    [(KTActualSpecificUser *)v5 setContextID:@"default"];
    v8 = v5;
  }

  return v5;
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDsid:(id)a3
{
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContextID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);

  objc_storeStrong((id *)&self->_dsid, 0);
}

@end