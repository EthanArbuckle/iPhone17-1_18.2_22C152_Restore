@interface PFAIDrawablePlacement
+ (id)lineHintsForPropertySet:(id)a3 textStorage:(id)a4 contentState:(id)a5;
+ (id)slotIdWithLayoutModeState:(id)a3;
+ (void)cacheDrawable:(id)a3 forSlot:(id)a4 withContentState:(id)a5;
- (BOOL)mapStartElementWithState:(id)a3;
- (PFSSlot)slot;
- (id)wrapPropertyValueWithState:(id)a3;
- (void)dealloc;
- (void)mapBoundsWithState:(id)a3;
- (void)mapNonChildPlacementModeWithState:(id)a3;
- (void)mapNonChildResults:(id)a3 withState:(id)a4;
- (void)setSlot:(id)a3;
@end

@implementation PFAIDrawablePlacement

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIDrawablePlacement;
  [(PFXDrawablePlacement *)&v3 dealloc];
}

+ (id)slotIdWithLayoutModeState:(id)a3
{
  id v3 = [a3 propertySet];
  objc_opt_class();
  [v3 valueForProperty:"-ibooks-slot"];
  v4 = (void *)TSUDynamicCast();
  if ([v4 count] != (char *)&dword_0 + 1) {
    return 0;
  }
  objc_opt_class();
  [v4 objectAtIndex:0];
  v5 = (void *)TSUDynamicCast();
  if (!v5) {
    return 0;
  }
  v6 = v5;
  if ([v5 type] != &stru_108) {
    return 0;
  }
  objc_opt_class();
  [v6 value];

  return (id)TSUDynamicCast();
}

- (void)mapNonChildPlacementModeWithState:(id)a3
{
  id v5 = [a3 currentStackEntry];
  objc_msgSend(objc_msgSend(v5, "parentEntry"), "reader");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->super.mMode = 6;
    id v6 = +[PFAIDrawablePlacement slotIdWithLayoutModeState:](PFAIDrawablePlacement, "slotIdWithLayoutModeState:", [v5 flowState]);
    if (v6) {
      -[PFAIDrawablePlacement setSlot:](self, "setSlot:", objc_msgSend(objc_msgSend(objc_msgSend(a3, "flowState"), "pageCache"), "findMasterSlotWithId:", v6));
    }
  }
  else
  {
    id v7 = [a3 paginatedState];
    id v8 = +[PFAIDrawablePlacement slotIdWithLayoutModeState:](PFAIDrawablePlacement, "slotIdWithLayoutModeState:", [v5 paginatedState]);
    if (v8)
    {
      id v9 = v8;
      id v11 = [v7 currentPageIndex];
      -[PFAIDrawablePlacement setSlot:](self, "setSlot:", objc_msgSend(objc_msgSend(v7, "pageCache"), "findSlotWithId:pageIndex:", v9, &v11));
      [v7 setCurrentPageIndex:v11];
    }
    if (self->mSlot) {
      int v10 = 1;
    }
    else {
      int v10 = 2;
    }
    self->super.mMode = v10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      self->super.mMode = 5;
    }
  }
}

- (id)wrapPropertyValueWithState:(id)a3
{
  mSlot = self->mSlot;
  if (mSlot)
  {
    id v5 = PFXPropNmApplePubBoxWrapExteriorPath[0];
    return [(PFSSlot *)mSlot valueForProperty:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PFAIDrawablePlacement;
    return [(PFXDrawablePlacement *)&v7 wrapPropertyValueWithState:a3];
  }
}

- (void)mapBoundsWithState:(id)a3
{
  mSlot = self->mSlot;
  if (mSlot)
  {
    +[PFXDrawablePlacement boundsWithProperties:mSlot readerState:a3];
    self->super.mBounds.origin.x = v6;
    self->super.mBounds.origin.y = v7;
    self->super.mBounds.size.width = v8;
    self->super.mBounds.size.height = v9;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PFAIDrawablePlacement;
    [(PFXDrawablePlacement *)&v10 mapBoundsWithState:a3];
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  +[PFAIReferenceAnchor mapReferenceAnchorWithStackEntry:contentState:](PFAIReferenceAnchor, "mapReferenceAnchorWithStackEntry:contentState:", [a3 currentStackEntry], a3);
  v6.receiver = self;
  v6.super_class = (Class)PFAIDrawablePlacement;
  LOBYTE(self) = [(PFXDrawablePlacement *)&v6 mapStartElementWithState:a3];
  [a3 setCfiPathForCurrentStorage];
  return (char)self;
}

+ (void)cacheDrawable:(id)a3 forSlot:(id)a4 withContentState:(id)a5
{
  if ([a5 paginatedIsCurrent]
    && ![a5 ancestorEntryWithReaderClass:objc_opt_class()])
  {
    id v8 = objc_msgSend(objc_msgSend(a5, "paginatedState"), "currentPageDrawableMap");
    objc_opt_class();
    [a4 valueForProperty:"z-index"];
    CGFloat v9 = (void *)TSUDynamicCast();
    if ([v9 count] == (char *)&dword_0 + 1
      && (objc_opt_class(), [v9 objectAtIndex:0], (objc_super v10 = (void *)TSUDynamicCast()) != 0)
      && (id v11 = v10, [v10 type] == &stru_108.addr))
    {
      objc_opt_class();
      [v11 value];
      id v12 = [(id)TSUDynamicCast() integerValue];
    }
    else
    {
      id v12 = 0;
    }
    v13 = +[NSNumber numberWithInteger:v12];
    id v14 = [v8 objectForKey:v13];
    if (!v14)
    {
      id v14 = objc_alloc_init((Class)NSMutableArray);
      [v8 setObject:v14 forKey:v13];
    }
    [v14 addObject:a3];
  }
}

- (void)mapNonChildResults:(id)a3 withState:(id)a4
{
  int mMode = self->super.mMode;
  if (mMode == 6)
  {
    if ([a4 flowIsCurrent])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v17 = (char *)[a3 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v17)
      {
        v18 = v17;
        uint64_t v19 = *(void *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(void *)v27 != v19) {
              objc_enumerationMutation(a3);
            }
            uint64_t v21 = TSUProtocolCast();
            if (v21)
            {
              uint64_t v22 = v21;
              id v23 = objc_msgSend(objc_msgSend(a4, "flowState"), "pageAtRelativeIndex:", 0);
              [v23 addFloatingDrawable:v22 insertContext:0];
              objc_msgSend(objc_msgSend(v23, "drawablesZOrder"), "addDrawable:", v22);
            }
          }
          v18 = (char *)[a3 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v18);
      }
    }
  }
  else if (mMode == 1)
  {
    if ([a4 paginatedIsCurrent])
    {
      id v7 = [a4 paginatedState];
      id v8 = [v7 currentPageIndex];
      id v24 = [v7 contentNodeBody];
      id v9 = [v7 pageAtRelativeIndex:v8];
      objc_super v10 = objc_opt_class();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = (char *)[a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v31;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(void *)v31 != v13) {
              objc_enumerationMutation(a3);
            }
            uint64_t v15 = TSUProtocolCast();
            if (v15)
            {
              uint64_t v16 = v15;
              if (![a4 ancestorEntryWithReaderClass:objc_opt_class()])
              {
                [v9 addFloatingDrawable:v16 insertContext:0];
                [v10 cacheDrawable:v16 forSlot:self->mSlot withContentState:a4];
                [v24 setRelativePageIndex:v8 forInfo:v16];
              }
            }
          }
          id v12 = (char *)[a3 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
      }
    }
  }
}

+ (id)lineHintsForPropertySet:(id)a3 textStorage:(id)a4 contentState:(id)a5
{
  objc_opt_class();
  [a3 valueForProperty:PFXPropNmApplePubLineHints[0]];
  id v8 = (void *)TSUDynamicCast();
  if ([v8 count] == (char *)&dword_4 + 1)
  {
    id v9 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", [v8 objectAtIndex:0]);
    id v10 = +[PFXStyleUtilities identValueInPair:](PFXStyleUtilities, "identValueInPair:", [v8 objectAtIndex:1]);
    id v11 = +[PFXStyleUtilities uriValueInPair:](PFXStyleUtilities, "uriValueInPair:", [v8 objectAtIndex:2]);
    int64_t v12 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", [v8 objectAtIndex:3]);
    int64_t v13 = +[PFXStyleUtilities integerValueInPair:](PFXStyleUtilities, "integerValueInPair:", [v8 objectAtIndex:4]);
    id v14 = 0;
    if (v9) {
      BOOL v15 = v10 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15 && v11 != 0)
    {
      id v14 = objc_msgSend(objc_msgSend(a5, "hintCollectionWithUrl:data:", v11, objc_msgSend(objc_msgSend(a5, "paginatedState"), "hintsData")), "newSubCollectionWithRange:", v12, v13);
      if (v14) {
        objc_msgSend(objc_msgSend(a5, "hintCollectorForStorage:", a4), "addHintCollection:idref:presentationId:", v14, v9, v10);
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (PFSSlot)slot
{
  return self->mSlot;
}

- (void)setSlot:(id)a3
{
}

@end