@interface _UIFocusRegionContainerProxy
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isEligibleForFocusOcclusion;
- (BOOL)_ui_isUIFocusRegionContainerProxy;
- (BOOL)allowsLazyLoading;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldCreateRegionForGuideBehavior;
- (BOOL)shouldCreateRegionForOwningItem;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)_clippingRectInCoordinateSpace:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (UIFocusEnvironment)owningEnvironment;
- (UIFocusEnvironment)parentFocusEnvironment;
- (_UIFocusEnvironmentContainerTuple)environmentContainer;
- (_UIFocusRegionContainerProxy)initWithEnvironmentContainer:(id)a3;
- (_UIFocusRegionContainerProxy)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4;
- (id)_focusSystem;
- (id)_itemContainer;
- (id)_preferredFocusRegionCoordinateSpace;
- (unint64_t)hash;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_searchForFocusRegionsInContext:(id)a3;
- (void)setAllowsLazyLoading:(BOOL)a3;
- (void)setEnvironmentContainer:(id)a3;
- (void)setNeedsFocusUpdate;
- (void)setShouldCreateRegionForGuideBehavior:(BOOL)a3;
- (void)setShouldCreateRegionForOwningItem:(BOOL)a3;
- (void)updateFocusIfNeeded;
@end

@implementation _UIFocusRegionContainerProxy

- (_UIFocusRegionContainerProxy)initWithOwningEnvironment:(id)a3 itemContainer:(id)a4
{
  v5 = +[_UIFocusEnvironmentContainerTuple tupleWithOwningEnvironment:a3 itemContainer:a4];
  v6 = [(_UIFocusRegionContainerProxy *)self initWithEnvironmentContainer:v5];

  return v6;
}

- (_UIFocusRegionContainerProxy)initWithEnvironmentContainer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIFocusRegionContainerProxy.m", 40, @"Invalid parameter not satisfying: %@", @"environmentContainer != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UIFocusRegionContainerProxy;
  v7 = [(_UIFocusRegionContainerProxy *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_environmentContainer, a3);
    *(_WORD *)&v8->_allowsLazyLoading = 257;
    v8->_shouldCreateRegionForGuideBehavior = 1;
  }

  return v8;
}

- (BOOL)_ui_isUIFocusRegionContainerProxy
{
  return 1;
}

- (id)_focusSystem
{
  return +[UIFocusSystem focusSystemForEnvironment:self];
}

- (UIFocusEnvironment)owningEnvironment
{
  return [(_UIFocusEnvironmentContainerTuple *)self->_environmentContainer owningEnvironment];
}

- (id)_itemContainer
{
  return [(_UIFocusEnvironmentContainerTuple *)self->_environmentContainer itemContainer];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v5 = v4;
  BOOL v6 = v4
    && objc_msgSend(v4, "_ui_isUIFocusRegionContainerProxy")
    && [(_UIFocusEnvironmentContainerTuple *)self->_environmentContainer isEqualToEnvironmentContainerTuple:v5[2]];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(_UIFocusRegionContainerProxy *)self environmentContainer];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = [(_UIFocusEnvironmentContainerTuple *)self->_environmentContainer itemContainer];
  if (v4)
  {
    v5 = NSString;
    BOOL v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = [v5 stringWithFormat:@"<%@: %p>", v7, v4];
  }
  else
  {
    v8 = @"(nil)";
  }
  v9 = [(_UIFocusEnvironmentContainerTuple *)self->_environmentContainer owningEnvironment];
  if (v9)
  {
    v10 = NSString;
    objc_super v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v13 = [v10 stringWithFormat:@"<%@: %p>", v12, v9];
  }
  else
  {
    v13 = @"(nil)";
  }
  objc_msgSend(v3, "stringWithFormat:", @"<UIFocusRegionContainer: %p; focusItemContainer: %@; owningEnvironment: %@>",
    self,
    v8,
  v14 = v13);

  return (NSString *)v14;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  unint64_t v3 = _UIFocusEnvironmentPreferredFocusEnvironments(v2);

  return (NSArray *)v3;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  if (_UIFocusEnvironmentIsViewOrViewControllerOrRespondsToSelector(v5)) {
    char v6 = [v5 shouldUpdateFocusInContext:v4];
  }
  else {
    char v6 = 1;
  }

  return v6;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  v5 = +[UIFocusSystem focusSystemForEnvironment:v6];
  [v5 _notifyEnvironment:v6 didUpdateFocusInContext:v4];
}

- (void)setNeedsFocusUpdate
{
  id v4 = [(_UIFocusRegionContainerProxy *)self _focusSystem];
  unint64_t v3 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  [v4 requestFocusUpdateToEnvironment:v3];
}

- (void)updateFocusIfNeeded
{
  id v2 = [(_UIFocusRegionContainerProxy *)self _focusSystem];
  [v2 updateFocusIfNeeded];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  id v2 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [v2 parentFocusEnvironment];
  }
  id v4 = v3;

  return (UIFocusEnvironment *)v4;
}

- (CGRect)_clippingRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  v5 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  if (objc_opt_respondsToSelector())
  {
    [v5 _clippingRectInCoordinateSpace:v4];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)_isEligibleForFocusInteraction
{
  id v2 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  char IsEligibleForFocusInteraction = _UIFocusEnvironmentIsEligibleForFocusInteraction(v2);

  return IsEligibleForFocusInteraction;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  id v2 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  char IsEligibleForFocusOcclusion = _UIFocusEnvironmentIsEligibleForFocusOcclusion(v2, 0);

  return IsEligibleForFocusOcclusion;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  id v2 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  id v3 = +[UIFocusSystem focusSystemForEnvironment:v2];
  id v4 = v3;
  if (!v3) {
    id v3 = v2;
  }
  v5 = [v3 focusItemContainer];
  double v6 = [v5 coordinateSpace];

  return v6;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIFocusRegionContainerProxy *)self shouldCreateRegionForOwningItem];
  BOOL v6 = [(_UIFocusRegionContainerProxy *)self allowsLazyLoading];
  BOOL v7 = [(_UIFocusRegionContainerProxy *)self shouldCreateRegionForGuideBehavior];
  double v8 = [(_UIFocusRegionContainerProxy *)self owningEnvironment];
  id v11 = v8;
  int v9 = 0x10000;
  if (!v7) {
    int v9 = 0;
  }
  int v10 = 256;
  if (!v6) {
    int v10 = 0;
  }
  _UIFocusRegionSearchContextSearchForFocusRegionsInEnvironment(v4, v8, v10 | v5 | v9);
}

- (BOOL)allowsLazyLoading
{
  return self->_allowsLazyLoading;
}

- (void)setAllowsLazyLoading:(BOOL)a3
{
  self->_allowsLazyLoading = a3;
}

- (BOOL)shouldCreateRegionForOwningItem
{
  return self->_shouldCreateRegionForOwningItem;
}

- (void)setShouldCreateRegionForOwningItem:(BOOL)a3
{
  self->_shouldCreateRegionForOwningItem = a3;
}

- (BOOL)shouldCreateRegionForGuideBehavior
{
  return self->_shouldCreateRegionForGuideBehavior;
}

- (void)setShouldCreateRegionForGuideBehavior:(BOOL)a3
{
  self->_shouldCreateRegionForGuideBehavior = a3;
}

- (_UIFocusEnvironmentContainerTuple)environmentContainer
{
  return self->_environmentContainer;
}

- (void)setEnvironmentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end