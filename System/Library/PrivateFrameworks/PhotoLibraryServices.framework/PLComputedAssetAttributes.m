@interface PLComputedAssetAttributes
+ (id)entityName;
+ (id)fetchRequest;
- (void)setPropertiesFromImageAestheticsObservation:(id)a3;
@end

@implementation PLComputedAssetAttributes

+ (id)entityName
{
  return @"ComputedAssetAttributes";
}

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"ComputedAssetAttributes"];
  return v2;
}

- (void)setPropertiesFromImageAestheticsObservation:(id)a3
{
  id v4 = a3;
  [v4 wellFramedSubjectScore];
  -[PLComputedAssetAttributes setWellFramedSubjectScore:](self, "setWellFramedSubjectScore:");
  [v4 tastefullyBlurredScore];
  -[PLComputedAssetAttributes setTastefullyBlurredScore:](self, "setTastefullyBlurredScore:");
  [v4 sharplyFocusedSubjectScore];
  -[PLComputedAssetAttributes setSharplyFocusedSubjectScore:](self, "setSharplyFocusedSubjectScore:");
  [v4 wellTimedShotScore];
  -[PLComputedAssetAttributes setWellTimedShotScore:](self, "setWellTimedShotScore:");
  [v4 pleasantLightingScore];
  -[PLComputedAssetAttributes setPleasantLightingScore:](self, "setPleasantLightingScore:");
  [v4 pleasantReflectionsScore];
  -[PLComputedAssetAttributes setPleasantReflectionsScore:](self, "setPleasantReflectionsScore:");
  [v4 harmoniousColorScore];
  -[PLComputedAssetAttributes setHarmoniousColorScore:](self, "setHarmoniousColorScore:");
  [v4 livelyColorScore];
  -[PLComputedAssetAttributes setLivelyColorScore:](self, "setLivelyColorScore:");
  [v4 pleasantSymmetryScore];
  -[PLComputedAssetAttributes setPleasantSymmetryScore:](self, "setPleasantSymmetryScore:");
  [v4 pleasantPatternScore];
  -[PLComputedAssetAttributes setPleasantPatternScore:](self, "setPleasantPatternScore:");
  [v4 immersivenessScore];
  -[PLComputedAssetAttributes setImmersivenessScore:](self, "setImmersivenessScore:");
  [v4 pleasantPerspectiveScore];
  -[PLComputedAssetAttributes setPleasantPerspectiveScore:](self, "setPleasantPerspectiveScore:");
  [v4 pleasantPostProcessingScore];
  -[PLComputedAssetAttributes setPleasantPostProcessingScore:](self, "setPleasantPostProcessingScore:");
  [v4 noiseScore];
  -[PLComputedAssetAttributes setNoiseScore:](self, "setNoiseScore:");
  [v4 noiseScore];
  -[PLComputedAssetAttributes setNoiseScore:](self, "setNoiseScore:");
  [v4 failureScore];
  -[PLComputedAssetAttributes setFailureScore:](self, "setFailureScore:");
  [v4 pleasantCompositionScore];
  -[PLComputedAssetAttributes setPleasantCompositionScore:](self, "setPleasantCompositionScore:");
  [v4 interestingSubjectScore];
  -[PLComputedAssetAttributes setInterestingSubjectScore:](self, "setInterestingSubjectScore:");
  [v4 intrusiveObjectPresenceScore];
  -[PLComputedAssetAttributes setIntrusiveObjectPresenceScore:](self, "setIntrusiveObjectPresenceScore:");
  [v4 pleasantCameraTiltScore];
  -[PLComputedAssetAttributes setPleasantCameraTiltScore:](self, "setPleasantCameraTiltScore:");
  [v4 lowKeyLightingScore];
  int v6 = v5;

  LODWORD(v7) = v6;
  [(PLComputedAssetAttributes *)self setLowLight:v7];
}

@end