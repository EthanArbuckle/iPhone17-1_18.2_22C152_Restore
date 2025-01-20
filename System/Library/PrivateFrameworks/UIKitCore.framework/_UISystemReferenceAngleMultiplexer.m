@interface _UISystemReferenceAngleMultiplexer
+ (_UISystemReferenceAngleMultiplexer)sharedMultiplexer;
- (_UISystemReferenceAngleMultiplexer)init;
- (double)_systemReferenceAngleForContextID:(unsigned int)a3;
- (unint64_t)_systemReferenceAngleModeForContextID:(unsigned int)a3;
- (void)systemReferenceAngleDidChange:(double)a3 mode:(unint64_t)a4 forWindows:(id)a5;
@end

@implementation _UISystemReferenceAngleMultiplexer

- (_UISystemReferenceAngleMultiplexer)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UISystemReferenceAngleMultiplexer;
  v2 = [(_UISystemReferenceAngleMultiplexer *)&v4 init];
  if (v2) {
    _UISSetSystemReferenceAngleDataSource();
  }
  return v2;
}

+ (_UISystemReferenceAngleMultiplexer)sharedMultiplexer
{
  if (_MergedGlobals_1184 != -1) {
    dispatch_once(&_MergedGlobals_1184, &__block_literal_global_423);
  }
  v2 = (void *)qword_1EB262260;
  return (_UISystemReferenceAngleMultiplexer *)v2;
}

- (void)systemReferenceAngleDidChange:(double)a3 mode:(unint64_t)a4 forWindows:(id)a5
{
  v26[3] = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend(a5, "bs_compactMap:", &__block_literal_global_3_6);
  if ([v7 count])
  {
    v25[0] = *MEMORY[0x1E4FB3538];
    v8 = [NSNumber numberWithUnsignedInteger:a4];
    v26[0] = v8;
    v25[1] = *MEMORY[0x1E4FB3530];
    v9 = [NSNumber numberWithDouble:a3];
    v26[1] = v9;
    v25[2] = *MEMORY[0x1E4FB3520];
    v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    v26[2] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];

    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB262270);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v15 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = _UISStringForSystemReferenceAngleMode();
        int v19 = 134218498;
        double v20 = a3;
        __int16 v21 = 2112;
        v22 = v17;
        __int16 v23 = 2048;
        uint64_t v24 = [v7 count];
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Notifying system reference angle changed: angle=%.0f; mode=%@; affectedContextCount=%lu",
          (uint8_t *)&v19,
          0x20u);
      }
    }
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 postNotificationName:*MEMORY[0x1E4FB3528] object:0 userInfo:v11];
    goto LABEL_4;
  }
  unint64_t v14 = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB262268);
  if (*(unsigned char *)v14)
  {
    v18 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v11 = v18;
      v13 = _UISStringForSystemReferenceAngleMode();
      int v19 = 134218242;
      double v20 = a3;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "System reference angle changed but there are no affected contexts. Ignoring. angle=%.0f; mode=%@",
        (uint8_t *)&v19,
        0x16u);
LABEL_4:
    }
  }
}

- (double)_systemReferenceAngleForContextID:(unsigned int)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v4 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:");
  v5 = v4;
  if (v4)
  {
    [v4 _systemReferenceAngle];
    double v7 = v6;
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB262278);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v16 = 67109376;
        unsigned int v17 = a3;
        __int16 v18 = 2048;
        double v19 = v7;
        v10 = "System reference angle requested for contextID %i -> %.0f";
        v11 = v9;
        uint32_t v12 = 18;
LABEL_9:
        _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v16, v12);
      }
    }
  }
  else
  {
    unint64_t v13 = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB262280);
    double v7 = 0.0;
    if (*(unsigned char *)v13)
    {
      v15 = *(NSObject **)(v13 + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = 67109120;
        unsigned int v17 = a3;
        v10 = "System reference angle requested for an unknown contextID (%i). Returning 0.";
        v11 = v15;
        uint32_t v12 = 8;
        goto LABEL_9;
      }
    }
  }

  return v7;
}

- (unint64_t)_systemReferenceAngleModeForContextID:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_super v4 = +[UIWindow _windowWithContextId:](UIWindow, "_windowWithContextId:");
  v5 = v4;
  if (v4)
  {
    double v6 = (double)(unint64_t)[v4 _systemReferenceAngleMode];
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB262288);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v11 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint32_t v12 = v11;
        unint64_t v13 = _UISStringForSystemReferenceAngleMode();
        int v15 = 67109378;
        unsigned int v16 = a3;
        __int16 v17 = 2112;
        __int16 v18 = v13;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "System reference angle mode requested for contextID %i -> %@", (uint8_t *)&v15, 0x12u);
      }
    }
    unint64_t v8 = (unint64_t)v6;
  }
  else
  {
    unint64_t v9 = __UILogGetCategoryCachedImpl("SystemReferenceAngle", &qword_1EB262290);
    if (*(unsigned char *)v9)
    {
      unint64_t v14 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = 67109120;
        unsigned int v16 = a3;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "System reference angle mode requested for an unknown contextID (%i). Returning \"unknown\".", (uint8_t *)&v15, 8u);
      }
    }
    unint64_t v8 = 0;
  }

  return v8;
}

@end