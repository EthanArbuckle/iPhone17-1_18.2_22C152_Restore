@interface OZRigDropMenuTarget
+ (id)rigDropMenuTargetForRig:(void *)a3;
- (void)pasteToNewList;
- (void)pasteToNewSlider;
- (void)pasteToNewSwitch;
- (void)setRig:(void *)a3;
@end

@implementation OZRigDropMenuTarget

+ (id)rigDropMenuTargetForRig:(void *)a3
{
  v4 = (OZRigDropMenuTarget *)+[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance;
  if (!+[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance)
  {
    v4 = objc_alloc_init(OZRigDropMenuTarget);
    +[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance = (uint64_t)v4;
  }
  [(OZRigDropMenuTarget *)v4 setRig:a3];
  return (id)+[OZRigDropMenuTarget rigDropMenuTargetForRig:]::gpInstance;
}

- (void)setRig:(void *)a3
{
  self->_pRig = a3;
}

- (void)pasteToNewSwitch
{
}

- (void)pasteToNewList
{
}

- (void)pasteToNewSlider
{
}

@end