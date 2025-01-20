@interface PKDynamicLayerConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isSupported;
- (BOOL)parallaxEnabled;
- (PKDynamicLayerConfiguration)initWithCoder:(id)a3;
- (PKDynamicLayerConfiguration)initWithDictionary:(id)a3;
- (PKDynamicLayerCrossDissolveConfiguration)crossDissolve;
- (PKDynamicLayerEmitterConfiguration)backgroundParallaxEmitter;
- (PKDynamicLayerEmitterConfiguration)foregroundParallaxEmitter;
- (PKDynamicLayerEmitterConfiguration)neutralEmitter;
- (PKDynamicLayerEmitterConfiguration)staticOverlayEmitter;
- (PKDynamicLayerTransactionEffectConfiguration)transactionEffect;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundParallaxEmitter:(id)a3;
- (void)setCrossDissolve:(id)a3;
- (void)setForegroundParallaxEmitter:(id)a3;
- (void)setNeutralEmitter:(id)a3;
- (void)setParallaxEnabled:(BOOL)a3;
- (void)setStaticOverlayEmitter:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setTransactionEffect:(id)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation PKDynamicLayerConfiguration

- (PKDynamicLayerConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v38.receiver = self;
    v38.super_class = (Class)PKDynamicLayerConfiguration;
    v5 = [(PKDynamicLayerConfiguration *)&v38 init];
    if (v5)
    {
      v6 = [v4 PKNumberForKey:@"version"];
      v7 = v6;
      if (v6)
      {
        v5->_version = [v6 unsignedIntegerValue];
        v5->_parallaxEnabled = [v4 PKBoolForKey:@"parallaxEnabled"];
        uint64_t v8 = [v4 PKDictionaryForKey:@"backgroundParallaxEmitter"];
        if (v8)
        {
          v9 = [[PKDynamicLayerEmitterConfiguration alloc] initWithDictionary:v8];
          backgroundParallaxEmitter = v5->_backgroundParallaxEmitter;
          v5->_backgroundParallaxEmitter = v9;
        }
        uint64_t v11 = [v4 PKDictionaryForKey:@"neutralEmitter"];
        uint64_t v12 = v11;
        if (v8) {
          BOOL v13 = 1;
        }
        else {
          BOOL v13 = v11 == 0;
        }
        if (!v13)
        {
          v14 = [[PKDynamicLayerEmitterConfiguration alloc] initWithDictionary:v11];
          neutralEmitter = v5->_neutralEmitter;
          v5->_neutralEmitter = v14;
        }
        uint64_t v16 = [v4 PKDictionaryForKey:@"foregroundParallaxEmitter"];
        v17 = (void *)v16;
        if (v8 | v12) {
          BOOL v18 = 1;
        }
        else {
          BOOL v18 = v16 == 0;
        }
        if (!v18)
        {
          v19 = [[PKDynamicLayerEmitterConfiguration alloc] initWithDictionary:v16];
          foregroundParallaxEmitter = v5->_foregroundParallaxEmitter;
          v5->_foregroundParallaxEmitter = v19;
        }
        uint64_t v21 = [v4 PKDictionaryForKey:@"staticOverlayEmitter"];
        v22 = (void *)v21;
        if (v17) {
          BOOL v23 = 1;
        }
        else {
          BOOL v23 = (v8 | v12) != 0;
        }
        if (!v23 && v21)
        {
          v24 = [[PKDynamicLayerEmitterConfiguration alloc] initWithDictionary:v21];
          staticOverlayEmitter = v5->_staticOverlayEmitter;
          v5->_staticOverlayEmitter = v24;
        }
        v26 = [PKDynamicLayerTransactionEffectConfiguration alloc];
        v27 = [v4 PKDictionaryForKey:@"transactionEffect"];
        uint64_t v28 = [(PKDynamicLayerTransactionEffectConfiguration *)v26 initWithDictionary:v27];
        transactionEffect = v5->_transactionEffect;
        v5->_transactionEffect = (PKDynamicLayerTransactionEffectConfiguration *)v28;

        v30 = [PKDynamicLayerCrossDissolveConfiguration alloc];
        v31 = [v4 PKDictionaryForKey:@"crossDissolve"];
        uint64_t v32 = [(PKDynamicLayerCrossDissolveConfiguration *)v30 initWithDictionary:v31];
        crossDissolve = v5->_crossDissolve;
        v5->_crossDissolve = (PKDynamicLayerCrossDissolveConfiguration *)v32;
      }
      else
      {
        v35 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_190E10000, v35, OS_LOG_TYPE_DEFAULT, "No dynamic layer version included, default to unsupported", v37, 2u);
        }

        v5->_version = 0;
      }
    }
    self = v5;
    v34 = self;
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (BOOL)isSupported
{
  return self->_version - 1 < 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDynamicLayerConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKDynamicLayerConfiguration;
  v5 = [(PKDynamicLayerConfiguration *)&v13 init];
  if (v5)
  {
    -[PKDynamicLayerConfiguration setVersion:](v5, "setVersion:", [v4 decodeIntegerForKey:@"version"]);
    -[PKDynamicLayerConfiguration setParallaxEnabled:](v5, "setParallaxEnabled:", [v4 decodeBoolForKey:@"parallaxEnabled"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundParallaxEmitter"];
    [(PKDynamicLayerConfiguration *)v5 setBackgroundParallaxEmitter:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"neutralEmitter"];
    [(PKDynamicLayerConfiguration *)v5 setNeutralEmitter:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundParallaxEmitter"];
    [(PKDynamicLayerConfiguration *)v5 setForegroundParallaxEmitter:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticOverlayEmitter"];
    [(PKDynamicLayerConfiguration *)v5 setStaticOverlayEmitter:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transactionEffect"];
    [(PKDynamicLayerConfiguration *)v5 setTransactionEffect:v10];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crossDissolve"];
    [(PKDynamicLayerConfiguration *)v5 setCrossDissolve:v11];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"version"];
  [v5 encodeBool:self->_parallaxEnabled forKey:@"parallaxEnabled"];
  [v5 encodeObject:self->_backgroundParallaxEmitter forKey:@"backgroundParallaxEmitter"];
  [v5 encodeObject:self->_neutralEmitter forKey:@"neutralEmitter"];
  [v5 encodeObject:self->_foregroundParallaxEmitter forKey:@"foregroundParallaxEmitter"];
  [v5 encodeObject:self->_staticOverlayEmitter forKey:@"staticOverlayEmitter"];
  [v5 encodeObject:self->_transactionEffect forKey:@"transactionEffect"];
  [v5 encodeObject:self->_crossDissolve forKey:@"crossDissolve"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKDynamicLayerConfiguration allocWithZone:](PKDynamicLayerConfiguration, "allocWithZone:") init];
  v5->_unint64_t version = self->_version;
  v5->_parallaxEnabled = self->_parallaxEnabled;
  v6 = [(PKDynamicLayerEmitterConfiguration *)self->_backgroundParallaxEmitter copyWithZone:a3];
  backgroundParallaxEmitter = v5->_backgroundParallaxEmitter;
  v5->_backgroundParallaxEmitter = v6;

  uint64_t v8 = [(PKDynamicLayerEmitterConfiguration *)self->_neutralEmitter copyWithZone:a3];
  neutralEmitter = v5->_neutralEmitter;
  v5->_neutralEmitter = v8;

  v10 = [(PKDynamicLayerEmitterConfiguration *)self->_foregroundParallaxEmitter copyWithZone:a3];
  foregroundParallaxEmitter = v5->_foregroundParallaxEmitter;
  v5->_foregroundParallaxEmitter = v10;

  uint64_t v12 = [(PKDynamicLayerEmitterConfiguration *)self->_staticOverlayEmitter copyWithZone:a3];
  staticOverlayEmitter = v5->_staticOverlayEmitter;
  v5->_staticOverlayEmitter = v12;

  v14 = [(PKDynamicLayerTransactionEffectConfiguration *)self->_transactionEffect copyWithZone:a3];
  transactionEffect = v5->_transactionEffect;
  v5->_transactionEffect = v14;

  uint64_t v16 = [(PKDynamicLayerCrossDissolveConfiguration *)self->_crossDissolve copyWithZone:a3];
  crossDissolve = v5->_crossDissolve;
  v5->_crossDissolve = v16;

  return v5;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_unint64_t version = a3;
}

- (BOOL)parallaxEnabled
{
  return self->_parallaxEnabled;
}

- (void)setParallaxEnabled:(BOOL)a3
{
  self->_parallaxEnabled = a3;
}

- (PKDynamicLayerEmitterConfiguration)backgroundParallaxEmitter
{
  return self->_backgroundParallaxEmitter;
}

- (void)setBackgroundParallaxEmitter:(id)a3
{
}

- (PKDynamicLayerEmitterConfiguration)neutralEmitter
{
  return self->_neutralEmitter;
}

- (void)setNeutralEmitter:(id)a3
{
}

- (PKDynamicLayerEmitterConfiguration)foregroundParallaxEmitter
{
  return self->_foregroundParallaxEmitter;
}

- (void)setForegroundParallaxEmitter:(id)a3
{
}

- (PKDynamicLayerEmitterConfiguration)staticOverlayEmitter
{
  return self->_staticOverlayEmitter;
}

- (void)setStaticOverlayEmitter:(id)a3
{
}

- (PKDynamicLayerTransactionEffectConfiguration)transactionEffect
{
  return self->_transactionEffect;
}

- (void)setTransactionEffect:(id)a3
{
}

- (PKDynamicLayerCrossDissolveConfiguration)crossDissolve
{
  return self->_crossDissolve;
}

- (void)setCrossDissolve:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossDissolve, 0);
  objc_storeStrong((id *)&self->_transactionEffect, 0);
  objc_storeStrong((id *)&self->_staticOverlayEmitter, 0);
  objc_storeStrong((id *)&self->_foregroundParallaxEmitter, 0);
  objc_storeStrong((id *)&self->_neutralEmitter, 0);
  objc_storeStrong((id *)&self->_backgroundParallaxEmitter, 0);
}

@end