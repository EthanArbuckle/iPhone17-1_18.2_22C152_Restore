void sub_5604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5630(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained player];
    v7 = v6;
    v27 = v3;
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);

    v9 = [v5 currentLoadedTimeRanges];
    v10 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v38;
      v15 = &stru_3D468;
      do
      {
        v16 = 0;
        v17 = v15;
        do
        {
          if (*(void *)v38 != v14) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v16);
          memset(buf, 0, sizeof(buf));
          if (v18) {
            [v18 CMTimeRangeValue];
          }
          CMTime v36 = buf[0];
          double v19 = CMTimeGetSeconds(&v36);
          CMTime v36 = buf[1];
          double v20 = CMTimeGetSeconds(&v36);
          v21 = +[NSNumber numberWithDouble:v19];
          [v10 addObject:v21];

          v22 = +[NSNumber numberWithDouble:v20];
          [v11 addObject:v22];

          v15 = [(__CFString *)v17 stringByAppendingFormat:@"(%f,%f) ", *(void *)&v19, *(void *)&v20];

          v16 = (char *)v16 + 1;
          v17 = v15;
        }
        while (v13 != v16);
        id v13 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
      }
      while (v13);
    }
    else
    {
      v15 = &stru_3D468;
    }

    v23 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].value) = 134218242;
      *(Float64 *)((char *)&buf[0].value + 4) = Seconds;
      LOWORD(buf[0].flags) = 2114;
      *(void *)((char *)&buf[0].flags + 2) = v15;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "currentTime=%f cachedTimeRanges=%{public}@", (uint8_t *)buf, 0x16u);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_5A6C;
    v31[3] = &unk_3C698;
    id v32 = v5;
    id v24 = v10;
    id v33 = v24;
    id v25 = v11;
    id v34 = v25;
    id v3 = v27;
    id v35 = v27;
    v26 = objc_retainBlock(v31);
    if (v26)
    {
      if (+[NSThread isMainThread])
      {
        ((void (*)(void *))v26[2])(v26);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_5AE4;
        block[3] = &unk_3C6C0;
        v30 = v26;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
}

void sub_5A6C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 player:*(void *)(a1 + 32) loadedTimeRangesDidChange:*(void *)(a1 + 40) durations:*(void *)(a1 + 48)];

  id v3 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 56));
  if (v3)
  {
    v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

uint64_t sub_5AE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_5CFC(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  if (([*(id *)(a1 + 32) isPlayable] & 1) == 0)
  {
    v2 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_24D70(v1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
}

void sub_5F18(uint64_t a1)
{
  uint64_t v1 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    v1[2]();
    uint64_t v1 = v2;
  }
}

void sub_62F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_6338(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  uint64_t v3 = [WeakRetained observedTimes];
  [WeakRetained setNeedsToUpdateTimeObservers:[v3 count] != 0];

  if (a1[4])
  {
    uint64_t v4 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      *(_DWORD *)buf = 138543362;
      id v14 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_recreateCurrentAssetWithRestoreTime: _seekToTime: %{public}@", buf, 0xCu);
    }

    [a1[4] doubleValue];
    double v7 = v6;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_64E0;
    v10[3] = &unk_3C760;
    id v11 = a1[4];
    id v12 = a1[5];
    [WeakRetained _seekToTime:v10 completionHandler:v7];
  }
  else
  {
    id v8 = objc_retainBlock(a1[5]);
    v9 = v8;
    if (v8) {
      (*((void (**)(id, void))v8 + 2))(v8, 0);
    }
  }
}

void sub_64E0(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v4 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_recreateCurrentAssetWithRestoreTime: _seekToTime to %{public}@ did not finish", (uint8_t *)&v8, 0xCu);
    }
  }
  id v6 = objc_retainBlock(*(id *)(a1 + 40));
  double v7 = v6;
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, a2);
  }
}

void sub_65C0(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setAsset:v4];

  id v5 = objc_retainBlock(*(id *)(a1 + 32));
  id v6 = v5;
  if (v5) {
    (*((void (**)(id))v5 + 2))(v5);
  }
}

uint64_t sub_67D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_67E4(uint64_t a1)
{
}

uint64_t sub_67EC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 216) copy];

  return _objc_release_x1();
}

void sub_6EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained scrubPausableDispatchAfterGeneration] == *(id *)(a1 + 40)) {
    WeakRetained[14] = 1;
  }
}

void sub_700C(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 9))
  {
    v2 = BKAudiobooksStreamingLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
      int v4 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109376;
      v6[1] = v3;
      __int16 v7 = 1024;
      int v8 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "IsStalling %d -> %d", (uint8_t *)v6, 0xEu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 9) = *(unsigned char *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 player:*(void *)(a1 + 32) stallingStateDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

uint64_t sub_7108(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_7224(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(*(void *)(a1 + 32) + 10))
  {
    v2 = BKAudiobooksStreamingLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
      int v4 = *(unsigned __int8 *)(a1 + 40);
      v6[0] = 67109376;
      v6[1] = v3;
      __int16 v7 = 1024;
      int v8 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "IsLoadingResource %d -> %d", (uint8_t *)v6, 0xEu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 10) = *(unsigned char *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 player:*(void *)(a1 + 32) loadingResourcesStateDidChange:*(unsigned __int8 *)(a1 + 40)];
  }
}

uint64_t sub_7320(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_7D64(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_7DC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_7E50;
    block[3] = &unk_3C710;
    void block[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_7E50(uint64_t a1)
{
  v2 = *(_DWORD **)(a1 + 32);
  int v3 = v2[6];
  int v4 = [v2 player];
  LODWORD(v5) = v3;
  [v4 setVolume:v5];

  id v6 = *(void **)(a1 + 32);

  return [v6 _updateAudioParameters];
}

void sub_7EAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsLoadingResources:0];
}

void sub_7EF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained player];
  v2 = [v1 outputContext];
  int v3 = [v2 contextID];
  id v4 = [v3 copy];
  [WeakRetained setOutputContextID:v4];
}

id sub_8558(uint64_t a1)
{
  v2 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "onRouteChange: pause", v4, 2u);
  }

  return [*(id *)(a1 + 32) pause];
}

uint64_t sub_85CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_89CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = [*(id *)(a1 + 32) accessLog];
    id v4 = [v3 events];
    double v5 = [v4 lastObject];

    [v5 indicatedBitrate];
    float v7 = v6;
    [WeakRetained lastBitrate];
    if (v8 != v7)
    {
      uint64_t v9 = BKAudiobooksStreamingLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        [WeakRetained lastBitrate];
        *(_DWORD *)buf = 134218240;
        double v21 = v10;
        __int16 v22 = 2048;
        double v23 = v7;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Bit Rate %.0f -> %.0f.", buf, 0x16u);
      }

      [WeakRetained lastBitrate];
      int v12 = v11;
      [WeakRetained delegate];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_8B94;
      block[3] = &unk_3C8B8;
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = WeakRetained;
      int v18 = v12;
      float v19 = v7;
      id v13 = v16;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      *(float *)&double v14 = v7;
      [WeakRetained setLastBitrate:v14];
    }
  }
}

id sub_8B94(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  return [*(id *)(a1 + 32) player:*(void *)(a1 + 40) bitrateChangedFrom:a2 to:a3];
}

void sub_8D00(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    double v4 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) pendingCurrentTime];
    if (vabdd_f64(v4, v5) < 0.01) {
      [*(id *)(a1 + 32) setPendingCurrentTime:1.79769313e308];
    }
    if ([*(id *)(a1 + 32) isCurrentTimeValid])
    {
      double v6 = [*(id *)(a1 + 32) delegate];
      [v6 player:*(void *)(a1 + 32) positionDidChange:*(double *)(a1 + 48)];
    }
  }
  id v7 = objc_retainBlock(*(id *)(a1 + 40));
  if (v7)
  {
    id v8 = v7;
    (*((void (**)(id, uint64_t))v7 + 2))(v7, a2);
    id v7 = v8;
  }
}

void sub_9084(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0)
  {
    double v4 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_seekToTime to %lf did not finish (setCurrentTime)", (uint8_t *)&v8, 0xCu);
    }
  }
  id v6 = objc_retainBlock(*(id *)(a1 + 32));
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, a2);
  }
}

void sub_9408(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_942C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained && WeakRetained[19] == *(void *)(a1 + 40))
  {
    *((unsigned char *)WeakRetained + 13) = 1;
    [WeakRetained _playWithSeekTime:*((double *)WeakRetained + 13) fadeIn:0.0];
    uint64_t v5 = (void *)(v4[19] + 1);
    v4[19] = v5;
    dispatch_time_t v6 = dispatch_time(0, 200000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_9538;
    v7[3] = &unk_3C800;
    objc_copyWeak(v8, v2);
    v8[1] = v5;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
    objc_destroyWeak(v8);
  }
}

void sub_9538(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*((void *)WeakRetained + 19) == *(void *)(a1 + 40)) {
    WeakRetained[14] = 1;
  }
}

void sub_9588(uint64_t a1, uint64_t a2)
{
  if ((a2 & 1) == 0)
  {
    double v4 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 134217984;
      uint64_t v9 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_seekToTime to %lf did not finish (_handleScrubPlayPreviewAtTime:completion:)", (uint8_t *)&v8, 0xCu);
    }
  }
  id v6 = objc_retainBlock(*(id *)(a1 + 32));
  id v7 = v6;
  if (v6) {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, a2);
  }
}

void sub_A088(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) pendingCurrentTime];
  double v4 = *(void **)(a1 + 32);
  if (v5 == 1.79769313e308)
  {
    id v6 = [v4 player];
    id v7 = v6;
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    [v4 pendingCurrentTime];
    double Seconds = v8;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  float v10 = *(void **)(a1 + 32);
  int v11 = +[NSNumber numberWithDouble:Seconds];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_A204;
  v13[3] = &unk_3C980;
  objc_copyWeak(&v15, &location);
  id v12 = v3;
  id v14 = v12;
  [v10 _recreateCurrentAssetWithRestoreTime:v11 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void sub_A1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_A204(uint64_t a1, char a2)
{
  double v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_A2E8;
  v6[3] = &unk_3C958;
  objc_copyWeak(&v8, v4);
  char v9 = a2;
  id v7 = *(id *)(a1 + 32);
  [WeakRetained _activateSessionWithCompletion:v6];

  objc_destroyWeak(&v8);
}

void sub_A2D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_A2E8(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (a2 && WeakRetained && *(unsigned char *)(a1 + 48))
  {
    [WeakRetained updateTimeObservers];
    double v5 = [v8 player];
    [v8 playbackRate];
    [v5 playImmediatelyAtRate:];
  }
  id v6 = objc_retainBlock(*(id *)(a1 + 32));
  id v7 = v6;
  if (v6) {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

void sub_A394(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  double v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_A484;
  v6[3] = &unk_3C9D0;
  objc_copyWeak(&v8, &location);
  id v5 = v3;
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 _activateSessionWithCompletion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void sub_A468(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_A484(id *a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = WeakRetained;
  if (a2)
  {
    [WeakRetained updateTimeObservers];
    [v5 playFadeInTime];
    if (fabsf(v6) >= 0.01)
    {
      id v13 = [v5 player];
      [v13 setRate:0.0];

      id v14 = [v5 player];
      [a1[4] playbackRate];
      int v16 = v15;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_A5EC;
      v18[3] = &unk_3C760;
      v18[4] = v5;
      id v19 = a1[5];
      LODWORD(v17) = v16;
      [v14 prerollAtRate:v18 completionHandler:v17];

      goto LABEL_8;
    }
    [v5 playbackRate];
    int v8 = v7;
    char v9 = [v5 player];
    LODWORD(v10) = v8;
    [v9 setRate:v10];
  }
  id v11 = objc_retainBlock(a1[5]);
  id v12 = v11;
  if (v11) {
    (*((void (**)(id))v11 + 2))(v11);
  }

LABEL_8:
}

void sub_A5EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) player];
  [*(id *)(a1 + 32) playbackRate];
  int v4 = v3;
  [*(id *)(a1 + 32) playFadeInTime];
  CMTimeMakeWithSeconds(&v9, v5, 1000000000);
  LODWORD(v6) = v4;
  [v2 setRate:&v9 withVolumeRampDuration:v6];

  id v7 = objc_retainBlock(*(id *)(a1 + 40));
  int v8 = v7;
  if (v7) {
    (*((void (**)(id))v7 + 2))(v7);
  }
}

uint64_t sub_A68C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    int v3 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 32) pendingCurrentTime];
      int v6 = 134217984;
      uint64_t v7 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "_seekToTime to %lf did not finish (_playWithSeekTime)", (uint8_t *)&v6, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_A7FC(uint64_t a1, char a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A8BC;
  block[3] = &unk_3CA20;
  char v8 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_A8BC(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48) || *(void *)(a1 + 32))
  {
    uint64_t v2 = BKAudiobooksBKAVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_2505C(a1, v2, v3, v4, v5, v6, v7, v8);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_B324(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_B34C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) outputContextID];
    LODWORD(v3) = [v3 isEqualToString:v4];

    id WeakRetained = v6;
    if (v3)
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 56);
      [v6 _reevaluateInternalVolumeWithContextCanSetVolume:*(unsigned __int8 *)(a1 + 60) volume:v5];
      id WeakRetained = v6;
    }
  }
}

uint64_t sub_B3DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_B8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_B934(uint64_t a1)
{
  uint64_t v2 = BKAudiobooksBKAVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 134217984;
    uint64_t v8 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "observed time: %.1f", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [WeakRetained delegate];
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v5 player:v6 didReachPosition:*(double *)(a1 + 40)];
}

void sub_BE90(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_BEB8(uint64_t a1, CMTime *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _actualRate];
    if (v5 > 0.0)
    {
      CMTime v9 = *a2;
      double Seconds = CMTimeGetSeconds(&v9);
      [v4 lastPosition];
      if (vabdd_f64(Seconds, v7) >= 0.00999999978)
      {
        [v4 setLastPosition:Seconds];
        uint64_t v8 = [v4 delegate];
        [v8 player:v4 positionDidChange:Seconds];
      }
    }
  }
}

void sub_C524(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_C540(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_C5E8(id a1)
{
  qword_48DD0 = objc_opt_new();

  _objc_release_x1();
}

void sub_C7A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained stores];
    uint64_t v4 = [v3 arrayByAddingObject:*(void *)(a1 + 32)];
    [v5 setStores:v4];

    id WeakRetained = v5;
  }
}

void sub_C970(uint64_t a1)
{
  uint64_t v1 = dispatch_group_create();
  id v19 = +[NSMutableArray array];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v17 = WeakRetained;
    uint64_t v3 = [WeakRetained stores];
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v4 = [v17 stores];
      id v5 = +[NSPredicate predicateWithBlock:&stru_3CB00];
      uint64_t v6 = [v4 filteredArrayUsingPredicate:v5];

      uint64_t v3 = (void *)v6;
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v3;
    id v7 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v35;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(obj);
          }
          double v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          dispatch_group_enter(v1);
          id v11 = BKAudiobooksPersistenceLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = [*(id *)(a1 + 32) assetID];
            id v13 = [v10 shortName];
            *(_DWORD *)buf = 138478083;
            long long v39 = v12;
            __int16 v40 = 2114;
            v41 = v13;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Checking for bookmark on assetID %{private}@ on store %{public}@", buf, 0x16u);
          }
          uint64_t v14 = *(void *)(a1 + 32);
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_CD70;
          v28[3] = &unk_3CB50;
          objc_copyWeak(&v33, (id *)(a1 + 56));
          v29 = v1;
          id v30 = *(id *)(a1 + 32);
          v31 = v10;
          id v32 = v19;
          [v10 bookmarkTimeForAudiobook:v14 completion:v28];

          objc_destroyWeak(&v33);
        }
        id v7 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v7);
    }

    int v15 = dispatch_get_global_queue(2, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D120;
    block[3] = &unk_3CBB8;
    __int16 v22 = v1;
    id v23 = *(id *)(a1 + 32);
    id v24 = v19;
    id v25 = v17;
    int v16 = *(void **)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 40);
    id v27 = v16;
    dispatch_async(v15, block);

    id WeakRetained = v17;
  }
}

void sub_CD4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL sub_CD68(id a1, BKAudiobookBookmarkPersisting *a2, NSDictionary *a3)
{
  return [(BKAudiobookBookmarkPersisting *)a2 isLocal];
}

void sub_CD70(uint64_t a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  double v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = WeakRetained[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_CEE8;
    block[3] = &unk_3CB28;
    id v17 = v7;
    id v18 = v8;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = *(void **)(a1 + 56);
    id v19 = v12;
    uint64_t v20 = v13;
    id v21 = v14;
    double v23 = a4;
    id v22 = *(id *)(a1 + 32);
    dispatch_async(v11, block);
  }
  else
  {
    int v15 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "self nil", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_CEE8(uint64_t a1)
{
  if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
  {
    id v7 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 48) assetID];
      uint64_t v9 = [*(id *)(a1 + 56) shortName];
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138478339;
      id v18 = v8;
      __int16 v19 = 2114;
      uint64_t v20 = v9;
      __int16 v21 = 2114;
      uint64_t v22 = v10;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Found bookmark on assetID %{private}@ on store %{public}@ error: %{public}@", buf, 0x20u);
    }
    id v11 = *(void **)(a1 + 64);
    uint64_t v2 = +[NSNumber numberWithDouble:*(double *)(a1 + 80), @"bookmark time"];
    uint64_t v12 = *(void *)(a1 + 32);
    v16[0] = v2;
    v16[1] = v12;
    v15[1] = @"timestamp";
    v15[2] = @"source";
    uint64_t v13 = [*(id *)(a1 + 56) shortName];
    v16[2] = v13;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    [v11 addObject:v14];
  }
  else
  {
    uint64_t v2 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 48) assetID];
      uint64_t v4 = [*(id *)(a1 + 56) shortName];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138478595;
      id v18 = v3;
      __int16 v19 = 2114;
      uint64_t v20 = v4;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      __int16 v23 = 2114;
      uint64_t v24 = v6;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "No bookmark for assetID %{private}@ on store %{public}@ date: %@ error: %{public}@", buf, 0x2Au);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_D120(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  dispatch_time_t v3 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v2, v3))
  {
    uint64_t v4 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_25258(a1, v4);
    }
  }
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 56) + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v8[2] = sub_D230;
  v8[3] = &unk_3C698;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 72);
  dispatch_async(v5, v8);
}

void sub_D230(id *a1)
{
  if ([a1[4] count])
  {
    [a1[4] sortUsingComparator:&stru_3CB90];
    uint64_t v2 = [a1[4] lastObject];
    objc_opt_class();
    dispatch_time_t v3 = [v2 objectForKeyedSubscript:@"bookmark time"];
    uint64_t v4 = BUDynamicCast();
    [v4 doubleValue];
    double v6 = v5;

    uint64_t v7 = [v2 objectForKeyedSubscript:@"timestamp"];
    [a1[5] _rollbackAmountForLastPlayedDate:v7];
    double v9 = v8;
    [a1[6] duration];
    if (v6 > v10 + -5.0)
    {
      id v11 = BKAudiobooksPersistenceLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [a1[6] assetID];
        int v22 = 138412290;
        __int16 v23 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "For %@ bookmark time is past our last viable bookmark time. Resetting to zero.", (uint8_t *)&v22, 0xCu);
      }
      double v9 = 0.0;
      double v6 = 0.0;
    }
    uint64_t v13 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [a1[6] assetID];
      int v15 = [v2 objectForKeyedSubscript:@"source"];
      id v16 = a1[4];
      int v22 = 138478851;
      __int16 v23 = v14;
      __int16 v24 = 2048;
      double v25 = v6;
      __int16 v26 = 2114;
      id v27 = v7;
      __int16 v28 = 2114;
      v29 = v15;
      __int16 v30 = 2114;
      id v31 = v16;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "For %{private}@ picking bookmark time %lf dated %{public}@ from source %{public}@.  Whole list of available bookmarks: %{public}@", (uint8_t *)&v22, 0x34u);
    }
    id v17 = objc_retainBlock(a1[7]);
    id v18 = v17;
    if (v17) {
      (*((void (**)(id, void *, void, double, double))v17 + 2))(v17, v7, 0, v6, v9);
    }
  }
  else
  {
    __int16 v19 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [a1[6] assetID];
      int v22 = 138477827;
      __int16 v23 = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "For audiobook %{private}@, cannot find a bookmark time.", (uint8_t *)&v22, 0xCu);
    }
    id v21 = objc_retainBlock(a1[7]);
    uint64_t v2 = v21;
    if (v21) {
      (*((void (**)(id, void, void, double, double))v21 + 2))(v21, 0, 0, 0.0, 0.0);
    }
  }
}

int64_t sub_D540(id a1, NSDictionary *a2, NSDictionary *a3)
{
  uint64_t v4 = a3;
  double v5 = [(NSDictionary *)a2 objectForKeyedSubscript:@"timestamp"];
  double v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"timestamp"];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_D704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_D71C(uint64_t a1)
{
  uint64_t v2 = dispatch_group_create();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_D9FC;
  v25[4] = sub_DA0C;
  id v26 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v4 = [WeakRetained stores];
    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v22;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v4);
          }
          double v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v9 = *(void *)(a1 + 56);
          if (v9 >= (uint64_t)[v8 eventThreshold])
          {
            dispatch_group_enter(v2);
            double v10 = *(double *)(a1 + 64);
            uint64_t v11 = *(void *)(a1 + 32);
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_DA14;
            v17[3] = &unk_3CC30;
            objc_copyWeak(&v20, (id *)(a1 + 48));
            __int16 v19 = v25;
            id v18 = v2;
            [v8 saveBookmarkTime:v11 audiobook:v17 completion:v10];

            objc_destroyWeak(&v20);
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v5);
    }

    id v12 = *((void *)v13 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DB34;
    block[3] = &unk_3CC58;
    id v15 = *(id *)(a1 + 40);
    id v16 = v25;
    dispatch_group_notify(v2, v12, block);

    id WeakRetained = v13;
  }

  _Block_object_dispose(v25, 8);
}

void sub_D9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

uint64_t sub_D9FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_DA0C(uint64_t a1)
{
}

void sub_DA14(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DAE8;
  block[3] = &unk_3CC08;
  id v10 = v3;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v8;
  long long v11 = v8;
  id v7 = v3;
  dispatch_async(v5, block);
}

void sub_DAE8(void *a1)
{
  uint64_t v2 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  uint64_t v4 = v5;
  if (!v5) {
    uint64_t v4 = (void *)a1[4];
  }
  objc_storeStrong(v3, v4);
  id v6 = a1[5];

  dispatch_group_leave(v6);
}

void sub_DB34(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 32));
  if (v2)
  {
    id v3 = v2;
    (*((void (**)(id, void))v2 + 2))(v2, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    id v2 = v3;
  }
}

void sub_DF38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_DF5C(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v8 = WeakRetained;
  if (v6)
  {
    uint64_t v9 = BKAudiobooksPersistenceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_25310((uint64_t)v6, v9);
    }
  }
  else
  {
    [WeakRetained saveBookmarkTime:*(void *)(a1 + 32) audiobook:5 importance:0 completion:a2];
  }
}

__CFString *NSStringFromBKAudiobookPlayerState(unint64_t a1)
{
  if (a1 >= 5)
  {
    uint64_t v1 = +[NSString stringWithFormat:@"Unexpected value %ld", a1];
  }
  else
  {
    uint64_t v1 = off_3CCC8[a1];
  }

  return v1;
}

void sub_EF14(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = BKAudiobooksStreamingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Finished fetching decryption key with error: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  long long v8 = *(void **)(a1 + 32);
  if (v6)
  {
    [v8 finishLoadingWithError:v6];
  }
  else
  {
    uint64_t v9 = [v8 contentInformationRequest];
    [v9 setContentType:AVStreamingKeyDeliveryPersistentContentKeyType];

    id v10 = [*(id *)(a1 + 32) dataRequest];
    [v10 respondWithData:v5];

    [*(id *)(a1 + 32) finishLoading];
  }
}

void sub_F040(_Unwind_Exception *exception_object, int a2, ...)
{
  va_start(va, a2);
  if (a2 == 1)
  {
    id v3 = objc_begin_catch(exception_object);
    [*(id *)(v2 + 32) finishLoadingWithError:0];
    uint64_t v4 = BKAudiobooksStreamingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [v3 reason];
      sub_25388(v5, (uint8_t *)va, v4);
    }

    objc_end_catch();
    JUMPOUT(0xF004);
  }
  _Unwind_Resume(exception_object);
}

void sub_F270(id a1)
{
  uint64_t v1 = BKAudiobooksNowPlayingAdaptorLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "initializing BKAudiobookNowPlayingAdaptor", (uint8_t *)v8, 2u);
  }

  uint64_t v2 = [BKAudiobookNowPlayingAdaptorMediaLibrary alloc];
  id v3 = +[BKAudiobookPlayer sharedInstance];
  uint64_t v4 = [(BKAudiobookNowPlayingAdaptor *)v2 initWithPlayer:v3];

  id v5 = (void *)qword_48DE8;
  qword_48DE8 = (uint64_t)v4;
  id v6 = v4;

  id v7 = +[MPNowPlayingInfoCenter defaultCenter];
  [v7 setPlaybackQueueDataSource:v6];
}

void sub_10140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1015C(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (a2)
  {
    a2 = +[UIImage imageWithCGImage:a2];
  }
  id v5 = [*(id *)(a1 + 32) assetID];
  if ([*(id *)(a1 + 32) isAudiobookPreview])
  {
    id v6 = [*(id *)(a1 + 40) nowPlayingAudiobookArtworkForPreviews];

    if (v6)
    {
      id v7 = BKAudiobooksNowPlayingAdaptorLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Returning artwork for previewed audiobook.", buf, 2u);
      }

      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = [*(id *)(a1 + 40) nowPlayingAudiobookArtworkForPreviews];
      (*(void (**)(uint64_t, NSObject *, void))(v8 + 16))(v8, v9, 0);
    }
    else
    {
      int v11 = [*(id *)(a1 + 40) artworkCompletionBlocks];

      if (v11)
      {
        id v12 = [*(id *)(a1 + 40) artworkCompletionBlocks];
        id v13 = objc_retainBlock(*(id *)(a1 + 48));
        [v12 addObject:v13];
      }
      else
      {
        id v12 = objc_retainBlock(*(id *)(a1 + 48));
        id v13 = +[NSMutableArray arrayWithObject:v12];
        [*(id *)(a1 + 40) setArtworkCompletionBlocks:v13];
      }

      uint64_t v9 = BKAudiobooksNowPlayingAdaptorLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "No artwork available for audiobook preview. Fetching artwork.", buf, 2u);
      }
    }
  }
  else if (!a2 {
         && ([*(id *)(a1 + 40) genericCoverProvider], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0)
  }
         && (v15 = (void *)v14, id v16 = [v5 length], v15, v16))
  {
    id v17 = BKAudiobooksNowPlayingAdaptorLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Generating artwork for active audiobook. None available already on the audiobook.", buf, 2u);
    }

    id v18 = [WeakRetained genericCoverProvider];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10488;
    v19[3] = &unk_3CD40;
    id v20 = *(id *)(a1 + 48);
    [v18 fetchCoverForAssetID:v5 size:v19 completion:^(UIImage *v20, NSError *v21) {
    *(double *)(a1 + 64) = v20;
    *(double *)(a1 + 72) = v21;
}];
  }
  else
  {
    id v10 = BKAudiobooksNowPlayingAdaptorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Returning artwork for active audiobook found on the current audiobook.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_10488(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[UIImage imageWithCGImage:a2];
  id v7 = BKAudiobooksNowPlayingAdaptorLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 size];
    uint64_t v8 = NSStringFromCGSize(v11);
    int v9 = 138543362;
    id v10 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Finished generating artwork for active audiobook (%{public}@)", (uint8_t *)&v9, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id BKAudiobooksLog()
{
  if (qword_48DF8 != -1) {
    dispatch_once(&qword_48DF8, &stru_3CD88);
  }
  v0 = (void *)qword_48DF0;

  return v0;
}

void sub_10EF0(id a1)
{
  qword_48DF0 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks");

  _objc_release_x1();
}

id BKAudiobooksBKAVLog()
{
  if (qword_48E08 != -1) {
    dispatch_once(&qword_48E08, &stru_3CDA8);
  }
  v0 = (void *)qword_48E00;

  return v0;
}

void sub_10F88(id a1)
{
  qword_48E00 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.BKAVPlayer");

  _objc_release_x1();
}

id BKAudiobooksSleepTimerLog()
{
  if (qword_48E18 != -1) {
    dispatch_once(&qword_48E18, &stru_3CDC8);
  }
  v0 = (void *)qword_48E10;

  return v0;
}

void sub_11020(id a1)
{
  qword_48E10 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.sleepTimer");

  _objc_release_x1();
}

id BKAudiobooksMediaRemoteLog()
{
  if (qword_48E28 != -1) {
    dispatch_once(&qword_48E28, &stru_3CDE8);
  }
  v0 = (void *)qword_48E20;

  return v0;
}

void sub_110B8(id a1)
{
  qword_48E20 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.mediaRemote");

  _objc_release_x1();
}

id BKAudiobooksNowPlayingAdaptorLog()
{
  if (qword_48E38 != -1) {
    dispatch_once(&qword_48E38, &stru_3CE08);
  }
  v0 = (void *)qword_48E30;

  return v0;
}

void sub_11150(id a1)
{
  qword_48E30 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.nowPlayingAdaptor");

  _objc_release_x1();
}

id BKAudiobooksSkipControllerLog()
{
  if (qword_48E48 != -1) {
    dispatch_once(&qword_48E48, &stru_3CE28);
  }
  v0 = (void *)qword_48E40;

  return v0;
}

void sub_111E8(id a1)
{
  qword_48E40 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.skipController");

  _objc_release_x1();
}

id BKAudiobooksPersistenceLog()
{
  if (qword_48E58 != -1) {
    dispatch_once(&qword_48E58, &stru_3CE48);
  }
  v0 = (void *)qword_48E50;

  return v0;
}

void sub_11280(id a1)
{
  qword_48E50 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.persistence");

  _objc_release_x1();
}

id BKAudiobooksPersistenceCloudKitLog()
{
  if (qword_48E68 != -1) {
    dispatch_once(&qword_48E68, &stru_3CE68);
  }
  v0 = (void *)qword_48E60;

  return v0;
}

void sub_11318(id a1)
{
  qword_48E60 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.persistence.cloudkit");

  _objc_release_x1();
}

id BKAudiobooksPersistenceMediaLibraryLocalLog()
{
  if (qword_48E78 != -1) {
    dispatch_once(&qword_48E78, &stru_3CE88);
  }
  v0 = (void *)qword_48E70;

  return v0;
}

void sub_113B0(id a1)
{
  qword_48E70 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.persistence.ml.local");

  _objc_release_x1();
}

id BKAudiobooksPersistenceMediaLibraryDAAPLog()
{
  if (qword_48E88 != -1) {
    dispatch_once(&qword_48E88, &stru_3CEA8);
  }
  v0 = (void *)qword_48E80;

  return v0;
}

void sub_11448(id a1)
{
  qword_48E80 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.persistence.ml.daap");

  _objc_release_x1();
}

id BKBTClassicLog()
{
  if (qword_48E98 != -1) {
    dispatch_once(&qword_48E98, &stru_3CEC8);
  }
  v0 = (void *)qword_48E90;

  return v0;
}

void sub_114E0(id a1)
{
  qword_48E90 = (uint64_t)os_log_create("com.apple.iBooks", "BKBTClassic");

  _objc_release_x1();
}

id BKAudiobooksStreamingLog()
{
  if (qword_48EA8 != -1) {
    dispatch_once(&qword_48EA8, &stru_3CEE8);
  }
  v0 = (void *)qword_48EA0;

  return v0;
}

void sub_11578(id a1)
{
  qword_48EA0 = (uint64_t)os_log_create("com.apple.iBooks", "BKAudiobooks.HLSStreaming");

  _objc_release_x1();
}

id BKAudiobooksBundle()
{
  if (qword_48EB8 != -1) {
    dispatch_once(&qword_48EB8, &stru_3CF08);
  }
  v0 = (void *)qword_48EB0;

  return v0;
}

void sub_11688(id a1)
{
  qword_48EB0 = +[NSBundle bundleForClass:objc_opt_class()];

  _objc_release_x1();
}

void sub_11A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_11ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 UUIDString];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setGuid:v4];

  id v6 = BKAudiobooksLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Received GUID for audiobook: %@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_11D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_11D74(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 4, a2);
  }
  id v6 = objc_retainBlock(*(id *)(a1 + 32));
  int v7 = v6;
  if (v6) {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

void sub_11EA0(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = (void (**)(id, id))objc_retainBlock(*(id *)(a1 + 32));
  if (v3) {
    v3[2](v3, [v4 CGImage]);
  }
}

void sub_13B0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _skipTimerFired];
    id WeakRetained = v2;
  }
}

void sub_13EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _seekTimerFired];
    id WeakRetained = v2;
  }
}

void sub_14E04(id a1)
{
  uint64_t v1 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v5 = [v1 mutableCopy];

  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@",-"];
  [v5 formUnionWithCharacterSet:v2];

  id v3 = [v5 copy];
  id v4 = (void *)qword_48EC0;
  qword_48EC0 = (uint64_t)v3;
}

void sub_17758(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = BKAudiobooksLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_255FC(a1, (uint64_t)v6, v7);
    }

    id v8 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
    int v9 = v8;
    if (v8)
    {
      id v10 = v8[2];
LABEL_8:
      v10();
    }
  }
  else
  {
    CGSize v11 = (void (**)(void))objc_retainBlock(*(id *)(a1 + 40));
    int v9 = v11;
    if (v11)
    {
      id v10 = v11[2];
      goto LABEL_8;
    }
  }
}

void sub_178F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = BKAudiobooksLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_25714((uint64_t)v6, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_18458(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_48ED0;
  qword_48ED0 = v1;

  [(id)qword_48ED0 setUnitsStyle:2];
  [(id)qword_48ED0 setAllowedUnits:96];
  [(id)qword_48ED0 setMaximumUnitCount:2];
  [(id)qword_48ED0 setFormattingContext:5];
  uint64_t v3 = objc_opt_new();
  id v4 = (void *)qword_48ED8;
  qword_48ED8 = v3;

  [(id)qword_48ED8 setUnitsStyle:2];
  [(id)qword_48ED8 setAllowedUnits:128];
  [(id)qword_48ED8 setMaximumUnitCount:2];
  id v5 = (void *)qword_48ED8;

  [v5 setFormattingContext:5];
}

void sub_19248(id a1)
{
  qword_48EE8 = objc_opt_new();

  _objc_release_x1();
}

id sub_19680(uint64_t a1)
{
  id v2 = BKAudiobooksSleepTimerLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Sleep timer expired at end of chapter.", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    [v3 timeRangeInTrack];
  }
  else {
    memset(&v8, 0, sizeof(v8));
  }
  CMTime time = v8;
  double Seconds = CMTimeGetSeconds(&time);
  id v5 = BKAudiobooksSleepTimerLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (Seconds == 0.0)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Next chapter is the first in a track file.  Remembering to pause playback when state returns to Playing", buf, 2u);
    }

    return [*(id *)(a1 + 40) setWaitingForPlayerStatePlayingThenPause:1];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Pausing playback", buf, 2u);
    }

    return [*(id *)(a1 + 48) pause];
  }
}

id sub_198F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1A570(id a1)
{
  uint64_t v1 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v5 = [v1 mutableCopy];

  id v2 = +[NSCharacterSet characterSetWithCharactersInString:@",-"];
  [v5 formUnionWithCharacterSet:v2];

  id v3 = [v5 copy];
  id v4 = (void *)qword_48EF8;
  qword_48EF8 = (uint64_t)v3;
}

void sub_1BA10(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[BKAudiobookPlayer sharedInstance];
  id v2 = [v1 initWithPlayer:v4];
  id v3 = (void *)qword_48F10;
  qword_48F10 = (uint64_t)v2;
}

void sub_1C230(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1C24C(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:NSKeyValueChangeNewKey];
  id v3 = BUDynamicCast();
  unsigned int v4 = [v3 BOOLValue];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSkipBehavior:v4 ^ 1];
}

uint64_t sub_1C2F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1C5EC(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  BOOL v6 = [a2 contentItem];
  int v7 = [v6 identifier];
  *a4 = [v7 isEqualToString:*(void *)(a1 + 32)];

  return *a4;
}

void sub_1D6B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1D774(uint64_t a1)
{
  qword_48F20 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1E690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E6BC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addTimeObserversForTrack:*(void *)(a1 + 32)];
  [WeakRetained _updateTimeBeforeCurrentTrackWithTrackIndex:*(void *)(a1 + 56)];
  double v3 = *(double *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1E79C;
  v5[3] = &unk_3D118;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 64);
  [WeakRetained _updatePlayerWithOffsetInTrack:v4 chapterIndex:1 hasTrackChanged:v5 changedArtworkBlock:*(void *)(a1 + 40) currentTimeCompletion:v3];
}

id sub_1E79C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hasAlternateArtwork];
  double v3 = *(void **)(a1 + 32);
  if (v2)
  {
    double v4 = *(double *)(a1 + 40);
    return [v3 artworkForTime:v4];
  }
  else
  {
    return [v3 artwork];
  }
}

void sub_1FB18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendIsScrubbing];
}

void sub_1FC80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendPlaybackRateDidChange];
}

BOOL sub_1FE04(uint64_t a1, void *a2)
{
  [a2 floatValue];
  float v4 = *(float *)(a1 + 32);
  return v3 == v4 || vabdd_f64(v3, v4) < fabs(v4 * 0.000000999999997);
}

BOOL sub_1FF8C(uint64_t a1, void *a2)
{
  [a2 floatValue];
  float v4 = *(float *)(a1 + 32);
  return v3 == v4 || vabdd_f64(v3, v4) < fabs(v4 * 0.000000999999997);
}

void sub_20480(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2049C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _configureAudioSession];
  [WeakRetained pause];
  id v1 = [WeakRetained player];
  [v1 reset];
}

uint64_t sub_20504(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2066C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20688(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 albumTrackNumber] == *(id *)(a1 + 40))
  {
    CMTime v8 = (_OWORD *)(a1 + 48);
    if (v7)
    {
      [v7 timeRangeInTrack];
    }
    else
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v17 = 0u;
    }
    *(_OWORD *)&time2.value = v17;
    time2.epoch = v18;
    *(_OWORD *)&time1.value = *v8;
    time1.epoch = *(void *)(a1 + 64);
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    }
    if (v7)
    {
      [v7 timeRangeInTrack];
      *(_OWORD *)&lhs.value = v11;
      lhs.epoch = v12;
      [v7 timeRangeInTrack];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v11 = 0u;
      memset(&lhs, 0, sizeof(lhs));
      memset(v9, 0, sizeof(v9));
    }
    CMTime rhs = *(CMTime *)&v9[1];
    CMTimeAdd(&v15, &lhs, &rhs);
    *(_OWORD *)&time1.value = *v8;
    time1.epoch = *(void *)(a1 + 64);
    if (CMTimeCompare(&time1, &v15) < 0) {
      *a4 = 1;
    }
  }
}

id sub_226D8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) doubleValue];

  return [v1 artworkForTime:];
}

void sub_22E38(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_22E7C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_22ECC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_23068(id *a1)
{
  uint64_t v2 = [a1[4] assetID];
  float v3 = BKAudiobooksPersistenceCloudKitLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    long long v12 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "bookmarkTimeForAudiobook:completion: querying assetDetailManager on assetID %{private}@", buf, 0xCu);
  }

  float v4 = [a1[5] assetDetailManager];
  if (v4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v8[2] = sub_23244;
    v8[3] = &unk_3D1F8;
    int v9 = v2;
    id v10 = a1[6];
    [v4 assetDetailForAssetID:v9 completion:v8];

    id v5 = v9;
  }
  else
  {
    id v6 = BKAudiobooksPersistenceCloudKitLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_26420((uint64_t)v2, v6);
    }

    id v5 = (void (**)(id, void, void *, double))objc_retainBlock(a1[6]);
    if (v5)
    {
      id v7 = +[NSError errorWithDomain:@"BKAudiobooksError" code:2 userInfo:0];
      v5[2](v5, 0, v7, 0.0);
    }
  }
}

void sub_23244(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = BKAudiobooksPersistenceCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_26498(a1, (uint64_t)v6, v7);
    }
  }
  CMTime v8 = (void (**)(id, void *, id, double))objc_retainBlock(*(id *)(a1 + 40));
  if (v8)
  {
    [v5 bookmarkTime];
    double v10 = v9;
    long long v11 = [v5 datePlaybackTimeUpdated];
    v8[2](v8, v11, v6, v10);
  }
}

void sub_23518(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = BKAudiobooksPersistenceCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_2659C((uint64_t)v6, v7);
    }

    id v8 = objc_retainBlock(*(id *)(a1 + 56));
    double v9 = v8;
    if (v8) {
      (*((void (**)(id, id))v8 + 2))(v8, v6);
    }
  }
  else
  {
    double v9 = +[NSDate date];
    double v10 = BKAudiobooksPersistenceCloudKitLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      double v11 = *(double *)(a1 + 32);
      double v12 = *(double *)(a1 + 64);
      *(_DWORD *)buf = 138412802;
      double v31 = v11;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2048;
      double v35 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AssetDetailManager %@ Audiobook Setting bookmark time [%@ = %.2f].", buf, 0x20u);
    }

    [v5 setBookmarkTime:*(double *)(a1 + 64)];
    [v5 setDatePlaybackTimeUpdated:v9];
    [v5 setLastOpenDate:v9];
    [*(id *)(a1 + 40) duration];
    double v14 = v13;
    float v15 = 0.0;
    if (v13 != 0.0) {
      float v15 = *(double *)(a1 + 64) / v13;
    }
    if (v15 < 0.0 || v15 > 1.0)
    {
      id v16 = BKAudiobooksPersistenceCloudKitLog();
      double v17 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        [v5 bookmarkTime];
        *(_DWORD *)buf = 134218496;
        double v31 = v17;
        __int16 v32 = 2048;
        id v33 = v23;
        __int16 v34 = 2048;
        double v35 = v14;
        _os_log_fault_impl(&dword_0, v16, OS_LOG_TYPE_FAULT, "Calculated reading progress out of range %f.  bookmarkTime=%f audiobookDuration=%f", buf, 0x20u);
      }

      BUClamp();
      float v15 = v18;
    }
    [v5 readingProgressHighWaterMark];
    if (*(float *)&v19 >= v15) {
      float v20 = *(float *)&v19;
    }
    else {
      float v20 = v15;
    }
    *(float *)&double v19 = v15;
    [v5 setReadingProgress:v19];
    *(float *)&double v21 = v20;
    [v5 setReadingProgressHighWaterMark:v21];
    [v5 setReadingPositionLocationUpdateDate:v9];
    long long v22 = *(void **)(a1 + 48);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_23824;
    v24[3] = &unk_3D248;
    id v25 = *(id *)(a1 + 32);
    uint64_t v27 = *(void *)(a1 + 64);
    float v28 = v15;
    float v29 = v20;
    id v26 = *(id *)(a1 + 56);
    [v22 setAssetDetail:v5 completion:v24];
  }
}

void sub_23824(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = BKAudiobooksPersistenceCloudKitLog();
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 48);
      double v11 = *(float *)(a1 + 56);
      double v12 = *(float *)(a1 + 60);
      int v15 = 138413058;
      uint64_t v16 = v9;
      __int16 v17 = 2048;
      uint64_t v18 = v10;
      __int16 v19 = 2048;
      double v20 = v11;
      __int16 v21 = 2048;
      double v22 = v12;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Successful save of bookmark time for %@ to %lf, readingProgress %f, readingProgressHighWaterMark %f", (uint8_t *)&v15, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_26614(a1, (uint64_t)v6, v8);
  }

  id v13 = objc_retainBlock(*(id *)(a1 + 40));
  double v14 = v13;
  if (v13) {
    (*((void (**)(id, id))v13 + 2))(v13, v6);
  }
}

void sub_23980(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_23A90(id a1)
{
  uint64_t v1 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v4 = [v1 mutableCopy];

  [v4 removeCharactersInString:@"&="];
  id v2 = [v4 copy];
  float v3 = (void *)qword_48F28;
  qword_48F28 = (uint64_t)v2;
}

BOOL sub_241E4(uint64_t a1, void *a2)
{
  id v3 = [a2 persistentID];
  return v3 == [*(id *)(a1 + 32) persistentID];
}

void sub_2483C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24884(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_24894(uint64_t a1)
{
}

void sub_2489C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v18 = [v5 objectAtIndexedSubscript:a3];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v8 - *(double *)(a1 + 64);
  [v18 doubleValue];
  if (v9 >= 0.0)
  {
    if (v9 < *(double *)(a1 + 72))
    {
      double v14 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      int v15 = +[NSNumber numberWithDouble:v9];
      [v14 addObject:v15];

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v18];
    }
  }
  else
  {
    double v11 = v9 + v10;
    if (v9 + v10 > 0.0)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:&off_3E1A8];
      double v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v13 = +[NSNumber numberWithDouble:v11];
      [v12 addObject:v13];
    }
  }
  uint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  __int16 v17 = +[NSNumber numberWithDouble:v9 + *(double *)(a1 + 80)];
  [v16 addObject:v17];
}

void sub_24B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24B70(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  [a2 doubleValue];
  double v8 = v7;
  double v9 = [*(id *)(a1 + 32) audiobookDurations];
  double v10 = [v9 objectAtIndexedSubscript:a3];
  [v10 doubleValue];
  double v12 = v8 + v11;

  double v13 = *(double *)(a1 + 48);
  if (v13 >= v8 && v13 < v12)
  {
    uint64_t v15 = +[NSNumber numberWithDouble:v12 - v13];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    __int16 v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *a4 = 1;
  }
}

void sub_24CF0(id a1)
{
  id v1 = +[BKAudiobookNowPlayingAdaptor sharedInstance];
  id v2 = +[BKAudiobookMediaRemoteAdaptor startAdaptor];
  id v3 = +[BKAudiobookPlayer sharedInstance];
  [v3 setSupportsAlternateArtwork:1];
  [v3 setSecondsToRewindAfterInterruption:3];
}

void sub_24D70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_C540(&dword_0, a2, a3, "Setting asset that reports .isPlayable = NO %@", a5, a6, a7, a8, 2u);
}

void sub_24DE0()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "unable to reset player, no last position to restore", v2, v3, v4, v5, v6);
}

void sub_24E14(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = [a2 currentItem];
  uint8_t v6 = [v5 errorLog];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  double v10 = v6;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "AVPlayerItemStatusFailed: %@. \n%@", (uint8_t *)&v7, 0x16u);
}

void sub_24EDC()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "playerItemDidStallPlayback", v2, v3, v4, v5, v6);
}

void sub_24F10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24F80()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "player current time NAN, using 0", v2, v3, v4, v5, v6);
}

void sub_24FB4()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "setCurrentTime: time < 0", v2, v3, v4, v5, v6);
}

double sub_24FE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_C540(&dword_0, a2, a3, "_playWithSeekTime: self.playbackRate = %f, resetting to 1.0", a5, a6, a7, a8, 0);
  return result;
}

void sub_2505C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_250CC(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 errorDomain];
  int v5 = 138543618;
  uint8_t v6 = v4;
  __int16 v7 = 2048;
  id v8 = [a1 errorStatusCode];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "assetNetworkError: domain=%{public}@ code=%ld", (uint8_t *)&v5, 0x16u);
}

void sub_25184()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "invalid current time encountered while updating time ovservers", v2, v3, v4, v5, v6);
}

void sub_251B8(NSObject *a1)
{
  uint64_t v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a1, OS_LOG_TYPE_ERROR, "invalid time to observer: %@", (uint8_t *)&v3, 0xCu);
}

void sub_25258(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = [*(id *)(a1 + 40) assetID];
  uint64_t v5 = *(void *)(a1 + 48);
  int v6 = 138478083;
  __int16 v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Timed out waiting for bookmark times on assetID %{private}@ bookmarkTimesAvailable=%@", (uint8_t *)&v6, 0x16u);
}

void sub_25310(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error retrieving bookmark from local store to populate cloud: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_25388(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "exception in loadingRequest finishLoading: %@", buf, 0xCu);
}

void sub_253E0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Audiobook player is not the active output. Providing no image.", v1, 2u);
}

void sub_25424(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Can't generate ML artwork, no representative item", v1, 2u);
}

void sub_25468()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "Skip or seek are already occurring, can't start skip.", v2, v3, v4, v5, v6);
}

void sub_2549C()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "Skip is not occurring.", v2, v3, v4, v5, v6);
}

void sub_254D0()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "Skip or seek are already occurring.", v2, v3, v4, v5, v6);
}

void sub_25504()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "Skip or seek are already occurring, can't start seek.", v2, v3, v4, v5, v6);
}

void sub_25538()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "Seek is not occurring, can't endSeek.", v2, v3, v4, v5, v6);
}

void sub_2556C(id *a1, NSObject *a2)
{
  id v3 = [*a1 persistentID];
  int v4 = 134217984;
  id v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No chapters in %llu.", (uint8_t *)&v4, 0xCu);
}

void sub_255FC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v6 = [*(id *)(a1 + 32) mediaItem];
  __int16 v7 = [v6 bk_storeID];
  __int16 v8 = [*(id *)(a1 + 32) mediaItem];
  uint64_t v9 = [v8 bk_storePlaylistID];
  int v10 = 141559042;
  uint64_t v11 = 1752392040;
  __int16 v12 = 2112;
  double v13 = v7;
  __int16 v14 = 2160;
  uint64_t v15 = 1752392040;
  __int16 v16 = 2112;
  __int16 v17 = v9;
  __int16 v18 = 2112;
  uint64_t v19 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Error fetching racGUID for storeID %{mask.hash}@ storePlaylistID %{mask.hash}@: %@", (uint8_t *)&v10, 0x34u);
}

void sub_25714(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error getting racGUID from HLS playlist: %@", (uint8_t *)&v2, 0xCu);
}

void sub_2578C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Attempting to construct a media query using an identifier that is invalid.", v1, 2u);
}

void sub_257D0(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 count];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "bk_cloudItems has %lu items and should only have one", (uint8_t *)&v3, 0xCu);
}

void sub_2585C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "requested playback of chapter for empty contentItemID", v1, 2u);
}

void sub_258A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "failed to resolve chapter from contentItemID %@", (uint8_t *)&v2, 0xCu);
}

void sub_25918(void *a1)
{
  [a1 type];
  sub_1D6B4(&dword_0, v1, v2, "Received unhandled event type: %lu", v3, v4, v5, v6, 0);
}

void sub_25994()
{
  sub_22EC0();
  [v1 currentTrackIndex];
  uint64_t v2 = [v0 currentAudiobook];
  uint64_t v3 = [v2 tracks];
  [v3 count];
  sub_22EB4();
  sub_22E38(&dword_0, v4, v5, "track index %lu out of range [0,%lu]", v6, v7, v8, v9, 0);
}

void sub_25A4C()
{
  sub_22EC0();
  [v1 currentChapterIndex];
  uint64_t v2 = [v0 currentAudiobook];
  uint64_t v3 = [v2 chapters];
  [v3 count];
  sub_22EB4();
  sub_22E38(&dword_0, v4, v5, "chapter index %lu out of range [0,%lu]", v6, v7, v8, v9, 0);
}

void sub_25B04()
{
  sub_22EA8();
  sub_C540(&dword_0, v0, v1, "setCurrentTrackIndex: track offset %f out of range", v2, v3, v4, v5, v6);
}

void sub_25B70()
{
  sub_22E9C();
  sub_C540(&dword_0, v0, v1, "setCurrentTrackIndex: track index %lu out of range", v2, v3, v4, v5, v6);
}

void sub_25BD8()
{
  sub_22EA8();
  sub_C540(&dword_0, v0, v1, "setCurrentChapterIndex: chapter offset %f out of range", v2, v3, v4, v5, v6);
}

void sub_25C44()
{
  sub_22E9C();
  sub_C540(&dword_0, v0, v1, "setCurrentChapterIndex: chapter index %lu out of range", v2, v3, v4, v5, v6);
}

void sub_25CAC(void *a1)
{
  uint64_t v1 = [a1 currentAudiobook];
  sub_22EB4();
  sub_22E38(&dword_0, v2, v3, "Unable to find time %.1lf in audiobook %@", v4, v5, v6, v7, 2u);
}

void sub_25D48()
{
  sub_22EA8();
  sub_22EB4();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Unable to find time %.1lf in chapter %@", v1, 0x16u);
}

void sub_25DC4(void *a1)
{
  uint64_t v1 = [a1 currentAudiobook];
  uint64_t v2 = [v1 chapters];
  [v2 count];
  sub_22EB4();
  sub_22E38(&dword_0, v3, v4, "requested playing chapter %lu out of range [0,%lu]", v5, v6, v7, v8, 0);
}

void sub_25E74()
{
  sub_22EA8();
  sub_C540(&dword_0, v0, v1, "Failed to increment precision rate from $+%g!", v2, v3, v4, v5, v6);
}

void sub_25EE4()
{
  sub_22EA8();
  sub_C540(&dword_0, v0, v1, "Failed to decrement precision rate from %g!", v2, v3, v4, v5, v6);
}

void sub_25F54()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "Requesting playback rate from an invalid speed enum. Defaulting to 1.0.", v2, v3, v4, v5, v6);
}

void sub_25F88()
{
  sub_22EA8();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "_chapterAtOffset: %f", v1, 0xCu);
}

void sub_26000(void *a1)
{
  [a1 positionInCurrentChapter];
  sub_22EA8();
  sub_22E7C(&dword_0, v1, v2, "observer: position = %f", v3, v4, v5, v6, v7);
}

void sub_26078()
{
  sub_22E9C();
  sub_C540(&dword_0, v0, v1, "observer: player error = %@", v2, v3, v4, v5, v6);
}

void sub_260E0()
{
  sub_22E9C();
  sub_C540(&dword_0, v0, v1, "observer: playback stalled error = %@", v2, v3, v4, v5, v6);
}

void sub_26148(void *a1)
{
  uint64_t v1 = [a1 currentAudiobook];
  sub_22E9C();
  sub_22E7C(&dword_0, v2, v3, "observer: audiobook = %@", v4, v5, v6, v7, v8);
}

void sub_261CC()
{
  sub_22EC0();
  uint64_t v2 = [v1 domain];
  [v0 code];
  sub_22E58();
  sub_22ECC(&dword_0, v3, v4, "_playerErrorWithPlayer:error: unknown error: {d=%{public}@ c=%ld, (%@)}", v5, v6, v7, v8, v9);
}

void sub_26260()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "_playerErrorWithPlayer:error: content not authorized", v2, v3, v4, v5, v6);
}

void sub_26294()
{
  sub_C55C();
  sub_C524(&dword_0, v0, v1, "_playerErrorWithPlayer:error: media services reset", v2, v3, v4, v5, v6);
}

void sub_262C8()
{
  sub_22EC0();
  uint64_t v2 = [v1 domain];
  [v0 code];
  sub_22E58();
  sub_22ECC(&dword_0, v3, v4, "_playerErrorWithPlayer:error: current item has network error: {d=%{public}@ c=%ld, (%@)}", v5, v6, v7, v8, v9);
}

void sub_2635C()
{
  sub_C55C();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "chapter unchanged", v1, 2u);
}

void sub_2639C()
{
  sub_22E9C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "player:loadedTimeRangesDidChange:durations: - start times and durations counts must be the same: %@, %@", v2, 0x16u);
}

void sub_26420(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Nil assetDetailManager - cannot fetch assetID %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_26498(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138478083;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  sub_23980(&dword_0, a2, a3, "Error retrieving bookmark time on assetID %{private}@ from CloudKit/BookDataStore: %{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_26514(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Cannot save bookmark time because assetID is nil", v1, 2u);
}

void sub_26558(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Nil assetDetailManager", v1, 2u);
}

void sub_2659C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error retrieving asset detail for saving bookmark time from CloudKit/BookDataStore: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_26614(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_23980(&dword_0, a2, a3, "Error saving asset details for audiobook %@ time update:%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_26690(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to generate assetID for media item %@.", (uint8_t *)&v2, 0xCu);
}

void sub_26708(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Artwork was nil. No cover image available.", v1, 2u);
}

void sub_2674C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Artwork catalog catalog was nil. Falling back to artwork property.", v1, 2u);
}

uint64_t BUClamp()
{
  return _BUClamp();
}

uint64_t BUDynamicCast()
{
  return _BUDynamicCast();
}

uint64_t BUStoreIdFromObject()
{
  return _BUStoreIdFromObject();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeAdd(retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
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

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return _CMTimeRangeContainsTime(range, time);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return _CMTimeRangeMake(retstr, start, duration);
}

uint64_t ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest()
{
  return _ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest();
}

uint64_t MPShouldIncrementPlayCountForElapsedTime()
{
  return _MPShouldIncrementPlayCountForElapsedTime();
}

uint64_t MRMediaRemoteSetCanBeNowPlayingApplication()
{
  return _MRMediaRemoteSetCanBeNowPlayingApplication();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_CMTimeRangeValue(void *a1, const char *a2, ...)
{
  return [a1 CMTimeRangeValue];
}

id objc_msgSend_CMTimeValue(void *a1, const char *a2, ...)
{
  return [a1 CMTimeValue];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__actualRate(void *a1, const char *a2, ...)
{
  return [a1 _actualRate];
}

id objc_msgSend__addPeriodicTimeObserver(void *a1, const char *a2, ...)
{
  return [a1 _addPeriodicTimeObserver];
}

id objc_msgSend__canEndSeek(void *a1, const char *a2, ...)
{
  return [a1 _canEndSeek];
}

id objc_msgSend__canEndSkip(void *a1, const char *a2, ...)
{
  return [a1 _canEndSkip];
}

id objc_msgSend__canStartSeek(void *a1, const char *a2, ...)
{
  return [a1 _canStartSeek];
}

id objc_msgSend__canStartSkip(void *a1, const char *a2, ...)
{
  return [a1 _canStartSkip];
}

id objc_msgSend__cancelSeek(void *a1, const char *a2, ...)
{
  return [a1 _cancelSeek];
}

id objc_msgSend__cancelSkip(void *a1, const char *a2, ...)
{
  return [a1 _cancelSkip];
}

id objc_msgSend__configureAudioSession(void *a1, const char *a2, ...)
{
  return [a1 _configureAudioSession];
}

id objc_msgSend__expired(void *a1, const char *a2, ...)
{
  return [a1 _expired];
}

id objc_msgSend__expiresAtChapterEnd(void *a1, const char *a2, ...)
{
  return [a1 _expiresAtChapterEnd];
}

id objc_msgSend__initialVolume(void *a1, const char *a2, ...)
{
  return [a1 _initialVolume];
}

id objc_msgSend__isStreamingAssetURL(void *a1, const char *a2, ...)
{
  return [a1 _isStreamingAssetURL];
}

id objc_msgSend__pause(void *a1, const char *a2, ...)
{
  return [a1 _pause];
}

id objc_msgSend__processSkipEvent(void *a1, const char *a2, ...)
{
  return [a1 _processSkipEvent];
}

id objc_msgSend__reevaluateVolumeFromPlayer(void *a1, const char *a2, ...)
{
  return [a1 _reevaluateVolumeFromPlayer];
}

id objc_msgSend__removePeriodicTimeObserver(void *a1, const char *a2, ...)
{
  return [a1 _removePeriodicTimeObserver];
}

id objc_msgSend__revalidatePlayerItem(void *a1, const char *a2, ...)
{
  return [a1 _revalidatePlayerItem];
}

id objc_msgSend__seekTimerFired(void *a1, const char *a2, ...)
{
  return [a1 _seekTimerFired];
}

id objc_msgSend__sendAudiobookDidChange(void *a1, const char *a2, ...)
{
  return [a1 _sendAudiobookDidChange];
}

id objc_msgSend__sendAudiobookWillChange(void *a1, const char *a2, ...)
{
  return [a1 _sendAudiobookWillChange];
}

id objc_msgSend__sendBufferedTimeRangesDidChange(void *a1, const char *a2, ...)
{
  return [a1 _sendBufferedTimeRangesDidChange];
}

id objc_msgSend__sendChapterDidChange(void *a1, const char *a2, ...)
{
  return [a1 _sendChapterDidChange];
}

id objc_msgSend__sendCurrentPositionDidChange(void *a1, const char *a2, ...)
{
  return [a1 _sendCurrentPositionDidChange];
}

id objc_msgSend__sendDidEndSeekingObserverCallbacks(void *a1, const char *a2, ...)
{
  return [a1 _sendDidEndSeekingObserverCallbacks];
}

id objc_msgSend__sendDidEndSkippingObserverCallbacks(void *a1, const char *a2, ...)
{
  return [a1 _sendDidEndSkippingObserverCallbacks];
}

id objc_msgSend__sendIsScrubbing(void *a1, const char *a2, ...)
{
  return [a1 _sendIsScrubbing];
}

id objc_msgSend__sendPlaybackRateDidChange(void *a1, const char *a2, ...)
{
  return [a1 _sendPlaybackRateDidChange];
}

id objc_msgSend__sendReachedEndOfAudiobook(void *a1, const char *a2, ...)
{
  return [a1 _sendReachedEndOfAudiobook];
}

id objc_msgSend__sendWillPauseObserverCallbacks(void *a1, const char *a2, ...)
{
  return [a1 _sendWillPauseObserverCallbacks];
}

id objc_msgSend__setSkipBackwardCommand(void *a1, const char *a2, ...)
{
  return [a1 _setSkipBackwardCommand];
}

id objc_msgSend__setSkipForwardCommand(void *a1, const char *a2, ...)
{
  return [a1 _setSkipForwardCommand];
}

id objc_msgSend__setTimer(void *a1, const char *a2, ...)
{
  return [a1 _setTimer];
}

id objc_msgSend__skipBackwardCommandEvent(void *a1, const char *a2, ...)
{
  return [a1 _skipBackwardCommandEvent];
}

id objc_msgSend__skipForwardCommandEvent(void *a1, const char *a2, ...)
{
  return [a1 _skipForwardCommandEvent];
}

id objc_msgSend__skipTimerFired(void *a1, const char *a2, ...)
{
  return [a1 _skipTimerFired];
}

id objc_msgSend__stateString(void *a1, const char *a2, ...)
{
  return [a1 _stateString];
}

id objc_msgSend__updatePlayer(void *a1, const char *a2, ...)
{
  return [a1 _updatePlayer];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accelerationMap(void *a1, const char *a2, ...)
{
  return [a1 accelerationMap];
}

id objc_msgSend_accessLog(void *a1, const char *a2, ...)
{
  return [a1 accessLog];
}

id objc_msgSend_actionSource(void *a1, const char *a2, ...)
{
  return [a1 actionSource];
}

id objc_msgSend_albumArtist(void *a1, const char *a2, ...)
{
  return [a1 albumArtist];
}

id objc_msgSend_albumPersistentID(void *a1, const char *a2, ...)
{
  return [a1 albumPersistentID];
}

id objc_msgSend_albumTitle(void *a1, const char *a2, ...)
{
  return [a1 albumTitle];
}

id objc_msgSend_albumTrackNumber(void *a1, const char *a2, ...)
{
  return [a1 albumTrackNumber];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allObservers(void *a1, const char *a2, ...)
{
  return [a1 allObservers];
}

id objc_msgSend_alternateArtworkTimes(void *a1, const char *a2, ...)
{
  return [a1 alternateArtworkTimes];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artist(void *a1, const char *a2, ...)
{
  return [a1 artist];
}

id objc_msgSend_artwork(void *a1, const char *a2, ...)
{
  return [a1 artwork];
}

id objc_msgSend_artworkCatalog(void *a1, const char *a2, ...)
{
  return [a1 artworkCatalog];
}

id objc_msgSend_artworkCompletionBlocks(void *a1, const char *a2, ...)
{
  return [a1 artworkCompletionBlocks];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetDetailManager(void *a1, const char *a2, ...)
{
  return [a1 assetDetailManager];
}

id objc_msgSend_assetID(void *a1, const char *a2, ...)
{
  return [a1 assetID];
}

id objc_msgSend_assetNetworkError(void *a1, const char *a2, ...)
{
  return [a1 assetNetworkError];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return [a1 assetURL];
}

id objc_msgSend_audibleDRMGroupID(void *a1, const char *a2, ...)
{
  return [a1 audibleDRMGroupID];
}

id objc_msgSend_audiobook(void *a1, const char *a2, ...)
{
  return [a1 audiobook];
}

id objc_msgSend_audiobookControls(void *a1, const char *a2, ...)
{
  return [a1 audiobookControls];
}

id objc_msgSend_audiobookDurations(void *a1, const char *a2, ...)
{
  return [a1 audiobookDurations];
}

id objc_msgSend_audiobookPlayerActiveOutput(void *a1, const char *a2, ...)
{
  return [a1 audiobookPlayerActiveOutput];
}

id objc_msgSend_audiobookQuery(void *a1, const char *a2, ...)
{
  return [a1 audiobookQuery];
}

id objc_msgSend_audiobooksQuery(void *a1, const char *a2, ...)
{
  return [a1 audiobooksQuery];
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return [a1 author];
}

id objc_msgSend_backwardSeekSpeedMultiplier(void *a1, const char *a2, ...)
{
  return [a1 backwardSeekSpeedMultiplier];
}

id objc_msgSend_backwardSkipTime(void *a1, const char *a2, ...)
{
  return [a1 backwardSkipTime];
}

id objc_msgSend_baseEventInterval(void *a1, const char *a2, ...)
{
  return [a1 baseEventInterval];
}

id objc_msgSend_bestImageFromDisk(void *a1, const char *a2, ...)
{
  return [a1 bestImageFromDisk];
}

id objc_msgSend_bookmarkTime(void *a1, const char *a2, ...)
{
  return [a1 bookmarkTime];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bufferInfo(void *a1, const char *a2, ...)
{
  return [a1 bufferInfo];
}

id objc_msgSend_bufferProducer(void *a1, const char *a2, ...)
{
  return [a1 bufferProducer];
}

id objc_msgSend_bufferedDurations(void *a1, const char *a2, ...)
{
  return [a1 bufferedDurations];
}

id objc_msgSend_bufferedStartTimes(void *a1, const char *a2, ...)
{
  return [a1 bufferedStartTimes];
}

id objc_msgSend_cachedAssetID(void *a1, const char *a2, ...)
{
  return [a1 cachedAssetID];
}

id objc_msgSend_canSetVolume(void *a1, const char *a2, ...)
{
  return [a1 canSetVolume];
}

id objc_msgSend_cancelPendingSeeks(void *a1, const char *a2, ...)
{
  return [a1 cancelPendingSeeks];
}

id objc_msgSend_changePlaybackPositionCommand(void *a1, const char *a2, ...)
{
  return [a1 changePlaybackPositionCommand];
}

id objc_msgSend_changePlaybackRateCommand(void *a1, const char *a2, ...)
{
  return [a1 changePlaybackRateCommand];
}

id objc_msgSend_chapterIndexInAudiobook(void *a1, const char *a2, ...)
{
  return [a1 chapterIndexInAudiobook];
}

id objc_msgSend_chapters(void *a1, const char *a2, ...)
{
  return [a1 chapters];
}

id objc_msgSend_coalescedLoadedTimeRanges(void *a1, const char *a2, ...)
{
  return [a1 coalescedLoadedTimeRanges];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collections(void *a1, const char *a2, ...)
{
  return [a1 collections];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_containingTrack(void *a1, const char *a2, ...)
{
  return [a1 containingTrack];
}

id objc_msgSend_contentInformationRequest(void *a1, const char *a2, ...)
{
  return [a1 contentInformationRequest];
}

id objc_msgSend_contentItem(void *a1, const char *a2, ...)
{
  return [a1 contentItem];
}

id objc_msgSend_contentItemForPreviews(void *a1, const char *a2, ...)
{
  return [a1 contentItemForPreviews];
}

id objc_msgSend_contentItemID(void *a1, const char *a2, ...)
{
  return [a1 contentItemID];
}

id objc_msgSend_contentKeyRecipients(void *a1, const char *a2, ...)
{
  return [a1 contentKeyRecipients];
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

id objc_msgSend_coverArt(void *a1, const char *a2, ...)
{
  return [a1 coverArt];
}

id objc_msgSend_currentAudiobook(void *a1, const char *a2, ...)
{
  return [a1 currentAudiobook];
}

id objc_msgSend_currentChapter(void *a1, const char *a2, ...)
{
  return [a1 currentChapter];
}

id objc_msgSend_currentChapterIndex(void *a1, const char *a2, ...)
{
  return [a1 currentChapterIndex];
}

id objc_msgSend_currentDate(void *a1, const char *a2, ...)
{
  return [a1 currentDate];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_currentLoadedTimeRanges(void *a1, const char *a2, ...)
{
  return [a1 currentLoadedTimeRanges];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_currentTrack(void *a1, const char *a2, ...)
{
  return [a1 currentTrack];
}

id objc_msgSend_currentTrackIndex(void *a1, const char *a2, ...)
{
  return [a1 currentTrackIndex];
}

id objc_msgSend_customTitle(void *a1, const char *a2, ...)
{
  return [a1 customTitle];
}

id objc_msgSend_dataRequest(void *a1, const char *a2, ...)
{
  return [a1 dataRequest];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateAccessed(void *a1, const char *a2, ...)
{
  return [a1 dateAccessed];
}

id objc_msgSend_dateLastOpened(void *a1, const char *a2, ...)
{
  return [a1 dateLastOpened];
}

id objc_msgSend_datePlaybackTimeUpdated(void *a1, const char *a2, ...)
{
  return [a1 datePlaybackTimeUpdated];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
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

id objc_msgSend_durationOfCurrentAudiobook(void *a1, const char *a2, ...)
{
  return [a1 durationOfCurrentAudiobook];
}

id objc_msgSend_durationOfCurrentChapter(void *a1, const char *a2, ...)
{
  return [a1 durationOfCurrentChapter];
}

id objc_msgSend_durationOfCurrentTrack(void *a1, const char *a2, ...)
{
  return [a1 durationOfCurrentTrack];
}

id objc_msgSend_effectiveStopTime(void *a1, const char *a2, ...)
{
  return [a1 effectiveStopTime];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return [a1 elapsedTime];
}

id objc_msgSend_endSeek(void *a1, const char *a2, ...)
{
  return [a1 endSeek];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorComment(void *a1, const char *a2, ...)
{
  return [a1 errorComment];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return [a1 errorDomain];
}

id objc_msgSend_errorLog(void *a1, const char *a2, ...)
{
  return [a1 errorLog];
}

id objc_msgSend_errorStatusCode(void *a1, const char *a2, ...)
{
  return [a1 errorStatusCode];
}

id objc_msgSend_eventThreshold(void *a1, const char *a2, ...)
{
  return [a1 eventThreshold];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_expiresAtChapterEnd(void *a1, const char *a2, ...)
{
  return [a1 expiresAtChapterEnd];
}

id objc_msgSend_finishLoading(void *a1, const char *a2, ...)
{
  return [a1 finishLoading];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_forwardSeekSpeedMultiplier(void *a1, const char *a2, ...)
{
  return [a1 forwardSeekSpeedMultiplier];
}

id objc_msgSend_forwardSkipTime(void *a1, const char *a2, ...)
{
  return [a1 forwardSkipTime];
}

id objc_msgSend_genericCoverProvider(void *a1, const char *a2, ...)
{
  return [a1 genericCoverProvider];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return [a1 genre];
}

id objc_msgSend_hasAlternateArtwork(void *a1, const char *a2, ...)
{
  return [a1 hasAlternateArtwork];
}

id objc_msgSend_hasAudibleBooksContent(void *a1, const char *a2, ...)
{
  return [a1 hasAudibleBooksContent];
}

id objc_msgSend_hasBeenPlayed(void *a1, const char *a2, ...)
{
  return [a1 hasBeenPlayed];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_indicatedBitrate(void *a1, const char *a2, ...)
{
  return [a1 indicatedBitrate];
}

id objc_msgSend_initialDuration(void *a1, const char *a2, ...)
{
  return [a1 initialDuration];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidatePlaybackQueue(void *a1, const char *a2, ...)
{
  return [a1 invalidatePlaybackQueue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAudibleBooksContentAuthorized(void *a1, const char *a2, ...)
{
  return [a1 isAudibleBooksContentAuthorized];
}

id objc_msgSend_isAudiobookPreview(void *a1, const char *a2, ...)
{
  return [a1 isAudiobookPreview];
}

id objc_msgSend_isCloudItem(void *a1, const char *a2, ...)
{
  return [a1 isCloudItem];
}

id objc_msgSend_isCurrentTimeValid(void *a1, const char *a2, ...)
{
  return [a1 isCurrentTimeValid];
}

id objc_msgSend_isExplicitItem(void *a1, const char *a2, ...)
{
  return [a1 isExplicitItem];
}

id objc_msgSend_isLoadingResources(void *a1, const char *a2, ...)
{
  return [a1 isLoadingResources];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isPlayable(void *a1, const char *a2, ...)
{
  return [a1 isPlayable];
}

id objc_msgSend_isPlaybackLikelyToKeepUp(void *a1, const char *a2, ...)
{
  return [a1 isPlaybackLikelyToKeepUp];
}

id objc_msgSend_isPlaybackPending(void *a1, const char *a2, ...)
{
  return [a1 isPlaybackPending];
}

id objc_msgSend_isPlaying(void *a1, const char *a2, ...)
{
  return [a1 isPlaying];
}

id objc_msgSend_isPositionValid(void *a1, const char *a2, ...)
{
  return [a1 isPositionValid];
}

id objc_msgSend_isScrubbing(void *a1, const char *a2, ...)
{
  return [a1 isScrubbing];
}

id objc_msgSend_isSeeking(void *a1, const char *a2, ...)
{
  return [a1 isSeeking];
}

id objc_msgSend_isSkipping(void *a1, const char *a2, ...)
{
  return [a1 isSkipping];
}

id objc_msgSend_isStalling(void *a1, const char *a2, ...)
{
  return [a1 isStalling];
}

id objc_msgSend_isStopping(void *a1, const char *a2, ...)
{
  return [a1 isStopping];
}

id objc_msgSend_isStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isStoreDemoMode];
}

id objc_msgSend_isStreaming(void *a1, const char *a2, ...)
{
  return [a1 isStreaming];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_lastBitrate(void *a1, const char *a2, ...)
{
  return [a1 lastBitrate];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastPosition(void *a1, const char *a2, ...)
{
  return [a1 lastPosition];
}

id objc_msgSend_lastSeekPosition(void *a1, const char *a2, ...)
{
  return [a1 lastSeekPosition];
}

id objc_msgSend_lastSentRemainingTime(void *a1, const char *a2, ...)
{
  return [a1 lastSentRemainingTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadedTimeRanges(void *a1, const char *a2, ...)
{
  return [a1 loadedTimeRanges];
}

id objc_msgSend_logInstance(void *a1, const char *a2, ...)
{
  return [a1 logInstance];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mediaItem(void *a1, const char *a2, ...)
{
  return [a1 mediaItem];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsToUpdateTimeObservers(void *a1, const char *a2, ...)
{
  return [a1 needsToUpdateTimeObservers];
}

id objc_msgSend_nextChapterOrRestartAudiobook(void *a1, const char *a2, ...)
{
  return [a1 nextChapterOrRestartAudiobook];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextTrackCommand(void *a1, const char *a2, ...)
{
  return [a1 nextTrackCommand];
}

id objc_msgSend_nowPlayingAudiobookArtworkForPreviews(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingAudiobookArtworkForPreviews];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_observedTimes(void *a1, const char *a2, ...)
{
  return [a1 observedTimes];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_outputContext(void *a1, const char *a2, ...)
{
  return [a1 outputContext];
}

id objc_msgSend_outputContextID(void *a1, const char *a2, ...)
{
  return [a1 outputContextID];
}

id objc_msgSend_outputContextQueue(void *a1, const char *a2, ...)
{
  return [a1 outputContextQueue];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pauseCommand(void *a1, const char *a2, ...)
{
  return [a1 pauseCommand];
}

id objc_msgSend_pausedTime(void *a1, const char *a2, ...)
{
  return [a1 pausedTime];
}

id objc_msgSend_pendingAssetAuth(void *a1, const char *a2, ...)
{
  return [a1 pendingAssetAuth];
}

id objc_msgSend_pendingCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 pendingCurrentTime];
}

id objc_msgSend_periodicTimeObserver(void *a1, const char *a2, ...)
{
  return [a1 periodicTimeObserver];
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return [a1 persistentID];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_playCommand(void *a1, const char *a2, ...)
{
  return [a1 playCommand];
}

id objc_msgSend_playCount(void *a1, const char *a2, ...)
{
  return [a1 playCount];
}

id objc_msgSend_playCountSinceSync(void *a1, const char *a2, ...)
{
  return [a1 playCountSinceSync];
}

id objc_msgSend_playFadeInTime(void *a1, const char *a2, ...)
{
  return [a1 playFadeInTime];
}

id objc_msgSend_playItemInQueueCommand(void *a1, const char *a2, ...)
{
  return [a1 playItemInQueueCommand];
}

id objc_msgSend_playSkipSoundEffect(void *a1, const char *a2, ...)
{
  return [a1 playSkipSoundEffect];
}

id objc_msgSend_playbackDuration(void *a1, const char *a2, ...)
{
  return [a1 playbackDuration];
}

id objc_msgSend_playbackRate(void *a1, const char *a2, ...)
{
  return [a1 playbackRate];
}

id objc_msgSend_playbackTime(void *a1, const char *a2, ...)
{
  return [a1 playbackTime];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_positionInCurrentAudiobook(void *a1, const char *a2, ...)
{
  return [a1 positionInCurrentAudiobook];
}

id objc_msgSend_positionInCurrentChapter(void *a1, const char *a2, ...)
{
  return [a1 positionInCurrentChapter];
}

id objc_msgSend_positionInCurrentTrack(void *a1, const char *a2, ...)
{
  return [a1 positionInCurrentTrack];
}

id objc_msgSend_positionTime(void *a1, const char *a2, ...)
{
  return [a1 positionTime];
}

id objc_msgSend_precisionRates(void *a1, const char *a2, ...)
{
  return [a1 precisionRates];
}

id objc_msgSend_preferredIntervals(void *a1, const char *a2, ...)
{
  return [a1 preferredIntervals];
}

id objc_msgSend_previousChapterOrRestartChapter(void *a1, const char *a2, ...)
{
  return [a1 previousChapterOrRestartChapter];
}

id objc_msgSend_previousTrackCommand(void *a1, const char *a2, ...)
{
  return [a1 previousTrackCommand];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return [a1 rate];
}

id objc_msgSend_readingProgressHighWaterMark(void *a1, const char *a2, ...)
{
  return [a1 readingProgressHighWaterMark];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllTimeObservers(void *a1, const char *a2, ...)
{
  return [a1 removeAllTimeObservers];
}

id objc_msgSend_representativeItem(void *a1, const char *a2, ...)
{
  return [a1 representativeItem];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resourceLoader(void *a1, const char *a2, ...)
{
  return [a1 resourceLoader];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_scrubPausableDispatchAfterGeneration(void *a1, const char *a2, ...)
{
  return [a1 scrubPausableDispatchAfterGeneration];
}

id objc_msgSend_seekBackwardCommand(void *a1, const char *a2, ...)
{
  return [a1 seekBackwardCommand];
}

id objc_msgSend_seekDispatchSource(void *a1, const char *a2, ...)
{
  return [a1 seekDispatchSource];
}

id objc_msgSend_seekForwardCommand(void *a1, const char *a2, ...)
{
  return [a1 seekForwardCommand];
}

id objc_msgSend_seekSampleTime(void *a1, const char *a2, ...)
{
  return [a1 seekSampleTime];
}

id objc_msgSend_sharedCommandCenter(void *a1, const char *a2, ...)
{
  return [a1 sharedCommandCenter];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortName(void *a1, const char *a2, ...)
{
  return [a1 shortName];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_skipBackwardCommand(void *a1, const char *a2, ...)
{
  return [a1 skipBackwardCommand];
}

id objc_msgSend_skipBehavior(void *a1, const char *a2, ...)
{
  return [a1 skipBehavior];
}

id objc_msgSend_skipController(void *a1, const char *a2, ...)
{
  return [a1 skipController];
}

id objc_msgSend_skipDispatchSource(void *a1, const char *a2, ...)
{
  return [a1 skipDispatchSource];
}

id objc_msgSend_skipForwardCommand(void *a1, const char *a2, ...)
{
  return [a1 skipForwardCommand];
}

id objc_msgSend_skipStartAudiobookTime(void *a1, const char *a2, ...)
{
  return [a1 skipStartAudiobookTime];
}

id objc_msgSend_sleepTimer(void *a1, const char *a2, ...)
{
  return [a1 sleepTimer];
}

id objc_msgSend_specialSeekBackwardCommand(void *a1, const char *a2, ...)
{
  return [a1 specialSeekBackwardCommand];
}

id objc_msgSend_specialSeekForwardCommand(void *a1, const char *a2, ...)
{
  return [a1 specialSeekForwardCommand];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startAdaptor(void *a1, const char *a2, ...)
{
  return [a1 startAdaptor];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopCommand(void *a1, const char *a2, ...)
{
  return [a1 stopCommand];
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return [a1 storeID];
}

id objc_msgSend_stores(void *a1, const char *a2, ...)
{
  return [a1 stores];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supplementalAssetIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 supplementalAssetIdentifiers];
}

id objc_msgSend_timeBeforeCurrentTrack(void *a1, const char *a2, ...)
{
  return [a1 timeBeforeCurrentTrack];
}

id objc_msgSend_timeControlStatus(void *a1, const char *a2, ...)
{
  return [a1 timeControlStatus];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeObservers(void *a1, const char *a2, ...)
{
  return [a1 timeObservers];
}

id objc_msgSend_timeRangeInAudiobook(void *a1, const char *a2, ...)
{
  return [a1 timeRangeInAudiobook];
}

id objc_msgSend_timeRangeInTrack(void *a1, const char *a2, ...)
{
  return [a1 timeRangeInTrack];
}

id objc_msgSend_timeRemainingInCurrentAudiobook(void *a1, const char *a2, ...)
{
  return [a1 timeRemainingInCurrentAudiobook];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_togglePlayPause(void *a1, const char *a2, ...)
{
  return [a1 togglePlayPause];
}

id objc_msgSend_togglePlayPauseCommand(void *a1, const char *a2, ...)
{
  return [a1 togglePlayPauseCommand];
}

id objc_msgSend_trackPositions(void *a1, const char *a2, ...)
{
  return [a1 trackPositions];
}

id objc_msgSend_tracks(void *a1, const char *a2, ...)
{
  return [a1 tracks];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateTimeObservers(void *a1, const char *a2, ...)
{
  return [a1 updateTimeObservers];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_waitingForPlayerStatePlaying(void *a1, const char *a2, ...)
{
  return [a1 waitingForPlayerStatePlaying];
}

id objc_msgSend_waitingForPlayerStatePlayingThenPause(void *a1, const char *a2, ...)
{
  return [a1 waitingForPlayerStatePlayingThenPause];
}

id objc_msgSend_wasInterrupted(void *a1, const char *a2, ...)
{
  return [a1 wasInterrupted];
}

id objc_msgSend_wasInterruptedEarly(void *a1, const char *a2, ...)
{
  return [a1 wasInterruptedEarly];
}

id objc_msgSend_wasPlaying(void *a1, const char *a2, ...)
{
  return [a1 wasPlaying];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}