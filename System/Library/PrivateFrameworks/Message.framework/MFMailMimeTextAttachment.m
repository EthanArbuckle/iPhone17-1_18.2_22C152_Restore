@interface MFMailMimeTextAttachment
- (BOOL)shouldDownloadAttachmentOnDisplay;
@end

@implementation MFMailMimeTextAttachment

- (BOOL)shouldDownloadAttachmentOnDisplay
{
  if ([(MFMimeTextAttachment *)self hasBeenDownloaded]) {
    return 1;
  }
  v4 = +[MFNetworkController sharedInstance];
  int v5 = [v4 isOnWWAN];

  v6 = [(MFMimeTextAttachment *)self _displayedMimePart];
  unsigned int v7 = [v6 approximateRawSize];
  if (v5) {
    unsigned int v8 = 0x20000;
  }
  else {
    unsigned int v8 = 0x100000;
  }
  BOOL v3 = v7 < v8;

  return v3;
}

@end