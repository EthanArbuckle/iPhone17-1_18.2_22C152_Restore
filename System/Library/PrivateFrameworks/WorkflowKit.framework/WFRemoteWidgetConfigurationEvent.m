@interface WFRemoteWidgetConfigurationEvent
+ (Class)codableEventClass;
- (NSString)bundleIdentifier;
- (NSString)key;
- (NSString)sizeClass;
- (NSString)widgetIdentifier;
- (void)setBundleIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSizeClass:(id)a3;
- (void)setWidgetIdentifier:(id)a3;
@end

@implementation WFRemoteWidgetConfigurationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
  objc_storeStrong((id *)&self->_sizeClass, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setWidgetIdentifier:(id)a3
{
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setSizeClass:(id)a3
{
}

- (NSString)sizeClass
{
  return self->_sizeClass;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end