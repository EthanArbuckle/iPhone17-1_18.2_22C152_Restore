@interface PXPhotosDetailsConfiguration
- (Class)barsControllerClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)unlockDeviceHandlerWithActionType;
- (id)unlockDeviceStatus;
- (unint64_t)options;
- (void)setBarsControllerClass:(Class)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setUnlockDeviceHandlerWithActionType:(id)a3;
- (void)setUnlockDeviceStatus:(id)a3;
@end

@implementation PXPhotosDetailsConfiguration

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong((id *)&self->_barsControllerClass, 0);
}

- (void)setUnlockDeviceStatus:(id)a3
{
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (void)setBarsControllerClass:(Class)a3
{
}

- (Class)barsControllerClass
{
  return self->_barsControllerClass;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setOptions:", -[PXPhotosDetailsConfiguration options](self, "options"));
  objc_msgSend(v4, "setBarsControllerClass:", -[PXPhotosDetailsConfiguration barsControllerClass](self, "barsControllerClass"));
  v5 = [(PXPhotosDetailsConfiguration *)self unlockDeviceHandlerWithActionType];
  [v4 setUnlockDeviceHandlerWithActionType:v5];

  v6 = [(PXPhotosDetailsConfiguration *)self unlockDeviceStatus];
  [v4 setUnlockDeviceStatus:v6];

  return v4;
}

@end