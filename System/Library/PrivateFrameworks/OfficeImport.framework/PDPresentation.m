@interface PDPresentation
- (BOOL)isAutoPlay;
- (BOOL)isCommentsVisible;
- (BOOL)isKiosk;
- (BOOL)isLooping;
- (CGSize)notesSize;
- (CGSize)slideSize;
- (PDPresentation)init;
- (id)bulletBlipAtIndex:(int)a3;
- (id)bulletBlips;
- (id)commentAuthorAtIndex:(unint64_t)a3;
- (id)description;
- (id)notesMasterAtIndex:(unint64_t)a3;
- (id)slideAtIndex:(unint64_t)a3;
- (id)slideMasterAtIndex:(unint64_t)a3;
- (unint64_t)commentAuthorCount;
- (unint64_t)indexOfSlide:(id)a3;
- (unint64_t)notesMasterCount;
- (unint64_t)slideCount;
- (unint64_t)slideMasterCount;
- (unsigned)addBulletBlip:(id)a3;
- (unsigned)bulletBlipCount;
- (void)addCommentAuthor:(id)a3;
- (void)addNotesMaster:(id)a3;
- (void)addSlide:(id)a3;
- (void)addSlideMaster:(id)a3;
- (void)cacheGraphicStyleForDrawable:(id)a3 colorContext:(id)a4;
- (void)cacheGraphicStylesForSlideBase:(id)a3;
- (void)ensureDefaultLayoutsForMasters;
- (void)flushUnusedMastersAndLayouts;
- (void)removeUnnecessaryOverrides;
- (void)setIsAutoPlay:(BOOL)a3;
- (void)setIsCommentsVisible:(BOOL)a3;
- (void)setIsKiosk:(BOOL)a3;
- (void)setIsLooping:(BOOL)a3;
- (void)setNotesSize:(CGSize)a3;
- (void)setSlideSize:(CGSize)a3;
- (void)setUpPropertyHierarchyPreservingEffectiveValues;
@end

@implementation PDPresentation

- (PDPresentation)init
{
  v15.receiver = self;
  v15.super_class = (Class)PDPresentation;
  v2 = [(OCDDocument *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSlideMasters = v2->mSlideMasters;
    v2->mSlideMasters = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mNotesMasters = v2->mNotesMasters;
    v2->mNotesMasters = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSlides = v2->mSlides;
    v2->mSlides = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mBulletBlips = v2->mBulletBlips;
    v2->mBulletBlips = v9;

    v11 = (CGSize *)MEMORY[0x263F001B0];
    v2->mSlideSize = (CGSize)*MEMORY[0x263F001B0];
    v2->mNotesSize = *v11;
    v2->mIsCommentsVisible = 1;
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mCommentAuthors = v2->mCommentAuthors;
    v2->mCommentAuthors = v12;
  }
  return v2;
}

- (void)setIsAutoPlay:(BOOL)a3
{
  self->mIsAutoPlay = a3;
}

- (void)setSlideSize:(CGSize)a3
{
  self->mSlideSize = a3;
}

- (void)setNotesSize:(CGSize)a3
{
  self->mNotesSize = a3;
}

- (void)setIsCommentsVisible:(BOOL)a3
{
  self->mIsCommentsVisible = a3;
}

- (void)addSlideMaster:(id)a3
{
}

- (void)cacheGraphicStylesForSlideBase:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [OADColorContext alloc];
    v6 = [v4 colorScheme];
    v7 = [v4 colorMap];
    v8 = [(OADColorContext *)v5 initWithScheme:v6 map:v7 palette:0];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v9 = objc_msgSend(v4, "drawables", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v9);
          }
          [(PDPresentation *)self cacheGraphicStyleForDrawable:*(void *)(*((void *)&v13 + 1) + 8 * v12++) colorContext:v8];
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v10);
    }
  }
}

- (void)cacheGraphicStyleForDrawable:(id)a3 colorContext:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(OCDDocument *)self graphicStyleCache];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v9 = [v6 children];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(v9);
          }
          [(PDPresentation *)self cacheGraphicStyleForDrawable:*(void *)(*((void *)&v35 + 1) + 8 * i) colorContext:v7];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v10);
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = [v6 clientData];
    long long v14 = [v13 placeholder];
    if (!v14)
    {
      id v15 = v6;
      v34 = v13;
      v33 = [v15 shapeProperties];
      int v16 = [v15 type];
      char v17 = [v33 isTextBox];
      if (v16 == 202) {
        char v18 = 1;
      }
      else {
        char v18 = v17;
      }
      if (v18)
      {
        int v19 = 2;
      }
      else
      {
        int v19 = 1;
        if (v16 != 20 && v16 != 203)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            int v19 = 0;
          }
        }
      }
      v22 = [v15 textBody];
      v23 = [v22 textListStyle];
      unsigned int v32 = v19;
      v24 = [v23 propertiesForListLevel:0];

      if ([v22 paragraphCount])
      {
        v31 = v22;
        v25 = [v22 paragraphAtIndex:0];
        uint64_t v26 = [v25 properties];

        v27 = [v25 paragraphEndCharacterProperties];
        if ([v25 textRunCount])
        {
          v28 = [v25 textRunAtIndex:0];
          uint64_t v29 = [v28 properties];

          v27 = (void *)v29;
        }

        v24 = (void *)v26;
        v22 = v31;
      }
      else
      {
        v27 = 0;
      }
      v30 = [v22 properties];
      [v8 cacheDrawablePropertiesOfCategory:v32 withGraphicProperties:v33 textBodyProperties:v30 paragraphProperties:v24 characterProperties:v27 colorContext:v7];

      long long v13 = v34;
    }

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = [v6 imageProperties];
    [v8 cacheDrawablePropertiesOfCategory:3 withGraphicProperties:v20 textBodyProperties:0 paragraphProperties:0 characterProperties:0 colorContext:v7];
LABEL_22:

    goto LABEL_36;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = [v6 drawableProperties];
    v20 = [v21 style];

    if (v20) {
      [v8 cacheTableStyle:v20];
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v8, "cacheChartStyleId:", objc_msgSend(v6, "styleId"));
  }
LABEL_36:
}

- (CGSize)slideSize
{
  double width = self->mSlideSize.width;
  double height = self->mSlideSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)addBulletBlip:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->mBulletBlips addObject:v4];
  LODWORD(self) = [(NSMutableArray *)self->mBulletBlips count];

  return self;
}

- (unsigned)bulletBlipCount
{
  return [(NSMutableArray *)self->mBulletBlips count];
}

- (void)setIsLooping:(BOOL)a3
{
  self->mIsLooping = a3;
}

- (void)setIsKiosk:(BOOL)a3
{
  self->mIsKiosk = a3;
}

- (id)bulletBlips
{
  return self->mBulletBlips;
}

- (void)addNotesMaster:(id)a3
{
}

- (unint64_t)slideMasterCount
{
  return [(NSMutableArray *)self->mSlideMasters count];
}

- (id)slideMasterAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mSlideMasters objectAtIndex:a3];
}

- (unint64_t)notesMasterCount
{
  return [(NSMutableArray *)self->mNotesMasters count];
}

- (id)notesMasterAtIndex:(unint64_t)a3
{
  v5 = (void *)[(NSMutableArray *)self->mNotesMasters count];
  if (v5)
  {
    v5 = [(NSMutableArray *)self->mNotesMasters objectAtIndex:a3];
  }
  return v5;
}

- (unint64_t)slideCount
{
  return [(NSMutableArray *)self->mSlides count];
}

- (id)slideAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mSlides objectAtIndex:a3];
}

- (void)addSlide:(id)a3
{
}

- (unint64_t)indexOfSlide:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PDPresentation *)self slideCount];
  if (v5)
  {
    unint64_t v6 = 0;
    while (1)
    {
      id v7 = [(PDPresentation *)self slideAtIndex:v6];

      if (v7 == v4) {
        break;
      }
      if (v5 == ++v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)bulletBlipAtIndex:(int)a3
{
  return (id)[(NSMutableArray *)self->mBulletBlips objectAtIndex:a3];
}

- (CGSize)notesSize
{
  double width = self->mNotesSize.width;
  double height = self->mNotesSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isAutoPlay
{
  return self->mIsAutoPlay;
}

- (BOOL)isCommentsVisible
{
  return self->mIsCommentsVisible;
}

- (BOOL)isLooping
{
  return self->mIsLooping;
}

- (BOOL)isKiosk
{
  return self->mIsKiosk;
}

- (unint64_t)commentAuthorCount
{
  return [(NSMutableArray *)self->mCommentAuthors count];
}

- (id)commentAuthorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mCommentAuthors objectAtIndex:a3];
}

- (void)addCommentAuthor:(id)a3
{
}

- (void)flushUnusedMastersAndLayouts
{
  int v16 = objc_alloc_init(OITSUNoCopyDictionary);
  for (unsigned int i = 0; ; unsigned int i = v4 + 1)
  {
    unsigned int v4 = i;
    if ([(NSMutableArray *)self->mSlides count] <= (unint64_t)i) {
      break;
    }
    unint64_t v5 = [(NSMutableArray *)self->mSlides objectAtIndex:i];
    unint64_t v6 = [v5 slideLayout];
    id v7 = [v6 slideMaster];
    id v8 = [(OITSUNoCopyDictionary *)v16 objectForKey:v7];
    if (!v8)
    {
      id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      [(OITSUNoCopyDictionary *)v16 setObject:v8 forUncopiedKey:v7];
    }
    [v8 addObject:v6];
  }
  v9 = [(OITSUNoCopyDictionary *)v16 allKeys];
  [(NSMutableArray *)self->mSlideMasters setArray:v9];
  for (unsigned int j = 0; [v9 count] > (unint64_t)j; ++j)
  {
    uint64_t v11 = [v9 objectAtIndex:j];
    id v12 = objc_alloc(MEMORY[0x263EFF980]);
    long long v13 = [(OITSUNoCopyDictionary *)v16 objectForKey:v11];
    long long v14 = [v13 allObjects];
    id v15 = (void *)[v12 initWithArray:v14];

    [v11 setSlideLayouts:v15];
  }
}

- (void)ensureDefaultLayoutsForMasters
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->mSlideMasters;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        unint64_t v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (!objc_msgSend(v6, "slideLayoutCount", (void)v9))
        {
          id v7 = [[PDSlideLayout alloc] initWithSlideMaster:v6];
          [(PDSlideLayout *)v7 setSlideLayoutType:2];
          [(PDSlideChild *)v7 setShowMasterShapes:1];
          id v8 = [v6 placeholders];
          [(PDSlideBase *)v7 setDrawables:v8];

          [(PDSlideChild *)v7 setShowMasterPlaceholderAnimations:1];
          [v6 addSlideLayout:v7];
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
}

- (void)setUpPropertyHierarchyPreservingEffectiveValues
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)PDPresentation;
  [(OCDDocument *)&v27 setUpPropertyHierarchyPreservingEffectiveValues];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v3 = self->mSlideMasters;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v23 + 1) + 8 * v6++) setUpPropertyHierarchyPreservingEffectiveValues];
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v4);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = self->mNotesMasters;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10++) setUpPropertyHierarchyPreservingEffectiveValues];
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v8);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v11 = self->mSlides;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "setUpPropertyHierarchyPreservingEffectiveValues", (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v12);
  }
}

- (void)removeUnnecessaryOverrides
{
  [(NSMutableArray *)self->mSlides makeObjectsPerformSelector:sel_removeUnnecessaryOverrides];
  [(NSMutableArray *)self->mSlideMasters makeObjectsPerformSelector:sel_removeUnnecessaryOverrides];
  [(NSMutableArray *)self->mNotesMasters makeObjectsPerformSelector:sel_removeUnnecessaryOverrides];
  v3.receiver = self;
  v3.super_class = (Class)PDPresentation;
  [(OCDDocument *)&v3 removeUnnecessaryOverrides];
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDPresentation;
  v2 = [(PDPresentation *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCommentAuthors, 0);
  objc_storeStrong((id *)&self->mBulletBlips, 0);
  objc_storeStrong((id *)&self->mSlides, 0);
  objc_storeStrong((id *)&self->mNotesMasters, 0);
  objc_storeStrong((id *)&self->mSlideMasters, 0);
}

@end