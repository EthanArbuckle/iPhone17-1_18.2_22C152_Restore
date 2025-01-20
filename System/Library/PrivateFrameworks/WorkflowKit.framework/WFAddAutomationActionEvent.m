@interface WFAddAutomationActionEvent
+ (Class)codableEventClass;
- (NSString)actionIdentifier;
- (NSString)key;
- (NSString)shortcutIdentifier;
- (unsigned)actionIndex;
- (void)setActionIdentifier:(id)a3;
- (void)setActionIndex:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setShortcutIdentifier:(id)a3;
@end

@implementation WFAddAutomationActionEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setActionIndex:(unsigned int)a3
{
  self->_actionIndex = a3;
}

- (unsigned)actionIndex
{
  return self->_actionIndex;
}

- (void)setShortcutIdentifier:(id)a3
{
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end