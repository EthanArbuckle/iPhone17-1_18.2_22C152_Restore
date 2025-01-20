@interface UIPrinterDestination
+ (BOOL)supportsSecureCoding;
- (NSData)txtRecord;
- (NSString)displayName;
- (NSURL)URL;
- (UIPrinterDestination)initWithCoder:(id)a3;
- (UIPrinterDestination)initWithURL:(NSURL *)url;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(NSString *)displayName;
- (void)setTxtRecord:(NSData *)txtRecord;
- (void)setURL:(NSURL *)URL;
@end

@implementation UIPrinterDestination

- (UIPrinterDestination)initWithURL:(NSURL *)url
{
  v4 = url;
  v11.receiver = self;
  v11.super_class = (Class)UIPrinterDestination;
  v5 = [(UIPrinterDestination *)&v11 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [(NSURL *)v4 absoluteString];
    uint64_t v8 = [v6 URLWithString:v7];
    v9 = v5->_URL;
    v5->_URL = (NSURL *)v8;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = objc_opt_new();
  v4 = [(NSURL *)self->_URL absoluteString];
  [v3 setObject:v4 forKeyedSubscript:@"uri"];

  txtRecord = self->_txtRecord;
  if (txtRecord) {
    [v3 setObject:txtRecord forKeyedSubscript:@"txt"];
  }
  displayName = self->_displayName;
  if (displayName) {
    [v3 setObject:displayName forKeyedSubscript:@"display-name"];
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPrinterDestination *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"asDict"];
}

- (UIPrinterDestination)initWithCoder:(id)a3
{
  id v4 = [a3 decodeObjectForKey:@"asDict"];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKeyedSubscript:@"uri"];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
      uint64_t v8 = [(UIPrinterDestination *)self initWithURL:v7];

      if (v8)
      {
        v9 = [v5 objectForKeyedSubscript:@"display-name"];
        [(UIPrinterDestination *)v8 setDisplayName:v9];

        v10 = [v5 objectForKeyedSubscript:@"txt"];
        [(UIPrinterDestination *)v8 setTxtRecord:v10];
      }
      self = v8;
      objc_super v11 = self;
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setURL:(NSURL *)URL
{
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayName:(NSString *)displayName
{
}

- (NSData)txtRecord
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTxtRecord:(NSData *)txtRecord
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end