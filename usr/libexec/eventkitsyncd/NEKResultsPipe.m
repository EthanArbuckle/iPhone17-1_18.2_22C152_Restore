@interface NEKResultsPipe
- (BOOL)changesAffectNext24hrs;
- (BOOL)isDeferrable;
- (BOOL)isEffectivelyEmpty;
- (BOOL)isTruncated;
- (NEKResultsPipe)initWithFIFOLength:(int64_t)a3 name:(id)a4;
- (id)completion;
- (void)addCompletion:(id)a3;
- (void)markAsAffectingNext24hrs;
- (void)markAsDeferrable;
- (void)markAsNotEffectivelyEmpty;
- (void)markAsTruncated;
- (void)sealCompletions;
@end

@implementation NEKResultsPipe

- (NEKResultsPipe)initWithFIFOLength:(int64_t)a3 name:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NEKResultsPipe;
  v4 = [(NDTResultsFIFO *)&v8 initWithFIFOLength:a3 name:a4];
  if (v4)
  {
    uint64_t v5 = +[NSMutableArray array];
    completions = v4->_completions;
    v4->_completions = (NSMutableArray *)v5;

    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_isEffectivelyEmpty = 1;
  }
  return v4;
}

- (void)sealCompletions
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  completions = self->_completions;
  self->_completions = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)addCompletion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  completions = self->_completions;
  id v7 = objc_retainBlock(v5);

  [(NSMutableArray *)completions addObject:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)completion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_completions copy];
  os_unfair_lock_unlock(p_lock);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000617FC;
  v8[3] = &unk_1000A8B90;
  id v9 = v4;
  id v5 = v4;
  v6 = objc_retainBlock(v8);

  return v6;
}

- (BOOL)isEffectivelyEmpty
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isEffectivelyEmpty;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)markAsNotEffectivelyEmpty
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isEffectivelyEmpty = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isTruncated
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isTruncated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)markAsTruncated
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isTruncated = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)markAsDeferrable
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isDeferrable = 1;

  os_unfair_lock_unlock(p_lock);
}

- (void)markAsAffectingNext24hrs
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_changesAffectNext24hrs = 1;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)changesAffectNext24hrs
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_changesAffectNext24hrs;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isDeferrable
{
  return self->_isDeferrable;
}

- (void).cxx_destruct
{
}

@end