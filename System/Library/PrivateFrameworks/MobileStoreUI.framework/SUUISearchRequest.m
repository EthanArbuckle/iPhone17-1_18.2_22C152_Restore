@interface SUUISearchRequest
- (NSNumber)searchHintIndex;
- (NSString)searchHintOriginalTerm;
- (NSString)term;
- (NSURL)URL;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSearchHintIndex:(id)a3;
- (void)setSearchHintOriginalTerm:(id)a3;
- (void)setTerm:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUUISearchRequest

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSNumber *)self->_searchHintIndex copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_searchHintOriginalTerm copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_term copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSURL *)self->_url copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (NSNumber)searchHintIndex
{
  return self->_searchHintIndex;
}

- (void)setSearchHintIndex:(id)a3
{
}

- (NSString)searchHintOriginalTerm
{
  return self->_searchHintOriginalTerm;
}

- (void)setSearchHintOriginalTerm:(id)a3
{
}

- (NSString)term
{
  return self->_term;
}

- (void)setTerm:(id)a3
{
}

- (NSURL)URL
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_searchHintOriginalTerm, 0);
  objc_storeStrong((id *)&self->_searchHintIndex, 0);
}

@end