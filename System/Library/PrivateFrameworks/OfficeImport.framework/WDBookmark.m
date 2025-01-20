@interface WDBookmark
- (WDBookmark)initWithParagraph:(id)a3 name:(id)a4 type:(int)a5;
- (id)description;
- (id)name;
- (int)bookmarkType;
- (int)runType;
- (void)setBookmarkType:(int)a3;
- (void)setName:(id)a3;
@end

@implementation WDBookmark

- (WDBookmark)initWithParagraph:(id)a3 name:(id)a4 type:(int)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WDBookmark;
  v10 = [(WDRun *)&v13 initWithParagraph:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->mName, a4);
    v11->mBookmarkType = a5;
  }

  return v11;
}

- (int)runType
{
  return 12;
}

- (id)name
{
  return self->mName;
}

- (int)bookmarkType
{
  return self->mBookmarkType;
}

- (void)setBookmarkType:(int)a3
{
  self->mBookmarkType = a3;
}

- (void)setName:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDBookmark;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end