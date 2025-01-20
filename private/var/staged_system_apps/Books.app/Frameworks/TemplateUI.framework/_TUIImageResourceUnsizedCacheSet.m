@interface _TUIImageResourceUnsizedCacheSet
- (_TUIImageResourceUnsizedCacheSet)init;
- (id)largestResourceWithContentAndNaturalSize:(CGSize)a3 contentsScale:(double)a4;
- (void)addImageResource:(id)a3;
@end

@implementation _TUIImageResourceUnsizedCacheSet

- (_TUIImageResourceUnsizedCacheSet)init
{
  v7.receiver = self;
  v7.super_class = (Class)_TUIImageResourceUnsizedCacheSet;
  v2 = [(_TUIImageResourceUnsizedCacheSet *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_setLock._os_unfair_lock_opaque = 0;
    v4 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:517 capacity:1];
    set = v3->_set;
    v3->_set = v4;
  }
  return v3;
}

- (void)addImageResource:(id)a3
{
  if (a3)
  {
    p_setLock = &self->_setLock;
    id v5 = a3;
    os_unfair_lock_lock_with_options();
    [(NSHashTable *)self->_set addObject:v5];

    os_unfair_lock_unlock(p_setLock);
  }
}

- (id)largestResourceWithContentAndNaturalSize:(CGSize)a3 contentsScale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  p_setLock = &self->_setLock;
  os_unfair_lock_lock_with_options();
  v9 = [(NSHashTable *)self->_set allObjects];
  os_unfair_lock_unlock(p_setLock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v11)
  {
    id v12 = v11;
    v13 = 0;
    double v14 = width * a4;
    double v15 = height * a4;
    uint64_t v16 = *(void *)v36;
    double v17 = 0.0;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v10);
        }
        v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v19 naturalSize];
        double v21 = v20;
        double v23 = v22;
        [v19 contentsScale];
        double v25 = v24;
        v26 = [v19 imageContentWithOptions:1];
        v27 = [v26 image];

        if (v27)
        {
          double v28 = v21 * v25;
          double v29 = v23 * v25;
          if (v21 * v25 >= v14 && v29 >= v15)
          {
            id v33 = v19;

            v13 = v33;
            goto LABEL_18;
          }
          double v31 = v28 * v29;
          if (v28 * v29 > v17)
          {
            id v32 = v19;

            double v17 = v31;
            v13 = v32;
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
LABEL_18:

  return v13;
}

- (void).cxx_destruct
{
}

@end