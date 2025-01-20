@interface ICQiCloudPlusFeature
+ (BOOL)supportsSecureCoding;
- (ICQImageURL)iconURL;
- (ICQiCloudPlusFeature)initWithCoder:(id)a3;
- (NSString)label;
- (NSString)sublabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIconURL:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSublabel:(id)a3;
@end

@implementation ICQiCloudPlusFeature

- (id)description
{
  return (id)[NSString stringWithFormat:@"label: %@, sublabel: %@, iconURL: %@", self->_label, self->_sublabel, self->_iconURL];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQiCloudPlusFeature);
  [(ICQiCloudPlusFeature *)v4 setLabel:self->_label];
  [(ICQiCloudPlusFeature *)v4 setSublabel:self->_sublabel];
  [(ICQiCloudPlusFeature *)v4 setIconURL:self->_iconURL];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  label = self->_label;
  id v5 = a3;
  [v5 encodeObject:label forKey:@"label"];
  [v5 encodeObject:self->_sublabel forKey:@"sublabel"];
  [v5 encodeObject:self->_iconURL forKey:@"iconURL"];
}

- (ICQiCloudPlusFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICQiCloudPlusFeature;
  id v5 = [(ICQiCloudPlusFeature *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sublabel"];
    sublabel = v5->_sublabel;
    v5->_sublabel = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"iconURL"];
    iconURL = v5->_iconURL;
    v5->_iconURL = (ICQImageURL *)v10;
  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)sublabel
{
  return self->_sublabel;
}

- (void)setSublabel:(id)a3
{
}

- (ICQImageURL)iconURL
{
  return self->_iconURL;
}

- (void)setIconURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_sublabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end