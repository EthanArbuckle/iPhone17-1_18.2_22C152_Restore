@interface QOSConfig
- (QOSConfig)initWithAppTarget:(int64_t)a3 locale:(id)a4;
- (QOSConfigInternal)underlyingObject;
- (id)locale;
- (int64_t)appTarget;
@end

@implementation QOSConfig

- (QOSConfig)initWithAppTarget:(int64_t)a3 locale:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)QOSConfig;
  id v5 = a4;
  v6 = [(QOSConfig *)&v11 init];
  v7 = [QOSConfigInternal alloc];
  uint64_t v8 = -[QOSConfigInternal initWithAppTarget:locale:](v7, "initWithAppTarget:locale:", a3, v5, v11.receiver, v11.super_class);

  underlyingObject = v6->_underlyingObject;
  v6->_underlyingObject = (QOSConfigInternal *)v8;

  return v6;
}

- (id)locale
{
  v2 = [(QOSConfig *)self underlyingObject];
  v3 = [v2 locale];

  return v3;
}

- (int64_t)appTarget
{
  v2 = [(QOSConfig *)self underlyingObject];
  int64_t v3 = [v2 appTarget];

  return v3;
}

- (QOSConfigInternal)underlyingObject
{
  return (QOSConfigInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end