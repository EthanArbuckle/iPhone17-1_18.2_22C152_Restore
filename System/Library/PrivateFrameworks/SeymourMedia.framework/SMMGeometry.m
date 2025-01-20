@interface SMMGeometry
+ (CGPoint)getCenter:(CGRect)a3;
+ (double)ceilValue:(double)a3 toScale:(double)a4;
+ (double)ceilValue:(double)a3 toScaleOfScreen:(id)a4;
+ (double)ceilValue:(double)a3 toScaleOfView:(id)a4;
+ (double)floorValue:(double)a3 toScale:(double)a4;
+ (double)floorValue:(double)a3 toScaleOfScreen:(id)a4;
+ (double)floorValue:(double)a3 toScaleOfView:(id)a4;
+ (double)roundValue:(double)a3 toScale:(double)a4;
+ (double)roundValue:(double)a3 toScaleOfScreen:(id)a4;
+ (double)roundValue:(double)a3 toScaleOfView:(id)a4;
@end

@implementation SMMGeometry

+ (double)floorValue:(double)a3 toScale:(double)a4
{
  MEMORY[0x270F82D20](a1, a2, a3, a4);
  return result;
}

+ (double)floorValue:(double)a3 toScaleOfView:(id)a4
{
  MEMORY[0x270F82D28](a4, a2, a3);
  return result;
}

+ (double)floorValue:(double)a3 toScaleOfScreen:(id)a4
{
  uint64_t v5 = [a4 scale];

  MEMORY[0x270F82D20](v5, v6, a3, v7);
  return result;
}

+ (double)roundValue:(double)a3 toScale:(double)a4
{
  MEMORY[0x270F82EF0](a1, a2, a3, a4);
  return result;
}

+ (double)roundValue:(double)a3 toScaleOfView:(id)a4
{
  MEMORY[0x270F82F00](a4, a2, a3);
  return result;
}

+ (double)roundValue:(double)a3 toScaleOfScreen:(id)a4
{
  MEMORY[0x270F82EF8](a4, a2, a3);
  return result;
}

+ (double)ceilValue:(double)a3 toScale:(double)a4
{
  MEMORY[0x270F82CB8](a1, a2, a3, a4);
  return result;
}

+ (double)ceilValue:(double)a3 toScaleOfView:(id)a4
{
  MEMORY[0x270F82CC0](a4, a2, a3);
  return result;
}

+ (double)ceilValue:(double)a3 toScaleOfScreen:(id)a4
{
  uint64_t v5 = [a4 scale];

  MEMORY[0x270F82CB8](v5, v6, a3, v7);
  return result;
}

+ (CGPoint)getCenter:(CGRect)a3
{
  MEMORY[0x270F82EB8](a1, a2, (__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
  result.y = v4;
  result.x = v3;
  return result;
}

@end