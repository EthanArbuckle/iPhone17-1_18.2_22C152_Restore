@interface _TUIElementSmartGridBuilder
- (BOOL)supportAdornmentWithRole:(unint64_t)a3 kind:(unint64_t)a4;
- (Class)builderClassForDynamicInstantiation;
- (NSDictionary)configuration;
- (id)finalizeContentsWithContext:(id)a3;
- (id)finalizeTriggers;
- (void)addAdornment:(id)a3;
- (void)addCellOrAdornment:(id)a3;
- (void)addConfiguration:(id)a3;
- (void)addSectionOrAdornment:(id)a3;
- (void)addTrigger:(id)a3 withBehavior:(id)a4;
- (void)finalizeModelsWithParent:(id)a3;
- (void)finalizeModelsWithParent:(id)a3 context:(id)a4;
@end

@implementation _TUIElementSmartGridBuilder

- (Class)builderClassForDynamicInstantiation
{
  return (Class)objc_opt_class();
}

- (void)addTrigger:(id)a3 withBehavior:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  actionsMap = self->_actionsMap;
  if (!actionsMap)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    v9 = self->_actionsMap;
    self->_actionsMap = v8;

    actionsMap = self->_actionsMap;
  }
  [(NSMutableDictionary *)actionsMap setObject:v6 forKeyedSubscript:v10];
}

- (id)finalizeTriggers
{
  v2 = [[TUIElementTriggerBehaviorMap alloc] initWithMap:self->_actionsMap];

  return v2;
}

- (void)addCellOrAdornment:(id)a3
{
  id v4 = a3;
  cellsAndAdornments = self->_cellsAndAdornments;
  id v8 = v4;
  if (!cellsAndAdornments)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_cellsAndAdornments;
    self->_cellsAndAdornments = v6;

    id v4 = v8;
    cellsAndAdornments = self->_cellsAndAdornments;
  }
  [(NSMutableArray *)cellsAndAdornments addObject:v4];
}

- (void)addSectionOrAdornment:(id)a3
{
  id v4 = a3;
  sectionsAndAdornments = self->_sectionsAndAdornments;
  id v8 = v4;
  if (!sectionsAndAdornments)
  {
    id v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_sectionsAndAdornments;
    self->_sectionsAndAdornments = v6;

    id v4 = v8;
    sectionsAndAdornments = self->_sectionsAndAdornments;
  }
  [(NSMutableArray *)sectionsAndAdornments addObject:v4];
}

- (void)addAdornment:(id)a3
{
  id v4 = a3;
  if ((char *)[v4 role] - 3 > (unsigned char *)&def_141F14 + 1) {
    [(_TUIElementSmartGridBuilder *)self addSectionOrAdornment:v4];
  }
  else {
    [(_TUIElementSmartGridBuilder *)self addCellOrAdornment:v4];
  }
}

- (BOOL)supportAdornmentWithRole:(unint64_t)a3 kind:(unint64_t)a4
{
  return a3 != 0;
}

- (id)finalizeContentsWithContext:(id)a3
{
  if ([(NSMutableArray *)self->_cellsAndAdornments count])
  {
    id v4 = objc_alloc_init(TUISectionModel);
    [(TUIModelContainer *)v4 updateModelChildren:self->_cellsAndAdornments];
    cellsAndAdornments = self->_cellsAndAdornments;
    self->_cellsAndAdornments = 0;

    sectionsAndAdornments = self->_sectionsAndAdornments;
    if (!sectionsAndAdornments)
    {
      v7 = (NSMutableArray *)objc_opt_new();
      id v8 = self->_sectionsAndAdornments;
      self->_sectionsAndAdornments = v7;

      sectionsAndAdornments = self->_sectionsAndAdornments;
    }
    [(NSMutableArray *)sectionsAndAdornments addObject:v4];
  }
  v9 = self->_sectionsAndAdornments;

  return v9;
}

- (void)addConfiguration:(id)a3
{
  id v4 = [a3 data];
  configuration = self->_configuration;
  self->_configuration = v4;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = [(_TUIElementSmartGridBuilder *)self finalizeContentsWithContext:a4];
  [v6 updateModelChildren:v7];
}

- (void)finalizeModelsWithParent:(id)a3
{
  id v4 = a3;
  id v5 = [(_TUIElementSmartGridBuilder *)self finalizeContentsWithContext:0];
  [v4 updateModelChildren:v5];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_sectionsAndAdornments, 0);
  objc_storeStrong((id *)&self->_cellsAndAdornments, 0);

  objc_storeStrong((id *)&self->_actionsMap, 0);
}

@end