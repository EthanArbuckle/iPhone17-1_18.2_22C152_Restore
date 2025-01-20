@interface BRiWorkSharingInfo
+ (BOOL)supportsSecureCoding;
- (BRiWorkSharingInfo)initWithCoder:(id)a3;
- (char)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRiWorkSharingInfo

- (void)encodeWithCoder:(id)a3
{
}

- (BRiWorkSharingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BRiWorkSharingInfo *)self init];
  if (v5) {
    v5->_options = [v4 decodeInt32ForKey:@"options"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (char)options
{
  return self->_options;
}

@end