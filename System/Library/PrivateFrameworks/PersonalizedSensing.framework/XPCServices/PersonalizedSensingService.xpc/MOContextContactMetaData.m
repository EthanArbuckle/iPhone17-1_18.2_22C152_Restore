@interface MOContextContactMetaData
+ (BOOL)supportsSecureCoding;
- (MOContextContactMetaData)init;
- (MOContextContactMetaData)initWithCoder:(id)a3;
- (MOContextContactMetaData)initWithContactIdentifier:(id)a3 contactName:(id)a4 mdEntityIdentifier:(id)a5;
- (MOContextContactMetaData)initWithContactMetaDataMO:(id)a3;
- (MOContextContactMetaData)initWithContactName:(id)a3;
- (NSString)contactName;
- (NSString)contextContactIdentifier;
- (NSString)mdEntityIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOContextContactMetaData

- (MOContextContactMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOContextContactMetaData;
  return [(MOContextContactMetaData *)&v3 init];
}

- (MOContextContactMetaData)initWithContactIdentifier:(id)a3 contactName:(id)a4 mdEntityIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MOContextContactMetaData;
  v12 = [(MOContextContactMetaData *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contextContactIdentifier, a3);
    objc_storeStrong((id *)&v13->_contactName, a4);
    objc_storeStrong((id *)&v13->_mdEntityIdentifier, a5);
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "ContactMetaData contextContactIdentifier,%@,contactName,%@,mdEntityIdentifier,%@", buf, 0x20u);
    }
  }
  return v13;
}

- (MOContextContactMetaData)initWithContactName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextContactMetaData;
  v6 = [(MOContextContactMetaData *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactName, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOContextContactMetaData alloc];
  id v5 = [(MOContextContactMetaData *)self contextContactIdentifier];
  v6 = [(MOContextContactMetaData *)self contactName];
  v7 = [(MOContextContactMetaData *)self mdEntityIdentifier];
  v8 = [(MOContextContactMetaData *)v4 initWithContactIdentifier:v5 contactName:v6 mdEntityIdentifier:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contactName = self->_contactName;
  id v5 = a3;
  [v5 encodeObject:contactName forKey:@"contactName"];
  [v5 encodeObject:self->_contextContactIdentifier forKey:@"contextContactIdentifier"];
  [v5 encodeObject:self->_mdEntityIdentifier forKey:@"mdEntityIdentifier"];
}

- (MOContextContactMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextContactIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mdEntityIdentifier"];

  v8 = [(MOContextContactMetaData *)self initWithContactIdentifier:v6 contactName:v5 mdEntityIdentifier:v7];
  return v8;
}

- (id)description
{
  v2 = [(MOContextContactMetaData *)self contactName];
  objc_super v3 = [v2 mask];
  id v4 = +[NSString stringWithFormat:@"contact name, %@", v3];

  return v4;
}

- (NSString)contactName
{
  return self->_contactName;
}

- (NSString)contextContactIdentifier
{
  return self->_contextContactIdentifier;
}

- (NSString)mdEntityIdentifier
{
  return self->_mdEntityIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mdEntityIdentifier, 0);
  objc_storeStrong((id *)&self->_contextContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactName, 0);
}

- (MOContextContactMetaData)initWithContactMetaDataMO:(id)a3
{
  if (a3)
  {
    id v4 = [a3 contactName];
    self = [(MOContextContactMetaData *)self initWithContactName:v4];

    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end