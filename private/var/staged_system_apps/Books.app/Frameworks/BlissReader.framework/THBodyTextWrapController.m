@interface THBodyTextWrapController
- (id)floatingDrawableLayoutsForTarget:(id)a3;
- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4;
@end

@implementation THBodyTextWrapController

- (id)floatingDrawableLayoutsForTarget:(id)a3
{
  objc_opt_class();
  id v3 = [(id)TSUDynamicCast() pageLayout];

  return [v3 floatingDrawableLayouts];
}

- (unint64_t)zOrderOfDrawable:(id)a3 forTarget:(id)a4
{
  objc_opt_class();
  id v5 = [[[TSUDynamicCast() parent] info] drawablesZOrder];

  return (unint64_t)[v5 zOrderOfDrawable:a3];
}

@end