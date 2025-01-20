@interface _UIFeedbackCoreHapticsPlayer
- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5;
- (CHHapticPatternPlayer)coreHapticsPlayer;
- (_UIFeedbackCoreHapticsEngine)hapticEngine;
- (_UIFeedbackCoreHapticsPlayer)initWithEngine:(id)a3;
- (id)_internal_createEventsForFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6;
- (id)_internal_createEventsForFileFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6;
- (id)_internal_createEventsForLegacyFeedbackData:(id)a3;
- (id)_internal_createEventsForLibraryFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6;
- (id)_internal_createEventsForTransientHapticData:(id)a3;
- (id)_internal_createFixedParameterForParameters:(id)a3 withKey:(id)a4 forEventType:(id)a5;
- (id)_internal_createPatternForFeedbackData:(id)a3 feedback:(id)a4 engine:(id)a5;
- (id)_internal_createPlayerWithPattern:(id)a3;
- (id)invalidationBlock;
- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4;
- (void)_internal_updateValueForParameters:(id)a3 withKey:(id)a4;
- (void)_playFeedback:(id)a3 atTime:(double)a4;
- (void)_stopFeedback:(id)a3;
- (void)_updateValueForParameters:(id)a3 withKey:(id)a4;
- (void)setCoreHapticsPlayer:(id)a3;
- (void)setHapticEngine:(id)a3;
- (void)setInvalidationBlock:(id)a3;
@end

@implementation _UIFeedbackCoreHapticsPlayer

- (id)_internal_createFixedParameterForParameters:(id)a3 withKey:(id)a4 forEventType:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[_UIFeedbackParameters parameters];
  v11 = [v10 objectForKeyedSubscript:v8];

  [v9 _effectiveValueForParameterWithKey:v8];
  float v13 = v12;

  LODWORD(v10) = [v9 _isAudio];
  if (v10) {
    v14 = @"audioType";
  }
  else {
    v14 = @"hapticType";
  }
  v15 = [v11 objectForKeyedSubscript:v14];
  uint64_t v16 = (int)[v15 intValue];

  switch(v16)
  {
    case 0:
      v20 = getCHHapticEventParameterIDAudioVolume();
      if (v20) {
        goto LABEL_24;
      }
      goto LABEL_43;
    case 1:
      v20 = getCHHapticEventParameterIDAudioPitch();
      if (!v20) {
        goto LABEL_43;
      }
      goto LABEL_24;
    case 2:
    case 9:
      v20 = getCHHapticEventParameterIDAttackTime();
      if (!v20) {
        goto LABEL_43;
      }
      goto LABEL_24;
    case 3:
    case 10:
      v20 = getCHHapticEventParameterIDDecayTime();
      if (!v20) {
        goto LABEL_43;
      }
      goto LABEL_24;
    case 4:
    case 11:
      v20 = getCHHapticEventParameterIDReleaseTime();
      if (!v20) {
        goto LABEL_43;
      }
      goto LABEL_24;
    case 5:
      v20 = getCHHapticEventParameterIDAudioPan();
      if (v20) {
        goto LABEL_24;
      }
      goto LABEL_43;
    case 6:
    case 8:
    case 12:
      if (_UIFeedbackLoggingDisabled) {
        goto LABEL_43;
      }
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB25CD78);
      if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
        goto LABEL_43;
      }
      v18 = *(NSObject **)(CategoryCachedImpl + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v97 = v16;
      v19 = "UIFeedbackParameterType (%ld) has no equivalent CHHapticEventParameterID";
      goto LABEL_18;
    case 7:
      v20 = getCHHapticEventParameterIDHapticIntensity();
      if (!v20) {
        goto LABEL_43;
      }
LABEL_24:
      id v21 = v20;
      id v22 = v7;
      uint64_t v23 = getCHHapticEventTypeHapticTransient();
      if ((id)v23 == v22)
      {

        goto LABEL_38;
      }
      v24 = (void *)v23;
      v25 = getCHHapticEventTypeHapticTransient();
      int v26 = [v22 isEqualToString:v25];

      if (v26)
      {
LABEL_38:
        uint64_t v47 = getCHHapticEventParameterIDHapticIntensity();
        v48 = v21;
        if ((id)v47 == v21) {
          goto LABEL_86;
        }
        v49 = (void *)v47;
        v50 = getCHHapticEventParameterIDHapticIntensity();
        if ([v21 isEqualToString:v50]) {
          goto LABEL_85;
        }
        uint64_t v51 = getCHHapticEventParameterIDHapticSharpness();
        if ((id)v51 == v21) {
          goto LABEL_83;
        }
        v52 = (void *)v51;
        uint64_t v53 = getCHHapticEventParameterIDHapticSharpness();
LABEL_57:
        v60 = (void *)v53;
        char v61 = [v21 isEqualToString:v53];
        goto LABEL_58;
      }
      uint64_t v27 = getCHHapticEventTypeAudioClick();
      if ((id)v27 == v22)
      {

        goto LABEL_48;
      }
      v28 = (void *)v27;
      v29 = getCHHapticEventTypeAudioClick();
      int v30 = [v22 isEqualToString:v29];

      if (v30)
      {
LABEL_48:
        uint64_t v56 = getCHHapticEventParameterIDAudioVolume();
        v48 = v21;
        if ((id)v56 == v21) {
          goto LABEL_86;
        }
        v49 = (void *)v56;
        v50 = getCHHapticEventParameterIDAudioVolume();
        if ([v21 isEqualToString:v50]) {
          goto LABEL_85;
        }
        uint64_t v57 = getCHHapticEventParameterIDAudioPitch();
        if ((id)v57 == v21) {
          goto LABEL_83;
        }
        v52 = (void *)v57;
        uint64_t v53 = getCHHapticEventParameterIDAudioPitch();
        goto LABEL_57;
      }
      uint64_t v31 = getCHHapticEventTypeWheelsOfTime();
      if ((id)v31 == v22)
      {

        goto LABEL_53;
      }
      v32 = (void *)v31;
      v33 = getCHHapticEventTypeWheelsOfTime();
      int v34 = [v22 isEqualToString:v33];

      if (v34)
      {
LABEL_53:
        uint64_t v58 = getCHHapticEventParameterIDHapticIntensity();
        v48 = v21;
        if ((id)v58 == v21) {
          goto LABEL_86;
        }
        v49 = (void *)v58;
        v50 = getCHHapticEventParameterIDHapticIntensity();
        if ([v21 isEqualToString:v50]) {
          goto LABEL_85;
        }
        uint64_t v59 = getCHHapticEventParameterIDAudioVolume();
        if ((id)v59 == v21) {
          goto LABEL_83;
        }
        v52 = (void *)v59;
        uint64_t v53 = getCHHapticEventParameterIDAudioVolume();
        goto LABEL_57;
      }
      uint64_t v35 = getCHHapticEventTypeAudioCustom();
      if ((id)v35 == v22)
      {

LABEL_61:
        uint64_t v62 = getCHHapticEventParameterIDAudioVolume();
        v48 = v21;
        if ((id)v62 != v21)
        {
          v49 = (void *)v62;
          v50 = getCHHapticEventParameterIDAudioVolume();
          if (([v21 isEqualToString:v50] & 1) == 0)
          {
            uint64_t v63 = getCHHapticEventParameterIDAudioPan();
            if ((id)v63 != v21)
            {
              v52 = (void *)v63;
              v60 = getCHHapticEventParameterIDAudioPan();
              if (([v21 isEqualToString:v60] & 1) == 0)
              {
                getCHHapticEventParameterIDAudioBrightness();
                id v64 = (id)objc_claimAutoreleasedReturnValue();
                if (v64 != v21)
                {
                  id v94 = v64;
                  v92 = getCHHapticEventParameterIDAudioBrightness();
                  if ((objc_msgSend(v21, "isEqualToString:") & 1) == 0)
                  {
                    getCHHapticEventParameterIDAudioPitch();
                    id v65 = (id)objc_claimAutoreleasedReturnValue();
                    if (v65 == v21)
                    {
                      char v61 = 1;
                    }
                    else
                    {
                      v89 = v65;
                      v86 = getCHHapticEventParameterIDAudioPitch();
                      char v61 = [v21 isEqualToString:v86];

                      id v65 = v89;
                    }

                    goto LABEL_123;
                  }
LABEL_76:
                  char v61 = 1;
LABEL_123:

                  id v64 = v94;
                  goto LABEL_124;
                }
LABEL_91:
                char v61 = 1;
LABEL_124:

                goto LABEL_58;
              }
LABEL_82:

LABEL_84:
              goto LABEL_85;
            }
LABEL_83:
            v52 = v21;
            goto LABEL_84;
          }
LABEL_85:

          v48 = v49;
        }
LABEL_86:

LABEL_87:
        id v70 = objc_alloc((Class)getCHHapticEventParameterClass());
        *(float *)&double v71 = v13;
        v55 = (void *)[v70 initWithParameterID:v21 value:v71];
        goto LABEL_88;
      }
      v36 = (void *)v35;
      v37 = getCHHapticEventTypeAudioCustom();
      int v38 = [v22 isEqualToString:v37];

      if (v38) {
        goto LABEL_61;
      }
      uint64_t v39 = getCHHapticEventTypeHapticContinuous();
      if ((id)v39 == v22)
      {

LABEL_70:
        uint64_t v66 = getCHHapticEventParameterIDHapticIntensity();
        v48 = v21;
        if ((id)v66 != v21)
        {
          v49 = (void *)v66;
          v50 = getCHHapticEventParameterIDHapticIntensity();
          if (([v21 isEqualToString:v50] & 1) == 0)
          {
            uint64_t v67 = getCHHapticEventParameterIDHapticSharpness();
            if ((id)v67 != v21)
            {
              v52 = (void *)v67;
              v60 = getCHHapticEventParameterIDHapticSharpness();
              if (([v21 isEqualToString:v60] & 1) == 0)
              {
                getCHHapticEventParameterIDAttackTime();
                id v64 = (id)objc_claimAutoreleasedReturnValue();
                if (v64 != v21)
                {
                  id v94 = v64;
                  v92 = getCHHapticEventParameterIDAttackTime();
                  if ((objc_msgSend(v21, "isEqualToString:") & 1) == 0)
                  {
                    getCHHapticEventParameterIDDecayTime();
                    id v90 = (id)objc_claimAutoreleasedReturnValue();
                    if (v90 == v21)
                    {
                      char v61 = 1;
                    }
                    else
                    {
                      v87 = getCHHapticEventParameterIDDecayTime();
                      if (objc_msgSend(v21, "isEqualToString:"))
                      {
                        char v61 = 1;
                      }
                      else
                      {
                        getCHHapticEventParameterIDReleaseTime();
                        id v84 = (id)objc_claimAutoreleasedReturnValue();
                        if (v84 == v21)
                        {
                          char v61 = 1;
                        }
                        else
                        {
                          v82 = getCHHapticEventParameterIDReleaseTime();
                          if (objc_msgSend(v21, "isEqualToString:"))
                          {
                            char v61 = 1;
                          }
                          else
                          {
                            getCHHapticEventParameterIDSustained();
                            id v80 = (id)objc_claimAutoreleasedReturnValue();
                            if (v80 == v21)
                            {
                              char v61 = 1;
                            }
                            else
                            {
                              v78 = getCHHapticEventParameterIDSustained();
                              char v61 = [v21 isEqualToString:v78];
                            }
                          }
                        }
                      }
                    }
                    goto LABEL_123;
                  }
                  goto LABEL_76;
                }
                goto LABEL_91;
              }
              goto LABEL_82;
            }
            goto LABEL_83;
          }
          goto LABEL_85;
        }
        goto LABEL_86;
      }
      v40 = (void *)v39;
      v41 = getCHHapticEventTypeHapticContinuous();
      int v42 = [v22 isEqualToString:v41];

      if (v42) {
        goto LABEL_70;
      }
      uint64_t v43 = getCHHapticEventTypeAudioContinuous();
      if ((id)v43 == v22)
      {
      }
      else
      {
        v44 = (void *)v43;
        v45 = getCHHapticEventTypeAudioContinuous();
        char v46 = [v22 isEqualToString:v45];

        if ((v46 & 1) == 0)
        {

          goto LABEL_44;
        }
      }
      uint64_t v68 = getCHHapticEventParameterIDAudioVolume();
      v48 = v21;
      if ((id)v68 == v21) {
        goto LABEL_86;
      }
      v49 = (void *)v68;
      v50 = getCHHapticEventParameterIDAudioVolume();
      if ([v21 isEqualToString:v50]) {
        goto LABEL_85;
      }
      uint64_t v69 = getCHHapticEventParameterIDAudioPan();
      if ((id)v69 == v21) {
        goto LABEL_83;
      }
      v52 = (void *)v69;
      v60 = getCHHapticEventParameterIDAudioPan();
      if ([v21 isEqualToString:v60]) {
        goto LABEL_82;
      }
      getCHHapticEventParameterIDAudioBrightness();
      id v95 = (id)objc_claimAutoreleasedReturnValue();
      if (v95 == v21)
      {
        char v61 = 1;
      }
      else
      {
        v93 = getCHHapticEventParameterIDAudioBrightness();
        if (objc_msgSend(v21, "isEqualToString:"))
        {
          char v61 = 1;
        }
        else
        {
          getCHHapticEventParameterIDAudioPitch();
          id v91 = (id)objc_claimAutoreleasedReturnValue();
          if (v91 == v21)
          {
            char v61 = 1;
          }
          else
          {
            v88 = getCHHapticEventParameterIDAudioPitch();
            if (objc_msgSend(v21, "isEqualToString:"))
            {
              char v61 = 1;
            }
            else
            {
              getCHHapticEventParameterIDAttackTime();
              id v85 = (id)objc_claimAutoreleasedReturnValue();
              if (v85 == v21)
              {
                char v61 = 1;
              }
              else
              {
                v83 = getCHHapticEventParameterIDAttackTime();
                if (objc_msgSend(v21, "isEqualToString:"))
                {
                  char v61 = 1;
                }
                else
                {
                  getCHHapticEventParameterIDDecayTime();
                  id v81 = (id)objc_claimAutoreleasedReturnValue();
                  if (v81 == v21)
                  {
                    char v61 = 1;
                  }
                  else
                  {
                    v79 = getCHHapticEventParameterIDDecayTime();
                    if (objc_msgSend(v21, "isEqualToString:"))
                    {
                      char v61 = 1;
                    }
                    else
                    {
                      getCHHapticEventParameterIDReleaseTime();
                      id v77 = (id)objc_claimAutoreleasedReturnValue();
                      if (v77 == v21)
                      {
                        char v61 = 1;
                      }
                      else
                      {
                        v76 = getCHHapticEventParameterIDReleaseTime();
                        if (objc_msgSend(v21, "isEqualToString:"))
                        {
                          char v61 = 1;
                        }
                        else
                        {
                          getCHHapticEventParameterIDSustained();
                          id v75 = (id)objc_claimAutoreleasedReturnValue();
                          if (v75 == v21)
                          {
                            char v61 = 1;
                          }
                          else
                          {
                            v74 = getCHHapticEventParameterIDSustained();
                            char v61 = [v21 isEqualToString:v74];
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_58:

      if (v61) {
        goto LABEL_87;
      }
LABEL_44:
      if (!_UIFeedbackLoggingDisabled)
      {
        unint64_t v54 = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB25CD18);
        if (*(unsigned char *)v54)
        {
          v73 = *(NSObject **)(v54 + 8);
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            uint64_t v97 = v16;
            __int16 v98 = 2048;
            double v99 = v13;
            _os_log_impl(&dword_1853B0000, v73, OS_LOG_TYPE_ERROR, "Ignoring UIFeedbackParameterType (%ld) with value %f", buf, 0x16u);
          }
        }
      }
      v55 = 0;
LABEL_88:

      return v55;
    default:
      if (_UIFeedbackLoggingDisabled) {
        goto LABEL_43;
      }
      v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CD80) + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v97 = v16;
      v19 = "Cannot convert UIFeedbackParameterType (%ld) to CHHapticEventParameterID";
LABEL_18:
      _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
LABEL_43:
      id v21 = 0;
      goto LABEL_44;
  }
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        if (![*(id *)(*((void *)&v27 + 1) + 8 * i) canReuseCoreHapticsPlayer])
        {

          goto LABEL_12;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  v15 = [(_UIFeedbackCoreHapticsPlayer *)self coreHapticsPlayer];

  if (v15) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v16 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
  v17 = [v16 coreHapticsEngine];
  id v18 = [(_UIFeedbackCoreHapticsPlayer *)self _internal_createPatternForFeedbackData:v10 feedback:v9 engine:v17];

  if (v18)
  {
    v19 = [(_UIFeedbackCoreHapticsPlayer *)self _internal_createPlayerWithPattern:v18];
    if (!v19)
    {
LABEL_21:

      goto LABEL_22;
    }
    [(_UIFeedbackCoreHapticsPlayer *)self setCoreHapticsPlayer:v19];

LABEL_15:
    v19 = [(_UIFeedbackCoreHapticsPlayer *)self coreHapticsPlayer];
    id v26 = 0;
    [v19 startAtTime:&v26 error:a5];
    id v18 = v26;

    LOBYTE(v19) = v18 == 0;
    if (v18)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_playFeedbackData_forFeedback_atTime____s_category)+ 8);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          id v21 = v20;
          id v22 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
          uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", object_getClassName(v22), v22);
          *(_DWORD *)buf = 138412546;
          v32 = v23;
          __int16 v33 = 2112;
          id v34 = v18;
          _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "failed playing feedback event for %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      v24 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
      objc_msgSend(v24, "_internal_willPlayFeedback:atTime:", v9, a5);

      kdebug_trace();
    }
    goto LABEL_21;
  }
  LOBYTE(v19) = 0;
LABEL_22:

  return (char)v19;
}

- (_UIFeedbackCoreHapticsEngine)hapticEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapticEngine);
  return (_UIFeedbackCoreHapticsEngine *)WeakRetained;
}

- (id)_internal_createEventsForLegacyFeedbackData:(id)a3
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 effectiveEventType];
  v6 = _coreHapticsEventTypeForEffectiveEventType(v5, 1);
  if (!v6)
  {
    v14 = 0;
    goto LABEL_34;
  }
  id v7 = [MEMORY[0x1E4F1CA48] array];
  id v8 = +[_UIFeedbackParameters parameters];
  uint64_t v37 = MEMORY[0x1E4F143A8];
  uint64_t v38 = 3221225472;
  uint64_t v39 = __76___UIFeedbackCoreHapticsPlayer__internal_createEventsForLegacyFeedbackData___block_invoke;
  v40 = &unk_1E52ED8D8;
  v41 = self;
  id v9 = v4;
  id v42 = v9;
  id v10 = v6;
  id v43 = v10;
  id v11 = v7;
  id v44 = v11;
  [v8 enumerateKeysAndObjectsUsingBlock:&v37];

  id v12 = v11;
  if (v5 > 17236)
  {
    if (v5 > 23380)
    {
      if ((unint64_t)(v5 - 23381) >= 3 && (unint64_t)(v5 - 26453) >= 3)
      {
        uint64_t v13 = -29525;
        goto LABEL_17;
      }
LABEL_18:
      float v15 = (float)(8 * v5 + (unint64_t)((BYTE1(v5) - 31) / 0xCu) - 680)
          * 0.043478;
      goto LABEL_19;
    }
    if ((unint64_t)(v5 - 17237) < 3) {
      goto LABEL_18;
    }
    uint64_t v13 = -20309;
LABEL_17:
    if ((unint64_t)(v5 + v13) >= 3) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v5 <= 14164)
  {
    if ((unint64_t)(v5 - 8021) < 3) {
      goto LABEL_18;
    }
    uint64_t v13 = -11093;
    goto LABEL_17;
  }
  if (v5 > 15968)
  {
    if (v5 > 16480)
    {
      if (v5 == 16481)
      {
        float v15 = 0.5;
        goto LABEL_19;
      }
      if (v5 == 16737)
      {
        float v15 = 1.0;
        goto LABEL_19;
      }
    }
    else
    {
      if (v5 == 15969)
      {
        float v15 = -0.5;
        goto LABEL_19;
      }
      if (v5 == 16225)
      {
        float v15 = 0.0;
        goto LABEL_19;
      }
    }
  }
  else
  {
    if ((unint64_t)(v5 - 14165) < 3) {
      goto LABEL_18;
    }
    float v15 = -1.0;
    if (v5 == 15713)
    {
LABEL_19:
      id v16 = objc_alloc((Class)getCHHapticEventParameterClass());
      v17 = getCHHapticEventParameterIDHapticSharpness();
      *(float *)&double v18 = v15;
      v19 = objc_msgSend(v16, "initWithParameterID:value:", v17, v18, v37, v38, v39, v40, v41, v42, v43);
      [v12 addObject:v19];
    }
  }
LABEL_20:

  uint64_t v20 = getCHHapticEventTypeAudioCustom();
  if (v10 == (id)v20)
  {

    goto LABEL_26;
  }
  id v21 = (void *)v20;
  id v22 = getCHHapticEventTypeAudioCustom();
  int v23 = [v10 isEqualToString:v22];

  if (v23)
  {
LABEL_26:
    id v31 = objc_alloc((Class)getCHHapticEventClass());
    [v9 effectiveDelay];
    long long v29 = objc_msgSend(v31, "initWithAudioResourceID:parameters:relativeTime:", v5, v12);
    v47[0] = v29;
    long long v30 = (void **)v47;
    goto LABEL_33;
  }
  uint64_t v24 = getCHHapticEventTypeHapticContinuous();
  if (v10 == (id)v24)
  {

    goto LABEL_32;
  }
  v25 = (void *)v24;
  id v26 = getCHHapticEventTypeHapticContinuous();
  int v27 = [v10 isEqualToString:v26];

  if (v27)
  {
LABEL_32:
    id v32 = objc_alloc((Class)getCHHapticEventClass());
    [v9 effectiveDelay];
    double v34 = v33;
    [v9 effectiveDuration];
    long long v29 = (void *)[v32 initWithEventType:v10 parameters:v12 relativeTime:v34 duration:v35];
    char v46 = v29;
    long long v30 = &v46;
    goto LABEL_33;
  }
  id v28 = objc_alloc((Class)getCHHapticEventClass());
  [v9 effectiveDelay];
  long long v29 = objc_msgSend(v28, "initWithEventType:parameters:relativeTime:", v10, v12);
  v45 = v29;
  long long v30 = &v45;
LABEL_33:
  v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v30, 1, v37, v38, v39, v40, v41);

LABEL_34:
  return v14;
}

- (void)setInvalidationBlock:(id)a3
{
}

- (void)setCoreHapticsPlayer:(id)a3
{
}

- (_UIFeedbackCoreHapticsPlayer)initWithEngine:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackCoreHapticsPlayer;
  uint64_t v5 = [(_UIFeedbackCoreHapticsPlayer *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hapticEngine, v4);
    uint64_t v7 = [(id)objc_opt_class() _internalQueue];
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v7;
  }
  return v6;
}

- (CHHapticPatternPlayer)coreHapticsPlayer
{
  return self->_coreHapticsPlayer;
}

- (id)_internal_createPlayerWithPattern:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
  v6 = [v5 coreHapticsEngine];

  if (v6)
  {
    id v20 = 0;
    uint64_t v7 = [v6 createPrivilegedPlayerWithPlayable:v4 error:&v20];
    id v8 = v20;
    id v9 = v8;
    if (!v7 || v8)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        float v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CCD8) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = v15;
          v17 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
          double v18 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", object_getClassName(v17), v17);
          *(_DWORD *)buf = 138412546;
          id v22 = v18;
          __int16 v23 = 2112;
          uint64_t v24 = v9;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "failed to create player with pattern for %@: %@", buf, 0x16u);
        }
      }
      id v10 = 0;
    }
    else
    {
      id v10 = v7;
    }
  }
  else
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CCD0) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = v11;
        uint64_t v13 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", object_getClassName(v13), v13);
        *(_DWORD *)buf = 138412290;
        id v22 = v14;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "failed to create player with pattern because CHHapticEngine was nil for %@", buf, 0xCu);
      }
    }
    id v10 = 0;
  }

  return v10;
}

- (id)_internal_createPatternForFeedbackData:(id)a3 feedback:(id)a4 engine:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v55 = a4;
  id v58 = a5;
  uint64_t v56 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v66;
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v57 = self;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v66 != v12) {
          objc_enumerationMutation(obj);
        }
        id v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        uint64_t v17 = [v16 effectiveEnabledFeedbackTypes];
        if ((v17 & 3) == 3) {
          goto LABEL_9;
        }
        uint64_t v18 = v17;
        if ((v17 & 3) != 2) {
          goto LABEL_12;
        }
        [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
        v60 = v14;
        id v20 = v19 = v13;
        [v20 coreHapticsEngine];
        uint64_t v21 = v10;
        uint64_t v22 = v12;
        v24 = __int16 v23 = v11;
        int v25 = [v24 playsHapticsOnly];

        id v11 = v23;
        uint64_t v12 = v22;
        uint64_t v10 = v21;

        uint64_t v13 = v19;
        v14 = v60;
        self = v57;
        if (v25)
        {
LABEL_9:
          id v63 = v13;
          id v64 = v14;
          id v26 = [(_UIFeedbackCoreHapticsPlayer *)self _internal_createEventsForFeedbackData:v16 engine:v58 parameters:&v64 parameterCurves:&v63];
          id v27 = v64;

          id v28 = v63;
          if (v26) {
            [v56 addObjectsFromArray:v26];
          }

          uint64_t v13 = v28;
          v14 = v27;
        }
        else
        {
LABEL_12:
          if (!v11) {
            id v11 = (__CFString *)objc_opt_new();
          }
          [(__CFString *)v11 appendFormat:@" %lu", v18];
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
    uint64_t v13 = (void *)MEMORY[0x1E4F1CBF0];
    v14 = (void *)MEMORY[0x1E4F1CBF0];
  }

  if ([v56 count])
  {
    CHHapticPatternClass = (objc_class *)qword_1EB25CC38;
    long long v30 = v55;
    if (!qword_1EB25CC38) {
      CHHapticPatternClass = (objc_class *)getCHHapticPatternClass();
    }
    id v31 = v13;
    uint64_t v32 = [v13 count];
    id v33 = [CHHapticPatternClass alloc];
    if (v32)
    {
      uint64_t v62 = 0;
      double v34 = (id *)&v62;
      uint64_t v35 = [v33 initWithEvents:v56 parameterCurves:v31 error:&v62];
    }
    else
    {
      uint64_t v61 = 0;
      double v34 = (id *)&v61;
      uint64_t v35 = [v33 initWithEvents:v56 parameters:v14 error:&v61];
    }
    id v44 = (void *)v35;
    uint64_t v13 = v31;
    v45 = (__CFString *)*v34;
    if (v45) {
      BOOL v46 = 1;
    }
    else {
      BOOL v46 = v44 == 0;
    }
    if (v46 && !_UIFeedbackLoggingDisabled)
    {
      uint64_t v47 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CD10) + 8);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = v31;
        v49 = NSString;
        v50 = v11;
        id v51 = v55;
        v52 = v47;
        uint64_t v53 = objc_msgSend(v49, "stringWithFormat:", @"<%s: %p>", object_getClassName(v51), v51);

        id v11 = v50;
        *(_DWORD *)buf = 138412546;
        id v70 = v53;
        __int16 v71 = 2112;
        v72 = v45;
        _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "failed to create haptic pattern for feedback %@: %@", buf, 0x16u);

        uint64_t v13 = v48;
      }
    }
  }
  else
  {
    long long v30 = v55;
    if (!_UIFeedbackLoggingDisabled)
    {
      uint64_t v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CD08) + 8);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = v13;
        uint64_t v38 = NSString;
        uint64_t v39 = v11;
        id v40 = v55;
        v41 = v36;
        id v42 = objc_msgSend(v38, "stringWithFormat:", @"<%s: %p>", object_getClassName(v40), v40);

        id v11 = v39;
        id v43 = @" none";
        if (v39) {
          id v43 = v39;
        }
        *(_DWORD *)buf = 138412546;
        id v70 = v42;
        __int16 v71 = 2112;
        v72 = v43;
        _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "no playable feedback for %@ (ignored feedback types:%@)", buf, 0x16u);

        uint64_t v13 = v37;
      }
    }
    id v44 = 0;
  }

  return v44;
}

- (id)_internal_createEventsForFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [v10 pattern];

  if (v12)
  {
    uint64_t v13 = [(_UIFeedbackCoreHapticsPlayer *)self _internal_createEventsForLibraryFeedbackData:v10 engine:v11 parameters:a5 parameterCurves:a6];
  }
  else
  {
    v14 = [v10 fileURL];

    if (v14)
    {
      uint64_t v13 = [(_UIFeedbackCoreHapticsPlayer *)self _internal_createEventsForFileFeedbackData:v10 engine:v11 parameters:a5 parameterCurves:a6];
    }
    else
    {
      if ([v10 isTransientHaptic]) {
        [(_UIFeedbackCoreHapticsPlayer *)self _internal_createEventsForTransientHapticData:v10];
      }
      else {
      uint64_t v13 = [(_UIFeedbackCoreHapticsPlayer *)self _internal_createEventsForLegacyFeedbackData:v10];
      }
    }
  }
  float v15 = (void *)v13;

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHapticsPlayer, 0);
  objc_destroyWeak((id *)&self->_hapticEngine);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (id)_internal_createEventsForLibraryFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6
{
  id v8 = a3;
  uint64_t v9 = [v8 pattern];
  _internal_populateParamtersFromPattern(v9, a5, a6);

  id v10 = [v8 pattern];

  id v11 = [v10 events];

  return v11;
}

- (id)_internal_createEventsForFileFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v44 = a4;
  if (qword_1EB25CCE8 != -1) {
    dispatch_once(&qword_1EB25CCE8, &__block_literal_global_102);
  }
  id v11 = [v10 fileURL];
  uint64_t v12 = [(id)qword_1EB25CCE0 objectForKeyedSubscript:v11];
  if ([v10 fileFeedbackType] == 2)
  {
    id v13 = v12;
    if (!v13)
    {
      v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v11];
      id v50 = 0;
      id v13 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v14 options:0 error:&v50];
      id v15 = v50;
      [(id)qword_1EB25CCE0 setObject:v13 forKeyedSubscript:v11];
      if (v15)
      {
        if (!_UIFeedbackLoggingDisabled)
        {
          id v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CCF0) + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            uint64_t v17 = v16;
            uint64_t v18 = [v11 lastPathComponent];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v18;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "failed loading haptic file %@: %@", buf, 0x16u);
          }
        }
      }
    }
    id v49 = 0;
    v19 = (void *)[objc_alloc((Class)getCHHapticPatternClass()) initWithDictionary:v13 error:&v49];
    id v20 = v49;
    if (v20)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        uint64_t v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CCF8) + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "failed loading haptic file dictionary: %@", buf, 0xCu);
        }
      }
    }
    _internal_populateParamtersFromPattern(v19, a5, a6);
    uint64_t v22 = [v19 events];
  }
  else
  {
    if ([v10 fileFeedbackType] != 1)
    {
      uint64_t v22 = 0;
      goto LABEL_33;
    }
    id v23 = v12;
    uint64_t v24 = [v23 unsignedIntegerValue];
    if (v23 && (uint64_t v25 = v24, ([v44 resourceIsRegistered:v24] & 1) != 0))
    {
      id v13 = v23;
    }
    else
    {
      if ([v10 disableEventUseVolumeEnvelope])
      {
        uint64_t v51 = 0;
        v52 = &v51;
        uint64_t v53 = 0x2020000000;
        id v26 = (id *)qword_1EB25CD70;
        uint64_t v54 = qword_1EB25CD70;
        if (!qword_1EB25CD70)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getCHHapticAudioResourceKeyUseVolumeEnvelopeSymbolLoc_block_invoke;
          uint64_t v59 = &unk_1E52D9900;
          v60 = &v51;
          id v27 = CoreHapticsLibrary_1();
          id v28 = dlsym(v27, "CHHapticAudioResourceKeyUseVolumeEnvelope");
          *(void *)(v60[1] + 24) = v28;
          qword_1EB25CD70 = *(void *)(v60[1] + 24);
          id v26 = (id *)v52[3];
        }
        _Block_object_dispose(&v51, 8);
        if (!v26)
        {
          id v42 = [MEMORY[0x1E4F28B00] currentHandler];
          id v43 = [NSString stringWithUTF8String:"CHHapticAudioResourceKey getCHHapticAudioResourceKeyUseVolumeEnvelope(void)"];
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"_UIFeedbackCoreHapticsEngineUtilities.h", 80, @"%s", dlerror());

          __break(1u);
        }
        id v56 = *v26;
        uint64_t v57 = MEMORY[0x1E4F1CC28];
        long long v29 = (void *)MEMORY[0x1E4F1C9E8];
        id v30 = v56;
        id v31 = [v29 dictionaryWithObjects:&v57 forKeys:&v56 count:1];
      }
      else
      {
        id v31 = (void *)MEMORY[0x1E4F1CC08];
      }
      id v48 = 0;
      uint64_t v25 = [v44 registerAudioResource:v11 options:v31 error:&v48];
      id v32 = v48;
      id v13 = [NSNumber numberWithUnsignedInteger:v25];

      [(id)qword_1EB25CCE0 setObject:v13 forKeyedSubscript:v11];
      if (v32)
      {
        if (!_UIFeedbackLoggingDisabled)
        {
          id v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CD00) + 8);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            double v34 = v33;
            uint64_t v35 = [v11 lastPathComponent];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v35;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v32;
            _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "failed registering audio file %@: %@", buf, 0x16u);
          }
        }
      }
    }
    uint64_t v36 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v37 = +[_UIFeedbackParameters parameters];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __108___UIFeedbackCoreHapticsPlayer__internal_createEventsForFileFeedbackData_engine_parameters_parameterCurves___block_invoke_111;
    v45[3] = &unk_1E52ED8B0;
    v45[4] = self;
    id v38 = v10;
    id v46 = v38;
    id v47 = v36;
    id v20 = v36;
    [v37 enumerateKeysAndObjectsUsingBlock:v45];

    id v39 = objc_alloc((Class)getCHHapticEventClass());
    [v38 effectiveDelay];
    id v40 = objc_msgSend(v39, "initWithAudioResourceID:parameters:relativeTime:", v25, v20);
    id v55 = v40;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  }
LABEL_33:

  return v22;
}

- (id)_internal_createEventsForTransientHapticData:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc((Class)getCHHapticEventParameterClass());
  uint64_t v5 = getCHHapticEventParameterIDHapticIntensity();
  [v3 intensity];
  v6 = objc_msgSend(v4, "initWithParameterID:value:", v5);

  id v7 = objc_alloc((Class)getCHHapticEventParameterClass());
  id v8 = getCHHapticEventParameterIDHapticSharpness();
  [v3 sharpness];
  uint64_t v9 = objc_msgSend(v7, "initWithParameterID:value:", v8);

  id v10 = objc_alloc((Class)getCHHapticEventClass());
  id v11 = getCHHapticEventTypeHapticTransient();
  v18[0] = v6;
  v18[1] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  [v3 effectiveDelay];
  double v14 = v13;

  id v15 = (void *)[v10 initWithEventType:v11 parameters:v12 relativeTime:v14];
  v19[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];

  return v16;
}

- (void)_updateValueForParameters:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66___UIFeedbackCoreHapticsPlayer__updateValueForParameters_withKey___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v9 = internalQueue;
  if (!v9)
  {
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
  }
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, block);
}

- (void)_internal_updateValueForParameters:(id)a3 withKey:(id)a4
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIFeedbackParameters parameters];
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];

  [v6 _effectiveValueForParameterWithKey:v7];
  float v11 = v10;
  if ([v6 _isAudio]) {
    id v12 = @"audioType";
  }
  else {
    id v12 = @"hapticType";
  }
  double v13 = [v9 objectForKeyedSubscript:v12];
  uint64_t v14 = (int)[v13 intValue];

  switch(v14)
  {
    case 0:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CD98;
      uint64_t v88 = qword_1EB25CD98;
      if (!qword_1EB25CD98)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDAudioVolumeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        v19 = CoreHapticsLibrary_1();
        id v20 = dlsym(v19, "CHHapticDynamicParameterIDAudioVolumeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v20;
        qword_1EB25CD98 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v22 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioVolumeControl(void)"];
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"_UIFeedbackCoreHapticsEngineUtilities.h", 70, @"%s", dlerror());

      goto LABEL_76;
    case 1:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDA0;
      uint64_t v88 = qword_1EB25CDA0;
      if (!qword_1EB25CDA0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDAudioPitchControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v23 = CoreHapticsLibrary_1();
        uint64_t v24 = dlsym(v23, "CHHapticDynamicParameterIDAudioPitchControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v24;
        qword_1EB25CDA0 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      id v26 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioPitchControl(void)"];
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, @"_UIFeedbackCoreHapticsEngineUtilities.h", 73, @"%s", dlerror());

      goto LABEL_76;
    case 2:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDB0;
      uint64_t v88 = qword_1EB25CDB0;
      if (!qword_1EB25CDB0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDAudioAttackTimeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v27 = CoreHapticsLibrary_1();
        id v28 = dlsym(v27, "CHHapticDynamicParameterIDAudioAttackTimeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v28;
        qword_1EB25CDB0 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
      id v30 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioAttackTimeControl(void)"];
      objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"_UIFeedbackCoreHapticsEngineUtilities.h", 74, @"%s", dlerror());

      goto LABEL_76;
    case 3:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDB8;
      uint64_t v88 = qword_1EB25CDB8;
      if (!qword_1EB25CDB8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDAudioDecayTimeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v31 = CoreHapticsLibrary_1();
        id v32 = dlsym(v31, "CHHapticDynamicParameterIDAudioDecayTimeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v32;
        qword_1EB25CDB8 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      id v33 = [MEMORY[0x1E4F28B00] currentHandler];
      double v34 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioDecayTimeControl(void)"];
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"_UIFeedbackCoreHapticsEngineUtilities.h", 75, @"%s", dlerror());

      goto LABEL_76;
    case 4:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDC0;
      uint64_t v88 = qword_1EB25CDC0;
      if (!qword_1EB25CDC0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDAudioReleaseTimeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        uint64_t v35 = CoreHapticsLibrary_1();
        uint64_t v36 = dlsym(v35, "CHHapticDynamicParameterIDAudioReleaseTimeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v36;
        qword_1EB25CDC0 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      id v38 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioReleaseTimeControl(void)"];
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"_UIFeedbackCoreHapticsEngineUtilities.h", 76, @"%s", dlerror());

      goto LABEL_76;
    case 5:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDA8;
      uint64_t v88 = qword_1EB25CDA8;
      if (!qword_1EB25CDA8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDAudioPanControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v39 = CoreHapticsLibrary_1();
        id v40 = dlsym(v39, "CHHapticDynamicParameterIDAudioPanControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v40;
        qword_1EB25CDA8 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      id v42 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioPanControl(void)"];
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"_UIFeedbackCoreHapticsEngineUtilities.h", 71, @"%s", dlerror());

      goto LABEL_76;
    case 6:
    case 12:
      if (_UIFeedbackLoggingDisabled) {
        goto LABEL_66;
      }
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB25CD88);
      if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
        goto LABEL_66;
      }
      id v16 = *(NSObject **)(CategoryCachedImpl + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v14;
      uint64_t v17 = "UIFeedbackParameterType (%ld) has no equivalent CHHapticDynamicParameterID";
      goto LABEL_12;
    case 7:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDC8;
      uint64_t v88 = qword_1EB25CDC8;
      if (!qword_1EB25CDC8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDHapticIntensityControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        uint64_t v59 = CoreHapticsLibrary_1();
        v60 = dlsym(v59, "CHHapticDynamicParameterIDHapticIntensityControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v60;
        qword_1EB25CDC8 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      v82 = [MEMORY[0x1E4F28B00] currentHandler];
      v83 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticIntensityControl(void)"];
      objc_msgSend(v82, "handleFailureInFunction:file:lineNumber:description:", v83, @"_UIFeedbackCoreHapticsEngineUtilities.h", 64, @"%s", dlerror());

      goto LABEL_76;
    case 8:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDE8;
      uint64_t v88 = qword_1EB25CDE8;
      if (!qword_1EB25CDE8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDHapticSharpnessControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v43 = CoreHapticsLibrary_1();
        id v44 = dlsym(v43, "CHHapticDynamicParameterIDHapticSharpnessControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v44;
        qword_1EB25CDE8 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      v45 = [MEMORY[0x1E4F28B00] currentHandler];
      id v46 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticSharpnessControl(void)"];
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, @"_UIFeedbackCoreHapticsEngineUtilities.h", 65, @"%s", dlerror());

      goto LABEL_76;
    case 9:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDD0;
      uint64_t v88 = qword_1EB25CDD0;
      if (!qword_1EB25CDD0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDHapticAttackTimeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v47 = CoreHapticsLibrary_1();
        id v48 = dlsym(v47, "CHHapticDynamicParameterIDHapticAttackTimeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v48;
        qword_1EB25CDD0 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      id v49 = [MEMORY[0x1E4F28B00] currentHandler];
      id v50 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticAttackTimeControl(void)"];
      objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, @"_UIFeedbackCoreHapticsEngineUtilities.h", 66, @"%s", dlerror());

      goto LABEL_76;
    case 10:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDD8;
      uint64_t v88 = qword_1EB25CDD8;
      if (!qword_1EB25CDD8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDHapticDecayTimeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        uint64_t v51 = CoreHapticsLibrary_1();
        v52 = dlsym(v51, "CHHapticDynamicParameterIDHapticDecayTimeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v52;
        qword_1EB25CDD8 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (v18) {
        goto LABEL_56;
      }
      uint64_t v53 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v54 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticDecayTimeControl(void)"];
      objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, @"_UIFeedbackCoreHapticsEngineUtilities.h", 67, @"%s", dlerror());

      goto LABEL_76;
    case 11:
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2020000000;
      uint64_t v18 = (id *)qword_1EB25CDE0;
      uint64_t v88 = qword_1EB25CDE0;
      if (!qword_1EB25CDE0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterIDHapticReleaseTimeControlSymbolLoc_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        id v55 = CoreHapticsLibrary_1();
        id v56 = dlsym(v55, "CHHapticDynamicParameterIDHapticReleaseTimeControl");
        *(void *)(*(void *)(v91[0] + 8) + 24) = v56;
        qword_1EB25CDE0 = *(void *)(*(void *)(v91[0] + 8) + 24);
        uint64_t v18 = (id *)v86[3];
      }
      _Block_object_dispose(&v85, 8);
      if (!v18)
      {
        uint64_t v57 = [MEMORY[0x1E4F28B00] currentHandler];
        id v58 = [NSString stringWithUTF8String:"CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticReleaseTimeControl(void)"];
        objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, @"_UIFeedbackCoreHapticsEngineUtilities.h", 68, @"%s", dlerror());

LABEL_76:
        __break(1u);
      }
LABEL_56:
      id v61 = *v18;
      if (!v61) {
        goto LABEL_66;
      }
      uint64_t v62 = v61;
      uint64_t v85 = 0;
      v86 = &v85;
      uint64_t v87 = 0x2050000000;
      id v63 = (void *)qword_1EB25CDF0;
      uint64_t v88 = qword_1EB25CDF0;
      if (!qword_1EB25CDF0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticDynamicParameterClass_block_invoke;
        double v90 = COERCE_DOUBLE(&unk_1E52D9900);
        v91[0] = &v85;
        __getCHHapticDynamicParameterClass_block_invoke((uint64_t)buf);
        id v63 = (void *)v86[3];
      }
      id v64 = v63;
      _Block_object_dispose(&v85, 8);
      id v65 = [v64 alloc];
      *(float *)&double v66 = v11;
      long long v67 = (void *)[v65 initWithParameterID:v62 value:v66 relativeTime:0.0];
      v92[0] = v67;
      long long v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:1];
      if (!_UIFeedbackLoggingDisabled)
      {
        unint64_t v69 = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB25CD28);
        if (*(unsigned char *)v69)
        {
          v78 = *(NSObject **)(v69 + 8);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v79 = v78;
            int v80 = [v6 _isAudio];
            id v81 = @"haptic";
            *(_DWORD *)buf = 138413058;
            if (v80) {
              id v81 = @"audio";
            }
            *(void *)&uint8_t buf[4] = v81;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v7;
            *(_WORD *)&buf[22] = 2048;
            double v90 = v11;
            LOWORD(v91[0]) = 2112;
            *(void *)((char *)v91 + 2) = self;
            _os_log_impl(&dword_1853B0000, v79, OS_LOG_TYPE_ERROR, "set %@ %@ %.3f on player %@", buf, 0x2Au);
          }
        }
      }
      id v70 = [(_UIFeedbackCoreHapticsPlayer *)self coreHapticsPlayer];
      id v84 = 0;
      [v70 sendParameters:v68 atTime:&v84 error:0.0];
      double v71 = COERCE_DOUBLE(v84);

      if (v71 != 0.0 && !_UIFeedbackLoggingDisabled)
      {
        v72 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CD30) + 8);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          v73 = v72;
          uint64_t v74 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
          id v75 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", object_getClassName(v74), v74);
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v7;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v75;
          *(_WORD *)&buf[22] = 2112;
          double v90 = v71;
          _os_log_impl(&dword_1853B0000, v73, OS_LOG_TYPE_ERROR, "failed setting %@ parameter for %@: %@", buf, 0x20u);
        }
      }

      break;
    default:
      if (_UIFeedbackLoggingDisabled) {
        goto LABEL_66;
      }
      id v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CD90) + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_66;
      }
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v14;
      uint64_t v17 = "Cannot convert UIFeedbackParameterType (%ld) to CHHapticDynamicParameterID";
LABEL_12:
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
LABEL_66:
      if (!_UIFeedbackLoggingDisabled)
      {
        unint64_t v76 = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB25CD20);
        if (*(unsigned char *)v76)
        {
          id v77 = *(NSObject **)(v76 + 8);
          if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)&uint8_t buf[4] = v14;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v11;
            _os_log_impl(&dword_1853B0000, v77, OS_LOG_TYPE_ERROR, "Ignoring UIFeedbackParameterType (%ld) with value %f", buf, 0x16u);
          }
        }
      }
      break;
  }
}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  id v7 = [v6 _effectiveFeedbackData];
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53___UIFeedbackCoreHapticsPlayer__playFeedback_atTime___block_invoke;
  v13[3] = &unk_1E52ED900;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  double v16 = a4;
  uint64_t v9 = internalQueue;
  if (!v9)
  {
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
  }
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v9, v13);
}

- (void)_stopFeedback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _effectiveFeedbackData];
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___UIFeedbackCoreHapticsPlayer__stopFeedback___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v12 = v5;
  id v13 = v4;
  id v7 = internalQueue;
  if (!v7)
  {
    id v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  id v9 = v4;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
  objc_msgSend(v6, "_internal_willCancelFeedback:", v5);

  id v7 = [(_UIFeedbackCoreHapticsPlayer *)self coreHapticsPlayer];
  id v13 = 0;
  [v7 stopAtTime:&v13 error:0.0];
  id v8 = v13;

  if (v8)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_stopFeedbackData_forFeedback____s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = v9;
        id v11 = [(_UIFeedbackCoreHapticsPlayer *)self hapticEngine];
        id v12 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p>", object_getClassName(v11), v11);
        *(_DWORD *)buf = 138412802;
        id v15 = v5;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "failed stopping feedback %@ for %@: %@", buf, 0x20u);
      }
    }
  }
}

- (void)setHapticEngine:(id)a3
{
}

@end