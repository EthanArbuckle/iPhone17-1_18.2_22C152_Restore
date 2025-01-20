@interface THDocumentReflowableLayoutConfiguration
- (BOOL)_manageSafeAreaInsets;
- (BOOL)allowsScrollMode;
- (CGPoint)pageNumberPosition;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)noteEdgeInsetsAtScale:(double)a3;
- (double)_contentInsetScrubberVerticalPadding;
- (double)_noteSideLengthAtScale:(double)a3;
- (double)chromeAnimationInterval;
- (double)noteSideLength;
- (double)scrubberLeftRightInset;
- (int64_t)columnCount;
@end

@implementation THDocumentReflowableLayoutConfiguration

- (BOOL)allowsScrollMode
{
  return 1;
}

- (double)chromeAnimationInterval
{
  return 0.15;
}

- (int64_t)columnCount
{
  if ([(THDocumentReflowableLayoutConfiguration *)self hasSpreadPages]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (CGPoint)pageNumberPosition
{
  id v2 = [(THDocumentReflowableLayoutConfiguration *)self bottomFullWidthToolbarFrame];

  _CGRectGetCenter(v2);
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)_manageSafeAreaInsets
{
  return 0;
}

- (UIEdgeInsets)contentInsets
{
  v16.receiver = self;
  v16.super_class = (Class)THDocumentReflowableLayoutConfiguration;
  [(THDocumentReflowableLayoutConfiguration *)&v16 contentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(THDocumentReflowableLayoutConfiguration *)self layout] != (char *)&dword_0 + 2)
  {
    [(THDocumentReflowableLayoutConfiguration *)self _contentInsetScrubberVerticalPadding];
    double v8 = v8 + v11;
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (double)scrubberLeftRightInset
{
  v9.receiver = self;
  v9.super_class = (Class)THDocumentReflowableLayoutConfiguration;
  [(THDocumentReflowableLayoutConfiguration *)&v9 scrubberLeftRightInset];
  double v4 = v3;
  if ([(THDocumentReflowableLayoutConfiguration *)self layout] == (char *)&dword_0 + 1)
  {
    [self environment].safeAreaInsets
    if (v5 >= v6) {
      double v7 = v5;
    }
    else {
      double v7 = v6;
    }
    return v4 + v7;
  }
  return v4;
}

- (double)_noteSideLengthAtScale:(double)a3
{
  +[AEAnnotationMarker imageSizeForScale:a3];
  return result;
}

- (double)noteSideLength
{
  [+[UIScreen mainScreen] scale];

  -[THDocumentReflowableLayoutConfiguration _noteSideLengthAtScale:](self, "_noteSideLengthAtScale:");
  return result;
}

- (UIEdgeInsets)noteEdgeInsetsAtScale:(double)a3
{
  [self environment].safeAreaInsets
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(THDocumentReflowableLayoutConfiguration *)self _noteSideLengthAtScale:a3];
  double v14 = v13;
  [(THDocumentReflowableLayoutConfiguration *)self gutterWidth];
  double v16 = ceil((v15 - v14) * 0.5);
  double v17 = v8 + v16;
  double v18 = v12 + v16;
  double v19 = v6;
  double v20 = v10;
  result.right = v18;
  result.bottom = v20;
  result.left = v17;
  result.top = v19;
  return result;
}

- (double)_contentInsetScrubberVerticalPadding
{
  unsigned int v2 = [self environment].isLandscape;
  double result = 20.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

@end