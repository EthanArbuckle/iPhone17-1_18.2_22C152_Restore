@interface PFXReviewWidgetQuestion2
- (BOOL)answersAreText;
- (NSArray)answers;
- (NSString)imageAccessibilityDescription;
- (NSString)titleAccessibilityDescription;
- (PFXReviewWidgetText2)title;
- (TSDImageInfo)imageInfo;
- (TSDInfoGeometry)dropAreaGeometry;
- (TSWPParagraphStyle)numberParagraphStyle;
- (int)contentRefPlacement;
- (int)type;
- (void)dealloc;
- (void)setAnswers:(id)a3;
- (void)setContentRefPlacement:(int)a3;
- (void)setDropAreaGeometry:(id)a3;
- (void)setImageAccessibilityDescription:(id)a3;
- (void)setImageInfo:(id)a3;
- (void)setNumberParagraphStyle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAccessibilityDescription:(id)a3;
- (void)setType:(int)a3;
@end

@implementation PFXReviewWidgetQuestion2

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXReviewWidgetQuestion2;
  [(PFXReviewWidgetQuestion2 *)&v3 dealloc];
}

- (BOOL)answersAreText
{
  if ([(NSArray *)self->_answers count])
  {
    [(NSArray *)self->_answers objectAtIndex:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFXReviewWidgetQuestion2 answersAreText]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/Readers/PFXReviewWidget.mm") lineNumber:184 description:@"PFXReviewWidget:: bad answer array"];
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (PFXReviewWidgetText2)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)titleAccessibilityDescription
{
  return self->_titleAccessibilityDescription;
}

- (void)setTitleAccessibilityDescription:(id)a3
{
}

- (TSDImageInfo)imageInfo
{
  return self->_imageInfo;
}

- (void)setImageInfo:(id)a3
{
}

- (NSString)imageAccessibilityDescription
{
  return self->_imageAccessibilityDescription;
}

- (void)setImageAccessibilityDescription:(id)a3
{
}

- (NSArray)answers
{
  return self->_answers;
}

- (void)setAnswers:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (int)contentRefPlacement
{
  return self->_contentRefPlacement;
}

- (void)setContentRefPlacement:(int)a3
{
  self->_contentRefPlacement = a3;
}

- (TSWPParagraphStyle)numberParagraphStyle
{
  return self->_numberParagraphStyle;
}

- (void)setNumberParagraphStyle:(id)a3
{
}

- (TSDInfoGeometry)dropAreaGeometry
{
  return self->_dropAreaGeometry;
}

- (void)setDropAreaGeometry:(id)a3
{
}

@end