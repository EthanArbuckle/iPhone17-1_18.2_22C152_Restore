@interface NTKSnapshotToken
- (NTKSnapshotToken)initWithPriority:(unint64_t)a3 callback:(id)a4;
- (id)callback;
- (unint64_t)priority;
- (void)dealloc;
- (void)setPriority:(unint64_t)a3;
- (void)setRequest:(id)a3;
- (void)stopObservingCallbacks;
@end

@implementation NTKSnapshotToken

- (NTKSnapshotToken)initWithPriority:(unint64_t)a3 callback:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKSnapshotToken;
  v7 = [(NTKSnapshotToken *)&v13 init];
  v8 = v7;
  if (v7)
  {
    request = v7->_request;
    v7->_request = 0;

    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_priority = a3;
    v10 = _Block_copy(v6);
    id callback = v8->_callback;
    v8->_id callback = v10;
  }
  return v8;
}

- (void)dealloc
{
  [(NTKSnapshotRequest *)self->_request updatePriority];
  v3.receiver = self;
  v3.super_class = (Class)NTKSnapshotToken;
  [(NTKSnapshotToken *)&v3 dealloc];
}

- (unint64_t)priority
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t lock_priority = self->_lock_priority;
  os_unfair_lock_unlock(p_lock);
  return lock_priority;
}

- (void)setPriority:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t lock_priority = a3;
  os_unfair_lock_unlock(p_lock);
  request = self->_request;
  [(NTKSnapshotRequest *)request updatePriority];
}

- (void)setRequest:(id)a3
{
  v4 = (NTKSnapshotRequest *)a3;
  os_unfair_lock_lock(&self->_lock);
  request = self->_request;
  self->_request = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)callback
{
  v2 = _Block_copy(self->_callback);
  return v2;
}

- (void)stopObservingCallbacks
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end