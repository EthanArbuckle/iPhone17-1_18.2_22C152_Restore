@interface UITextInputSessionActionAnalytics(IATextInputActionsMetadataObservingDelegate)
- (IATextInputActionsInputMode)inputMode;
- (NSDictionary)keyboardTrialParameters;
@end

@implementation UITextInputSessionActionAnalytics(IATextInputActionsMetadataObservingDelegate)

- (IATextInputActionsInputMode)inputMode
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v3 = (void *)qword_1EB260E78;
  uint64_t v31 = qword_1EB260E78;
  if (!qword_1EB260E78)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v33 = __getIATextInputActionsInputModeClass_block_invoke;
    v34 = &unk_1E52D9900;
    v35 = &v28;
    InputAnalyticsLibraryCore_0();
    Class Class = objc_getClass("IATextInputActionsInputMode");
    *(void *)(v35[1] + 24) = Class;
    qword_1EB260E78 = *(void *)(v35[1] + 24);
    v3 = (void *)v29[3];
  }
  v5 = v3;
  _Block_object_dispose(&v28, 8);
  id v6 = objc_alloc_init(v5);
  overrideInputModeString = self->_overrideInputModeString;
  if (overrideInputModeString)
  {
    v8 = overrideInputModeString;
    v9 = UITextInputSessionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - overrode with '%{private}@'", (uint8_t *)&buf, 0xCu);
    }

LABEL_10:
    v13 = TIInputModeGetLanguage();
    [v6 setLanguage:v13];

    v14 = TIInputModeGetRegion();
    [v6 setRegion:v14];

    v15 = TIInputModeGetVariant();
    [v6 setKeyboardVariant:v15];

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v16 = (void *)qword_1EB260E80;
    uint64_t v31 = qword_1EB260E80;
    if (!qword_1EB260E80)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v33 = __getTIInputModeFunctionsClass_block_invoke;
      v34 = &unk_1E52D9900;
      v35 = &v28;
      __getTIInputModeFunctionsClass_block_invoke((uint64_t)&buf);
      v16 = (void *)v29[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v28, 8);
    if ((objc_opt_respondsToSelector() & (v17 != 0)) == 1) {
      objc_msgSend(v6, "setInputModeIdentifier:", objc_msgSend(v17, "performSelector:withObject:", sel_TIInputModeGetFullInputModeIdentifier_, v8, v28));
    }
    if (self->_useOverrideSourceCounter < 1)
    {
      unint64_t v21 = [(UITextInputSessionActionAnalytics *)self _getActiveTextInputSource] - 1;
      if (v21 > 7) {
        int64_t overrideSource = 0;
      }
      else {
        int64_t overrideSource = qword_186B97B50[v21];
      }
      v19 = UITextInputSessionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v27 = _UITextInputActionsSourceString(overrideSource);
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v27;
        _os_log_debug_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - source '%{private}@'", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      int64_t overrideSource = self->_overrideSource;
      v19 = UITextInputSessionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = _UITextInputActionsSourceString(overrideSource);
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_debug_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - overrode source with '%{private}@'", (uint8_t *)&buf, 0xCu);
      }
    }

    if (overrideSource == 3)
    {
      v22 = TIInputModeGetComponentsFromIdentifier();
      v23 = [v22 objectForKey:@"hw"];
      [v6 setKeyboardLayout:v23];
    }
    else
    {
      v22 = TIInputModeGetSWLayout();
      [v6 setKeyboardLayout:v22];
    }
    goto LABEL_28;
  }
  v10 = +[UIKeyboardInputModeController sharedInputModeController];
  v11 = [v10 currentInputMode];
  v8 = [v11 identifierWithLayouts];

  v12 = UITextInputSessionLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_debug_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - fetched '%{private}@'", (uint8_t *)&buf, 0xCu);
  }

  if (v8) {
    goto LABEL_10;
  }
  v22 = UITextInputSessionLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "[UITextInputSessionActionAnalytics] inputMode - nil inputMode", (uint8_t *)&buf, 2u);
  }
  v8 = 0;
LABEL_28:

  v24 = UITextInputSessionLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    v26 = [v6 description];
    LODWORD(buf) = 138477827;
    *(void *)((char *)&buf + 4) = v26;
    _os_log_debug_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] inputMode - returning '%{private}@'", (uint8_t *)&buf, 0xCu);
  }
  return (IATextInputActionsInputMode *)v6;
}

- (NSDictionary)keyboardTrialParameters
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = UITextInputSessionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    keyboardTrialParameters = self->_keyboardTrialParameters;
    int v7 = 138477827;
    v8 = keyboardTrialParameters;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "[UITextInputSessionActionAnalytics] keyboardTrialParameters - returning '%{private}@'", (uint8_t *)&v7, 0xCu);
  }

  v4 = self->_keyboardTrialParameters;
  return v4;
}

@end