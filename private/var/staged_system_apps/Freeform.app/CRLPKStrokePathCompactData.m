@interface CRLPKStrokePathCompactData
+ (id)strokePathCompactDataFrom:(id)a3;
- (BOOL)isEqualIgnoringShouldSolveMathFlag:(id)a3;
- (BOOL)shouldSolveMath;
- (CGPoint)anchorPointForTexture;
- (CRLPKStrokePathCompactData)initWithCapacity:(unint64_t)a3;
- (CRLPKStrokePathCompactData)initWithCapacity:(unint64_t)a3 randomSeed:(unsigned int)a4 creationDate:(id)a5;
- (CRLPKStrokePointCompactData)strokePointCompactDataAtIndex:(SEL)a3;
- (NSDate)creationDate;
- (NSUUID)renderGroupID;
- (float)radius2Data;
- (float)renderScaleX;
- (float)renderScaleY;
- (float)sizeXData;
- (float)sizeYData;
- (float)timeOffsetData;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)capacity;
- (unint64_t)pointCount;
- (unsigned)altitudeData;
- (unsigned)azimuthData;
- (unsigned)edgeWidthData;
- (unsigned)forceData;
- (unsigned)opacityData;
- (unsigned)randomSeed;
- (void)appendStrokePathCompactData:(id)a3;
- (void)appendStrokePointCompactData:(CRLPKStrokePointCompactData *)a3;
- (void)dealloc;
- (void)increaseCapacityBy:(unint64_t)a3;
- (void)setAnchorPointForTexture:(CGPoint)a3;
- (void)setPointCount:(unint64_t)a3;
- (void)setRenderGroupID:(id)a3;
- (void)setRenderScaleX:(float)a3;
- (void)setRenderScaleY:(float)a3;
- (void)setShouldSolveMath:(BOOL)a3;
@end

@implementation CRLPKStrokePathCompactData

- (CRLPKStrokePathCompactData)initWithCapacity:(unint64_t)a3
{
  v5 = +[NSDate now];
  v6 = [(CRLPKStrokePathCompactData *)self initWithCapacity:a3 randomSeed:0 creationDate:v5];

  return v6;
}

- (CRLPKStrokePathCompactData)initWithCapacity:(unint64_t)a3 randomSeed:(unsigned int)a4 creationDate:(id)a5
{
  id v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CRLPKStrokePathCompactData;
  v10 = [(CRLPKStrokePathCompactData *)&v20 init];
  v11 = v10;
  if (v10)
  {
    v10->_capacity = a3;
    size_t v12 = 2 * a3;
    v10->_azimuthData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v11->_altitudeData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v11->_forceData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    v11->_opacityData = (unsigned __int16 *)malloc_type_malloc(2 * a3, 0x1000040BDFB0063uLL);
    size_t v13 = 4 * a3;
    v11->_sizeXData = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_sizeYData = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_timeOffsetData = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_radius2Data = (float *)malloc_type_malloc(v13, 0x100004052888210uLL);
    v11->_edgeWidthData = (unsigned __int16 *)malloc_type_malloc(v12, 0x1000040BDFB0063uLL);
    v11->_randomSeed = a4;
    objc_storeStrong((id *)&v11->_creationDate, a5);
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&v11->_renderScaleX = _D0;
    v11->_anchorPointForTexture = CGPointZero;
  }

  return v11;
}

- (void)dealloc
{
  free(self->_azimuthData);
  free(self->_altitudeData);
  free(self->_forceData);
  free(self->_opacityData);
  free(self->_sizeXData);
  free(self->_sizeYData);
  free(self->_timeOffsetData);
  free(self->_radius2Data);
  free(self->_edgeWidthData);
  v3.receiver = self;
  v3.super_class = (Class)CRLPKStrokePathCompactData;
  [(CRLPKStrokePathCompactData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[CRLPKStrokePathCompactData alloc] initWithCapacity:self->_capacity];
  v4->_pointCount = self->_pointCount;
  memcpy(v4->_azimuthData, self->_azimuthData, 2 * self->_capacity);
  memcpy(v4->_altitudeData, self->_altitudeData, 2 * self->_capacity);
  memcpy(v4->_forceData, self->_forceData, 2 * self->_capacity);
  memcpy(v4->_opacityData, self->_opacityData, 2 * self->_capacity);
  memcpy(v4->_sizeXData, self->_sizeXData, 4 * self->_capacity);
  memcpy(v4->_sizeYData, self->_sizeYData, 4 * self->_capacity);
  memcpy(v4->_timeOffsetData, self->_timeOffsetData, 4 * self->_capacity);
  memcpy(v4->_radius2Data, self->_radius2Data, 4 * self->_capacity);
  memcpy(v4->_edgeWidthData, self->_edgeWidthData, 2 * self->_capacity);
  v4->_randomSeed = self->_randomSeed;
  v5 = (NSDate *)[(NSDate *)self->_creationDate copy];
  creationDate = v4->_creationDate;
  v4->_creationDate = v5;

  v4->_renderScaleX = self->_renderScaleX;
  v4->_renderScaleY = self->_renderScaleY;
  v4->_anchorPointForTexture = self->_anchorPointForTexture;
  v4->_shouldSolveMath = self->_shouldSolveMath;
  return v4;
}

+ (id)strokePathCompactDataFrom:(id)a3
{
  id v3 = a3;
  v4 = [CRLPKStrokePathCompactData alloc];
  id v5 = [v3 pointCount];
  id v6 = [v3 randomSeed];
  v7 = [v3 creationDate];
  v8 = [(CRLPKStrokePathCompactData *)v4 initWithCapacity:v5 randomSeed:v6 creationDate:v7];

  [(CRLPKStrokePathCompactData *)v8 appendStrokePathCompactData:v3];
  [v3 renderScaleX];
  -[CRLPKStrokePathCompactData setRenderScaleX:](v8, "setRenderScaleX:");
  [v3 renderScaleY];
  -[CRLPKStrokePathCompactData setRenderScaleY:](v8, "setRenderScaleY:");
  id v9 = [v3 renderGroupID];
  [(CRLPKStrokePathCompactData *)v8 setRenderGroupID:v9];

  [v3 anchorPointForTexture];
  -[CRLPKStrokePathCompactData setAnchorPointForTexture:](v8, "setAnchorPointForTexture:");
  id v10 = [v3 shouldSolveMath];

  [(CRLPKStrokePathCompactData *)v8 setShouldSolveMath:v10];

  return v8;
}

- (BOOL)isEqualIgnoringShouldSolveMathFlag:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1002469D0(v5, v4);
  id v6 = (double *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6) {
    goto LABEL_24;
  }
  unint64_t pointCount = self->_pointCount;
  if (pointCount != *((void *)v6 + 13)) {
    goto LABEL_24;
  }
  uint64_t v9 = 0;
  while (pointCount != v9)
  {
    if (self->_azimuthData[v9] == *(unsigned __int16 *)(*((void *)v6 + 7) + 2 * v9)
      && self->_altitudeData[v9] == *(unsigned __int16 *)(*((void *)v6 + 6) + 2 * v9)
      && self->_forceData[v9] == *(unsigned __int16 *)(*((void *)v6 + 4) + 2 * v9)
      && self->_opacityData[v9] == *(unsigned __int16 *)(*((void *)v6 + 5) + 2 * v9)
      && self->_sizeXData[v9] == *(float *)(*((void *)v6 + 8) + 4 * v9)
      && self->_sizeYData[v9] == *(float *)(*((void *)v6 + 9) + 4 * v9)
      && self->_timeOffsetData[v9] == *(float *)(*((void *)v6 + 10) + 4 * v9)
      && self->_radius2Data[v9] == *(float *)(*((void *)v6 + 11) + 4 * v9))
    {
      int v10 = self->_edgeWidthData[v9];
      int v11 = *(unsigned __int16 *)(*((void *)v6 + 12) + 2 * v9++);
      if (v10 == v11) {
        continue;
      }
    }
    goto LABEL_24;
  }
  unsigned int randomSeed = self->_randomSeed;
  if (randomSeed == [v6 randomSeed]
    && (creationDate = self->_creationDate,
        [v7 creationDate],
        v14 = objc_claimAutoreleasedReturnValue(),
        LODWORD(creationDate) = [(NSDate *)creationDate isEqual:v14],
        v14,
        creationDate)
    && self->_renderScaleX == *((float *)v7 + 4)
    && self->_renderScaleY == *((float *)v7 + 5)
    && ((renderGroupID = self->_renderGroupID, !((unint64_t)renderGroupID | *((void *)v7 + 15)))
     || -[NSUUID isEqual:](renderGroupID, "isEqual:")))
  {
    BOOL v16 = self->_anchorPointForTexture.y == v7[17] && self->_anchorPointForTexture.x == v7[16];
  }
  else
  {
LABEL_24:
    BOOL v16 = 0;
  }

  return v16;
}

- (CRLPKStrokePointCompactData)strokePointCompactDataAtIndex:(SEL)a3
{
  if (*(void *)&self[3].var7 <= a4)
  {
    int v11 = self;
    unsigned int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6B48);
    }
    v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)&v11[3].var7;
      *(_DWORD *)buf = 67110402;
      unsigned int v30 = v13;
      __int16 v31 = 2082;
      v32 = "-[CRLPKStrokePathCompactData strokePointCompactDataAtIndex:]";
      __int16 v33 = 2082;
      v34 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m";
      __int16 v35 = 1024;
      int v36 = 199;
      __int16 v37 = 2048;
      unint64_t v38 = a4;
      __int16 v39 = 2048;
      uint64_t v40 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Out of bounds error. The given index (%zd) must be within [0, %zd).", buf, 0x36u);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6B68);
    }
    BOOL v16 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v16);
    }
    uint64_t v28 = *(void *)&v11[3].var7;
    sub_1001D9720((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Out of bounds error. The given index (%zd) must be within [0, %zd).", v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[CRLPKStrokePathCompactData strokePointCompactDataAtIndex:]");
    v24 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStrokePathCompactData strokePointCompactDataAtIndex:]");
    v25 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 199, 1, "Out of bounds error. The given index (%zd) must be within [0, %zd).", a4, *(void *)&v11[3].var7, 199, a4, v28);

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v26, v27);
    abort();
  }
  uint64_t v4 = *(void *)&self[1].var5;
  retstr->var0 = *(_WORD *)(*(void *)&self[1].var2 + 2 * a4);
  retstr->var1 = *(_WORD *)(v4 + 2 * a4);
  uint64_t v5 = *(void *)&self[2].var0;
  retstr->var2 = *(_WORD *)(*(void *)&self[1].var7 + 2 * a4);
  retstr->var3 = *(_WORD *)(v5 + 2 * a4);
  float v6 = *(float *)(*(void *)&self[2].var4 + 4 * a4);
  float v7 = *(float *)(*(void *)&self[2].var6 + 4 * a4);
  uint64_t v8 = *(void *)&self[3].var2;
  float v9 = *(float *)(*(void *)&self[2].var8 + 4 * a4);
  *(_DWORD *)&retstr->var8 = 0;
  retstr->var4 = v6;
  retstr->var5 = v7;
  float v10 = *(float *)(v8 + 4 * a4);
  retstr->var6 = v9;
  retstr->var7 = v10;
  retstr->var8 = *(_WORD *)(*(void *)&self[3].var5 + 2 * a4);
  return self;
}

- (void)increaseCapacityBy:(unint64_t)a3
{
  unint64_t v4 = self->_capacity + a3;
  self->_capacity = v4;
  self->_forceData = (unsigned __int16 *)malloc_type_realloc(self->_forceData, 2 * v4, 0x1000040BDFB0063uLL);
  self->_altitudeData = (unsigned __int16 *)malloc_type_realloc(self->_altitudeData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
  self->_azimuthData = (unsigned __int16 *)malloc_type_realloc(self->_azimuthData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
  self->_opacityData = (unsigned __int16 *)malloc_type_realloc(self->_opacityData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
  self->_sizeXData = (float *)malloc_type_realloc(self->_sizeXData, 4 * self->_capacity, 0x100004052888210uLL);
  self->_sizeYData = (float *)malloc_type_realloc(self->_sizeYData, 4 * self->_capacity, 0x100004052888210uLL);
  self->_timeOffsetData = (float *)malloc_type_realloc(self->_timeOffsetData, 4 * self->_capacity, 0x100004052888210uLL);
  self->_radius2Data = (float *)malloc_type_realloc(self->_radius2Data, 4 * self->_capacity, 0x100004052888210uLL);
  self->_edgeWidthData = (unsigned __int16 *)malloc_type_realloc(self->_edgeWidthData, 2 * self->_capacity, 0x1000040BDFB0063uLL);
}

- (void)appendStrokePathCompactData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pointCount];
  unint64_t pointCount = self->_pointCount;
  unint64_t capacity = self->_capacity;
  unint64_t v8 = (unint64_t)v5 + pointCount;
  float v9 = (char *)v5 + pointCount - capacity;
  if ((char *)v5 + pointCount != (id)capacity)
  {
    [(CRLPKStrokePathCompactData *)self increaseCapacityBy:v9];
    unint64_t pointCount = self->_pointCount;
    unint64_t v8 = self->_capacity;
  }
  if (pointCount >= v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6B88);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A4DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6BA8);
    }
    float v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v10);
    }
    int v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStrokePathCompactData appendStrokePathCompactData:]");
    size_t v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11 file:v12 lineNumber:233 isFatal:0 description:"Out of bounds error when appending a strokePointData object."];

    unint64_t pointCount = self->_pointCount;
    unint64_t v8 = self->_capacity;
  }
  if (pointCount < v8)
  {
    memcpy(&self->_forceData[pointCount], [v4 forceData], 2 * (void)v5);
    memcpy(&self->_altitudeData[self->_pointCount], [v4 altitudeData], 2 * (void)v5);
    memcpy(&self->_azimuthData[self->_pointCount], [v4 azimuthData], 2 * (void)v5);
    memcpy(&self->_opacityData[self->_pointCount], [v4 opacityData], 2 * (void)v5);
    memcpy(&self->_sizeXData[self->_pointCount], [v4 sizeXData], 4 * (void)v5);
    memcpy(&self->_sizeYData[self->_pointCount], [v4 sizeYData], 4 * (void)v5);
    memcpy(&self->_timeOffsetData[self->_pointCount], [v4 timeOffsetData], 4 * (void)v5);
    memcpy(&self->_radius2Data[self->_pointCount], [v4 radius2Data], 4 * (void)v5);
    memcpy(&self->_edgeWidthData[self->_pointCount], [v4 edgeWidthData], 2 * (void)v5);
    self->_pointCount += (unint64_t)v5;
  }
}

- (void)appendStrokePointCompactData:(CRLPKStrokePointCompactData *)a3
{
  unint64_t pointCount = self->_pointCount;
  unint64_t capacity = self->_capacity;
  if (pointCount >= capacity)
  {
    [(CRLPKStrokePathCompactData *)self increaseCapacityBy:(unint64_t)fmax((double)capacity * 0.5, 1.0)];
    unint64_t pointCount = self->_pointCount;
    unint64_t capacity = self->_capacity;
  }
  if (pointCount >= capacity)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6BC8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107A564();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D6BE8);
    }
    float v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v7);
    }
    unint64_t v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPKStrokePathCompactData appendStrokePointCompactData:]");
    float v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLPKStrokePathConverter.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:253 isFatal:0 description:"Out of bounds error when appending a strokePointData object."];

    unint64_t pointCount = self->_pointCount;
    unint64_t capacity = self->_capacity;
  }
  if (pointCount < capacity)
  {
    opacityData = self->_opacityData;
    self->_forceData[pointCount] = a3->var0;
    azimuthData = self->_azimuthData;
    self->_altitudeData[pointCount] = a3->var2;
    azimuthData[pointCount] = a3->var3;
    opacityData[pointCount] = a3->var1;
    sizeYData = self->_sizeYData;
    self->_sizeXData[pointCount] = a3->var4;
    sizeYData[pointCount] = a3->var5;
    radius2Data = self->_radius2Data;
    self->_timeOffsetData[pointCount] = a3->var6;
    radius2Data[pointCount] = a3->var7;
    self->_edgeWidthData[pointCount] = a3->var8;
    self->_unint64_t pointCount = pointCount + 1;
  }
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (unsigned)forceData
{
  return self->_forceData;
}

- (unsigned)opacityData
{
  return self->_opacityData;
}

- (unsigned)altitudeData
{
  return self->_altitudeData;
}

- (unsigned)azimuthData
{
  return self->_azimuthData;
}

- (float)sizeXData
{
  return self->_sizeXData;
}

- (float)sizeYData
{
  return self->_sizeYData;
}

- (float)timeOffsetData
{
  return self->_timeOffsetData;
}

- (float)radius2Data
{
  return self->_radius2Data;
}

- (unsigned)edgeWidthData
{
  return self->_edgeWidthData;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (void)setPointCount:(unint64_t)a3
{
  self->_unint64_t pointCount = a3;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (unsigned)randomSeed
{
  return self->_randomSeed;
}

- (float)renderScaleX
{
  return self->_renderScaleX;
}

- (void)setRenderScaleX:(float)a3
{
  self->_renderScaleX = a3;
}

- (float)renderScaleY
{
  return self->_renderScaleY;
}

- (void)setRenderScaleY:(float)a3
{
  self->_renderScaleY = a3;
}

- (NSUUID)renderGroupID
{
  return self->_renderGroupID;
}

- (void)setRenderGroupID:(id)a3
{
}

- (CGPoint)anchorPointForTexture
{
  double x = self->_anchorPointForTexture.x;
  double y = self->_anchorPointForTexture.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPointForTexture:(CGPoint)a3
{
  self->_anchorPointForTexture = a3;
}

- (BOOL)shouldSolveMath
{
  return self->_shouldSolveMath;
}

- (void)setShouldSolveMath:(BOOL)a3
{
  self->_shouldSolveMath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderGroupID, 0);

  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end