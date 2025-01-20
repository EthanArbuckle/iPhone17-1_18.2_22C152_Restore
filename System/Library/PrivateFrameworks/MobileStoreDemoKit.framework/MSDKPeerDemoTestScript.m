@interface MSDKPeerDemoTestScript
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoTestScript)initWithCoder:(id)a3;
- (MSDKPeerDemoTestScript)initWithName:(id)a3 andMethods:(id)a4;
- (NSArray)methods;
- (NSString)name;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setMethods:(id)a3;
- (void)setName:(id)a3;
@end

@implementation MSDKPeerDemoTestScript

- (MSDKPeerDemoTestScript)initWithName:(id)a3 andMethods:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoTestScript;
  v8 = [(MSDKPeerDemoTestScript *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(MSDKPeerDemoTestScript *)v8 setName:v6];
    [(MSDKPeerDemoTestScript *)v9 setMethods:v7];
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MSDKPeerDemoTestScript *)self name];
  id v7 = [(MSDKPeerDemoTestScript *)self methods];
  v8 = [v3 stringWithFormat:@"<%@[%p]: Name=%@ Methods=%@>", v5, self, v6, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoTestScript)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDKPeerDemoTestScript;
  v5 = [(MSDKPeerDemoTestScript *)&v12 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(MSDKPeerDemoTestScript *)v5 setName:v6];

    id v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"testMethods"];
    [(MSDKPeerDemoTestScript *)v5 setMethods:v10];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MSDKPeerDemoTestScript *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  id v6 = [(MSDKPeerDemoTestScript *)self methods];
  [v4 encodeObject:v6 forKey:@"testMethods"];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end