@interface KTStateTransitionPathStep
+ (id)failure:(id)a3 pathFromDictionary:(id)a4;
+ (id)pathFromDictionary:(id)a3;
+ (id)success;
- (BOOL)successState;
- (KTStateTransitionPathStep)initWithExpectedFailure:(id)a3 withPath:(id)a4;
- (KTStateTransitionPathStep)initWithPath:(id)a3;
- (NSDictionary)followStates;
- (NSError)expectedFailure;
- (id)description;
- (id)initAsSuccess;
- (id)nextStep:(id)a3;
- (void)setSuccessState:(BOOL)a3;
@end

@implementation KTStateTransitionPathStep

- (id)initAsSuccess
{
  v7.receiver = self;
  v7.super_class = (Class)KTStateTransitionPathStep;
  v2 = [(KTStateTransitionPathStep *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_successState = 1;
    followStates = v2->_followStates;
    v2->_followStates = (NSDictionary *)&__NSDictionary0__struct;

    expectedFailure = v3->_expectedFailure;
    v3->_expectedFailure = 0;
  }
  return v3;
}

- (KTStateTransitionPathStep)initWithPath:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)KTStateTransitionPathStep;
  v6 = [(KTStateTransitionPathStep *)&v10 init];
  objc_super v7 = v6;
  if (v6)
  {
    v6->_successState = 0;
    objc_storeStrong((id *)&v6->_followStates, a3);
    expectedFailure = v7->_expectedFailure;
    v7->_expectedFailure = 0;
  }
  return v7;
}

- (KTStateTransitionPathStep)initWithExpectedFailure:(id)a3 withPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTStateTransitionPathStep;
  v9 = [(KTStateTransitionPathStep *)&v12 init];
  objc_super v10 = v9;
  if (v9)
  {
    v9->_successState = 0;
    objc_storeStrong((id *)&v9->_followStates, a4);
    objc_storeStrong((id *)&v10->_expectedFailure, a3);
  }

  return v10;
}

- (id)nextStep:(id)a3
{
  id v4 = a3;
  id v5 = [(KTStateTransitionPathStep *)self followStates];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)description
{
  v2 = [(KTStateTransitionPathStep *)self followStates];
  v3 = [v2 allKeys];
  id v4 = +[NSString stringWithFormat:@"<OSTPath(%@)>", v3];

  return v4;
}

+ (id)success
{
  id v2 = [[KTStateTransitionPathStep alloc] initAsSuccess];

  return v2;
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
    v9 = &_s10Foundation13__DataStorageC6_bytesSvSgvg_ptr;
    v20 = v5;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        objc_super v12 = [v3 objectForKeyedSubscript:v11];
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
            +[KTStateTransitionPathStep pathFromDictionary:v12];
            v14 = v13 = v9;
            [v4 setObject:v14 forKeyedSubscript:v11];

            v9 = v13;
            id v5 = v20;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v15 = [v4 count];
  v16 = [KTStateTransitionPathStep alloc];
  if (v15) {
    v17 = [(KTStateTransitionPathStep *)v16 initWithPath:v4];
  }
  else {
    v17 = [(KTStateTransitionPathStep *)v16 initAsSuccess];
  }
  v18 = v17;

  return v18;
}

+ (id)failure:(id)a3 pathFromDictionary:(id)a4
{
  id v5 = a3;
  id v6 = +[KTStateTransitionPathStep pathFromDictionary:a4];
  id v7 = (void *)v6[3];
  v6[3] = v5;

  return v6;
}

- (BOOL)successState
{
  return self->_successState;
}

- (void)setSuccessState:(BOOL)a3
{
  self->_successState = a3;
}

- (NSDictionary)followStates
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSError)expectedFailure
{
  return (NSError *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedFailure, 0);

  objc_storeStrong((id *)&self->_followStates, 0);
}

@end