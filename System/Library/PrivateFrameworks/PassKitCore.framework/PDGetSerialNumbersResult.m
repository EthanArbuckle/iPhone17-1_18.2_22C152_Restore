@interface PDGetSerialNumbersResult
- (NSArray)serialNumbers;
- (NSString)lastUpdatedTag;
- (void)setLastUpdatedTag:(id)a3;
- (void)setSerialNumbers:(id)a3;
@end

@implementation PDGetSerialNumbersResult

- (NSArray)serialNumbers
{
  return self->_serialNumbers;
}

- (void)setSerialNumbers:(id)a3
{
}

- (NSString)lastUpdatedTag
{
  return self->_lastUpdatedTag;
}

- (void)setLastUpdatedTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedTag, 0);
  objc_storeStrong((id *)&self->_serialNumbers, 0);
}

@end