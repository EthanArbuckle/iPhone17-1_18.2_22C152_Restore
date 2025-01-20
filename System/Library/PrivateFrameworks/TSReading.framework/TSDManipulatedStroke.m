@interface TSDManipulatedStroke
+ (Class)mutableClass;
- (BOOL)canApplyToShapeRenderable;
- (BOOL)drawsOutsideStrokeBounds;
- (BOOL)prefersToApplyToShapeRenderableDuringManipulation;
- (CGPath)manipulatePath:(CGPath *)a3 withLineWidth:(double)a4;
- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3;
- (TSDManipulatedStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9;
- (TSDPathManipulation)pathManipulation;
- (double)renderedWidth;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)strokeLineEnd:(id)a3;
- (unsigned)randomSeed;
- (void)applyInteriorWrapPropertiesInContext:(CGContext *)a3 insideStroke:(BOOL)a4;
- (void)dealloc;
- (void)p_setupDoodlesManipulation;
- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8;
- (void)seedRandom;
- (void)setPathManipulation:(id)a3;
- (void)setRandomSeed:(unsigned int)a3;
@end

@implementation TSDManipulatedStroke

- (void)p_setupDoodlesManipulation
{
  v3 = [(TSDPathManipulation *)[TSDVaryWidthPathManipulation alloc] initWithProperties:0 bundle:0 dataManager:0 precedingManipulation:0];
  [(TSDManipulatedStroke *)self setPathManipulation:v3];
}

- (TSDManipulatedStroke)initWithName:(id)a3 color:(id)a4 width:(double)a5 cap:(int)a6 join:(int)a7 pattern:(id)a8 miterLimit:(double)a9
{
  v12.receiver = self;
  v12.super_class = (Class)TSDManipulatedStroke;
  v10 = [(TSDSmartStroke *)&v12 initWithName:a3 color:a4 width:*(void *)&a6 cap:*(void *)&a7 join:a8 pattern:a5 miterLimit:a9];
  if (v10 && [a3 isEqualToString:@"Doodles"]) {
    [(TSDManipulatedStroke *)v10 p_setupDoodlesManipulation];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDManipulatedStroke;
  [(TSDSmartStroke *)&v3 dealloc];
}

- (BOOL)drawsOutsideStrokeBounds
{
  return 1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [TSDMutableManipulatedStroke alloc];
  v5 = [(TSDSmartStroke *)self strokeName];
  v6 = [(TSDStroke *)self color];
  [(TSDStroke *)self width];
  double v8 = v7;
  uint64_t v9 = [(TSDStroke *)self cap];
  uint64_t v10 = [(TSDStroke *)self join];
  v11 = [(TSDStroke *)self pattern];
  [(TSDStroke *)self miterLimit];
  v13 = [(TSDManipulatedStroke *)v4 initWithName:v5 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];
  [(TSDManipulatedStroke *)v13 setRandomSeed:[(TSDManipulatedStroke *)self randomSeed]];
  return v13;
}

- (void)applyInteriorWrapPropertiesInContext:(CGContext *)a3 insideStroke:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)TSDManipulatedStroke;
  [(TSDStroke *)&v4 applyToContext:a3 insideStroke:a4];
}

- (void)seedRandom
{
}

- (id)strokeLineEnd:(id)a3
{
  id v3 = a3;
  v5 = (void *)[a3 identifier];
  if (v3
    && (objc_msgSend(v5, "hasPrefix:", -[TSDSmartStroke strokeName](self, "strokeName")) & 1) == 0
    && self->mArrows)
  {
    uint64_t v6 = [v5 rangeOfString:@":"];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      v5 = (void *)[v5 substringFromIndex:v6 + v7];
    }
    mArrows = self->mArrows;
    return (id)[(NSMutableDictionary *)mArrows objectForKey:v5];
  }
  else
  {
    if ((objc_msgSend(v5, "hasPrefix:", -[TSDSmartStroke strokeName](self, "strokeName")) & 1) == 0)
    {
      v10.receiver = self;
      v10.super_class = (Class)TSDManipulatedStroke;
      return [(TSDStroke *)&v10 strokeLineEnd:v3];
    }
    return v3;
  }
}

- (CGPath)manipulatePath:(CGPath *)a3 withLineWidth:(double)a4
{
  [(TSDManipulatedStroke *)self seedRandom];
  mManipulation = self->mManipulation;
  if (!mManipulation) {
    return a3;
  }
  return [(TSDPathManipulation *)mManipulation manipulatePath:a3 withLineWidth:a4];
}

- (void)paintPath:(CGPath *)a3 wantsInteriorStroke:(BOOL)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6 parameterized:(BOOL)a7 shouldReverseDrawOrder:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v12 = a4;
  [(TSDStroke *)self width];
  v15.receiver = self;
  v15.super_class = (Class)TSDManipulatedStroke;
  -[TSDStroke paintPath:wantsInteriorStroke:inContext:useFastDrawing:parameterized:shouldReverseDrawOrder:](&v15, sel_paintPath_wantsInteriorStroke_inContext_useFastDrawing_parameterized_shouldReverseDrawOrder_, -[TSDManipulatedStroke manipulatePath:withLineWidth:](self, "manipulatePath:withLineWidth:", a3), v12, a5, v10, v9, v8);
}

- (BOOL)canApplyToShapeRenderable
{
  return 1;
}

- (BOOL)prefersToApplyToShapeRenderableDuringManipulation
{
  return 0;
}

- (CGPath)pathToStrokeFromCGPath:(CGPath *)a3
{
  [(TSDStroke *)self width];
  return -[TSDManipulatedStroke manipulatePath:withLineWidth:](self, "manipulatePath:withLineWidth:", a3);
}

+ (Class)mutableClass
{
  return (Class)objc_opt_class();
}

- (double)renderedWidth
{
  if (self->mManipulation)
  {
    [(TSDStroke *)self i_width];
    return v2 * 4.0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDManipulatedStroke;
    [(TSDStroke *)&v4 width];
  }
  return result;
}

- (unsigned)randomSeed
{
  return self->mRandomSeed;
}

- (void)setRandomSeed:(unsigned int)a3
{
  self->mRandomSeed = a3;
}

- (TSDPathManipulation)pathManipulation
{
  return self->mManipulation;
}

- (void)setPathManipulation:(id)a3
{
}

@end