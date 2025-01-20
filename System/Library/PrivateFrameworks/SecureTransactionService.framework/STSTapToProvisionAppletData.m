@interface STSTapToProvisionAppletData
+ (id)fromOR:(id)a3;
- (NSArray)supportedPNOs;
- (NSString)version;
- (STSTapToProvisionAppletData)initWithVersion:(id)a3;
- (id)description;
@end

@implementation STSTapToProvisionAppletData

- (STSTapToProvisionAppletData)initWithVersion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STSTapToProvisionAppletData;
  v6 = [(STSTapToProvisionAppletData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_version, a3);
    supportedPNOs = v7->_supportedPNOs;
    v7->_supportedPNOs = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v7;
}

+ (id)fromOR:(id)a3
{
  id v3 = a3;
  v4 = [STSTapToProvisionAppletData alloc];
  id v5 = [v3 provisionAppletVersion];

  v6 = [(STSTapToProvisionAppletData *)v4 initWithVersion:v5];
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Applet Data : (version = %@"), self->_version;
}

- (NSString)version
{
  return self->_version;
}

- (NSArray)supportedPNOs
{
  return self->_supportedPNOs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPNOs, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end