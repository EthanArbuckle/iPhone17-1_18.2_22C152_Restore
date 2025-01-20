@interface DeviceDetail
+ (BOOL)supportsSecureCoding;
- (DeviceDetail)initWithCoder:(id)a3;
- (DeviceDetail)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation DeviceDetail

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceDetail)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_1D463F8C8();
  }
  sub_1D463F8C8();
  if (a5) {
    sub_1D463F8C8();
  }
  return (DeviceDetail *)DeviceDetail.init(identifier:display:pronunciationHint:)();
}

- (DeviceDetail)initWithCoder:(id)a3
{
  return (DeviceDetail *)DeviceDetail.init(coder:)(a3);
}

@end