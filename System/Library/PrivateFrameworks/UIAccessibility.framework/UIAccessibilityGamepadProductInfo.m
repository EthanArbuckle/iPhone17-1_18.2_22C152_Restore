@interface UIAccessibilityGamepadProductInfo
- (GCController)accessibilityController;
- (NSDictionary)miscellaneous;
- (NSNumber)isAttachedToDevice;
- (NSString)anonymizedIdentifier;
- (NSString)detailedProductCategory;
- (NSString)productCategory;
- (NSString)vendorName;
- (NSUUID)identifier;
- (UIAccessibilityGamepadProductInfo)init;
- (void)setAccessibilityController:(id)a3;
- (void)setMiscellaneous:(id)a3;
@end

@implementation UIAccessibilityGamepadProductInfo

- (UIAccessibilityGamepadProductInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityGamepadProductInfo;
  v2 = [(UIAccessibilityGamepadProductInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;
  }
  return v2;
}

- (NSString)anonymizedIdentifier
{
  v2 = [(UIAccessibilityGamepadProductInfo *)self identifier];
  uint64_t v3 = [v2 UUIDString];

  return (NSString *)v3;
}

- (NSString)productCategory
{
  return (NSString *)@"accessibility";
}

- (NSString)detailedProductCategory
{
  return (NSString *)@"accessibility-virtual";
}

- (NSString)vendorName
{
  return (NSString *)@"Apple Accessibility Virtual Controller";
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSNumber)isAttachedToDevice
{
  return self->_attachedToDevice;
}

- (GCController)accessibilityController
{
  return self->_accessibilityController;
}

- (void)setAccessibilityController:(id)a3
{
}

- (NSDictionary)miscellaneous
{
  return self->_miscellaneous;
}

- (void)setMiscellaneous:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneous, 0);
  objc_storeStrong((id *)&self->_accessibilityController, 0);
  objc_storeStrong((id *)&self->_attachedToDevice, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end