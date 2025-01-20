@interface _UIFontNameCacheKey
- (BOOL)_isEqualToKey:(id)a3;
- (NSString)fontName;
- (double)pointSize;
- (id)description;
- (int)traits;
- (unint64_t)_hash;
- (void)dealloc;
- (void)setFontName:(id)a3;
- (void)setPointSize:(double)a3;
- (void)setTraits:(int)a3;
@end

@implementation _UIFontNameCacheKey

- (unint64_t)_hash
{
  return [(NSString *)self->_fontName hash] ^ self->_traits ^ vcvtmd_u64_f64(self->_pointSize * 100.0);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFontNameCacheKey;
  [(_UIFontNameCacheKey *)&v3 dealloc];
}

- (void)setTraits:(int)a3
{
  self->_traits = a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)setFontName:(id)a3
{
}

- (BOOL)_isEqualToKey:(id)a3
{
  if (self->super._hash != *((void *)a3 + 1)) {
    goto LABEL_6;
  }
  fontName = self->_fontName;
  if (fontName == *((NSString **)a3 + 3) || (BOOL v6 = -[NSString isEqualToString:](fontName, "isEqualToString:")))
  {
    if (self->_traits == *((_DWORD *)a3 + 4))
    {
      double pointSize = self->_pointSize;
      [a3 pointSize];
      LOBYTE(v6) = vabdd_f64(pointSize, v8) < 0.00000011920929;
      return v6;
    }
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"fontName: %@, traits: %ld, pointSize: %g", self->_fontName, self->_traits, *(void *)&self->_pointSize];
}

- (NSString)fontName
{
  return self->_fontName;
}

- (int)traits
{
  return self->_traits;
}

@end