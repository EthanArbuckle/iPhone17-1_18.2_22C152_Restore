@interface PIParallaxStyleModeParameter
- (BOOL)isEqualToParallaxStyleParameter:(id)a3;
- (NSString)modeValue;
- (PIParallaxStyleModeParameter)init;
- (PIParallaxStyleModeParameter)initWithMode:(id)a3;
- (id)description;
- (id)type;
@end

@implementation PIParallaxStyleModeParameter

- (void).cxx_destruct
{
}

- (NSString)modeValue
{
  return self->_modeValue;
}

- (id)description
{
  v2 = NSString;
  v3 = [(PIParallaxStyleModeParameter *)self modeValue];
  v4 = [v2 stringWithFormat:@"(>%@)", v3];

  return v4;
}

- (BOOL)isEqualToParallaxStyleParameter:(id)a3
{
  id v4 = a3;
  v5 = [v4 type];
  int v6 = [v5 isEqualToString:@"mode"];

  if (v6)
  {
    id v7 = v4;
    v8 = [(PIParallaxStyleModeParameter *)self modeValue];
    v9 = [v7 modeValue];

    char v10 = [v8 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)type
{
  return @"mode";
}

- (PIParallaxStyleModeParameter)initWithMode:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PIParallaxStyleModeParameter;
  id v3 = a3;
  id v4 = [(PIParallaxStyleModeParameter *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  modeValue = v4->_modeValue;
  v4->_modeValue = (NSString *)v5;

  return v4;
}

- (PIParallaxStyleModeParameter)init
{
  return [(PIParallaxStyleModeParameter *)self initWithMode:&stru_1EFFD8610];
}

@end