@interface AVPlayerViewController(VideosUIAdditions)
- (uint64_t)vui_allowInfoMetadataSubpanel;
- (uint64_t)vui_setAllowInfoMetadataSubpanel:()VideosUIAdditions;
@end

@implementation AVPlayerViewController(VideosUIAdditions)

- (uint64_t)vui_setAllowInfoMetadataSubpanel:()VideosUIAdditions
{
  uint64_t result = +[VUIUtilities isTVApp];
  if (result)
  {
    return [a1 setAllowInfoMetadataSubpanel:a3];
  }
  return result;
}

- (uint64_t)vui_allowInfoMetadataSubpanel
{
  if (!+[VUIUtilities isTVApp]) {
    return 1;
  }
  return [a1 allowInfoMetadataSubpanel];
}

@end