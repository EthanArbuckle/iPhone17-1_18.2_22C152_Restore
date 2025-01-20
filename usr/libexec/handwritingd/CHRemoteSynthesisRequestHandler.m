@interface CHRemoteSynthesisRequestHandler
- (BOOL)_isReadyForCharacterInventorySynthesis;
- (BOOL)_isValidRemoteSynthesisRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_shouldFreezeCharacterInventory;
- (BOOL)hasIdleLifetimeElapsed:(double)a3;
- (BOOL)hasStyleInventoryIdleLifetimeElapsed:(double)a3;
- (CHRemoteSynthesisRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5 recognitionHandler:(id)a6;
- (id)_createDebugViewOfInventory;
- (id)_queueForRequest:(id)a3 outIsSynchronizedSynthesisQueue:(BOOL *)a4;
- (id)diffusionModelHash;
- (void)_asyncUpdateInventoryStylePredictions;
- (void)_handleCharacterInventoryRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5;
- (void)_updateStylePredictionsSingleBatch:(int64_t)a3;
- (void)checkInStyleInventory;
- (void)checkInTextSynthesizer;
- (void)checkOutStyleInventory;
- (void)checkOutTextSynthesizer;
- (void)checkSegmentsAndDrawingConsistencyForSynthesisResult:(id)a3 bundleIdentifier:(id)a4 withReply:(id)a5;
- (void)evictTextSynthesizer;
- (void)handleInventoryRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5;
- (void)handleInventoryStatusRequestWithReply:(id)a3 bundleIdentifier:(id)a4;
- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5;
- (void)optimizeResourceUsage;
- (void)saveStyleInventoryIfNeeded;
- (void)stageEvictionOfStyleInventoryWithTargetIdleLifetime:(double)a3;
- (void)stageEvictionOfTextSynthesizerWithTargetIdleLifetime:(double)a3;
- (void)throttledSaveStyleInventoryIfNeeded;
@end

@implementation CHRemoteSynthesisRequestHandler

- (CHRemoteSynthesisRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5 recognitionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CHRemoteSynthesisRequestHandler;
  v14 = [(CHRemoteProcessingRequestHandler *)&v18 initWithServerQueue:v10 lowPriorityQueue:v11 highPriorityQueue:v12];
  v15 = v14;
  if (v14)
  {
    v14->_activeRequestCount = 0;
    v14->_targetIdleLifetime = 120.0;
    +[NSDate timeIntervalSinceReferenceDate];
    v15->_lastActiveTimestamp = v16;
    v15->_lastInventorySynthesisTimestamp = 0.0;
    objc_storeStrong((id *)&v15->_recognitionRequestHandler, a6);
  }

  return v15;
}

- (BOOL)_isValidRemoteSynthesisRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    if ([v7 requestType] == (id)1
      && ([v7 drawing], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      v24 = +[NSBundle mainBundle];
      v15 = [v24 localizedStringForKey:@"The synthesis request is invalid" value:&stru_1000257A0 table:0];

      v25 = +[NSBundle mainBundle];
      v17 = [v25 localizedStringForKey:@"Cannot refine an empty drawing" value:&stru_1000257A0 table:0];

      v26 = +[NSBundle mainBundle];
      v19 = [v26 localizedStringForKey:@"Submit a request with .drawing!=nil or .refinementRequest=NO" value:&stru_1000257A0 table:0];

      uint64_t v20 = [(id)objc_opt_class() invalidInputErrorWithDescription:v15 failureReason:v17 recoverySuggestion:v19 errorCode:-1002];
    }
    else
    {
      if ([v7 requestType] && objc_msgSend(v7, "requestType") != (id)2
        || ([v7 string],
            id v10 = objc_claimAutoreleasedReturnValue(),
            id v11 = [v10 length],
            v10,
            v11))
      {
        id v12 = 0;
        BOOL v13 = 1;
        if (!a5) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      v21 = +[NSBundle mainBundle];
      v15 = [v21 localizedStringForKey:@"The synthesis request is invalid" value:&stru_1000257A0 table:0];

      v22 = +[NSBundle mainBundle];
      v17 = [v22 localizedStringForKey:@"Cannot generate ink for an empty string" value:&stru_1000257A0 table:0];

      v23 = +[NSBundle mainBundle];
      v19 = [v23 localizedStringForKey:@"Submit a request with .string != \"\"" value:&stru_1000257A0 table:0];

      uint64_t v20 = [(id)objc_opt_class() invalidInputErrorWithDescription:v15 failureReason:v17 recoverySuggestion:v19 errorCode:-1002];
    }
  }
  else
  {
    v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"The synthesis request is invalid" value:&stru_1000257A0 table:0];

    double v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"Remote synthesis cannot process an empty request" value:&stru_1000257A0 table:0];

    objc_super v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"Submit a new valid synthesis request" value:&stru_1000257A0 table:0];

    uint64_t v20 = [(id)objc_opt_class() invalidInputErrorWithDescription:v15 failureReason:v17 recoverySuggestion:v19 errorCode:-1002];
  }
  id v12 = (void *)v20;

  BOOL v13 = 0;
  if (a5) {
LABEL_13:
  }
    *a5 = v12;
LABEL_14:

  return v13;
}

- (void)checkOutTextSynthesizer
{
  ++self->_activeRequestCount;
  [(CHRemoteSynthesisRequestHandler *)self checkOutStyleInventory];
  [(CHRemoteBasicRequestHandler *)self setDirty];
  if (!self->_textSynthesizer)
  {
    if (CHHasPersonalizedSynthesisSupport() && !self->_styleInventory)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      v3 = (id)qword_10002B118;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Style inventory is nil ", (uint8_t *)&v19, 2u);
      }
    }
    v4 = (CHTextSynthesizer *)[objc_alloc((Class)CHTextSynthesizer) initWithStyleInventory:self->_styleInventory];
    textSynthesizer = self->_textSynthesizer;
    self->_textSynthesizer = v4;

    if (qword_10002B188 == -1)
    {
      v6 = (id)qword_10002B160;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
LABEL_12:

        id v7 = [(CHRemoteBasicRequestHandler *)self modelPowerLogger];
        [v7 logModelLoaded:3];

        goto LABEL_13;
      }
    }
    else
    {
      dispatch_once(&qword_10002B188, &stru_100024A60);
      v6 = (id)qword_10002B160;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_12;
      }
    }
    LOWORD(v19) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Loaded synthesizer", (uint8_t *)&v19, 2u);
    goto LABEL_12;
  }
LABEL_13:
  if (self->_fastPathCharacterPersonalizer) {
    goto LABEL_23;
  }
  if (!self->_styleInventory)
  {
    if (qword_10002B188 == -1)
    {
      BOOL v13 = (id)qword_10002B160;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    else
    {
      dispatch_once(&qword_10002B188, &stru_100024A60);
      BOOL v13 = (id)qword_10002B160;
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
    }
    LOWORD(v19) = 0;
    v14 = "Not possible to create a fast path character builder, inventory is null.";
    v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    goto LABEL_21;
  }
  id v8 = objc_alloc((Class)CHFastPathCharacterPersonalizerInterface);
  styleInventory = self->_styleInventory;
  id v10 = [(CHTextSynthesizer *)self->_textSynthesizer supportedCharactersForPersonalizedSynthesis];
  id v11 = (CHFastPathCharacterPersonalizerInterface *)[v8 initWithStyleInventory:styleInventory characterSet:v10];
  fastPathCharacterPersonalizer = self->_fastPathCharacterPersonalizer;
  self->_fastPathCharacterPersonalizer = v11;

  if (qword_10002B188 != -1)
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    BOOL v13 = (id)qword_10002B160;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  BOOL v13 = (id)qword_10002B160;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
LABEL_17:
    LOWORD(v19) = 0;
    v14 = "Fast path character builder created";
    v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v19, 2u);
  }
LABEL_22:

LABEL_23:
  if (qword_10002B188 != -1)
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    v17 = (id)qword_10002B160;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  v17 = (id)qword_10002B160;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
LABEL_25:
    int64_t activeRequestCount = self->_activeRequestCount;
    int v19 = 134217984;
    int64_t v20 = activeRequestCount;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Currently active synthesis requests: %li", (uint8_t *)&v19, 0xCu);
  }
LABEL_26:
}

- (void)checkInTextSynthesizer
{
  --self->_activeRequestCount;
  [(CHRemoteSynthesisRequestHandler *)self checkInStyleInventory];
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastActiveTimestamp = v3;
  if (self->_activeRequestCount < 0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v4 = (id)qword_10002B118;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Synthesizer is already fully checked in.", v5, 2u);
    }
  }
  [(CHRemoteSynthesisRequestHandler *)self stageEvictionOfTextSynthesizerWithTargetIdleLifetime:self->_targetIdleLifetime];
}

- (BOOL)hasIdleLifetimeElapsed:(double)a3
{
  return +[CHRemoteBasicRequestHandler _hasIdleLifetimeElapsed:self->_lastActiveTimestamp targetIdleLifetime:a3];
}

- (void)stageEvictionOfTextSynthesizerWithTargetIdleLifetime:(double)a3
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v5 = (id)qword_10002B160;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Staging synthesizer for eviction with idle lifetime=%1.2f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000107F0;
  v6[3] = &unk_100024C48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [(CHRemoteBasicRequestHandler *)self _stageEvictionOfResourceWithTargetLifetime:v6 block:a3];
}

- (void)evictTextSynthesizer
{
  if (self->_textSynthesizer)
  {
    double v3 = [(CHRemoteBasicRequestHandler *)self modelPowerLogger];
    [v3 logModelUnloaded:3];

    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v4 = (id)qword_10002B160;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Evicted synthesizer", v7, 2u);
    }
  }
  self->_int64_t activeRequestCount = 0;
  textSynthesizer = self->_textSynthesizer;
  self->_textSynthesizer = 0;

  fastPathCharacterPersonalizer = self->_fastPathCharacterPersonalizer;
  self->_fastPathCharacterPersonalizer = 0;

  [(CHRemoteBasicRequestHandler *)self setIdle];
}

- (void)checkOutStyleInventory
{
  if (CHHasPersonalizedSynthesisSupport())
  {
    ++self->_activeStyleInventoryRequestCount;
    if (self->_styleInventory) {
      goto LABEL_18;
    }
    double v3 = [(CHRemoteProcessingRequestHandler *)self lowPriorityQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100010E64;
    block[3] = &unk_100024B10;
    block[4] = self;
    dispatch_sync(v3, block);
    if (+[CHSynthesisStyleInventory isPersonalizedSynthesisModelReady])
    {
      v4 = [(CHSynthesisStyleInventory *)self->_styleInventory synthesisModelHash];
      v5 = [(CHRemoteSynthesisRequestHandler *)self diffusionModelHash];
      unsigned __int8 v6 = [v4 isEqualToString:v5];

      if (v6)
      {
LABEL_17:

LABEL_18:
        if (qword_10002B188 == -1)
        {
          os_log_type_t v16 = (id)qword_10002B160;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
LABEL_21:

            return;
          }
        }
        else
        {
          dispatch_once(&qword_10002B188, &stru_100024A60);
          os_log_type_t v16 = (id)qword_10002B160;
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_21;
          }
        }
        int64_t activeStyleInventoryRequestCount = self->_activeStyleInventoryRequestCount;
        *(_DWORD *)buf = 134217984;
        int64_t v20 = activeStyleInventoryRequestCount;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Currently active style inventory requests: %li", buf, 0xCu);
        goto LABEL_21;
      }
      id v7 = [(CHRemoteSynthesisRequestHandler *)self diffusionModelHash];
      BOOL v8 = v7 == 0;

      if (v8)
      {
        v9 = CHOSLogForCategory(0);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "The diffusion model hash should be non-nil", buf, 2u);
        }
      }
      if (qword_10002B188 == -1)
      {
        id v10 = (id)qword_10002B160;
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
LABEL_12:

          styleInventory = self->_styleInventory;
          v14 = [(CHRemoteSynthesisRequestHandler *)self diffusionModelHash];
          [(CHSynthesisStyleInventory *)styleInventory updateSynthesisModelHash:v14];

          [(CHRemoteSynthesisRequestHandler *)self _asyncUpdateInventoryStylePredictions];
          goto LABEL_17;
        }
      }
      else
      {
        dispatch_once(&qword_10002B188, &stru_100024A60);
        id v10 = (id)qword_10002B160;
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_12;
        }
      }
      id v11 = [(CHSynthesisStyleInventory *)self->_styleInventory synthesisModelHash];
      id v12 = [(CHRemoteSynthesisRequestHandler *)self diffusionModelHash];
      *(_DWORD *)buf = 138412546;
      int64_t v20 = (int64_t)v11;
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Diffusion model hash has changed (old: %@, new: %@). The inventory samples embedding need to be recomputed.", buf, 0x16u);

      goto LABEL_12;
    }
    if (qword_10002B188 == -1)
    {
      v15 = (id)qword_10002B160;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10002B188, &stru_100024A60);
      v15 = (id)qword_10002B160;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_16;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Diffusion model is not ready. The model hash could not be validated", buf, 2u);
    goto LABEL_16;
  }
}

- (void)checkInStyleInventory
{
  if (CHHasPersonalizedSynthesisSupport())
  {
    [(CHRemoteSynthesisRequestHandler *)self throttledSaveStyleInventoryIfNeeded];
    --self->_activeStyleInventoryRequestCount;
    +[NSDate timeIntervalSinceReferenceDate];
    self->_lastActiveStyleInventoryTimestamp = v3;
    if (self->_activeStyleInventoryRequestCount < 0)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      v4 = (id)qword_10002B118[0];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Style inventory is already fully checked in.", v5, 2u);
      }
    }
    [(CHRemoteSynthesisRequestHandler *)self stageEvictionOfStyleInventoryWithTargetIdleLifetime:self->_targetIdleLifetime];
  }
}

- (BOOL)hasStyleInventoryIdleLifetimeElapsed:(double)a3
{
  return +[CHRemoteBasicRequestHandler _hasIdleLifetimeElapsed:self->_lastActiveStyleInventoryTimestamp targetIdleLifetime:a3];
}

- (void)stageEvictionOfStyleInventoryWithTargetIdleLifetime:(double)a3
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v5 = (id)qword_10002B160;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Staging style inventory for eviction with idle lifetime=%1.2f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100011178;
  v6[3] = &unk_100024C48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [(CHRemoteBasicRequestHandler *)self _stageEvictionOfResourceWithTargetLifetime:v6 block:a3];
}

- (void)throttledSaveStyleInventoryIfNeeded
{
  double v3 = [(CHRemoteProcessingRequestHandler *)self lowPriorityQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000113C4;
  block[3] = &unk_100024B10;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)saveStyleInventoryIfNeeded
{
  double v3 = [(CHRemoteProcessingRequestHandler *)self lowPriorityQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011548;
  block[3] = &unk_100024B10;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (id)_queueForRequest:(id)a3 outIsSynchronizedSynthesisQueue:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [v6 options];
  unsigned int v8 = [v7 isFastPath];

  if (v8)
  {
    v9 = dispatch_get_global_queue(2, 0);
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v11 = [v6 priority];
  if ((unint64_t)v11 < 2)
  {
    uint64_t v12 = [(CHRemoteProcessingRequestHandler *)self highPriorityQueue];
    goto LABEL_11;
  }
  if (v11 == (id)2)
  {
    uint64_t v12 = [(CHRemoteProcessingRequestHandler *)self lowPriorityQueue];
LABEL_11:
    v9 = (void *)v12;
    if (!a4) {
      goto LABEL_4;
    }
LABEL_3:
    *a4 = v8 ^ 1;
    goto LABEL_4;
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  BOOL v13 = (id)qword_10002B138;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid synthesis request priority specified", v14, 2u);
  }

  v9 = 0;
  if (a4) {
    goto LABEL_3;
  }
LABEL_4:

  return v9;
}

- (BOOL)_isReadyForCharacterInventorySynthesis
{
  unsigned int v2 = [(CHSynthesisStyleInventory *)self->_styleInventory hasAllDigits];
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  double v3 = (id)qword_10002B160;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = @"NO";
    if (v2) {
      CFStringRef v4 = @"YES";
    }
    int v6 = 138412290;
    CFStringRef v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: fast Path synthesis found sufficient digit coverage from the inventory to trigger the character inventory preparation : %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (void)_updateStylePredictionsSingleBatch:(int64_t)a3
{
  if (self->_styleInventory)
  {
    if (self->_textSynthesizer) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  CFStringRef v4 = self;
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v5 = (id)qword_10002B118[0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Style inventory has not been checked out", buf, 2u);
  }

  self = v4;
  if (!v4->_textSynthesizer)
  {
LABEL_9:
    int v6 = self;
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    CFStringRef v7 = (id)qword_10002B118[0];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Text synthesizer has not been checked out", buf, 2u);
    }

    self = v6;
  }
LABEL_14:
  unsigned int v8 = self;
  v23 = [(CHSynthesisStyleInventory *)self->_styleInventory samplesWithoutStylePrediction];
  +[NSMutableArray arrayWithCapacity:a3];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100011D5C;
  v29[3] = &unk_100024C70;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v30 = v9;
  int64_t v31 = a3;
  [v23 enumerateObjectsUsingBlock:v29];
  if ((unint64_t)[v9 count] > a3)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v10 = (id)qword_10002B118[0];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      id v11 = [v9 count];
      *(_DWORD *)buf = 134218240;
      id v34 = v11;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Batch samples size (%lu) is larger than the batch size (%lu)", buf, 0x16u);
    }
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  uint64_t v12 = (id)qword_10002B160;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v13 = [v9 count];
    *(_DWORD *)buf = 134217984;
    id v34 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Computing style prediction for %lu samples", buf, 0xCu);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v9;
  id v14 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        textSynthesizer = v8->_textSynthesizer;
        int64_t v20 = [v17 transcription];
        __int16 v21 = [v17 drawing];
        v22 = [(CHTextSynthesizer *)textSynthesizer stylePredictionResultForTranscription:v20 drawing:v21 shouldCancel:0];

        if (v22) {
          [v17 updateStyleEmbedding:v22];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v14);
  }

  [(CHSynthesisStyleInventory *)v8->_styleInventory updateStylePredictionsWithSamples:obj];
}

- (void)_asyncUpdateInventoryStylePredictions
{
  if (+[CHSynthesisStyleInventory isPersonalizedSynthesisModelReady])
  {
    double v3 = [(CHRemoteBasicRequestHandler *)self serverQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011E7C;
    block[3] = &unk_100024B10;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (BOOL)_shouldFreezeCharacterInventory
{
  if (!os_variant_has_internal_diagnostics()) {
    return 0;
  }
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  double v3 = [v2 dictionaryForKey:@"com.apple.corehandwriting"];

  CFStringRef v4 = [v3 objectForKey:@"kCHFreezeCharacterInventory"];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)_handleCharacterInventoryRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(CHRemoteSynthesisRequestHandler *)self _shouldFreezeCharacterInventory])
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v12 = (id)qword_10002B160;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: start _handleCharacterInventoryRequest", buf, 2u);
    }

    uint64_t v35 = 0;
    int64_t v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 0;
    id v13 = [(CHRemoteBasicRequestHandler *)self serverQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012614;
    block[3] = &unk_100024C98;
    block[4] = self;
    id v28 = v8;
    v29 = &v35;
    id v30 = &v31;
    dispatch_sync(v13, block);

    if (!*((unsigned char *)v36 + 24)) {
      goto LABEL_16;
    }
    if (qword_10002B188 == -1)
    {
      id v14 = (id)qword_10002B160;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:

        *(void *)buf = 0;
        v22 = buf;
        uint64_t v23 = 0x3032000000;
        v24 = sub_10000F8E8;
        long long v25 = sub_10000F8F8;
        id v26 = 0;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100012B14;
        v18[3] = &unk_100024CC0;
        v18[4] = self;
        int64_t v20 = buf;
        id v19 = v10;
        uint64_t v15 = objc_retainBlock(v18);
        [(CHFastPathCharacterPersonalizerInterface *)self->_fastPathCharacterPersonalizer runPersonalizationWithBlock:v15 resynthesizeAll:*((unsigned __int8 *)v32 + 24)];
        os_log_type_t v16 = [(CHRemoteBasicRequestHandler *)self serverQueue];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100012F00;
        v17[3] = &unk_100024B10;
        v17[4] = self;
        dispatch_async(v16, v17);

        _Block_object_dispose(buf, 8);
LABEL_16:
        (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);

        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_once(&qword_10002B188, &stru_100024A60);
      id v14 = (id)qword_10002B160;
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: starting shouldStartSynthesis block", buf, 2u);
    goto LABEL_15;
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v11 = (id)qword_10002B160;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: character inventory is frozen. Ignoring _handleCharacterInventoryRequest", buf, 2u);
  }

LABEL_17:
}

- (id)_createDebugViewOfInventory
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v25 = 0;
    id v26 = &v25;
    uint64_t v27 = 0x3032000000;
    id v28 = sub_10000F8E8;
    v29 = sub_10000F8F8;
    id v30 = 0;
    uint64_t v19 = 0;
    int64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_10000F8E8;
    uint64_t v23 = sub_10000F8F8;
    id v24 = +[NSMutableString string];
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0xBFF0000000000000;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100013268;
    v14[3] = &unk_100024CE8;
    v14[4] = v18;
    v14[5] = v16;
    v14[6] = v17;
    v14[7] = &v25;
    double v3 = objc_retainBlock(v14);
    CFStringRef v4 = [(CHRemoteBasicRequestHandler *)self serverQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013464;
    block[3] = &unk_100024D38;
    block[4] = self;
    unsigned __int8 v5 = v3;
    id v10 = v5;
    id v11 = v18;
    uint64_t v12 = v15;
    id v13 = &v19;
    dispatch_sync(v4, block);

    if (v26[5])
    {
      id v6 = objc_alloc((Class)CHSynthesisResult);
      id v7 = [v6 initWithContent:v20[5] drawing:v26[5]];
    }
    else
    {
      id v7 = 0;
    }

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)checkSegmentsAndDrawingConsistencyForSynthesisResult:(id)a3 bundleIdentifier:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 segmentStrokeIndexes];
  id v12 = [v11 count];
  id v13 = [v8 segmentContents];
  id v14 = [v13 count];

  if (v12 != v14)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v15 = (id)qword_10002B118[0];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "Number of segment stroke indexes not equal to segment contents length", buf, 2u);
    }
  }
  *(void *)buf = 0;
  id v30 = buf;
  uint64_t v31 = 0x3032000000;
  v32 = sub_10000F8E8;
  uint64_t v33 = sub_10000F8F8;
  id v34 = objc_alloc_init((Class)NSMutableArray);
  os_log_type_t v16 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013DA4;
  block[3] = &unk_100024DC8;
  id v22 = v8;
  uint64_t v23 = self;
  id v27 = v10;
  id v28 = buf;
  id v25 = (id)os_transaction_create();
  id v26 = &stru_100024D78;
  id v24 = v9;
  id v17 = v25;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  dispatch_async(v16, block);

  _Block_object_dispose(buf, 8);
}

- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  id v11 = [v8 options];
  id v12 = [v11 synthesizeCharacterInventoryBehavior];

  if (v12)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v13 = (id)qword_10002B160;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remote synthesis request will go through fast path synthesis", buf, 2u);
    }

    [(CHRemoteSynthesisRequestHandler *)self _handleCharacterInventoryRequest:v8 withReply:v9 bundleIdentifier:v10];
  }
  else
  {
    id v14 = [v8 options];
    unsigned int v15 = [v14 styleInventoryQuery];

    if (v15)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      os_log_type_t v16 = (id)qword_10002B160;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request triggered creation of style inventory debug view", buf, 2u);
      }

      id v17 = [(CHRemoteSynthesisRequestHandler *)self _createDebugViewOfInventory];
      v9[2](v9, v17, 0);
    }
    else
    {
      *(void *)buf = 0;
      id v28 = buf;
      uint64_t v29 = 0x3032000000;
      id v30 = sub_10000F8E8;
      uint64_t v31 = sub_10000F8F8;
      id v32 = 0;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3032000000;
      v25[3] = sub_10000F8E8;
      v25[4] = sub_10000F8F8;
      id v26 = 0;
      id v18 = [(CHRemoteBasicRequestHandler *)self serverQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10001486C;
      v19[3] = &unk_100024E18;
      v19[4] = self;
      id v20 = v8;
      id v21 = v10;
      id v22 = v9;
      uint64_t v23 = buf;
      id v24 = v25;
      dispatch_sync(v18, v19);

      _Block_object_dispose(v25, 8);
      _Block_object_dispose(buf, 8);
    }
  }
}

- (void)handleInventoryRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001567C;
  block[3] = &unk_100024E40;
  void block[4] = self;
  id v10 = v7;
  id v13 = v10;
  id v11 = v8;
  id v14 = v11;
  dispatch_async(v9, block);

  [(CHRemoteSynthesisRequestHandler *)self _asyncUpdateInventoryStylePredictions];
}

- (void)handleInventoryStatusRequestWithReply:(id)a3 bundleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015C20;
  v8[3] = &unk_1000249F0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (id)diffusionModelHash
{
  return +[CHTextSynthesizer diffusionModelHash];
}

- (void)optimizeResourceUsage
{
  [(CHRemoteSynthesisRequestHandler *)self stageEvictionOfTextSynthesizerWithTargetIdleLifetime:5.0];

  [(CHRemoteSynthesisRequestHandler *)self stageEvictionOfStyleInventoryWithTargetIdleLifetime:5.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognitionRequestHandler, 0);
  objc_storeStrong((id *)&self->_styleInventory, 0);
  objc_storeStrong((id *)&self->_fastPathCharacterPersonalizer, 0);

  objc_storeStrong((id *)&self->_textSynthesizer, 0);
}

@end