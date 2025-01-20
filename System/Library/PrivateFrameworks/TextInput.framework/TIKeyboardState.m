@interface TIKeyboardState
+ (BOOL)supportsSecureCoding;
- (BKSHIDEventAuthenticationMessage)eventAuthenticationMessage;
- (BOOL)autocapitalizationEnabled;
- (BOOL)autocorrectionEnabled;
- (BOOL)autocorrectionListUIAutoDisplayMode;
- (BOOL)autocorrectionListUIDisplayed;
- (BOOL)canSendCurrentLocation;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)candidateSelectionPredictionEnabled;
- (BOOL)emojiPopoverMode;
- (BOOL)emojiSearchMode;
- (BOOL)floatingKeyboardMode;
- (BOOL)hardwareKeyboardMode;
- (BOOL)imageSuggestionEnabled;
- (BOOL)inlineCompletionEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScreenLocked;
- (BOOL)keyboardEventsLagging;
- (BOOL)landscapeOrientation;
- (BOOL)longPredictionListEnabled;
- (BOOL)needAutofill;
- (BOOL)needCellularAutofill;
- (BOOL)needContactAutofill;
- (BOOL)needOneTimeCodeAutofill;
- (BOOL)needsCandidateMetadata;
- (BOOL)omitEmojiCandidates;
- (BOOL)secureTextEntry;
- (BOOL)shortcutConversionEnabled;
- (BOOL)shouldOutputFullwidthSpace;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)splitKeyboardMode;
- (BOOL)suppressingCandidateSelection;
- (BOOL)userSelectedCurrentCandidate;
- (BOOL)wordLearningEnabled;
- (NSArray)auxiliaryInputModeLanguages;
- (NSArray)statisticChanges;
- (NSArray)supportedPayloadIds;
- (NSDictionary)autofillContext;
- (NSString)clientIdentifier;
- (NSString)inputForMarkedText;
- (NSString)inputMode;
- (NSString)recipientIdentifier;
- (NSString)responseContext;
- (NSString)searchStringForMarkedText;
- (NSUUID)documentIdentifier;
- (TIDocumentState)documentState;
- (TIInputContextHistory)inputContextHistory;
- (TIKeyboardCandidate)currentCandidate;
- (TIKeyboardLayout)keyLayout;
- (TIKeyboardLayoutState)layoutState;
- (TIKeyboardSecureCandidateRenderTraits)secureCandidateRenderTraits;
- (TIKeyboardState)init;
- (TIKeyboardState)initWithCoder:(id)a3;
- (TITextInputTraits)textInputTraits;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)shiftState;
- (unint64_t)autocapitalizationType;
- (unint64_t)autofillMode;
- (unint64_t)autofillSubMode;
- (unint64_t)keyboardType;
- (unint64_t)supplementalLexiconIdentifier;
- (void)_createTextInputTraitsIfNecessary;
- (void)encodeWithCoder:(id)a3;
- (void)setAutocapitalizationEnabled:(BOOL)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionEnabled:(BOOL)a3;
- (void)setAutocorrectionListUIAutoDisplayMode:(BOOL)a3;
- (void)setAutocorrectionListUIDisplayed:(BOOL)a3;
- (void)setAutofillContext:(id)a3;
- (void)setAutofillMode:(unint64_t)a3;
- (void)setAutofillSubMode:(unint64_t)a3;
- (void)setAuxiliaryInputModeLanguages:(id)a3;
- (void)setCanSendCurrentLocation:(BOOL)a3;
- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)setCandidateSelectionPredictionEnabled:(BOOL)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCurrentCandidate:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setEmojiPopoverMode:(BOOL)a3;
- (void)setEmojiSearchMode:(BOOL)a3;
- (void)setEventAuthenticationMessage:(id)a3;
- (void)setFloatingKeyboardMode:(BOOL)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setImageSuggestionEnabled:(BOOL)a3;
- (void)setInlineCompletionEnabled:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputForMarkedText:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setIsScreenLocked:(BOOL)a3;
- (void)setKeyLayout:(id)a3;
- (void)setKeyboardEventsLagging:(BOOL)a3;
- (void)setKeyboardType:(unint64_t)a3;
- (void)setLandscapeOrientation:(BOOL)a3;
- (void)setLayoutState:(id)a3;
- (void)setLongPredictionListEnabled:(BOOL)a3;
- (void)setNeedAutofill:(BOOL)a3;
- (void)setNeedCellularAutofill:(BOOL)a3;
- (void)setNeedOneTimeCodeAutofill:(BOOL)a3;
- (void)setNeedsCandidateMetadata:(BOOL)a3;
- (void)setOmitEmojiCandidates:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setResponseContext:(id)a3;
- (void)setSearchStringForMarkedText:(id)a3;
- (void)setSecureCandidateRenderTraits:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setShiftState:(int)a3;
- (void)setShortcutConversionEnabled:(BOOL)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setSplitKeyboardMode:(BOOL)a3;
- (void)setStatisticChanges:(id)a3;
- (void)setSupplementalLexiconIdentifier:(unint64_t)a3;
- (void)setSupportedPayloadIds:(id)a3;
- (void)setSuppressingCandidateSelection:(BOOL)a3;
- (void)setTextInputTraits:(id)a3;
- (void)setUserSelectedCurrentCandidate:(BOOL)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
@end

@implementation TIKeyboardState

- (BOOL)hardwareKeyboardMode
{
  return (LOBYTE(self->_mask.integerValue) >> 5) & 1;
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (TITextInputTraits)textInputTraits
{
  return self->_textInputTraits;
}

- (void)setSupplementalLexiconIdentifier:(unint64_t)a3
{
  self->_supplementalLexiconIdentifier = a3;
}

- (void)setResponseContext:(id)a3
{
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (void)setInputMode:(id)a3
{
}

- (void)setAuxiliaryInputModeLanguages:(id)a3
{
}

- (NSString)inputMode
{
  return self->_inputMode;
}

- (void)setTextInputTraits:(id)a3
{
}

- (void)setInputContextHistory:(id)a3
{
}

- (BOOL)longPredictionListEnabled
{
  return BYTE1(self->_mask.integerValue) >> 7;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFEFF | v3);
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFF7FFFFF | v3);
}

- (void)setAutocorrectionEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFDFF | v3);
}

- (void)setAutocapitalizationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFEFFF | v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticChanges, 0);
  objc_storeStrong((id *)&self->_supportedPayloadIds, 0);
  objc_storeStrong((id *)&self->_autofillContext, 0);
  objc_storeStrong((id *)&self->_responseContext, 0);
  objc_storeStrong((id *)&self->_textInputTraits, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_searchStringForMarkedText, 0);
  objc_storeStrong((id *)&self->_inputForMarkedText, 0);
  objc_storeStrong((id *)&self->_eventAuthenticationMessage, 0);
  objc_storeStrong((id *)&self->_secureCandidateRenderTraits, 0);
  objc_storeStrong((id *)&self->_documentState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryInputModeLanguages, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_documentIdentifier, 0);
}

- (void)setStatisticChanges:(id)a3
{
}

- (NSArray)statisticChanges
{
  return self->_statisticChanges;
}

- (void)setSupportedPayloadIds:(id)a3
{
}

- (NSArray)supportedPayloadIds
{
  return self->_supportedPayloadIds;
}

- (void)setAutofillContext:(id)a3
{
}

- (NSDictionary)autofillContext
{
  return self->_autofillContext;
}

- (void)setAutofillSubMode:(unint64_t)a3
{
  self->_autofillSubMode = a3;
}

- (unint64_t)autofillSubMode
{
  return self->_autofillSubMode;
}

- (void)setAutofillMode:(unint64_t)a3
{
  self->_autofillMode = a3;
}

- (unint64_t)autofillMode
{
  return self->_autofillMode;
}

- (void)setCurrentCandidate:(id)a3
{
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setSearchStringForMarkedText:(id)a3
{
}

- (NSString)searchStringForMarkedText
{
  return self->_searchStringForMarkedText;
}

- (void)setInputForMarkedText:(id)a3
{
}

- (NSString)inputForMarkedText
{
  return self->_inputForMarkedText;
}

- (void)setEventAuthenticationMessage:(id)a3
{
}

- (BKSHIDEventAuthenticationMessage)eventAuthenticationMessage
{
  return self->_eventAuthenticationMessage;
}

- (void)setSecureCandidateRenderTraits:(id)a3
{
}

- (TIKeyboardSecureCandidateRenderTraits)secureCandidateRenderTraits
{
  return self->_secureCandidateRenderTraits;
}

- (void)setDocumentState:(id)a3
{
}

- (TIDocumentState)documentState
{
  return self->_documentState;
}

- (void)setLayoutState:(id)a3
{
}

- (TIKeyboardLayoutState)layoutState
{
  return self->_layoutState;
}

- (void)setShiftState:(int)a3
{
  self->_shiftState = a3;
}

- (int)shiftState
{
  return self->_shiftState;
}

- (void)setKeyLayout:(id)a3
{
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (NSArray)auxiliaryInputModeLanguages
{
  return self->_auxiliaryInputModeLanguages;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (unint64_t)supplementalLexiconIdentifier
{
  return self->_supplementalLexiconIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    v6 = [(TIKeyboardState *)self documentIdentifier];
    uint64_t v7 = [v5 documentIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(TIKeyboardState *)self documentIdentifier];
      v10 = [v5 documentIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_112;
      }
    }
    v13 = [(TIKeyboardState *)self clientIdentifier];
    uint64_t v14 = [v5 clientIdentifier];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = NSString;
      v17 = [(TIKeyboardState *)self clientIdentifier];
      v18 = [v5 clientIdentifier];
      LODWORD(v16) = [v16 _string:v17 matchesString:v18];

      if (!v16) {
        goto LABEL_112;
      }
    }
    v19 = [(TIKeyboardState *)self inputMode];
    uint64_t v20 = [v5 inputMode];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = NSString;
      v23 = [(TIKeyboardState *)self inputMode];
      v24 = [v5 inputMode];
      LODWORD(v22) = [v22 _string:v23 matchesString:v24];

      if (!v22) {
        goto LABEL_112;
      }
    }
    v25 = [(TIKeyboardState *)self auxiliaryInputModeLanguages];
    uint64_t v26 = [v5 auxiliaryInputModeLanguages];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(TIKeyboardState *)self auxiliaryInputModeLanguages];
      v29 = [v5 auxiliaryInputModeLanguages];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_112;
      }
    }
    v31 = [(TIKeyboardState *)self recipientIdentifier];
    uint64_t v32 = [v5 recipientIdentifier];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = NSString;
      v35 = [(TIKeyboardState *)self recipientIdentifier];
      v36 = [v5 recipientIdentifier];
      LODWORD(v34) = [v34 _string:v35 matchesString:v36];

      if (!v34) {
        goto LABEL_112;
      }
    }
    v37 = [(TIKeyboardState *)self inputContextHistory];
    uint64_t v38 = [v5 inputContextHistory];
    if (v37 == (void *)v38)
    {
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(TIKeyboardState *)self inputContextHistory];
      v41 = [v5 inputContextHistory];
      int v42 = [v40 isEqual:v41];

      if (!v42) {
        goto LABEL_112;
      }
    }
    v43 = [(TIKeyboardState *)self keyLayout];
    uint64_t v44 = [v5 keyLayout];
    if (v43 == (void *)v44)
    {
    }
    else
    {
      v45 = (void *)v44;
      v46 = [(TIKeyboardState *)self keyLayout];
      v47 = [v5 keyLayout];
      int v48 = [v46 isEqual:v47];

      if (!v48) {
        goto LABEL_112;
      }
    }
    int v49 = [(TIKeyboardState *)self shiftState];
    if (v49 == [v5 shiftState])
    {
      v50 = [(TIKeyboardState *)self layoutState];
      uint64_t v51 = [v5 layoutState];
      if (v50 == (void *)v51)
      {
      }
      else
      {
        v52 = (void *)v51;
        v53 = [(TIKeyboardState *)self layoutState];
        v54 = [v5 layoutState];
        int v55 = [v53 isEqual:v54];

        if (!v55) {
          goto LABEL_112;
        }
      }
      v56 = [(TIKeyboardState *)self documentState];
      uint64_t v57 = [v5 documentState];
      if (v56 == (void *)v57)
      {
      }
      else
      {
        v58 = (void *)v57;
        v59 = [(TIKeyboardState *)self documentState];
        v60 = [v5 documentState];
        int v61 = [v59 isEqual:v60];

        if (!v61) {
          goto LABEL_112;
        }
      }
      v62 = [(TIKeyboardState *)self secureCandidateRenderTraits];
      uint64_t v63 = [v5 secureCandidateRenderTraits];
      if (v62 == (void *)v63)
      {
      }
      else
      {
        v64 = (void *)v63;
        v65 = [(TIKeyboardState *)self secureCandidateRenderTraits];
        v66 = [v5 secureCandidateRenderTraits];
        int v67 = [v65 isEqual:v66];

        if (!v67) {
          goto LABEL_112;
        }
      }
      v68 = [(TIKeyboardState *)self eventAuthenticationMessage];
      uint64_t v69 = [v5 eventAuthenticationMessage];
      if (v68 == (void *)v69)
      {
      }
      else
      {
        v70 = (void *)v69;
        v71 = [(TIKeyboardState *)self eventAuthenticationMessage];
        v72 = [v5 eventAuthenticationMessage];
        int v73 = [v71 isEqual:v72];

        if (!v73) {
          goto LABEL_112;
        }
      }
      v74 = [(TIKeyboardState *)self inputForMarkedText];
      uint64_t v75 = [v5 inputForMarkedText];
      if (v74 == (void *)v75)
      {
      }
      else
      {
        v76 = (void *)v75;
        v77 = NSString;
        v78 = [(TIKeyboardState *)self inputForMarkedText];
        v79 = [v5 inputForMarkedText];
        LODWORD(v77) = [v77 _string:v78 matchesString:v79];

        if (!v77) {
          goto LABEL_112;
        }
      }
      v80 = [(TIKeyboardState *)self searchStringForMarkedText];
      uint64_t v81 = [v5 searchStringForMarkedText];
      if (v80 == (void *)v81)
      {
      }
      else
      {
        v82 = (void *)v81;
        v83 = NSString;
        v84 = [(TIKeyboardState *)self searchStringForMarkedText];
        v85 = [v5 searchStringForMarkedText];
        LODWORD(v83) = [v83 _string:v84 matchesString:v85];

        if (!v83) {
          goto LABEL_112;
        }
      }
      v86 = [(TIKeyboardState *)self currentCandidate];
      uint64_t v87 = [v5 currentCandidate];
      if (v86 == (void *)v87)
      {
      }
      else
      {
        v88 = (void *)v87;
        v89 = [(TIKeyboardState *)self currentCandidate];
        v90 = [v5 currentCandidate];
        int v91 = [v89 isEqual:v90];

        if (!v91) {
          goto LABEL_112;
        }
      }
      int v92 = [(TIKeyboardState *)self userSelectedCurrentCandidate];
      if (v92 != [v5 userSelectedCurrentCandidate]) {
        goto LABEL_112;
      }
      int v93 = [(TIKeyboardState *)self shouldSkipCandidateSelection];
      if (v93 != [v5 shouldSkipCandidateSelection]) {
        goto LABEL_112;
      }
      int v94 = [(TIKeyboardState *)self suppressingCandidateSelection];
      if (v94 != [v5 suppressingCandidateSelection]) {
        goto LABEL_112;
      }
      int v95 = [(TIKeyboardState *)self needsCandidateMetadata];
      if (v95 != [v5 needsCandidateMetadata]) {
        goto LABEL_112;
      }
      int v96 = [(TIKeyboardState *)self keyboardEventsLagging];
      if (v96 != [v5 keyboardEventsLagging]) {
        goto LABEL_112;
      }
      int v97 = [(TIKeyboardState *)self hardwareKeyboardMode];
      if (v97 != [v5 hardwareKeyboardMode]) {
        goto LABEL_112;
      }
      int v98 = [(TIKeyboardState *)self splitKeyboardMode];
      if (v98 != [v5 splitKeyboardMode]) {
        goto LABEL_112;
      }
      int v99 = [(TIKeyboardState *)self floatingKeyboardMode];
      if (v99 != [v5 floatingKeyboardMode]) {
        goto LABEL_112;
      }
      int v100 = [(TIKeyboardState *)self landscapeOrientation];
      if (v100 != [v5 landscapeOrientation]) {
        goto LABEL_112;
      }
      int v101 = [(TIKeyboardState *)self wordLearningEnabled];
      if (v101 != [v5 wordLearningEnabled]) {
        goto LABEL_112;
      }
      int v102 = [(TIKeyboardState *)self inlineCompletionEnabled];
      if (v102 != [v5 inlineCompletionEnabled]) {
        goto LABEL_112;
      }
      int v103 = [(TIKeyboardState *)self autocorrectionEnabled];
      if (v103 != [v5 autocorrectionEnabled]) {
        goto LABEL_112;
      }
      int v104 = [(TIKeyboardState *)self imageSuggestionEnabled];
      if (v104 != [v5 imageSuggestionEnabled]) {
        goto LABEL_112;
      }
      int v105 = [(TIKeyboardState *)self omitEmojiCandidates];
      if (v105 != [v5 omitEmojiCandidates]) {
        goto LABEL_112;
      }
      int v106 = [(TIKeyboardState *)self emojiSearchMode];
      if (v106 != [v5 emojiSearchMode]) {
        goto LABEL_112;
      }
      int v107 = [(TIKeyboardState *)self emojiPopoverMode];
      if (v107 != [v5 emojiPopoverMode]) {
        goto LABEL_112;
      }
      int v108 = [(TIKeyboardState *)self shortcutConversionEnabled];
      if (v108 != [v5 shortcutConversionEnabled]) {
        goto LABEL_112;
      }
      int v109 = [(TIKeyboardState *)self candidateSelectionPredictionEnabled];
      if (v109 != [v5 candidateSelectionPredictionEnabled]) {
        goto LABEL_112;
      }
      int v110 = [(TIKeyboardState *)self autocapitalizationEnabled];
      if (v110 != [v5 autocapitalizationEnabled]) {
        goto LABEL_112;
      }
      int v111 = [(TIKeyboardState *)self inlineCompletionEnabled];
      if (v111 != [v5 inlineCompletionEnabled]) {
        goto LABEL_112;
      }
      v112 = [(TIKeyboardState *)self textInputTraits];
      uint64_t v113 = [v5 textInputTraits];
      if (v112 == (void *)v113)
      {
      }
      else
      {
        v114 = (void *)v113;
        v115 = [(TIKeyboardState *)self textInputTraits];
        v116 = [v5 textInputTraits];
        int v117 = [v115 isEqual:v116];

        if (!v117) {
          goto LABEL_112;
        }
      }
      v118 = [(TIKeyboardState *)self responseContext];
      uint64_t v119 = [v5 responseContext];
      if (v118 == (void *)v119)
      {
      }
      else
      {
        v120 = (void *)v119;
        v121 = NSString;
        v122 = [(TIKeyboardState *)self responseContext];
        v123 = [v5 responseContext];
        LODWORD(v121) = [v121 _string:v122 matchesString:v123];

        if (!v121) {
          goto LABEL_112;
        }
      }
      v124 = [(TIKeyboardState *)self supportedPayloadIds];
      uint64_t v125 = [v5 supportedPayloadIds];
      if (v124 == (void *)v125)
      {
      }
      else
      {
        v126 = (void *)v125;
        v127 = [(TIKeyboardState *)self supportedPayloadIds];
        v128 = [v5 supportedPayloadIds];
        int v129 = [v127 isEqual:v128];

        if (!v129) {
          goto LABEL_112;
        }
      }
      int v130 = [(TIKeyboardState *)self autocorrectionListUIDisplayed];
      if (v130 != [v5 autocorrectionListUIDisplayed]) {
        goto LABEL_112;
      }
      int v131 = [(TIKeyboardState *)self autocorrectionListUIAutoDisplayMode];
      if (v131 != [v5 autocorrectionListUIAutoDisplayMode]) {
        goto LABEL_112;
      }
      int v132 = [(TIKeyboardState *)self canSendCurrentLocation];
      if (v132 != [v5 canSendCurrentLocation]) {
        goto LABEL_112;
      }
      int v133 = [(TIKeyboardState *)self isScreenLocked];
      if (v133 != [v5 isScreenLocked]) {
        goto LABEL_112;
      }
      int v134 = [(TIKeyboardState *)self longPredictionListEnabled];
      if (v134 != [v5 longPredictionListEnabled]) {
        goto LABEL_112;
      }
      int v135 = [(TIKeyboardState *)self needAutofill];
      if (v135 != [v5 needAutofill]) {
        goto LABEL_112;
      }
      unint64_t v136 = [(TIKeyboardState *)self autofillMode];
      if (v136 != [v5 autofillMode]) {
        goto LABEL_112;
      }
      unint64_t v137 = [(TIKeyboardState *)self autofillSubMode];
      if (v137 != [v5 autofillSubMode]) {
        goto LABEL_112;
      }
      int v138 = [(TIKeyboardState *)self needOneTimeCodeAutofill];
      if (v138 != [v5 needOneTimeCodeAutofill]) {
        goto LABEL_112;
      }
      int v139 = [(TIKeyboardState *)self needCellularAutofill];
      if (v139 != [v5 needCellularAutofill]) {
        goto LABEL_112;
      }
      v140 = [(TIKeyboardState *)self autofillContext];
      uint64_t v141 = [v5 autofillContext];
      if (v140 == (void *)v141)
      {
      }
      else
      {
        v142 = (void *)v141;
        v143 = [(TIKeyboardState *)self autofillContext];
        v144 = [v5 autofillContext];
        int v145 = [v143 isEqualToDictionary:v144];

        if (!v145) {
          goto LABEL_112;
        }
      }
      v146 = [(TIKeyboardState *)self statisticChanges];
      uint64_t v147 = [v5 statisticChanges];
      if (v146 == (void *)v147)
      {
      }
      else
      {
        v148 = (void *)v147;
        v149 = [(TIKeyboardState *)self statisticChanges];
        v150 = [v5 statisticChanges];
        int v151 = [v149 isEqual:v150];

        if (!v151) {
          goto LABEL_112;
        }
      }
      if (self->_supplementalLexiconIdentifier == v5[4])
      {
        BOOL v152 = [(TIKeyboardState *)self canSuggestSupplementalItemsForCurrentSelection];
        int v12 = v152 ^ [v5 canSuggestSupplementalItemsForCurrentSelection] ^ 1;
LABEL_113:

        goto LABEL_114;
      }
    }
LABEL_112:
    LOBYTE(v12) = 0;
    goto LABEL_113;
  }
  LOBYTE(v12) = 0;
LABEL_114:

  return v12;
}

- (id)description
{
  int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  uint64_t shiftState = self->_shiftState;
  if (shiftState > 3) {
    v5 = "unknown";
  }
  else {
    v5 = off_1E55598B0[shiftState];
  }
  v6 = [(TIKeyboardState *)self documentIdentifier];
  [v3 appendFormat:@"; documentIdentifier = %@", v6];

  uint64_t v7 = [(TIKeyboardState *)self clientIdentifier];
  [v3 appendFormat:@"; clientIdentifier = %@", v7];

  v8 = [(TIKeyboardState *)self inputMode];
  [v3 appendFormat:@"; inputMode = %@", v8];

  v9 = [(TIKeyboardState *)self auxiliaryInputModeLanguages];
  [v3 appendFormat:@"; auxiliaryInputModeLanguages = %@", v9];

  v10 = [(TIKeyboardState *)self recipientIdentifier];
  [v3 appendFormat:@"; recipientIdentifier = %@", v10];

  int v11 = [(TIKeyboardState *)self inputContextHistory];
  [v3 appendFormat:@"; inputContextHistory = %@", v11];

  int v12 = [(TIKeyboardState *)self keyLayout];
  [v3 appendFormat:@"; keyLayout = %@", v12];

  objc_msgSend(v3, "appendFormat:", @"; uint64_t shiftState = %s", v5);
  v13 = [(TIKeyboardState *)self layoutState];
  [v3 appendFormat:@"; layoutState = %@", v13];

  uint64_t v14 = [(TIKeyboardState *)self documentState];
  [v3 appendFormat:@"; documentState = %@", v14];

  v15 = [(TIKeyboardState *)self secureCandidateRenderTraits];
  [v3 appendFormat:@"; secureCandidateRenderTraits = %@", v15];

  v16 = [(TIKeyboardState *)self eventAuthenticationMessage];
  [v3 appendFormat:@"; eventAuthenticationMessage = %@", v16];

  v17 = [(TIKeyboardState *)self inputForMarkedText];
  [v3 appendFormat:@"; inputForMarkedText = %@", v17];

  v18 = [(TIKeyboardState *)self searchStringForMarkedText];
  [v3 appendFormat:@"; searchStringForMarkedText = %@", v18];

  v19 = [(TIKeyboardState *)self currentCandidate];
  [v3 appendFormat:@"; currentCandidate = %@", v19];

  uint64_t v20 = [(TIKeyboardState *)self currentCandidate];

  if (v20)
  {
    if ([(TIKeyboardState *)self userSelectedCurrentCandidate]) {
      v21 = "YES";
    }
    else {
      v21 = "NO";
    }
    objc_msgSend(v3, "appendFormat:", @"; userSelectedCurrentCandidate = %s", v21);
  }
  if ([(TIKeyboardState *)self shouldSkipCandidateSelection]) {
    v22 = "YES";
  }
  else {
    v22 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; shouldSkipCandidateSelection = %s", v22);
  if ([(TIKeyboardState *)self suppressingCandidateSelection]) {
    v23 = "YES";
  }
  else {
    v23 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; suppressingCandidateSelection = %s", v23);
  if ([(TIKeyboardState *)self needsCandidateMetadata]) {
    v24 = "YES";
  }
  else {
    v24 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; needsCandidateMetadata = %s", v24);
  if ([(TIKeyboardState *)self keyboardEventsLagging]) {
    v25 = "YES";
  }
  else {
    v25 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; keyboardEventsLagging = %s", v25);
  if ([(TIKeyboardState *)self hardwareKeyboardMode]) {
    uint64_t v26 = "YES";
  }
  else {
    uint64_t v26 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; hardwareKeyboardMode = %s", v26);
  if ([(TIKeyboardState *)self splitKeyboardMode]) {
    v27 = "YES";
  }
  else {
    v27 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; splitKeyboardMode = %s", v27);
  if ([(TIKeyboardState *)self floatingKeyboardMode]) {
    v28 = "YES";
  }
  else {
    v28 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; floatingKeyboardMode = %s", v28);
  if ([(TIKeyboardState *)self wordLearningEnabled]) {
    v29 = "YES";
  }
  else {
    v29 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; wordLearningEnabled = %s", v29);
  if ([(TIKeyboardState *)self autocorrectionEnabled]) {
    int v30 = "YES";
  }
  else {
    int v30 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; autocorrectionEnabled = %s", v30);
  BOOL v31 = [(TIKeyboardState *)self imageSuggestionEnabled];
  uint64_t v32 = @"NO";
  if (v31) {
    uint64_t v32 = @"YES";
  }
  [v3 appendFormat:@"; imageSuggestionEnabled = %@", v32];
  if ([(TIKeyboardState *)self shortcutConversionEnabled]) {
    v33 = "YES";
  }
  else {
    v33 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; shortcutConversionEnabled = %s", v33);
  if ([(TIKeyboardState *)self omitEmojiCandidates]) {
    v34 = "YES";
  }
  else {
    v34 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; omitEmojiCandidates = %s", v34);
  if ([(TIKeyboardState *)self emojiSearchMode]) {
    v35 = "YES";
  }
  else {
    v35 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; emojiSearchMode = %s", v35);
  if ([(TIKeyboardState *)self emojiPopoverMode]) {
    v36 = "YES";
  }
  else {
    v36 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; emojiPopoverMode = %s", v36);
  if ([(TIKeyboardState *)self autocapitalizationEnabled]) {
    v37 = "YES";
  }
  else {
    v37 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; autocapitalizationEnabled = %s", v37);
  if ([(TIKeyboardState *)self inlineCompletionEnabled]) {
    uint64_t v38 = "YES";
  }
  else {
    uint64_t v38 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; inlineCompletionEnabled = %s", v38);
  v39 = [(TIKeyboardState *)self textInputTraits];
  [v3 appendFormat:@"; textInputTraits = %@", v39];

  v40 = [(TIKeyboardState *)self responseContext];
  [v3 appendFormat:@"; responseContext = %@", v40];

  v41 = [(TIKeyboardState *)self supportedPayloadIds];

  if (v41)
  {
    int v42 = [(TIKeyboardState *)self supportedPayloadIds];
    [v3 appendFormat:@"; supportedPayloadIds = %@", v42];
  }
  if ([(TIKeyboardState *)self autocorrectionListUIDisplayed]) {
    v43 = "YES";
  }
  else {
    v43 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; autocorrectionListUIDisplayed = %s", v43);
  if ([(TIKeyboardState *)self autocorrectionListUIAutoDisplayMode]) {
    uint64_t v44 = "YES";
  }
  else {
    uint64_t v44 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; autocorrectionListUIAutoDisplayMode = %s", v44);
  if ([(TIKeyboardState *)self canSendCurrentLocation]) {
    v45 = "YES";
  }
  else {
    v45 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; canSendCurrentLocation = %s", v45);
  if ([(TIKeyboardState *)self isScreenLocked]) {
    v46 = "YES";
  }
  else {
    v46 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; isScreenLocked = %s", v46);
  if ([(TIKeyboardState *)self longPredictionListEnabled]) {
    v47 = "YES";
  }
  else {
    v47 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; longPredictionListEnabled = %s", v47);
  if ([(TIKeyboardState *)self needAutofill]) {
    int v48 = "YES";
  }
  else {
    int v48 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; needAutofill = %s", v48);
  objc_msgSend(v3, "appendFormat:", @"; autofillMode = %ld",
    [(TIKeyboardState *)self autofillMode]);
  objc_msgSend(v3, "appendFormat:", @"; autofillSubMode = %ld",
    [(TIKeyboardState *)self autofillSubMode]);
  if ([(TIKeyboardState *)self needOneTimeCodeAutofill]) {
    int v49 = "YES";
  }
  else {
    int v49 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; needOneTimeCodeAutofill = %s", v49);
  if ([(TIKeyboardState *)self needCellularAutofill]) {
    v50 = "YES";
  }
  else {
    v50 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; needCellularAutofill = %s", v50);
  uint64_t v51 = [(TIKeyboardState *)self autofillContext];

  if (v51)
  {
    v52 = [(TIKeyboardState *)self autofillContext];
    [v3 appendFormat:@"; autofillContext = %@", v52];
  }
  v53 = [(TIKeyboardState *)self statisticChanges];

  if (v53)
  {
    v54 = [(TIKeyboardState *)self statisticChanges];
    [v3 appendFormat:@"; statisticChanges = %@", v54];
  }
  objc_msgSend(v3, "appendFormat:", @"; supplementalLexiconIdentifier = %llu",
    self->_supplementalLexiconIdentifier);
  if ([(TIKeyboardState *)self canSuggestSupplementalItemsForCurrentSelection])
  {
    int v55 = "YES";
  }
  else
  {
    int v55 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"; canSuggestSupplementalItemsForCurrentSelection = %s", v55);
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[TIKeyboardState allocWithZone:](TIKeyboardState, "allocWithZone:") init];
  objc_storeStrong((id *)&v5->_documentIdentifier, self->_documentIdentifier);
  uint64_t v6 = [(NSString *)self->_clientIdentifier copyWithZone:a3];
  clientIdentifier = v5->_clientIdentifier;
  v5->_clientIdentifier = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_inputMode copyWithZone:a3];
  inputMode = v5->_inputMode;
  v5->_inputMode = (NSString *)v8;

  uint64_t v10 = [(NSArray *)self->_auxiliaryInputModeLanguages copyWithZone:a3];
  auxiliaryInputModeLanguages = v5->_auxiliaryInputModeLanguages;
  v5->_auxiliaryInputModeLanguages = (NSArray *)v10;

  uint64_t v12 = [(NSString *)self->_recipientIdentifier copyWithZone:a3];
  recipientIdentifier = v5->_recipientIdentifier;
  v5->_recipientIdentifier = (NSString *)v12;

  uint64_t v14 = [(TIInputContextHistory *)self->_inputContextHistory copyWithZone:a3];
  inputContextHistory = v5->_inputContextHistory;
  v5->_inputContextHistory = v14;

  objc_storeStrong((id *)&v5->_keyLayout, self->_keyLayout);
  v16 = [(TIKeyboardLayoutState *)self->_layoutState copyWithZone:a3];
  layoutState = v5->_layoutState;
  v5->_layoutState = v16;

  objc_storeStrong((id *)&v5->_documentState, self->_documentState);
  v18 = [(TIKeyboardSecureCandidateRenderTraits *)self->_secureCandidateRenderTraits copyWithZone:a3];
  secureCandidateRenderTraits = v5->_secureCandidateRenderTraits;
  v5->_secureCandidateRenderTraits = v18;

  uint64_t v20 = [(BKSHIDEventAuthenticationMessage *)self->_eventAuthenticationMessage copyWithZone:a3];
  eventAuthenticationMessage = v5->_eventAuthenticationMessage;
  v5->_eventAuthenticationMessage = (BKSHIDEventAuthenticationMessage *)v20;

  uint64_t v22 = [(NSString *)self->_inputForMarkedText copyWithZone:a3];
  inputForMarkedText = v5->_inputForMarkedText;
  v5->_inputForMarkedText = (NSString *)v22;

  uint64_t v24 = [(NSString *)self->_searchStringForMarkedText copyWithZone:a3];
  searchStringForMarkedText = v5->_searchStringForMarkedText;
  v5->_searchStringForMarkedText = (NSString *)v24;

  uint64_t v26 = [(TITextInputTraits *)self->_textInputTraits copyWithZone:a3];
  textInputTraits = v5->_textInputTraits;
  v5->_textInputTraits = v26;

  uint64_t v28 = [(NSString *)self->_responseContext copyWithZone:a3];
  responseContext = v5->_responseContext;
  v5->_responseContext = (NSString *)v28;

  uint64_t v30 = [(NSArray *)self->_supportedPayloadIds copyWithZone:a3];
  supportedPayloadIds = v5->_supportedPayloadIds;
  v5->_supportedPayloadIds = (NSArray *)v30;

  uint64_t v32 = [(NSDictionary *)self->_autofillContext copyWithZone:a3];
  autofillContext = v5->_autofillContext;
  v5->_autofillContext = (NSDictionary *)v32;

  v34 = [(TIKeyboardCandidate *)self->_currentCandidate copyWithZone:a3];
  currentCandidate = v5->_currentCandidate;
  v5->_currentCandidate = v34;

  v5->_mask.integerValue = self->_mask.integerValue;
  v5->_uint64_t shiftState = self->_shiftState;
  v5->_autofillMode = self->_autofillMode;
  v5->_autofillSubMode = self->_autofillSubMode;
  v5->_autocorrectionListUIState.integerValue = self->_autocorrectionListUIState.integerValue;
  uint64_t v36 = [(NSArray *)self->_statisticChanges copyWithZone:a3];
  statisticChanges = v5->_statisticChanges;
  v5->_statisticChanges = (NSArray *)v36;

  v5->_supplementalLexiconIdentifier = self->_supplementalLexiconIdentifier;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v28 = a3;
  documentIdentifier = self->_documentIdentifier;
  if (documentIdentifier) {
    [v28 encodeObject:documentIdentifier forKey:@"documentIdentifier"];
  }
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v28 encodeObject:clientIdentifier forKey:@"clientIdentifier"];
  }
  inputMode = self->_inputMode;
  if (inputMode) {
    [v28 encodeObject:inputMode forKey:@"inputMode"];
  }
  auxiliaryInputModeLanguages = self->_auxiliaryInputModeLanguages;
  if (auxiliaryInputModeLanguages) {
    [v28 encodeObject:auxiliaryInputModeLanguages forKey:@"inputModeLanguages"];
  }
  recipientIdentifier = self->_recipientIdentifier;
  if (recipientIdentifier) {
    [v28 encodeObject:recipientIdentifier forKey:@"recipientIdentifier"];
  }
  inputContextHistory = self->_inputContextHistory;
  if (inputContextHistory) {
    [v28 encodeObject:inputContextHistory forKey:@"inputContextHistory"];
  }
  keyLayout = self->_keyLayout;
  if (keyLayout) {
    [v28 encodeObject:keyLayout forKey:@"keyLayout"];
  }
  layoutState = self->_layoutState;
  if (layoutState) {
    [v28 encodeObject:layoutState forKey:@"layoutState"];
  }
  documentState = self->_documentState;
  if (documentState) {
    [v28 encodeObject:documentState forKey:@"documentState"];
  }
  secureCandidateRenderTraits = self->_secureCandidateRenderTraits;
  if (secureCandidateRenderTraits) {
    [v28 encodeObject:secureCandidateRenderTraits forKey:@"secureCandidateRenderTraits"];
  }
  if (self->_eventAuthenticationMessage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [v28 encodeObject:self->_eventAuthenticationMessage forKey:@"eventAuthenticationMessage"];
    }
  }
  inputForMarkedText = self->_inputForMarkedText;
  if (inputForMarkedText) {
    [v28 encodeObject:inputForMarkedText forKey:@"inputForMarkedText"];
  }
  searchStringForMarkedText = self->_searchStringForMarkedText;
  if (searchStringForMarkedText) {
    [v28 encodeObject:searchStringForMarkedText forKey:@"searchStringForMarkedText"];
  }
  textInputTraits = self->_textInputTraits;
  if (textInputTraits) {
    [v28 encodeObject:textInputTraits forKey:@"textInputTraits"];
  }
  responseContext = self->_responseContext;
  if (responseContext) {
    [v28 encodeObject:responseContext forKey:@"responseContext"];
  }
  supportedPayloadIds = self->_supportedPayloadIds;
  if (supportedPayloadIds) {
    [v28 encodeObject:supportedPayloadIds forKey:@"supportedPayloadIds"];
  }
  autofillContext = self->_autofillContext;
  if (autofillContext) {
    [v28 encodeObject:autofillContext forKey:@"autofillContext"];
  }
  currentCandidate = self->_currentCandidate;
  if (currentCandidate) {
    [v28 encodeObject:currentCandidate forKey:@"currentCandidate"];
  }
  int64_t integerValue = self->_mask.integerValue;
  if (integerValue) {
    [v28 encodeInteger:integerValue forKey:@"flags"];
  }
  uint64_t shiftState = self->_shiftState;
  if (shiftState) {
    [v28 encodeInteger:shiftState forKey:@"shiftState"];
  }
  unint64_t autofillMode = self->_autofillMode;
  if (autofillMode) {
    [v28 encodeInteger:autofillMode forKey:@"autofillMode"];
  }
  unint64_t autofillSubMode = self->_autofillSubMode;
  if (autofillSubMode) {
    [v28 encodeInteger:autofillSubMode forKey:@"autofillSubMode"];
  }
  int64_t v25 = self->_autocorrectionListUIState.integerValue;
  if (v25) {
    [v28 encodeInteger:v25 forKey:@"autocorrectionListUIState"];
  }
  statisticChanges = self->_statisticChanges;
  if (statisticChanges) {
    [v28 encodeObject:statisticChanges forKey:@"statisticChanges"];
  }
  v27 = [NSNumber numberWithUnsignedLongLong:self->_supplementalLexiconIdentifier];
  [v28 encodeObject:v27 forKey:@"supplementalLexiconIdentifier"];
}

- (TIKeyboardState)initWithCoder:(id)a3
{
  v63[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)TIKeyboardState;
  v5 = [(TIKeyboardState *)&v59 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentIdentifier"];
    documentIdentifier = v5->_documentIdentifier;
    v5->_documentIdentifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientIdentifier"];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputMode"];
    inputMode = v5->_inputMode;
    v5->_inputMode = (NSString *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
    uint64_t v14 = [v12 setWithArray:v13];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"inputModeLanguages"];
    auxiliaryInputModeLanguages = v5->_auxiliaryInputModeLanguages;
    v5->_auxiliaryInputModeLanguages = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recipientIdentifier"];
    recipientIdentifier = v5->_recipientIdentifier;
    v5->_recipientIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputContextHistory"];
    inputContextHistory = v5->_inputContextHistory;
    v5->_inputContextHistory = (TIInputContextHistory *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyLayout"];
    keyLayout = v5->_keyLayout;
    v5->_keyLayout = (TIKeyboardLayout *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"layoutState"];
    layoutState = v5->_layoutState;
    v5->_layoutState = (TIKeyboardLayoutState *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"documentState"];
    documentState = v5->_documentState;
    v5->_documentState = (TIDocumentState *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureCandidateRenderTraits"];
    secureCandidateRenderTraits = v5->_secureCandidateRenderTraits;
    v5->_secureCandidateRenderTraits = (TIKeyboardSecureCandidateRenderTraits *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventAuthenticationMessage"];
    eventAuthenticationMessage = v5->_eventAuthenticationMessage;
    v5->_eventAuthenticationMessage = (BKSHIDEventAuthenticationMessage *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputForMarkedText"];
    inputForMarkedText = v5->_inputForMarkedText;
    v5->_inputForMarkedText = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"searchStringForMarkedText"];
    searchStringForMarkedText = v5->_searchStringForMarkedText;
    v5->_searchStringForMarkedText = (NSString *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textInputTraits"];
    textInputTraits = v5->_textInputTraits;
    v5->_textInputTraits = (TITextInputTraits *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"responseContext"];
    responseContext = v5->_responseContext;
    v5->_responseContext = (NSString *)v37;

    v39 = (void *)MEMORY[0x1E4F1CAD0];
    v62[0] = objc_opt_class();
    v62[1] = objc_opt_class();
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    v41 = [v39 setWithArray:v40];
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"supportedPayloadIds"];
    supportedPayloadIds = v5->_supportedPayloadIds;
    v5->_supportedPayloadIds = (NSArray *)v42;

    uint64_t v44 = (void *)MEMORY[0x1E4F1CAD0];
    v61[0] = objc_opt_class();
    v61[1] = objc_opt_class();
    v61[2] = objc_opt_class();
    v61[3] = objc_opt_class();
    v61[4] = objc_opt_class();
    v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:5];
    v46 = [v44 setWithArray:v45];
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"autofillContext"];
    autofillContext = v5->_autofillContext;
    v5->_autofillContext = (NSDictionary *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentCandidate"];
    currentCandidate = v5->_currentCandidate;
    v5->_currentCandidate = (TIKeyboardCandidate *)v49;

    v5->_mask.int64_t integerValue = [v4 decodeIntegerForKey:@"flags"];
    v5->_uint64_t shiftState = [v4 decodeIntegerForKey:@"shiftState"];
    v5->_unint64_t autofillMode = [v4 decodeIntegerForKey:@"autofillMode"];
    v5->_unint64_t autofillSubMode = [v4 decodeIntegerForKey:@"autofillSubMode"];
    v5->_autocorrectionListUIState.int64_t integerValue = [v4 decodeIntegerForKey:@"autocorrectionListUIState"];
    uint64_t v51 = (void *)MEMORY[0x1E4F1CAD0];
    v60[0] = objc_opt_class();
    v60[1] = objc_opt_class();
    v60[2] = objc_opt_class();
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
    v53 = [v51 setWithArray:v52];
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"statisticChanges"];
    statisticChanges = v5->_statisticChanges;
    v5->_statisticChanges = (NSArray *)v54;

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supplementalLexiconIdentifier"];
    v5->_supplementalLexiconIdentifier = [v56 unsignedLongLongValue];

    uint64_t v57 = v5;
  }

  return v5;
}

- (BOOL)shouldOutputFullwidthSpace
{
  int v3 = +[TIPreferencesController sharedPreferencesController];
  int v4 = [v3 BOOLForPreferenceKey:@"SmartFullwidthSpace"];

  v5 = [(TIKeyboardState *)self documentState];
  uint64_t v6 = [v5 contextBeforeInput];

  if (v4)
  {
    if ([v6 length])
    {
      int v7 = [v6 hasSuffix:@" "];
      uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
      int v9 = objc_msgSend(v8, "longCharacterIsMember:", objc_msgSend(v6, "_lastLongCharacter"));

      int v10 = (v9 | [v6 _endsWithHalfwidth] ^ 1) & ~v7;
    }
    else
    {
      LOBYTE(v10) = 1;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setNeedCellularAutofill:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFDFFFFFF | v3);
}

- (void)setNeedOneTimeCodeAutofill:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFDFFFF | v3);
}

- (BOOL)needCellularAutofill
{
  return (*((unsigned __int8 *)&self->_mask.fields + 3) >> 1) & 1;
}

- (BOOL)needContactAutofill
{
  return self->_autofillMode - 4 < 3;
}

- (BOOL)needOneTimeCodeAutofill
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 1) & 1;
}

- (void)setNeedAutofill:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFEFFFF | v3);
}

- (BOOL)needAutofill
{
  return *((unsigned char *)&self->_mask.fields + 2) & 1;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFF7FFF | v3);
}

- (void)setIsScreenLocked:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFBFFF | v3);
}

- (BOOL)isScreenLocked
{
  return (BYTE1(self->_mask.integerValue) >> 6) & 1;
}

- (void)setCanSendCurrentLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFDFFF | v3);
}

- (BOOL)canSendCurrentLocation
{
  return (BYTE1(self->_mask.integerValue) >> 5) & 1;
}

- (void)setAutocorrectionListUIAutoDisplayMode:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  LOBYTE(self->_autocorrectionListUIState.integerValue) = self->_autocorrectionListUIState.integerValue & 0xFD | v3;
}

- (BOOL)autocorrectionListUIAutoDisplayMode
{
  return (LOBYTE(self->_autocorrectionListUIState.integerValue) >> 1) & 1;
}

- (void)setAutocorrectionListUIDisplayed:(BOOL)a3
{
  LOBYTE(self->_autocorrectionListUIState.integerValue) = self->_autocorrectionListUIState.integerValue & 0xFE | a3;
}

- (BOOL)autocorrectionListUIDisplayed
{
  return self->_autocorrectionListUIState.integerValue & 1;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  [(TIKeyboardState *)self _createTextInputTraitsIfNecessary];
  id v5 = [(TIKeyboardState *)self textInputTraits];
  [v5 setSecureTextEntry:v3];
}

- (BOOL)secureTextEntry
{
  v2 = [(TIKeyboardState *)self textInputTraits];
  char v3 = [v2 secureTextEntry];

  return v3;
}

- (void)setKeyboardType:(unint64_t)a3
{
  [(TIKeyboardState *)self _createTextInputTraitsIfNecessary];
  id v5 = [(TIKeyboardState *)self textInputTraits];
  [v5 setKeyboardType:a3];
}

- (unint64_t)keyboardType
{
  v2 = [(TIKeyboardState *)self textInputTraits];
  unint64_t v3 = [v2 keyboardType];

  return v3;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  [(TIKeyboardState *)self _createTextInputTraitsIfNecessary];
  id v5 = [(TIKeyboardState *)self textInputTraits];
  [v5 setAutocapitalizationType:a3];
}

- (unint64_t)autocapitalizationType
{
  v2 = [(TIKeyboardState *)self textInputTraits];
  unint64_t v3 = [v2 autocapitalizationType];

  return v3;
}

- (void)_createTextInputTraitsIfNecessary
{
  if (!self->_textInputTraits)
  {
    self->_textInputTraits = objc_alloc_init(TITextInputTraits);
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)responseContext
{
  unint64_t v3 = [(TIKeyboardState *)self inputContextHistory];
  int v4 = [v3 mostRecentTextEntryIsByMe];

  id v5 = [(TIKeyboardState *)self inputContextHistory];
  uint64_t v6 = [v5 mostRecentNonSenderTextEntry];

  if (v6)
  {
    if (v4) {
      responseContext = 0;
    }
    else {
      responseContext = v6;
    }
  }
  else
  {
    responseContext = self->_responseContext;
  }
  uint64_t v8 = responseContext;

  return v8;
}

- (NSString)recipientIdentifier
{
  unint64_t v3 = [(TIKeyboardState *)self inputContextHistory];
  int v4 = [v3 recipientIdentifiers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(TIKeyboardState *)self inputContextHistory];
    int v7 = [v6 recipientIdentifiers];
    uint64_t v8 = [v7 anyObject];
  }
  else
  {
    uint64_t v8 = self->_recipientIdentifier;
  }

  return v8;
}

- (BOOL)inlineCompletionEnabled
{
  return *((unsigned __int8 *)&self->_mask.fields + 2) >> 7;
}

- (BOOL)autocapitalizationEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 4) & 1;
}

- (void)setCandidateSelectionPredictionEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFF7FF | v3);
}

- (BOOL)candidateSelectionPredictionEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 3) & 1;
}

- (void)setShortcutConversionEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFBFF | v3);
}

- (BOOL)shortcutConversionEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 2) & 1;
}

- (void)setImageSuggestionEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFEFFFFFF | v3);
}

- (BOOL)imageSuggestionEnabled
{
  return *((unsigned char *)&self->_mask.fields + 3) & 1;
}

- (BOOL)autocorrectionEnabled
{
  return (BYTE1(self->_mask.integerValue) >> 1) & 1;
}

- (void)setEmojiPopoverMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFDFFFFF | v3);
}

- (BOOL)emojiPopoverMode
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 5) & 1;
}

- (void)setEmojiSearchMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFEFFFFF | v3);
}

- (BOOL)emojiSearchMode
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 4) & 1;
}

- (void)setOmitEmojiCandidates:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFF7FFFF | v3);
}

- (BOOL)omitEmojiCandidates
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 3) & 1;
}

- (BOOL)wordLearningEnabled
{
  return BYTE1(self->_mask.integerValue) & 1;
}

- (void)setLandscapeOrientation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFBFFFF | v3);
}

- (BOOL)landscapeOrientation
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 2) & 1;
}

- (void)setFloatingKeyboardMode:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFF7F | v3);
}

- (BOOL)floatingKeyboardMode
{
  return LOBYTE(self->_mask.integerValue) >> 7;
}

- (void)setSplitKeyboardMode:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFBF | v3);
}

- (BOOL)splitKeyboardMode
{
  return (LOBYTE(self->_mask.integerValue) >> 6) & 1;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFDF | v3);
}

- (void)setKeyboardEventsLagging:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFEF | v3);
}

- (BOOL)keyboardEventsLagging
{
  return (LOBYTE(self->_mask.integerValue) >> 4) & 1;
}

- (void)setNeedsCandidateMetadata:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFF7 | v3);
}

- (BOOL)needsCandidateMetadata
{
  return (LOBYTE(self->_mask.integerValue) >> 3) & 1;
}

- (void)setSuppressingCandidateSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFFB | v3);
}

- (BOOL)suppressingCandidateSelection
{
  return (LOBYTE(self->_mask.integerValue) >> 2) & 1;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFFD | v3);
}

- (BOOL)shouldSkipCandidateSelection
{
  return (LOBYTE(self->_mask.integerValue) >> 1) & 1;
}

- (void)setUserSelectedCurrentCandidate:(BOOL)a3
{
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFFFFFFE | a3);
}

- (BOOL)userSelectedCurrentCandidate
{
  return self->_mask.integerValue & 1;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_mask.fields = ($4F333FB17DD5DC33741E9554F1398D52)(self->_mask.integerValue & 0xFFBFFFFF | v3);
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return (*((unsigned __int8 *)&self->_mask.fields + 2) >> 6) & 1;
}

- (TIKeyboardState)init
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardState;
  v2 = [(TIKeyboardState *)&v6 init];
  int v3 = v2;
  if (v2)
  {
    LODWORD(v2->_mask.integerValue) |= 0x400000u;
    int v4 = v2;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end