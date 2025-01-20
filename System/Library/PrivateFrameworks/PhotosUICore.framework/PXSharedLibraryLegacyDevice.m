@interface PXSharedLibraryLegacyDevice
- (BOOL)upgradeable;
- (NSData)iconData;
- (NSString)instructions;
- (NSString)name;
- (PXSharedLibraryLegacyDevice)init;
- (PXSharedLibraryLegacyDevice)initWithName:(id)a3 iconData:(id)a4 operatingSystem:(int64_t)a5 upgradeable:(BOOL)a6;
- (id)description;
- (int64_t)operatingSystem;
@end

@implementation PXSharedLibraryLegacyDevice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)upgradeable
{
  return self->_upgradeable;
}

- (int64_t)operatingSystem
{
  return self->_operatingSystem;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)instructions
{
  switch(self->_operatingSystem)
  {
    case 0:
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryLegacyDevice.m" lineNumber:56 description:@"Code which should be unreachable has been reached"];

      abort();
    case 1:
      if (self->_upgradeable) {
        v3 = @"PXSharedLibraryAssistant_LegacyDevices_Instructions_iOS";
      }
      else {
        v3 = @"PXSharedLibraryAssistant_LegacyDevices_Warning_iOS";
      }
      v4 = v3;
      break;
    case 2:
      v4 = @"PXSharedLibraryAssistant_LegacyDevices_Instructions_iPadOS";
      break;
    case 3:
      v4 = @"PXSharedLibraryAssistant_LegacyDevices_Instructions_macOS";
      break;
    case 4:
      v4 = @"PXSharedLibraryAssistant_LegacyDevices_Instructions_tvOS";
      break;
    default:
      v4 = 0;
      break;
  }
  v5 = PXLocalizedSharedLibraryString(v4);

  return (NSString *)v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  NSUInteger v6 = [(NSData *)self->_iconData length];
  v7 = PXSharedLibraryLegacyDeviceOperatingSystemDescription(self->_operatingSystem);
  v8 = [v3 stringWithFormat:@"<%@:%p, name:\"%@\", data:%lu, os:\"%@\", upgradeable:%d>", v4, self, name, v6, v7, self->_upgradeable];

  return v8;
}

- (PXSharedLibraryLegacyDevice)initWithName:(id)a3 iconData:(id)a4 operatingSystem:(int64_t)a5 upgradeable:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  if (v11)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PXSharedLibraryLegacyDevice.m", 33, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (a5) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PXSharedLibraryLegacyDevice.m", 34, @"Invalid parameter not satisfying: %@", @"operatingSystem != PXSharedLibraryLegacyDeviceOperatingSystemUnknown" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibraryLegacyDevice;
  v13 = [(PXSharedLibraryLegacyDevice *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v11 copy];
    name = v13->_name;
    v13->_name = (NSString *)v14;

    uint64_t v16 = [v12 copy];
    iconData = v13->_iconData;
    v13->_iconData = (NSData *)v16;

    v13->_operatingSystem = a5;
    v13->_upgradeable = a6;
  }

  return v13;
}

- (PXSharedLibraryLegacyDevice)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryLegacyDevice.m", 29, @"%s is not available as initializer", "-[PXSharedLibraryLegacyDevice init]");

  abort();
}

@end