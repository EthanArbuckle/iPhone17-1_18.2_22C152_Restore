@interface NCAppPickerContentProviderAppObject
- (NSString)bundleIdentifier;
- (NSString)name;
- (unint64_t)avgNumberOfNotifications;
- (void)setAvgNumberOfNotifications:(unint64_t)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation NCAppPickerContentProviderAppObject

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)avgNumberOfNotifications
{
  return self->_avgNumberOfNotifications;
}

- (void)setAvgNumberOfNotifications:(unint64_t)a3
{
  self->_avgNumberOfNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end