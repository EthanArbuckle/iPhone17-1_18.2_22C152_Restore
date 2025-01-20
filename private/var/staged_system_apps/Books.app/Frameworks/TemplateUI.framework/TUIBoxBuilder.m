@interface TUIBoxBuilder
- (BOOL)containsSingleComponent;
- (NSArray)axActions;
- (id)finalizeAnimationGroups;
- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5;
- (unint64_t)checkContents:(id)a3;
- (void)addAnimationGroup:(id)a3 withName:(id)a4;
- (void)addModel:(id)a3;
- (void)finalizeModelsWithParent:(id)a3;
- (void)finalizeModelsWithParent:(id)a3 context:(id)a4;
- (void)setAXActions:(id)a3;
@end

@implementation TUIBoxBuilder

- (void)addModel:(id)a3
{
  id v4 = a3;
  contents = self->_contents;
  id v8 = v4;
  if (!contents)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_contents;
    self->_contents = v6;

    id v4 = v8;
    contents = self->_contents;
  }
  [(NSMutableArray *)contents addObject:v4];
}

- (unint64_t)checkContents:(id)a3
{
  return 0;
}

- (BOOL)containsSingleComponent
{
  if ([(NSMutableArray *)self->_contents count] == (char *)&def_141F14 + 1)
  {
    v3 = [(NSMutableArray *)self->_contents firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)finalizeModelsWithParent:(id)a3 box:(id)a4 context:(id)a5
{
  id v8 = a5;
  contents = self->_contents;
  id v10 = a4;
  id v11 = a3;
  unint64_t v12 = [(TUIBoxBuilder *)self checkContents:contents];
  if (v12) {
    [v8 reportError:v12];
  }
  v13 = self->_contents;
  v14 = self->_contents;
  self->_contents = 0;

  [v11 updateModelChildren:v13];
  [v10 setAxCustomActions:self->_axActions];
  v15 = [(TUIBoxBuilder *)self finalizeAnimationGroups];
  [v10 setAnimationGroups:v15];

  return v13;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = TUIDynamicCast(v7, v10);
  id v9 = [(TUIBoxBuilder *)self finalizeModelsWithParent:v10 box:v8 context:v6];
}

- (void)finalizeModelsWithParent:(id)a3
{
  contents = self->_contents;
  self->_contents = 0;
  v5 = contents;
  id v6 = a3;

  [v6 updateModelChildren:v5];
}

- (void)addAnimationGroup:(id)a3 withName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  animations = self->_animations;
  if (!animations)
  {
    id v8 = (NSMutableDictionary *)objc_opt_new();
    id v9 = self->_animations;
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
  objc_storeStrong((id *)&self->_axActions, 0);
  objc_storeStrong((id *)&self->_animations, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

@end