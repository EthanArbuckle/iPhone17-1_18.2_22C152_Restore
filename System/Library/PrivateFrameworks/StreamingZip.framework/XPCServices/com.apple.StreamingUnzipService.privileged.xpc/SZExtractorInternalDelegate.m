@interface SZExtractorInternalDelegate
- (void)extractionCompleteAtArchivePath:(id)a3;
- (void)extractionEnteredPassThroughMode;
- (void)setExtractionProgress:(double)a3;
@end

@implementation SZExtractorInternalDelegate

- (void).cxx_destruct
{
}

- (void)extractionEnteredPassThroughMode
{
  if (self)
  {
    self = (SZExtractorInternalDelegate *)objc_loadWeakRetained((id *)&self->delegate);
    if (self)
    {
      v3 = self;
      if (objc_opt_respondsToSelector()) {
        [(SZExtractorInternalDelegate *)v3 extractionEnteredPassThroughMode];
      }
      self = v3;
    }
    uint64_t v2 = vars8;
  }
}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  id v4 = a3;
  if (self)
  {
    self = (SZExtractorInternalDelegate *)objc_loadWeakRetained((id *)&self->delegate);
    if (self)
    {
      if (objc_opt_respondsToSelector()) {
        [(SZExtractorInternalDelegate *)self extractionCompleteAtArchivePath:v4];
      }
    }
  }
}

- (void)setExtractionProgress:(double)a3
{
  if (self)
  {
    self = (SZExtractorInternalDelegate *)objc_loadWeakRetained((id *)&self->delegate);
    if (self)
    {
      v5 = self;
      if (objc_opt_respondsToSelector()) {
        [(SZExtractorInternalDelegate *)v5 setExtractionProgress:a3];
      }
      self = v5;
    }
    uint64_t v3 = vars8;
  }
}

@end