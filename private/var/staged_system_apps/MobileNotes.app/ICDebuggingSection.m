@interface ICDebuggingSection
- (BOOL)isDestructive;
- (ICDebuggingSection)initWithTitle:(id)a3 items:(id)a4;
- (NSArray)items;
- (NSString)identifier;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)setDestructive:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICDebuggingSection

- (ICDebuggingSection)initWithTitle:(id)a3 items:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDebuggingSection;
  v9 = [(ICDebuggingSection *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_items, a4);
  }

  return v10;
}

- (NSString)identifier
{
  v2 = [(ICDebuggingSection *)self title];
  v3 = [v2 uppercaseString];

  return (NSString *)v3;
}

- (void)setDestructive:(BOOL)a3
{
  BOOL v3 = a3;
  self->_destructive = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(ICDebuggingSection *)self items];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setDestructive:v3];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)debugDescription
{
  v8.receiver = self;
  v8.super_class = (Class)ICDebuggingSection;
  BOOL v3 = [(ICDebuggingSection *)&v8 debugDescription];
  v4 = [(ICDebuggingSection *)self title];
  id v5 = [(ICDebuggingSection *)self items];
  id v6 = +[NSString stringWithFormat:@"%@, title: %@, items: %@", v3, v4, v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ICDebuggingSection allocWithZone:a3];
  id v5 = [(ICDebuggingSection *)self title];
  id v6 = [(ICDebuggingSection *)self items];
  uint64_t v7 = [(ICDebuggingSection *)v4 initWithTitle:v5 items:v6];

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end