@interface WFSuggestAutomationEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (BOOL)interacted;
- (NSString)key;
- (NSString)source;
- (NSString)suggestedAutomationIdentifier;
- (void)setCompleted:(BOOL)a3;
- (void)setInteracted:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(id)a3;
- (void)setSuggestedAutomationIdentifier:(id)a3;
@end

@implementation WFSuggestAutomationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setSource:(id)a3
{
}

- (NSString)source
{
  return self->_source;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setInteracted:(BOOL)a3
{
  self->_interacted = a3;
}

- (BOOL)interacted
{
  return self->_interacted;
}

- (void)setSuggestedAutomationIdentifier:(id)a3
{
}

- (NSString)suggestedAutomationIdentifier
{
  return self->_suggestedAutomationIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

@end