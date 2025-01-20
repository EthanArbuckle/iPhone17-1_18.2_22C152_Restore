@interface BKActivityURLItemSource
- (BKActivityURLItemSource)initWithPath:(id)a3;
- (NSURL)url;
- (void)setUrl:(id)a3;
@end

@implementation BKActivityURLItemSource

- (BKActivityURLItemSource)initWithPath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKActivityURLItemSource;
  v5 = [(BKActivityURLItemSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[NSURL fileURLWithPath:v4];
    url = v5->_url;
    v5->_url = (NSURL *)v6;
  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end