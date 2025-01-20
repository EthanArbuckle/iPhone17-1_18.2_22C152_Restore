@interface TIKeyboardConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)assertDefaultKeyPlane;
- (NSArray)multilingualLanguages;
- (NSDictionary)contextualDisplayKeys;
- (NSDictionary)trialParameters;
- (NSString)accentKeyString;
- (NSString)layoutTag;
- (TIKeyboardConfiguration)initWithCoder:(id)a3;
- (TIKeyboardInputManagerState)inputManagerState;
- (TIKeyboardIntermediateText)intermediateText;
- (void)encodeWithCoder:(id)a3;
- (void)setAccentKeyString:(id)a3;
- (void)setAssertDefaultKeyPlane:(BOOL)a3;
- (void)setContextualDisplayKeys:(id)a3;
- (void)setInputManagerState:(id)a3;
- (void)setIntermediateText:(id)a3;
- (void)setLayoutTag:(id)a3;
- (void)setMultilingualLanguages:(id)a3;
- (void)setTrialParameters:(id)a3;
@end

@implementation TIKeyboardConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialParameters, 0);
  objc_storeStrong((id *)&self->_multilingualLanguages, 0);
  objc_storeStrong((id *)&self->_contextualDisplayKeys, 0);
  objc_storeStrong((id *)&self->_accentKeyString, 0);
  objc_storeStrong((id *)&self->_layoutTag, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);

  objc_storeStrong((id *)&self->_inputManagerState, 0);
}

- (void)setTrialParameters:(id)a3
{
}

- (NSDictionary)trialParameters
{
  return self->_trialParameters;
}

- (void)setMultilingualLanguages:(id)a3
{
}

- (NSArray)multilingualLanguages
{
  return self->_multilingualLanguages;
}

- (void)setAssertDefaultKeyPlane:(BOOL)a3
{
  self->_assertDefaultKeyPlane = a3;
}

- (BOOL)assertDefaultKeyPlane
{
  return self->_assertDefaultKeyPlane;
}

- (void)setContextualDisplayKeys:(id)a3
{
}

- (NSDictionary)contextualDisplayKeys
{
  return self->_contextualDisplayKeys;
}

- (void)setAccentKeyString:(id)a3
{
}

- (NSString)accentKeyString
{
  return self->_accentKeyString;
}

- (void)setLayoutTag:(id)a3
{
}

- (NSString)layoutTag
{
  return self->_layoutTag;
}

- (void)setIntermediateText:(id)a3
{
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (void)setInputManagerState:(id)a3
{
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return self->_inputManagerState;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  inputManagerState = self->_inputManagerState;
  id v12 = v4;
  if (inputManagerState)
  {
    [v4 encodeObject:inputManagerState forKey:@"inputManagerState"];
    id v4 = v12;
  }
  intermediateText = self->_intermediateText;
  if (intermediateText)
  {
    [v12 encodeObject:intermediateText forKey:@"intermediateText"];
    id v4 = v12;
  }
  layoutTag = self->_layoutTag;
  if (layoutTag)
  {
    [v12 encodeObject:layoutTag forKey:@"layoutTag"];
    id v4 = v12;
  }
  accentKeyString = self->_accentKeyString;
  if (accentKeyString)
  {
    [v12 encodeObject:accentKeyString forKey:@"accentKeyString"];
    id v4 = v12;
  }
  if (self->_assertDefaultKeyPlane)
  {
    [v12 encodeBool:1 forKey:@"assertDefaultKeyPlane"];
    id v4 = v12;
  }
  multilingualLanguages = self->_multilingualLanguages;
  if (multilingualLanguages)
  {
    [v12 encodeObject:multilingualLanguages forKey:@"multilingualLanguages"];
    id v4 = v12;
  }
  trialParameters = self->_trialParameters;
  if (trialParameters)
  {
    [v12 encodeObject:trialParameters forKey:@"trialParameters"];
    id v4 = v12;
  }
  contextualDisplayKeys = self->_contextualDisplayKeys;
  if (contextualDisplayKeys)
  {
    [v12 encodeObject:contextualDisplayKeys forKey:@"contextualDisplayKeys"];
    id v4 = v12;
  }
}

- (TIKeyboardConfiguration)initWithCoder:(id)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TIKeyboardConfiguration;
  v5 = [(TIKeyboardConfiguration *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputManagerState"];
    inputManagerState = v5->_inputManagerState;
    v5->_inputManagerState = (TIKeyboardInputManagerState *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intermediateText"];
    intermediateText = v5->_intermediateText;
    v5->_intermediateText = (TIKeyboardIntermediateText *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutTag"];
    uint64_t v11 = [v10 copy];
    layoutTag = v5->_layoutTag;
    v5->_layoutTag = (NSString *)v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accentKeyString"];
    uint64_t v14 = [v13 copy];
    accentKeyString = v5->_accentKeyString;
    v5->_accentKeyString = (NSString *)v14;

    v5->_assertDefaultKeyPlane = [v4 decodeBoolForKey:@"assertDefaultKeyPlane"];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"multilingualLanguages"];
    multilingualLanguages = v5->_multilingualLanguages;
    v5->_multilingualLanguages = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    v23 = [v21 setWithArray:v22];
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"trialParameters"];
    uint64_t v25 = [v24 copy];
    trialParameters = v5->_trialParameters;
    v5->_trialParameters = (NSDictionary *)v25;

    uint64_t v27 = objc_opt_class();
    v28 = [v4 decodeDictionaryWithKeysOfClass:v27 objectsOfClass:objc_opt_class() forKey:@"contextualDisplayKeys"];
    uint64_t v29 = [v28 copy];
    contextualDisplayKeys = v5->_contextualDisplayKeys;
    v5->_contextualDisplayKeys = (NSDictionary *)v29;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end