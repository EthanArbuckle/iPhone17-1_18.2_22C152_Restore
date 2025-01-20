@interface MusicMonogramArtworkToken
- (BOOL)isEqual:(id)a3;
- (BOOL)rightToLeft;
- (MusicMonogramArtworkToken)initWithFullName:(id)a3 rightToLeft:(BOOL)a4;
- (NSString)fullName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringRepresentation;
- (unint64_t)hash;
- (void)setFullName:(id)a3;
- (void)setRightToLeft:(BOOL)a3;
@end

@implementation MusicMonogramArtworkToken

- (MusicMonogramArtworkToken)initWithFullName:(id)a3 rightToLeft:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6 && [v6 length])
  {
    v13.receiver = self;
    v13.super_class = (Class)MusicMonogramArtworkToken;
    v8 = [(MusicMonogramArtworkToken *)&v13 init];
    if (v8)
    {
      v9 = (NSString *)[v7 copy];
      fullName = v8->_fullName;
      v8->_fullName = v9;

      v8->_rightToLeft = a4;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return [(NSString *)self->_fullName hash] ^ self->_rightToLeft;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MusicMonogramArtworkToken *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      fullName = self->_fullName;
      char v7 = (fullName == v5->_fullName || -[NSString isEqualToString:](fullName, "isEqualToString:"))
        && self->_rightToLeft == v5->_rightToLeft;
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  fullName = self->_fullName;
  BOOL rightToLeft = self->_rightToLeft;

  return [v4 initWithFullName:fullName rightToLeft:rightToLeft];
}

- (id)stringRepresentation
{
  return +[NSString stringWithFormat:@"%lx", [(MusicMonogramArtworkToken *)self hash]];
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
}

- (BOOL)rightToLeft
{
  return self->_rightToLeft;
}

- (void)setRightToLeft:(BOOL)a3
{
  self->_BOOL rightToLeft = a3;
}

- (void).cxx_destruct
{
}

@end