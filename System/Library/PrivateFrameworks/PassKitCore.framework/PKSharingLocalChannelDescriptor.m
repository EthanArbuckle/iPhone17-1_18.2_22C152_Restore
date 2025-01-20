@interface PKSharingLocalChannelDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)createDestinationWithIdentifier:(id)a3;
+ (id)createSourceWithIdentifier:(id)a3;
- (NSString)transportIdentifier;
- (PKSharingLocalChannelDescriptor)initWithCoder:(id)a3;
- (id)_initWithBaseTransportIdentifier:(id)a3 subtype:(unint64_t)a4;
- (id)contraChannelTransportIdentifier;
- (unint64_t)subtype;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKSharingLocalChannelDescriptor

+ (id)createSourceWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingLocalChannelDescriptor alloc] _initWithBaseTransportIdentifier:v3 subtype:0];

  return v4;
}

+ (id)createDestinationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[PKSharingLocalChannelDescriptor alloc] _initWithBaseTransportIdentifier:v3 subtype:1];

  return v4;
}

- (id)_initWithBaseTransportIdentifier:(id)a3 subtype:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKSharingLocalChannelDescriptor;
  v8 = [(PKSharingChannelDescriptor *)&v11 _initWithType:5];
  v9 = v8;
  if (v8)
  {
    v8[3] = (id)a4;
    objc_storeStrong(v8 + 2, a3);
  }

  return v9;
}

- (NSString)transportIdentifier
{
  return (NSString *)PKCreateSharingLocalChannelDescriptorTransportIdentifier(self->_baseTransportIdentifier, self->_subtype);
}

- (id)contraChannelTransportIdentifier
{
  unint64_t subtype = self->_subtype;
  if (subtype)
  {
    if (subtype != 1) {
      goto LABEL_6;
    }
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 1;
  }
  PKCreateSharingLocalChannelDescriptorTransportIdentifier(self->_baseTransportIdentifier, v3);
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return (id)(id)a2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKSharingLocalChannelDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKSharingLocalChannelDescriptor;
  v5 = [(PKSharingChannelDescriptor *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseTransportIdentifier"];
    baseTransportIdentifier = v5->_baseTransportIdentifier;
    v5->_baseTransportIdentifier = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtype"];
    v9 = v8;
    BOOL v10 = v8 == @"Source" || v8 == 0;
    BOOL v15 = 0;
    if (!v10)
    {
      char v11 = [(__CFString *)v8 isEqualToString:@"Source"];

      if ((v11 & 1) == 0)
      {
        v12 = v9;
        if (v12 == @"Destination"
          || (v13 = v12,
              int v14 = [(__CFString *)v12 isEqualToString:@"Destination"],
              v13,
              v14))
        {
          BOOL v15 = 1;
        }
      }
    }

    v5->_unint64_t subtype = v15;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKSharingLocalChannelDescriptor;
  id v4 = a3;
  [(PKSharingChannelDescriptor *)&v8 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_baseTransportIdentifier, @"baseTransportIdentifier", v8.receiver, v8.super_class);
  unint64_t subtype = self->_subtype;
  uint64_t v6 = &stru_1EE0F5368;
  if (subtype == 1) {
    uint64_t v6 = @"Destination";
  }
  if (subtype) {
    id v7 = v6;
  }
  else {
    id v7 = @"Source";
  }
  [v4 encodeObject:v7 forKey:@"subtype"];
}

- (unint64_t)subtype
{
  return self->_subtype;
}

- (void).cxx_destruct
{
}

@end