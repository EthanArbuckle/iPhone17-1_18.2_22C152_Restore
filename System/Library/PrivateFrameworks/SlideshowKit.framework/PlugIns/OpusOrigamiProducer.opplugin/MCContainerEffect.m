@interface MCContainerEffect
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)isLive;
- (MCContainerEffect)initWithImprint:(id)a3 andMontage:(id)a4;
- (NSArray)orderedSlides;
- (NSArray)orderedTexts;
- (NSDictionary)actions;
- (NSDictionary)effectAttributes;
- (NSSet)slides;
- (NSSet)texts;
- (NSString)effectID;
- (id)actionForKey:(id)a3;
- (id)addSlide;
- (id)addSlideForAsset:(id)a3;
- (id)addSlideForContainer:(id)a3;
- (id)addSlides:(int64_t)a3;
- (id)addSlidesForAssets:(id)a3;
- (id)addTextForAsset:(id)a3 andKey:(id)a4;
- (id)addTextForAttributedString:(id)a3;
- (id)addTextsForAssets:(id)a3 andKey:(id)a4;
- (id)addTextsForAttributedStrings:(id)a3;
- (id)effectAttributeForKey:(id)a3;
- (id)imprint;
- (id)imprintsForActions;
- (id)insertSlideAtIndex:(int64_t)a3;
- (id)insertSlideForAsset:(id)a3 atIndex:(unint64_t)a4;
- (id)insertSlideForContainer:(id)a3 atIndex:(unint64_t)a4;
- (id)insertSlidesForAssets:(id)a3 atIndex:(unint64_t)a4;
- (id)insertTextForAsset:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5;
- (id)insertTextForAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (id)insertTextsForAssets:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5;
- (id)insertTextsForAttributedStrings:(id)a3 atIndex:(unint64_t)a4;
- (id)slideAtIndex:(unint64_t)a3;
- (id)textAtIndex:(unint64_t)a3;
- (unint64_t)countOfActions;
- (unint64_t)countOfSlides;
- (unint64_t)countOfTexts;
- (unint64_t)nextAvailableSlideIndex;
- (unint64_t)nextAvailableTextIndex;
- (void)addEffectAttributes:(id)a3;
- (void)demolish;
- (void)demolishActions;
- (void)initActionsWithImprints:(id)a3;
- (void)moveSlidesAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)moveTextsAtIndices:(id)a3 toIndex:(unint64_t)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeActionForKey:(id)a3;
- (void)removeAllActions;
- (void)removeAllSlides;
- (void)removeAllTexts;
- (void)removeSlidesAtIndices:(id)a3;
- (void)removeTextsAtIndices:(id)a3;
- (void)setAction:(id)a3 forKey:(id)a4;
- (void)setEffectAttribute:(id)a3 forKey:(id)a4;
- (void)setEffectAttributes:(id)a3;
- (void)setEffectID:(id)a3;
- (void)setIsLive:(BOOL)a3;
@end

@implementation MCContainerEffect

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"orderedSlides"]) {
    return +[NSSet setWithObjects:@"slides", 0];
  }
  if ([a3 isEqualToString:@"orderedTexts"]) {
    return +[NSSet setWithObjects:@"texts", 0];
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCContainerEffect;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

- (MCContainerEffect)initWithImprint:(id)a3 andMontage:(id)a4
{
  v31.receiver = self;
  v31.super_class = (Class)MCContainerEffect;
  objc_super v6 = -[MCContainer initWithImprint:andMontage:](&v31, "initWithImprint:andMontage:");
  if (v6)
  {
    id v7 = [a3 objectForKey:@"slides"];
    if (v7)
    {
      v8 = v7;
      if ([v7 count])
      {
        v6->mSlides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = +[MCObject objectWithImprint:*(void *)(*((void *)&v27 + 1) + 8 * i) andMontage:a4];
              [(NSMutableArray *)v6->mSlides addObject:v13];
              [(MCObject *)v13 setContainer:v6];
            }
            id v10 = [v8 countByEnumeratingWithState:&v27 objects:v33 count:16];
          }
          while (v10);
        }
      }
    }
    id v14 = [a3 objectForKey:@"texts"];
    if (v14)
    {
      v15 = v14;
      if ([v14 count])
      {
        v6->mTexts = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v16 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v24;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = +[MCObject objectWithImprint:*(void *)(*((void *)&v23 + 1) + 8 * (void)j) andMontage:a4];
              [(NSMutableArray *)v6->mTexts addObject:v20];
              [(MCObject *)v20 setContainer:v6];
              if (![(MCObject *)v6 isSnapshot]) {
                [(MCObject *)v20 addObserver:v6 forKeyPath:@"attributedString" options:0 context:0];
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v23 objects:v32 count:16];
          }
          while (v17);
        }
      }
    }
    id v21 = [a3 objectForKey:@"actions"];
    if (v21) {
      [(MCContainerEffect *)v6 initActionsWithImprints:v21];
    }
    v6->mEffectID = (NSString *)[a3 objectForKey:@"effectID"];
    v6->mEffectAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", objc_msgSend(a3, "objectForKey:", @"effectAttributes"));
  }
  return v6;
}

- (void)demolish
{
  self->mEffectID = 0;
  self->mEffectAttributes = 0;
  [(MCContainerEffect *)self demolishActions];
  mSlides = self->mSlides;
  objc_sync_enter(mSlides);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = self->mSlides;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) demolish];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }
  objc_sync_enter(self);
  v8 = self->mSlides;
  self->mSlides = 0;
  objc_sync_exit(self);
  objc_sync_exit(mSlides);
  mTexts = self->mTexts;
  objc_sync_enter(mTexts);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = self->mTexts;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
        if (![(MCObject *)self isSnapshot]) {
          [v14 removeObserver:self forKeyPath:@"attributedString"];
        }
        [v14 demolish];
      }
      id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }
  objc_sync_enter(self);

  self->mTexts = 0;
  objc_sync_exit(self);
  objc_sync_exit(mTexts);
  v15.receiver = self;
  v15.super_class = (Class)MCContainerEffect;
  [(MCContainer *)&v15 demolish];
}

- (id)imprint
{
  v26.receiver = self;
  v26.super_class = (Class)MCContainerEffect;
  id v3 = [(MCContainer *)&v26 imprint];
  id v5 = [(MCContainerEffect *)self slides];
  if ([(NSSet *)v5 count])
  {
    id v6 = +[NSMutableArray array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)v10), "imprint"));
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSSet *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v8);
    }
    [v3 setObject:v6 forKey:@"slides"];
  }
  id v11 = +[NSMutableArray array];
  uint64_t v12 = [(MCContainerEffect *)self texts];
  if ([(NSSet *)v12 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = [(NSSet *)v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        long long v16 = 0;
        do
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * (void)v16), "imprint"));
          long long v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [(NSSet *)v12 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"texts"];
  }
  if ([(NSMutableDictionary *)self->mActions count]) {
    objc_msgSend(v3, "setObject:forKey:", -[MCContainerEffect imprintsForActions](self, "imprintsForActions"), @"actions");
  }
  [v3 setObject:self->mEffectID forKey:@"effectID"];
  [v3 setObject:self->mEffectAttributes forKey:@"effectAttributes"];
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(MCContainerEffect *)self willChangeValueForKey:@"texts"];
    [(MCContainerEffect *)self didChangeValueForKey:@"texts"];
  }
}

- (NSSet)slides
{
  v2 = (NSSet *)sEmptySet;
  mSlides = self->mSlides;
  if (mSlides)
  {
    objc_sync_enter(self->mSlides);
    if ([(NSMutableArray *)self->mSlides count]) {
      v2 = +[NSSet setWithArray:self->mSlides];
    }
    objc_sync_exit(mSlides);
  }
  return v2;
}

- (NSArray)orderedSlides
{
  mSlides = self->mSlides;
  if (!mSlides) {
    return (NSArray *)sEmptyArray;
  }
  objc_sync_enter(self->mSlides);
  if ((self->super.mFlags & 1) == 0)
  {
    id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
    id v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, 0);
    [(NSMutableArray *)self->mSlides sortUsingDescriptors:v5];

    self->super.mFlags |= 1u;
  }
  id v6 = self->mSlides;
  objc_sync_exit(mSlides);
  return &v6->super;
}

- (unint64_t)countOfSlides
{
  mSlides = self->mSlides;
  if (!mSlides) {
    return 0;
  }
  objc_sync_enter(self->mSlides);
  id v4 = [(NSMutableArray *)self->mSlides count];
  objc_sync_exit(mSlides);
  return (unint64_t)v4;
}

- (unint64_t)nextAvailableSlideIndex
{
  mSlides = self->mSlides;
  if (!mSlides) {
    return 0;
  }
  objc_sync_enter(self->mSlides);
  if (self->mIsLive)
  {
    id v4 = self->mSlides;
    if (self->super.mFlags)
    {
      id v7 = (char *)objc_msgSend(-[NSMutableArray lastObject](v4, "lastObject"), "index") + 1;
    }
    else if ([(NSMutableArray *)v4 count] {
           && (long long v14 = 0u,
    }
               long long v15 = 0u,
               long long v12 = 0u,
               long long v13 = 0u,
               id v5 = self->mSlides,
               (id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16]) != 0))
    {
      id v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (char *)[*(id *)(*((void *)&v12 + 1) + 8 * i) index];
          if (v7 <= v10 + 1) {
            id v7 = v10 + 1;
          }
        }
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = (char *)[(NSMutableArray *)self->mSlides count];
  }
  objc_sync_exit(mSlides);
  return (unint64_t)v7;
}

- (id)slideAtIndex:(unint64_t)a3
{
  mSlides = self->mSlides;
  if (mSlides)
  {
    objc_sync_enter(self->mSlides);
    if (self->super.mFlags)
    {
      if ((unint64_t)[(NSMutableArray *)self->mSlides count] > a3)
      {
        id v12 = [(NSMutableArray *)self->mSlides objectAtIndex:a3];
LABEL_17:
        id v11 = v12;
        goto LABEL_18;
      }
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = self->mSlides;
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v6);
            }
            id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([v10 index] == (id)a3)
            {
              id v12 = v10;
              goto LABEL_17;
            }
          }
          id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          id v11 = 0;
          if (v7) {
            continue;
          }
          goto LABEL_18;
        }
      }
    }
    id v11 = 0;
LABEL_18:
    objc_sync_exit(mSlides);
    return v11;
  }
  id v11 = 0;
  return v11;
}

- (id)addSlide
{
  id v2 = [(MCContainerEffect *)self addSlides:1];
  return [v2 objectAtIndex:0];
}

- (id)addSlides:(int64_t)a3
{
  id v5 = +[NSMutableArray array];
  unint64_t v6 = [(MCContainerEffect *)self nextAvailableSlideIndex];
  if (a3)
  {
    unint64_t v7 = v6;
    do
    {
      id v8 = [(MCObject *)[MCSlide alloc] initFromScratchWithMontage:self->super.super.mMontage];
      [v8 setIndex:v7];
      [v5 addObject:v8];
      [v8 setContainer:self];

      ++v7;
      --a3;
    }
    while (a3);
  }
  if ([v5 count])
  {
    id v9 = [objc_alloc((Class)NSSet) initWithArray:v5];
    [(MCContainerEffect *)self willChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v9];
    mSlides = self->mSlides;
    if (mSlides)
    {
      objc_sync_enter(self->mSlides);
      if (self->super.mFlags)
      {
        objc_sync_enter(self);
        id v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mSlides];
        id v12 = self->mSlides;
        self->mSlides = v11;
        objc_sync_exit(self);
      }
      [(NSMutableArray *)self->mSlides addObjectsFromArray:v5];
    }
    else
    {
      objc_sync_enter(self);
      self->mSlides = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v5];
      self->super.mFlags |= 1u;
      mSlides = self;
    }
    objc_sync_exit(mSlides);
    [(MCContainerEffect *)self didChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v9];
  }
  return v5;
}

- (id)insertSlideAtIndex:(int64_t)a3
{
  id v5 = [(MCObject *)[MCSlide alloc] initFromScratchWithMontage:self->super.super.mMontage];
  [v5 setIndex:a3];
  [v5 setContainer:self];
  id v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v5, 0);
  [(MCContainerEffect *)self willChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v6];
  mSlides = self->mSlides;
  if (mSlides)
  {
    long long v17 = self->mSlides;
    objc_sync_enter(mSlides);
    if (self->super.mFlags)
    {
      objc_sync_enter(self);
      id v8 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mSlides];
      id v9 = self->mSlides;
      self->mSlides = v8;
      self->super.mFlags ^= 1u;
      objc_sync_exit(self);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = self->mSlides;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v10);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ((unint64_t)[v14 index] >= a3) {
            objc_msgSend(v14, "setIndex:", (char *)objc_msgSend(v14, "index") + 1);
          }
        }
        id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    [(NSMutableArray *)self->mSlides addObject:v5];
    long long v15 = (MCContainerEffect *)v17;
  }
  else
  {
    objc_sync_enter(self);
    self->mSlides = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v5, 0);
    self->super.mFlags |= 1u;
    long long v15 = self;
  }
  objc_sync_exit(v15);
  [(MCContainerEffect *)self didChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v6];

  return v5;
}

- (id)addSlideForAsset:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  id v5 = [(MCContainerEffect *)self insertSlidesForAssets:v4 atIndex:[(MCContainerEffect *)self nextAvailableSlideIndex]];

  return [v5 objectAtIndex:0];
}

- (id)addSlidesForAssets:(id)a3
{
  unint64_t v5 = [(MCContainerEffect *)self nextAvailableSlideIndex];
  return [(MCContainerEffect *)self insertSlidesForAssets:a3 atIndex:v5];
}

- (id)insertSlideForAsset:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", a3, 0);
  id v7 = [(MCContainerEffect *)self insertSlidesForAssets:v6 atIndex:a4];

  return [v7 objectAtIndex:0];
}

- (id)insertSlidesForAssets:(id)a3 atIndex:(unint64_t)a4
{
  id v26 = +[NSMutableArray array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    id v7 = 0;
    uint64_t v8 = *(void *)v32;
    do
    {
      id v9 = 0;
      long long v24 = v7;
      id v10 = &v7[a4];
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v9);
        id v12 = [(MCObject *)[MCSlide alloc] initFromScratchWithMontage:self->super.super.mMontage];
        [v12 setAsset:v11];
        [v12 setIndex:(char *)v9 + (void)v10];
        [v26 addObject:v12];
        [v12 setContainer:self];

        id v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v6 = [a3 countByEnumeratingWithState:&v31 objects:v36 count:16];
      id v7 = (char *)v9 + (void)v24;
    }
    while (v6);
    if ((char *)v9 + (void)v24)
    {
      id v13 = [objc_alloc((Class)NSSet) initWithArray:v26];
      [(MCContainerEffect *)self willChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v13];
      mSlides = self->mSlides;
      if (mSlides)
      {
        objc_sync_enter(self->mSlides);
        if (self->super.mFlags)
        {
          objc_sync_enter(self);
          long long v15 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mSlides];
          long long v16 = self->mSlides;
          self->mSlides = v15;
          self->super.mFlags ^= 1u;
          objc_sync_exit(self);
        }
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v17 = self->mSlides;
        id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v28;
          long long v20 = (char *)v9 + (void)v24;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v17);
              }
              long long v22 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              if ((unint64_t)[v22 index] >= a4) {
                objc_msgSend(v22, "setIndex:", (char *)objc_msgSend(v22, "index") + (void)v20);
              }
            }
            id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v18);
        }
        [(NSMutableArray *)self->mSlides addObjectsFromArray:v26];
      }
      else
      {
        objc_sync_enter(self);
        self->mSlides = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v26];
        self->super.mFlags |= 1u;
        mSlides = self;
      }
      objc_sync_exit(mSlides);
      [(MCContainerEffect *)self didChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v13];
    }
  }
  return v26;
}

- (id)addSlideForContainer:(id)a3
{
  unint64_t v5 = [(MCContainerEffect *)self nextAvailableSlideIndex];
  return [(MCContainerEffect *)self insertSlideForContainer:a3 atIndex:v5];
}

- (id)insertSlideForContainer:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = [(MCObject *)[MCSlide alloc] initFromScratchWithMontage:self->super.super.mMontage];
  id v8 = [(MCObject *)[MCPlugSlide alloc] initFromScratchWithMontage:self->super.super.mMontage];
  [v8 setContainer:a3];
  [v7 setPlug:v8];

  [v7 setIndex:a4];
  [v7 setContainer:self];
  id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v7, 0);
  [(MCContainerEffect *)self willChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v9];
  mSlides = self->mSlides;
  if (mSlides)
  {
    long long v20 = self->mSlides;
    objc_sync_enter(mSlides);
    if (self->super.mFlags)
    {
      objc_sync_enter(self);
      uint64_t v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mSlides];
      id v12 = self->mSlides;
      self->mSlides = v11;
      self->super.mFlags ^= 1u;
      objc_sync_exit(self);
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = self->mSlides;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ((unint64_t)[v17 index] >= a4) {
            objc_msgSend(v17, "setIndex:", (char *)objc_msgSend(v17, "index") + 1);
          }
        }
        id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }
    [(NSMutableArray *)self->mSlides addObject:v7];
    id v18 = (MCContainerEffect *)v20;
  }
  else
  {
    objc_sync_enter(self);
    self->mSlides = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v7, 0);
    self->super.mFlags |= 1u;
    id v18 = self;
  }
  objc_sync_exit(v18);
  [(MCContainerEffect *)self didChangeValueForKey:@"slides" withSetMutation:1 usingObjects:v9];

  return v7;
}

- (void)removeSlidesAtIndices:(id)a3
{
  mSlides = self->mSlides;
  if (mSlides)
  {
    obj = mSlides;
    objc_sync_enter(mSlides);
    id v6 = objc_alloc_init((Class)NSMutableSet);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = self->mSlides;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v11, "index")))
          {
            [v6 addObject:v11];
          }
          else if (!self->mIsLive)
          {
            objc_msgSend(v11, "setIndex:", (unsigned char *)objc_msgSend(v11, "index")- (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v11, "index")));
          }
        }
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
    [(MCContainerEffect *)self willChangeValueForKey:@"slides" withSetMutation:2 usingObjects:v6];
    if (self->super.mFlags)
    {
      objc_sync_enter(self);
      id v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mSlides];
      id v13 = self->mSlides;
      self->mSlides = v12;
      objc_sync_exit(self);
    }
    -[NSMutableArray removeObjectsInArray:](self->mSlides, "removeObjectsInArray:", [v6 allObjects]);
    objc_sync_exit(obj);
    [(MCContainerEffect *)self didChangeValueForKey:@"slides" withSetMutation:2 usingObjects:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v6);
          }
          long long v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
          [v17 setContainer:0];
          [v17 demolish];
        }
        id v14 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (void)removeAllSlides
{
  id v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(MCContainerEffect *)self nextAvailableSlideIndex]);
  [(MCContainerEffect *)self removeSlidesAtIndices:v3];
}

- (void)moveSlidesAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  if (self->mSlides)
  {
    [(MCContainerEffect *)self willChangeValueForKey:@"orderedSlides"];
    mSlides = self->mSlides;
    objc_sync_enter(mSlides);
    self->super.mFlags &= ~1u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = self->mSlides;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
          {
            objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
          }
          else
          {
            id v13 = [v12 index];
            unint64_t v14 = v13 - (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
            if (v14 >= a4) {
              v14 += (unint64_t)[a3 count];
            }
            [v12 setIndex:v14];
          }
        }
        id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    objc_sync_exit(mSlides);
    [(MCContainerEffect *)self didChangeValueForKey:@"orderedSlides"];
  }
}

- (NSSet)texts
{
  id v2 = (NSSet *)sEmptySet;
  mTexts = self->mTexts;
  if (mTexts)
  {
    objc_sync_enter(self->mTexts);
    if ([(NSMutableArray *)self->mTexts count]) {
      id v2 = +[NSSet setWithArray:self->mTexts];
    }
    objc_sync_exit(mTexts);
  }
  return v2;
}

- (NSArray)orderedTexts
{
  mTexts = self->mTexts;
  if (!mTexts) {
    return (NSArray *)sEmptyArray;
  }
  objc_sync_enter(self->mTexts);
  if ((self->super.mFlags & 2) == 0)
  {
    id v4 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"index" ascending:1];
    [(NSMutableArray *)self->mTexts sortUsingDescriptors:+[NSArray arrayWithObject:v4]];

    self->super.mFlags |= 2u;
  }
  unint64_t v5 = self->mTexts;
  objc_sync_exit(mTexts);
  return &v5->super;
}

- (unint64_t)countOfTexts
{
  mTexts = self->mTexts;
  if (!mTexts) {
    return 0;
  }
  objc_sync_enter(self->mTexts);
  id v4 = [(NSMutableArray *)self->mTexts count];
  objc_sync_exit(mTexts);
  return (unint64_t)v4;
}

- (unint64_t)nextAvailableTextIndex
{
  mTexts = self->mTexts;
  if (!mTexts) {
    return 0;
  }
  objc_sync_enter(self->mTexts);
  if (self->mIsLive)
  {
    id v4 = self->mTexts;
    if ((self->super.mFlags & 2) != 0)
    {
      id v7 = (char *)objc_msgSend(-[NSMutableArray lastObject](v4, "lastObject"), "index") + 1;
    }
    else if ([(NSMutableArray *)v4 count] {
           && (long long v14 = 0u,
    }
               long long v15 = 0u,
               long long v12 = 0u,
               long long v13 = 0u,
               unint64_t v5 = self->mTexts,
               (id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16]) != 0))
    {
      id v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (char *)[*(id *)(*((void *)&v12 + 1) + 8 * i) index];
          if (v7 <= v10 + 1) {
            id v7 = v10 + 1;
          }
        }
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = (char *)[(NSMutableArray *)self->mTexts count];
  }
  objc_sync_exit(mTexts);
  return (unint64_t)v7;
}

- (id)textAtIndex:(unint64_t)a3
{
  mTexts = self->mTexts;
  if (mTexts)
  {
    objc_sync_enter(self->mTexts);
    if ((self->super.mFlags & 2) != 0)
    {
      if ((unint64_t)[(NSMutableArray *)self->mTexts count] > a3)
      {
        id v12 = [(NSMutableArray *)self->mTexts objectAtIndex:a3];
LABEL_17:
        uint64_t v11 = v12;
        goto LABEL_18;
      }
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v6 = self->mTexts;
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v15;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v15 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
            if ([v10 index] == (id)a3)
            {
              id v12 = v10;
              goto LABEL_17;
            }
          }
          id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
          uint64_t v11 = 0;
          if (v7) {
            continue;
          }
          goto LABEL_18;
        }
      }
    }
    uint64_t v11 = 0;
LABEL_18:
    objc_sync_exit(mTexts);
    return v11;
  }
  uint64_t v11 = 0;
  return v11;
}

- (id)addTextForAttributedString:(id)a3
{
  id v3 = [(MCContainerEffect *)self insertTextsForAttributedStrings:+[NSArray arrayWithObject:a3] atIndex:[(MCContainerEffect *)self nextAvailableTextIndex]];
  return [v3 objectAtIndex:0];
}

- (id)addTextsForAttributedStrings:(id)a3
{
  unint64_t v5 = [(MCContainerEffect *)self nextAvailableTextIndex];
  return [(MCContainerEffect *)self insertTextsForAttributedStrings:a3 atIndex:v5];
}

- (id)addTextForAsset:(id)a3 andKey:(id)a4
{
  id v4 = [(MCContainerEffect *)self insertTextsForAssets:+[NSArray arrayWithObject:a3] andKey:a4 atIndex:[(MCContainerEffect *)self nextAvailableTextIndex]];
  return [v4 objectAtIndex:0];
}

- (id)addTextsForAssets:(id)a3 andKey:(id)a4
{
  unint64_t v7 = [(MCContainerEffect *)self nextAvailableTextIndex];
  return [(MCContainerEffect *)self insertTextsForAssets:a3 andKey:a4 atIndex:v7];
}

- (id)insertTextForAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v4 = [(MCContainerEffect *)self insertTextsForAttributedStrings:+[NSArray arrayWithObject:a3] atIndex:a4];
  return [v4 objectAtIndex:0];
}

- (id)insertTextsForAttributedStrings:(id)a3 atIndex:(unint64_t)a4
{
  id v27 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = *(void *)v33;
    do
    {
      uint64_t v8 = 0;
      long long v23 = v6;
      id v9 = &v6[a4];
      do
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v8);
        id v11 = [(MCObject *)[MCText alloc] initFromScratchWithMontage:self->super.super.mMontage];
        [v11 setAttributedString:v10];
        [v11 setIndex:(char *)v8 + (void)v9];
        [v27 addObject:v11];
        [v11 setContainer:self];
        [v11 addObserver:self forKeyPath:@"attributedString" options:0 context:0];

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [a3 countByEnumeratingWithState:&v32 objects:v37 count:16];
      id v6 = (char *)v8 + (void)v23;
    }
    while (v5);
    if ((char *)v8 + (void)v23)
    {
      id v12 = [objc_alloc((Class)NSSet) initWithArray:v27];
      [(MCContainerEffect *)self willChangeValueForKey:@"texts" withSetMutation:1 usingObjects:v12];
      mTexts = self->mTexts;
      if (mTexts)
      {
        objc_sync_enter(self->mTexts);
        if ((self->super.mFlags & 2) != 0)
        {
          objc_sync_enter(self);
          long long v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mTexts];
          long long v15 = self->mTexts;
          self->mTexts = v14;
          self->super.mFlags ^= 2u;
          objc_sync_exit(self);
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v16 = self->mTexts;
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16, v23);
        if (v17)
        {
          uint64_t v18 = *(void *)v29;
          long long v19 = (char *)v8 + v24;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v16);
              }
              long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              if ((unint64_t)[v21 index] >= a4) {
                objc_msgSend(v21, "setIndex:", (char *)objc_msgSend(v21, "index") + (void)v19);
              }
            }
            id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v17);
        }
        [(NSMutableArray *)self->mTexts addObjectsFromArray:v27];
      }
      else
      {
        objc_sync_enter(self);
        self->mTexts = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v27];
        self->super.mFlags |= 2u;
        mTexts = self;
      }
      objc_sync_exit(mTexts);
      [(MCContainerEffect *)self didChangeValueForKey:@"texts" withSetMutation:1 usingObjects:v12];
    }
  }
  return v27;
}

- (id)insertTextForAsset:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5
{
  id v5 = [(MCContainerEffect *)self insertTextsForAssets:+[NSArray arrayWithObject:a3] andKey:a4 atIndex:a5];
  return [v5 objectAtIndex:0];
}

- (id)insertTextsForAssets:(id)a3 andKey:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = +[NSMutableArray array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v22 = 0;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = a5 + v22;
      v22 += (uint64_t)v8;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(a3);
        }
        id v11 = [(MCObject *)[MCText alloc] initFromScratchWithMontage:self->super.super.mMontage];
        [v11 setIndex:v10];
        [v7 addObject:v11];
        [v11 setContainer:self];
        [v11 addObserver:self forKeyPath:@"attributedString" options:0 context:0];

        ++v10;
        id v8 = (char *)v8 - 1;
      }
      while (v8);
      id v8 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
    if (v22)
    {
      id v12 = [objc_alloc((Class)NSSet) initWithArray:v7];
      [(MCContainerEffect *)self willChangeValueForKey:@"texts" withSetMutation:1 usingObjects:v12];
      mTexts = self->mTexts;
      if (mTexts)
      {
        objc_sync_enter(self->mTexts);
        if ((self->super.mFlags & 2) != 0)
        {
          objc_sync_enter(self);
          long long v14 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mTexts];
          long long v15 = self->mTexts;
          self->mTexts = v14;
          self->super.mFlags ^= 2u;
          objc_sync_exit(self);
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v16 = self->mTexts;
        id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v25, v33, 16, v22);
        if (v17)
        {
          uint64_t v18 = *(void *)v26;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v26 != v18) {
                objc_enumerationMutation(v16);
              }
              long long v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if ((unint64_t)[v20 index] >= a5) {
                objc_msgSend(v20, "setIndex:", (char *)objc_msgSend(v20, "index") + v23);
              }
            }
            id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v17);
        }
        [(NSMutableArray *)self->mTexts addObjectsFromArray:v7];
      }
      else
      {
        objc_sync_enter(self);
        self->mTexts = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v7];
        self->super.mFlags |= 2u;
        mTexts = self;
      }
      objc_sync_exit(mTexts);
      [(MCContainerEffect *)self didChangeValueForKey:@"texts" withSetMutation:1 usingObjects:v12];
    }
  }
  return v7;
}

- (void)removeTextsAtIndices:(id)a3
{
  mTexts = self->mTexts;
  if (mTexts)
  {
    obj = mTexts;
    objc_sync_enter(mTexts);
    id v6 = objc_alloc_init((Class)NSMutableSet);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = self->mTexts;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v11, "index")))
          {
            [v6 addObject:v11];
            [v11 removeObserver:self forKeyPath:@"attributedString"];
          }
          else if (!self->mIsLive)
          {
            objc_msgSend(v11, "setIndex:", (unsigned char *)objc_msgSend(v11, "index")- (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v11, "index")));
          }
        }
        id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
    [(MCContainerEffect *)self willChangeValueForKey:@"texts" withSetMutation:2 usingObjects:v6];
    if ((self->super.mFlags & 2) != 0)
    {
      objc_sync_enter(self);
      id v12 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:self->mTexts];
      long long v13 = self->mTexts;
      self->mTexts = v12;
      objc_sync_exit(self);
    }
    -[NSMutableArray removeObjectsInArray:](self->mTexts, "removeObjectsInArray:", [v6 allObjects]);
    objc_sync_exit(obj);
    [(MCContainerEffect *)self didChangeValueForKey:@"texts" withSetMutation:2 usingObjects:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v20;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v6);
          }
          id v17 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
          [v17 setContainer:0];
          [v17 demolish];
        }
        id v14 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (void)removeAllTexts
{
  id v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(MCContainerEffect *)self countOfTexts]);
  [(MCContainerEffect *)self removeTextsAtIndices:v3];
}

- (void)moveTextsAtIndices:(id)a3 toIndex:(unint64_t)a4
{
  [(MCContainerEffect *)self willChangeValueForKey:@"orderedTexts"];
  mTexts = self->mTexts;
  objc_sync_enter(mTexts);
  self->super.mFlags &= ~2u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = self->mTexts;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(a3, "containsIndex:", objc_msgSend(v12, "index")))
        {
          objc_msgSend(v12, "setIndex:", (char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index")) + a4);
        }
        else
        {
          long long v13 = [v12 index];
          unint64_t v14 = v13 - (unsigned char *)objc_msgSend(a3, "countOfIndexesInRange:", 0, objc_msgSend(v12, "index"));
          if (v14 >= a4) {
            v14 += (unint64_t)[a3 count];
          }
          [v12 setIndex:v14];
        }
      }
      id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  objc_sync_exit(mTexts);
  [(MCContainerEffect *)self didChangeValueForKey:@"orderedTexts"];
}

- (id)effectAttributeForKey:(id)a3
{
  objc_sync_enter(self);
  id v5 = [(NSMutableDictionary *)self->mEffectAttributes objectForKey:a3];
  objc_sync_exit(self);
  return v5;
}

- (void)setEffectAttribute:(id)a3 forKey:(id)a4
{
  [(MCContainerEffect *)self willChangeValueForKey:@"effectAttributes"];
  objc_sync_enter(self);
  mEffectAttributes = self->mEffectAttributes;
  if (a3)
  {
    if (mEffectAttributes) {
      [(NSMutableDictionary *)mEffectAttributes setObject:a3 forKey:a4];
    }
    else {
      self->mEffectAttributes = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a3, a4, 0);
    }
  }
  else if (mEffectAttributes)
  {
    [(NSMutableDictionary *)mEffectAttributes removeObjectForKey:a4];
  }
  objc_sync_exit(self);
  [(MCContainerEffect *)self didChangeValueForKey:@"effectAttributes"];
}

- (void)addEffectAttributes:(id)a3
{
  if (a3 && [a3 count])
  {
    [(MCContainerEffect *)self willChangeValueForKey:@"effectAttributes"];
    objc_sync_enter(self);
    mEffectAttributes = self->mEffectAttributes;
    if (mEffectAttributes) {
      [(NSMutableDictionary *)mEffectAttributes addEntriesFromDictionary:a3];
    }
    else {
      self->mEffectAttributes = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
    }
    objc_sync_exit(self);
    [(MCContainerEffect *)self didChangeValueForKey:@"effectAttributes"];
  }
}

- (NSDictionary)effectAttributes
{
  objc_sync_enter(self);
  id v3 = +[NSDictionary dictionaryWithDictionary:self->mEffectAttributes];
  objc_sync_exit(self);
  return v3;
}

- (void)setEffectAttributes:(id)a3
{
  objc_sync_enter(self);

  self->mEffectAttributes = 0;
  if (a3) {
    self->mEffectAttributes = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:a3];
  }
  objc_sync_exit(self);
}

- (NSString)effectID
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setEffectID:(id)a3
{
}

- (BOOL)isLive
{
  return self->mIsLive;
}

- (void)setIsLive:(BOOL)a3
{
  self->mIsLive = a3;
}

- (void)initActionsWithImprints:(id)a3
{
  if (a3)
  {
    if ([a3 count])
    {
      self->mActions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          id v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(a3);
            }
            -[NSMutableDictionary setObject:forKey:](self->mActions, "setObject:forKey:", +[MCObjectLight objectWithImprint:](MCObjectLight, "objectWithImprint:", [a3 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)]), *(void *)(*((void *)&v9 + 1) + 8 * (void)v8));
            id v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

- (void)demolishActions
{
  mActions = self->mActions;
  if (mActions)
  {
    objc_sync_enter(self->mActions);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->mActions;
    id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(-[NSMutableDictionary objectForKey:](self->mActions, "objectForKey:", *(void *)(*((void *)&v8 + 1) + 8 * i)), "demolish");
        }
        id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
    objc_sync_enter(self);

    self->mActions = 0;
    objc_sync_exit(self);
    objc_sync_exit(mActions);
  }
}

- (id)imprintsForActions
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(MCContainerEffect *)self actions];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[NSDictionary objectForKey:](v4, "objectForKey:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8)), "imprint"), *(void *)(*((void *)&v10 + 1) + 8 * (void)v8));
        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)actions
{
  id v3 = (NSDictionary *)sEmptyDictionary;
  unsigned __int8 v4 = [(MCObject *)self isSnapshot];
  mActions = self->mActions;
  if ((v4 & 1) == 0)
  {
    if (mActions)
    {
      objc_sync_enter(self->mActions);
      if ([(NSMutableDictionary *)self->mActions count]) {
        id v3 = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithDictionary:self->mActions];
      }
      objc_sync_exit(mActions);
    }
    return v3;
  }
  return &mActions->super;
}

- (unint64_t)countOfActions
{
  unsigned int v3 = [(MCObject *)self isSnapshot];
  mActions = self->mActions;
  if (v3)
  {
    id v5 = self->mActions;
    return (unint64_t)[(NSMutableDictionary *)v5 count];
  }
  else
  {
    if (!mActions) {
      return 0;
    }
    objc_sync_enter(self->mActions);
    id v7 = [(NSMutableDictionary *)self->mActions count];
    objc_sync_exit(mActions);
    return (unint64_t)v7;
  }
}

- (id)actionForKey:(id)a3
{
  unsigned int v5 = [(MCObject *)self isSnapshot];
  mActions = self->mActions;
  if (v5)
  {
    id v7 = self->mActions;
    return [(NSMutableDictionary *)v7 objectForKey:a3];
  }
  else
  {
    if (!mActions) {
      return 0;
    }
    objc_sync_enter(self->mActions);
    id v9 = [(NSMutableDictionary *)self->mActions objectForKey:a3];
    objc_sync_exit(mActions);
    return v9;
  }
}

- (void)setAction:(id)a3 forKey:(id)a4
{
  [(MCContainerEffect *)self willChangeValueForKey:@"actions"];
  mActions = self->mActions;
  if (!mActions)
  {
    objc_sync_enter(self);
    self->mActions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objc_sync_exit(self);
    mActions = self->mActions;
  }
  objc_sync_enter(mActions);
  [(NSMutableDictionary *)self->mActions setObject:a3 forKey:a4];
  objc_sync_exit(mActions);
  [(MCContainerEffect *)self didChangeValueForKey:@"actions"];
}

- (void)removeActionForKey:(id)a3
{
  if (self->mActions)
  {
    [(MCContainerEffect *)self willChangeValueForKey:@"actions"];
    mActions = self->mActions;
    objc_sync_enter(mActions);
    [(NSMutableDictionary *)self->mActions removeObjectForKey:a3];
    objc_sync_exit(mActions);
    [(MCContainerEffect *)self didChangeValueForKey:@"actions"];
  }
}

- (void)removeAllActions
{
  if (self->mActions)
  {
    [(MCContainerEffect *)self willChangeValueForKey:@"actions"];
    mActions = self->mActions;
    objc_sync_enter(mActions);
    [(NSMutableDictionary *)self->mActions removeAllObjects];
    objc_sync_exit(mActions);
    [(MCContainerEffect *)self didChangeValueForKey:@"actions"];
  }
}

@end