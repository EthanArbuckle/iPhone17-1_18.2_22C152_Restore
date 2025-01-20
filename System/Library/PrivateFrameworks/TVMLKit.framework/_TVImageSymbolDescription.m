@interface _TVImageSymbolDescription
- (BOOL)isEqual:(id)a3;
- (NSString)symbolName;
- (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (_TVImageSymbolDescription)initWithSymbolName:(id)a3 imageSymbolConfiguration:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setImageSymbolConfiguration:(id)a3;
@end

@implementation _TVImageSymbolDescription

- (_TVImageSymbolDescription)initWithSymbolName:(id)a3 imageSymbolConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_TVImageSymbolDescription;
  v9 = [(_TVImageSymbolDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_symbolName, a3);
    objc_storeStrong((id *)&v10->_imageSymbolConfiguration, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_TVImageSymbolDescription allocWithZone:a3];
  v5 = [(_TVImageSymbolDescription *)self symbolName];
  v6 = [(_TVImageSymbolDescription *)self imageSymbolConfiguration];
  id v7 = [(_TVImageSymbolDescription *)v4 initWithSymbolName:v5 imageSymbolConfiguration:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_TVImageSymbolDescription *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(_TVImageSymbolDescription *)self symbolName];
      id v7 = [(_TVImageSymbolDescription *)v5 symbolName];
      if (v6 == v7)
      {
        char v12 = 1;
      }
      else
      {
        id v8 = [(_TVImageSymbolDescription *)self symbolName];
        if (v8)
        {
          v9 = [(_TVImageSymbolDescription *)v5 symbolName];
          if (v9)
          {
            v10 = [(_TVImageSymbolDescription *)self symbolName];
            v11 = [(_TVImageSymbolDescription *)v5 symbolName];
            char v12 = [v10 isEqualToString:v11];
          }
          else
          {
            char v12 = 0;
          }
        }
        else
        {
          char v12 = 0;
        }
      }
      v14 = [(_TVImageSymbolDescription *)self imageSymbolConfiguration];
      v15 = [(_TVImageSymbolDescription *)v5 imageSymbolConfiguration];
      if (v14 == v15)
      {
        char v20 = 1;
      }
      else
      {
        v16 = [(_TVImageSymbolDescription *)self imageSymbolConfiguration];
        if (v16)
        {
          v17 = [(_TVImageSymbolDescription *)v5 imageSymbolConfiguration];
          if (v17)
          {
            v18 = [(_TVImageSymbolDescription *)self imageSymbolConfiguration];
            v19 = [(_TVImageSymbolDescription *)v5 imageSymbolConfiguration];
            char v20 = [v18 isEqualToConfiguration:v19];
          }
          else
          {
            char v20 = 0;
          }
        }
        else
        {
          char v20 = 0;
        }
      }
      char v13 = v12 & v20;
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(_TVImageSymbolDescription *)self symbolName];
  uint64_t v4 = [v3 hash];

  v5 = [(_TVImageSymbolDescription *)self imageSymbolConfiguration];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void)setImageSymbolConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end