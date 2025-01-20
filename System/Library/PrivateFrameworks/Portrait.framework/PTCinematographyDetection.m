@interface PTCinematographyDetection
+ (BOOL)writeArray:(id)a3 toAtomWriter:(id)a4 options:(id)a5;
+ (id)_cinematographyArrayFromDetections:(id)a3;
+ (id)_detectionsByFocusIdentifierFromArray:(id)a3;
+ (id)_detectionsByTrackIdentifierFromArray:(id)a3;
+ (id)_detectionsFromCinematographyArray:(id)a3;
+ (id)_detectionsFromInnerAtomStream:(id)a3;
+ (id)_prefixForDetectionType:(unint64_t)a3;
+ (id)accessibilityLabelForDetectionType:(unint64_t)a3;
+ (id)objectFromAtomStream:(id)a3;
+ (id)objectsFromAtomStream:(id)a3;
+ (unint64_t)_detectionTypeForPrefix:(id)a3;
+ (unint64_t)sizeOfSerializedArray:(id)a3 options:(id)a4;
+ (void)initialize;
+ (void)registerForSerialization;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)_copyToDetectionData_0:(DetectionData_0 *)a3;
- (BOOL)_fixMissingTrackIdentifier:(int64_t)a3;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_isExcludedAsCinematicChoice;
- (BOOL)_isInvalid;
- (BOOL)cachedFocusIdentifierWasSetByClient;
- (BOOL)isAutoFocusDetection;
- (BOOL)isCustomDetection;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFixedFocusDetection;
- (BOOL)supportsVersion:(unint64_t)a3;
- (BOOL)writeToAtomWriter:(id)a3 options:(id)a4;
- (CGRect)rect;
- (NSDictionary)_namedSignals;
- (NSNumber)trackNumber;
- (NSString)accessibilityLabel;
- (NSString)cachedFocusIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (PTCinematographyDetection)initWithTime:(id *)a3 rect:(CGRect)a4 focusDistance:(float)a5;
- (float)focusDistance;
- (id)_asCinematographyDictionary;
- (id)_detectionByChangingTime:(id *)a3;
- (id)_initWithCinematographyDictionary:(id)a3;
- (id)_initWithDetectionData_0:(DetectionData_0 *)a3;
- (id)focusIdentifier;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)groupIdentifier;
- (int64_t)trackIdentifier;
- (unint64_t)detectionType;
- (unint64_t)hash;
- (unint64_t)sizeOfSerializedObjectWithOptions:(id)a3;
- (void)_clearCachedFocusIdentifier;
- (void)_setExcludedAsCinematicChoice:(BOOL)a3;
- (void)_setInvalid:(BOOL)a3;
- (void)setCachedFocusIdentifier:(id)a3;
- (void)setCachedFocusIdentifierWasSetByClient:(BOOL)a3;
- (void)setDetectionType:(unint64_t)a3;
- (void)setFocusDistance:(float)a3;
- (void)setFocusIdentifier:(id)a3;
- (void)setGroupIdentifier:(int64_t)a3;
- (void)setRect:(CGRect)a3;
- (void)setTime:(id *)a3;
- (void)setTrackIdentifier:(int64_t)a3;
- (void)setTrackNumber:(id)a3;
- (void)set_namedSignals:(id)a3;
@end

@implementation PTCinematographyDetection

+ (void)registerForSerialization
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PTCinematographyDetection_Serialization__registerForSerialization__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerForSerialization_onceToken != -1) {
    dispatch_once(&registerForSerialization_onceToken, block);
  }
}

void __68__PTCinematographyDetection_Serialization__registerForSerialization__block_invoke(uint64_t a1)
{
  +[PTSerialization registerType:1685349236 providerClass:*(void *)(a1 + 32)];
  v2 = [[PTSerializationTypeInfo alloc] initWithType:1685349235 providerClass:*(void *)(a1 + 32)];
  [(PTSerializationTypeInfo *)v2 setIsAtomContainerType:1];
  +[PTSerialization registerTypeInfo:v2];
}

- (id)_initWithDetectionData_0:(DetectionData_0 *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PTCinematographyDetection;
  v4 = [(PTCinematographyDetection *)&v11 init];
  v5 = v4;
  if (v4)
  {
    [(PTCinematographyDetection *)v4 setTrackIdentifier:bswap64(a3->var0)];
    [(PTCinematographyDetection *)v5 setGroupIdentifier:bswap64(a3->var1)];
    [(PTCinematographyDetection *)v5 setDetectionType:bswap32(a3->var2)];
    *(float *)&double v6 = _PTSwapBigGetFloat((unsigned int *)&a3->var3);
    [(PTCinematographyDetection *)v5 setFocusDistance:v6];
    double Float = _PTSwapBigGetFloat((unsigned int *)a3->var4);
    double v8 = _PTSwapBigGetFloat((unsigned int *)&a3->var4[1]);
    double v9 = _PTSwapBigGetFloat((unsigned int *)&a3->var4[2]);
    -[PTCinematographyDetection setRect:](v5, "setRect:", Float, v8, v9, _PTSwapBigGetFloat((unsigned int *)&a3->var4[3]));
  }
  return v5;
}

- (BOOL)_copyToDetectionData_0:(DetectionData_0 *)a3
{
  a3->var0 = bswap64([(PTCinematographyDetection *)self trackIdentifier]);
  a3->var1 = bswap64([(PTCinematographyDetection *)self groupIdentifier]);
  a3->var2 = bswap32([(PTCinematographyDetection *)self detectionType]);
  [(PTCinematographyDetection *)self focusDistance];
  _PTSwapBigAssignFloat(&a3->var3, v5);
  [(PTCinematographyDetection *)self rect];
  *(float *)&double v6 = v6;
  _PTSwapBigAssignFloat(a3->var4, *(float *)&v6);
  [(PTCinematographyDetection *)self rect];
  float v8 = v7;
  _PTSwapBigAssignFloat(&a3->var4[1], v8);
  [(PTCinematographyDetection *)self rect];
  float v10 = v9;
  _PTSwapBigAssignFloat(&a3->var4[2], v10);
  [(PTCinematographyDetection *)self rect];
  float v12 = v11;
  _PTSwapBigAssignFloat(&a3->var4[3], v12);
  return 1;
}

- (BOOL)supportsVersion:(unint64_t)a3
{
  return a3 == 0;
}

- (unint64_t)sizeOfSerializedObjectWithOptions:(id)a3
{
  return 52;
}

- (BOOL)writeToAtomWriter:(id)a3 options:(id)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  if ([(PTCinematographyDetection *)self _copyToDetectionData_0:v9])
  {
    [v5 beginAtomOfType:1685349236];
    [v5 appendVersion:0 flags:0];
    [v5 appendBytes:v9 size:40];
    [v5 endAtom];
    double v6 = [v5 error];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)objectFromAtomStream:(id)a3
{
  id v4 = a3;
  id v5 = [v4 error];

  if (v5
    || [v4 atomType] != 1685349236
    || ([v4 readCurrentAtomVersionAndFlags], objc_msgSend(v4, "atomVersion"))
    || (uint64_t v10 = 0,
        memset(v9, 0, sizeof(v9)),
        [v4 readCurrentAtomDataBytes:v9 size:40 offset:0],
        [v4 error],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = objc_msgSend(objc_alloc((Class)a1), "_initWithDetectionData_0:", v9);
  }

  return v7;
}

+ (id)objectsFromAtomStream:(id)a3
{
  id v4 = a3;
  if ([v4 atomType] != 1685349235
    || ([v4 readCurrentAtomVersionAndFlags], objc_msgSend(v4, "atomVersion")))
  {
    double v6 = 0;
    id v5 = 0;
  }
  else
  {
    id v5 = [[PTAtomStream alloc] initWithParent:v4];
    double v6 = [a1 _detectionsFromInnerAtomStream:v5];
  }

  return v6;
}

+ (id)_detectionsFromInnerAtomStream:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if (![v4 hasAtom]) {
    goto LABEL_10;
  }
  while ([v4 atomType] != 1685349236)
  {
LABEL_5:
    [v4 advanceToNextAtom];
    if (([v4 hasAtom] & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v6 = [a1 objectFromAtomStream:v4];
  if (v6)
  {
    BOOL v7 = (void *)v6;
    [v5 addObject:v6];

    goto LABEL_5;
  }
  float v8 = _PTLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[PTCinematographyDetection(Serialization) _detectionsFromInnerAtomStream:](v8);
  }

LABEL_10:
  double v9 = (void *)[v5 copy];

  return v9;
}

+ (unint64_t)sizeOfSerializedArray:(id)a3 options:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    unint64_t v10 = 12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v10 += [*(id *)(*((void *)&v13 + 1) + 8 * i) sizeOfSerializedObjectWithOptions:v6];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v10 = 12;
  }

  return v10;
}

+ (BOOL)writeArray:(id)a3 toAtomWriter:(id)a4 options:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v8 beginAtomOfType:1685349235];
  [v8 appendVersion:0 flags:0];
  unint64_t v10 = [[PTAtomWriter alloc] initWithParent:v8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "writeToAtomWriter:options:", v10, v9, (void)v19))
        {
          BOOL v17 = 0;
          long long v16 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  [v8 endAtom];
  long long v16 = [v8 error];
  BOOL v17 = v16 == 0;
LABEL_11:

  return v17;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    +[PTSerialization registerSerializationClass:a1];
  }
}

- (PTCinematographyDetection)initWithTime:(id *)a3 rect:(CGRect)a4 focusDistance:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)PTCinematographyDetection;
  result = [(PTCinematographyDetection *)&v13 init];
  if (result)
  {
    long long v12 = *(_OWORD *)&a3->var0;
    result->_time.epoch = a3->var3;
    *(_OWORD *)&result->_time.value = v12;
    result->_rect.origin.CGFloat x = x;
    result->_rect.origin.CGFloat y = y;
    result->_rect.size.CGFloat width = width;
    result->_rect.size.CGFloat height = height;
    result->_focusDistance = a5;
    result->_groupIdentifier = -1;
  }
  return result;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(PTCinematographyDetection *)self focusIdentifier];
  [(PTCinematographyDetection *)self time];
  id v5 = NSStringFromCMTime(&v11);
  id v6 = (void *)MEMORY[0x1E4F29238];
  [(PTCinematographyDetection *)self rect];
  id v7 = objc_msgSend(v6, "valueWithRect:");
  [(PTCinematographyDetection *)self focusDistance];
  id v9 = [v3 stringWithFormat:@"%@: %@: %@ focus: %g", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (NSString)debugDescription
{
  v3 = NSString;
  id v4 = [(PTCinematographyDetection *)self description];
  id v5 = (void *)MEMORY[0x1E4F29238];
  [(PTCinematographyDetection *)self rect];
  id v6 = objc_msgSend(v5, "valueWithRect:");
  id v7 = NSNumber;
  [(PTCinematographyDetection *)self focusDistance];
  float v8 = objc_msgSend(v7, "numberWithFloat:");
  id v9 = [(PTCinematographyDetection *)self trackNumber];
  unint64_t v10 = [v3 stringWithFormat:@"%@, rect: %@, focusDistance: %@, trackID: %@", v4, v6, v8, v9];

  return (NSString *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PTCinematographyDetection *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(PTCinematographyDetection *)self trackIdentifier];
      if (v6 != [(PTCinematographyDetection *)v5 trackIdentifier]) {
        goto LABEL_12;
      }
      unint64_t v7 = [(PTCinematographyDetection *)self detectionType];
      if (v7 != [(PTCinematographyDetection *)v5 detectionType]) {
        goto LABEL_12;
      }
      [(PTCinematographyDetection *)self focusDistance];
      float v9 = v8;
      [(PTCinematographyDetection *)v5 focusDistance];
      if (v9 != v10) {
        goto LABEL_12;
      }
      [(PTCinematographyDetection *)self time];
      if (v5) {
        [(PTCinematographyDetection *)v5 time];
      }
      else {
        memset(&v32, 0, sizeof(v32));
      }
      if (CMTimeCompare(&time1, &v32)) {
        goto LABEL_12;
      }
      [(PTCinematographyDetection *)self rect];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      [(PTCinematographyDetection *)v5 rect];
      float v24 = v14;
      *(float *)&double v25 = v25;
      if (v24 != *(float *)&v25) {
        goto LABEL_12;
      }
      float v26 = v16;
      float v27 = v21;
      if (v26 == v27 && (float v28 = v18, v29 = v22, v28 == v29))
      {
        float v30 = v20;
        float v31 = v23;
        BOOL v11 = v30 == v31;
      }
      else
      {
LABEL_12:
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v3 = [(PTCinematographyDetection *)self trackIdentifier];
  double v4 = (double)([(PTCinematographyDetection *)self detectionType] + v3);
  [(PTCinematographyDetection *)self time];
  double v5 = v4 + CMTimeGetSeconds(&time) * 600.0;
  [(PTCinematographyDetection *)self rect];
  double v7 = v5 + v6;
  [(PTCinematographyDetection *)self rect];
  return (unint64_t)(v7 + v8);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = [PTCinematographyDetection alloc];
  [(PTCinematographyDetection *)self time];
  [(PTCinematographyDetection *)self rect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PTCinematographyDetection *)self focusDistance];
  LODWORD(v14) = v13;
  double v15 = -[PTCinematographyDetection initWithTime:rect:focusDistance:](v4, "initWithTime:rect:focusDistance:", v21, v6, v8, v10, v12, v14);
  if (v15)
  {
    [(PTCinematographyDetection *)v15 setDetectionType:[(PTCinematographyDetection *)self detectionType]];
    double v16 = [(PTCinematographyDetection *)self trackNumber];
    [(PTCinematographyDetection *)v15 setTrackNumber:v16];

    [(PTCinematographyDetection *)v15 setGroupIdentifier:[(PTCinematographyDetection *)self groupIdentifier]];
    double v17 = [(PTCinematographyDetection *)self _namedSignals];
    double v18 = (void *)[v17 copy];
    [(PTCinematographyDetection *)v15 set_namedSignals:v18];

    if ([(PTCinematographyDetection *)self cachedFocusIdentifierWasSetByClient])
    {
      [(PTCinematographyDetection *)v15 setCachedFocusIdentifierWasSetByClient:[(PTCinematographyDetection *)self cachedFocusIdentifierWasSetByClient]];
      double v19 = [(PTCinematographyDetection *)self cachedFocusIdentifier];
      [(PTCinematographyDetection *)v15 setCachedFocusIdentifier:v19];
    }
  }
  return v15;
}

- (void)setDetectionType:(unint64_t)a3
{
  if (self->_detectionType != a3)
  {
    self->_detectionType = a3;
    [(PTCinematographyDetection *)self _clearCachedFocusIdentifier];
  }
}

- (int64_t)trackIdentifier
{
  v2 = [(PTCinematographyDetection *)self trackNumber];
  int64_t v3 = PTTrackIDFromNumber(v2);

  return v3;
}

- (void)setTrackIdentifier:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 0xFFFFFFFFLL)
  {
    double v4 = _PTLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v7 = self;
      _os_log_impl(&dword_1D0778000, v4, OS_LOG_TYPE_DEFAULT, "trackIdentifier missing from original detection %@", buf, 0xCu);
    }

    [(PTCinematographyDetection *)self setTrackNumber:0];
  }
  else
  {
    NSNumberFromPTTrackID(a3);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PTCinematographyDetection setTrackNumber:](self, "setTrackNumber:");
  }
}

- (void)setTrackNumber:(id)a3
{
  objc_storeStrong((id *)&self->_trackNumber, a3);

  [(PTCinematographyDetection *)self _clearCachedFocusIdentifier];
}

- (id)focusIdentifier
{
  cachedFocusIdentifier = self->_cachedFocusIdentifier;
  if (!cachedFocusIdentifier)
  {
    _PTFocusIdentifierMake([(PTCinematographyDetection *)self detectionType], [(PTCinematographyDetection *)self trackIdentifier]);
    double v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_cachedFocusIdentifier;
    self->_cachedFocusIdentifier = v4;

    cachedFocusIdentifier = self->_cachedFocusIdentifier;
  }

  return cachedFocusIdentifier;
}

- (NSString)accessibilityLabel
{
  int64_t v3 = objc_opt_class();
  unint64_t v4 = [(PTCinematographyDetection *)self detectionType];

  return (NSString *)[v3 accessibilityLabelForDetectionType:v4];
}

+ (id)accessibilityLabelForDetectionType:(unint64_t)a3
{
  return PTDetectionTypeAccessibilityLabel(a3);
}

- (void)setFocusIdentifier:(id)a3
{
  self->_cachedFocusIdentifierWasSetByClient = 1;
}

- (void)_clearCachedFocusIdentifier
{
  if (![(PTCinematographyDetection *)self cachedFocusIdentifierWasSetByClient])
  {
    cachedFocusIdentifier = self->_cachedFocusIdentifier;
    self->_cachedFocusIdentifier = 0;
  }
}

- (BOOL)_isInvalid
{
  return (unint64_t)[(PTCinematographyDetection *)self trackIdentifier] >> 63;
}

- (void)_setInvalid:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(PTCinematographyDetection *)self trackIdentifier];
  if (v3) {
    unint64_t v6 = 0x8000000000000000;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = v6 & 0x8000000000000000 | v5 & 0x7FFFFFFFFFFFFFFFLL;

  [(PTCinematographyDetection *)self setTrackIdentifier:v7];
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (int64_t)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(int64_t)a3
{
  self->_groupIdentifier = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (float)focusDistance
{
  return self->_focusDistance;
}

- (void)setFocusDistance:(float)a3
{
  self->_focusDistance = a3;
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (NSString)cachedFocusIdentifier
{
  return self->_cachedFocusIdentifier;
}

- (void)setCachedFocusIdentifier:(id)a3
{
}

- (BOOL)cachedFocusIdentifierWasSetByClient
{
  return self->_cachedFocusIdentifierWasSetByClient;
}

- (void)setCachedFocusIdentifierWasSetByClient:(BOOL)a3
{
  self->_cachedFocusIdentifierWasSetByClient = a3;
}

- (BOOL)_isExcludedAsCinematicChoice
{
  return self->__excludedAsCinematicChoice;
}

- (void)_setExcludedAsCinematicChoice:(BOOL)a3
{
  self->__excludedAsCinematicChoice = a3;
}

- (NSDictionary)_namedSignals
{
  return self->__namedSignals;
}

- (void)set_namedSignals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__namedSignals, 0);
  objc_storeStrong((id *)&self->_cachedFocusIdentifier, 0);

  objc_storeStrong((id *)&self->_trackNumber, 0);
}

- (id)_initWithCinematographyDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PTCinematographyDetection;
  int64_t v5 = [(PTCinematographyDetection *)&v25 init];
  if (v5)
  {
    unint64_t v6 = [v4 objectForKeyedSubscript:@"attributes"];
    CFDictionaryRef v7 = [v6 objectForKeyedSubscript:@"ptime"];
    CMTimeFromPTCinematographyDictionary(&v24, v7);
    *(CMTime *)(v5 + 56) = v24;

    uint64_t v8 = [v6 objectForKeyedSubscript:@"rect"];
    double v9 = v8;
    if (!v8) {
      uint64_t v8 = v6;
    }
    *((double *)v5 + 10) = CGRectFromPTCinematographyDictionary(v8);
    *((void *)v5 + 11) = v10;
    *((void *)v5 + 12) = v11;
    *((void *)v5 + 13) = v12;

    int v13 = [v6 objectForKeyedSubscript:@"disparity"];
    [v13 floatValue];
    *((_DWORD *)v5 + 3) = v14;

    double v15 = [v6 objectForKeyedSubscript:@"detected_object_id"];
    [v5 setTrackNumber:v15];

    uint64_t v16 = [v6 objectForKeyedSubscript:@"focus_id"];
    double v17 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v16;

    v5[8] = *((void *)v5 + 5) != 0;
    double v18 = [v6 objectForKeyedSubscript:@"group_id"];
    double v19 = v18;
    if (v18) {
      uint64_t v20 = [v18 integerValue];
    }
    else {
      uint64_t v20 = -1;
    }
    *((void *)v5 + 3) = v20;
    double v21 = [v6 objectForKeyedSubscript:@"label"];
    *((void *)v5 + 2) = [v21 integerValue];

    double v22 = [v6 objectForKeyedSubscript:@"MLSignals"];
    objc_msgSend(v5, "set_namedSignals:", v22);
  }
  return v5;
}

- (id)_asCinematographyDictionary
{
  v22[1] = *MEMORY[0x1E4F143B8];
  long long v3 = objc_opt_new();
  id v4 = [(PTCinematographyDetection *)self trackNumber];
  [v3 setObject:v4 forKeyedSubscript:@"detected_object_id"];

  [(PTCinematographyDetection *)self time];
  int64_t v5 = PTCinematographyDictionaryFromCMTime((uint64_t)&v20);
  [v3 setObject:v5 forKeyedSubscript:@"ptime"];

  if ([(PTCinematographyDetection *)self cachedFocusIdentifierWasSetByClient])
  {
    unint64_t v6 = [(PTCinematographyDetection *)self cachedFocusIdentifier];
    [v3 setObject:v6 forKeyedSubscript:@"focus_id"];
  }
  CFDictionaryRef v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PTCinematographyDetection detectionType](self, "detectionType"));
  [v3 setObject:v7 forKeyedSubscript:@"label"];

  uint64_t v8 = NSNumber;
  [(PTCinematographyDetection *)self focusDistance];
  double v9 = objc_msgSend(v8, "numberWithFloat:");
  [v3 setObject:v9 forKeyedSubscript:@"disparity"];

  if (([(PTCinematographyDetection *)self groupIdentifier] & 0x8000000000000000) == 0)
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[PTCinematographyDetection groupIdentifier](self, "groupIdentifier"));
    [v3 setObject:v10 forKeyedSubscript:@"group_id"];
  }
  [(PTCinematographyDetection *)self rect];
  double v15 = PTCinematographyDictionaryFromCGRect(v11, v12, v13, v14);
  [v3 setObject:v15 forKeyedSubscript:@"rect"];
  uint64_t v16 = [(PTCinematographyDetection *)self _namedSignals];
  [v3 setObject:v16 forKeyedSubscript:@"MLSignals"];

  double v21 = @"attributes";
  double v17 = (void *)[v3 copy];
  v22[0] = v17;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

  return v18;
}

+ (id)_detectionsFromCinematographyArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        double v11 = [PTCinematographyDetection alloc];
        id v12 = -[PTCinematographyDetection _initWithCinematographyDictionary:](v11, "_initWithCinematographyDictionary:", v10, (void)v15);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  double v13 = (void *)[v4 copy];

  return v13;
}

+ (id)_cinematographyArrayFromDetections:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_asCinematographyDictionary", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  double v11 = (void *)[v4 copy];

  return v11;
}

- (BOOL)_fixMissingTrackIdentifier:(int64_t)a3
{
  id v5 = [(PTCinematographyDetection *)self trackNumber];

  if (!v5)
  {
    uint64_t v6 = _PTLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[PTCinematographyDetection(Private) _fixMissingTrackIdentifier:]((uint64_t)self, v6);
    }

    uint64_t v7 = [NSNumber numberWithInteger:a3 | 0xFF00000000];
    [(PTCinematographyDetection *)self setTrackNumber:v7];
  }
  return v5 == 0;
}

+ (id)_detectionsByTrackIdentifierFromArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 += objc_msgSend(v11, "_fixMissingTrackIdentifier:", v9, (void)v15);
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "trackIdentifier"));
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  long long v13 = (void *)[v4 copy];

  return v13;
}

+ (id)_detectionsByFocusIdentifierFromArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        double v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 += objc_msgSend(v11, "_fixMissingTrackIdentifier:", v9, (void)v15);
        id v12 = [v11 focusIdentifier];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  long long v13 = (void *)[v4 copy];

  return v13;
}

- (BOOL)_isEqual:(id)a3
{
  id v4 = a3;
  if ([(PTCinematographyDetection *)self isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(PTCinematographyDetection *)self trackNumber];
    uint64_t v7 = [v5 trackNumber];
    unint64_t v8 = v6;
    unint64_t v9 = v7;
    uint64_t v10 = (void *)v9;
    if (v8 | v9)
    {
      if (!v8 || !v9)
      {

        goto LABEL_13;
      }
      int v29 = [(id)v8 isEqual:v9];

      if (!v29) {
        goto LABEL_13;
      }
    }
    int64_t v11 = [(PTCinematographyDetection *)self groupIdentifier];
    if (v11 == [v5 groupIdentifier])
    {
      unint64_t v12 = [(PTCinematographyDetection *)self detectionType];
      if (v12 == [v5 detectionType])
      {
        [(PTCinematographyDetection *)self focusDistance];
        float v14 = v13;
        [v5 focusDistance];
        if (v14 == v15)
        {
          [(PTCinematographyDetection *)self rect];
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          [v5 rect];
          v32.origin.double x = v24;
          v32.origin.double y = v25;
          v32.size.double width = v26;
          v32.size.double height = v27;
          v31.origin.double x = v17;
          v31.origin.double y = v19;
          v31.size.double width = v21;
          v31.size.double height = v23;
          BOOL v28 = CGRectEqualToRect(v31, v32);
LABEL_14:

          goto LABEL_15;
        }
      }
    }
LABEL_13:
    BOOL v28 = 0;
    goto LABEL_14;
  }
  BOOL v28 = 0;
LABEL_15:

  return v28;
}

- (id)_detectionByChangingTime:(id *)a3
{
  id v4 = (void *)[(PTCinematographyDetection *)self copy];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [v4 setTime:&v6];

  return v4;
}

+ (id)_prefixForDetectionType:(unint64_t)a3
{
  if ((uint64_t)a3 > 99)
  {
    switch(a3)
    {
      case 'd':
        return @"A";
      case 'e':
        return @"X";
      case 'f':
        return @"T";
      default:
        return @"U";
    }
  }
  else
  {
    id result = @"F";
    switch(a3)
    {
      case 1uLL:
        return result;
      case 2uLL:
        id result = @"H";
        break;
      case 3uLL:
        id result = @"B";
        break;
      case 4uLL:
        id result = @"C";
        break;
      case 5uLL:
        id result = @"D";
        break;
      case 9uLL:
        id result = @"CH";
        break;
      case 0xAuLL:
        id result = @"DH";
        break;
      case 0xBuLL:
        id result = @"SB";
        break;
      case 0xCuLL:
        id result = @"HFB";
        break;
      default:
        return @"U";
    }
  }
  return result;
}

+ (unint64_t)_detectionTypeForPrefix:(id)a3
{
  id v3 = a3;
  id v4 = [&unk_1F26C1268 objectForKeyedSubscript:v3];
  if (v4)
  {
    id v5 = [&unk_1F26C1290 objectForKeyedSubscript:v3];
    unint64_t v6 = [v5 unsignedLongValue];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isAutoFocusDetection
{
  return [(PTCinematographyDetection *)self detectionType] == 100;
}

- (BOOL)isFixedFocusDetection
{
  return [(PTCinematographyDetection *)self detectionType] == 101;
}

- (BOOL)isCustomDetection
{
  return [(PTCinematographyDetection *)self detectionType] == 102;
}

@end