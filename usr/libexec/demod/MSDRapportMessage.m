@interface MSDRapportMessage
- (MSDRapportMessage)initWithIdentifier:(id)a3 andPayload:(id)a4 usingOptions:(id)a5;
- (NSDictionary)options;
- (NSDictionary)payload;
- (NSString)identifier;
- (id)description;
- (unint64_t)extractProtocolVersion;
- (void)setIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPayload:(id)a3;
@end

@implementation MSDRapportMessage

- (MSDRapportMessage)initWithIdentifier:(id)a3 andPayload:(id)a4 usingOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MSDRapportMessage;
  v11 = [(MSDRapportMessage *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(MSDRapportMessage *)v11 setIdentifier:v8];
    [(MSDRapportMessage *)v12 setPayload:v9];
    [(MSDRapportMessage *)v12 setOptions:v10];
  }

  return v12;
}

- (unint64_t)extractProtocolVersion
{
  unint64_t v3 = [(MSDRapportMessage *)self payload];

  if (v3)
  {
    v4 = [(MSDRapportMessage *)self payload];
    v5 = [v4 objectForKey:@"ProtocolVersion"];

    if (v5) {
      unint64_t v3 = (unint64_t)[v5 unsignedIntegerValue];
    }
    else {
      unint64_t v3 = 1;
    }
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MSDRapportMessage *)self identifier];
  v6 = +[NSString stringWithFormat:@"<%@[%p]: Identifier=%@>", v4, self, v5];

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_payload, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end