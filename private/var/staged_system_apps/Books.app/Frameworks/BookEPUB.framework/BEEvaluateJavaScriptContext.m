@interface BEEvaluateJavaScriptContext
- (NSMutableArray)scriptKeyOrdered;
- (NSMutableDictionary)scripts;
- (NSMutableDictionary)transforms;
- (id)_jsonRepresentation;
- (id)_transformResults:(id)a3 error:(id)a4;
- (void)addScriptToEvaluate:(id)a3 key:(id)a4 transform:(id)a5;
- (void)setScriptKeyOrdered:(id)a3;
- (void)setScripts:(id)a3;
- (void)setTransforms:(id)a3;
@end

@implementation BEEvaluateJavaScriptContext

- (void)addScriptToEvaluate:(id)a3 key:(id)a4 transform:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v18 length])
  {
    if (!self->_scripts)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      scripts = self->_scripts;
      self->_scripts = v10;
    }
    if (!self->_scriptKeyOrdered)
    {
      v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      scriptKeyOrdered = self->_scriptKeyOrdered;
      self->_scriptKeyOrdered = v12;
    }
    if (!self->_transforms)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      transforms = self->_transforms;
      self->_transforms = v14;
    }
    [(NSMutableDictionary *)self->_scripts setObject:v18 forKeyedSubscript:v8];
    [(NSMutableArray *)self->_scriptKeyOrdered addObject:v8];
    if (v9)
    {
      id v16 = [v9 copy];
      id v17 = objc_retainBlock(v16);
      [(NSMutableDictionary *)self->_transforms setObject:v17 forKeyedSubscript:v8];
    }
  }
}

- (id)_jsonRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_scriptKeyOrdered;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_scripts objectForKeyedSubscript:v9];
        v11 = +[NSString stringWithFormat:@"%@: () => { return %@ }", v9, v10, (void)v14];
        [v3 addObject:v11];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v3 componentsJoinedByString:@","];

  return v12;
}

- (id)_transformResults:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_227FC;
  v13[3] = &unk_3C0D60;
  v13[4] = self;
  id v14 = v6;
  id v8 = (id)objc_opt_new();
  id v15 = v8;
  id v9 = v6;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  v10 = v15;
  id v11 = v8;

  return v11;
}

- (NSMutableDictionary)scripts
{
  return self->_scripts;
}

- (void)setScripts:(id)a3
{
}

- (NSMutableArray)scriptKeyOrdered
{
  return self->_scriptKeyOrdered;
}

- (void)setScriptKeyOrdered:(id)a3
{
}

- (NSMutableDictionary)transforms
{
  return self->_transforms;
}

- (void)setTransforms:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transforms, 0);
  objc_storeStrong((id *)&self->_scriptKeyOrdered, 0);

  objc_storeStrong((id *)&self->_scripts, 0);
}

@end