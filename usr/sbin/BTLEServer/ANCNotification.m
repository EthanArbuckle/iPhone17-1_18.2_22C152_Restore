@interface ANCNotification
- (ANCAlert)alert;
- (ANCNotification)initWithUID:(unsigned int)a3 alert:(id)a4;
- (BOOL)isDirty;
- (unsigned)UID;
- (void)setIsDirty:(BOOL)a3;
@end

@implementation ANCNotification

- (ANCNotification)initWithUID:(unsigned int)a3 alert:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ANCNotification;
  v8 = [(ANCNotification *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_UID = a3;
    objc_storeStrong((id *)&v8->_alert, a4);
    v9->_isDirty = 1;
  }

  return v9;
}

- (unsigned)UID
{
  return self->_UID;
}

- (ANCAlert)alert
{
  return self->_alert;
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (void).cxx_destruct
{
}

@end