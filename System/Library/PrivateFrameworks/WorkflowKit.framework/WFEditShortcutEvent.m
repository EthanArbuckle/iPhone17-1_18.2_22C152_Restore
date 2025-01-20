@interface WFEditShortcutEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (NSString)addToSiriBundleIdentifier;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)shortcutSource;
- (unsigned)actionCount;
- (unsigned)numberOfEngagedSuggestions;
- (unsigned)numberOfManuallyAddedActions;
- (unsigned)startingActionCount;
- (void)setActionCount:(unsigned int)a3;
- (void)setAddToSiriBundleIdentifier:(id)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setKey:(id)a3;
- (void)setNumberOfEngagedSuggestions:(unsigned int)a3;
- (void)setNumberOfManuallyAddedActions:(unsigned int)a3;
- (void)setShortcutSource:(id)a3;
- (void)setStartingActionCount:(unsigned int)a3;
@end

@implementation WFEditShortcutEvent

+ (id)serializablePropertyTransformers
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"actionCount";
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[1] = @"startingActionCount";
  v7[0] = v2;
  v3 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_addToSiriBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setStartingActionCount:(unsigned int)a3
{
  self->_startingActionCount = a3;
}

- (unsigned)startingActionCount
{
  return self->_startingActionCount;
}

- (void)setNumberOfManuallyAddedActions:(unsigned int)a3
{
  self->_numberOfManuallyAddedActions = a3;
}

- (unsigned)numberOfManuallyAddedActions
{
  return self->_numberOfManuallyAddedActions;
}

- (void)setNumberOfEngagedSuggestions:(unsigned int)a3
{
  self->_numberOfEngagedSuggestions = a3;
}

- (unsigned)numberOfEngagedSuggestions
{
  return self->_numberOfEngagedSuggestions;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setAddToSiriBundleIdentifier:(id)a3
{
}

- (NSString)addToSiriBundleIdentifier
{
  return self->_addToSiriBundleIdentifier;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (unsigned)actionCount
{
  return self->_actionCount;
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