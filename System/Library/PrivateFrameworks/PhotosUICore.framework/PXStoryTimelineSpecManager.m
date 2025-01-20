@interface PXStoryTimelineSpecManager
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration;
- (Class)specClass;
- (NSIndexSet)allowedTransitionKinds;
- (PXStoryTimelineSpec)timelineSpec;
- (PXStoryTimelineSpecManager)initWithExtendedTraitCollection:(id)a3 configuration:(id)a4;
- (PXStoryTimelineSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (char)fallbackTransitionKind;
- (unint64_t)allowedInlineTitles;
- (unint64_t)defaultChangesToUpdateFor;
- (unint64_t)storyTransitionCurveType;
@end

@implementation PXStoryTimelineSpecManager

- (void).cxx_destruct
{
}

- (char)fallbackTransitionKind
{
  return self->_fallbackTransitionKind;
}

- (unint64_t)storyTransitionCurveType
{
  return self->_storyTransitionCurveType;
}

- (NSIndexSet)allowedTransitionKinds
{
  return self->_allowedTransitionKinds;
}

- (unint64_t)allowedInlineTitles
{
  return self->_allowedInlineTitles;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)fixedSegmentDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (unint64_t)defaultChangesToUpdateFor
{
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTimelineSpecManager;
  return [(PXFeatureSpecManager *)&v3 defaultChangesToUpdateFor] | 0x10;
}

- (PXStoryTimelineSpec)timelineSpec
{
  v4 = [(PXFeatureSpecManager *)self spec];
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXStoryTimelineSpecManager.m", 51, @"Invalid parameter not satisfying: %@", @"timelineSpec != nil" object file lineNumber description];
  }
  [(PXStoryTimelineSpecManager *)self fixedSegmentDuration];
  long long v8 = v10;
  uint64_t v9 = v11;
  [v4 setFixedSegmentDuration:&v8];
  objc_msgSend(v4, "setAllowedInlineTitles:", -[PXStoryTimelineSpecManager allowedInlineTitles](self, "allowedInlineTitles"));
  v5 = [(PXStoryTimelineSpecManager *)self allowedTransitionKinds];
  [v4 setAllowedTransitionKinds:v5];

  objc_msgSend(v4, "setFallbackTransitionKind:", -[PXStoryTimelineSpecManager fallbackTransitionKind](self, "fallbackTransitionKind"));
  objc_msgSend(v4, "setStoryTransitionCurveType:", -[PXStoryTimelineSpecManager storyTransitionCurveType](self, "storyTransitionCurveType"));
  return (PXStoryTimelineSpec *)v4;
}

- (Class)specClass
{
  return (Class)objc_opt_class();
}

- (PXStoryTimelineSpecManager)initWithExtendedTraitCollection:(id)a3 configuration:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXStoryTimelineSpecManager;
  v7 = [(PXFeatureSpecManager *)&v16 initWithExtendedTraitCollection:a3 options:0];
  if (v7)
  {
    if (v6)
    {
      [v6 fixedSegmentDuration];
    }
    else
    {
      long long v14 = 0uLL;
      uint64_t v15 = 0;
    }
    *((void *)v7 + 21) = v15;
    *(_OWORD *)(v7 + 152) = v14;
    *((void *)v7 + 16) = [v6 allowedInlineTitles];
    uint64_t v8 = [v6 allowedTransitionKinds];
    uint64_t v9 = (void *)*((void *)v7 + 17);
    *((void *)v7 + 17) = v8;

    long long v10 = [v6 launchType];
    unsigned int v11 = [v10 isEqualToString:@"TVMemoriesScreenSaver"];

    if (v11) {
      char v12 = 2;
    }
    else {
      char v12 = 1;
    }
    v7[120] = v12;
    *((void *)v7 + 18) = v11;
  }

  return (PXStoryTimelineSpecManager *)v7;
}

- (PXStoryTimelineSpecManager)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryTimelineSpecManager.m", 29, @"%s is not available as initializer", "-[PXStoryTimelineSpecManager initWithExtendedTraitCollection:options:]");

  abort();
}

@end