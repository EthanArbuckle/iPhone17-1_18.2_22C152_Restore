@interface UIKeyboardCandidateSceneHostingController
- (BOOL)isExpanded;
- (UIKeyboardCandidateSceneHostingController)init;
- (UIKeyboardCandidateSceneHostingController)initWithDelegate:(id)a3;
- (void)setHostIsTextVertical:(BOOL)a3;
- (void)setupSceneHosting;
@end

@implementation UIKeyboardCandidateSceneHostingController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_sceneHostingController));
  sub_18596AE14((uint64_t)self + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_delegate);
  swift_bridgeObjectRelease();
}

- (UIKeyboardCandidateSceneHostingController)initWithDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_sceneHostingController) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___UIKeyboardCandidateSceneHostingController_sceneConfigurationObservables) = (Class)MEMORY[0x1E4FBC860];
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardCandidateSceneHostingController;
  swift_unknownObjectRetain();
  v4 = [(UIKeyboardCandidateSceneHostingController *)&v6 init];
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v4;
}

- (void)setupSceneHosting
{
  v2 = self;
  UIKeyboardCandidateSceneHostingController.setupSceneHosting()();
}

- (BOOL)isExpanded
{
  v2 = self;
  Swift::Bool v3 = UIKeyboardCandidateSceneHostingController.isExpanded()();

  return v3;
}

- (void)setHostIsTextVertical:(BOOL)a3
{
  v4 = self;
  UIKeyboardCandidateSceneHostingController.setHostIsTextVertical(_:)(a3);
}

- (UIKeyboardCandidateSceneHostingController)init
{
  result = (UIKeyboardCandidateSceneHostingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end