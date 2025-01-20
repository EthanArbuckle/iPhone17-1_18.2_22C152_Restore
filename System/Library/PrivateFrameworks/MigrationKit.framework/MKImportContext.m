@interface MKImportContext
- (unint64_t)importCount;
- (unint64_t)importErrorCount;
- (unint64_t)size;
- (void)setImportCount:(unint64_t)a3;
- (void)setImportErrorCount:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation MKImportContext

- (unint64_t)importCount
{
  return self->_importCount;
}

- (void)setImportCount:(unint64_t)a3
{
  self->_importCount = a3;
}

- (unint64_t)importErrorCount
{
  return self->_importErrorCount;
}

- (void)setImportErrorCount:(unint64_t)a3
{
  self->_importErrorCount = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end