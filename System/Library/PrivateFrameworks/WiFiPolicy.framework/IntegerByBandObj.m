@interface IntegerByBandObj
+ (id)integerByBandWith:(id *)a3;
+ (id)integerByBandWith:(id *)a3 withCap:(BOOL)a4;
- ($FEE1510A43A03BFC9F45CB2D5A0A197D)candidateSet;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCandidateSet:(id *)a3;
@end

@implementation IntegerByBandObj

+ (id)integerByBandWith:(id *)a3
{
  id v4 = objc_alloc_init((Class)a1);
  long long v5 = *(_OWORD *)&a3->var0[2];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  [v4 setCandidateSet:v7];

  return v4;
}

+ (id)integerByBandWith:(id *)a3 withCap:(BOOL)a4
{
  id v5 = objc_alloc_init((Class)a1);
  long long v6 = *(_OWORD *)&a3->var0[2];
  v13[0] = *(_OWORD *)a3->var0;
  v13[1] = v6;
  [v5 setCandidateSet:v13];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v8 = (char *)v12 + i;
    if (v5)
    {
      [v5 candidateSet];
      if (v8[24])
      {
        [v5 candidateSet];
        if (*((uint64_t *)v11 + i) >= 6)
        {
          [v5 candidateSet];
LABEL_9:
          *((void *)v10 + i) = 6;
          continue;
        }
      }
    }
    else
    {
      memset(v12, 0, sizeof(v12));
      if (v8[24])
      {
        memset(v11, 0, sizeof(v11));
        if (*((uint64_t *)v11 + i) > 5)
        {
          memset(v10, 0, sizeof(v10));
          goto LABEL_9;
        }
      }
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  [(IntegerByBandObj *)self candidateSet];
  [v4 integerByBandWith:&v6];
  return (id)objc_claimAutoreleasedReturnValue();
}

- ($FEE1510A43A03BFC9F45CB2D5A0A197D)candidateSet
{
  long long v3 = *(_OWORD *)self->var1;
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[1];
  *(_OWORD *)&retstr->var0[2] = v3;
  return self;
}

- (void)setCandidateSet:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_candidateSet.valueByBand[2] = *(_OWORD *)&a3->var0[2];
  *(_OWORD *)self->_candidateSet.valueByBand = v3;
}

@end