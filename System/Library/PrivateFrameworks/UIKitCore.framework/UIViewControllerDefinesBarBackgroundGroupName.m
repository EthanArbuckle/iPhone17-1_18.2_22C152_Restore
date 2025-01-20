@interface UIViewControllerDefinesBarBackgroundGroupName
@end

@implementation UIViewControllerDefinesBarBackgroundGroupName

void ___UIViewControllerDefinesBarBackgroundGroupName_block_invoke()
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.hulu.plus", @"com.chipotle.Chipotle", @"photo.glass.ios", @"com.apple.RealityComposer", @"com.yinzcam.49ersGamedayLive", @"com.barclaycardus.iphonesvc", @"com.secondhanding.WallaPop", 0);
  v0 = _UIMainBundleIdentifier();
  if ([v3 containsObject:v0])
  {
    char v1 = dyld_program_sdk_at_least();

    v2 = v3;
    if ((v1 & 1) == 0) {
      byte_1EB25BB2A = 1;
    }
  }
  else
  {

    v2 = v3;
  }
}

@end