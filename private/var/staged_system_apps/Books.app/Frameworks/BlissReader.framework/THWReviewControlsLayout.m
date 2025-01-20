@interface THWReviewControlsLayout
- (CGRect)checkAnswerButtonFrame;
- (CGRect)nextButtonFrame;
- (CGRect)prevButtonFrame;
- (Class)repClassOverride;
- (NSString)buttonFontName;
- (THWButtonControlLayout)checkAnswerButton;
- (THWButtonControlLayout)nextButton;
- (THWButtonControlLayout)prevButton;
- (THWReviewControlsLayout)init;
- (THWReviewControlsLayout)initWithDelegate:(id)a3;
- (THWReviewControlsLayoutDelegate)delegate;
- (TSUColor)disabledPrimaryColor;
- (TSUColor)primaryColor;
- (double)buttonCornerRadius;
- (double)buttonFontSize;
- (double)buttonStrokeWidth;
- (id)additionalLayouts;
- (id)dependentLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (unint64_t)index;
- (unint64_t)tag;
- (void)dealloc;
- (void)setIndex:(unint64_t)a3;
- (void)setTag:(unint64_t)a3;
- (void)updateChildrenFromInfo;
- (void)validate;
@end

@implementation THWReviewControlsLayout

- (THWReviewControlsLayout)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewControlsLayout;
  result = [(THWReviewControlsLayout *)&v5 initWithInfo:0];
  if (result) {
    result->_delegate = (THWReviewControlsLayoutDelegate *)a3;
  }
  return result;
}

- (THWReviewControlsLayout)init
{
  return [(THWReviewControlsLayout *)self initWithDelegate:0];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewControlsLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (CGRect)prevButtonFrame
{
  double v2 = 0.0;
  double v3 = 2.0;
  double v4 = 31.0;
  double v5 = 31.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)nextButtonFrame
{
  [self geometry].frame;
  double v3 = v2 + -31.0;
  double v4 = 2.0;
  double v5 = 31.0;
  double v6 = 31.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)checkAnswerButtonFrame
{
  [self geometry].frame
  TSURound();
  double v3 = 107.0;
  double v4 = 2.0;
  double v5 = 31.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v4;
  result.origin.x = v2;
  return result;
}

- (double)buttonCornerRadius
{
  return 3.0;
}

- (double)buttonStrokeWidth
{
  return 1.0;
}

- (NSString)buttonFontName
{
  id v2 = +[TSUFont systemFontOfSize:12.0];

  return (NSString *)[v2 fontName];
}

- (double)buttonFontSize
{
  return 12.0;
}

- (TSUColor)primaryColor
{
  return (TSUColor *)[(THWReviewControlsLayoutDelegate *)self->_delegate primaryColor];
}

- (TSUColor)disabledPrimaryColor
{
  return (TSUColor *)[(THWReviewControlsLayoutDelegate *)self->_delegate disabledPrimaryColor];
}

- (void)updateChildrenFromInfo
{
  if (!self->_prevButton)
  {
    double v3 = objc_alloc_init(THWButtonControlLayout);
    self->_prevButton = v3;
    [(THWControlLayout *)v3 setTag:0];
  }
  if (!self->_nextButton)
  {
    double v4 = objc_alloc_init(THWButtonControlLayout);
    self->_nextButton = v4;
    [(THWControlLayout *)v4 setTag:1];
  }
  if (!self->_checkAnswerButton)
  {
    double v5 = objc_alloc_init(THWButtonControlLayout);
    self->_checkAnswerButton = v5;
    [(THWControlLayout *)v5 setTag:2];
  }
  v6.receiver = self;
  v6.super_class = (Class)THWReviewControlsLayout;
  [(THWContainerLayout *)&v6 updateChildrenFromInfo];
}

- (id)dependentLayouts
{
  double v3 = +[NSMutableArray arrayWithArray:[(THWReviewControlsLayout *)self children]];
  v5.receiver = self;
  v5.super_class = (Class)THWReviewControlsLayout;
  [(NSMutableArray *)v3 addObjectsFromArray:[(THWReviewControlsLayout *)&v5 dependentLayouts]];
  return v3;
}

- (void)validate
{
  [(THWReviewControlsLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THWReviewControlsLayout;
  [(THWReviewControlsLayout *)&v3 validate];
}

- (id)additionalLayouts
{
  id v3 = +[NSMutableArray array];
  double v4 = v3;
  if (self->_prevButton) {
    [v3 addObject:];
  }
  if (self->_nextButton) {
    [v4 addObject:];
  }
  if (self->_checkAnswerButton) {
    [v4 addObject:];
  }
  return v4;
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v4 = (void *)TSUProtocolCast();
  if (!v4) {
    return 0;
  }
  objc_super v5 = (char *)[v4 tag];
  if (v5 == (unsigned char *)&dword_0 + 2)
  {
    id v6 = objc_alloc((Class)TSDLayoutGeometry);
    [(THWReviewControlsLayout *)self checkAnswerButtonFrame];
    goto LABEL_9;
  }
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    id v6 = objc_alloc((Class)TSDLayoutGeometry);
    [(THWReviewControlsLayout *)self nextButtonFrame];
    goto LABEL_9;
  }
  if (v5) {
    return 0;
  }
  id v6 = objc_alloc((Class)TSDLayoutGeometry);
  [(THWReviewControlsLayout *)self prevButtonFrame];
LABEL_9:
  id v8 = [v6 initWithFrame:];

  return v8;
}

- (unint64_t)tag
{
  return self->tag;
}

- (void)setTag:(unint64_t)a3
{
  self->tag = a3;
}

- (unint64_t)index
{
  return self->index;
}

- (void)setIndex:(unint64_t)a3
{
  self->index = a3;
}

- (THWButtonControlLayout)prevButton
{
  return self->_prevButton;
}

- (THWButtonControlLayout)nextButton
{
  return self->_nextButton;
}

- (THWButtonControlLayout)checkAnswerButton
{
  return self->_checkAnswerButton;
}

- (THWReviewControlsLayoutDelegate)delegate
{
  return self->_delegate;
}

@end