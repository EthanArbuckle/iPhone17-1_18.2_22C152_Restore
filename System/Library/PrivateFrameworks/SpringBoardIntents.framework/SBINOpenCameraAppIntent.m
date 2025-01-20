@interface SBINOpenCameraAppIntent
- (BOOL)isEqual:(id)a3;
- (SBINOpenCameraAppIntent)initWithCaptureDevice:(unint64_t)a3 captureMode:(unint64_t)a4 systemContext:(id)a5;
- (unint64_t)captureDevice;
- (unint64_t)captureMode;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation SBINOpenCameraAppIntent

- (SBINOpenCameraAppIntent)initWithCaptureDevice:(unint64_t)a3 captureMode:(unint64_t)a4 systemContext:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SBINOpenCameraAppIntent;
  result = [(SBINAppIntent *)&v8 initWithIdentifier:@"OpenCamera" systemContext:a5];
  if (result)
  {
    result->_captureDevice = a3;
    result->_captureMode = a4;
  }
  return result;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__SBINOpenCameraAppIntent_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_265525A00;
  id v7 = v4;
  objc_super v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

void __56__SBINOpenCameraAppIntent_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)SBINOpenCameraAppIntent;
  objc_msgSendSuper2(&v7, sel_appendDescriptionToFormatter_, v2);
  v3 = *(void **)(a1 + 32);
  id v4 = NSStringFromSBINCameraCaptureDevice(*(void *)(*(void *)(a1 + 40) + 24));
  [v3 appendString:v4 withName:@"captureDevice"];

  id v5 = *(void **)(a1 + 32);
  v6 = NSStringFromSBINCameraCaptureMode(*(void *)(*(void *)(a1 + 40) + 32));
  [v5 appendString:v6 withName:@"captureMode"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBINOpenCameraAppIntent;
  BOOL v7 = [(SBINAppIntent *)&v9 isEqual:v4]
    && (self,
        id v5 = objc_claimAutoreleasedReturnValue(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0)
    && self->_captureDevice == v4[3]
    && self->_captureMode == v4[4];

  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)SBINOpenCameraAppIntent;
  return self->_captureDevice ^ [(SBINAppIntent *)&v3 hash] ^ self->_captureMode;
}

- (unint64_t)captureDevice
{
  return self->_captureDevice;
}

- (unint64_t)captureMode
{
  return self->_captureMode;
}

@end