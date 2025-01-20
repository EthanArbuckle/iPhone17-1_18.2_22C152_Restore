@interface Complex
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Complex)initWithCoder:(id)a3;
- (Complex)initWithRealPart:(id)a3 imagPart:(id)a4;
- (NSNumber)imag;
- (NSNumber)real;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImag:(id)a3;
- (void)setReal:(id)a3;
@end

@implementation Complex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Complex)initWithRealPart:(id)a3 imagPart:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)Complex;
  v9 = [(Complex *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_real, a3);
    objc_storeStrong((id *)&v10->_imag, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  v5 = [(Complex *)self real];
  v6 = [(Complex *)self imag];
  id v7 = [v4 initWithRealPart:v5 imagPart:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_real forKey:@"realValue"];
  [v4 encodeObject:self->_imag forKey:@"imagValue"];
}

- (Complex)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"realValue"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imagValue"];
  v10.receiver = self;
  v10.super_class = (Class)Complex;
  id v7 = [(Complex *)&v10 init];
  id v8 = v7;
  if (v7)
  {
    [(Complex *)v7 setReal:v5];
    [(Complex *)v8 setImag:v6];
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v15 = 0;
    goto LABEL_12;
  }
  id v5 = v4;
  v6 = v5;
  real = self->_real;
  if (real) {
    goto LABEL_5;
  }
  id v8 = [v5 real];

  if (v8)
  {
    real = self->_real;
LABEL_5:
    v9 = [v6 real];
    BOOL v10 = real == v9;

    goto LABEL_6;
  }
  BOOL v10 = 1;
LABEL_6:
  imag = self->_imag;
  if (!imag)
  {
    objc_super v12 = [v6 imag];

    if (!v12)
    {
      BOOL v14 = 1;
      goto LABEL_10;
    }
    imag = self->_imag;
  }
  v13 = [v6 imag];
  BOOL v14 = imag == v13;

LABEL_10:
  BOOL v15 = v10 && v14;

LABEL_12:
  return v15;
}

- (id)description
{
  [(NSNumber *)self->_real doubleValue];
  uint64_t v4 = (int)v3;
  [(NSNumber *)self->_imag doubleValue];
  return +[NSString stringWithFormat:@"RealVal=%d, ImagVal=%d", v4, (int)v5];
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSNumber *)self->_real hash];
  return (unint64_t)[(NSNumber *)self->_imag hash] ^ v3;
}

- (NSNumber)real
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setReal:(id)a3
{
}

- (NSNumber)imag
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imag, 0);

  objc_storeStrong((id *)&self->_real, 0);
}

@end