@interface ODDPoint
+ (void)addConnectionToPoint:(id)a3 order:(unint64_t)a4 array:(id *)a5;
- (ODDPoint)init;
- (id)description;
- (id)propertySet;
- (id)shapeProperties;
- (id)text;
- (int)type;
- (void)setText:(id)a3;
- (void)setType:(int)a3;
@end

@implementation ODDPoint

- (ODDPoint)init
{
  v8.receiver = self;
  v8.super_class = (Class)ODDPoint;
  v2 = [(ODDPoint *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(ODDPointPropertySet);
    mPropertySet = v2->mPropertySet;
    v2->mPropertySet = v3;

    v5 = objc_alloc_init(OADShapeProperties);
    mShapeProperties = v2->mShapeProperties;
    v2->mShapeProperties = v5;
  }
  return v2;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)shapeProperties
{
  return self->mShapeProperties;
}

- (id)propertySet
{
  return self->mPropertySet;
}

- (void)setText:(id)a3
{
}

+ (void)addConnectionToPoint:(id)a3 order:(unint64_t)a4 array:(id *)a5
{
  id v16 = a3;
  id v7 = *a5;
  if (!*a5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    *a5 = v7;
  }
  unint64_t v8 = [v7 count];
  unint64_t v9 = a4 - v8;
  if (a4 > v8)
  {
    do
    {
      id v10 = *a5;
      v11 = [MEMORY[0x263EFF9D0] null];
      [v10 addObject:v11];

      --v9;
    }
    while (v9);
  }
  uint64_t v12 = [*a5 count];
  id v13 = *a5;
  if (v12 == a4)
  {
    [v13 addObject:v16];
  }
  else
  {
    v14 = [v13 objectAtIndex:a4];
    v15 = [MEMORY[0x263EFF9D0] null];

    if (v14 == v15) {
      [*a5 replaceObjectAtIndex:a4 withObject:v16];
    }
    else {
      [MEMORY[0x263EFF940] raise:@"ODDException" format:@"Point already has a connection at the given order"];
    }
  }
}

- (int)type
{
  return self->mType;
}

- (id)text
{
  return self->mText;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)ODDPoint;
  v2 = [(ODDPoint *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mText, 0);
  objc_storeStrong((id *)&self->mShapeProperties, 0);
  objc_storeStrong((id *)&self->mPropertySet, 0);
}

@end