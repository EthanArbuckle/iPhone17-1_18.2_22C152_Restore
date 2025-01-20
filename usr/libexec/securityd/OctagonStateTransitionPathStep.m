@interface OctagonStateTransitionPathStep
+ (id)pathFromDictionary:(id)a3;
+ (id)success;
- (BOOL)successState;
- (NSDictionary)followStates;
- (OctagonStateTransitionPathStep)initWithPath:(id)a3;
- (id)description;
- (id)initAsSuccess;
- (id)nextStep:(id)a3;
- (void)setSuccessState:(BOOL)a3;
@end

@implementation OctagonStateTransitionPathStep

- (void).cxx_destruct
{
}

- (NSDictionary)followStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSuccessState:(BOOL)a3
{
  self->_successState = a3;
}

- (BOOL)successState
{
  return self->_successState;
}

- (id)description
{
  v2 = [(OctagonStateTransitionPathStep *)self followStates];
  v3 = [v2 allKeys];
  v4 = +[NSString stringWithFormat:@"<OSTPath(%@)>", v3];

  return v4;
}

- (id)nextStep:(id)a3
{
  id v4 = a3;
  v5 = [(OctagonStateTransitionPathStep *)self followStates];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (OctagonStateTransitionPathStep)initWithPath:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OctagonStateTransitionPathStep;
  v6 = [(OctagonStateTransitionPathStep *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_successState = 0;
    objc_storeStrong((id *)&v6->_followStates, a3);
  }

  return v7;
}

- (id)initAsSuccess
{
  v6.receiver = self;
  v6.super_class = (Class)OctagonStateTransitionPathStep;
  v2 = [(OctagonStateTransitionPathStep *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_successState = 1;
    followStates = v2->_followStates;
    v2->_followStates = (NSDictionary *)&__NSDictionary0__struct;
  }
  return v3;
}

+ (id)pathFromDictionary:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [v3 allKeys];
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    objc_super v9 = &SecPolicyXPCArrayCopyArray_ptr;
    v20 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v12 = [v3 objectForKeyedSubscript:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v4 setObject:v12 forKeyedSubscript:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            +[OctagonStateTransitionPathStep pathFromDictionary:v12];
            v14 = v13 = v9;
            [v4 setObject:v14 forKeyedSubscript:v11];

            objc_super v9 = v13;
            id v5 = v20;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v15 = [v4 count];
  v16 = [OctagonStateTransitionPathStep alloc];
  if (v15) {
    v17 = [(OctagonStateTransitionPathStep *)v16 initWithPath:v4];
  }
  else {
    v17 = [(OctagonStateTransitionPathStep *)v16 initAsSuccess];
  }
  v18 = v17;

  return v18;
}

+ (id)success
{
  id v2 = [[OctagonStateTransitionPathStep alloc] initAsSuccess];

  return v2;
}

@end