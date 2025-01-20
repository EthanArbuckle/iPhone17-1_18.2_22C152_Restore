@interface MSDKPeerDemoApp
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoApp)initWithCoder:(id)a3;
- (MSDKPeerDemoApp)initWithIdentifier:(id)a3 andLocalizedName:(id)a4;
- (NSString)identifier;
- (NSString)localizedName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocalizedName:(id)a3;
@end

@implementation MSDKPeerDemoApp

- (MSDKPeerDemoApp)initWithIdentifier:(id)a3 andLocalizedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoApp;
  v8 = [(MSDKPeerDemoApp *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDKPeerDemoApp *)v8 setIdentifier:v6];
    [(MSDKPeerDemoApp *)v9 setLocalizedName:v7];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MSDKPeerDemoApp *)self identifier];
  id v7 = [(MSDKPeerDemoApp *)self localizedName];
  v8 = [v3 stringWithFormat:@"<%@[%p]: ID=%@ Name=%@>", v5, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSDKPeerDemoApp;
  v5 = [(MSDKPeerDemoApp *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(MSDKPeerDemoApp *)v5 setIdentifier:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    [(MSDKPeerDemoApp *)v5 setLocalizedName:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSDKPeerDemoApp *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(MSDKPeerDemoApp *)self localizedName];
  [v4 encodeObject:v6 forKey:@"localizedName"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end