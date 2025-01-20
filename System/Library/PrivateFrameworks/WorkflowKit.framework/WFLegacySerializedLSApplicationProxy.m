@interface WFLegacySerializedLSApplicationProxy
+ (BOOL)supportsSecureCoding;
- (NSString)bundleIdentifier;
- (WFLegacySerializedLSApplicationProxy)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFLegacySerializedLSApplicationProxy

- (void).cxx_destruct
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (WFLegacySerializedLSApplicationProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFLegacySerializedLSApplicationProxy;
  v5 = [(WFLegacySerializedLSApplicationProxy *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2, self, @"WFLegacySerializedLSApplicationProxy.m", 20, @"Encoding is not supported, this object should only be used for legacy deserialization of LSApplicationProxy!" object file lineNumber description];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end