@interface CRLSearch
- (BOOL)isComplete;
- (CRLSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5;
- (NSString)string;
- (id)hitBlock;
- (unint64_t)options;
- (void)setHitBlock:(id)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setString:(id)a3;
@end

@implementation CRLSearch

- (CRLSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CRLSearch;
  v10 = [(CRLSearch *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(CRLSearch *)v10 setString:v8];
    [(CRLSearch *)v11 setOptions:a4];
    [(CRLSearch *)v11 setHitBlock:v9];
    [(CRLSearch *)v11 setIsComplete:0];
  }

  return v11;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hitBlock, 0);

  objc_storeStrong((id *)&self->_string, 0);
}

@end