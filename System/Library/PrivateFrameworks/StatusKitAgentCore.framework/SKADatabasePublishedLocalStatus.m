@interface SKADatabasePublishedLocalStatus
- (BOOL)isEqualToStatus:(id)a3;
- (NSData)payload;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)identifier;
- (NSString)keyDomain;
- (NSString)keyName;
- (SKADatabasePublishedLocalStatus)initWithCoreDataPublishedLocalStatus:(id)a3;
- (SKADatabasePublishedLocalStatus)initWithIdentifier:(id)a3 creationDate:(id)a4 modificationDate:(id)a5 keyDomain:(id)a6 keyName:(id)a7 payload:(id)a8 targetDevicesFlags:(int64_t)a9;
- (int64_t)targetDevicesFlags;
- (void)setCreationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeyDomain:(id)a3;
- (void)setKeyName:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setPayload:(id)a3;
- (void)setTargetDevicesFlags:(int64_t)a3;
@end

@implementation SKADatabasePublishedLocalStatus

- (SKADatabasePublishedLocalStatus)initWithCoreDataPublishedLocalStatus:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [v4 creationDate];
  v7 = [v4 modificationDate];
  v8 = [v4 keyDomain];
  v9 = [v4 keyName];
  v10 = [v4 payload];
  uint64_t v11 = [v4 targetDevicesFlags];

  v12 = [(SKADatabasePublishedLocalStatus *)self initWithIdentifier:v5 creationDate:v6 modificationDate:v7 keyDomain:v8 keyName:v9 payload:v10 targetDevicesFlags:v11];
  return v12;
}

- (SKADatabasePublishedLocalStatus)initWithIdentifier:(id)a3 creationDate:(id)a4 modificationDate:(id)a5 keyDomain:(id)a6 keyName:(id)a7 payload:(id)a8 targetDevicesFlags:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v24 = a5;
  id v23 = a6;
  id v22 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SKADatabasePublishedLocalStatus;
  v19 = [(SKADatabasePublishedLocalStatus *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_creationDate, a4);
    objc_storeStrong((id *)&v20->_modificationDate, a5);
    objc_storeStrong((id *)&v20->_keyDomain, a6);
    objc_storeStrong((id *)&v20->_keyName, a7);
    objc_storeStrong((id *)&v20->_payload, a8);
    v20->_targetDevicesFlags = a9;
  }

  return v20;
}

- (BOOL)isEqualToStatus:(id)a3
{
  id v4 = a3;
  v5 = [(SKADatabasePublishedLocalStatus *)self identifier];
  v6 = [v4 identifier];
  if (![v5 isEqualToString:v6]) {
    goto LABEL_13;
  }
  v7 = [(SKADatabasePublishedLocalStatus *)self creationDate];
  v8 = [v4 creationDate];
  if (![v7 isEqualToDate:v8])
  {
LABEL_12:

LABEL_13:
    char v18 = 0;
    goto LABEL_14;
  }
  v9 = [(SKADatabasePublishedLocalStatus *)self modificationDate];
  v10 = [v4 modificationDate];
  if (![v9 isEqualToDate:v10])
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v11 = [(SKADatabasePublishedLocalStatus *)self keyDomain];
  v12 = [v4 keyDomain];
  if (![v11 isEqualToString:v12])
  {

    goto LABEL_11;
  }
  id v24 = v11;
  uint64_t v13 = [(SKADatabasePublishedLocalStatus *)self keyName];
  uint64_t v14 = [v4 keyName];
  id v23 = (void *)v13;
  v15 = (void *)v13;
  id v16 = (void *)v14;
  if (![v15 isEqualToString:v14])
  {

    goto LABEL_11;
  }
  int64_t v22 = [(SKADatabasePublishedLocalStatus *)self targetDevicesFlags];
  uint64_t v21 = [v4 targetDevicesFlags];

  if (v22 != v21)
  {
    char v18 = 0;
    goto LABEL_15;
  }
  id v17 = [(SKADatabasePublishedLocalStatus *)self payload];
  if (v17)
  {
  }
  else
  {
    v20 = [v4 payload];

    if (!v20)
    {
      char v18 = 1;
      goto LABEL_15;
    }
  }
  v5 = [(SKADatabasePublishedLocalStatus *)self payload];
  v6 = [v4 payload];
  char v18 = [v5 isEqualToData:v6];
LABEL_14:

LABEL_15:
  return v18;
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

- (NSString)keyDomain
{
  return self->_keyDomain;
}

- (void)setKeyDomain:(id)a3
{
}

- (NSString)keyName
{
  return self->_keyName;
}

- (void)setKeyName:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (int64_t)targetDevicesFlags
{
  return self->_targetDevicesFlags;
}

- (void)setTargetDevicesFlags:(int64_t)a3
{
  self->_targetDevicesFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_keyName, 0);
  objc_storeStrong((id *)&self->_keyDomain, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end