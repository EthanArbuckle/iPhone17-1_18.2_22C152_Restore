@interface MRUPersonalizedFirmware
- (MRUPersonalizedFirmware)initWithPayload:(id)a3 manifest:(id)a4;
- (NSData)manifest;
- (NSData)payload;
- (id)description;
@end

@implementation MRUPersonalizedFirmware

- (MRUPersonalizedFirmware)initWithPayload:(id)a3 manifest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRUPersonalizedFirmware;
  v9 = [(MRUPersonalizedFirmware *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_payload, a3);
    objc_storeStrong((id *)&v10->_manifest, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"%@(\n"), v4;

  id v6 = [(NSData *)self->_payload description];
  objc_msgSend(v5, "appendFormat:", @"\tpayload: %s\n", objc_msgSend(v6, "UTF8String"));

  id v7 = [(NSData *)self->_manifest description];
  objc_msgSend(v5, "appendFormat:", @"\tmanifest: %s\n", objc_msgSend(v7, "UTF8String"));

  [v5 appendString:@""]);
  id v8 = +[NSString stringWithString:v5];

  return v8;
}

- (NSData)payload
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)manifest
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifest, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end