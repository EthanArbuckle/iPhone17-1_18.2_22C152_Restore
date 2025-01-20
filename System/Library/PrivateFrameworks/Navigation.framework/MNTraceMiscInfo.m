@interface MNTraceMiscInfo
- (NSString)key;
- (NSString)stringValue;
- (double)doubleValue;
- (int64_t)intValue;
- (void)setDoubleValue:(double)a3;
- (void)setIntValue:(int64_t)a3;
- (void)setKey:(id)a3;
- (void)setStringValue:(id)a3;
@end

@implementation MNTraceMiscInfo

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (int64_t)intValue
{
  return self->_intValue;
}

- (void)setIntValue:(int64_t)a3
{
  self->_intValue = a3;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end