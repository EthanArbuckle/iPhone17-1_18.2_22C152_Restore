@interface MPLayerSerializer
- (id)container;
- (id)description;
- (id)introTransition;
- (void)dealloc;
- (void)insertEffectContainers:(id)a3 atIndex:(int64_t)a4;
- (void)moveEffectContainersFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeEffectContainersAtIndices:(id)a3;
- (void)setAudioPlaylist:(id)a3;
- (void)setIntroTransition:(id)a3;
- (void)setLayerSerializer:(id)a3;
@end

@implementation MPLayerSerializer

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)MPLayerSerializer;
  id v3 = [(MPLayer *)&v6 description];
  if (self->_layerSerializer) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  return [v3 stringByAppendingFormat:@"\t          Has Layer Serializer: %@\n", v4];
}

- (void)dealloc
{
  v6.receiver = self;
  v6.super_class = (Class)MPLayerSerializer;
  [(MPLayer *)&v6 cleanup];
  layerSerializer = self->_layerSerializer;
  if (layerSerializer) {

  }
  self->_layerSerializer = 0;
  introTransition = self->_introTransition;
  if (introTransition) {

  }
  self->_introTransition = 0;
  v5.receiver = self;
  v5.super_class = (Class)MPLayerSerializer;
  [(MPLayer *)&v5 dealloc];
}

- (id)introTransition
{
  return self->_introTransition;
}

- (void)setIntroTransition:(id)a3
{
  if (a3)
  {
    id v5 = [(MPLayer *)self parentDocument];
    if (objc_msgSend(objc_msgSend(v5, "documentAttributeForKey:", kMPDocumentEnforceSafeTiming), "BOOLValue"))
    {
      if (objc_msgSend(-[MPLayer effectContainers](self, "effectContainers"), "count"))
      {
        objc_msgSend(objc_msgSend(-[MPLayer effectContainers](self, "effectContainers"), "objectAtIndex:", 0), "duration");
        double v7 = v6;
        [a3 duration];
        if (v8 > v7) {
          [a3 setDuration:v7];
        }
      }
    }
  }
  introTransition = self->_introTransition;
  if (introTransition)
  {
    [(MPTransition *)introTransition setParent:0];
    v10 = self->_introTransition;
    if (v10)
    {

      self->_introTransition = 0;
    }
  }
  if (a3)
  {
    v11 = (MPTransition *)a3;
    self->_introTransition = v11;
    [(MPTransition *)v11 setParent:self];
  }
  else
  {
    layerSerializer = self->_layerSerializer;
    if (layerSerializer)
    {
      [(MCContainerSerializer *)layerSerializer setInitialTransitionID:0];
      [(MCContainerSerializer *)self->_layerSerializer setInitialTransitionDuration:0.0];
      v13 = self->_layerSerializer;
      [(MCContainerSerializer *)v13 setInitialTransitionAttributes:0];
    }
  }
}

- (void)insertEffectContainers:(id)a3 atIndex:(int64_t)a4
{
  if ([(MPLayer *)self parentDocument]) {
    objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "lock");
  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    a4 = (int64_t)[(NSMutableArray *)self->super._effectContainers count];
  }
  id v8 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndexesInRange:", a4, objc_msgSend(a3, "count"));
  [(MPLayerSerializer *)self willChange:2 valuesAtIndexes:v8 forKey:@"effectContainers"];
  [(MPLayer *)self reconnectTransitionForEffectContainerAtIndex:a4];
  if (!self->super._effectContainers) {
    self->super._effectContainers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  [(NSLock *)[(MPLayerInternal *)self->super._internal containerLock] lock];
  [(NSMutableArray *)self->super._effectContainers insertObjects:a3 atIndexes:v8];
  v33 = v8;
  if ([(MPLayer *)self parent]
    && !objc_msgSend(-[MPLayer parent](self, "parent"), "autoAdjustDuration"))
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = [a3 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v39;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(a3);
          }
          [*(id *)(*((void *)&v38 + 1) + 8 * i) setParentLayer:self];
        }
        id v19 = [a3 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v19);
    }
  }
  else
  {
    [(MPLayer *)self duration];
    double v10 = v9;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v11 = [a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v43;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v43 != v13) {
            objc_enumerationMutation(a3);
          }
          v15 = *(void **)(*((void *)&v42 + 1) + 8 * (void)j);
          [v15 setParentLayer:self];
          [v15 duration];
          double v10 = v10 + v16;
          if ([v15 transition])
          {
            objc_msgSend(objc_msgSend(v15, "transition"), "duration");
            double v10 = v10 - v17;
          }
        }
        id v12 = [a3 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v12);
    }
    [(MPLayer *)self setDuration:v10];
  }
  if (self->_layerSerializer)
  {
    v32 = v7;
    id v22 = objc_alloc_init((Class)NSMutableArray);
    v23 = (char *)[a3 count];
    if ((uint64_t)v23 >= 1)
    {
      v24 = v23;
      do
      {
        objc_msgSend(v22, "addObject:", -[MCMontage createParallelizerContainer](self->super._montage, "createParallelizerContainer"));
        --v24;
      }
      while (v24);
    }
    id v25 = [(MCContainerSerializer *)self->_layerSerializer insertPlugsForContainers:v22 atIndex:a4];
    [(MCContainerSerializer *)self->_layerSerializer orderedPlugs];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v26 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = 0;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(a3);
          }
          v31 = *(void **)(*((void *)&v34 + 1) + 8 * (void)k);
          objc_msgSend(v31, "setContainerParallelizer:", objc_msgSend(v22, "objectAtIndex:", (char *)k + v28));
          objc_msgSend(v31, "setContainerPlug:", objc_msgSend(v25, "objectAtIndex:", (char *)k + v28));
        }
        id v27 = [a3 countByEnumeratingWithState:&v34 objects:v46 count:16];
        v28 += (uint64_t)k;
      }
      while (v27);
    }

    double v7 = v32;
  }
  [(NSLock *)[(MPLayerInternal *)self->super._internal containerLock] unlock];
  [(MPLayerSerializer *)self didChange:2 valuesAtIndexes:v33 forKey:@"effectContainers"];
  if ([(MPLayer *)self parentDocument]) {
    objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "unlock");
  }
}

- (void)removeEffectContainersAtIndices:(id)a3
{
  if ([(NSMutableArray *)self->super._effectContainers count])
  {
    if ([(MPLayer *)self parentDocument]) {
      objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "lock");
    }
    [(MPLayerSerializer *)self willChange:3 valuesAtIndexes:a3 forKey:@"effectContainers"];
    layerSerializer = self->_layerSerializer;
    if (layerSerializer) {
      [(MCContainerSerializer *)layerSerializer removePlugsAtIndices:a3];
    }
    [(NSLock *)[(MPLayerInternal *)self->super._internal containerLock] lock];
    double v7 = 0.0;
    if ([(MPLayerInternal *)self->super._internal cleaningUp]
      || [(MPLayer *)self parent]
      && !objc_msgSend(-[MPLayer parent](self, "parent"), "autoAdjustDuration"))
    {
      int v9 = 0;
    }
    else
    {
      [(MPLayer *)self duration];
      double v7 = v8;
      int v9 = 1;
    }
    id v10 = [a3 lastIndex];
    if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v10; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v12 = [(NSMutableArray *)self->super._effectContainers objectAtIndex:i];
        if (v9)
        {
          [(MPLayer *)self reconnectTransitionForEffectContainerAtIndex:i];
          [v12 duration];
          double v7 = v7 - v13;
          if ([v12 transition])
          {
            objc_msgSend(objc_msgSend(v12, "transition"), "duration");
            double v7 = v7 + v14;
          }
        }
        [v12 setParentLayer:0];
        [v12 setContainerParallelizer:0];
        [v12 setContainerPlug:0];
      }
    }
    [(NSMutableArray *)self->super._effectContainers removeObjectsAtIndexes:a3];
    [(NSLock *)[(MPLayerInternal *)self->super._internal containerLock] unlock];
    if (v9)
    {
      double v15 = 0.0;
      if (v7 >= 0.0) {
        double v15 = v7;
      }
      [(MPLayer *)self setDuration:v15];
    }
    [(MPLayerSerializer *)self didChange:3 valuesAtIndexes:a3 forKey:@"effectContainers"];
    if ([(MPLayer *)self parentDocument]) {
      objc_msgSend(objc_msgSend(-[MPLayer parentDocument](self, "parentDocument"), "montage"), "unlock");
    }
  }
}

- (void)moveEffectContainersFromIndices:(id)a3 toIndex:(int64_t)a4
{
  layerSerializer = self->_layerSerializer;
  if (layerSerializer) {
    [(MCContainerSerializer *)layerSerializer movePlugsAtIndices:a3 toIndex:a4];
  }
  id v8 = [a3 firstIndex];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    for (id i = v8; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexGreaterThanIndex:i])
      [(MPLayer *)self reconnectTransitionForEffectContainerAtIndex:i];
  }
  id v10 = [(NSMutableArray *)self->super._effectContainers objectsAtIndexes:a3];
  [(NSLock *)[(MPLayerInternal *)self->super._internal containerLock] lock];
  [(NSMutableArray *)self->super._effectContainers removeObjectsAtIndexes:a3];
  -[NSMutableArray insertObjects:atIndexes:](self->super._effectContainers, "insertObjects:atIndexes:", v10, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [v10 count]));
  [(NSLock *)[(MPLayerInternal *)self->super._internal containerLock] unlock];
  [(MPLayer *)self resetStartTimes];
}

- (void)setAudioPlaylist:(id)a3
{
  audioPlaylist = self->super._audioPlaylist;
  if (audioPlaylist)
  {
    [(MPAudioPlaylist *)audioPlaylist setParentObject:0];
    [(MPAudioPlaylist *)self->super._audioPlaylist setMontage:0];
    [(MPAudioPlaylist *)self->super._audioPlaylist setAudioPlaylist:0];

    self->super._audioPlaylist = 0;
  }
  if (a3)
  {
    double v6 = (MPAudioPlaylist *)a3;
    self->super._audioPlaylist = v6;
    [(MPAudioPlaylist *)v6 setParentObject:self];
    if (self->_layerSerializer)
    {
      [(MPAudioPlaylist *)self->super._audioPlaylist setMontage:self->super._montage];
      double v7 = self->super._audioPlaylist;
      id v8 = [(MCContainer *)self->_layerSerializer audioPlaylistCreateIfNeeded];
      [(MPAudioPlaylist *)v7 setAudioPlaylist:v8];
    }
  }
}

- (id)container
{
  return self->_layerSerializer;
}

- (void)setLayerSerializer:(id)a3
{
  id v5 = (MCContainerSerializer *)a3;
  self->_layerSerializer = v5;
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    if ([(NSMutableArray *)self->super._effectContainers count])
    {
      unint64_t v7 = 0;
      do
      {
        objc_msgSend(v6, "addObject:", -[MCMontage createParallelizerContainer](self->super._montage, "createParallelizerContainer"));
        ++v7;
      }
      while (v7 < (unint64_t)[(NSMutableArray *)self->super._effectContainers count]);
    }
    id v8 = [(MCContainerSerializer *)self->_layerSerializer addPlugsForContainers:v6];
    [(MCContainerSerializer *)self->_layerSerializer orderedPlugs];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    effectContainers = self->super._effectContainers;
    id v10 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (id i = 0; i != v11; id i = (char *)i + 1)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(effectContainers);
          }
          double v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          objc_msgSend(v15, "setContainerParallelizer:", objc_msgSend(v6, "objectAtIndex:", (char *)i + v12));
          objc_msgSend(v15, "setContainerPlug:", objc_msgSend(v8, "objectAtIndex:", (char *)i + v12));
        }
        id v11 = [(NSMutableArray *)effectContainers countByEnumeratingWithState:&v29 objects:v34 count:16];
        v12 += (uint64_t)i;
      }
      while (v11);
    }

    audioPlaylist = self->super._audioPlaylist;
    if (audioPlaylist)
    {
      [(MPAudioPlaylist *)audioPlaylist setMontage:self->super._montage];
      [(MPAudioPlaylist *)self->super._audioPlaylist setAudioPlaylist:[(MCContainer *)self->_layerSerializer audioPlaylistCreateIfNeeded]];
    }
    introTransition = self->_introTransition;
    if (introTransition)
    {
      [(MCContainerSerializer *)self->_layerSerializer setInitialTransitionID:[(MPTransition *)introTransition transitionID]];
      [(MPTransition *)self->_introTransition duration];
      -[MCContainerSerializer setInitialTransitionDuration:](self->_layerSerializer, "setInitialTransitionDuration:");
      [(MPTransition *)self->_introTransition applyFormattedAttributes];
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v18 = self->super._effectContainers;
    id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
          [v23 setContainerParallelizer:0];
          [v23 setContainerPlug:0];
        }
        id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v20);
    }
    v24 = self->super._audioPlaylist;
    if (v24)
    {
      [(MPAudioPlaylist *)v24 setMontage:0];
      [(MPAudioPlaylist *)self->super._audioPlaylist setAudioPlaylist:0];
    }
  }
}

@end