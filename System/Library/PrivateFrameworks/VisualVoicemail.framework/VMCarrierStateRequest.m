@interface VMCarrierStateRequest
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStateRequest:(id)a3;
- (NSString)destination;
- (NSString)message;
- (NSString)serviceCenter;
- (VMCarrierStateRequest)initWithCoder:(id)a3;
- (VMCarrierStateRequest)initWithSubscription:(id)a3;
- (VMCarrierStateRequest)initWithSubscription:(id)a3 destination:(id)a4 serviceCenter:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)identifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VMCarrierStateRequest

- (VMCarrierStateRequest)initWithSubscription:(id)a3
{
  return 0;
}

- (VMCarrierStateRequest)initWithSubscription:(id)a3 destination:(id)a4 serviceCenter:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)VMCarrierStateRequest;
  v10 = [(VMTelephonyRequest *)&v18 initWithSubscription:a3];
  if (v10)
  {
    v11 = (NSString *)[v8 copy];
    destination = v10->_destination;
    v10->_destination = v11;

    v10->_identifier = 12345;
    v13 = (NSString *)[@"STATE" copy];
    message = v10->_message;
    v10->_message = v13;

    v15 = (NSString *)[v9 copy];
    serviceCenter = v10->_serviceCenter;
    v10->_serviceCenter = v15;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(VMTelephonyRequest *)self subscription];
  v7 = [(VMCarrierStateRequest *)self destination];
  id v8 = [(VMCarrierStateRequest *)self serviceCenter];
  id v9 = [v5 initWithSubscription:v6 destination:v7 serviceCenter:v8];

  v9[3] = self->_identifier;
  id v10 = [(NSString *)self->_message copyWithZone:a3];
  v11 = (void *)v9[4];
  v9[4] = v10;

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)VMCarrierStateRequest;
  id v4 = a3;
  [(VMTelephonyRequest *)&v13 encodeWithCoder:v4];
  destination = self->_destination;
  v6 = NSStringFromSelector("destination");
  objc_msgSend(v4, "encodeObject:forKey:", destination, v6, v13.receiver, v13.super_class);

  int64_t identifier = self->_identifier;
  id v8 = NSStringFromSelector("identifier");
  [v4 encodeInteger:identifier forKey:v8];

  message = self->_message;
  id v10 = NSStringFromSelector("message");
  [v4 encodeObject:message forKey:v10];

  serviceCenter = self->_serviceCenter;
  v12 = NSStringFromSelector("serviceCenter");
  [v4 encodeObject:serviceCenter forKey:v12];
}

- (VMCarrierStateRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VMCarrierStateRequest;
  id v5 = [(VMTelephonyRequest *)&v20 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("destination");
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    destination = v5->_destination;
    v5->_destination = (NSString *)v8;

    id v10 = NSStringFromSelector("identifier");
    v5->_int64_t identifier = (int64_t)[v4 decodeIntegerForKey:v10];

    uint64_t v11 = objc_opt_class();
    v12 = NSStringFromSelector("message");
    uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];
    message = v5->_message;
    v5->_message = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    v16 = NSStringFromSelector("serviceCenter");
    uint64_t v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    serviceCenter = v5->_serviceCenter;
    v5->_serviceCenter = (NSString *)v17;
  }
  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector("subscription");
  id v5 = [(VMTelephonyRequest *)self subscription];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector("destination");
  v7 = [(VMCarrierStateRequest *)self destination];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  uint64_t v8 = NSStringFromSelector("serviceCenter");
  id v9 = [(VMCarrierStateRequest *)self serviceCenter];
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  id v10 = NSStringFromSelector("identifier");
  [v3 appendFormat:@"%@=%ld", v10, -[VMCarrierStateRequest identifier](self, "identifier")];

  [v3 appendFormat:@", "];
  uint64_t v11 = NSStringFromSelector("message");
  v12 = [(VMCarrierStateRequest *)self message];
  [v3 appendFormat:@"%@=%@", v11, v12];

  [v3 appendFormat:@">"];
  id v13 = [v3 copy];

  return v13;
}

- (unint64_t)hash
{
  v12.receiver = self;
  v12.super_class = (Class)VMCarrierStateRequest;
  unint64_t v3 = [(VMTelephonyRequest *)&v12 hash];
  id v4 = [(VMCarrierStateRequest *)self destination];
  unint64_t v5 = (unint64_t)[v4 hash];
  unint64_t v6 = v5 ^ [(VMCarrierStateRequest *)self identifier];
  v7 = [(VMCarrierStateRequest *)self message];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];
  id v9 = [(VMCarrierStateRequest *)self serviceCenter];
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash] ^ v3;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VMCarrierStateRequest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(VMCarrierStateRequest *)self isEqualToStateRequest:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToStateRequest:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VMCarrierStateRequest;
  if ([(VMTelephonyRequest *)&v22 isEqualToRequest:v4])
  {
    BOOL v5 = [(VMCarrierStateRequest *)self destination];
    unint64_t v6 = [v4 destination];
    unint64_t v7 = v5;
    unint64_t v8 = v6;
    id v9 = (void *)v8;
    if (v7 | v8)
    {
      if (!v8)
      {
        unsigned __int8 v20 = 0;
        uint64_t v14 = v7;
LABEL_18:

        goto LABEL_19;
      }
      unsigned int v10 = [(id)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_13;
      }
    }
    id v11 = [(VMCarrierStateRequest *)self identifier];
    if (v11 != [v4 identifier])
    {
LABEL_13:
      unsigned __int8 v20 = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_super v12 = [(VMCarrierStateRequest *)self message];
    id v13 = [v4 message];
    uint64_t v14 = v12;
    unint64_t v15 = v13;
    v16 = (void *)v15;
    if (v14 | v15)
    {
      if (!v15)
      {
        unsigned __int8 v20 = 0;
        uint64_t v18 = v14;
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      unsigned int v17 = [(id)v14 isEqualToString:v15];

      if (!v17)
      {
        unsigned __int8 v20 = 0;
        goto LABEL_17;
      }
    }
    uint64_t v18 = [(VMCarrierStateRequest *)self serviceCenter];
    uint64_t v19 = [v4 serviceCenter];
    unsigned __int8 v20 = (v18 | v19) == 0;
    if (v19) {
      unsigned __int8 v20 = [(id)v18 isEqualToString:v19];
    }

    goto LABEL_16;
  }
  unsigned __int8 v20 = 0;
LABEL_20:

  return v20;
}

+ (id)unarchivedObjectClasses
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VMCarrierStateRequest;
  v2 = objc_msgSendSuper2(&v5, "unarchivedObjectClasses");
  unint64_t v3 = [v2 setByAddingObject:objc_opt_class()];

  return v3;
}

- (NSString)destination
{
  return self->_destination;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSString)message
{
  return self->_message;
}

- (NSString)serviceCenter
{
  return self->_serviceCenter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceCenter, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end