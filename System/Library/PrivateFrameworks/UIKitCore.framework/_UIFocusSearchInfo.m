@interface _UIFocusSearchInfo
+ (id)defaultInfo;
- (BOOL)forceFocusToLeaveContainer;
- (BOOL)shouldIncludeFocusItem:(id)a3;
- (BOOL)treatFocusableItemAsLeaf;
- (_UIFocusSearchInfo)initWithFocusEvaluator:(id)a3;
- (id)evaluator;
- (void)setEvaluator:(id)a3;
- (void)setForceFocusToLeaveContainer:(BOOL)a3;
- (void)setTreatFocusableItemAsLeaf:(BOOL)a3;
@end

@implementation _UIFocusSearchInfo

+ (id)defaultInfo
{
  v2 = [[_UIFocusSearchInfo alloc] initWithFocusEvaluator:0];
  return v2;
}

- (_UIFocusSearchInfo)initWithFocusEvaluator:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusSearchInfo;
  v5 = [(_UIFocusSearchInfo *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_treatFocusableItemAsLeaf = 1;
    [(_UIFocusSearchInfo *)v5 setEvaluator:v4];
  }

  return v6;
}

- (BOOL)shouldIncludeFocusItem:(id)a3
{
  id v4 = a3;
  v5 = [(_UIFocusSearchInfo *)self evaluator];
  if (v5)
  {
    v6 = [(_UIFocusSearchInfo *)self evaluator];
    char v7 = ((uint64_t (**)(void, id))v6)[2](v6, v4);
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)treatFocusableItemAsLeaf
{
  return self->_treatFocusableItemAsLeaf;
}

- (void)setTreatFocusableItemAsLeaf:(BOOL)a3
{
  self->_treatFocusableItemAsLeaf = a3;
}

- (BOOL)forceFocusToLeaveContainer
{
  return self->_forceFocusToLeaveContainer;
}

- (void)setForceFocusToLeaveContainer:(BOOL)a3
{
  self->_forceFocusToLeaveContainer = a3;
}

- (id)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end