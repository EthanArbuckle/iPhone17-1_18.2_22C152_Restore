@interface MLMultiArray(Typed)
- (uint64_t)doublePointer;
- (uint64_t)floatPointer;
- (uint64_t)initForDoubleTypeWithShape:()Typed;
- (uint64_t)initForFloat32TypeWithShape:()Typed;
@end

@implementation MLMultiArray(Typed)

- (uint64_t)initForFloat32TypeWithShape:()Typed
{
  return [a1 initWithShape:a3 dataType:65568 error:0];
}

- (uint64_t)initForDoubleTypeWithShape:()Typed
{
  return [a1 initWithShape:a3 dataType:65600 error:0];
}

- (uint64_t)floatPointer
{
  id v1 = a1;
  return [v1 dataPointer];
}

- (uint64_t)doublePointer
{
  id v1 = a1;
  return [v1 dataPointer];
}

@end