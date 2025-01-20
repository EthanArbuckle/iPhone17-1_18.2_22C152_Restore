@interface TKDisplayLinkManagerObserver
- (BOOL)isEqual:(id)a3;
- (TKDisplayLinkManagerObserver)initWithBlock:(id)a3;
- (TKDisplayLinkManagerObserver)initWithBlock:(id)a3 frameInterval:(unint64_t)a4;
- (unint64_t)hash;
- (void)displayDidRefresh:(id)a3;
@end

@implementation TKDisplayLinkManagerObserver

- (TKDisplayLinkManagerObserver)initWithBlock:(id)a3
{
  return [(TKDisplayLinkManagerObserver *)self initWithBlock:a3 frameInterval:1];
}

- (TKDisplayLinkManagerObserver)initWithBlock:(id)a3 frameInterval:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TKDisplayLinkManagerObserver;
  v7 = [(TKDisplayLinkManagerObserver *)&v12 init];
  v8 = v7;
  if (v7)
  {
    if (v6 && a4)
    {
      uint64_t v9 = [v6 copy];
      id block = v8->_block;
      v8->_id block = (id)v9;

      v8->_frameInterval = a4;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_block == v4[1];

  return v5;
}

- (unint64_t)hash
{
  return [self->_block hash];
}

- (void)displayDidRefresh:(id)a3
{
  unint64_t displayDidRefreshCount = self->_displayDidRefreshCount;
  if (!(displayDidRefreshCount % self->_frameInterval)) {
    (*((void (**)(void))self->_block + 2))();
  }
  self->_unint64_t displayDidRefreshCount = displayDidRefreshCount + 1;
}

- (void).cxx_destruct
{
}

@end