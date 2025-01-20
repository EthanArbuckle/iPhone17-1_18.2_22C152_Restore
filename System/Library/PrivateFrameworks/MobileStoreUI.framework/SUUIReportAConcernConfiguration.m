@interface SUUIReportAConcernConfiguration
+ (id)configurationWithTemplateElement:(id)a3;
- (NSArray)reasons;
- (NSString)privacyNote;
- (NSString)reportConcernExplanation;
- (NSString)selectReasonSubtitle;
- (NSString)selectReasonTitle;
- (NSURL)reportConcernURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)itemIdentifier;
- (void)setItemIdentifier:(int64_t)a3;
- (void)setPrivacyNote:(id)a3;
- (void)setReasons:(id)a3;
- (void)setReportConcernExplanation:(id)a3;
- (void)setReportConcernURL:(id)a3;
- (void)setSelectReasonSubtitle:(id)a3;
- (void)setSelectReasonTitle:(id)a3;
@end

@implementation SUUIReportAConcernConfiguration

+ (id)configurationWithTemplateElement:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init((Class)a1);
    v6 = [v4 reportConcernURL];
    [v5 setReportConcernURL:v6];

    objc_msgSend(v5, "setItemIdentifier:", objc_msgSend(v4, "itemIdentifier"));
    v7 = [v4 reportConcernExplanation];
    [v5 setReportConcernExplanation:v7];

    v8 = [v4 firstChildForElementName:@"title"];
    v9 = [v8 text];
    v10 = [v9 attributedString];
    v11 = [v10 string];
    [v5 setSelectReasonTitle:v11];

    v12 = [v4 firstChildForElementName:@"subtitle"];
    v13 = [v12 text];
    v14 = [v13 attributedString];
    v15 = [v14 string];
    [v5 setSelectReasonSubtitle:v15];

    v16 = [v4 firstChildForElementName:@"text"];
    v17 = [v16 text];
    v18 = [v17 attributedString];
    v19 = [v18 string];
    [v5 setPrivacyNote:v19];

    v20 = [MEMORY[0x263EFF980] array];
    v21 = [v4 reasonElements];

    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __68__SUUIReportAConcernConfiguration_configurationWithTemplateElement___block_invoke;
    v24[3] = &unk_265400D28;
    id v25 = v20;
    id v22 = v20;
    [v21 enumerateObjectsUsingBlock:v24];

    [v5 setReasons:v22];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

void __68__SUUIReportAConcernConfiguration_configurationWithTemplateElement___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = objc_alloc_init(SUUIReportAConcernReason);
  id v4 = [v9 reasonID];
  [(SUUIReportAConcernReason *)v3 setReasonID:v4];

  id v5 = [v9 name];
  [(SUUIReportAConcernReason *)v3 setName:v5];

  v6 = [v9 uppercaseName];
  if (v6)
  {
    [(SUUIReportAConcernReason *)v3 setUppercaseName:v6];
  }
  else
  {
    v7 = [v9 name];
    v8 = [v7 uppercaseString];
    [(SUUIReportAConcernReason *)v3 setUppercaseName:v8];
  }
  [*(id *)(a1 + 32) addObject:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(SUUIReportAConcernConfiguration *)self reportConcernURL];
  [v4 setReportConcernURL:v5];

  objc_msgSend(v4, "setItemIdentifier:", -[SUUIReportAConcernConfiguration itemIdentifier](self, "itemIdentifier"));
  v6 = [(SUUIReportAConcernConfiguration *)self reportConcernExplanation];
  [v4 setReportConcernExplanation:v6];

  v7 = [(SUUIReportAConcernConfiguration *)self selectReasonTitle];
  [v4 setSelectReasonTitle:v7];

  v8 = [(SUUIReportAConcernConfiguration *)self selectReasonSubtitle];
  [v4 setSelectReasonSubtitle:v8];

  id v9 = [(SUUIReportAConcernConfiguration *)self privacyNote];
  [v4 setPrivacyNote:v9];

  v10 = [(SUUIReportAConcernConfiguration *)self reasons];
  [v4 setReasons:v10];

  return v4;
}

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (void)setReportConcernURL:(id)a3
{
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(int64_t)a3
{
  self->_itemIdentifier = a3;
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void)setReportConcernExplanation:(id)a3
{
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
}

- (NSString)privacyNote
{
  return self->_privacyNote;
}

- (void)setPrivacyNote:(id)a3
{
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_privacyNote, 0);
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

@end