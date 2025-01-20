@interface WBSFormMetadataController
+ (BOOL)convertNumber:(id)a3 toFormMetadataRequestType:(unint64_t *)a4;
+ (id)classifyFormMetadata:(id)a3;
+ (id)formMetadataClassificationJS;
- (BOOL)addressBookAutoFillableFieldFocused:(id)a3 withAddressBookAutoFillableFieldMetadata:(id)a4 formMetadata:(id)a5 inFrame:(id)a6;
- (BOOL)autoFillFrameIsValid:(id)a3;
- (BOOL)isFrameAnnotated:(id)a3;
- (BOOL)isFrameOrChildAnnotated:(id)a3;
- (BOOL)manualAutoFillButtonWillFitInFieldWithMetadata:(id)a3;
- (BOOL)pageWithMainFrameMeetsEditedFormTextWarningCriteria:(id)a3;
- (BOOL)recursivelyCollectAncestorFramesOfFrame:(id)a3 startingFromFrame:(id)a4 ancestorFrames:(id)a5;
- (BOOL)shouldIncludeNonEmptyFields;
- (OpaqueJSValue)_jsObjectForForm:(id)a3 inFrame:(id)a4;
- (WBSFormMetadataController)init;
- (_NSRange)selectionRangeInField:(id)a3 inFrame:(id)a4;
- (id).cxx_construct;
- (id)_formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata:(id)a3 inFrame:(id)a4;
- (id)fillForm:(double)a3 inFrame:(id)a4 withPassword:(id)a5 focusedFieldControlID:(id)a6;
- (id)formAutoFillNodeForField:(id)a3 inFrame:(id)a4;
- (id)formAutoFillNodeForJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4;
- (id)formElementWithFormID:(double)a3 inFrame:(id)a4;
- (id)formSubmissionURLStringForSearchTextField:(id)a3 inFrame:(id)a4 useStrictDetection:(BOOL)a5;
- (id)metadataForActiveFormInPageWithMainFrame:(id)a3;
- (id)metadataForForm:(id)a3 inFrame:(id)a4 requestType:(unint64_t)a5;
- (id)metadataForForm:(id)a3 inFrame:(id)a4 requestType:(unint64_t)a5 addUserEditedStateForUserNameAndPasswordFields:(BOOL)a6;
- (id)substitutePasswordElementsWithAutomaticPasswordElementsInFrame:(id)a3 formID:(double)a4 focusedPasswordControlUniqueID:(id)a5 passwordControlUniqueIDs:(id)a6 automaticPassword:(id)a7 blurAfterSubstitution:(BOOL)a8;
- (id)uniqueIDForTextField:(id)a3 inFrame:(id)a4;
- (id)visibleNonEmptyTextFieldsInForm:(id)a3 inFrame:(id)a4;
- (unint64_t)userEditedTextControlCountInArray:(OpaqueJSValue *)a3 context:(OpaqueJSContext *)a4 expectTextFieldsRatherThanTextAreas:(BOOL)a5;
- (void)_lockMetadataForForm:(id)a3 inFrame:(id)a4;
- (void)_unlockMetadataForForm:(id)a3 inFrame:(id)a4;
- (void)annotateForm:(double)a3 inFrame:(id)a4 withValues:(id)a5;
- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 selectFieldAfterFilling:(id)a5;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 fieldsToObscure:(id)a9 submitForm:(BOOL)BOOLean;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 submitForm:(BOOL)a9;
- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 selectFieldAfterFilling:(id)a7;
- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4;
- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4 selectFieldAfterFilling:(id)a5;
- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5;
- (void)autoFilledField:(id)a3 inFrame:(id)a4;
- (void)automaticPasswordSheetDimissedInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4;
- (void)clearField:(id)a3 inFrame:(id)a4;
- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5;
- (void)clearMetadataForFrame:(id)a3;
- (void)countUserEditedTextControlsInFrame:(id)a3 textFields:(unint64_t *)a4 textAreas:(unint64_t *)a5;
- (void)disableSpellCheckInField:(id)a3 inFrame:(id)a4;
- (void)fillField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5;
- (void)focusField:(id)a3 inFrame:(id)a4;
- (void)focusFormForStreamlinedLogin:(double)a3 inFrame:(id)a4;
- (void)getMetadataForAllFormsInPageWithMainFrame:(id)a3 requestType:(unint64_t)a4 frames:(id *)a5 formMetadata:(id *)a6;
- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 completionHandler:(id)a5;
- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 textFieldMetadata:(id *)a5 formMetadata:(id *)a6 requestType:(unint64_t)a7;
- (void)metadataForFrame:(id)a3 requestType:(unint64_t)a4;
- (void)recursivelyClearMetadataForFrames:(id)a3;
- (void)recursivelyCollectMetadataInFrame:(id)a3 requestType:(unint64_t)a4 frames:(id)a5 formMetadata:(id)a6;
- (void)recursivelyCountUserEditedTextControlsInFrame:(id)a3 textFields:(unint64_t *)a4 textAreas:(unint64_t *)a5;
- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5 blurAfterRemoval:(BOOL)a6;
- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4;
- (void)replaceRange:(_NSRange)a3 inField:(id)a4 inFrame:(id)a5 withString:(id)a6 andSelectTailStartingAt:(unint64_t)a7;
- (void)selectRange:(_NSRange)a3 inField:(id)a4 inFrame:(id)a5;
- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5;
- (void)setFormControls:(id)a3 inFrame:(id)a4 asAutoFilled:(BOOL)a5;
- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5;
- (void)textFieldBlurred:(id)a3 inFrame:(id)a4 page:(id)a5 textFieldMetadata:(id)a6 formMetadata:(id)a7;
- (void)textFieldFocused:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6;
@end

@implementation WBSFormMetadataController

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (WBSFormMetadataController)init
{
  v6.receiver = self;
  v6.super_class = (Class)WBSFormMetadataController;
  v2 = [(WBSFormMetadataController *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedFormMetadata, 0);
  m_table = self->_framesToMetadataMap.m_impl.var0.m_table;
  if (m_table)
  {
    WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::deallocateTable((uint64_t)m_table, v3);
  }
}

+ (BOOL)convertNumber:(id)a3 toFormMetadataRequestType:(unint64_t *)a4
{
  id v5 = a3;
  objc_super v6 = v5;
  BOOL v7 = 0;
  if (v5 && a4)
  {
    unint64_t v8 = [v5 unsignedIntegerValue];
    if (v8 > 1)
    {
      BOOL v7 = 0;
    }
    else
    {
      *a4 = v8;
      BOOL v7 = 1;
    }
  }

  return v7;
}

- (void)annotateForm:(double)a3 inFrame:(id)a4 withValues:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (const OpaqueJSContext *)a5;
  unint64_t v8 = (SafariShared::JSUtilities *)[a4 jsContextForMetadataControllerScriptWorld];
  v10 = v8;
  if (v8)
  {
    v11 = SafariShared::JSUtilities::globalJSObjectByName(v8, (const OpaqueJSContext *)"FormMetadataJS", v9);
    if (v11)
    {
      *(void *)v13 = JSValueMakeNumber(v10, a3);
      uint64_t v14 = SafariShared::JSUtilities::translateNSToJSValue(v10, v7, v12);
      SafariShared::JSUtilities::callJSMethodWithArguments(v10, v11, (OpaqueJSValue *)"annotateFormWithID", v13, (const OpaqueJSValue *const *)2);
    }
  }
}

- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4 selectFieldAfterFilling:(id)a5
{
}

- (void)autoFillFormSynchronouslyInFrame:(id)a3 withValues:(id)a4
{
}

- (void)autoFillFormAsynchronouslyInFrame:(id)a3 withValues:(id)a4 selectFieldAfterFilling:(id)a5
{
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 selectFieldAfterFilling:(id)a7
{
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8
{
  LOBYTE(v8) = 0;
  [(WBSFormMetadataController *)self autoFillFormInFrame:a3 withValues:a4 fillSynchronously:a5 setAutoFilled:a6 focusFieldAfterFilling:a7 fieldToFocus:a8 fieldsToObscure:0 submitForm:v8];
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 submitForm:(BOOL)a9
{
  LOBYTE(v9) = 0;
  [(WBSFormMetadataController *)self autoFillFormInFrame:a3 withValues:a4 fillSynchronously:a5 setAutoFilled:a6 focusFieldAfterFilling:a7 fieldToFocus:a8 fieldsToObscure:0 submitForm:v9];
}

- (void)autoFillFormInFrame:(id)a3 withValues:(id)a4 fillSynchronously:(BOOL)a5 setAutoFilled:(BOOL)a6 focusFieldAfterFilling:(BOOL)a7 fieldToFocus:(id)a8 fieldsToObscure:(id)a9 submitForm:(BOOL)BOOLean
{
  v27[7] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  v16 = (const OpaqueJSContext *)a4;
  id v17 = a8;
  v18 = (const OpaqueJSContext *)a9;
  v19 = (SafariShared::JSUtilities *)[v15 jsContextForMetadataControllerScriptWorld];
  v21 = v19;
  if (v19)
  {
    v22 = SafariShared::JSUtilities::globalJSObjectByName(v19, (const OpaqueJSContext *)"FormMetadataJS", v20);
    if (v22)
    {
      JSValueRef Undefined = JSValueMakeUndefined(v21);
      if ([v17 length]) {
        JSValueRef Undefined = controlObject(v15, v17);
      }
      v27[0] = SafariShared::JSUtilities::translateNSToJSValue(v21, v16, v24);
      v27[1] = JSValueMakeBoolean(v21, a5);
      v27[2] = JSValueMakeBoolean(v21, a6);
      v27[3] = Undefined;
      v27[4] = JSValueMakeBoolean(v21, !a7);
      if (v18) {
        v26 = v18;
      }
      else {
        v26 = (const OpaqueJSContext *)MEMORY[0x1E4F1CBF0];
      }
      v27[5] = SafariShared::JSUtilities::translateNSToJSValue(v21, v26, v25);
      v27[6] = JSValueMakeBoolean(v21, BOOLean);
      SafariShared::JSUtilities::callJSMethodWithArguments(v21, v22, (OpaqueJSValue *)"autoFillControlsByID", (const char *)v27, (const OpaqueJSValue *const *)7);
    }
  }
}

- (void)autoFillOneTimeCodeFieldsInFrame:(id)a3 withValue:(id)a4 shouldSubmit:(BOOL)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (const OpaqueJSContext *)a4;
  uint64_t v8 = (SafariShared::JSUtilities *)[a3 jsContextForMetadataControllerScriptWorld];
  v10 = v8;
  if (v8)
  {
    v12 = SafariShared::JSUtilities::globalJSObjectByName(v8, (const OpaqueJSContext *)"FormMetadataJS", v9);
    if (v12)
    {
      *(void *)v13 = SafariShared::JSUtilities::translateNSToJSValue(v10, v7, v11);
      JSValueRef Boolean = JSValueMakeBoolean(v10, a5);
      SafariShared::JSUtilities::callJSMethodWithArguments(v10, v12, (OpaqueJSValue *)"autoFillOneTimeCodeFieldsWithValue", v13, (const OpaqueJSValue *const *)2);
    }
  }
}

- (void)focusFormForStreamlinedLogin:(double)a3 inFrame:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = (SafariShared::JSUtilities *)[a4 jsContextForMetadataControllerScriptWorld];
  if (v5)
  {
    BOOL v7 = v5;
    JSObjectRef v8 = SafariShared::JSUtilities::globalJSObjectByName(v5, (const OpaqueJSContext *)"FormMetadataJS", v6);
    if (v8)
    {
      uint64_t v9 = v8;
      v10[0] = JSValueMakeNumber(v7, a3);
      SafariShared::JSUtilities::callJSMethodWithArguments(v7, v9, (OpaqueJSValue *)"focusFormForStreamlinedLogin", (const char *)v10, (const OpaqueJSValue *const *)1);
    }
  }
}

- (void)autoFilledField:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = 0;
  id v11 = 0;
  [(WBSFormMetadataController *)self getMetadataForTextField:v6 inFrame:v7 textFieldMetadata:&v11 formMetadata:&v10 requestType:0];
  id v8 = v11;
  id v9 = v10;
  [(WBSFormMetadataController *)self autoFilledField:v8 inForm:v9 inFrame:v7];
}

- (void)setFormControls:(id)a3 inFrame:(id)a4 asAutoFilled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 jsContextForMetadataControllerScriptWorld];
  if (v10)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = controlObject(v9, *(void **)(*((void *)&v17 + 1) + 8 * v14));
          v16 = -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v15, v10, (void)v17);
          [v16 setHTMLInputElementAutofilled:v5];

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

- (id)fillForm:(double)a3 inFrame:(id)a4 withPassword:(id)a5 focusedFieldControlID:(id)a6
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v9 = (const OpaqueJSContext *)a5;
  uint64_t v10 = (const OpaqueJSContext *)a6;
  id v11 = (SafariShared::JSUtilities *)[a4 jsContextForMetadataControllerScriptWorld];
  uint64_t v13 = v11;
  if (v11)
  {
    uint64_t v14 = SafariShared::JSUtilities::globalJSObjectByName(v11, (const OpaqueJSContext *)"FormMetadataJS", v12);
    if (v14
      && (v20[0] = JSValueMakeNumber(v13, a3),
          v20[1] = SafariShared::JSUtilities::translateNSToJSValue(v13, v9, v15),
          v20[2] = SafariShared::JSUtilities::translateNSToJSValue(v13, v10, v16),
          long long v17 = SafariShared::JSUtilities::callJSMethodWithArguments(v13, v14, (OpaqueJSValue *)"fillFormWithPassword", (const char *)v20, (const OpaqueJSValue *const *)3), JSValueIsArray(v13, v17)))
    {
      SafariShared::JSUtilities::translateJSValueToNS(v13, v17, v18);
      uint64_t v13 = (SafariShared::JSUtilities *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = 0;
    }
  }

  return v13;
}

- (void)fillField:(id)a3 inFrame:(id)a4 withGeneratedPassword:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = (__CFString *)a3;
  id v8 = a4;
  id v9 = (const OpaqueJSContext *)a5;
  uint64_t v10 = (SafariShared::JSUtilities *)[v8 jsContextForMetadataControllerScriptWorld];
  uint64_t v12 = v10;
  if (v10)
  {
    uint64_t v13 = SafariShared::JSUtilities::globalJSObjectByName(v10, (const OpaqueJSContext *)"FormMetadataJS", v11);
    if (v13)
    {
      SafariShared::JSUtilities::jsString(v7, &string);
      *(void *)v16 = JSValueMakeString(v12, string);
      uint64_t v17 = SafariShared::JSUtilities::translateNSToJSValue(v12, v9, v14);
      if (string) {
        JSStringRelease(string);
      }
      SafariShared::JSUtilities::callJSMethodWithArguments(v12, v13, (OpaqueJSValue *)"fillFieldWithGeneratedPassword", v16, (const OpaqueJSValue *const *)2);
    }
  }
}

- (void)clearFieldsAndSetFormControlsToNotAutoFilled:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  [(WBSFormMetadataController *)self setFormControls:v8 inFrame:v9 asAutoFilled:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        -[WBSFormMetadataController clearField:inFrame:](self, "clearField:inFrame:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), v9, (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  v10[2](v10);
}

- (void)clearField:(id)a3 inFrame:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (__CFString *)a3;
  id v6 = a4;
  id v7 = (SafariShared::JSUtilities *)[v6 jsContextForMetadataControllerScriptWorld];
  id v9 = v7;
  if (v7)
  {
    uint64_t v10 = SafariShared::JSUtilities::globalJSObjectByName(v7, (const OpaqueJSContext *)"FormMetadataJS", v8);
    if (v10)
    {
      SafariShared::JSUtilities::jsString(v5, &string);
      *(void *)uint64_t v12 = JSValueMakeString(v9, string);
      if (string) {
        JSStringRelease(string);
      }
      SafariShared::JSUtilities::callJSMethodWithArguments(v9, v10, (OpaqueJSValue *)"clearField", v12, (const OpaqueJSValue *const *)1);
    }
  }
}

- (void)focusField:(id)a3 inFrame:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  id v6 = controlObject(v5, v7);
  if (v6) {
    SafariShared::JSUtilities::callJSMethodWithArguments((SafariShared::JSUtilities *)[v5 jsContextForMetadataControllerScriptWorld], v6, (OpaqueJSValue *)"focus", 0, 0);
  }
}

- (void)disableSpellCheckInField:(id)a3 inFrame:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = (const OpaqueJSContext *)a3;
  id v6 = (SafariShared::JSUtilities *)[a4 jsContextForMetadataControllerScriptWorld];
  id v8 = v6;
  if (v6)
  {
    uint64_t v10 = SafariShared::JSUtilities::globalJSObjectByName(v6, (const OpaqueJSContext *)"FormMetadataJS", v7);
    if (v10)
    {
      v11[0] = SafariShared::JSUtilities::translateNSToJSValue(v8, v5, v9);
      SafariShared::JSUtilities::callJSMethodWithArguments(v8, v10, (OpaqueJSValue *)"disableSpellCheckInFieldIfNeeded", (const char *)v11, (const OpaqueJSValue *const *)1);
    }
  }
}

- (_NSRange)selectionRangeInField:(id)a3 inFrame:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v5 = (const OpaqueJSContext *)a3;
  id v6 = a4;
  id v7 = (SafariShared::JSUtilities *)[v6 jsContextForMetadataControllerScriptWorld];
  id v9 = v7;
  if (!v7)
  {
    id v11 = 0;
LABEL_9:
    uint64_t v21 = 0;
    goto LABEL_16;
  }
  id v11 = SafariShared::JSUtilities::globalJSObjectByName(v7, (const OpaqueJSContext *)"FormMetadataJS", v8);
  if (!v11) {
    goto LABEL_9;
  }
  v24[0] = SafariShared::JSUtilities::translateNSToJSValue(v9, v5, v10);
  id v11 = SafariShared::JSUtilities::callJSMethodWithArguments(v9, v11, (OpaqueJSValue *)"selectionRangeInField", (const char *)v24, (const OpaqueJSValue *const *)1);
  if (!v11) {
    goto LABEL_9;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F30938];
  uint64_t v13 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:JSContextGetGlobalContext(v9)];
  uint64_t v14 = [v12 valueWithJSValueRef:v11 inContext:v13];

  long long v15 = [v14 objectForKeyedSubscript:@"length"];
  BOOL v16 = [v15 toInt32] == 2;

  if (v16)
  {
    long long v17 = [v14 objectAtIndexedSubscript:0];
    long long v18 = [v17 toNumber];

    if (v18)
    {
      long long v19 = [v14 objectAtIndexedSubscript:1];
      uint64_t v20 = [v19 toNumber];

      if (v20)
      {
        id v11 = (const OpaqueJSContext *)[v18 unsignedIntegerValue];
        uint64_t v21 = [v20 unsignedIntegerValue];
      }
      else
      {
        id v11 = 0;
        uint64_t v21 = 0;
      }
    }
    else
    {
      id v11 = 0;
      uint64_t v21 = 0;
    }
  }
  else
  {
    id v11 = 0;
    uint64_t v21 = 0;
  }

LABEL_16:
  NSUInteger v22 = (NSUInteger)v11;
  NSUInteger v23 = v21;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)selectRange:(_NSRange)a3 inField:(id)a4 inFrame:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v18[3] = *MEMORY[0x1E4F143B8];
  id v9 = (const OpaqueJSContext *)a4;
  id v10 = a5;
  id v11 = v10;
  m_tableForLLDB = self->_framesToMetadataMap.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    if (*(m_tableForLLDB - 3))
    {
      uint64_t v13 = (SafariShared::JSUtilities *)[v10 jsContextForMetadataControllerScriptWorld];
      long long v15 = v13;
      if (v13)
      {
        long long v17 = SafariShared::JSUtilities::globalJSObjectByName(v13, (const OpaqueJSContext *)"FormMetadataJS", v14);
        if (v17)
        {
          v18[0] = SafariShared::JSUtilities::translateNSToJSValue(v15, v9, v16);
          v18[1] = JSValueMakeNumber(v15, (double)location);
          v18[2] = JSValueMakeNumber(v15, (double)length);
          SafariShared::JSUtilities::callJSMethodWithArguments(v15, v17, (OpaqueJSValue *)"setFormFieldSelection", (const char *)v18, (const OpaqueJSValue *const *)3);
        }
      }
    }
  }
}

- (void)replaceRange:(_NSRange)a3 inField:(id)a4 inFrame:(id)a5 withString:(id)a6 andSelectTailStartingAt:(unint64_t)a7
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v20[5] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (const OpaqueJSContext *)a4;
  uint64_t v13 = (const OpaqueJSContext *)a6;
  uint64_t v14 = (SafariShared::JSUtilities *)[a5 jsContextForMetadataControllerScriptWorld];
  BOOL v16 = v14;
  if (v14)
  {
    long long v18 = SafariShared::JSUtilities::globalJSObjectByName(v14, (const OpaqueJSContext *)"FormMetadataJS", v15);
    if (v18)
    {
      v20[0] = SafariShared::JSUtilities::translateNSToJSValue(v16, v12, v17);
      v20[1] = JSValueMakeNumber(v16, (double)location);
      v20[2] = JSValueMakeNumber(v16, (double)length);
      v20[3] = SafariShared::JSUtilities::translateNSToJSValue(v16, v13, v19);
      void v20[4] = JSValueMakeNumber(v16, (double)a7);
      SafariShared::JSUtilities::callJSMethodWithArguments(v16, v18, (OpaqueJSValue *)"replaceFormFieldRangeAndSelectTail", (const char *)v20, (const OpaqueJSValue *const *)5);
    }
  }
}

- (BOOL)isFrameAnnotated:(id)a3
{
  v3 = (SafariShared::JSUtilities *)[a3 jsContextForMetadataControllerScriptWorld];
  if (!v3) {
    return 0;
  }
  id v5 = v3;
  id v6 = SafariShared::JSUtilities::globalJSObjectByName(v3, (const OpaqueJSContext *)"FormMetadataJS", v4);
  if (!v6) {
    return 0;
  }
  id v7 = SafariShared::JSUtilities::callJSMethodWithArguments(v5, v6, (OpaqueJSValue *)"isAnyFormAnnotated", 0, 0);
  if (!v7) {
    return 0;
  }
  return JSValueToBoolean(v5, v7);
}

- (BOOL)isFrameOrChildAnnotated:(id)a3
{
  id v4 = a3;
  if ([(WBSFormMetadataController *)self isFrameAnnotated:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__WBSFormMetadataController_isFrameOrChildAnnotated___block_invoke;
    v7[3] = &unk_1E5C9B8B8;
    v7[4] = self;
    v7[5] = &v8;
    [v4 enumerateChildFramesUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

void __53__WBSFormMetadataController_isFrameOrChildAnnotated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(a1 + 32), "isFrameOrChildAnnotated:");
}

- (void)clearMetadataForFrame:(id)a3
{
  id v4 = a3;
  cachedFormMetadata = self->_cachedFormMetadata;
  self->_cachedFormMetadata = 0;

  uint64_t v11 = [v4 frameRef];
  id v6 = (unsigned int *)WTF::HashTable<OpaqueJSContext *,WTF::KeyValuePair<OpaqueJSContext *,OpaqueJSWeakObjectMap *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueJSContext *,OpaqueJSWeakObjectMap *>>,WTF::DefaultHash<OpaqueJSContext *>,WTF::HashMap<OpaqueJSContext *,OpaqueJSWeakObjectMap *,WTF::DefaultHash<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSWeakObjectMap *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueJSContext *>>::find<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueJSContext *,OpaqueJSWeakObjectMap *,WTF::DefaultHash<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSContext *>,WTF::HashTraits<OpaqueJSWeakObjectMap *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueJSContext *>>,OpaqueJSContext *>((uint64_t *)&self->_framesToMetadataMap, &v11);
  m_tableForLLDB = self->_framesToMetadataMap.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    uint64_t v8 = &m_tableForLLDB[4 * *(m_tableForLLDB - 1)];
    if (v8 == v6) {
      goto LABEL_12;
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_12;
    }
    uint64_t v8 = 0;
  }
  if (v8 != v6)
  {
    WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::remove((uint64_t *)&self->_framesToMetadataMap, v6);
    m_tableForLLDB = self->_framesToMetadataMap.m_impl.var0.m_tableForLLDB;
  }
  if (!m_tableForLLDB || !*(m_tableForLLDB - 3))
  {
    id v9 = [v4 pageMainFrame];
    BOOL v10 = [(WBSFormMetadataController *)self isFrameOrChildAnnotated:v9];

    if (!v10) {
      [(WBSFormMetadataController *)self clearScriptWorld];
    }
  }
LABEL_12:
}

- (void)recursivelyClearMetadataForFrames:(id)a3
{
  id v4 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__WBSFormMetadataController_recursivelyClearMetadataForFrames___block_invoke;
  v5[3] = &unk_1E5C9B8E0;
  v5[4] = self;
  [v4 enumerateChildFramesUsingBlock:v5];
  [(WBSFormMetadataController *)self clearMetadataForFrame:v4];
}

uint64_t __63__WBSFormMetadataController_recursivelyClearMetadataForFrames___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) recursivelyClearMetadataForFrames:a2];
}

- (void)metadataForFrame:(id)a3 requestType:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v8 = [v5 frameRef];
  WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::add<decltype(nullptr)>((uint64_t *)&self->_framesToMetadataMap, &v8, (uint64_t)v9);
  id v6 = *(void **)(v9[0] + 8);
  if (!v6) {
    operator new();
  }

  return v6;
}

- (void)recursivelyCollectMetadataInFrame:(id)a3 requestType:(unint64_t)a4 frames:(id)a5 formMetadata:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 committedURL];
  if (objc_msgSend(v13, "safari_isHTTPFamilyURL") & 1) != 0 || (objc_msgSend(v13, "isFileURL"))
  {
  }
  else
  {
    int v21 = objc_msgSend(v13, "safari_isDataURL");

    if (!v21) {
      goto LABEL_12;
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v14 = SafariShared::FrameMetadata::metadataForAllForms((uint64_t)[(WBSFormMetadataController *)self metadataForFrame:v10 requestType:a4], a4);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v27;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * v17);
        [v11 addObject:v10];
        [v12 addObject:v18];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

LABEL_12:
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __95__WBSFormMetadataController_recursivelyCollectMetadataInFrame_requestType_frames_formMetadata___block_invoke;
  v22[3] = &unk_1E5C9B908;
  v22[4] = self;
  unint64_t v25 = a4;
  id v19 = v11;
  id v23 = v19;
  id v20 = v12;
  id v24 = v20;
  [v10 enumerateChildFramesUsingBlock:v22];
}

uint64_t __95__WBSFormMetadataController_recursivelyCollectMetadataInFrame_requestType_frames_formMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) recursivelyCollectMetadataInFrame:a2 requestType:*(void *)(a1 + 56) frames:*(void *)(a1 + 40) formMetadata:*(void *)(a1 + 48)];
}

- (BOOL)recursivelyCollectAncestorFramesOfFrame:(id)a3 startingFromFrame:(id)a4 ancestorFrames:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 frameRef];
  if (v11 == [v8 frameRef])
  {
    [v10 addObject:v9];
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v19 = 0;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000;
    char v22 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__WBSFormMetadataController_recursivelyCollectAncestorFramesOfFrame_startingFromFrame_ancestorFrames___block_invoke;
    v14[3] = &unk_1E5C9B930;
    v14[4] = self;
    id v15 = v8;
    id v16 = v10;
    uint64_t v18 = &v19;
    id v17 = v9;
    [v17 enumerateChildFramesUsingBlock:v14];
    BOOL v12 = *((unsigned char *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v12;
}

void __102__WBSFormMetadataController_recursivelyCollectAncestorFramesOfFrame_startingFromFrame_ancestorFrames___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "recursivelyCollectAncestorFramesOfFrame:startingFromFrame:ancestorFrames:", *(void *)(a1 + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

- (void)getMetadataForAllFormsInPageWithMainFrame:(id)a3 requestType:(unint64_t)a4 frames:(id *)a5 formMetadata:(id *)a6
{
  id v12 = a3;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  [(WBSFormMetadataController *)self recursivelyCollectMetadataInFrame:v12 requestType:a4 frames:v10 formMetadata:v11];
  if (a5) {
    *a5 = v10;
  }
  if (a6) {
    *a6 = v11;
  }
}

- (OpaqueJSValue)_jsObjectForForm:(id)a3 inFrame:(id)a4
{
  id v5 = a4;
  id v6 = (const OpaqueJSValue *)[v5 jsWrapperInMetadataControllerScriptWorldForNode:a3];
  if (v6) {
    id v6 = JSValueToObject((JSContextRef)[v5 jsContextForMetadataControllerScriptWorld], v6, 0);
  }

  return v6;
}

- (id)metadataForForm:(id)a3 inFrame:(id)a4 requestType:(unint64_t)a5
{
  id v5 = [(WBSFormMetadataController *)self metadataForForm:a3 inFrame:a4 requestType:a5 addUserEditedStateForUserNameAndPasswordFields:0];
  return v5;
}

- (id)metadataForForm:(id)a3 inFrame:(id)a4 requestType:(unint64_t)a5 addUserEditedStateForUserNameAndPasswordFields:(BOOL)a6
{
  id v10 = a4;
  uint64_t v11 = [(WBSFormMetadataController *)self _jsObjectForForm:a3 inFrame:v10];
  if (v11)
  {
    id v12 = SafariShared::FrameMetadata::metadataForForm((id *)[(WBSFormMetadataController *)self metadataForFrame:v10 requestType:a5], v11, a5);
    if (a6)
    {
      uint64_t v13 = [(WBSFormMetadataController *)self _formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata:v12 inFrame:v10];

      id v12 = (void *)v13;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata:(id)a3 inFrame:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v23 = a4;
  uint64_t v21 = [v5 userNameElementUniqueID];
  uint64_t v6 = [v5 passwordElementUniqueID];
  id v20 = (void *)v6;
  if (__PAIR128__((unint64_t)v21, v6) != 0)
  {
    uint64_t v18 = v5;
    id v7 = [v5 controls];
    id v8 = (void *)[v7 mutableCopy];

    uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
    if (v21) {
      [v19 addObject:v21];
    }
    if (v20) {
      [v19 addObject:v20];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v19;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __132__WBSFormMetadataController__formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata_inFrame___block_invoke;
          v25[3] = &unk_1E5C9B808;
          v25[4] = v12;
          uint64_t v13 = [v8 indexOfObjectPassingTest:v25];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v14 = [v8 objectAtIndexedSubscript:v13];
            id v15 = (void *)[v14 mutableCopy];

            id v16 = [(WBSFormMetadataController *)self formAutoFillNodeForField:v12 inFrame:v23];
            objc_msgSend(v15, "setUserEditedTextField:", objc_msgSend(v16, "isHTMLInputElementUserEdited"));
            [v8 setObject:v15 atIndexedSubscript:v13];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    id v5 = [v18 formMetadataByReplacingControlsWith:v8];
  }
  return v5;
}

uint64_t __132__WBSFormMetadataController__formMetadataByAddingInformationAboutUserEditedStateForUserNameAndPasswordFieldsToFormMetadata_inFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_lockMetadataForForm:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WBSFormMetadataController *)self _unlockMetadataForForm:v6 inFrame:v7];
  id v8 = [(WBSFormMetadataController *)self _jsObjectForForm:v6 inFrame:v7];
  if (v8)
  {
    uint64_t v9 = (const OpaqueJSContext *)[v7 jsContextForMetadataControllerScriptWorld];
    uint64_t v10 = SafariShared::FrameMetadata::jsMetadataForForm((id *)[(WBSFormMetadataController *)self metadataForFrame:v7 requestType:0], v8, 0);
    if (v10)
    {
      SafariShared::JSUtilities::jsString((SafariShared::JSUtilities *)"_safariLockedFormMetadata", &propertyName);
      JSObjectSetProperty(v9, v8, propertyName, v10, 0, 0);
      if (propertyName) {
        JSStringRelease(propertyName);
      }
    }
  }
}

- (void)_unlockMetadataForForm:(id)a3 inFrame:(id)a4
{
  id v6 = a4;
  id v7 = [(WBSFormMetadataController *)self _jsObjectForForm:a3 inFrame:v6];
  if (v7)
  {
    id v8 = (const OpaqueJSContext *)[v6 jsContextForMetadataControllerScriptWorld];
    SafariShared::JSUtilities::jsString((SafariShared::JSUtilities *)"_safariLockedFormMetadata", &propertyName);
    JSObjectDeleteProperty(v8, v7, propertyName, 0);
    if (propertyName) {
      JSStringRelease(propertyName);
    }
  }
}

- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 textFieldMetadata:(id *)a5 formMetadata:(id *)a6 requestType:(unint64_t)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v50 = v12;
  [(WBSFormMetadataController *)self metadataForFrame:v13 requestType:0];
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  uint64_t v14 = (const OpaqueJSValue *)[v13 jsWrapperInMetadataControllerScriptWorldForNode:v12];
  if (!v14) {
    goto LABEL_14;
  }
  id v15 = (const OpaqueJSContext *)[v13 jsContextForMetadataControllerScriptWorld];
  JSObjectRef v16 = JSValueToObject(v15, v14, 0);
  ctx = v15;
  JSObjectRef v18 = SafariShared::JSUtilities::globalJSObjectByName(v15, (const OpaqueJSContext *)"FormMetadataJS", v17);
  if (!v18) {
    goto LABEL_14;
  }
  v48 = v18;
  JSValueRef Boolean = 0;
  *(void *)v56 = v16;
  JSValueRef Number = JSValueMakeNumber(v15, (double)a7);
  JSValueRef Boolean = JSValueMakeBoolean(v15, self->_cachedFormMetadata != 0);
  JSValueRef v19 = SafariShared::JSUtilities::callJSMethodWithArguments(v15, v48, (OpaqueJSValue *)"textFieldOrSelectElementMetadata", v56, (const OpaqueJSValue *const *)3);
  if (!v19)
  {
LABEL_13:
    SafariShared::JSUtilities::callJSMethodWithArguments(ctx, v48, (OpaqueJSValue *)"clearTextFieldOrSelectElementMetadataCache", 0, 0);
LABEL_14:
    cachedFormMetadata = self->_cachedFormMetadata;
    self->_cachedFormMetadata = 0;

    goto LABEL_15;
  }
  id v20 = (void *)MEMORY[0x1E4F30938];
  uint64_t v21 = [MEMORY[0x1E4F30920] contextWithJSGlobalContextRef:JSContextGetGlobalContext(v15)];
  v43 = a6;
  v44 = a5;
  v47 = [v20 valueWithJSValueRef:v19 inContext:v21];

  char v22 = [v47 objectForKeyedSubscript:@"length"];
  BOOL v23 = [v22 toInt32] == 2;

  if (!v23
    || ([v47 objectAtIndexedSubscript:0],
        id v24 = objc_claimAutoreleasedReturnValue(),
        [v24 toDictionary],
        v45 = objc_claimAutoreleasedReturnValue(),
        v24,
        !v45))
  {

    goto LABEL_13;
  }
  unint64_t v25 = [(WBSFormControlMetadata *)[WBSMutableFormControlMetadata alloc] initWithDictionary:v45];
  v42 = [v47 objectAtIndexedSubscript:1];
  if ([v42 toBool])
  {
    long long v26 = [[WBSFormMetadata alloc] initWithJSValue:v42];
    long long v27 = self->_cachedFormMetadata;
    v46 = v26;
    self->_cachedFormMetadata = v26;
  }
  else
  {
    long long v29 = self->_cachedFormMetadata;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v46 = v29;
    long long v27 = [(WBSFormMetadata *)v29 controls];
    uint64_t v30 = [v27 countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v52 != v31) {
            objc_enumerationMutation(v27);
          }
          v33 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v34 = [v33 uniqueID];
          v35 = [(WBSFormControlMetadata *)v25 uniqueID];
          BOOL v36 = v34 == v35;

          if (v36)
          {
            v37 = [(WBSFormControlMetadata *)v25 value];
            [v33 setValue:v37];
          }
        }
        uint64_t v30 = [v27 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v30);
    }
  }

  SafariShared::addAdditionalControlMetadata(v25, v50);
  -[WBSMutableFormControlMetadata setUserEditedTextField:](v25, "setUserEditedTextField:", [v50 isHTMLInputElementUserEdited]);
  v38 = [MEMORY[0x1E4F1CA48] array];
  v39 = [v13 pageMainFrame];
  [(WBSFormMetadataController *)self recursivelyCollectAncestorFramesOfFrame:v13 startingFromFrame:v39 ancestorFrames:v38];

  v40 = objc_msgSend(v38, "safari_mapObjectsUsingBlock:", &__block_literal_global_53);
  [(WBSMutableFormControlMetadata *)v25 setAncestorFrameURLs:v40];

  if (v44) {
    id *v44 = (id)[(WBSMutableFormControlMetadata *)v25 copy];
  }
  if (v43)
  {
    SafariShared::addPasswordRequirementsToFormMetadata((SafariShared *)v46, v41);
    id *v43 = v46;
  }

LABEL_15:
}

id __104__WBSFormMetadataController_getMetadataForTextField_inFrame_textFieldMetadata_formMetadata_requestType___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 committedURL];
  return v2;
}

- (void)getMetadataForTextField:(id)a3 inFrame:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id, id))a5;
  uint64_t v11 = [v9 pageMainFrame];
  [(WBSFormMetadataController *)self getMetadataForAllFormsInPageWithMainFrame:v11 requestType:0 frames:0 formMetadata:0];

  id v12 = [(WBSFormMetadataController *)self formAutoFillNodeForField:v8 inFrame:v9];
  if (v12)
  {
    id v15 = 0;
    id v16 = 0;
    [(WBSFormMetadataController *)self getMetadataForTextField:v12 inFrame:v9 textFieldMetadata:&v16 formMetadata:&v15 requestType:0];
    id v13 = v16;
    id v14 = v15;
  }
  else
  {
    id v13 = 0;
    id v14 = 0;
  }
  v10[2](v10, v14, v13);
}

- (id)uniqueIDForTextField:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WBSFormMetadataController *)self metadataForFrame:v7 requestType:0];
  id v8 = (const OpaqueJSValue *)[v7 jsWrapperInMetadataControllerScriptWorldForNode:v6];
  if (v8
    && (id v9 = (const OpaqueJSContext *)[v7 jsContextForMetadataControllerScriptWorld],
        *(void *)id v15 = JSValueToObject(v9, v8, 0),
        (uint64_t v11 = SafariShared::JSUtilities::globalJSObjectByName(v9, (const OpaqueJSContext *)"FormMetadataJS", v10)) != 0)
    && (id v12 = SafariShared::JSUtilities::callJSMethodWithArguments(v9, v11, (OpaqueJSValue *)"controlUniqueID", v15, (const OpaqueJSValue *const *)1)) != 0)
  {
    id v13 = SafariShared::JSUtilities::toNSString(v9, v12, 2);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (unint64_t)userEditedTextControlCountInArray:(OpaqueJSValue *)a3 context:(OpaqueJSContext *)a4 expectTextFieldsRatherThanTextAreas:(BOOL)a5
{
  if (!a3) {
    return 0;
  }
  BOOL v5 = a5;
  id v8 = JSValueToObject(a4, a3, 0);
  if (!v8) {
    return 0;
  }
  uint64_t v10 = v8;
  JSValueRef v21 = 0;
  unint64_t v11 = SafariShared::JSUtilities::arrayLength(a4, v8, &v21, v9);
  unint64_t v12 = 0;
  if (!v21)
  {
    unint64_t v13 = v11;
    if (v11)
    {
      uint64_t v14 = 0;
      unint64_t v12 = 0;
      do
      {
        PropertyAtIndex = JSObjectGetPropertyAtIndex(a4, v10, v14, 0);
        if (PropertyAtIndex)
        {
          JSObjectRef v16 = JSValueToObject(a4, PropertyAtIndex, 0);
          if (v16)
          {
            id v17 = [(WBSFormMetadataController *)self formAutoFillNodeForJSWrapper:v16 inContext:a4];
            JSObjectRef v18 = v17;
            if (v17)
            {
              if (v5) {
                unsigned int v19 = [v17 isHTMLInputElementUserEdited];
              }
              else {
                unsigned int v19 = [v17 isHTMLTextAreaElementUserEdited];
              }
              v12 += v19;
            }
          }
        }
        ++v14;
      }
      while (v13 != v14);
    }
  }
  return v12;
}

- (void)countUserEditedTextControlsInFrame:(id)a3 textFields:(unint64_t *)a4 textAreas:(unint64_t *)a5
{
  id v8 = a3;
  [(WBSFormMetadataController *)self metadataForFrame:v8 requestType:0];
  id v9 = (SafariShared::JSUtilities *)[v8 jsContextForMetadataControllerScriptWorld];
  unint64_t v11 = v9;
  if (v9)
  {
    unint64_t v12 = SafariShared::JSUtilities::globalJSObjectByName(v9, (const OpaqueJSContext *)"FormMetadataJS", v10);
    if (v12)
    {
      unint64_t v13 = SafariShared::JSUtilities::callJSMethodWithArguments(v11, v12, (OpaqueJSValue *)"visibleNonEmptyFormTextControls", 0, 0);
      if (v13)
      {
        uint64_t v14 = JSValueToObject(v11, v13, 0);
        JSValueRef v16 = 0;
        if (SafariShared::JSUtilities::arrayLength(v11, v14, &v16, v15) == 2 && !v16)
        {
          *a4 = [(WBSFormMetadataController *)self userEditedTextControlCountInArray:JSObjectGetPropertyAtIndex(v11, v14, 0, 0) context:v11 expectTextFieldsRatherThanTextAreas:1];
          *a5 = [(WBSFormMetadataController *)self userEditedTextControlCountInArray:JSObjectGetPropertyAtIndex(v11, v14, 1u, 0) context:v11 expectTextFieldsRatherThanTextAreas:0];
        }
      }
    }
  }
}

- (void)recursivelyCountUserEditedTextControlsInFrame:(id)a3 textFields:(unint64_t *)a4 textAreas:(unint64_t *)a5
{
  id v8 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  uint64_t v10 = 0;
  unint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  [(WBSFormMetadataController *)self countUserEditedTextControlsInFrame:v8 textFields:&v17 textAreas:&v13];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __96__WBSFormMetadataController_recursivelyCountUserEditedTextControlsInFrame_textFields_textAreas___block_invoke;
  void v9[3] = &unk_1E5C9B978;
  v9[4] = self;
  v9[5] = &v14;
  v9[6] = &v10;
  [v8 enumerateChildFramesUsingBlock:v9];
  *a4 += v15[3];
  *a5 += v11[3];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
}

uint64_t __96__WBSFormMetadataController_recursivelyCountUserEditedTextControlsInFrame_textFields_textAreas___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) recursivelyCountUserEditedTextControlsInFrame:a2 textFields:*(void *)(*(void *)(a1 + 40) + 8) + 24 textAreas:*(void *)(*(void *)(a1 + 48) + 8) + 24];
}

- (BOOL)pageWithMainFrameMeetsEditedFormTextWarningCriteria:(id)a3
{
  id v4 = a3;
  BOOL v5 = (const OpaqueJSContext *)[v4 jsContextForMetadataControllerScriptWorld];
  id v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  GlobalObject = JSContextGetGlobalObject(v5);
  if (SafariShared::jsObjectHasOnBeforeUnloadProperty(v6, GlobalObject, v8)) {
    goto LABEL_7;
  }
  uint64_t v10 = SafariShared::JSUtilities::globalJSObjectByName(v6, (const OpaqueJSContext *)"document", v9);
  SafariShared::JSUtilities::jsString((SafariShared::JSUtilities *)"body", &propertyName);
  Property = JSObjectGetProperty(v6, v10, propertyName, 0);
  uint64_t v13 = JSValueToObject(v6, Property, 0);
  if (propertyName) {
    JSStringRelease(propertyName);
  }
  if (v13 && SafariShared::jsObjectHasOnBeforeUnloadProperty(v6, v13, v12))
  {
LABEL_7:
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    JSStringRef propertyName = 0;
    [(WBSFormMetadataController *)self recursivelyCountUserEditedTextControlsInFrame:v4 textFields:&propertyName textAreas:&v17];
    [(WBSFormMetadataController *)self recursivelyClearMetadataForFrames:v4];
    if (v17) {
      BOOL v15 = 1;
    }
    else {
      BOOL v15 = (unint64_t)propertyName > 1;
    }
    BOOL v14 = v15;
  }

  return v14;
}

- (void)textFieldFocused:(id)a3 inFrame:(id)a4 textFieldMetadata:(id)a5 formMetadata:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (WBSFormControlMetadata *)a5;
  uint64_t v13 = (WBSFormMetadata *)a6;
  uint64_t v30 = [v11 frameRef];
  if (!WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::contains<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueFormAutoFillFrame *>>,OpaqueFormAutoFillFrame *>((uint64_t *)&self->_framesToMetadataMap, &v30))
  {
    JSObjectRef v18 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[WBSFormMetadataController textFieldFocused:inFrame:textFieldMetadata:formMetadata:](v18);
    }
    goto LABEL_17;
  }
  if ([(WBSFormControlMetadata *)v12 isSecureTextField])
  {
    long long v29 = getField(self, v12, v11);
    BOOL v14 = v12;
    BOOL v15 = v13;
    uint64_t v16 = [(WBSFormMetadata *)v15 type];
    if ((unint64_t)(v16 - 6) < 0xFFFFFFFFFFFFFFFDLL)
    {
      uint64_t v17 = 0;
LABEL_12:

      [(WBSFormMetadataController *)self passwordFieldFocused:v29 inFrame:v11 textFieldMetadata:v14 formMetadata:v15 isPasswordFieldForUserCredentials:v17];
      goto LABEL_13;
    }
    uint64_t v28 = [(WBSFormControlMetadata *)v14 uniqueID];
    unsigned int v19 = [(WBSFormMetadata *)v15 oldPasswordElementUniqueID];
    char v20 = [v19 isEqualToString:v28];

    if ((v20 & 1) != 0
      || ([(WBSFormMetadata *)v15 passwordElementUniqueID],
          JSValueRef v21 = objc_claimAutoreleasedReturnValue(),
          char v22 = [v21 isEqualToString:v28],
          v21,
          (v22 & 1) != 0))
    {
      uint64_t v17 = 1;
    }
    else
    {
      if (v16 != 3)
      {
        BOOL v23 = (void *)v28;
        long long v27 = [(WBSFormMetadata *)v15 confirmPasswordElementUniqueID];
        uint64_t v17 = [v27 isEqualToString:v28];

        goto LABEL_11;
      }
      uint64_t v17 = 0;
    }
    BOOL v23 = (void *)v28;
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  if ([(WBSFormControlMetadata *)v12 looksLikeCreditCardNumberField]
    || [(WBSFormControlMetadata *)v12 looksLikeCreditCardCardholderField]
    || [(WBSFormControlMetadata *)v12 looksLikeCreditCardSecurityCodeField])
  {
    [(WBSFormMetadataController *)self creditCardFieldFocused:v10 inFrame:v11];
  }
  else
  {
    if (!isUsernameFieldInLoginForm(v12, v13))
    {
      unint64_t v25 = [(WBSFormControlMetadata *)v12 addressBookLabel];
      uint64_t v26 = [v25 length];

      if (v26
        && [(WBSFormMetadataController *)self addressBookAutoFillableFieldFocused:v10 withAddressBookAutoFillableFieldMetadata:v12 formMetadata:v13 inFrame:v11])
      {
        if (![(WBSFormControlMetadata *)v12 looksLikeOneTimeCodeField]) {
          goto LABEL_17;
        }
      }
      else
      {
        if ([(WBSFormControlMetadata *)v12 looksLikeCreditCardSecurityCodeField]
          || [(WBSFormControlMetadata *)v12 looksLikeCreditCardCompositeExpirationDateField]|| [(WBSFormControlMetadata *)v12 looksLikeCreditCardTypeField])
        {
          [(WBSFormMetadataController *)self otherCreditCardFieldFocused:v10 inFrame:v11 textFieldMetadata:v12 formMetadata:v13];
          goto LABEL_17;
        }
        if (![(WBSFormControlMetadata *)v12 looksLikeOneTimeCodeField])
        {
          [(WBSFormMetadataController *)self unidentifiedTextFieldFocused:v10 inFrame:v11 textFieldMetadata:v12 formMetadata:v13];
          goto LABEL_17;
        }
      }
      [(WBSFormMetadataController *)self oneTimeCodeFieldFocused:v10 withFieldMetadata:v12 formMetadata:v13 inFrame:v11];
      goto LABEL_17;
    }
    id v24 = getField(self, v12, v11);
    [(WBSFormMetadataController *)self usernameFieldFocused:v24 fieldMetadata:v12 inForm:v13 inFrame:v11];
  }
LABEL_17:
}

- (void)textFieldBlurred:(id)a3 inFrame:(id)a4 page:(id)a5 textFieldMetadata:(id)a6 formMetadata:(id)a7
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  BOOL v14 = (WBSFormControlMetadata *)a6;
  BOOL v15 = (WBSFormMetadata *)a7;
  if ([(WBSFormControlMetadata *)v14 isSecureTextField])
  {
    [(WBSFormMetadataController *)self passwordFieldBlurred:v18 inFrame:v12 page:v13 textFieldMetadata:v14 formMetadata:v15];
    goto LABEL_7;
  }
  if ([(WBSFormControlMetadata *)v14 looksLikeCreditCardNumberField]
    || [(WBSFormControlMetadata *)v14 looksLikeCreditCardCardholderField]
    || [(WBSFormControlMetadata *)v14 looksLikeCreditCardSecurityCodeField])
  {
    [(WBSFormMetadataController *)self creditCardFieldBlurred:v18 inFrame:v12 page:v13 textFieldMetadata:v14 formMetadata:v15];
    goto LABEL_7;
  }
  if (isUsernameFieldInLoginForm(v14, v15))
  {
    [(WBSFormMetadataController *)self usernameFieldBlurred:v18 inFrame:v12 page:v13 textFieldMetadata:v14 formMetadata:v15];
    goto LABEL_7;
  }
  uint64_t v16 = [(WBSFormControlMetadata *)v14 addressBookLabel];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    [(WBSFormMetadataController *)self addressBookAutoFillableFieldBlurred:v18 inFrame:v12 page:v13 textFieldMetadata:v14 formMetadata:v15];
    if (![(WBSFormControlMetadata *)v14 looksLikeOneTimeCodeField]) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  if ([(WBSFormControlMetadata *)v14 looksLikeCreditCardSecurityCodeField]
    || [(WBSFormControlMetadata *)v14 looksLikeCreditCardCompositeExpirationDateField]|| [(WBSFormControlMetadata *)v14 looksLikeCreditCardTypeField])
  {
    [(WBSFormMetadataController *)self otherCreditCardFieldBlurred:v18 inFrame:v12 textFieldMetadata:v14 formMetadata:v15];
  }
  else
  {
    if ([(WBSFormControlMetadata *)v14 looksLikeOneTimeCodeField])
    {
LABEL_14:
      [(WBSFormMetadataController *)self oneTimeCodeFieldBlurred:v18 inFrame:v12 page:v13 textFieldMetadata:v14 formMetadata:v15];
      goto LABEL_7;
    }
    [(WBSFormMetadataController *)self unidentifiedTextFieldBlurred:v18 inFrame:v12 textFieldMetadata:v14 formMetadata:v15];
  }
LABEL_7:
}

- (id)formElementWithFormID:(double)a3 inFrame:(id)a4
{
  JSValueRef Number = (SafariShared::JSUtilities *)[a4 jsContextForMetadataControllerScriptWorld];
  if (Number)
  {
    id v8 = Number;
    JSValueRef Number = SafariShared::JSUtilities::globalJSObjectByName(Number, (const OpaqueJSContext *)"FormMetadataJS", v7);
    if (Number)
    {
      id v9 = Number;
      JSValueRef Number = JSValueMakeNumber(v8, a3);
      *(void *)id v11 = Number;
      if (Number)
      {
        JSValueRef Number = SafariShared::JSUtilities::callJSMethodWithArguments(v8, v9, (OpaqueJSValue *)"formElementWithFormID", v11, (const OpaqueJSValue *const *)1);
        if (Number)
        {
          JSValueRef Number = [(WBSFormMetadataController *)self formAutoFillNodeForJSWrapper:JSValueToObject(v8, Number, 0) inContext:v8];
        }
      }
    }
  }
  return Number;
}

- (BOOL)addressBookAutoFillableFieldFocused:(id)a3 withAddressBookAutoFillableFieldMetadata:(id)a4 formMetadata:(id)a5 inFrame:(id)a6
{
  return 1;
}

- (BOOL)autoFillFrameIsValid:(id)a3
{
  id v4 = a3;
  uint64_t v7 = [v4 frameRef];
  if (v7) {
    BOOL v5 = WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::contains<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueFormAutoFillFrame *>>,OpaqueFormAutoFillFrame *>((uint64_t *)&self->_framesToMetadataMap, &v7);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)formAutoFillNodeForJSWrapper:(OpaqueJSValue *)a3 inContext:(OpaqueJSContext *)a4
{
  return 0;
}

- (id)formAutoFillNodeForField:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = [v7 frameRef];
  if (WTF::HashTable<OpaqueFormAutoFillFrame *,WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>>>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<OpaqueFormAutoFillFrame *>>::contains<WTF::IdentityHashTranslator<WTF::HashMap<OpaqueFormAutoFillFrame *,std::unique_ptr<SafariShared::FrameMetadata>,WTF::DefaultHash<OpaqueFormAutoFillFrame *>,WTF::HashTraits<OpaqueFormAutoFillFrame *>,WTF::HashTraits<std::unique_ptr<SafariShared::FrameMetadata>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<OpaqueFormAutoFillFrame *>>,OpaqueFormAutoFillFrame *>((uint64_t *)&self->_framesToMetadataMap, &v10))
  {
    id v8 = -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", controlObject(v7, v6), [v7 jsContextForMetadataControllerScriptWorld]);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)formSubmissionURLStringForSearchTextField:(id)a3 inFrame:(id)a4 useStrictDetection:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(WBSFormMetadataController *)self metadataForFrame:v9 requestType:0];
  uint64_t v10 = (const OpaqueJSValue *)[v9 jsWrapperInMetadataControllerScriptWorldForNode:v8];
  if (v10
    && (id v11 = (SafariShared::JSUtilities *)[v9 jsContextForMetadataControllerScriptWorld],
        JSObjectRef v12 = JSValueToObject(v11, v10, 0),
        (BOOL v14 = SafariShared::JSUtilities::globalJSObjectByName(v11, (const OpaqueJSContext *)"FormMetadataJS", v13)) != 0)
    && (*(void *)id v24 = v12,
        JSValueRef Boolean = JSValueMakeBoolean(v11, a5),
        (BOOL v15 = SafariShared::JSUtilities::callJSMethodWithArguments(v11, v14, (OpaqueJSValue *)"searchTextFieldFormSubmissionURLString", v24, (const OpaqueJSValue *const *)2)) != 0))
  {
    uint64_t v17 = SafariShared::JSUtilities::translateJSValueToNS(v11, v15, v16);
    id v18 = [MEMORY[0x1E4F1CA98] null];
    BOOL v19 = v17 == (void)v18;

    BOOL v20 = !v19;
    if (v19) {
      JSValueRef v21 = 0;
    }
    else {
      JSValueRef v21 = (void *)v17;
    }
    if (v20) {
      char v22 = 0;
    }
    else {
      char v22 = (void *)v17;
    }
  }
  else
  {
    JSValueRef v21 = 0;
  }

  return v21;
}

- (id)visibleNonEmptyTextFieldsInForm:(id)a3 inFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(WBSFormMetadataController *)self metadataForFrame:v7 requestType:0];
  id v8 = (const OpaqueJSValue *)[v7 jsWrapperInMetadataControllerScriptWorldForNode:v6];
  if (v8)
  {
    id v9 = (const OpaqueJSContext *)[v7 jsContextForMetadataControllerScriptWorld];
    *(void *)uint64_t v26 = JSValueToObject(v9, v8, 0);
    id v11 = SafariShared::JSUtilities::globalJSObjectByName(v9, (const OpaqueJSContext *)"FormMetadataJS", v10);
    if (!v11) {
      goto LABEL_18;
    }
    JSObjectRef v12 = SafariShared::JSUtilities::callJSMethodWithArguments(v9, v11, (OpaqueJSValue *)"visibleNonEmptyFormTextControlsInForm", v26, (const OpaqueJSValue *const *)1);
    if (!v12) {
      goto LABEL_18;
    }
    id v13 = JSValueToObject(v9, v12, 0);
    JSValueRef v25 = 0;
    id v8 = 0;
    if (SafariShared::JSUtilities::arrayLength(v9, v13, &v25, v14) != 2 || v25) {
      goto LABEL_19;
    }
    PropertyAtIndex = JSObjectGetPropertyAtIndex(v9, v13, 0, 0);
    if (!PropertyAtIndex || (uint64_t v17 = JSValueToObject(v9, PropertyAtIndex, 0)) == 0)
    {
LABEL_18:
      id v8 = 0;
      goto LABEL_19;
    }
    unint64_t v18 = SafariShared::JSUtilities::arrayLength(v9, v17, &v25, v16);
    id v8 = 0;
    if (!v25)
    {
      unint64_t v19 = v18;
      if (v18)
      {
        id v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
        uint64_t v20 = 0;
        do
        {
          JSValueRef v21 = JSObjectGetPropertyAtIndex(v9, v17, v20, 0);
          if (v21)
          {
            JSObjectRef v22 = JSValueToObject(v9, v21, 0);
            if (v22)
            {
              BOOL v23 = [(WBSFormMetadataController *)self formAutoFillNodeForJSWrapper:v22 inContext:v9];
              if (v23) {
                [(OpaqueJSValue *)v8 addObject:v23];
              }
            }
          }
          ++v20;
        }
        while (v19 != v20);
      }
    }
  }
LABEL_19:

  return v8;
}

- (BOOL)shouldIncludeNonEmptyFields
{
  return 0;
}

- (BOOL)manualAutoFillButtonWillFitInFieldWithMetadata:(id)a3
{
  id v3 = a3;
  if ([v3 isVerticalWritingMode]) {
    [v3 rectHeight];
  }
  else {
    [v3 rectWidth];
  }
  BOOL v5 = v4 >= 100.0;

  return v5;
}

- (id)substitutePasswordElementsWithAutomaticPasswordElementsInFrame:(id)a3 formID:(double)a4 focusedPasswordControlUniqueID:(id)a5 passwordControlUniqueIDs:(id)a6 automaticPassword:(id)a7 blurAfterSubstitution:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  BOOL v14 = (const OpaqueJSContext *)a5;
  id v26 = a7;
  BOOL v15 = (SafariShared::JSUtilities *)[v13 jsContextForMetadataControllerScriptWorld];
  if (v15)
  {
    [(WBSFormMetadataController *)self fillForm:v13 inFrame:v26 withPassword:v14 focusedFieldControlID:a4];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = [(WBSFormMetadataController *)self formAutoFillNodeForJSWrapper:controlObject(v13, *(void **)(*((void *)&v27 + 1) + 8 * i)) inContext:v15];
          JSValueRef v21 = v20;
          if (v8) {
            [v20 setHTMLInputElementAutoFilledAndObscured:1];
          }
          else {
            [v20 setHTMLInputElementAutoFilledAndViewable:1];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v17);
    }

    if (v8)
    {
      id v24 = SafariShared::JSUtilities::globalJSObjectByName(v15, (const OpaqueJSContext *)"AutomaticPasswordsJS", v22);
      if (v24)
      {
        *(void *)uint64_t v31 = SafariShared::JSUtilities::translateNSToJSValue(v15, v14, v23);
        SafariShared::JSUtilities::callJSMethodWithArguments(v15, v24, (OpaqueJSValue *)"blurControlWithID", v31, (const OpaqueJSValue *const *)1);
      }
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (void)removeAutomaticPasswordElementsInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4 passwordControlUniqueIDs:(id)a5 blurAfterRemoval:(BOOL)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  BOOL v23 = (OpaqueJSContext *)a4;
  id v10 = a5;
  id v11 = (SafariShared::JSUtilities *)[v9 jsContextForMetadataControllerScriptWorld];
  id v13 = v11;
  if (v11)
  {
    BOOL v14 = SafariShared::JSUtilities::globalJSObjectByName(v11, (const OpaqueJSContext *)"AutomaticPasswordsJS", v12);
    if (v14)
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v15 = v10;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v25;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v15);
            }
            unint64_t v19 = [(WBSFormMetadataController *)self formAutoFillNodeForJSWrapper:controlObject(v9, *(void **)(*((void *)&v24 + 1) + 8 * v18)) inContext:v13];
            [v19 setHTMLInputElementAutoFilledAndViewable:0];
            [v19 setHTMLInputElementAutoFilledWithAutomaticStrongPassword:0];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
        }
        while (v16);
      }

      *(void *)long long v28 = SafariShared::JSUtilities::translateNSToJSValue(v13, (const OpaqueJSContext *)v15, v20);
      uint64_t v29 = SafariShared::JSUtilities::translateNSToJSValue(v13, v23, v21);
      JSValueRef v30 = JSValueMakeBoolean(v13, a6);
      SafariShared::JSUtilities::callJSMethodWithArguments(v13, v14, (OpaqueJSValue *)"removeAutomaticPasswordElements", v28, (const OpaqueJSValue *const *)3);
    }
  }
}

- (void)removeAutomaticPasswordVisualTreatmentInFrame:(id)a3 passwordControlUniqueIDs:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 jsContextForMetadataControllerScriptWorld];
  if (v8)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = controlObject(v6, *(void **)(*((void *)&v15 + 1) + 8 * v12));
          BOOL v14 = -[WBSFormMetadataController formAutoFillNodeForJSWrapper:inContext:](self, "formAutoFillNodeForJSWrapper:inContext:", v13, v8, (void)v15);
          [v14 setHTMLInputElementAutoFilledWithAutomaticStrongPassword:0];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

- (void)automaticPasswordSheetDimissedInFrame:(id)a3 focusedPasswordControlUniqueID:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = (const OpaqueJSContext *)a4;
  id v6 = (SafariShared::JSUtilities *)[a3 jsContextForMetadataControllerScriptWorld];
  uint64_t v8 = v6;
  if (v6)
  {
    uint64_t v10 = SafariShared::JSUtilities::globalJSObjectByName(v6, (const OpaqueJSContext *)"AutomaticPasswordsJS", v7);
    if (v10)
    {
      v11[0] = SafariShared::JSUtilities::translateNSToJSValue(v8, v5, v9);
      SafariShared::JSUtilities::callJSMethodWithArguments(v8, v10, (OpaqueJSValue *)"blurControlWithID", (const char *)v11, (const OpaqueJSValue *const *)1);
    }
  }
}

- (void)setStrongPasswordElementViewableIfAppropriate:(BOOL)a3 frame:(id)a4 passwordControlUniqueIDs:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = (const OpaqueJSContext *)a5;
  uint64_t v8 = (SafariShared::JSUtilities *)[a4 jsContextForMetadataControllerScriptWorld];
  uint64_t v10 = v8;
  if (v8)
  {
    uint64_t v12 = SafariShared::JSUtilities::globalJSObjectByName(v8, (const OpaqueJSContext *)"AutomaticPasswordsJS", v9);
    if (v12)
    {
      *(void *)id v13 = SafariShared::JSUtilities::translateNSToJSValue(v10, v7, v11);
      JSValueRef Boolean = JSValueMakeBoolean(v10, a3);
      SafariShared::JSUtilities::callJSMethodWithArguments(v10, v12, (OpaqueJSValue *)"setStrongPasswordElementViewableIfAppropriate", v13, (const OpaqueJSValue *const *)2);
    }
  }
}

- (id)metadataForActiveFormInPageWithMainFrame:(id)a3
{
  id v14 = 0;
  id v15 = 0;
  [(WBSFormMetadataController *)self getMetadataForAllFormsInPageWithMainFrame:a3 requestType:4 frames:&v15 formMetadata:&v14];
  id v3 = v15;
  id v4 = v14;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__14;
  uint64_t v12 = __Block_byref_object_dispose__14;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFormMetadataController_metadataForActiveFormInPageWithMainFrame___block_invoke;
  v7[3] = &unk_1E5C9B9A0;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __70__WBSFormMetadataController_metadataForActiveFormInPageWithMainFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 containsActiveElement])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)setAutoFillSpinnerVisibility:(BOOL)a3 textFieldMetadata:(id)a4 frame:(id)a5
{
  BOOL v6 = a3;
  id v13 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 jsContextForMetadataControllerScriptWorld];
  if (v9
    && [(WBSFormMetadataController *)self manualAutoFillButtonWillFitInFieldWithMetadata:v13])
  {
    uint64_t v10 = [v13 uniqueID];
    uint64_t v11 = controlObject(v8, v10);

    uint64_t v12 = [(WBSFormMetadataController *)self formAutoFillNodeForJSWrapper:v11 inContext:v9];
    [v12 setSpinnerVisibilityOnHTMLInputElement:v6];
  }
}

+ (id)formMetadataClassificationJS
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F30920]);
  id v3 = [NSString alloc];
  id v4 = (void *)[v3 initWithBytes:formMetadataClassificationSource length:formMetadataClassificationSourceLength encoding:1];
  id v5 = [v2 globalObject];
  BOOL v6 = [MEMORY[0x1E4F30938] valueWithUInt32:0 inContext:v2];
  [v5 setValue:v6 forProperty:@"WBSFormMetadataRequestNormal"];

  id v7 = [v2 globalObject];
  id v8 = [MEMORY[0x1E4F30938] valueWithUInt32:1 inContext:v2];
  [v7 setValue:v8 forProperty:@"WBSFormMetadataRequestPreFill"];

  uint64_t v9 = [v2 globalObject];
  uint64_t v10 = [MEMORY[0x1E4F30938] valueWithUInt32:2 inContext:v2];
  [v9 setValue:v10 forProperty:@"WBSFormMetadataRequestTesting"];

  uint64_t v11 = [v2 globalObject];
  uint64_t v12 = [MEMORY[0x1E4F30938] valueWithUInt32:3 inContext:v2];
  [v11 setValue:v12 forProperty:@"WBSFormMetadataRequestTextChange"];

  id v13 = [v2 globalObject];
  id v14 = [MEMORY[0x1E4F30938] valueWithUInt32:4 inContext:v2];
  [v13 setValue:v14 forProperty:@"WBSFormMetadataRequestCollectMetadataFromDebugMenu"];

  id v15 = [v2 globalObject];
  long long v16 = [MEMORY[0x1E4F30938] valueWithUInt32:0 inContext:v2];
  [v15 setValue:v16 forProperty:@"WBSAutoFillFormTypeUndetermined"];

  long long v17 = [v2 globalObject];
  long long v18 = [MEMORY[0x1E4F30938] valueWithUInt32:1 inContext:v2];
  [v17 setValue:v18 forProperty:@"WBSAutoFillFormTypeAutoFillableStandard"];

  unint64_t v19 = [v2 globalObject];
  uint64_t v20 = [MEMORY[0x1E4F30938] valueWithUInt32:2 inContext:v2];
  [v19 setValue:v20 forProperty:@"WBSAutoFillFormTypeNonAutoFillable"];

  JSValueRef v21 = [v2 globalObject];
  JSObjectRef v22 = [MEMORY[0x1E4F30938] valueWithUInt32:3 inContext:v2];
  [v21 setValue:v22 forProperty:@"WBSAutoFillFormTypeAutoFillableLogin"];

  BOOL v23 = [v2 globalObject];
  long long v24 = [MEMORY[0x1E4F30938] valueWithUInt32:4 inContext:v2];
  [v23 setValue:v24 forProperty:@"WBSAutoFillFormTypeNewAccount"];

  long long v25 = [v2 globalObject];
  long long v26 = [MEMORY[0x1E4F30938] valueWithUInt32:5 inContext:v2];
  [v25 setValue:v26 forProperty:@"WBSAutoFillFormTypeChangePassword"];

  long long v27 = [MEMORY[0x1E4F30938] valueWithNewObjectInContext:v2];
  uint64_t v37 = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  v39 = __57__WBSFormMetadataController_formMetadataClassificationJS__block_invoke;
  v40 = &unk_1E5C9B9C8;
  id v28 = v2;
  id v41 = v28;
  id v29 = v27;
  id v42 = v29;
  JSValueRef v30 = (void (**)(void, void, void))MEMORY[0x1AD0C4F80](&v37);
  ((void (**)(void, __CFString *, JSValueRef (*)(SafariShared *, const OpaqueJSContext *, NSString *, OpaqueJSValue *, JSValueRef *, JSObjectRef *, const OpaqueJSValue **)))v30)[2](v30, @"specifierForAutocompleteTokensAndAddressBookLabel", SafariShared::jsSpecifierForAutocompleteTokensAndAddressBookLabel);
  ((void (**)(void, __CFString *, JSValueRef (*)(SafariShared *, const OpaqueJSContext *, OpaqueJSValue *, OpaqueJSValue *, const OpaqueJSContext **, JSObjectRef *, const OpaqueJSValue **)))v30)[2](v30, @"dateFormatFromTemplate", SafariShared::jsDateFormatFromTemplate);
  ((void (**)(void, __CFString *, JSValueRef (*)(SafariShared *, const OpaqueJSContext *, NSString *, OpaqueJSValue *, JSValueRef *, JSObjectRef *, const OpaqueJSValue **)))v30)[2](v30, @"stringFromDateFormat", SafariShared::jsStringFromDateFormat);
  uint64_t v31 = objc_msgSend(v28, "globalObject", v37, v38, v39, v40);
  [v31 setValue:v29 forProperty:@"FormMetadataJSController"];

  [v28 setExceptionHandler:&__block_literal_global_135];
  uint64_t v32 = [MEMORY[0x1E4F1CB10] URLWithString:@"FormMetadataClassification.js"];
  id v33 = (id)[v28 evaluateScript:v4 withSourceURL:v32];

  v34 = [v28 globalObject];
  v35 = [v34 objectForKeyedSubscript:@"FormMetadataClassificationJS"];

  return v35;
}

void __57__WBSFormMetadataController_formMetadataClassificationJS__block_invoke(uint64_t a1, void *a2, JSValueRef (__cdecl *a3)(JSContextRef, JSObjectRef, JSObjectRef, size_t, const JSValueRef[], JSValueRef *))
{
  id v5 = a2;
  BOOL v6 = (const OpaqueJSContext *)[*(id *)(a1 + 32) JSGlobalContextRef];
  SafariShared::JSUtilities::jsString(v5, &name);
  JSObjectRef FunctionWithCallback = JSObjectMakeFunctionWithCallback(v6, name, a3);
  if (name) {
    JSStringRelease(name);
  }
  id v8 = [MEMORY[0x1E4F30938] valueWithJSValueRef:FunctionWithCallback inContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setValue:v8 forProperty:v5];
}

void __57__WBSFormMetadataController_formMetadataClassificationJS__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  id v5 = (void *)WBS_LOG_CHANNEL_PREFIXAutoFill();
  SafariShared::JSUtilities::logExceptionInChannel(v5, (const OpaqueJSContext *)[v6 JSGlobalContextRef], (const OpaqueJSValue *)objc_msgSend(v4, "JSValueRef"));
}

+ (id)classifyFormMetadata:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 formMetadataClassificationJS];
  id v6 = (void *)MEMORY[0x1E4F30938];
  id v7 = [v4 dictionaryRepresentationRedactingSensitiveValues:0 withKnownSensitiveValues:0];
  id v8 = [v5 context];
  uint64_t v9 = [v6 valueWithObject:v7 inContext:v8];

  [v9 setObject:&unk_1EFC226C0 forKeyedSubscript:@"RequestType"];
  v14[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v11 = (id)[v5 invokeMethod:@"classify" withArguments:v10];

  uint64_t v12 = [[WBSFormMetadata alloc] initWithJSValue:v9];
  return v12;
}

- (void)textFieldFocused:(os_log_t)log inFrame:textFieldMetadata:formMetadata:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Text field focused in an untracked frame.", v1, 2u);
}

@end