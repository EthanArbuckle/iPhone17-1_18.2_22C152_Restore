@interface SSRSpeakerProfileEmbeddingExtractor
+ (void)_extractWithModelContext:(id)a3 completion:(id)a4;
+ (void)extractPSRVoiceProfileWithContext:(id)a3 completion:(id)a4;
+ (void)extractProfileData:(id)a3 completion:(id)a4;
+ (void)extractSATVoiceProfileWithContext:(id)a3 completion:(id)a4;
@end

@implementation SSRSpeakerProfileEmbeddingExtractor

+ (void)extractProfileData:(id)a3 completion:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (os_log_t *)MEMORY[0x263F38100];
  v8 = *MEMORY[0x263F38100];
  v9 = *MEMORY[0x263F38100];
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      v11 = [v5 path];
      *(_DWORD *)buf = 136315394;
      v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
      __int16 v55 = 2112;
      *(void *)v56 = v11;
      _os_log_impl(&dword_21C8A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Extracting profile from : %@", buf, 0x16u);
    }
    v12 = (void *)MEMORY[0x263EFF950];
    v13 = [v5 path];
    v14 = [v12 inputStreamWithFileAtPath:v13];

    if (v14)
    {
      [v14 open];
      [v14 read:v57 maxLength:16];
      for (uint64_t i = 0; i != 16; ++i)
      {
        int v16 = v57[i];
        int v17 = aSpkeratV001[i];
        if (v16 != v17)
        {
          v23 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
            __int16 v55 = 1024;
            *(_DWORD *)v56 = (char)v16;
            *(_WORD *)&v56[4] = 1024;
            *(_DWORD *)&v56[6] = (char)v17;
            _os_log_error_impl(&dword_21C8A5000, v23, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : cookie match failed %d %d", buf, 0x18u);
          }
          [v14 close];
          v20 = (void *)MEMORY[0x263F087E8];
          v21 = &unk_26CD44E00;
          goto LABEL_25;
        }
      }
      int v52 = 0;
      [v14 read:&v52 maxLength:4];
      int v51 = 0;
      [v14 read:&v51 maxLength:4];
      unsigned int v50 = 0;
      [v14 read:&v50 maxLength:4];
      unsigned int v49 = 0;
      [v14 read:&v49 maxLength:4];
      unsigned int v48 = 0;
      [v14 read:&v48 maxLength:4];
      int v47 = 0;
      [v14 read:&v47 maxLength:4];
      unsigned int v46 = 0;
      [v14 read:&v46 maxLength:4];
      unsigned int v45 = 0;
      [v14 read:&v45 maxLength:4];
      int v44 = 0;
      [v14 read:&v44 maxLength:4];
      int v43 = 0;
      [v14 read:&v43 maxLength:4];
      [v14 read:&v43 maxLength:4];
      [v14 read:&v43 maxLength:4];
      [v14 read:&v43 maxLength:4];
      [v14 read:&v43 maxLength:4];
      [v14 read:&v43 maxLength:4];
      [v14 read:&v43 maxLength:4];
      if (v51 != 1)
      {
        v24 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v24, OS_LOG_TYPE_ERROR, "%s cannot read incompatible version", buf, 0xCu);
        }
        [v14 close];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44E28;
        goto LABEL_25;
      }
      uint64_t v18 = v50;
      if (v50 >= 0x989681)
      {
        v19 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v19, OS_LOG_TYPE_ERROR, "%s header specifies implausible filesize", buf, 0xCu);
        }
        [v14 close];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44E50;
        goto LABEL_25;
      }
      if (!v49)
      {
        v27 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v27, OS_LOG_TYPE_ERROR, "%s nil vector", buf, 0xCu);
        }
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44E78;
        goto LABEL_25;
      }
      if (!v48)
      {
        v30 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v30, OS_LOG_TYPE_ERROR, "%s Empty profile", buf, 0xCu);
        }
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44EA0;
        goto LABEL_25;
      }
      if (v46 < v49)
      {
        v26 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v26, OS_LOG_TYPE_ERROR, "%s stride is less than width", buf, 0xCu);
        }
        [v14 close];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44EC8;
        goto LABEL_25;
      }
      if (v45 < v48)
      {
        v31 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v31, OS_LOG_TYPE_ERROR, "%s stride is less than width", buf, 0xCu);
        }
        [v14 close];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44EF0;
        goto LABEL_25;
      }
      if (v44)
      {
        v32 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v32, OS_LOG_TYPE_ERROR, "%s only float32 dataformat supported", buf, 0xCu);
        }
        [v14 close];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44F18;
        goto LABEL_25;
      }
      if (v50 != 4 * v46 * v45)
      {
        v40 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v40, OS_LOG_TYPE_ERROR, "%s unexpected file size", buf, 0xCu);
        }
        [v14 close];
        v20 = (void *)MEMORY[0x263F087E8];
        v21 = &unk_26CD44F40;
        goto LABEL_25;
      }
      id v33 = [MEMORY[0x263EFF990] dataWithLength:v50];
      uint64_t v34 = objc_msgSend(v14, "read:maxLength:", objc_msgSend(v33, "mutableBytes"), v18);
      [v14 close];
      id v25 = v33;
      v35 = (float *)[v25 mutableBytes];
      uint64_t v36 = v46 * v45;
      if (v36)
      {
        while (1)
        {
          float v37 = fabsf(*v35);
          if (v37 >= INFINITY && v37 <= INFINITY) {
            break;
          }
          ++v35;
          if (!--v36) {
            goto LABEL_54;
          }
        }
        v38 = (void *)MEMORY[0x263F087E8];
        v39 = &unk_26CD44F68;
      }
      else
      {
LABEL_54:
        if (v34 == v50)
        {
          (*((void (**)(id, id, void, void, void))v6 + 2))(v6, v25, v48, v49, 0);
          goto LABEL_26;
        }
        v41 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_21C8A5000, v41, OS_LOG_TYPE_ERROR, "%s cannot read enough data from file:", buf, 0xCu);
        }
        v38 = (void *)MEMORY[0x263F087E8];
        v39 = &unk_26CD44F90;
      }
      v42 = [v38 errorWithDomain:@"com.apple.speakerrecognition" code:759 userInfo:v39];
      (*((void (**)(id, void, void, void, void *))v6 + 2))(v6, 0, 0, 0, v42);
    }
    else
    {
      os_log_t v22 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        v28 = v22;
        v29 = [v5 path];
        *(_DWORD *)buf = 136315394;
        v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
        __int16 v55 = 2112;
        *(void *)v56 = v29;
        _os_log_error_impl(&dword_21C8A5000, v28, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : inputStream = nil, %@", buf, 0x16u);
      }
      v20 = (void *)MEMORY[0x263F087E8];
      v21 = &unk_26CD44DD8;
LABEL_25:
      id v25 = [v20 errorWithDomain:@"com.apple.speakerrecognition" code:759 userInfo:v21];
      (*((void (**)(id, void, void, void, id))v6 + 2))(v6, 0, 0, 0, v25);
    }
LABEL_26:
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
      _os_log_error_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : profileURL = nil", buf, 0xCu);
    }
    (*((void (**)(id, void, void, void, void))v6 + 2))(v6, 0, 0, 0, 0);
  }
}

+ (void)_extractWithModelContext:(id)a3 completion:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v19 = v6;
  v20 = (void (**)(void))a4;
  if (v6)
  {
    v7 = [v6 voiceProfilesModelFilePathsExclave];
    uint64_t v18 = v7;
    v8 = v7;
    if (v7 && [v7 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__876;
      v40 = __Block_byref_object_dispose__877;
      id v41 = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      int v35 = 0;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      int v33 = 0;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__876;
      v30 = __Block_byref_object_dispose__877;
      id v31 = 0;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v9 = [v8 allValues];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v36 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v23;
LABEL_6:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = NSURL;
          uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * v12) path];
          v15 = [v13 fileURLWithPath:v14];

          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __75__SSRSpeakerProfileEmbeddingExtractor__extractWithModelContext_completion___block_invoke;
          v21[3] = &unk_264428CF8;
          v21[4] = &buf;
          v21[5] = v34;
          v21[6] = v32;
          v21[7] = &v26;
          [a1 extractProfileData:v15 completion:v21];
          LOBYTE(v14) = v27[5] == 0;

          if (v14) {
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v36 count:16];
            if (v10) {
              goto LABEL_6;
            }
            break;
          }
        }
      }

      if (v20) {
        v20[2]();
      }
      _Block_object_dispose(&v26, 8);

      _Block_object_dispose(v32, 8);
      _Block_object_dispose(v34, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      int v16 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "+[SSRSpeakerProfileEmbeddingExtractor _extractWithModelContext:completion:]";
        _os_log_error_impl(&dword_21C8A5000, v16, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : modelContext = nil", (uint8_t *)&buf, 0xCu);
      }
      ((void (*)(void (**)(void), void, void, void, void))v20[2])(v20, 0, 0, 0, 0);
    }
  }
  else
  {
    int v17 = *MEMORY[0x263F38100];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "+[SSRSpeakerProfileEmbeddingExtractor _extractWithModelContext:completion:]";
      _os_log_error_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : model context is nil", (uint8_t *)&buf, 0xCu);
    }
    ((void (*)(void (**)(void), void, void, void, void))v20[2])(v20, 0, 0, 0, 0);
  }
}

void __75__SSRSpeakerProfileEmbeddingExtractor__extractWithModelContext_completion___block_invoke(void *a1, void *a2, int a3, int a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  uint64_t v11 = *(void *)(a1[4] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
  id v15 = v9;

  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = a3;
  *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a4;
  uint64_t v13 = *(void *)(a1[7] + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v10;
}

+ (void)extractSATVoiceProfileWithContext:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = [v6 modelsContext];
      id v9 = +[SSRUtils stringForSpeakerRecognizerType:2];
      id v10 = [v8 objectForKeyedSubscript:v9];

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __84__SSRSpeakerProfileEmbeddingExtractor_extractSATVoiceProfileWithContext_completion___block_invoke;
      v12[3] = &unk_264428CD0;
      id v13 = v7;
      [a1 _extractWithModelContext:v10 completion:v12];
    }
    else
    {
      uint64_t v11 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v15 = "+[SSRSpeakerProfileEmbeddingExtractor extractSATVoiceProfileWithContext:completion:]";
        _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : context is nil", buf, 0xCu);
      }
      (*((void (**)(id, void, void, void, uint64_t, void))v7 + 2))(v7, 0, 0, 0, 2, 0);
    }
  }
}

uint64_t __84__SSRSpeakerProfileEmbeddingExtractor_extractSATVoiceProfileWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)extractPSRVoiceProfileWithContext:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      v8 = [v6 modelsContext];
      id v9 = +[SSRUtils stringForSpeakerRecognizerType:1];
      id v10 = [v8 objectForKeyedSubscript:v9];

      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __84__SSRSpeakerProfileEmbeddingExtractor_extractPSRVoiceProfileWithContext_completion___block_invoke;
      v12[3] = &unk_264428CD0;
      id v13 = v7;
      [a1 _extractWithModelContext:v10 completion:v12];
    }
    else
    {
      uint64_t v11 = *MEMORY[0x263F38100];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        id v15 = "+[SSRSpeakerProfileEmbeddingExtractor extractPSRVoiceProfileWithContext:completion:]";
        _os_log_error_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : context is nil", buf, 0xCu);
      }
      (*((void (**)(id, void, void, void, uint64_t, void))v7 + 2))(v7, 0, 0, 0, 1, 0);
    }
  }
}

uint64_t __84__SSRSpeakerProfileEmbeddingExtractor_extractPSRVoiceProfileWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end