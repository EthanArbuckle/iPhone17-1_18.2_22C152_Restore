@interface MAAutoAssetInfoListen
+ (BOOL)supportsSecureCoding;
- (MAAutoAssetInfoListen)initWithCoder:(id)a3;
- (MAAutoAssetInfoListen)initWithNotifications:(id)a3;
- (MAAutoAssetNotifications)activeNotifications;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MAAutoAssetInfoListen

- (MAAutoAssetInfoListen)initWithNotifications:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetInfoListen;
  v6 = [(MAAutoAssetInfoListen *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_activeNotifications, a3);
  }

  return v7;
}

- (MAAutoAssetInfoListen)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAAutoAssetInfoListen;
  id v5 = [(MAAutoAssetInfoListen *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeNotifications"];
    activeNotifications = v5->_activeNotifications;
    v5->_activeNotifications = (MAAutoAssetNotifications *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MAAutoAssetInfoListen *)self activeNotifications];
  [v4 encodeObject:v5 forKey:@"activeNotifications"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  v2 = [(MAAutoAssetInfoListen *)self activeNotifications];
  v3 = [v2 summary];

  return v3;
}

- (MAAutoAssetNotifications)activeNotifications
{
  return self->_activeNotifications;
}

- (void).cxx_destruct
{
}

@end