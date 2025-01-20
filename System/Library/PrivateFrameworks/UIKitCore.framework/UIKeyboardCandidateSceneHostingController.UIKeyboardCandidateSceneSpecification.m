@interface UIKeyboardCandidateSceneHostingController.UIKeyboardCandidateSceneSpecification
- (_TtCE5UIKitCSo41UIKeyboardCandidateSceneHostingController37UIKeyboardCandidateSceneSpecification)init;
- (id)userActivity;
@end

@implementation UIKeyboardCandidateSceneHostingController.UIKeyboardCandidateSceneSpecification

- (id)userActivity
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4F29230]);
  v4 = self;
  v5 = (void *)sub_186A1E92C();
  id v6 = objc_msgSend(v3, sel_initWithActivityType_, v5);

  return v6;
}

- (_TtCE5UIKitCSo41UIKeyboardCandidateSceneHostingController37UIKeyboardCandidateSceneSpecification)init
{
  v3.receiver = self;
  v3.super_class = (Class)_s37UIKeyboardCandidateSceneSpecificationCMa();
  return [(UIKeyboardCandidateSceneHostingController.UIKeyboardCandidateSceneSpecification *)&v3 init];
}

@end