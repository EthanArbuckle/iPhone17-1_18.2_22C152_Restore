@interface SearchMailboxSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)suggestionForMailboxes:(id)a3;
- (NSArray)mailboxes;
- (SearchMailboxSuggestion)initWithCoder:(id)a3;
- (SearchMailboxSuggestion)initWithMailboxes:(id)a3;
- (id)category;
- (id)contactIdentifier;
- (id)subtitle;
- (id)title;
- (void)encodeWithCoder:(id)a3;
- (void)setMailboxes:(id)a3;
@end

@implementation SearchMailboxSuggestion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)suggestionForMailboxes:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithMailboxes:v4];

  return v5;
}

- (SearchMailboxSuggestion)initWithMailboxes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchMailboxSuggestion;
  id v5 = [(SearchMailboxSuggestion *)&v9 init];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    mailboxes = v5->_mailboxes;
    v5->_mailboxes = v6;
  }
  return v5;
}

- (SearchMailboxSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"EFPropertyKey_mailboxes"];

  v8 = [(SearchMailboxSuggestion *)self initWithMailboxes:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v3 = self;
  id v4 = [v3 mailboxes];
  [v5 encodeObject:v4 forKey:@"EFPropertyKey_self.mailboxes"];
}

- (id)category
{
  return +[MUISearchSuggestionCategory mailboxCategory];
}

- (id)title
{
  v3 = [(SearchMailboxSuggestion *)self mailboxes];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    id v5 = sub_100211D98();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10045E27C(v5);
    }
  }
  v6 = [(SearchMailboxSuggestion *)self mailboxes];
  v7 = [v6 firstObject];
  v8 = [v7 name];

  return v8;
}

- (id)subtitle
{
  subtitle = self->_subtitle;
  if (!subtitle)
  {
    id v4 = [(SearchMailboxSuggestion *)self mailboxes];
    id v5 = [v4 count];

    if ((unint64_t)v5 >= 2)
    {
      v6 = sub_100211D98();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10045E2C0(v6);
      }
    }
    v7 = +[NSMutableArray array];
    v8 = [(SearchMailboxSuggestion *)self mailboxes];
    objc_super v9 = [v8 firstObject];

    v10 = [v9 parent];
    if (v10)
    {
      do
      {
        if ([v10 isTopLevelMailbox]) {
          break;
        }
        v11 = [v10 name];
        [v7 insertObject:v11 atIndex:0];

        uint64_t v12 = [v10 parent];

        v10 = (void *)v12;
      }
      while (v12);
    }
    v13 = +[EMMailbox receivingAccounts];
    if ((unint64_t)[v13 count] >= 2)
    {
      v14 = [v9 account];

      if (!v14)
      {
LABEL_13:
        v16 = +[NSBundle bundleForClass:objc_opt_class()];
        v17 = [v16 localizedStringForKey:@"SEARCH_MAILBOX_SEPARATOR" value:&stru_100619928 table:@"Main"];
        v18 = [v7 componentsJoinedByString:v17];
        v19 = (NSString *)[v18 copy];
        v20 = self->_subtitle;
        self->_subtitle = v19;

        subtitle = self->_subtitle;
        goto LABEL_14;
      }
      v13 = [v9 account];
      v15 = [v13 name];
      [v7 insertObject:v15 atIndex:0];
    }
    goto LABEL_13;
  }
LABEL_14:

  return subtitle;
}

- (id)contactIdentifier
{
  return 0;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailboxes, 0);

  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end