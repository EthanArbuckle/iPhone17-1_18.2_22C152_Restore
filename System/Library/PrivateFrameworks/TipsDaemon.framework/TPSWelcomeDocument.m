@interface TPSWelcomeDocument
+ (BOOL)supportsSecureCoding;
- (NSString)majorVersion;
- (TPSWelcomeDocument)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setMajorVersion:(id)a3;
@end

@implementation TPSWelcomeDocument

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TPSWelcomeDocument;
  id v4 = [(TPSDocument *)&v7 copyWithZone:a3];
  v5 = [(TPSWelcomeDocument *)self majorVersion];
  [v4 setMajorVersion:v5];

  return v4;
}

- (TPSWelcomeDocument)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSWelcomeDocument;
  v5 = [(TPSDocument *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"majorVersion"];
    majorVersion = v5->_majorVersion;
    v5->_majorVersion = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TPSWelcomeDocument;
  id v4 = a3;
  [(TPSDocument *)&v6 encodeWithCoder:v4];
  v5 = [(TPSWelcomeDocument *)self majorVersion];
  [v4 encodeObject:v5 forKey:@"majorVersion"];
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v8.receiver = self;
  v8.super_class = (Class)TPSWelcomeDocument;
  id v4 = [(TPSDocument *)&v8 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  objc_super v6 = [(TPSWelcomeDocument *)self majorVersion];
  [v5 appendFormat:@"%@ = %@", @"majorVersion", v6];

  return v5;
}

- (NSString)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end