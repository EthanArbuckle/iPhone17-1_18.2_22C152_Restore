@interface NFSecureElementHandle
- (BOOL)enableGreenCarThreshold:(BOOL)a3;
- (BOOL)hasSentRAPDU;
- (BOOL)hasTransactionEnded;
- (BOOL)isFieldPresent;
- (BOOL)setAlwaysOn:(BOOL)a3;
- (NFDriverWrapper)driver;
- (NFHardwareSecureElementInfo)info;
- (NFSecureElementHandle)initWithID:(int)a3 driverWrapper:(id)a4 seInfo:(id)a5;
- (id)transceive:(id)a3 toOS:(int64_t)a4 error:(id *)a5;
- (int)identifier;
- (void)redactLogging:(BOOL)a3;
- (void)setDriver:(id)a3;
- (void)setIdentifier:(int)a3;
- (void)setInfo:(id)a3;
@end

@implementation NFSecureElementHandle

- (NFSecureElementHandle)initWithID:(int)a3 driverWrapper:(id)a4 seInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NFSecureElementHandle;
  v11 = [(NFSecureElementHandle *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_identifier = a3;
    objc_storeStrong((id *)&v11->_driver, a4);
    objc_storeStrong((id *)&v12->_info, a5);
  }

  return v12;
}

- (id)transceive:(id)a3 toOS:(int64_t)a4 error:(id *)a5
{
  id v9 = a3;
  driver = self->_driver;
  if (!driver)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"NFSecureElementHandle.m", 30, @"Invalid parameter not satisfying: %@", @"_driver != nil" object file lineNumber description];

    driver = self->_driver;
  }
  v11 = sub_10002AD6C(driver, self->_identifier, v9, a4, 0, a5);

  return v11;
}

- (BOOL)setAlwaysOn:(BOOL)a3
{
  driver = self->_driver;
  if (!driver)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"NFSecureElementHandle.m", 36, @"Invalid parameter not satisfying: %@", @"_driver != nil" object file lineNumber description];

    driver = self->_driver;
  }

  return sub_10002A028(driver);
}

- (BOOL)enableGreenCarThreshold:(BOOL)a3
{
  return sub_1001E0B78(self->_driver);
}

- (BOOL)isFieldPresent
{
  driver = self->_driver;
  if (!driver) {
    return 0;
  }
  [(NSLock *)driver->_fieldPresentLock lock];
  BOOL fieldPresent = driver->_fieldPresent;
  [(NSLock *)driver->_fieldPresentLock unlock];
  return fieldPresent;
}

- (BOOL)hasTransactionEnded
{
  driver = self->_driver;
  return driver && driver->_hasTransactionEnded;
}

- (BOOL)hasSentRAPDU
{
  driver = self->_driver;
  return driver && driver->_hasSentRAPDU;
}

- (void)redactLogging:(BOOL)a3
{
  if (self->_driver) {
    NFDriverRedactLogging();
  }
}

- (int)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(int)a3
{
  self->_identifier = a3;
}

- (NFDriverWrapper)driver
{
  return (NFDriverWrapper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDriver:(id)a3
{
}

- (NFHardwareSecureElementInfo)info
{
  return (NFHardwareSecureElementInfo *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_driver, 0);
}

@end