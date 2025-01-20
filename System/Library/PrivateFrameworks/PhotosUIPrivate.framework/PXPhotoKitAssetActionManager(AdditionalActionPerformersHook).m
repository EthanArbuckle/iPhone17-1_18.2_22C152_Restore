@interface PXPhotoKitAssetActionManager(AdditionalActionPerformersHook)
- (uint64_t)px_registerAdditionalPerformerClasses;
@end

@implementation PXPhotoKitAssetActionManager(AdditionalActionPerformersHook)

- (uint64_t)px_registerAdditionalPerformerClasses
{
  v3.receiver = a1;
  v3.super_class = (Class)&off_1F08D1BC8;
  objc_msgSendSuper2(&v3, sel_px_registerAdditionalPerformerClasses);
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90D70]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90D88]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C50]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C58]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90D28]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90D68]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C70]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C90]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C88]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C80]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C78]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C08]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C18]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C40]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90C10]];
  [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90CB8]];
  return [a1 registerPerformerClass:objc_opt_class() forType:*MEMORY[0x1E4F90CF0]];
}

@end