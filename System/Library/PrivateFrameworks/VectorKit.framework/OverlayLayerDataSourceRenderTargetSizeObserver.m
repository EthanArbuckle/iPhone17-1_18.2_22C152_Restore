@interface OverlayLayerDataSourceRenderTargetSizeObserver
- (CGSize)size;
- (id).cxx_construct;
- (void)sizeDidChange:(CGSize)a3;
@end

@implementation OverlayLayerDataSourceRenderTargetSizeObserver

- (id).cxx_construct
{
  *(_OWORD *)&self->_mtx._lock.__sig = 0u;
  p_mtx = &self->_mtx;
  *(void *)&p_mtx->_lock.__opaque[184] = 0;
  *(_OWORD *)&p_mtx->_lock.__opaque[152] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[168] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[120] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[136] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[88] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[104] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[56] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[72] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[24] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[40] = 0u;
  *(_OWORD *)&p_mtx->_lock.__opaque[8] = 0u;
  v4 = (geo::read_write_lock *)pthread_rwlock_init(&p_mtx->_lock, 0);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"initialization", v5);
  }
  return self;
}

- (void)sizeDidChange:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_mtx = &self->_mtx;
  v7 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_mtx._lock);
  if (v7) {
    geo::read_write_lock::logFailure(v7, (uint64_t)"write lock", v8);
  }
  self->_size.CGFloat width = width;
  self->_size.CGFloat height = height;
  v9 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_mtx->_lock);
  if (v9)
  {
    geo::read_write_lock::logFailure(v9, (uint64_t)"unlock", v10);
  }
}

- (void).cxx_destruct
{
  v2 = (geo::read_write_lock *)pthread_rwlock_destroy(&self->_mtx._lock);
  if (v2)
  {
    geo::read_write_lock::logFailure(v2, (uint64_t)"destruction", v3);
  }
}

- (CGSize)size
{
  p_mtx = &self->_mtx;
  v4 = (geo::read_write_lock *)pthread_rwlock_rdlock(&self->_mtx._lock);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"read lock", v5);
  }
  CGFloat width = self->_size.width;
  CGFloat height = self->_size.height;
  v8 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_mtx->_lock);
  if (v8) {
    geo::read_write_lock::logFailure(v8, (uint64_t)"unlock", v9);
  }
  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

@end