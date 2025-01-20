@interface SUUITrendingSearch
- (NSString)URLString;
- (NSString)term;
- (void)setTerm:(id)a3;
- (void)setURLString:(id)a3;
@end

@implementation SUUITrendingSearch

- (NSString)term
{
  return self->_term;
}

- (void)setTerm:(id)a3
{
}

- (NSString)URLString
{
  return self->_URLString;
}

- (void)setURLString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URLString, 0);

  objc_storeStrong((id *)&self->_term, 0);
}

@end