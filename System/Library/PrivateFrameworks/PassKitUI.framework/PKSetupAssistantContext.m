@interface PKSetupAssistantContext
- (BOOL)allowsCachedCardRequirements;
- (BOOL)isFollowupAction;
- (NSData)externalizedContext;
- (NSString)description;
- (PKPaymentSetupViewControllerDelegate)delegate;
- (PKSetupAssistantContext)init;
- (PKSetupAssistantContext)initWithSetupAssistant:(unint64_t)a3;
- (PKSetupAssistantContext)initWithSetupAssistantAsFollowupAction:(unint64_t)a3;
- (unint64_t)setupAssistant;
- (void)extendableDescription:(id)a3;
- (void)prepareForFollowupQueryWithHandler:(id)a3;
- (void)setAllowsCachedCardRequirements:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExternalizedContext:(id)a3;
- (void)setSetupAssistant:(unint64_t)a3;
@end

@implementation PKSetupAssistantContext

- (PKSetupAssistantContext)init
{
  return [(PKSetupAssistantContext *)self initWithSetupAssistant:1];
}

- (PKSetupAssistantContext)initWithSetupAssistant:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKSetupAssistantContext;
  result = [(PKSetupAssistantContext *)&v6 init];
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

- (PKSetupAssistantContext)initWithSetupAssistantAsFollowupAction:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKSetupAssistantContext;
  result = [(PKSetupAssistantContext *)&v5 init];
  if (result)
  {
    result->_setupAssistant = a3;
    result->_isFollowupAction = 1;
  }
  return result;
}

- (void)prepareForFollowupQueryWithHandler:(id)a3
{
  if (a3)
  {
    self->_allowsCachedCardRequirements = 0;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_allowsCachedCardRequirements = 1;
  }
}

- (BOOL)allowsCachedCardRequirements
{
  if (self->_allowsCachedCardRequirements) {
    return PKRunningInPassd() ^ 1;
  }
  else {
    return 0;
  }
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [(PKSetupAssistantContext *)self extendableDescription:v3];
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (void)extendableDescription:(id)a3
{
  unint64_t setupAssistant = self->_setupAssistant;
  id v5 = a3;
  objc_msgSend(v5, "appendFormat:", @"setupAssistant: '%lu'; ", setupAssistant);
  if (self->_isFollowupAction) {
    objc_super v6 = @"YES";
  }
  else {
    objc_super v6 = @"NO";
  }
  [v5 appendFormat:@"isFollowupAction: '%@'; ", v6];
  if (self->_allowsCachedCardRequirements) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v5 appendFormat:@"allowsCachedCardRequirements: %@; ", v7];
  if (self->_externalizedContext) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v5 appendFormat:@"hasExternalizedContext: '%@'; ", v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [v5 appendFormat:@"delegate: '%@'; ", WeakRetained];
}

- (unint64_t)setupAssistant
{
  return self->_setupAssistant;
}

- (void)setSetupAssistant:(unint64_t)a3
{
  self->_unint64_t setupAssistant = a3;
}

- (BOOL)isFollowupAction
{
  return self->_isFollowupAction;
}

- (void)setAllowsCachedCardRequirements:(BOOL)a3
{
  self->_allowsCachedCardRequirements = a3;
}

- (NSData)externalizedContext
{
  return self->_externalizedContext;
}

- (void)setExternalizedContext:(id)a3
{
}

- (PKPaymentSetupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentSetupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_externalizedContext, 0);
}

@end