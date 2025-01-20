@interface PTParameterPairSerialization
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)getCMTimeParameter:(SEL)a3 scale:(unsigned __int16)a4 fromPairs:(int)a5 numPairs:(id *)a6 withDefault:(unsigned int)a7;
+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5;
+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 didFindValue:(BOOL *)a6;
+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 withDefault:(float)a6;
+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5;
+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 didFindValue:(BOOL *)a6;
+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 withDefault:(unsigned int)a6 didFindValue:(BOOL *)a7;
+ (void)appendCMTimeParameter:(unsigned __int16)a3 value:(id *)a4 scale:(int)a5 toOutput:(id *)a6;
+ (void)appendFloatParameter:(unsigned __int16)a3 value:(float)a4 toOutput:(id *)a5;
+ (void)appendUIntParameter:(unsigned __int16)a3 value:(unsigned int)a4 toOutput:(id *)a5;
@end

@implementation PTParameterPairSerialization

+ (void)appendFloatParameter:(unsigned __int16)a3 value:(float)a4 toOutput:(id *)a5
{
  v6 = *a5;
  *(_WORD *)v6 = __rev16(a3);
  *((_WORD *)v6 + 1) = 256;
  _PTSwapBigAssignFloat((_DWORD *)v6 + 1, a4);
  *a5 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)*a5 + 8);
}

+ (void)appendUIntParameter:(unsigned __int16)a3 value:(unsigned int)a4 toOutput:(id *)a5
{
  v5 = *a5;
  *(_WORD *)v5 = __rev16(a3);
  *((_WORD *)v5 + 1) = 512;
  *((_DWORD *)v5 + 1) = bswap32(a4);
  *a5 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)*a5 + 8);
}

+ (void)appendCMTimeParameter:(unsigned __int16)a3 value:(id *)a4 scale:(int)a5 toOutput:(id *)a6
{
  uint64_t v7 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((a4->var2 & 0x1D) == 1)
  {
    memset(&v16, 0, sizeof(v16));
    CMTime time = *(CMTime *)a4;
    CMTimeMultiply(&v16, &time, 90000);
    CMTime time = v16;
    uint64_t v10 = llround(CMTimeGetSeconds(&time));
    if (v10 >= 0) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = -v10;
    }
    if (v11 >> 31)
    {
      CMTime time = (CMTime)*a4;
      v12 = (__CFString *)CMTimeCopyDescription(0, &time);
      v13 = _PTLogSystem();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(time.value) = 67109634;
        HIDWORD(time.value) = v7;
        LOWORD(time.timescale) = 2112;
        *(void *)((char *)&time.timescale + 2) = v12;
        WORD1(time.epoch) = 1024;
        HIDWORD(time.epoch) = a5;
        _os_log_error_impl(&dword_1D0778000, v13, OS_LOG_TYPE_ERROR, "Failed to set parameter %d to CMTime value %@ using scale %d", (uint8_t *)&time, 0x18u);
      }
    }
    else
    {
      objc_msgSend(a1, "appendUIntParameter:value:toOutput:", v7);
    }
  }
  else
  {
    CMTime v16 = *(CMTime *)a4;
    v14 = (__CFString *)CMTimeCopyDescription(0, &v16);
    v15 = _PTLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[PTParameterPairSerialization appendCMTimeParameter:value:scale:toOutput:](v7, (uint64_t)v14, v15);
    }
  }
}

+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 didFindValue:(BOOL *)a6
{
  float v9 = NAN;
  char Parameter = PTParameterPairSerialization_GetParameter((uint64_t)a4, a5, a3, 1, &v9);
  if (a6) {
    *a6 = Parameter;
  }
  return v9;
}

+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5
{
  +[PTParameterPairSerialization getFloatParameter:a3 fromPairs:a4 numPairs:*(void *)&a5 didFindValue:0];
  return result;
}

+ (float)getFloatParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 withDefault:(float)a6
{
  float v7 = a6;
  PTParameterPairSerialization_GetParameter((uint64_t)a4, a5, a3, 1, &v7);
  return v7;
}

+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 didFindValue:(BOOL *)a6
{
  return +[PTParameterPairSerialization getUIntParameter:a3 fromPairs:a4 numPairs:*(void *)&a5 withDefault:0x7FFFFFFFLL didFindValue:a6];
}

+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5
{
  return +[PTParameterPairSerialization getUIntParameter:a3 fromPairs:a4 numPairs:*(void *)&a5 didFindValue:0];
}

+ (unsigned)getUIntParameter:(unsigned __int16)a3 fromPairs:(id *)a4 numPairs:(unsigned int)a5 withDefault:(unsigned int)a6 didFindValue:(BOOL *)a7
{
  unsigned int v10 = a6;
  char Parameter = PTParameterPairSerialization_GetParameter((uint64_t)a4, a5, a3, 2, (float *)&v10);
  if (a7) {
    *a7 = Parameter;
  }
  return v10;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)getCMTimeParameter:(SEL)a3 scale:(unsigned __int16)a4 fromPairs:(int)a5 numPairs:(id *)a6 withDefault:(unsigned int)a7
{
  LODWORD(value) = 0;
  float result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)PTParameterPairSerialization_GetParameter((uint64_t)a6, a7, a4, 2, (float *)&value);
  if (result)
  {
    int64_t v12 = (int)value;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v12, a5);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&a8->var0;
    retstr->var3 = a8->var3;
  }
  return result;
}

+ (void)appendCMTimeParameter:(os_log_t)log value:scale:toOutput:.cold.1(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Failed to set parameter %d to non-numeric CMTime value %@", (uint8_t *)v3, 0x12u);
}

@end