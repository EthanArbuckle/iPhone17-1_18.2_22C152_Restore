@interface CMStyle
- (BOOL)isEqual:(id)a3;
- (CMStyle)init;
- (CMStyle)initWithStyle:(id)a3;
- (id)attributeForName:(id)a3;
- (id)cacheFriendlyCSSStyleString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cssStyleString;
- (id)properties;
- (id)propertyForName:(id)a3;
- (unint64_t)hash;
- (void)addPropertiesToCSSStyleString:(id)a3;
- (void)addProperty:(id)a3 forKey:(id)a4;
- (void)appendDefaultBorderStyle;
- (void)appendOriginInfoFromPoint:(CGPoint)a3;
- (void)appendPositionInfoFromRect:(CGRect)a3;
- (void)appendPropertyForName:(id)a3 color:(id)a4;
- (void)appendPropertyForName:(id)a3 floatValue:(float)a4;
- (void)appendPropertyForName:(id)a3 intValue:(int)a4;
- (void)appendPropertyForName:(id)a3 length:(double)a4 unit:(int)a5;
- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4;
- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4 lineHeight:(float)a5 unit:(int)a6;
- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4 unit:(int)a5;
- (void)appendPropertyForName:(id)a3 stringValue:(id)a4;
- (void)appendPropertyForName:(id)a3 stringWithColons:(id)a4;
- (void)appendPropertyString:(id)a3;
- (void)appendSizeInfoFromRect:(CGRect)a3;
@end

@implementation CMStyle

- (CMStyle)init
{
  v9.receiver = self;
  v9.super_class = (Class)CMStyle;
  v2 = [(CMStyle *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    properties = v2->properties;
    v2->properties = v3;

    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mStyleString = v2->mStyleString;
    v2->mStyleString = v5;

    v7 = v2;
  }

  return v2;
}

- (void)appendPropertyForName:(id)a3 stringValue:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  [(NSMutableString *)self->mStyleString appendString:v7];
  [(NSMutableString *)self->mStyleString appendString:@":"];
  [(NSMutableString *)self->mStyleString appendString:v6];
  [(NSMutableString *)self->mStyleString appendString:@";"];
}

- (id)cssStyleString
{
  [(CMStyle *)self addPropertiesToCSSStyleString:self->mStyleString];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  properties = self->properties;
  self->properties = v3;

  mStyleString = self->mStyleString;
  return mStyleString;
}

- (void)appendPositionInfoFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", @"top:%d; left:%d; width:%d; height:%d;",
    (int)y,
    (int)x,
    (int)width,
    (int)height);
}

- (void)appendPropertyForName:(id)a3 stringWithColons:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  [(NSMutableString *)self->mStyleString appendString:v7];
  [(NSMutableString *)self->mStyleString appendString:v6];
}

- (void)appendPropertyForName:(id)a3 length:(double)a4 unit:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  [(NSMutableString *)self->mStyleString appendString:v10];
  mStyleString = self->mStyleString;
  objc_super v9 = +[CMLengthProperty cssStringValue:v5 unit:a4];
  [(NSMutableString *)mStyleString appendString:v9];
}

- (void)appendSizeInfoFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", @"width:%d; height:%d;",
    (int)width,
    (int)height);
}

- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4
{
}

- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4 unit:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v11 = a3;
  id v8 = a4;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 percent];
      float v10 = v9 / 100.0;
      if (v10 != 1.0) {
        [(CMStyle *)self appendPropertyForName:v11 length:8 unit:(float)(v10 * 1.2)];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", v11, v5, (double)(int)[v8 points]);
      }
    }
  }
}

- (void)appendPropertyForName:(id)a3 oadTextSpacing:(id)a4 lineHeight:(float)a5 unit:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v12 = a3;
  id v10 = a4;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![v10 points]) {
        goto LABEL_7;
      }
      -[CMStyle appendPropertyForName:length:unit:](self, "appendPropertyForName:length:unit:", v12, v6, (double)(int)[v10 points]);
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 percent];
      [(CMStyle *)self appendPropertyForName:v12 length:1 unit:(float)((float)(v11 / 100.0) * a5)];
    }
  }
LABEL_7:
}

- (void)addProperty:(id)a3 forKey:(id)a4
{
}

- (void)appendPropertyForName:(id)a3 intValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  [(NSMutableString *)self->mStyleString appendString:v6];
  [(NSMutableString *)self->mStyleString appendFormat:@": %d;", v4];
}

- (id)attributeForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->properties objectForKey:a3];
  return v3;
}

- (id)properties
{
  return self->properties;
}

- (id)propertyForName:(id)a3
{
  v3 = [(NSMutableDictionary *)self->properties objectForKey:a3];
  return v3;
}

- (void)appendDefaultBorderStyle
{
}

- (void)appendPropertyForName:(id)a3 color:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  [(NSMutableString *)self->mStyleString appendString:v9];
  mStyleString = self->mStyleString;
  id v8 = +[CMColorProperty cssStringFromTSUColor:v6];
  [(NSMutableString *)mStyleString appendString:v8];
}

- (void)appendPropertyString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([(NSMutableString *)self->mStyleString length]) {
      [(NSMutableString *)self->mStyleString appendString:@" "];
    }
    [(NSMutableString *)self->mStyleString appendString:v4];
  }
}

- (void)appendPropertyForName:(id)a3 floatValue:(float)a4
{
  id v6 = a3;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  [(NSMutableString *)self->mStyleString appendString:v6];
  [(NSMutableString *)self->mStyleString appendFormat:@": %f;", a4];
}

- (CMStyle)initWithStyle:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CMStyle;
  uint64_t v5 = [(CMStyle *)&v16 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = objc_alloc(MEMORY[0x263EFF9A0]);
      id v7 = [v4 properties];
      uint64_t v8 = [v6 initWithDictionary:v7];
      properties = v5->properties;
      v5->properties = (NSMutableDictionary *)v8;

      id v10 = (NSMutableString *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v4[2]];
    }
    else
    {
      float v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v12 = v5->properties;
      v5->properties = v11;

      id v10 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    }
    mStyleString = v5->mStyleString;
    v5->mStyleString = v10;

    v14 = v5;
  }

  return v5;
}

- (void)addPropertiesToCSSStyleString:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->properties;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = -[NSMutableDictionary objectForKey:](self->properties, "objectForKey:", v9, (void)v13);
        float v11 = [v10 cssStringForName:v9];
        id v12 = v11;
        if (v11 && [v11 length])
        {
          if ([v4 length]) {
            [v4 appendString:@" "];
          }
          [v4 appendString:v12];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)cacheFriendlyCSSStyleString
{
  v3 = (void *)[(NSMutableString *)self->mStyleString mutableCopy];
  [(CMStyle *)self addPropertiesToCSSStyleString:v3];
  return v3;
}

- (void)appendOriginInfoFromPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(NSMutableString *)self->mStyleString length]) {
    [(NSMutableString *)self->mStyleString appendString:@" "];
  }
  -[NSMutableString appendFormat:](self->mStyleString, "appendFormat:", @"top:%d; left:%d;",
    (int)y,
    (int)x);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithStyle:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CMStyle *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([(NSMutableDictionary *)self->properties isEqual:v5->properties]) {
        char v6 = [(NSMutableString *)self->mStyleString isEqualToString:v5->mStyleString];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableDictionary *)self->properties hash];
  return [(NSMutableString *)self->mStyleString hash] ^ (v3 << 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mStyleString, 0);
  objc_storeStrong((id *)&self->properties, 0);
}

@end