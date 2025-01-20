@interface PGFeatureAugmenterMixUp
+ (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5;
+ (id)instanceWithParameters:(id)a3 error:(id *)a4;
+ (id)mixupOfFloatVector:(id)a3 withFloatVector:(id)a4 lambda:(float)a5;
+ (id)name;
- (PGFeatureAugmenterMixUp)initWithCount:(unint64_t)a3 alpha:(float)a4 error:(id *)a5;
- (float)alpha;
- (id)_randomIndicesWithUpperBound:(unint64_t)a3 count:(unint64_t)a4;
- (id)floatVectorWithFloatVector:(id)a3 error:(id *)a4;
- (id)floatVectorsWithFloatVectors:(id)a3 error:(id *)a4;
- (unint64_t)count;
@end

@implementation PGFeatureAugmenterMixUp

- (float)alpha
{
  return self->_alpha;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)_randomIndicesWithUpperBound:(unint64_t)a3 count:(unint64_t)a4
{
  v4 = 0;
  if (a3)
  {
    uint32_t v6 = a3;
    if (a3 >= a4)
    {
      if (a3 == a4)
      {
        v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, a3);
      }
      else
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        v4 = v7;
        if (a4)
        {
          uint64_t v8 = 0;
          do
          {
            do
              uint64_t v9 = arc4random_uniform(v6);
            while ([v4 containsIndex:v9]);
            [v4 addIndex:v9];
            ++v8;
          }
          while (v8 != a4);
        }
      }
    }
  }
  return v4;
}

- (id)floatVectorsWithFloatVectors:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= [(PGFeatureAugmenterMixUp *)self count])
    {
      id v16 = v7;
      goto LABEL_7;
    }
    uint64_t v9 = [(PGFeatureAugmenterMixUp *)self _randomIndicesWithUpperBound:v6 count:2];
    if (!v9) {
      break;
    }
    [(PGFeatureAugmenterMixUp *)self alpha];
    [(PGFeatureAugmenterMixUp *)self alpha];
    uint32_t v10 = arc4random();
    v11 = [v5 objectsAtIndexes:v9];
    v12 = [v11 objectAtIndexedSubscript:0];
    v13 = [v11 objectAtIndexedSubscript:1];
    double v14 = (double)v10 / 4294967300.0;
    *(float *)&double v14 = v14;
    v15 = +[PGFeatureAugmenterMixUp mixupOfFloatVector:v12 withFloatVector:v13 lambda:v14];
    [v7 addObject:v15];
  }
  +[PGFeatureAugmenterMixUp _generateError:a4 withCode:0 andMessage:@"MixUp requires at least 2 original samples."];
  id v16 = 0;
LABEL_7:

  return v16;
}

- (id)floatVectorWithFloatVector:(id)a3 error:(id *)a4
{
  return a3;
}

- (PGFeatureAugmenterMixUp)initWithCount:(unint64_t)a3 alpha:(float)a4 error:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)PGFeatureAugmenterMixUp;
  uint64_t v8 = [(PGFeatureAugmenterMixUp *)&v12 init];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_5;
  }
  if (a4 != 0.0)
  {
    v8->_count = a3;
    v8->_alpha = a4;
LABEL_5:
    uint32_t v10 = v8;
    goto LABEL_6;
  }
  +[PGFeatureAugmenterMixUp _generateError:a5 withCode:1 andMessage:@"MixUp can not be initialized with alpha = 0."];
  uint32_t v10 = 0;
LABEL_6:

  return v10;
}

+ (BOOL)_generateError:(id *)a3 withCode:(int64_t)a4 andMessage:(id)a5
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = v7;
  if (a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = v7;
    uint32_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v9 errorWithDomain:@"com.apple.PhotosGraph.PGFeatureAugmenterMixUp" code:a4 userInfo:v10];
  }
  return 1;
}

+ (id)mixupOfFloatVector:(id)a3 withFloatVector:(id)a4 lambda:(float)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F71EF8]);
  uint64_t v10 = [v7 count];
  if (v10 >= 1)
  {
    uint64_t v12 = 0;
    LODWORD(v11) = 1.0;
    do
    {
      objc_msgSend(v7, "floatAtIndex:", v12, v11);
      float v14 = v13;
      [v8 floatAtIndex:v12];
      *(float *)&double v16 = (float)((float)(1.0 - a5) * v15) + (float)(a5 * v14);
      [v9 appendFloat:v16];
      ++v12;
    }
    while (v10 != v12);
  }

  return v9;
}

+ (id)instanceWithParameters:(id)a3 error:(id *)a4
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  BOOL v7 = +[PGFeatureTransformerHelper validParameters:v5 ofTypes:v6];

  if (v7)
  {
    id v8 = [v5 objectAtIndexedSubscript:0];
    id v9 = [v5 objectAtIndexedSubscript:1];
    id v10 = objc_alloc((Class)objc_opt_class());
    unsigned int v11 = [v8 unsignedIntValue];
    [v9 floatValue];
    uint64_t v12 = objc_msgSend(v10, "initWithCount:alpha:error:", v11, a4);
  }
  else
  {
    +[PGFeatureAugmenterMixUp _generateError:a4 withCode:2 andMessage:@"Failed to instantiate PGFeatureAugmenterMixUp: incorrect parameters."];
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)name
{
  return @"MixUp";
}

@end