@interface RSKeyframeMeta
- (RSKeyframeMeta)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSKeyframeMeta

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  objc_storeStrong((id *)(v4 + 8), self->_identifier);
  long long v5 = *(_OWORD *)&self[1].super.isa;
  long long v6 = *(_OWORD *)&self[1]._size;
  long long v7 = *(_OWORD *)&self[2]._size;
  *(_OWORD *)(v4 + 64) = *(_OWORD *)&self[2].super.isa;
  *(_OWORD *)(v4 + 80) = v7;
  *(_OWORD *)(v4 + 32) = v5;
  *(_OWORD *)(v4 + 48) = v6;
  *(void *)(v4 + 16) = self->_size;
  *(double *)(v4 + 24) = self->_timestamp;
  return (id)v4;
}

- (RSKeyframeMeta)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSKeyframeMeta;
  result = [(RSKeyframeMeta *)&v3 init];
  if (result)
  {
    result->_size = 0;
    result->_timestamp = 0.0;
  }
  return result;
}

@end