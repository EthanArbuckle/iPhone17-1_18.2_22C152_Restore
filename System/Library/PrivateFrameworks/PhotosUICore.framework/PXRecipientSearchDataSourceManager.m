@interface PXRecipientSearchDataSourceManager
- (NSSet)usedAddresses;
- (NSString)queryString;
- (PXRecipientSearchDataSourceManager)init;
- (unint64_t)searchState;
- (void)queryStringDidChange;
- (void)setQueryString:(id)a3;
- (void)setSearchState:(unint64_t)a3;
- (void)setUsedAddresses:(id)a3;
@end

@implementation PXRecipientSearchDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedAddresses, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

- (unint64_t)searchState
{
  return self->_searchState;
}

- (void)setUsedAddresses:(id)a3
{
}

- (NSSet)usedAddresses
{
  return self->_usedAddresses;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setSearchState:(unint64_t)a3
{
  if (self->_searchState != a3)
  {
    self->_searchState = a3;
    [(PXRecipientSearchDataSourceManager *)self signalChange:2];
  }
}

- (void)queryStringDidChange
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXRecipientSearchDataSourceManager.m", 41, @"Method %s is a responsibility of subclass %@", "-[PXRecipientSearchDataSourceManager queryStringDidChange]", v6 object file lineNumber description];

  abort();
}

- (void)setQueryString:(id)a3
{
  v8 = (NSString *)a3;
  v4 = self->_queryString;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(NSString *)v8 isEqualToString:v4];

    if (!v5)
    {
      v6 = (NSString *)[(NSString *)v8 copy];
      queryString = self->_queryString;
      self->_queryString = v6;

      [(PXRecipientSearchDataSourceManager *)self queryStringDidChange];
    }
  }
}

- (PXRecipientSearchDataSourceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXRecipientSearchDataSourceManager;
  v2 = [(PXSectionedDataSourceManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    usedAddresses = v2->_usedAddresses;
    v2->_usedAddresses = (NSSet *)v3;
  }
  return v2;
}

@end