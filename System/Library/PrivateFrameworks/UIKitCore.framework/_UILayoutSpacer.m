@interface _UILayoutSpacer
+ (id)_horizontalLayoutSpacer;
+ (id)_verticalLayoutSpacer;
- (BOOL)_compatibilityGuideAllowsArchivingAsSubview;
- (BOOL)_isHorizontal;
- (NSArray)_constraintsToRemoveAtRuntime;
- (_UILayoutSpacer)initWithCoder:(id)a3;
- (double)length;
- (id)_layoutVariablesWithAmbiguousValue;
- (void)_setCompatibilityGuideAllowsArchivingAsSubview:(BOOL)a3;
- (void)_setConstraintsToRemoveAtRuntime:(id)a3;
- (void)_setHorizontal:(BOOL)a3;
- (void)_setUpCounterDimensionConstraint;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UILayoutSpacer

- (BOOL)_isHorizontal
{
  return self->_horizontal;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UILayoutSpacer;
  [(UILayoutGuide *)&v3 dealloc];
}

+ (id)_verticalLayoutSpacer
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  [v2 _setUpCounterDimensionConstraint];
  return v2;
}

- (void)_setUpCounterDimensionConstraint
{
  if (self->_horizontal) {
    uint64_t v2 = 8;
  }
  else {
    uint64_t v2 = 7;
  }
  objc_super v3 = +[_UILayoutSupportConstraint constraintWithItem:self attribute:v2 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
  LODWORD(v4) = 1148829696;
  [(_UILayoutSupportConstraint *)v3 setPriority:v4];
  [(_UILayoutSupportConstraint *)v3 setShouldBeArchived:1];
  [(_UILayoutSupportConstraint *)v3 setActive:1];
}

+ (id)_horizontalLayoutSpacer
{
  uint64_t v2 = objc_alloc_init((Class)objc_opt_class());
  objc_super v3 = v2;
  if (v2)
  {
    v2[225] = 1;
    [v2 _setUpCounterDimensionConstraint];
  }
  return v3;
}

- (double)length
{
  [(UILayoutGuide *)self layoutFrame];
  if (self->_horizontal) {
    return v3;
  }
  else {
    return v4;
  }
}

- (_UILayoutSpacer)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILayoutSpacer;
  double v4 = -[UILayoutGuide initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 containsValueForKey:@"_UILayoutSpacerIsHorizontal"]) {
      v4->_horizontal = 1;
    }
    v4->_constraintsToRemoveAtRuntime = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"_UILayoutSpacerConstraintsToRemove"), "copy");
    if ([a3 containsValueForKey:@"_UILayoutSpacerCompatibilityGuideAllowsArchivingAsSubview"])v4->_compatibilityGuideAllowsArchivingAsSubview = 1; {
  }
    }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UILayoutSpacer;
  -[UILayoutGuide encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (self->_horizontal) {
    [a3 encodeBool:1 forKey:@"_UILayoutSpacerIsHorizontal"];
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILayoutSpacer _constraintsToRemoveAtRuntime](self, "_constraintsToRemoveAtRuntime"), @"_UILayoutSpacerConstraintsToRemove");
  if (self->_compatibilityGuideAllowsArchivingAsSubview) {
    [a3 encodeBool:1 forKey:@"_UILayoutSpacerCompatibilityGuideAllowsArchivingAsSubview"];
  }
}

- (id)_layoutVariablesWithAmbiguousValue
{
  v6[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)_layoutVariablesWithAmbiguousValueForLayoutItem(self);
  if (self->_horizontal) {
    id v4 = [(UILayoutGuide *)self nsli_minYVariable];
  }
  else {
    id v4 = [(UILayoutGuide *)self nsli_minXVariable];
  }
  v6[0] = v4;
  return (id)objc_msgSend(v3, "arrayByExcludingObjectsInArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, 1));
}

- (NSArray)_constraintsToRemoveAtRuntime
{
  return self->_constraintsToRemoveAtRuntime;
}

- (void)_setConstraintsToRemoveAtRuntime:(id)a3
{
}

- (BOOL)_compatibilityGuideAllowsArchivingAsSubview
{
  return self->_compatibilityGuideAllowsArchivingAsSubview;
}

- (void)_setCompatibilityGuideAllowsArchivingAsSubview:(BOOL)a3
{
  self->_compatibilityGuideAllowsArchivingAsSubview = a3;
}

- (void)_setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

@end