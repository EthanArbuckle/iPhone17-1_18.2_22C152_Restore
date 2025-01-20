@interface WiFiAwarePublishServiceSpecificInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)blobEquals:(id)a3;
- (BOOL)instanceNameEquals:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)txtRecordEquals:(id)a3;
- (NSData)blob;
- (NSData)txtRecordData;
- (NSString)instanceName;
- (WiFiAwarePublishServiceSpecificInfo)init;
- (WiFiAwarePublishServiceSpecificInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBlob:(id)a3;
- (void)setInstanceName:(id)a3;
- (void)setTxtRecordData:(id)a3;
@end

@implementation WiFiAwarePublishServiceSpecificInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self blob];
  [v4 encodeObject:v5 forKey:@"WiFiAwarePublishServiceSpecificInfo.blob"];

  v6 = [(WiFiAwarePublishServiceSpecificInfo *)self txtRecordData];
  [v4 encodeObject:v6 forKey:@"WiFiAwarePublishServiceSpecificInfo.txt"];

  id v7 = [(WiFiAwarePublishServiceSpecificInfo *)self instanceName];
  [v4 encodeObject:v7 forKey:@"WiFiAwarePublishServiceSpecificInfo.instanceName"];
}

- (WiFiAwarePublishServiceSpecificInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishServiceSpecificInfo.blob"];
  [(WiFiAwarePublishServiceSpecificInfo *)v5 setBlob:v6];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishServiceSpecificInfo.txt"];
  [(WiFiAwarePublishServiceSpecificInfo *)v5 setTxtRecordData:v7];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"WiFiAwarePublishServiceSpecificInfo.instanceName"];

  [(WiFiAwarePublishServiceSpecificInfo *)v5 setInstanceName:v8];
  return v5;
}

- (WiFiAwarePublishServiceSpecificInfo)init
{
  v4.receiver = self;
  v4.super_class = (Class)WiFiAwarePublishServiceSpecificInfo;
  v2 = [(WiFiAwarePublishServiceSpecificInfo *)&v4 init];
  [(WiFiAwarePublishServiceSpecificInfo *)v2 setBlob:0];
  [(WiFiAwarePublishServiceSpecificInfo *)v2 setTxtRecordData:0];
  [(WiFiAwarePublishServiceSpecificInfo *)v2 setInstanceName:0];
  return v2;
}

- (BOOL)blobEquals:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self blob];
  v6 = [v4 blob];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(WiFiAwarePublishServiceSpecificInfo *)self blob];
    v8 = [v4 blob];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)txtRecordEquals:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self txtRecordData];
  v6 = [v4 txtRecordData];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(WiFiAwarePublishServiceSpecificInfo *)self txtRecordData];
    v8 = [v4 txtRecordData];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)instanceNameEquals:(id)a3
{
  id v4 = a3;
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self instanceName];
  v6 = [v4 instanceName];
  if (v5 == v6)
  {
    char v9 = 1;
  }
  else
  {
    id v7 = [(WiFiAwarePublishServiceSpecificInfo *)self instanceName];
    v8 = [v4 instanceName];
    char v9 = [v7 isEqual:v8];
  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiAwarePublishServiceSpecificInfo *)a3;
  if (self == v4)
  {
    v5 = 0;
LABEL_8:
    BOOL v6 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v6 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  if ([(WiFiAwarePublishServiceSpecificInfo *)self blobEquals:v5]
    && [(WiFiAwarePublishServiceSpecificInfo *)self txtRecordEquals:v5]
    && [(WiFiAwarePublishServiceSpecificInfo *)self instanceNameEquals:v5])
  {
    goto LABEL_8;
  }
  BOOL v6 = 0;
LABEL_10:

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(WiFiAwarePublishServiceSpecificInfo *)self blob];
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self txtRecordData];
  BOOL v6 = [(WiFiAwarePublishServiceSpecificInfo *)self instanceName];
  id v7 = [v3 stringWithFormat:@"<WiFiAwarePublishServiceSpecificInfo: blob=%@, txtRecordData=%@, instanceName=%@>", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(WiFiAwarePublishServiceSpecificInfo);
  v5 = [(WiFiAwarePublishServiceSpecificInfo *)self blob];
  [(WiFiAwarePublishServiceSpecificInfo *)v4 setBlob:v5];

  BOOL v6 = [(WiFiAwarePublishServiceSpecificInfo *)self txtRecordData];
  [(WiFiAwarePublishServiceSpecificInfo *)v4 setTxtRecordData:v6];

  id v7 = [(WiFiAwarePublishServiceSpecificInfo *)self instanceName];
  [(WiFiAwarePublishServiceSpecificInfo *)v4 setInstanceName:v7];

  return v4;
}

- (NSData)blob
{
  return self->_blob;
}

- (void)setBlob:(id)a3
{
}

- (NSData)txtRecordData
{
  return self->_txtRecordData;
}

- (void)setTxtRecordData:(id)a3
{
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceName, 0);
  objc_storeStrong((id *)&self->_txtRecordData, 0);

  objc_storeStrong((id *)&self->_blob, 0);
}

@end