@interface TUIElementBehaviorArgumentsMap
- (BOOL)isEqual:(id)a3;
- (NSDictionary)arguments;
- (NSString)behavior;
- (TUIElementBehaviorArgumentsMap)initWithBehavior:(id)a3 arguments:(id)a4;
- (unint64_t)hash;
@end

@implementation TUIElementBehaviorArgumentsMap

- (TUIElementBehaviorArgumentsMap)initWithBehavior:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIElementBehaviorArgumentsMap;
  v8 = [(TUIElementBehaviorArgumentsMap *)&v14 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    behavior = v8->_behavior;
    v8->_behavior = v9;

    v11 = (NSDictionary *)[v7 copy];
    arguments = v8->_arguments;
    v8->_arguments = v11;
  }
  return v8;
}

- (unint64_t)hash
{
  return [(NSString *)self->_behavior hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TUIElementBehaviorArgumentsMap *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()) {
      id v6 = v4;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    v8 = v7;
    if (!v7) {
      goto LABEL_8;
    }
    behavior = self->_behavior;
    uint64_t v10 = [(TUIElementBehaviorArgumentsMap *)v7 behavior];
    if (behavior == (NSString *)v10)
    {
    }
    else
    {
      v11 = (void *)v10;
      v12 = self->_behavior;
      v13 = [(TUIElementBehaviorArgumentsMap *)v8 behavior];
      LODWORD(v12) = [(NSString *)v12 isEqualToString:v13];

      if (!v12)
      {
LABEL_8:
        unsigned __int8 v14 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    arguments = self->_arguments;
    uint64_t v16 = [(TUIElementBehaviorArgumentsMap *)v8 arguments];
    if (arguments == (NSDictionary *)v16)
    {
      unsigned __int8 v14 = 1;
    }
    else
    {
      v17 = (NSDictionary *)v16;
      v18 = self->_arguments;
      v19 = [(TUIElementBehaviorArgumentsMap *)v8 arguments];
      unsigned __int8 v14 = [(NSDictionary *)v18 isEqualToDictionary:v19];

      arguments = v17;
    }

    goto LABEL_15;
  }
  unsigned __int8 v14 = 1;
LABEL_16:

  return v14;
}

- (NSString)behavior
{
  return self->_behavior;
}

- (NSDictionary)arguments
{
  return self->_arguments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);

  objc_storeStrong((id *)&self->_behavior, 0);
}

@end