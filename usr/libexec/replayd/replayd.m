id sub_100002300(uint64_t a1)
{
  unsigned int *v1;
  id v2;
  uint64_t vars8;

  v1 = *(unsigned int **)(a1 + 32);
  v2 = [v1 getStateWithToken:v1[2]];

  return [v1 thermalPressureDidChangeWithThermalLevel:v2];
}

void sub_100002D34(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004ED7C(v2);
    }
    NSLog(@"error = %@", v2);
  }
}

void sub_100002E74(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) path];
  if ([*(id *)(a1 + 40) fileExistsAtPath:v2])
  {
    v3 = *(void **)(a1 + 40);
    id v7 = 0;
    unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v7];
    id v5 = v7;
    if ((v4 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004EDF4(v5);
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void sub_100003034(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) path];
  LODWORD(v2) = [v2 fileExistsAtPath:v3];

  if (v2) {
    [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  id v16 = 0;
  [v6 moveItemAtURL:v4 toURL:v5 error:&v16];
  id v7 = v16;
  if (v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004EE6C((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v15 = *(void *)(a1 + 56);
  if (v15) {
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v7);
  }
}

void sub_1000031B0(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  v3 = [*(id *)(a1 + 32) _srTempPath];
  id v24 = 0;
  uint64_t v4 = [v2 contentsOfDirectoryAtPath:v3 error:&v24];
  id v5 = v24;

  uint64_t v6 = +[NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] %@", *(void *)(a1 + 40)];
  v17 = v4;
  id v7 = [v4 filteredArrayUsingPredicate:v6];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        uint64_t v12 = v5;
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004EEE0(buf, (int)v5, v26);
        }
        uint64_t v14 = *(void **)(a1 + 32);
        uint64_t v15 = [v14 _srTempPath];
        id v16 = +[NSString stringWithFormat:@"%@/%@", v15, v13];
        id v19 = v12;
        [v14 removeItemAtPath:v16 error:&v19];
        id v5 = v19;
      }
      id v9 = [obj countByEnumeratingWithState:&v20 objects:v27 count:16];
    }
    while (v9);
  }
}

void sub_1000035AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100004A98(uint64_t a1)
{
  id v2 = *(unsigned char **)(a1 + 32);
  if (!v2[88])
  {
    if (dword_100099BB8 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136446466;
        v18 = "-[RPMicAudioCaptureManager startMicrophoneCaptureWithOutput:didStartHandler:]_block_invoke";
        __int16 v19 = 1024;
        int v20 = 146;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v17, 0x12u);
      }
      id v2 = *(unsigned char **)(a1 + 32);
    }
    [v2 startCaptureSession];
    [*(id *)(*(void *)(a1 + 32) + 64) setUsesApplicationAudioSession:1];
    [*(id *)(*(void *)(a1 + 32) + 64) setAutomaticallyConfiguresApplicationAudioSession:0];
    v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = objc_retainBlock(v3);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 16);
      *(void *)(v5 + 16) = v4;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 88) = 1;
    id v7 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    uint64_t v8 = +[AVCaptureDeviceInput deviceInputWithDevice:v7 error:0];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 72);
    *(void *)(v9 + 72) = v8;

    if ([*(id *)(*(void *)(a1 + 32) + 64) canAddInput:*(void *)(*(void *)(a1 + 32) + 72)])[*(id *)(*(void *)(a1 + 32) + 64) addInput:*(void *)(*(void *)(a1 + 32) + 72)]; {
    id v11 = objc_alloc_init((Class)AVCaptureAudioDataOutput);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 80);
    *(void *)(v12 + 80) = v11;

    [*(id *)(*(void *)(a1 + 32) + 80) setSampleBufferDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];
    if ([*(id *)(*(void *)(a1 + 32) + 64) canAddOutput:*(void *)(*(void *)(a1 + 32) + 80)])[*(id *)(*(void *)(a1 + 32) + 64) addOutput:*(void *)(*(void *)(a1 + 32) + 80)]; {
    id v14 = objc_retainBlock(*(id *)(a1 + 48));
    }
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 136);
    *(void *)(v15 + 136) = v14;

    if ([*(id *)(*(void *)(a1 + 32) + 64) isRunning])
    {
      [*(id *)(a1 + 32) dispatchedDidStartHandler];
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 64) addObserver:*(void *)(a1 + 32) forKeyPath:@"running" options:0 context:0];
      [*(id *)(*(void *)(a1 + 32) + 64) startRunning];
    }
  }
}

void sub_100004D58(void *a1)
{
}

void *sub_100004DD4(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 88))
  {
    id v2 = result;
    if (dword_100099BB8 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136446466;
        uint64_t v6 = "-[RPMicAudioCaptureManager stopMicrophoneCapture]_block_invoke";
        __int16 v7 = 1024;
        int v8 = 208;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
      }
      uint64_t v1 = v2[4];
    }
    *(unsigned char *)(v1 + 88) = 0;
    uint64_t v3 = v2[4];
    id v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = 0;

    [*(id *)(v2[4] + 64) removeInput:*(void *)(v2[4] + 72)];
    return [*(id *)(v2[4] + 64) removeOutput:*(void *)(v2[4] + 80)];
  }
  return result;
}

void sub_100004F44(void *a1)
{
}

void sub_1000053BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = 0;
  }
}

void sub_1000054B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100005830(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    int v8 = "-[RPMovieWriter startWritingHandler:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 150;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  uint64_t v2 = +[NSFileManager defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) outputURL];
  [v2 _srRemoveFile:v3 completion:&stru_100084E68];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005A04;
  v5[3] = &unk_100084E90;
  id v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v4 setUpAssetWriterWithHandler:v5];
}

void sub_1000059A8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004F234();
  }
}

uint64_t sub_100005A04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100005B04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_100005B1C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  v6[0] = *(_OWORD *)(a1 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a1 + 88);
  id result = [v2 dispatchedAppendVideoSampleBuffer:v3 withWindowTransform:v6];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100005C08(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedAppendAudio1SampleBuffer:*(void *)(a1 + 40)];
}

id sub_100005CA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedAppendAudio2SampleBuffer:*(void *)(a1 + 40)];
}

void sub_100005E0C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFinishingWriting])
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 254;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer finished nothing to do", (uint8_t *)&buf, 0x12u);
    }
    uint64_t v2 = *(void *)(a1 + 40);
    if (v2) {
      (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
    }
    return;
  }
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(void *)(a1 + 32) + 120));
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(void *)(a1 + 32) + 104));
  CMBufferQueueReset(*(CMBufferQueueRef *)(*(void *)(a1 + 32) + 112));
  uint64_t v3 = [*(id *)(a1 + 32) assetWriter];

  if (v3)
  {
    if ([*(id *)(a1 + 32) didProcessFirstSample])
    {
      long long v4 = [*(id *)(a1 + 32) assetWriter];
      id v5 = [v4 status];

      if (v5 == (id)1)
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.value) = 136446466;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
          LOWORD(buf.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.flags + 2) = 215;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer in correct state, attempting to finish writing", (uint8_t *)&buf, 0x12u);
        }
        id v6 = [*(id *)(a1 + 32) assetWriter];
        __int16 v7 = *(void **)(a1 + 32);
        if (v7) {
          [v7 trimVideoPresentationTime];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        long long v18 = *(_OWORD *)&kCMTimeInvalid.value;
        *(_OWORD *)&buf.value = *(_OWORD *)&kCMTimeInvalid.value;
        CMTimeEpoch epoch = kCMTimeInvalid.epoch;
        buf.CMTimeEpoch epoch = epoch;
        if (CMTimeCompare(&time1, &buf))
        {
          id v14 = *(void **)(a1 + 32);
          if (v14) {
            [v14 trimVideoPresentationTime];
          }
          else {
            memset(v25, 0, sizeof(v25));
          }
          [v6 endSessionAtSourceTime:v25, v18];
          uint64_t v15 = *(void **)(a1 + 32);
          long long v23 = v18;
          CMTimeEpoch v24 = epoch;
          [v15 setTrimVideoPresentationTime:&v23];
        }
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_10000628C;
        v19[3] = &unk_100084F30;
        id v20 = v6;
        id v16 = *(id *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = v16;
        id v17 = v6;
        [v17 finishWritingWithCompletionHandler:v19];
      }
      else
      {
        if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10004F2B8();
        }
        uint64_t v11 = *(void *)(a1 + 40);
        if (v11)
        {
          uint64_t v12 = +[NSError _rpUserErrorForCode:-5825 userInfo:0];
          (*(void (**)(uint64_t, void, void *))(v11 + 16))(v11, 0, v12);
        }
        [*(id *)(a1 + 32) setDidProcessFirstSample:0];
      }
      [*(id *)(a1 + 32) setIsFinishingWriting:1, v18];
      return;
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F33C();
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = -5822;
      goto LABEL_25;
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 136446466;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
      LOWORD(buf.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.flags + 2) = 198;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d no asset writer object", (uint8_t *)&buf, 0x12u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      uint64_t v9 = -5824;
LABEL_25:
      int v10 = +[NSError _rpUserErrorForCode:v9 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
    }
  }
}

void sub_10000628C(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*(id *)(a1 + 32) status];
    *(_DWORD *)id v6 = 136446722;
    *(void *)&v6[4] = "-[RPMovieWriter finishWritingWithHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 227;
    __int16 v7 = 1024;
    BOOL v8 = v2 == (id)3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer state: %i", v6, 0x18u);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "status", *(_OWORD *)v6) == (id)3)
  {
    uint64_t v3 = +[NSError _rpUserErrorForCode:-5823 userInfo:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([*(id *)(a1 + 32) status] == (id)3)
  {
    long long v4 = 0;
  }
  else
  {
    long long v4 = [*(id *)(a1 + 32) outputURL];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void *, void *))(v5 + 16))(v5, v4, v3);
  }
  [*(id *)(a1 + 40) setDidProcessFirstSample:0];
}

void sub_100006574(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F3C0();
    }
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      BOOL v8 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v8();
    }
  }
  else
  {
    if (!v5)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136446466;
        uint64_t v15 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]_block_invoke";
        __int16 v16 = 1024;
        int v17 = 289;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d asset writer finished nothing to do", buf, 0x12u);
      }
      BOOL v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_13;
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006750;
    v12[3] = &unk_100084E90;
    id v13 = *(id *)(a1 + 48);
    [v9 saveVideoToCameraRoll:v5 sessionID:v10 mixAudioTracks:v11 handler:v12];
  }
}

void sub_100006750(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F444();
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      BOOL v8 = "-[RPMovieWriter finishWritingAndSaveToCameraRollWithSessionID:mixAudioTracks:handler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 281;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }
}

void sub_100006990(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006A74;
  v4[3] = &unk_100084F80;
  id v7 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 56);
  [v2 _srRemoveFile:v3 completion:v4];
}

void sub_100006A74(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v7 = +[NSError _rpUserErrorForCode:-5827 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, v7);
  }
  else
  {
    uint64_t v4 = +[AVAsset assetWithURL:*(void *)(a1 + 32)];
    id v5 = [objc_alloc((Class)AVAssetExportSession) initWithAsset:v4 presetName:AVAssetExportPresetPassthrough];
    [v5 setOutputURL:*(void *)(a1 + 40)];
    [v5 setOutputFileType:AVFileTypeMPEG4];
    memset(&v19, 0, sizeof(v19));
    CMTimeMakeWithSeconds(&v19, *(Float64 *)(a1 + 56), 1);
    memset(&v18, 0, sizeof(v18));
    if (v4) {
      [v4 duration];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTimeMakeWithSeconds(&rhs, *(Float64 *)(a1 + 64), 1);
    CMTimeSubtract(&v18, &lhs, &rhs);
    memset(&v15, 0, sizeof(v15));
    v13.CMTime start = v18;
    CMTime start = v19;
    CMTimeSubtract(&v15, &v13.start, &start);
    memset(&v13, 0, sizeof(v13));
    CMTime start = v19;
    CMTime duration = v15;
    CMTimeRangeMake(&v13, &start, &duration);
    CMTimeRange v11 = v13;
    [v5 setTimeRange:&v11];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100006CD8;
    v8[3] = &unk_100084EB8;
    id v9 = v5;
    id v10 = *(id *)(a1 + 48);
    id v6 = v5;
    [v6 exportAsynchronouslyWithCompletionHandler:v8];
  }
}

void sub_100006CD8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) status];
  if (v3 == (id)5)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446466;
      id v9 = "-[RPMovieWriter trimMovieWithURL:startClipDuration:endClipDuration:outputFileURL:handler:]_block_invoke";
      __int16 v10 = 1024;
      int v11 = 327;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Export Trim Video Cancelled", (uint8_t *)&v8, 0x12u);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = -5828;
    goto LABEL_11;
  }
  if (v3 == (id)4)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F4C8(v2);
    }
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = -5826;
LABEL_11:
    id v6 = +[NSError _rpUserErrorForCode:v5 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v6);
    goto LABEL_16;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    id v9 = "-[RPMovieWriter trimMovieWithURL:startClipDuration:endClipDuration:outputFileURL:handler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 332;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Export Trim succeeded", (uint8_t *)&v8, 0x12u);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  id v6 = [*(id *)(a1 + 32) outputURL];
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v6, 0);
LABEL_16:
}

void sub_100008284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000082A4(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F678(v2);
    }
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[RPMovieWriter dispatchedAppendVideoSampleBuffer:withWindowTransform:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 552;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Asset writer output file removed", (uint8_t *)&v3, 0x12u);
  }
}

void sub_1000083A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004F700(v3);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 72);
    v7[0] = *(_OWORD *)(a1 + 56);
    v7[1] = v6;
    v7[2] = *(_OWORD *)(a1 + 88);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 appendInitialSampleBuffer:v5 withTransform:v7];
  }
}

void sub_100009270(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)CMTime buf = 136446722;
    id v9 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 716;
    __int16 v12 = 1024;
    int v13 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start Save to Photos, mixAudioTracks=%d", buf, 0x18u);
  }
  *(void *)(*(void *)(a1 + 32) + 128) = 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000093F0;
  _OWORD v6[3] = &unk_100085040;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  +[RPPhotosUtility exportVideoToPhotosAsynchronously:v4 mixAudioTracks:v3 completionHandler:v6];
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void sub_1000093F0(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FB24();
    }
    id v9 = +[RPFeatureFlagUtility sharedInstance];
    unsigned int v10 = [v9 systemBannerEnabled];

    if (v10)
    {
      int v11 = +[RPAngelProxy sharedInstance];
      [v11 hideAndStopRecordingBanner];
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136446722;
      CMTimeEpoch v24 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 730;
      __int16 v27 = 2048;
      double v28 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds", buf, 0x1Cu);
    }
    __int16 v12 = +[RPFeatureFlagUtility sharedInstance];
    unsigned __int8 v13 = [v12 systemBannerEnabled];

    if (v13)
    {
      id v14 = +[RPAngelProxy sharedInstance];
      CMTime v15 = [*(id *)(a1 + 32) createAssetURLFromPhotosIdentifier:v8];
      int v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      CMTime v19 = sub_100009654;
      id v20 = &unk_100085018;
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a1 + 32);
      id v22 = v8;
      [v14 showSavedToPhotosBannerWithPhotosURL:v15 identifier:v22 sessionID:v16 completionHandler:&v17];
    }
    else
    {
      [*(id *)(a1 + 32) displayScreenRecorderNotificationWithURL:v8];
    }
  }
  [*(id *)(a1 + 32) setDurationInSeconds:a4, v17, v18, v19, v20, v21];
}

void sub_100009654(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      uint64_t v5 = "-[RPMovieWriter saveVideoToCameraRoll:sessionID:mixAudioTracks:handler:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 740;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Could not show Saved to Photos Banner, show screen notification", (uint8_t *)&v4, 0x12u);
    }
    [*(id *)(a1 + 32) displayScreenRecorderNotificationWithURL:*(void *)(a1 + 40)];
  }
}

void sub_100009F08(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = +[NSArray arrayWithObjects:&v2 count:1];
  +[PHAssetChangeRequest deleteAssets:v1];
}

void sub_10000A2D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_10000A2EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void sub_10000AC9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10004FD34(v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136446466;
      uint64_t v16 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 78;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d beginExtensionRequestWithInputItems returned", buf, 0x12u);
    }
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [*(id *)(*(void *)(a1 + 32) + 48) _extensionContextForUUID:v5];
    uint64_t v9 = [v8 _auxiliaryConnection];
    unsigned int v10 = [v9 remoteObjectProxy];

    if (v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 72);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000AEEC;
      v13[3] = &unk_100084E28;
      __int16 v12 = v7;
      id v14 = v12;
      [v10 setEndpoint:v11 completionHandler:v13];
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10004FCB0();
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

intptr_t sub_10000AEEC(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPBroadcastExtensionProxy establishConnectionWithHandler:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Remote endpoint set.", (uint8_t *)&v3, 0x12u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000B278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B298(uint64_t a1)
{
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004FDD0();
  }
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [WeakRetained errorHandler];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 errorHandler];
    dispatch_semaphore_t v7 = +[NSError _rpUserErrorForCode:-5808 userInfo:&__NSDictionary0__struct];
    ((void (**)(void, void *))v6)[2](v6, v7);
  }
}

void sub_10000B370(id a1)
{
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004FE54();
  }
}

void sub_10000B934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B954(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10004FED8(v3);
  }
  int v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  int v6 = [WeakRetained errorHandler];

  if (v6)
  {
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 errorHandler];
    uint64_t v9 = +[NSError _rpUserErrorForCode:-5808 userInfo:&__NSDictionary0__struct];
    ((void (**)(void, void *))v8)[2](v8, v9);
  }
}

id sub_10000CFA4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) showStatusBarWithPid:*(unsigned int *)(*(void *)(a1 + 32) + 8)];
}

uint64_t sub_10000E198(uint64_t result, int a2, CFDictionaryRef theDict)
{
  if (a2 == 1)
  {
    uint64_t v3 = result;
    uint64_t v5 = 0;
    value = 0;
    id result = CFDictionaryGetValueIfPresent(theDict, kAKSInfoExtendedLockState, (const void **)&value);
    if (result)
    {
      CFTypeID v4 = CFGetTypeID(value);
      id result = CFNumberGetTypeID();
      if (v4 == result)
      {
        id result = CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, &v5);
        if (result)
        {
          if (v5 == 2)
          {
            if (dword_100099BB8 <= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CMTime buf = 136446466;
              id v8 = "-[RPSession setUpDeviceLockNotifications]_block_invoke";
              __int16 v9 = 1024;
              int v10 = 681;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d device locking", buf, 0x12u);
            }
            return (uint64_t)[*(id *)(v3 + 32) handleDeviceLockedWarning:v5];
          }
        }
      }
    }
  }
  return result;
}

id sub_10000E2D0(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 144), &state64);
  [*(id *)(a1 + 32) setDeviceLocked:state64 != 0];
  id result = [*(id *)(a1 + 32) deviceLocked];
  if (result)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136446466;
      uint64_t v5 = "-[RPSession setUpDeviceLockNotifications]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 700;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d device locking", buf, 0x12u);
    }
    return [*(id *)(a1 + 32) handleDeviceLockedWarning];
  }
  return result;
}

intptr_t sub_10000E4D4(uint64_t a1)
{
  [*(id *)(a1 + 32) handleUpdateDisplayLayout:];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

uint64_t sub_100011AB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = [*(id *)(a1 + 32) purgeable:a3 urgency:a2];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    __int16 v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 212;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d purgeable=%@", (uint8_t *)&v5, 0x1Cu);
  }
  return v3;
}

uint64_t sub_100011BA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = [*(id *)(a1 + 32) purge:a3 urgency:a2];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    __int16 v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 217;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d purge=%@", (uint8_t *)&v5, 0x1Cu);
  }
  return v3;
}

void sub_100011C90(id a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 221;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d cancelling my purge!", (uint8_t *)&v1, 0x12u);
  }
}

uint64_t sub_100011D50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = [*(id *)(a1 + 32) periodic:a3 urgency:a2];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    __int16 v6 = "-[RPRecordingManager setUpMemoryPressureNotification]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 225;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d periodic=%@", (uint8_t *)&v5, 0x1Cu);
  }
  return v3;
}

void sub_10001263C(uint64_t a1, int a2)
{
  if (a2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136446466;
      int v5 = "-[RPRecordingManager applicationDisconnectedWithBundleID:withProcessIdentifier:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 344;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d client disconnected, successfully stopped active session", (uint8_t *)&v4, 0x12u);
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050520();
  }
  uint64_t v3 = +[RPClientManager sharedInstance];
  [v3 removeClient:*(void *)(a1 + 32)];
}

void sub_10001285C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) getCallingConnectionClient];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012998;
    v9[3] = &unk_100085340;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 startInAppRecordingSessionWithContextID:v6 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v9 withHandler:^(id, id, id, id, id, id) {
    *(double *)(a1 + 56) = x0;
    *(double *)(a1 + 64) = x1;
}];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
      (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, 0, 0);
    }
  }
}

uint64_t sub_100012998(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100012A5C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100012BEC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100012CEC;
    v8[3] = &unk_1000853B8;
    id v9 = v5;
    id v10 = *(id *)(a1 + 40);
    +[RPAudioMixUtility mixAudioForMovie:v9 finalMovieURL:v7 outputFileType:AVFileTypeMPEG4 withCompletionHandler:v8];
  }
}

void sub_100012CEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000505A4();
    }
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 136446722;
    uint64_t v6 = "-[RPRecordingManager stopInAppRecordingWithUrl:handler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 531;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Success Mixed Audio to %@", (uint8_t *)&v5, 0x1Cu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100012F18(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100013098(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) getCallingConnectionClient];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000131D4;
    v9[3] = &unk_100085340;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 startInAppCaptureSessionWithContextID:v6 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v9 withHandler:^(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20, void *a21, void *a22, void *a23, void *a24, void *a25, void *a26, void *a27, void *a28, void *a29, void *a30, void *a31, void *a32, void *a33, void *a34, void *a35, void *a36, void *a37, void *a38, void *a39, void *a40, void *a41, void *a42, void *a43, void *a44, void *a45, void *a46, void *a47, void *a48, void *a49, void *a50, void *a51, void *a52, void *a53, void *a54, void *a55, void *a56, void *a57, void *a58, void *a59, void *a60, void *a61, void *a62, void *a63, void *a64, void *a65, void *a66, void *a67, void *a68, void *a69, void *a70, void *a71, void *a72, void *a73, void *a74, void *a75, void *a76, void *a77, void *a78, void *a79, void *a80, void *a81, void *a82, void *a83, void *a84, void *a85, void *a86, void *a87, void *a88, void *a89, void *a90, void *a91, void *a92, void *a93, void *a94, void *a95, void *a96, void *a97, void *a98, void *a99, void *a100, void *a101, void *a102, void *a103, void *a104, void *a105, void *a106, void *a107, void *a108, void *a109, void *a110, void *a111, void *a112, void *a113, void *a114, void *a115, void *a116, void *a117, void *a118, void *a119, void *a120, void *a121, void *a122, void *a123, void *a124, void *a125, void *a126, void *a127, void *a128, void *a129, void *a130, void *a131, void *a132, void *a133, void *a134, void *a135, void *a136, void *a137, void *a138, void *a139, void *a140, void *a141, void *a142, void *a143, void *a144, void *a145, void *a146, void *a147, void *a148, void *a149, void *a150, void *a151, void *a152, void *a153, void *a154, void *a155, void *a156, void *a1
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
      (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, 0, 0);
    }
  }
}

uint64_t sub_1000131D4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100013298(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000133B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100013848(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000506AC();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000138C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100050730();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100013D10(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) getCallingConnectionClient];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100013E54;
    v10[3] = &unk_100085340;
    id v11 = *(id *)(a1 + 56);
    [v3 startInAppBroadcastSessionWithContextID:v6 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v7 listenerEndpoint:v10 withHandler:^(id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
      (*(void (**)(uint64_t, id, void, void))(v8 + 16))(v8, v9, 0, 0);
    }
  }
}

void sub_100013E54(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000507B4();
    }
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    id v10 = "-[RPRecordingManager startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpo"
          "int:withHandler:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 722;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start broadcast successfull", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100014034(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050838();
    }
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[RPRecordingManager stopInAppBroadcastWithHandler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 748;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop broadcast successfull", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

uint64_t sub_100014258(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001447C(uint64_t a1, int a2)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    int v12 = "-[RPRecordingManager startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 791;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (a2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) getCallingConnectionClient];
    uint64_t v5 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001462C;
    v9[3] = &unk_100084E90;
    uint64_t v7 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v4 startSystemRecordingSessionWithContextID:v7 windowSize:v5 microphoneEnabled:v6 cameraEnabled:v9 withHandler:^(id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
    if (!v8) {
      return;
    }
    uint64_t v4 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
  }
}

uint64_t sub_10001462C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000146F0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000147B4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100014878(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100014C60(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) getCallingConnectionClient];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100014D9C;
    v10[3] = &unk_100084E90;
    id v11 = *(id *)(a1 + 56);
    [v3 startSystemBroadcastSessionWithContextID:v6 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v7 listenerEndpoint:v10 withHandler:^(id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id,
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 56);
    if (v8)
    {
      id v9 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
    }
  }
}

uint64_t sub_100014D9C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100014E60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100014F24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000150E8(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) getCallingConnectionClient];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015224;
    v9[3] = &unk_100085340;
    uint64_t v6 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v3 startInAppClipSessionWithContextID:v6 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v9 withHandler:^(id _Nullable arg0, id _Nullable arg1, id _Nullable arg2, id _Nullable arg3, id _Nullable arg4, id _Nullable arg5, id _Nullable arg6, id _Nullable arg7, id _Nullable arg8, id _Nullable arg9, id _Nullable arg10, id _Nullable arg11, id _Nullable arg12, id _Nullable arg13, id _Nullable arg14, id _Nullable arg15, id _Nullable arg16, id _Nullable arg17, id _Nullable arg18, id _Nullable arg19, id _Nullable arg20, id _Nullable arg21, id _Nullable arg22, id _Nullable arg23, id _Nullable arg24, id _Nullable arg25, id _Nullable arg26, id _Nullable arg27, id _Nullable arg28, id _Nullable arg29, id _Nullable arg30, id _Nullable arg31, id _Nullable arg32, id _Nullable arg33, id _Nullable arg34, id _Nullable arg35, id _Nullable arg36, id _Nullable arg37, id _Nullable arg38, id _Nullable arg39, id _Nullable arg40, id _Nullable arg41, id _Nullable arg42, id _Nullable arg43, id _Nullable arg44, id _Nullable arg45, id _Nullable arg46, id _Nullable arg47, id _Nullable arg48, id _Nullable arg49, id _Nullable arg50, id _Nullable arg51, id _Nullable arg52, id _Nullable arg53, id _Nullable arg54, id _Nullable arg55, id _Nullable arg56, id _Nullable arg57, id _Nullable arg58, id _Nullable arg59, id _Nullable arg60, id _Nullable arg61, id _Nullable arg62, id _Nullable arg63, id _Nullable arg64, id _Nullable arg65, id _Nullable arg66, id _Nullable arg67, id _Nullable arg68, id _Nullable arg69, id _Nullable arg70, id _Nullable arg71, id _Nullable arg72, id _Nullable arg73, id _Nullable arg74, id _Nullable arg75, id _Nullable arg76, id _Nullable arg77, id _Nullable arg78, id _Nullable arg79, id _Nullable arg80, id _Nullable arg81, id _Nullable arg82, id _Nullable arg83, id _Nullable arg84, id _Nullable arg85, id _Nullable arg86, id _Nullable arg87, id _Nullable arg88, id _Nullable arg89, id _Nullable arg90, id _Nullable arg91, id _Nullable arg92, id _Nullable arg93, id _Nullable arg94, id _Nullable arg95, id _Nullable arg96, id _Nullable arg97, id _Nullable arg98, id _Nullable arg99, id _Nullable arg100, id _Nullable arg101, id _Nullable arg102, id _Nullable arg103, id _Nullable arg104, id _Nullable arg105, id _Nullable arg106, id _Nullable arg107, id _Nullable arg108, id _Nullable arg109, id _Nullable arg110, id _Nullable arg111, id _Nullable arg112, id _Nullable arg113, id _Nullable arg114, id _Nullable arg115, id _Nullable arg116, id _Nullable arg117, id _Nullable arg118, id _Nullable arg119, id _Nullable arg120, id _Nullable arg121,
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      id v8 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
      (*(void (**)(uint64_t, id, void, void))(v7 + 16))(v7, v8, 0, 0);
    }
  }
}

uint64_t sub_100015224(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10001538C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100015520(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100015600(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000159D4(id a1, BOOL a2)
{
  if (a2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136446466;
      id v3 = "-[RPRecordingManager stopAllActiveClients]_block_invoke";
      __int16 v4 = 1024;
      int v5 = 1046;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop all clients success", (uint8_t *)&v2, 0x12u);
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050940();
  }
}

void sub_10001610C(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = +[RPConnectionManager sharedInstance];
  id v10 = [v9 currentConnection];

  id v11 = +[RPConnectionManager uniqueClientIdentifierWithPID:](RPConnectionManager, "uniqueClientIdentifierWithPID:", [v10 processIdentifier]);
  if (v7)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100050A48();
    }
    int v12 = &__NSDictionary0__struct;
    uint64_t v13 = -5831;
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136446722;
      uint64_t v16 = "-[RPRecordingManager processSaveToPhotos:mixAudioTracks:ignoreDoNotDisturb:isClip:]_block_invoke";
      __int16 v17 = 1024;
      int v18 = 1093;
      __int16 v19 = 2048;
      double v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds", (uint8_t *)&v15, 0x1Cu);
    }
    [*(id *)(a1 + 32) displayScreenRecorderNotificationWithURL:v8 ignoreDoNotDisturb:*(unsigned __int8 *)(a1 + 40) isClip:*(unsigned __int8 *)(a1 + 41)];
    uint64_t v13 = 0;
    int v12 = 0;
  }
  int v14 = +[NSError _rpUserErrorForCode:v13 userInfo:v12];
  +[RPReportingAgent reportSessionEnded:2 endReason:v14 withServiceName:@"InAppRecording" clientBundleId:v11];
}

void sub_100016BA0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v1 = +[NSArray arrayWithObjects:&v2 count:1];
  +[PHAssetChangeRequest deleteAssets:v1];
}

void sub_100016CCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[NSMutableArray array];
  id v8 = (void *)v7;
  if (!v6)
  {
    __int16 v27 = (void *)v7;
    uint64_t v25 = a1;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v26 = v5;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (!v9) {
      goto LABEL_20;
    }
    id v10 = v9;
    uint64_t v11 = *(void *)v30;
    uint64_t v12 = _kCFBundleDisplayNameKey;
    while (1)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        int v15 = [v14 _plugIn];
        uint64_t v16 = [v15 containingUrl];
        __int16 v17 = +[RPImageUtility getImageDataFromExtensionContainingAppBundleUrl:v16];

        int v18 = [v14 infoDictionary];
        __int16 v19 = [v18 objectForKey:v12];

        double v20 = [v14 identifier];
        if (v20) {
          BOOL v21 = v19 == 0;
        }
        else {
          BOOL v21 = 1;
        }
        if (v21)
        {
        }
        else
        {

          if (v17)
          {
            id v22 = objc_alloc_init((Class)NSMutableDictionary);
            long long v23 = [v14 identifier];
            [v22 setObject:v23 forKey:@"extBundleID"];

            [v22 setObject:v19 forKey:@"displayName"];
            [v22 setObject:v17 forKey:@"extAppImgData"];
            [v27 addObject:v22];

            goto LABEL_18;
          }
        }
        if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 136446466;
          v34 = "-[RPRecordingManager getSystemBroadcastExtensionInfo:]_block_invoke";
          __int16 v35 = 1024;
          int v36 = 1285;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error getting broadcast extension info", buf, 0x12u);
        }
LABEL_18:
      }
      id v10 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (!v10)
      {
LABEL_20:

        id v6 = 0;
        id v5 = v26;
        a1 = v25;
        id v8 = v27;
        break;
      }
    }
  }
  uint64_t v24 = *(void *)(a1 + 32);
  if (v24) {
    (*(void (**)(uint64_t, void *, id))(v24 + 16))(v24, v8, v6);
  }
}

void sub_1000173A8(id a1)
{
  id v2 = +[CCSControlCenterService sharedInstance];
  int v1 = +[CCSModulePresentationOptions defaultOptions];
  [v2 presentModuleWithIdentifier:@"com.apple.replaykit.controlcenter.screencapture" options:v1 completionHandler:&stru_100085540];
}

void sub_100017428(id a1, BOOL a2, NSError *a3)
{
  __int16 v4 = a3;
  if (a2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446466;
      id v6 = "-[RPRecordingManager openControlCenterSystemRecordingView]_block_invoke";
      __int16 v7 = 1024;
      int v8 = 1334;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Control center screen capture module presented", (uint8_t *)&v5, 0x12u);
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100050BD4(v4);
  }
}

void sub_1000177D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000177F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017800(uint64_t a1)
{
}

void sub_100017808(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    __int16 v4 = (void *)v3[5];
    int v5 = [v3 rpLocalizedStatusStringForPaused:0];
    [v4 setStatusString:v5];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: failed to acquire assertion", v6, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidateStatusBar];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_1000178C8(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidateStatusBar];
}

void sub_1000179C4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    NSInteger v4 = [(NSError *)a2 code];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: registered. If there was an error it was: %li", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_100017AE4(uint64_t a1)
{
  uint64_t v2 = +[NSDate date];
  uint64_t v3 = *(void *)(a1 + 32);
  NSInteger v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  *(void *)(*(void *)(a1 + 32) + 56) = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"updateDelegateRecordingTimer:" selector:0 userInfo:1 repeats:0.5];

  return _objc_release_x1();
}

void sub_100017C30(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100050CB0((uint64_t)v2);
  }
}

void sub_10001917C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v29 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  id v6 = [v5 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      id v9 = 0;
      id v30 = v7;
      do
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v9);
        uint64_t v11 = [v10 extensionPointIdentifier];
        uint64_t v12 = [v10 _extensionBundle];
        NSLog(@"NSExtensionPointIdentifier %@ _extensionBundle %@", v11, v12);

        if (!*(void *)(a1 + 32)
          || ([v10 identifier],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              unsigned int v14 = [v13 hasPrefix:*(void *)(a1 + 32)],
              v13,
              v14))
        {
          int v15 = [v10 attributes];
          uint64_t v16 = [v15 objectForKeyedSubscript:@"NSExtensionActivationRule"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = v8;
            id v18 = v16;
            __int16 v19 = v18;
            if (*(void *)(a1 + 40))
            {
              uint64_t v20 = [v18 objectForKeyedSubscript:];
              if (!v20) {
                goto LABEL_15;
              }
              BOOL v21 = (void *)v20;
              id v22 = [v19 objectForKeyedSubscript:*(void *)(a1 + 40)];
              unsigned int v23 = [v22 BOOLValue];

              if (!v23) {
                goto LABEL_15;
              }
            }
            if (*(void *)(a1 + 48))
            {
              uint64_t v24 = [v19 objectForKeyedSubscript:];
              if (v24)
              {
                uint64_t v25 = (void *)v24;
                id v26 = [v19 objectForKeyedSubscript:*(void *)(a1 + 48)];
                unsigned __int8 v27 = [v26 BOOLValue];

                if (v27)
                {
LABEL_15:

                  uint64_t v8 = v17;
                  id v7 = v30;
LABEL_20:

                  goto LABEL_21;
                }
              }
            }

            uint64_t v8 = v17;
            id v7 = v30;
          }
          else if (*(void *)(a1 + 40))
          {
            goto LABEL_20;
          }
          [*(id *)(a1 + 56) addObject:v10];
          goto LABEL_20;
        }
LABEL_21:
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v7);
  }
  uint64_t v28 = *(void *)(a1 + 64);
  if (v28) {
    (*(void (**)(uint64_t, void, id))(v28 + 16))(v28, *(void *)(a1 + 56), v29);
  }
}

BOOL sub_100019550(int a1)
{
  return a1 == 8;
}

BOOL sub_10001955C(int a1)
{
  return a1 != 8;
}

void sub_100019A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019A78(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained applicationStateDidChange:v3];
}

void sub_10001A82C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 392))
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051044();
    }
    id v3 = +[NSError _rpUserErrorForCode:-5836 userInfo:0];
    [*(id *)(a1 + 32) reportSummaryEvent:[v3 code] recordedFileSize:0];
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    *(unsigned char *)(v2 + 392) = 1;
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(v5 + 376);
    double v8 = *(double *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001A99C;
    v9[3] = &unk_100085650;
    void v9[4] = v5;
    id v10 = v6;
    id v11 = *(id *)(a1 + 48);
    [v7 exportClipToURL:v10 duration:v9 completionHandler:v8];
  }
}

void sub_10001A99C(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 392) = 0;
  id v5 = v3;
  [*(id *)(a1 + 32) reportSummaryEvent:[v3 code] recordedFileSize:[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", *(void *)(a1 + 40))];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

void sub_10001AADC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) sessionState];
  id v3 = *(opaqueCMSampleBuffer **)(a1 + 40);
  if (v2 == 1)
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(v3);
    id v5 = ImageBuffer;
    id v6 = *(void **)(a1 + 32);
    if (v6[48]
      || (size_t Width = CVPixelBufferGetWidth(ImageBuffer),
          [v6 createEncodingSessionWithWidth:Width withHeight:CVPixelBufferGetHeight(v5)],
          *(void *)(*(void *)(a1 + 32) + 384)))
    {
      memset(&v12, 0, sizeof(v12));
      CMSampleBufferGetPresentationTimeStamp(&v12, *(CMSampleBufferRef *)(a1 + 40));
      double v8 = *(OpaqueVTCompressionSession **)(*(void *)(a1 + 32) + 384);
      CMTime presentationTimeStamp = v12;
      CMTime v10 = kCMTimeInvalid;
      if (VTCompressionSessionEncodeFrame(v8, v5, &presentationTimeStamp, &v10, 0, 0, 0)) {
        BOOL v9 = dword_100099BB8 > 2;
      }
      else {
        BOOL v9 = 1;
      }
      if (!v9 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000510C8();
      }
    }
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  else
  {
    CFRelease(v3);
  }
}

void sub_10001AE24(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  id v7 = a1;
  double v8 = v7;
  if (a3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100051254();
    }
  }
  else if (v7)
  {
    [v7 appendVideoSampleBuffer:a5];
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000511D0();
  }
}

void sub_10001B088(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClipSession: startCapture has failed. Error: %@", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
LABEL_10:
      v5();
    }
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 384) = 0;
    id v6 = [RPClipWriter alloc];
    [*(id *)(a1 + 32) windowSize];
    id v7 = -[RPClipWriter initWithWindowSize:](v6, "initWithWindowSize:");
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = *(void **)(v8 + 376);
    *(void *)(v8 + 376) = v7;

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPClipSession: startCapture has started successfully", (uint8_t *)&v11, 2u);
    }
    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      id v5 = *(void (**)(void))(v10 + 16);
      goto LABEL_10;
    }
  }
}

void sub_10001B3D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000513E0(a1, (uint64_t)v3);
  }
  [*(id *)(a1 + 40) notifyClientSessionDidStopWithError:[*(id *)(a1 + 32) code] movieURL:0 showAlert:1];
}

void sub_10001B4AC(id a1)
{
  qword_100099C20 = (uint64_t)dispatch_queue_create("com.apple.replaykit.ClipSessionDispatchQueue", 0);

  _objc_release_x1();
}

void sub_10001B70C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    id v7 = "-[RPClipSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 350;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_10001BB58(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5807 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPClipSession handleDisplayWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 385;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10001BE58(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5802 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPClipSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 414;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10001C07C(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    unsigned int v2 = "-[RPClipSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 426;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

double sub_10001C1D0()
{
  if ((byte_100099C30 & 1) == 0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v2) = info.numer;
    *(double *)&qword_100099C38 = (double)v2 / (double)v3 / 1000000000.0;
    __dmb(0xBu);
    byte_100099C30 = 1;
  }
  double v0 = *(double *)&qword_100099C38;
  return v0 * (double)(uint64_t)mach_absolute_time();
}

unint64_t sub_10001C258(unint64_t result, unint64_t a2)
{
  if (a2) {
    return (unint64_t)(round((double)result / (double)a2) * (double)a2);
  }
  return result;
}

unint64_t sub_10001C278(unint64_t result, unint64_t a2)
{
  if (result)
  {
    double v2 = (double)a2;
    double v3 = (double)result;
    double v4 = log10((double)result);
    double v5 = __exp10(v2 - ceil(v4));
    return (unint64_t)(round(v5 * v3) / v5);
  }
  return result;
}

Float64 sub_10001C2C8(CMTime *a1)
{
  CMTime v2 = *a1;
  return CMTimeGetSeconds(&v2);
}

CMTime *sub_10001C300@<X0>(Float64 a1@<X0>, CMTime *a2@<X8>)
{
  return CMTimeMakeWithSeconds(a2, a1, 1000000);
}

double sub_10001C310(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, long double a9)
{
  if (a9 >= 0.5) {
    double v16 = pow(a9 * -2.0 + 2.0, 3.0) * -0.5 + 1.0;
  }
  else {
    double v16 = pow(a9, 3.0) * 4.0;
  }
  return a1 + v16 * (a5 - a1);
}

void sub_10001F59C(id a1)
{
  id v1 = +[NSUUID UUID];
  [v1 getUUIDBytes:&unk_100099C40];
}

uint64_t sub_10001FF60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(v3 + 16))(v3, 0, a2);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100020434(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) status];
  if (v2 == (id)5)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)int v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 72;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionStatusCancelled";
    goto LABEL_9;
  }
  if (v2 == (id)4)
  {
    if (dword_100099BB8 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)int v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 67;
    uint64_t v3 = " [INFO] %{public}s:%d AVAssetExportSessionFailed";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, v6, 0x12u);
LABEL_10:
    uint64_t v4 = *(void *)(a1 + 40);
    double v5 = +[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5818, 0, *(_OWORD *)v6, *(void *)&v6[16]);
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int v6 = 136446466;
    *(void *)&v6[4] = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]_block_invoke";
    *(_WORD *)&v6[12] = 1024;
    *(_DWORD *)&v6[14] = 77;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportSession returned with no errors", v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100021E94(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000517E4(a2);
  }
}

void sub_100021F88(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051858(a2);
  }
}

void sub_100022060(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000518CC(a2);
  }
}

void sub_100022138(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051940(a2);
  }
}

void sub_100022298(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000519B4(a2);
  }
}

void sub_1000223F8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051A28(a2);
  }
}

void sub_1000224D0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051A9C(a2);
  }
}

void sub_1000225A8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051B10(a2);
  }
}

void sub_100022670(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051B84(a2);
  }
}

void sub_100022748(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051BF8(a2);
  }
}

void sub_1000227FC(id a1)
{
  qword_100099C58 = objc_alloc_init(RPMultipleClientProxy);

  _objc_release_x1();
}

void sub_100022A30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022B14(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022CD8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051C6C(a2);
  }
}

void sub_100022EB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100022EDC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051CE0(a2);
  }
}

void sub_1000230A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000230D0(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051D54(a2);
  }
}

void sub_1000232A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000232C8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051DC8(a2);
  }
}

void sub_100023490(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000234B8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100051E3C(a2);
  }
}

void sub_1000236A0(id a1)
{
  qword_100099C68 = objc_alloc_init(RPClientManager);

  _objc_release_x1();
}

void sub_100023A50(id a1, BOOL a2)
{
  if (dword_100099BB8 <= 1)
  {
    BOOL v2 = a2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136446722;
      uint64_t v4 = "-[RPClientManager removeClient:]_block_invoke";
      __int16 v5 = 1024;
      int v6 = 57;
      __int16 v7 = 1024;
      BOOL v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop current active session ended with success:%d", (uint8_t *)&v3, 0x18u);
    }
  }
}

void sub_100024350(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100024378(uint64_t a1, char a2)
{
  unsigned int v3 = dword_100099BB8;
  if ((a2 & 1) == 0)
  {
    if (dword_100099BB8 <= 2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100051F40();
      }
      unsigned int v3 = dword_100099BB8;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (v3 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 127;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d leave stop group", (uint8_t *)&v4, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100024484(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (dword_100099BB8 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v3 = 136446466;
        int v4 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
        __int16 v5 = 1024;
        int v6 = 136;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d all clients stopped", (uint8_t *)&v3, 0x12u);
      }
      uint64_t result = *(void *)(a1 + 32);
    }
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  }
  return result;
}

id sub_1000245D0()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: RPDaemonRun:", v3, 2u);
  }
  uint64_t v0 = +[RPConnectionManager sharedInstance];
  uint64_t v1 = (void *)qword_100099C78;
  qword_100099C78 = v0;

  return [(id)qword_100099C78 finishStartup];
}

void sub_1000246B8(id a1)
{
  qword_100099C80 = objc_alloc_init(RPConnectionManager);

  _objc_release_x1();
}

void sub_100024C88(id a1)
{
  qword_100099C90 = (uint64_t)dispatch_queue_create("com.replaykit.connectionManagerQueue", 0);

  _objc_release_x1();
}

void sub_100025118(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    BOOL v8 = "-[RPConnectionManager processNewConnection:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 201;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection INTERRUPTED", buf, 0x12u);
  }
  BOOL v2 = [*(id *)(a1 + 32) connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025268;
  block[3] = &unk_1000859D8;
  int v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  int v6 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v2, block);
}

id sub_100025268(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) applicationDisconnectedWithBundleID:*(void *)(a1 + 40) withProcessIdentifier:*(unsigned int *)(a1 + 48)];
}

void sub_10002527C(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    BOOL v8 = "-[RPConnectionManager processNewConnection:]_block_invoke_2";
    __int16 v9 = 1024;
    int v10 = 207;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection INVALID", buf, 0x12u);
  }
  BOOL v2 = [*(id *)(a1 + 32) connectionManagerQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000253CC;
  block[3] = &unk_1000859D8;
  int v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  int v6 = *(_DWORD *)(a1 + 48);
  dispatch_sync(v2, block);
}

id sub_1000253CC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) applicationDisconnectedWithBundleID:*(void *)(a1 + 40) withProcessIdentifier:*(unsigned int *)(a1 + 48)];
}

id sub_1000253E0(void *a1)
{
  return [*(id *)(a1[4] + 16) connectionManagerDidAcceptNewConnection:a1[5] bundleIdentifier:a1[6]];
}

void sub_10002562C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    id v11 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]_block_invoke";
    __int16 v12 = 1024;
    int v13 = 236;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stopped recording from file permissions error", buf, 0x12u);
  }
  int v7 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025788;
  v8[3] = &unk_100085A28;
  id v9 = *(id *)(a1 + 40);
  [v7 discardInAppRecordingWithHandler:v8];
}

void sub_100025788(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    id v5 = "-[RPConnectionManager stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 238;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d discarded recording from file permissions error", (uint8_t *)&v4, 0x12u);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = +[NSError _rpUserErrorForCode:-5835 userInfo:0];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void sub_1000259A4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) stopCurrentActiveSessionWithHandler:*(void *)(a1 + 40)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopCurrentActiveSessionWithHandler completed", v1, 2u);
  }
}

void sub_100025AFC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) stopAllActiveClients];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopAllActiveClients completed", v1, 2u);
  }
}

void sub_100025C7C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) getSystemBroadcastExtensionInfo:*(void *)(a1 + 40)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: getSystemBroadcastExtensionInfo completed", v1, 2u);
  }
}

void sub_100025DFC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setBroadcastURL:*(void *)(a1 + 40)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setBroadcastURL completed", v1, 2u);
  }
}

void sub_100025FC8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) updateProcessIDForAudioCaptureWithPID:*(unsigned int *)(a1 + 40)];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPConnectionManager updateProcessIDForAudioCaptureWithPID:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 288;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100026204(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  __int16 v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000262C0;
  _OWORD v6[3] = &unk_100085340;
  id v7 = *(id *)(a1 + 48);
  [v3 startInAppRecordingWithContextID:v2 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v6 withHandler:^(id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id
}

void sub_1000262C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppRecordingWithContextID completed", v9, 2u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100026504(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026598;
  v3[3] = &unk_100085340;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppRecordingWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_100026598(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    int v10 = "-[RPConnectionManager resumeInAppRecordingWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 311;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_1000267B8(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100026848;
  v2[3] = &unk_100085390;
  id v3 = *(id *)(a1 + 40);
  [v1 stopInAppRecordingWithHandler:v2];
}

void sub_100026848(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppRecordingWithHandler completed", v8, 2u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

id sub_100026A08(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:*(void *)(a1 + 40)];
}

void sub_100026BDC(uint64_t a1)
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v11 = 0;
  id v11 = [*(id *)(a1 + 32) consumeSandboxExtensionToken:*(void *)(a1 + 40)];
  if (v9[3] == -1)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052058();
    }
    [*(id *)(a1 + 32) stopAndDiscardInAppRecordingFromFilePermissionErrorWithHandler:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100026D20;
    v5[3] = &unk_100085AA0;
    void v5[4] = v2;
    uint64_t v7 = &v8;
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = *(id *)(a1 + 56);
    [v3 stopInAppRecordingWithUrl:v4 handler:v5];
  }
  _Block_object_dispose(&v8, 8);
}

void sub_100026D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026D20(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100099BB8;
  if ((v4 & 1) == 0 && dword_100099BB8 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000520D8();
    }
    unsigned int v5 = dword_100099BB8;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    uint64_t v7 = "-[RPConnectionManager stopInAppRecordingWithUrl:extensionToken:handler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 354;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100026F6C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) discardInAppRecordingWithHandler:*(void *)(a1 + 40)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: discardInAppRecordingWithHandler completed", v1, 2u);
  }
}

void sub_1000270C4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) pauseInAppRecording];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppRecording completed", v1, 2u);
  }
}

void sub_100027294(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027350;
  _OWORD v6[3] = &unk_100085340;
  id v7 = *(id *)(a1 + 48);
  [v3 startInAppCaptureWithContextID:v2 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v6 withHandler:^(id v2, id v3, id v4, id v5, id v6, id v7, id v8, id v9, id v10, id v11, id v12, id v13, id v14, id v15, id v16, id v17, id v18, id v19, id v20, id v21, id v22, id v23, id v24, id v25, id v26, id v27, id v28, id v29, id v30, id v31, id v32, id v33, id v34, id v35, id v36, id v37, id v38, id v39, id v40, id v41, id v42, id v43, id v44, id v45, id v46, id v47, id v48, id v49, id v50, id v51, id v52, id v53, id v54, id v55, id v56, id v57, id v58, id v59, id v60, id v61, id v62, id v63, id v64, id v65, id v66, id v67, id v68, id v69, id v70, id v71, id v72, id v73, id v74, id v75, id v76, id v77, id v78, id v79, id v80, id v81, id v82, id v83, id v84, id v85, id v86, id v87, id v88, id v89, id v90, id v91, id v92, id v93, id v94, id v95, id v96, id v97, id v98, id v99, id v100, id v101, id v102, id v103, id v104, id v105, id v106, id v107, id v108, id v109, id v110, id v111, id v112, id v113, id v114, id v115, id v116, id v117, id v118, id v119, id v120, id v121, id v122, id v123, id v124, id v125, id v126, id v127, id v128, id v129, id v130, id v131, id v132, id v133, id v134, id v135, id v136, id v137, id v138, id v139, id v140, id v141, id v142, id v143, id v144, id v145, id v146, id v147, id v148, id v149, id v150, id v151, id v152, id v153, id v154, id v155, id v156, id v157, id v158, id v159, id v160, id v161, id v162, id v163, id v164, id v165, id v166, id v167, id v168, id v169, id v170, id v171, id v172, id v173, id v174, id v175, id v176, id v177, id v178, id v179, id v180, id v181, id v182, id v183, id v1
}

void sub_100027350(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppCaptureWithContextID completed", v9, 2u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_10002750C(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002759C;
  v2[3] = &unk_100084E90;
  id v3 = *(id *)(a1 + 40);
  [v1 stopInAppCaptureWithHandler:v2];
}

void sub_10002759C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppCaptureWithHandler completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100027718(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) pauseInAppCapture];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppCapture completed", v1, 2u);
  }
}

void sub_100027920(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000279B4;
  v3[3] = &unk_100085340;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppCaptureWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_1000279B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[RPConnectionManager resumeInAppCaptureWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 420;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100027D20(void *a1)
{
  [*(id *)(a1[4] + 16) setupBroadcastWithHostBundleID:a1[5] broadcastExtensionBundleID:a1[6] broadcastConfigurationData:a1[7] userInfo:a1[8] handler:a1[9]];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPConnectionManager setupBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:user"
         "Info:handler:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 435;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100027F88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  __int16 v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100028048;
  _OWORD v7[3] = &unk_100085340;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 startInAppBroadcastWithContextID:v2 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v6 listenerEndpoint:v7 withHandler:^(id _Nullable v2, id _Nullable v3, id _Nullable v4, id _Nullable v5, id _Nullable v6, id _Nullable v7, id _Nullable v8, id _Nullable v9, id _Nullable v10, id _Nullable v11, id _Nullable v12, id _Nullable v13, id _Nullable v14, id _Nullable v15, id _Nullable v16, id _Nullable v17, id _Nullable v18, id _Nullable v19, id _Nullable v20, id _Nullable v21, id _Nullable v22, id _Nullable v23, id _Nullable v24, id _Nullable v25, id _Nullable v26, id _Nullable v27, id _Nullable v28, id _Nullable v29, id _Nullable v30, id _Nullable v31, id _Nullable v32, id _Nullable v33, id _Nullable v34, id _Nullable v35, id _Nullable v36, id _Nullable v37, id _Nullable v38, id _Nullable v39, id _Nullable v40, id _Nullable v41, id _Nullable v42, id _Nullable v43, id _Nullable v44, id _Nullable v45, id _Nullable v46, id _Nullable v47, id _Nullable v48, id _Nullable v49, id _Nullable v50, id _Nullable v51, id _Nullable v52, id _Nullable v53, id _Nullable v54, id _Nullable v55, id _Nullable v56, id _Nullable v57, id _Nullable v58, id _Nullable v59, id _Nullable v60, id _Nullable v61, id _Nullable v62, id _Nullable v63, id _Nullable v64, id _Nullable v65, id _Nullable v66, id _Nullable v67, id _Nullable v68, id _Nullable v69, id _Nullable v70, id _Nullable v71, id _Nullable v72, id _Nullable v73, id _Nullable v74, id _Nullable v75, id _Nullable v76, id _Nullable v77, id _Nullable v78, id _Nullable v79, id _Nullable v80, id _Nullable v81, id _Nullable v82, id _Nullable v83, id _Nullable v84, id _Nullable v85, id _Nullable v86, id _Nullable v87, id _Nullable v88, id _Nullable v89, id _Nullable v90, id _Nullable v91, id _Nullable v92, id _Nullable v93, id _Nullable v94, id _Nullable v95, id _Nullable v96, id _Nullable v97, id _Nullable v98, id _Nullable v99, id _Nullable v100, id _Nullable v101, id _Nullable v102, id _Nullable v103, id _Nullable v104, id _Nullable v105, id _Nullable v106, id _Nullable v107, id _Nullable v108, id _Nullable v109, id _Nullable v110, id _Nullable v111, id _Nullable v112, id _Nullable v113, id _Nullable v114, id _Nullable v115, id _Nullable v116, id _Nullable v117, id _Nullable v118, id _Nullable v119, id _Nullable v120, id _Nullable v121, id _Nullable v122,
}

void sub_100028048(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startInAppBroadcastWithContextID completed", v9, 2u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_100028204(uint64_t a1)
{
  int v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100028294;
  v2[3] = &unk_100084E90;
  id v3 = *(id *)(a1 + 40);
  [v1 stopInAppBroadcastWithHandler:v2];
}

void sub_100028294(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopInAppBroadcastWithHandler completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100028410(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) pauseInAppBroadcast];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: pauseInAppBroadcast completed", v1, 2u);
  }
}

void sub_100028618(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000286AC;
  v3[3] = &unk_100085340;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppBroadcastWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_1000286AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    uint64_t v10 = "-[RPConnectionManager resumeInAppBroadcastWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 485;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_1000289F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028AB4;
  _OWORD v6[3] = &unk_100084E90;
  id v7 = *(id *)(a1 + 48);
  [v3 startSystemRecordingWithContextID:v2 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v6 withHandler:^(id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id, id,
}

void sub_100028AB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startSystemRecordingWithContextID completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100028D38(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100028DC8;
  v2[3] = &unk_100084E90;
  id v3 = *(id *)(a1 + 40);
  [v1 stopSystemRecordingWithHandler:v2];
}

void sub_100028DC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemRecordingWithHandler completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100029050(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000290E0;
  v2[3] = &unk_100085390;
  id v3 = *(id *)(a1 + 40);
  [v1 stopSystemRecordingWithURLHandler:v2];
}

void sub_1000290E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemRecordingWithURLHandler completed", v8, 2u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100029358(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000293E8;
  v2[3] = &unk_100085430;
  id v3 = *(id *)(a1 + 40);
  [v1 resumeSystemRecordingWithCompletionHandler:v2];
}

uint64_t sub_1000293E8(uint64_t a1, uint64_t a2)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    id v6 = "-[RPConnectionManager resumeSystemRecordingWithCompletionHandler:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 563;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed with success:%d", (uint8_t *)&v5, 0x18u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_100029750(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100029804;
  _OWORD v6[3] = &unk_100084E90;
  uint64_t v5 = *(void *)(a1 + 64);
  id v7 = *(id *)(a1 + 72);
  [v2 setupSystemBroadcastWithHostBundleID:v1 broadcastExtensionBundleID:v3 broadcastConfigurationData:v4 userInfo:v5 handler:v6];
}

void sub_100029804(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: setupSystemBroadcastWithHostBundleID completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100029A20(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100029AE0;
  _OWORD v7[3] = &unk_100084E90;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v3 startSystemBroadcastWithContextID:v2 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v6 listenerEndpoint:v7 withHandler:^(id v10, id v11, id v12, id v13, id v14, id v15, id v16, id v17, id v18, id v19, id v20, id v21, id v22, id v23, id v24, id v25, id v26, id v27, id v28, id v29, id v30, id v31, id v32, id v33, id v34, id v35, id v36, id v37, id v38, id v39, id v40, id v41, id v42, id v43, id v44, id v45, id v46, id v47, id v48, id v49, id v50, id v51, id v52, id v53, id v54, id v55, id v56, id v57, id v58, id v59, id v60, id v61, id v62, id v63, id v64, id v65, id v66, id v67, id v68, id v69, id v70, id v71, id v72, id v73, id v74, id v75, id v76, id v77, id v78, id v79, id v80, id v81, id v82, id v83, id v84, id v85, id v86, id v87, id v88, id v89, id v90, id v91, id v92, id v93, id v94, id v95, id v96, id v97, id v98, id v99, id v100, id v101, id v102, id v103, id v104, id v105, id v106, id v107, id v108, id v109, id v110, id v111, id v112, id v113, id v114, id v115, id v116, id v117, id v118, id v119, id v120, id v121, id v122, id v123, id v124, id v125, id v126, id v127, id v128, id v129, id v130, id v131, id v132, id v133, id v134, id v135, id v136, id v137, id v138, id v139, id v140, id v141, id v142, id v143, id v144, id v145, id v146, id v147, id v148, id v149, id v150, id v151, id v152, id v153, id v154, id v155, id v156, id v157, id v158, id v159, id v160, id v161, id v162, id v163, id v164, id v165, id v166, id v167, id v168, id v169, id v170, id v171, id v172, id v173, id v174, id v175, id v176, id v177, id v178, id v179, id v180, id v181, id v182, id v183, id v184, id v185, id v186, id v187, id v188,
}

void sub_100029AE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: startSystemBroadcastWithContextID completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100029C84(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100029D14;
  v2[3] = &unk_100084E90;
  id v3 = *(id *)(a1 + 40);
  [v1 stopSystemBroadcastWithHandler:v2];
}

void sub_100029D14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: stopSystemBroadcastWithHandler completed", v5, 2u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100029F70(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002A000;
  v2[3] = &unk_100085430;
  id v3 = *(id *)(a1 + 40);
  [v1 resumeSystemBroadcastWithCompletionHandler:v2];
}

uint64_t sub_10002A000(uint64_t a1, uint64_t a2)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    uint64_t v6 = "-[RPConnectionManager resumeSystemBroadcastWithCompletionHandler:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 632;
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed with success:%d", (uint8_t *)&v5, 0x18u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_10002A2BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002A378;
  _OWORD v6[3] = &unk_100085340;
  id v7 = *(id *)(a1 + 48);
  [v3 startClipBufferingWithContextID:v2 windowSize:v4 microphoneEnabled:v5 cameraEnabled:v6 withCompletionHandler:^(BOOL success, NSError *error) {
    *(double *)(a1 + 56) = success;
    *(double *)(a1 + 64) = error;
}];
}

void sub_10002A378(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    int v10 = "-[RPConnectionManager startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletio"
          "nHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 653;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_10002A5FC(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002A68C;
  v2[3] = &unk_100084E90;
  id v3 = *(id *)(a1 + 40);
  [v1 stopClipBufferingWithCompletionHandler:v2];
}

void sub_10002A68C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[RPConnectionManager stopClipBufferingWithCompletionHandler:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 666;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10002AA00(uint64_t a1)
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  id v14 = 0;
  id v14 = [*(id *)(a1 + 32) consumeSandboxExtensionToken:*(void *)(a1 + 40)];
  if (v12[3] == -1)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000524D8();
    }
    uint64_t v6 = *(void *)(a1 + 56);
    if (v6)
    {
      __int16 v7 = +[NSError _rpUserErrorForCode:-5835 userInfo:0];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    double v4 = *(double *)(a1 + 64);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002AB84;
    v8[3] = &unk_100085AA0;
    void v8[4] = v2;
    int v10 = &v11;
    uint64_t v5 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    [v3 exportClipToURL:v5 duration:v8 completionHandler:v4];
  }
  _Block_object_dispose(&v11, 8);
}

void sub_10002AB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002AB84(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100099BB8;
  if ((v4 & 1) == 0 && dword_100099BB8 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052558();
    }
    unsigned int v5 = dword_100099BB8;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446466;
    int v8 = "-[RPConnectionManager exportClipToURL:duration:extensionToken:completionHandler:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 697;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v7, 0x12u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_10002AE5C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002AEF0;
  v3[3] = &unk_100085340;
  id v4 = *(id *)(a1 + 48);
  [v2 resumeInAppClipWithWindowLayerContextID:v1 completionHandler:v3];
}

void sub_10002AEF0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    int v10 = "-[RPConnectionManager resumeInAppClipWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = 711;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v8 + 16))(v8, v7, a3, a4);
  }
}

void sub_10002B0E8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) macApplicationDidResignActive];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: macApplicationDidResignActive", v1, 2u);
  }
}

void sub_10002B2F0(void *a1)
{
  [*(id *)(a1[4] + 16) macApplicationDidBecomeActiveWithContextID:a1[5] completionHandler:a1[6]];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPConnectionManager macApplicationDidBecomeActiveWithContextID:completionHandler:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 734;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10002B6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B6F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  __int16 v3 = *(void **)(v1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B798;
  _OWORD v6[3] = &unk_100085AA0;
  void v6[4] = v1;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v3 saveVideo:v2 handler:v6];
}

void sub_10002B798(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100099BB8;
  if ((v4 & 1) == 0 && dword_100099BB8 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000526D8();
    }
    unsigned int v5 = dword_100099BB8;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    long long v7 = "-[RPConnectionManager saveVideo:extensionToken:handler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 759;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002BA08(void *a1)
{
  [*(id *)(a1[4] + 16) saveVideoToCameraRoll:a1[5] handler:a1[6]];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveVideoToCameraRoll completed", v1, 2u);
  }
}

void sub_10002BBB4(void *a1)
{
  [*(id *)(a1[4] + 16) saveClipToCameraRoll:a1[5] handler:a1[6]];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: saveClipToCameraRoll completed", v1, 2u);
  }
}

void sub_10002BE90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002BEB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v1 + 16);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BF54;
  _OWORD v6[3] = &unk_100085AA0;
  void v6[4] = v1;
  long long v5 = *(_OWORD *)(a1 + 48);
  id v4 = (id)v5;
  long long v7 = v5;
  [v3 saveClipToCameraRoll:v2 handler:v6];
}

void sub_10002BF54(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned __int8 v4 = [*(id *)(a1 + 32) releaseSandboxExtensionHandle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  unsigned int v5 = dword_100099BB8;
  if ((v4 & 1) == 0 && dword_100099BB8 <= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000527D8();
    }
    unsigned int v5 = dword_100099BB8;
  }
  if (v5 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    long long v7 = "-[RPConnectionManager saveClipToCameraRoll:extensionToken:handler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 798;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d completed", (uint8_t *)&v6, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002C184(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) reportCameraUsage:*(void *)(a1 + 40)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPConnectionManager: reportCameraUsage completed", v1, 2u);
  }
}

id sub_10002C5FC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setMicrophoneEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10002C78C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) getSystemBroadcastPickerInfo:*(void *)(a1 + 40)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[RPConnectionManager getSystemBroadcastPickerInfo:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", (uint8_t *)&v1, 0xCu);
  }
}

void sub_10002C9CC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setBroadcastPickerPreferredExt:*(void *)(a1 + 40) showsMicButton:*(unsigned __int8 *)(a1 + 48)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[RPConnectionManager setBroadcastPickerPreferredExt:showsMicButton:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", (uint8_t *)&v1, 0xCu);
  }
}

void sub_10002CBD0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) openControlCenterSystemRecordingView];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136315138;
    uint64_t v2 = "-[RPConnectionManager openControlCenterSystemRecordingView]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", (uint8_t *)&v1, 0xCu);
  }
}

void sub_10002CD44(id a1)
{
  id v3 = +[NSURL fileURLWithPath:@"/System/Library/Frameworks/ReplayKit.framework"];
  uint64_t v1 = +[NSBundle bundleWithURL:v3];
  uint64_t v2 = (void *)qword_100099CA0;
  qword_100099CA0 = v1;
}

uint64_t sub_10002D9E8(uint64_t a1)
{
  uint64_t v2 = +[RPCaptureManager sharedInstance];
  [v2 stopCaptureForDelegate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setSessionState:3];
  [*(id *)(a1 + 32) reportSummaryEvent:0 recordedFileSize:0];
  [*(id *)(*(void *)(a1 + 32) + 432) invalidateConnection];
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned __int8 v4 = *(void **)(v3 + 432);
  *(void *)(v3 + 432) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_10002DC24(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) recordingDidPause];
}

uint64_t sub_10002DDDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002DDEC(id a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v3 = 1024;
    int v4 = 167;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying extension of resume", (uint8_t *)&v1, 0x12u);
  }
}

id sub_10002E840(uint64_t a1)
{
  return [*(id *)(a1 + 32) startCaptureWithHandler:*(void *)(a1 + 40)];
}

void sub_10002EA4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052B54();
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      unsigned int v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      __int16 v11 = "-[RPSystemBroadcastSession startCaptureWithHandler:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 349;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d startCapture has started successfully", (uint8_t *)&v10, 0x12u);
    }
    [*(id *)(a1 + 32) setSessionState:1];
    int v6 = *(id **)(a1 + 32);
    long long v7 = [v6[48] infoDictionary];
    __int16 v8 = [v7 objectForKey:_kCFBundleDisplayNameKey];
    [v6 setUpStatusBarAssertionWithServiceName:v8];

    [*(id *)(a1 + 32) checkAndPlaySystemSessionSound:1];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      unsigned int v5 = *(void (**)(void))(v9 + 16);
      goto LABEL_12;
    }
  }
}

void sub_10002EF7C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_10002EFD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    [*(id *)(a1 + 40) disableBroadcast];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    unsigned int v5 = "-[RPSystemBroadcastSession enableBroadcastWithListenerEndpoint:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 387;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection to extensions ready", (uint8_t *)&v4, 0x12u);
  }
}

void sub_10002F0C4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastServiceInfo:v3];
}

void sub_10002F120(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastURL:v3];
}

void sub_10002F17C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastError:v3];
}

id sub_10002F368(uint64_t a1)
{
  [*(id *)(a1 + 32) showAlertForBroadcastSessionWithError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:0];
}

void sub_10002F59C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSKeyedUnarchiver);
  uint64_t v5 = *(void *)(a1 + 32);
  id v16 = 0;
  id v6 = [v4 initForReadingFromData:v5 error:&v16];
  id v7 = v16;
  __int16 v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(void **)(v9 + 384);
  *(void *)(v9 + 384) = v3;
  id v11 = v3;

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 392), *(id *)(a1 + 48));
  uint64_t v12 = *(void *)(a1 + 40);
  int v13 = *(void **)(v12 + 448);
  *(void *)(v12 + 448) = v8;
  id v14 = v8;

  *(void *)(*(void *)(a1 + 40) + 424) = 1;
  uint64_t v15 = *(void *)(a1 + 40) + 400;
  *(void *)(v15 + 16) = kCMTimeZero.epoch;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)&kCMTimeZero.value;
  [*(id *)(a1 + 40) setupDispatchLimits];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10002F888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 && [v5 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v22;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        int v13 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        id v14 = [v13 identifier];
        unsigned int v15 = [v14 isEqualToString:*(void *)(a1 + 32)];

        if (v15) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136446466;
        id v26 = "-[RPSystemBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:broadcastExtensionBundleID:withH"
              "andler:]_block_invoke";
        __int16 v27 = 1024;
        int v28 = 474;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found matching broadcastExtension", buf, 0x12u);
      }
      id v17 = v13;

      if (v17) {
        goto LABEL_22;
      }
    }
    else
    {
LABEL_12:
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052BD8();
    }
    id v17 = [v8 firstObject];
LABEL_22:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002FB4C;
    v18[3] = &unk_100085C70;
    uint64_t v16 = *(void *)(a1 + 40);
    id v19 = *(id *)(a1 + 32);
    id v20 = *(id *)(a1 + 48);
    +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services" baseIdentifier:v16 unwantedActivationRule:@"NSExtensionActivationSupportsReplayKitStreaming" completion:v18];

    id v17 = v19;
  }
}

void sub_10002FB4C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5 && !a3 && [v5 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        int v13 = [v12 identifier:v16];
        unsigned int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

        if (v14) {
          break;
        }
        if (v9 == (id)++v11)
        {
          id v9 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v9) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136446466;
        long long v21 = "-[RPSystemBroadcastSession loadBroadcastUploadExtensionWithBaseIdentifier:broadcastExtensionBundleID:withH"
              "andler:]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 494;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d found matching broadcastExtension", buf, 0x12u);
      }
      id v15 = v12;

      if (v15) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_12:
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100052C5C();
    }
    [v7 firstObject:v16];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10002FDBC(id a1)
{
  qword_100099CB0 = (uint64_t)dispatch_queue_create("com.apple.replaykit.SystemBroadcastSessionDispatchQueue", 0);

  _objc_release_x1();
}

void sub_10002FF88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100052CE0(a1, (uint64_t)v3);
  }
  [*(id *)(a1 + 40) notifyClientSessionDidStopWithError:[*(id *)(a1 + 32) code] movieURL:0 showAlert:1];
}

id sub_100030308(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 432);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100030390;
  _OWORD v6[3] = &unk_100085CE0;
  uint64_t v4 = a1[7];
  void v6[5] = a1[6];
  v6[6] = v4;
  void v6[4] = v2;
  return [v3 processPayload:v1 completion:v6];
}

id sub_100030390(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v5 = 136446722;
    id v6 = "-[RPSystemBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 621;
    __int16 v9 = 2048;
    uint64_t v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending %ld audio payload to broadcast extension...", (uint8_t *)&v5, 0x1Cu);
  }
  id v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  return [*(id *)(a1 + 32) dispatchCompleted:*(void *)(a1 + 40)];
}

id sub_1000307B4(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 432);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003083C;
  _OWORD v7[3] = &unk_100085CE0;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  void v7[4] = v2;
  v7[5] = v4;
  v7[6] = v5;
  return [v3 processPayload:v1 completion:v7];
}

id sub_10003083C(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPSystemBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:]_block_invoke_2";
    __int16 v6 = 1024;
    int v7 = 671;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending video payload to broadcast extension...", (uint8_t *)&v4, 0x12u);
  }
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  return [*(id *)(a1 + 32) dispatchCompleted:*(void *)(a1 + 48)];
}

uint64_t sub_100030C5C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

intptr_t sub_100030C6C(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100030CC8(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.replaykit.broadcastSession.AudioSampleQueue", v3);
  uint64_t v2 = (void *)qword_100099CC0;
  qword_100099CC0 = (uint64_t)v1;
}

void sub_100030D84(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.replaykit.broadcastSession.VideoSampleQueue", v3);
  uint64_t v2 = (void *)qword_100099CD0;
  qword_100099CD0 = (uint64_t)v1;
}

void sub_100030F24(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5806 movieURL:0 showAlert:0];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemBroadcastSession handleSystemAlertStop]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 793;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100031090(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5806 movieURL:0 showAlert:0];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemBroadcastSession handleDeviceLockedWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 804;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000311FC(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5802 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemBroadcastSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 815;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000314F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPSystemBroadcastSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 829;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_1000316A0(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemBroadcastSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 846;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100031868(id a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemBroadcastSession handleFrontmostApplicationDidChange:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 867;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d replayd sending frontmost app bundleID to broadcast extension...", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100031A4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100032B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:a2 error:a3 withHandler:*(void *)(a1 + 40)];
}

id sub_100032B30(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

id sub_100032B44(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

id sub_100032B58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

id sub_100032B6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

id sub_100032B80(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) notifyClientWithOutputURL:0 error:a2 withHandler:*(void *)(a1 + 40)];
}

void sub_100032F44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000531FC();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 2;
    int v4 = [*(id *)(*(void *)(a1 + 32) + 8) reportingAgent];
    [v4 resetReportingMetrics];

    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = [v5 clientBundleID];
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, [*(id *)(*(void *)(a1 + 32) + 8) cameraEnabled], [*(id *)(*(void *)(a1 + 32) + 8) microphoneEnabled]);
  }
}

void sub_100033188(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053280();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100033460(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 497;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0, 0);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppRecordingWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 503;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 8) cameraEnabled] [*(id *)(*(void *)(a1 + 32) + 8) microphoneEnabled];
    }
  }
}

uint64_t sub_100033760(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    uint64_t v4 = "-[RPClient discardInAppRecordingWithHandler:]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 514;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d In app recording has been discared", (uint8_t *)&v3, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100033AF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053304();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 1;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) reportingAgent];
    [v4 resetReportingMetrics];

    __int16 v5 = *(void **)(a1 + 32);
    int v6 = [v5 clientBundleID];
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, [*(id *)(*(void *)(a1 + 32) + 16) cameraEnabled], [*(id *)(*(void *)(a1 + 32) + 16) microphoneEnabled]);
  }
}

void sub_100033D38(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053388();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100033FF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 579;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0, 0);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppCaptureWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 585;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 16) cameraEnabled] [*(id *)(*(void *)(a1 + 32) + 16) microphoneEnabled];
    }
  }
}

void sub_1000346B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053490();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 3;
    uint64_t v4 = *(id **)(a1 + 32);
    uint64_t v5 = [v4[3] broadcastHostBundleId];
    int v6 = [*(id *)(a1 + 32) clientBundleID];
    [v4 beginPrivacyAccountingIntervalwithSource:v5 withDestination:v6];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id, id))(v7 + 16))(v7, v3, [*(id *)(*(void *)(a1 + 32) + 24) cameraEnabled], [*(id *)(*(void *)(a1 + 32) + 24) microphoneEnabled]);
  }
}

void sub_1000348FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053514();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100034C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 672;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0, 0);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppBroadcastWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 678;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 24) cameraEnabled microphoneEnabled];
    }
  }
}

void sub_10003508C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053598();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 4;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) reportingAgent];
    [v4 resetReportingMetrics];

    uint64_t v5 = *(void **)(a1 + 32);
    int v6 = [v5 clientBundleID];
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    [*(id *)(*(void *)(a1 + 32) + 32) setCameraEnabled:[*(id *)(*(void *)(a1 + 32) + 32) cameraEnabled] microphoneEnabled:[*(id *)(*(void *)(a1 + 32) + 32) microphoneEnabled]];
  }
}

void sub_1000352D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005361C();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10003558C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 743;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Not resuming with error %@", (uint8_t *)&v6, 0x1Cu);
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id, void, void))(v4 + 16))(v4, v3, 0, 0);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      uint64_t v7 = "-[RPClient resumeInAppClipWithContextID:completionHandler:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 749;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed", (uint8_t *)&v6, 0x12u);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 32) cameraEnabled] [*(id *)(*(void *)(a1 + 32) + 32) microphoneEnabled];
    }
  }
}

void sub_1000358B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446722;
      __int16 v8 = "-[RPClient exportClipToURL:duration:completionHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 761;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Clip not exported with error %@", (uint8_t *)&v7, 0x1Cu);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      __int16 v8 = "-[RPClient exportClipToURL:duration:completionHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 766;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully clipped", (uint8_t *)&v7, 0x12u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      uint64_t v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }
}

void sub_100035CF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000536A0();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 5;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 40) reportingAgent];
    [v4 resetReportingMetrics];

    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 clientBundleID];
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:0];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

void sub_100035F10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053724();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000360E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000537A8();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_1000362DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005382C();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPClient resumeSystemRecordingWithCompletionHandler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 855;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed system recording", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 == 0);
  }
}

void sub_1000368F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000538B0();
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 6;
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) reportingAgent];
    [v4 resetReportingMetrics];

    int v5 = *(id **)(a1 + 32);
    id v6 = [v5[6] broadcastHostBundleId];
    __int16 v7 = [*(id *)(a1 + 32) clientBundleID];
    [v5 beginPrivacyAccountingIntervalwithSource:v6 withDestination:v7];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

void sub_100036B2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053934();
    }
  }
  else
  {
    [*(id *)(a1 + 32) endPrivacyAccountingInterval];
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100036D08(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000539B8();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 56) = 0;
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    id v6 = "-[RPClient resumeSystemBroadcastWithCompletionHandler:]_block_invoke";
    __int16 v7 = 1024;
    int v8 = 931;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully resumed system broadcast", (uint8_t *)&v5, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, BOOL))(v4 + 16))(v4, v3 == 0);
  }
}

uint64_t sub_100037BF4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100038A78(id a1)
{
  qword_100099CE0 = objc_alloc_init(RPAngelProxy);

  _objc_release_x1();
}

void sub_100038B08(id a1)
{
  qword_100099CF0 = (uint64_t)dispatch_queue_create("com.replaykitangel.angelProxyConnectionQueue", 0);

  _objc_release_x1();
}

void sub_100038B9C(id a1)
{
  id v5 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.ReplayKitAngel.session"];
  int v1 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___RPAngelServerProtocol];
  [v5 setServer:v1];

  uint64_t v2 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___RPAngelClientProtocol];
  [v5 setClient:v2];

  [v5 setClientMessagingExpectation:0];
  id v3 = [v5 copy];
  uint64_t v4 = (void *)qword_100099D00;
  qword_100099D00 = (uint64_t)v3;
}

void sub_100038E38(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 connectionManagerQueue];
  [v4 setTargetQueue:v5];

  id v6 = +[BSServiceQuality userInitiated];
  [v4 setServiceQuality:v6];

  __int16 v7 = [*(id *)(a1 + 32) getBSServiceInterface];
  [v4 setInterface:v7];

  [v4 setInterfaceTarget:*(void *)(a1 + 32)];
  [v4 setActivationHandler:&stru_100085E30];
  [v4 setInterruptionHandler:&stru_100085E50];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100039110;
  v8[3] = &unk_100085E78;
  void v8[4] = *(void *)(a1 + 32);
  [v4 setInvalidationHandler:v8];
}

void sub_100038F60(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelProxy setupConnection]_block_invoke_2";
    __int16 v5 = 1024;
    int v6 = 86;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activation handler", (uint8_t *)&v3, 0x12u);
  }
}

void sub_100039034(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    id v4 = "-[RPAngelProxy setupConnection]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 89;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Interruption handler", (uint8_t *)&v3, 0x12u);
  }
  [(BSServiceConnectionContext *)v2 activate];
}

void sub_100039110(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446466;
    __int16 v7 = "-[RPAngelProxy setupConnection]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 93;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Invalidation handler", (uint8_t *)&v6, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  __int16 v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

void sub_100039FDC(uint64_t a1, char a2)
{
  if (a2)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136446466;
      uint64_t v4 = "-[RPAngelProxy resumeCurrentSystemSession]_block_invoke";
      __int16 v5 = 1024;
      int v6 = 200;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel resume recording success", (uint8_t *)&v3, 0x12u);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136446466;
      uint64_t v4 = "-[RPAngelProxy resumeCurrentSystemSession]_block_invoke";
      __int16 v5 = 1024;
      int v6 = 197;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel failed to resume recording", (uint8_t *)&v3, 0x12u);
    }
    [*(id *)(a1 + 32) hideAndStopRecordingBanner];
  }
}

void sub_10003A5CC(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    long long v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
    __int16 v25 = 1024;
    int v26 = 267;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v4 = (id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v5 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  *((void *)*v4 + 4) = malloc_type_malloc(0xA0uLL, 0x1020040115CD000uLL);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 32);
  long long v7 = *(_OWORD *)(*(void *)(a1 + 32) + 72);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 88);
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(*(void *)(a1 + 32) + 56);
  *(void *)(v6 + 40) = v8;
  *(_OWORD *)(v6 + 24) = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  *(_OWORD *)(v9 + 96) = *(_OWORD *)&kCMTimeInvalid.value;
  *(void *)(v9 + 112) = kCMTimeInvalid.epoch;
  if ((objc_msgSend(*v4, "handleStartAudioQueueFailed:didFailHandler:", AudioQueueNewInput((const AudioStreamBasicDescription *)(*((void *)*v4 + 4) + 8), (AudioQueueInputCallback)sub_10003AB44, *v4, 0, 0, 0x800u, *((AudioQueueRef **)*v4 + 4)), *(void *)(a1 + 48)) & 1) == 0)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136446466;
      long long v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 287;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Created Audio Queue Input", buf, 0x12u);
    }
    int v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = *(id *)(a1 + 64);
    if (v10)
    {
      id v13 = [v10 newAudioTapForAudioCaptureConfig:v11, v12];
      if (v13)
      {
        unsigned int v14 = v13;
        if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueSetProperty(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x71746F62u, v13, 8u), *(void *)(a1 + 48)) & 1) == 0)
        {
          if (dword_100099BB8 <= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = 136446466;
            long long v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
            __int16 v25 = 1024;
            int v26 = 299;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully set Audio Queue Process Tap", buf, 0x12u);
          }
          UInt32 ioDataSize = 40;
          if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueGetProperty(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x61716674u, (void *)(*(void *)(*(void *)(a1 + 32) + 32) + 8), &ioDataSize), *(void *)(a1 + 48)) & 1) == 0)
          {
            *(_DWORD *)(*((void *)*v4 + 4) + 136) = 4096;
            for (uint64_t i = 48; i != 128; i += 8)
            {
              AudioQueueAllocateBuffer(**((AudioQueueRef **)*v4 + 4), *(_DWORD *)(*((void *)*v4 + 4) + 136), (AudioQueueBufferRef *)(*((void *)*v4 + 4) + i));
              AudioQueueEnqueueBuffer(**((AudioQueueRef **)*v4 + 4), *(AudioQueueBufferRef *)(*((void *)*v4 + 4) + i), 0, 0);
            }
            *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 144) = 0;
            *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 32) + 152) = 1;
            if ((objc_msgSend(*(id *)(a1 + 32), "handleStartAudioQueueFailed:didFailHandler:", AudioQueueAddPropertyListener(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_10003ACC0, *(void **)(a1 + 32)), *(void *)(a1 + 48)) & 1) == 0)
            {
              uint64_t v16 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              if (v16 == -66665)
              {
                if (dword_100099BB8 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 136446466;
                  long long v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  __int16 v25 = 1024;
                  int v26 = 330;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AudioQueueStart retry after can not start yet error", buf, 0x12u);
                }
                sleep(1u);
                uint64_t v16 = AudioQueueStart(**((AudioQueueRef **)*v4 + 4), 0);
              }
              if (([*(id *)(a1 + 32) handleStartAudioQueueFailed:v16 didFailHandler:*(void *)(a1 + 48)] & 1) == 0)
              {
                if (dword_100099BB8 <= 1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)CMTime buf = 136446466;
                  long long v24 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
                  __int16 v25 = 1024;
                  int v26 = 338;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Successfully started Audio Queue Recording", buf, 0x12u);
                }
                id v17 = objc_retainBlock(*(id *)(a1 + 48));
                uint64_t v18 = *(void *)(a1 + 32);
                long long v19 = *(void **)(v18 + 24);
                *(void *)(v18 + 24) = v17;
              }
            }
          }
        }
LABEL_33:

        return;
      }
    }
    else
    {
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100053D04((uint64_t *)(a1 + 32));
    }
    uint64_t v20 = *(void *)(a1 + 48);
    long long v21 = +[NSError _rpUserErrorForCode:-5803 userInfo:0];
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);

    unsigned int v14 = 0;
    goto LABEL_33;
  }
}

void sub_10003AB44(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  id v10 = a1;
  memset(&v23, 0, sizeof(v23));
  CMClockMakeHostTimeFromSystemUnits(&v23, *(void *)(a4 + 8));
  CMTimeValue value = v23.value;
  CMTimeScale timescale = v23.timescale;
  CMTime time1 = *(CMTime *)((unsigned char *)v10 + 4);
  CMTime time2 = kCMTimeInvalid;
  if (CMTimeCompare(&time1, &time2)
    && value
    && *((void *)v10 + 12) >= value
    && dword_100099BB8 <= 2
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100053DAC(value, timescale);
  }
  id v13 = *((void *)v10 + 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003B654;
  block[3] = &unk_100085F20;
  CMTime v19 = v23;
  id v16 = v10;
  uint64_t v17 = a3;
  int v20 = a5;
  uint64_t v18 = a6;
  id v14 = v10;
  dispatch_async(v13, block);
}

void sub_10003ACC0(void *a1, OpaqueAudioQueue *a2, int a3)
{
  __int16 v5 = a1;
  UInt32 ioDataSize = 4;
  int outData = 0;
  if (a3 == 1634824814)
  {
    if (AudioQueueGetProperty(a2, 0x6171726Eu, &outData, &ioDataSize))
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100053E40();
      }
    }
    else
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)CMTime buf = 136446722;
        id v14 = "isRunningListenerCallback";
        __int16 v15 = 1024;
        int v16 = 238;
        __int16 v17 = 1024;
        int v18 = outData;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: isRunningListenerCallback with isRunning %d", buf, 0x18u);
      }
      uint64_t v6 = v5[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003BBD0;
      block[3] = &unk_100085A50;
      long long v7 = v5;
      uint64_t v9 = v7;
      int v10 = outData;
      dispatch_async(v6, block);
      AudioQueueRemovePropertyListener(*v7[4], 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_10003ACC0, v7);
    }
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100053EC4();
  }
}

id sub_10003AED4(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  id result = *(id *)(a2 + 64);
  *(void *)(a1 + 64) = result;
  return result;
}

void sub_10003AF08(uint64_t a1)
{
}

void sub_10003AF28(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = +[NSError _rpUserErrorForCode:-5833 userInfo:0];
    int v4 = 136446722;
    __int16 v5 = "-[RPAppAudioCaptureManager resumeWithConfig:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 356;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Error: %@", (uint8_t *)&v4, 0x1Cu);
  }
}

void sub_10003B0A0(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
    __int16 v13 = 1024;
    int v14 = 363;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 32);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 152))
    {
      *(_DWORD *)(v5 + 152) = 0;
      if (AudioQueueStop(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 1u))
      {
        if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100053FCC();
        }
      }
      else
      {
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime buf = 136446466;
          id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 378;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue successfully stopped", buf, 0x12u);
        }
        for (uint64_t i = 48; i != 128; i += 8)
        {
          OSStatus v7 = AudioQueueFreeBuffer(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(*(void *)(*(void *)(a1 + 32) + 32) + i));
          if (v7) {
            BOOL v8 = dword_100099BB8 > 2;
          }
          else {
            BOOL v8 = 1;
          }
          if (!v8)
          {
            OSStatus v9 = v7;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)CMTime buf = 136446722;
              id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
              __int16 v13 = 1024;
              int v14 = 385;
              __int16 v15 = 1024;
              OSStatus v16 = v9;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d AudioQueueFreeBuffer error: %i", buf, 0x18u);
            }
          }
        }
        if (AudioQueueDispose(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 1u))
        {
          if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            sub_100053F48();
          }
        }
        else if (dword_100099BB8 <= 1 {
               && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        }
        {
          *(_DWORD *)CMTime buf = 136446466;
          id v12 = "-[RPAppAudioCaptureManager stop]_block_invoke";
          __int16 v13 = 1024;
          int v14 = 391;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Audio Queue has been disposed", buf, 0x12u);
        }
      }
    }
    AudioQueueRemovePropertyListener(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_10003ACC0, *(void **)(a1 + 32));
    free(*(void **)(*(void *)(a1 + 32) + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  int v10 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;
}

void sub_10003B5E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B654(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 32)) {
    return;
  }
  uint64_t v4 = (long long *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 56);
  int v5 = *(_DWORD *)(a1 + 64);
  *(_OWORD *)CMTime time1 = *(_OWORD *)(v1 + 96);
  *(void *)&time1[16] = *(void *)(v1 + 112);
  CMTime time2 = kCMTimeInvalid;
  if (CMTimeCompare((CMTime *)time1, &time2))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 96) >= v3)
    {
      if (dword_100099BB8 <= 2)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100054368(v3, v5);
        }
        uint64_t v6 = *(void *)(a1 + 32);
      }
      if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(v6 + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0)) {
        BOOL v7 = dword_100099BB8 > 2;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000542E4();
      }
      return;
    }
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime time1 = 136446722;
    *(void *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 147;
    *(_WORD *)&time1[18] = 2048;
    *(double *)&time1[20] = (float)((float)v3 / (float)v5);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: first sample received at time %.3f", time1, 0x1Cu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  long long v9 = *v4;
  *(void *)(v8 + 112) = *((void *)v4 + 2);
  *(_OWORD *)(v8 + 96) = v9;
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v10 + 40))
  {
    *(unsigned char *)(v10 + 40) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(void *)(v10 + 48))
    {
      uint64_t v11 = +[NSDate date];
      [v11 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 48)];
      if (v12 > 0.0)
      {
        Float64 v13 = v12;
        if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)CMTime time1 = 136446466;
          *(void *)&time1[4] = "handleInputBuffer_block_invoke";
          *(_WORD *)&time1[12] = 1024;
          *(_DWORD *)&time1[14] = 159;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: gap since last audio tap, filling with empty sample buffer", time1, 0x12u);
        }
        uint64_t v14 = *(void *)(a1 + 32);
        CMTime time2 = kCMTimeZero;
        long long v15 = *(_OWORD *)(v14 + 72);
        *(_OWORD *)CMTime time1 = *(_OWORD *)(v14 + 56);
        *(_OWORD *)&time1[16] = v15;
        uint64_t v33 = *(void *)(v14 + 88);
        CMSampleBufferRef v16 = sub_100049538(&time2, (uint64_t)time1, v13);
        (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
        if (v16) {
          CFRelease(v16);
        }
      }

      uint64_t v10 = *(void *)(a1 + 32);
    }
  }
  uint64_t v17 = *(void *)(v10 + 32);
  if (*(_DWORD *)(v17 + 152) == 2)
  {
    unsigned int v18 = *(_DWORD *)(a1 + 80);
    if (!v18)
    {
      unsigned int v19 = *(_DWORD *)(v17 + 24);
      if (v19) {
        unsigned int v18 = *(_DWORD *)(*(void *)(a1 + 40) + 16) / v19;
      }
      else {
        unsigned int v18 = 0;
      }
    }
    CMAudioFormatDescriptionRef formatDescriptionOut = 0;
    time2.CMTimeValue value = 0;
    CMBlockBufferRef destinationBuffer = 0;
    if (!CMAudioFormatDescriptionCreate(kCFAllocatorDefault, (const AudioStreamBasicDescription *)(v17 + 8), 0, 0, 0, 0, 0, &formatDescriptionOut))
    {
      size_t v20 = *(unsigned int *)(*(void *)(a1 + 40) + 16);
      if (!CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, 0, v20, kCFAllocatorDefault, 0, 0, v20, 1u, &destinationBuffer)&& !CMBlockBufferReplaceDataBytes(*(const void **)(*(void *)(a1 + 40) + 8), destinationBuffer, 0, *(unsigned int *)(*(void *)(a1 + 40) + 16)))
      {
        CMItemCount v21 = *(unsigned int *)(a1 + 80);
        __int16 v22 = *(const AudioStreamPacketDescription **)(a1 + 48);
        *(_OWORD *)CMTime time1 = *v4;
        *(void *)&time1[16] = *((void *)v4 + 2);
        if (!CMAudioSampleBufferCreateReadyWithPacketDescriptions(kCFAllocatorDefault, destinationBuffer, formatDescriptionOut, v21, (CMTime *)time1, v22, (CMSampleBufferRef *)&time2))
        {
          CMTime v23 = +[NSDate date];
          CMSampleBufferGetDuration(&time, (CMSampleBufferRef)time2.value);
          uint64_t v24 = [v23 dateByAddingTimeInterval:CMTimeGetSeconds(&time)];
          uint64_t v25 = *(void *)(a1 + 32);
          int v26 = *(void **)(v25 + 48);
          *(void *)(v25 + 48) = v24;

          uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 16);
          if (v27) {
            (*(void (**)(uint64_t, CMTimeValue))(v27 + 16))(v27, time2.value);
          }
        }
      }
    }
    if (time2.value) {
      CFRelease((CFTypeRef)time2.value);
    }
    if (destinationBuffer) {
      CFRelease(destinationBuffer);
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 144) += v18;
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime time1 = 136446466;
    *(void *)&time1[4] = "handleInputBuffer_block_invoke";
    *(_WORD *)&time1[12] = 1024;
    *(_DWORD *)&time1[14] = 168;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAppAudioCaptureManager: recorder is not running, ignoring audio data", time1, 0x12u);
  }
  if (AudioQueueEnqueueBuffer(**(AudioQueueRef **)(*(void *)(a1 + 32) + 32), *(AudioQueueBufferRef *)(a1 + 40), 0, 0)&& dword_100099BB8 <= 2&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100054260();
  }
}

uint64_t sub_10003BBD0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 152) == 1)
    {
      uint64_t v3 = result;
      if (*(_DWORD *)(result + 40))
      {
        id result = *(void *)(v1 + 24);
        if (result)
        {
          id result = (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
          uint64_t v2 = *(void *)(*(void *)(v3 + 32) + 32);
        }
        *(_DWORD *)(v2 + 152) = 2;
      }
    }
  }
  return result;
}

double sub_10003BC38(double a1, float a2)
{
  return a2;
}

double sub_10003BC58@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)(v3 - 8) = a3;
  return (float)((float)a1 / (float)a2);
}

char *sub_10003BF0C(int a1)
{
  unint64_t v1 = dword_100099D44++;
  uint64_t v2 = (char *)&unk_100099D10 + 5 * (v1 % 0xA);
  *uint64_t v2 = HIBYTE(a1);
  v2[1] = BYTE2(a1);
  v2[2] = BYTE1(a1);
  v2[3] = a1;
  void v2[4] = 0;
  return v2;
}

uint64_t sub_10003BF6C(char *a1)
{
  return (a1[1] << 16) | (*a1 << 24) | (a1[2] << 8) | a1[3];
}

uint64_t sub_10003CB84(uint64_t a1)
{
  uint64_t v2 = +[RPCaptureManager sharedInstance];
  [v2 stopCaptureForDelegate:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) setSessionState:3];
  [*(id *)(a1 + 32) reportSummaryEvent:0 recordedFileSize:0];
  [*(id *)(*(void *)(a1 + 32) + 432) invalidateConnection];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 432);
  *(void *)(v3 + 432) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

id sub_10003D2D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startCaptureWithHandler:*(void *)(a1 + 40)];
}

void sub_10003D4D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054640();
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      int v5 = *(void (**)(void))(v4 + 16);
LABEL_12:
      v5();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446466;
      uint64_t v8 = "-[RPBroadcastSession startCaptureWithHandler:]_block_invoke";
      __int16 v9 = 1024;
      int v10 = 244;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d startCapture has started successfully", (uint8_t *)&v7, 0x12u);
    }
    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      int v5 = *(void (**)(void))(v6 + 16);
      goto LABEL_12;
    }
  }
}

id sub_10003D7A8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) recordingDidPause];
}

uint64_t sub_10003D960(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003D970(id a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPBroadcastSession resumeSessionWithWindowLayerContextID:completionHandler:]_block_invoke_2";
    __int16 v3 = 1024;
    int v4 = 275;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying extension of resume", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10003DDB0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_10003DE08(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
  {
    [*(id *)(a1 + 40) disableBroadcast];
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    int v5 = "-[RPBroadcastSession enableBroadcastWithListenerEndpoint:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 299;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connection to extensions ready", (uint8_t *)&v4, 0x12u);
  }
}

void sub_10003DEF8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastServiceInfo:v3];
}

void sub_10003DF54(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastURL:v3];
}

void sub_10003DFB0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleBroadcastError:v3];
}

id sub_10003E19C(uint64_t a1)
{
  [*(id *)(a1 + 32) showAlertForBroadcastSessionWithError:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:0];
}

void sub_10003E3CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc((Class)NSKeyedUnarchiver);
  uint64_t v5 = *(void *)(a1 + 32);
  id v16 = 0;
  id v6 = [v4 initForReadingFromData:v5 error:&v16];
  id v7 = v16;
  uint64_t v8 = [v6 decodeObjectOfClass:objc_opt_class() forKey:NSKeyedArchiveRootObjectKey];
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(void **)(v9 + 384);
  *(void *)(v9 + 384) = v3;
  id v11 = v3;

  objc_storeStrong((id *)(*(void *)(a1 + 40) + 392), *(id *)(a1 + 48));
  uint64_t v12 = *(void *)(a1 + 40);
  Float64 v13 = *(void **)(v12 + 448);
  *(void *)(v12 + 448) = v8;
  id v14 = v8;

  *(void *)(*(void *)(a1 + 40) + 424) = 1;
  uint64_t v15 = *(void *)(a1 + 40) + 400;
  *(void *)(v15 + 16) = kCMTimeZero.epoch;
  *(_OWORD *)uint64_t v15 = *(_OWORD *)&kCMTimeZero.value;
  [*(id *)(a1 + 40) setupDispatchLimits];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10003E694(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6 && [v5 count])
  {
    uint64_t v8 = [v5 firstObject];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003E7A8;
    v10[3] = &unk_1000854E0;
    uint64_t v9 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    +[NSExtension extensionsWithMatchingPointName:@"com.apple.broadcast-services" baseIdentifier:v9 unwantedActivationRule:@"NSExtensionActivationSupportsReplayKitStreaming" completion:v10];
  }
}

uint64_t sub_10003E7A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    if (!a3)
    {
      uint64_t v8 = v5;
      if ([v5 count])
      {
        id v6 = [v8 firstObject];
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }

  return _objc_release_x1();
}

void sub_10003E888(id a1)
{
  qword_100099D48 = (uint64_t)dispatch_queue_create("com.apple.replaykit.BroadcastSessionDispatchQueue", 0);

  _objc_release_x1();
}

void sub_10003EA54(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000546C4(a1, (uint64_t)v3);
  }
  [*(id *)(a1 + 40) notifyClientSessionDidStopWithError:[*(id *)(a1 + 32) code] movieURL:0 showAlert:1];
}

id sub_10003F588(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 432);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003F610;
  _OWORD v6[3] = &unk_100085CE0;
  uint64_t v4 = a1[7];
  void v6[5] = a1[6];
  v6[6] = v4;
  void v6[4] = v2;
  return [v3 processPayload:v1 completion:v6];
}

id sub_10003F610(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    int v5 = 136446722;
    id v6 = "-[RPBroadcastSession notifyExtensionOfAudioSampleBuffer:withType:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 629;
    __int16 v9 = 2048;
    uint64_t v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending %ld audio payload to broadcast extension...", (uint8_t *)&v5, 0x1Cu);
  }
  id v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
  return [*(id *)(a1 + 32) dispatchCompleted:*(void *)(a1 + 40)];
}

id sub_10003FA34(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  id v3 = *(void **)(v2 + 432);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003FABC;
  _OWORD v7[3] = &unk_100085CE0;
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  void v7[4] = v2;
  v7[5] = v4;
  v7[6] = v5;
  return [v3 processPayload:v1 completion:v7];
}

id sub_10003FABC(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPBroadcastSession notifyExtensionOfVideoSampleBuffer:withType:sampleOrientation:]_block_invoke_2";
    __int16 v6 = 1024;
    int v7 = 679;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Sending video payload to broadcast extension...", (uint8_t *)&v4, 0x12u);
  }
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  return [*(id *)(a1 + 32) dispatchCompleted:*(void *)(a1 + 48)];
}

uint64_t sub_10003FEDC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

intptr_t sub_10003FEEC(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10003FF48(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.replaykit.broadcastSession.AudioSampleQueue", v3);
  uint64_t v2 = (void *)qword_100099D58;
  qword_100099D58 = (uint64_t)v1;
}

void sub_100040004(id a1)
{
  id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v1 = dispatch_queue_create("com.replaykit.broadcastSession.VideoSampleQueue", v3);
  uint64_t v2 = (void *)qword_100099D68;
  qword_100099D68 = (uint64_t)v1;
}

void sub_1000402B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPBroadcastSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 810;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_1000406E8(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5801 movieURL:0 showAlert:0];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPBroadcastSession handleClientApplicationDidEnterForeground]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 841;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10004090C(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5807 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPBroadcastSession handleDisplayWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 854;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100040C0C(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5802 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPBroadcastSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 883;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100040E30(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPBroadcastSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 895;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

__CFData *sub_100041028(CGImage *a1, void *a2, void *a3, BOOL *a4)
{
  CFDictionaryRef v7 = a2;
  __int16 v8 = a3;
  int v9 = +[NSMutableData data];
  *a4 = 0;
  __int16 v10 = CGImageDestinationCreateWithData(v9, v8, 1uLL, 0);

  if (v10)
  {
    CGImageDestinationAddImage(v10, a1, v7);
    *a4 = CGImageDestinationFinalize(v10);
    CFRelease(v10);
  }
  else if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100054B24();
  }

  return v9;
}

void sub_1000416F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFDictionaryRef v7 = v6;
  if (!v5 || v6)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054D28();
    }
  }
  else
  {
    uint64_t v8 = +[NSString stringWithString:v5];
    uint64_t v9 = *(void *)(a1 + 32);
    __int16 v10 = *(void **)(v9 + 384);
    *(void *)(v9 + 384) = v8;

    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446722;
      uint64_t v12 = "-[RPSystemRecordSession startSystemRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 64;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d connect to angel, sessionID=%@", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

void sub_100041858(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPSystemRecordSession: startWriting for movie writer has failed. Error: %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    id v5 = +[RPCaptureManager sharedInstance];
    id v6 = *(void **)(a1 + 32);
    id v7 = [v6 microphoneEnabled];
    [*(id *)(a1 + 32) windowSize];
    double v9 = v8;
    double v11 = v10;
    uint64_t v12 = [*(id *)(a1 + 32) contextID];
    __int16 v13 = +[NSArray arrayWithObject:v12];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100041A44;
    v15[3] = &unk_1000853B8;
    int v14 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v14;
    [v5 startCaptureForDelegate:v6 forProcessID:0xFFFFFFFFLL shouldStartMicrophoneCapture:v7 windowSize:1 systemRecording:v13 contextIDs:v9 mixedRealityCamera:v11 didStartHandler:v15];
  }
}

void sub_100041A44(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPSystemRecordSession: startCapture has failed. Error: %@", (uint8_t *)&v9, 0xCu);
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      id v6 = *(void (**)(void))(v5 + 16);
LABEL_14:
      v6();
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPSystemRecordSession: startCapture has started successfully", (uint8_t *)&v9, 2u);
    }
    [*(id *)(a1 + 32) setSessionState:1];
    [*(id *)(a1 + 32) setUpStatusBarAssertionWithServiceName:0];
    [*(id *)(a1 + 32) checkAndPlaySystemSessionSound:1];
    if ([*(id *)(a1 + 32) cameraEnabled])
    {
      id v7 = +[RPAngelProxy sharedInstance];
      [v7 enableCameraPip];
    }
    if ([*(id *)(a1 + 32) microphoneEnabled]) {
      *(unsigned char *)(*(void *)(a1 + 32) + 392) = 1;
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v6 = *(void (**)(void))(v8 + 16);
      goto LABEL_14;
    }
  }
}

void sub_100041E70(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) setSessionState:3];
  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [v3 code];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 376) outputURL];
  [v4 reportSummaryEvent:v5 recordedFileSize:[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v6)];

  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054DB8();
    }
    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:v3];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_12:
      v8();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446466;
      double v11 = "-[RPSystemRecordSession stopSystemRecordingWithHandler:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = 180;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finishWritingAndSaveToCameraRoll encountered no error", (uint8_t *)&v10, 0x12u);
    }
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v8 = *(void (**)(void))(v9 + 16);
      goto LABEL_12;
    }
  }
}

void sub_10004222C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setSessionState:3];
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = [v6 code];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 376) outputURL];
  [v7 reportSummaryEvent:v8 recordedFileSize:[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v9)];

  if (v6)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100054ECC();
    }
    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:v6];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      double v11 = *(void (**)(void))(v10 + 16);
LABEL_12:
      v11();
    }
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136446466;
      int v14 = "-[RPSystemRecordSession stopSystemRecordingWithURLHandler:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 222;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d writing movie finished", (uint8_t *)&v13, 0x12u);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12)
    {
      double v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_12;
    }
  }
}

id *sub_1000427E8(id *result, opaqueCMSampleBuffer *a2)
{
  id v3 = result;
  int v4 = *((_DWORD *)result + 12);
  switch(v4)
  {
    case 2:
      if (([result[4] microphoneEnabled] & 1) == 0)
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a2);
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
      }
      double v11 = (void *)*((void *)v3[4] + 47);
      return (id *)[v11 appendAudio2SampleBuffer:a2];
    case 1:
      id v8 = (void *)*((void *)result[4] + 47);
      return (id *)[v8 appendAudio1SampleBuffer:a2];
    case 0:
      id v5 = result[4];
      uint64_t v6 = (uint64_t)v3[5];
      uint64_t v7 = v5[47];
      return (id *)[v5 processSampleBuffer:a2 transformFlags:v6 movieWriter:v7];
  }
  return result;
}

void sub_10004298C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100054F50(a1, (uint64_t)v3);
  }
  [*(id *)(a1 + 40) notifyClientSessionDidStopWithError:[*(id *)(a1 + 32) code] movieURL:0 showAlert:1];
}

void sub_100042A68(id a1)
{
  qword_100099D78 = (uint64_t)dispatch_queue_create("com.apple.replaykit.SystemRecordSessionDispatchQueue", 0);

  _objc_release_x1();
}

void sub_100042BE8(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5806 movieURL:0 showAlert:0];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemRecordSession handleSystemAlertStop]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 338;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000430A4(uint64_t a1)
{
  uint64_t v2 = +[NSError _rpUserErrorForCode:-5805 userInfo:0];
  [*(id *)(a1 + 32) reportSessionEndReason:v2];
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5805 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 360;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage", (uint8_t *)&v3, 0x12u);
  }
}

void sub_1000431B0(uint64_t a1)
{
  uint64_t v2 = +[NSError _rpUserErrorForCode:-5805 userInfo:0];
  [*(id *)(a1 + 32) reportSessionEndReason:v2];
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5805 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 372;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage", (uint8_t *)&v3, 0x12u);
  }
}

void sub_1000432BC(uint64_t a1)
{
  uint64_t v2 = +[NSError _rpUserErrorForCode:-5805 userInfo:0];
  [*(id *)(a1 + 32) reportSessionEndReason:v2];
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5805 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    int v4 = "-[RPSystemRecordSession handleMemoryWarning]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 381;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Notifying client, stopped due to insufficient storage", (uint8_t *)&v3, 0x12u);
  }
}

void sub_100043508(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5811 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemRecordSession handleIncomingCallWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 395;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10004371C(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5806 movieURL:0 showAlert:0];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemRecordSession handleDeviceLockedWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 407;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100043930(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5802 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemRecordSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 419;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100043D84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPSystemRecordSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 448;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_100043FD4(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPSystemRecordSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 466;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100044684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000446A4(uint64_t a1)
{
  uint64_t v15 = 0;
  int v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100044A2C;
  unsigned int v19 = sub_100044A3C;
  id v20 = 0;
  uint64_t v2 = +[PHPhotoLibrary sharedPhotoLibrary];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136446466;
    __int16 v22 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke";
    __int16 v23 = 1024;
    int v24 = 45;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Start Save to Photos", buf, 0x12u);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100044A44;
  v12[3] = &unk_100086060;
  id v13 = *(id *)(a1 + 32);
  int v14 = &v15;
  id v11 = 0;
  unsigned int v3 = [v2 performChangesAndWait:v12 error:&v11];
  id v4 = v11;
  if (v3)
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      *(_DWORD *)CMTime buf = 136446722;
      __int16 v22 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke_2";
      __int16 v23 = 1024;
      int v24 = 59;
      __int16 v25 = 2048;
      uint64_t v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Save to Photos Video saved to camera roll successfully. Video duration: %.2f seconds", buf, 0x1Cu);
    }
    ct_green_tea_logger_create_static();
    int v6 = getCTGreenTeaOsLogHandle();
    uint64_t v7 = v6;
    if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CMTime buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "<Photos>[Photos][com.apple.ReplayKit]: Saved screen recording.", buf, 2u);
    }
  }
  else
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055000((uint64_t)v4);
    }
    uint64_t v8 = +[NSError _rpUserErrorForCode:-5831 userInfo:&__NSDictionary0__struct];

    +[RPPhotosUtility showAlertFailedSaveToPhotosWithError:v8];
    id v4 = (id)v8;
  }
  int v9 = +[NSFileManager defaultManager];
  [v9 _srRemoveFile:*(void *)(a1 + 32) completion:&stru_100086080];

  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, uint64_t, double))(v10 + 16))(v10, v4, v16[5], *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }

  _Block_object_dispose(&v15, 8);
}

void sub_100044A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100044A2C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100044A3C(uint64_t a1)
{
}

void sub_100044A44(uint64_t a1)
{
  id v7 = +[PHAssetCreationRequest creationRequestForAsset];
  id v2 = objc_alloc_init((Class)PHAssetResourceCreationOptions);
  [v2 setShouldMoveFile:1];
  [v7 addResourceWithType:2 fileURL:*(void *)(a1 + 32) options:v2];
  unsigned int v3 = [v7 placeholderForCreatedAsset];
  uint64_t v4 = [v3 localIdentifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100044AFC(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000550A4();
  }
}

void sub_100044C40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (dword_100099BB8 > 2 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (v5) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
    sub_100055124();
    if (!v5) {
LABEL_5:
    }
      id v5 = *(id *)(a1 + 32);
  }
  else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    int v9 = "+[RPPhotosUtility exportVideoToPhotosAsynchronously:mixAudioTracks:completionHandler:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = 98;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Mixing video audio tracks completed", (uint8_t *)&v8, 0x12u);
  }
LABEL_9:
  if (*(id *)(a1 + 32) != v5)
  {
    id v7 = +[NSFileManager defaultManager];
    [v7 _srRemoveFile:*(void *)(a1 + 32) completion:&stru_1000860C8];
  }
  +[RPPhotosUtility exportVideoToPhotosLibrary:v5 completionHandler:*(void *)(a1 + 40)];
}

void sub_100044DB8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000551A4();
  }
}

CFStringRef sub_100045254(unsigned int a1)
{
  if (a1 > 2) {
    return @"Invalid type";
  }
  else {
    return *(&off_1000861A8 + (int)a1);
  }
}

void sub_100045820(uint64_t a1)
{
  CFArrayRef SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(*(CMSampleBufferRef *)(a1 + 40), 1u);
  if (CFArrayGetCount(SampleAttachmentsArray))
  {
    CMTimeValue value = 0;
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
    if (CFDictionaryGetValueIfPresent(ValueAtIndex, kCMSampleAttachmentKey_NotSync, (const void **)&value)) {
      BOOL v4 = CFBooleanGetValue((CFBooleanRef)value) == 0;
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  [*(id *)(a1 + 32) updateLatestSampleTime:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 8) addFrameToBuffer:*(void *)(a1 + 40) isKeyFrame:v4];
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_100045A14(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLatestSampleTime:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) addFrameToBuffer:*(void *)(a1 + 40) isKeyFrame:1];
  id v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_100045BB0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLatestSampleTime:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) addFrameToBuffer:*(void *)(a1 + 40) isKeyFrame:1];
  id v2 = *(const void **)(a1 + 40);

  CFRelease(v2);
}

void sub_100045EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100045EE4(uint64_t a1)
{
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(int *)(a1 + 80);
    if (v2 > 2) {
      CFStringRef v3 = @"Invalid type";
    }
    else {
      CFStringRef v3 = *(&off_1000861A8 + v2);
    }
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) + 1;
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)CMTime buf = 136447234;
    id v29 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 170;
    __int16 v32 = 2112;
    *(void *)uint64_t v33 = v3;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = v4;
    *(_WORD *)&v33[18] = 2048;
    *(void *)&v33[20] = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@ block start, sample %lu out of %lu", buf, 0x30u);
  }
  if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
  {
    *(void *)&long long v6 = 136446722;
    long long v26 = v6;
    CFStringRef v7 = @"Invalid type";
    do
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
      if (*(unsigned char *)(v8 + 24)) {
        break;
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                                + 8)
                                                                                    + 24))
      {
        *(unsigned char *)(v8 + 24) = 1;
      }
      else
      {
        int v9 = (opaqueCMSampleBuffer *)[*(id *)(a1 + 40) objectAtIndex:];
        __int16 v10 = v9;
        uint64_t v11 = *(void *)(a1 + 48);
        if (!*(unsigned char *)(v11 + 112))
        {
          uint64_t v12 = *(void **)(v11 + 80);
          CMSampleBufferGetPresentationTimeStamp(&v27, v9);
          [v12 startSessionAtSourceTime:&v27];
          double v13 = sub_100049AA8(v10);
          *(_DWORD *)(*(void *)(a1 + 48) + 116) = LODWORD(v13);
          *(unsigned char *)(*(void *)(a1 + 48) + 112) = 1;
        }
        double v14 = sub_100049AA8(v10);
        if (*(float *)&v14 >= *(float *)(*(void *)(a1 + 48) + 116))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) appendSampleBuffer:v10] ^ 1;
          if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v15 = *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == 0;
            uint64_t v16 = *(int *)(a1 + 80);
            CFStringRef v17 = v7;
            if (v16 <= 2) {
              CFStringRef v7 = *(&off_1000861A8 + v16);
            }
            double v18 = sub_100049AA8(v10);
            *(_DWORD *)CMTime buf = 136447234;
            id v29 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 187;
            __int16 v32 = 1024;
            *(_DWORD *)uint64_t v33 = v15;
            *(_WORD *)&v33[4] = 2112;
            *(void *)&v33[6] = v7;
            *(_WORD *)&v33[14] = 2048;
            *(double *)&v33[16] = *(float *)&v18;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d did complete:%d append %@ sample with timestamp:%lf", buf, 0x2Cu);
            CFStringRef v7 = v17;
          }
        }
        uint64_t v19 = *(void *)(a1 + 56);
        if (*(unsigned char *)(a1 + 84) && !*(void *)(*(void *)(v19 + 8) + 24))
        {
          if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)CMTime buf = v26;
            id v29 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
            __int16 v30 = 1024;
            int v31 = 192;
            __int16 v32 = 2048;
            *(void *)uint64_t v33 = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d releasing idle video sample %p", buf, 0x1Cu);
          }
          CFRelease(v10);
          uint64_t v19 = *(void *)(a1 + 56);
        }
        ++*(void *)(*(void *)(v19 + 8) + 24);
      }
    }
    while ([*(id *)(a1 + 32) isReadyForMoreMediaData:v26] & 1) != 0);
  }
  if (!dword_100099BB8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(int *)(a1 + 80);
    if (v20 > 2) {
      CFStringRef v21 = @"Invalid type";
    }
    else {
      CFStringRef v21 = *(&off_1000861A8 + v20);
    }
    unsigned int v22 = [*(id *)(a1 + 32) isReadyForMoreMediaData:v26];
    int v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    *(_DWORD *)CMTime buf = 136447234;
    id v29 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
    __int16 v30 = 1024;
    int v31 = 201;
    __int16 v32 = 2112;
    *(void *)uint64_t v33 = v21;
    *(_WORD *)&v33[8] = 1024;
    *(_DWORD *)&v33[10] = v22;
    *(_WORD *)&v33[14] = 1024;
    *(_DWORD *)&v33[16] = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d %@ block isReady: %d, completedOrFailed: %d", buf, 0x28u);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    [*(id *)(a1 + 32) markAsFinished];
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 48) + 32));
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(int *)(a1 + 80);
      if (v24 > 2) {
        CFStringRef v25 = @"Invalid type";
      }
      else {
        CFStringRef v25 = *(&off_1000861A8 + v24);
      }
      *(_DWORD *)CMTime buf = 136446722;
      id v29 = "-[RPClipWriter queueAndWaitForSample:withAssetInput:withBuffer:didAppendIdleFrame:]_block_invoke";
      __int16 v30 = 1024;
      int v31 = 206;
      __int16 v32 = 2112;
      *(void *)uint64_t v33 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finished appending %@ samples", buf, 0x1Cu);
    }
  }
}

void sub_100046568(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v5 = 136446466;
    *(void *)&void v5[4] = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]_block_invoke";
    *(_WORD *)&v5[12] = 1024;
    *(_DWORD *)&v5[14] = 214;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finish asset writing", v5, 0x12u);
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 80);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a1 + 48);
  *(void *)&uint8_t v5[16] = *(void *)(a1 + 64);
  [v2 endSessionAtSourceTime:v5];
  if ([*(id *)(*(void *)(a1 + 32) + 80) finishWriting])
  {
    CFStringRef v3 = 0;
  }
  else
  {
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 80) error];
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055348((uint64_t)v4);
    }
    CFStringRef v3 = +[NSError _rpUserErrorForCode:-5823 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100046828(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) flushBuffer];
  [*(id *)(*(void *)(a1 + 32) + 16) flushBuffer];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v2 flushBuffer];
}

void sub_100046DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100046E54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100046E64(uint64_t a1)
{
}

uint64_t sub_100046E6C(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) copy];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1[4] + 16) copy];
  uint64_t v6 = *(void *)(a1[6] + 8);
  CFStringRef v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *(void *)(*(void *)(a1[7] + 8) + 40) = [*(id *)(a1[4] + 24) copy];

  return _objc_release_x1();
}

void sub_100046EF8(void *a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446466;
    uint64_t v6 = "-[RPClipWriter exportClipToURL:duration:completionHandler:]_block_invoke_2";
    __int16 v7 = 1024;
    int v8 = 262;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d flushing copied buffers and calling completion handler", (uint8_t *)&v5, 0x12u);
  }
  [*(id *)(*(void *)(a1[5] + 8) + 40) flushBuffer];
  [*(id *)(*(void *)(a1[6] + 8) + 40) flushBuffer];
  [*(id *)(*(void *)(a1[7] + 8) + 40) flushBuffer];
  uint64_t v4 = a1[4];
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10004706C(id a1)
{
  qword_100099D88 = (uint64_t)dispatch_queue_create("com.apple.replaykit.ClipWriterDispatchQueue", 0);

  _objc_release_x1();
}

void sub_10004756C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has failed. Error: %@", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void (**)(void))(v5 + 16);
LABEL_10:
      v6();
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has started successfully", (uint8_t *)&v8, 2u);
    }
    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7)
    {
      uint64_t v6 = *(void (**)(void))(v7 + 16);
      goto LABEL_10;
    }
  }
}

void sub_100047A00(id a1)
{
  qword_100099D98 = (uint64_t)dispatch_queue_create("com.apple.replaykit.CaptureSessionDispatchQueue", 0);

  _objc_release_x1();
}

void sub_100047BC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100055490(a1, (uint64_t)v3);
  }
  [*(id *)(a1 + 40) notifyClientSessionDidStopWithError:[*(id *)(a1 + 32) code] movieURL:0 showAlert:1];
}

void sub_100047F34(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5807 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    id v2 = "-[RPCaptureSession handleDisplayWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 250;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100048234(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5802 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    id v2 = "-[RPCaptureSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 279;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100048458(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:0 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    id v2 = "-[RPCaptureSession handleResumeContextIDFailure]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 291;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v1, 0x12u);
  }
}

void sub_10004874C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPCaptureSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 304;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t start()
{
  if ((_set_user_dir_suffix() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100055540();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "replayd Starting!", v3, 2u);
  }
  sub_1000245D0();
  int v1 = +[NSRunLoop mainRunLoop];
  [v1 run];

  return 0xFFFFFFFFLL;
}

uint64_t sub_100048B0C(uint64_t result)
{
  if (result <= 3) {
    dword_100099BB8 = result;
  }
  return result;
}

void sub_100048B74(id a1)
{
  qword_100099DA8 = objc_alloc_init(RPFeatureFlagUtility);

  _objc_release_x1();
}

CMSampleBufferRef sub_100048D60(IOSurfaceRef surface, const CMSampleTimingInfo *a2)
{
  CVPixelBufferRef pixelBufferOut = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  CVPixelBufferCreateWithIOSurface(kCFAllocatorDefault, surface, 0, &pixelBufferOut);
  CMVideoFormatDescriptionCreateForImageBuffer(0, pixelBufferOut, &formatDescriptionOut);
  CMSampleBufferCreateForImageBuffer(kCFAllocatorDefault, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, a2, &sampleBufferOut);
  if (pixelBufferOut) {
    CFRelease(pixelBufferOut);
  }
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  return sampleBufferOut;
}

CMSampleBufferRef sub_100048DFC(CVImageBufferRef imageBuffer, uint64_t a2)
{
  CMSampleBufferRef sampleBufferOut = 0;
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  long long v3 = *(_OWORD *)&kCMTimingInfoInvalid.decodeTimeStamp.value;
  *(_OWORD *)&v9.presentationTimeStamp.CMTimeScale timescale = *(_OWORD *)&kCMTimingInfoInvalid.presentationTimeStamp.timescale;
  *(_OWORD *)&v9.decodeTimeStamp.CMTimeValue value = v3;
  CMTimeEpoch epoch = kCMTimingInfoInvalid.decodeTimeStamp.epoch;
  long long v5 = *(_OWORD *)&kCMTimingInfoInvalid.duration.epoch;
  *(_OWORD *)&v9.duration.CMTimeValue value = *(_OWORD *)&kCMTimingInfoInvalid.duration.value;
  *(_OWORD *)&v9.duration.CMTimeEpoch epoch = v5;
  *(_OWORD *)&v9.presentationTimeStamp.CMTimeValue value = *(_OWORD *)a2;
  CMTimeEpoch v6 = *(void *)(a2 + 16);
  v9.decodeTimeStamp.CMTimeEpoch epoch = epoch;
  v9.presentationTimeStamp.CMTimeEpoch epoch = v6;
  if (!CMVideoFormatDescriptionCreateForImageBuffer(kCFAllocatorDefault, imageBuffer, &formatDescriptionOut))
  {
    OSStatus v7 = CMSampleBufferCreateReadyWithImageBuffer(kCFAllocatorDefault, imageBuffer, formatDescriptionOut, &v9, &sampleBufferOut);
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    if (!v7) {
      return sampleBufferOut;
    }
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1000555C8();
  }
  CMSampleBufferRef result = sampleBufferOut;
  if (sampleBufferOut)
  {
    CFRelease(sampleBufferOut);
    return 0;
  }
  return result;
}

CMSampleBufferRef sub_100048F00(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  CMItemCount numSampleTimingEntries = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CMSampleBufferGetSampleTimingInfoArray(a1, 0, 0, &numSampleTimingEntries);
  if ((unint64_t)numSampleTimingEntries >= 0x38E38E38E38E38FLL)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005564C();
    }
    return 0;
  }
  else
  {
    uint64_t v4 = (CMSampleTimingInfo *)malloc_type_malloc(72 * numSampleTimingEntries, 0x1000040FF89C88EuLL);
    CMSampleBufferGetSampleTimingInfoArray(a1, numSampleTimingEntries, v4, &numSampleTimingEntries);
    CMItemCount v5 = numSampleTimingEntries;
    if (numSampleTimingEntries >= 1)
    {
      p_decodeTimeStamp = &v4->decodeTimeStamp;
      long long v7 = *(_OWORD *)&kCMTimeInvalid.value;
      CMTimeEpoch epoch = kCMTimeInvalid.epoch;
      CMItemCount v9 = numSampleTimingEntries;
      do
      {
        *(_OWORD *)&p_decodeTimeStamp->CMTimeValue value = v7;
        p_decodeTimeStamp->CMTimeEpoch epoch = epoch;
        CMTimeEpoch v10 = *(void *)(a2 + 16);
        *(_OWORD *)&p_decodeTimeStamp[-1].CMTimeValue value = *(_OWORD *)a2;
        p_decodeTimeStamp[-1].CMTimeEpoch epoch = v10;
        p_decodeTimeStamp += 3;
        --v9;
      }
      while (v9);
    }
    CMSampleBufferCreateCopyWithNewTiming(kCFAllocatorDefault, a1, v5, v4, &sampleBufferOut);
    free(v4);
    return sampleBufferOut;
  }
}

id sub_100049040(opaqueCMSampleBuffer *a1, uint64_t a2)
{
  uint64_t v4 = +[NSMutableDictionary dictionary];
  CMItemCount v5 = +[NSNumber numberWithInteger:a2];
  [v4 setObject:v5 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeySampleType"];

  CMBlockBufferRef blockBufferOut = 0;
  size_t bufferListSizeNeededOut = 0;
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, &blockBufferOut);
  CMTimeEpoch v6 = (AudioBufferList *)malloc_type_malloc(bufferListSizeNeededOut, 0x256FBE5uLL);
  CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(a1, 0, v6, bufferListSizeNeededOut, 0, 0, 0, &blockBufferOut);
  id v7 = objc_alloc_init((Class)NSMutableData);
  if (v6->mNumberBuffers)
  {
    unint64_t v8 = 0;
    p_mData = &v6->mBuffers[0].mData;
    do
    {
      uint64_t v10 = *((unsigned int *)p_mData - 1);
      id v11 = *p_mData;
      p_mData += 2;
      [v7 appendBytes:v11 length:v10];
      ++v8;
    }
    while (v8 < v6->mNumberBuffers);
  }
  free(v6);
  [v4 setObject:v7 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioBufferList"];
  FormatDescription = CMSampleBufferGetFormatDescription(a1);
  double v13 = +[NSData dataWithBytes:CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription) length:40];
  [v4 setObject:v13 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"];
  memset(&v17, 0, sizeof(v17));
  CMSampleBufferGetSampleTimingInfo(a1, 0, &v17);
  double v14 = +[NSData dataWithBytes:&v17 length:72];
  [v4 setObject:v14 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
  BOOL v15 = +[NSNumber numberWithLong:CMSampleBufferGetNumSamples(a1)];
  [v4 setObject:v15 forKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyNumSamples"];

  if (blockBufferOut) {
    CFRelease(blockBufferOut);
  }

  return v4;
}

CMSampleBufferRef sub_100049274(void *a1)
{
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  CMSampleBufferRef v17 = 0;
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyNumSamples"];
  id v3 = [v2 integerValue];

  uint64_t v4 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyTimingInfo"];
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  [v4 getBytes:&sampleTimingArray length:72];
  CMItemCount v5 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioFormatDescription"];
  memset(&asbd, 0, sizeof(asbd));
  [v5 getBytes:&asbd length:40];
  CMAudioFormatDescriptionCreate(kCFAllocatorDefault, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(formatDescriptionOut);
  id v7 = [v1 objectForKeyedSubscript:@"RPBroadcastProcessExtensionPayloadKeyAudioBufferList"];

  if ([v7 length])
  {
    size_t v8 = (size_t)[v7 length];
    CMItemCount v9 = (char *)malloc_type_malloc(v8, 0x8CE1C984uLL);
    memcpy(v9, [v7 bytes], v8);
    if (v9)
    {
      UInt32 mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
      if (mChannelsPerFrame == 1 || (StreamBasicDescription->mFormatFlags & 0x20) == 0)
      {
        id v11 = malloc_type_malloc(0x18uLL, 0x10800404ACF7207uLL);
        *(_DWORD *)id v11 = 1;
        *((_DWORD *)v11 + 3) = v8;
        *((_DWORD *)v11 + 2) = StreamBasicDescription->mChannelsPerFrame;
        *((void *)v11 + 2) = v9;
        goto LABEL_13;
      }
      if (mChannelsPerFrame == 2)
      {
        id v11 = malloc_type_malloc(0x28uLL, 0xF3B2E1ECuLL);
        *(_DWORD *)id v11 = 2;
        *((_DWORD *)v11 + 2) = 1;
        *((_DWORD *)v11 + 3) = v8 >> 1;
        *((void *)v11 + 2) = v9;
        *((_DWORD *)v11 + 6) = 1;
        *((_DWORD *)v11 + 7) = v8 >> 1;
        *((void *)v11 + 4) = &v9[v8 >> 1];
        goto LABEL_13;
      }
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000556D0();
      }
      free(v9);
    }
  }
  id v11 = 0;
LABEL_13:
  CMSampleBufferCreate(kCFAllocatorDefault, 0, 0, 0, 0, formatDescriptionOut, (CMItemCount)v3, 1, &sampleTimingArray, 0, 0, &v17);
  CMSampleBufferSetDataBufferFromAudioBufferList(v17, kCFAllocatorDefault, kCFAllocatorDefault, 0, (const AudioBufferList *)v11);
  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
  if (v11)
  {
    free(*((void **)v11 + 2));
    free(v11);
  }
  CMSampleBufferRef v12 = v17;

  return v12;
}

CMSampleBufferRef sub_100049538(CMTime *a1, uint64_t a2, Float64 a3)
{
  CMSampleBufferRef v15 = 0;
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&asbd.Float64 mSampleRate = *(_OWORD *)a2;
  *(_OWORD *)&asbd.mBytesPerPacket = v5;
  *(void *)&asbd.mBitsPerChannel = *(void *)(a2 + 32);
  if (CMAudioFormatDescriptionCreate(kCFAllocatorDefault, &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000559E8();
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    CMTimeEpoch v6 = 0;
  }
  else
  {
    CMTimeEpoch v6 = formatDescriptionOut;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v6);
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  unsigned int mFramesPerPacket = StreamBasicDescription->mFramesPerPacket;
  if (!mFramesPerPacket)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055754();
    }
LABEL_27:
    Float64 mSampleRate = 0.0;
    if (!v6) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  mBytesPerPacket = (const opaqueCMFormatDescription *)StreamBasicDescription->mBytesPerPacket;
  CMAudioFormatDescriptionRef formatDescriptionOut = mBytesPerPacket;
  if (mBytesPerPacket != StreamBasicDescription->mBytesPerFrame * mFramesPerPacket)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055964();
    }
    goto LABEL_27;
  }
  CMItemCount v10 = (unint64_t)(a3 * 44100.0 / (double)mFramesPerPacket);
  asbd.Float64 mSampleRate = 0.0;
  if (CMBlockBufferCreateWithMemoryBlock(kCFAllocatorDefault, 0, (void)mBytesPerPacket * v10, kCFAllocatorDefault, 0, 0, (void)mBytesPerPacket * v10, 0, (CMBlockBufferRef *)&asbd))
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000558E0();
    }
  }
  else
  {
    if (!CMBlockBufferAssureBlockMemory(*(CMBlockBufferRef *)&asbd.mSampleRate))
    {
      Float64 mSampleRate = asbd.mSampleRate;
      goto LABEL_8;
    }
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10005585C();
    }
  }
  if (*(void *)&asbd.mSampleRate) {
    CFRelease(*(CFTypeRef *)&asbd.mSampleRate);
  }
  Float64 mSampleRate = 0.0;
LABEL_8:
  memset(&v13, 0, sizeof(v13));
  CMTimeMakeWithSeconds(&v13.duration, a3, 44100);
  v13.CMTime presentationTimeStamp = *a1;
  v13.decodeTimeStamp = kCMTimeInvalid;
  if (!CMSampleBufferCreate(kCFAllocatorDefault, *(CMBlockBufferRef *)&mSampleRate, 1u, 0, 0, v6, v10, 1, &v13, 1, (const size_t *)&formatDescriptionOut, &v15))
  {
    if (v6) {
      CFRelease(v6);
    }
    if (mSampleRate != 0.0) {
      CFRelease(*(CFTypeRef *)&mSampleRate);
    }
    return v15;
  }
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000557D8();
    if (!v6) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  if (v6) {
LABEL_41:
  }
    CFRelease(v6);
LABEL_42:
  if (mSampleRate != 0.0) {
    CFRelease(*(CFTypeRef *)&mSampleRate);
  }
  CMSampleBufferRef result = v15;
  if (v15)
  {
    CFRelease(v15);
    return 0;
  }
  return result;
}

CMSampleBufferRef sub_1000498A0(uint64_t a1, const AudioStreamBasicDescription *a2, CMTime *a3)
{
  CMAudioFormatDescriptionRef formatDescriptionOut = 0;
  sCMTime buf = 0;
  unsigned int v5 = *(_DWORD *)(a1 + 12);
  UInt32 mBytesPerPacket = a2->mBytesPerPacket;
  if (CMAudioFormatDescriptionCreate(kCFAllocatorDefault, a2, 0, 0, 0, 0, 0, &formatDescriptionOut))
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055B74();
    }
  }
  else
  {
    CMTime presentationTimeStamp = *a3;
    OSStatus v7 = CMAudioSampleBufferCreateWithPacketDescriptions(kCFAllocatorDefault, 0, 0, 0, 0, formatDescriptionOut, v5 / mBytesPerPacket, &presentationTimeStamp, 0, &sbuf);
    CFRelease(formatDescriptionOut);
    if (v7)
    {
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055AF0();
      }
    }
    else
    {
      if (!CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, kCFAllocatorDefault, kCFAllocatorDefault, 0, (const AudioBufferList *)a1))
      {
        CMSampleBufferRef v8 = sbuf;
        CMTime presentationTimeStamp = *a3;
        CMSampleBufferSetOutputPresentationTimeStamp(sbuf, &presentationTimeStamp);
        return v8;
      }
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055A6C();
      }
    }
  }
  if (sbuf) {
    CFRelease(sbuf);
  }
  return 0;
}

void sub_100049A54(const void *a1, void **a2)
{
  if (a1) {
    CFRelease(a1);
  }
  if (a2)
  {
    free(a2[2]);
    free(a2);
  }
}

double sub_100049AA8(opaqueCMSampleBuffer *a1)
{
  if (!a1) {
    return 0.0;
  }
  memset(&v2, 0, sizeof(v2));
  CMSampleBufferGetPresentationTimeStamp(&v2, a1);
  *(float *)&double result = (float)v2.value / (float)v2.timescale;
  return result;
}

uint64_t sub_100049AF8(__IOSurface *a1)
{
  if (IOSurfaceGetPixelFormat(a1) == 1380411457)
  {
    uint64_t v12 = kCGImageComponentTypeRequest;
    CMSampleTimingInfo v13 = &off_100089D98;
    CMTime v2 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    uint64_t v3 = CGImageCreateFromIOSurface();
  }
  else
  {
    IOSurfaceLock(a1, 0, 0);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    size_t BytesPerRow = IOSurfaceGetBytesPerRow(a1);
    size_t Width = IOSurfaceGetWidth(a1);
    size_t Height = IOSurfaceGetHeight(a1);
    size_t AllocSize = IOSurfaceGetAllocSize(a1);
    CFRetain(a1);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CMItemCount v10 = CGDataProviderCreateWithData(a1, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_100049C94);
    uint64_t v3 = (uint64_t)CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, DeviceRGB, 0x2002u, v10, 0, 1, kCGRenderingIntentDefault);
    CGDataProviderRelease(v10);
    CGColorSpaceRelease(DeviceRGB);
  }
  return v3;
}

void sub_100049C94(__IOSurface *a1)
{
  IOSurfaceUnlock(a1, 0, 0);

  CFRelease(a1);
}

__SecTask *sub_10004AA00(_OWORD *a1, const __CFString *a2)
{
  CFErrorRef error = 0;
  long long v3 = a1[1];
  *(_OWORD *)v10.val = *a1;
  *(_OWORD *)&v10.val[4] = v3;
  uint64_t v4 = SecTaskCreateWithAuditToken(0, &v10);
  Value = v4;
  if (v4)
  {
    CFBooleanRef v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, a2, &error);
    CFRelease(Value);
    if (v6)
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID == CFGetTypeID(v6)) {
        Value = (__SecTask *)CFBooleanGetValue(v6);
      }
      else {
        Value = 0;
      }
      CFRelease(v6);
    }
    else
    {
      if (error)
      {
        CMSampleBufferRef v8 = (__CFString *)CFErrorCopyDescription(error);
        if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_100055BF8();
        }
      }
      return 0;
    }
  }
  return Value;
}

id sub_10004AAF0(_OWORD *a1, const __CFString *a2, id a3)
{
  CFErrorRef error = 0;
  long long v5 = a1[1];
  *(_OWORD *)v12.val = *a1;
  *(_OWORD *)&v12.val[4] = v5;
  CFBooleanRef v6 = SecTaskCreateWithAuditToken(0, &v12);
  if (!v6) {
    return 0;
  }
  OSStatus v7 = v6;
  CMSampleBufferRef v8 = (void *)SecTaskCopyValueForEntitlement(v6, a2, &error);
  CFRelease(v7);
  if (!v8)
  {
    if (error)
    {
      audit_token_t v10 = (__CFString *)CFErrorCopyDescription(error);
      if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100055C90();
      }
    }
    return 0;
  }
  if (a3)
  {
    CFTypeID TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v8)) {
      a3 = [v8 containsObject:a3];
    }
    else {
      a3 = 0;
    }
  }
  CFRelease(v8);
  return a3;
}

void sub_10004AC44(id a1)
{
  qword_100099DC0 = objc_alloc_init(RPCaptureManager);

  _objc_release_x1();
}

_DWORD *sub_10004B174(uint64_t a1, uint64_t a2)
{
  double result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004B1F4;
    v3[3] = &unk_100086220;
    void v3[4] = a2;
    return [result callDelegate:v3];
  }
  return result;
}

id sub_10004B1F4(uint64_t a1, void *a2)
{
  return [a2 didCaptureSampleWithType:2 withSampleBuffer:*(void *)(a1 + 32) withTransformFlags:0];
}

void sub_10004B208(uint64_t a1)
{
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    long long v3 = "-[RPCaptureManager startMicrophoneCaptureWithDispatchGroup:]_block_invoke_3";
    __int16 v4 = 1024;
    int v5 = 99;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d mic capture started", (uint8_t *)&v2, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10004B470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10004B5C0(uint64_t a1)
{
  [*(id *)(a1 + 32) stopAppAudioCapture];
  *(_DWORD *)(*(void *)(a1 + 32) + 96) = *(_DWORD *)(a1 + 40);
  id v2 = +[RPAppAudioCaptureManager audioCaptureConfigForSystemRecording:*(unsigned __int8 *)(*(void *)(a1 + 32) + 112) processID:*(unsigned int *)(a1 + 40) contextID:*(void *)(*(void *)(a1 + 32) + 104)];
  __int16 v4 = v3;
  int v5 = *(void **)(*(void *)(a1 + 32) + 64);
  id v6 = v3;
  if (v5) {
    [v5 resumeWithConfig:v2, v4];
  }
  else {
}
  }

void sub_10004B68C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10004B968(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hasDelegate:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) delegateCount];
  if (v2) {
    BOOL v4 = v3 == (id)1;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    [*(id *)(a1 + 32) stopAllCapture];
  }
  else if (dword_100099BB8 <= 1)
  {
    int v5 = (int)v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *(_DWORD *)(*(void *)(a1 + 32) + 72);
      int v9 = 136446978;
      audit_token_t v10 = "-[RPCaptureManager stopCaptureForDelegate:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 189;
      __int16 v13 = 1024;
      int v14 = v6;
      __int16 v15 = 1024;
      int v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d continue capture state %d with delegate count %d", (uint8_t *)&v9, 0x1Eu);
    }
  }
  if (dword_100099BB8 > 1) {
    char v7 = 1;
  }
  else {
    char v7 = v2;
  }
  if ((v7 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446466;
    audit_token_t v10 = "-[RPCaptureManager stopCaptureForDelegate:]_block_invoke";
    __int16 v11 = 1024;
    int v12 = 192;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ignore stopping delegate that is not capturing", (uint8_t *)&v9, 0x12u);
  }
  return [*(id *)(a1 + 32) removeDelegate:*(void *)(a1 + 40)];
}

void sub_10004BDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004BDE8(uint64_t a1)
{
  [*(id *)(a1 + 32) updateContextIDs:*(void *)(a1 + 40) forProcessID:*(unsigned int *)(a1 + 80) systemRecording:*(unsigned __int8 *)(a1 + 84)];
  [*(id *)(a1 + 32) addDelegate:*(void *)(a1 + 48)];
  unsigned int v2 = dispatch_group_create();
  id v3 = *(_DWORD **)(a1 + 32);
  if (v3[18])
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v11 = 136446722;
      int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 221;
      __int16 v15 = 2048;
      uint64_t v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d added capture delegate %p", (uint8_t *)&v11, 0x1Cu);
    }
  }
  else
  {
    if (dword_100099BB8 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 48);
        int v11 = 136446722;
        int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemReco"
              "rding:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
        __int16 v13 = 1024;
        int v14 = 217;
        __int16 v15 = 2048;
        uint64_t v16 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting capture for delegate %p", (uint8_t *)&v11, 0x1Cu);
      }
      id v3 = *(_DWORD **)(a1 + 32);
    }
    [v3 startCaptureManagersForProcessID:*(unsigned int *)(a1 + 80) windowSize:*(unsigned __int8 *)(a1 + 84) systemRecording:*(void *)(a1 + 40) contextIDs:*(unsigned __int8 *)(a1 + 85) mixedRealityCamera:v2 dispatchGroup:*(double *)(a1 + 64) *(double *)(a1 + 72)];
  }
  if (*(unsigned char *)(a1 + 86)) {
    [*(id *)(a1 + 32) startMicrophoneCaptureWithDispatchGroup:v2];
  }
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v2, v6))
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 246;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start timeout", (uint8_t *)&v11, 0x12u);
    }
    [*(id *)(a1 + 32) stopAllCapture];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136446466;
      int v12 = "-[RPCaptureManager startCaptureForDelegate:forProcessID:shouldStartMicrophoneCapture:windowSize:systemRecord"
            "ing:contextIDs:mixedRealityCamera:didStartHandler:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 229;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start success", (uint8_t *)&v11, 0x12u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v7 = os_transaction_create();
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(void **)(v8 + 120);
    *(void *)(v8 + 120) = v7;

    if (*(unsigned char *)(a1 + 86)) {
      int v10 = 2;
    }
    else {
      int v10 = 1;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 72) = v10;
    if (*(void *)(*(void *)(a1 + 32) + 128))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      [*(id *)(a1 + 32) stopAllCapture];
    }
  }
}

_DWORD *sub_10004C358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10004C3D8;
    v4[3] = &unk_100086290;
    void v4[4] = a2;
    v4[5] = a3;
    return [result callDelegate:v4];
  }
  return result;
}

id sub_10004C3D8(uint64_t a1, void *a2)
{
  return [a2 didCaptureSampleWithType:0 withSampleBuffer:*(void *)(a1 + 32) withTransformFlags:*(void *)(a1 + 40)];
}

void sub_10004C3E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPCaptureManager startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:di"
         "spatchGroup:]_block_invoke_3";
    __int16 v6 = 1024;
    int v7 = 290;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d screen capture started ", (uint8_t *)&v4, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

_DWORD *sub_10004C4C8(uint64_t a1, uint64_t a2)
{
  double result = *(_DWORD **)(a1 + 32);
  if (result[18])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10004C548;
    v3[3] = &unk_100086220;
    void v3[4] = a2;
    return [result callDelegate:v3];
  }
  return result;
}

id sub_10004C548(uint64_t a1, void *a2)
{
  return [a2 didCaptureSampleWithType:1 withSampleBuffer:*(void *)(a1 + 32) withTransformFlags:0];
}

void sub_10004C55C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    uint64_t v5 = "-[RPCaptureManager startCaptureManagersForProcessID:windowSize:systemRecording:contextIDs:mixedRealityCamera:di"
         "spatchGroup:]_block_invoke_3";
    __int16 v6 = 1024;
    int v7 = 311;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d app audio started ", (uint8_t *)&v4, 0x12u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10004C860(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C904;
  block[3] = &unk_100084E28;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

void sub_10004C904(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSError _rpUserErrorForCode:-5806 userInfo:0];
  [v1 captureDidFailWithError:v2];
}

void sub_10004CA90(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  [*(id *)(a1 + 32) startMicrophoneCaptureWithDispatchGroup:v2];
}

id sub_10004CD24(uint64_t a1, void *a2)
{
  return [a2 captureDidFailWithError:*(void *)(a1 + 32)];
}

id sub_10004CD30(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAllCapture];
}

void sub_10004D3D4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) setSessionState:3];
  uint64_t v8 = *(void **)(a1 + 32);
  id v9 = [v7 code];
  int v10 = [*(id *)(*(void *)(a1 + 32) + 376) outputURL];
  [v8 reportSummaryEvent:v9 recordedFileSize:+[RPSession getFileSizeForURL:](RPSession, "getFileSizeForURL:", v10)];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 384), a2);
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446978;
    __int16 v13 = "-[RPRecordSession stopRecordingWithHandler:]_block_invoke";
    __int16 v14 = 1024;
    int v15 = 111;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movie writer finished writing with output: %@ and error: %@", (uint8_t *)&v12, 0x26u);
  }
  uint64_t v11 = *(void *)(a1 + 40);
  if (v11) {
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v6, v7);
  }
}

void sub_10004D7B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100055F28();
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 384);
    *(void *)(v4 + 384) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void sub_10004D898(id a1)
{
  qword_100099DD0 = (uint64_t)dispatch_queue_create("com.apple.replaykit.RecordSessionDispatchQueue", 0);

  _objc_release_x1();
}

void sub_10004DA44(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 138412290;
      id v19 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startWriting for movie writer has failed. Error: %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    id v5 = +[RPCaptureManager sharedInstance];
    uint64_t v6 = *(unsigned int **)(a1 + 32);
    uint64_t v7 = v6[2];
    id v8 = [v6 microphoneEnabled];
    [*(id *)(a1 + 32) windowSize];
    double v10 = v9;
    double v12 = v11;
    __int16 v13 = [*(id *)(a1 + 32) contextID];
    __int16 v14 = +[NSArray arrayWithObject:v13];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004DC3C;
    v16[3] = &unk_1000853B8;
    int v15 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v5 startCaptureForDelegate:v6 forProcessID:v7 shouldStartMicrophoneCapture:v8 windowSize:0 systemRecording:v14 contextIDs:v16 didStartHandler:v10];
  }
}

void sub_10004DC3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has failed. Error: %@", (uint8_t *)&v10, 0xCu);
    }
    [*(id *)(a1 + 32) setSessionState:3];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = *(void (**)(void))(v5 + 16);
LABEL_10:
      v6();
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPRecordSession: startCapture has started successfully", (uint8_t *)&v10, 2u);
    }
    [*(id *)(a1 + 32) setSessionState:1];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 384);
    *(void *)(v7 + 384) = 0;

    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      uint64_t v6 = *(void (**)(void))(v9 + 16);
      goto LABEL_10;
    }
  }
}

id *sub_10004DE30(id *result, opaqueCMSampleBuffer *a2)
{
  id v3 = result;
  int v4 = *((_DWORD *)result + 12);
  switch(v4)
  {
    case 2:
      if (([result[4] microphoneEnabled] & 1) == 0)
      {
        DataBuffer = CMSampleBufferGetDataBuffer(a2);
        size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
        CMBlockBufferFillDataBytes(0, DataBuffer, 0, DataLength);
      }
      id v11 = (void *)*((void *)v3[4] + 47);
      return (id *)[v11 appendAudio2SampleBuffer:a2];
    case 1:
      id v8 = (void *)*((void *)result[4] + 47);
      return (id *)[v8 appendAudio1SampleBuffer:a2];
    case 0:
      uint64_t v5 = result[4];
      uint64_t v6 = (uint64_t)v3[5];
      uint64_t v7 = v5[47];
      return (id *)[v5 processSampleBuffer:a2 transformFlags:v6 movieWriter:v7];
  }
  return result;
}

void sub_10004DFD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100055FC0(a1, (uint64_t)v6);
  }
  [*(id *)(a1 + 40) notifyClientSessionDidStopWithError:[*(id *)(a1 + 32) code] movieURL:v5 showAlert:1];
}

void sub_10004E29C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    uint64_t v7 = "-[RPRecordSession handleResumeCaptureWithCompletionHandler:]_block_invoke";
    __int16 v8 = 1024;
    int v9 = 286;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d resume capture completed with Error: %@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v3) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [*(id *)(a1 + 32) setSessionState:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void sub_10004E6E8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5807 movieURL:a2 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    id v3 = "-[RPRecordSession handleDisplayWarning]_block_invoke";
    __int16 v4 = 1024;
    int v5 = 321;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v2, 0x12u);
  }
}

void sub_10004E9E8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5802 movieURL:a2 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    id v3 = "-[RPRecordSession handleDeviceRestrictionWarning]_block_invoke";
    __int16 v4 = 1024;
    int v5 = 350;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v2, 0x12u);
  }
}

void sub_10004EC0C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) notifyClientSessionDidStopWithError:-5804 movieURL:a2 showAlert:1];
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446466;
    id v3 = "-[RPRecordSession handleResumeContextIDFailure]_block_invoke";
    __int16 v4 = 1024;
    int v5 = 362;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notifying client", (uint8_t *)&v2, 0x12u);
  }
}

void sub_10004ED34()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error creating temp directory", v0, 2u);
}

void sub_10004ED7C(void *a1)
{
  [a1 code];
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "error in _rkRemoveFile_srDeleteFilesOlderThanTimeToLiveInSeconds, error code: %i", v2, v3, v4, v5, 0);
}

void sub_10004EDF4(void *a1)
{
  [a1 code];
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "_rkRemoveFile error: %i", v2, v3, v4, v5, 0);
}

void sub_10004EE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004EEE0(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)CMTime buf = 67109120;
  *a3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "_rkDeleteFilesWithPrefix error: %i", buf, 8u);
}

void sub_10004EF2C()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPClipBuffer addFrameToBuffer:isKeyFrame:]";
  __int16 v2 = 1024;
  int v3 = 64;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d nil sample buffer", (uint8_t *)&v0, 0x12u);
}

void sub_10004EFC4(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000549C();
    sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d AVCaptureSession removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
}

void sub_10004F094(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000549C();
    sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
}

void sub_10004F164(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (dword_100099BB8 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10000549C();
    sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d AVCaptureSession removeObserver failed]", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
}

void sub_10004F234()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error deleting file", v1, v2, v3, v4, 2u);
}

void sub_10004F2B8()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d asset writer in INCORRECT state, failing to save file", v1, v2, v3, v4, 2u);
}

void sub_10004F33C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d first sample buffer was not processed or appended", v1, v2, v3, v4, 2u);
}

void sub_10004F3C0()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error in initial finish writing: %@", v1, v2, v3, v4, 2u);
}

void sub_10004F444()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error=%@", v1, v2, v3, v4, 2u);
}

void sub_10004F4C8(id *a1)
{
  uint64_t v1 = [*a1 error];
  [v1 code];
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d Export Trim Video Failed, due to error: %i", v3, v4, v5, v6, 2u);
}

void sub_10004F56C(void *a1)
{
  [a1 code];
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d error: %i", v2, v3, v4, v5, 2u);
}

void sub_10004F5F4()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR Enqueing the Sample Video Buffer", v1, v2, v3, v4, 2u);
}

void sub_10004F678(void *a1)
{
  [a1 code];
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d ERROR removing the asset writer output file: %d", v2, v3, v4, v5, 2u);
}

void sub_10004F700(void *a1)
{
  [a1 code];
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v1, " [ERROR] %{public}s:%d ERROR creating new asset writer: %d", v2, v3, v4, v5, 2u);
}

void sub_10004F788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004F820()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d asset writer could not appended first sample", v1, v2, v3, v4, 2u);
}

void sub_10004F8A4()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR starting asset writer", v1, v2, v3, v4, 2u);
}

void sub_10004F928(void *a1)
{
  uint64_t v2 = [a1 assetWriter];
  unsigned int v3 = [v2 status];
  uint64_t v4 = [a1 assetWriter];
  uint64_t v5 = [v4 error];
  *(_DWORD *)__int16 v8 = 136446978;
  sub_10000A2AC();
  *(_DWORD *)&v8[7] = 583;
  v8[9] = v6;
  unsigned int v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d asset writer not started with status %d and error %@", (uint8_t *)v8, 0x22u);
}

void sub_10004FA1C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR Enqueing the Sample Audio Buffer", v1, v2, v3, v4, 2u);
}

void sub_10004FAA0()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d ERROR Enqueing the Sample Audio Buffer", v1, v2, v3, v4, 2u);
}

void sub_10004FB24()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Save to Photos error: %@", v1, v2, v3, v4, 2u);
}

void sub_10004FBA8()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no photo asset to delete", v1, v2, v3, v4, 2u);
}

void sub_10004FC2C()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error deleting photo asset: %@", v1, v2, v3, v4, 2u);
}

void sub_10004FCB0()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error setting listenerEndpoint", v1, v2, v3, v4, 2u);
}

void sub_10004FD34(void *a1)
{
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  sub_10000A2AC();
  *(_DWORD *)&v3[7] = 75;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error beginning extension request: %i", (uint8_t *)v3, 0x18u);
}

void sub_10004FDD0()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d connection to broadcast extension invalidated", v1, v2, v3, v4, 2u);
}

void sub_10004FE54()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d connection to broadcast extension interrupted", v1, v2, v3, v4, 2u);
}

void sub_10004FED8(void *a1)
{
  [a1 code];
  *(_DWORD *)uint64_t v3 = 136446722;
  sub_10000A2AC();
  *(_DWORD *)&v3[7] = 183;
  v3[9] = v1;
  int v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error getting remote proxy to extension: %i", (uint8_t *)v3, 0x18u);
}

void sub_10004FF74()
{
  int v0 = 136446722;
  __int16 v1 = "-[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]";
  __int16 v2 = 1024;
  int v3 = 144;
  __int16 v4 = 2080;
  uint64_t v5 = "-[RPSession initWithClientProxy:sessionType:callingPID:bundleID:delegate:]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s not using as abstract class", (uint8_t *)&v0, 0x1Cu);
}

void sub_100050018()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d invalid pid", v1, v2, v3, v4, v5);
}

void sub_100050098()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unable to register for lock event", v1, v2, v3, v4, v5);
}

float sub_100050118(double a1, double a2)
{
  float v2 = a1;
  int v5 = 136446978;
  __int16 v6 = "-[RPSession checkMinWindowSizeRequirement:]";
  float v3 = a2;
  __int16 v7 = 1024;
  int v8 = 995;
  __int16 v9 = 2048;
  double v10 = v2;
  __int16 v11 = 2048;
  double v12 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Invalid requirements due to invalid window size of width: %f and height: %f", (uint8_t *)&v5, 0x26u);
  return result;
}

void sub_1000501D4()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing user acknowledgement alert", v1, v2, v3, v4, v5);
}

void sub_100050254()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing status bar alert", v1, v2, v3, v4, v5);
}

void sub_1000502D4()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing recording / capture stopped with error alert", v1, v2, v3, v4, v5);
}

void sub_100050354(void *a1)
{
  int v1 = 136446722;
  uint64_t v2 = "+[RPSession getFileSizeForURL:]";
  __int16 v3 = 1024;
  int v4 = 1490;
  __int16 v5 = 2048;
  id v6 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error getting recordedFileSize :%ld", (uint8_t *)&v1, 0x1Cu);
}

void sub_1000503FC(int a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPSession dispatchLimitReached:]";
  __int16 v3 = 1024;
  int v4 = 1631;
  __int16 v5 = 1024;
  int v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d reached max dispatch count, dropping sample of type %d", (uint8_t *)&v1, 0x18u);
}

void sub_10005049C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unable to create and add client to client manager", v1, v2, v3, v4, 2u);
}

void sub_100050520()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d client disconnected, failed to stop active session", v1, v2, v3, v4, 2u);
}

void sub_1000505A4()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error Mixing video Audio tracks", v1, v2, v3, v4, 2u);
}

void sub_100050628()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unable to create and add client to client manager", v1, v2, v3, v4, 2u);
}

void sub_1000506AC()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error setting up system broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_100050730()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error setting up in app broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_1000507B4()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d start in app broadcast error: %@", v1, v2, v3, v4, 2u);
}

void sub_100050838()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d stop in app broadcast error: %@", v1, v2, v3, v4, 2u);
}

void sub_1000508BC()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no client found", v1, v2, v3, v4, 2u);
}

void sub_100050940()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to stop all clients", v1, v2, v3, v4, 2u);
}

void sub_1000509C4()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed entitlement check", v1, v2, v3, v4, 2u);
}

void sub_100050A48()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Save to Photos error: %@", v1, v2, v3, v4, 2u);
}

void sub_100050ACC()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d missing system entitlements", v1, v2, v3, v4, 2u);
}

void sub_100050B50()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no photo asset to delete", v1, v2, v3, v4, 2u);
}

void sub_100050BD4(void *a1)
{
  uint64_t v1 = [a1 userInfo];
  uint64_t v2 = [v1 objectForKey:NSDebugDescriptionErrorKey];
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v3, " [ERROR] %{public}s:%d Failed to present control center screen capture module error:%@", v4, v5, v6, v7, 2u);
}

void sub_100050CB0(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPStatusBarAssertion invalidateStatusBar]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 104;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d setRegisteredStyleOverrides replied with error: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100050D54()
{
  *(_DWORD *)uint64_t v2 = 136446722;
  sub_10000A2AC();
  *(_DWORD *)&v2[7] = 193;
  v2[9] = v0;
  int v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d status: %d", (uint8_t *)v2, 0x18u);
}

void sub_100050DEC()
{
  v0[0] = 136446466;
  sub_10000A2AC();
  *(_DWORD *)((char *)&v0[3] + 2) = 217;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d ", (uint8_t *)v0, 0x12u);
}

void sub_100050E7C()
{
  v0[0] = 136446466;
  sub_10000A2AC();
  *(_DWORD *)((char *)&v0[3] + 2) = 222;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d ", (uint8_t *)v0, 0x12u);
}

void sub_100050F0C()
{
  *(_DWORD *)int v1 = 136446722;
  sub_10000A2AC();
  *(_DWORD *)&v1[7] = 68;
  v1[9] = 2112;
  uint64_t v2 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error found when checking requirements: %@", (uint8_t *)v1, 0x1Cu);
}

void sub_100050FA8()
{
  *(_DWORD *)int v1 = 136446722;
  sub_10000A2AC();
  *(_DWORD *)&v1[7] = 141;
  v1[9] = 2048;
  uint64_t v2 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %f seconds is invalid", (uint8_t *)v1, 0x1Cu);
}

void sub_100051044()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to export clip recording because export is already in process", v1, v2, v3, v4, 2u);
}

void sub_1000510C8()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d VTCompressionSessionEncodeFrame error %d", v1, v2, v3, v4, 2u);
}

void sub_10005114C()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d VTCompressionSessionCreate error %d", v1, v2, v3, v4, 2u);
}

void sub_1000511D0()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Encoding OutputCallback null object reference", v1, v2, v3, v4, 2u);
}

void sub_100051254()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Encoding OutputCallback error %d", v1, v2, v3, v4, 2u);
}

void sub_1000512D8()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d nil sample buffer", v1, v2, v3, v4, 2u);
}

void sub_10005135C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to create buffer copy", v1, v2, v3, v4, 2u);
}

void sub_1000513E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPClipSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 310;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

void sub_100051490()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d video URL is nil", v1, v2, v3, v4, v5);
}

void sub_100051510()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Asset Video Track constains more than one formatDescscriptions", v1, v2, v3, v4, v5);
}

void sub_100051590()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Asset should only contain 1 video track", v1, v2, v3, v4, v5);
}

void sub_100051610()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to get videoCodecType for asset", v1, v2, v3, v4, v5);
}

void sub_100051690()
{
  int v0 = 136446466;
  uint64_t v1 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
  __int16 v2 = 1024;
  int v3 = 128;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d payloadDict cannot be null!", (uint8_t *)&v0, 0x12u);
}

void sub_100051728(unsigned __int16 a1, void *a2)
{
  int v2 = 136446978;
  int v3 = "+[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]";
  __int16 v4 = 1024;
  int v5 = 156;
  __int16 v6 = 1024;
  int v7 = a1;
  __int16 v8 = 1024;
  unsigned int v9 = [a2 code];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error reporting eventType:%d error code:%d", (uint8_t *)&v2, 0x1Eu);
}

void sub_1000517E4(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:updateScreenRecordingStateWithCurrentState: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051858(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:recordingDidStopWithError: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_1000518CC(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:updateBroadcastServiceInfo: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051940(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:updateBroadcastURL: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_1000519B4(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:captureHandlerWithSample: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051A28(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:captureHandlerWithAudioSample: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051A9C(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:recodingDidStopAndSavedToCameraRoll: video saved to camera roll: %d", v2, v3, v4, v5, v6);
}

void sub_100051B10(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:shouldResumeSessionType: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051B84(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:recordingDidPause: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051BF8(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPClientProxy:recordingTimerDidUpdate: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051C6C(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPMultipleClientProxy:updateScreenRecordingStateWithCurrentState: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051CE0(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPMultipleClientProxy:recordingDidStopWithError: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051D54(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPMultipleClientProxy:updateBroadcastURL: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051DC8(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPMultipleClientProxy:recodingDidStopAndSavedToCameraRoll: video saved to camera roll: %d", v2, v3, v4, v5, v6);
}

void sub_100051E3C(void *a1)
{
  [a1 code];
  sub_100023640();
  sub_1000035AC((void *)&_mh_execute_header, &_os_log_default, v1, "RPMultipleClientProxy:recordingTimerDidUpdate: error getting remote proxy: %d", v2, v3, v4, v5, v6);
}

void sub_100051EB0()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "RPMultipleClientProxy:recordingDidPause: ERROR not supported", v0, 2u);
}

void sub_100051EF8()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "RPMultipleClientProxy:shouldResumeSessionType: ERROR not supported", v0, 2u);
}

void sub_100051F40()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPClientManager stopAllClientsWithHandler:]_block_invoke";
  __int16 v2 = 1024;
  int v3 = 120;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d stop current active session failed", (uint8_t *)&v0, 0x12u);
}

void sub_100051FD8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d extension token with valid permissions required", v1, v2, v3, v4, v5);
}

void sub_100052058()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_1000520D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_100052158()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements to setup broadcast", v1, v2, v3, v4, v5);
}

void sub_1000521D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements for system recording", v1, v2, v3, v4, v5);
}

void sub_100052258()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements for system recording", v1, v2, v3, v4, v5);
}

void sub_1000522D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed because client doesn't have entitlements for system recording", v1, v2, v3, v4, v5);
}

void sub_100052358()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to resume due to missing entitlements", v1, v2, v3, v4, v5);
}

void sub_1000523D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed to resume due to missing entitlements", v1, v2, v3, v4, v5);
}

void sub_100052458()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no extension token available", v1, v2, v3, v4, v5);
}

void sub_1000524D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_100052558()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_1000525D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no extension token available", v1, v2, v3, v4, v5);
}

void sub_100052658()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_1000526D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_100052758()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not consume sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_1000527D8()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d can not release sandbox extension handle", v1, v2, v3, v4, v5);
}

void sub_100052858()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Could not consume extension token", v1, v2, v3, v4, v5);
}

void sub_1000528D8()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
}

void sub_10005295C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000529D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100052A54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100052AD0()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_100052B54()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d startCapture has failed. Error: %@", v1, v2, v3, v4, 2u);
}

void sub_100052BD8()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no matching broadcastExtension found, falling back to first object", v1, v2, v3, v4, 2u);
}

void sub_100052C5C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no matching broadcastExtension found, falling back to first object", v1, v2, v3, v4, 2u);
}

void sub_100052CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPSystemBroadcastSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 559;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

void sub_100052D90()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast extension found!", v1, v2, v3, v4, 2u);
}

void sub_100052E14()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d broadcast extension not ready", v1, v2, v3, v4, 2u);
}

void sub_100052E98()
{
  int v0 = 136446978;
  uint64_t v1 = "-[RPSystemBroadcastSession notifyExtensionOfAction:completion:]";
  __int16 v2 = 1024;
  int v3 = 711;
  __int16 v4 = 2080;
  __int16 v5 = "-[RPSystemBroadcastSession notifyExtensionOfAction:completion:]";
  __int16 v6 = 1024;
  int v7 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s notify extension RPBroadcastActionFinish time out after %d seconds", (uint8_t *)&v0, 0x22u);
}

void sub_100052F48()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast extension found!", v1, v2, v3, v4, 2u);
}

void sub_100052FCC()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d broadcast extension not ready", v1, v2, v3, v4, 2u);
}

void sub_100053050(int *a1)
{
  int v1 = *a1;
  int v2 = 136446722;
  uint64_t v3 = "-[RPClient pauseCurrentActiveSession]";
  __int16 v4 = 1024;
  int v5 = 227;
  __int16 v6 = 1024;
  int v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d pause not supported for session type %d", (uint8_t *)&v2, 0x18u);
}

void sub_1000530F4()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d stop session failed with error: %@", v1, v2, v3, v4, 2u);
}

void sub_100053178()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d invalid session type", v1, v2, v3, v4, 2u);
}

void sub_1000531FC()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app recording:%@", v1, v2, v3, v4, 2u);
}

void sub_100053280()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app recording: %@", v1, v2, v3, v4, 2u);
}

void sub_100053304()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app capture: %@", v1, v2, v3, v4, 2u);
}

void sub_100053388()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app capture: %@", v1, v2, v3, v4, 2u);
}

void sub_10005340C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast session found", v1, v2, v3, v4, 2u);
}

void sub_100053490()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_100053514()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_100053598()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting in-app recording:%@", v1, v2, v3, v4, 2u);
}

void sub_10005361C()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping in-app recording: %@", v1, v2, v3, v4, 2u);
}

void sub_1000536A0()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting system recording: %@", v1, v2, v3, v4, 2u);
}

void sub_100053724()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping System Recording: %@", v1, v2, v3, v4, 2u);
}

void sub_1000537A8()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error System Recording with URL handler: %@", v1, v2, v3, v4, 2u);
}

void sub_10005382C()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Not resuming with error %@", v1, v2, v3, v4, 2u);
}

void sub_1000538B0()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting system broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_100053934()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error stopping system broadacst: %@", v1, v2, v3, v4, 2u);
}

void sub_1000539B8()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Not resuming with error %@", v1, v2, v3, v4, 2u);
}

void sub_100053A3C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d not allowed for system recording", v1, v2, v3, v4, 2u);
}

void sub_100053AC0()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Privacy Source is nil", v1, v2, v3, v4, 2u);
}

void sub_100053B44()
{
  int v0 = 136446722;
  uint64_t v1 = "-[RPDelegateBase init]";
  __int16 v2 = 1024;
  int v3 = 27;
  __int16 v4 = 2080;
  int v5 = "-[RPDelegateBase init]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s not using as abstract class", (uint8_t *)&v0, 0x1Cu);
}

void sub_100053BE8()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPAngelProxy updateTimer:]";
  __int16 v2 = 1024;
  int v3 = 134;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d timer string nil", (uint8_t *)&v0, 0x12u);
}

void sub_100053C80()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d AudioQueue start error: %i", v1, v2, v3, v4, 2u);
}

void sub_100053D04(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 136446722;
  uint64_t v3 = "-[RPAppAudioCaptureManager startWithConfig:outputHandler:didStartHandler:]_block_invoke";
  __int16 v4 = 1024;
  int v5 = 291;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d (%p) Failed to create audio tap", (uint8_t *)&v2, 0x1Cu);
}

void sub_100053DAC(uint64_t a1, int a2)
{
  sub_10003BC58(a1, a2, __stack_chk_guard);
  v4[0] = 136446978;
  sub_10003BC70();
  sub_10003BC38(v2, v3);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: handleInputBuffer audio sample buffer timestamp %.3f earlier than previous %.3f", (uint8_t *)v4, 0x26u);
}

void sub_100053E40()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: error reading AudioQueue property", v1, v2, v3, v4, 2u);
}

void sub_100053EC4()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: AudioQueue listener property %d not added", v1, v2, v3, v4, 2u);
}

void sub_100053F48()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
}

void sub_100053FCC()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error: %i", v1, v2, v3, v4, 2u);
}

void sub_100054050()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d allocate audioFormat error", v1, v2, v3, v4, 2u);
}

void sub_1000540D4()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create audio tap description", v1, v2, v3, v4, 2u);
}

void sub_100054158()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create audio tap", v1, v2, v3, v4, 2u);
}

void sub_1000541DC()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d contextID is nil", v1, v2, v3, v4, 2u);
}

void sub_100054260()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
}

void sub_1000542E4()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: Could not enqueue audio buffer", v1, v2, v3, v4, 2u);
}

void sub_100054368(uint64_t a1, int a2)
{
  sub_10003BC58(a1, a2, __stack_chk_guard);
  v4[0] = 136446978;
  sub_10003BC70();
  sub_10003BC38(v2, v3);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d RPAppAudioCaptureManager: discarding audio sample buffer due to timestamp %.3f earlier than previous %.3f", (uint8_t *)v4, 0x26u);
}

void sub_1000543FC()
{
  int v0 = 136446466;
  uint64_t v1 = "+[RPStringUtility rotatingDeviceUniqueID]";
  __int16 v2 = 1024;
  int v3 = 33;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Could not get NSUserDefaults shared defaults object", (uint8_t *)&v0, 0x12u);
}

void sub_100054494(uint64_t a1)
{
  int v1 = 136446722;
  __int16 v2 = "+[RPStringUtility isInvalidBundleId:]";
  __int16 v3 = 1024;
  int v4 = 54;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d bundleID=%@ is invalid", (uint8_t *)&v1, 0x1Cu);
}

void sub_100054538()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
}

void sub_1000545BC()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error starting broadcast: %@", v1, v2, v3, v4, 2u);
}

void sub_100054640()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d startCapture has failed. Error: %@", v1, v2, v3, v4, 2u);
}

void sub_1000546C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPBroadcastSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 446;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

void sub_100054774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000547F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10005486C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000548E8()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing resume broadcast alert", v1, v2, v3, v4, 2u);
}

void sub_10005496C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d no broadcast extension found!", v1, v2, v3, v4, 2u);
}

void sub_1000549F0()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d broadcast extension not ready", v1, v2, v3, v4, 2u);
}

void sub_100054A74()
{
  int v0 = 136446978;
  uint64_t v1 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
  __int16 v2 = 1024;
  int v3 = 719;
  __int16 v4 = 2080;
  __int16 v5 = "-[RPBroadcastSession notifyExtensionOfAction:completion:]";
  __int16 v6 = 1024;
  int v7 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s notify extension RPBroadcastActionFinish time out after %d seconds", (uint8_t *)&v0, 0x22u);
}

void sub_100054B24()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CGImageDestinationCreateWithData failed", v1, v2, v3, v4, v5);
}

void sub_100054BA4()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to get icon image", v1, v2, v3, v4, v5);
}

void sub_100054C24()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CreateEncodedImageData failed", v1, v2, v3, v4, v5);
}

void sub_100054CA4()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error found when checking requirements: %@", v1, v2, v3, v4, 2u);
}

void sub_100054D28()
{
  v0[0] = 136446466;
  sub_10000A2AC();
  *(_DWORD *)((char *)&v0[3] + 2) = 66;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d failed to connect to angel", (uint8_t *)v0, 0x12u);
}

void sub_100054DB8()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d finishWritingAndSaveToCameraRoll error: %@", v1, v2, v3, v4, 2u);
}

void sub_100054E3C()
{
  v0[0] = 136446466;
  sub_10000A2AC();
  *(_DWORD *)((char *)&v0[3] + 2) = 230;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d no movie writer instance when attempting to stop", (uint8_t *)v0, 0x12u);
}

void sub_100054ECC()
{
  sub_10000A2AC();
  sub_10000A2BC();
  sub_10000A2EC((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d writing movie error: %@", v1, v2, v3, v4, 2u);
}

void sub_100054F50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  uint64_t v4 = "-[RPSystemRecordSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 315;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

void sub_100055000(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 64;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Save to Photos error: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_1000550A4()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error deleting file", v1, v2, v3, v4, v5);
}

void sub_100055124()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Error Mixing video audio tracks, try saving original file", v1, v2, v3, v4, v5);
}

void sub_1000551A4()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error deleting file", v1, v2, v3, v4, v5);
}

void sub_100055224()
{
  sub_10000549C();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d error showing recording stopped with error alert", v1, v2, v3, v4, v5);
}

void sub_1000552A4(void *a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPClipWriter setupAssetWriter]";
  __int16 v3 = 1024;
  int v4 = 81;
  __int16 v5 = 1024;
  unsigned int v6 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error: %i", (uint8_t *)&v1, 0x18u);
}

void sub_100055348(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPClipWriter waitForCompletionAndFinishWriting:withHandler:]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 221;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error finishing asset writing:%@", (uint8_t *)&v1, 0x1Cu);
}

void sub_1000553EC(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPCaptureSession startCaptureWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
  __int16 v3 = 1024;
  int v4 = 52;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error found when checking requirements: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100055490(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  int v4 = "-[RPCaptureSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 186;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

void sub_100055540()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to set user dir suffix: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_1000555C8()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d failed with error code %u", v1, v2, v3, v4, 2u);
}

void sub_10005564C()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Overflow detected", v1, v2, v3, v4, 2u);
}

void sub_1000556D0()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d unsupported NonInterleaved with %d channels", v1, v2, v3, v4, 2u);
}

void sub_100055754()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Non-positive framesPerPacket", v1, v2, v3, v4, 2u);
}

void sub_1000557D8()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMSampleBufferCreate failed: %d", v1, v2, v3, v4, 2u);
}

void sub_10005585C()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMBlockBufferAssureBlockMemory failed: %d", v1, v2, v3, v4, 2u);
}

void sub_1000558E0()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMBlockBufferCreateEmpty failed: %d", v1, v2, v3, v4, 2u);
}

void sub_100055964()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Invalid ASBD params", v1, v2, v3, v4, 2u);
}

void sub_1000559E8()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d CMAudioFormatDescriptionCreate failed: %d", v1, v2, v3, v4, 2u);
}

void sub_100055A6C()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer: %d", v1, v2, v3, v4, 2u);
}

void sub_100055AF0()
{
  sub_10000A2AC();
  sub_10000A308();
  sub_10000A2D0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create the CMSampleBuffer description: %d", v1, v2, v3, v4, 2u);
}

void sub_100055B74()
{
  sub_10000A2AC();
  sub_1000054B0((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Failed to create format description for audio buffer", v1, v2, v3, v4, 2u);
}

void sub_100055BF8()
{
  int v0 = 136446722;
  uint64_t v1 = "checkEntitlementForToken";
  __int16 v2 = 1024;
  sub_10000A2BC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error copying entitlment from SecTaskRef, error=%@", (uint8_t *)&v0, 0x1Cu);
}

void sub_100055C90()
{
  int v0 = 136446722;
  uint64_t v1 = "checkEntitlementArrayForToken";
  __int16 v2 = 1024;
  sub_10000A2BC();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error copying entitlment from SecTaskRef, error=%@", (uint8_t *)&v0, 0x1Cu);
}

void sub_100055D28()
{
  int v0 = 136446466;
  uint64_t v1 = "-[RPCaptureManager updateContextIDs:forProcessID:systemRecording:]";
  __int16 v2 = 1024;
  int v3 = 321;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d missing contextID", (uint8_t *)&v0, 0x12u);
}

void sub_100055DC0(void *a1)
{
  id v1 = [a1 localizedDescription];
  int v2 = 136446722;
  int v3 = "-[RPCaptureManager setAVAudioSessionCategory]";
  __int16 v4 = 1024;
  int v5 = 357;
  __int16 v6 = 2080;
  id v7 = [v1 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d %s", (uint8_t *)&v2, 0x1Cu);
}

void sub_100055E84(uint64_t a1)
{
  int v1 = 136446722;
  int v2 = "-[RPRecordSession startRecordingWithMicrophoneEnabled:cameraEnabled:contextID:windowSize:handler:]";
  __int16 v3 = 1024;
  int v4 = 62;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d error found when checking requirements: %@", (uint8_t *)&v1, 0x1Cu);
}

void sub_100055F28()
{
  int v0 = 136446466;
  int v1 = "-[RPRecordSession discardInAppRecordingWithHandler:]_block_invoke";
  __int16 v2 = 1024;
  int v3 = 149;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Error deleting file", (uint8_t *)&v0, 0x12u);
}

void sub_100055FC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 136446978;
  int v4 = "-[RPRecordSession captureDidFailWithError:]_block_invoke";
  __int16 v5 = 1024;
  int v6 = 255;
  __int16 v7 = 2112;
  uint64_t v8 = v2;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d captureDidFailWithError=%@ stopError=%@", (uint8_t *)&v3, 0x26u);
}

uint64_t AKSEventsRegister()
{
  return _AKSEventsRegister();
}

uint64_t AKSEventsUnregister()
{
  return _AKSEventsUnregister();
}

OSStatus AudioQueueAddPropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return _AudioQueueAddPropertyListener(inAQ, inID, inProc, inUserData);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return _AudioQueueAllocateBuffer(inAQ, inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueDispose(inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return _AudioQueueEnqueueBuffer(inAQ, inBuffer, inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return _AudioQueueFreeBuffer(inAQ, inBuffer);
}

OSStatus AudioQueueGetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, void *outData, UInt32 *ioDataSize)
{
  return _AudioQueueGetProperty(inAQ, inID, outData, ioDataSize);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return _AudioQueueNewInput(inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, inFlags, outAQ);
}

OSStatus AudioQueueRemovePropertyListener(AudioQueueRef inAQ, AudioQueuePropertyID inID, AudioQueuePropertyListenerProc inProc, void *inUserData)
{
  return _AudioQueueRemovePropertyListener(inAQ, inID, inProc, inUserData);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return _AudioQueueSetProperty(inAQ, inID, inData, inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return _AudioQueueStart(inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return _AudioQueueStop(inAQ, inImmediate);
}

void AudioServicesPlaySystemSound(SystemSoundID inSystemSoundID)
{
}

uint64_t BKSDisplayServicesSetCloneMirroringMode()
{
  return _BKSDisplayServicesSetCloneMirroringMode();
}

uint64_t CARenderServerGetClientPort()
{
  return _CARenderServerGetClientPort();
}

uint64_t CARenderServerGetClientProcessId()
{
  return _CARenderServerGetClientProcessId();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return _CGDataProviderCreateWithData(info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

uint64_t CGImageCreateFromIOSurface()
{
  return _CGImageCreateFromIOSurface();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithData(data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

OSStatus CMAudioFormatDescriptionCreate(CFAllocatorRef allocator, const AudioStreamBasicDescription *asbd, size_t layoutSize, const AudioChannelLayout *layout, size_t magicCookieSize, const void *magicCookie, CFDictionaryRef extensions, CMAudioFormatDescriptionRef *formatDescriptionOut)
{
  return _CMAudioFormatDescriptionCreate(allocator, asbd, layoutSize, layout, magicCookieSize, magicCookie, extensions, formatDescriptionOut);
}

const AudioStreamBasicDescription *__cdecl CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormatDescriptionRef desc)
{
  return _CMAudioFormatDescriptionGetStreamBasicDescription(desc);
}

OSStatus CMAudioSampleBufferCreateReadyWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return _CMAudioSampleBufferCreateReadyWithPacketDescriptions(allocator, dataBuffer, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMAudioSampleBufferCreateWithPacketDescriptions(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMTime *presentationTimeStamp, const AudioStreamPacketDescription *packetDescriptions, CMSampleBufferRef *sampleBufferOut)
{
  return _CMAudioSampleBufferCreateWithPacketDescriptions(allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, presentationTimeStamp, packetDescriptions, sampleBufferOut);
}

OSStatus CMBlockBufferAssureBlockMemory(CMBlockBufferRef theBuffer)
{
  return _CMBlockBufferAssureBlockMemory(theBuffer);
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return _CMBlockBufferCreateWithMemoryBlock(structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, flags, blockBufferOut);
}

OSStatus CMBlockBufferFillDataBytes(char fillByte, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return _CMBlockBufferFillDataBytes(fillByte, destinationBuffer, offsetIntoDestination, dataLength);
}

size_t CMBlockBufferGetDataLength(CMBlockBufferRef theBuffer)
{
  return _CMBlockBufferGetDataLength(theBuffer);
}

OSStatus CMBlockBufferReplaceDataBytes(const void *sourceBytes, CMBlockBufferRef destinationBuffer, size_t offsetIntoDestination, size_t dataLength)
{
  return _CMBlockBufferReplaceDataBytes(sourceBytes, destinationBuffer, offsetIntoDestination, dataLength);
}

OSStatus CMBufferQueueCreate(CFAllocatorRef allocator, CMItemCount capacity, const CMBufferCallbacks *callbacks, CMBufferQueueRef *queueOut)
{
  return _CMBufferQueueCreate(allocator, capacity, callbacks, queueOut);
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return _CMBufferQueueDequeueAndRetain(queue);
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return _CMBufferQueueEnqueue(queue, buf);
}

CMItemCount CMBufferQueueGetBufferCount(CMBufferQueueRef queue)
{
  return _CMBufferQueueGetBufferCount(queue);
}

const CMBufferCallbacks *CMBufferQueueGetCallbacksForUnsortedSampleBuffers(void)
{
  return _CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
}

Boolean CMBufferQueueIsEmpty(CMBufferQueueRef queue)
{
  return _CMBufferQueueIsEmpty(queue);
}

OSStatus CMBufferQueueReset(CMBufferQueueRef queue)
{
  return _CMBufferQueueReset(queue);
}

CMTime *__cdecl CMClockMakeHostTimeFromSystemUnits(CMTime *__return_ptr retstr, uint64_t hostTime)
{
  return _CMClockMakeHostTimeFromSystemUnits(retstr, hostTime);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return _CMFormatDescriptionGetMediaSubType(desc);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreate(allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateCopyWithNewTiming(CFAllocatorRef allocator, CMSampleBufferRef originalSBuf, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreateCopyWithNewTiming(allocator, originalSBuf, numSampleTimingEntries, sampleTimingArray, sampleBufferOut);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreateForImageBuffer(allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferCreateReadyWithImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreateReadyWithImageBuffer(allocator, imageBuffer, formatDescription, sampleTiming, sampleBufferOut);
}

OSStatus CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSampleBufferRef sbuf, size_t *bufferListSizeNeededOut, AudioBufferList *bufferListOut, size_t bufferListSize, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, CMBlockBufferRef *blockBufferOut)
{
  return _CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(sbuf, bufferListSizeNeededOut, bufferListOut, bufferListSize, blockBufferStructureAllocator, blockBufferBlockAllocator, flags, blockBufferOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetDataBuffer(sbuf);
}

CMTime *__cdecl CMSampleBufferGetDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetDuration(retstr, sbuf);
}

CMFormatDescriptionRef CMSampleBufferGetFormatDescription(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetFormatDescription(sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetNumSamples(sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetPresentationTimeStamp(retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return _CMSampleBufferGetSampleAttachmentsArray(sbuf, createIfNecessary);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return _CMSampleBufferGetSampleTimingInfo(sbuf, sampleIndex, timingInfoOut);
}

OSStatus CMSampleBufferGetSampleTimingInfoArray(CMSampleBufferRef sbuf, CMItemCount numSampleTimingEntries, CMSampleTimingInfo *timingArrayOut, CMItemCount *timingArrayEntriesNeededOut)
{
  return _CMSampleBufferGetSampleTimingInfoArray(sbuf, numSampleTimingEntries, timingArrayOut, timingArrayEntriesNeededOut);
}

OSStatus CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBufferRef sbuf, CFAllocatorRef blockBufferStructureAllocator, CFAllocatorRef blockBufferBlockAllocator, uint32_t flags, const AudioBufferList *bufferList)
{
  return _CMSampleBufferSetDataBufferFromAudioBufferList(sbuf, blockBufferStructureAllocator, blockBufferBlockAllocator, flags, bufferList);
}

OSStatus CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBufferRef sbuf, CMTime *outputPresentationTimeStamp)
{
  return _CMSampleBufferSetOutputPresentationTimeStamp(sbuf, outputPresentationTimeStamp);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeAdd(retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return _CMTimeConvertScale(retstr, time, newTimescale, method);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeSubtract(retstr, lhs, rhs);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return _CMVideoFormatDescriptionCreateForImageBuffer(allocator, imageBuffer, formatDescriptionOut);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreateWithIOSurface(allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return _IOSurfaceCreateXPCObject(aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return _IOSurfaceGetAllocSize(buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBytesPerRow(buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return _IOSurfaceGetHeight(buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPixelFormat(buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return _IOSurfaceGetWidth(buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return _IOSurfaceLookupFromXPCObject(xobj);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSCopyFrontmostApplicationDisplayIdentifier()
{
  return _SBSCopyFrontmostApplicationDisplayIdentifier();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return _SBSIsSystemApertureAvailable();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return _SCNetworkReachabilityCreateWithName(allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

OSStatus VTCompressionSessionCompleteFrames(VTCompressionSessionRef session, CMTime *completeUntilPresentationTimeStamp)
{
  return _VTCompressionSessionCompleteFrames(session, completeUntilPresentationTimeStamp);
}

OSStatus VTCompressionSessionCreate(CFAllocatorRef allocator, int32_t width, int32_t height, CMVideoCodecType codecType, CFDictionaryRef encoderSpecification, CFDictionaryRef sourceImageBufferAttributes, CFAllocatorRef compressedDataAllocator, VTCompressionOutputCallback outputCallback, void *outputCallbackRefCon, VTCompressionSessionRef *compressionSessionOut)
{
  return _VTCompressionSessionCreate(allocator, width, height, codecType, encoderSpecification, sourceImageBufferAttributes, compressedDataAllocator, outputCallback, outputCallbackRefCon, compressionSessionOut);
}

OSStatus VTCompressionSessionEncodeFrame(VTCompressionSessionRef session, CVImageBufferRef imageBuffer, CMTime *presentationTimeStamp, CMTime *duration, CFDictionaryRef frameProperties, void *sourceFrameRefcon, VTEncodeInfoFlags *infoFlagsOut)
{
  return _VTCompressionSessionEncodeFrame(session, imageBuffer, presentationTimeStamp, duration, frameProperties, sourceFrameRefcon, infoFlagsOut);
}

void VTCompressionSessionInvalidate(VTCompressionSessionRef session)
{
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return _VTSessionSetProperty(session, propertyKey, propertyValue);
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

double __exp10(double a1)
{
  return ___exp10(a1);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t ct_green_tea_logger_create_static()
{
  return _ct_green_tea_logger_create_static();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

long double log10(long double __x)
{
  return _log10(__x);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__extensionBundle(void *a1, const char *a2, ...)
{
  return [a1 _extensionBundle];
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return [a1 _plugIn];
}

id objc_msgSend__rpFrameworkBundle(void *a1, const char *a2, ...)
{
  return [a1 _rpFrameworkBundle];
}

id objc_msgSend__rpLocalizedAppName(void *a1, const char *a2, ...)
{
  return [a1 _rpLocalizedAppName];
}

id objc_msgSend__srDeleteAllAndSystemTempFiles(void *a1, const char *a2, ...)
{
  return [a1 _srDeleteAllAndSystemTempFiles];
}

id objc_msgSend__srDeviceFreeDiskSpace(void *a1, const char *a2, ...)
{
  return [a1 _srDeviceFreeDiskSpace];
}

id objc_msgSend__srDeviceHasSufficientFreeSpaceForRecording(void *a1, const char *a2, ...)
{
  return [a1 _srDeviceHasSufficientFreeSpaceForRecording];
}

id objc_msgSend__srDeviceHasSufficientSpaceForCurrentRecording(void *a1, const char *a2, ...)
{
  return [a1 _srDeviceHasSufficientSpaceForCurrentRecording];
}

id objc_msgSend__srSetupTempDirectory(void *a1, const char *a2, ...)
{
  return [a1 _srSetupTempDirectory];
}

id objc_msgSend__srTempPath(void *a1, const char *a2, ...)
{
  return [a1 _srTempPath];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeDuration(void *a1, const char *a2, ...)
{
  return [a1 activeDuration];
}

id objc_msgSend_addObserversForSession(void *a1, const char *a2, ...)
{
  return [a1 addObserversForSession];
}

id objc_msgSend_adjustedWindowSizeForSystemRecording(void *a1, const char *a2, ...)
{
  return [a1 adjustedWindowSizeForSystemRecording];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_appAudioFrameCount(void *a1, const char *a2, ...)
{
  return [a1 appAudioFrameCount];
}

id objc_msgSend_applicationStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 applicationStateMonitor];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetWriter(void *a1, const char *a2, ...)
{
  return [a1 assetWriter];
}

id objc_msgSend_assetWriterStartCount(void *a1, const char *a2, ...)
{
  return [a1 assetWriterStartCount];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_audioChannelCount(void *a1, const char *a2, ...)
{
  return [a1 audioChannelCount];
}

id objc_msgSend_audioEnabled(void *a1, const char *a2, ...)
{
  return [a1 audioEnabled];
}

id objc_msgSend_audioInput1(void *a1, const char *a2, ...)
{
  return [a1 audioInput1];
}

id objc_msgSend_audioInput2(void *a1, const char *a2, ...)
{
  return [a1 audioInput2];
}

id objc_msgSend_audioMix(void *a1, const char *a2, ...)
{
  return [a1 audioMix];
}

id objc_msgSend_audioMixInputParameters(void *a1, const char *a2, ...)
{
  return [a1 audioMixInputParameters];
}

id objc_msgSend_audioSampleRate(void *a1, const char *a2, ...)
{
  return [a1 audioSampleRate];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_averageFrameLatency(void *a1, const char *a2, ...)
{
  return [a1 averageFrameLatency];
}

id objc_msgSend_averageFrameLatencyAudio(void *a1, const char *a2, ...)
{
  return [a1 averageFrameLatencyAudio];
}

id objc_msgSend_averageFrameLatencyMic(void *a1, const char *a2, ...)
{
  return [a1 averageFrameLatencyMic];
}

id objc_msgSend_averageVideoBitrate(void *a1, const char *a2, ...)
{
  return [a1 averageVideoBitrate];
}

id objc_msgSend_backCameraUsed(void *a1, const char *a2, ...)
{
  return [a1 backCameraUsed];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundReplacementTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 backgroundReplacementTotalDuration];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcastHostBundleId(void *a1, const char *a2, ...)
{
  return [a1 broadcastHostBundleId];
}

id objc_msgSend_broadcastServiceName(void *a1, const char *a2, ...)
{
  return [a1 broadcastServiceName];
}

id objc_msgSend_broadcastSessionAudioQueue(void *a1, const char *a2, ...)
{
  return [a1 broadcastSessionAudioQueue];
}

id objc_msgSend_broadcastSessionVideoQueue(void *a1, const char *a2, ...)
{
  return [a1 broadcastSessionVideoQueue];
}

id objc_msgSend_broadcastUploadExtension(void *a1, const char *a2, ...)
{
  return [a1 broadcastUploadExtension];
}

id objc_msgSend_bufferArray(void *a1, const char *a2, ...)
{
  return [a1 bufferArray];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cameraDeviceType(void *a1, const char *a2, ...)
{
  return [a1 cameraDeviceType];
}

id objc_msgSend_cameraEnabled(void *a1, const char *a2, ...)
{
  return [a1 cameraEnabled];
}

id objc_msgSend_captureDynamicRange(void *a1, const char *a2, ...)
{
  return [a1 captureDynamicRange];
}

id objc_msgSend_captureResolutionType(void *a1, const char *a2, ...)
{
  return [a1 captureResolutionType];
}

id objc_msgSend_centerStageEffectTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 centerStageEffectTotalDuration];
}

id objc_msgSend_checkAndHandleMicInterruption(void *a1, const char *a2, ...)
{
  return [a1 checkAndHandleMicInterruption];
}

id objc_msgSend_checkApplicationForegroundRequirement(void *a1, const char *a2, ...)
{
  return [a1 checkApplicationForegroundRequirement];
}

id objc_msgSend_checkContextIDRequirement(void *a1, const char *a2, ...)
{
  return [a1 checkContextIDRequirement];
}

id objc_msgSend_checkDeviceLockedRequirement(void *a1, const char *a2, ...)
{
  return [a1 checkDeviceLockedRequirement];
}

id objc_msgSend_checkForAcknowledgementAlertTimeout(void *a1, const char *a2, ...)
{
  return [a1 checkForAcknowledgementAlertTimeout];
}

id objc_msgSend_checkMultiWindow(void *a1, const char *a2, ...)
{
  return [a1 checkMultiWindow];
}

id objc_msgSend_checkMultiWindowRequirement(void *a1, const char *a2, ...)
{
  return [a1 checkMultiWindowRequirement];
}

id objc_msgSend_checkSufficientFreeSpace(void *a1, const char *a2, ...)
{
  return [a1 checkSufficientFreeSpace];
}

id objc_msgSend_chipId(void *a1, const char *a2, ...)
{
  return [a1 chipId];
}

id objc_msgSend_clearSystemRecordingUI(void *a1, const char *a2, ...)
{
  return [a1 clearSystemRecordingUI];
}

id objc_msgSend_clientApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return [a1 clientApplicationDidEnterBackground];
}

id objc_msgSend_clientApplicationDidEnterForeground(void *a1, const char *a2, ...)
{
  return [a1 clientApplicationDidEnterForeground];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return [a1 clientBundleID];
}

id objc_msgSend_clientMainBundleID(void *a1, const char *a2, ...)
{
  return [a1 clientMainBundleID];
}

id objc_msgSend_clientProxy(void *a1, const char *a2, ...)
{
  return [a1 clientProxy];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectSummaryEventMetrics(void *a1, const char *a2, ...)
{
  return [a1 collectSummaryEventMetrics];
}

id objc_msgSend_collectSummaryRecordingEventMetrics(void *a1, const char *a2, ...)
{
  return [a1 collectSummaryRecordingEventMetrics];
}

id objc_msgSend_colorMatrix(void *a1, const char *a2, ...)
{
  return [a1 colorMatrix];
}

id objc_msgSend_colorSpace(void *a1, const char *a2, ...)
{
  return [a1 colorSpace];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_connectionManager(void *a1, const char *a2, ...)
{
  return [a1 connectionManager];
}

id objc_msgSend_connectionManagerQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionManagerQueue];
}

id objc_msgSend_connectionSet(void *a1, const char *a2, ...)
{
  return [a1 connectionSet];
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return [a1 containingBundle];
}

id objc_msgSend_containingUrl(void *a1, const char *a2, ...)
{
  return [a1 containingUrl];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationRequestForAsset(void *a1, const char *a2, ...)
{
  return [a1 creationRequestForAsset];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateSuffix(void *a1, const char *a2, ...)
{
  return [a1 dateSuffix];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultOptions];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateCount(void *a1, const char *a2, ...)
{
  return [a1 delegateCount];
}

id objc_msgSend_destSurfaceHeight(void *a1, const char *a2, ...)
{
  return [a1 destSurfaceHeight];
}

id objc_msgSend_destSurfaceWidth(void *a1, const char *a2, ...)
{
  return [a1 destSurfaceWidth];
}

id objc_msgSend_deviceLocked(void *a1, const char *a2, ...)
{
  return [a1 deviceLocked];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didProcessFirstSample(void *a1, const char *a2, ...)
{
  return [a1 didProcessFirstSample];
}

id objc_msgSend_disableBroadcast(void *a1, const char *a2, ...)
{
  return [a1 disableBroadcast];
}

id objc_msgSend_disableCameraPip(void *a1, const char *a2, ...)
{
  return [a1 disableCameraPip];
}

id objc_msgSend_dispatchCaptureQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchCaptureQueue];
}

id objc_msgSend_dispatchClipWriterQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchClipWriterQueue];
}

id objc_msgSend_dispatchedDidStartHandler(void *a1, const char *a2, ...)
{
  return [a1 dispatchedDidStartHandler];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return [a1 displayBacklightLevel];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_enableCameraPip(void *a1, const char *a2, ...)
{
  return [a1 enableCameraPip];
}

id objc_msgSend_enableMicrophone(void *a1, const char *a2, ...)
{
  return [a1 enableMicrophone];
}

id objc_msgSend_enableMixedRealityCamera(void *a1, const char *a2, ...)
{
  return [a1 enableMixedRealityCamera];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endPrivacyAccountingInterval(void *a1, const char *a2, ...)
{
  return [a1 endPrivacyAccountingInterval];
}

id objc_msgSend_endReason(void *a1, const char *a2, ...)
{
  return [a1 endReason];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorHandler(void *a1, const char *a2, ...)
{
  return [a1 errorHandler];
}

id objc_msgSend_excludeCallingClientAudio(void *a1, const char *a2, ...)
{
  return [a1 excludeCallingClientAudio];
}

id objc_msgSend_excludedApplicationsCount(void *a1, const char *a2, ...)
{
  return [a1 excludedApplicationsCount];
}

id objc_msgSend_excludedWindowsCount(void *a1, const char *a2, ...)
{
  return [a1 excludedWindowsCount];
}

id objc_msgSend_extensionPointIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionPointIdentifier];
}

id objc_msgSend_fallbackLanguage(void *a1, const char *a2, ...)
{
  return [a1 fallbackLanguage];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_filterSource(void *a1, const char *a2, ...)
{
  return [a1 filterSource];
}

id objc_msgSend_finishStartup(void *a1, const char *a2, ...)
{
  return [a1 finishStartup];
}

id objc_msgSend_finishWriting(void *a1, const char *a2, ...)
{
  return [a1 finishWriting];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_floatingSessionCount(void *a1, const char *a2, ...)
{
  return [a1 floatingSessionCount];
}

id objc_msgSend_floatingToNewsroomTransitionCount(void *a1, const char *a2, ...)
{
  return [a1 floatingToNewsroomTransitionCount];
}

id objc_msgSend_floatingTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 floatingTotalDuration];
}

id objc_msgSend_floatingTotalFrameCount(void *a1, const char *a2, ...)
{
  return [a1 floatingTotalFrameCount];
}

id objc_msgSend_flushBuffer(void *a1, const char *a2, ...)
{
  return [a1 flushBuffer];
}

id objc_msgSend_flushClipBuffer(void *a1, const char *a2, ...)
{
  return [a1 flushClipBuffer];
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return [a1 formatDescriptions];
}

id objc_msgSend_frameHeight(void *a1, const char *a2, ...)
{
  return [a1 frameHeight];
}

id objc_msgSend_frameQueueSize(void *a1, const char *a2, ...)
{
  return [a1 frameQueueSize];
}

id objc_msgSend_frameWidth(void *a1, const char *a2, ...)
{
  return [a1 frameWidth];
}

id objc_msgSend_frontCameraUsed(void *a1, const char *a2, ...)
{
  return [a1 frontCameraUsed];
}

id objc_msgSend_gestureDetectionBasedReactionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 gestureDetectionBasedReactionsEnabled];
}

id objc_msgSend_getBSServiceInterface(void *a1, const char *a2, ...)
{
  return [a1 getBSServiceInterface];
}

id objc_msgSend_getCallingConnectionBundleID(void *a1, const char *a2, ...)
{
  return [a1 getCallingConnectionBundleID];
}

id objc_msgSend_getCallingConnectionClient(void *a1, const char *a2, ...)
{
  return [a1 getCallingConnectionClient];
}

id objc_msgSend_getCurrentPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 getCurrentPressureLevel];
}

id objc_msgSend_getCurrentStreamScreenConfiguration(void *a1, const char *a2, ...)
{
  return [a1 getCurrentStreamScreenConfiguration];
}

id objc_msgSend_getFormatDescription(void *a1, const char *a2, ...)
{
  return [a1 getFormatDescription];
}

id objc_msgSend_getTotalNumberOfSamples(void *a1, const char *a2, ...)
{
  return [a1 getTotalNumberOfSamples];
}

id objc_msgSend_handleClientApplicationDidEnterBackground(void *a1, const char *a2, ...)
{
  return [a1 handleClientApplicationDidEnterBackground];
}

id objc_msgSend_handleClientApplicationDidEnterForeground(void *a1, const char *a2, ...)
{
  return [a1 handleClientApplicationDidEnterForeground];
}

id objc_msgSend_handleDeviceLockedWarning(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceLockedWarning];
}

id objc_msgSend_handleDeviceRestrictionWarning(void *a1, const char *a2, ...)
{
  return [a1 handleDeviceRestrictionWarning];
}

id objc_msgSend_handleDisplayWarning(void *a1, const char *a2, ...)
{
  return [a1 handleDisplayWarning];
}

id objc_msgSend_handleIncomingCallWarning(void *a1, const char *a2, ...)
{
  return [a1 handleIncomingCallWarning];
}

id objc_msgSend_handleMemoryWarning(void *a1, const char *a2, ...)
{
  return [a1 handleMemoryWarning];
}

id objc_msgSend_handleMemoryWarningForCurrentActiveSession(void *a1, const char *a2, ...)
{
  return [a1 handleMemoryWarningForCurrentActiveSession];
}

id objc_msgSend_handleSystemAlertStop(void *a1, const char *a2, ...)
{
  return [a1 handleSystemAlertStop];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hasBroadcastEntitlements(void *a1, const char *a2, ...)
{
  return [a1 hasBroadcastEntitlements];
}

id objc_msgSend_hasEnded(void *a1, const char *a2, ...)
{
  return [a1 hasEnded];
}

id objc_msgSend_hasSystemRecordingEntitlements(void *a1, const char *a2, ...)
{
  return [a1 hasSystemRecordingEntitlements];
}

id objc_msgSend_hasUnitTestEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasUnitTestEntitlement];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hideAndStopRecordingBanner(void *a1, const char *a2, ...)
{
  return [a1 hideAndStopRecordingBanner];
}

id objc_msgSend_hostProcess(void *a1, const char *a2, ...)
{
  return [a1 hostProcess];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_includedApplicationsCount(void *a1, const char *a2, ...)
{
  return [a1 includedApplicationsCount];
}

id objc_msgSend_includedWindowsCount(void *a1, const char *a2, ...)
{
  return [a1 includedWindowsCount];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_inputSurfaceHeight(void *a1, const char *a2, ...)
{
  return [a1 inputSurfaceHeight];
}

id objc_msgSend_inputSurfaceWidth(void *a1, const char *a2, ...)
{
  return [a1 inputSurfaceWidth];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateConnection(void *a1, const char *a2, ...)
{
  return [a1 invalidateConnection];
}

id objc_msgSend_invalidateStatusBar(void *a1, const char *a2, ...)
{
  return [a1 invalidateStatusBar];
}

id objc_msgSend_isBroadcastSetup(void *a1, const char *a2, ...)
{
  return [a1 isBroadcastSetup];
}

id objc_msgSend_isClientScreenCapture(void *a1, const char *a2, ...)
{
  return [a1 isClientScreenCapture];
}

id objc_msgSend_isFinishingWriting(void *a1, const char *a2, ...)
{
  return [a1 isFinishingWriting];
}

id objc_msgSend_isIPad(void *a1, const char *a2, ...)
{
  return [a1 isIPad];
}

id objc_msgSend_isKeyFrame(void *a1, const char *a2, ...)
{
  return [a1 isKeyFrame];
}

id objc_msgSend_isNativeScreenOrientationPortrait(void *a1, const char *a2, ...)
{
  return [a1 isNativeScreenOrientationPortrait];
}

id objc_msgSend_isOutgoing(void *a1, const char *a2, ...)
{
  return [a1 isOutgoing];
}

id objc_msgSend_isReadyForMoreMediaData(void *a1, const char *a2, ...)
{
  return [a1 isReadyForMoreMediaData];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isVoiceOverRunning(void *a1, const char *a2, ...)
{
  return [a1 isVoiceOverRunning];
}

id objc_msgSend_lastAudio1PresentationTime(void *a1, const char *a2, ...)
{
  return [a1 lastAudio1PresentationTime];
}

id objc_msgSend_lastAudio2PresentationTime(void *a1, const char *a2, ...)
{
  return [a1 lastAudio2PresentationTime];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastVideoPresentationTime(void *a1, const char *a2, ...)
{
  return [a1 lastVideoPresentationTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return [a1 localizedFailureReason];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_macApplicationDidResignActive(void *a1, const char *a2, ...)
{
  return [a1 macApplicationDidResignActive];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manualTriggeredReactionsCount(void *a1, const char *a2, ...)
{
  return [a1 manualTriggeredReactionsCount];
}

id objc_msgSend_markAsFinished(void *a1, const char *a2, ...)
{
  return [a1 markAsFinished];
}

id objc_msgSend_metadataItem(void *a1, const char *a2, ...)
{
  return [a1 metadataItem];
}

id objc_msgSend_micEnabled(void *a1, const char *a2, ...)
{
  return [a1 micEnabled];
}

id objc_msgSend_micFrameCount(void *a1, const char *a2, ...)
{
  return [a1 micFrameCount];
}

id objc_msgSend_microphoneEnabled(void *a1, const char *a2, ...)
{
  return [a1 microphoneEnabled];
}

id objc_msgSend_minIntervalBetweenFrames(void *a1, const char *a2, ...)
{
  return [a1 minIntervalBetweenFrames];
}

id objc_msgSend_movieWriterQueue(void *a1, const char *a2, ...)
{
  return [a1 movieWriterQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newInstance(void *a1, const char *a2, ...)
{
  return [a1 newInstance];
}

id objc_msgSend_newsroomBottomLeftWindowCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomBottomLeftWindowCount];
}

id objc_msgSend_newsroomBottomRightWindowCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomBottomRightWindowCount];
}

id objc_msgSend_newsroomFullScreenContentCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomFullScreenContentCount];
}

id objc_msgSend_newsroomSessionCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomSessionCount];
}

id objc_msgSend_newsroomToFloatingTransitionCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomToFloatingTransitionCount];
}

id objc_msgSend_newsroomTopLeftWindowCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomTopLeftWindowCount];
}

id objc_msgSend_newsroomTopRightWindowCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomTopRightWindowCount];
}

id objc_msgSend_newsroomTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 newsroomTotalDuration];
}

id objc_msgSend_newsroomTotalFrameCount(void *a1, const char *a2, ...)
{
  return [a1 newsroomTotalFrameCount];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notifyRecordingMayBeStopped(void *a1, const char *a2, ...)
{
  return [a1 notifyRecordingMayBeStopped];
}

id objc_msgSend_notifyRecordingResumed(void *a1, const char *a2, ...)
{
  return [a1 notifyRecordingResumed];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_observersCount(void *a1, const char *a2, ...)
{
  return [a1 observersCount];
}

id objc_msgSend_observersCountDidChange(void *a1, const char *a2, ...)
{
  return [a1 observersCountDidChange];
}

id objc_msgSend_openControlCenterSystemRecordingView(void *a1, const char *a2, ...)
{
  return [a1 openControlCenterSystemRecordingView];
}

id objc_msgSend_originalOutputPath(void *a1, const char *a2, ...)
{
  return [a1 originalOutputPath];
}

id objc_msgSend_outputPath(void *a1, const char *a2, ...)
{
  return [a1 outputPath];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return [a1 outputURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pauseCurrentActiveSession(void *a1, const char *a2, ...)
{
  return [a1 pauseCurrentActiveSession];
}

id objc_msgSend_pauseInAppBroadcast(void *a1, const char *a2, ...)
{
  return [a1 pauseInAppBroadcast];
}

id objc_msgSend_pauseInAppCapture(void *a1, const char *a2, ...)
{
  return [a1 pauseInAppCapture];
}

id objc_msgSend_pauseInAppRecording(void *a1, const char *a2, ...)
{
  return [a1 pauseInAppRecording];
}

id objc_msgSend_pauseSession(void *a1, const char *a2, ...)
{
  return [a1 pauseSession];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_placeholderForCreatedAsset(void *a1, const char *a2, ...)
{
  return [a1 placeholderForCreatedAsset];
}

id objc_msgSend_portraitEffectTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 portraitEffectTotalDuration];
}

id objc_msgSend_portraitIntensityEndValue(void *a1, const char *a2, ...)
{
  return [a1 portraitIntensityEndValue];
}

id objc_msgSend_preferredLanguage(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguage];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preserveAspectRatio(void *a1, const char *a2, ...)
{
  return [a1 preserveAspectRatio];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return [a1 previousState];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_recordedFileSize(void *a1, const char *a2, ...)
{
  return [a1 recordedFileSize];
}

id objc_msgSend_recordingDidPause(void *a1, const char *a2, ...)
{
  return [a1 recordingDidPause];
}

id objc_msgSend_recordingOutputCount(void *a1, const char *a2, ...)
{
  return [a1 recordingOutputCount];
}

id objc_msgSend_recordingOutputDuration(void *a1, const char *a2, ...)
{
  return [a1 recordingOutputDuration];
}

id objc_msgSend_recordingOutputFileSize(void *a1, const char *a2, ...)
{
  return [a1 recordingOutputFileSize];
}

id objc_msgSend_recordingOutputFileType(void *a1, const char *a2, ...)
{
  return [a1 recordingOutputFileType];
}

id objc_msgSend_recordingOutputVideoCodecType(void *a1, const char *a2, ...)
{
  return [a1 recordingOutputVideoCodecType];
}

id objc_msgSend_recordingTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 recordingTotalDuration];
}

id objc_msgSend_recordingTotalFileSize(void *a1, const char *a2, ...)
{
  return [a1 recordingTotalFileSize];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllDelegates(void *a1, const char *a2, ...)
{
  return [a1 removeAllDelegates];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_removeObserversForSession(void *a1, const char *a2, ...)
{
  return [a1 removeObserversForSession];
}

id objc_msgSend_removeSystemObserver(void *a1, const char *a2, ...)
{
  return [a1 removeSystemObserver];
}

id objc_msgSend_replayKitScreenRecordingHEVC(void *a1, const char *a2, ...)
{
  return [a1 replayKitScreenRecordingHEVC];
}

id objc_msgSend_reportingAgent(void *a1, const char *a2, ...)
{
  return [a1 reportingAgent];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resetReportingMetrics(void *a1, const char *a2, ...)
{
  return [a1 resetReportingMetrics];
}

id objc_msgSend_resetThermalResults(void *a1, const char *a2, ...)
{
  return [a1 resetThermalResults];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeSession(void *a1, const char *a2, ...)
{
  return [a1 resumeSession];
}

id objc_msgSend_rotatingDeviceUniqueID(void *a1, const char *a2, ...)
{
  return [a1 rotatingDeviceUniqueID];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 sampleBuffer];
}

id objc_msgSend_scaleToFit(void *a1, const char *a2, ...)
{
  return [a1 scaleToFit];
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return [a1 seconds];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceNameForReporting(void *a1, const char *a2, ...)
{
  return [a1 serviceNameForReporting];
}

id objc_msgSend_sessionDidStop(void *a1, const char *a2, ...)
{
  return [a1 sessionDidStop];
}

id objc_msgSend_sessionState(void *a1, const char *a2, ...)
{
  return [a1 sessionState];
}

id objc_msgSend_setAVAudioSessionCategory(void *a1, const char *a2, ...)
{
  return [a1 setAVAudioSessionCategory];
}

id objc_msgSend_setUpDeviceLockNotifications(void *a1, const char *a2, ...)
{
  return [a1 setUpDeviceLockNotifications];
}

id objc_msgSend_setUpFrontBoardServices(void *a1, const char *a2, ...)
{
  return [a1 setUpFrontBoardServices];
}

id objc_msgSend_setUpMemoryPressureNotification(void *a1, const char *a2, ...)
{
  return [a1 setUpMemoryPressureNotification];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setupAssetWriter(void *a1, const char *a2, ...)
{
  return [a1 setupAssetWriter];
}

id objc_msgSend_setupConnection(void *a1, const char *a2, ...)
{
  return [a1 setupConnection];
}

id objc_msgSend_setupDispatchLimits(void *a1, const char *a2, ...)
{
  return [a1 setupDispatchLimits];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_shouldBypassAlertForTest(void *a1, const char *a2, ...)
{
  return [a1 shouldBypassAlertForTest];
}

id objc_msgSend_shouldSupressAlert(void *a1, const char *a2, ...)
{
  return [a1 shouldSupressAlert];
}

id objc_msgSend_showCursor(void *a1, const char *a2, ...)
{
  return [a1 showCursor];
}

id objc_msgSend_showMouseClicks(void *a1, const char *a2, ...)
{
  return [a1 showMouseClicks];
}

id objc_msgSend_showResumeBroadcastAlert(void *a1, const char *a2, ...)
{
  return [a1 showResumeBroadcastAlert];
}

id objc_msgSend_showStopSystemSessionAlert(void *a1, const char *a2, ...)
{
  return [a1 showStopSystemSessionAlert];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAcknowledgementAlertTimer(void *a1, const char *a2, ...)
{
  return [a1 startAcknowledgementAlertTimer];
}

id objc_msgSend_startCapture(void *a1, const char *a2, ...)
{
  return [a1 startCapture];
}

id objc_msgSend_startCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 startCaptureSession];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_startWithCompositeMode(void *a1, const char *a2, ...)
{
  return [a1 startWithCompositeMode];
}

id objc_msgSend_startWriting(void *a1, const char *a2, ...)
{
  return [a1 startWriting];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAllActiveClients(void *a1, const char *a2, ...)
{
  return [a1 stopAllActiveClients];
}

id objc_msgSend_stopAllCapture(void *a1, const char *a2, ...)
{
  return [a1 stopAllCapture];
}

id objc_msgSend_stopAppAudioCapture(void *a1, const char *a2, ...)
{
  return [a1 stopAppAudioCapture];
}

id objc_msgSend_stopCapture(void *a1, const char *a2, ...)
{
  return [a1 stopCapture];
}

id objc_msgSend_stopCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 stopCaptureSession];
}

id objc_msgSend_stopMicrophoneCapture(void *a1, const char *a2, ...)
{
  return [a1 stopMicrophoneCapture];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_streamID(void *a1, const char *a2, ...)
{
  return [a1 streamID];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_studioLightEffectTotalDuration(void *a1, const char *a2, ...)
{
  return [a1 studioLightEffectTotalDuration];
}

id objc_msgSend_studioLightIntensityEndValue(void *a1, const char *a2, ...)
{
  return [a1 studioLightIntensityEndValue];
}

id objc_msgSend_supportsShutterSound(void *a1, const char *a2, ...)
{
  return [a1 supportsShutterSound];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBannerEnabled(void *a1, const char *a2, ...)
{
  return [a1 systemBannerEnabled];
}

id objc_msgSend_systemBroadcastSessionAudioQueue(void *a1, const char *a2, ...)
{
  return [a1 systemBroadcastSessionAudioQueue];
}

id objc_msgSend_systemBroadcastSessionVideoQueue(void *a1, const char *a2, ...)
{
  return [a1 systemBroadcastSessionVideoQueue];
}

id objc_msgSend_systemObserver(void *a1, const char *a2, ...)
{
  return [a1 systemObserver];
}

id objc_msgSend_targetFrameRate(void *a1, const char *a2, ...)
{
  return [a1 targetFrameRate];
}

id objc_msgSend_tempFileURL(void *a1, const char *a2, ...)
{
  return [a1 tempFileURL];
}

id objc_msgSend_thermalDescription(void *a1, const char *a2, ...)
{
  return [a1 thermalDescription];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_totalAudioFrameCount(void *a1, const char *a2, ...)
{
  return [a1 totalAudioFrameCount];
}

id objc_msgSend_totalFrameCount(void *a1, const char *a2, ...)
{
  return [a1 totalFrameCount];
}

id objc_msgSend_totalMicFrameCount(void *a1, const char *a2, ...)
{
  return [a1 totalMicFrameCount];
}

id objc_msgSend_trackID(void *a1, const char *a2, ...)
{
  return [a1 trackID];
}

id objc_msgSend_trimVideoPresentationTime(void *a1, const char *a2, ...)
{
  return [a1 trimVideoPresentationTime];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateOutputPath(void *a1, const char *a2, ...)
{
  return [a1 updateOutputPath];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}

id objc_msgSend_userNotificationCenter(void *a1, const char *a2, ...)
{
  return [a1 userNotificationCenter];
}

id objc_msgSend_userStopped(void *a1, const char *a2, ...)
{
  return [a1 userStopped];
}

id objc_msgSend_videoCaptureRate(void *a1, const char *a2, ...)
{
  return [a1 videoCaptureRate];
}

id objc_msgSend_videoCaptureSize(void *a1, const char *a2, ...)
{
  return [a1 videoCaptureSize];
}

id objc_msgSend_videoCodecType(void *a1, const char *a2, ...)
{
  return [a1 videoCodecType];
}

id objc_msgSend_videoCompressionProperties(void *a1, const char *a2, ...)
{
  return [a1 videoCompressionProperties];
}

id objc_msgSend_videoFrameCount(void *a1, const char *a2, ...)
{
  return [a1 videoFrameCount];
}

id objc_msgSend_videoInput(void *a1, const char *a2, ...)
{
  return [a1 videoInput];
}

id objc_msgSend_weekOfYear(void *a1, const char *a2, ...)
{
  return [a1 weekOfYear];
}

id objc_msgSend_windowSize(void *a1, const char *a2, ...)
{
  return [a1 windowSize];
}

id objc_msgSend_yearForWeekOfYear(void *a1, const char *a2, ...)
{
  return [a1 yearForWeekOfYear];
}