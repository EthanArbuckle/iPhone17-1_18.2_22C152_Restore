@interface WFSetupSuggestedAutomationEvent
+ (Class)codableEventClass;
- (BOOL)completed;
- (NSString)key;
- (NSString)suggestedAutomationIdentifier;
- (unsigned)currentStep;
- (void)setCompleted:(BOOL)a3;
- (void)setCurrentStep:(unsigned int)a3;
- (void)setKey:(id)a3;
- (void)setSuggestedAutomationIdentifier:(id)a3;
@end

@implementation WFSetupSuggestedAutomationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedAutomationIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCurrentStep:(unsigned int)a3
{
  self->_currentStep = a3;
}

- (unsigned)currentStep
{
  return self->_currentStep;
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