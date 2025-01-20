@interface SBSpringloadingMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (SBSpringloadingMetric)init;
@end

@implementation SBSpringloadingMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  if (a3 == 31)
  {
    v6 = [a4 eventPayload];
    v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA74D8]];
    uint64_t v8 = [v7 unsignedIntegerValue];

    springloadTracker = self->_springloadTracker;
    v10 = [NSNumber numberWithUnsignedInteger:v8];
    v13[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [(PETScalarEventTracker *)springloadTracker trackEventWithPropertyValues:v11];
  }
  return a3 == 31;
}

- (SBSpringloadingMetric)init
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SBSpringloadingMetric;
  v2 = [(SBSpringloadingMetric *)&v11 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F93720];
    v13[0] = &unk_1F33499B0;
    v13[1] = &unk_1F33499C8;
    v14[0] = @"icon";
    v14[1] = @"gridSwitcher";
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
    v5 = [v3 propertyWithName:@"location" enumMapping:v4];

    id v6 = objc_alloc(MEMORY[0x1E4F93738]);
    v12 = v5;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    uint64_t v8 = [v6 initWithFeatureId:@"SpringBoard" event:@"Springload" registerProperties:v7];
    springloadTracker = v2->_springloadTracker;
    v2->_springloadTracker = (PETScalarEventTracker *)v8;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end