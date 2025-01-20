@interface _LTServerSpeakSession
- (BOOL)_hasCachedCompletion;
- (_LTServerSpeakSession)initWithEngine:(id)a3;
- (id)_createTemporaryOutputFileWithURL:(id)a3;
- (void)_callCompletionAndClearIfNeeded:(id)a3 error:(id)a4;
- (void)_playback:(id)a3 context:(id)a4 completion:(id)a5 audioStartHandler:(id)a6;
- (void)cancel;
- (void)speak:(id)a3 context:(id)a4 completion:(id)a5 audioStartHandler:(id)a6;
@end

@implementation _LTServerSpeakSession

- (_LTServerSpeakSession)initWithEngine:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LTServerSpeakSession;
  v6 = [(_LTServerSpeakSession *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_engine, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.translationd.playback", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v10 = v7;
  }

  return v7;
}

- (id)_createTemporaryOutputFileWithURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = NSTemporaryDirectory();
    id v5 = [MEMORY[0x263F08C38] UUID];
    v6 = [v5 UUIDString];
    v7 = [v4 stringByAppendingPathComponent:v6];

    dispatch_queue_t v8 = [NSURL fileURLWithPath:v7 isDirectory:1];
    v9 = NSURL;
    v10 = [v3 lastPathComponent];

    v11 = [v9 fileURLWithPath:v10 relativeToURL:v8];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)_playback:(id)a3 context:(id)a4 completion:(id)a5 audioStartHandler:(id)a6
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = (void (**)(id, void *, id))a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v14 = [(_LTServerSpeakSession *)self _hasCachedCompletion];
  v15 = _LTOSLogTTS();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2600DC000, v15, OS_LOG_TYPE_INFO, "Prepping playback for audio data of request", buf, 2u);
    }
    v17 = [v11 outputFileURL];
    v18 = [(_LTServerSpeakSession *)self _createTemporaryOutputFileWithURL:v17];

    [v10 writeToURL:v18];
    uint64_t v85 = 0;
    *(_OWORD *)buf = 0u;
    long long v84 = 0u;
    if (v10)
    {
      [v10 asbd];
      [v10 asbd];
      if (DWORD2(v80) == 1819304813)
      {
        v68 = [v10 packetDescriptions];
        v19 = [v10 rawData];
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v82 = 0;
      long long v80 = 0uLL;
      long long v81 = 0uLL;
    }
    v70 = v18;
    id v67 = v13;
    v20 = [v10 rawData];
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v78 = 0;
    uint64_t v79 = 0;
    if ([v10 packetCount] < 1)
    {
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      do
      {
        v25 = [v10 packetDescriptions];
        objc_msgSend(v25, "getBytes:range:", &v78, v22, 16);

        v26 = (void *)MEMORY[0x263EFF8F8];
        uint64_t v27 = [v20 bytes];
        v28 = [v26 dataWithBytes:v27 + v78 length:HIDWORD(v79)];
        [v21 addObject:v28];
        v24 += [v28 length];

        ++v23;
        v22 += 16;
      }
      while ([v10 packetCount] > v23);
    }
    v29 = objc_alloc_init(_LTAudioDecoder);
    v69 = v12;
    if (v10)
    {
      [v10 asbd];
    }
    else
    {
      uint64_t v77 = 0;
      memset(v76, 0, sizeof(v76));
    }
    id v75 = 0;
    *(_OWORD *)v86 = _LTAudioFormat48khzPCM;
    *(_OWORD *)&v86[16] = *(_OWORD *)&qword_26027B738;
    uint64_t v87 = 16;
    v30 = -[_LTAudioDecoder decodeChunks:from:to:outError:](v29, "decodeChunks:from:to:outError:", v21, v76, v86, &v75, 0x100000002, unk_26027B740, _LTAudioFormat48khzPCM);
    id v31 = v75;
    v32 = _LTOSLogTTS();
    v33 = v32;
    if (v31)
    {
      id v13 = v67;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.5((uint64_t)v31, v33, v34, v35, v36, v37, v38, v39);
      }
      v69[2](v69, v70, v31);
    }
    else
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v40 = v33;
        uint64_t v41 = [v30 length];
        *(_DWORD *)v86 = 134218240;
        *(void *)&v86[4] = v24;
        *(_WORD *)&v86[12] = 2048;
        *(void *)&v86[14] = v41;
        _os_log_impl(&dword_2600DC000, v40, OS_LOG_TYPE_INFO, "Converted %ld bytes to %ld bytes", v86, 0x16u);
      }
      *(_OWORD *)buf = v66;
      long long v84 = v65;
      uint64_t v85 = 16;
      id v13 = v67;
    }

    if (v31)
    {
      v42 = v30;
      objc_super v12 = v69;
      v18 = v70;
LABEL_40:

      goto LABEL_41;
    }
    v68 = 0;
    v19 = v30;
    objc_super v12 = v69;
    v18 = v70;
LABEL_29:
    v42 = v19;
    unint64_t v43 = [v19 length];
    unint64_t v44 = v43 / DWORD2(v84);
    double v45 = (double)v44 / *(double *)buf;
    v46 = _LTOSLogTTS();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
      -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:].cold.4(v44, v46, v45);
    }
    v47 = [_LTPlaybackService alloc];
    *(_OWORD *)v86 = *(_OWORD *)buf;
    *(_OWORD *)&v86[16] = v84;
    uint64_t v87 = v85;
    v48 = [(_LTPlaybackService *)v47 initWithContext:v11 ASBD:v86];
    player = self->_player;
    self->_player = v48;

    v50 = self->_player;
    if (v50)
    {
      v51 = [(_LTPlaybackService *)v50 start];
      if (!v51)
      {
        BOOL v60 = [(_LTServerSpeakSession *)self _hasCachedCompletion];
        v61 = _LTOSLogTTS();
        v62 = v61;
        if (v60)
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
            -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:]();
          }
          id v63 = [(_LTPlaybackService *)self->_player enqueue:v42 packetCount:0 packetDescriptions:0];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __72___LTServerSpeakSession__playback_context_completion_audioStartHandler___block_invoke;
          block[3] = &unk_265547EC0;
          id v73 = v13;
          id v72 = v10;
          double v74 = v45;
          dispatch_async(MEMORY[0x263EF83A0], block);
          [(_LTPlaybackService *)self->_player flushAndStop];
          [(_LTPlaybackService *)self->_player reset];
          v64 = _LTOSLogTTS();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_2600DC000, v64, OS_LOG_TYPE_INFO, "Finished TTS playback", v86, 2u);
          }
          v12[2](v12, v18, 0);
        }
        else
        {
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v86 = 0;
            _os_log_impl(&dword_2600DC000, v62, OS_LOG_TYPE_INFO, "Not playing back audio for server speak session because it was previously cancelled since this request started", v86, 2u);
          }
          v12[2](v12, 0, 0);
        }
        goto LABEL_39;
      }
      v52 = _LTOSLogTTS();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:]((uint64_t)v51, v52, v53, v54, v55, v56, v57, v58);
      }
    }
    else
    {
      v59 = _LTOSLogTTS();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        -[_LTServerSpeakSession _playback:context:completion:audioStartHandler:]();
      }
      v51 = objc_msgSend(MEMORY[0x263F087E8], "lt_internalTTSCreationError");
    }
    v12[2](v12, v18, v51);
LABEL_39:

    goto LABEL_40;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2600DC000, v15, OS_LOG_TYPE_INFO, "Not playing back audio for server speak session because it was previously cancelled", buf, 2u);
  }
  v12[2](v12, 0, 0);
LABEL_41:
}

- (void)speak:(id)a3 context:(id)a4 completion:(id)a5 audioStartHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = self->_queue;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68___LTServerSpeakSession_speak_context_completion_audioStartHandler___block_invoke;
  block[3] = &unk_265547F60;
  objc_copyWeak(&v26, &location);
  id v21 = v10;
  id v22 = v11;
  uint64_t v23 = v14;
  id v24 = v12;
  id v25 = v13;
  id v15 = v13;
  BOOL v16 = v14;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(v16, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  id v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2600DC000, v3, OS_LOG_TYPE_INFO, "Asked to cancel speak session", v4, 2u);
  }
  [(_LTTranslationEngine *)self->_engine endAudio];
  [(_LTPlaybackService *)self->_player stop];
  [(_LTServerSpeakSession *)self _callCompletionAndClearIfNeeded:0 error:0];
}

- (BOOL)_hasCachedCompletion
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v6 = __45___LTServerSpeakSession__hasCachedCompletion__block_invoke;
  v7 = &unk_265547F88;
  dispatch_queue_t v8 = self;
  v9 = &v10;
  id v3 = v5;
  os_unfair_lock_lock(p_lock);
  v6((uint64_t)v3);

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (void)_callCompletionAndClearIfNeeded:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__9;
  v20 = __Block_byref_object_dispose__9;
  id v21 = 0;
  p_lock = &self->_lock;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  uint64_t v12 = __63___LTServerSpeakSession__callCompletionAndClearIfNeeded_error___block_invoke;
  char v13 = &unk_265547FB0;
  BOOL v14 = self;
  id v15 = &v16;
  v9 = v11;
  os_unfair_lock_lock(p_lock);
  v12((uint64_t)v9);

  os_unfair_lock_unlock(p_lock);
  uint64_t v10 = v17[5];
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v6, v7);
  }
  _Block_object_dispose(&v16, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

- (void)_playback:context:completion:audioStartHandler:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2600DC000, v0, OS_LOG_TYPE_ERROR, "Failed to create playback service", v1, 2u);
}

- (void)_playback:context:completion:audioStartHandler:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_2600DC000, v0, v1, "Enqueueing TTS data for playback", v2, v3, v4, v5, v6);
}

- (void)_playback:(uint64_t)a3 context:(uint64_t)a4 completion:(uint64_t)a5 audioStartHandler:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_playback:(double)a3 context:completion:audioStartHandler:.cold.4(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  double v4 = a3;
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_2600DC000, a2, OS_LOG_TYPE_DEBUG, "Duration: %f. Total number of frames: %ld", (uint8_t *)&v3, 0x16u);
}

- (void)_playback:(uint64_t)a3 context:(uint64_t)a4 completion:(uint64_t)a5 audioStartHandler:(uint64_t)a6 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end