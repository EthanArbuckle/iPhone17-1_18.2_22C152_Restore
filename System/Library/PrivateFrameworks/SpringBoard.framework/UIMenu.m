@interface UIMenu
@end

@implementation UIMenu

Class __82__UIMenu_SBTopAffordanceViewControllerAdditions___supportsSurfacingSelectionState__block_invoke(uint64_t a1)
{
  char v1 = [*(id *)(a1 + 32) instancesRespondToSelector:sel__setSurfacesSelectionState_];
  Class result = NSClassFromString(&cfstr_Xctestcase.isa);
  if (result) {
    char v3 = 0;
  }
  else {
    char v3 = v1;
  }
  _supportsSurfacingSelectionState_supportsSurfacingSelectionState = v3;
  return result;
}

@end