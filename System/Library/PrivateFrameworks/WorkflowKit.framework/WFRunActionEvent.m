@interface WFRunActionEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (BOOL)didRunRemotely;
- (BOOL)isInvalidatedSystemAction;
- (NSString)actionIdentifier;
- (NSString)automationType;
- (NSString)externalActionIdentifier;
- (NSString)externalBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)runSource;
- (NSString)shortcutSource;
- (void)setActionIdentifier:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setExternalActionIdentifier:(id)a3;
- (void)setExternalBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setIsInvalidatedSystemAction:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRunSource:(id)a3;
- (void)setShortcutSource:(id)a3;
@end

@implementation WFRunActionEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_externalActionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setIsInvalidatedSystemAction:(BOOL)a3
{
  self->_isInvalidatedSystemAction = a3;
}

- (BOOL)isInvalidatedSystemAction
{
  return self->_isInvalidatedSystemAction;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  self->_didRunRemotely = a3;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setExternalActionIdentifier:(id)a3
{
}

- (NSString)externalActionIdentifier
{
  return self->_externalActionIdentifier;
}

- (void)setExternalBundleIdentifier:(id)a3
{
}

- (NSString)externalBundleIdentifier
{
  return self->_externalBundleIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setRunSource:(id)a3
{
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setShortcutSource:(id)a3
{
}

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end