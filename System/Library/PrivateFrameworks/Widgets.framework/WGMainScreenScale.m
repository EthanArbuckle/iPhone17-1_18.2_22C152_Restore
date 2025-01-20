@interface WGMainScreenScale
@end

@implementation WGMainScreenScale

void ___WGMainScreenScale_block_invoke()
{
  v0 = [MEMORY[0x263F1C920] mainScreen];
  [v0 scale];
  _WGMainScreenScale___mainScreenScale = v1;

  if (*(double *)&_WGMainScreenScale___mainScreenScale <= 0.0)
  {
    objc_msgSend(MEMORY[0x263F08690], "currentHandler", *(double *)&_WGMainScreenScale___mainScreenScale);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    v2 = [NSString stringWithUTF8String:"CGFloat _WGMainScreenScale(void)_block_invoke"];
    [v3 handleFailureInFunction:v2 file:@"WGUtilities.m" lineNumber:18 description:@"Failed to initialized main screen scale!"];
  }
}

@end