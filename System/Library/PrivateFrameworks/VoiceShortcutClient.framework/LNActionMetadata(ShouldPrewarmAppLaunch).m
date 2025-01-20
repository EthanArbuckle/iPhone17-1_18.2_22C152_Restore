@interface LNActionMetadata(ShouldPrewarmAppLaunch)
- (uint64_t)wf_shouldPrewarmAppLaunchWithAction:()ShouldPrewarmAppLaunch;
@end

@implementation LNActionMetadata(ShouldPrewarmAppLaunch)

- (uint64_t)wf_shouldPrewarmAppLaunchWithAction:()ShouldPrewarmAppLaunch
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a1 openAppWhenRun] & 1) == 0)
  {
    v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
      v9 = "%s openAppWhenRun is false";
      goto LABEL_10;
    }
LABEL_11:
    uint64_t v10 = 0;
    goto LABEL_12;
  }
  v5 = [v4 systemProtocols];
  v6 = [MEMORY[0x1E4F72DD0] cameraCaptureProtocol];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
      v9 = "%s Intent conforms to the camera capture protocol";
LABEL_10:
      _os_log_impl(&dword_1B3C5C000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (([a1 outputFlags] & 6) != 0)
  {
    v8 = getWFVoiceShortcutClientLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
      v9 = "%s Intent returns a snippet or dialog";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (!v4)
  {
    v12 = [a1 parameters];
    v8 = objc_msgSend(v12, "if_objectsPassingTest:", &__block_literal_global_10734);

    if ((unint64_t)[v8 count] >= 2)
    {
      v24 = getWFVoiceShortcutClientLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
        v25 = "%s App Shortcut with multiple required parameters with missing value";
        goto LABEL_34;
      }
LABEL_35:

      goto LABEL_11;
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v8 = [a1 parameters];
  uint64_t v13 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    uint64_t v26 = *MEMORY[0x1E4F729F8];
LABEL_18:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v8);
      }
      v17 = *(void **)(*((void *)&v28 + 1) + 8 * v16);
      char v18 = objc_msgSend(v17, "isOptional", v26);
      if (v4 && (v18 & 1) == 0)
      {
        v19 = [v4 parameters];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __80__LNActionMetadata_ShouldPrewarmAppLaunch__wf_shouldPrewarmAppLaunchWithAction___block_invoke_47;
        v27[3] = &unk_1E6078600;
        v27[4] = v17;
        v20 = objc_msgSend(v19, "if_firstObjectPassingTest:", v27);
        v21 = [v20 value];

        if (!v21)
        {
          v22 = [v17 typeSpecificMetadata];
          v23 = [v22 objectForKeyedSubscript:v26];

          if (!v23)
          {
            v24 = getWFVoiceShortcutClientLogObject();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_35;
            }
            *(_DWORD *)buf = 136315138;
            v34 = "-[LNActionMetadata(ShouldPrewarmAppLaunch) wf_shouldPrewarmAppLaunchWithAction:]";
            v25 = "%s Required parameter is missing a value";
LABEL_34:
            _os_log_impl(&dword_1B3C5C000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
            goto LABEL_35;
          }
        }
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v10 = 1;
        if (v14) {
          goto LABEL_18;
        }
        goto LABEL_12;
      }
    }
  }
  uint64_t v10 = 1;
LABEL_12:

  return v10;
}

@end