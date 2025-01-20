@interface TRIFBBoxedInt64
- (BOOL)isEqual:(id)a3;
- (TRIFBBoxedInt64)initWithVal:(int64_t)a3;
- (id)init_;
- (unint64_t)hash;
@end

@implementation TRIFBBoxedInt64

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x19F3AD060](self, a2);
  unint64_t v4 = [(TRIFBBoxedInt64 *)self val];
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
      int64_t v8 = [(TRIFBBoxedInt64 *)self val];
      BOOL v9 = v8 == [v6 val];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (TRIFBBoxedInt64)initWithVal:(int64_t)a3
{
  id v4 = [[TRIFBMutableBoxedInt64 alloc] initWithVal:a3];
  p_super = &v4->super;
  if (v4) {
    v4->_allowMutation = 0;
  }

  return p_super;
}

- (id)init_
{
  v3.receiver = self;
  v3.super_class = (Class)TRIFBBoxedInt64;
  return [(TRIFBBoxedInt64 *)&v3 init];
}

@end