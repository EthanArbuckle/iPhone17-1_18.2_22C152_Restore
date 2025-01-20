@interface TVPURLMediaItem
- (BOOL)hasTrait:(id)a3;
- (BOOL)isEqualToMediaItem:(id)a3;
- (NSSet)traits;
- (NSURL)url;
- (TVPURLMediaItem)init;
- (TVPURLMediaItem)initWithURL:(id)a3 traits:(id)a4;
- (void)setTraits:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation TVPURLMediaItem

- (TVPURLMediaItem)init
{
  return 0;
}

- (TVPURLMediaItem)initWithURL:(id)a3 traits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TVPURLMediaItem;
  v8 = [(TVPBaseMediaItem *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    uint64_t v11 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v7];
    traits = v8->_traits;
    v8->_traits = (NSSet *)v11;
  }
  return v8;
}

- (BOOL)isEqualToMediaItem:(id)a3
{
  v4 = (TVPURLMediaItem *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(TVPURLMediaItem *)self url];
      id v6 = [(TVPURLMediaItem *)v4 url];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hasTrait:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [(TVPURLMediaItem *)self traits];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSSet)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end