@interface SearchUIAsyncSectionLoaderRequest
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (id)computeBlock;
- (unint64_t)hash;
- (void)setComputeBlock:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SearchUIAsyncSectionLoaderRequest

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(SearchUIAsyncSectionLoaderRequest *)self identifier];
    v7 = [v5 identifier];

    char v8 = [v6 isEqualToString:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SearchUIAsyncSectionLoaderRequest *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (id)computeBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setComputeBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_computeBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end