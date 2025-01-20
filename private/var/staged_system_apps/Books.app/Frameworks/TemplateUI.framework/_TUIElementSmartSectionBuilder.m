@interface _TUIElementSmartSectionBuilder
- (BOOL)supportAdornmentWithRole:(unint64_t)a3 kind:(unint64_t)a4;
- (id)finalizeModels;
- (void)addModel:(id)a3;
- (void)finalizeModelsWithParent:(id)a3;
- (void)finalizeModelsWithParent:(id)a3 context:(id)a4;
@end

@implementation _TUIElementSmartSectionBuilder

- (void)addModel:(id)a3
{
  id v4 = a3;
  models = self->_models;
  id v8 = v4;
  if (!models)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_models;
    self->_models = v6;

    id v4 = v8;
    models = self->_models;
  }
  [(NSMutableArray *)models addObject:v4];
}

- (BOOL)supportAdornmentWithRole:(unint64_t)a3 kind:(unint64_t)a4
{
  if (a4) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = a3 - 3 >= 2;
  }
  return !v4;
}

- (id)finalizeModels
{
  return self->_models;
}

- (void)finalizeModelsWithParent:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = [(_TUIElementSmartSectionBuilder *)self finalizeModels];
  [v5 updateModelChildren:v6];
}

- (void)finalizeModelsWithParent:(id)a3
{
  id v4 = a3;
  id v5 = [(_TUIElementSmartSectionBuilder *)self finalizeModels];
  [v4 updateModelChildren:v5];
}

- (void).cxx_destruct
{
}

@end