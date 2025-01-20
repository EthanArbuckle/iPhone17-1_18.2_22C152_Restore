@interface PXStoryConcreteCompanionTimeline
- (NSString)diagnosticDescription;
- (PXStoryColorGradingRepository)colorGradingRepository;
- (PXStoryCompanionColorEffect)colorGradingEffect;
- (PXStoryConcreteCompanionTimeline)init;
- (PXStoryConcreteCompanionTimeline)initWithTimeline:(id)a3 colorGradeKind:(int64_t)a4 colorGradingRepository:(id)a5;
- (PXStoryTimeline)timeline;
- (id)segmentAtIndex:(int64_t)a3;
- (int64_t)colorGradeKind;
- (int64_t)numberOfSegments;
@end

@implementation PXStoryConcreteCompanionTimeline

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorGradingRepository, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
}

- (PXStoryColorGradingRepository)colorGradingRepository
{
  return self->_colorGradingRepository;
}

- (int64_t)colorGradeKind
{
  return self->_colorGradeKind;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (NSString)diagnosticDescription
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXStoryConcreteCompanionTimeline *)self timeline];
  v7 = [v6 diagnosticDescription];
  [(PXStoryConcreteCompanionTimeline *)self colorGradeKind];
  v8 = PFStoryColorGradeKindToString();
  v9 = [(PXStoryConcreteCompanionTimeline *)self colorGradingRepository];
  v10 = (void *)[v3 initWithFormat:@"<%@: %p, timeline=%@, colorGradeKind=%@, colorGradingRepository=%@>", v5, self, v7, v8, v9];

  return (NSString *)v10;
}

- (PXStoryCompanionColorEffect)colorGradingEffect
{
  id v3 = [(PXStoryConcreteCompanionTimeline *)self colorGradingRepository];
  v4 = objc_msgSend(v3, "colorLookupCubeForColorGradeKind:", -[PXStoryConcreteCompanionTimeline colorGradeKind](self, "colorGradeKind"));

  v5 = [[_PXStoryConcreteCompanionColorEffect alloc] initWithColorLookupCube:v4];
  return (PXStoryCompanionColorEffect *)v5;
}

- (id)segmentAtIndex:(int64_t)a3
{
  v5 = [_PXStoryConcreteCompanionTimelineSegment alloc];
  v6 = [(PXStoryConcreteCompanionTimeline *)self timeline];
  v7 = [(_PXStoryConcreteCompanionTimelineSegment *)v5 initWithTimeline:v6 segmentIndex:a3];

  return v7;
}

- (int64_t)numberOfSegments
{
  v2 = [(PXStoryConcreteCompanionTimeline *)self timeline];
  int64_t v3 = [v2 numberOfSegments];

  return v3;
}

- (PXStoryConcreteCompanionTimeline)initWithTimeline:(id)a3 colorGradeKind:(int64_t)a4 colorGradingRepository:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXStoryConcreteCompanionTimeline;
  v11 = [(PXStoryConcreteCompanionTimeline *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timeline, a3);
    v12->_colorGradeKind = a4;
    objc_storeStrong((id *)&v12->_colorGradingRepository, a5);
  }

  return v12;
}

- (PXStoryConcreteCompanionTimeline)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXStoryConcreteCompanionTimeline.m", 64, @"%s is not available as initializer", "-[PXStoryConcreteCompanionTimeline init]");

  abort();
}

@end