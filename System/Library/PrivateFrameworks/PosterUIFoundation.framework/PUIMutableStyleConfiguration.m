@interface PUIMutableStyleConfiguration
+ (BOOL)supportsSecureCoding;
- (PUIMutableStyleConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PUIMutableStyleConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PUIMutableStyleConfiguration)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUIMutableStyleConfiguration;
  return [(PUIStyleConfiguration *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUIMutableStyleConfiguration;
  [(PUIStyleConfiguration *)&v3 encodeWithCoder:a3];
}

@end