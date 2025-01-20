@interface WFRunShortcutEvent
+ (Class)codableEventClass;
+ (id)serializablePropertyTransformers;
- (BOOL)completed;
- (BOOL)didRunRemotely;
- (BOOL)isFromAutomationSuggestion;
- (NSString)automationSuggestionsTrialIdentifier;
- (NSString)automationType;
- (NSString)galleryIdentifier;
- (NSString)key;
- (NSString)runSource;
- (NSString)scriptingRunBundleIdentifier;
- (NSString)shortcutSource;
- (unsigned)actionCount;
- (unsigned)numberOfDialogsPresented;
- (void)setActionCount:(unsigned int)a3;
- (void)setAutomationSuggestionsTrialIdentifier:(id)a3;
- (void)setAutomationType:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDidRunRemotely:(BOOL)a3;
- (void)setGalleryIdentifier:(id)a3;
- (void)setIsFromAutomationSuggestion:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setNumberOfDialogsPresented:(unsigned int)a3;
- (void)setRunSource:(id)a3;
- (void)setScriptingRunBundleIdentifier:(id)a3;
- (void)setShortcutSource:(id)a3;
@end

@implementation WFRunShortcutEvent

+ (id)serializablePropertyTransformers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"actionCount";
  v2 = objc_alloc_init(WFEventSignificantFigureValueTransformer);
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptingRunBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setScriptingRunBundleIdentifier:(id)a3
{
}

- (NSString)scriptingRunBundleIdentifier
{
  return self->_scriptingRunBundleIdentifier;
}

- (void)setIsFromAutomationSuggestion:(BOOL)a3
{
  self->_isFromAutomationSuggestion = a3;
}

- (BOOL)isFromAutomationSuggestion
{
  return self->_isFromAutomationSuggestion;
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

- (void)setNumberOfDialogsPresented:(unsigned int)a3
{
  self->_numberOfDialogsPresented = a3;
}

- (unsigned)numberOfDialogsPresented
{
  return self->_numberOfDialogsPresented;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setAutomationType:(id)a3
{
}

- (NSString)automationType
{
  return self->_automationType;
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