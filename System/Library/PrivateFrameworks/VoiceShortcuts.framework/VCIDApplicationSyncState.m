@interface VCIDApplicationSyncState
+ (id)JSONKeyPathsByPropertyKey;
- (NSDate)registeredDate;
- (NSString)checksum;
- (void)setChecksum:(id)a3;
- (void)setRegisteredDate:(id)a3;
@end

@implementation VCIDApplicationSyncState

+ (id)JSONKeyPathsByPropertyKey
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"checksum";
  v4[1] = @"registeredDate";
  v5[0] = @"checksum";
  v5[1] = @"registeredDate";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredDate, 0);
  objc_storeStrong((id *)&self->_checksum, 0);
}

- (void)setRegisteredDate:(id)a3
{
}

- (NSDate)registeredDate
{
  return self->_registeredDate;
}

- (void)setChecksum:(id)a3
{
}

- (NSString)checksum
{
  return self->_checksum;
}

@end