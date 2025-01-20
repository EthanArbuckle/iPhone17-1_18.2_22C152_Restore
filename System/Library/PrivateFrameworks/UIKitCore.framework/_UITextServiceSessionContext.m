@interface _UITextServiceSessionContext
+ (BOOL)supportsSecureCoding;
+ (CGRect)selectionBoundingBoxForTextInput:(id)a3;
+ (id)selectedTextRangeForTextInput:(id)a3;
+ (id)sessionContextForType:(int64_t)a3 withTextInput:(id)a4;
+ (id)sessionContextWithText:(id)a3 withRect:(CGRect)a4 withRange:(_NSRange)a5 withView:(id)a6;
+ (id)sessionContextWithText:(id)a3 withRect:(CGRect)a4 withView:(id)a5;
- (BOOL)_typeRequiresContext:(int64_t)a3;
- (CGRect)presentationRect;
- (RVItem)rvItemWithContext;
- (UITextInput)textInput;
- (UIView)view;
- (_NSRange)selectedRange;
- (_UITextServiceSessionContext)initWithCoder:(id)a3;
- (_UITextServiceSessionContext)textWithContext;
- (id)initForType:(int64_t)a3 withText:(id)a4 withTextInput:(id)a5 withView:(id)a6;
- (void)_gatherAdditionalContext;
- (void)convertRectToView:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setView:(id)a3;
@end

@implementation _UITextServiceSessionContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  textWithContext = self->_textWithContext;
  if (textWithContext) {
    [v7 encodeObject:textWithContext forKey:@"textWithContext"];
  }
  v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", self->_selectedRange.location, self->_selectedRange.length);
  [v7 encodeObject:v5 forKey:@"selectedRange"];

  v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_presentationRect.origin.x, self->_presentationRect.origin.y, self->_presentationRect.size.width, self->_presentationRect.size.height);
  [v7 encodeObject:v6 forKey:@"presentationRect"];
}

- (_UITextServiceSessionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UITextServiceSessionContext;
  v5 = [(_UITextServiceSessionContext *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textWithContext"];
    id v7 = (void *)v6;
    if (v6) {
      v8 = (__CFString *)v6;
    }
    else {
      v8 = &stru_1ED0E84C0;
    }
    objc_storeStrong((id *)&v5->_textWithContext, v8);

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedRange"];
    v5->_selectedRange.location = [v9 rangeValue];
    v5->_selectedRange.length = v10;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"presentationRect"];
    [v11 CGRectValue];
    v5->_presentationRect.origin.x = v12;
    v5->_presentationRect.origin.y = v13;
    v5->_presentationRect.size.width = v14;
    v5->_presentationRect.size.height = v15;
  }
  return v5;
}

+ (id)sessionContextWithText:(id)a3 withRect:(CGRect)a4 withView:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a5;
  id v12 = a3;
  CGFloat v13 = (CGFloat *)[objc_alloc((Class)a1) initForType:0 withText:v12 withTextInput:0 withView:v11];

  v13[7] = x;
  v13[8] = y;
  v13[9] = width;
  v13[10] = height;
  return v13;
}

+ (id)sessionContextWithText:(id)a3 withRect:(CGRect)a4 withRange:(_NSRange)a5 withView:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v14 = a6;
  id v15 = a3;
  v16 = (CGFloat *)[objc_alloc((Class)a1) initForType:0 withText:v15 withTextInput:0 withView:v14];

  v16[7] = x;
  v16[8] = y;
  v16[9] = width;
  v16[10] = height;
  *((void *)v16 + 5) = location;
  *((void *)v16 + 6) = length;
  return v16;
}

+ (id)sessionContextForType:(int64_t)a3 withTextInput:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[objc_alloc((Class)a1) initForType:a3 withText:0 withTextInput:v6 withView:0];

  return v7;
}

- (id)initForType:(int64_t)a3 withText:(id)a4 withTextInput:(id)a5 withView:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v34.receiver = self;
  v34.super_class = (Class)_UITextServiceSessionContext;
  CGFloat v13 = [(_UITextServiceSessionContext *)&v34 init];
  id v14 = v13;
  if (!v13) {
    goto LABEL_23;
  }
  objc_storeStrong((id *)&v13->_textInput, a5);
  if (v12)
  {
    id v15 = (UIView *)v12;
  }
  else
  {
    id v15 = [v11 textInputView];
  }
  view = v14->_view;
  v14->_view = v15;

  if (!v10)
  {
    v18 = [(id)objc_opt_class() selectedTextRangeForTextInput:v11];
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_15;
    }
    v19 = [v11 _rvItemForSelectedRange];
    if (v19)
    {
      objc_storeStrong((id *)&v14->_rvItemWithContext, v19);
      if ([v19 type] == 3)
      {
        v20 = [v19 ddResult];
        uint64_t v21 = [v20 matchedString];
LABEL_13:
        textWithContext = v14->_textWithContext;
        v14->_textWithContext = (NSString *)v21;

        goto LABEL_14;
      }
      v22 = [v19 text];

      if (v22)
      {
        v20 = [v19 text];
        uint64_t v23 = [v19 highlightRange];
        uint64_t v21 = objc_msgSend(v20, "substringWithRange:", v23, v24);
        goto LABEL_13;
      }
    }
LABEL_14:

LABEL_15:
    if (!v14->_textWithContext)
    {
      uint64_t v26 = [v11 textInRange:v18];
      v27 = v14->_textWithContext;
      v14->_textWithContext = (NSString *)v26;
    }
    goto LABEL_17;
  }
  objc_super v17 = (NSString *)v10;
  v18 = v14->_textWithContext;
  v14->_textWithContext = v17;
LABEL_17:

  uint64_t v28 = [(NSString *)v14->_textWithContext length];
  v14->_selectedRange.NSUInteger location = 0;
  v14->_selectedRange.NSUInteger length = v28;
  if (objc_opt_respondsToSelector()) {
    [(UIView *)v14->_view _shortcutPresentationRect];
  }
  else {
    [(id)objc_opt_class() selectionBoundingBoxForTextInput:v11];
  }
  v14->_presentationRect.origin.CGFloat x = v29;
  v14->_presentationRect.origin.CGFloat y = v30;
  v14->_presentationRect.size.CGFloat width = v31;
  v14->_presentationRect.size.CGFloat height = v32;
  if (v14->_textInput && [(_UITextServiceSessionContext *)v14 _typeRequiresContext:a3]) {
    [(_UITextServiceSessionContext *)v14 _gatherAdditionalContext];
  }
LABEL_23:

  return v14;
}

+ (id)selectedTextRangeForTextInput:(id)a3
{
  id v3 = a3;
  id v4 = [v3 selectedTextRange];
  if [v4 isEmpty] && (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [v3 textRangeForServicesInteraction];

    id v4 = (void *)v5;
  }

  return v4;
}

+ (CGRect)selectionBoundingBoxForTextInput:(id)a3
{
  id v3 = a3;
  id v4 = [v3 interactionAssistant];
  uint64_t v5 = [v4 _editMenuAssistant];

  [v5 selectionBoundingBox];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  if (CGRectIsEmpty(v20) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v10 = [v3 textRangeForServicesInteraction];
    id v11 = [v3 selectionRectsForRange:v10];
    [v5 selectionBoundingBoxForRects:v11];
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)_typeRequiresContext:(int64_t)a3
{
  return a3 == 16;
}

- (void)_gatherAdditionalContext
{
  id v3 = [(UITextInput *)self->_textInput selectedTextRange];
  textInput = self->_textInput;
  id v38 = v3;
  uint64_t v5 = [v3 start];
  id v6 = [(UITextInput *)textInput positionFromPosition:v5 inDirection:3 offset:250];

  if (!v6) {
    goto LABEL_4;
  }
  id v7 = [(UITextInput *)self->_textInput tokenizer];
  char v8 = [v7 isPosition:v6 atBoundary:1 inDirection:1];

  if ((v8 & 1) == 0)
  {
    v9 = [(UITextInput *)self->_textInput tokenizer];
    uint64_t v10 = [v9 positionFromPosition:v6 toBoundary:1 inDirection:1];

    id v6 = (void *)v10;
    if (!v10)
    {
LABEL_4:
      id v6 = [(UITextInput *)self->_textInput beginningOfDocument];
    }
  }
  id v11 = self->_textInput;
  double v12 = [v38 start];
  double v13 = [(UITextInput *)v11 textRangeFromPosition:v6 toPosition:v12];
  uint64_t v14 = [(UITextInput *)v11 textInRange:v13];
  double v15 = (void *)v14;
  if (v14) {
    double v16 = (__CFString *)v14;
  }
  else {
    double v16 = &stru_1ED0E84C0;
  }
  double v17 = v16;

  double v18 = self->_textInput;
  double v19 = [v38 end];
  CGRect v20 = [(UITextInput *)v18 positionFromPosition:v19 inDirection:2 offset:250];

  if (!v20) {
    goto LABEL_11;
  }
  uint64_t v21 = [(UITextInput *)self->_textInput tokenizer];
  char v22 = [v21 isPosition:v20 atBoundary:1 inDirection:0];

  if ((v22 & 1) == 0)
  {
    uint64_t v23 = [(UITextInput *)self->_textInput tokenizer];
    uint64_t v24 = [v23 positionFromPosition:v20 toBoundary:1 inDirection:0];

    CGRect v20 = (void *)v24;
    if (!v24)
    {
LABEL_11:
      CGRect v20 = [(UITextInput *)self->_textInput endOfDocument];
    }
  }
  v25 = self->_textInput;
  uint64_t v26 = [v38 end];
  v27 = [(UITextInput *)v25 textRangeFromPosition:v26 toPosition:v20];
  uint64_t v28 = [(UITextInput *)v25 textInRange:v27];
  CGFloat v29 = (void *)v28;
  if (v28) {
    CGFloat v30 = (__CFString *)v28;
  }
  else {
    CGFloat v30 = &stru_1ED0E84C0;
  }
  CGFloat v31 = v30;

  textWithContext = (__CFString *)self->_textWithContext;
  if (!textWithContext) {
    textWithContext = &stru_1ED0E84C0;
  }
  v33 = textWithContext;
  objc_super v34 = [(__CFString *)v17 stringByAppendingFormat:@"%@%@", v33, v31];
  v35 = self->_textWithContext;
  self->_textWithContext = v34;

  NSUInteger v36 = [(__CFString *)v17 length];
  NSUInteger v37 = [(__CFString *)v33 length];

  self->_selectedRange.NSUInteger location = v36;
  self->_selectedRange.NSUInteger length = v37;
}

- (void)convertRectToView:(id)a3
{
  textInput = self->_textInput;
  id v5 = a3;
  id v14 = [(UITextInput *)textInput textInputView];
  objc_msgSend(v5, "convertRect:fromView:", v14, self->_presentationRect.origin.x, self->_presentationRect.origin.y, self->_presentationRect.size.width, self->_presentationRect.size.height);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  self->_presentationRect.origin.CGFloat x = v7;
  self->_presentationRect.origin.CGFloat y = v9;
  self->_presentationRect.size.CGFloat width = v11;
  self->_presentationRect.size.CGFloat height = v13;
}

- (UITextInput)textInput
{
  return self->_textInput;
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (_UITextServiceSessionContext)textWithContext
{
  return (_UITextServiceSessionContext *)self->_textWithContext;
}

- (RVItem)rvItemWithContext
{
  return self->_rvItemWithContext;
}

- (_NSRange)selectedRange
{
  NSUInteger length = self->_selectedRange.length;
  NSUInteger location = self->_selectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (CGRect)presentationRect
{
  double x = self->_presentationRect.origin.x;
  double y = self->_presentationRect.origin.y;
  double width = self->_presentationRect.size.width;
  double height = self->_presentationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rvItemWithContext, 0);
  objc_storeStrong((id *)&self->_textWithContext, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_textInput, 0);
}

@end