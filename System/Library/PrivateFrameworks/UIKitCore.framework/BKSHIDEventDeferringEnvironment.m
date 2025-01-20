@interface BKSHIDEventDeferringEnvironment
@end

@implementation BKSHIDEventDeferringEnvironment

void __84__BKSHIDEventDeferringEnvironment_UIKitAdditions__ui_cameraCaptureButtonEnvironment__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F4F280] environmentWithIdentifier:@"cameraCaptureButton"];
  v1 = (void *)_MergedGlobals_1047;
  _MergedGlobals_1047 = v0;
}

void __97__BKSHIDEventDeferringEnvironment_UIKitAdditions_Internal__ui_systemKeyCommandOverlayEnvironment__block_invoke()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  uint64_t v0 = (void *)qword_1EB260710;
  uint64_t v8 = qword_1EB260710;
  if (!qword_1EB260710)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getSBSKeyboardFocusServiceClass_block_invoke;
    v4[3] = &unk_1E52D9900;
    v4[4] = &v5;
    __getSBSKeyboardFocusServiceClass_block_invoke((uint64_t)v4);
    uint64_t v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 systemKeyCommandOverlayEnvironment];
  v3 = (void *)qword_1EB260700;
  qword_1EB260700 = v2;
}

@end