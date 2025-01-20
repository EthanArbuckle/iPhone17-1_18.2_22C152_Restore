@interface PPCombinedScoreInputSet
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

@implementation PPCombinedScoreInputSet

- (unint64_t)undefinedObjectScoreIndex
{
  return -1;
}

- (unint64_t)objectScoreIndexUpperBound
{
  return 0;
}

- (unint64_t)minObjectScoreIndex
{
  return 0;
}

- (id)nameForObjectScoreIndex:(unint64_t)a3
{
  if (a3 == -1) {
    return @"PPCombinedScoreInputObjectUndefined";
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPCombinedScoreInputMethods.h", 298, @"Value %tu forPPCombinedScoreInputObject out of range", a3);

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
    return @"PPCombinedScoreInputArrayUndefined";
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPCombinedScoreInputMethods.h", 261, @"Value %tu forPPCombinedScoreInputArray out of range", a3);

  __break(1u);
  return result;
}

- (unint64_t)undefinedScalarScoreIndex
{
  return -1;
}

- (unint64_t)scalarScoreIndexUpperBound
{
  return 104;
}

- (unint64_t)minScalarScoreIndex
{
  return 0;
}

- (id)nameForScalarScoreIndex:(unint64_t)a3
{
  if (a3 + 1 < 0x69) {
    return off_1E65DB3D0[a3 + 1];
  }
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PPCombinedScoreInputMethods.h", 224, @"Value %tu forPPCombinedScoreInputScalar out of range", a3);

  __break(1u);
  return result;
}

@end