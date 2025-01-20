@interface CarClusterUpdateLaneGuidance
+ (id)_integersKeyed;
+ (id)laneGuidanceUpdateWithComposedGuidanceEvent:(id)a3 component:(id)a4;
- (BOOL)hasBeenSent;
- (GEOComposedGuidanceEvent)composedGuidanceEvent;
- (NSArray)laneInfoList;
- (NSNumber)index;
- (NSString)instructionText;
- (NSUUID)uniqueID;
- (id)debugProperties;
- (void)setComposedGuidanceEvent:(id)a3;
- (void)setHasBeenSent:(BOOL)a3;
- (void)setIndex:(id)a3;
- (void)setInstructionText:(id)a3;
- (void)setLaneInfoList:(id)a3;
@end

@implementation CarClusterUpdateLaneGuidance

+ (id)laneGuidanceUpdateWithComposedGuidanceEvent:(id)a3 component:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 lanes];
  id v8 = [v7 count];

  if (v8)
  {
    v9 = objc_opt_new();
    [v9 setComponent:v6];
    [v9 setComposedGuidanceEvent:v5];
    v10 = [v5 lanes];
    v11 = +[CarClusterUpdateLaneGuidanceLaneInfo laneGuidanceLaneInfoUpdateWithComposedRouteLaneInfos:v10];
    [v9 setLaneInfoList:v11];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSUUID)uniqueID
{
  v2 = [(CarClusterUpdateLaneGuidance *)self composedGuidanceEvent];
  v3 = [v2 uniqueID];

  return (NSUUID *)v3;
}

- (void)setInstructionText:(id)a3
{
  v4 = [a3 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  instructionText = self->_instructionText;
  self->_instructionText = v4;
}

- (id)debugProperties
{
  unsigned int v2 = [(CarClusterUpdateLaneGuidance *)self hasBeenSent];
  CFStringRef v3 = @"NO";
  if (v2) {
    CFStringRef v3 = @"YES";
  }
  return +[NSString stringWithFormat:@"hasBeenSent=%@", v3];
}

+ (id)_integersKeyed
{
  if (qword_101610AE0 != -1) {
    dispatch_once(&qword_101610AE0, &stru_10131B770);
  }
  unsigned int v2 = (void *)qword_101610AE8;

  return v2;
}

- (BOOL)hasBeenSent
{
  return self->_hasBeenSent;
}

- (void)setHasBeenSent:(BOOL)a3
{
  self->_hasBeenSent = a3;
}

- (GEOComposedGuidanceEvent)composedGuidanceEvent
{
  return self->_composedGuidanceEvent;
}

- (void)setComposedGuidanceEvent:(id)a3
{
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIndex:(id)a3
{
}

- (NSArray)laneInfoList
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLaneInfoList:(id)a3
{
}

- (NSString)instructionText
{
  return self->_instructionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionText, 0);
  objc_storeStrong((id *)&self->_laneInfoList, 0);
  objc_storeStrong((id *)&self->_index, 0);

  objc_storeStrong((id *)&self->_composedGuidanceEvent, 0);
}

@end