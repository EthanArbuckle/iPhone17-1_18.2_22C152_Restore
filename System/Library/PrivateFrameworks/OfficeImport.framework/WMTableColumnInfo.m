@interface WMTableColumnInfo
- (WMTableColumnInfo)initWithStopArray:(id)a3;
- (float)stopAt:(unsigned int)a3;
- (unint64_t)count;
- (unsigned)columnSpan:(float)a3 at:(unsigned int)a4;
- (void)mergeStopArray:(id)a3;
@end

@implementation WMTableColumnInfo

- (WMTableColumnInfo)initWithStopArray:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WMTableColumnInfo;
  v5 = [(WMTableColumnInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v4];
    mStopArray = v5->mStopArray;
    v5->mStopArray = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)mergeStopArray:(id)a3
{
  id v18 = a3;
  if (v18)
  {
    [(WMTableColumnInfo *)self stopAt:0];
    float v5 = v4;
    LODWORD(v6) = 0;
    for (unsigned int i = 0; ; ++i)
    {
      if ([v18 count] <= (unint64_t)i) {
        goto LABEL_20;
      }
      v8 = [v18 objectAtIndex:i];
      [v8 floatValue];
      float v10 = v9;

      while ([(NSMutableArray *)self->mStopArray count] && v5 < v10)
      {
        if ([(NSMutableArray *)self->mStopArray count] - 1 <= (unint64_t)v6) {
          goto LABEL_13;
        }
        uint64_t v6 = (v6 + 1);
        [(WMTableColumnInfo *)self stopAt:v6];
        float v5 = v12;
      }
      if (v5 < v10) {
        break;
      }
      if (v10 >= v5)
      {
        if (v10 == v5)
        {
          uint64_t v6 = (v6 + 1);
          [(WMTableColumnInfo *)self stopAt:v6];
          goto LABEL_14;
        }
      }
      else
      {
        mStopArray = self->mStopArray;
        v17 = [v18 objectAtIndex:i];
        [(NSMutableArray *)mStopArray insertObject:v17 atIndex:v6];

        LODWORD(v6) = v6 + 1;
      }
LABEL_15:
      ;
    }
LABEL_13:
    v13 = self->mStopArray;
    v14 = [v18 objectAtIndex:i];
    [(NSMutableArray *)v13 addObject:v14];

    uint64_t v6 = (v6 + 1);
    [(WMTableColumnInfo *)self stopAt:v6];
LABEL_14:
    float v5 = v15;
    goto LABEL_15;
  }
LABEL_20:
}

- (float)stopAt:(unsigned int)a3
{
  float v5 = -1.0;
  if ([(NSMutableArray *)self->mStopArray count] > (unint64_t)a3)
  {
    uint64_t v6 = [(NSMutableArray *)self->mStopArray objectAtIndex:a3];
    [v6 floatValue];
    float v5 = v7;
  }
  return v5;
}

- (unsigned)columnSpan:(float)a3 at:(unsigned int)a4
{
  unint64_t v4 = *(void *)&a4;
  if (a4)
  {
    [(WMTableColumnInfo *)self stopAt:a4 - 1];
    float v8 = v7;
  }
  else
  {
    float v8 = 0.0;
  }
  LODWORD(v9) = v4;
  if ([(NSMutableArray *)self->mStopArray count] > (unint64_t)v4)
  {
    float v10 = v8 + a3;
    unint64_t v9 = v4;
    do
    {
      [(WMTableColumnInfo *)self stopAt:v9];
      if (v10 <= v11) {
        break;
      }
      unint64_t v9 = (v9 + 1);
    }
    while ([(NSMutableArray *)self->mStopArray count] > v9);
  }
  return v9 - v4 + 1;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->mStopArray count];
}

- (void).cxx_destruct
{
}

@end