@interface TUIAdornmentModel
+ (unint64_t)adornmentKindFromString:(id)a3;
+ (unint64_t)adornmentRoleFromString:(id)a3;
- (TUIModel)submodel;
- (TUIModelContaining)parentModel;
- (unint64_t)modelKind;
- (unint64_t)role;
- (void)appendContainedChildrenToArray:(id)a3;
- (void)appendLayoutChildrenToArray:(id)a3;
- (void)appendLayoutModelsToArray:(id)a3;
- (void)onContainedModelsChanged;
- (void)setParentModel:(id)a3;
- (void)setRole:(unint64_t)a3;
- (void)updateModelChildren:(id)a3;
@end

@implementation TUIAdornmentModel

- (unint64_t)modelKind
{
  return 0;
}

- (void)appendLayoutChildrenToArray:(id)a3
{
}

- (void)appendLayoutModelsToArray:(id)a3
{
}

- (void)appendContainedChildrenToArray:(id)a3
{
  submodel = self->_submodel;
  if (submodel) {
    [a3 addObject:submodel];
  }
}

- (void)onContainedModelsChanged
{
  id v2 = [(TUIAdornmentModel *)self parentModel];
  [v2 onContainedModelsChanged];
}

- (void)updateModelChildren:(id)a3
{
  uint64_t v4 = [a3 firstObject];
  submodel = self->_submodel;
  id obj = (id)v4;
  if ((TUIModel *)v4 != submodel)
  {
    [(TUIModel *)submodel setParentModel:0];
    objc_storeStrong((id *)&self->_submodel, obj);
    [(TUIModel *)self->_submodel setParentModel:self];
    [(TUIAdornmentModel *)self onContainedModelsChanged];
  }
}

+ (unint64_t)adornmentRoleFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (qword_2DF868 != -1)
  {
    dispatch_once(&qword_2DF868, &stru_2564F8);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF860 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)adornmentKindFromString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (qword_2DF878 != -1)
  {
    dispatch_once(&qword_2DF878, &stru_256518);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF870 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (TUIModelContaining)parentModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentModel);

  return (TUIModelContaining *)WeakRetained;
}

- (void)setParentModel:(id)a3
{
}

- (unint64_t)role
{
  return self->_role;
}

- (void)setRole:(unint64_t)a3
{
  self->_role = a3;
}

- (TUIModel)submodel
{
  return self->_submodel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodel, 0);

  objc_destroyWeak((id *)&self->_parentModel);
}

@end