@interface _TUISymbolImageKey
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (UIImageSymbolConfiguration)configuration;
- (_TUISymbolImageKey)initWithName:(id)a3 configuration:(id)a4 style:(unint64_t)a5 contentsScale:(double)a6 layoutDirection:(unint64_t)a7 renderingMode:(unint64_t)a8;
- (double)contentsScale;
- (unint64_t)hash;
- (unint64_t)layoutDirection;
- (unint64_t)renderingMode;
- (unint64_t)style;
@end

@implementation _TUISymbolImageKey

- (_TUISymbolImageKey)initWithName:(id)a3 configuration:(id)a4 style:(unint64_t)a5 contentsScale:(double)a6 layoutDirection:(unint64_t)a7 renderingMode:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_TUISymbolImageKey;
  v16 = [(_TUISymbolImageKey *)&v22 init];
  if (v16)
  {
    v17 = (NSString *)[v14 copy];
    name = v16->_name;
    v16->_name = v17;

    v19 = (UIImageSymbolConfiguration *)[v15 copy];
    configuration = v16->_configuration;
    v16->_configuration = v19;

    v16->_style = a5;
    v16->_contentsScale = a6;
    v16->_layoutDirection = a7;
    v16->_renderingMode = a8;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  BOOL v6 = v4
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
    && [v4[1] isEqualToString:self->_name]
    && [v4[2] isEqualToConfiguration:self->_configuration]
    && v4[3] == self->_style
    && *((double *)v4 + 4) == self->_contentsScale
    && v4[5] == self->_layoutDirection
    && v4[6] == self->_renderingMode;

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return (unint64_t)[(UIImageSymbolConfiguration *)self->_configuration hash] ^ v3 ^ self->_style ^ self->_layoutDirection ^ self->_renderingMode ^ (unint64_t)self->_contentsScale;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageSymbolConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)style
{
  return self->_style;
}

- (double)contentsScale
{
  return self->_contentsScale;
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end