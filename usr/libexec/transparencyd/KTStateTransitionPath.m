@interface KTStateTransitionPath
+ (id)pathFromDictionary:(id)a3;
- (KTStateString)initialState;
- (KTStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4;
- (KTStateTransitionPathStep)pathStep;
- (id)asPathStep;
- (void)setInitialState:(id)a3;
- (void)setPathStep:(id)a3;
@end

@implementation KTStateTransitionPath

- (KTStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KTStateTransitionPath;
  v9 = [(KTStateTransitionPath *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialState, a3);
    objc_storeStrong((id *)&v10->_pathStep, a4);
  }

  return v10;
}

- (id)asPathStep
{
  v3 = [KTStateTransitionPathStep alloc];
  v4 = [(KTStateTransitionPath *)self initialState];
  v9 = v4;
  v5 = [(KTStateTransitionPath *)self pathStep];
  v10 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  id v7 = [(KTStateTransitionPathStep *)v3 initWithPath:v6];

  return v7;
}

+ (id)pathFromDictionary:(id)a3
{
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v5)
  {
    v11 = 0;
    goto LABEL_15;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v16;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
      v10 = [v3 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [[KTStateTransitionPath alloc] initWithState:v9 pathStep:v10];
LABEL_14:

        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v12 = [KTStateTransitionPath alloc];
        v13 = +[KTStateTransitionPathStep pathFromDictionary:v10];
        v11 = [(KTStateTransitionPath *)v12 initWithState:v9 pathStep:v13];

        goto LABEL_14;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    v11 = 0;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_15:

  return v11;
}

- (KTStateString)initialState
{
  return (KTStateString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInitialState:(id)a3
{
}

- (KTStateTransitionPathStep)pathStep
{
  return (KTStateTransitionPathStep *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPathStep:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathStep, 0);

  objc_storeStrong((id *)&self->_initialState, 0);
}

@end