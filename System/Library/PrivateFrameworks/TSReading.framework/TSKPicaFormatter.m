@interface TSKPicaFormatter
- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (NSNumber)maximum;
- (NSNumber)minimum;
- (NSString)picaSeparator;
- (TSKPicaFormatter)initWithPicaSeparator:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3;
- (void)dealloc;
- (void)setMaximum:(id)a3;
- (void)setMinimum:(id)a3;
- (void)setPicaSeparator:(id)a3;
@end

@implementation TSKPicaFormatter

- (TSKPicaFormatter)initWithPicaSeparator:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSKPicaFormatter;
  v4 = [(TSKPicaFormatter *)&v7 init];
  v5 = v4;
  if (v4) {
    [(TSKPicaFormatter *)v4 setPicaSeparator:a3];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKPicaFormatter;
  [(TSKPicaFormatter *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPicaSeparator:", -[TSKPicaFormatter picaSeparator](self, "picaSeparator"));
  objc_msgSend(v4, "setMinimum:", -[TSKPicaFormatter minimum](self, "minimum"));
  objc_msgSend(v4, "setMaximum:", -[TSKPicaFormatter maximum](self, "maximum"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = -[NSString isEqualToString:](-[TSKPicaFormatter picaSeparator](self, "picaSeparator"), "isEqualToString:", [a3 picaSeparator]);
      if (v5)
      {
        BOOL v5 = -[NSNumber isEqualToNumber:](-[TSKPicaFormatter minimum](self, "minimum"), "isEqualToNumber:", [a3 minimum]);
        if (v5)
        {
          v6 = [(TSKPicaFormatter *)self maximum];
          uint64_t v7 = [a3 maximum];
          LOBYTE(v5) = [(NSNumber *)v6 isEqualToNumber:v7];
        }
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)stringForObjectValue:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [a3 floatValue];
  double v7 = floor(v6);
  double v8 = ceil(v6);
  if (v6 < 0.0) {
    double v7 = v8;
  }
  uint64_t v9 = (int)v7;
  LODWORD(v3) = llround(12.0 * vabdd_f64(v6, (double)(int)v9));
  if ((double)(int)v3 >= 12.0)
  {
    uint64_t v3 = (int)((double)(int)v3 - 12.0);
    uint64_t v9 = (((int)v9 >> 31) | 1) + v9;
  }
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v6 <= 0.0;
  }
  if (v10) {
    v11 = @"-%d%@%d";
  }
  else {
    v11 = @"%d%@%d";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", v11, v9, -[TSKPicaFormatter picaSeparator](self, "picaSeparator"), v3);
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  if (a4 && [a4 length])
  {
    uint64_t v9 = (void *)[MEMORY[0x263F08B08] scannerWithString:a4];
    unsigned __int8 v10 = [v9 scanString:@"-" intoString:0];
    uint64_t v20 = 0;
    if (([v9 scanFloat:(char *)&v20 + 4] & 1) == 0) {
      HIDWORD(v20) = 0;
    }
    objc_msgSend(v9, "scanString:intoString:", -[TSKPicaFormatter picaSeparator](self, "picaSeparator"), 0);
    if (([v9 scanFloat:&v20] & 1) == 0) {
      LODWORD(v20) = 0;
    }
    int v11 = [v9 isAtEnd];
    int v12 = v11;
    if (a5 && (v11 & 1) == 0) {
      *a5 = (id)[(id)TSKBundle() localizedStringForKey:@"Couldn\\U2019t convert to picas" value:&stru_26D688A48 table:@"TSKit"];
    }
    if (a3 && v12)
    {
      v13 = [(TSKPicaFormatter *)self minimum];
      v14 = [(TSKPicaFormatter *)self maximum];
      LODWORD(v20) = fabsf(*(float *)&v20);
      double v15 = *(float *)&v20 / 12.0 + *((float *)&v20 + 1);
      if ((v10 & (v15 > 0.0)) != 0) {
        double v15 = -v15;
      }
      *(float *)&double v15 = v15;
      v16 = (void *)[NSNumber numberWithFloat:v15];
      *a3 = v16;
      if (v13)
      {
        uint64_t v17 = [v16 compare:v13];
        if (v17 == -1) {
          int v12 = 0;
        }
        if (a5 && v17 == -1)
        {
          int v12 = 0;
          *a5 = (id)[(id)TSKBundle() localizedStringForKey:@"Fell short of minimum" value:&stru_26D688A48 table:@"TSKit"];
        }
      }
      if (v14)
      {
        uint64_t v18 = [*a3 compare:v14];
        if (v18 == 1) {
          int v12 = 0;
        }
        if (a5)
        {
          if (v18 == 1)
          {
            int v12 = 0;
            *a5 = (id)[(id)TSKBundle() localizedStringForKey:@"Maximum exceeded" value:&stru_26D688A48 table:@"TSKit"];
          }
        }
      }
    }
    return v12 != 0;
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    return 1;
  }
}

- (NSString)picaSeparator
{
  return self->mPicaSeparator;
}

- (void)setPicaSeparator:(id)a3
{
}

- (NSNumber)minimum
{
  return self->mMinimum;
}

- (void)setMinimum:(id)a3
{
}

- (NSNumber)maximum
{
  return self->mMaximum;
}

- (void)setMaximum:(id)a3
{
}

@end