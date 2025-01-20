@interface SUUICommentTemplateViewElement
- (BOOL)scrollNewCommentToView;
- (BOOL)showKeyboard;
- (NSString)asFormat;
- (NSString)asText;
- (NSString)commentAsText;
- (NSString)myselfText;
- (NSString)postButtonText;
- (NSString)postPlaceholderText;
- (SUUICommentTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SUUICommentTemplateViewElement

- (SUUICommentTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUICommentTemplateViewElement;
  v9 = [(SUUIViewElement *)&v23 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"postPlaceholderText"];
    if (v10) {
      objc_storeStrong((id *)&v9->_postPlaceholderText, v10);
    }
    v11 = [v8 getAttribute:@"postButtonText"];
    if (v11) {
      objc_storeStrong((id *)&v9->_postButtonText, v11);
    }
    v12 = [v8 getAttribute:@"scrollNewCommentToView"];
    v13 = v12;
    if (v12)
    {
      v14 = [v12 lowercaseString];
      v9->_scrollNewCommentToView = [v14 isEqualToString:@"true"];
    }
    v15 = [v8 getAttribute:@"showKeyboard"];
    v16 = v15;
    if (v15)
    {
      v17 = [v15 lowercaseString];
      v9->_showKeyboard = [v17 isEqualToString:@"true"];
    }
    v18 = [v8 getAttribute:@"asText"];
    if (v18) {
      objc_storeStrong((id *)&v9->_asText, v18);
    }
    v19 = [v8 getAttribute:@"asFormat"];
    if (v19) {
      objc_storeStrong((id *)&v9->_asFormat, v19);
    }
    v20 = [v8 getAttribute:@"commentAsText"];
    if (v20) {
      objc_storeStrong((id *)&v9->_commentAsText, v20);
    }
    v21 = [v8 getAttribute:@"myselfText"];
    if (v21) {
      objc_storeStrong((id *)&v9->_myselfText, v21);
    }
  }
  return v9;
}

- (NSString)asText
{
  return self->_asText;
}

- (NSString)asFormat
{
  return self->_asFormat;
}

- (NSString)commentAsText
{
  return self->_commentAsText;
}

- (NSString)myselfText
{
  return self->_myselfText;
}

- (NSString)postButtonText
{
  return self->_postButtonText;
}

- (NSString)postPlaceholderText
{
  return self->_postPlaceholderText;
}

- (BOOL)scrollNewCommentToView
{
  return self->_scrollNewCommentToView;
}

- (BOOL)showKeyboard
{
  return self->_showKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postPlaceholderText, 0);
  objc_storeStrong((id *)&self->_postButtonText, 0);
  objc_storeStrong((id *)&self->_myselfText, 0);
  objc_storeStrong((id *)&self->_commentAsText, 0);
  objc_storeStrong((id *)&self->_asFormat, 0);
  objc_storeStrong((id *)&self->_asText, 0);
}

@end