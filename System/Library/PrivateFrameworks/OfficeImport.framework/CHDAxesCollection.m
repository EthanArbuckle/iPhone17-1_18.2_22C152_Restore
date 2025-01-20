@interface CHDAxesCollection
- (id)axesAtPosition:(int)a3;
- (id)axisAtPosition:(int)a3;
- (void)adjustAxesPositionForHorizontalChart;
@end

@implementation CHDAxesCollection

- (void)adjustAxesPositionForHorizontalChart
{
  unint64_t v3 = [(EDCollection *)self count];
  if (v3)
  {
    unint64_t v4 = v3;
    for (uint64_t i = 0; i != v4; ++i)
    {
      v6 = [(EDCollection *)self objectAtIndex:i];
      [v6 adjustAxisPositionForHorizontalChart];
    }
  }
}

- (id)axesAtPosition:(int)a3
{
  v5 = [MEMORY[0x263EFF980] array];
  unint64_t v6 = [(EDCollection *)self count];
  if (v6)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      v8 = [(EDCollection *)self objectAtIndex:i];
      if ([v8 axisPosition] == a3) {
        [v5 addObject:v8];
      }
    }
  }
  return v5;
}

- (id)axisAtPosition:(int)a3
{
  v5 = -[CHDAxesCollection axesAtPosition:](self, "axesAtPosition:");
  uint64_t v6 = [v5 count];
  unsigned int v7 = a3 & 0xFFFFFFFE;
  if (v6)
  {
    uint64_t v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = [v5 objectAtIndex:v8];

      if ((((v7 == 2) ^ [v10 isSecondary]) & 1) == 0) {
        break;
      }
      ++v8;
      v9 = v10;
      if (v6 == v8) {
        goto LABEL_7;
      }
    }
    v12 = v5;
    goto LABEL_16;
  }
  v10 = 0;
LABEL_7:
  if (a3 >= 4) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = (3 - a3);
  }
  v12 = [(CHDAxesCollection *)self axesAtPosition:v11];

  v13 = 0;
  uint64_t v14 = [v12 count];
  if (v14)
  {
    while (1)
    {
      v15 = [v12 objectAtIndex:v13];

      if ((((v7 == 2) ^ [v15 isSecondary]) & 1) == 0) {
        break;
      }
      ++v13;
      v10 = v15;
      if ((char *)v14 == v13)
      {
        v13 = 0;
        v10 = v15;
        goto LABEL_17;
      }
    }
    v10 = v15;
LABEL_16:
    v13 = v10;
    v10 = v13;
  }
LABEL_17:

  return v13;
}

@end