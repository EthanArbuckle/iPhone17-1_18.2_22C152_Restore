@interface NSCoder(_DUIVisibleDroppedItemVectorCoding)
- (void)_uikit_decodeSPVector3DForKey:()_DUIVisibleDroppedItemVectorCoding;
- (void)_uikit_encodeSPVector3D:()_DUIVisibleDroppedItemVectorCoding forKey:;
@end

@implementation NSCoder(_DUIVisibleDroppedItemVectorCoding)

- (void)_uikit_encodeSPVector3D:()_DUIVisibleDroppedItemVectorCoding forKey:
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v6 = NSNumber;
  double v7 = *a3;
  id v8 = a4;
  v9 = [v6 numberWithDouble:v7];
  v10 = objc_msgSend(NSNumber, "numberWithDouble:", a3[1], v9);
  v13[1] = v10;
  v11 = [NSNumber numberWithDouble:a3[2]];
  v13[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  [a1 encodeObject:v12 forKey:v8];
}

- (void)_uikit_decodeSPVector3DForKey:()_DUIVisibleDroppedItemVectorCoding
{
  id v5 = a2;
  id v16 = [a1 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:v5];

  v6 = v16;
  if (v16 && (BOOL v7 = [v16 count] == 3, v6 = v16, v7))
  {
    id v8 = [v16 objectAtIndexedSubscript:0];
    [v8 doubleValue];
    uint64_t v10 = v9;
    v11 = [v16 objectAtIndexedSubscript:1];
    [v11 doubleValue];
    uint64_t v13 = v12;
    v14 = [v16 objectAtIndexedSubscript:2];
    [v14 doubleValue];
    *a3 = v10;
    a3[1] = v13;
    a3[2] = v15;
    a3[3] = 0;

    v6 = v16;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *((_OWORD *)a3 + 1) = 0u;
  }
}

@end