@interface TRIFBBoxedDouble
- (BOOL)isEqual:(id)a3;
- (TRIFBBoxedDouble)initWithVal:(double)a3;
- (id)init_;
- (unint64_t)hash;
@end

@implementation TRIFBBoxedDouble

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  [(TRIFBBoxedDouble *)self val];
  unint64_t v5 = (unint64_t)v4;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)MEMORY[0x19F3AD060]();
      [(TRIFBBoxedDouble *)self val];
      double v9 = v8;
      [v6 val];
      BOOL v11 = v9 == v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (TRIFBBoxedDouble)initWithVal:(double)a3
{
  id v4 = [[TRIFBMutableBoxedDouble alloc] initWithVal:a3];
  p_super = &v4->super;
  if (v4) {
    v4->_allowMutation = 0;
  }

  return p_super;
}

- (id)init_
{
  v3.receiver = self;
  v3.super_class = (Class)TRIFBBoxedDouble;
  return [(TRIFBBoxedDouble *)&v3 init];
}

@end