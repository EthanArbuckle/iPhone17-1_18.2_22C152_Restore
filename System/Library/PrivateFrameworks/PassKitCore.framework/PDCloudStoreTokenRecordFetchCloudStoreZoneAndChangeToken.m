@interface PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken
- (CKServerChangeToken)changeToken;
- (PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken)initWithCloudStoreZone:(id)a3;
- (PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken)initWithCloudStoreZone:(id)a3 changeToken:(id)a4;
- (PKCloudStoreZone)cloudStoreZone;
- (id)description;
- (void)setChangeToken:(id)a3;
- (void)setCloudStoreZone:(id)a3;
@end

@implementation PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken

- (PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken)initWithCloudStoreZone:(id)a3
{
  return [(PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken *)self initWithCloudStoreZone:a3 changeToken:0];
}

- (PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken)initWithCloudStoreZone:(id)a3 changeToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken;
  v9 = [(PDCloudStoreTokenRecordFetchCloudStoreZoneAndChangeToken *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_cloudStoreZone, a3);
    objc_storeStrong((id *)&v10->_changeToken, a4);
  }

  return v10;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"cloudStoreZone: '%@'; ", self->_cloudStoreZone];
  [v3 appendFormat:@"changeToken: '%@'; ", self->_changeToken];
  [v3 appendFormat:@">"];
  return v3;
}

- (PKCloudStoreZone)cloudStoreZone
{
  return self->_cloudStoreZone;
}

- (void)setCloudStoreZone:(id)a3
{
}

- (CKServerChangeToken)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_cloudStoreZone, 0);
}

@end