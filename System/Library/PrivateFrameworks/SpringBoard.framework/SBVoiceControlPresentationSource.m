@interface SBVoiceControlPresentationSource
+ (id)sourceFromBluetoothDevice:(id)a3;
+ (id)sourceFromHeadsetButton;
+ (id)sourceFromHomeButton;
- (BluetoothDevice)bluetoothDevice;
- (id)_initWithSourceType:(int64_t)a3;
- (int64_t)sourceType;
@end

@implementation SBVoiceControlPresentationSource

+ (id)sourceFromBluetoothDevice:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [objc_alloc((Class)a1) _initWithSourceType:1];
  v7 = (void *)v6;
  if (v6) {
    objc_storeStrong((id *)(v6 + 8), a3);
  }

  return v7;
}

+ (id)sourceFromHeadsetButton
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithSourceType:2];
  return v2;
}

+ (id)sourceFromHomeButton
{
  v2 = (void *)[objc_alloc((Class)a1) _initWithSourceType:0];
  return v2;
}

- (id)_initWithSourceType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBVoiceControlPresentationSource;
  id result = [(SBVoiceControlPresentationSource *)&v5 init];
  if (result) {
    *((void *)result + 2) = a3;
  }
  return result;
}

- (BluetoothDevice)bluetoothDevice
{
  if ([(SBVoiceControlPresentationSource *)self sourceType] != 1)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"SBVoiceControlPresentationSource.m", 41, @"%@ can only be called when the source type is Bluetooth", v7 object file lineNumber description];
  }
  bluetoothDevice = self->_bluetoothDevice;
  return bluetoothDevice;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void).cxx_destruct
{
}

@end