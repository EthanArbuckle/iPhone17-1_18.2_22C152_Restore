@interface PKApplyActionContentTextItemODIDetail
- (NSCopying)identifier;
- (NSString)odiAttribute;
- (NSString)odiValue;
- (PKApplyActionContentTextItemODIDetail)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)odiAttributesDictionary;
@end

@implementation PKApplyActionContentTextItemODIDetail

- (PKApplyActionContentTextItemODIDetail)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKApplyActionContentTextItemODIDetail;
  v5 = [(PKApplyActionContentTextItemODIDetail *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"odiAttribute"];
    odiAttribute = v5->_odiAttribute;
    v5->_odiAttribute = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"odiValue"];
    odiValue = v5->_odiValue;
    v5->_odiValue = (NSString *)v8;
  }
  return v5;
}

- (id)odiAttributesDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 safelySetObject:self->_odiValue forKey:self->_odiAttribute];
  return v3;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  if (self->_odiAttribute) {
    objc_msgSend(v3, "appendString:");
  }
  if (self->_odiValue) {
    objc_msgSend(v3, "appendString:");
  }
  uint64_t v6 = (void *)[v3 copy];

  return (NSCopying *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKApplyActionContentTextItemODIDetail allocWithZone:](PKApplyActionContentTextItemODIDetail, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_odiAttribute copyWithZone:a3];
  odiAttribute = v5->_odiAttribute;
  v5->_odiAttribute = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_odiValue copyWithZone:a3];
  odiValue = v5->_odiValue;
  v5->_odiValue = (NSString *)v8;

  return v5;
}

- (NSString)odiAttribute
{
  return self->_odiAttribute;
}

- (NSString)odiValue
{
  return self->_odiValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiValue, 0);
  objc_storeStrong((id *)&self->_odiAttribute, 0);
}

@end