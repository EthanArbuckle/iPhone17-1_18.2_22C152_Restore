@interface CMHealthColdStorageUtils
+ (id)getSystemFieldsFromCKRecord:(id)a3;
@end

@implementation CMHealthColdStorageUtils

+ (id)getSystemFieldsFromCKRecord:(id)a3
{
  id v4 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [a3 encodeSystemFieldsWithCoder:v4];
  [v4 finishEncoding];

  return [v4 encodedData];
}

@end