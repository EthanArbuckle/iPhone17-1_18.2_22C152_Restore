@interface FREditorialOverrideItem
- (FREditorialOverrideItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColorString:(id)a6 actionUrlString:(id)a7;
- (NSString)actionUrlString;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)subtitleColorString;
- (NSString)title;
@end

@implementation FREditorialOverrideItem

- (FREditorialOverrideItem)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColorString:(id)a6 actionUrlString:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10007C098();
  }
  v29.receiver = self;
  v29.super_class = (Class)FREditorialOverrideItem;
  v17 = [(FREditorialOverrideItem *)&v29 init];
  if (v17)
  {
    v18 = (NSString *)[v12 copy];
    identifier = v17->_identifier;
    v17->_identifier = v18;

    v20 = (NSString *)[v13 copy];
    title = v17->_title;
    v17->_title = v20;

    v22 = (NSString *)[v14 copy];
    subtitle = v17->_subtitle;
    v17->_subtitle = v22;

    v24 = (NSString *)[v15 copy];
    subtitleColorString = v17->_subtitleColorString;
    v17->_subtitleColorString = v24;

    v26 = (NSString *)[v16 copy];
    actionUrlString = v17->_actionUrlString;
    v17->_actionUrlString = v26;
  }
  return v17;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionUrlString
{
  return self->_actionUrlString;
}

- (NSString)subtitleColorString
{
  return self->_subtitleColorString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleColorString, 0);
  objc_storeStrong((id *)&self->_actionUrlString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end