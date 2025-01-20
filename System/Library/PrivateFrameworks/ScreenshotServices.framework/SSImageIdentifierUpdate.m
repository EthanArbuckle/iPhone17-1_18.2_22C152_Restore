@interface SSImageIdentifierUpdate
+ (BOOL)supportsBSXPCSecureCoding;
- (BOOL)success;
- (BSSettings)bsSettings;
- (NSString)environmentDescriptionIdentifier;
- (NSString)imageIdentifier;
- (NSString)loggableDescription;
- (SSImageIdentifierUpdate)initWithBSXPCCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setEnvironmentDescriptionIdentifier:(id)a3;
- (void)setImageIdentifier:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation SSImageIdentifierUpdate

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SSImageIdentifierUpdate)initWithBSXPCCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SSImageIdentifierUpdate;
  id v3 = a3;
  v4 = [(SSImageIdentifierUpdate *)&v11 init];
  uint64_t v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"SSImageIdentifierUpdateKeyImageIdentifier", v11.receiver, v11.super_class);
  imageIdentifier = v4->_imageIdentifier;
  v4->_imageIdentifier = (NSString *)v5;

  uint64_t v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SSImageIdentifierUpdateKeyEnvironmentDescriptionIdentifier"];
  environmentDescriptionIdentifier = v4->_environmentDescriptionIdentifier;
  v4->_environmentDescriptionIdentifier = (NSString *)v7;

  char v9 = [v3 decodeBoolForKey:@"SSImageIdentifierUpdateKeySuccess"];
  v4->_success = v9;
  return v4;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v6 = a3;
  v4 = [(SSImageIdentifierUpdate *)self imageIdentifier];
  [v6 encodeObject:v4 forKey:@"SSImageIdentifierUpdateKeyImageIdentifier"];

  uint64_t v5 = [(SSImageIdentifierUpdate *)self environmentDescriptionIdentifier];
  [v6 encodeObject:v5 forKey:@"SSImageIdentifierUpdateKeyEnvironmentDescriptionIdentifier"];

  objc_msgSend(v6, "encodeBool:forKey:", -[SSImageIdentifierUpdate success](self, "success"), @"SSImageIdentifierUpdateKeySuccess");
}

- (BSSettings)bsSettings
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C78]);
  [v3 setObject:self forSetting:2];
  return (BSSettings *)v3;
}

- (NSString)loggableDescription
{
  id v3 = [MEMORY[0x263F089D8] string];
  v4 = NSString;
  uint64_t v5 = [(SSImageIdentifierUpdate *)self imageIdentifier];
  id v6 = [v5 shorterLoggableString];
  uint64_t v7 = [v4 stringWithFormat:@"imageIdentifier: %@ ", v6];
  [v3 appendString:v7];

  v8 = NSString;
  char v9 = [(SSImageIdentifierUpdate *)self environmentDescriptionIdentifier];
  v10 = [v9 shorterLoggableString];
  objc_super v11 = [v8 stringWithFormat:@"environmentDescriptionIdentifier: %@", v10];
  [v3 appendString:v11];

  v12 = NSString;
  BOOL v13 = [(SSImageIdentifierUpdate *)self success];
  v14 = @"NO";
  if (v13) {
    v14 = @"YES";
  }
  v15 = [v12 stringWithFormat:@"success: %@", v14];
  [v3 appendString:v15];

  return (NSString *)v3;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (void)setImageIdentifier:(id)a3
{
}

- (NSString)environmentDescriptionIdentifier
{
  return self->_environmentDescriptionIdentifier;
}

- (void)setEnvironmentDescriptionIdentifier:(id)a3
{
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end