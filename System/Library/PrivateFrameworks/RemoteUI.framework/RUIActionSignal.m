@interface RUIActionSignal
+ (id)signalWithString:(id)a3;
+ (id)signalWithType:(unint64_t)a3;
+ (id)stringForActionSignal:(unint64_t)a3;
+ (unint64_t)signalTypeForString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSMutableArray)subActions;
- (id)description;
- (unint64_t)topSignal;
- (void)setSubActions:(id)a3;
- (void)setTopSignal:(unint64_t)a3;
@end

@implementation RUIActionSignal

+ (id)signalWithType:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setTopSignal:a3];
  v5 = [MEMORY[0x263EFF980] array];
  [v4 setSubActions:v5];

  return v4;
}

+ (id)signalWithString:(id)a3
{
  v3 = +[RUIActionSignal signalTypeForString:a3];
  if (v3)
  {
    v3 = +[RUIActionSignal signalWithType:v3];
  }
  return v3;
}

+ (id)stringForActionSignal:(unint64_t)a3
{
  if (a3 > 9) {
    return @"unknown";
  }
  else {
    return off_264211658[a3];
  }
}

+ (unint64_t)signalTypeForString:(id)a3
{
  v3 = [&unk_26C557EF8 objectForKeyedSubscript:a3];
  unint64_t v4 = (int)[v3 intValue];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    unint64_t v7 = [(RUIActionSignal *)self topSignal];
    if (v7 != [v6 topSignal])
    {
      char v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v8 = [(RUIActionSignal *)self subActions];
    if (v8 || ([v6 subActions], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = [(RUIActionSignal *)self subActions];
      v10 = [v6 subActions];
      char v11 = [v9 isEqual:v10];

      if (v8)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      char v11 = 1;
    }

    goto LABEL_11;
  }
  char v11 = 0;
LABEL_13:

  return v11;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(id)objc_opt_class() description];
  id v5 = [(id)objc_opt_class() stringForActionSignal:self->_topSignal];
  id v6 = [NSNumber numberWithUnsignedInteger:self->_topSignal];
  unint64_t v7 = [v3 stringWithFormat:@"<%@ : %p - %@ (%@), subactions = %@", v4, self, v5, v6, self->_subActions];

  return v7;
}

- (unint64_t)topSignal
{
  return self->_topSignal;
}

- (void)setTopSignal:(unint64_t)a3
{
  self->_topSignal = a3;
}

- (NSMutableArray)subActions
{
  return self->_subActions;
}

- (void)setSubActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end