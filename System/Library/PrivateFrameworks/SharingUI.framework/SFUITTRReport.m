@interface SFUITTRReport
+ (id)peopleSuggestionReport;
- (NSString)desc;
- (NSString)title;
- (SFUITTRReport)initWithTitle:(id)a3 desc:(id)a4 component:(id)a5;
- (SFUITTRReportComponent)component;
- (void)setComponent:(id)a3;
- (void)setDesc:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFUITTRReport

+ (id)peopleSuggestionReport
{
  v2 = [SFUITTRReport alloc];
  v3 = +[SFUITTRReportComponent peopleSuggesterComponent];
  v4 = [(SFUITTRReport *)v2 initWithTitle:@"TTR Share Sheet People Suggestions:" desc:@"What did you like about the suggestions?\n\n\n\nWhat did you not like about the suggestions?\n\n\n\nWhat didn't make sense in the suggestions?\n\n\n\nWhat were you sharing?\n\n\n\n" component:v3];

  return v4;
}

- (SFUITTRReport)initWithTitle:(id)a3 desc:(id)a4 component:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SFUITTRReport;
  v11 = [(SFUITTRReport *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    title = v11->_title;
    v11->_title = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    desc = v11->_desc;
    v11->_desc = (NSString *)v14;

    objc_storeStrong((id *)&v11->_component, a5);
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
}

- (SFUITTRReportComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end