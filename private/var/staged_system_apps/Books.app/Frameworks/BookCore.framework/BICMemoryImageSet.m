@interface BICMemoryImageSet
- (BICMemoryImageSet)init;
- (BOOL)actualAspectRatio;
- (NSDate)dateRequested;
- (NSSet)imageEntries;
- (NSString)identifier;
- (float)heightForAspectRatio;
- (float)widthForAspectRatio;
- (id)imageColor;
- (id)primaryEntry;
- (int)requestCount;
- (int64_t)imageColorARGBHex;
- (os_unfair_lock_s)accessLock;
- (void)addEntry:(id)a3;
- (void)deleteEntry:(id)a3;
- (void)setAccessLock:(os_unfair_lock_s)a3;
- (void)setActualAspectRatio:(BOOL)a3;
- (void)setDateRequested:(id)a3;
- (void)setHeightForAspectRatio:(float)a3;
- (void)setIdentifier:(id)a3;
- (void)setImageColorARGBHex:(int64_t)a3;
- (void)setImageEntries:(id)a3;
- (void)setRequestCount:(int)a3;
- (void)setWidthForAspectRatio:(float)a3;
@end

@implementation BICMemoryImageSet

- (BICMemoryImageSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)BICMemoryImageSet;
  v2 = [(BICMemoryImageSet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    [(BICMemoryImageSet *)v2 setImageColorARGBHex:0xFFFFFFLL];
    v4 = +[NSSet set];
    [(BICMemoryImageSet *)v3 setImageEntries:v4];
  }
  return v3;
}

- (void)deleteEntry:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_46FB0;
  v5[3] = &unk_2C3AF8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_46FB0((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (void)addEntry:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_470D0;
  v5[3] = &unk_2C3AF8;
  p_accessLock = &self->_accessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_470D0((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);
}

- (id)primaryEntry
{
  v3 = objc_opt_new();
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_47490;
  v39 = sub_474A0;
  id v40 = 0;
  p_accessLock = &self->_accessLock;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v31 = sub_474A8;
  v32 = &unk_2C39F0;
  v33 = self;
  v34 = &v35;
  v5 = v30;
  os_unfair_lock_lock(p_accessLock);
  v31((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = (id)v36[5];
  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v11 potentialPrimary])
        {
          if (v8 == [v11 quality])
          {
            [v3 addObject:v11];
          }
          else if (v8 < [v11 quality])
          {
            [v3 removeAllObjects];
            [v3 addObject:v11];
            unint64_t v8 = [v11 quality];
          }
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v7);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v3;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v41 count:16];
  if (v13)
  {
    unint64_t v14 = 0;
    v15 = 0;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        if (v14 < (int)objc_msgSend(v18, "level", (void)v22))
        {
          id v19 = v18;

          unint64_t v14 = (int)[v19 level];
          v15 = v19;
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v41 count:16];
    }
    while (v13);
  }
  else
  {
    v15 = 0;
  }

  id v20 = v15;
  _Block_object_dispose(&v35, 8);

  return v20;
}

- (id)imageColor
{
  if ((id)[(BICMemoryImageSet *)self imageColorARGBHex] == (id)0xFFFFFF)
  {
    v3 = 0;
  }
  else
  {
    v3 = +[UIColor bc_colorWithARGBHexValue:[(BICMemoryImageSet *)self imageColorARGBHex]];
  }

  return v3;
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int)requestCount
{
  return self->requestCount;
}

- (void)setRequestCount:(int)a3
{
  self->requestCount = a3;
}

- (BOOL)actualAspectRatio
{
  return self->actualAspectRatio;
}

- (void)setActualAspectRatio:(BOOL)a3
{
  self->actualAspectRatio = a3;
}

- (float)heightForAspectRatio
{
  return self->heightForAspectRatio;
}

- (void)setHeightForAspectRatio:(float)a3
{
  self->heightForAspectRatio = a3;
}

- (float)widthForAspectRatio
{
  return self->widthForAspectRatio;
}

- (void)setWidthForAspectRatio:(float)a3
{
  self->widthForAspectRatio = a3;
}

- (int64_t)imageColorARGBHex
{
  return self->imageColorARGBHex;
}

- (void)setImageColorARGBHex:(int64_t)a3
{
  self->imageColorARGBHex = a3;
}

- (NSDate)dateRequested
{
  return self->dateRequested;
}

- (void)setDateRequested:(id)a3
{
}

- (NSSet)imageEntries
{
  return self->imageEntries;
}

- (void)setImageEntries:(id)a3
{
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->imageEntries, 0);
  objc_storeStrong((id *)&self->dateRequested, 0);

  objc_storeStrong((id *)&self->identifier, 0);
}

@end