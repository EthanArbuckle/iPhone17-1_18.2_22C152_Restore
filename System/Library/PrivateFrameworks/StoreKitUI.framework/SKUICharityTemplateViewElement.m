@interface SKUICharityTemplateViewElement
- (NSString)campaignIdentifier;
- (NSString)charityMetadataURLString;
- (SKUICharityTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SKUICharityTemplateViewElement

- (SKUICharityTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICharityTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICharityTemplateViewElement;
  v11 = [(SKUIViewElement *)&v17 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    uint64_t v12 = [v8 getAttribute:@"campaignID"];
    campaignIdentifier = v11->_campaignIdentifier;
    v11->_campaignIdentifier = (NSString *)v12;

    uint64_t v14 = [v8 getAttribute:@"src"];
    charityMetadataURLString = v11->_charityMetadataURLString;
    v11->_charityMetadataURLString = (NSString *)v14;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUICharityTemplateViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SKUICharityTemplateViewElement;
  v5 = [(SKUIViewElement *)&v12 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SKUICharityTemplateViewElement *)v4 campaignIdentifier];
    campaignIdentifier = self->_campaignIdentifier;
    self->_campaignIdentifier = v7;

    id v9 = [(SKUICharityTemplateViewElement *)v4 charityMetadataURLString];
    charityMetadataURLString = self->_charityMetadataURLString;
    self->_charityMetadataURLString = v9;
  }

  return v6;
}

- (NSString)campaignIdentifier
{
  return self->_campaignIdentifier;
}

- (NSString)charityMetadataURLString
{
  return self->_charityMetadataURLString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_charityMetadataURLString, 0);

  objc_storeStrong((id *)&self->_campaignIdentifier, 0);
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICharityTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end