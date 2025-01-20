@interface OctagonStateTransitionPath
+ (id)pathFromDictionary:(id)a3;
- (OctagonStateString)initialState;
- (OctagonStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4;
- (OctagonStateTransitionPathStep)pathStep;
- (id)asPathStep;
- (id)description;
- (void)setInitialState:(id)a3;
- (void)setPathStep:(id)a3;
@end

@implementation OctagonStateTransitionPath

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathStep, 0);

  objc_storeStrong((id *)&self->_initialState, 0);
}

- (void)setPathStep:(id)a3
{
}

- (OctagonStateTransitionPathStep)pathStep
{
  return (OctagonStateTransitionPathStep *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInitialState:(id)a3
{
}

- (OctagonStateString)initialState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 8, 1);
}

- (id)asPathStep
{
  v3 = [OctagonStateTransitionPathStep alloc];
  v4 = [(OctagonStateTransitionPath *)self initialState];
  v9 = v4;
  v5 = [(OctagonStateTransitionPath *)self pathStep];
  v10 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v7 = [(OctagonStateTransitionPathStep *)v3 initWithPath:v6];

  return v7;
}

- (id)description
{
  v3 = [(OctagonStateTransitionPath *)self initialState];
  v4 = [(OctagonStateTransitionPath *)self pathStep];
  v5 = +[NSString stringWithFormat:@"<OctagonStateTransitionPath: %@ %@", v3, v4];

  return v5;
}

- (OctagonStateTransitionPath)initWithState:(id)a3 pathStep:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OctagonStateTransitionPath;
  v9 = [(OctagonStateTransitionPath *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_initialState, a3);
    objc_storeStrong((id *)&v10->_pathStep, a4);
  }

  return v10;
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
        v11 = [[OctagonStateTransitionPath alloc] initWithState:v9 pathStep:v10];
LABEL_14:

        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v12 = [OctagonStateTransitionPath alloc];
        v13 = +[OctagonStateTransitionPathStep pathFromDictionary:v10];
        v11 = [(OctagonStateTransitionPath *)v12 initWithState:v9 pathStep:v13];

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

@end