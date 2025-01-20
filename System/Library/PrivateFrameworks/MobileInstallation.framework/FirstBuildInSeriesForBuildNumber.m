@interface FirstBuildInSeriesForBuildNumber
@end

@implementation FirstBuildInSeriesForBuildNumber

uint64_t ___FirstBuildInSeriesForBuildNumber_block_invoke()
{
  _FirstBuildInSeriesForBuildNumber_uppercaseEnglishCharacterSet = objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithRange:", 65, 26);
  return MEMORY[0x1F41817F8]();
}

@end