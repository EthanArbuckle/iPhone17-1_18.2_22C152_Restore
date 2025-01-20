@interface _MFPlainTextBannerView
- (_MFPlainTextBannerView)initWithFrame:(CGRect)a3;
- (id)actionStringIsDownloading:(BOOL)a3;
@end

@implementation _MFPlainTextBannerView

- (_MFPlainTextBannerView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_MFPlainTextBannerView;
  v3 = -[MFHasMoreContentBannerView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MFSuggestionBannerView *)v3 banner];
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 localizedStringForKey:@"WAS_DOWNLOADED_AS_PLAIN" value:&stru_1F39E2A88 table:@"Main"];
    [v5 setTitle:v7];

    v8 = [(_MFPlainTextBannerView *)v4 actionStringIsDownloading:0];
    [v5 setActionTitle:v8];

    [v5 setActionButtonType:1];
    [(MFSuggestionBannerView *)v4 setBanner:v5];
  }
  return v4;
}

- (id)actionStringIsDownloading:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  v5 = v4;
  if (v3) {
    v6 = @"DOWNLOADING_FULL_MESSAGE";
  }
  else {
    v6 = @"DOWNLOAD_FULL_MESSAGE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_1F39E2A88 table:@"Main"];

  return v7;
}

@end