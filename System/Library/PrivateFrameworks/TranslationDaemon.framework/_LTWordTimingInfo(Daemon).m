@interface _LTWordTimingInfo(Daemon)
+ (id)smoothedWordTimingWithTextRangeInfoFrom:()Daemon wordTimingInfo:;
+ (id)wordTimingInfoFromArray:()Daemon text:;
+ (id)wordTimingInfoFromSiriTTSService:()Daemon text:;
- (id)initWithFTWordTimingInfo:()Daemon;
@end

@implementation _LTWordTimingInfo(Daemon)

- (id)initWithFTWordTimingInfo:()Daemon
{
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&off_270C5C8E0;
  id v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    v6 = [v4 word];
    [v5 setWord:v6];

    objc_msgSend(v5, "setSampleIndex:", objc_msgSend(v4, "sample_idx"));
    objc_msgSend(v5, "setOffset:", objc_msgSend(v4, "offset"));
    objc_msgSend(v5, "setLength:", objc_msgSend(v4, "length"));
    [v4 timestamp];
    [v5 setStartTime:v7];
    id v8 = v5;
  }

  return v5;
}

+ (id)wordTimingInfoFromArray:()Daemon text:
{
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58___LTWordTimingInfo_Daemon__wordTimingInfoFromArray_text___block_invoke;
  v12[3] = &unk_2655486E0;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  objc_super v10 = [(id)objc_opt_class() smoothedWordTimingWithTextRangeInfoFrom:v6 wordTimingInfo:v9];

  return v10;
}

+ (id)wordTimingInfoFromSiriTTSService:()Daemon text:
{
  id v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 array];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __67___LTWordTimingInfo_Daemon__wordTimingInfoFromSiriTTSService_text___block_invoke;
  v12[3] = &unk_265548708;
  id v13 = v8;
  id v9 = v8;
  [v7 enumerateObjectsUsingBlock:v12];

  objc_super v10 = [(id)objc_opt_class() smoothedWordTimingWithTextRangeInfoFrom:v6 wordTimingInfo:v9];

  return v10;
}

+ (id)smoothedWordTimingWithTextRangeInfoFrom:()Daemon wordTimingInfo:
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v82 = a3;
  id v5 = a4;
  id v80 = [MEMORY[0x263EFF980] array];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v88 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        v12 = _LTOSLogTTS();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v93 = (uint64_t)v11;
          _os_log_debug_impl(&dword_2600DC000, v12, OS_LOG_TYPE_DEBUG, "Smoothing _LTWordTimingInfo: %@", buf, 0xCu);
        }
        id v13 = objc_alloc_init(MEMORY[0x263F1C1C8]);
        v14 = [v11 word];
        [v13 setWord:v14];

        objc_msgSend(v13, "setSampleIndex:", objc_msgSend(v11, "sampleIndex"));
        [v11 startTime];
        objc_msgSend(v13, "setStartTime:");
        NSUInteger v15 = [v11 offset];
        NSUInteger v16 = [v11 length];
        if (NSClassFromString(&cfstr_Sirittsnsrange.isa))
        {
          uint64_t v17 = -[objc_class mapUtf8RangeToUtf16:inText:](NSClassFromString(&cfstr_Sirittsnsrange.isa), "mapUtf8RangeToUtf16:inText:", v15, v16, v82);
          objc_msgSend(v13, "setTextRange:", v17, v18);
        }
        [v13 textRange];
        [v13 setLength:v19];
        objc_msgSend(v13, "setOffset:", objc_msgSend(v13, "textRange"));
        if ([v13 textRange] != v15 || v20 != v16)
        {
          v21 = _LTOSLogTTS();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = v21;
            v101.NSUInteger location = v15;
            v101.NSUInteger length = v16;
            v23 = NSStringFromRange(v101);
            v102.NSUInteger location = [v13 textRange];
            v24 = NSStringFromRange(v102);
            v25 = [v13 word];
            uint64_t v26 = [v25 length];
            *(_DWORD *)buf = 138412802;
            uint64_t v93 = (uint64_t)v23;
            __int16 v94 = 2112;
            uint64_t v95 = (uint64_t)v24;
            __int16 v96 = 2048;
            uint64_t v97 = v26;
            _os_log_impl(&dword_2600DC000, v22, OS_LOG_TYPE_INFO, "Corrected FTWordTimingInfo UTF8(%@) range to UTF16(%@), word length: %zu", buf, 0x20u);
          }
        }
        if (v8 && ([v8 startTime], double v28 = v27, objc_msgSend(v13, "startTime"), v28 == v29))
        {
          v30 = _LTOSLogTTS();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2600DC000, v30, OS_LOG_TYPE_INFO, "Merging _LTWordTimingInfo to previous one because same start timestamp", buf, 2u);
          }
          v31 = [v8 word];
          v32 = [v13 word];
          v33 = [v31 stringByAppendingString:v32];
          [v8 setWord:v33];

          [v8 textRange];
          uint64_t v35 = v34;
          v36 = [v13 word];
          uint64_t v37 = [v36 length] + v35;

          objc_msgSend(v8, "setTextRange:", objc_msgSend(v8, "textRange"), v37);
          [v8 setLength:v37];
        }
        else
        {
          [v80 addObject:v13];
          id v38 = v13;

          id v8 = v38;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v87 objects:v98 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v81 = v80;
  uint64_t v39 = [v81 countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (!v39)
  {
    NSUInteger length = 0;
    goto LABEL_47;
  }
  uint64_t v41 = v39;
  NSUInteger length = 0;
  NSUInteger location = 0;
  id v44 = 0;
  uint64_t v45 = *(void *)v84;
  *(void *)&long long v40 = 134218240;
  long long v78 = v40;
  do
  {
    uint64_t v46 = 0;
    do
    {
      v47 = v44;
      if (*(void *)v84 != v45) {
        objc_enumerationMutation(v81);
      }
      v48 = *(void **)(*((void *)&v83 + 1) + 8 * v46);
      v49 = _LTOSLogTTS();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v48;
        _os_log_debug_impl(&dword_2600DC000, v49, OS_LOG_TYPE_DEBUG, "Smoothed _LTWordTimingInfo:\n%@", buf, 0xCu);
      }
      v108.NSUInteger location = objc_msgSend(v48, "textRange", v78);
      v108.NSUInteger length = v50;
      v103.NSUInteger location = location;
      v103.NSUInteger length = length;
      NSRange v51 = NSUnionRange(v103, v108);
      NSUInteger location = v51.location;
      NSUInteger length = v51.length;
      v52 = [v48 word];
      uint64_t v53 = [v52 length];
      [v48 textRange];
      uint64_t v55 = v54;

      if (v53 != v55 && (v56 = _LTOSLogTTS(), os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)))
      {
        v65 = v56;
        v66 = [v48 word];
        uint64_t v67 = [v66 length];
        [v48 textRange];
        *(_DWORD *)buf = v78;
        uint64_t v93 = v67;
        __int16 v94 = 2048;
        uint64_t v95 = v68;
        _os_log_error_impl(&dword_2600DC000, v65, OS_LOG_TYPE_ERROR, "_LTWordTimingInfo word length(%zu) and text range length(%zu) don't match", buf, 0x16u);

        if (!v47) {
          goto LABEL_37;
        }
      }
      else if (!v47)
      {
        goto LABEL_37;
      }
      NSUInteger v57 = [v47 textRange];
      NSUInteger v59 = v58;
      v109.NSUInteger location = [v48 textRange];
      v109.NSUInteger length = v60;
      v104.NSUInteger location = v57;
      v104.NSUInteger length = v59;
      if (NSIntersectionRange(v104, v109).length)
      {
        v61 = _LTOSLogTTS();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v72 = v61;
          v106.NSUInteger location = [v48 textRange];
          v73 = NSStringFromRange(v106);
          v107.NSUInteger location = [v47 textRange];
          v74 = NSStringFromRange(v107);
          *(_DWORD *)buf = 138412546;
          uint64_t v93 = (uint64_t)v73;
          __int16 v94 = 2112;
          uint64_t v95 = (uint64_t)v74;
          _os_log_error_impl(&dword_2600DC000, v72, OS_LOG_TYPE_ERROR, "_LTWordTimingInfo text range(%@) overlaps with previous one(%@)", buf, 0x16u);
        }
      }
LABEL_37:
      uint64_t v62 = [v48 textRange];
      [v48 textRange];
      if (v63 + v62 > (unint64_t)[v82 length])
      {
        v64 = _LTOSLogTTS();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
        {
          v69 = v64;
          v105.NSUInteger location = [v48 textRange];
          v70 = NSStringFromRange(v105);
          uint64_t v71 = [v82 length];
          *(_DWORD *)buf = 138412546;
          uint64_t v93 = (uint64_t)v70;
          __int16 v94 = 2048;
          uint64_t v95 = v71;
          _os_log_error_impl(&dword_2600DC000, v69, OS_LOG_TYPE_ERROR, "_LTWordTimingInfo text range(%@) is out of range from total text(text.length: %zu)", buf, 0x16u);
        }
      }
      id v44 = v48;

      ++v46;
    }
    while (v41 != v46);
    uint64_t v75 = [v81 countByEnumeratingWithState:&v83 objects:v91 count:16];
    uint64_t v41 = v75;
  }
  while (v75);

LABEL_47:
  if (length != [v82 length])
  {
    v76 = _LTOSLogTTS();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
      +[_LTWordTimingInfo(Daemon) smoothedWordTimingWithTextRangeInfoFrom:wordTimingInfo:](v76, v82, length);
    }
  }

  return v81;
}

+ (void)smoothedWordTimingWithTextRangeInfoFrom:()Daemon wordTimingInfo:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a1;
  int v6 = 134218240;
  uint64_t v7 = a3;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 length];
  _os_log_error_impl(&dword_2600DC000, v5, OS_LOG_TYPE_ERROR, "Union of _LTWordTimingInfo ranges length(%zu) does not match text length(%zu)", (uint8_t *)&v6, 0x16u);
}

@end