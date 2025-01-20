@interface ADAppRepresentation
- (ADAppRepresentation)initWithAdamID:(id)a3;
- (ADAppRepresentation)initWithAdamID:(id)a3 assetInformation:(id)a4;
- (NSDictionary)assetInformation;
- (NSString)adamID;
- (void)setAdamID:(id)a3;
- (void)setAssetInformation:(id)a3;
@end

@implementation ADAppRepresentation

- (ADAppRepresentation)initWithAdamID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAppRepresentation;
  v6 = [(ADAppRepresentation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_adamID, a3);
  }

  return v7;
}

- (ADAppRepresentation)initWithAdamID:(id)a3 assetInformation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADAppRepresentation;
  objc_super v9 = [(ADAppRepresentation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_adamID, a3);
    objc_storeStrong((id *)&v10->_assetInformation, a4);
  }

  return v10;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSDictionary)assetInformation
{
  return self->_assetInformation;
}

- (void)setAssetInformation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetInformation, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end