@interface ICQTipIcon
+ (BOOL)supportsSecureCoding;
- (ICQTipIcon)initWithCoder:(id)a3;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(id)a3;
@end

@implementation ICQTipIcon

- (id)description
{
  return (id)[NSString stringWithFormat:@"type: %@", self->_type];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(ICQTipIcon);
  [(ICQTipIcon *)v4 setType:self->_type];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICQTipIcon)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICQTipIcon;
  v5 = [(ICQTipIcon *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v6;
  }
  return v5;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end