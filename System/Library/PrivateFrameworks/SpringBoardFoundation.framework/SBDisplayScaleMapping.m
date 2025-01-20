@interface SBDisplayScaleMapping
+ (id)withDisplay:(id)a3 useNativeSize:(BOOL)a4;
- (CGSize)referenceSize;
- (NSString)displayHardwareIdentifier;
- (SBDisplayScaleMapping)initWithDisplayHardwareIdentifier:(id)a3 nativePPI:(double)a4 referenceSize:(CGSize)a5 scaleMethod:(unint64_t)a6 supportedScales:(unint64_t)a7 displayScaleToLogicalScale:(id)a8;
- (double)logicalScaleForDisplayScale:(unint64_t)a3;
- (double)ppiForDisplayScale:(unint64_t)a3;
- (id)createDefaultSettings;
- (id)description;
- (unint64_t)_defaultScale;
- (unint64_t)supportedScales;
@end

@implementation SBDisplayScaleMapping

- (SBDisplayScaleMapping)initWithDisplayHardwareIdentifier:(id)a3 nativePPI:(double)a4 referenceSize:(CGSize)a5 scaleMethod:(unint64_t)a6 supportedScales:(unint64_t)a7 displayScaleToLogicalScale:(id)a8
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v15 = a3;
  id v16 = a8;
  v21.receiver = self;
  v21.super_class = (Class)SBDisplayScaleMapping;
  v17 = [(SBDisplayScaleMapping *)&v21 init];
  if (v17)
  {
    uint64_t v18 = [v15 copy];
    displayHardwareIdentifier = v17->_displayHardwareIdentifier;
    v17->_displayHardwareIdentifier = (NSString *)v18;

    v17->_nativePPI = a4;
    v17->_referenceSize.CGFloat width = width;
    v17->_referenceSize.CGFloat height = height;
    v17->_scaleMethod = a6;
    v17->_supportedScales = a7;
    objc_storeStrong((id *)&v17->_displayScaleToLogicalScale, a8);
  }

  return v17;
}

+ (id)withDisplay:(id)a3 useNativeSize:(BOOL)a4
{
  BOOL v4 = a4;
  v161[1] = *MEMORY[0x1E4F143B8];
  id v123 = a3;
  v5 = [v123 CADisplay];
  v125 = (void *)[v5 immutableCopy];

  v128 = [v123 hardwareIdentifier];
  v6 = [SBDisplayScaleMapping alloc];
  double v119 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v120 = *MEMORY[0x1E4F1DB30];
  v121 = -[SBDisplayScaleMapping initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:](v6, "initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:", v128, 0, 0, 0, 0.0);
  v7 = +[_SBDisplayScaleMappingCache sharedInstance];
  v122 = [v7 mappingForDisplayIdentifier:v128];

  if (v122)
  {
    v8 = v122;
    goto LABEL_101;
  }
  if (!v128)
  {
    v8 = v121;
    goto LABEL_99;
  }
  if ([v125 displayType] == 2)
  {
    v9 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v125;
      _os_log_impl(&dword_18B52E000, v9, OS_LOG_TYPE_DEFAULT, "YOU CAN'T JUST ENABLE AIRPLAY DISPLAYS. YOU WILL REGRET THIS! %{public}@", buf, 0xCu);
    }

    v160 = &unk_1ED89E938;
    v161[0] = &unk_1ED89F118;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v161 forKeys:&v160 count:1];
    id v11 = objc_alloc_init(MEMORY[0x1E4F39B78]);
    v12 = [v125 preferredModeWithCriteria:v11];

    v8 = -[SBDisplayScaleMapping initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:]([SBDisplayScaleMapping alloc], "initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:", v128, 0, 2, v10, 0.0, (double)(unint64_t)[v12 width], (double)(unint64_t)objc_msgSend(v12, "height"));
    goto LABEL_99;
  }
  [v125 nativeSize];
  double v14 = v13;
  double v16 = v15;
  id v17 = objc_alloc_init(MEMORY[0x1E4F39B78]);
  id v18 = v17;
  v115 = v17;
  if (v4)
  {
    objc_msgSend(v17, "setResolution:", v14, v16);
    id v18 = v115;
  }
  v118 = [v125 preferredModeWithCriteria:v18];
  v117 = [v125 currentMode];
  [v125 physicalSize];
  CGFloat v20 = v19;
  double v116 = v21;
  double v22 = (double)(unint64_t)[(__CFString *)v118 width];
  double v23 = (double)(unint64_t)[(__CFString *)v118 height];
  if (v14 != v22 || v16 != v23)
  {
    v25 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = _SBFLoggingMethodProem(a1, 1);
      v162.CGFloat width = v22;
      v162.CGFloat height = v23;
      NSStringFromCGSize(v162);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v163.CGFloat width = v14;
      v163.CGFloat height = v16;
      v28 = NSStringFromCGSize(v163);
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v128;
      *(_WORD *)&buf[22] = 2114;
      v154 = v27;
      __int16 v155 = 2114;
      *(void *)v156 = v28;
      _os_log_impl(&dword_18B52E000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ CADisplay returned referencePixelSize of %{public}@ while the nativeSize is %{public}@", buf, 0x2Au);
    }
  }
  if (v23 <= v22) {
    double v29 = v23;
  }
  else {
    double v29 = v22;
  }
  double size = v29;
  if (v23 > v22) {
    double v22 = v23;
  }
  v30 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = _SBFLoggingMethodProem(a1, 1);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v31;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    _os_log_impl(&dword_18B52E000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ about to calculate available logicalScales. dumping display mode info:", buf, 0x16u);
  }
  long long v139 = 0u;
  long long v140 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v32 = [v125 availableModes];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v137 objects:v159 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v138;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v138 != v34) {
          objc_enumerationMutation(v32);
        }
        v36 = *(__CFString **)(*((void *)&v137 + 1) + 8 * i);
        v37 = SBLogDisplayScaleMapping();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = _SBFLoggingMethodProem(a1, 1);
          int v39 = [(__CFString *)v36 isHighBandwidth];
          [(__CFString *)v36 refreshRate];
          uint64_t v41 = v40;
          int v42 = [(__CFString *)v36 isVirtual];
          *(_DWORD *)buf = 138544642;
          *(void *)&buf[4] = v38;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v128;
          *(_WORD *)&buf[22] = 2114;
          v154 = v36;
          __int16 v155 = 1024;
          *(_DWORD *)v156 = v39;
          *(_WORD *)&v156[4] = 2048;
          *(void *)&v156[6] = v41;
          __int16 v157 = 1024;
          int v158 = v42;
          _os_log_impl(&dword_18B52E000, v37, OS_LOG_TYPE_INFO, "[%{public}@] %{public}@ %{public}@ highBandwidth: %{BOOL}u refreshRate: %.2g virtual: %{BOOL}u", buf, 0x36u);
        }
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v137 objects:v159 count:16];
    }
    while (v33);
  }

  v43 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = _SBFLoggingMethodProem(a1, 1);
    int v45 = [(__CFString *)v118 isHighBandwidth];
    [(__CFString *)v118 refreshRate];
    uint64_t v47 = v46;
    int v48 = [(__CFString *)v118 isVirtual];
    *(_DWORD *)buf = 138544642;
    *(void *)&buf[4] = v44;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2114;
    v154 = v118;
    __int16 v155 = 1024;
    *(_DWORD *)v156 = v45;
    *(_WORD *)&v156[4] = 2048;
    *(void *)&v156[6] = v47;
    __int16 v157 = 1024;
    int v158 = v48;
    _os_log_impl(&dword_18B52E000, v43, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ preferredMode: %{public}@ highBandwidth: %{BOOL}u refreshRate: %.2g virtual: %{BOOL}u", buf, 0x36u);
  }
  v49 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v50 = _SBFLoggingMethodProem(a1, 1);
    int v51 = [(__CFString *)v117 isHighBandwidth];
    [(__CFString *)v117 refreshRate];
    uint64_t v53 = v52;
    int v54 = [(__CFString *)v117 isVirtual];
    *(_DWORD *)buf = 138544642;
    *(void *)&buf[4] = v50;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2114;
    v154 = v117;
    __int16 v155 = 1024;
    *(_DWORD *)v156 = v51;
    *(_WORD *)&v156[4] = 2048;
    *(void *)&v156[6] = v53;
    __int16 v157 = 1024;
    int v158 = v54;
    _os_log_impl(&dword_18B52E000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ currentMode: %{public}@ highBandwidth: %{BOOL}u refreshRate: %.2g virtual: %{BOOL}u", buf, 0x36u);
  }
  v55 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = _SBFLoggingMethodProem(a1, 1);
    v164.CGFloat width = v14;
    v164.CGFloat height = v16;
    NSStringFromCGSize(v164);
    v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2114;
    v154 = v57;
    _os_log_impl(&dword_18B52E000, v55, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ nativeSize: %{public}@", buf, 0x20u);
  }
  v58 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    v59 = _SBFLoggingMethodProem(a1, 1);
    v165.CGFloat width = v22;
    v165.CGFloat height = size;
    NSStringFromCGSize(v165);
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v59;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2114;
    v154 = v60;
    _os_log_impl(&dword_18B52E000, v58, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ referenceSize (from preferred): %{public}@", buf, 0x20u);
  }
  v61 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = _SBFLoggingMethodProem(a1, 1);
    v166.CGFloat width = v20;
    v166.CGFloat height = v116;
    NSStringFromCGSize(v166);
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v62;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2114;
    v154 = v63;
    _os_log_impl(&dword_18B52E000, v61, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ physicalSize: %{public}@", buf, 0x20u);
  }
  v64 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = _SBFLoggingMethodProem(a1, 1);
    [v125 minimumLogicalScale];
    v67 = v66;
    [v125 maximumLogicalScale];
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v65;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2048;
    v154 = v67;
    __int16 v155 = 2048;
    *(void *)v156 = v68;
    _os_log_impl(&dword_18B52E000, v64, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ logicalScale bounds: {%.3f, %.3f}", buf, 0x2Au);
  }
  v69 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:3];
  uint64_t v70 = 0;
  if (3840.0 / v22 >= 2160.0 / size) {
    double v71 = 3840.0 / v22;
  }
  else {
    double v71 = 2160.0 / size;
  }
  uint64_t v72 = 2;
  do
  {
    if (v70)
    {
      if (v70 == 1)
      {
        double v74 = 5120.0;
        double v73 = 2880.0;
      }
      else if (v70 == 2)
      {
        double v73 = 3384.0;
        double v74 = 6016.0;
      }
      else
      {
        v80 = [MEMORY[0x1E4F28B00] currentHandler];
        v81 = [NSString stringWithUTF8String:"CGSize SBSizeForResolution(SBDisplayResolution)"];
        [v80 handleFailureInFunction:v81 file:@"SBDisplayScaleMapping.m" lineNumber:68 description:@"invalid resolution"];

        double v73 = v119;
        double v74 = v120;
      }
      if (v72 != 2)
      {
        double v77 = v74 / v22;
        double v76 = v73 / size;
LABEL_60:
        if (v77 <= v76) {
          double v82 = v77;
        }
        else {
          double v82 = v76;
        }
        uint64_t v72 = 1;
        goto LABEL_69;
      }
      double v79 = v74 / v22;
      double v78 = v73 / size;
    }
    else
    {
      char v75 = SBValidateLogicalScale(v125, v71, v22, size);
      double v76 = 2160.0 / size;
      double v77 = 3840.0 / v22;
      double v78 = 2160.0 / size;
      double v79 = 3840.0 / v22;
      if ((v75 & 1) == 0) {
        goto LABEL_60;
      }
    }
    if (v79 >= v78) {
      double v82 = v79;
    }
    else {
      double v82 = v78;
    }
    uint64_t v72 = 2;
LABEL_69:
    if (!SBValidateLogicalScale(v125, v82, v22, size)) {
      break;
    }
    v83 = [NSNumber numberWithDouble:v82];
    [v69 addObject:v83];

    ++v70;
  }
  while (v70 != 3);
  v84 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    v85 = _SBFLoggingMethodProem(a1, 1);
    v86 = @"<invalid>";
    if (v72 == 2) {
      v86 = @".AspectFill";
    }
    if (v72 == 1) {
      v86 = @".AspectFit";
    }
    v87 = v86;
    *(_DWORD *)buf = 138544130;
    *(void *)&buf[4] = v85;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v128;
    *(_WORD *)&buf[22] = 2114;
    v154 = v87;
    __int16 v155 = 2114;
    *(void *)v156 = v69;
    _os_log_impl(&dword_18B52E000, v84, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ scaling using: %{public}@; logicalScales before filtering on PPI: %{public}@",
      buf,
      0x2Au);
  }
  double v88 = 0.0;
  if (v116 > 0.0) {
    double v88 = (double)(unint64_t)[(__CFString *)v118 height] / v116;
  }
  if ((BSFloatIsZero() & 1) == 0 && [v69 count])
  {
    v89 = (void *)[v69 copy];
    v131[0] = MEMORY[0x1E4F143A8];
    v131[1] = 3221225472;
    v131[2] = __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke;
    v131[3] = &unk_1E548E020;
    double v134 = v88;
    id v135 = a1;
    SEL v136 = a2;
    id v90 = v128;
    id v132 = v90;
    id v91 = v69;
    id v133 = v91;
    [v89 enumerateObjectsUsingBlock:v131];
    if (![v91 count])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      v154 = 0;
      v92 = [v89 objectAtIndex:0];
      [v92 doubleValue];
      v94 = v93;

      v154 = v94;
      v130[0] = 0;
      v130[1] = v130;
      v130[2] = 0x2020000000;
      v130[3] = 0x7FEFFFFFFFFFFFFFLL;
      v129[0] = MEMORY[0x1E4F143A8];
      v129[1] = 3221225472;
      v129[2] = __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke_84;
      v129[3] = &unk_1E548E048;
      *(double *)&v129[6] = v88;
      v129[4] = v130;
      v129[5] = buf;
      [v89 enumerateObjectsUsingBlock:v129];
      v95 = SBLogDisplayScaleMapping();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        v96 = _SBFLoggingMethodProem(a1, 1);
        uint64_t v97 = *(void *)(*(void *)&buf[8] + 24);
        *(_DWORD *)v147 = 138543874;
        v148 = v96;
        __int16 v149 = 2114;
        id v150 = v90;
        __int16 v151 = 2048;
        uint64_t v152 = v97;
        _os_log_impl(&dword_18B52E000, v95, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ whoops -- we filtered out every logicalScale. stuff the best one back in: %.2f", v147, 0x20u);
      }
      v98 = [NSNumber numberWithDouble:*(double *)(*(void *)&buf[8] + 24)];
      [v91 addObject:v98];

      _Block_object_dispose(v130, 8);
      _Block_object_dispose(buf, 8);
    }
  }
  if ([v69 count])
  {
    uint64_t v99 = [v69 count];
    if ((unint64_t)(v99 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
    {
      v114 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v114, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SBDisplayScaleMapping.m", 315, @"unexpected number of logicalScales: %lu", v99);
    }
    if (v99 == 2)
    {
      v143[0] = &unk_1ED89E950;
      v100 = [v69 objectAtIndex:0];
      v143[1] = &unk_1ED89E938;
      v144[0] = v100;
      v105 = [v69 objectAtIndex:1];
      v144[1] = v105;
      v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v144 forKeys:v143 count:2];

      uint64_t v102 = 3;
    }
    else if (v99 == 1)
    {
      v145 = &unk_1ED89E938;
      v100 = [v69 objectAtIndex:0];
      v146 = v100;
      v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
      uint64_t v102 = 2;
    }
    else
    {
      v141[0] = &unk_1ED89E950;
      v100 = [v69 objectAtIndex:0];
      v142[0] = v100;
      v141[1] = &unk_1ED89E938;
      v106 = [v69 objectAtIndex:1];
      v142[1] = v106;
      v141[2] = &unk_1ED89E968;
      v107 = [v69 objectAtIndex:2];
      v142[2] = v107;
      v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:3];

      uint64_t v102 = 7;
    }

    v8 = -[SBDisplayScaleMapping initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:]([SBDisplayScaleMapping alloc], "initWithDisplayHardwareIdentifier:nativePPI:referenceSize:scaleMethod:supportedScales:displayScaleToLogicalScale:", v128, v72, v102, v101, v88, v22, size);
    v108 = +[_SBDisplayScaleMappingCache sharedInstance];
    [v108 cacheMapping:v8];
  }
  else
  {
    v103 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      v104 = _SBFLoggingMethodProem(a1, 1);
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v104;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v128;
      _os_log_impl(&dword_18B52E000, v103, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ not supported because we couldn't derive any usable resolutions", buf, 0x16u);
    }
    v8 = v121;
  }

LABEL_99:
  if (!v8)
  {
    v113 = [MEMORY[0x1E4F28B00] currentHandler];
    [v113 handleFailureInMethod:a2, a1, @"SBDisplayScaleMapping.m", 344, @"we should always have a non-nil result, even for unsupported displays" object file lineNumber description];

    v8 = 0;
  }
LABEL_101:
  v109 = SBLogDisplayScaleMapping();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    v110 = _SBFLoggingMethodProem(a1, 1);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v110;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_18B52E000, v109, OS_LOG_TYPE_DEFAULT, "[%{public}@] result: %{public}@", buf, 0x16u);
  }
  v111 = v8;

  return v111;
}

void __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [a2 doubleValue];
  double v4 = v3;
  double v5 = v3 * *(double *)(a1 + 48);
  if ((BSFloatLessThanFloat() & 1) != 0 || BSFloatGreaterThanFloat())
  {
    v6 = SBLogDisplayScaleMapping();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = _SBFLoggingMethodProem(*(void **)(a1 + 56), 1);
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138544130;
      v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2048;
      double v16 = v4;
      __int16 v17 = 2048;
      double v18 = v5;
      _os_log_impl(&dword_18B52E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ logicalScale is out of the supported PPI range, so filtering out: %.2f; ppi: %.2f",
        (uint8_t *)&v11,
        0x2Au);
    }
    v9 = *(void **)(a1 + 40);
    v10 = [NSNumber numberWithDouble:v4];
    [v9 removeObject:v10];
  }
}

uint64_t __51__SBDisplayScaleMapping_withDisplay_useNativeSize___block_invoke_84(uint64_t a1, void *a2)
{
  [a2 doubleValue];
  double v4 = v3;
  double v5 = vabdd_f64(264.0, v3 * *(double *)(a1 + 48));
  uint64_t result = BSFloatLessThanOrEqualToFloat();
  if (result)
  {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  }
  return result;
}

- (double)logicalScaleForDisplayScale:(unint64_t)a3
{
  displayScaleToLogicalScale = self->_displayScaleToLogicalScale;
  double v4 = [NSNumber numberWithUnsignedInteger:a3];
  double v5 = [(NSDictionary *)displayScaleToLogicalScale objectForKey:v4];

  if (v5)
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)ppiForDisplayScale:(unint64_t)a3
{
  double nativePPI = self->_nativePPI;
  displayScaleToLogicalScale = self->_displayScaleToLogicalScale;
  double v5 = [NSNumber numberWithUnsignedInteger:a3];
  double v6 = [(NSDictionary *)displayScaleToLogicalScale objectForKey:v5];

  if (v6)
  {
    [v6 doubleValue];
    double v8 = nativePPI * v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (id)createDefaultSettings
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA6A70]), "initWithScale:overscanCompensation:", -[SBDisplayScaleMapping _defaultScale](self, "_defaultScale"), 0);
  return v2;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  double v5 = [v3 activeMultilinePrefix];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  int v11 = __36__SBDisplayScaleMapping_description__block_invoke;
  v12 = &unk_1E548CBA0;
  id v13 = v3;
  uint64_t v14 = self;
  id v6 = v3;
  [v6 appendBodySectionWithName:displayHardwareIdentifier multilinePrefix:v5 block:&v9];

  double v7 = objc_msgSend(v6, "build", v9, v10, v11, v12);

  return v7;
}

void __36__SBDisplayScaleMapping_description__block_invoke(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __36__SBDisplayScaleMapping_description__block_invoke_2;
  v13[3] = &unk_1E548E070;
  v13[4] = a1[2].i64[1];
  [v2 appendCustomFormatWithName:@".Reference" block:v13];
  double v3 = (void *)a1[2].i64[0];
  uint64_t v4 = *(void *)(a1[2].i64[1] + 40);
  double v5 = @"<invalid>";
  if (v4 == 2) {
    double v5 = @".AspectFill";
  }
  if (v4 == 1) {
    id v6 = @".AspectFit";
  }
  else {
    id v6 = v5;
  }
  double v7 = v6;
  double v8 = [v3 activeMultilinePrefix];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __36__SBDisplayScaleMapping_description__block_invoke_3;
  v11[3] = &unk_1E548CBA0;
  int8x16_t v10 = a1[2];
  id v9 = (id)v10.i64[0];
  int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
  [v3 appendBodySectionWithName:v7 multilinePrefix:v8 block:v11];
}

void __36__SBDisplayScaleMapping_description__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int IsZero = BSFloatIsZero();
  uint64_t v5 = NSStringFromCGSize(*(CGSize *)(*(void *)(a1 + 32) + 24));
  id v7 = (id)v5;
  if (IsZero) {
    [v3 appendFormat:@"res: %@", v5, v6];
  }
  else {
    [v3 appendFormat:@"res: %@; ppi: %.2f", v5, *(void *)(*(void *)(a1 + 32) + 16)];
  }
}

void __36__SBDisplayScaleMapping_description__block_invoke_3(uint64_t a1)
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 48);
    if ((SBSDisplayScaleMaskFromScale() & ~v3) == 0)
    {
      uint64_t v4 = [*(id *)(a1 + 32) _defaultScale];
      uint64_t v5 = @"[ ]";
      if (i == v4) {
        uint64_t v5 = @"[d]";
      }
      uint64_t v6 = *(void **)(a1 + 40);
      id v7 = NSString;
      double v8 = v5;
      id v9 = SBSDisplayScaleDescription();
      int8x16_t v10 = [v7 stringWithFormat:@"%@%@", v8, v9];

      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __36__SBDisplayScaleMapping_description__block_invoke_4;
      v11[3] = &unk_1E548E098;
      void v11[4] = *(void *)(a1 + 32);
      v11[5] = i;
      [v6 appendCustomFormatWithName:v10 block:v11];
    }
  }
}

void __36__SBDisplayScaleMapping_description__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  [v3 logicalScaleForDisplayScale:v4];
  double v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = v6 * *(double *)(v8 + 24);
  double v10 = v6 * *(double *)(v8 + 32);
  if (BSFloatIsZero())
  {
    v15.CGFloat width = v9;
    v15.CGFloat height = v10;
    NSStringFromCGSize(v15);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v5 appendFormat:@"scale: %.2f; res: %@", *(void *)&v7, v13, v12];
  }
  else
  {
    double v11 = v7 * *(double *)(*(void *)(a1 + 32) + 16);
    v16.CGFloat width = v9;
    v16.CGFloat height = v10;
    NSStringFromCGSize(v16);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v5 appendFormat:@"scale: %.2f; res: %@; ppi: %.2f", *(void *)&v7, v13, *(void *)&v11];
  }
}

- (unint64_t)_defaultScale
{
  if (!self->_supportedScales)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBDisplayScaleMapping.m", 408, @"Invalid parameter not satisfying: %@", @"_supportedScales != SBSDisplayScaleMaskNone" object file lineNumber description];
  }
  if (BSFloatIsZero()) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v3 = 1;
  do
  {
    unint64_t supportedScales = self->_supportedScales;
    if ((SBSDisplayScaleMaskFromScale() & ~supportedScales) == 0)
    {
      [(SBDisplayScaleMapping *)self ppiForDisplayScale:v4];
      if (BSFloatLessThanOrEqualToFloat()) {
        unint64_t v3 = v4;
      }
    }
    ++v4;
  }
  while (v4 != 3);
  return v3;
}

- (unint64_t)supportedScales
{
  return self->_supportedScales;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayScaleToLogicalScale, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
}

@end