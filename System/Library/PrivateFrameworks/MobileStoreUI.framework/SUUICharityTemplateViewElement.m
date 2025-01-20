@interface SUUICharityTemplateViewElement
- (NSString)campaignIdentifier;
- (NSString)charityMetadataURLString;
- (SUUICharityTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
@end

@implementation SUUICharityTemplateViewElement

- (SUUICharityTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUICharityTemplateViewElement;
  v9 = [(SUUIViewElement *)&v15 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    uint64_t v10 = [v8 getAttribute:@"campaignID"];
    campaignIdentifier = v9->_campaignIdentifier;
    v9->_campaignIdentifier = (NSString *)v10;

    uint64_t v12 = [v8 getAttribute:@"src"];
    charityMetadataURLString = v9->_charityMetadataURLString;
    v9->_charityMetadataURLString = (NSString *)v12;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUICharityTemplateViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUICharityTemplateViewElement;
  v5 = [(SUUIViewElement *)&v12 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    v7 = [(SUUICharityTemplateViewElement *)v4 campaignIdentifier];
    campaignIdentifier = self->_campaignIdentifier;
    self->_campaignIdentifier = v7;

    v9 = [(SUUICharityTemplateViewElement *)v4 charityMetadataURLString];
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

@end