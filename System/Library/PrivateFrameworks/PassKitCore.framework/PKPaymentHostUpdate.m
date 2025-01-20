@interface PKPaymentHostUpdate
+ (BOOL)supportsSecureCoding;
+ (id)paymentUpdateWithProtobuf:(id)a3;
- (PKContact)shippingContact;
- (PKPaymentHostUpdate)initWithCoder:(id)a3;
- (PKPaymentHostUpdate)initWithContact:(id)a3 shippingMethod:(id)a4 paymentMethod:(id)a5;
- (PKPaymentMethod)paymentMethod;
- (PKShippingMethod)shippingMethod;
- (id)protobuf;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentHostUpdate

- (PKPaymentHostUpdate)initWithContact:(id)a3 shippingMethod:(id)a4 paymentMethod:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentHostUpdate;
  v12 = [(PKPaymentHostUpdate *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_shippingContact, a3);
    objc_storeStrong((id *)&v13->_shippingMethod, a4);
    objc_storeStrong((id *)&v13->_paymentMethod, a5);
  }

  return v13;
}

- (PKPaymentHostUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaymentHostUpdate;
  v5 = [(PKPaymentHostUpdate *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingContact"];
    shippingContact = v5->_shippingContact;
    v5->_shippingContact = (PKContact *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shippingMethod"];
    shippingMethod = v5->_shippingMethod;
    v5->_shippingMethod = (PKShippingMethod *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"paymentMethod"];
    paymentMethod = v5->_paymentMethod;
    v5->_paymentMethod = (PKPaymentMethod *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  shippingContact = self->_shippingContact;
  id v5 = a3;
  [v5 encodeObject:shippingContact forKey:@"shippingContact"];
  [v5 encodeObject:self->_shippingMethod forKey:@"shippingMethod"];
  [v5 encodeObject:self->_paymentMethod forKey:@"paymentMethod"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKContact)shippingContact
{
  return self->_shippingContact;
}

- (PKShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (PKPaymentMethod)paymentMethod
{
  return self->_paymentMethod;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethod, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_shippingContact, 0);
}

+ (id)paymentUpdateWithProtobuf:(id)a3
{
  id v3 = a3;
  id v4 = [v3 shippingContact];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = objc_opt_class();
    v7 = [v3 shippingContact];
    id v4 = [v5 unarchivedObjectOfClass:v6 fromData:v7 error:0];
  }
  uint64_t v8 = [v3 shippingMethod];

  if (v8)
  {
    id v9 = [v3 shippingMethod];
    uint64_t v8 = +[PKShippingMethod shippingMethodWithProtobuf:v9];
  }
  uint64_t v10 = [v3 paymentMethod];

  if (v10)
  {
    id v11 = [v3 paymentMethod];
    uint64_t v10 = +[PKPaymentMethod paymentMethodWithProtobuf:v11];
  }
  v12 = [[PKPaymentHostUpdate alloc] initWithContact:v4 shippingMethod:v8 paymentMethod:v10];

  return v12;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentHostUpdate);
  id v4 = [(PKPaymentHostUpdate *)self shippingContact];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F28DB0];
    uint64_t v6 = [(PKPaymentHostUpdate *)self shippingContact];
    v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    [(PKProtobufPaymentHostUpdate *)v3 setShippingContact:v7];
  }
  uint64_t v8 = [(PKPaymentHostUpdate *)self shippingMethod];
  id v9 = [v8 shippingMethodProtobuf];
  [(PKProtobufPaymentHostUpdate *)v3 setShippingMethod:v9];

  uint64_t v10 = [(PKPaymentHostUpdate *)self paymentMethod];
  id v11 = [v10 protobuf];
  [(PKProtobufPaymentHostUpdate *)v3 setPaymentMethod:v11];

  return v3;
}

@end