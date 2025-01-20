@interface TableViewFooterOptions
+ (id)defaultRAPUserContentOptions;
- (NSString)labelText;
- (NSString)linkText;
- (TableViewFooterOptions)init;
- (id)_defaultRAPUserContentLabelText;
- (id)_defaultRAPUserContentLinkText;
- (void)setLabelText:(id)a3;
- (void)setLinkText:(id)a3;
@end

@implementation TableViewFooterOptions

+ (id)defaultRAPUserContentOptions
{
  v2 = objc_alloc_init(TableViewFooterOptions);

  return v2;
}

- (TableViewFooterOptions)init
{
  v9.receiver = self;
  v9.super_class = (Class)TableViewFooterOptions;
  v2 = [(TableViewFooterOptions *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(TableViewFooterOptions *)v2 _defaultRAPUserContentLabelText];
    labelText = v3->_labelText;
    v3->_labelText = (NSString *)v4;

    uint64_t v6 = [(TableViewFooterOptions *)v3 _defaultRAPUserContentLinkText];
    linkText = v3->_linkText;
    v3->_linkText = (NSString *)v6;
  }
  return v3;
}

- (id)_defaultRAPUserContentLabelText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Legal RAP String" value:@"localized string not found" table:0];

  return v3;
}

- (id)_defaultRAPUserContentLinkText
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"[RAP] See how your data is managed…" value:@"localized string not found" table:0];

  return v3;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
}

- (NSString)linkText
{
  return self->_linkText;
}

- (void)setLinkText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkText, 0);

  objc_storeStrong((id *)&self->_labelText, 0);
}

@end