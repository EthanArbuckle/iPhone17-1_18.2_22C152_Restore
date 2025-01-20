@interface PDSlideLayout
- (PDSlideLayout)initWithSlideMaster:(id)a3;
- (PDSlideMaster)slideMaster;
- (id)background;
- (id)defaultTheme;
- (id)description;
- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6;
- (id)parentTextStyleForTables;
- (id)transition;
- (int)slideLayoutType;
- (void)doneWithContent;
- (void)setSlideLayoutType:(int)a3;
- (void)setSlideMaster:(id)a3;
@end

@implementation PDSlideLayout

- (PDSlideLayout)initWithSlideMaster:(id)a3
{
  id v4 = a3;
  v5 = [(PDSlideChild *)self init];
  v6 = v5;
  if (v5)
  {
    LODWORD(v5->super.mColorMapOverride) = 0;
    objc_storeWeak((id *)&v5->mSlideLayoutType, v4);
  }

  return v6;
}

- (void)setSlideMaster:(id)a3
{
}

- (void)setSlideLayoutType:(int)a3
{
  LODWORD(self->super.mColorMapOverride) = a3;
}

- (PDSlideMaster)slideMaster
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mSlideLayoutType);
  return (PDSlideMaster *)WeakRetained;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  uint64_t v11 = objc_opt_class();
  v12 = [(PDSlideLayout *)self slideMaster];
  v13 = [v12 placeholderWithType:v8 placeholderTypeIndex:v7 overrideIndex:v6];
  v14 = TSUDynamicCast(v11, (uint64_t)v13);

  v15 = [v14 textBody];
  v16 = [v15 textListStyle];

  if (v16)
  {
    id v17 = v16;
  }
  else
  {
    v18 = [(PDSlideLayout *)self slideMaster];
    id v17 = [v18 parentTextStyleForPlaceholderType:v8 placeholderTypeIndex:v7 defaultTextListStyle:v10 overrideIndex:v6];
  }
  return v17;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = objc_opt_class();
  id v10 = [(PDSlideLayout *)self slideMaster];
  uint64_t v11 = [v10 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  v12 = TSUDynamicCast(v9, (uint64_t)v11);

  v13 = [v12 textBody];
  v14 = [v13 properties];

  return v14;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = objc_opt_class();
  id v10 = [(PDSlideLayout *)self slideMaster];
  uint64_t v11 = [v10 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  v12 = TSUDynamicCast(v9, (uint64_t)v11);
  v13 = [v12 shapeProperties];

  return v13;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = [(PDSlideLayout *)self slideMaster];
  uint64_t v9 = [v8 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];

  return v9;
}

- (int)slideLayoutType
{
  return (int)self->super.mColorMapOverride;
}

- (id)background
{
  v3 = self->super.super.mBackground;
  if (!v3)
  {
    p_mSlideLayoutType = &self->mSlideLayoutType;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mSlideLayoutType);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)p_mSlideLayoutType);
      v3 = [v6 background];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)defaultTheme
{
  v2 = [(PDSlideLayout *)self slideMaster];
  v3 = [v2 theme];

  return v3;
}

- (id)parentTextStyleForTables
{
  v2 = [(PDSlideLayout *)self slideMaster];
  v3 = [v2 parentTextStyleForTables];

  return v3;
}

- (id)transition
{
  v3 = self->super.super.mTransition;
  if (!v3)
  {
    p_mSlideLayoutType = &self->mSlideLayoutType;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mSlideLayoutType);

    if (WeakRetained)
    {
      id v6 = objc_loadWeakRetained((id *)p_mSlideLayoutType);
      v3 = [v6 transition];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)doneWithContent
{
  v2.receiver = self;
  v2.super_class = (Class)PDSlideLayout;
  [(PDSlideChild *)&v2 doneWithContent];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDSlideLayout;
  objc_super v2 = [(PDSlideChild *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end