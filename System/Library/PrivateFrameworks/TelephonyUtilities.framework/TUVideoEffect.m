@interface TUVideoEffect
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEffect:(id)a3;
- (NSString)name;
- (TUVideoEffect)init;
- (TUVideoEffect)initWithName:(id)a3 thumbnailImage:(id)a4;
- (UIImage)thumbnailImage;
- (unint64_t)hash;
@end

@implementation TUVideoEffect

- (TUVideoEffect)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TUVideoEffect.m", 20, @"%s is not available. Use a designated initializer instead.", "-[TUVideoEffect init]");

  return 0;
}

- (TUVideoEffect)initWithName:(id)a3 thumbnailImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUVideoEffect;
  v8 = [(TUVideoEffect *)&v12 init];
  if (v8)
  {
    if (v6)
    {
      if (v7)
      {
LABEL_4:
        uint64_t v9 = [v6 copy];
        name = v8->_name;
        v8->_name = (NSString *)v9;

        objc_storeStrong((id *)&v8->_thumbnailImage, a4);
        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUVideoEffect initWithName:thumbnailImage:]", @"name" format];
      if (v7) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[TUVideoEffect initWithName:thumbnailImage:]", @"thumbnailImage" format];
    goto LABEL_4;
  }
LABEL_5:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUVideoEffect *)self isEqualToEffect:v4];

  return v5;
}

- (BOOL)isEqualToEffect:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUVideoEffect *)self name];
  id v6 = [v4 name];
  if ([v5 isEqualToString:v6])
  {
    id v7 = [(TUVideoEffect *)self thumbnailImage];
    v8 = [v4 thumbnailImage];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(TUVideoEffect *)self name];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(TUVideoEffect *)self thumbnailImage];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end