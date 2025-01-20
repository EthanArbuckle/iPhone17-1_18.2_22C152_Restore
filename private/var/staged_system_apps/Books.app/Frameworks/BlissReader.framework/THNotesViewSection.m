@interface THNotesViewSection
- (BOOL)isEqual:(id)a3;
- (NSArray)notes;
- (NSString)chapterTitle;
- (NSString)title;
- (void)dealloc;
- (void)setChapterTitle:(id)a3;
- (void)setNotes:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation THNotesViewSection

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewSection;
  [(THNotesViewSection *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    mTitle = self->mTitle;
    if (mTitle == [v4 title]
      || (LODWORD(v4) = -[NSString isEqualToString:](self->mTitle, "isEqualToString:", [v5 title]),
          v4))
    {
      mChapterTitle = self->mChapterTitle;
      if (mChapterTitle == [v5 chapterTitle]
        || (LODWORD(v4) = -[NSString isEqualToString:](self->mChapterTitle, "isEqualToString:", [v5 chapterTitle]), v4))
      {
        mNotes = self->mNotes;
        if (mNotes == [v5 notes])
        {
          LOBYTE(v4) = 1;
        }
        else
        {
          v9 = self->mNotes;
          id v10 = [v5 notes];
          LOBYTE(v4) = [(NSArray *)v9 isEqualToArray:v10];
        }
      }
    }
  }
  return (char)v4;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)notes
{
  return self->mNotes;
}

- (void)setNotes:(id)a3
{
}

- (NSString)chapterTitle
{
  return self->mChapterTitle;
}

- (void)setChapterTitle:(id)a3
{
}

@end