@interface _UITab
- (BOOL)_isElement;
- (BOOL)_isUniquelySPI;
- (BOOL)_isVisible;
- (_UITabElementGroup)_parent;
- (id)_parentGroup;
- (int64_t)_attributes;
- (int64_t)_tabBarPlacement;
- (void)_setAttributes:(int64_t)a3;
- (void)_setTabBarPlacement:(int64_t)a3;
- (void)_setVisible:(BOOL)a3;
- (void)set_parent:(id)a3;
@end

@implementation _UITab

- (id)_parentGroup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  return WeakRetained;
}

- (void)_setVisible:(BOOL)a3
{
}

- (void)_setTabBarPlacement:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_186B93F68[a3];
  }
  [(UITab *)self setPreferredPlacement:v3];
}

- (void).cxx_destruct
{
}

- (BOOL)_isUniquelySPI
{
  return 1;
}

- (void)set_parent:(id)a3
{
}

- (BOOL)_isVisible
{
  return ![(UITab *)self isHidden];
}

- (int64_t)_tabBarPlacement
{
  int64_t v2 = [(UITab *)self preferredPlacement];
  if ((unint64_t)(v2 - 1) > 5) {
    return -1;
  }
  else {
    return qword_186B93F38[v2 - 1];
  }
}

- (void)_setAttributes:(int64_t)a3
{
  if (self->__attributes != a3)
  {
    char v3 = a3;
    self->__attributes = a3;
    if ((a3 & 2) != 0) {
      [(_UITab *)self _setTabBarPlacement:4];
    }
    if ((v3 & 4) != 0) {
      [(UITab *)self setSpringLoaded:1];
    }
    [(UITab *)self _contentDidChange];
  }
}

- (BOOL)_isElement
{
  return 0;
}

- (_UITabElementGroup)_parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__parent);
  return (_UITabElementGroup *)WeakRetained;
}

- (int64_t)_attributes
{
  return self->__attributes;
}

@end