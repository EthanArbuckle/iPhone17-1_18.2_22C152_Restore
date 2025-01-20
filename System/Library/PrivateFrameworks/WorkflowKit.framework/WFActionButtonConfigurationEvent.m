@interface WFActionButtonConfigurationEvent
+ (Class)codableEventClass;
- (BOOL)success;
- (NSString)bundleIdentifier;
- (NSString)intentIdentifier;
- (NSString)key;
- (NSString)sectionIdentifier;
- (void)setBundleIdentifier:(id)a3;
- (void)setIntentIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSuccess:(BOOL)a3;
@end

@implementation WFActionButtonConfigurationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setIntentIdentifier:(id)a3
{
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
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