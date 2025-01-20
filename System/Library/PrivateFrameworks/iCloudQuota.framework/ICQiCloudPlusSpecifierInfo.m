@interface ICQiCloudPlusSpecifierInfo
+ (BOOL)supportsSecureCoding;
- (ICQiCloudPlusSpecifierInfo)initWithCoder:(id)a3;
- (NSArray)featureList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureList:(id)a3;
@end

@implementation ICQiCloudPlusSpecifierInfo

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  v4 = [(ICQSpecifierInfo *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@, featureList: %@", v4, self->_featureList];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  id v4 = [(ICQSpecifierInfo *)&v6 copyWithZone:a3];
  [v4 setFeatureList:self->_featureList];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  id v4 = a3;
  [(ICQSpecifierInfo *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_featureList, @"featureList", v5.receiver, v5.super_class);
}

- (ICQiCloudPlusSpecifierInfo)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICQiCloudPlusSpecifierInfo;
  objc_super v5 = [(ICQSpecifierInfo *)&v12 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"featureList"];
    featureList = v5->_featureList;
    v5->_featureList = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)featureList
{
  return self->_featureList;
}

- (void)setFeatureList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end