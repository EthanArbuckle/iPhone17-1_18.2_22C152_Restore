@interface TRIFBBoxedBool
- (BOOL)isEqual:(id)a3;
- (TRIFBBoxedBool)initWithVal:(BOOL)a3;
- (id)init_;
- (unint64_t)hash;
@end

@implementation TRIFBBoxedBool

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  unint64_t v4 = [(TRIFBBoxedBool *)self val];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)MEMORY[0x19F3AD060]();
      BOOL v8 = [(TRIFBBoxedBool *)self val];
      char v9 = [v6 val];
      char v10 = v8 ^ v9 ^ 1;
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (TRIFBBoxedBool)initWithVal:(BOOL)a3
{
  id v4 = [[TRIFBMutableBoxedBool alloc] initWithVal:a3];
  p_super = &v4->super;
  if (v4) {
    v4->_allowMutation = 0;
  }

  return p_super;
}

- (id)init_
{
  v3.receiver = self;
  v3.super_class = (Class)TRIFBBoxedBool;
  return [(TRIFBBoxedBool *)&v3 init];
}

@end