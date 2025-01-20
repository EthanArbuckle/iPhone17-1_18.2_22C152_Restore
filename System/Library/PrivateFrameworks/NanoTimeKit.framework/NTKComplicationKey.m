@interface NTKComplicationKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLKComplicationDescriptor)descriptor;
- (NSString)clientIdentifier;
- (NSString)complicationIdentifier;
- (NTKComplicationKey)initWithClientIdentifier:(id)a3 complicationIdentifier:(id)a4;
- (NTKComplicationKey)initWithClientIdentifier:(id)a3 descriptor:(id)a4;
- (NTKComplicationKey)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setComplicationIdentifier:(id)a3;
- (void)setDescriptor:(id)a3;
@end

@implementation NTKComplicationKey

- (NTKComplicationKey)initWithClientIdentifier:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKComplicationKey;
  v8 = [(NTKComplicationKey *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    v11 = [v7 identifier];
    uint64_t v12 = [v11 copy];
    complicationIdentifier = v8->_complicationIdentifier;
    v8->_complicationIdentifier = (NSString *)v12;

    uint64_t v14 = [v7 copy];
    descriptor = v8->_descriptor;
    v8->_descriptor = (CLKComplicationDescriptor *)v14;

    v16 = v8;
  }

  return v8;
}

- (NTKComplicationKey)initWithClientIdentifier:(id)a3 complicationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKComplicationKey;
  v8 = [(NTKComplicationKey *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    complicationIdentifier = v8->_complicationIdentifier;
    v8->_complicationIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"NTKComplicationKey<%@, %@>", self->_clientIdentifier, self->_complicationIdentifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 clientIdentifier];
    id v6 = [(NTKComplicationKey *)self clientIdentifier];
    if ([v5 isEqualToString:v6])
    {
      id v7 = [v4 complicationIdentifier];
      v8 = [(NTKComplicationKey *)self complicationIdentifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(NTKComplicationKey *)self clientIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(NTKComplicationKey *)self complicationIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_complicationIdentifier copyWithZone:a3];
  char v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(CLKComplicationDescriptor *)self->_descriptor copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationKey;
  v5 = [(NTKComplicationKey *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"complicationIdentifier"];
    complicationIdentifier = v5->_complicationIdentifier;
    v5->_complicationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptor"];
    descriptor = v5->_descriptor;
    v5->_descriptor = (CLKComplicationDescriptor *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  clientIdentifier = self->_clientIdentifier;
  id v5 = a3;
  [v5 encodeObject:clientIdentifier forKey:@"clientIdentifier"];
  [v5 encodeObject:self->_complicationIdentifier forKey:@"complicationIdentifier"];
  [v5 encodeObject:self->_descriptor forKey:@"descriptor"];
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)complicationIdentifier
{
  return self->_complicationIdentifier;
}

- (void)setComplicationIdentifier:(id)a3
{
}

- (CLKComplicationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_complicationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end