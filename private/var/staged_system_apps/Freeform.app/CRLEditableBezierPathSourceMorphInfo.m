@interface CRLEditableBezierPathSourceMorphInfo
- (CRLEditableBezierPathSource)original;
- (CRLEditableBezierPathSource)smoothOriginal;
- (CRLEditableBezierPathSourceMorphInfo)initWithEditableBezierPathSource:(id)a3;
- (id)originalNodeForNode:(id)a3;
- (id)originalSmoothNodeForNode:(id)a3;
- (unint64_t)originalNodeIndexForNode:(id)a3;
- (unint64_t)originalSubpathIndexForNode:(id)a3;
- (void)setOriginal:(id)a3;
- (void)setSmoothOriginal:(id)a3;
@end

@implementation CRLEditableBezierPathSourceMorphInfo

- (CRLEditableBezierPathSourceMorphInfo)initWithEditableBezierPathSource:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)CRLEditableBezierPathSourceMorphInfo;
  v5 = [(CRLEditableBezierPathSourceMorphInfo *)&v33 init];
  if (v5)
  {
    id v6 = [v4 copy];
    id v7 = [v4 copy];
    [v7 updateSmoothNodes];
    v27 = v6;
    objc_storeStrong((id *)&v5->mOriginal, v6);
    v26 = v7;
    objc_storeStrong((id *)&v5->mSmoothOriginal, v7);
    v8 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:512 valueOptions:0 capacity:0];
    mOriginalNodeIndexMapping = v5->mOriginalNodeIndexMapping;
    v5->mOriginalNodeIndexMapping = v8;

    v10 = [v4 subpaths];
    v11 = (char *)[v10 count];

    v29 = v11;
    if (v11)
    {
      v12 = 0;
      v13 = &off_1014C1000;
      id v28 = v4;
      do
      {
        v14 = [v4 subpaths:v26, v27];
        v15 = [v14 objectAtIndexedSubscript:v12];

        v30 = v15;
        v16 = [v15 nodes];
        v17 = (char *)[v16 count];
        if (v17)
        {
          v18 = 0;
          v31 = v17;
          v32 = v12;
          do
          {
            v19 = v5->mOriginalNodeIndexMapping;
            v20 = [(__objc2_class *)v13[90] numberWithUnsignedInteger:v12];
            v34[0] = v20;
            v21 = [(__objc2_class *)v13[90] numberWithUnsignedInteger:v18];
            v34[1] = v21;
            +[NSArray arrayWithObjects:v34 count:2];
            v23 = v22 = v13;
            v24 = [v16 objectAtIndexedSubscript:v18];
            [(NSMapTable *)v19 setObject:v23 forKey:v24];

            v13 = v22;
            v12 = v32;
            ++v18;
          }
          while (v31 != v18);
        }

        ++v12;
        id v4 = v28;
      }
      while (v12 != v29);
    }
  }
  return v5;
}

- (id)originalNodeForNode:(id)a3
{
  id v4 = [(NSMapTable *)self->mOriginalNodeIndexMapping objectForKeyedSubscript:a3];
  if (v4)
  {
    v5 = [(CRLEditableBezierPathSource *)self->mOriginal subpaths];
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v5 objectAtIndexedSubscript:[v6 unsignedIntegerValue]];

    v8 = [v7 nodes];
    v9 = [v4 objectAtIndexedSubscript:1];
    v10 = [v8 objectAtIndexedSubscript:[v9 unsignedIntegerValue]];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)originalSubpathIndexForNode:(id)a3
{
  v3 = [(NSMapTable *)self->mOriginalNodeIndexMapping objectForKeyedSubscript:a3];
  id v4 = [v3 objectAtIndexedSubscript:0];
  id v5 = [v4 unsignedIntegerValue];

  return (unint64_t)v5;
}

- (unint64_t)originalNodeIndexForNode:(id)a3
{
  v3 = [(NSMapTable *)self->mOriginalNodeIndexMapping objectForKeyedSubscript:a3];
  id v4 = [v3 objectAtIndexedSubscript:1];
  id v5 = [v4 unsignedIntegerValue];

  return (unint64_t)v5;
}

- (id)originalSmoothNodeForNode:(id)a3
{
  id v4 = [(NSMapTable *)self->mOriginalNodeIndexMapping objectForKeyedSubscript:a3];
  if (v4)
  {
    id v5 = [(CRLEditableBezierPathSource *)self->mSmoothOriginal subpaths];
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = [v5 objectAtIndexedSubscript:[v6 unsignedIntegerValue]];

    v8 = [v7 nodes];
    v9 = [v4 objectAtIndexedSubscript:1];
    v10 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntegerValue"));
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CRLEditableBezierPathSource)original
{
  return self->mOriginal;
}

- (void)setOriginal:(id)a3
{
}

- (CRLEditableBezierPathSource)smoothOriginal
{
  return self->mSmoothOriginal;
}

- (void)setSmoothOriginal:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOriginalNodeIndexMapping, 0);
  objc_storeStrong((id *)&self->mSmoothOriginal, 0);

  objc_storeStrong((id *)&self->mOriginal, 0);
}

@end