@interface TPSAnalyticsEventContentShared
+ (BOOL)supportsSecureCoding;
+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 shareMethod:(id)a5;
- (NSString)collectionID;
- (NSString)contentID;
- (NSString)shareMethod;
- (TPSAnalyticsEventContentShared)initWithCoder:(id)a3;
- (id)_initWithContentID:(id)a3 collectionID:(id)a4 shareMethod:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setContentID:(id)a3;
- (void)setShareMethod:(id)a3;
@end

@implementation TPSAnalyticsEventContentShared

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventContentShared)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventContentShared;
  v5 = [(TPSAnalyticsEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"share_method"];
    shareMethod = v5->_shareMethod;
    v5->_shareMethod = (NSString *)v10;
  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 shareMethod:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventContentShared;
  v12 = [(TPSAnalyticsEvent *)&v15 initWithDate:0];
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contentID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 shareMethod:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithContentID:v10 collectionID:v9 shareMethod:v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentShared;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_shareMethod forKey:@"share_method"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"content_shared"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_contentID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_ID"];
  [v3 setObject:self->_shareMethod forKeyedSubscript:@"share_method"];
  return v3;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)shareMethod
{
  return self->_shareMethod;
}

- (void)setShareMethod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareMethod, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end