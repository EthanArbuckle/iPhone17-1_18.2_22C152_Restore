@interface SUSpaceCheckResults
- (BOOL)hasSufficientFreeSpace;
- (BOOL)needsAppOffload;
- (BOOL)needsCacheDelete;
- (SUSpaceCheckResults)init;
- (id)description;
- (unint64_t)additionalBytesRequired;
- (void)setAdditionalBytesRequired:(unint64_t)a3;
- (void)setHasSufficientFreeSpace:(BOOL)a3;
- (void)setNeedsAppOffload:(BOOL)a3;
- (void)setNeedsCacheDelete:(BOOL)a3;
@end

@implementation SUSpaceCheckResults

- (SUSpaceCheckResults)init
{
  v3.receiver = self;
  v3.super_class = (Class)SUSpaceCheckResults;
  result = [(SUSpaceCheckResults *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_hasSufficientFreeSpace = 0;
    result->_needsAppOffload = 0;
    result->_additionalBytesRequired = 0;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"{hasSufficientFreeSpace:%d,needsCacheDelete:%d,needsAppOffload:%d,additionalBytesRequired:%llu}", self->_hasSufficientFreeSpace, self->_needsCacheDelete, self->_needsAppOffload, self->_additionalBytesRequired);
}

- (BOOL)hasSufficientFreeSpace
{
  return self->_hasSufficientFreeSpace;
}

- (void)setHasSufficientFreeSpace:(BOOL)a3
{
  self->_hasSufficientFreeSpace = a3;
}

- (BOOL)needsCacheDelete
{
  return self->_needsCacheDelete;
}

- (void)setNeedsCacheDelete:(BOOL)a3
{
  self->_needsCacheDelete = a3;
}

- (BOOL)needsAppOffload
{
  return self->_needsAppOffload;
}

- (void)setNeedsAppOffload:(BOOL)a3
{
  self->_needsAppOffload = a3;
}

- (unint64_t)additionalBytesRequired
{
  return self->_additionalBytesRequired;
}

- (void)setAdditionalBytesRequired:(unint64_t)a3
{
  self->_additionalBytesRequired = a3;
}

@end