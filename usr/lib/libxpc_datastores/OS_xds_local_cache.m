@interface OS_xds_local_cache
- (void)dealloc;
@end

@implementation OS_xds_local_cache

- (void)dealloc
{
  unint64_t ds_type = self->ds_type;
  if (ds_type == 2)
  {
    data = self->data;
    if (data) {
      munmap(data, self->size);
    }
  }
  else if (ds_type == 1)
  {
    v4 = self->data;
    if (v4) {
      free(v4);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)OS_xds_local_cache;
  [(OS_xds_local_cache *)&v6 dealloc];
}

@end