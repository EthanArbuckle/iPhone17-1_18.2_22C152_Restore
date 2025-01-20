@interface _UIActivityItemLoaderResult
- (id)originalItem;
- (id)resolvedItem;
- (void)setOriginalItem:(id)a3;
- (void)setResolvedItem:(id)a3;
@end

@implementation _UIActivityItemLoaderResult

- (id)originalItem
{
  return self->_originalItem;
}

- (void)setOriginalItem:(id)a3
{
}

- (id)resolvedItem
{
  return self->_resolvedItem;
}

- (void)setResolvedItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resolvedItem, 0);
  objc_storeStrong(&self->_originalItem, 0);
}

@end