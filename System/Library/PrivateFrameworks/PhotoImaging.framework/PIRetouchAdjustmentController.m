@interface PIRetouchAdjustmentController
+ (id)clipRectKey;
+ (id)detectedFacesKey;
+ (id)enabledKey;
+ (id)inputStrokesKey;
+ (id)modeKey;
+ (id)repairEdgesKey;
+ (id)sourceOffsetKey;
+ (id)sourceOffsetXKey;
+ (id)sourceOffsetYKey;
- (NSArray)detectedFaces;
- (unint64_t)retouchStrokeCount;
- (void)appendStroke:(id)a3;
- (void)setDetectedFaces:(id)a3;
@end

@implementation PIRetouchAdjustmentController

- (unint64_t)retouchStrokeCount
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIRetouchAdjustmentController inputStrokesKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  unint64_t v5 = [v4 count];
  return v5;
}

- (void)setDetectedFaces:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8 = v4;
    if ([v4 count])
    {
      unint64_t v5 = (void *)[v8 copy];
      v6 = [(PIAdjustmentController *)self adjustment];
      v7 = +[PIRetouchAdjustmentController detectedFacesKey];
      [v6 setObject:v5 forKeyedSubscript:v7];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (NSArray)detectedFaces
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIRetouchAdjustmentController detectedFacesKey];
  id v4 = [v2 objectForKeyedSubscript:v3];
  unint64_t v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (void)appendStroke:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  unint64_t v5 = +[PIRetouchBrushStroke dictionaryFromBrushStroke:a3];
  id v14 = [v4 dictionaryWithDictionary:v5];

  v6 = [(PIAdjustmentController *)self adjustment];
  v7 = +[PIRetouchAdjustmentController inputStrokesKey];
  v8 = [v6 objectForKeyedSubscript:v7];

  if (!v8)
  {
    v8 = [MEMORY[0x1E4F1C978] array];
  }
  if (![v8 count])
  {
    v9 = [(PIAdjustmentController *)self adjustment];
    v10 = +[PIRetouchAdjustmentController enabledKey];
    [v9 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v10];
  }
  v11 = [v8 arrayByAddingObject:v14];

  v12 = [(PIAdjustmentController *)self adjustment];
  v13 = +[PIRetouchAdjustmentController inputStrokesKey];
  [v12 setObject:v11 forKeyedSubscript:v13];
}

+ (id)repairEdgesKey
{
  return @"repairEdges";
}

+ (id)detectedFacesKey
{
  return @"detectedFaces";
}

+ (id)enabledKey
{
  return @"enabled";
}

+ (id)inputStrokesKey
{
  return @"inputStrokes";
}

+ (id)sourceOffsetKey
{
  return @"sourceOffset";
}

+ (id)sourceOffsetYKey
{
  return @"y";
}

+ (id)sourceOffsetXKey
{
  return @"x";
}

+ (id)modeKey
{
  return @"mode";
}

+ (id)clipRectKey
{
  return @"clipRect";
}

@end