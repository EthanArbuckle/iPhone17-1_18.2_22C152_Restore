@interface MNTransitWalkingSegmentInstruction
+ (id)instructionForWalkingSegment:(id)a3 context:(int64_t)a4;
- (GEOComposedWalkingRouteSegment)walkingSegment;
- (MNTransitWalkingSegmentInstruction)initWithWalkingSegment:(id)a3 context:(int64_t)a4;
- (id)instructionSet;
- (id)overridenInstructionsMapping;
@end

@implementation MNTransitWalkingSegmentInstruction

+ (id)instructionForWalkingSegment:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithWalkingSegment:v6 context:a4];

  return v7;
}

- (MNTransitWalkingSegmentInstruction)initWithWalkingSegment:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNTransitWalkingSegmentInstruction;
  v8 = [(MNTransitInstruction *)&v12 initWithContext:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_walkingSegment, a3);
    [(MNTransitInstruction *)v9 _fillInInstructions];
    v10 = v9;
  }

  return v9;
}

- (id)instructionSet
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(MNTransitWalkingSegmentInstruction *)self walkingSegment];
  v3 = [v2 steps];
  v4 = [v3 firstObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      v9 = "-[MNTransitWalkingSegmentInstruction instructionSet]";
      __int16 v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Instructions/MNTransitInstruction.m";
      __int16 v12 = 1024;
      int v13 = 378;
      __int16 v14 = 2080;
      v15 = "[step isKindOfClass:[GEOComposedTransitWalkingRouteStep class]]";
      _os_log_impl(&dword_1B542B000, v7, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", (uint8_t *)&v8, 0x26u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 instructions];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)overridenInstructionsMapping
{
  return 0;
}

- (GEOComposedWalkingRouteSegment)walkingSegment
{
  return self->_walkingSegment;
}

- (void).cxx_destruct
{
}

@end