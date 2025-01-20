@interface RPTScrollViewTestParameters
+ (id)newWithTestName:(id)a3 scrollBounds:(CGRect)a4 amplitude:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7;
+ (id)newWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5;
- (BOOL)preventSheetDismissal;
- (BOOL)shouldFlick;
- (CAMediaTimingFunction)curveFunction;
- (CGRect)scrollingBounds;
- (NSString)testName;
- (RPTCoordinateSpaceConverter)conversion;
- (RPTScrollViewTestParameters)initWithTestName:(id)a3 scrollBounds:(CGRect)a4 scrollContentLength:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7;
- (RPTScrollViewTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5;
- (double)amplitudeFactor;
- (double)iterationDurationFactor;
- (double)scrollingContentLength;
- (id)_v1_composerBlock;
- (id)_v2_composerBlock;
- (id)_v3_4_composerBlock;
- (id)completionHandler;
- (id)composerBlock;
- (int64_t)direction;
- (unint64_t)effectiveVersion;
- (unint64_t)forceMaxVersion;
- (unint64_t)forceMinVersion;
- (void)_v3_4_composerBlock;
- (void)setAmplitudeFactor:(double)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConversion:(id)a3;
- (void)setCurveFunction:(id)a3;
- (void)setDirection:(int64_t)a3;
- (void)setForceMaxVersion:(unint64_t)a3;
- (void)setForceMinVersion:(unint64_t)a3;
- (void)setIterationDurationFactor:(double)a3;
- (void)setPreventSheetDismissal:(BOOL)a3;
- (void)setScrollingBounds:(CGRect)a3;
- (void)setScrollingContentLength:(double)a3;
- (void)setShouldFlick:(BOOL)a3;
- (void)setTestName:(id)a3;
- (void)waitForPostEventStreamDelayWithHandler:(id)a3;
@end

@implementation RPTScrollViewTestParameters

- (void)setConversion:(id)a3
{
}

- (void)setIterationDurationFactor:(double)a3
{
  self->_iterationDurationFactor = a3;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void)setTestName:(id)a3
{
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (NSString)testName
{
  return self->_testName;
}

- (int64_t)direction
{
  return self->_direction;
}

- (CGRect)scrollingBounds
{
  double x = self->_scrollingBounds.origin.x;
  double y = self->_scrollingBounds.origin.y;
  double width = self->_scrollingBounds.size.width;
  double height = self->_scrollingBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)iterationDurationFactor
{
  return self->_iterationDurationFactor;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_curveFunction, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)setScrollingContentLength:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  if (WeakRetained)
  {
    v6 = RPTLogTestRunning();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(RPTScrollViewTestParameters *)(uint64_t)self setScrollingContentLength:a3];
    }
  }
  self->_scrollingContentLength = a3;
}

- (void)setScrollingBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  if (WeakRetained)
  {
    v9 = RPTLogTestRunning();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[RPTScrollViewTestParameters setScrollingBounds:]((uint64_t)self, v9, x, y, width, height);
    }
  }
  self->_scrollingBounds.origin.CGFloat x = x;
  self->_scrollingBounds.origin.CGFloat y = y;
  self->_scrollingBounds.size.CGFloat width = width;
  self->_scrollingBounds.size.CGFloat height = height;
}

- (unint64_t)effectiveVersion
{
  if (_RPTScrollViewTestParametersDefaultVersion_onceToken != -1) {
    dispatch_once(&_RPTScrollViewTestParametersDefaultVersion_onceToken, &__block_literal_global_3);
  }
  unint64_t v3 = _RPTScrollViewTestParametersDefaultVersion_version;
  unint64_t forceMinVersion = self->_forceMinVersion;
  unint64_t forceMaxVersion = self->_forceMaxVersion;
  if (forceMinVersion <= _RPTScrollViewTestParametersDefaultVersion_version) {
    unint64_t v6 = _RPTScrollViewTestParametersDefaultVersion_version;
  }
  else {
    unint64_t v6 = self->_forceMinVersion;
  }
  if (forceMinVersion) {
    unint64_t v3 = v6;
  }
  if (forceMaxVersion >= v3) {
    unint64_t v7 = v3;
  }
  else {
    unint64_t v7 = self->_forceMaxVersion;
  }
  if (forceMaxVersion) {
    return v7;
  }
  else {
    return v3;
  }
}

+ (id)newWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = RPTDefaultScrollDirection(v8);
  double v11 = RPTContentSizeInDirection(v8, v10);
  double v12 = RPTGetBoundsForView(v8);
  id v16 = +[RPTScrollViewTestParameters newWithTestName:scrollBounds:amplitude:direction:completionHandler:](RPTScrollViewTestParameters, "newWithTestName:scrollBounds:amplitude:direction:completionHandler:", v9, _UIScrollDirectionFromRPTScrollDirection(v10), v7, v12, v13, v14, v15, v11);

  v17 = [v8 window];

  v18 = +[RPTCoordinateSpaceConverter converterFromWindow:v17];
  [v16 setConversion:v18];

  return v16;
}

+ (id)newWithTestName:(id)a3 scrollBounds:(CGRect)a4 amplitude:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v14 = a7;
  id v15 = a3;
  id v16 = objc_opt_new();
  [v16 setTestName:v15];

  objc_msgSend(v16, "setScrollingBounds:", x, y, width, height);
  [v16 setAmplitude:a5];
  [v16 setAmplitudeFactor:1.0];
  [v16 setDirection:a6];
  [v16 setCompletionHandler:v14];

  v17 = [MEMORY[0x1E4F28F80] processInfo];
  int v18 = [v17 isiOSAppOnMac];

  if (v18)
  {
    [v16 setPreventSheetDismissal:0];
    [v16 setShouldFlick:0];
  }
  [v16 setIterationDurationFactor:1.0];
  v19 = +[RPTCoordinateSpaceConverter identityConverter];
  [v16 setConversion:v19];

  return v16;
}

- (RPTScrollViewTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = RPTLogTestRunning();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v12 = @"YES";
    *(_DWORD *)v20 = 138543874;
    *(void *)&v20[4] = v8;
    *(_WORD *)&v20[12] = 2114;
    if (!v10) {
      double v12 = @"NULL";
    }
    *(void *)&v20[14] = v9;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B626C000, v11, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTScrollViewTestParameters initWithTestName: %{public}@ scrollView: %{public}@ completionHandler: %{public}@]", v20, 0x20u);
  }

  uint64_t v13 = RPTDefaultScrollDirection(v9);
  RPTContentSizeInDirection(v9, v13);
  id v14 = -[RPTScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](self, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v8, v13, v10, RPTGetBoundsForView(v9));
  id v15 = [v9 window];
  id v16 = +[RPTCoordinateSpaceConverter converterFromWindow:v15];

  [(RPTScrollViewTestParameters *)v14 setConversion:v16];
  objc_storeWeak((id *)&v14->_scrollView, v9);
  if ([(RPTScrollViewTestParameters *)v14 effectiveVersion] > 2
    || [(RPTScrollViewTestParameters *)v14 effectiveVersion] >= 2)
  {
    -[RPTScrollViewTestParameters setShouldFlick:](v14, "setShouldFlick:", 1, *(_OWORD *)v20);
  }
  v17 = RPTLogTestRunning();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v18 = [(RPTScrollViewTestParameters *)v14 shouldFlick];
    *(_DWORD *)v20 = 67109120;
    *(_DWORD *)&v20[4] = v18;
    _os_log_impl(&dword_1B626C000, v17, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters shouldFlick: %{BOOL}u", v20, 8u);
  }

  return v14;
}

- (RPTScrollViewTestParameters)initWithTestName:(id)a3 scrollBounds:(CGRect)a4 scrollContentLength:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  v17 = RPTLogTestRunning();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v43.origin.double x = x;
    v43.origin.double y = y;
    v43.size.double width = width;
    v43.size.double height = height;
    uint64_t v18 = _RPTStringFromCGRect(v43);
    v19 = (void *)v18;
    *(_DWORD *)v35 = 138544386;
    v20 = @"YES";
    *(void *)&v35[4] = v15;
    *(_WORD *)&v35[12] = 2114;
    if (!v16) {
      v20 = @"NULL";
    }
    *(void *)&v35[14] = v18;
    __int16 v36 = 2048;
    double v37 = a5;
    __int16 v38 = 2050;
    int64_t v39 = a6;
    __int16 v40 = 2114;
    v41 = v20;
    _os_log_impl(&dword_1B626C000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTScrollViewTestParameters initWithTestName: %{public}@ scrollBounds: %{public}@ scrollContentLength: %f direction: %{public}ld completionHandler: %{public}@]", v35, 0x34u);
  }
  BOOL v21 = _RPTAxisFromScrollDirection(a6);
  if (RPTSizeAlongAxis(v21, width, height) * 2.5 > a5)
  {
    v22 = RPTLogTestRunning();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RPTScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](v22, x, y, width, height, a5);
    }
  }
  uint64_t v23 = [(RPTScrollViewTestParameters *)self init];
  if (v23)
  {
    uint64_t v24 = [v15 copy];
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_scrollingBounds.origin.double x = x;
    v23->_scrollingBounds.origin.double y = y;
    v23->_scrollingBounds.size.double width = width;
    v23->_scrollingBounds.size.double height = height;
    v23->_scrollingContentLength = a5;
    v23->_amplitudeFactor = 1.0;
    v23->_direction = _UIScrollDirectionFromRPTScrollDirection(a6);
    uint64_t v26 = MEMORY[0x1BA9B23F0](v16);
    id completionHandler = v23->_completionHandler;
    v23->_id completionHandler = (id)v26;

    v23->_iterationDurationFactor = 1.0;
    v23->_shouldFlick = 0;
    if ([(RPTScrollViewTestParameters *)v23 effectiveVersion] >= 3)
    {
      uint64_t v28 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
      curveFunction = v23->_curveFunction;
      v23->_curveFunction = (CAMediaTimingFunction *)v28;
    }
    v23->_preventSheetDismissal = 0;
    uint64_t v30 = +[RPTCoordinateSpaceConverter identityConverter];
    conversion = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v30;
  }
  v32 = RPTLogTestRunning();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [(RPTScrollViewTestParameters *)v23 curveFunction];
    *(_DWORD *)v35 = 138543362;
    *(void *)&v35[4] = v33;
    _os_log_impl(&dword_1B626C000, v32, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters curveFunction: %{public}@", v35, 0xCu);
  }
  return v23;
}

- (id)composerBlock
{
  unint64_t v3 = [(RPTScrollViewTestParameters *)self effectiveVersion];
  if (v3 - 3 < 2)
  {
    v4 = [(RPTScrollViewTestParameters *)self _v3_4_composerBlock];
  }
  else if (v3 == 2)
  {
    v4 = [(RPTScrollViewTestParameters *)self _v2_composerBlock];
  }
  else if (v3 == 1)
  {
    v4 = [(RPTScrollViewTestParameters *)self _v1_composerBlock];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unknown RPTScrollViewTestParametersForceVersion specified: %ld", v3);
    v4 = 0;
  }
  return v4;
}

- (void)waitForPostEventStreamDelayWithHandler:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  if ([(RPTScrollViewTestParameters *)self effectiveVersion] < 3) {
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  if (WeakRetained)
  {
    unint64_t v6 = RPTLogTestRunning();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = objc_loadWeakRetained((id *)&self->_scrollView);
      v27.double x = RPTContentOffsetOf();
      id v8 = _RPTStringFromCGPoint(v27);
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B626C000, v6, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters ScrollView offset end: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (self->_shouldFlick
    && (id v9 = objc_loadWeakRetained((id *)&self->_scrollView), v9, v9)
    && (id v10 = objc_loadWeakRetained((id *)&self->_scrollView),
        int v11 = [v10 isDecelerating],
        v10,
        v11))
  {
    uint64_t v12 = *MEMORY[0x1E4F44150];
    uint64_t v13 = RPTLogTestRunning();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B626C000, v13, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters ScrollView is decelerating", (uint8_t *)&buf, 2u);
    }

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy_;
    uint64_t v24 = __Block_byref_object_dispose_;
    id v25 = 0;
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v15 = objc_loadWeakRetained((id *)&self->_scrollView);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__RPTScrollViewTestParameters_waitForPostEventStreamDelayWithHandler___block_invoke;
    v18[3] = &unk_1E613E020;
    p_long long buf = &buf;
    v18[4] = self;
    v19 = v4;
    uint64_t v16 = [v14 addObserverForName:v12 object:v15 queue:0 usingBlock:v18];
    v17 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v16;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
LABEL_12:
    v4[2](v4);
  }
}

void __70__RPTScrollViewTestParameters_waitForPostEventStreamDelayWithHandler___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(a1[6] + 8) + 40)];

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  v5 = RPTLogTestRunning();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    v11.double x = RPTContentOffsetOf();
    id v7 = _RPTStringFromCGPoint(v11);
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_1B626C000, v5, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters ScrollView offset at complete end: %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)_v3_4_composerBlock
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = RPTLogTestRunning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B626C000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters v3 composerBlock", (uint8_t *)&buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  if (WeakRetained)
  {
    v5 = RPTLogTestRunning();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      [(RPTScrollViewTestParameters *)(id *)&self->_scrollView _v3_4_composerBlock];
    }
  }
  BOOL v6 = RPTAxisFromScrollDirection([(RPTScrollViewTestParameters *)self direction]);
  [(RPTScrollViewTestParameters *)self scrollingBounds];
  if (v6) {
    double v9 = v7;
  }
  else {
    double v9 = v8;
  }
  uint64_t v10 = RPTLogTestRunning();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1B626C000, v10, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters pageLength %f", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v11 = 0;
  long long v64 = xmmword_1B627D4F0;
  unint64_t v65 = 0xBF0000003F000000;
  *(void *)&long long buf = 0x4046000000000000;
  *((void *)&buf + 1) = floor(v9 * 0.4);
  double v60 = floor(v9 * 0.8);
  double v61 = v60;
  double v62 = v60;
  uint64_t v63 = *((void *)&buf + 1);
  v58[0] = xmmword_1B627D4C0;
  v58[1] = xmmword_1B627D4D0;
  v58[2] = xmmword_1B627D4E0;
  if (self->_shouldFlick) {
    uint64_t v12 = 6;
  }
  else {
    uint64_t v12 = 5;
  }
  double v13 = 0.0;
  double v14 = 0.0;
  do
  {
    double v15 = *((double *)&buf + v11);
    double v16 = v14 + v15;
    if (v16 >= v13) {
      double v13 = v16;
    }
    if (*((float *)&v64 + v11) != (float)(int)*((float *)&v64 + v11)) {
      double v15 = 0.0;
    }
    double v14 = v16 - v15;
    ++v11;
  }
  while (v12 != v11);
  [(RPTScrollViewTestParameters *)self scrollingContentLength];
  double v18 = v17 - v9;
  if (v9 * 0.3 >= v18) {
    double v19 = v9 * 0.3;
  }
  else {
    double v19 = v18;
  }
  if (v19 < v13)
  {
    double v20 = v19 / v13;
    BOOL v21 = RPTLogTestRunning();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v56 = 134217984;
      double v57 = v20;
      _os_log_impl(&dword_1B626C000, v21, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters capOffset scale %f", v56, 0xCu);
    }

    uint64_t v22 = (double *)v58 + 1;
    uint64_t v23 = (double *)&buf + 1;
    uint64_t v24 = v12 - 1;
    do
    {
      *uint64_t v23 = floor(v20 * *v23);
      ++v23;
      double *v22 = (1.0 - (1.0 - v20) * (1.0 - v20)) * *v22;
      ++v22;
      --v24;
    }
    while (v24);
  }
  id v25 = RPTLogTestRunning();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v56 = 134217984;
    double v57 = v19;
    _os_log_impl(&dword_1B626C000, v25, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters capOffset %f", v56, 0xCu);
  }

  v55 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != v12; ++i)
  {
    float v27 = *((float *)&v64 + i);
    if (v27 != 0.0 && (i != 5 || self->_shouldFlick))
    {
      double v28 = *((double *)&buf + i);
      double v29 = *((double *)v58 + i);
      uint64_t v30 = _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]);
      uint64_t v31 = v30;
      if (v27 < 0.0)
      {
        uint64_t v31 = RPTOppositeDirectionFrom(v30);
        float v27 = -v27;
        *((float *)&v64 + i) = v27;
      }
      v32 = [RPTOscillationScrollTestParameters alloc];
      v33 = [(RPTScrollViewTestParameters *)self testName];
      [(RPTScrollViewTestParameters *)self scrollingBounds];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      if (i) {
        BOOL preventSheetDismissal = 0;
      }
      else {
        BOOL preventSheetDismissal = self->_preventSheetDismissal;
      }
      uint64_t v43 = (int)v27;
      BOOL v44 = v27 != (float)(int)v27;
      [(RPTScrollViewTestParameters *)self _effectiveAmplitudeFactor];
      double v46 = v28 * v45;
      [(RPTScrollViewTestParameters *)self iterationDurationFactor];
      v48 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v32, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v33, v43, i == 5, preventSheetDismissal, v31, v44, v35, v37, v39, v41, v46, 0.0, v28 / v29 * v47);

      v49 = [(RPTScrollViewTestParameters *)self conversion];
      [(RPTOscillationScrollTestParameters *)v48 setConversion:v49];

      [(RPTOscillationScrollTestParameters *)v48 setUseDefaultDurationForFlick:0.0];
      if (i == 5)
      {
        v50 = [(CAMediaTimingFunction *)self->_curveFunction rcp_functionWithLinearEnd];
        [(RPTOscillationScrollTestParameters *)v48 setCurveFunction:v50];
      }
      else
      {
        [(RPTOscillationScrollTestParameters *)v48 setCurveFunction:self->_curveFunction];
      }
      [v55 addObject:v48];
    }
  }
  v51 = [(RPTScrollViewTestParameters *)self testName];
  id v52 = +[RPTGroupScrollTestParameters newWithTestName:v51 parameters:v55 completionHandler:0];

  v53 = [v52 composerBlock];

  return v53;
}

- (id)_v2_composerBlock
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = RPTLogTestRunning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B626C000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters v2 composerBlock", buf, 2u);
  }

  BOOL v4 = RPTAxisFromScrollDirection([(RPTScrollViewTestParameters *)self direction]);
  [(RPTScrollViewTestParameters *)self scrollingBounds];
  if (v4) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  *(void *)long long buf = 0x4046000000000000;
  double v8 = floor(v7 * 0.8);
  double v75 = floor(v7 * 0.4);
  double v76 = v8;
  [(RPTScrollViewTestParameters *)self scrollingContentLength];
  double v10 = v9 - v7;
  if (v7 * 0.3 >= v10) {
    double v10 = v7 * 0.3;
  }
  if (v10 < v8)
  {
    uint64_t v11 = 0;
    double v12 = v10 / v8;
    do
    {
      *(double *)&buf[v11] = v12 * *(double *)&buf[v11];
      v11 += 8;
    }
    while (v11 != 24);
  }
  uint64_t v13 = 0;
  double v14 = (void *)MEMORY[0x1E4F1CBF0];
  do
  {
    double v15 = v14;
    double v16 = [RPTOscillationScrollTestParameters alloc];
    double v17 = [(RPTScrollViewTestParameters *)self testName];
    uint64_t v18 = qword_1B627D508[v13];
    [(RPTScrollViewTestParameters *)self scrollingBounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    BOOL preventSheetDismissal = self->_preventSheetDismissal;
    double v28 = *(double *)&buf[v13 * 8];
    [(RPTScrollViewTestParameters *)self _effectiveAmplitudeFactor];
    double v30 = v28 * v29;
    [(RPTScrollViewTestParameters *)self _effectiveAmplitudeFactor];
    double v32 = v28 * v31 * -0.2;
    uint64_t v33 = _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]);
    double v34 = *(double *)&qword_1B627D520[v13];
    [(RPTScrollViewTestParameters *)self iterationDurationFactor];
    double v36 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v16, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v17, v18, 0, preventSheetDismissal, v33, 1, v20, v22, v24, v26, v30, v32, v34 * v35);
    double v14 = [v15 arrayByAddingObject:v36];

    ++v13;
  }
  while (v13 != 3);
  if (self->_shouldFlick)
  {
    double v37 = [RPTOscillationScrollTestParameters alloc];
    double v38 = [(RPTScrollViewTestParameters *)self testName];
    [(RPTScrollViewTestParameters *)self scrollingBounds];
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    BOOL v47 = self->_preventSheetDismissal;
    double v48 = v75;
    [(RPTScrollViewTestParameters *)self _effectiveAmplitudeFactor];
    double v50 = v48 * v49;
    uint64_t v51 = _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]);
    uint64_t v52 = RPTOppositeDirectionFrom(v51);
    [(RPTScrollViewTestParameters *)self iterationDurationFactor];
    v54 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v37, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v38, 2, 1, v47, v52, 1, v40, v42, v44, v46, v50, 0.0, v53 * 1.875);
    v73 = v54;
    v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
    uint64_t v56 = [v14 arrayByAddingObjectsFromArray:v55];

    double v14 = (void *)v56;
  }
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v57 = v14;
  uint64_t v58 = [v57 countByEnumeratingWithState:&v68 objects:v72 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v69 != v60) {
          objc_enumerationMutation(v57);
        }
        double v62 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        uint64_t v63 = [(RPTScrollViewTestParameters *)self conversion];
        [v62 setConversion:v63];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v68 objects:v72 count:16];
    }
    while (v59);
  }

  long long v64 = [(RPTScrollViewTestParameters *)self testName];
  id v65 = +[RPTGroupScrollTestParameters newWithTestName:v64 parameters:v57 completionHandler:0];

  uint64_t v66 = [v65 composerBlock];

  return v66;
}

- (id)_v1_composerBlock
{
  v102[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = RPTLogTestRunning();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1B626C000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters v1 composerBlock", buf, 2u);
  }

  BOOL v4 = RPTAxisFromScrollDirection([(RPTScrollViewTestParameters *)self direction]);
  [(RPTScrollViewTestParameters *)self scrollingBounds];
  if (v4) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  [(RPTScrollViewTestParameters *)self scrollingContentLength];
  double v9 = floor(v8 / v7);
  [(RPTScrollViewTestParameters *)self scrollingContentLength];
  if (v7 >= v10) {
    double v7 = v10;
  }
  double v11 = v7 / 10.0;
  [(RPTScrollViewTestParameters *)self iterationDurationFactor];
  double v13 = v12 * 0.3125;
  double v14 = [RPTOscillationScrollTestParameters alloc];
  double v15 = [(RPTScrollViewTestParameters *)self testName];
  [(RPTScrollViewTestParameters *)self scrollingBounds];
  double v20 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v14, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v15, 6, 0, self->_preventSheetDismissal, _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]), 0, v16, v17, v18, v19, v7 / 10.0);
  v102[0] = v20;
  double v21 = [RPTOscillationScrollTestParameters alloc];
  double v22 = [(RPTScrollViewTestParameters *)self testName];
  [(RPTScrollViewTestParameters *)self scrollingBounds];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  BOOL preventSheetDismissal = self->_preventSheetDismissal;
  uint64_t v32 = _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]);
  [(RPTScrollViewTestParameters *)self iterationDurationFactor];
  double v34 = v26;
  double v35 = v7;
  double v36 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v21, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v22, 3, 0, preventSheetDismissal, v32, 1, v24, v34, v28, v30, v7, 0.0, v33 * 1.25);
  v102[1] = v36;
  double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:2];

  if (v9 <= 1.0)
  {
    long long v64 = v37;
  }
  else
  {
    double v38 = 1.0;
    double v93 = v11;
    do
    {
      double v39 = [RPTOscillationScrollTestParameters alloc];
      double v40 = [(RPTScrollViewTestParameters *)self testName];
      [(RPTScrollViewTestParameters *)self scrollingBounds];
      double v41 = v9;
      double v42 = v35;
      BOOL v47 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v39, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v40, 6, 0, self->_preventSheetDismissal, _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]), 0, v43, v44, v45, v46, v93, 0.015, v13);
      v101[0] = v47;
      double v48 = [RPTOscillationScrollTestParameters alloc];
      double v49 = [(RPTScrollViewTestParameters *)self testName];
      [(RPTScrollViewTestParameters *)self scrollingBounds];
      double v51 = v50;
      double v53 = v52;
      double v55 = v54;
      double v57 = v56;
      BOOL v58 = self->_preventSheetDismissal;
      uint64_t v59 = _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]);
      [(RPTScrollViewTestParameters *)self iterationDurationFactor];
      double v61 = v53;
      double v35 = v42;
      double v9 = v41;
      double v62 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v48, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v49, 3, 0, v58, v59, 1, v51, v61, v55, v57, v35, 0.0, v60 * 1.25);
      v101[1] = v62;
      uint64_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v101 count:2];
      long long v64 = [v37 arrayByAddingObjectsFromArray:v63];

      double v38 = v38 + 1.0;
      double v37 = v64;
    }
    while (v38 < v41);
  }
  if (self->_shouldFlick)
  {
    id v65 = [RPTOscillationScrollTestParameters alloc];
    uint64_t v66 = [(RPTScrollViewTestParameters *)self testName];
    [(RPTScrollViewTestParameters *)self scrollingBounds];
    double v68 = v67;
    double v70 = v69;
    double v72 = v71;
    double v74 = v73;
    BOOL v75 = self->_preventSheetDismissal;
    uint64_t v76 = _RPTScrollDirectionFromUIScrollDirection([(RPTScrollViewTestParameters *)self direction]);
    uint64_t v77 = RPTOppositeDirectionFrom(v76);
    [(RPTScrollViewTestParameters *)self iterationDurationFactor];
    v79 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v65, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v66, 6, 1, v75, v77, 1, v68, v70, v72, v74, v35, 0.0, v78 * 1.875);
    v100 = v79;
    v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
    uint64_t v81 = [v64 arrayByAddingObjectsFromArray:v80];

    long long v64 = (void *)v81;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  id v82 = v64;
  uint64_t v83 = [v82 countByEnumeratingWithState:&v94 objects:v99 count:16];
  if (v83)
  {
    uint64_t v84 = v83;
    uint64_t v85 = *(void *)v95;
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v95 != v85) {
          objc_enumerationMutation(v82);
        }
        v87 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        v88 = [(RPTScrollViewTestParameters *)self conversion];
        [v87 setConversion:v88];
      }
      uint64_t v84 = [v82 countByEnumeratingWithState:&v94 objects:v99 count:16];
    }
    while (v84);
  }

  v89 = [(RPTScrollViewTestParameters *)self testName];
  id v90 = +[RPTGroupScrollTestParameters newWithTestName:v89 parameters:v82 completionHandler:0];

  v91 = [v90 composerBlock];

  return v91;
}

- (CAMediaTimingFunction)curveFunction
{
  return self->_curveFunction;
}

- (void)setCurveFunction:(id)a3
{
}

- (unint64_t)forceMinVersion
{
  return self->_forceMinVersion;
}

- (void)setForceMinVersion:(unint64_t)a3
{
  self->_unint64_t forceMinVersion = a3;
}

- (unint64_t)forceMaxVersion
{
  return self->_forceMaxVersion;
}

- (void)setForceMaxVersion:(unint64_t)a3
{
  self->_unint64_t forceMaxVersion = a3;
}

- (double)scrollingContentLength
{
  return self->_scrollingContentLength;
}

- (double)amplitudeFactor
{
  return self->_amplitudeFactor;
}

- (void)setAmplitudeFactor:(double)a3
{
  self->_amplitudeFactor = a3;
}

- (BOOL)preventSheetDismissal
{
  return self->_preventSheetDismissal;
}

- (void)setPreventSheetDismissal:(BOOL)a3
{
  self->_BOOL preventSheetDismissal = a3;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (void)setScrollingContentLength:(double)a3 .cold.1(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_debug_impl(&dword_1B626C000, a2, OS_LOG_TYPE_DEBUG, "Overriding default amplitude %.1f pts with %.1f pts. This may have undefined behaviour and should be avoided, when target scroll view is known.", (uint8_t *)&v4, 0x16u);
}

- (void)setScrollingBounds:(CGFloat)a3 .cold.1(uint64_t a1, NSObject *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v11 = _RPTStringFromCGRect(*(CGRect *)(a1 + 104));
  v18.origin.double x = a3;
  v18.origin.double y = a4;
  v18.size.double width = a5;
  v18.size.double height = a6;
  double v12 = _RPTStringFromCGRect(v18);
  int v13 = 138412546;
  double v14 = v11;
  __int16 v15 = 2112;
  double v16 = v12;
  _os_log_debug_impl(&dword_1B626C000, a2, OS_LOG_TYPE_DEBUG, "Overriding default amplitude %@ pts with %@ pts. This may have undefined behaviour and should be avoided, when target scroll view is known.", (uint8_t *)&v13, 0x16u);
}

- (void)initWithTestName:(double)a3 scrollBounds:(double)a4 scrollContentLength:(double)a5 direction:(double)a6 completionHandler:.cold.1(NSObject *a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = _RPTStringFromCGRect(*(CGRect *)&a2);
  int v9 = 134218242;
  double v10 = a6;
  __int16 v11 = 2114;
  double v12 = v8;
  _os_log_error_impl(&dword_1B626C000, a1, OS_LOG_TYPE_ERROR, "RPT: RPTScrollViewTestParameters scrollContentLength: %f too short for scrollBounds %{public}@ for a meaningful test.", (uint8_t *)&v9, 0x16u);
}

- (void)_v3_4_composerBlock
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1);
  v8.double x = RPTContentOffsetOf();
  int v4 = _RPTStringFromCGPoint(v8);
  int v5 = 138543362;
  __int16 v6 = v4;
  _os_log_debug_impl(&dword_1B626C000, a2, OS_LOG_TYPE_DEBUG, "RPT: RPTScrollViewTestParameters ScrollView offset start: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end