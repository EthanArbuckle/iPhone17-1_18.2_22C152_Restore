@interface MSDKPeerDemoEnvironment
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoEnvironment)initWithCoder:(id)a3;
- (MSDKPeerDemoEnvironment)initWithIdentifier:(id)a3 andDisplayName:(id)a4;
- (MSDKPeerDemoEnvironment)initWithIdentifier:(id)a3 displayName:(id)a4 immersionLevel:(float)a5;
- (NSString)displayName;
- (NSString)identifier;
- (float)immersionLevel;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImmersionLevel:(float)a3;
@end

@implementation MSDKPeerDemoEnvironment

- (MSDKPeerDemoEnvironment)initWithIdentifier:(id)a3 displayName:(id)a4 immersionLevel:(float)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MSDKPeerDemoEnvironment;
  v10 = [(MSDKPeerDemoEnvironment *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(MSDKPeerDemoEnvironment *)v10 setIdentifier:v8];
    [(MSDKPeerDemoEnvironment *)v11 setDisplayName:v9];
    *(float *)&double v12 = a5;
    [(MSDKPeerDemoEnvironment *)v11 setImmersionLevel:v12];
  }

  return v11;
}

- (MSDKPeerDemoEnvironment)initWithIdentifier:(id)a3 andDisplayName:(id)a4
{
  LODWORD(v4) = -1.0;
  return [(MSDKPeerDemoEnvironment *)self initWithIdentifier:a3 displayName:a4 immersionLevel:v4];
}

- (id)description
{
  v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MSDKPeerDemoEnvironment *)self identifier];
  v7 = [(MSDKPeerDemoEnvironment *)self displayName];
  [(MSDKPeerDemoEnvironment *)self immersionLevel];
  id v9 = [v3 stringWithFormat:@"<%@[%p]: ID=%@ Name=%@ Immersion=%f>", v5, self, v6, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoEnvironment)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSDKPeerDemoEnvironment;
  v5 = [(MSDKPeerDemoEnvironment *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(MSDKPeerDemoEnvironment *)v5 setIdentifier:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    [(MSDKPeerDemoEnvironment *)v5 setDisplayName:v7];

    float v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"immersionLevel"];
    [v8 floatValue];
    -[MSDKPeerDemoEnvironment setImmersionLevel:](v5, "setImmersionLevel:");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSDKPeerDemoEnvironment *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(MSDKPeerDemoEnvironment *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  v7 = NSNumber;
  [(MSDKPeerDemoEnvironment *)self immersionLevel];
  objc_msgSend(v7, "numberWithFloat:");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"immersionLevel"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (float)immersionLevel
{
  return self->_immersionLevel;
}

- (void)setImmersionLevel:(float)a3
{
  self->_immersionLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end