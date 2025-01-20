@interface TSKSearch
- (BOOL)isComplete;
- (NSString)string;
- (TSKSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5;
- (id)hitBlock;
- (unint64_t)options;
- (void)dealloc;
- (void)setHitBlock:(id)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setString:(id)a3;
@end

@implementation TSKSearch

- (TSKSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)TSKSearch;
  v8 = [(TSKSearch *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(TSKSearch *)v8 setString:a3];
    [(TSKSearch *)v9 setOptions:a4];
    [(TSKSearch *)v9 setHitBlock:a5];
    [(TSKSearch *)v9 setIsComplete:0];
  }
  return v9;
}

- (void)dealloc
{
  [(TSKSearch *)self setString:0];
  [(TSKSearch *)self setHitBlock:0];
  v3.receiver = self;
  v3.super_class = (Class)TSKSearch;
  [(TSKSearch *)&v3 dealloc];
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (id)hitBlock
{
  return self->_hitBlock;
}

- (void)setHitBlock:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

@end