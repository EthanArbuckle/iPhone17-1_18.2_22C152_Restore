@interface FCConfigHyperlinkText
- (FCConfigHyperlinkText)initWithConfigDictionary:(id)a3;
- (FCConfigHyperlinkText)initWithText:(id)a3 links:(id)a4;
- (NSArray)links;
- (NSString)text;
@end

@implementation FCConfigHyperlinkText

FCConfigHyperlinkTextLink *__50__FCConfigHyperlinkText_initWithConfigDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FCConfigHyperlinkTextLink alloc] initWithConfigDictionary:v2];

  return v3;
}

- (FCConfigHyperlinkText)initWithConfigDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FCConfigHyperlinkText;
  v5 = [(FCConfigHyperlinkText *)&v12 init];
  if (v5)
  {
    uint64_t v6 = FCAppConfigurationStringValue(v4, @"text", 0);
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v8 = FCAppConfigurationArrayValueWithDefaultValue(v4, @"links", 0);
    uint64_t v9 = objc_msgSend(v8, "fc_arrayByTransformingWithBlock:", &__block_literal_global_176);
    links = v5->_links;
    v5->_links = (NSArray *)v9;
  }
  return v5;
}

- (FCConfigHyperlinkText)initWithText:(id)a3 links:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCConfigHyperlinkText;
  uint64_t v9 = [(FCConfigHyperlinkText *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v10->_links, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (NSString)text
{
  return self->_text;
}

- (NSArray)links
{
  return self->_links;
}

@end