@interface _ConformsToProtocolCachedKey
- (BOOL)isEqual:(id)a3;
- (_ConformsToProtocolCachedKey)initWithObject:(id)a3 protocol:(id)a4;
- (unint64_t)hash;
@end

@implementation _ConformsToProtocolCachedKey

- (unint64_t)hash
{
  id WeakRetained = objc_loadWeakRetained(&self->_object);
  uint64_t v4 = [WeakRetained hash];
  unint64_t v5 = [(Protocol *)self->_protocol hash] - v4 + 32 * v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_destroyWeak(&self->_object);
}

- (_ConformsToProtocolCachedKey)initWithObject:(id)a3 protocol:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_ConformsToProtocolCachedKey;
  v8 = [(_ConformsToProtocolCachedKey *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_object, v6);
    objc_storeStrong((id *)&v9->_protocol, a4);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_ConformsToProtocolCachedKey *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    unint64_t v5 = objc_opt_class();
    if ([v5 isEqual:objc_opt_class()])
    {
      id WeakRetained = objc_loadWeakRetained(&self->_object);
      if (WeakRetained)
      {
        id v7 = objc_loadWeakRetained(&v4->_object);
        if (v7)
        {
          id v8 = objc_loadWeakRetained(&self->_object);
          id v9 = objc_loadWeakRetained(&v4->_object);
          BOOL v10 = v8 == v9 && self->_protocol == v4->_protocol;
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

@end