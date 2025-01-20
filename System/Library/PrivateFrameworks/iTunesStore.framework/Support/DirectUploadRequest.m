@interface DirectUploadRequest
- (DirectUploadRequest)initWithEntity:(id)a3 accountIdentifier:(id)a4;
- (NSNumber)accountIdentifier;
- (NSString)UTI;
- (NSString)parentRelationshipType;
- (NSString)sourceApplication;
- (NSURL)localAssetURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)databaseIdentifier;
- (int64_t)parentUploadIdentifier;
- (void)setAccountIdentifier:(id)a3;
- (void)setDatabaseIdentifier:(int64_t)a3;
- (void)setLocalAssetURL:(id)a3;
- (void)setParentRelationshipType:(id)a3;
- (void)setParentUploadIdentifier:(int64_t)a3;
- (void)setSourceApplication:(id)a3;
- (void)setUTI:(id)a3;
@end

@implementation DirectUploadRequest

- (DirectUploadRequest)initWithEntity:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)DirectUploadRequest;
  v8 = [(DirectUploadRequest *)&v27 init];
  if (v8)
  {
    v31[0] = @"asset_url";
    v31[1] = @"parent_upload_id";
    v31[2] = @"parent_relationship_type";
    v31[3] = @"post_id";
    v31[4] = @"source_app";
    v31[5] = @"uti";
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    [v6 getValues:&v28 forProperties:v31 count:6];
    if ((void)v28)
    {
      id v9 = objc_alloc((Class)NSURL);
      v10 = (NSURL *)[v9 initWithString:(void)v28];
      localAssetURL = v8->_localAssetURL;
      v8->_localAssetURL = v10;
    }
    v8->_databaseIdentifier = (int64_t)[v6 persistentID];
    v12 = (NSString *)[(id)v29 copy];
    parentRelationshipType = v8->_parentRelationshipType;
    v8->_parentRelationshipType = v12;

    v8->_parentUploadIdentifier = (int64_t)[*((id *)&v28 + 1) longLongValue];
    v14 = (NSString *)[(id)v30 copy];
    sourceApplication = v8->_sourceApplication;
    v8->_sourceApplication = v14;

    v16 = (NSString *)[*((id *)&v30 + 1) copy];
    utuint64_t i = v8->_uti;
    v8->_utuint64_t i = v16;

    if (v7)
    {
      v18 = (NSNumber *)[v7 copy];
      accountIdentifier = (MediaSocialPostEntity *)v8->_accountIdentifier;
      v8->_accountIdentifier = v18;
    }
    else
    {
      v20 = [MediaSocialPostEntity alloc];
      id v21 = [*((id *)&v29 + 1) longLongValue];
      v22 = [v6 database];
      accountIdentifier = [(MediaSocialPostEntity *)v20 initWithPersistentID:v21 inDatabase:v22];

      uint64_t v23 = [(MediaSocialPostEntity *)accountIdentifier valueForProperty:@"account_id"];
      v24 = v8->_accountIdentifier;
      v8->_accountIdentifier = (NSNumber *)v23;
    }
    for (uint64_t i = 5; i != -1; --i)
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setAccountIdentifier:self->_accountIdentifier];
  [v4 setDatabaseIdentifier:self->_databaseIdentifier];
  [v4 setLocalAssetURL:self->_localAssetURL];
  [v4 setParentRelationshipType:self->_parentRelationshipType];
  [v4 setParentUploadIdentifier:self->_parentUploadIdentifier];
  [v4 setSourceApplication:self->_sourceApplication];
  [v4 setUTI:self->_uti];
  return v4;
}

- (NSNumber)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (int64_t)databaseIdentifier
{
  return self->_databaseIdentifier;
}

- (void)setDatabaseIdentifier:(int64_t)a3
{
  self->_databaseIdentifier = a3;
}

- (NSURL)localAssetURL
{
  return self->_localAssetURL;
}

- (void)setLocalAssetURL:(id)a3
{
}

- (NSString)parentRelationshipType
{
  return self->_parentRelationshipType;
}

- (void)setParentRelationshipType:(id)a3
{
}

- (int64_t)parentUploadIdentifier
{
  return self->_parentUploadIdentifier;
}

- (void)setParentUploadIdentifier:(int64_t)a3
{
  self->_parentUploadIdentifier = a3;
}

- (NSString)sourceApplication
{
  return self->_sourceApplication;
}

- (void)setSourceApplication:(id)a3
{
}

- (NSString)UTI
{
  return self->_uti;
}

- (void)setUTI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_sourceApplication, 0);
  objc_storeStrong((id *)&self->_parentRelationshipType, 0);
  objc_storeStrong((id *)&self->_localAssetURL, 0);

  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end