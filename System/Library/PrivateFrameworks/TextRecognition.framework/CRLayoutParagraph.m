@interface CRLayoutParagraph
- (BOOL)canWrapToNextGroup;
- (CRLayoutParagraph)initWithLines:(id)a3;
- (CRNormalizedQuad)boundingQuad;
- (NSArray)subregions;
- (NSString)text;
- (NSUUID)uuid;
- (unint64_t)layoutDirection;
- (unint64_t)textRegionType;
- (void)setBoundingQuad:(id)a3;
- (void)setCanWrapToNextGroup:(BOOL)a3;
- (void)setSubregions:(id)a3;
- (void)setText:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CRLayoutParagraph

- (unint64_t)layoutDirection
{
  v3 = [(CRLayoutParagraph *)self subregions];
  if ([v3 count])
  {
    v4 = [(CRLayoutParagraph *)self subregions];
    v5 = [v4 firstObject];
    unint64_t v6 = [v5 layoutDirection];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)textRegionType
{
  return 3;
}

- (CRLayoutParagraph)initWithLines:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CRLayoutParagraph;
  v5 = [(CRLayoutParagraph *)&v45 init];
  if (v5)
  {
    unint64_t v6 = (void *)[v4 copy];
    [(CRLayoutParagraph *)v5 setSubregions:v6];

    v7 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      v35 = v5;
      id v36 = v4;
      int v11 = 0;
      uint64_t v12 = *(void *)v42;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v12) {
            objc_enumerationMutation(v8);
          }
          v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          v16 = [v15 boundingQuad];
          [v16 baselineAngle];
          __double2 v18 = __sincos_stret(v17);
          __double2 v19 = __sincos_stret(v13);
          double v13 = atan2(v19.__sinval * (double)(v11 + (int)i) + v18.__sinval, v19.__cosval * (double)(v11 + (int)i) + v18.__cosval);

          v20 = &stru_1F38EED68;
          if (v11 + i != [v8 count] - 1)
          {
            v20 = +[CRLineWrapper joiningDelimiterForLine:v15];
          }
          v21 = [v15 text];
          [v7 appendFormat:@"%@%@", v21, v20];
        }
        v11 += v10;
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v10);
      float v22 = v13;
      v5 = v35;
      id v4 = v36;
    }
    else
    {
      float v22 = 0.0;
    }
    id v23 = v4;

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = v8;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      v27 = 0;
      uint64_t v28 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = [*(id *)(*((void *)&v37 + 1) + 8 * j) boundingQuad];
          v32 = (void *)v30;
          if (v27)
          {
            *(float *)&double v31 = v22;
            uint64_t v33 = [v27 unionWithNormalizedQuad:v30 baselineAngle:v31];

            v27 = (void *)v33;
          }
          else
          {
            v27 = (void *)v30;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    [(CRLayoutParagraph *)v5 setText:v7];
    [(CRLayoutParagraph *)v5 setBoundingQuad:v27];

    id v4 = v23;
  }

  return v5;
}

- (BOOL)canWrapToNextGroup
{
  return self->_canWrapToNextGroup;
}

- (void)setCanWrapToNextGroup:(BOOL)a3
{
  self->_canWrapToNextGroup = a3;
}

- (CRNormalizedQuad)boundingQuad
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBoundingQuad:(id)a3
{
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setText:(id)a3
{
}

- (NSArray)subregions
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubregions:(id)a3
{
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_subregions, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
}

@end