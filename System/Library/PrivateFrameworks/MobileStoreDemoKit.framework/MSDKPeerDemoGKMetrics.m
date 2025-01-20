@interface MSDKPeerDemoGKMetrics
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoGKMetrics)initWithCoder:(id)a3;
- (MSDKPeerDemoGKMetrics)initWithGKDataList:(id)a3;
- (NSArray)GKDataList;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setGKDataList:(id)a3;
@end

@implementation MSDKPeerDemoGKMetrics

- (MSDKPeerDemoGKMetrics)initWithGKDataList:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDKPeerDemoGKMetrics;
  v5 = [(MSDKPeerDemoGKMetrics *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MSDKPeerDemoGKMetrics *)v5 setGKDataList:v4];
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MSDKPeerDemoGKMetrics *)self GKDataList];
  v7 = [v3 stringWithFormat:@"<%@[%p]: GKDataList=%@>", v5, self, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoGKMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoGKMetrics;
  v5 = [(MSDKPeerDemoGKMetrics *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    objc_super v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"GKDataList"];
    [(MSDKPeerDemoGKMetrics *)v5 setGKDataList:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MSDKPeerDemoGKMetrics *)self GKDataList];
  [v4 encodeObject:v5 forKey:@"GKDataList"];
}

- (NSArray)GKDataList
{
  return self->_GKDataList;
}

- (void)setGKDataList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end