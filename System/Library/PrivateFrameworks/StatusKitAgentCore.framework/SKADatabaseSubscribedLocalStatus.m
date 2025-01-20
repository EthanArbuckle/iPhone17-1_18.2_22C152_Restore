@interface SKADatabaseSubscribedLocalStatus
- (NSData)payload;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)identifier;
- (NSString)idsIdentifier;
- (NSString)keyDomain;
- (NSString)keyName;
- (SKADatabaseSubscribedLocalStatus)initWithCoreDataSubscirbedLocalStatus:(id)a3;
- (SKADatabaseSubscribedLocalStatus)initWithIdentifier:(id)a3 creationDate:(id)a4 modificationDate:(id)a5 keyName:(id)a6 keyDomain:(id)a7 payload:(id)a8 idsIdentifier:(id)a9;
- (id)description;
- (void)setCreationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setKeyDomain:(id)a3;
- (void)setKeyName:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation SKADatabaseSubscribedLocalStatus

- (SKADatabaseSubscribedLocalStatus)initWithCoreDataSubscirbedLocalStatus:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 creationDate];
  v7 = [v4 modificationDate];
  v8 = [v4 keyName];
  v9 = [v4 keyDomain];
  v10 = [v4 payload];
  v11 = [v4 idsIdentifier];

  v12 = [(SKADatabaseSubscribedLocalStatus *)self initWithIdentifier:v5 creationDate:v6 modificationDate:v7 keyName:v8 keyDomain:v9 payload:v10 idsIdentifier:v11];
  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SKADatabaseSubscribedLocalStatus *)self identifier];
  v5 = [(SKADatabaseSubscribedLocalStatus *)self idsIdentifier];
  v6 = [(SKADatabaseSubscribedLocalStatus *)self keyDomain];
  v7 = [(SKADatabaseSubscribedLocalStatus *)self keyName];
  v8 = [(SKADatabaseSubscribedLocalStatus *)self creationDate];
  v9 = [(SKADatabaseSubscribedLocalStatus *)self modificationDate];
  v10 = [v3 stringWithFormat:@"<SubscribedLocalStatus: ID %@, IDS: %@, Domain: %@, Key: %@, CreationDate: %@, ModificationDate: %@>", v4, v5, v6, v7, v8, v9];

  return v10;
}

- (SKADatabaseSubscribedLocalStatus)initWithIdentifier:(id)a3 creationDate:(id)a4 modificationDate:(id)a5 keyName:(id)a6 keyDomain:(id)a7 payload:(id)a8 idsIdentifier:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)SKADatabaseSubscribedLocalStatus;
  v18 = [(SKADatabaseSubscribedLocalStatus *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_creationDate, a4);
    objc_storeStrong((id *)&v19->_modificationDate, a5);
    objc_storeStrong((id *)&v19->_keyName, a6);
    objc_storeStrong((id *)&v19->_keyDomain, a7);
    objc_storeStrong((id *)&v19->_payload, a8);
    objc_storeStrong((id *)&v19->_idsIdentifier, a9);
  }

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSString)keyName
{
  return self->_keyName;
}

- (void)setKeyName:(id)a3
{
}

- (NSString)keyDomain
{
  return self->_keyDomain;
}

- (void)setKeyDomain:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyDomain, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end