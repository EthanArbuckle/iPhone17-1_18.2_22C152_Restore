@interface TULinkShareItem
- (NSString)title;
- (NSURL)placeholder;
- (TUConversationLink)tuConversationLink;
- (TULinkShareItem)initWithTUConversationLink:(id)a3;
- (TULinkShareItem)initWithTUConversationLink:(id)a3 title:(id)a4 placeholder:(id)a5;
- (void)setPlaceholder:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTuConversationLink:(id)a3;
@end

@implementation TULinkShareItem

- (TULinkShareItem)initWithTUConversationLink:(id)a3 title:(id)a4 placeholder:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TULinkShareItem;
  v11 = [(TULinkShareItem *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(TULinkShareItem *)v11 setTuConversationLink:v8];
    [(TULinkShareItem *)v12 setTitle:v9];
    [(TULinkShareItem *)v12 setPlaceholder:v10];
  }

  return v12;
}

- (TULinkShareItem)initWithTUConversationLink:(id)a3
{
  id v4 = a3;
  v5 = [v4 URL];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[TUConversationLink preferredBaseURL];
  }
  id v8 = v7;

  id v9 = [v4 linkName];
  id v10 = [(TULinkShareItem *)self initWithTUConversationLink:v4 title:v9 placeholder:v8];

  return v10;
}

- (TUConversationLink)tuConversationLink
{
  return self->_tuConversationLink;
}

- (void)setTuConversationLink:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSURL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_tuConversationLink, 0);
}

@end