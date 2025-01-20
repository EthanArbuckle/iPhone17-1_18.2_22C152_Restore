@interface _UIOverlayServiceInterfaceSpecification
+ (BSServiceInterface)interface;
+ (BSServiceQuality)serviceQuality;
+ (NSString)identifier;
@end

@implementation _UIOverlayServiceInterfaceSpecification

+ (NSString)identifier
{
  return (NSString *)@"com.apple.UIKit.OverlayUI.OverlayService";
}

+ (BSServiceInterface)interface
{
  if (qword_1EB261D70 != -1) {
    dispatch_once(&qword_1EB261D70, &__block_literal_global_373);
  }
  v2 = (void *)_MergedGlobals_1151;
  return (BSServiceInterface *)v2;
}

+ (BSServiceQuality)serviceQuality
{
  return (BSServiceQuality *)[MEMORY[0x1E4F628B0] userInitiated];
}

@end