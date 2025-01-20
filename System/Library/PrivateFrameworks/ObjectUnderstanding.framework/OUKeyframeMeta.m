@interface OUKeyframeMeta
- (NSUUID)identifier;
- (OUKeyframeMeta)init;
- (__n128)cameraPose;
- (__n128)setCameraPose:(__n128)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)size;
- (void)setIdentifier:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation OUKeyframeMeta

- (OUKeyframeMeta)init
{
  v3.receiver = self;
  v3.super_class = (Class)OUKeyframeMeta;
  result = [(OUKeyframeMeta *)&v3 init];
  if (result)
  {
    result->_size = 0;
    result->_timestamp = 0.0;
  }
  return result;
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

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (__n128)cameraPose
{
  return a1[2];
}

- (__n128)setCameraPose:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
}

@end