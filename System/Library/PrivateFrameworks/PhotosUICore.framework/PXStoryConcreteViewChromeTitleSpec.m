@interface PXStoryConcreteViewChromeTitleSpec
- (BOOL)hidden;
- (PXStoryConcreteViewChromeTitleSpec)init;
- (PXStoryConcreteViewChromeTitleSpec)initWithNumberOfTitleLines:(int64_t)a3 numberOfSubtitleLines:(int64_t)a4 configuration:(id)a5;
- (UIEdgeInsets)margins;
- (int64_t)numberOfSubtitleLines;
- (int64_t)numberOfTitleLines;
- (int64_t)textAlignment;
@end

@implementation PXStoryConcreteViewChromeTitleSpec

- (BOOL)hidden
{
  return self->_hidden;
}

- (UIEdgeInsets)margins
{
  double top = self->_margins.top;
  double left = self->_margins.left;
  double bottom = self->_margins.bottom;
  double right = self->_margins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (int64_t)numberOfSubtitleLines
{
  return self->_numberOfSubtitleLines;
}

- (int64_t)numberOfTitleLines
{
  return self->_numberOfTitleLines;
}

- (PXStoryConcreteViewChromeTitleSpec)initWithNumberOfTitleLines:(int64_t)a3 numberOfSubtitleLines:(int64_t)a4 configuration:(id)a5
{
  id v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryConcreteViewChromeTitleSpec;
  v9 = [(PXStoryConcreteViewChromeTitleSpec *)&v16 init];
  v10 = v9;
  if (v9)
  {
    v9->_numberOfTitleLines = a3;
    v9->_numberOfSubtitleLines = a4;
    v9->_textAlignment = [v8 textAlignment];
    [v8 margins];
    v10->_margins.double top = v11;
    v10->_margins.double left = v12;
    v10->_margins.double bottom = v13;
    v10->_margins.double right = v14;
    v10->_hidden = [v8 hidden];
  }

  return v10;
}

- (PXStoryConcreteViewChromeTitleSpec)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryViewLayoutSpec.m", 800, @"%s is not available as initializer", "-[PXStoryConcreteViewChromeTitleSpec init]");

  abort();
}

@end