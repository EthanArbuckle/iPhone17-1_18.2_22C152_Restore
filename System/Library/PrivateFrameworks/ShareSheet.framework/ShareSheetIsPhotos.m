@interface ShareSheetIsPhotos
@end

@implementation ShareSheetIsPhotos

void ___ShareSheetIsPhotos_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"MobileSlideShow"];
  _ShareSheetIsPhotos_isPhotos = (char)v0;
}

@end