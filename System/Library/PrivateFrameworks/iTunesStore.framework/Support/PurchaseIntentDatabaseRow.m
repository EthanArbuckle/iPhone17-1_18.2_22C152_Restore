@interface PurchaseIntentDatabaseRow
- (NSNumber)pid;
- (NSNumber)timestamp;
- (NSString)appBundleId;
- (NSString)appName;
- (NSString)productIdentifier;
- (NSString)productName;
- (void)setAppBundleId:(id)a3;
- (void)setAppName:(id)a3;
- (void)setPid:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setProductName:(id)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PurchaseIntentDatabaseRow

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSNumber)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSNumber)pid
{
  return self->_pid;
}

- (void)setPid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pid, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);

  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end