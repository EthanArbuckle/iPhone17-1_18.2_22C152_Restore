@interface SKPresenceOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersonal;
- (IDSURI)clientSpecifiedURI;
- (NSString)serviceIdentifier;
- (SKPresenceOptions)initWithCoder:(id)a3;
- (SKPresenceOptions)initWithServiceIdentifier:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setClientSpecifiedURI:(id)a3;
- (void)setIsPersonal:(BOOL)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation SKPresenceOptions

- (SKPresenceOptions)initWithServiceIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPresenceOptions;
  v6 = [(SKPresenceOptions *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceIdentifier, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  serviceIdentifier = self->_serviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:serviceIdentifier forKey:@"SKPresenceOptionsEncodingKeyServiceIdentifier"];
  [v5 encodeBool:self->_isPersonal forKey:@"SKPresenceOptionsEncodingKeyIsPersonal"];
  [v5 encodeObject:self->_clientSpecifiedURI forKey:@"SKPresenceOptionsEncodingKeyClientSpecifiedURI"];
}

- (SKPresenceOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SKPresenceOptionsEncodingKeyServiceIdentifier"];
  v6 = [(SKPresenceOptions *)self initWithServiceIdentifier:v5];
  -[SKPresenceOptions setIsPersonal:](v6, "setIsPersonal:", [v4 decodeBoolForKey:@"SKPresenceOptionsEncodingKeyIsPersonal"]);
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SKPresenceOptionsEncodingKeyClientSpecifiedURI"];

  [(SKPresenceOptions *)v6 setClientSpecifiedURI:v7];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v7 = [(SKPresenceOptions *)self serviceIdentifier];
    if (v7 || ([v6 serviceIdentifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v8 = [(SKPresenceOptions *)self serviceIdentifier];
      objc_super v9 = [v6 serviceIdentifier];
      int v10 = [v8 isEqualToString:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_10;
        }
      }
      else
      {

        if ((v10 & 1) == 0)
        {
LABEL_10:
          char v11 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
    }
    int v12 = [(SKPresenceOptions *)self isPersonal];
    if (v12 != [v6 isPersonal]) {
      goto LABEL_10;
    }
    v13 = [(SKPresenceOptions *)self clientSpecifiedURI];
    if (v13 || ([v6 clientSpecifiedURI], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v14 = [(SKPresenceOptions *)self clientSpecifiedURI];
      v15 = [v6 clientSpecifiedURI];
      char v11 = [v14 isEqualToURI:v15];

      if (v13)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_17;
  }
  char v11 = 0;
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  v3 = [(SKPresenceOptions *)self serviceIdentifier];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = v4 ^ [(SKPresenceOptions *)self isPersonal];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(SKPresenceOptions *)self serviceIdentifier];
  BOOL v6 = [(SKPresenceOptions *)self isPersonal];
  v7 = [(SKPresenceOptions *)self clientSpecifiedURI];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; serviceIdentifier = %@ isPersonal = %d clientSpecifiedURI = %@>",
    v4,
    self,
    v5,
    v6,
  v8 = v7);

  return v8;
}

- (BOOL)isPersonal
{
  return self->_isPersonal;
}

- (void)setIsPersonal:(BOOL)a3
{
  self->_isPersonal = a3;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (IDSURI)clientSpecifiedURI
{
  return self->_clientSpecifiedURI;
}

- (void)setClientSpecifiedURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSpecifiedURI, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end