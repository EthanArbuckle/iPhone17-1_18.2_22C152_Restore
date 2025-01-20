@interface WFAutoShortcutToggleEvent
+ (Class)codableEventClass;
- (BOOL)enabled;
- (NSString)bundleIdentifier;
- (NSString)key;
- (NSString)source;
- (NSString)toggleType;
- (void)setBundleIdentifier:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)setToggleType:(id)a3;
@end

@implementation WFAutoShortcutToggleEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleType, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setToggleType:(id)a3
{
}

- (NSString)toggleType
{
  return self->_toggleType;
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
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