@interface SBPIPContentViewLayoutContext
- (BOOL)hasSizeChanged;
- (NSString)contentTypeIdentifier;
- (SBPIPContentViewLayoutContext)initWithPlatformMetrics:(id)a3 contentSize:(CGSize)a4 defaults:(id)a5;
- (SBPIPDefaults)defaults;
- (double)currentAspectRatio;
- (double)currentSize;
- (double)maximumSizePreference;
- (double)maximumSizeSpanForPreferredSizeTuning;
- (double)minimumSizePreference;
- (double)minimumSizeSpanBetweenPreferredSizes;
- (void)setContentTypeIdentifier:(id)a3;
- (void)setCurrentAspectRatio:(double)a3;
- (void)setCurrentSize:(double)a3;
- (void)setCurrentSize:(double)a3 forAspectRatio:(double)a4;
- (void)setDefaults:(id)a3;
- (void)setMaximumSizePreference:(double)a3;
- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3;
- (void)setMinimumSizePreference:(double)a3;
- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3;
- (void)updatePlatformMetrics:(id)a3;
@end

@implementation SBPIPContentViewLayoutContext

- (SBPIPContentViewLayoutContext)initWithPlatformMetrics:(id)a3 contentSize:(CGSize)a4 defaults:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBPIPContentViewLayoutContext;
  v11 = [(SBPIPContentViewLayoutContext *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_sizeChanged = 0;
    v11->_minimumSizeSpanBetweenPreferredSizes = 0.0;
    v11->_maximumSizeSpanForPreferredSizeTuning = 0.0;
    objc_storeStrong((id *)&v11->_defaults, a5);
    v13 = [v9 contentTypeIdentifier];
    uint64_t v14 = [v13 copy];
    contentTypeIdentifier = v12->_contentTypeIdentifier;
    v12->_contentTypeIdentifier = (NSString *)v14;

    double v16 = 1.0;
    if (width != 0.0) {
      double v16 = width;
    }
    v12->_currentAspectRatio = height / v16;
    [(SBPIPContentViewLayoutContext *)v12 updatePlatformMetrics:v9];
  }

  return v12;
}

- (void)setCurrentSize:(double)a3 forAspectRatio:(double)a4
{
  if (self->_currentSize != a3)
  {
    self->_currentAspectRatio = a4;
    self->_currentSize = a3;
    self->_sizeChanged = 1;
    -[SBPIPDefaults setLastKnownSize:contentType:](self->_defaults, "setLastKnownSize:contentType:", self->_contentTypeIdentifier);
  }
}

- (void)updatePlatformMetrics:(id)a3
{
  id v15 = a3;
  v4 = [v15 contentTypeIdentifier];
  char v5 = [v4 isEqualToString:self->_contentTypeIdentifier];

  if ((v5 & 1) == 0)
  {
    v6 = [v15 contentTypeIdentifier];
    v7 = (NSString *)[v6 copy];
    contentTypeIdentifier = self->_contentTypeIdentifier;
    self->_contentTypeIdentifier = v7;
  }
  id v9 = [v15 sizePolicy];
  id v10 = [v9 sizePreferencesForAspectRatio:self->_currentAspectRatio];

  [(SBPIPDefaults *)self->_defaults lastKnownSizeForContentType:self->_contentTypeIdentifier];
  double v12 = v11;
  if (SBFloatEqualsFloat())
  {
    [v10 longSideDefaultSize];
    double v12 = v13;
  }
  self->_currentSize = v12;
  self->_minimumSizePreference = v12;
  [v10 longSideMaximumSize];
  self->_maximumSizePreference = v14;
}

- (double)currentAspectRatio
{
  return self->_currentAspectRatio;
}

- (void)setCurrentAspectRatio:(double)a3
{
  self->_currentAspectRatio = a3;
}

- (double)currentSize
{
  return self->_currentSize;
}

- (void)setCurrentSize:(double)a3
{
  self->_currentSize = a3;
}

- (BOOL)hasSizeChanged
{
  return self->_sizeChanged;
}

- (double)minimumSizePreference
{
  return self->_minimumSizePreference;
}

- (void)setMinimumSizePreference:(double)a3
{
  self->_minimumSizePreference = a3;
}

- (double)maximumSizePreference
{
  return self->_maximumSizePreference;
}

- (void)setMaximumSizePreference:(double)a3
{
  self->_maximumSizePreference = a3;
}

- (double)minimumSizeSpanBetweenPreferredSizes
{
  return self->_minimumSizeSpanBetweenPreferredSizes;
}

- (void)setMinimumSizeSpanBetweenPreferredSizes:(double)a3
{
  self->_minimumSizeSpanBetweenPreferredSizes = a3;
}

- (double)maximumSizeSpanForPreferredSizeTuning
{
  return self->_maximumSizeSpanForPreferredSizeTuning;
}

- (void)setMaximumSizeSpanForPreferredSizeTuning:(double)a3
{
  self->_maximumSizeSpanForPreferredSizeTuning = a3;
}

- (SBPIPDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSString)contentTypeIdentifier
{
  return self->_contentTypeIdentifier;
}

- (void)setContentTypeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end