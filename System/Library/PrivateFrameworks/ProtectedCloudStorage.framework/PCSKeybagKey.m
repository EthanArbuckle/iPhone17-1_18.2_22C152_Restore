@interface PCSKeybagKey
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (PCSKeybagKey)initWithCoder:(id)a3;
- (int64_t)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setFlags:(int64_t)a3;
@end

@implementation PCSKeybagKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(PCSKeybagKey *)self data];
  [v5 encodeObject:v4 forKey:@"data"];

  objc_msgSend(v5, "encodeInt64:forKey:", -[PCSKeybagKey flags](self, "flags"), @"flags");
}

- (PCSKeybagKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PCSKeybagKey;
  id v5 = [(PCSKeybagKey *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(PCSKeybagKey *)v5 setData:v6];

    -[PCSKeybagKey setFlags:](v5, "setFlags:", [v4 decodeInt64ForKey:@"flags"]);
  }

  return v5;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (int64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(int64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
}

@end