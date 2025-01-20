@interface FCHCZoneContentsRecordTest
- (NSArray)encryptedFields;
- (NSArray)unencryptedFields;
- (NSDictionary)expectedValues;
- (NSString)recordType;
- (void)setEncryptedFields:(id)a3;
- (void)setExpectedValues:(id)a3;
- (void)setRecordType:(id)a3;
- (void)setUnencryptedFields:(id)a3;
@end

@implementation FCHCZoneContentsRecordTest

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
}

- (NSArray)unencryptedFields
{
  return self->_unencryptedFields;
}

- (void)setUnencryptedFields:(id)a3
{
}

- (NSArray)encryptedFields
{
  return self->_encryptedFields;
}

- (void)setEncryptedFields:(id)a3
{
}

- (NSDictionary)expectedValues
{
  return self->_expectedValues;
}

- (void)setExpectedValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedValues, 0);
  objc_storeStrong((id *)&self->_encryptedFields, 0);
  objc_storeStrong((id *)&self->_unencryptedFields, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end