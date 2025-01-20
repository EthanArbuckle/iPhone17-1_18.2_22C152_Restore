@interface SUUIEditorTemplateViewElement
- (NSNumber)contentId;
- (SUUIEditorTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SUUIEditorTemplateViewElement

- (SUUIEditorTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIEditorTemplateViewElement;
  v9 = [(SUUIViewElement *)&v16 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"contentId"];
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 longLongValue];
      uint64_t v13 = [NSNumber numberWithLongLong:v12];
      contentId = v9->_contentId;
      v9->_contentId = (NSNumber *)v13;
    }
  }

  return v9;
}

- (NSNumber)contentId
{
  return self->_contentId;
}

- (void).cxx_destruct
{
}

@end