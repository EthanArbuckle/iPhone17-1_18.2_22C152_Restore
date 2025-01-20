@interface SWEmbedAction
- (BOOL)canHandle;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)info;
- (NSString)description;
- (SWEmbedAction)initWithType:(unint64_t)a3 info:(id)a4;
- (unint64_t)type;
@end

@implementation SWEmbedAction

- (SWEmbedAction)initWithType:(unint64_t)a3 info:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SWEmbedAction;
  v8 = [(SWEmbedAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_info, a4);
  }

  return v9;
}

- (BOOL)canHandle
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SWEmbedAction *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(SWEmbedAction *)self type];
      BOOL v6 = v5 == [(SWEmbedAction *)v4 type];
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
  if ([(SWEmbedAction *)self type] == 1)
  {
    v3 = @"url";
  }
  else if ([(SWEmbedAction *)self type] == 2)
  {
    v3 = @"share";
  }
  else if ([(SWEmbedAction *)self type] == 3)
  {
    v3 = @"close";
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

- (NSDictionary)info
{
  return self->_info;
}

- (void).cxx_destruct
{
}

@end