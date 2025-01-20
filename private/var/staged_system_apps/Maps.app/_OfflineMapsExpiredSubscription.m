@interface _OfflineMapsExpiredSubscription
- (BOOL)isEqual:(id)a3;
- (GEOMapDataSubscription)subscription;
- (_OfflineMapsExpiredSubscription)initWithSubscription:(id)a3;
- (unint64_t)hash;
@end

@implementation _OfflineMapsExpiredSubscription

- (_OfflineMapsExpiredSubscription)initWithSubscription:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_OfflineMapsExpiredSubscription;
  v6 = [(_OfflineMapsExpiredSubscription *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscription, a3);
    v8 = v7;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(GEOMapDataSubscription *)self->_subscription identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_OfflineMapsExpiredSubscription *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(_OfflineMapsExpiredSubscription *)v5 subscription];
    v7 = [v6 identifier];
    v8 = [(_OfflineMapsExpiredSubscription *)self subscription];
    v9 = [v8 identifier];
    unsigned __int8 v10 = [v7 isEqual:v9];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (GEOMapDataSubscription)subscription
{
  return self->_subscription;
}

- (void).cxx_destruct
{
}

@end