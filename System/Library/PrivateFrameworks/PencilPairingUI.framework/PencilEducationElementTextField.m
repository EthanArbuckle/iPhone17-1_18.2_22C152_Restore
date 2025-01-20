@interface PencilEducationElementTextField
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)ignoreScribbleInsertText;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (NSSet)allowedCalloutActions;
- (int64_t)_textInputSource;
- (void)buildMenuWithBuilder:(id)a3;
- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5;
- (void)setAllowedCalloutActions:(id)a3;
- (void)setIgnoreScribbleInsertText:(BOOL)a3;
@end

@implementation PencilEducationElementTextField

- (int64_t)_textInputSource
{
  return 3;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PencilEducationElementTextField;
  -[PencilEducationElementTextField textRectForBounds:](&v13, sel_textRectForBounds_);
  double v8 = v7;
  double v10 = v9;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRect result = CGRectInset(v14, 12.0, 0.0);
  double v11 = v8;
  double v12 = v10;
  result.size.CGFloat height = v12;
  result.origin.CGFloat y = v11;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PencilEducationElementTextField;
  -[PencilEducationElementTextField editingRectForBounds:](&v13, sel_editingRectForBounds_);
  double v8 = v7;
  double v10 = v9;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGRect result = CGRectInset(v14, 12.0, 0.0);
  double v11 = v8;
  double v12 = v10;
  result.size.CGFloat height = v12;
  result.origin.CGFloat y = v11;
  return result;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PencilEducationElementTextField;
  [(PencilEducationElementTextField *)&v7 buildMenuWithBuilder:v4];
  v5 = [v4 system];
  v6 = [MEMORY[0x263F1C7C0] contextSystem];

  if (v5 == v6) {
    [v4 removeMenuForIdentifier:*MEMORY[0x263F1D4C8]];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v5 = [(PencilEducationElementTextField *)self allowedCalloutActions];
  v6 = NSStringFromSelector(a3);
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (void)insertText:(id)a3 alternatives:(id)a4 style:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![(PencilEducationElementTextField *)self ignoreScribbleInsertText])
  {
    v10.receiver = self;
    v10.super_class = (Class)PencilEducationElementTextField;
    [(PencilEducationElementTextField *)&v10 insertText:v8 alternatives:v9 style:a5];
  }
}

- (BOOL)ignoreScribbleInsertText
{
  return self->_ignoreScribbleInsertText;
}

- (void)setIgnoreScribbleInsertText:(BOOL)a3
{
  self->_ignoreScribbleInsertText = a3;
}

- (NSSet)allowedCalloutActions
{
  return self->_allowedCalloutActions;
}

- (void)setAllowedCalloutActions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end