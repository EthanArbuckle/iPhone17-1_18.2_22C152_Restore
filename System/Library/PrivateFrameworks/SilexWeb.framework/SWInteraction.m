@interface SWInteraction
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SWInteraction)initWithType:(unint64_t)a3;
- (unint64_t)type;
@end

@implementation SWInteraction

- (SWInteraction)initWithType:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SWInteraction;
  result = [(SWInteraction *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SWInteraction *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(SWInteraction *)self type];
      BOOL v6 = v5 == [(SWInteraction *)v4 type];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  if ([(SWInteraction *)self type] == 1)
  {
    v3 = @"interactable";
  }
  else if ([(SWInteraction *)self type] == 2)
  {
    v3 = @"selectable";
  }
  else
  {
    v3 = @"none";
  }
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; type: %@>",
                       objc_opt_class(),
                       self,
                       v3);
}

- (unint64_t)type
{
  return self->_type;
}

@end