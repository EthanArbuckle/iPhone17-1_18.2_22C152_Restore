@interface PKBuinessChatApplyContext
- (BOOL)requiresAuthorization;
- (PKBuinessChatApplyContext)initWithIdentifier:(id)a3 intent:(int64_t)a4;
- (id)bodyText;
- (id)businessIdentifier;
- (id)groupParameters;
- (id)intentParameters;
@end

@implementation PKBuinessChatApplyContext

- (PKBuinessChatApplyContext)initWithIdentifier:(id)a3 intent:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKBuinessChatApplyContext;
  v8 = [(PKBuinessChatApplyContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_intent = a4;
  }

  return v9;
}

- (id)businessIdentifier
{
  return self->_identifier;
}

- (id)intentParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  unint64_t intent = self->_intent;
  if (intent > 2) {
    v6 = 0;
  }
  else {
    v6 = off_1E59CCE30[intent];
  }
  [v3 setObject:v6 forKeyedSubscript:@"targetDialog"];
  id v7 = (void *)[v4 copy];

  return v7;
}

- (id)groupParameters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:@"apple_pay" forKeyedSubscript:@"domain"];
  [v3 setObject:@"Wallet" forKeyedSubscript:@"origin"];
  unint64_t intent = self->_intent;
  if (intent > 2) {
    v5 = 0;
  }
  else {
    v5 = off_1E59CCE48[intent];
  }
  [v3 setObject:v5 forKeyedSubscript:@"page"];
  v6 = (void *)[v3 copy];

  return v6;
}

- (BOOL)requiresAuthorization
{
  return 1;
}

- (id)bodyText
{
  int64_t intent = self->_intent;
  if (intent == 1 || intent == 2)
  {
    id v3 = PKLocalizedFeatureStringWithDefaultValue();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void).cxx_destruct
{
}

@end