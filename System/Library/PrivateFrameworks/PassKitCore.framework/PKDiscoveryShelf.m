@interface PKDiscoveryShelf
+ (BOOL)supportsSecureCoding;
+ (id)shelfWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PKDiscoveryItem)item;
- (PKDiscoveryShelf)initWithCoder:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setItem:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKDiscoveryShelf

+ (id)shelfWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 PKStringForKey:@"shelfType"];
  if ([@"textBlock" isEqualToString:v4])
  {
    v5 = off_1E56D4FD8;
LABEL_7:

LABEL_8:
    v6 = (void *)[objc_alloc(*v5) initWithDictionary:v3];
    goto LABEL_9;
  }
  if ([@"inlineMedia" isEqualToString:v4])
  {
    v5 = off_1E56D4F78;
    goto LABEL_7;
  }
  if ([@"spacer" isEqualToString:v4])
  {
    v5 = off_1E56D4FD0;
    goto LABEL_7;
  }
  char v8 = [@"callToAction" isEqualToString:v4];

  if (v8)
  {
    v5 = off_1E56D4F58;
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (void)setItem:(id)a3
{
  p_item = &self->_item;
  id v5 = a3;
  objc_storeWeak((id *)p_item, v5);
  v6 = [v5 identifier];

  itemIdentifier = self->_itemIdentifier;
  self->_itemIdentifier = v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[3];

  return v5;
}

- (unint64_t)hash
{
  return self->_type + 527;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"shelfType"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"itemIdentifier"];
}

- (PKDiscoveryShelf)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryShelf;
  id v5 = [(PKDiscoveryShelf *)&v9 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"shelfType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;
  }
  return v5;
}

- (PKDiscoveryItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (PKDiscoveryItem *)WeakRetained;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end