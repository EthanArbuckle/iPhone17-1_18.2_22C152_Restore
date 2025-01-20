@interface GTMTLCaptureService
- (BOOL)hasObservers;
- (GTMTLCaptureService)initWithGuestApp:(GTMTLGuestAppClient *)a3;
- (id)query:(id)a3;
- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4;
- (id)update:(id)a3;
- (unint64_t)nextRequestID;
- (unint64_t)registerObserver:(id)a3;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)notifyCaptureObjectsChanged:(id)a3;
- (void)notifyCaptureProgress:(id)a3;
- (void)notifyCaptureRequest:(id)a3;
- (void)notifyUnsupportedFenum:(id)a3;
- (void)signalInterposeSemaphore;
- (void)stop;
- (void)waitForInterposeSignal;
@end

@implementation GTMTLCaptureService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_captureRequest, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_interposeSemaphore, 0);
  objc_storeStrong((id *)&self->_activeCaptureDesc, 0);
  objc_storeStrong((id *)&self->_currentCaptureURL, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

- (void)notifyCaptureRequest:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke;
  v7[3] = &unk_222148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(a1 + 40));
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 40);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke_2;
    v3[3] = &unk_221AA0;
    id v4 = *(id *)(a1 + 40);
    [v2 notifyAll:v3];
  }
}

id __44__GTMTLCaptureService_notifyCaptureRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyCaptureRequest:*(void *)(a1 + 32)];
}

- (void)notifyUnsupportedFenum:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke;
  v7[3] = &unk_222148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke_2;
  v2[3] = &unk_221AA0;
  id v3 = *(id *)(a1 + 40);
  [v1 notifyAll:v2];
}

id __46__GTMTLCaptureService_notifyUnsupportedFenum___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyUnsupportedFenum:*(void *)(a1 + 32)];
}

- (void)notifyCaptureProgress:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke;
  v7[3] = &unk_222148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke_2;
  v2[3] = &unk_221AA0;
  id v3 = *(id *)(a1 + 40);
  [v1 notifyAll:v2];
}

id __45__GTMTLCaptureService_notifyCaptureProgress___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyCaptureProgress:*(void *)(a1 + 32)];
}

- (void)notifyCaptureObjectsChanged:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke;
  v7[3] = &unk_222148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

void __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke_2;
  v2[3] = &unk_221AA0;
  id v3 = *(id *)(a1 + 40);
  [v1 notifyAll:v2];
}

id __51__GTMTLCaptureService_notifyCaptureObjectsChanged___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 notifyCaptureObjectsChanged:*(void *)(a1 + 32)];
}

- (unint64_t)nextRequestID
{
  return atomic_fetch_add(g_requestID, 1u);
}

- (id)query:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSMutableArray);
  v5 = [v3 requests];
  id v6 = [v4 initWithCapacity:[v5 count]];

  id v35 = [v3 requestID];
  v7 = [v3 requests];
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    do
    {
      v10 = [v3 requests];
      v11 = [v10 objectAtIndexedSubscript:v9];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (os_unfair_lock_s *)g_guestAppClientMTL;
        id v13 = v11;
        v14 = GTMTLGuestAppClient_allCaptureObjects(v12);
        v15 = objc_opt_new();
        id v38 = 0;
        v16 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v38];
        id v17 = v38;
        [v15 setData:v16];

        [v15 setError:v17];
        id v18 = [v13 requestID];

        [v15 setRequestID:v18];
        [v6 setObject:v15 atIndexedSubscript:v9];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v11;
          v14 = objc_opt_new();
          [v14 setEnablePresentDownload:qword_2501C8 & 1];
          [v14 setEnableLogErrors:((unint64_t)qword_2501C8 >> 1) & 1];
          [v14 setDisableHashResources:(qword_2501C8 & 0x20) == 0];
          [v14 setWaitEventTimeout:GT_ENV];
          [v14 setMaxDownloadCommandBuffers:qword_2501B8];
          v20 = objc_opt_new();
          id v37 = 0;
          v21 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v37];
          id v22 = v37;
          [v20 setData:v21];

          [v20 setError:v22];
          id v23 = [v19 requestID];

          [v20 setRequestID:v23];
          [v6 setObject:v20 atIndexedSubscript:v9];
        }
        else
        {
          v14 = objc_opt_new();
          [v14 setRequestID:[v11 requestID]];
          id v24 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
          CFStringRef v40 = @"unknown request";
          v25 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          id v26 = [v24 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v25];
          [v14 setError:v26];

          [v6 setObject:v14 atIndexedSubscript:v9];
        }
      }

      ++v9;
      v27 = [v3 requests];
      id v28 = [v27 count];
    }
    while ((unint64_t)v28 > v9);
  }
  v29 = objc_opt_new();
  id v30 = [v6 copy];
  id v36 = 0;
  v31 = +[NSKeyedArchiver archivedDataWithRootObject:v30 requiringSecureCoding:1 error:&v36];
  id v32 = v36;
  [v29 setData:v31];

  [v29 setError:v32];
  [v29 setRequestID:v35];
  v33 = [v3 completionHandler];
  ((void (**)(void, void *))v33)[2](v33, v29);

  return 0;
}

- (id)update:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_group_create();
  id v5 = objc_alloc((Class)NSMutableArray);
  id v6 = [v3 requests];
  id v66 = [v5 initWithCapacity:[v6 count]];

  id v59 = [v3 requestID];
  v7 = [v3 requests];
  id v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    v60 = v4;
    id v61 = v3;
    do
    {
      dispatch_group_enter(v4);
      v10 = [v3 requests];
      v11 = [v10 objectAtIndexedSubscript:v9];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        id v13 = [v12 requestID];
        id v14 = [v12 streamRef];
        unsigned __int8 v15 = [v12 enable];
        uint64_t Stream = GTTraceContext_getStream(g_ctx, (uint64_t)v14);
        if (Stream)
        {
          id v65 = v13;
          id v17 = *(id *)(Stream + 16);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v62 = v15;
            id v63 = v17;
            id v18 = v17;
            long long v84 = 0u;
            long long v85 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v64 = v18;
            id v19 = [v18 superlayer];
            v20 = [v19 sublayers];

            id v21 = [v20 countByEnumeratingWithState:&v84 objects:v92 count:16];
            if (v21)
            {
              uint64_t v22 = *(void *)v85;
              while (2)
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v85 != v22) {
                    objc_enumerationMutation(v20);
                  }
                  id v24 = *(void **)(*((void *)&v84 + 1) + 8 * i);
                  v25 = [v24 name];
                  unsigned int v26 = [v25 isEqualToString:@"gputools.overlay"];

                  if (v26)
                  {
                    id v21 = v24;
                    goto LABEL_25;
                  }
                }
                id v21 = [v20 countByEnumeratingWithState:&v84 objects:v92 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
LABEL_25:
              id v4 = v60;
              id v3 = v61;
            }

            id v45 = v64;
            if (v21 || ((v62 ^ 1) & 1) != 0)
            {
              char v48 = v62;
              if (!v21) {
                char v48 = 1;
              }
              if (v48)
              {
                v47 = objc_opt_new();
                id v70 = 0;
                v49 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanFalse requiringSecureCoding:1 error:&v70];
                id v50 = v70;
                [v47 setData:v49];

                id v45 = v64;
                [v47 setError:v50];
                [v47 setRequestID:v65];
                [v66 setObject:v47 atIndexedSubscript:v9];
                dispatch_group_leave(v4);
              }
              else
              {
                v71[0] = _NSConcreteStackBlock;
                v71[1] = 3221225472;
                v71[2] = __30__GTMTLCaptureService_update___block_invoke_2;
                v71[3] = &unk_221A78;
                id v21 = v21;
                id v72 = v21;
                id v75 = v65;
                id v73 = v66;
                int v76 = v9;
                v74 = v4;
                dispatch_async((dispatch_queue_t)&_dispatch_main_q, v71);

                v47 = v72;
              }
            }
            else
            {
              v46 = +[CALayer layer];
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = __30__GTMTLCaptureService_update___block_invoke;
              block[3] = &unk_221A50;
              id v21 = v46;
              id v78 = v21;
              id v79 = v64;
              id v82 = v65;
              id v80 = v66;
              int v83 = v9;
              v81 = v4;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

              v47 = v78;
            }

            id v17 = v63;
          }
          else
          {
            id v21 = (id)objc_opt_new();
            id v69 = 0;
            v44 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanFalse requiringSecureCoding:1 error:&v69];
            id v45 = v69;
            [v21 setData:v44];

            [v21 setError:v45];
            [v21 setRequestID:v65];
            [v66 setObject:v21 atIndexedSubscript:v9];
            dispatch_group_leave(v4);
          }
        }
        else
        {
          CFStringRef v40 = objc_opt_new();
          [v40 setData:0];
          id v41 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v90 = NSLocalizedDescriptionKey;
          CFStringRef v91 = @"unknown streamRef";
          v42 = +[NSDictionary dictionaryWithObjects:&v91 forKeys:&v90 count:1];
          id v43 = [v41 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v42];
          [v40 setError:v43];

          id v17 = v40;
          [v40 setRequestID:v13];
          [v66 setObject:v40 atIndexedSubscript:v9];
          dispatch_group_leave(v4);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v11;
          id v12 = [v27 configuration];
          unsigned int v28 = [v12 enablePresentDownload];
          qword_2501C8 = qword_2501C8 & 0xFFFFFFFFFFFFFFFELL | v28;
          unsigned int v29 = [v12 enableLogErrors];
          uint64_t v30 = 2;
          if (!v29) {
            uint64_t v30 = 0;
          }
          qword_2501C8 = qword_2501C8 & 0xFFFFFFFFFFFFFFFDLL | v30;
          unsigned int v31 = [v12 disableHashResources];
          uint64_t v32 = 32;
          if (v31) {
            uint64_t v32 = 0;
          }
          qword_2501C8 = qword_2501C8 & 0xFFFFFFFFFFFFFFDFLL | v32;
          GT_ENV = [v12 waitEventTimeout];
          qword_2501B8 = [v12 maxDownloadCommandBuffers];
          v33 = objc_opt_new();
          id v68 = 0;
          v34 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v68];
          id v35 = v68;
          [v33 setData:v34];

          [v33 setError:v35];
          id v36 = [v27 requestID];

          [v33 setRequestID:v36];
          [v66 setObject:v33 atIndexedSubscript:v9];
          dispatch_group_leave(v4);
        }
        else
        {
          id v12 = (id)objc_opt_new();
          [v12 setRequestID:[v11 requestID]];
          id v37 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
          CFStringRef v89 = @"unknown request";
          id v38 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
          id v39 = [v37 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v38];
          [v12 setError:v39];

          [v66 setObject:v12 atIndexedSubscript:v9];
          dispatch_group_leave(v4);
        }
      }

      ++v9;
      v51 = [v3 requests];
      id v52 = [v51 count];
    }
    while ((unint64_t)v52 > v9);
  }
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v53 = objc_opt_new();
  id v54 = [v66 copy];
  id v67 = 0;
  v55 = +[NSKeyedArchiver archivedDataWithRootObject:v54 requiringSecureCoding:1 error:&v67];
  id v56 = v67;
  [v53 setData:v55];

  [v53 setError:v56];
  [v53 setRequestID:v59];
  v57 = [v3 completionHandler];
  ((void (**)(void, void *))v57)[2](v57, v53);

  return 0;
}

void __30__GTMTLCaptureService_update___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setName:@"gputools.overlay"];
  [*(id *)(a1 + 40) bounds];
  [*(id *)(a1 + 32) setBounds:];
  [*(id *)(a1 + 40) frame];
  [*(id *)(a1 + 32) setFrame:];
  *(_OWORD *)components = xmmword_1DA3E8;
  long long v17 = unk_1DA3F8;
  CFStringRef v2 = (const __CFString *)CFPreferencesCopyValue(@"AppleHighlightColor", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  if (v2)
  {
    CFStringRef v3 = v2;
    CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v2, @" ");
    if (ArrayBySeparatingStrings)
    {
      CFArrayRef v5 = ArrayBySeparatingStrings;
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
      components[0] = CFStringGetDoubleValue(ValueAtIndex);
      CFStringRef v7 = (const __CFString *)CFArrayGetValueAtIndex(v5, 1);
      components[1] = CFStringGetDoubleValue(v7);
      CFStringRef v8 = (const __CFString *)CFArrayGetValueAtIndex(v5, 2);
      *(void *)&long long v17 = CFStringGetDoubleValue(v8);
      CFRelease(v5);
    }
    CFRelease(v3);
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  [*(id *)(a1 + 32) setBackgroundColor:CGColorCreate(DeviceRGB, components)];
  LODWORD(v10) = 0.5;
  [*(id *)(a1 + 32) setOpacity:v10];
  v11 = [*(id *)(a1 + 40) superlayer];
  [v11 insertSublayer:*(void *)(a1 + 32) above:*(void *)(a1 + 40)];

  id v12 = objc_opt_new();
  id v15 = 0;
  id v13 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v15];
  id v14 = v15;
  [v12 setData:v13];

  [v12 setError:v14];
  [v12 setRequestID:*(void *)(a1 + 64)];
  [*(id *)(a1 + 48) setObject:v12 atIndexedSubscript:*(int *)(a1 + 72)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __30__GTMTLCaptureService_update___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperlayer];
  CFStringRef v2 = objc_opt_new();
  id v5 = 0;
  CFStringRef v3 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v5];
  id v4 = v5;
  [v2 setData:v3];

  [v2 setRequestID:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) setObject:v2 atIndexedSubscript:*(int *)(a1 + 64)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (id)startWithDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = objc_opt_new();
  id v9 = [v6 streamRef];
  uint64_t Stream = GTTraceContext_getStream(g_ctx, (uint64_t)v9);
  if (Stream) {
    id v11 = *(id *)(Stream + 16);
  }
  else {
    id v11 = 0;
  }
  [v8 setCaptureObject:v11];

  [v8 setDestination:2];
  [v8 setSessionID:[v6 sessionID]];
  id v12 = [v8 captureObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = 6;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = 4;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v13 = 3;
        }
        else {
          uint64_t v13 = 5;
        }
      }
    }
  }

  [v8 setCaptureMode:v13];
  if (self->_interposeSemaphore) {
    id v14 = 0;
  }
  else {
    id v14 = [v6 triggerHitsToStart];
  }
  [v8 setTriggerHitsToStart:v14];
  [v8 setTriggerHitsToEnd:[v6 triggerHitsToEnd]];
  [v8 setSuspendAfterCapture:[v6 suspendAfterCapture]];
  [v8 setIgnoreUnusedResources:[v6 ignoreUnusedResources]];
  [v8 setIncludeBacktrace:[v6 includeBacktrace]];
  [v8 setApiTriggeredCapture:1];
  [v8 setToolTriggeredCapture:1];
  uint64_t v15 = [v6 outputURL];
  if (v15)
  {
    id v16 = (id)v15;
    [v8 setOutputURL:v15];
  }
  else
  {
    long long v17 = +[NSFileManager defaultManager];
    id v18 = [v17 temporaryDirectory];

    id v19 = +[NSProcessInfo processInfo];
    v20 = [v19 globallyUniqueString];
    id v21 = [v20 stringByAppendingString:@".gputrace"];

    id v16 = [objc_alloc((Class)NSURL) initFileURLWithPath:v21 isDirectory:1 relativeToURL:v18];
    [v8 setOutputURL:v16];
  }
  uint64_t v22 = self->_timer;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __61__GTMTLCaptureService_startWithDescriptor_completionHandler___block_invoke;
  v34[3] = &unk_221A28;
  id v23 = v22;
  id v35 = v23;
  id v24 = v16;
  id v36 = v24;
  id v25 = v7;
  id v37 = v25;
  [v8 setCompletionHandler:v34];
  if (([v6 isToolsCapture] & 1) != 0 || !objc_msgSend(v6, "sessionID"))
  {
    uint64_t v26 = +[CaptureMTLCaptureManager toolsCaptureManager];
  }
  else
  {
    uint64_t v26 = +[CaptureMTLCaptureManager sharedCaptureManager];
  }
  id v27 = (void *)v26;
  captureRequest = self->_captureRequest;
  self->_captureRequest = 0;

  id v33 = 0;
  unsigned __int8 v29 = [v27 startCaptureWithDescriptor:v8 error:&v33];
  id v30 = v33;
  if (v29)
  {
    dispatch_resume((dispatch_object_t)self->_timer);
  }
  else
  {
    unsigned int v31 = objc_opt_new();
    [v31 setError:v30];
    (*((void (**)(id, void *))v25 + 2))(v25, v31);
  }
  return 0;
}

void __61__GTMTLCaptureService_startWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(a1 + 32));
  id v2 = (id)objc_opt_new();
  [v2 setArchiveURL:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)deregisterObserver:(unint64_t)a3
{
  serialQueue = self->_serialQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __42__GTMTLCaptureService_deregisterObserver___block_invoke;
  v4[3] = &unk_221A00;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(serialQueue, v4);
}

id __42__GTMTLCaptureService_deregisterObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) deregisterObserver:*(void *)(a1 + 40)];
}

- (BOOL)hasObservers
{
  return [(GTObservableService *)self->_observers count] != 0;
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __61__GTMTLCaptureService_deregisterObserversForConnection_path___block_invoke;
  block[3] = &unk_2219D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

id __61__GTMTLCaptureService_deregisterObserversForConnection_path___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 40) deregisterObserversForConnection:a1[5] path:a1[6]];
}

- (unint64_t)registerObserver:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__GTMTLCaptureService_registerObserver___block_invoke;
  block[3] = &unk_2219B0;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  unint64_t v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void *__40__GTMTLCaptureService_registerObserver___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 40) registerObserver:a1[5]];
  result = (void *)a1[4];
  if (result[8])
  {
    return [result notifyCaptureRequest:];
  }
  return result;
}

- (void)stop
{
  id v2 = +[CaptureMTLCaptureManager toolsCaptureManager];
  [v2 stopCapture];
}

- (void)waitForInterposeSignal
{
  interposeSemaphore = self->_interposeSemaphore;
  if (interposeSemaphore)
  {
    dispatch_semaphore_wait(interposeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    interposeSemaphore = self->_interposeSemaphore;
  }
  self->_interposeSemaphore = 0;
}

- (void)signalInterposeSemaphore
{
  interposeSemaphore = self->_interposeSemaphore;
  if (interposeSemaphore) {
    dispatch_semaphore_signal(interposeSemaphore);
  }
}

- (GTMTLCaptureService)initWithGuestApp:(GTMTLGuestAppClient *)a3
{
  v19.receiver = self;
  v19.super_class = (Class)GTMTLCaptureService;
  id v3 = [(GTMTLCaptureService *)&v19 init];
  if (v3)
  {
    os_log_t v4 = os_log_create("com.apple.gputools.transport", "CaptureService");
    id v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    id v6 = *((void *)v3 + 1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v18 = 0;
      _os_log_debug_impl(&def_CFBEC, v6, OS_LOG_TYPE_DEBUG, "Create Capture Service", v18, 2u);
    }
    if ((qword_2501C8 & 0x40) != 0)
    {
      dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
      CFStringRef v8 = (void *)*((void *)v3 + 4);
      *((void *)v3 + 4) = v7;
    }
    dispatch_queue_t v9 = dispatch_queue_create("com.app.gputools.capture", 0);
    id v10 = (void *)*((void *)v3 + 6);
    *((void *)v3 + 6) = v9;

    dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v3 + 6));
    uint64_t v12 = (void *)*((void *)v3 + 7);
    *((void *)v3 + 7) = v11;

    dispatch_source_set_event_handler(*((dispatch_source_t *)v3 + 7), &__block_literal_global_2770);
    dispatch_source_set_timer(*((dispatch_source_t *)v3 + 7), 0, 0x2FAF080uLL, 0);
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = v13;

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.gputools.capture-observers", 0);
    id v16 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v15;
  }
  return (GTMTLCaptureService *)v3;
}

void __40__GTMTLCaptureService_initWithGuestApp___block_invoke(id a1)
{
  if ((*(_DWORD *)(boundaryTrackerInstance + 20) & 0xFFFFFFFE) == 2)
  {
    unint64_t v1 = atomic_load(&g_frameCount);
    unint64_t v2 = atomic_load(&g_frameOther);
    unint64_t v3 = atomic_load(&g_commitCount);
    unint64_t v4 = atomic_load(&g_commitOther);
    unint64_t v5 = atomic_load(&g_resourceCount);
    unint64_t v6 = atomic_load(&g_resourceDownloaded);
    unint64_t v7 = atomic_load(&g_GPUDataSize);
    unint64_t v8 = atomic_load(&g_GPUDataDownloaded);
    id v18 = (id)objc_opt_new();
    [v18 setCaptureState:1];
    dispatch_queue_t v9 = objc_opt_new();
    [v18 setStats:v9];

    id v10 = [v18 stats];
    [v10 setFrameCount:v1];

    dispatch_source_t v11 = [v18 stats];
    [v11 setFrameOther:v2];

    uint64_t v12 = [v18 stats];
    [v12 setCommitCount:v3];

    uint64_t v13 = [v18 stats];
    [v13 setCommitOther:v4];

    uint64_t v14 = [v18 stats];
    [v14 setResourceCount:v5];

    dispatch_queue_t v15 = [v18 stats];
    [v15 setResourceDownloaded:v6];

    id v16 = [v18 stats];
    [v16 setGPUDataSize:v7];

    long long v17 = [v18 stats];
    [v17 setGPUDataDownloaded:v8];

    if (*(unsigned char *)(g_guestAppClientMTL + 129)) {
      [*(id *)(g_guestAppClientMTL + 8) notifyCaptureProgress:v18];
    }
  }
}

@end