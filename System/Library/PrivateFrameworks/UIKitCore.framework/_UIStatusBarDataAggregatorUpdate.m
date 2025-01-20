@interface _UIStatusBarDataAggregatorUpdate
+ (id)updateWithEntry:(id)a3;
- (BOOL)animated;
- (_UIStatusBarDataEntry)entry;
- (void)setAnimated:(BOOL)a3;
- (void)setEntry:(id)a3;
@end

@implementation _UIStatusBarDataAggregatorUpdate

+ (id)updateWithEntry:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setEntry:v4];

  objc_msgSend(v5, "setAnimated:", +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"));
  return v5;
}

- (_UIStatusBarDataEntry)entry
{
  return self->_entry;
}

- (void)setEntry:(id)a3
{
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (void).cxx_destruct
{
}

@end