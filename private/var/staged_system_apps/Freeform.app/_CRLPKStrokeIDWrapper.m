@interface _CRLPKStrokeIDWrapper
- (BOOL)isEqual:(id)a3;
- (_CRLPKStrokeID)strokeID;
- (_CRLPKStrokeIDWrapper)initWithStrokeID:(_CRLPKStrokeID *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setStrokeID:(_CRLPKStrokeID *)a3;
@end

@implementation _CRLPKStrokeIDWrapper

- (_CRLPKStrokeIDWrapper)initWithStrokeID:(_CRLPKStrokeID *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_CRLPKStrokeIDWrapper;
  result = [(_CRLPKStrokeIDWrapper *)&v6 init];
  uint64_t v5 = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&result->_strokeID.clock = *(_OWORD *)&a3->clock;
  *(void *)&result->_strokeID.replicaUUID[12] = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  [(_CRLPKStrokeIDWrapper *)self strokeID];
  if (v4)
  {
    [v4 strokeID];
    int v5 = v8;
  }
  else
  {
    int v5 = 0;
    int v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  BOOL v6 = v12 == v5 && !sub_1003E6610(v13, (const unsigned __int8 *)&v9) && v14 == HIDWORD(v11);

  return v6;
}

- (unint64_t)hash
{
  return *(void *)self->_strokeID.replicaUUID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[_CRLPKStrokeIDWrapper allocWithZone:a3];
  [(_CRLPKStrokeIDWrapper *)self strokeID];
  return [(_CRLPKStrokeIDWrapper *)v4 initWithStrokeID:&v6];
}

- (_CRLPKStrokeID)strokeID
{
  *retstr = *(_CRLPKStrokeID *)&self->replicaUUID[4];
  return self;
}

- (void)setStrokeID:(_CRLPKStrokeID *)a3
{
  long long v3 = *(_OWORD *)&a3->clock;
  *(void *)&self->_strokeID.replicaUUID[12] = *(void *)&a3->replicaUUID[12];
  *(_OWORD *)&self->_strokeID.clock = v3;
}

@end