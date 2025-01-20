@interface PPTopicAggScoreInputSet
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

@implementation PPTopicAggScoreInputSet

- (unint64_t)undefinedObjectScoreIndex
{
  return -1;
}

- (unint64_t)objectScoreIndexUpperBound
{
  return 12;
}

- (unint64_t)minObjectScoreIndex
{
  return 0;
}

- (id)nameForObjectScoreIndex:(unint64_t)a3
{
  if (a3 + 1 < 0xD) {
    return off_1E65D47B0[a3 + 1];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPTopicAggScoreInputMethods.h", 162, @"Value %tu forPPTopicAggScoreInputObject out of range", a3);

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
    return @"PPTopicAggScoreInputArrayUndefined";
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPTopicAggScoreInputMethods.h", 101, @"Value %tu forPPTopicAggScoreInputArray out of range", a3);

  __break(1u);
  return result;
}

- (unint64_t)undefinedScalarScoreIndex
{
  return -1;
}

- (unint64_t)scalarScoreIndexUpperBound
{
  return 24;
}

- (unint64_t)minScalarScoreIndex
{
  return 0;
}

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  if (a3 + 1 < 0x19) {
    return off_1E65D46E8[a3 + 1];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPTopicAggScoreInputMethods.h", 64, @"Value %tu forPPTopicAggScoreInputScalar out of range", a3);

  __break(1u);
  return result;
}

@end