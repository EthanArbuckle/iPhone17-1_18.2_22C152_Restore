@interface SSRVoiceProfilePruner
- (id)_retrainVoiceProfile:(id)a3 withAsset:(id)a4;
- (unint64_t)_deleteUtterances:(id)a3;
- (void)_getScoresForAudio:(id)a3 withController:(id)a4 withDetector:(id)a5 forProfile:(id)a6 withCompletion:(id)a7;
- (void)pruneVoiceProfile:(id)a3 forSpIdType:(unint64_t)a4 withAsset:(id)a5;
@end

@implementation SSRVoiceProfilePruner

- (unint64_t)_deleteUtterances:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    v8 = (os_log_t *)MEMORY[0x263F38100];
    do
    {
      unint64_t v17 = v6;
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = [*(id *)(*((void *)&v18 + 1) + 8 * i) path];
        v11 = [v10 stringByDeletingPathExtension];
        v12 = [v11 stringByAppendingPathExtension:@"json"];

        v13 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "-[SSRVoiceProfilePruner _deleteUtterances:]";
          __int16 v24 = 2114;
          v25 = v10;
          _os_log_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Deleting %{public}@", buf, 0x16u);
        }
        id v14 = +[SSRUtils removeItemAtPath:v10];
        id v15 = +[SSRUtils removeItemAtPath:v12];
      }
      unint64_t v6 = v17 + v5;
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_retrainVoiceProfile:(id)a3 withAsset:(id)a4
{
  v44[3] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v26 = a4;
  unint64_t v6 = +[SSRVoiceProfileManager sharedInstance];
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__5217;
  v35 = __Block_byref_object_dispose__5218;
  id v36 = 0;
  v43[0] = @"SSRVoiceRetrainingVoiceProfile";
  v43[1] = @"SSRVoiceRetrainingPayloadProfile";
  v44[0] = v5;
  v44[1] = MEMORY[0x263EFFA80];
  v43[2] = @"SSRVoiceRetrainingAsset";
  v44[2] = v26;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:3];
  v8 = [SSRVoiceProfileRetrainingContext alloc];
  v9 = (id *)(v32 + 5);
  id obj = (id)v32[5];
  v10 = [(SSRVoiceProfileRetrainingContext *)v8 initWithVoiceRetrainingContext:v7 error:&obj];
  objc_storeStrong(v9, obj);
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v12 = [MEMORY[0x263EFF910] date];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __56__SSRVoiceProfilePruner__retrainVoiceProfile_withAsset___block_invoke;
  v27[3] = &unk_264429930;
  v29 = &v31;
  v13 = v11;
  v28 = v13;
  [v6 triggerRetrainingVoiceProfile:v5 withContext:v10 withCompletion:v27];
  dispatch_time_t v14 = dispatch_time(0, 12000000000);
  intptr_t v15 = dispatch_group_wait(v13, v14);
  v16 = [MEMORY[0x263EFF910] date];
  [v16 timeIntervalSinceDate:v12];
  if (v15)
  {
    long long v18 = objc_msgSend(NSString, "stringWithFormat:", @"Pruner: Timeout (%fms) waiting for retraining - Bailing out", v17 * 1000.0);
    long long v19 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "-[SSRVoiceProfilePruner _retrainVoiceProfile:withAsset:]";
      __int16 v41 = 2114;
      v42 = v18;
      _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %{public}@", buf, 0x16u);
    }
    long long v20 = (void *)MEMORY[0x263F087E8];
    v37 = @"reason";
    v38 = v18;
    long long v21 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:707 userInfo:v21];
    v23 = (void *)v32[5];
    v32[5] = v22;
  }
  id v24 = (id)v32[5];

  _Block_object_dispose(&v31, 8);

  return v24;
}

void __56__SSRVoiceProfilePruner__retrainVoiceProfile_withAsset___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_getScoresForAudio:(id)a3 withController:(id)a4 withDetector:(id)a5 forProfile:(id)a6 withCompletion:(id)a7
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v39 = a5;
  id v13 = a6;
  dispatch_time_t v14 = (void (**)(id, void, float, float, float, float))a7;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5217;
  v49 = __Block_byref_object_dispose__5218;
  id v50 = 0;
  [MEMORY[0x263F38038] lpcmInt16ASBD];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke;
  v41[3] = &unk_264429C30;
  v43 = &v45;
  id v15 = v12;
  id v42 = v15;
  +[SSRUtils streamAudioFromFileUrl:v11 audioStreamBasicDescriptor:v44 samplesPerStreamChunk:640 audioDataAvailableHandler:v41];
  if (!v46[5])
  {
    double v17 = [v15 getLatestSpeakerInfo];
    if (!v17)
    {
      long long v18 = [NSString stringWithFormat:@"Failed to get scoreCard - Bailing out"];
      long long v19 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      }
      long long v20 = (void *)MEMORY[0x263F087E8];
      v57 = @"reason";
      v58 = v18;
      long long v21 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1, v39);
      uint64_t v22 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:111 userInfo:v21];
      v23 = (void *)v46[5];
      v46[5] = v22;

      if (v14) {
        v14[2](v14, v46[5], -INFINITY, -INFINITY, -INFINITY, -INFINITY);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LODWORD(v60) = -8388608;
    id v24 = objc_msgSend(v17, "objectForKeyedSubscript:", @"spIdKnownUserScores", v39);
    if (v24)
    {
      v25 = [v13 profileID];
      id v26 = [v24 objectForKeyedSubscript:v25];
      [v26 floatValue];
    }
    uint64_t v27 = [v17 objectForKeyedSubscript:@"spIdKnownUserPSRExpScores"];
    if (v27)
    {
      v28 = [v13 profileID];
      v29 = [v27 objectForKeyedSubscript:v28];
      [v29 floatValue];
    }
    v30 = [v17 objectForKeyedSubscript:@"spIdKnownUserSATExpScores"];
    if (v30)
    {
      uint64_t v31 = [v13 profileID];
      v32 = [v30 objectForKeyedSubscript:v31];
      [v32 floatValue];
    }
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke_24;
    v40[3] = &unk_264429908;
    v40[4] = &v45;
    v40[5] = buf;
    [v39 computeTriggerConfidenceForAudio:v11 withCompletion:v40];
    if (v46[5])
    {
      uint64_t v33 = (id)*MEMORY[0x263F38100];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v37 = [v11 lastPathComponent];
        uint64_t v38 = v46[5];
        *(_DWORD *)v51 = 136315650;
        v52 = "-[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:]";
        __int16 v53 = 2114;
        v54 = v37;
        __int16 v55 = 2114;
        uint64_t v56 = v38;
        _os_log_error_impl(&dword_21C8A5000, v33, OS_LOG_TYPE_ERROR, "%s ERR: Failed in trigger processing %{public}@ with %{public}@", v51, 0x20u);
      }
      if (!v14) {
        goto LABEL_26;
      }
      uint64_t v34 = v46[5];
    }
    else
    {
      if (!v14)
      {
LABEL_26:

        _Block_object_dispose(buf, 8);
        goto LABEL_27;
      }
      uint64_t v34 = 0;
    }
    ((void (*)(void (**)(id, void, float, float, float, float), uint64_t))v14[2])(v14, v34);
    goto LABEL_26;
  }
  v16 = (id)*MEMORY[0x263F38100];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    v35 = objc_msgSend(v11, "lastPathComponent", v39);
    uint64_t v36 = v46[5];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[SSRVoiceProfilePruner _getScoresForAudio:withController:withDetector:forProfile:withCompletion:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v60 = v36;
    _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s ERR: Failed in processing %{public}@ with %{public}@", buf, 0x20u);
  }
  if (v14) {
    v14[2](v14, v46[5], -INFINITY, -INFINITY, -INFINITY, -INFINITY);
  }
LABEL_27:

  _Block_object_dispose(&v45, 8);
}

void __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v9 = a4;
  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) endAudio];
  }
  else
  {
    v8 = [MEMORY[0x263EFF8F8] dataWithBytes:*(void *)(a2 + 16) length:*(unsigned int *)(a2 + 12)];
    objc_msgSend(*(id *)(a1 + 32), "processAudio:withNumberOfSamples:", v8, (unint64_t)objc_msgSend(v8, "length") >> 1);
  }
}

void __98__SSRVoiceProfilePruner__getScoresForAudio_withController_withDetector_forProfile_withCompletion___block_invoke_24(uint64_t a1, void *a2, float a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

- (void)pruneVoiceProfile:(id)a3 forSpIdType:(unint64_t)a4 withAsset:(id)a5
{
  v194[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (CSIsIOS())
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v10 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
        __int16 v181 = 1026;
        *(_DWORD *)v182 = a4;
        id v11 = "%s Called with explicit spId type %{public}d - Bailing out";
        id v12 = v10;
        uint32_t v13 = 18;
LABEL_7:
        _os_log_impl(&dword_21C8A5000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_43;
      }
      goto LABEL_43;
    }
    id v15 = [SSRLoggingAggregator alloc];
    v16 = [v8 locale];
    double v17 = [v9 configVersion];
    v142 = [(SSRLoggingAggregator *)v15 initWithEvent:@"pruning" locale:v16 configVersion:v17];

    v139 = [MEMORY[0x263EFF980] arrayWithCapacity:28];
    v141 = [v8 getExplicitEnrollmentUtterancesForType:1];
    v140 = [v8 getImplicitEnrollmentUtterancesForType:1];
    unint64_t v137 = [v9 pruningNumRetentionUtterance];
    long long v18 = [v8 pruningCookie];
    long long v19 = [v9 voiceProfilePruningCookie];
    [v9 pruningThresholdPSR];
    float v21 = v20;
    [v9 pruningThresholdSAT];
    float v23 = v22;
    [v9 pruningExplicitUttThresholdPSR];
    float v25 = v24;
    [v9 pruningExplicitUttThresholdSAT];
    float v27 = v26;
    [v9 satVTImplicitThreshold];
    float v29 = v28;
    v30 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
      __int16 v181 = 2114;
      *(void *)v182 = v19;
      *(_WORD *)&v182[8] = 2114;
      *(void *)&v182[10] = v18;
      _os_log_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_DEFAULT, "%s Voice Profile pruning cookie from Asset %{public}@ lastCookie %{public}@", buf, 0x20u);
    }
    if (v19)
    {
      if (!v18 || ![v18 isEqualToString:v19])
      {
        char v33 = [v8 updatePruningCookie:v19];
        uint64_t v34 = *MEMORY[0x263F38100];
        if (v33)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
            __int16 v181 = 2114;
            *(void *)v182 = v141;
            *(_WORD *)&v182[8] = 2114;
            *(void *)&v182[10] = v140;
            _os_log_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_DEFAULT, "%s Explicit utterances: %{public}@, Implicit utterances: %{public}@", buf, 0x20u);
          }
          if (v141)
          {
            if ((unint64_t)[v141 count] > 3)
            {
              if (v140 && [v140 count])
              {
                v37 = *MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                  _os_log_impl(&dword_21C8A5000, v37, OS_LOG_TYPE_DEFAULT, "%s Pruning(1)::----------------------------- Retrain profile to create explicit model ---------------------------------------", buf, 0xCu);
                }
                uint64_t v38 = [(SSRVoiceProfilePruner *)self _retrainVoiceProfile:v8 withAsset:v9];
                if (v38)
                {
                  id v39 = *MEMORY[0x263F38100];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                    __int16 v181 = 2114;
                    *(void *)v182 = v38;
                    _os_log_error_impl(&dword_21C8A5000, v39, OS_LOG_TYPE_ERROR, "%s ERR: creating pruning voice profile failed with %{public}@", buf, 0x16u);
                  }
                  [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:5];
                  [(SSRLoggingAggregator *)v142 pushAnalytics];
                }
                else
                {
                  v194[0] = &unk_26CD45580;
                  v193[0] = @"SSRSpeakerRecognitionStyle";
                  v193[1] = @"SSRSpeakerRecognitionProfileArray";
                  id v192 = v8;
                  __int16 v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v192 count:1];
                  v194[1] = v41;
                  v193[2] = @"SSRSpeakerRecognitionAsset";
                  v194[2] = v9;
                  v118 = [NSDictionary dictionaryWithObjects:v194 forKeys:v193 count:3];

                  uint64_t v171 = 0;
                  v172 = &v171;
                  uint64_t v173 = 0x3032000000;
                  v174 = __Block_byref_object_copy__5217;
                  v175 = __Block_byref_object_dispose__5218;
                  id v176 = 0;
                  id v42 = [SSRSpeakerRecognitionContext alloc];
                  v43 = (id *)(v172 + 5);
                  id obj = (id)v172[5];
                  v132 = [(SSRSpeakerRecognitionContext *)v42 initWithVoiceRecognitionContext:v118 error:&obj];
                  objc_storeStrong(v43, obj);
                  uint64_t v44 = v172[5];
                  if (v44 || !v132)
                  {
                    v72 = *MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      __int16 v181 = 2114;
                      *(void *)v182 = v44;
                      _os_log_error_impl(&dword_21C8A5000, v72, OS_LOG_TYPE_ERROR, "%s ERR: Failed to create SSR context with error %{public}@ - Bailing out", buf, 0x16u);
                    }
                    id v138 = 0;
                    v134 = 0;
                  }
                  else
                  {
                    uint64_t v45 = [SSRSpeakerRecognitionController alloc];
                    v46 = (id *)(v172 + 5);
                    id v169 = (id)v172[5];
                    v136 = [(SSRSpeakerRecognitionController *)v45 initWithContext:v132 withDelegate:self error:&v169];
                    objc_storeStrong(v46, v169);
                    uint64_t v47 = [SSRTriggerPhraseDetector alloc];
                    v48 = [v8 locale];
                    v131 = [(SSRTriggerPhraseDetector *)v47 initWithLocale:v48 asset:v9];

                    v49 = *MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_21C8A5000, v49, OS_LOG_TYPE_DEFAULT, "%s Pruning(2)::----------------------------- Check Explicit Utterance scores ---------------------------------------", buf, 0xCu);
                    }
                    long long v167 = 0u;
                    long long v168 = 0u;
                    long long v165 = 0u;
                    long long v166 = 0u;
                    id v121 = v141;
                    uint64_t v50 = [v121 countByEnumeratingWithState:&v165 objects:v191 count:16];
                    if (v50)
                    {
                      char v119 = 0;
                      int v122 = 0;
                      uint64_t v128 = *(void *)v166;
                      *(void *)&long long v51 = 136315138;
                      long long v114 = v51;
                      while (2)
                      {
                        uint64_t v52 = 0;
                        uint64_t v124 = v50;
                        do
                        {
                          if (*(void *)v166 != v128) {
                            objc_enumerationMutation(v121);
                          }
                          __int16 v53 = *(void **)(*((void *)&v165 + 1) + 8 * v52);
                          uint64_t v161 = 0;
                          v162 = (float *)&v161;
                          uint64_t v163 = 0x2020000000;
                          int v164 = -8388608;
                          uint64_t v157 = 0;
                          v158 = (float *)&v157;
                          uint64_t v159 = 0x2020000000;
                          int v160 = -8388608;
                          uint64_t v153 = 0;
                          v154 = &v153;
                          uint64_t v155 = 0x2020000000;
                          int v156 = -8388608;
                          uint64_t v149 = 0;
                          v150 = (float *)&v149;
                          uint64_t v151 = 0x2020000000;
                          int v152 = -8388608;
                          id v54 = -[SSRSpeakerRecognitionController resetWithContext:](v136, "resetWithContext:", v132, v114);
                          v148[0] = MEMORY[0x263EF8330];
                          v148[1] = 3221225472;
                          v148[2] = __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke;
                          v148[3] = &unk_2644298D8;
                          v148[4] = &v171;
                          v148[5] = &v161;
                          v148[6] = &v157;
                          v148[7] = &v153;
                          v148[8] = &v149;
                          [(SSRVoiceProfilePruner *)self _getScoresForAudio:v53 withController:v136 withDetector:v131 forProfile:v8 withCompletion:v148];
                          uint64_t v133 = v172[5];
                          if (v133)
                          {
                            uint64_t v56 = *MEMORY[0x263F38100];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = v114;
                              v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                              _os_log_error_impl(&dword_21C8A5000, v56, OS_LOG_TYPE_ERROR, "%s ERR: ScoreCard is nil in voice profile pruning - Bailing out", buf, 0xCu);
                            }
                            [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:6];
                            [(SSRLoggingAggregator *)v142 pushAnalytics];
                          }
                          else
                          {
                            float v57 = v162[6];
                            if (v57 <= 0.0 || v57 <= v27 || (float v58 = v158[6], v58 <= 0.0) || v58 <= v25)
                            {
                              LODWORD(v55) = *((_DWORD *)v154 + 6);
                              [(SSRLoggingAggregator *)v142 appendVoiceProfileFailedExplicitUtteranceScoreWith:v55];
                              v65 = (id)*MEMORY[0x263F38100];
                              if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                              {
                                v66 = [v53 lastPathComponent];
                                double v67 = v150[6];
                                double v68 = v162[6];
                                double v69 = v158[6];
                                double v70 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                __int16 v181 = 1026;
                                *(_DWORD *)v182 = v122;
                                *(_WORD *)&v182[4] = 2114;
                                *(void *)&v182[6] = v66;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v67;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v68;
                                __int16 v183 = 2050;
                                double v184 = v27;
                                __int16 v185 = 2050;
                                double v186 = v69;
                                __int16 v187 = 2050;
                                double v188 = v25;
                                __int16 v189 = 2050;
                                double v190 = v70;
                                _os_log_error_impl(&dword_21C8A5000, v65, OS_LOG_TYPE_ERROR, "%s Low Score Explicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f, %{public}.3f) C:%{public}.3f", buf, 0x62u);
                              }
                              char v119 = 1;
                            }
                            else
                            {
                              log = (id)*MEMORY[0x263F38100];
                              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                              {
                                v59 = [v53 lastPathComponent];
                                double v60 = v150[6];
                                double v61 = v162[6];
                                double v62 = v158[6];
                                double v63 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                __int16 v181 = 1026;
                                *(_DWORD *)v182 = v122;
                                *(_WORD *)&v182[4] = 2114;
                                *(void *)&v182[6] = v59;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v60;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v61;
                                __int16 v183 = 2050;
                                double v184 = v27;
                                __int16 v185 = 2050;
                                double v186 = v62;
                                __int16 v187 = 2050;
                                double v188 = v25;
                                __int16 v189 = 2050;
                                double v190 = v63;
                                _os_log_impl(&dword_21C8A5000, log, OS_LOG_TYPE_DEFAULT, "%s Explicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f(%{public}.3f) C:%{public}.3f", buf, 0x62u);
                              }
                              LODWORD(v64) = *((_DWORD *)v154 + 6);
                              [(SSRLoggingAggregator *)v142 appendVoiceProfileExplicitUtteranceScoreWith:v64];
                            }
                            ++v122;
                          }
                          _Block_object_dispose(&v149, 8);
                          _Block_object_dispose(&v153, 8);
                          _Block_object_dispose(&v157, 8);
                          _Block_object_dispose(&v161, 8);
                          if (v133)
                          {
LABEL_107:

LABEL_108:
                            id v138 = 0;
                            v134 = 0;
                            goto LABEL_109;
                          }
                          ++v52;
                        }
                        while (v124 != v52);
                        uint64_t v50 = [v121 countByEnumeratingWithState:&v165 objects:v191 count:16];
                        if (v50) {
                          continue;
                        }
                        break;
                      }

                      if (v119)
                      {
                        v71 = *MEMORY[0x263F38100];
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = v114;
                          v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                          _os_log_error_impl(&dword_21C8A5000, v71, OS_LOG_TYPE_ERROR, "%s ERR: Detected explicit utterances with lower scores, Bailing out", buf, 0xCu);
                        }
                        [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:4];
                        [(SSRLoggingAggregator *)v142 pushAnalytics];
                        goto LABEL_108;
                      }
                    }
                    else
                    {
                    }
                    v73 = *MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_21C8A5000, v73, OS_LOG_TYPE_DEFAULT, "%s Pruning(3)::----------------------------- Implicit selection ---------------------------------------", buf, 0xCu);
                    }
                    long long v146 = 0u;
                    long long v147 = 0u;
                    long long v144 = 0u;
                    long long v145 = 0u;
                    id v115 = v140;
                    uint64_t v74 = [v115 countByEnumeratingWithState:&v144 objects:v178 count:16];
                    if (v74)
                    {
                      int v120 = 0;
                      int loga = 0;
                      uint64_t v126 = *(void *)v145;
                      while (2)
                      {
                        uint64_t v75 = 0;
                        uint64_t v123 = v74;
                        do
                        {
                          if (*(void *)v145 != v126) {
                            objc_enumerationMutation(v115);
                          }
                          v76 = *(void **)(*((void *)&v144 + 1) + 8 * v75);
                          uint64_t v161 = 0;
                          v162 = (float *)&v161;
                          uint64_t v163 = 0x2020000000;
                          int v164 = -8388608;
                          uint64_t v157 = 0;
                          v158 = (float *)&v157;
                          uint64_t v159 = 0x2020000000;
                          int v160 = -8388608;
                          uint64_t v153 = 0;
                          v154 = &v153;
                          uint64_t v155 = 0x2020000000;
                          int v156 = -8388608;
                          uint64_t v149 = 0;
                          v150 = (float *)&v149;
                          uint64_t v151 = 0x2020000000;
                          int v152 = -8388608;
                          id v77 = [(SSRSpeakerRecognitionController *)v136 resetWithContext:v132];
                          v143[0] = MEMORY[0x263EF8330];
                          v143[1] = 3221225472;
                          v143[2] = __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke_9;
                          v143[3] = &unk_2644298D8;
                          v143[4] = &v171;
                          v143[5] = &v161;
                          v143[6] = &v157;
                          v143[7] = &v153;
                          v143[8] = &v149;
                          [(SSRVoiceProfilePruner *)self _getScoresForAudio:v76 withController:v136 withDetector:v131 forProfile:v8 withCompletion:v143];
                          v129 = v76;
                          uint64_t v135 = v172[5];
                          if (v135)
                          {
                            v78 = *MEMORY[0x263F38100];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)buf = 136315138;
                              v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                              _os_log_error_impl(&dword_21C8A5000, v78, OS_LOG_TYPE_ERROR, "%s ERR: ScoreCard is nil in voice profile pruning - Bailing out", buf, 0xCu);
                            }
                            [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:6];
                            [(SSRLoggingAggregator *)v142 pushAnalytics];
                          }
                          else
                          {
                            if (v150[6] <= v29
                              || (float v79 = v162[6], v79 <= 0.0)
                              || v79 <= v23
                              || (float v80 = v158[6], v80 <= 0.0)
                              || v80 <= v21)
                            {
                              v88 = (id)*MEMORY[0x263F38100];
                              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                              {
                                v91 = [v129 lastPathComponent];
                                double v92 = v150[6];
                                double v93 = v162[6];
                                double v94 = v158[6];
                                double v95 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                __int16 v181 = 1026;
                                *(_DWORD *)v182 = v120;
                                *(_WORD *)&v182[4] = 2114;
                                *(void *)&v182[6] = v91;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v92;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v93;
                                __int16 v183 = 2050;
                                double v184 = v23;
                                __int16 v185 = 2050;
                                double v186 = v94;
                                __int16 v187 = 2050;
                                double v188 = v21;
                                __int16 v189 = 2050;
                                double v190 = v95;
                                _os_log_error_impl(&dword_21C8A5000, v88, OS_LOG_TYPE_ERROR, "%s Deleting low Score Implicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f, %{public}.3f) C:%{public}.3f", buf, 0x62u);
                              }
                              LODWORD(v89) = *((_DWORD *)v154 + 6);
                              [(SSRLoggingAggregator *)v142 appendVoiceProfileDiscardedImplicitUtteranceScoreWith:v89];
                              v177 = v129;
                              v90 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v177 count:1];
                              [(SSRVoiceProfilePruner *)self _deleteUtterances:v90];

                              ++loga;
                            }
                            else
                            {
                              v81 = (id)*MEMORY[0x263F38100];
                              if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                              {
                                v82 = [v129 lastPathComponent];
                                double v83 = v150[6];
                                double v84 = v162[6];
                                double v85 = v158[6];
                                double v86 = *((float *)v154 + 6);
                                *(_DWORD *)buf = 136317442;
                                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                                __int16 v181 = 1026;
                                *(_DWORD *)v182 = v120;
                                *(_WORD *)&v182[4] = 2114;
                                *(void *)&v182[6] = v82;
                                *(_WORD *)&v182[14] = 2050;
                                *(double *)&v182[16] = v83;
                                *(_WORD *)&v182[24] = 2050;
                                *(double *)&v182[26] = v29;
                                *(_WORD *)&v182[34] = 2050;
                                *(double *)&v182[36] = v84;
                                __int16 v183 = 2050;
                                double v184 = v23;
                                __int16 v185 = 2050;
                                double v186 = v85;
                                __int16 v187 = 2050;
                                double v188 = v21;
                                __int16 v189 = 2050;
                                double v190 = v86;
                                _os_log_impl(&dword_21C8A5000, v81, OS_LOG_TYPE_DEFAULT, "%s Implicit utterance[%{public}d]: %{public}@ --> T:(%{public}.3f, %{public}.3f) S:(%{public}.3f, %{public}.3f) P:(%{public}.3f, %{public}.3f) C:%{public}.3f", buf, 0x62u);
                              }
                              LODWORD(v87) = *((_DWORD *)v154 + 6);
                              [(SSRLoggingAggregator *)v142 appendVoiceProfileImplicitUtteranceScoreWith:v87];
                            }
                            ++v120;
                          }
                          _Block_object_dispose(&v149, 8);
                          _Block_object_dispose(&v153, 8);
                          _Block_object_dispose(&v157, 8);
                          _Block_object_dispose(&v161, 8);
                          if (v135)
                          {
                            id v121 = v115;
                            goto LABEL_107;
                          }
                          ++v75;
                        }
                        while (v123 != v75);
                        uint64_t v74 = [v115 countByEnumeratingWithState:&v144 objects:v178 count:16];
                        if (v74) {
                          continue;
                        }
                        break;
                      }
                    }
                    else
                    {
                      int loga = 0;
                    }

                    [(SSRLoggingAggregator *)v142 setVoiceProfileDiscardedUtteranceCount:loga];
                    v96 = *MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_21C8A5000, v96, OS_LOG_TYPE_DEFAULT, "%s Pruning(4)::----------------------------- Implicit sampling ---------------------------------------", buf, 0xCu);
                    }
                    v134 = [v8 getImplicitEnrollmentUtterancesForType:a4];
                    unint64_t v97 = v137 + [v134 count] - 1;
                    unint64_t v127 = v97 / v137;
                    if (v137 <= v97)
                    {
                      unint64_t v130 = [v121 count];
                      unint64_t v110 = 0;
                      unint64_t v125 = v137 + 5;
                      for (uint64_t i = -1; v110 < [v134 count]; --i)
                      {
                        if (v110 % v127)
                        {
                          v112 = [v134 objectAtIndexedSubscript:v110];
                          [v139 addObject:v112];
                        }
                        else
                        {
                          ++v130;
                        }
                        uint64_t v113 = [v134 count];
                        if (v125 > v130 && i + v113 <= v125 - v130) {
                          break;
                        }
                        ++v110;
                      }
                    }
                    v98 = (id)*MEMORY[0x263F38100];
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v99 = [v134 count];
                      uint64_t v100 = [v139 count];
                      *(_DWORD *)buf = 136316162;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      __int16 v181 = 2050;
                      *(void *)v182 = v99;
                      *(_WORD *)&v182[8] = 2050;
                      *(void *)&v182[10] = v127;
                      *(_WORD *)&v182[18] = 2050;
                      *(void *)&v182[20] = v137;
                      *(_WORD *)&v182[28] = 2050;
                      *(void *)&v182[30] = v100;
                      _os_log_impl(&dword_21C8A5000, v98, OS_LOG_TYPE_DEFAULT, "%s Utterance selection totalImplicit: %{public}lu selectionIndex: %{public}lu retentionCount: %{public}lu deleteCount: %{public}lu ", buf, 0x34u);
                    }

                    if (v139 && [v139 count])
                    {
                      v101 = [MEMORY[0x263EFF9C0] setWithArray:v134];
                      v102 = [MEMORY[0x263EFFA08] setWithArray:v139];
                      [v101 minusSet:v102];
                      id v138 = [v101 allObjects];
                    }
                    else
                    {
                      id v138 = v134;
                    }
                    v103 = (id)*MEMORY[0x263F38100];
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v104 = [v139 count];
                      *(_DWORD *)buf = 136315650;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      __int16 v181 = 2048;
                      *(void *)v182 = v104;
                      *(_WORD *)&v182[8] = 2114;
                      *(void *)&v182[10] = v139;
                      _os_log_impl(&dword_21C8A5000, v103, OS_LOG_TYPE_DEFAULT, "%s Deleting implicit utterances(%lu) - %{public}@", buf, 0x20u);
                    }

                    [(SSRVoiceProfilePruner *)self _deleteUtterances:v139];
                    -[SSRLoggingAggregator setVoiceProfilePrunedUtteranceCount:](v142, "setVoiceProfilePrunedUtteranceCount:", [v139 count]);
                    -[SSRLoggingAggregator setVoiceProfileRetainedUtteranceCount:](v142, "setVoiceProfileRetainedUtteranceCount:", [v138 count]);
                    v105 = *MEMORY[0x263F38100];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315138;
                      v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                      _os_log_impl(&dword_21C8A5000, v105, OS_LOG_TYPE_DEFAULT, "%s Pruning(5)::----------------------------- Retrain the voice profile ---------------------------------------", buf, 0xCu);
                    }
                    uint64_t v106 = [(SSRVoiceProfilePruner *)self _retrainVoiceProfile:v8 withAsset:v9];
                    v107 = (void *)v172[5];
                    v172[5] = v106;

                    uint64_t v108 = v172[5];
                    if (v108)
                    {
                      v109 = *MEMORY[0x263F38100];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315394;
                        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                        __int16 v181 = 2114;
                        *(void *)v182 = v108;
                        _os_log_error_impl(&dword_21C8A5000, v109, OS_LOG_TYPE_ERROR, "%s ERR: creating pruning voice profile failed with %{public}@", buf, 0x16u);
                      }
                      [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:7];
                    }
                    [(SSRLoggingAggregator *)v142 pushAnalytics];
LABEL_109:
                  }
                  _Block_object_dispose(&v171, 8);
                }
              }
              else
              {
                v40 = *MEMORY[0x263F38100];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                  _os_log_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_DEFAULT, "%s Zero implicit utterances - Bailing out", buf, 0xCu);
                }
                [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:3];
                [(SSRLoggingAggregator *)v142 pushAnalytics];
              }
            }
            else
            {
              v35 = *MEMORY[0x263F38100];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
                _os_log_error_impl(&dword_21C8A5000, v35, OS_LOG_TYPE_ERROR, "%s ERR: Low explicit utterances - Bailing out", buf, 0xCu);
              }
              [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:2];
              [(SSRLoggingAggregator *)v142 pushAnalytics];
            }
          }
          else
          {
            uint64_t v36 = *MEMORY[0x263F38100];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
              _os_log_error_impl(&dword_21C8A5000, v36, OS_LOG_TYPE_ERROR, "%s ERR: No explicit utterances!!! - Bailing out", buf, 0xCu);
            }
            [(SSRLoggingAggregator *)v142 setVoiceProfilePruningFailureReasonCode:1];
            [(SSRLoggingAggregator *)v142 pushAnalytics];
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
          _os_log_error_impl(&dword_21C8A5000, v34, OS_LOG_TYPE_ERROR, "%s ERR: Failed updating pruning cookie", buf, 0xCu);
        }
        goto LABEL_42;
      }
      uint64_t v31 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
        v32 = "%s Already pruned voice profile - Bailing out";
LABEL_25:
        _os_log_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v31 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
        v32 = "%s Pruning cookie unavailable from asset - Bailing out";
        goto LABEL_25;
      }
    }
LABEL_42:

    goto LABEL_43;
  }
  dispatch_time_t v14 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v180 = "-[SSRVoiceProfilePruner pruneVoiceProfile:forSpIdType:withAsset:]";
    id v11 = "%s ";
    id v12 = v14;
    uint32_t v13 = 12;
    goto LABEL_7;
  }
LABEL_43:
}

void __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke(void *a1, void *a2, float a3, float a4, float a5, float a6)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v12 = a2;
  *(float *)(*(void *)(a1[5] + 8) + 24) = a4;
  *(float *)(*(void *)(a1[6] + 8) + 24) = a5;
  *(float *)(*(void *)(a1[7] + 8) + 24) = a6;
  *(float *)(*(void *)(a1[8] + 8) + 24) = a3;
}

void __65__SSRVoiceProfilePruner_pruneVoiceProfile_forSpIdType_withAsset___block_invoke_9(void *a1, void *a2, float a3, float a4, float a5, float a6)
{
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  id v12 = a2;
  *(float *)(*(void *)(a1[5] + 8) + 24) = a4;
  *(float *)(*(void *)(a1[6] + 8) + 24) = a5;
  *(float *)(*(void *)(a1[7] + 8) + 24) = a6;
  *(float *)(*(void *)(a1[8] + 8) + 24) = a3;
}

@end