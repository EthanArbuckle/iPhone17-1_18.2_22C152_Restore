@interface OADStyleMatrix
+ (id)objectInArray:(id)a3 withPossiblyOutOfRangeIndex:(unint64_t)a4 defaultValue:(id)a5;
- (BOOL)isEmpty;
- (NSString)name;
- (OADStyleMatrix)init;
- (id)bgFillAtIndex:(unint64_t)a3;
- (id)description;
- (id)effectsAtIndex:(unint64_t)a3;
- (id)effectsAtIndex:(unint64_t)a3 color:(id)a4;
- (id)fillAtIndex:(unint64_t)a3;
- (id)fillAtIndex:(unint64_t)a3 color:(id)a4;
- (id)strokeAtIndex:(unint64_t)a3;
- (id)strokeAtIndex:(unint64_t)a3 color:(id)a4;
- (unint64_t)bgFillCount;
- (unint64_t)effectsCount;
- (unint64_t)fillCount;
- (unint64_t)strokeCount;
- (void)addBgFill:(id)a3;
- (void)addEffects:(id)a3;
- (void)addFill:(id)a3;
- (void)addStroke:(id)a3;
- (void)padArray:(id)a3 withContentsOfArray:(id)a4;
- (void)setName:(id)a3;
- (void)validateStyleMatrix;
@end

@implementation OADStyleMatrix

- (OADStyleMatrix)init
{
  v12.receiver = self;
  v12.super_class = (Class)OADStyleMatrix;
  v2 = [(OADStyleMatrix *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFills = v2->mFills;
    v2->mFills = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mStrokes = v2->mStrokes;
    v2->mStrokes = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mEffects = v2->mEffects;
    v2->mEffects = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mBgFills = v2->mBgFills;
    v2->mBgFills = v9;
  }
  return v2;
}

- (void)addFill:(id)a3
{
}

- (void)addStroke:(id)a3
{
}

- (void)addEffects:(id)a3
{
}

- (void)addBgFill:(id)a3
{
}

- (id)strokeAtIndex:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3 - 1000;
    if (a3 <= 0x3E8) {
      unint64_t v3 = a3;
    }
    mStrokes = self->mStrokes;
    unint64_t v5 = v3 - 1;
    v6 = +[OADStroke blackStroke];
    v7 = +[OADStyleMatrix objectInArray:mStrokes withPossiblyOutOfRangeIndex:v5 defaultValue:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)objectInArray:(id)a3 withPossiblyOutOfRangeIndex:(unint64_t)a4 defaultValue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count] <= a4)
  {
    id v9 = v8;
  }
  else
  {
    id v9 = [v7 objectAtIndex:a4];
  }
  v10 = v9;

  return v10;
}

- (id)fillAtIndex:(unint64_t)a3
{
  if (a3)
  {
    if (a3 < 0x3E9)
    {
      mFills = self->mFills;
      unint64_t v5 = a3 - 1;
      v6 = +[OADSolidFill whiteFill];
      unint64_t v3 = +[OADStyleMatrix objectInArray:mFills withPossiblyOutOfRangeIndex:v5 defaultValue:v6];
    }
    else
    {
      unint64_t v3 = -[OADStyleMatrix bgFillAtIndex:](self, "bgFillAtIndex:");
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return v3;
}

- (id)effectsAtIndex:(unint64_t)a3
{
  if (a3)
  {
    unint64_t v3 = a3 - 1000;
    if (a3 <= 0x3E8) {
      unint64_t v3 = a3;
    }
    mEffects = self->mEffects;
    unint64_t v5 = v3 - 1;
    v6 = [MEMORY[0x263EFF8C0] array];
    id v7 = +[OADStyleMatrix objectInArray:mEffects withPossiblyOutOfRangeIndex:v5 defaultValue:v6];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)bgFillAtIndex:(unint64_t)a3
{
  mBgFills = self->mBgFills;
  unint64_t v4 = a3 - 1001;
  unint64_t v5 = +[OADSolidFill whiteFill];
  v6 = +[OADStyleMatrix objectInArray:mBgFills withPossiblyOutOfRangeIndex:v4 defaultValue:v5];

  return v6;
}

- (unint64_t)fillCount
{
  return [(NSMutableArray *)self->mFills count];
}

- (id)fillAtIndex:(unint64_t)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = [(OADStyleMatrix *)self fillAtIndex:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)[v7 copy];

    if (v6) {
      [v9 setStyleColor:v6];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)strokeCount
{
  return [(NSMutableArray *)self->mStrokes count];
}

- (id)strokeAtIndex:(unint64_t)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = [(OADStyleMatrix *)self strokeAtIndex:a3];
  id v8 = v7;
  if (v7)
  {
    id v9 = (void *)[v7 copy];

    if (v6) {
      [v9 setStyleColor:v6];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)effectsCount
{
  return [(NSMutableArray *)self->mEffects count];
}

- (id)effectsAtIndex:(unint64_t)a3 color:(id)a4
{
  id v6 = a4;
  id v7 = [(OADStyleMatrix *)self effectsAtIndex:a3];
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:v7 copyItems:1];

    if (v6) {
      [v8 makeObjectsPerformSelector:sel_setStyleColor_ withObject:v6];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (unint64_t)bgFillCount
{
  return [(NSMutableArray *)self->mBgFills count];
}

- (void)padArray:(id)a3 withContentsOfArray:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  unint64_t v6 = [v8 count];
  if (v6 < [v5 count])
  {
    id v7 = objc_msgSend(v5, "subarrayWithRange:", objc_msgSend(v8, "count"), objc_msgSend(v5, "count") - objc_msgSend(v8, "count"));
    [v8 addObjectsFromArray:v7];
  }
}

- (void)validateStyleMatrix
{
  id v10 = +[TCXmlUtilities bundlePathForXmlResource:@"DefaultStyleMatrix"];
  unint64_t v3 = (xmlDoc *)sfaxmlParseFile([v10 fileSystemRepresentation]);
  xmlNodePtr v4 = OCXGetRootElement(v3);
  if (v4)
  {
    id v5 = objc_opt_new();
    unint64_t v6 = [[OAXDrawingState alloc] initWithClient:0];
    +[OAXStyleMatrix readFromNode:v4 toStyleMatrix:v5 packagePart:0 drawingState:v6];
    xmlFreeDoc(v3);
    id v7 = [(OADStyleMatrix *)self name];
    uint64_t v8 = [v7 length];

    if (!v8)
    {
      id v9 = [v5 name];
      [(OADStyleMatrix *)self setName:v9];
    }
    [(OADStyleMatrix *)self padArray:self->mFills withContentsOfArray:v5[2]];
    [(OADStyleMatrix *)self padArray:self->mStrokes withContentsOfArray:v5[3]];
    [(OADStyleMatrix *)self padArray:self->mEffects withContentsOfArray:v5[4]];
    [(OADStyleMatrix *)self padArray:self->mBgFills withContentsOfArray:v5[5]];
  }
}

- (BOOL)isEmpty
{
  return ![(NSMutableArray *)self->mBgFills count]
      && ![(NSMutableArray *)self->mEffects count]
      && ![(NSMutableArray *)self->mStrokes count]
      && [(NSMutableArray *)self->mFills count] == 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADStyleMatrix;
  v2 = [(OADStyleMatrix *)&v4 description];
  return v2;
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBgFills, 0);
  objc_storeStrong((id *)&self->mEffects, 0);
  objc_storeStrong((id *)&self->mStrokes, 0);
  objc_storeStrong((id *)&self->mFills, 0);
  objc_storeStrong((id *)&self->mName, 0);
}

@end