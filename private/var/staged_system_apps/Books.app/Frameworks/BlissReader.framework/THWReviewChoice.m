@interface THWReviewChoice
- (NSString)accessibilityDescription;
- (NSString)contentType;
- (NSString)targetAccesibilityDescription;
- (TSDBezierPath)targetRegion;
- (TSUImage)contentImage;
- (TSWPStorage)contentStorage;
- (double)fraction;
- (id)content;
- (int)placardPlacement;
- (void)dealloc;
- (void)setAccessibilityDescription:(id)a3;
- (void)setContent:(id)a3;
- (void)setContentType:(id)a3;
- (void)setFraction:(double)a3;
- (void)setPlacardPlacement:(int)a3;
- (void)setTargetAccesibilityDescription:(id)a3;
- (void)setTargetRegion:(id)a3;
@end

@implementation THWReviewChoice

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewChoice;
  [(THWReviewChoice *)&v3 dealloc];
}

- (TSWPStorage)contentStorage
{
  objc_super v3 = [(THWReviewChoice *)self contentType];
  if (![(NSString *)v3 isEqualToString:TSWReviewChoiceDescriptionContentTypeTextValue]) {
    return 0;
  }
  objc_opt_class();
  [(THWReviewChoice *)self content];

  return (TSWPStorage *)TSUDynamicCast();
}

- (TSUImage)contentImage
{
  objc_super v3 = [(THWReviewChoice *)self contentType];
  if (![(NSString *)v3 isEqualToString:TSWReviewChoiceDescriptionContentTypeImageValue]) {
    return 0;
  }
  objc_opt_class();
  [(THWReviewChoice *)self content];
  uint64_t v4 = TSUDynamicCast();
  if (!v4) {
    return 0;
  }

  return (TSUImage *)+[TSDBitmapImageProvider TSUImageForImageData:v4];
}

- (void)setContent:(id)a3
{
  id content = self->_content;
  if (content != a3)
  {

    self->_id content = a3;
    objc_opt_class();
    v6 = (void *)TSUDynamicCast();
    if (v6)
    {
      v7 = v6;
      if (![v6 length])
      {
        [v7 insertString:@" " atCharIndex:0 undoTransaction:0];
      }
    }
  }
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (int)placardPlacement
{
  return self->_placardPlacement;
}

- (void)setPlacardPlacement:(int)a3
{
  self->_placardPlacement = a3;
}

- (TSDBezierPath)targetRegion
{
  return self->_targetRegion;
}

- (void)setTargetRegion:(id)a3
{
}

- (id)content
{
  return self->_content;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
}

- (NSString)targetAccesibilityDescription
{
  return self->_targetAccesibilityDescription;
}

- (void)setTargetAccesibilityDescription:(id)a3
{
}

@end