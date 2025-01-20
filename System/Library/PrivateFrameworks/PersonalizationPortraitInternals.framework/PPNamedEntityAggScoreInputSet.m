@interface PPNamedEntityAggScoreInputSet
- (id)nameForArrayScoreIndex:(unint64_t)a3;
- (id)nameForObjectScoreIndex:(unint64_t)a3;
- (id)nameForScalarScoreIndex:(unint64_t)a3;
- (unint64_t)arrayScoreIndexUpperBound;
- (unint64_t)minArrayScoreIndex;
- (unint64_t)minObjectScoreIndex;
- (unint64_t)minScalarScoreIndex;
- (unint64_t)objectScoreIndexUpperBound;
- (unint64_t)scalarScoreIndexUpperBound;
- (unint64_t)undefinedArrayScoreIndex;
- (unint64_t)undefinedObjectScoreIndex;
- (unint64_t)undefinedScalarScoreIndex;
@end

@implementation PPNamedEntityAggScoreInputSet

- (unint64_t)undefinedObjectScoreIndex
{
  return -1;
}

- (unint64_t)objectScoreIndexUpperBound
{
  return 13;
}

- (unint64_t)minObjectScoreIndex
{
  return 0;
}

- (id)nameForObjectScoreIndex:(unint64_t)a3
{
  if (a3 + 1 < 0xE) {
    return off_1E65D6828[a3 + 1];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPNamedEntityAggScoreInputMethods.h", 166, @"Value %tu forPPNamedEntityAggScoreInputObject out of range", a3);

  __break(1u);
  return result;
}

- (unint64_t)undefinedArrayScoreIndex
{
  return -1;
}

- (unint64_t)arrayScoreIndexUpperBound
{
  return 0;
}

- (unint64_t)minArrayScoreIndex
{
  return 0;
}

- (id)nameForArrayScoreIndex:(unint64_t)a3
{
  if (a3 == -1) {
    return @"PPNamedEntityAggScoreInputArrayUndefined";
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPNamedEntityAggScoreInputMethods.h", 103, @"Value %tu forPPNamedEntityAggScoreInputArray out of range", a3);

  __break(1u);
  return result;
}

- (unint64_t)undefinedScalarScoreIndex
{
  return -1;
}

- (unint64_t)scalarScoreIndexUpperBound
{
  return 25;
}

- (unint64_t)minScalarScoreIndex
{
  return 0;
}

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  if (a3 + 1 < 0x1A) {
    return off_1E65D6758[a3 + 1];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPNamedEntityAggScoreInputMethods.h", 66, @"Value %tu forPPNamedEntityAggScoreInputScalar out of range", a3);

  __break(1u);
  return result;
}

@end