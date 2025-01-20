@interface PKSetupAssistantUtilityContext
- (BOOL)allowsCachedCardRequirements;
- (BOOL)isFollowupAction;
- (NSData)externalizedContext;
- (PKSetupAssistantUtilityContext)initWithSetupAssistant:(unint64_t)a3;
- (unint64_t)setupAssistant;
- (void)setExternalizedContext:(id)a3;
@end

@implementation PKSetupAssistantUtilityContext

- (PKSetupAssistantUtilityContext)initWithSetupAssistant:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKSetupAssistantUtilityContext;
  result = [(PKSetupAssistantUtilityContext *)&v6 init];
  if (result)
  {
    if (a3 == 2) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
    result->_setupAssistant = v5;
    result->_allowsCachedCardRequirements = 1;
  }
  return result;
}

- (unint64_t)setupAssistant
{
  return self->_setupAssistant;
}

- (NSData)externalizedContext
{
  return self->externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
}

- (BOOL)isFollowupAction
{
  return self->isFollowupAction;
}

- (BOOL)allowsCachedCardRequirements
{
  return self->_allowsCachedCardRequirements;
}

- (void).cxx_destruct
{
}

@end