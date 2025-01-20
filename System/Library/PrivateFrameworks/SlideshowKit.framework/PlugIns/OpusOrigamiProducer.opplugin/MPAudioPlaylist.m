@interface MPAudioPlaylist
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)audioPlaylist;
- (MPAudioPlaylist)init;
- (double)duckInDuration;
- (double)duckLevel;
- (double)duckOutDuration;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (id)audioPlaylist;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)montage;
- (id)objectInSongsAtIndex:(int64_t)a3;
- (id)parentDocument;
- (id)parentObject;
- (id)songs;
- (int64_t)countOfSongs;
- (void)addSong:(id)a3;
- (void)addSongs:(id)a3;
- (void)copySongs:(id)a3;
- (void)copyStruct:(id)a3;
- (void)dealloc;
- (void)insertObject:(id)a3 inSongsAtIndex:(int64_t)a4;
- (void)insertSongs:(id)a3 atIndex:(int64_t)a4;
- (void)moveSongsFromIndices:(id)a3 toIndex:(int64_t)a4;
- (void)removeAllSongs;
- (void)removeObjectFromSongsAtIndex:(int64_t)a3;
- (void)removeSongsAtIndices:(id)a3;
- (void)replaceObjectInSongsAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)setAudioPlaylist:(id)a3;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(double)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setMontage:(id)a3;
- (void)setParentObject:(id)a3;
- (void)setPlug:(id)a3;
@end

@implementation MPAudioPlaylist

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return [a3 isEqualToString:@"songs"] ^ 1;
}

+ (id)audioPlaylist
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (MPAudioPlaylist)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPAudioPlaylist;
  id v2 = [(MPAudioPlaylist *)&v4 init];
  if (v2)
  {
    v2->_internal = objc_alloc_init(MPPlaylistInternal);
    v2->_songs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_attributes = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    *(_OWORD *)&v2->_audioPlaylist = 0u;
    *(_OWORD *)&v2->_parentObject = 0u;
    [(MPPlaylistInternal *)v2->_internal setDuration:0.0];
    [(MPPlaylistInternal *)v2->_internal setFadeInDuration:0.0];
    [(MPPlaylistInternal *)v2->_internal setFadeOutDuration:0.0];
    [(MPPlaylistInternal *)v2->_internal setDuckInDuration:0.0];
    [(MPPlaylistInternal *)v2->_internal setDuckOutDuration:0.0];
    [(MPPlaylistInternal *)v2->_internal setDuckLevel:1.0];
  }
  return v2;
}

- (void)dealloc
{
  [(MPAudioPlaylist *)self cleanup];
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0;
  }
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {

    self->_audioPlaylist = 0;
  }

  self->_internal = 0;
  v5.receiver = self;
  v5.super_class = (Class)MPAudioPlaylist;
  [(MPAudioPlaylist *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 copySongs:self->_songs];
  [v4 copyStruct:self->_internal];
  return v4;
}

- (id)description
{
  v3 = +[NSString stringWithFormat:@"================================ Audio Playlist ================================\n"];
  [(MPAudioPlaylist *)self duration];
  objc_super v5 = [[(NSString *)v3 stringByAppendingFormat:@"\t                   Duration: %f\n" stringByAppendingFormat:"stringByAppendingFormat:", @"\t             Count of Songs: %d\n", [(NSMutableArray *)self->_songs count]];
  if (self->_audioPlaylist) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  return [(NSString *)v5 stringByAppendingFormat:@"\t               Has Playlist: %@\n", v6];
}

- (id)songs
{
  return self->_songs;
}

- (void)addSong:(id)a3
{
  uint64_t v4 = +[NSArray arrayWithObject:a3];
  id v5 = [(NSMutableArray *)self->_songs count];
  [(MPAudioPlaylist *)self insertSongs:v4 atIndex:v5];
}

- (void)addSongs:(id)a3
{
  id v5 = [(NSMutableArray *)self->_songs count];
  [(MPAudioPlaylist *)self insertSongs:a3 atIndex:v5];
}

- (void)insertSongs:(id)a3 atIndex:(int64_t)a4
{
  v7 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [a3 count]);
  [(MPAudioPlaylist *)self willChange:2 valuesAtIndexes:v7 forKey:@"songs"];
  [(NSMutableArray *)self->_songs insertObjects:a3 atIndexes:v7];
  [(MPAudioPlaylist *)self duration];
  double v9 = v8;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(a3);
        }
        v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v14 setParentPlaylist:self];
        [v14 duration];
        double v9 = v9 + v15;
      }
      id v11 = [a3 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }
  [(MPAudioPlaylist *)self setDuration:v9];
  if (self->_audioPlaylist)
  {
    id v16 = +[NSMutableArray array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(v16, "addObject:", -[MCMontage audioAssetForFileAtPath:](self->_montage, "audioAssetForFileAtPath:", objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)j), "path")));
        }
        id v18 = [a3 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v18);
    }
    id v21 = objc_msgSend(-[MCAudioPlaylist insertSongsForAssets:atIndex:](self->_audioPlaylist, "insertSongsForAssets:atIndex:", v16, a4), "objectEnumerator");
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v22 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v27;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v27 != v24) {
            objc_enumerationMutation(a3);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)k), "setSong:", objc_msgSend(v21, "nextObject"));
        }
        id v23 = [a3 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v23);
    }
  }
  [(MPAudioPlaylist *)self didChange:2 valuesAtIndexes:v7 forKey:@"songs"];
}

- (void)removeSongsAtIndices:(id)a3
{
  if ([(NSMutableArray *)self->_songs count])
  {
    [(MPAudioPlaylist *)self willChange:3 valuesAtIndexes:a3 forKey:@"songs"];
    audioPlaylist = self->_audioPlaylist;
    if (audioPlaylist) {
      [(MCAudioPlaylist *)audioPlaylist removeSongsAtIndices:a3];
    }
    id v6 = objc_msgSend(-[MPAudioPlaylist parentDocument](self, "parentDocument"), "undoManager");
    [(MPAudioPlaylist *)self duration];
    double v8 = v7;
    id v9 = [a3 lastIndex];
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      for (id i = v9; i != (id)0x7FFFFFFFFFFFFFFFLL; id i = [a3 indexLessThanIndex:i])
      {
        id v11 = [(NSMutableArray *)self->_songs objectAtIndex:i];
        [v11 duration];
        double v13 = v12;
        [v11 setParentPlaylist:0];
        [v11 setSong:0];
        if (v6) {
          objc_msgSend(objc_msgSend(v6, "prepareWithInvocationTarget:", self), "insertSongs:atIndex:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v11), i);
        }
        double v8 = v8 - v13;
      }
    }
    double v14 = 0.0;
    if (v8 >= 0.0) {
      double v14 = v8;
    }
    [(MPAudioPlaylist *)self setDuration:v14];
    [(NSMutableArray *)self->_songs removeObjectsAtIndexes:a3];
    [(MPAudioPlaylist *)self didChange:3 valuesAtIndexes:a3 forKey:@"songs"];
  }
}

- (void)removeAllSongs
{
  v3 = +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", 0, [(NSMutableArray *)self->_songs count]);
  [(MPAudioPlaylist *)self removeSongsAtIndices:v3];
}

- (void)moveSongsFromIndices:(id)a3 toIndex:(int64_t)a4
{
  [(MPAudioPlaylist *)self willChangeValueForKey:@"songs"];
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist) {
    [(MCAudioPlaylist *)audioPlaylist moveSongsAtIndices:a3 toIndex:a4];
  }
  id v8 = [(NSMutableArray *)self->_songs objectsAtIndexes:a3];
  [(NSMutableArray *)self->_songs removeObjectsAtIndexes:a3];
  -[NSMutableArray insertObjects:atIndexes:](self->_songs, "insertObjects:atIndexes:", v8, +[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", a4, [v8 count]));
  [(MPAudioPlaylist *)self didChangeValueForKey:@"songs"];
}

- (id)parentObject
{
  return self->_parentObject;
}

- (double)duration
{
  [(MPPlaylistInternal *)self->_internal duration];
  return result;
}

- (double)fadeInDuration
{
  [(MPPlaylistInternal *)self->_internal fadeInDuration];
  return result;
}

- (void)setFadeInDuration:(double)a3
{
  -[MPPlaylistInternal setFadeInDuration:](self->_internal, "setFadeInDuration:");
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    [(MCAudioPlaylist *)audioPlaylist setFadeInDuration:a3];
  }
}

- (double)fadeOutDuration
{
  [(MPPlaylistInternal *)self->_internal fadeOutDuration];
  return result;
}

- (void)setFadeOutDuration:(double)a3
{
  -[MPPlaylistInternal setFadeOutDuration:](self->_internal, "setFadeOutDuration:");
  plug = self->_plug;
  if (plug
    && objc_msgSend(-[MCPlug idInSupercontainer](plug, "idInSupercontainer"), "hasPrefix:", @"ba"))
  {
    objc_msgSend(-[MPAudioPlaylist parentDocument](self, "parentDocument"), "setAudioFadeOutDuration:", a3);
  }
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    [(MCAudioPlaylist *)audioPlaylist setFadeOutDuration:a3];
  }
}

- (double)duckInDuration
{
  [(MPPlaylistInternal *)self->_internal duckInDuration];
  return result;
}

- (void)setDuckInDuration:(double)a3
{
  -[MPPlaylistInternal setDuckInDuration:](self->_internal, "setDuckInDuration:");
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    [(MCAudioPlaylist *)audioPlaylist setDuckInDuration:a3];
  }
}

- (double)duckOutDuration
{
  [(MPPlaylistInternal *)self->_internal duckOutDuration];
  return result;
}

- (void)setDuckOutDuration:(double)a3
{
  -[MPPlaylistInternal setDuckOutDuration:](self->_internal, "setDuckOutDuration:");
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    [(MCAudioPlaylist *)audioPlaylist setDuckOutDuration:a3];
  }
}

- (double)duckLevel
{
  [(MPPlaylistInternal *)self->_internal duckLevel];
  return result;
}

- (void)setDuckLevel:(double)a3
{
  -[MPPlaylistInternal setDuckLevel:](self->_internal, "setDuckLevel:");
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {
    *(float *)&double v5 = a3;
    [(MCAudioPlaylist *)audioPlaylist setDuckLevel:v5];
  }
}

- (id)audioPlaylist
{
  return self->_audioPlaylist;
}

- (void)copyStruct:(id)a3
{
  [a3 duration];
  -[MPPlaylistInternal setDuration:](self->_internal, "setDuration:");
  [a3 fadeInDuration];
  -[MPPlaylistInternal setFadeInDuration:](self->_internal, "setFadeInDuration:");
  [a3 fadeOutDuration];
  -[MPPlaylistInternal setFadeOutDuration:](self->_internal, "setFadeOutDuration:");
  [a3 duckInDuration];
  -[MPPlaylistInternal setDuckInDuration:](self->_internal, "setDuckInDuration:");
  [a3 duckOutDuration];
  -[MPPlaylistInternal setDuckOutDuration:](self->_internal, "setDuckOutDuration:");
  [a3 duckLevel];
  internal = self->_internal;
  -[MPPlaylistInternal setDuckLevel:](internal, "setDuckLevel:");
}

- (void)copySongs:(id)a3
{
  id v5 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) copy];
        [v5 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [(MPAudioPlaylist *)self addSongs:v5];
}

- (id)montage
{
  return self->_montage;
}

- (void)setMontage:(id)a3
{
  self->_montage = (MCMontage *)a3;
}

- (void)setAudioPlaylist:(id)a3
{
  audioPlaylist = self->_audioPlaylist;
  if (audioPlaylist)
  {

    self->_audioPlaylist = 0;
  }
  id v6 = (MCAudioPlaylist *)a3;
  self->_audioPlaylist = v6;
  if (v6 && self->_montage)
  {
    if ([(MCAudioPlaylist *)v6 countOfSongs]) {
      [(MCAudioPlaylist *)self->_audioPlaylist removeAllSongs];
    }
    id v7 = +[NSMutableArray array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    songs = self->_songs;
    id v9 = [(NSMutableArray *)songs countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (id i = 0; i != v10; id i = (char *)i + 1)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(songs);
          }
          objc_msgSend(v7, "addObject:", -[MCMontage audioAssetForFileAtPath:](self->_montage, "audioAssetForFileAtPath:", objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "path")));
        }
        id v10 = [(NSMutableArray *)songs countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v10);
    }
    id v13 = objc_msgSend(-[MCAudioPlaylist addSongsForAssets:](self->_audioPlaylist, "addSongsForAssets:", v7), "objectEnumerator");
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v14 = self->_songs;
    id v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * (void)j), "setSong:", objc_msgSend(v13, "nextObject"));
        }
        id v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v16);
    }
    [(MPAudioPlaylist *)self fadeInDuration];
    -[MCAudioPlaylist setFadeInDuration:](self->_audioPlaylist, "setFadeInDuration:");
    [(MPAudioPlaylist *)self fadeOutDuration];
    -[MCAudioPlaylist setFadeOutDuration:](self->_audioPlaylist, "setFadeOutDuration:");
    [(MPAudioPlaylist *)self duckInDuration];
    -[MCAudioPlaylist setDuckInDuration:](self->_audioPlaylist, "setDuckInDuration:");
    [(MPAudioPlaylist *)self duckOutDuration];
    -[MCAudioPlaylist setDuckOutDuration:](self->_audioPlaylist, "setDuckOutDuration:");
    [(MPAudioPlaylist *)self duckLevel];
    *(float *)&double v19 = v19;
    [(MCAudioPlaylist *)self->_audioPlaylist setDuckLevel:v19];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v20 = self->_songs;
    id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v26;
      do
      {
        for (k = 0; k != v22; k = (char *)k + 1)
        {
          if (*(void *)v26 != v23) {
            objc_enumerationMutation(v20);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * (void)k) setSong:0];
        }
        id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v22);
    }
  }
}

- (void)setPlug:(id)a3
{
  plug = self->_plug;
  if (plug)
  {

    self->_plug = 0;
  }
  id v6 = (MCPlug *)a3;
  self->_plug = v6;
  if (v6)
  {
    if (self->_montage)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_msgSend(-[MCPlug idInSupercontainer](self->_plug, "idInSupercontainer"), "hasPrefix:", @"ba"))
        {
          [(MPAudioPlaylist *)self fadeOutDuration];
          -[MCMontage setAudioFadeOutDuration:](self->_montage, "setAudioFadeOutDuration:");
        }
      }
    }
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [(MPAudioSupport *)self->_parentObject autoAdjustDuration])
    {
      [(MPPlaylistInternal *)self->_internal duration];
      -[MCPlug setLoopDuration:](self->_plug, "setLoopDuration:");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      parentObject = self->_parentObject;
      [(MPAudioSupport *)parentObject resetDuration];
    }
  }
}

- (void)setParentObject:(id)a3
{
  if (a3 && self->_parentObject) {
    objc_exception_throw(+[NSException exceptionWithName:@"ManyToOneException" reason:@"A playlist may one have one parent.  Please remove it first.  This is unsupported." userInfo:0]);
  }
  self->_parentObject = (MPAudioSupport *)a3;
}

- (void)setDuration:(double)a3
{
  parentObject = self->_parentObject;
  if (!parentObject) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    parentObject = 0;
    goto LABEL_8;
  }
  parentObject = self->_parentObject;
  if (!parentObject)
  {
LABEL_8:
    unsigned __int8 v6 = 0;
    char v7 = 1;
    goto LABEL_9;
  }
  if (self->_plug && [(MPAudioSupport *)self->_parentObject loopingMode] == &dword_4)
  {
    unsigned __int8 v6 = objc_msgSend(-[MCPlug idInSupercontainer](self->_plug, "idInSupercontainer"), "hasPrefix:", @"ba");
    char v7 = 0;
  }
  else
  {
    char v7 = 0;
    unsigned __int8 v6 = 0;
  }
LABEL_9:
  if (objc_opt_respondsToSelector()) {
    unsigned int v8 = [(MPAudioSupport *)self->_parentObject autoAdjustDuration] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }
  plug = self->_plug;
  if (plug) {
    char v10 = v6;
  }
  else {
    char v10 = 1;
  }
  if ((v10 & 1) == 0 && (v8 & 1) == 0) {
    [(MCPlug *)plug setLoopDuration:a3];
  }
  [(MPPlaylistInternal *)self->_internal setDuration:a3];
  if ((v7 & 1) == 0)
  {
    [(MPAudioSupport *)parentObject resetDuration];
  }
}

- (id)parentDocument
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  parentObject = self->_parentObject;
  if (isKindOfClass) {
    return parentObject;
  }
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();
  char v7 = self->_parentObject;
  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass();
    char v7 = self->_parentObject;
    if ((v8 & 1) == 0)
    {
      objc_opt_class();
      char v9 = objc_opt_isKindOfClass();
      char v7 = self->_parentObject;
      if ((v9 & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        char v7 = (MPAudioSupport *)objc_msgSend(-[MPAudioSupport parentContainer](self->_parentObject, "parentContainer"), "parentLayer");
      }
    }
  }
  return [(MPAudioSupport *)v7 parentDocument];
}

- (int64_t)countOfSongs
{
  return (int64_t)[(NSMutableArray *)self->_songs count];
}

- (id)objectInSongsAtIndex:(int64_t)a3
{
  return [(NSMutableArray *)self->_songs objectAtIndex:a3];
}

- (void)insertObject:(id)a3 inSongsAtIndex:(int64_t)a4
{
  char v6 = +[NSArray arrayWithObject:a3];
  [(MPAudioPlaylist *)self insertSongs:v6 atIndex:a4];
}

- (void)removeObjectFromSongsAtIndex:(int64_t)a3
{
  uint64_t v4 = +[NSIndexSet indexSetWithIndex:a3];
  [(MPAudioPlaylist *)self removeSongsAtIndices:v4];
}

- (void)replaceObjectInSongsAtIndex:(int64_t)a3 withObject:(id)a4
{
  [(MPAudioPlaylist *)self removeSongsAtIndices:+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:")];
  char v7 = +[NSArray arrayWithObject:a4];
  [(MPAudioPlaylist *)self insertSongs:v7 atIndex:a3];
}

@end