@interface SKUIEditorTemplateViewElement
- (NSNumber)contentId;
- (SKUIEditorTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SKUIEditorTemplateViewElement

- (SKUIEditorTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIEditorTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIEditorTemplateViewElement;
  v11 = [(SKUIViewElement *)&v18 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"contentId"];
    v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 longLongValue];
      uint64_t v15 = [NSNumber numberWithLongLong:v14];
      contentId = v11->_contentId;
      v11->_contentId = (NSNumber *)v15;
    }
  }

  return v11;
}

- (NSNumber)contentId
{
  return self->_contentId;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIEditorTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end