@interface SBPIPMultidisplayHyperregionComposer
- (CGPoint)defaultCornerPositionForLayoutSettingsPosition:(unint64_t)a3 proposedCenter:(CGPoint)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6;
- (NSArray)connectedWindowScenes;
- (NSMutableDictionary)sceneIdentifiersToComposers;
- (SBPIPMultidisplayHyperregionComposer)init;
- (SBPIPPositionGeometryContext)_adjustGeometryContextIfNeeded:(SEL)a3 forComposer:(SBPIPPositionGeometryContext *)a4;
- (SBPIPPositionHyperregionComposerDelegate)delegate;
- (id)_composerForWindowScene:(id)a3;
- (id)_identifierForScene:(id)a3;
- (id)mergeMutableRegionsMap:(id)a3 withMap:(id)a4;
- (id)mutableRegionMapForScene:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5;
- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5;
- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6;
- (void)invalidate;
- (void)setConnectedWindowScenes:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBPIPMultidisplayHyperregionComposer

- (SBPIPMultidisplayHyperregionComposer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBPIPMultidisplayHyperregionComposer;
  v2 = [(SBPIPMultidisplayHyperregionComposer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    sceneIdentifiersToComposers = v2->_sceneIdentifiersToComposers;
    v2->_sceneIdentifiersToComposers = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained positionRegionComposerDidInvalidate:self];
}

- (void)setConnectedWindowScenes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((BSEqualArrays() & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E4F1CA80];
    objc_super v6 = [(NSMutableDictionary *)self->_sceneIdentifiersToComposers allKeys];
    v7 = [v5 setWithArray:v6];

    id v22 = v4;
    v8 = (NSArray *)[v4 copy];
    connectedWindowScenes = self->_connectedWindowScenes;
    self->_connectedWindowScenes = v8;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v10 = self->_connectedWindowScenes;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v16 = [v15 session];
          v17 = [v16 persistentIdentifier];

          [v7 removeObject:v17];
          v18 = [(NSMutableDictionary *)self->_sceneIdentifiersToComposers objectForKeyedSubscript:v17];

          if (!v18)
          {
            v19 = objc_alloc_init(SBPIPDefaultPositionHyperregionComposer);
            [(SBPIPDefaultPositionHyperregionComposer *)v19 setRepresentedWindowScene:v15];
            [(NSMutableDictionary *)self->_sceneIdentifiersToComposers setObject:v19 forKeyedSubscript:v17];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    sceneIdentifiersToComposers = self->_sceneIdentifiersToComposers;
    v21 = [v7 allObjects];
    [(NSMutableDictionary *)sceneIdentifiersToComposers removeObjectsForKeys:v21];

    id v4 = v22;
  }
}

- (id)_composerForWindowScene:(id)a3
{
  sceneIdentifiersToComposers = self->_sceneIdentifiersToComposers;
  id v4 = [a3 session];
  v5 = [v4 persistentIdentifier];
  objc_super v6 = [(NSMutableDictionary *)sceneIdentifiersToComposers objectForKeyedSubscript:v5];

  return v6;
}

- (id)_identifierForScene:(id)a3
{
  uint64_t v3 = [a3 session];
  id v4 = [v3 persistentIdentifier];

  return v4;
}

- (id)mutableRegionMapForScene:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  v8 = [(SBPIPMultidisplayHyperregionComposer *)self _composerForWindowScene:a3];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  CGSize v40 = (CGSize)0;
  long long v41 = 0u;
  CGPoint v38 = (CGPoint)0;
  CGPoint v39 = (CGPoint)0;
  CGSize v36 = (CGSize)0;
  CGSize v37 = (CGSize)0;
  CGSize v35 = (CGSize)0;
  long long v9 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  long long v32 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  long long v33 = v9;
  long long v34 = *(_OWORD *)&a4->offscreenCorners;
  long long v10 = *(_OWORD *)&a4->edgeInsets.bottom;
  long long v28 = *(_OWORD *)&a4->edgeInsets.top;
  long long v29 = v10;
  long long v11 = *(_OWORD *)&a4->minimumPadding.bottom;
  long long v30 = *(_OWORD *)&a4->minimumPadding.top;
  long long v31 = v11;
  CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
  CGSize pipStashedSize = a4->pipStashedSize;
  CGPoint v25 = pipAnchorPointOffset;
  CGSize size = a4->containerBounds.size;
  CGPoint origin = a4->containerBounds.origin;
  CGSize v27 = size;
  CGSize pipLastSteadySize = a4->pipLastSteadySize;
  CGSize pipCurrentSize = a4->pipCurrentSize;
  CGSize v23 = pipLastSteadySize;
  [(SBPIPMultidisplayHyperregionComposer *)self _adjustGeometryContextIfNeeded:&pipCurrentSize forComposer:v8];
  long long v32 = v45;
  long long v33 = v46;
  long long v34 = v47;
  long long v28 = v41;
  long long v29 = v42;
  long long v30 = v43;
  long long v31 = v44;
  CGSize pipStashedSize = v37;
  CGPoint v25 = v38;
  CGPoint origin = v39;
  CGSize v27 = v40;
  CGSize pipCurrentSize = v35;
  CGSize v23 = v36;
  long long v15 = *(_OWORD *)&a5->currentPosition.y;
  v20[2] = *(_OWORD *)&a5->initialPosition.y;
  v20[3] = v15;
  double projectedPositionStashProgress = a5->projectedPositionStashProgress;
  long long v16 = *(_OWORD *)&a5->projectedPosition.y;
  v20[0] = *(_OWORD *)&a5->isStashed;
  v20[1] = v16;
  v17 = [v8 positionRegionsForRegions:0 geometry:&pipCurrentSize interaction:v20];
  v18 = (void *)[v17 mutableCopy];

  return v18;
}

- (id)mergeMutableRegionsMap:(id)a3 withMap:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5) {
    v8 = v5;
  }
  else {
    v8 = v6;
  }
  id v9 = v8;
  long long v10 = v9;
  if (v5 && v7)
  {
    long long v11 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v12 = [v5 allKeys];
    uint64_t v13 = [v11 setWithArray:v12];

    v14 = [v7 allKeys];
    [v13 addObjectsFromArray:v14];

    long long v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      uint64_t v33 = *(void *)v38;
      long long v34 = v15;
      do
      {
        uint64_t v19 = 0;
        uint64_t v35 = v17;
        do
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * v19);
          v21 = objc_msgSend(v5, "objectForKeyedSubscript:", v20, v33);
          uint64_t v22 = [v7 objectForKeyedSubscript:v20];
          CGSize v23 = (void *)v22;
          if (v21) {
            BOOL v24 = v22 == 0;
          }
          else {
            BOOL v24 = 1;
          }
          if (v24)
          {
            if (v21) {
              CGPoint v25 = v21;
            }
            else {
              CGPoint v25 = (void *)v22;
            }
            id v26 = v25;
          }
          else
          {
            id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F431A8]), "initWithDimensions:", objc_msgSend(v21, "_dimensions"));
            CGSize v27 = [v21 _regions];
            long long v28 = [v23 _regions];
            [v27 arrayByAddingObjectsFromArray:v28];
            long long v29 = v7;
            v31 = id v30 = v5;
            [v26 _setRegions:v31];

            id v5 = v30;
            v7 = v29;
            long long v15 = v34;

            uint64_t v18 = v33;
            uint64_t v17 = v35;
          }
          [v15 setObject:v26 forKeyedSubscript:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v17);
    }
  }
  else
  {
    long long v15 = v9;
  }

  return v15;
}

- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  NSUInteger v8 = [(NSArray *)self->_connectedWindowScenes count];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  CGSize v36 = [WeakRetained targetWindowSceneForRegionComposer:self];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v35 = self;
  id obj = self->_connectedWindowScenes;
  uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v10)
  {
    uint64_t v12 = 0;
    goto LABEL_27;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  uint64_t v13 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v41 != v13) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if (a5->hasActiveGesture || v36 == v15 || v8 <= 1)
      {
        long long v18 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        v39[10] = *(_OWORD *)&a4->stashedMinimumPadding.top;
        v39[11] = v18;
        v39[12] = *(_OWORD *)&a4->offscreenCorners;
        long long v19 = *(_OWORD *)&a4->edgeInsets.bottom;
        v39[6] = *(_OWORD *)&a4->edgeInsets.top;
        v39[7] = v19;
        long long v20 = *(_OWORD *)&a4->minimumPadding.bottom;
        v39[8] = *(_OWORD *)&a4->minimumPadding.top;
        v39[9] = v20;
        CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
        v39[2] = a4->pipStashedSize;
        v39[3] = pipAnchorPointOffset;
        CGSize size = a4->containerBounds.size;
        v39[4] = a4->containerBounds.origin;
        v39[5] = size;
        CGSize pipLastSteadySize = a4->pipLastSteadySize;
        v39[0] = a4->pipCurrentSize;
        v39[1] = pipLastSteadySize;
        long long v24 = *(_OWORD *)&a5->currentPosition.y;
        v37[2] = *(_OWORD *)&a5->initialPosition.y;
        v37[3] = v24;
        double projectedPositionStashProgress = a5->projectedPositionStashProgress;
        long long v25 = *(_OWORD *)&a5->projectedPosition.y;
        v37[0] = *(_OWORD *)&a5->isStashed;
        v37[1] = v25;
        id v26 = [(SBPIPMultidisplayHyperregionComposer *)v35 mutableRegionMapForScene:v15 geometry:v39 interaction:v37];
        if (v8 >= 2)
        {
          CGSize v27 = [v15 _sbDisplayConfiguration];
          int v28 = SBSDisplayEdgeAdjacentToNeighboringDisplay();
          if (v28)
          {
            if (v28 == 2)
            {
              long long v29 = &unk_1F334B120;
              goto LABEL_18;
            }
          }
          else
          {
            long long v29 = &unk_1F334B108;
LABEL_18:
            [v26 removeObjectForKey:v29];
          }
          if (v36 != v15)
          {
            [v26 removeObjectForKey:&unk_1F334B108];
            [v26 removeObjectForKey:&unk_1F334B120];
            [v26 removeObjectForKey:&unk_1F334B138];
            [v26 removeObjectForKey:&unk_1F334B150];
          }
        }
        uint64_t v30 = [(SBPIPMultidisplayHyperregionComposer *)v35 mergeMutableRegionsMap:v12 withMap:v26];

        uint64_t v12 = (void *)v30;
        continue;
      }
    }
    uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v11);
LABEL_27:

  long long v31 = (void *)[v12 copy];
  return v31;
}

- (SBPIPPositionGeometryContext)_adjustGeometryContextIfNeeded:(SEL)a3 forComposer:(SBPIPPositionGeometryContext *)a4
{
  p_delegate = &self->_delegate;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v11 = [v9 representedWindowScene];

  if (WeakRetained)
  {
    long long v12 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
    v19[10] = *(_OWORD *)&a4->stashedMinimumPadding.top;
    v19[11] = v12;
    v19[12] = *(_OWORD *)&a4->offscreenCorners;
    long long v13 = *(_OWORD *)&a4->edgeInsets.bottom;
    v19[6] = *(_OWORD *)&a4->edgeInsets.top;
    v19[7] = v13;
    long long v14 = *(_OWORD *)&a4->minimumPadding.bottom;
    v19[8] = *(_OWORD *)&a4->minimumPadding.top;
    v19[9] = v14;
    CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
    v19[2] = a4->pipStashedSize;
    v19[3] = pipAnchorPointOffset;
    CGSize size = a4->containerBounds.size;
    v19[4] = a4->containerBounds.origin;
    v19[5] = size;
    CGSize pipLastSteadySize = a4->pipLastSteadySize;
    v19[0] = a4->pipCurrentSize;
    v19[1] = pipLastSteadySize;
    [WeakRetained regionComposer:self transformGeometryContext:v19 toWindowScene:v11];
  }
  else
  {
    *(_OWORD *)&retstr->stashedMinimumPadding.bottom = 0u;
    *(_OWORD *)&retstr->offscreenCorners = 0u;
    *(_OWORD *)&retstr->minimumPadding.bottom = 0u;
    *(_OWORD *)&retstr->stashedMinimumPadding.top = 0u;
    *(_OWORD *)&retstr->edgeInsets.bottom = 0u;
    *(_OWORD *)&retstr->minimumPadding.top = 0u;
    retstr->containerBounds.CGSize size = 0u;
    *(_OWORD *)&retstr->edgeInsets.top = 0u;
    retstr->CGPoint pipAnchorPointOffset = 0u;
    retstr->containerBounds.CGPoint origin = 0u;
    retstr->CGSize pipLastSteadySize = 0u;
    retstr->CGSize pipStashedSize = 0u;
    retstr->CGSize pipCurrentSize = 0u;
  }

  return result;
}

- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v13 = [WeakRetained targetWindowSceneForRegionComposer:self];

  long long v14 = [(SBPIPMultidisplayHyperregionComposer *)self _composerForWindowScene:v13];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  CGSize v45 = (CGSize)0;
  long long v46 = 0u;
  CGPoint v43 = (CGPoint)0;
  CGPoint v44 = (CGPoint)0;
  CGSize v41 = (CGSize)0;
  CGSize v42 = (CGSize)0;
  long long v15 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  long long v37 = *(_OWORD *)&a5->stashedMinimumPadding.top;
  long long v38 = v15;
  long long v39 = *(_OWORD *)&a5->offscreenCorners;
  CGSize v40 = (CGSize)0;
  long long v16 = *(_OWORD *)&a5->edgeInsets.bottom;
  long long v33 = *(_OWORD *)&a5->edgeInsets.top;
  long long v34 = v16;
  long long v17 = *(_OWORD *)&a5->minimumPadding.bottom;
  long long v35 = *(_OWORD *)&a5->minimumPadding.top;
  long long v36 = v17;
  CGPoint pipAnchorPointOffset = a5->pipAnchorPointOffset;
  CGSize pipStashedSize = a5->pipStashedSize;
  CGPoint v30 = pipAnchorPointOffset;
  CGSize size = a5->containerBounds.size;
  CGPoint origin = a5->containerBounds.origin;
  CGSize v32 = size;
  CGSize pipLastSteadySize = a5->pipLastSteadySize;
  CGSize pipCurrentSize = a5->pipCurrentSize;
  CGSize v28 = pipLastSteadySize;
  [(SBPIPMultidisplayHyperregionComposer *)self _adjustGeometryContextIfNeeded:&pipCurrentSize forComposer:v14];
  long long v37 = v50;
  long long v38 = v51;
  long long v39 = v52;
  long long v33 = v46;
  long long v34 = v47;
  long long v35 = v48;
  long long v36 = v49;
  CGSize pipStashedSize = v42;
  CGPoint v30 = v43;
  CGPoint origin = v44;
  CGSize v32 = v45;
  CGSize pipCurrentSize = v40;
  CGSize v28 = v41;
  long long v21 = *(_OWORD *)&a6->currentPosition.y;
  v25[2] = *(_OWORD *)&a6->initialPosition.y;
  v25[3] = v21;
  double projectedPositionStashProgress = a6->projectedPositionStashProgress;
  long long v22 = *(_OWORD *)&a6->projectedPosition.y;
  v25[0] = *(_OWORD *)&a6->isStashed;
  v25[1] = v22;
  unint64_t v23 = objc_msgSend(v14, "canonicalPositionForPoint:proposedPosition:geometry:interaction:", a4, &pipCurrentSize, v25, x, y);

  return v23;
}

- (CGPoint)defaultCornerPositionForLayoutSettingsPosition:(unint64_t)a3 proposedCenter:(CGPoint)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  double y = a4.y;
  double x = a4.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v13 = [WeakRetained targetWindowSceneForRegionComposer:self];

  long long v14 = [(SBPIPMultidisplayHyperregionComposer *)self _composerForWindowScene:v13];
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  CGSize v49 = (CGSize)0;
  long long v50 = 0u;
  CGPoint v47 = (CGPoint)0;
  CGPoint v48 = (CGPoint)0;
  CGSize v45 = (CGSize)0;
  CGSize v46 = (CGSize)0;
  long long v15 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  long long v41 = *(_OWORD *)&a5->stashedMinimumPadding.top;
  long long v42 = v15;
  long long v43 = *(_OWORD *)&a5->offscreenCorners;
  CGSize v44 = (CGSize)0;
  long long v16 = *(_OWORD *)&a5->edgeInsets.bottom;
  long long v37 = *(_OWORD *)&a5->edgeInsets.top;
  long long v38 = v16;
  long long v17 = *(_OWORD *)&a5->minimumPadding.bottom;
  long long v39 = *(_OWORD *)&a5->minimumPadding.top;
  long long v40 = v17;
  CGPoint pipAnchorPointOffset = a5->pipAnchorPointOffset;
  CGSize pipStashedSize = a5->pipStashedSize;
  CGPoint v34 = pipAnchorPointOffset;
  CGSize size = a5->containerBounds.size;
  CGPoint origin = a5->containerBounds.origin;
  CGSize v36 = size;
  CGSize pipLastSteadySize = a5->pipLastSteadySize;
  CGSize pipCurrentSize = a5->pipCurrentSize;
  CGSize v32 = pipLastSteadySize;
  [(SBPIPMultidisplayHyperregionComposer *)self _adjustGeometryContextIfNeeded:&pipCurrentSize forComposer:v14];
  long long v41 = v54;
  long long v42 = v55;
  long long v43 = v56;
  long long v37 = v50;
  long long v38 = v51;
  long long v39 = v52;
  long long v40 = v53;
  CGSize pipStashedSize = v46;
  CGPoint v34 = v47;
  CGPoint origin = v48;
  CGSize v36 = v49;
  CGSize pipCurrentSize = v44;
  CGSize v32 = v45;
  long long v21 = *(_OWORD *)&a6->currentPosition.y;
  v29[2] = *(_OWORD *)&a6->initialPosition.y;
  v29[3] = v21;
  double projectedPositionStashProgress = a6->projectedPositionStashProgress;
  long long v22 = *(_OWORD *)&a6->projectedPosition.y;
  v29[0] = *(_OWORD *)&a6->isStashed;
  v29[1] = v22;
  objc_msgSend(v14, "defaultCornerPositionForLayoutSettingsPosition:proposedCenter:geometry:interaction:", a3, &pipCurrentSize, v29, x, y);
  double v24 = v23;
  double v26 = v25;

  double v27 = v24;
  double v28 = v26;
  result.double y = v28;
  result.double x = v27;
  return result;
}

- (NSArray)connectedWindowScenes
{
  return self->_connectedWindowScenes;
}

- (SBPIPPositionHyperregionComposerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPIPPositionHyperregionComposerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)sceneIdentifiersToComposers
{
  return self->_sceneIdentifiersToComposers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifiersToComposers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectedWindowScenes, 0);
}

@end