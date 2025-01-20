@interface BKTemporaryAssetID
+ (id)identifierWithTemporaryAssetID:(id)a3;
- (BKTemporaryAssetID)initWithTemporaryAssetID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporary;
- (NSString)description;
- (NSString)permanentAssetID;
- (NSString)permanentOrTemporaryAssetID;
- (NSString)temporaryAssetID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation BKTemporaryAssetID

+ (id)identifierWithTemporaryAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithTemporaryAssetID:v4];

  return v5;
}

- (BKTemporaryAssetID)initWithTemporaryAssetID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKTemporaryAssetID;
  v6 = [(BKTemporaryAssetID *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_temporaryAssetID, a3);
  }

  return v7;
}

- (NSString)permanentOrTemporaryAssetID
{
  id v2 = [(NSString *)self->_temporaryAssetID copy];

  return (NSString *)v2;
}

- (NSString)permanentAssetID
{
  return 0;
}

- (BOOL)isTemporary
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  temporaryAssetID = self->_temporaryAssetID;

  return [v4 initWithTemporaryAssetID:temporaryAssetID];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4[1] isEqual:self->_temporaryAssetID];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_temporaryAssetID hash];
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<temporaryAssetID: %@>", self->_temporaryAssetID];
}

- (NSString)temporaryAssetID
{
  return self->_temporaryAssetID;
}

- (void).cxx_destruct
{
}

@end