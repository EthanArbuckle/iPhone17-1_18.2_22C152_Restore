@interface WFAutoShortcutButtonEvent
+ (Class)codableEventClass;
- (NSString)bundleIdentifier;
- (NSString)key;
- (void)setBundleIdentifier:(id)a3;
- (void)setKey:(id)a3;
@end

@implementation WFAutoShortcutButtonEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
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