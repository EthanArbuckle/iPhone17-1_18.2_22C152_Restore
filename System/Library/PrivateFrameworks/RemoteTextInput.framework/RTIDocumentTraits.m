@interface RTIDocumentTraits
+ (BOOL)supportsSecureCoding;
- (BOOL)devicePasscodeEntry;
- (BOOL)disableAutomaticKeyboardUI;
- (BOOL)disableInputBars;
- (BOOL)disablePrediction;
- (BOOL)hidePrediction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicitAutoFillMode;
- (BOOL)isSingleLineDocument;
- (BOOL)shouldLoadAutofillSignUp;
- (BOOL)shouldReverseLayoutDirection;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsEmojiImageTextAttachments;
- (BOOL)supportsImagePaste;
- (CAFenceHandle)fenceHandle;
- (NSArray)additionalLocaleIdentifiers;
- (NSArray)associatedDomains;
- (NSArray)enabledSupplementalLexiconIdentifiers;
- (NSArray)supportedPayloadIds;
- (NSCopying)responderId;
- (NSData)textInputModeData;
- (NSDictionary)autofillContext;
- (NSDictionary)userInfo;
- (NSIndexSet)PINEntrySeparatorIndexes;
- (NSString)appId;
- (NSString)appName;
- (NSString)bundleId;
- (NSString)localizedAppName;
- (NSString)passwordRules;
- (NSString)prompt;
- (NSString)recipientId;
- (NSString)responseContext;
- (NSString)sceneID;
- (NSString)textInputContextIdentifier;
- (NSString)title;
- (RTIAssistantItem)assistantItem;
- (RTIDocumentTraits)init;
- (RTIDocumentTraits)initWithCoder:(id)a3;
- (RTIInputViewInfo)assistantViewInfo;
- (RTIInputViewInfo)inputViewInfo;
- (RTITextInputKeyboardActionButtonConfiguration)keyboardActionButtonConfiguration;
- (TIInputContextHistory)inputContextHistory;
- (TITextInputTraits)textInputTraits;
- (_NSRange)validTextRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)processId;
- (unint64_t)autofillMode;
- (unint64_t)autofillSubMode;
- (unint64_t)delegateConformanceType;
- (unint64_t)entityID;
- (unint64_t)layerID;
- (unsigned)contextID;
- (void)copyContextualPropertiesFromDocumentTraits:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalLocaleIdentifiers:(id)a3;
- (void)setAppId:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAssistantItem:(id)a3;
- (void)setAssistantViewInfo:(id)a3;
- (void)setAssociatedDomains:(id)a3;
- (void)setAutofillContext:(id)a3;
- (void)setAutofillMode:(unint64_t)a3;
- (void)setAutofillSubMode:(unint64_t)a3;
- (void)setBundleId:(id)a3;
- (void)setContextID:(unsigned int)a3;
- (void)setDelegateConformanceType:(unint64_t)a3;
- (void)setDevicePasscodeEntry:(BOOL)a3;
- (void)setDisableAutomaticKeyboardUI:(BOOL)a3;
- (void)setDisableInputBars:(BOOL)a3;
- (void)setDisablePrediction:(BOOL)a3;
- (void)setEnabledSupplementalLexiconIdentifiers:(id)a3;
- (void)setEntityID:(unint64_t)a3;
- (void)setExplicitAutoFillMode:(BOOL)a3;
- (void)setFenceHandle:(id)a3;
- (void)setHidePrediction:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputViewInfo:(id)a3;
- (void)setKeyboardActionButtonConfiguration:(id)a3;
- (void)setLayerID:(unint64_t)a3;
- (void)setLocalizedAppName:(id)a3;
- (void)setPINEntrySeparatorIndexes:(id)a3;
- (void)setPasswordRules:(id)a3;
- (void)setProcessId:(int)a3;
- (void)setPrompt:(id)a3;
- (void)setRecipientId:(id)a3;
- (void)setResponderId:(id)a3;
- (void)setResponseContext:(id)a3;
- (void)setSceneID:(id)a3;
- (void)setShouldLoadAutofillSignUp:(BOOL)a3;
- (void)setShouldReverseLayoutDirection:(BOOL)a3;
- (void)setSingleLineDocument:(BOOL)a3;
- (void)setSupportedPayloadIds:(id)a3;
- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3;
- (void)setSupportsEmojiImageTextAttachments:(BOOL)a3;
- (void)setSupportsImagePaste:(BOOL)a3;
- (void)setTextInputContextIdentifier:(id)a3;
- (void)setTextInputModeData:(id)a3;
- (void)setTextInputTraits:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setValidTextRange:(_NSRange)a3;
@end

@implementation RTIDocumentTraits

- (void)dealloc
{
  [(CAFenceHandle *)self->_fenceHandle invalidate];
  v3.receiver = self;
  v3.super_class = (Class)RTIDocumentTraits;
  [(RTIDocumentTraits *)&v3 dealloc];
}

- (BOOL)shouldLoadAutofillSignUp
{
  return self->_textInputTraitsMask.integerValue & 1;
}

- (void)setShouldLoadAutofillSignUp:(BOOL)a3
{
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFFE | a3;
}

- (BOOL)supportsImagePaste
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 1) & 1;
}

- (void)setSupportsImagePaste:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFFD | v3;
}

- (BOOL)supportsEmojiImageTextAttachments
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 10) & 1;
}

- (void)setSupportsEmojiImageTextAttachments:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFBFF | v3;
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 10) & 1;
}

- (void)setSupportsAdaptiveImageGlyph:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFBFF | v3;
}

- (BOOL)devicePasscodeEntry
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 2) & 1;
}

- (void)setDevicePasscodeEntry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFFB | v3;
}

- (BOOL)disableInputBars
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 3) & 1;
}

- (void)setDisableInputBars:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFF7 | v3;
}

- (BOOL)disablePrediction
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 4) & 1;
}

- (void)setDisablePrediction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFEF | v3;
}

- (BOOL)hidePrediction
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 5) & 1;
}

- (void)setHidePrediction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFDF | v3;
}

- (BOOL)disableAutomaticKeyboardUI
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 6) & 1;
}

- (void)setDisableAutomaticKeyboardUI:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFFBF | v3;
}

- (BOOL)shouldReverseLayoutDirection
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 7) & 1;
}

- (void)setShouldReverseLayoutDirection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFF7F | v3;
}

- (BOOL)isExplicitAutoFillMode
{
  return HIBYTE(LOWORD(self->_textInputTraitsMask.integerValue)) & 1;
}

- (void)setExplicitAutoFillMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFEFF | v3;
}

- (BOOL)isSingleLineDocument
{
  return (LOWORD(self->_textInputTraitsMask.integerValue) >> 9) & 1;
}

- (void)setSingleLineDocument:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  LOWORD(self->_textInputTraitsMask.integerValue) = self->_textInputTraitsMask.integerValue & 0xFDFF | v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v42 = a3;
  if (([v42 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The coder must allow keyed coding."];
  }
  uint64_t processId = self->_processId;
  if (processId) {
    [v42 encodeInt32:processId forKey:@"pId"];
  }
  appId = self->_appId;
  if (appId)
  {
    if (self->_bundleId)
    {
      if ([(NSString *)self->_appId hasSuffix:self->_bundleId])
      {
        [v42 encodeBool:1 forKey:@"a2bId"];
        v6 = [(NSString *)self->_appId substringToIndex:[(NSString *)self->_appId length] - [(NSString *)self->_bundleId length]];
        [v42 encodeObject:v6 forKey:@"aId"];

        goto LABEL_11;
      }
      appId = self->_appId;
    }
    [v42 encodeObject:appId forKey:@"aId"];
  }
LABEL_11:
  bundleId = self->_bundleId;
  if (bundleId) {
    [v42 encodeObject:bundleId forKey:@"bId"];
  }
  appName = self->_appName;
  if (appName) {
    [v42 encodeObject:appName forKey:@"app"];
  }
  localizedAppName = self->_localizedAppName;
  if (localizedAppName) {
    [v42 encodeObject:localizedAppName forKey:@"locApp"];
  }
  if ([(NSArray *)self->_associatedDomains count])
  {
    v10 = [(NSArray *)self->_associatedDomains componentsJoinedByString:@"\n"];
    v11 = (void *)[v10 copy];

    [v42 encodeObject:v11 forKey:@"assdDmns"];
  }
  responderId = self->_responderId;
  if (responderId) {
    [v42 encodeObject:responderId forKey:@"rId"];
  }
  sceneID = self->_sceneID;
  if (sceneID) {
    [v42 encodeObject:sceneID forKey:@"sceneId"];
  }
  unint64_t entityID = self->_entityID;
  if (entityID) {
    [v42 encodeInt64:entityID forKey:@"entityId"];
  }
  uint64_t contextID = self->_contextID;
  if (contextID) {
    [v42 encodeInt32:contextID forKey:@"ctxId"];
  }
  unint64_t layerID = self->_layerID;
  if (layerID) {
    [v42 encodeInt64:layerID forKey:@"layerId"];
  }
  unint64_t delegateConformanceType = self->_delegateConformanceType;
  if (delegateConformanceType) {
    [v42 encodeInt32:delegateConformanceType forKey:@"cfmType"];
  }
  title = self->_title;
  if (title) {
    [v42 encodeObject:title forKey:@"title"];
  }
  prompt = self->_prompt;
  if (prompt) {
    [v42 encodeObject:prompt forKey:@"prompt"];
  }
  textInputTraits = self->_textInputTraits;
  if (textInputTraits) {
    [v42 encodeObject:textInputTraits forKey:@"tiTraits"];
  }
  keyboardActionButtonConfiguration = self->_keyboardActionButtonConfiguration;
  if (keyboardActionButtonConfiguration) {
    [v42 encodeObject:keyboardActionButtonConfiguration forKey:@"kABC"];
  }
  textInputContextIdentifier = self->_textInputContextIdentifier;
  if (textInputContextIdentifier) {
    [v42 encodeObject:textInputContextIdentifier forKey:@"tiCtxId"];
  }
  PINEntrySeparatorIndexes = self->_PINEntrySeparatorIndexes;
  if (PINEntrySeparatorIndexes) {
    [v42 encodeObject:PINEntrySeparatorIndexes forKey:@"pinIdxs"];
  }
  NSUInteger length = self->_validTextRange.length;
  if (self->_validTextRange.location || length != -1) {
    [v42 encodeInt32:(unsigned __int16)self->_validTextRange.location | ((unsigned __int16)length << 16) forKey:@"validRange"];
  }
  unint64_t autofillMode = self->_autofillMode;
  if (autofillMode) {
    [v42 encodeInt32:autofillMode forKey:@"afMode"];
  }
  unint64_t autofillSubMode = self->_autofillSubMode;
  if (autofillSubMode) {
    [v42 encodeInt32:autofillSubMode forKey:@"afSubMode"];
  }
  if ([(NSDictionary *)self->_autofillContext count]) {
    [v42 encodeObject:self->_autofillContext forKey:@"afCtx"];
  }
  passwordRules = self->_passwordRules;
  if (passwordRules) {
    [v42 encodeObject:passwordRules forKey:@"pwRules"];
  }
  inputViewInfo = self->_inputViewInfo;
  v29 = v42;
  if (inputViewInfo)
  {
    [v42 encodeObject:inputViewInfo forKey:@"ivInfo"];
    v29 = v42;
  }
  assistantViewInfo = self->_assistantViewInfo;
  if (assistantViewInfo)
  {
    [v42 encodeObject:assistantViewInfo forKey:@"avInfo"];
    v29 = v42;
  }
  assistantItem = self->_assistantItem;
  if (assistantItem)
  {
    [v42 encodeObject:assistantItem forKey:@"aItem"];
    v29 = v42;
  }
  recipientId = self->_recipientId;
  if (recipientId)
  {
    [v42 encodeObject:recipientId forKey:@"recpId"];
    v29 = v42;
  }
  responseContext = self->_responseContext;
  if (responseContext)
  {
    [v42 encodeObject:responseContext forKey:@"respCtx"];
    v29 = v42;
  }
  inputContextHistory = self->_inputContextHistory;
  if (inputContextHistory)
  {
    [v42 encodeObject:inputContextHistory forKey:@"ctxHistory"];
    v29 = v42;
  }
  enabledSupplementalLexiconIdentifiers = self->_enabledSupplementalLexiconIdentifiers;
  if (enabledSupplementalLexiconIdentifiers)
  {
    [v42 encodeObject:enabledSupplementalLexiconIdentifiers forKey:@"aSuppLexIds"];
    v29 = v42;
  }
  supportedPayloadIds = self->_supportedPayloadIds;
  if (supportedPayloadIds)
  {
    [v42 encodeObject:supportedPayloadIds forKey:@"payIds"];
    v29 = v42;
  }
  userInfo = self->_userInfo;
  if (userInfo)
  {
    [v42 encodeObject:userInfo forKey:@"userInfo"];
    v29 = v42;
  }
  fenceHandle = self->_fenceHandle;
  if (fenceHandle)
  {
    [v42 encodeObject:fenceHandle forKey:@"fenceHandle"];
    v29 = v42;
  }
  textInputModeData = self->_textInputModeData;
  if (textInputModeData)
  {
    [v42 encodeObject:textInputModeData forKey:@"inputModeData"];
    v29 = v42;
  }
  additionalLocaleIdentifiers = self->_additionalLocaleIdentifiers;
  if (additionalLocaleIdentifiers)
  {
    [v42 encodeObject:additionalLocaleIdentifiers forKey:@"addedLocales"];
    v29 = v42;
  }
  uint64_t integerValue = self->_textInputTraitsMask.integerValue;
  if (integerValue)
  {
    [v42 encodeInt32:integerValue forKey:@"traitsMask"];
    v29 = v42;
  }
}

- (RTIDocumentTraits)initWithCoder:(id)a3
{
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The decoder must allow keyed coding."];
  }
  v99.receiver = self;
  v99.super_class = (Class)RTIDocumentTraits;
  v5 = [(RTIDocumentTraits *)&v99 init];
  if (v5)
  {
    v5->_uint64_t processId = [v4 decodeInt32ForKey:@"pId"];
    int v6 = [v4 decodeBoolForKey:@"a2bId"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aId"];
    uint64_t v8 = [v7 copy];
    appId = v5->_appId;
    v5->_appId = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bId"];
    uint64_t v11 = [v10 copy];
    bundleId = v5->_bundleId;
    v5->_bundleId = (NSString *)v11;

    if (v6 && v5->_bundleId)
    {
      uint64_t v13 = -[NSString stringByAppendingString:](v5->_appId, "stringByAppendingString:");
      v14 = v5->_appId;
      v5->_appId = (NSString *)v13;
    }
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"app"];
    uint64_t v16 = [v15 copy];
    appName = v5->_appName;
    v5->_appName = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locApp"];
    uint64_t v19 = [v18 copy];
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assdDmns"];
    v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 componentsSeparatedByString:@"\n"];
      associatedDomains = v5->_associatedDomains;
      v5->_associatedDomains = (NSArray *)v23;
    }
    v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v28 = [v4 decodeObjectOfClasses:v27 forKey:@"rId"];
    uint64_t v29 = [v28 copy];
    responderId = v5->_responderId;
    v5->_responderId = (NSCopying *)v29;

    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneId"];
    uint64_t v32 = [v31 copy];
    sceneID = v5->_sceneID;
    v5->_sceneID = (NSString *)v32;

    v5->_unint64_t entityID = [v4 decodeInt64ForKey:@"entityId"];
    v5->_uint64_t contextID = [v4 decodeInt32ForKey:@"ctxId"];
    v5->_unint64_t layerID = [v4 decodeInt64ForKey:@"layerId"];
    v5->_unint64_t delegateConformanceType = (int)[v4 decodeInt32ForKey:@"cfmType"];
    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v35 = [v34 copy];
    title = v5->_title;
    v5->_title = (NSString *)v35;

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"prompt"];
    uint64_t v38 = [v37 copy];
    prompt = v5->_prompt;
    v5->_prompt = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tiTraits"];
    textInputTraits = v5->_textInputTraits;
    v5->_textInputTraits = (TITextInputTraits *)v40;

    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kABC"];
    keyboardActionButtonConfiguration = v5->_keyboardActionButtonConfiguration;
    v5->_keyboardActionButtonConfiguration = (RTITextInputKeyboardActionButtonConfiguration *)v42;

    uint64_t v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tiCtxId"];
    textInputContextIdentifier = v5->_textInputContextIdentifier;
    v5->_textInputContextIdentifier = (NSString *)v44;

    uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinIdxs"];
    PINEntrySeparatorIndexes = v5->_PINEntrySeparatorIndexes;
    v5->_PINEntrySeparatorIndexes = (NSIndexSet *)v46;

    if ([v4 containsValueForKey:@"validRange"])
    {
      unsigned int v48 = [v4 decodeInt32ForKey:@"validRange"];
      NSUInteger v49 = (unsigned __int16)v48;
      uint64_t v50 = HIWORD(v48);
    }
    else
    {
      NSUInteger v49 = 0;
      uint64_t v50 = -1;
    }
    v5->_validTextRange.location = v49;
    v5->_validTextRange.NSUInteger length = v50;
    if ([v4 containsValueForKey:@"afMode"]) {
      unint64_t v51 = (int)[v4 decodeInt32ForKey:@"afMode"];
    }
    else {
      unint64_t v51 = 0;
    }
    v5->_unint64_t autofillMode = v51;
    if ([v4 containsValueForKey:@"afSubMode"]) {
      unint64_t v52 = (int)[v4 decodeInt32ForKey:@"afSubMode"];
    }
    else {
      unint64_t v52 = 0;
    }
    v5->_unint64_t autofillSubMode = v52;
    v53 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v54 = objc_opt_class();
    uint64_t v55 = objc_opt_class();
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    v58 = objc_msgSend(v53, "setWithObjects:", v54, v55, v56, v57, objc_opt_class(), 0);
    uint64_t v59 = [v4 decodeObjectOfClasses:v58 forKey:@"afCtx"];
    autofillContext = v5->_autofillContext;
    v5->_autofillContext = (NSDictionary *)v59;

    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pwRules"];
    passwordRules = v5->_passwordRules;
    v5->_passwordRules = (NSString *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ivInfo"];
    inputViewInfo = v5->_inputViewInfo;
    v5->_inputViewInfo = (RTIInputViewInfo *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avInfo"];
    assistantViewInfo = v5->_assistantViewInfo;
    v5->_assistantViewInfo = (RTIInputViewInfo *)v65;

    uint64_t v67 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"aItem"];
    assistantItem = v5->_assistantItem;
    v5->_assistantItem = (RTIAssistantItem *)v67;

    uint64_t v69 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recpId"];
    recipientId = v5->_recipientId;
    v5->_recipientId = (NSString *)v69;

    uint64_t v71 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"respCtx"];
    responseContext = v5->_responseContext;
    v5->_responseContext = (NSString *)v71;

    uint64_t v73 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ctxHistory"];
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v73;

    uint64_t v75 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"aSuppLexIds"];
    enabledSupplementalLexiconIdentifiers = v5->_enabledSupplementalLexiconIdentifiers;
    v5->_enabledSupplementalLexiconIdentifiers = (NSArray *)v75;

    v77 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v78 = objc_opt_class();
    v79 = objc_msgSend(v77, "setWithObjects:", v78, objc_opt_class(), 0);
    uint64_t v80 = [v4 decodeObjectOfClasses:v79 forKey:@"payIds"];
    supportedPayloadIds = v5->_supportedPayloadIds;
    v5->_supportedPayloadIds = (NSArray *)v80;

    v82 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v83 = objc_opt_class();
    uint64_t v84 = objc_opt_class();
    uint64_t v85 = objc_opt_class();
    v86 = objc_msgSend(v82, "setWithObjects:", v83, v84, v85, objc_opt_class(), 0);
    uint64_t v87 = [v4 decodeObjectOfClasses:v86 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v87;

    uint64_t v89 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fenceHandle"];
    fenceHandle = v5->_fenceHandle;
    v5->_fenceHandle = (CAFenceHandle *)v89;

    uint64_t v91 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputModeData"];
    textInputModeData = v5->_textInputModeData;
    v5->_textInputModeData = (NSData *)v91;

    v93 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v94 = objc_opt_class();
    v95 = objc_msgSend(v93, "setWithObjects:", v94, objc_opt_class(), 0);
    uint64_t v96 = [v4 decodeObjectOfClasses:v95 forKey:@"addedLocales"];
    additionalLocaleIdentifiers = v5->_additionalLocaleIdentifiers;
    v5->_additionalLocaleIdentifiers = (NSArray *)v96;

    v5->_textInputTraitsMask.uint64_t integerValue = [v4 decodeInt32ForKey:@"traitsMask"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[RTIDocumentTraits allocWithZone:](RTIDocumentTraits, "allocWithZone:") init];
  v5->_uint64_t processId = self->_processId;
  uint64_t v6 = [(NSString *)self->_appId copyWithZone:a3];
  appId = v5->_appId;
  v5->_appId = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  bundleId = v5->_bundleId;
  v5->_bundleId = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_appName copyWithZone:a3];
  appName = v5->_appName;
  v5->_appName = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_localizedAppName copyWithZone:a3];
  localizedAppName = v5->_localizedAppName;
  v5->_localizedAppName = (NSString *)v12;

  uint64_t v14 = [(NSArray *)self->_associatedDomains copyWithZone:a3];
  associatedDomains = v5->_associatedDomains;
  v5->_associatedDomains = (NSArray *)v14;

  uint64_t v16 = [(NSCopying *)self->_responderId copyWithZone:a3];
  responderId = v5->_responderId;
  v5->_responderId = (NSCopying *)v16;

  uint64_t v18 = [(NSString *)self->_sceneID copyWithZone:a3];
  sceneID = v5->_sceneID;
  v5->_sceneID = (NSString *)v18;

  v5->_unint64_t entityID = self->_entityID;
  v5->_uint64_t contextID = self->_contextID;
  v5->_unint64_t layerID = self->_layerID;
  v5->_unint64_t delegateConformanceType = self->_delegateConformanceType;
  uint64_t v20 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_prompt copyWithZone:a3];
  prompt = v5->_prompt;
  v5->_prompt = (NSString *)v22;

  uint64_t v24 = [(TITextInputTraits *)self->_textInputTraits copyWithZone:a3];
  textInputTraits = v5->_textInputTraits;
  v5->_textInputTraits = (TITextInputTraits *)v24;

  uint64_t v26 = [(RTITextInputKeyboardActionButtonConfiguration *)self->_keyboardActionButtonConfiguration copyWithZone:a3];
  keyboardActionButtonConfiguration = v5->_keyboardActionButtonConfiguration;
  v5->_keyboardActionButtonConfiguration = v26;

  uint64_t v28 = [(NSString *)self->_textInputContextIdentifier copyWithZone:a3];
  textInputContextIdentifier = v5->_textInputContextIdentifier;
  v5->_textInputContextIdentifier = (NSString *)v28;

  uint64_t v30 = [(NSIndexSet *)self->_PINEntrySeparatorIndexes copyWithZone:a3];
  PINEntrySeparatorIndexes = v5->_PINEntrySeparatorIndexes;
  v5->_PINEntrySeparatorIndexes = (NSIndexSet *)v30;

  v5->_validTextRange = self->_validTextRange;
  v5->_unint64_t autofillMode = self->_autofillMode;
  v5->_unint64_t autofillSubMode = self->_autofillSubMode;
  uint64_t v32 = [(NSDictionary *)self->_autofillContext copyWithZone:a3];
  autofillContext = v5->_autofillContext;
  v5->_autofillContext = (NSDictionary *)v32;

  uint64_t v34 = [(NSString *)self->_passwordRules copyWithZone:a3];
  passwordRules = v5->_passwordRules;
  v5->_passwordRules = (NSString *)v34;

  v36 = [(RTIInputViewInfo *)self->_inputViewInfo copyWithZone:a3];
  inputViewInfo = v5->_inputViewInfo;
  v5->_inputViewInfo = v36;

  uint64_t v38 = [(RTIInputViewInfo *)self->_assistantViewInfo copyWithZone:a3];
  assistantViewInfo = v5->_assistantViewInfo;
  v5->_assistantViewInfo = v38;

  uint64_t v40 = [(RTIAssistantItem *)self->_assistantItem copyWithZone:a3];
  assistantItem = v5->_assistantItem;
  v5->_assistantItem = v40;

  uint64_t v42 = [(NSString *)self->_recipientId copyWithZone:a3];
  recipientId = v5->_recipientId;
  v5->_recipientId = (NSString *)v42;

  uint64_t v44 = [(NSString *)self->_responseContext copyWithZone:a3];
  responseContext = v5->_responseContext;
  v5->_responseContext = (NSString *)v44;

  uint64_t v46 = [(TIInputContextHistory *)self->_inputContextHistory copyWithZone:a3];
  inputContextHistory = v5->_inputContextHistory;
  v5->_inputContextHistory = (TIInputContextHistory *)v46;

  uint64_t v48 = [(NSArray *)self->_enabledSupplementalLexiconIdentifiers copyWithZone:a3];
  enabledSupplementalLexiconIdentifiers = v5->_enabledSupplementalLexiconIdentifiers;
  v5->_enabledSupplementalLexiconIdentifiers = (NSArray *)v48;

  uint64_t v50 = [(NSArray *)self->_supportedPayloadIds copyWithZone:a3];
  supportedPayloadIds = v5->_supportedPayloadIds;
  v5->_supportedPayloadIds = (NSArray *)v50;

  uint64_t v52 = [(NSDictionary *)self->_userInfo copyWithZone:a3];
  userInfo = v5->_userInfo;
  v5->_userInfo = (NSDictionary *)v52;

  fenceHandle = self->_fenceHandle;
  if (fenceHandle) {
    objc_storeStrong((id *)&v5->_fenceHandle, fenceHandle);
  }
  uint64_t v55 = [(NSData *)self->_textInputModeData copyWithZone:a3];
  textInputModeData = v5->_textInputModeData;
  v5->_textInputModeData = (NSData *)v55;

  uint64_t v57 = [(NSArray *)self->_additionalLocaleIdentifiers copyWithZone:a3];
  additionalLocaleIdentifiers = v5->_additionalLocaleIdentifiers;
  v5->_additionalLocaleIdentifiers = (NSArray *)v57;

  v5->_textInputTraitsMask.uint64_t integerValue = self->_textInputTraitsMask.integerValue;
  return v5;
}

- (RTIDocumentTraits)init
{
  v6.receiver = self;
  v6.super_class = (Class)RTIDocumentTraits;
  v2 = [(RTIDocumentTraits *)&v6 init];
  if (v2)
  {
    __int16 v3 = (TITextInputTraits *)objc_alloc_init(MEMORY[0x1E4FAE450]);
    textInputTraits = v2->_textInputTraits;
    v2->_textInputTraits = v3;

    v2->_validTextRange.location = 0;
    v2->_validTextRange.NSUInteger length = -1;
    v2->_unint64_t autofillMode = 0;
    v2->_unint64_t autofillSubMode = 0;
    v2->_unint64_t delegateConformanceType = 23;
  }
  return v2;
}

- (id)description
{
  __int16 v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(RTIDocumentTraits *)self processId]) {
    objc_msgSend(v3, "appendFormat:", @"; uint64_t processId = %d", -[RTIDocumentTraits processId](self, "processId"));
  }
  id v4 = [(RTIDocumentTraits *)self appId];

  if (v4)
  {
    v5 = [(RTIDocumentTraits *)self appId];
    [v3 appendFormat:@"; appId = %@", v5];
  }
  objc_super v6 = [(RTIDocumentTraits *)self bundleId];

  if (v6)
  {
    v7 = [(RTIDocumentTraits *)self bundleId];
    [v3 appendFormat:@"; bundleId = %@", v7];
  }
  uint64_t v8 = [(RTIDocumentTraits *)self appName];

  if (v8)
  {
    v9 = [(RTIDocumentTraits *)self appName];
    [v3 appendFormat:@"; appName = %@", v9];
  }
  uint64_t v10 = [(RTIDocumentTraits *)self localizedAppName];

  if (v10)
  {
    uint64_t v11 = [(RTIDocumentTraits *)self localizedAppName];
    [v3 appendFormat:@"; localizedAppName = %@", v11];
  }
  uint64_t v12 = [(RTIDocumentTraits *)self associatedDomains];

  if (v12)
  {
    uint64_t v13 = [(RTIDocumentTraits *)self associatedDomains];
    [v3 appendFormat:@"; associatedDomains = %@", v13];
  }
  uint64_t v14 = [(RTIDocumentTraits *)self responderId];

  if (v14)
  {
    v15 = [(RTIDocumentTraits *)self responderId];
    [v3 appendFormat:@"; responderId = %@", v15];
  }
  uint64_t v16 = [(RTIDocumentTraits *)self sceneID];

  if (v16)
  {
    v17 = [(RTIDocumentTraits *)self sceneID];
    [v3 appendFormat:@"; sceneID = %@", v17];
  }
  if ([(RTIDocumentTraits *)self entityID]) {
    objc_msgSend(v3, "appendFormat:", @"; unint64_t entityID = %llu", -[RTIDocumentTraits entityID](self, "entityID"));
  }
  if ([(RTIDocumentTraits *)self contextID]) {
    objc_msgSend(v3, "appendFormat:", @"; uint64_t contextID = %x", -[RTIDocumentTraits contextID](self, "contextID"));
  }
  if ([(RTIDocumentTraits *)self layerID]) {
    objc_msgSend(v3, "appendFormat:", @"; unint64_t layerID = %llx", -[RTIDocumentTraits layerID](self, "layerID"));
  }
  if ([(RTIDocumentTraits *)self delegateConformanceType]) {
    objc_msgSend(v3, "appendFormat:", @"; unint64_t delegateConformanceType = %d",
  }
      [(RTIDocumentTraits *)self delegateConformanceType]);
  if ([(RTIDocumentTraits *)self disableAutomaticKeyboardUI]) {
    objc_msgSend(v3, "appendFormat:", @"; disableAutomaticKeyboardUI = %d",
  }
      [(RTIDocumentTraits *)self disableAutomaticKeyboardUI]);
  uint64_t v18 = [(RTIDocumentTraits *)self title];

  if (v18)
  {
    uint64_t v19 = [(RTIDocumentTraits *)self title];
    [v3 appendFormat:@"; title = %@", v19];
  }
  uint64_t v20 = [(RTIDocumentTraits *)self prompt];

  if (v20)
  {
    v21 = [(RTIDocumentTraits *)self prompt];
    [v3 appendFormat:@"; prompt = %@", v21];
  }
  uint64_t v22 = [(RTIDocumentTraits *)self textInputTraits];
  [v3 appendFormat:@"; textInputTraits = %@", v22];

  uint64_t v23 = [(RTIDocumentTraits *)self textInputContextIdentifier];

  if (v23)
  {
    uint64_t v24 = [(RTIDocumentTraits *)self textInputContextIdentifier];
    [v3 appendFormat:@"; textInputContextIdentifier = %@", v24];
  }
  if ([(RTIDocumentTraits *)self autofillMode]) {
    objc_msgSend(v3, "appendFormat:", @"; unint64_t autofillMode = %d",
  }
      [(RTIDocumentTraits *)self autofillMode]);
  if ([(RTIDocumentTraits *)self autofillSubMode]) {
    objc_msgSend(v3, "appendFormat:", @"; unint64_t autofillSubMode = %d",
  }
      [(RTIDocumentTraits *)self autofillSubMode]);
  v25 = [(RTIDocumentTraits *)self autofillContext];

  if (v25)
  {
    uint64_t v26 = [(RTIDocumentTraits *)self autofillContext];
    [v3 appendFormat:@"; autofillContext = %@", v26];
  }
  if ([(RTIDocumentTraits *)self shouldLoadAutofillSignUp]) {
    [v3 appendFormat:@"; shouldLoadAutofillSignUp = YES"];
  }
  v27 = [(RTIDocumentTraits *)self passwordRules];

  if (v27)
  {
    uint64_t v28 = [(RTIDocumentTraits *)self passwordRules];
    [v3 appendFormat:@"; passwordRules = %@", v28];
  }
  uint64_t v29 = [(RTIDocumentTraits *)self inputViewInfo];

  if (v29)
  {
    uint64_t v30 = [(RTIDocumentTraits *)self inputViewInfo];
    [v3 appendFormat:@"; inputViewInfo = %@", v30];
  }
  v31 = [(RTIDocumentTraits *)self assistantViewInfo];

  if (v31)
  {
    uint64_t v32 = [(RTIDocumentTraits *)self assistantViewInfo];
    [v3 appendFormat:@"; assistantViewInfo = %@", v32];
  }
  v33 = [(RTIDocumentTraits *)self assistantItem];

  if (v33)
  {
    uint64_t v34 = [(RTIDocumentTraits *)self assistantItem];
    [v3 appendFormat:@"; assistantItem = %@", v34];
  }
  uint64_t v35 = [(RTIDocumentTraits *)self recipientId];

  if (v35)
  {
    v36 = [(RTIDocumentTraits *)self recipientId];
    [v3 appendFormat:@"; recipientId = %@", v36];
  }
  v37 = [(RTIDocumentTraits *)self responseContext];

  if (v37)
  {
    uint64_t v38 = [(RTIDocumentTraits *)self responseContext];
    [v3 appendFormat:@"; responseContext = %@", v38];
  }
  v39 = [(RTIDocumentTraits *)self inputContextHistory];

  if (v39)
  {
    uint64_t v40 = [(RTIDocumentTraits *)self inputContextHistory];
    [v3 appendFormat:@"; inputContextHistory = %@", v40];
  }
  v41 = [(RTIDocumentTraits *)self enabledSupplementalLexiconIdentifiers];

  if (v41)
  {
    uint64_t v42 = [(RTIDocumentTraits *)self enabledSupplementalLexiconIdentifiers];
    [v3 appendFormat:@"; enabledSupplementalLexiconIdentifiers = %@", v42];
  }
  v43 = [(RTIDocumentTraits *)self supportedPayloadIds];

  if (v43)
  {
    uint64_t v44 = [(RTIDocumentTraits *)self supportedPayloadIds];
    [v3 appendFormat:@"; supportedPayloadIds = %@", v44];
  }
  if ([(RTIDocumentTraits *)self supportsImagePaste]) {
    [v3 appendFormat:@"; supportsImagePaste = YES"];
  }
  if ([(RTIDocumentTraits *)self supportsAdaptiveImageGlyph]) {
    [v3 appendFormat:@"; supportsAdaptiveImageGlyph = YES"];
  }
  if ([(RTIDocumentTraits *)self devicePasscodeEntry]) {
    [v3 appendFormat:@"; devicePasscodeEntry = YES"];
  }
  if ([(RTIDocumentTraits *)self disableInputBars]) {
    [v3 appendFormat:@"; disableInputBars = YES"];
  }
  v45 = [(RTIDocumentTraits *)self userInfo];

  if (v45)
  {
    uint64_t v46 = [(RTIDocumentTraits *)self userInfo];
    v47 = [v46 allKeys];
    [v3 appendFormat:@"; userInfo.keys = %@", v47];
  }
  if ([(RTIDocumentTraits *)self disablePrediction]) {
    [v3 appendFormat:@"; disablePrediction = YES"];
  }
  if ([(RTIDocumentTraits *)self hidePrediction]) {
    [v3 appendFormat:@"; hidePrediction = YES"];
  }
  if ([(RTIDocumentTraits *)self shouldReverseLayoutDirection])
  {
    BOOL v48 = [(RTIDocumentTraits *)self shouldReverseLayoutDirection];
    NSUInteger v49 = @"N";
    if (v48) {
      NSUInteger v49 = @"Y";
    }
    [v3 appendFormat:@"; shouldReverseLayoutDirection = %@", v49];
  }
  uint64_t v50 = [(RTIDocumentTraits *)self fenceHandle];

  if (v50)
  {
    unint64_t v51 = [(RTIDocumentTraits *)self fenceHandle];
    [v3 appendFormat:@"; fenceHandle = %@", v51];
  }
  uint64_t v52 = [(RTIDocumentTraits *)self textInputModeData];

  if (v52)
  {
    v53 = [(RTIDocumentTraits *)self textInputModeData];
    objc_msgSend(v3, "appendFormat:", @"; has %lu bytes of textInputModeData", objc_msgSend(v53, "length"));
  }
  uint64_t v54 = [(RTIDocumentTraits *)self additionalLocaleIdentifiers];

  if (v54)
  {
    uint64_t v55 = [(RTIDocumentTraits *)self additionalLocaleIdentifiers];
    [v3 appendFormat:@"; addedLocales = %@", v55];
  }
  if ([(RTIDocumentTraits *)self isExplicitAutoFillMode]) {
    [v3 appendFormat:@"; explicitAutoFillMode = YES"];
  }
  if ([(RTIDocumentTraits *)self isSingleLineDocument]) {
    [v3 appendFormat:@"; singleLineDocument = YES"];
  }
  uint64_t v56 = [(RTIDocumentTraits *)self keyboardActionButtonConfiguration];

  if (v56)
  {
    uint64_t v57 = [(RTIDocumentTraits *)self keyboardActionButtonConfiguration];
    v58 = [v57 description];
    [v3 appendFormat:@"; keyboardActionButtonConfiguration = %@", v58];
  }
  id v59 = v3;

  return v59;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTIDocumentTraits *)a3;
  if (v4 == self)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = [(RTIDocumentTraits *)self processId];
      if (v6 == [(RTIDocumentTraits *)v5 processId])
      {
        v7 = NSString;
        uint64_t v8 = [(RTIDocumentTraits *)self appId];
        v9 = [(RTIDocumentTraits *)v5 appId];
        int v10 = [v7 _string:v8 matchesString:v9];

        if (!v10) {
          goto LABEL_25;
        }
        uint64_t v11 = NSString;
        uint64_t v12 = [(RTIDocumentTraits *)self bundleId];
        uint64_t v13 = [(RTIDocumentTraits *)v5 bundleId];
        int v10 = [v11 _string:v12 matchesString:v13];

        if (!v10) {
          goto LABEL_25;
        }
        uint64_t v14 = NSString;
        v15 = [(RTIDocumentTraits *)self appName];
        uint64_t v16 = [(RTIDocumentTraits *)v5 appName];
        int v10 = [v14 _string:v15 matchesString:v16];

        if (!v10) {
          goto LABEL_25;
        }
        v17 = NSString;
        uint64_t v18 = [(RTIDocumentTraits *)self localizedAppName];
        uint64_t v19 = [(RTIDocumentTraits *)v5 localizedAppName];
        int v10 = [v17 _string:v18 matchesString:v19];

        if (!v10) {
          goto LABEL_25;
        }
        uint64_t v20 = [(RTIDocumentTraits *)self associatedDomains];
        uint64_t v21 = [(RTIDocumentTraits *)v5 associatedDomains];
        if (v20 == (void *)v21)
        {
        }
        else
        {
          uint64_t v22 = (void *)v21;
          uint64_t v23 = [(RTIDocumentTraits *)self associatedDomains];
          uint64_t v24 = [(RTIDocumentTraits *)v5 associatedDomains];
          int v25 = [v23 isEqualToArray:v24];

          if (!v25) {
            goto LABEL_24;
          }
        }
        uint64_t v26 = [(RTIDocumentTraits *)self responderId];
        uint64_t v27 = [(RTIDocumentTraits *)v5 responderId];
        if (v26 == (void *)v27)
        {
        }
        else
        {
          uint64_t v28 = (void *)v27;
          uint64_t v29 = [(RTIDocumentTraits *)self responderId];
          uint64_t v30 = [(RTIDocumentTraits *)v5 responderId];
          int v31 = [v29 isEqual:v30];

          if (!v31) {
            goto LABEL_24;
          }
        }
        uint64_t v32 = NSString;
        v33 = [(RTIDocumentTraits *)self sceneID];
        uint64_t v34 = [(RTIDocumentTraits *)v5 sceneID];
        int v10 = [v32 _string:v33 matchesString:v34];

        if (!v10)
        {
LABEL_25:

          goto LABEL_26;
        }
        unint64_t v35 = [(RTIDocumentTraits *)self entityID];
        if (v35 == [(RTIDocumentTraits *)v5 entityID])
        {
          unsigned int v36 = [(RTIDocumentTraits *)self contextID];
          if (v36 == [(RTIDocumentTraits *)v5 contextID])
          {
            unint64_t v37 = [(RTIDocumentTraits *)self layerID];
            if (v37 == [(RTIDocumentTraits *)v5 layerID])
            {
              unint64_t v38 = [(RTIDocumentTraits *)self delegateConformanceType];
              if (v38 == [(RTIDocumentTraits *)v5 delegateConformanceType])
              {
                BOOL v39 = [(RTIDocumentTraits *)self disableAutomaticKeyboardUI];
                if (v39 == [(RTIDocumentTraits *)v5 disableAutomaticKeyboardUI])
                {
                  v41 = NSString;
                  uint64_t v42 = [(RTIDocumentTraits *)self title];
                  v43 = [(RTIDocumentTraits *)v5 title];
                  int v10 = [v41 _string:v42 matchesString:v43];

                  if (!v10) {
                    goto LABEL_25;
                  }
                  uint64_t v44 = NSString;
                  v45 = [(RTIDocumentTraits *)self prompt];
                  uint64_t v46 = [(RTIDocumentTraits *)v5 prompt];
                  int v10 = [v44 _string:v45 matchesString:v46];

                  if (!v10) {
                    goto LABEL_25;
                  }
                  v47 = [(RTIDocumentTraits *)self textInputTraits];
                  uint64_t v48 = [(RTIDocumentTraits *)v5 textInputTraits];
                  if (v47 == (void *)v48)
                  {
                  }
                  else
                  {
                    NSUInteger v49 = (void *)v48;
                    uint64_t v50 = [(RTIDocumentTraits *)self textInputTraits];
                    unint64_t v51 = [(RTIDocumentTraits *)v5 textInputTraits];
                    int v52 = [v50 isEqual:v51];

                    if (!v52) {
                      goto LABEL_24;
                    }
                  }
                  v53 = [(RTIDocumentTraits *)self textInputContextIdentifier];
                  uint64_t v54 = [(RTIDocumentTraits *)v5 textInputContextIdentifier];
                  if (v53 == (void *)v54)
                  {
                  }
                  else
                  {
                    uint64_t v55 = (void *)v54;
                    uint64_t v56 = [(RTIDocumentTraits *)self textInputContextIdentifier];
                    uint64_t v57 = [(RTIDocumentTraits *)v5 textInputContextIdentifier];
                    int v58 = [v56 isEqual:v57];

                    if (!v58) {
                      goto LABEL_24;
                    }
                  }
                  id v59 = [(RTIDocumentTraits *)self PINEntrySeparatorIndexes];
                  uint64_t v60 = [(RTIDocumentTraits *)v5 PINEntrySeparatorIndexes];
                  if (v59 == (void *)v60)
                  {
                  }
                  else
                  {
                    uint64_t v61 = (void *)v60;
                    v62 = [(RTIDocumentTraits *)self PINEntrySeparatorIndexes];
                    uint64_t v63 = [(RTIDocumentTraits *)v5 PINEntrySeparatorIndexes];
                    int v64 = [v62 isEqual:v63];

                    if (!v64) {
                      goto LABEL_24;
                    }
                  }
                  uint64_t v65 = [(RTIDocumentTraits *)self validTextRange];
                  uint64_t v67 = v66;
                  LOBYTE(v10) = 0;
                  if (v65 != [(RTIDocumentTraits *)v5 validTextRange] || v67 != v68) {
                    goto LABEL_25;
                  }
                  unint64_t v69 = [(RTIDocumentTraits *)self autofillMode];
                  if (v69 != [(RTIDocumentTraits *)v5 autofillMode]) {
                    goto LABEL_24;
                  }
                  unint64_t v70 = [(RTIDocumentTraits *)self autofillSubMode];
                  if (v70 != [(RTIDocumentTraits *)v5 autofillSubMode]) {
                    goto LABEL_24;
                  }
                  uint64_t v71 = [(RTIDocumentTraits *)self autofillContext];
                  uint64_t v72 = [(RTIDocumentTraits *)v5 autofillContext];
                  if (v71 == (void *)v72)
                  {
                  }
                  else
                  {
                    uint64_t v73 = (void *)v72;
                    v74 = [(RTIDocumentTraits *)self autofillContext];
                    uint64_t v75 = [(RTIDocumentTraits *)v5 autofillContext];
                    int v76 = [v74 isEqualToDictionary:v75];

                    if (!v76) {
                      goto LABEL_24;
                    }
                  }
                  BOOL v77 = [(RTIDocumentTraits *)self shouldLoadAutofillSignUp];
                  if (v77 == [(RTIDocumentTraits *)v5 shouldLoadAutofillSignUp])
                  {
                    uint64_t v78 = [(RTIDocumentTraits *)self passwordRules];
                    uint64_t v79 = [(RTIDocumentTraits *)v5 passwordRules];
                    if (v78 == (void *)v79)
                    {
                    }
                    else
                    {
                      uint64_t v80 = (void *)v79;
                      v81 = [(RTIDocumentTraits *)self passwordRules];
                      v82 = [(RTIDocumentTraits *)v5 passwordRules];
                      int v83 = [v81 isEqual:v82];

                      if (!v83) {
                        goto LABEL_24;
                      }
                    }
                    uint64_t v84 = [(RTIDocumentTraits *)self inputViewInfo];
                    uint64_t v85 = [(RTIDocumentTraits *)v5 inputViewInfo];
                    if (v84 == (void *)v85)
                    {
                    }
                    else
                    {
                      v86 = (void *)v85;
                      uint64_t v87 = [(RTIDocumentTraits *)self inputViewInfo];
                      v88 = [(RTIDocumentTraits *)v5 inputViewInfo];
                      int v89 = [v87 isEqual:v88];

                      if (!v89) {
                        goto LABEL_24;
                      }
                    }
                    v90 = [(RTIDocumentTraits *)self assistantViewInfo];
                    uint64_t v91 = [(RTIDocumentTraits *)v5 assistantViewInfo];
                    if (v90 == (void *)v91)
                    {
                    }
                    else
                    {
                      v92 = (void *)v91;
                      v93 = [(RTIDocumentTraits *)self assistantViewInfo];
                      uint64_t v94 = [(RTIDocumentTraits *)v5 assistantViewInfo];
                      int v95 = [v93 isEqual:v94];

                      if (!v95) {
                        goto LABEL_24;
                      }
                    }
                    uint64_t v96 = [(RTIDocumentTraits *)self assistantItem];
                    uint64_t v97 = [(RTIDocumentTraits *)v5 assistantItem];
                    if (v96 == (void *)v97)
                    {
                    }
                    else
                    {
                      v98 = (void *)v97;
                      objc_super v99 = [(RTIDocumentTraits *)self assistantItem];
                      v100 = [(RTIDocumentTraits *)v5 assistantItem];
                      int v101 = [v99 isEqual:v100];

                      if (!v101) {
                        goto LABEL_24;
                      }
                    }
                    v102 = NSString;
                    v103 = [(RTIDocumentTraits *)self recipientId];
                    v104 = [(RTIDocumentTraits *)v5 recipientId];
                    int v10 = [v102 _string:v103 matchesString:v104];

                    if (!v10) {
                      goto LABEL_25;
                    }
                    v105 = NSString;
                    v106 = [(RTIDocumentTraits *)self responseContext];
                    v107 = [(RTIDocumentTraits *)v5 responseContext];
                    int v10 = [v105 _string:v106 matchesString:v107];

                    if (!v10) {
                      goto LABEL_25;
                    }
                    v108 = [(RTIDocumentTraits *)self inputContextHistory];
                    uint64_t v109 = [(RTIDocumentTraits *)v5 inputContextHistory];
                    if (v108 == (void *)v109)
                    {
                    }
                    else
                    {
                      v110 = (void *)v109;
                      v111 = [(RTIDocumentTraits *)self inputContextHistory];
                      v112 = [(RTIDocumentTraits *)v5 inputContextHistory];
                      int v113 = [v111 isEqual:v112];

                      if (!v113) {
                        goto LABEL_24;
                      }
                    }
                    v114 = [(RTIDocumentTraits *)self enabledSupplementalLexiconIdentifiers];
                    uint64_t v115 = [(RTIDocumentTraits *)v5 enabledSupplementalLexiconIdentifiers];
                    if (v114 == (void *)v115)
                    {
                    }
                    else
                    {
                      v116 = (void *)v115;
                      v117 = [(RTIDocumentTraits *)self enabledSupplementalLexiconIdentifiers];
                      v118 = [(RTIDocumentTraits *)v5 enabledSupplementalLexiconIdentifiers];
                      int v119 = [v117 isEqualToArray:v118];

                      if (!v119) {
                        goto LABEL_24;
                      }
                    }
                    v120 = [(RTIDocumentTraits *)self supportedPayloadIds];
                    uint64_t v121 = [(RTIDocumentTraits *)v5 supportedPayloadIds];
                    if (v120 == (void *)v121)
                    {
                    }
                    else
                    {
                      v122 = (void *)v121;
                      v123 = [(RTIDocumentTraits *)self supportedPayloadIds];
                      v124 = [(RTIDocumentTraits *)v5 supportedPayloadIds];
                      int v125 = [v123 isEqualToArray:v124];

                      if (!v125) {
                        goto LABEL_24;
                      }
                    }
                    BOOL v126 = [(RTIDocumentTraits *)self supportsImagePaste];
                    if (v126 != [(RTIDocumentTraits *)v5 supportsImagePaste]) {
                      goto LABEL_24;
                    }
                    BOOL v127 = [(RTIDocumentTraits *)self supportsAdaptiveImageGlyph];
                    if (v127 != [(RTIDocumentTraits *)v5 supportsAdaptiveImageGlyph]) {
                      goto LABEL_24;
                    }
                    BOOL v128 = [(RTIDocumentTraits *)self devicePasscodeEntry];
                    if (v128 != [(RTIDocumentTraits *)v5 devicePasscodeEntry]) {
                      goto LABEL_24;
                    }
                    BOOL v129 = [(RTIDocumentTraits *)self disableInputBars];
                    if (v129 != [(RTIDocumentTraits *)v5 disableInputBars]) {
                      goto LABEL_24;
                    }
                    v130 = [(RTIDocumentTraits *)self userInfo];
                    uint64_t v131 = [(RTIDocumentTraits *)v5 userInfo];
                    if (v130 == (void *)v131)
                    {
                    }
                    else
                    {
                      v132 = (void *)v131;
                      v133 = [(RTIDocumentTraits *)self userInfo];
                      v134 = [(RTIDocumentTraits *)v5 userInfo];
                      int v135 = [v133 isEqualToDictionary:v134];

                      if (!v135) {
                        goto LABEL_24;
                      }
                    }
                    BOOL v136 = [(RTIDocumentTraits *)self disablePrediction];
                    if (v136 != [(RTIDocumentTraits *)v5 disablePrediction]) {
                      goto LABEL_24;
                    }
                    BOOL v137 = [(RTIDocumentTraits *)self hidePrediction];
                    if (v137 != [(RTIDocumentTraits *)v5 hidePrediction]) {
                      goto LABEL_24;
                    }
                    BOOL v138 = [(RTIDocumentTraits *)self shouldReverseLayoutDirection];
                    if (v138 != [(RTIDocumentTraits *)v5 shouldReverseLayoutDirection]) {
                      goto LABEL_24;
                    }
                    v139 = [(RTIDocumentTraits *)self textInputModeData];
                    uint64_t v140 = [(RTIDocumentTraits *)v5 textInputModeData];
                    if (v139 == (void *)v140)
                    {
                    }
                    else
                    {
                      v141 = (void *)v140;
                      v142 = [(RTIDocumentTraits *)self textInputModeData];
                      v143 = [(RTIDocumentTraits *)v5 textInputModeData];
                      int v144 = [v142 isEqual:v143];

                      if (!v144) {
                        goto LABEL_24;
                      }
                    }
                    v145 = [(RTIDocumentTraits *)self additionalLocaleIdentifiers];
                    uint64_t v146 = [(RTIDocumentTraits *)v5 additionalLocaleIdentifiers];
                    if (v145 == (void *)v146)
                    {
                    }
                    else
                    {
                      v147 = (void *)v146;
                      v148 = [(RTIDocumentTraits *)self additionalLocaleIdentifiers];
                      v149 = [(RTIDocumentTraits *)v5 additionalLocaleIdentifiers];
                      int v150 = [v148 isEqualToArray:v149];

                      if (!v150) {
                        goto LABEL_24;
                      }
                    }
                    BOOL v151 = [(RTIDocumentTraits *)self isExplicitAutoFillMode];
                    if (v151 == [(RTIDocumentTraits *)v5 isExplicitAutoFillMode])
                    {
                      BOOL v152 = [(RTIDocumentTraits *)self isSingleLineDocument];
                      if (v152 == [(RTIDocumentTraits *)v5 isSingleLineDocument])
                      {
                        v153 = [(RTIDocumentTraits *)self keyboardActionButtonConfiguration];
                        v154 = [(RTIDocumentTraits *)v5 keyboardActionButtonConfiguration];
                        if (v153 == v154)
                        {
                          LOBYTE(v10) = 1;
                        }
                        else
                        {
                          v155 = [(RTIDocumentTraits *)self keyboardActionButtonConfiguration];
                          v156 = [(RTIDocumentTraits *)v5 keyboardActionButtonConfiguration];
                          LOBYTE(v10) = [v155 isEqual:v156];
                        }
                        goto LABEL_25;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_24:
      LOBYTE(v10) = 0;
      goto LABEL_25;
    }
    LOBYTE(v10) = 0;
  }
LABEL_26:

  return v10;
}

- (void)copyContextualPropertiesFromDocumentTraits:(id)a3
{
  int v52 = (char *)a3;
  id v4 = (NSCopying *)[*((id *)v52 + 8) copy];
  responderId = self->_responderId;
  self->_responderId = v4;

  int v6 = (NSString *)[*((id *)v52 + 9) copy];
  sceneID = self->_sceneID;
  self->_sceneID = v6;

  self->_unint64_t entityID = *((void *)v52 + 10);
  self->_uint64_t contextID = *((_DWORD *)v52 + 4);
  self->_unint64_t layerID = *((void *)v52 + 11);
  self->_unint64_t delegateConformanceType = *((void *)v52 + 12);
  uint64_t v8 = (NSString *)[*((id *)v52 + 13) copy];
  title = self->_title;
  self->_title = v8;

  int v10 = (NSString *)[*((id *)v52 + 14) copy];
  prompt = self->_prompt;
  self->_prompt = v10;

  uint64_t v12 = (TITextInputTraits *)[*((id *)v52 + 18) copy];
  textInputTraits = self->_textInputTraits;
  self->_textInputTraits = v12;

  uint64_t v14 = (RTITextInputKeyboardActionButtonConfiguration *)[*((id *)v52 + 34) copy];
  keyboardActionButtonConfiguration = self->_keyboardActionButtonConfiguration;
  self->_keyboardActionButtonConfiguration = v14;

  uint64_t v16 = (NSString *)[*((id *)v52 + 19) copy];
  textInputContextIdentifier = self->_textInputContextIdentifier;
  self->_textInputContextIdentifier = v16;

  uint64_t v18 = (NSIndexSet *)[*((id *)v52 + 20) copy];
  PINEntrySeparatorIndexes = self->_PINEntrySeparatorIndexes;
  self->_PINEntrySeparatorIndexes = v18;

  self->_validTextRange = *(_NSRange *)(v52 + 280);
  self->_unint64_t autofillMode = *((void *)v52 + 21);
  self->_unint64_t autofillSubMode = *((void *)v52 + 22);
  uint64_t v20 = (NSDictionary *)[*((id *)v52 + 23) copy];
  autofillContext = self->_autofillContext;
  self->_autofillContext = v20;

  uint64_t v22 = (NSString *)[*((id *)v52 + 24) copy];
  passwordRules = self->_passwordRules;
  self->_passwordRules = v22;

  uint64_t v24 = (NSArray *)[*((id *)v52 + 7) copy];
  associatedDomains = self->_associatedDomains;
  self->_associatedDomains = v24;

  uint64_t v26 = (RTIInputViewInfo *)[*((id *)v52 + 15) copy];
  inputViewInfo = self->_inputViewInfo;
  self->_inputViewInfo = v26;

  uint64_t v28 = (RTIInputViewInfo *)[*((id *)v52 + 16) copy];
  assistantViewInfo = self->_assistantViewInfo;
  self->_assistantViewInfo = v28;

  uint64_t v30 = (RTIAssistantItem *)[*((id *)v52 + 17) copy];
  assistantItem = self->_assistantItem;
  self->_assistantItem = v30;

  uint64_t v32 = (NSString *)[*((id *)v52 + 25) copy];
  recipientId = self->_recipientId;
  self->_recipientId = v32;

  uint64_t v34 = (NSString *)[*((id *)v52 + 26) copy];
  responseContext = self->_responseContext;
  self->_responseContext = v34;

  unsigned int v36 = (TIInputContextHistory *)[*((id *)v52 + 27) copy];
  inputContextHistory = self->_inputContextHistory;
  self->_inputContextHistory = v36;

  unint64_t v38 = (NSArray *)[*((id *)v52 + 28) copy];
  enabledSupplementalLexiconIdentifiers = self->_enabledSupplementalLexiconIdentifiers;
  self->_enabledSupplementalLexiconIdentifiers = v38;

  uint64_t v40 = (NSArray *)[*((id *)v52 + 29) copy];
  supportedPayloadIds = self->_supportedPayloadIds;
  self->_supportedPayloadIds = v40;

  uint64_t v42 = (NSDictionary *)[*((id *)v52 + 30) copy];
  userInfo = self->_userInfo;
  self->_userInfo = v42;

  uint64_t v44 = (id *)v52;
  v45 = (CAFenceHandle *)*((void *)v52 + 31);
  if (v45)
  {
    fenceHandle = self->_fenceHandle;
    if (fenceHandle != v45 && ([(CAFenceHandle *)fenceHandle isInvalidated] & 1) == 0) {
      [(CAFenceHandle *)self->_fenceHandle invalidate];
    }
    objc_storeStrong((id *)&self->_fenceHandle, *((id *)v52 + 31));
    v47 = (void *)*((void *)v52 + 31);
    *((void *)v52 + 31) = 0;

    uint64_t v44 = (id *)v52;
  }
  uint64_t v48 = (NSData *)[v44[32] copy];
  textInputModeData = self->_textInputModeData;
  self->_textInputModeData = v48;

  uint64_t v50 = (NSArray *)[*((id *)v52 + 33) copy];
  additionalLocaleIdentifiers = self->_additionalLocaleIdentifiers;
  self->_additionalLocaleIdentifiers = v50;

  self->_textInputTraitsMask.uint64_t integerValue = *((_DWORD *)v52 + 2);
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_uint64_t processId = a3;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
}

- (NSCopying)responderId
{
  return self->_responderId;
}

- (void)setResponderId:(id)a3
{
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (unint64_t)entityID
{
  return self->_entityID;
}

- (void)setEntityID:(unint64_t)a3
{
  self->_unint64_t entityID = a3;
}

- (unsigned)contextID
{
  return self->_contextID;
}

- (void)setContextID:(unsigned int)a3
{
  self->_uint64_t contextID = a3;
}

- (unint64_t)layerID
{
  return self->_layerID;
}

- (void)setLayerID:(unint64_t)a3
{
  self->_unint64_t layerID = a3;
}

- (unint64_t)delegateConformanceType
{
  return self->_delegateConformanceType;
}

- (void)setDelegateConformanceType:(unint64_t)a3
{
  self->_unint64_t delegateConformanceType = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)prompt
{
  return self->_prompt;
}

- (void)setPrompt:(id)a3
{
}

- (RTIInputViewInfo)inputViewInfo
{
  return self->_inputViewInfo;
}

- (void)setInputViewInfo:(id)a3
{
}

- (RTIInputViewInfo)assistantViewInfo
{
  return self->_assistantViewInfo;
}

- (void)setAssistantViewInfo:(id)a3
{
}

- (RTIAssistantItem)assistantItem
{
  return self->_assistantItem;
}

- (void)setAssistantItem:(id)a3
{
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setTextInputTraits:(id)a3
{
}

- (NSString)textInputContextIdentifier
{
  return self->_textInputContextIdentifier;
}

- (void)setTextInputContextIdentifier:(id)a3
{
}

- (NSIndexSet)PINEntrySeparatorIndexes
{
  return self->_PINEntrySeparatorIndexes;
}

- (void)setPINEntrySeparatorIndexes:(id)a3
{
}

- (_NSRange)validTextRange
{
  NSUInteger length = self->_validTextRange.length;
  NSUInteger location = self->_validTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setValidTextRange:(_NSRange)a3
{
  self->_validTextRange = a3;
}

- (unint64_t)autofillMode
{
  return self->_autofillMode;
}

- (void)setAutofillMode:(unint64_t)a3
{
  self->_unint64_t autofillMode = a3;
}

- (unint64_t)autofillSubMode
{
  return self->_autofillSubMode;
}

- (void)setAutofillSubMode:(unint64_t)a3
{
  self->_unint64_t autofillSubMode = a3;
}

- (NSDictionary)autofillContext
{
  return self->_autofillContext;
}

- (void)setAutofillContext:(id)a3
{
}

- (NSString)passwordRules
{
  return self->_passwordRules;
}

- (void)setPasswordRules:(id)a3
{
}

- (NSString)recipientId
{
  return self->_recipientId;
}

- (void)setRecipientId:(id)a3
{
}

- (NSString)responseContext
{
  return self->_responseContext;
}

- (void)setResponseContext:(id)a3
{
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setInputContextHistory:(id)a3
{
}

- (NSArray)enabledSupplementalLexiconIdentifiers
{
  return self->_enabledSupplementalLexiconIdentifiers;
}

- (void)setEnabledSupplementalLexiconIdentifiers:(id)a3
{
}

- (NSArray)supportedPayloadIds
{
  return self->_supportedPayloadIds;
}

- (void)setSupportedPayloadIds:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (CAFenceHandle)fenceHandle
{
  return self->_fenceHandle;
}

- (void)setFenceHandle:(id)a3
{
}

- (NSData)textInputModeData
{
  return self->_textInputModeData;
}

- (void)setTextInputModeData:(id)a3
{
}

- (NSArray)additionalLocaleIdentifiers
{
  return self->_additionalLocaleIdentifiers;
}

- (void)setAdditionalLocaleIdentifiers:(id)a3
{
}

- (RTITextInputKeyboardActionButtonConfiguration)keyboardActionButtonConfiguration
{
  return self->_keyboardActionButtonConfiguration;
}

- (void)setKeyboardActionButtonConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardActionButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_additionalLocaleIdentifiers, 0);
  objc_storeStrong((id *)&self->_textInputModeData, 0);
  objc_storeStrong((id *)&self->_fenceHandle, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_supportedPayloadIds, 0);
  objc_storeStrong((id *)&self->_enabledSupplementalLexiconIdentifiers, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
  objc_storeStrong((id *)&self->_recipientId, 0);
  objc_storeStrong((id *)&self->_passwordRules, 0);
  objc_storeStrong((id *)&self->_autofillContext, 0);
  objc_storeStrong((id *)&self->_PINEntrySeparatorIndexes, 0);
  objc_storeStrong((id *)&self->_textInputContextIdentifier, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_assistantItem, 0);
  objc_storeStrong((id *)&self->_assistantViewInfo, 0);
  objc_storeStrong((id *)&self->_inputViewInfo, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
  objc_storeStrong((id *)&self->_responderId, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end