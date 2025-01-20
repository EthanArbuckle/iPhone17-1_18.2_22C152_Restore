@interface FCCKMultiFetchRecordSpec
@end

@implementation FCCKMultiFetchRecordSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchKeys, 0);
  objc_storeStrong((id *)&self->_desiredKeys, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
}

@end