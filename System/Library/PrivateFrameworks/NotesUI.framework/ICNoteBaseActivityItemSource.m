@interface ICNoteBaseActivityItemSource
- (ICNoteBaseActivityItemSource)initWithTitle:(id)a3;
- (NSString)title;
- (void)setTitle:(id)a3;
@end

@implementation ICNoteBaseActivityItemSource

- (ICNoteBaseActivityItemSource)initWithTitle:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteBaseActivityItemSource;
  v5 = [(ICNoteBaseActivityItemSource *)&v8 init];
  if (v5)
  {
    if ([v4 length])
    {
      [(ICNoteBaseActivityItemSource *)v5 setTitle:v4];
    }
    else
    {
      v6 = [MEMORY[0x1E4F83418] defaultTitleForEmptyNote];
      [(ICNoteBaseActivityItemSource *)v5 setTitle:v6];
    }
  }

  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end