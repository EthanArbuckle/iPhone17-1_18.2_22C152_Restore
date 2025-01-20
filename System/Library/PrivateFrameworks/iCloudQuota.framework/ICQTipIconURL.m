@interface ICQTipIconURL
+ (BOOL)supportsSecureCoding;
- (ICQImageURL)imageURL;
- (ICQTipIconURL)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImageURL:(id)a3;
@end

@implementation ICQTipIconURL

- (id)description
{
  return (id)[NSString stringWithFormat:@"imageURL: %@", self->_imageURL];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQTipIconURL);
  [(ICQTipIconURL *)v4 setImageURL:self->_imageURL];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICQTipIconURL)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQTipIconURL;
  v5 = [(ICQTipIconURL *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageURL"];
    imageURL = v5->_imageURL;
    v5->_imageURL = (ICQImageURL *)v6;
  }
  return v5;
}

- (ICQImageURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end