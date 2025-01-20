@interface _PXFeedSyntheticDataSource
- (_PXFeedSyntheticDataSource)initWithNumberOfSections:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4;
- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
@end

@implementation _PXFeedSyntheticDataSource

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  if (a3->dataSourceIdentifier == *(void *)off_1E5DAAED8) {
    goto LABEL_10;
  }
  if (a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"Synthetic Section %li", a3->section, v8);
      goto LABEL_7;
    }
LABEL_10:
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PXFeedSyntheticDataSourceManager.m" lineNumber:74 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"Synthetic Item %li:%li", a3->section, a3->item);
LABEL_7:
  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return self->_numberOfItemsPerSection;
}

- (int64_t)numberOfSections
{
  return self->_numberOfSections;
}

- (_PXFeedSyntheticDataSource)initWithNumberOfSections:(int64_t)a3 numberOfItemsPerSection:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_PXFeedSyntheticDataSource;
  result = [(_PXFeedSyntheticDataSource *)&v7 init];
  if (result)
  {
    result->_numberOfSections = a3;
    result->_numberOfItemsPerSection = a4;
  }
  return result;
}

@end