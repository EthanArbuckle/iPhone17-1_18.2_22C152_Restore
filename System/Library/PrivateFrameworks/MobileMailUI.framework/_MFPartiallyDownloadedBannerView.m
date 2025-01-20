@interface _MFPartiallyDownloadedBannerView
- (BOOL)hasError;
- (_MFPartiallyDownloadedBannerView)initWithFrame:(CGRect)a3 remainingBytes:(unint64_t)a4;
- (id)_messageStringForBytes:(uint64_t)a1 isDownloading:(uint64_t)a2 hasError:;
- (id)actionStringIsDownloading:(BOOL)a3;
- (unint64_t)remainingBytes;
- (void)setHasError:(BOOL)a3;
- (void)setRemainingBytes:(unint64_t)a3;
- (void)updateBannerWithRemainingBytes:(unint64_t)a3 error:(id)a4;
@end

@implementation _MFPartiallyDownloadedBannerView

- (id)_messageStringForBytes:(uint64_t)a1 isDownloading:(uint64_t)a2 hasError:
{
  if (a1)
  {
    v3 = _EFLocalizedString();
    v4 = NSString;
    v5 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", a2);
    v6 = objc_msgSend(v4, "stringWithFormat:", v3, v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (_MFPartiallyDownloadedBannerView)initWithFrame:(CGRect)a3 remainingBytes:(unint64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_MFPartiallyDownloadedBannerView;
  v5 = -[MFHasMoreContentBannerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_remainingBytes = a4;
    v7 = [(MFSuggestionBannerView *)v5 banner];
    v8 = [MEMORY[0x1E4F28B50] mainBundle];
    v9 = [v8 localizedStringForKey:@"MESSAGE_PARTIALLY_DOWNLOADED" value:&stru_1F39E2A88 table:@"Main"];
    [v7 setTitle:v9];

    v10 = [(_MFPartiallyDownloadedBannerView *)v6 actionStringIsDownloading:0];
    [v7 setActionTitle:v10];

    [v7 setActionButtonType:1];
    [(MFSuggestionBannerView *)v6 setBanner:v7];
  }
  return v6;
}

- (id)actionStringIsDownloading:(BOOL)a3
{
  uint64_t v4 = [(_MFPartiallyDownloadedBannerView *)self remainingBytes];
  [(_MFPartiallyDownloadedBannerView *)self hasError];
  return -[_MFPartiallyDownloadedBannerView _messageStringForBytes:isDownloading:hasError:]((uint64_t)self, v4);
}

- (void)updateBannerWithRemainingBytes:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  [(_MFPartiallyDownloadedBannerView *)self setRemainingBytes:a3];
  [(_MFPartiallyDownloadedBannerView *)self setHasError:v6 != 0];
  v7.receiver = self;
  v7.super_class = (Class)_MFPartiallyDownloadedBannerView;
  [(MFHasMoreContentBannerView *)&v7 updateBannerWithRemainingBytes:a3 error:v6];
}

- (unint64_t)remainingBytes
{
  return self->_remainingBytes;
}

- (void)setRemainingBytes:(unint64_t)a3
{
  self->_remainingBytes = a3;
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

@end