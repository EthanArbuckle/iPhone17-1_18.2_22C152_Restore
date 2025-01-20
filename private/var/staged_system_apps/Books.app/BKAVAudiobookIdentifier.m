@interface BKAVAudiobookIdentifier
+ (id)audiobookIdentifierWithAssetID:(id)a3;
- (BKAVAudiobookIdentifier)initWithAssetID:(id)a3;
- (BOOL)isEqualToIdentifier:(id)a3;
- (NSString)assetID;
- (id)copy;
- (void)setAssetID:(id)a3;
@end

@implementation BKAVAudiobookIdentifier

+ (id)audiobookIdentifierWithAssetID:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAssetID:v4];

  return v5;
}

- (BKAVAudiobookIdentifier)initWithAssetID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKAVAudiobookIdentifier;
  id v5 = [(BKAVAudiobookIdentifier *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    assetID = v5->_assetID;
    v5->_assetID = v6;
  }
  return v5;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(BKAVAudiobookIdentifier *)self assetID];
    v6 = [v4 assetID];
    unsigned __int8 v7 = [v5 isEqual:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copy
{
  v3 = objc_opt_new();
  id v4 = [(BKAVAudiobookIdentifier *)self assetID];
  id v5 = [v4 copy];
  [v3 setAssetID:v5];

  return v3;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end