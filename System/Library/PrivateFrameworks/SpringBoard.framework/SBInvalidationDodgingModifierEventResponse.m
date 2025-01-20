@interface SBInvalidationDodgingModifierEventResponse
+ (id)responseWithOptions:(unint64_t)a3;
- (BOOL)disableCoalescing;
- (NSString)completionIdentifier;
- (NSString)identifier;
- (SBInvalidationDodgingModifierEventResponse)initWithOptions:(unint64_t)a3;
- (id)description;
- (unint64_t)options;
- (unint64_t)type;
- (void)setCompletionIdentifier:(id)a3;
- (void)setDisableCoalescing:(BOOL)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation SBInvalidationDodgingModifierEventResponse

+ (id)responseWithOptions:(unint64_t)a3
{
  v3 = [[SBInvalidationDodgingModifierEventResponse alloc] initWithOptions:a3];
  return v3;
}

- (SBInvalidationDodgingModifierEventResponse)initWithOptions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBInvalidationDodgingModifierEventResponse;
  result = [(SBChainableModifierEventResponse *)&v5 init];
  if (result) {
    result->_options = a3;
  }
  return result;
}

- (unint64_t)type
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SBInvalidationDodgingModifierEventResponse;
  v4 = [(SBDodgingModifierEventResponse *)&v8 description];
  objc_super v5 = SBStringFromInvalidationEventResponseOptions(self->_options);
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)disableCoalescing
{
  return self->_disableCoalescing;
}

- (void)setDisableCoalescing:(BOOL)a3
{
  self->_disableCoalescing = a3;
}

- (NSString)completionIdentifier
{
  return self->_completionIdentifier;
}

- (void)setCompletionIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_completionIdentifier, 0);
}

@end