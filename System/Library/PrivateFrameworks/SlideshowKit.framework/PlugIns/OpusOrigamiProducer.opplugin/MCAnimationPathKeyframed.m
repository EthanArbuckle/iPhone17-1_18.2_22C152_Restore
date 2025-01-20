@interface MCAnimationPathKeyframed
+ (double)timeForKeyframe:(id)a3 withPlugTiming:(id)a4;
+ (id)animationPathWithKey:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (MCAnimationPathKeyframed)init;
- (MCAnimationPathKeyframed)initWithImprint:(id)a3;
- (NSSet)keyframes;
- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 offsetKind:(int)a5 forDuration:(double)a6;
- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4;
- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetKind:(int)a5;
- (id)createKeyframeWithScalar:(float)a3 atTime:(double)a4;
- (id)createKeyframeWithScalar:(float)a3 atTime:(double)a4 offsetKind:(int)a5;
- (id)createKeyframeWithVector:(id *)a3 atTime:(double)a4;
- (id)createKeyframeWithVector:(id *)a3 atTime:(double)a4 offsetKind:(int)a5;
- (id)description;
- (id)imprint;
- (id)orderedKeyframesWithPlugTiming:(id)a3;
- (unint64_t)countOfKeyframes;
- (void)_copySelfToSnapshot:(id)a3;
- (void)addKeyframe:(id)a3;
- (void)demolish;
- (void)removeAllKeyframes;
- (void)removeKeyframe:(id)a3;
@end

@implementation MCAnimationPathKeyframed

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"orderedKeyframes"]) {
    return +[NSSet setWithObjects:@"keyframes", 0];
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MCAnimationPathKeyframed;
  return objc_msgSendSuper2(&v6, "keyPathsForValuesAffectingValueForKey:", a3);
}

+ (id)animationPathWithKey:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCAnimationPathKeyframed;
  return objc_msgSendSuper2(&v4, "animationPathWithKey:", a3);
}

- (MCAnimationPathKeyframed)init
{
  v4.receiver = self;
  v4.super_class = (Class)MCAnimationPathKeyframed;
  v2 = [(MCAnimationPathKeyframed *)&v4 init];
  if (v2) {
    v2->mKeyframes = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v2;
}

- (MCAnimationPathKeyframed)initWithImprint:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)MCAnimationPathKeyframed;
  objc_super v4 = -[MCAnimationPath initWithImprint:](&v16, "initWithImprint:");
  if (v4)
  {
    id v5 = [a3 objectForKey:@"keyframes"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = +[MCObjectLight objectWithImprint:*(void *)(*((void *)&v12 + 1) + 8 * (void)v9)];
          [(NSMutableSet *)v4->mKeyframes addObject:v10];
          [v10 setAnimationPath:v4];
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (void)demolish
{
  mKeyframes = self->mKeyframes;
  objc_sync_enter(mKeyframes);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v4 = self->mKeyframes;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) demolish];
      }
      id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  self->mKeyframes = 0;
  self->mCachedOrderedKeyframes = 0;
  objc_sync_exit(mKeyframes);
  v8.receiver = self;
  v8.super_class = (Class)MCAnimationPathKeyframed;
  [(MCAnimationPath *)&v8 demolish];
}

- (id)imprint
{
  v16.receiver = self;
  v16.super_class = (Class)MCAnimationPathKeyframed;
  id v3 = [(MCAnimationPath *)&v16 imprint];
  objc_super v4 = [(MCAnimationPathKeyframed *)self keyframes];
  if ([(NSSet *)v4 count])
  {
    id v6 = +[NSMutableArray array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "imprint"));
          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSSet *)v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v8);
    }
    [v3 setObject:v6 forKey:@"keyframes"];
  }
  return v3;
}

- (NSSet)keyframes
{
  unsigned __int8 v3 = [(MCAnimationPath *)self isSnapshot];
  mKeyframes = self->mKeyframes;
  if ((v3 & 1) == 0)
  {
    objc_sync_enter(self->mKeyframes);
    if ([(NSMutableSet *)self->mKeyframes count]) {
      id v5 = (NSSet *)[objc_alloc((Class)NSSet) initWithSet:self->mKeyframes];
    }
    else {
      id v5 = (NSSet *)sEmptySet;
    }
    objc_sync_exit(mKeyframes);
    return v5;
  }
  return &mKeyframes->super;
}

- (unint64_t)countOfKeyframes
{
  unsigned int v3 = [(MCAnimationPath *)self isSnapshot];
  mKeyframes = self->mKeyframes;
  if (v3)
  {
    id v5 = self->mKeyframes;
    return (unint64_t)[(NSMutableSet *)v5 count];
  }
  else
  {
    objc_sync_enter(self->mKeyframes);
    id v7 = [(NSMutableSet *)self->mKeyframes count];
    objc_sync_exit(mKeyframes);
    return (unint64_t)v7;
  }
}

- (id)orderedKeyframesWithPlugTiming:(id)a3
{
  if ([(MCAnimationPath *)self isSnapshot])
  {
    mCachedOrderedKeyframes = self->mCachedOrderedKeyframes;
    if (!mCachedOrderedKeyframes)
    {
      id v6 = [(NSMutableSet *)self->mKeyframes allObjects];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_868D0;
      v12[3] = &unk_1AB168;
      v12[4] = a3;
      mCachedOrderedKeyframes = (NSArray *)[v6 sortedArrayUsingComparator:v12];
      self->mCachedOrderedKeyframes = mCachedOrderedKeyframes;
    }
  }
  else
  {
    mKeyframes = self->mKeyframes;
    objc_sync_enter(mKeyframes);
    id v8 = self->mCachedOrderedKeyframes;
    if (!v8)
    {
      id v9 = [(NSMutableSet *)self->mKeyframes allObjects];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_869AC;
      v11[3] = &unk_1AB168;
      v11[4] = a3;
      id v8 = (NSArray *)[v9 sortedArrayUsingComparator:v11];
      self->mCachedOrderedKeyframes = v8;
    }
    mCachedOrderedKeyframes = v8;
    objc_sync_exit(mKeyframes);
  }
  return mCachedOrderedKeyframes;
}

+ (double)timeForKeyframe:(id)a3 withPlugTiming:(id)a4
{
  [a3 timeOffset];
  id v6 = [a3 timeOffsetKind];
  TimeForKeyframeAttributesInPlug(v6, v7, a4);
  return result;
}

- (id)createKeyframeWithScalar:(float)a3 atTime:(double)a4
{
  return -[MCAnimationPathKeyframed createKeyframeWithScalar:atTime:offsetKind:](self, "createKeyframeWithScalar:atTime:offsetKind:", 0);
}

- (id)createKeyframeWithScalar:(float)a3 atTime:(double)a4 offsetKind:(int)a5
{
  id v6 = +[MCAnimationKeyframe1D keyframeWithScalar:atTime:offsetKind:](MCAnimationKeyframe1D, "keyframeWithScalar:atTime:offsetKind:", *(void *)&a5);
  [v6 setAnimationPath:self];
  [(MCAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (id)createKeyframeWithFunction:(id)a3 atTime:(double)a4 offsetKind:(int)a5 forDuration:(double)a6
{
  id v7 = +[MCAnimationKeyframeFunction keyframeWithFunction:a3 atTime:*(void *)&a5 offsetKind:a4 forDuration:a6];
  [v7 setAnimationPath:self];
  [(MCAnimationPathKeyframed *)self addKeyframe:v7];
  return v7;
}

- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4
{
  return -[MCAnimationPathKeyframed createKeyframeWithPoint:atTime:offsetKind:](self, "createKeyframeWithPoint:atTime:offsetKind:", 0, a3.x, a3.y, a4);
}

- (id)createKeyframeWithPoint:(CGPoint)a3 atTime:(double)a4 offsetKind:(int)a5
{
  id v6 = +[MCAnimationKeyframe2D keyframeWithPoint:atTime:offsetKind:](MCAnimationKeyframe2D, "keyframeWithPoint:atTime:offsetKind:", *(void *)&a5, a3.x, a3.y, a4);
  [v6 setAnimationPath:self];
  [(MCAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (id)createKeyframeWithVector:(id *)a3 atTime:(double)a4
{
  $421962E1114BB55FD51FACB03C2AC210 v5 = *a3;
  return [(MCAnimationPathKeyframed *)self createKeyframeWithVector:&v5 atTime:0 offsetKind:a4];
}

- (id)createKeyframeWithVector:(id *)a3 atTime:(double)a4 offsetKind:(int)a5
{
  $421962E1114BB55FD51FACB03C2AC210 v8 = *a3;
  id v6 = +[MCAnimationKeyframeVector keyframeWithVector:&v8 atTime:*(void *)&a5 offsetKind:a4];
  [v6 setAnimationPath:self];
  [(MCAnimationPathKeyframed *)self addKeyframe:v6];
  return v6;
}

- (void)addKeyframe:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCAnimationPathKeyframed willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"keyframes", 1);
  mKeyframes = self->mKeyframes;
  objc_sync_enter(mKeyframes);
  [(NSMutableSet *)self->mKeyframes addObject:a3];

  self->mCachedOrderedKeyframes = 0;
  objc_sync_exit(mKeyframes);
  [(MCAnimationPathKeyframed *)self didChangeValueForKey:@"keyframes" withSetMutation:1 usingObjects:v6];
}

- (void)removeKeyframe:(id)a3
{
  id v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", a3, 0);
  -[MCAnimationPathKeyframed willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", @"keyframes", 2);
  mKeyframes = self->mKeyframes;
  objc_sync_enter(mKeyframes);
  [(NSMutableSet *)self->mKeyframes removeObject:a3];
  [a3 setAnimationPath:0];

  self->mCachedOrderedKeyframes = 0;
  objc_sync_exit(mKeyframes);
  [(MCAnimationPathKeyframed *)self didChangeValueForKey:@"keyframes" withSetMutation:2 usingObjects:v6];
}

- (void)removeAllKeyframes
{
  mKeyframes = self->mKeyframes;
  objc_sync_enter(mKeyframes);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  $421962E1114BB55FD51FACB03C2AC210 v5 = self->mKeyframes;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setAnimationPath:0];
        [v4 addObject:v9];
      }
      id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(MCAnimationPathKeyframed *)self willChangeValueForKey:@"keyframes" withSetMutation:2 usingObjects:v4];
  [(NSMutableSet *)self->mKeyframes minusSet:v4];

  self->mCachedOrderedKeyframes = 0;
  objc_sync_exit(mKeyframes);
  [(MCAnimationPathKeyframed *)self didChangeValueForKey:@"keyframes" withSetMutation:2 usingObjects:v4];
}

- (id)description
{
  return +[NSString stringWithFormat:@"Keyframes for %@: %@", [(MCAnimationPath *)self key], self->mKeyframes];
}

- (void)_copySelfToSnapshot:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MCAnimationPathKeyframed;
  -[MCAnimationPath _copySelfToSnapshot:](&v14, "_copySelfToSnapshot:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  $421962E1114BB55FD51FACB03C2AC210 v5 = [(MCAnimationPathKeyframed *)self keyframes];
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*((id *)a3 + 3), "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "snapshot"));
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

@end