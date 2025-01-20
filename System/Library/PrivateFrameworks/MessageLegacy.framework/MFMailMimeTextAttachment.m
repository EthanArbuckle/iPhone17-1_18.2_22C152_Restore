@interface MFMailMimeTextAttachment
- (BOOL)shouldDownloadAttachmentOnDisplay;
@end

@implementation MFMailMimeTextAttachment

- (BOOL)shouldDownloadAttachmentOnDisplay
{
  if ([(MFMimeTextAttachment *)self hasBeenDownloaded]) {
    return 1;
  }
  if ([+[MFNetworkController sharedInstance] isOnWWAN])
  {
    unsigned int v4 = 0x20000;
  }
  else
  {
    unsigned int v4 = 0x100000;
  }
  return objc_msgSend(-[MFMimeTextAttachment _displayedMimePart](self, "_displayedMimePart"), "approximateRawSize") < v4;
}

@end