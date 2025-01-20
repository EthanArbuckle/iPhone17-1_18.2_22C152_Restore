@interface WFNumberWrapper
+ (id)wrapperWithNumber:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSNumber)number;
- (unint64_t)hash;
@end

@implementation WFNumberWrapper

+ (id)wrapperWithNumber:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, a1, @"WFNumberSubstitutableState.m", 17, @"Invalid parameter not satisfying: %@", @"number == nil || [number isKindOfClass:[NSNumber class]]" object file lineNumber description];
    }
  }
  uint64_t v7 = objc_opt_new();
  v8 = (void *)v7;
  if (v7) {
    objc_storeStrong((id *)(v7 + 8), a3);
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (NSNumber)number
{
  return self->_number;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFNumberWrapper *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFNumberWrapper *)self number];
      id v6 = [(WFNumberWrapper *)v4 number];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
        char v10 = 1;
      }
      else
      {
        char v10 = 0;
        if (v7 && v8) {
          char v10 = [v7 isEqual:v8];
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v2 = [(WFNumberWrapper *)self number];
  unint64_t v3 = [v2 hash];

  return v3;
}

@end