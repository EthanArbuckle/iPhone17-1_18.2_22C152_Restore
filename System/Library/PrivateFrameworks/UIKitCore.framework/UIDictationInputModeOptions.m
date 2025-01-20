@interface UIDictationInputModeOptions
+ (BOOL)supportsSecureCoding;
+ (UIDictationInputModeOptions)dictationInputModeOptionsWithInvocationSource:(id)a3;
- (BOOL)shouldStayInDictationInputModeIfAutoEndpointed;
- (BOOL)shouldSupressShowingAlternativesAutomatically;
- (NSString)invocationSource;
- (UIDictationInputModeOptions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInvocationSource:(id)a3;
- (void)setShouldStayInDictationInputModeIfAutoEndpointed:(BOOL)a3;
- (void)setShouldSupressShowingAlternativesAutomatically:(BOOL)a3;
@end

@implementation UIDictationInputModeOptions

+ (UIDictationInputModeOptions)dictationInputModeOptionsWithInvocationSource:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(UIDictationInputModeOptions);
  [(UIDictationInputModeOptions *)v4 setInvocationSource:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDictationInputModeOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v5 = [(UIDictationInputModeOptions *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationSource"];
    invocationSource = v5->_invocationSource;
    v5->_invocationSource = (NSString *)v6;

    v5->_shouldStayInDictationInputModeIfAutoEndpointed = [v4 decodeBoolForKey:@"shouldStayIn"];
    v5->_shouldSupressShowingAlternativesAutomatically = [v4 decodeBoolForKey:@"shouldSuppressShowing"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  if (([v6 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  invocationSource = self->_invocationSource;
  v5 = v6;
  if (invocationSource)
  {
    [v6 encodeObject:invocationSource forKey:@"invocationSource"];
    v5 = v6;
  }
  [v5 encodeBool:self->_shouldStayInDictationInputModeIfAutoEndpointed forKey:@"shouldStayIn"];
  [v6 encodeBool:self->_shouldSupressShowingAlternativesAutomatically forKey:@"shouldSuppressShowing"];
}

- (NSString)invocationSource
{
  return self->_invocationSource;
}

- (void)setInvocationSource:(id)a3
{
}

- (BOOL)shouldStayInDictationInputModeIfAutoEndpointed
{
  return self->_shouldStayInDictationInputModeIfAutoEndpointed;
}

- (void)setShouldStayInDictationInputModeIfAutoEndpointed:(BOOL)a3
{
  self->_shouldStayInDictationInputModeIfAutoEndpointed = a3;
}

- (BOOL)shouldSupressShowingAlternativesAutomatically
{
  return self->_shouldSupressShowingAlternativesAutomatically;
}

- (void)setShouldSupressShowingAlternativesAutomatically:(BOOL)a3
{
  self->_shouldSupressShowingAlternativesAutomatically = a3;
}

- (void).cxx_destruct
{
}

@end