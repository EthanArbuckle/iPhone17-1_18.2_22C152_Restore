@interface CaptureMTLCaptureManager
+ (id)toolsCaptureManager;
- (BOOL)isCapturing;
- (BOOL)startCaptureWithDescriptor:(id)a3 error:(id *)a4;
- (BOOL)supportsDestination:(int64_t)a3;
- (CaptureMTLCaptureManager)initWithCaptureContext:(GTTraceContext *)a3 andIsToolsManager:(BOOL)a4;
- (GTTraceStream)traceStream;
- (id)newCaptureScopeWithCommandQueue:(id)a3;
- (id)newCaptureScopeWithDevice:(id)a3;
- (void)dealloc;
- (void)setDefaultCaptureScope:(id)a3;
- (void)startCaptureWithCommandQueue:(id)a3;
- (void)startCaptureWithDevice:(id)a3;
- (void)startCaptureWithScope:(id)a3;
- (void)stopCapture;
@end

@implementation CaptureMTLCaptureManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waitResponse, 0);

  objc_storeStrong((id *)&self->_gputracePath, 0);
}

- (void)setDefaultCaptureScope:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CaptureMTLCaptureManager;
  [(CaptureMTLCaptureManager *)&v3 setDefaultCaptureScope:a3];
  +[GTMTLCaptureScopeInfo updateAll];
}

- (id)newCaptureScopeWithCommandQueue:(id)a3
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v25 = (unint64_t)traceContext;
  *(void *)&long long v26 = 0;
  *((void *)&v26 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v27 = v8;
  BYTE8(v27) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v27 + 9) = 16400;
  *(_DWORD *)((char *)&v27 + 11) = 0;
  HIBYTE(v27) = 0;
  v10 = [CaptureMTLCaptureScope alloc];
  v11 = [v5 device];
  v12 = [(CaptureMTLCaptureScope *)v10 initWithDevice:v11 commandQueue:v5 captureContext:self->_traceContext];

  GTTraceEncoder_setStream((uint64_t *)&v25, (uint64_t)[(CaptureMTLCaptureScope *)v12 traceStream]);
  uint64_t v13 = v26;
  *(_DWORD *)(v26 + 8) = -15733;
  char v14 = BYTE9(v27);
  if (BYTE9(v27) > 0x28uLL)
  {
    uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 24);
    uint64_t v17 = BYTE10(v27);
    ++BYTE10(v27);
    v15 = GTTraceMemPool_allocateBytes(v16, *((uint64_t *)&v26 + 1), v17 | 0x1800000000) + 16;
    char v14 = v17;
  }
  else
  {
    v15 = (char *)(v13 + BYTE9(v27));
    BYTE9(v27) += 24;
  }
  *(unsigned char *)(v13 + 13) = v14;
  v18 = [(CaptureMTLCaptureManager *)self traceStream];
  if (v18) {
    unint64_t var0 = v18->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v20 = [(CaptureMTLCaptureScope *)v12 traceStream];
  if (v20) {
    unint64_t v21 = v20->var0;
  }
  else {
    unint64_t v21 = 0;
  }
  v22 = (uint64_t *)[v5 traceStream];

  if (v22) {
    uint64_t v23 = *v22;
  }
  else {
    uint64_t v23 = 0;
  }
  *(void *)v15 = var0;
  *((void *)v15 + 1) = v21;
  *((void *)v15 + 2) = v23;
  uint64_t *v7 = v27;
  *((unsigned char *)v7 + 8) = BYTE8(v27);
  *(unsigned char *)(v26 + 15) |= 8u;
  return v12;
}

- (id)newCaptureScopeWithDevice:(id)a3
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v23 = (unint64_t)traceContext;
  *(void *)&long long v24 = 0;
  *((void *)&v24 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v25 = v8;
  BYTE8(v25) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v25 + 9) = 16400;
  *(_DWORD *)((char *)&v25 + 11) = 0;
  HIBYTE(v25) = 0;
  v10 = [[CaptureMTLCaptureScope alloc] initWithDevice:v5 commandQueue:0 captureContext:self->_traceContext];
  GTTraceEncoder_setStream((uint64_t *)&v23, (uint64_t)[(CaptureMTLCaptureScope *)v10 traceStream]);
  uint64_t v11 = v24;
  *(_DWORD *)(v24 + 8) = -15734;
  char v12 = BYTE9(v25);
  if (BYTE9(v25) > 0x28uLL)
  {
    uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 24);
    uint64_t v15 = BYTE10(v25);
    ++BYTE10(v25);
    uint64_t v13 = GTTraceMemPool_allocateBytes(v14, *((uint64_t *)&v24 + 1), v15 | 0x1800000000) + 16;
    char v12 = v15;
  }
  else
  {
    uint64_t v13 = (char *)(v11 + BYTE9(v25));
    BYTE9(v25) += 24;
  }
  *(unsigned char *)(v11 + 13) = v12;
  uint64_t v16 = [(CaptureMTLCaptureManager *)self traceStream];
  if (v16) {
    unint64_t var0 = v16->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  v18 = [(CaptureMTLCaptureScope *)v10 traceStream];
  if (v18) {
    unint64_t v19 = v18->var0;
  }
  else {
    unint64_t v19 = 0;
  }
  v20 = (uint64_t *)[v5 traceStream];

  if (v20) {
    uint64_t v21 = *v20;
  }
  else {
    uint64_t v21 = 0;
  }
  *(void *)uint64_t v13 = var0;
  *((void *)v13 + 1) = v19;
  *((void *)v13 + 2) = v21;
  uint64_t *v7 = v25;
  *((unsigned char *)v7 + 8) = BYTE8(v25);
  *(unsigned char *)(v24 + 15) |= 8u;
  return v10;
}

- (BOOL)isCapturing
{
  return *(_DWORD *)(boundaryTrackerInstance + 20) != 0;
}

- (void)stopCapture
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v22);
  uint64_t v3 = v23;
  *(_DWORD *)(v23 + 8) = -16067;
  char v4 = BYTE9(v24);
  if (BYTE9(v24) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v22 + 1) + 24);
    uint64_t v7 = BYTE10(v24);
    ++BYTE10(v24);
    id v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v23 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    id v5 = (char *)(v3 + BYTE9(v24));
    BYTE9(v24) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  uint64_t v8 = [(CaptureMTLCaptureManager *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)id v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v24);
  *(unsigned char *)(v23 + 15) |= 8u;
  BOOL isToolManager = self->_isToolManager;
  uint64_t v13 = [(CaptureMTLCaptureManager *)self traceStream];
  if (v13) {
    unint64_t v14 = v13->var0;
  }
  else {
    unint64_t v14 = 0;
  }
  if (isToolManager) {
    unsigned int v15 = 4;
  }
  else {
    unsigned int v15 = 5;
  }
  *(void *)&long long v16 = v15 | 0x800000000;
  *((void *)&v16 + 1) = v14;
  uint64_t v17 = *((void *)&v23 + 1);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  GTCaptureBoundaryTracker_handleTrigger(&v16);
}

- (void)startCaptureWithScope:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setApiTriggeredCapture:1];
  [v5 setSuspendAfterCapture:1];
  [v5 setCaptureMode:4];
  [v5 setTriggerHitsToStart:1];
  [v5 setTriggerHitsToEnd:1];
  [v5 setDestination:1];
  [v5 setCaptureObject:v4];

  [(CaptureMTLCaptureManager *)self startCaptureWithDescriptor:v5 error:0];
}

- (void)startCaptureWithCommandQueue:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setApiTriggeredCapture:1];
  [v5 setSuspendAfterCapture:1];
  [v5 setCaptureMode:2];
  [v5 setDestination:1];
  [v5 setCaptureObject:v4];

  [(CaptureMTLCaptureManager *)self startCaptureWithDescriptor:v5 error:0];
}

- (void)startCaptureWithDevice:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_opt_new();
  [v5 setApiTriggeredCapture:1];
  [v5 setSuspendAfterCapture:1];
  [v5 setCaptureMode:0];
  [v5 setDestination:1];
  [v5 setCaptureObject:v4];

  [(CaptureMTLCaptureManager *)self startCaptureWithDescriptor:v5 error:0];
}

- (BOOL)startCaptureWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!*(_DWORD *)(boundaryTrackerInstance + 20))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(g_guestAppClientMTL + 32));
    uint64_t v8 = *(void *)(g_guestAppClientMTL + 72);
    os_unfair_lock_unlock((os_unfair_lock_t)(g_guestAppClientMTL + 32));
    if (v8)
    {
      uint64_t v9 = GTMTLGuestAppClient_getUnsupportedFenumInfo();
      uint64_t v10 = [v9 asError];
      uint64_t v11 = [v10 userInfo];
      ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 1, (uint64_t)v11);

      goto LABEL_5;
    }
    unint64_t v14 = [v6 captureObject];
    v107 = 0;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    if (objc_opt_respondsToSelector())
    {
      unint64_t v15 = (unint64_t)[v6 captureMode];
      id v16 = v14;
      uint64_t v17 = v16;
      if (!v16 && v15 != 5) {
        goto LABEL_10;
      }
      if (v15 <= 1 && ![v16 conformsToProtocol:&OBJC_PROTOCOL___MTLDevice])
      {
        long long v19 = @"an MTLDevice";
        goto LABEL_59;
      }
      if ((v15 & 0xFFFFFFFFFFFFFFFELL) == 2
        && ![v17 conformsToProtocol:&OBJC_PROTOCOL___MTLCommandQueue])
      {
        long long v19 = @"an MTLCommandQueue";
        goto LABEL_59;
      }
      if (v15 == 6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v19 = @"a CAMetalLayer";
          goto LABEL_59;
        }
LABEL_39:

        goto LABEL_41;
      }
      if (v15 == 4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v19 = @"an MTLCaptureScope";
LABEL_59:
          *(void *)&long long v108 = @"Wrong capture object type.";
          unsigned long long v115 = __PAIR128__((unint64_t)NSLocalizedFailureReasonErrorKey, (unint64_t)NSLocalizedDescriptionKey);
          v40 = v19;
          v41 = +[NSString stringWithFormat:@"Selected capture mode requires the capture object to be %@", v40];
          *((void *)&v108 + 1) = v41;
          *(void *)&long long v116 = NSLocalizedRecoverySuggestionErrorKey;
          v42 = +[NSString stringWithFormat:@"Specify %@ object to be captured.", v40];

          CFStringRef v109 = v42;
          v43 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v115 count:3];

          ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v43);
          goto LABEL_60;
        }
        goto LABEL_39;
      }

      if ((v15 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
LABEL_41:
        id v28 = v6;
        if (objc_opt_respondsToSelector())
        {
          if (objc_opt_respondsToSelector())
          {

            id v96 = [v28 triggerHitsToStart];
            *((void *)&v103 + 1) = v96;
            id v20 = [v28 triggerHitsToEnd];
            *(void *)&long long v104 = v20;
            goto LABEL_27;
          }
          CFStringRef v31 = @"triggerHitsToEnd";
        }
        else
        {
          CFStringRef v31 = @"triggerHitsToStart";
        }
        unsigned long long v115 = __PAIR128__((unint64_t)NSLocalizedFailureReasonErrorKey, (unint64_t)NSLocalizedDescriptionKey);
        v46 = +[NSString stringWithFormat:@"%@ property is not present in the descriptor.", v31];
        *(void *)&long long v108 = v46;
        v47 = +[NSString stringWithFormat:@"Selected capture mode requires the %@ property.", v31];
        *(void *)&long long v116 = NSLocalizedRecoverySuggestionErrorKey;
        *((void *)&v108 + 1) = v47;
        CFStringRef v109 = @"Ensure that your capture descriptor implements the MTLCaptureManager(InternalSPI) category.";
        v48 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v115 count:3];

        ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v48);
        goto LABEL_61;
      }
    }
    else
    {
      id v18 = v14;
      uint64_t v17 = v18;
      if (!v18)
      {
LABEL_10:
        FillMissingCaptureObjectError(a4);
LABEL_60:

LABEL_61:
        v44 = 0;
        BOOL v12 = 0;
LABEL_128:

        goto LABEL_6;
      }
      if ([v18 conformsToProtocol:&OBJC_PROTOCOL___MTLDevice])
      {
        unint64_t v15 = 0;
      }
      else
      {
        if (([v17 conformsToProtocol:&OBJC_PROTOCOL___MTLCommandQueue] & 1) == 0)
        {
          if (([v17 conformsToProtocol:&OBJC_PROTOCOL___MTLCaptureScope] & 1) == 0)
          {
            *(void *)&unsigned long long v115 = NSLocalizedDescriptionKey;
            v29 = +[NSString stringWithFormat:@"‘%@’ cannot be captured.", objc_opt_class()];
            *((void *)&v115 + 1) = NSLocalizedRecoverySuggestionErrorKey;
            *(void *)&long long v108 = v29;
            *((void *)&v108 + 1) = @"Specify an object to be captured like MTLDevice.";
            v30 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v115 count:2];

            ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v30);
            goto LABEL_60;
          }

          if (objc_opt_respondsToSelector()) {
            id v24 = [v6 triggerHitsToStart];
          }
          else {
            id v24 = &def_CFBEC + 1;
          }
          id v96 = v24;
          *((void *)&v103 + 1) = v24;
          if (objc_opt_respondsToSelector()) {
            id v20 = [v6 triggerHitsToEnd];
          }
          else {
            id v20 = &def_CFBEC + 1;
          }
          *(void *)&long long v104 = v20;
          unint64_t v15 = 4;
          if (v20)
          {
LABEL_29:
            id v95 = v20;
            uint64_t v97 = 0;
            switch(v15)
            {
              case 0uLL:
              case 1uLL:
                id v21 = v14;
                long long v22 = (uint64_t *)[v21 traceStream];
                if (v22) {
                  uint64_t v23 = *v22;
                }
                else {
                  uint64_t v23 = 0;
                }
                *(void *)&long long v101 = v23;
                v36 = (uint64_t *)[v21 traceStream];
                goto LABEL_84;
              case 2uLL:
              case 3uLL:
                id v25 = v14;
                long long v26 = (uint64_t *)[v25 traceStream];
                if (v26) {
                  uint64_t v27 = *v26;
                }
                else {
                  uint64_t v27 = 0;
                }
                *((void *)&v101 + 1) = v27;
                v37 = [v25 device];
                v38 = (uint64_t *)[v37 traceStream];
                if (v38) {
                  uint64_t v39 = *v38;
                }
                else {
                  uint64_t v39 = 0;
                }
                goto LABEL_57;
              case 4uLL:
                id v32 = v14;
                v33 = (uint64_t *)[v32 traceStream];
                if (v33) {
                  uint64_t v34 = *v33;
                }
                else {
                  uint64_t v34 = 0;
                }
                *(void *)&long long v102 = v34;
                v50 = [v32 device];
                v51 = (uint64_t *)[v50 traceStream];
                if (v51) {
                  uint64_t v52 = *v51;
                }
                else {
                  uint64_t v52 = 0;
                }
                *(void *)&long long v101 = v52;

                v53 = [v32 commandQueue];

                if (v53)
                {
                  v54 = [v32 commandQueue];
                  v55 = (uint64_t *)[v54 traceStream];
                  if (v55) {
                    uint64_t v56 = *v55;
                  }
                  else {
                    uint64_t v56 = 0;
                  }
                  *((void *)&v101 + 1) = v56;
                }
                v36 = (uint64_t *)[v32 traceStream];
                goto LABEL_84;
              case 6uLL:
                id v25 = v14;
                if (objc_opt_respondsToSelector()) {
                  id v35 = [v25 streamReference];
                }
                else {
                  id v35 = 0;
                }
                *((void *)&v102 + 1) = v35;
                v37 = [v25 device];
                v49 = (uint64_t *)[v37 traceStream];
                if (v49) {
                  uint64_t v39 = *v49;
                }
                else {
                  uint64_t v39 = 0;
                }
LABEL_57:
                *(void *)&long long v101 = v39;

                v36 = (uint64_t *)[v25 traceStream];
LABEL_84:
                if (v36) {
                  uint64_t v97 = *v36;
                }
                else {
                  uint64_t v97 = 0;
                }

                break;
              default:
                break;
            }
            LODWORD(v106) = v15;
            if (objc_opt_respondsToSelector()) {
              id v57 = [v6 sessionID];
            }
            else {
              id v57 = 0;
            }
            *(void *)&long long v103 = v57;
            if (objc_opt_respondsToSelector()) {
              unsigned __int8 v58 = [v6 apiTriggeredCapture];
            }
            else {
              unsigned __int8 v58 = 1;
            }
            BYTE9(v106) = v58;
            BYTE10(v106) = self->_isToolManager;
            if (objc_opt_respondsToSelector()) {
              unsigned __int8 v59 = [v6 includeBacktrace];
            }
            else {
              unsigned __int8 v59 = 1;
            }
            BYTE12(v106) = v59;
            if (objc_opt_respondsToSelector()) {
              id v60 = [v6 ignoreUnusedResources];
            }
            else {
              id v60 = 0;
            }
            BYTE11(v106) = (_BYTE)v60;
            if ((objc_opt_respondsToSelector() & 1) != 0
              && ([v6 completionHandler],
                  v61 = objc_claimAutoreleasedReturnValue(),
                  v61,
                  v61))
            {
              v99[0] = _NSConcreteStackBlock;
              v99[1] = 3221225472;
              v99[2] = __61__CaptureMTLCaptureManager_startCaptureWithDescriptor_error___block_invoke;
              v99[3] = &unk_222230;
              id v100 = v6;
              v107 = objc_retainBlock(v99);
            }
            else
            {
              v107 = 0;
            }
            v62 = (char *)[v6 destination];
            id v98 = [v6 outputURL];
            if (v62 == (unsigned char *)&def_CFBEC + 2)
            {
              if (![(CaptureMTLCaptureManager *)self supportsDestination:2])
              {
                v124[0] = NSLocalizedDescriptionKey;
                v74 = +[NSString stringWithFormat:@"Capture Destination ‘%@’ is not supported.", @"GPU Trace Document"];
                v124[1] = NSLocalizedRecoverySuggestionErrorKey;
                v125[0] = v74;
                v125[1] = @"Capture to another destination.";
                v75 = +[NSDictionary dictionaryWithObjects:v125 forKeys:v124 count:2];

                ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v75);
                goto LABEL_125;
              }
              if (!v98)
              {
                v122[0] = NSLocalizedDescriptionKey;
                v76 = +[NSString stringWithFormat:@"Capture Destination ‘%@’ must write to a file.", @"GPU Trace Document"];
                v122[1] = NSLocalizedRecoverySuggestionErrorKey;
                v123[0] = v76;
                v123[1] = @"Specify a valid output file path.";
                v77 = +[NSDictionary dictionaryWithObjects:v123 forKeys:v122 count:2];

                ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v77);
                goto LABEL_125;
              }
              v65 = [v98 pathExtension];
              unsigned __int8 v66 = [v65 isEqualToString:@"gputrace"];

              if ((v66 & 1) == 0)
              {
                v120[0] = NSLocalizedDescriptionKey;
                v78 = [v98 lastPathComponent];
                v79 = +[NSString stringWithFormat:@"‘%@’ could not be used because the file name is invalid.", v78];
                v120[1] = NSLocalizedRecoverySuggestionErrorKey;
                v121[0] = v79;
                v121[1] = @"Use ‘.gputrace’ as file name extension.";
                v80 = +[NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];

                ReportError(a4, (uint64_t)NSCocoaErrorDomain, 514, (uint64_t)v80);
                goto LABEL_125;
              }
              v67 = +[NSFileManager defaultManager];
              v93 = [v98 URLByDeletingLastPathComponent];
              if (v93
                && ([v67 createDirectoryAtURL:v93 withIntermediateDirectories:1 attributes:0 error:a4] & 1) == 0|| !objc_msgSend(v67, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v98, 0, 0, a4))
              {

                goto LABEL_125;
              }
              +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v98 fileSystemRepresentation]);
              v68 = (NSString *)objc_claimAutoreleasedReturnValue();
              gputracePath = self->_gputracePath;
              self->_gputracePath = v68;

              *(void *)&long long v105 = [(NSString *)self->_gputracePath UTF8String];
              *((void *)&v105 + 1) = "";
              if (objc_opt_respondsToSelector()) {
                unsigned int v70 = [v6 suspendAfterCapture];
              }
              else {
                unsigned int v70 = 0;
              }
              BYTE4(v106) = v70;

              unsigned int v94 = v70;
            }
            else
            {
              if (v62 != (unsigned char *)&def_CFBEC + 1)
              {
                v118[0] = NSLocalizedDescriptionKey;
                v118[1] = NSLocalizedRecoverySuggestionErrorKey;
                v119[0] = @"Capture Destination is not valid.";
                v119[1] = @"Capturing to a valid destination.";
                v71 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:2];
                ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v71);

                goto LABEL_125;
              }
              if (![(CaptureMTLCaptureManager *)self supportsDestination:1])
              {
                v128[0] = NSLocalizedDescriptionKey;
                v72 = +[NSString stringWithFormat:@"Capture Destination ‘%@’ is not supported.", @"Developer Tools"];
                v128[1] = NSLocalizedRecoverySuggestionErrorKey;
                v129[0] = v72;
                v129[1] = @"Capture to another destination.";
                v73 = +[NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:2];

                ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v73);
                goto LABEL_125;
              }
              if (v98)
              {
                v126[0] = NSLocalizedDescriptionKey;
                v63 = +[NSString stringWithFormat:@"Capture Destination ‘%@’ cannot write to a file.", @"Developer Tools"];
                v126[1] = NSLocalizedRecoverySuggestionErrorKey;
                v127[0] = v63;
                v127[1] = @"Don't specify an output file path.";
                v64 = +[NSDictionary dictionaryWithObjects:v127 forKeys:v126 count:2];

                ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v64);
LABEL_125:
                BOOL v12 = 0;
                goto LABEL_126;
              }
              BYTE4(v106) = 1;
              GTMTLGuestAppClient_notifyCaptureRequest((uint64_t *)&v101);
              if (*(unsigned char *)(g_guestAppClientMTL + 129))
              {
                dispatch_semaphore_wait((dispatch_semaphore_t)self->_waitResponse, 0xFFFFFFFFFFFFFFFFLL);
                BOOL v12 = 1;
LABEL_126:
                v81 = v98;
LABEL_127:

                v44 = v107;
                goto LABEL_128;
              }
              unsigned int v94 = 1;
            }
            long long v117 = 0u;
            long long v116 = 0u;
            unsigned long long v115 = 0u;
            GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v115);
            Arguments = GTTraceEncoder_allocateArguments((uint64_t)&v115, -15736, 24);
            v83 = [(CaptureMTLCaptureManager *)self traceStream];
            if (v83) {
              unint64_t var0 = v83->var0;
            }
            else {
              unint64_t var0 = 0;
            }
            if (a4) {
              a4 = (id *)*a4;
            }
            char v85 = SaveMTLCaptureDescriptor((uint64_t)&v115, v6);
            *(void *)Arguments = var0;
            *((void *)Arguments + 1) = a4;
            Arguments[16] = v85;
            *(_DWORD *)(Arguments + 17) = 0;
            *((_DWORD *)Arguments + 5) = 0;
            id v86 = [objc_alloc((Class)GTCaptureDescriptor) initWithRequestID:v57];
            [v86 setTriggerHitsToStart:v96];
            [v86 setTriggerHitsToEnd:v95];
            [v86 setSuspendAfterCapture:v94];
            [v86 setIgnoreUnusedResources:v60];
            [v86 setStreamRef:v97];
            v87 = objc_opt_new();
            [v87 setCaptureState:0];
            [v87 setDescriptor:v86];
            if (*(unsigned char *)(g_guestAppClientMTL + 129)) {
              [*(id *)(g_guestAppClientMTL + 8) notifyCaptureProgress:v87];
            }

            if (self->_isToolManager) {
              unsigned int v88 = 4;
            }
            else {
              unsigned int v88 = 5;
            }
            v89 = [(CaptureMTLCaptureManager *)self traceStream];
            if (v89) {
              unint64_t v90 = v89->var0;
            }
            else {
              unint64_t v90 = 0;
            }
            *(void *)&long long v108 = v88 | 0x700000000;
            *((void *)&v108 + 1) = v90;
            CFStringRef v109 = (const __CFString *)*((void *)&v116 + 1);
            long long v110 = 0u;
            long long v111 = 0u;
            long long v112 = 0u;
            uint64_t v113 = 0;
            v114 = &v101;
            GTCaptureBoundaryTracker_handleTrigger(&v108);
            dispatch_semaphore_signal((dispatch_semaphore_t)qword_2500B0);
            if ((void)v103) {
              dispatch_semaphore_signal((dispatch_semaphore_t)self->_waitResponse);
            }
            s();
            *(void *)uint64_t v91 = v92;
            *(unsigned char *)(v91 + 8) = BYTE8(v117);
            *(unsigned char *)(v116 + 15) |= 8u;
            if (startCaptureWithDescriptor_error__onceToken != -1) {
              dispatch_once(&startCaptureWithDescriptor_error__onceToken, &__block_literal_global_140);
            }
            v81 = v98;
            BOOL v12 = 1;
            goto LABEL_127;
          }
LABEL_67:
          *(void *)&unsigned long long v115 = NSLocalizedDescriptionKey;
          *((void *)&v115 + 1) = NSLocalizedRecoverySuggestionErrorKey;
          *(void *)&long long v108 = @"The value of triggerHitsToEnd cannot be 0.";
          *((void *)&v108 + 1) = @"Set triggerHitsToEnd to the amount of times the end condition needs to be met to end the capture.";
          v45 = +[NSDictionary dictionaryWithObjects:&v108 forKeys:&v115 count:2];
          ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 3, (uint64_t)v45);

          goto LABEL_61;
        }
        unint64_t v15 = 2;
      }
    }
    id v96 = 0;
    id v20 = 0;
LABEL_27:
    if ((v15 & 0xFFFFFFFFFFFFFFFDLL) == 0 || v20) {
      goto LABEL_29;
    }
    goto LABEL_67;
  }
  v130[0] = NSLocalizedDescriptionKey;
  v130[1] = NSLocalizedRecoverySuggestionErrorKey;
  v131[0] = @"Already capturing.";
  v131[1] = @"Stop running capture before starting a new one.";
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
  ReportError(a4, (uint64_t)MTLCaptureErrorDomain, 2, (uint64_t)v7);

LABEL_5:
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

void __61__CaptureMTLCaptureManager_startCaptureWithDescriptor_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) completionHandler];
  if (a2)
  {
    uint64_t v3 = +[NSString stringWithUTF8String:a2];
    id v4 = +[NSURL fileURLWithPath:v3];
    v5[2](v5, v4);
  }
  else
  {
    v5[2](v5, 0);
  }
}

void __61__CaptureMTLCaptureManager_startCaptureWithDescriptor_error___block_invoke_2(id a1)
{
}

- (BOOL)supportsDestination:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  if (a3 == 1)
  {
    if (!*(void *)g_guestAppClientMTL && (qword_2501C8 & 0x800) == 0) {
      return [*(id *)(g_guestAppClientMTL + 8) hasObservers];
    }
    return 1;
  }
  return 0;
}

- (void)dealloc
{
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v3.receiver = self;
  v3.super_class = (Class)CaptureMTLCaptureManager;
  [(CaptureMTLCaptureManager *)&v3 dealloc];
}

- (CaptureMTLCaptureManager)initWithCaptureContext:(GTTraceContext *)a3 andIsToolsManager:(BOOL)a4
{
  id v6 = [(CaptureMTLCaptureManager *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_traceContext = a3;
    uint64_t v9 = v7;
    while ((objc_opt_respondsToSelector() & 1) != 0)
      uint64_t v9 = (CaptureMTLCaptureManager *)[(CaptureMTLCaptureManager *)v9 performSelector:"baseObject"];
    uint64_t v10 = v9;
    v7->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)a3, (unint64_t)v9, (unint64_t)v7);

    v7->_BOOL isToolManager = a4;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    waitResponse = v7->_waitResponse;
    v7->_waitResponse = (OS_dispatch_semaphore *)v11;
  }
  return v7;
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

+ (id)toolsCaptureManager
{
  if (toolsCaptureManager_onceToken != -1) {
    dispatch_once(&toolsCaptureManager_onceToken, &__block_literal_global_9286);
  }
  v2 = (void *)toolsCaptureManager_toolsCaptureManager;

  return v2;
}

void __47__CaptureMTLCaptureManager_toolsCaptureManager__block_invoke(id a1)
{
  v1 = [[CaptureMTLCaptureManager alloc] initWithCaptureContext:g_ctx andIsToolsManager:1];
  uint64_t v2 = toolsCaptureManager_toolsCaptureManager;
  toolsCaptureManager_toolsCaptureManager = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

@end