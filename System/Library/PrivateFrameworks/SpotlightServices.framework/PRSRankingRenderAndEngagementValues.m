@interface PRSRankingRenderAndEngagementValues
+ (BOOL)supportsSecureCoding;
- (BOOL)getRankingValues:(signed __int16 *)a3 withRankingValueSize:(unint64_t)a4 forType:(int)a5;
- (PRSRankingRenderAndEngagementValues)init;
- (PRSRankingRenderAndEngagementValues)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementRankingValuesForType:(int)a3;
- (void)setRankingValues:(signed __int16)a3[6] forType:(int)a4;
@end

@implementation PRSRankingRenderAndEngagementValues

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  id result = (id)objc_opt_new();
  if (result)
  {
    uint64_t v5 = *(void *)self->_renderValues;
    *((_DWORD *)result + 4) = *(_DWORD *)&self->_renderValues[4];
    *((void *)result + 1) = v5;
    uint64_t v6 = *(void *)self->_engagementValues;
    *((_DWORD *)result + 7) = *(_DWORD *)&self->_engagementValues[4];
    *(void *)((char *)result + 20) = v6;
  }
  return result;
}

- (PRSRankingRenderAndEngagementValues)init
{
  v3.receiver = self;
  v3.super_class = (Class)PRSRankingRenderAndEngagementValues;
  return [(PRSRankingRenderAndEngagementValues *)&v3 init];
}

- (PRSRankingRenderAndEngagementValues)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PRSRankingRenderAndEngagementValues *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"values"];
    if ([v6 count] == 12)
    {
      for (uint64_t i = 0; i != 6; ++i)
      {
        v8 = [v6 objectAtIndexedSubscript:i];
        v9 = (char *)v5 + 2 * i;
        *((_WORD *)v9 + 4) = [v8 shortValue];

        v10 = [v6 objectAtIndexedSubscript:i + 6];
        *((_WORD *)v9 + 10) = [v10 shortValue];
      }
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v20[12] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v5 = self->_renderValues[0];
  id v19 = a3;
  v18 = [v4 numberWithShort:v5];
  v20[0] = v18;
  v17 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_renderValues[1]];
  v20[1] = v17;
  v16 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_renderValues[2]];
  v20[2] = v16;
  uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_renderValues[3]];
  v20[3] = v6;
  v7 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_renderValues[4]];
  v20[4] = v7;
  v8 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_renderValues[5]];
  v20[5] = v8;
  v9 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_engagementValues[0]];
  v20[6] = v9;
  v10 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_engagementValues[1]];
  v20[7] = v10;
  v11 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_engagementValues[2]];
  v20[8] = v11;
  v12 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_engagementValues[3]];
  v20[9] = v12;
  v13 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_engagementValues[4]];
  v20[10] = v13;
  v14 = [MEMORY[0x1E4F28ED0] numberWithShort:self->_engagementValues[5]];
  v20[11] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:12];

  [v19 encodeObject:v15 forKey:@"values"];
}

- (BOOL)getRankingValues:(signed __int16 *)a3 withRankingValueSize:(unint64_t)a4 forType:(int)a5
{
  if (a4 != 6) {
    return 0;
  }
  if (!a5)
  {
    uint64_t v5 = 20;
    goto LABEL_7;
  }
  if (a5 != 1) {
    return 0;
  }
  uint64_t v5 = 8;
LABEL_7:
  v7 = (char *)self + v5;
  uint64_t v8 = *(void *)v7;
  *((_DWORD *)a3 + 2) = *((_DWORD *)v7 + 2);
  *(void *)a3 = v8;
  return 1;
}

- (void)setRankingValues:(signed __int16)a3[6] forType:(int)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    uint64_t v4 = 8;
  }
  else
  {
    uint64_t v4 = 20;
  }
  uint64_t v5 = (char *)self + v4;
  uint64_t v6 = *(void *)a3;
  *((_DWORD *)v5 + 2) = *((_DWORD *)a3 + 2);
  *(void *)uint64_t v5 = v6;
}

- (void)incrementRankingValuesForType:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      uint64_t v3 = 0;
      renderValues = self->_renderValues;
      do
      {
        int v5 = (unsigned __int16)renderValues[v3];
        if (v5 != 0x7FFF) {
          renderValues[v3] = v5 + 1;
        }
        ++v3;
      }
      while (v3 != 6);
    }
  }
  else
  {
    uint64_t v6 = 0;
    engagementValues = self->_engagementValues;
    do
    {
      int v8 = (unsigned __int16)engagementValues[v6];
      if (v8 != 0x7FFF) {
        engagementValues[v6] = v8 + 1;
      }
      ++v6;
    }
    while (v6 != 6);
  }
}

@end