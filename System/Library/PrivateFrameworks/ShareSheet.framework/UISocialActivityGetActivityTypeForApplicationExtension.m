@interface UISocialActivityGetActivityTypeForApplicationExtension
@end

@implementation UISocialActivityGetActivityTypeForApplicationExtension

void ___UISocialActivityGetActivityTypeForApplicationExtension_block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.share.Twitter.post";
  v2[1] = @"com.apple.share.Facebook.post";
  v3[0] = @"com.apple.UIKit.activity.PostToTwitter";
  v3[1] = @"com.apple.UIKit.activity.PostToFacebook";
  v2[2] = @"com.apple.share.SinaWeibo.post";
  v2[3] = @"com.apple.share.TencentWeibo.post";
  v3[2] = @"com.apple.UIKit.activity.PostToWeibo";
  v3[3] = @"com.apple.UIKit.activity.TencentWeibo";
  v2[4] = @"com.apple.share.Flickr.post";
  v2[5] = @"com.apple.share.Vimeo.post";
  v3[4] = @"com.apple.UIKit.activity.PostToFlickr";
  v3[5] = @"com.apple.UIKit.activity.PostToVimeo";
  v2[6] = @"com.apple.reminders.sharingextension";
  v2[7] = @"com.apple.mobilenotes.SharingExtension";
  v3[6] = @"com.apple.reminders.sharingextension";
  v3[7] = @"com.apple.mobilenotes.SharingExtension";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)_UISocialActivityGetActivityTypeForApplicationExtension___activityTypesByApplicationExtensionIdentifiers;
  _UISocialActivityGetActivityTypeForApplicationExtension___activityTypesByApplicationExtensionIdentifiers = v0;
}

@end