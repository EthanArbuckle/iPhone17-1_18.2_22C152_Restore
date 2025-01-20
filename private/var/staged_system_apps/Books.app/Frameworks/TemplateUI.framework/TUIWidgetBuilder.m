@interface TUIWidgetBuilder
- (NSArray)axActions;
- (id)finalizeAnimationGroups;
- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5;
- (id)finalizeWidgetWithParent:(id)a3;
- (void)addAnimationGroup:(id)a3 withName:(id)a4;
- (void)addModel:(id)a3;
- (void)addWidgetData:(id)a3 withKey:(id)a4;
- (void)configureWithChildNode:(id)a3 attributes:(id)a4;
- (void)setAXActions:(id)a3;
@end

@implementation TUIWidgetBuilder

- (void)configureWithChildNode:(id)a3 attributes:(id)a4
{
  v5 = [a4 stringForAttribute:137 node:a3.var0];
  key = self->_key;
  self->_key = v5;
}

- (void)addWidgetData:(id)a3 withKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  data = self->_data;
  if (!data)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_data;
    self->_data = v8;

    data = self->_data;
  }
  [(NSMutableDictionary *)data setObject:v10 forKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_models setObject:0 forKeyedSubscript:v6];
}

- (id)finalizeWidgetWithParent:(id)a3
{
  id v4 = a3;
  models = self->_models;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_127F2C;
  v10[3] = &unk_255C78;
  id v6 = v4;
  id v11 = v6;
  [(NSMutableDictionary *)models enumerateKeysAndObjectsUsingBlock:v10];
  data = self->_data;
  if (data) {
    id v8 = [(NSMutableDictionary *)data copy];
  }
  else {
    id v8 = &__NSDictionary0__struct;
  }

  return v8;
}

- (void)addModel:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    id v8 = v4;
    -[TUIWidgetBuilder addWidgetData:withKey:](self, "addWidgetData:withKey:", v4);
    models = self->_models;
    if (!models)
    {
      id v6 = (NSMutableDictionary *)objc_opt_new();
      v7 = self->_models;
      self->_models = v6;

      models = self->_models;
    }
    [(NSMutableDictionary *)models setObject:v8 forKeyedSubscript:self->_key];
    id v4 = v8;
  }
}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  return 0;
}

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    id v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_animations;
    self->_animations = v8;

    animations = self->_animations;
  }
  [(NSMutableDictionary *)animations setObject:v10 forKeyedSubscript:v6];
}

- (id)finalizeAnimationGroups
{
  if ([(NSMutableDictionary *)self->_animations count])
  {
    v3 = objc_alloc_init(TUIAnimationGroupCollection);
    [(TUIAnimationGroupCollection *)v3 setGroups:self->_animations];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSArray)axActions
{
  return self->_axActions;
}

- (void)setAXActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_axActions, 0);
  objc_storeStrong((id *)&self->_models, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end