@interface PKDynamicLayerCrossDissolveConfiguration
+ (BOOL)supportsSecureCoding;
- (PKDynamicLayerCrossDissolveConfiguration)initWithCoder:(id)a3;
- (PKDynamicLayerCrossDissolveConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)intensity;
- (void)encodeWithCoder:(id)a3;
- (void)setIntensity:(unint64_t)a3;
@end

@implementation PKDynamicLayerCrossDissolveConfiguration

- (PKDynamicLayerCrossDissolveConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_9;
  }
  v10.receiver = self;
  v10.super_class = (Class)PKDynamicLayerCrossDissolveConfiguration;
  self = [(PKDynamicLayerCrossDissolveConfiguration *)&v10 init];
  if (self)
  {
    v5 = [v4 PKStringForKey:@"intensity"];
    v6 = v5;
    if (v5 == @"default"
      || v5 && (int v7 = [(__CFString *)v5 isEqualToString:@"default"], v6, v7))
    {
      self->_intensity = 0;

      goto LABEL_7;
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
LABEL_7:
  self = self;
  v8 = self;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerCrossDissolveConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDynamicLayerCrossDissolveConfiguration;
  v5 = [(PKDynamicLayerCrossDissolveConfiguration *)&v7 init];
  if (v5) {
    -[PKDynamicLayerCrossDissolveConfiguration setIntensity:](v5, "setIntensity:", [v4 decodeIntegerForKey:@"crossDissolveIntensity"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[PKDynamicLayerCrossDissolveConfiguration allocWithZone:a3] init];
  *((void *)result + 1) = self->_intensity;
  return result;
}

- (unint64_t)intensity
{
  return self->_intensity;
}

- (void)setIntensity:(unint64_t)a3
{
  self->_intensity = a3;
}

@end