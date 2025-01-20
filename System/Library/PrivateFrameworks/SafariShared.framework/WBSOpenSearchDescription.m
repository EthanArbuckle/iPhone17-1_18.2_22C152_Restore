@interface WBSOpenSearchDescription
- (BOOL)isEqual:(id)a3;
- (NSString)descriptionDocumentURLString;
- (WBSOpenSearchDescription)initWithDescriptionDocumentURLString:(id)a3 searchURLTemplate:(id)a4 urlTemplateForSuggestionsInJSON:(id)a5 urlTemplateForSuggestionsInXML:(id)a6;
- (WBSOpenSearchDescription)initWithDictionaryRepresentation:(id)a3;
- (WBSOpenSearchURLTemplate)searchURLTemplate;
- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInJSON;
- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInXML;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation WBSOpenSearchDescription

- (WBSOpenSearchDescription)initWithDescriptionDocumentURLString:(id)a3 searchURLTemplate:(id)a4 urlTemplateForSuggestionsInJSON:(id)a5 urlTemplateForSuggestionsInXML:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WBSOpenSearchDescription;
  v14 = [(WBSOpenSearchDescription *)&v19 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    descriptionDocumentURLString = v14->_descriptionDocumentURLString;
    v14->_descriptionDocumentURLString = (NSString *)v15;

    objc_storeStrong((id *)&v14->_searchURLTemplate, a4);
    objc_storeStrong((id *)&v14->_urlTemplateForSuggestionsInJSON, a5);
    objc_storeStrong((id *)&v14->_urlTemplateForSuggestionsInXML, a6);
    v17 = v14;
  }

  return v14;
}

- (WBSOpenSearchDescription)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WBSOpenSearchDescription;
  v5 = [(WBSOpenSearchDescription *)&v23 init];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = [v4 objectForKeyedSubscript:@"DescriptionDocumentURLString"];
  uint64_t v7 = [v6 copy];
  descriptionDocumentURLString = v5->_descriptionDocumentURLString;
  v5->_descriptionDocumentURLString = (NSString *)v7;

  v9 = [WBSOpenSearchURLTemplate alloc];
  id v10 = [v4 objectForKeyedSubscript:@"SearchURLTemplateString"];
  uint64_t v11 = [(WBSOpenSearchURLTemplate *)v9 initWithString:v10];
  searchURLTemplate = v5->_searchURLTemplate;
  v5->_searchURLTemplate = (WBSOpenSearchURLTemplate *)v11;

  if (![(NSString *)v5->_descriptionDocumentURLString length]) {
    goto LABEL_5;
  }
  if (v5->_searchURLTemplate)
  {
    id v13 = [WBSOpenSearchURLTemplate alloc];
    v14 = [v4 objectForKeyedSubscript:@"URLTemplateStringForSuggestionsInJSON"];
    uint64_t v15 = [(WBSOpenSearchURLTemplate *)v13 initWithString:v14];
    urlTemplateForSuggestionsInJSON = v5->_urlTemplateForSuggestionsInJSON;
    v5->_urlTemplateForSuggestionsInJSON = (WBSOpenSearchURLTemplate *)v15;

    v17 = [WBSOpenSearchURLTemplate alloc];
    v18 = [v4 objectForKeyedSubscript:@"URLTemplateStringForSuggestionsInXML"];
    uint64_t v19 = [(WBSOpenSearchURLTemplate *)v17 initWithString:v18];
    urlTemplateForSuggestionsInXML = v5->_urlTemplateForSuggestionsInXML;
    v5->_urlTemplateForSuggestionsInXML = (WBSOpenSearchURLTemplate *)v19;

    v21 = v5;
  }
  else
  {
LABEL_5:
    v21 = 0;
  }

  return v21;
}

- (id)dictionaryRepresentation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  descriptionDocumentURLString = self->_descriptionDocumentURLString;
  searchURLTemplate = self->_searchURLTemplate;
  v14[0] = @"DescriptionDocumentURLString";
  v14[1] = @"SearchURLTemplateString";
  v15[0] = descriptionDocumentURLString;
  v6 = [(WBSOpenSearchURLTemplate *)searchURLTemplate templateString];
  v15[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v8 = [v3 dictionaryWithDictionary:v7];

  urlTemplateForSuggestionsInJSON = self->_urlTemplateForSuggestionsInJSON;
  if (urlTemplateForSuggestionsInJSON)
  {
    id v10 = [(WBSOpenSearchURLTemplate *)urlTemplateForSuggestionsInJSON templateString];
    [v8 setObject:v10 forKeyedSubscript:@"URLTemplateStringForSuggestionsInJSON"];
  }
  urlTemplateForSuggestionsInXML = self->_urlTemplateForSuggestionsInXML;
  if (urlTemplateForSuggestionsInXML)
  {
    id v12 = [(WBSOpenSearchURLTemplate *)urlTemplateForSuggestionsInXML templateString];
    [v8 setObject:v12 forKeyedSubscript:@"URLTemplateStringForSuggestionsInXML"];
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSOpenSearchDescription *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      descriptionDocumentURLString = self->_descriptionDocumentURLString;
      uint64_t v7 = [(WBSOpenSearchDescription *)v5 descriptionDocumentURLString];
      if ([(NSString *)descriptionDocumentURLString isEqualToString:v7])
      {
        searchURLTemplate = self->_searchURLTemplate;
        v9 = [(WBSOpenSearchDescription *)v5 searchURLTemplate];
        LODWORD(searchURLTemplate) = [(WBSOpenSearchURLTemplate *)searchURLTemplate isEqual:v9];

        if (!searchURLTemplate
          || (urlTemplateForSuggestionsInJSON = self->_urlTemplateForSuggestionsInJSON,
              urlTemplateForSuggestionsInJSON != v5->_urlTemplateForSuggestionsInJSON)
          && !-[WBSOpenSearchURLTemplate isEqual:](urlTemplateForSuggestionsInJSON, "isEqual:"))
        {
          char v12 = 0;
          goto LABEL_14;
        }
        urlTemplateForSuggestionsInXML = self->_urlTemplateForSuggestionsInXML;
        if (urlTemplateForSuggestionsInXML == v5->_urlTemplateForSuggestionsInXML)
        {
          char v12 = 1;
          goto LABEL_14;
        }
        uint64_t v7 = [(WBSOpenSearchDescription *)v5 urlTemplateForSuggestionsInXML];
        char v12 = [(WBSOpenSearchURLTemplate *)urlTemplateForSuggestionsInXML isEqual:v7];
      }
      else
      {
        char v12 = 0;
      }

LABEL_14:
      goto LABEL_15;
    }
    char v12 = 0;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_descriptionDocumentURLString hash];
  unint64_t v4 = [(WBSOpenSearchURLTemplate *)self->_searchURLTemplate hash] ^ v3;
  unint64_t v5 = [(WBSOpenSearchURLTemplate *)self->_urlTemplateForSuggestionsInJSON hash];
  return v4 ^ v5 ^ [(WBSOpenSearchURLTemplate *)self->_urlTemplateForSuggestionsInXML hash];
}

- (NSString)descriptionDocumentURLString
{
  return self->_descriptionDocumentURLString;
}

- (WBSOpenSearchURLTemplate)searchURLTemplate
{
  return self->_searchURLTemplate;
}

- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInJSON
{
  return self->_urlTemplateForSuggestionsInJSON;
}

- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInXML
{
  return self->_urlTemplateForSuggestionsInXML;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlTemplateForSuggestionsInXML, 0);
  objc_storeStrong((id *)&self->_urlTemplateForSuggestionsInJSON, 0);
  objc_storeStrong((id *)&self->_searchURLTemplate, 0);
  objc_storeStrong((id *)&self->_descriptionDocumentURLString, 0);
}

@end