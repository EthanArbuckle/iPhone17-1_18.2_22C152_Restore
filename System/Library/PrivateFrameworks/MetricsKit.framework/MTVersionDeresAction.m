@interface MTVersionDeresAction
- (MTVersionDeresAction)initWithField:(id)a3 configDictionary:(id)a4;
- (id)performAction:(id)a3 context:(id)a4;
- (unint64_t)precision;
- (void)setPrecision:(unint64_t)a3;
@end

@implementation MTVersionDeresAction

- (MTVersionDeresAction)initWithField:(id)a3 configDictionary:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MTVersionDeresAction;
  v7 = [(MTTreatmentAction *)&v11 initWithField:a3 configDictionary:v6];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"precision"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v8 length])
    {
      uint64_t v9 = [v8 integerValue];
    }
    else
    {
      uint64_t v9 = -1;
    }
    [(MTVersionDeresAction *)v7 setPrecision:v9];
  }
  return v7;
}

- (id)performAction:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MTVersionDeresAction;
  v5 = [(MTTreatmentAction *)&v10 performAction:a3 context:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 componentsSeparatedByString:@"."];
    if ([v6 count] <= self->_precision)
    {
      id v8 = v5;
    }
    else
    {
      v7 = [v6 subarrayWithRange:0];

      id v8 = [v7 componentsJoinedByString:@"."];
      id v6 = v7;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)precision
{
  return self->_precision;
}

- (void)setPrecision:(unint64_t)a3
{
  self->_precision = a3;
}

@end