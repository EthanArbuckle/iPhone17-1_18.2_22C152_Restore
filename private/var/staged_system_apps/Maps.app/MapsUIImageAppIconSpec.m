@interface MapsUIImageAppIconSpec
- (BOOL)isEqual:(id)a3;
- (MapsUIImageAppIconSpec)initWithBundleIdentifier:(id)a3 format:(int)a4;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4;
- (int)format;
- (unint64_t)hash;
- (void)setBundleIdentifier:(id)a3;
- (void)setFormat:(int)a3;
@end

@implementation MapsUIImageAppIconSpec

- (MapsUIImageAppIconSpec)initWithBundleIdentifier:(id)a3 format:(int)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MapsUIImageAppIconSpec;
  v7 = [(MapsUIImageAppIconSpec *)&v11 init];
  if (v7)
  {
    id v8 = [v6 copy];
    v9 = *(void **)&v7->_format;
    *(void *)&v7->_format = v8;

    *(_DWORD *)(&v7->super._isRTL + 3) = a4;
  }

  return v7;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  id v6 = [(MapsUIImageAppIconSpec *)self bundleIdentifier];
  v7 = +[UIImage _applicationIconImageForBundleIdentifier:v6 format:[(MapsUIImageAppIconSpec *)self format] scale:a3];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(MapsUIImageAppIconSpec *)self bundleIdentifier];
  [v4 setBundleIdentifier:v5];

  [v4 setFormat:[self format]];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unsigned int v6 = [(MapsUIImageAppIconSpec *)self format];
    if (v6 == [v5 format])
    {
      v7 = [(MapsUIImageAppIconSpec *)self bundleIdentifier];
      id v8 = [v5 bundleIdentifier];
      unsigned __int8 v9 = [v7 isEqualToString:v8];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(MapsUIImageAppIconSpec *)self bundleIdentifier];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = v4 ^ [(MapsUIImageAppIconSpec *)self format];

  return v5;
}

- (NSString)bundleIdentifier
{
  return *(NSString **)&self->_format;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (int)format
{
  return *(_DWORD *)(&self->super._isRTL + 3);
}

- (void)setFormat:(int)a3
{
  *(_DWORD *)(&self->super._isRTL + 3) = a3;
}

- (void).cxx_destruct
{
}

@end