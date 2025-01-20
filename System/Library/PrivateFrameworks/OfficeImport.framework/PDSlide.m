@interface PDSlide
- (OITSUNoCopyDictionary)commentParents;
- (id)background;
- (id)commentAtIndex:(unint64_t)a3;
- (id)commentForAuthorId:(unint64_t)a3 authorIdx:(unint64_t)a4;
- (id)defaultTheme;
- (id)description;
- (id)inheritedTextStyleForPlaceholderType:(int)a3;
- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)notesSlide;
- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5;
- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6;
- (id)parentTextStyleForTables;
- (id)slideLayout;
- (id)transition;
- (unint64_t)commentCount;
- (void)addComment:(id)a3;
- (void)doneWithContent;
- (void)removeUnnecessaryOverrides;
- (void)setCommentParents:(id)a3;
- (void)setInheritedTextStyle:(id)a3 placeholderType:(int)a4 defaultTextListStyle:(id)a5;
- (void)setNotesSlide:(id)a3;
- (void)setSlideLayout:(id)a3;
- (void)setUpPropertyHierarchyPreservingEffectiveValues;
@end

@implementation PDSlide

- (void)setSlideLayout:(id)a3
{
}

- (id)slideLayout
{
  return self->super.mColorMapOverride;
}

- (id)parentTextStyleForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 defaultTextListStyle:(id)a5 overrideIndex:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  v11 = [(PDSlide *)self slideLayout];
  uint64_t v12 = objc_opt_class();
  v13 = [v11 placeholderWithType:v8 placeholderTypeIndex:v7 overrideIndex:v6];
  v14 = TSUDynamicCast(v12, (uint64_t)v13);

  if (!v14)
  {
    uint64_t v15 = objc_opt_class();
    v16 = [v11 placeholderWithType:v8 placeholderTypeIndex:v7 useBaseTypeMatch:1 overrideIndex:v6];
    v14 = TSUDynamicCast(v15, (uint64_t)v16);

    if (!v14) {
      goto LABEL_11;
    }
  }
  v17 = [v14 textBody];
  id v18 = [v17 textListStyle];

  if (!v18)
  {
LABEL_11:
    id v18 = [v11 parentTextStyleForPlaceholderType:v8 placeholderTypeIndex:v7 defaultTextListStyle:v10 overrideIndex:v6];
    if (!v18) {
      id v18 = v10;
    }
  }

  return v18;
}

- (id)parentTextBodyPropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = objc_opt_class();
  id v10 = [(PDSlide *)self slideLayout];
  v11 = [v10 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  uint64_t v12 = TSUDynamicCast(v9, (uint64_t)v11);

  if (!v12)
  {
    uint64_t v13 = objc_opt_class();
    v14 = [(PDSlide *)self slideLayout];
    uint64_t v15 = [v14 placeholderWithType:v7 placeholderTypeIndex:v6 useBaseTypeMatch:1 overrideIndex:v5];
    uint64_t v12 = TSUDynamicCast(v13, (uint64_t)v15);

    if (!v12) {
      goto LABEL_4;
    }
  }
  v16 = [v12 textBody];
  v17 = [v16 properties];

  if (!v17)
  {
LABEL_4:
    id v18 = [(PDSlide *)self slideLayout];
    v17 = [v18 parentTextBodyPropertiesForPlaceholderType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  }
  return v17;
}

- (id)parentShapePropertiesForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = [(PDSlide *)self slideLayout];
  uint64_t v9 = objc_opt_class();
  id v10 = [v8 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  v11 = TSUDynamicCast(v9, (uint64_t)v10);

  if (!v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v8 placeholderWithType:v7 placeholderTypeIndex:v6 useBaseTypeMatch:1 overrideIndex:v5];
    v11 = TSUDynamicCast(v12, (uint64_t)v13);

    if (!v11) {
      goto LABEL_4;
    }
  }
  v14 = [v11 shapeProperties];
  if (!v14)
  {
LABEL_4:
    v14 = [v8 parentShapePropertiesForPlaceholderType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  }

  return v14;
}

- (id)masterGraphicForPlaceholderType:(int)a3 placeholderTypeIndex:(int)a4 overrideIndex:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = [(PDSlide *)self slideLayout];
  uint64_t v9 = objc_opt_class();
  id v10 = [v8 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
  v11 = TSUDynamicCast(v9, (uint64_t)v10);

  if (!v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v8 placeholderWithType:v7 placeholderTypeIndex:v6 useBaseTypeMatch:1 overrideIndex:v5];
    v11 = TSUDynamicCast(v12, (uint64_t)v13);

    if (!v11)
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [v8 slideMaster];
      v16 = [v15 placeholderWithType:v7 placeholderTypeIndex:v6 overrideIndex:v5];
      v11 = TSUDynamicCast(v14, (uint64_t)v16);
    }
  }

  return v11;
}

- (id)background
{
  mColorMapOverride = self->super.super.mBackground;
  if (!mColorMapOverride)
  {
    mColorMapOverride = (OADBackground *)self->super.mColorMapOverride;
    if (mColorMapOverride)
    {
      mColorMapOverride = [(OADBackground *)mColorMapOverride background];
    }
  }
  return mColorMapOverride;
}

- (id)defaultTheme
{
  v2 = [(PDSlide *)self slideLayout];
  v3 = [v2 defaultTheme];

  return v3;
}

- (void)setInheritedTextStyle:(id)a3 placeholderType:(int)a4 defaultTextListStyle:(id)a5
{
  id v15 = a3;
  id v8 = a5;
  uint64_t v9 = v8;
  unsigned int v10 = a4 & 0xFFFFFFFD;
  if ((a4 & 0xFFFFFFFD) == 1)
  {
    uint64_t v12 = [(PDSlide *)self slideLayout];
    uint64_t v13 = [v12 slideMaster];
    uint64_t v14 = [v13 bodyTextStyle];
  }
  else
  {
    v11 = v8;
    if (v10) {
      goto LABEL_6;
    }
    uint64_t v12 = [(PDSlide *)self slideLayout];
    uint64_t v13 = [v12 slideMaster];
    uint64_t v14 = [v13 titleTextStyle];
  }
  v11 = (void *)v14;

LABEL_6:
  [v15 setParentTextListStyle:v11];
}

- (void)setNotesSlide:(id)a3
{
}

- (id)parentTextStyleForTables
{
  v2 = [(PDSlide *)self slideLayout];
  v3 = [v2 parentTextStyleForTables];

  return v3;
}

- (id)notesSlide
{
  return self->mComments;
}

- (unint64_t)commentCount
{
  return [(PDSlideLayout *)self->mSlideLayout count];
}

- (id)commentAtIndex:(unint64_t)a3
{
  return (id)[(PDSlideLayout *)self->mSlideLayout objectAtIndex:a3];
}

- (void)addComment:(id)a3
{
  id v4 = a3;
  mSlideLayout = self->mSlideLayout;
  id v8 = v4;
  if (!mSlideLayout)
  {
    uint64_t v6 = (PDSlideLayout *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->mSlideLayout;
    self->mSlideLayout = v6;

    mSlideLayout = self->mSlideLayout;
    id v4 = v8;
  }
  [(PDSlideLayout *)mSlideLayout addObject:v4];
}

- (id)commentForAuthorId:(unint64_t)a3 authorIdx:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->mSlideLayout;
  uint64_t v7 = [(PDSlideLayout *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned int v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "authorId", (void)v15) == a3)
        {
          v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "index"));
          BOOL v12 = [v11 unsignedIntegerValue] == a4;

          if (v12)
          {
            id v13 = v10;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [(PDSlideLayout *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_12:

  return v13;
}

- (OITSUNoCopyDictionary)commentParents
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  mNotesSlide = self->mNotesSlide;
  if (!mNotesSlide)
  {
    id v4 = (PDNotesSlide *)objc_opt_new();
    BOOL v5 = self->mNotesSlide;
    self->mNotesSlide = v4;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = self->mSlideLayout;
    uint64_t v6 = [(PDSlideLayout *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          unsigned int v10 = [v9 parent];
          BOOL v11 = v10 == 0;

          if (v11)
          {
            v19 = self->mNotesSlide;
            long long v16 = [MEMORY[0x263EFF980] array];
            [(PDNotesSlide *)v19 setObject:v16 forUncopiedKey:v9];
          }
          else
          {
            uint64_t v12 = objc_opt_class();
            id v13 = self->mNotesSlide;
            uint64_t v14 = [v9 parent];
            long long v15 = [(PDNotesSlide *)v13 objectForKeyedSubscript:v14];
            long long v16 = TSUDynamicCast(v12, (uint64_t)v15);

            if (!v16)
            {
              long long v17 = [NSString stringWithUTF8String:"-[PDSlide commentParents]"];
              long long v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Dom/PDSlide.mm"];
              +[OITSUAssertionHandler handleFailureInFunction:v17 file:v18 lineNumber:230 isFatal:0 description:"child comment being mapped before the parent"];

              +[OITSUAssertionHandler logBacktraceThrottled];
            }
            [v16 addObject:v9];
          }
        }
        uint64_t v6 = [(PDSlideLayout *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }

    mNotesSlide = self->mNotesSlide;
  }
  return (OITSUNoCopyDictionary *)mNotesSlide;
}

- (void)setCommentParents:(id)a3
{
}

- (void)doneWithContent
{
  mSlideLayout = self->mSlideLayout;
  self->mSlideLayout = 0;

  [(NSMutableArray *)self->mComments doneWithContent];
  mComments = self->mComments;
  self->mComments = 0;

  v5.receiver = self;
  v5.super_class = (Class)PDSlide;
  [(PDSlideChild *)&v5 doneWithContent];
}

- (id)inheritedTextStyleForPlaceholderType:(int)a3
{
  if ((a3 & 0xFFFFFFFD) == 1)
  {
    v3 = [(PDSlide *)self slideLayout];
    id v4 = [v3 slideMaster];
    uint64_t v5 = [v4 bodyTextStyle];
    goto LABEL_5;
  }
  if ((a3 & 0xFFFFFFFD) == 0)
  {
    v3 = [(PDSlide *)self slideLayout];
    id v4 = [v3 slideMaster];
    uint64_t v5 = [v4 titleTextStyle];
LABEL_5:
    uint64_t v6 = (void *)v5;

    goto LABEL_7;
  }
  uint64_t v6 = 0;
LABEL_7:
  return v6;
}

- (id)transition
{
  mColorMapOverride = self->super.super.mTransition;
  if (!mColorMapOverride)
  {
    mColorMapOverride = (PDTransition *)self->super.mColorMapOverride;
    if (mColorMapOverride)
    {
      mColorMapOverride = [(PDTransition *)mColorMapOverride transition];
    }
  }
  return mColorMapOverride;
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  v3.receiver = self;
  v3.super_class = (Class)PDSlide;
  [(PDSlideBase *)&v3 setUpPropertyHierarchyPreservingEffectiveValues];
  [(NSMutableArray *)self->mComments setUpPropertyHierarchyPreservingEffectiveValues];
}

- (void)removeUnnecessaryOverrides
{
  v3.receiver = self;
  v3.super_class = (Class)PDSlide;
  [(PDSlideBase *)&v3 removeUnnecessaryOverrides];
  [(NSMutableArray *)self->mComments removeUnnecessaryOverrides];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDSlide;
  v2 = [(PDSlideChild *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mNotesSlide, 0);
  objc_storeStrong((id *)&self->mComments, 0);
  objc_storeStrong((id *)&self->mSlideLayout, 0);
  objc_storeStrong((id *)&self->super.mColorMapOverride, 0);
}

@end