@interface WMBookmarkMapper
- (WMBookmarkMapper)initWithWDBookmark:(id)a3 parent:(id)a4;
- (void)mapAt:(id)a3 withState:(id)a4;
@end

@implementation WMBookmarkMapper

- (WMBookmarkMapper)initWithWDBookmark:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WMBookmarkMapper;
  v8 = [(CMMapper *)&v12 initWithParent:v7];
  if (v8)
  {
    v8->mBookmarkType = [v6 bookmarkType];
    uint64_t v9 = [v6 name];
    mName = v8->mName;
    v8->mName = (NSString *)v9;
  }
  return v8;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v5 = a3;
  if (!self->mBookmarkType)
  {
    id v7 = v5;
    id v6 = +[OIXMLElement elementWithType:0];
    [v7 addChild:v6];
    [(CMMapper *)self addAttribute:0x26EC01938 toNode:v6 value:self->mName];

    id v5 = v7;
  }
}

- (void).cxx_destruct
{
}

@end