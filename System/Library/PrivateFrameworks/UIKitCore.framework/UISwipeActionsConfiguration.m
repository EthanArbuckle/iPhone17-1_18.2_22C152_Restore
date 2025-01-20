@interface UISwipeActionsConfiguration
+ (UISwipeActionsConfiguration)configurationWithActions:(NSArray *)actions;
- (BOOL)_autosizesButtons;
- (BOOL)performsFirstActionWithFullSwipe;
- (NSArray)actions;
- (UISwipeActionsConfiguration)init;
- (double)_roundedStyleCornerRadius;
- (id)description;
- (int64_t)_swipeActionsStyle;
- (void)_setAutosizesButtons:(BOOL)a3;
- (void)_setRoundedStyleCornerRadius:(double)a3;
- (void)_setSwipeActionsStyle:(int64_t)a3;
- (void)setPerformsFirstActionWithFullSwipe:(BOOL)performsFirstActionWithFullSwipe;
@end

@implementation UISwipeActionsConfiguration

+ (UISwipeActionsConfiguration)configurationWithActions:(NSArray *)actions
{
  v4 = actions;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[2];
  v5[2] = v4;

  return (UISwipeActionsConfiguration *)v5;
}

- (UISwipeActionsConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)UISwipeActionsConfiguration;
  v2 = [(UISwipeActionsConfiguration *)&v4 init];
  [(UISwipeActionsConfiguration *)v2 _setAutosizesButtons:1];
  [(UISwipeActionsConfiguration *)v2 setPerformsFirstActionWithFullSwipe:1];
  return v2;
}

- (id)description
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel_actions);
  v8[0] = v3;
  objc_super v4 = NSStringFromSelector(sel_performsFirstActionWithFullSwipe);
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  v6 = +[UIDescriptionBuilder descriptionForObject:self keys:v5];

  return v6;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)performsFirstActionWithFullSwipe
{
  return self->_performsFirstActionWithFullSwipe;
}

- (void)setPerformsFirstActionWithFullSwipe:(BOOL)performsFirstActionWithFullSwipe
{
  self->_performsFirstActionWithFullSwipe = performsFirstActionWithFullSwipe;
}

- (BOOL)_autosizesButtons
{
  return self->_autosizesButtons;
}

- (void)_setAutosizesButtons:(BOOL)a3
{
  self->_autosizesButtons = a3;
}

- (int64_t)_swipeActionsStyle
{
  return self->__swipeActionsStyle;
}

- (void)_setSwipeActionsStyle:(int64_t)a3
{
  self->__swipeActionsStyle = a3;
}

- (double)_roundedStyleCornerRadius
{
  return self->__roundedStyleCornerRadius;
}

- (void)_setRoundedStyleCornerRadius:(double)a3
{
  self->__roundedStyleCornerRadius = a3;
}

- (void).cxx_destruct
{
}

@end