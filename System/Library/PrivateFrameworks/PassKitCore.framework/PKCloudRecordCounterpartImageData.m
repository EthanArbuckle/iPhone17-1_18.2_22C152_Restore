@interface PKCloudRecordCounterpartImageData
+ (BOOL)supportsSecureCoding;
- (PKCloudRecordCounterpartImageData)initWithCoder:(id)a3;
- (PKPeerPaymentCounterpartImageData)counterpartImageData;
- (id)_descriptionWithIncludeItem:(BOOL)a3;
- (id)description;
- (id)descriptionWithItem:(BOOL)a3;
- (id)item;
- (int64_t)compare:(id)a3;
- (void)applyCloudRecordObject:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCounterpartImageData:(id)a3;
@end

@implementation PKCloudRecordCounterpartImageData

- (id)item
{
  return self->_counterpartImageData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordCounterpartImageData)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordCounterpartImageData;
  v5 = [(PKCloudRecordObject *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"counterpartImageData"];
    counterpartImageData = v5->_counterpartImageData;
    v5->_counterpartImageData = (PKPeerPaymentCounterpartImageData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordCounterpartImageData;
  id v4 = a3;
  [(PKCloudRecordObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_counterpartImageData, @"counterpartImageData", v5.receiver, v5.super_class);
}

- (int64_t)compare:(id)a3
{
  counterpartImageData = self->_counterpartImageData;
  id v4 = a3;
  objc_super v5 = [(PKPeerPaymentCounterpartImageData *)counterpartImageData identifier];
  uint64_t v6 = [v4 counterpartImageData];

  v7 = [v6 identifier];
  int64_t v8 = [v5 compare:v7];

  return v8;
}

- (id)descriptionWithItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = -[PKCloudRecordCounterpartImageData _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordCounterpartImageData;
  uint64_t v6 = [(PKCloudRecordObject *)&v8 descriptionWithItem:v3];
  [v5 appendFormat:@"\n%@", v6];

  return v5;
}

- (id)description
{
  BOOL v3 = [(PKCloudRecordCounterpartImageData *)self _descriptionWithIncludeItem:0];
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordCounterpartImageData;
  id v4 = [(PKCloudRecordObject *)&v6 description];
  [v3 appendFormat:@"\n%@", v4];

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [MEMORY[0x1E4F28E78] string];
  objc_super v6 = v5;
  if (self->_counterpartImageData)
  {
    if (v3) {
      [v5 appendFormat:@"counterpartImageData: %@\n", self->_counterpartImageData];
    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", @"No associated counterpartImageData in database\n", v8);
  }
  return v6;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordCounterpartImageData;
    [(PKCloudRecordObject *)&v10 applyCloudRecordObject:v4];
    id v5 = v4;
    objc_super v6 = v5;
    if (!self->_counterpartImageData)
    {
      v7 = [v5 counterpartImageData];

      if (v7)
      {
        uint64_t v8 = [v6 counterpartImageData];
        counterpartImageData = self->_counterpartImageData;
        self->_counterpartImageData = v8;
      }
    }
  }
}

- (PKPeerPaymentCounterpartImageData)counterpartImageData
{
  return self->_counterpartImageData;
}

- (void)setCounterpartImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end