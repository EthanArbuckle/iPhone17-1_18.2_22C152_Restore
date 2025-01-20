@interface ICDebuggingItem
- (BOOL)isDestructive;
- (BOOL)isPresenter;
- (BOOL)isSelected;
- (ICDebuggingItem)initWithTitle:(id)a3 selector:(SEL)a4;
- (NSString)identifier;
- (NSString)selectedDefaultsKey;
- (NSString)subtitle;
- (NSString)title;
- (SEL)selector;
- (id)debugDescription;
- (void)setDestructive:(BOOL)a3;
- (void)setPresenter:(BOOL)a3;
- (void)setSelectedDefaultsKey:(id)a3;
- (void)setSelector:(SEL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICDebuggingItem

- (ICDebuggingItem)initWithTitle:(id)a3 selector:(SEL)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ICDebuggingItem;
  v8 = [(ICDebuggingItem *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_title, a3);
    if (a4) {
      SEL v10 = a4;
    }
    else {
      SEL v10 = 0;
    }
    v9->_selector = v10;
    subtitle = v9->_subtitle;
    v9->_subtitle = 0;

    selectedDefaultsKey = v9->_selectedDefaultsKey;
    v9->_selectedDefaultsKey = 0;
  }
  return v9;
}

- (NSString)identifier
{
  v3 = [(ICDebuggingItem *)self title];
  v4 = [v3 uppercaseString];

  v5 = [(ICDebuggingItem *)self subtitle];
  if ([v5 length])
  {
    v6 = [(ICDebuggingItem *)self subtitle];
    id v7 = [v6 uppercaseString];
    id v8 = +[NSString stringWithFormat:@"%@-%@", v4, v7];
  }
  else
  {
    id v8 = v4;
  }

  return (NSString *)v8;
}

- (BOOL)isSelected
{
  v3 = +[NSUserDefaults standardUserDefaults];
  v4 = [(ICDebuggingItem *)self selectedDefaultsKey];
  unsigned __int8 v5 = [v3 BOOLForKey:v4];

  return v5;
}

- (id)debugDescription
{
  v12.receiver = self;
  v12.super_class = (Class)ICDebuggingItem;
  v3 = [(ICDebuggingItem *)&v12 debugDescription];
  v4 = [(ICDebuggingItem *)self title];
  unsigned __int8 v5 = [(ICDebuggingItem *)self subtitle];
  v6 = [(ICDebuggingItem *)self identifier];
  id v7 = [(ICDebuggingItem *)self selectedDefaultsKey];
  id v8 = +[NSNumber numberWithBool:[(ICDebuggingItem *)self isSelected]];
  v9 = NSStringFromSelector([(ICDebuggingItem *)self selector]);
  SEL v10 = +[NSString stringWithFormat:@"%@, title: %@, subtitle: %@, identifier: %@, selectedDefaultsKey: %@, selected: %@, selector: %@", v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (BOOL)isPresenter
{
  return self->_presenter;
}

- (void)setPresenter:(BOOL)a3
{
  self->_presenter = a3;
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (NSString)selectedDefaultsKey
{
  return self->_selectedDefaultsKey;
}

- (void)setSelectedDefaultsKey:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_selectedDefaultsKey, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end