@interface SSItemOfferDevice
- (NSString)minimumProductVersion;
- (SSItemOfferDevice)init;
- (SSItemOfferDevice)initWithDeviceIdentifier:(int64_t)a3;
- (SSItemOfferDevice)initWithOfferDeviceDicitionary:(id)a3;
- (SSItemOfferDeviceError)incompatibleDeviceError;
- (SSItemOfferDeviceError)incompatibleSystemError;
- (int64_t)deviceIdentifier;
- (void)dealloc;
@end

@implementation SSItemOfferDevice

- (SSItemOfferDevice)init
{
  return [(SSItemOfferDevice *)self initWithOfferDeviceDicitionary:0];
}

- (SSItemOfferDevice)initWithDeviceIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSItemOfferDevice;
  result = [(SSItemOfferDevice *)&v5 init];
  if (result) {
    result->_deviceIdentifier = a3;
  }
  return result;
}

- (SSItemOfferDevice)initWithOfferDeviceDicitionary:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSItemOfferDevice.m", 42, @"Must provide device dictionary");
  }
  v21.receiver = self;
  v21.super_class = (Class)SSItemOfferDevice;
  objc_super v5 = [(SSItemOfferDevice *)&v21 init];
  if (v5)
  {
    v6 = (void *)[a3 objectForKey:@"device-type-id"];
    if (objc_opt_respondsToSelector()) {
      v5->_deviceIdentifier = (int)[v6 intValue];
    }
    v7 = (void *)[a3 objectForKey:@"minimum-product-version"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5->_minimumProductVersion = (NSString *)v7;
    }
    uint64_t v8 = [a3 objectForKey:@"minimum-device-description"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v8 = 0;
    }
    uint64_t v9 = [a3 objectForKey:@"minimum-device-title"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v9 = 0;
    }
    uint64_t v10 = [a3 objectForKey:@"minimum-device-description-url"];
    objc_opt_class();
    uint64_t v11 = 0;
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    }
    uint64_t v12 = [a3 objectForKey:@"minimum-device-description-url-title"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v9 | v8)
    {
      if ((isKindOfClass & 1) == 0) {
        uint64_t v12 = 0;
      }
      v5->_incompatibleDeviceError = (SSItemOfferDeviceError *)[[SSItemOfferDeviceError alloc] _initWithMessage:v8 title:v9 URLTitle:v12 URL:v11];
    }
    uint64_t v14 = [a3 objectForKey:@"minimum-product-version-description"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [a3 objectForKey:@"minimum-product-version-title"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      uint64_t v15 = 0;
    }
    uint64_t v16 = [a3 objectForKey:@"minimum-product-version-description-url"];
    objc_opt_class();
    uint64_t v17 = 0;
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
    }
    uint64_t v18 = [a3 objectForKey:@"minimum-product-version-description-url-title"];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();
    if (v15 | v14)
    {
      if ((v19 & 1) == 0) {
        uint64_t v18 = 0;
      }
      v5->_incompatibleSystemError = (SSItemOfferDeviceError *)[[SSItemOfferDeviceError alloc] _initWithMessage:v14 title:v15 URLTitle:v18 URL:v17];
    }
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSItemOfferDevice;
  [(SSItemOfferDevice *)&v3 dealloc];
}

- (int64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (SSItemOfferDeviceError)incompatibleDeviceError
{
  return self->_incompatibleDeviceError;
}

- (SSItemOfferDeviceError)incompatibleSystemError
{
  return self->_incompatibleSystemError;
}

- (NSString)minimumProductVersion
{
  return self->_minimumProductVersion;
}

@end