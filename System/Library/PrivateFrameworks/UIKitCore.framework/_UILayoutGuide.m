@interface _UILayoutGuide
+ (id)_horizontalLayoutGuide;
+ (id)_verticalLayoutGuide;
+ (id)classFallbacksForKeyedArchiver;
- (BOOL)_allowsArchivingAsSubview;
- (BOOL)_isFloatingLayoutItem;
- (BOOL)isHorizontal;
- (NSArray)_constraintsToRemoveAtRuntime;
- (NSString)_archivedIdentifier;
- (_UILayoutGuide)initWithCoder:(id)a3;
- (_UILayoutGuide)initWithFrame:(CGRect)a3;
- (double)length;
- (id)_layoutVariablesWithAmbiguousValue;
- (void)_setAllowsArchivingAsSubview:(BOOL)a3;
- (void)_setArchivedIdentifier:(id)a3;
- (void)_setConstraintsToRemoveAtRuntime:(id)a3;
- (void)_setHorizontal:(BOOL)a3;
- (void)_setUpCounterDimensionConstraint;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UILayoutGuide

- (_UILayoutGuide)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILayoutGuide;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v4 = v3;
  if (v3)
  {
    *(void *)&v3->super._viewFlags |= 0x420000000000000uLL;
    [(CALayer *)[(UIView *)v3 layer] setHidden:1];
  }
  return v4;
}

+ (id)classFallbacksForKeyedArchiver
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = (objc_class *)objc_opt_class();
  v4[0] = NSStringFromClass(v2);
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
}

- (void)_setUpCounterDimensionConstraint
{
  if (self->_horizontal) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = 7;
  }
  v4 = +[_UILayoutSupportConstraint constraintWithItem:self attribute:v3 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
  LODWORD(v5) = 1148829696;
  [(_UILayoutSupportConstraint *)v4 setPriority:v5];
  [(_UILayoutSupportConstraint *)v4 setShouldBeArchived:1];
  [(UIView *)self addConstraint:v4];
}

+ (id)_verticalLayoutGuide
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  [v2 _setUpCounterDimensionConstraint];
  return v2;
}

+ (id)_horizontalLayoutGuide
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v3 = v2;
  if (v2)
  {
    v2[409] = 1;
    [v2 _setUpCounterDimensionConstraint];
  }
  return v3;
}

- (double)length
{
  if ([(UIView *)self _layoutEngine]) {
    [(UIView *)self _nsis_bounds];
  }
  else {
    [(UIView *)self bounds];
  }
  if (self->_horizontal) {
    return v3;
  }
  else {
    return v4;
  }
}

- (BOOL)_allowsArchivingAsSubview
{
  return self->_allowsArchivingAsSubview;
}

- (_UILayoutGuide)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UILayoutGuide;
  double v4 = -[UIView initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 containsValueForKey:@"_UILayoutGuideIsHorizontal"]) {
      v4->_horizontal = 1;
    }
    v4->_archivedIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"_UILayoutGuideIdentifier"), "copy");
    v4->_constraintsToRemoveAtRuntime = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"_UILayoutGuideConstraintsToRemove"), "copy");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UILayoutGuide;
  -[UIView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  if (self->_horizontal) {
    [a3 encodeBool:1 forKey:@"_UILayoutGuideIsHorizontal"];
  }
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILayoutGuide _archivedIdentifier](self, "_archivedIdentifier"), @"_UILayoutGuideIdentifier");
  objc_msgSend(a3, "encodeObject:forKey:", -[_UILayoutGuide _constraintsToRemoveAtRuntime](self, "_constraintsToRemoveAtRuntime"), @"_UILayoutGuideConstraintsToRemove");
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UILayoutGuide;
  [(UIView *)&v3 dealloc];
}

- (BOOL)_isFloatingLayoutItem
{
  return dyld_program_sdk_at_least();
}

- (id)_layoutVariablesWithAmbiguousValue
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_UILayoutGuide;
  id v3 = [(UIView *)&v6 _layoutVariablesWithAmbiguousValue];
  if (self->_horizontal) {
    id v4 = [(UIView *)self nsli_minYVariable];
  }
  else {
    id v4 = [(UIView *)self nsli_minXVariable];
  }
  v7[0] = v4;
  return (id)objc_msgSend(v3, "arrayByExcludingObjectsInArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1));
}

- (NSArray)_constraintsToRemoveAtRuntime
{
  return self->_constraintsToRemoveAtRuntime;
}

- (void)_setConstraintsToRemoveAtRuntime:(id)a3
{
}

- (void)_setAllowsArchivingAsSubview:(BOOL)a3
{
  self->_allowsArchivingAsSubview = a3;
}

- (NSString)_archivedIdentifier
{
  return self->_archivedIdentifier;
}

- (void)_setArchivedIdentifier:(id)a3
{
}

- (BOOL)isHorizontal
{
  return self->_horizontal;
}

- (void)_setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

@end