@interface SKUICommentTemplateViewElement
- (BOOL)scrollNewCommentToView;
- (BOOL)showKeyboard;
- (NSString)asFormat;
- (NSString)asText;
- (NSString)commentAsText;
- (NSString)myselfText;
- (NSString)postButtonText;
- (NSString)postPlaceholderText;
- (SKUICommentTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SKUICommentTemplateViewElement

- (SKUICommentTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICommentTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUICommentTemplateViewElement;
  v11 = [(SKUIViewElement *)&v28 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"postPlaceholderText"];
    if (v12) {
      objc_storeStrong((id *)&v11->_postPlaceholderText, v12);
    }
    v13 = objc_msgSend(v8, "getAttribute:", @"postButtonText", v12);
    if (v13) {
      objc_storeStrong((id *)&v11->_postButtonText, v13);
    }
    v14 = [v8 getAttribute:@"scrollNewCommentToView"];
    v15 = v14;
    if (v14)
    {
      v16 = [v14 lowercaseString];
      v11->_scrollNewCommentToView = [v16 isEqualToString:@"true"];
    }
    v17 = [v8 getAttribute:@"showKeyboard"];
    v18 = v17;
    if (v17)
    {
      v19 = [v17 lowercaseString];
      v11->_showKeyboard = [v19 isEqualToString:@"true"];
    }
    v20 = [v8 getAttribute:@"asText"];
    if (v20) {
      objc_storeStrong((id *)&v11->_asText, v20);
    }
    id v27 = v10;
    v21 = [v8 getAttribute:@"asFormat"];
    if (v21) {
      objc_storeStrong((id *)&v11->_asFormat, v21);
    }
    id v22 = v9;
    v23 = [v8 getAttribute:@"commentAsText"];
    if (v23) {
      objc_storeStrong((id *)&v11->_commentAsText, v23);
    }
    v24 = [v8 getAttribute:@"myselfText"];
    if (v24) {
      objc_storeStrong((id *)&v11->_myselfText, v24);
    }

    id v9 = v22;
    id v10 = v27;
  }

  return v11;
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICommentTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end