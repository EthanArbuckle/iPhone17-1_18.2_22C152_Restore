@interface UIComposeViewControllerIsAvailable
@end

@implementation UIComposeViewControllerIsAvailable

void ___UIComposeViewControllerIsAvailable_block_invoke()
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = @"com.apple.share.Twitter.post";
  v6[1] = @"com.apple.share.Facebook.post";
  v6[2] = @"com.apple.share.SinaWeibo.post";
  v6[3] = @"com.apple.share.TencentWeibo.post";
  v6[4] = @"com.apple.share.Flickr.post";
  v6[5] = @"com.apple.share.Vimeo.post";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_UIComposeViewControllerIsAvailable_legacySocialActivityTypes;
  _UIComposeViewControllerIsAvailable_legacySocialActivityTypes = v2;

  id v4 = objc_alloc_init(getSSVMediaSocialShareExtensionClass());
  v5 = (void *)_UIComposeViewControllerIsAvailable_mediaShareExtension;
  _UIComposeViewControllerIsAvailable_mediaShareExtension = (uint64_t)v4;
}

@end