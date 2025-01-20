@interface BYDevice
+ (id)currentDevice;
- (BOOL)hasActionButton;
- (BOOL)hasCameraButton;
- (BOOL)hasDynamicIsland;
- (BOOL)hasHomeButton;
- (BOOL)isPowerButtonOppositeVolumeButtons;
- (BYDevice)init;
- (NSString)deviceClass;
- (NSString)productType;
- (NSString)serialNumber;
- (int)mainScreenClass;
- (int64_t)size;
- (int64_t)type;
@end

@implementation BYDevice

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1) {
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)currentDevice_sharedDevice;
  return v2;
}

uint64_t __25__BYDevice_currentDevice__block_invoke()
{
  currentDevice_sharedDevice = objc_alloc_init(BYDevice);
  return MEMORY[0x1F41817F8]();
}

- (BYDevice)init
{
  v18.receiver = self;
  v18.super_class = (Class)BYDevice;
  v2 = [(BYDevice *)&v18 init];
  if (v2)
  {
    CFStringRef v3 = (const __CFString *)MGGetStringAnswer();
    if (v3)
    {
      v4 = (__CFString *)v3;
      v2->_int64_t type = CFEqual(v3, @"iPad");
      objc_storeStrong((id *)&v2->_deviceClass, v4);
      CFRelease(v4);
    }
    int v5 = MGGetSInt32Answer();
    if ([(BYDevice *)v2 type])
    {
      BOOL v6 = v5 == 11 || v5 == 14;
      uint64_t v7 = 4;
      if (!v6) {
        uint64_t v7 = 0;
      }
      goto LABEL_10;
    }
    uint64_t v7 = 0;
    if (v5 <= 17)
    {
      if (v5 == 5)
      {
        uint64_t v7 = 2;
        goto LABEL_10;
      }
      if (v5 == 9)
      {
        uint64_t v7 = 1;
        goto LABEL_10;
      }
      if (v5 != 15)
      {
LABEL_10:
        v2->_size = v7;
        v2->_mainScreenClass = v5;
        v2->_hasHomeButton = MGGetSInt32Answer() != 2;
        uint64_t v8 = SpringBoardServicesLibraryCore();
        if (v8)
        {
          uint64_t v20 = 0;
          v21 = &v20;
          uint64_t v22 = 0x2020000000;
          v9 = (uint64_t (*)(void))getSBSIsSystemApertureAvailableSymbolLoc_ptr;
          v23 = getSBSIsSystemApertureAvailableSymbolLoc_ptr;
          if (!getSBSIsSystemApertureAvailableSymbolLoc_ptr)
          {
            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __getSBSIsSystemApertureAvailableSymbolLoc_block_invoke;
            v19[3] = &unk_1E5D2B9E8;
            v19[4] = &v20;
            __getSBSIsSystemApertureAvailableSymbolLoc_block_invoke((uint64_t)v19);
            v9 = (uint64_t (*)(void))v21[3];
          }
          _Block_object_dispose(&v20, 8);
          if (!v9)
          {
            v17 = (_Unwind_Exception *)+[BYSiriUtilities deviceSupportsSystemAssistantExperience]();
            _Block_object_dispose(&v20, 8);
            _Unwind_Resume(v17);
          }
          LOBYTE(v8) = v9();
        }
        v2->_hasDynamicIsland = v8;
        uint64_t v10 = MGCopyAnswer();
        productType = v2->_productType;
        v2->_productType = (NSString *)v10;

        int64_t type = v2->_type;
        if (type == 1)
        {
          char v13 = 0;
        }
        else
        {
          if (type)
          {
LABEL_25:
            v2->_hasCameraButton = MGGetBoolAnswer();
            v2->_isPowerButtonOppositeVolumeButtons = MGGetBoolAnswer();
            uint64_t v14 = MGCopyAnswer();
            serialNumber = v2->_serialNumber;
            v2->_serialNumber = (NSString *)v14;

            return v2;
          }
          char v13 = MGGetBoolAnswer();
        }
        v2->_hasActionButton = v13;
        goto LABEL_25;
      }
    }
    else
    {
      if (v5 <= 29)
      {
        if (v5 != 18)
        {
          if (v5 == 19) {
            uint64_t v7 = 5;
          }
          goto LABEL_10;
        }
LABEL_33:
        uint64_t v7 = 6;
        goto LABEL_10;
      }
      if (v5 != 30)
      {
        if (v5 != 31) {
          goto LABEL_10;
        }
        goto LABEL_33;
      }
    }
    uint64_t v7 = 3;
    goto LABEL_10;
  }
  return v2;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)size
{
  return self->_size;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (BOOL)hasActionButton
{
  return self->_hasActionButton;
}

- (BOOL)hasCameraButton
{
  return self->_hasCameraButton;
}

- (BOOL)isPowerButtonOppositeVolumeButtons
{
  return self->_isPowerButtonOppositeVolumeButtons;
}

- (BOOL)hasDynamicIsland
{
  return self->_hasDynamicIsland;
}

- (int)mainScreenClass
{
  return self->_mainScreenClass;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
}

@end