@interface GEOComposedRouteStep(MNInstructions)
- (id)contentsForContext:()MNInstructions;
@end

@implementation GEOComposedRouteStep(MNInstructions)

- (id)contentsForContext:()MNInstructions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = [a1 composedRoute];
  unint64_t v6 = objc_msgSend(v5, "legIndexForStepIndex:", objc_msgSend(a1, "stepIndex"));
  v7 = [v5 legs];
  unint64_t v8 = [v7 count];

  if (v6 < v8)
  {
    v9 = [v5 legs];
    v10 = [v9 objectAtIndexedSubscript:v6];

    v11 = [v10 destination];
    if ([a1 transportType] == 1)
    {
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315650;
        v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
        __int16 v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
        __int16 v20 = 1024;
        int v21 = 398;
LABEL_11:
        _os_log_impl(&dword_1B542B000, v12, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v16, 0x1Cu);
      }
    }
    else
    {
      if ([a1 transportType] != 6)
      {
        if (a3 == 1 || a3 == 3)
        {
          uint64_t v15 = +[MNSignInstructionContents contentsWithStep:a1 destination:v11];
        }
        else
        {
          if (a3 != 2)
          {
            v12 = GEOFindOrCreateLog();
            if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              goto LABEL_12;
            }
            int v16 = 136315650;
            v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
            __int16 v18 = 2080;
            v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
            __int16 v20 = 1024;
            int v21 = 419;
            goto LABEL_11;
          }
          uint64_t v15 = +[MNListInstructionContents contentsWithStep:a1];
        }
        v13 = (void *)v15;
        goto LABEL_13;
      }
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315650;
        v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
        __int16 v18 = 2080;
        v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
        __int16 v20 = 1024;
        int v21 = 404;
        goto LABEL_11;
      }
    }
LABEL_12:

    v13 = 0;
LABEL_13:

    goto LABEL_14;
  }
  v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int v16 = 136315650;
    v17 = "-[GEOComposedRouteStep(MNInstructions) contentsForContext:]";
    __int16 v18 = 2080;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNInstructions.m";
    __int16 v20 = 1024;
    int v21 = 389;
    _os_log_impl(&dword_1B542B000, v10, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v16, 0x1Cu);
  }
  v13 = 0;
LABEL_14:

  return v13;
}

@end