@interface ORProvisionAppletData
+ (BOOL)supportsSecureCoding;
- (NSArray)supportedPNOs;
- (NSString)provisionAppletVersion;
- (NSString)version;
- (ORProvisionAppletData)initWithCoder:(id)a3;
- (ORProvisionAppletData)initWithProvisionAppletVersion:(id)a3;
- (ORProvisionAppletData)initWithVersion:(id)a3 supportedPNOs:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation ORProvisionAppletData

- (ORProvisionAppletData)initWithProvisionAppletVersion:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ORProvisionAppletData;
  v10 = [(ORProvisionAppletData *)&v14 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v4, v5, v6, v7, v8, v9);
    provisionAppletVersion = v10->_provisionAppletVersion;
    v10->_provisionAppletVersion = (NSString *)v11;
  }
  return v10;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"{provisionAppletVersion=%@}", v2, v3, v4, self->_provisionAppletVersion);
}

- (ORProvisionAppletData)initWithVersion:(id)a3 supportedPNOs:(id)a4
{
  return (ORProvisionAppletData *)((uint64_t (*)(ORProvisionAppletData *, char *, id, id))MEMORY[0x270F9A6D0])(self, sel_initWithProvisionAppletVersion_, a3, a4);
}

- (NSString)version
{
  return self->_provisionAppletVersion;
}

- (NSArray)supportedPNOs
{
  return (NSArray *)MEMORY[0x263EFFA68];
}

- (void)setVersion:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ORProvisionAppletData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ORProvisionAppletData;
  v5 = [(ORProvisionAppletData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"provisionAppletVersion", v8, v9);
    provisionAppletVersion = v5->_provisionAppletVersion;
    v5->_provisionAppletVersion = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_provisionAppletVersion, @"provisionAppletVersion", v3, v4);
}

- (NSString)provisionAppletVersion
{
  return self->_provisionAppletVersion;
}

- (void).cxx_destruct
{
}

@end