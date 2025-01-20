@interface SKProductsResponse
- (NSArray)invalidProductIdentifiers;
- (NSArray)products;
- (SKProductsResponse)init;
- (SKProductsResponse)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)_setInvalidIdentifiers:(id)a3;
- (void)_setProducts:(id)a3;
@end

@implementation SKProductsResponse

- (SKProductsResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductsResponse;
  v2 = [(SKProductsResponse *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductsResponseInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (NSArray)invalidProductIdentifiers
{
  return (NSArray *)*((id *)self->_internal + 1);
}

- (NSArray)products
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (SKProductsResponse)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v8 = [(SKProductsResponse *)self init];
    objc_super v6 = v8;
    if (v8)
    {
      v9 = v8->_internal;
      objc_opt_class();
      CFDictionaryRef v10 = sub_10010B0C0(v5, "0");
      v11 = (void *)v9[1];
      v9[1] = v10;

      id v12 = objc_alloc_init((Class)NSMutableArray);
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      v14 = xpc_dictionary_get_value(v5, "1");
      v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472;
      v21 = sub_100109E58;
      v22 = &unk_1003A41C8;
      id v23 = v13;
      id v24 = v12;
      id v15 = v12;
      id v16 = v13;
      xpc_array_apply(v14, &v19);
      id v17 = objc_msgSend(v15, "copy", v19, v20, v21, v22);
      v18 = (void *)v9[2];
      v9[2] = v17;
    }
  }
  else
  {

    objc_super v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = self->_internal;
  sub_10010B10C(v3, "0", *((__CFString **)v4 + 1));
  xpc_object_t v5 = xpc_array_create(0, 0);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 2);
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      CFDictionaryRef v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v10), "copyXPCEncoding", (void)v13);
        if (v11) {
          xpc_array_append_value(v5, v11);
        }

        CFDictionaryRef v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  xpc_dictionary_set_value(v3, "1", v5);
  return v3;
}

- (void)_setInvalidIdentifiers:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[1];
    internal[1] = v5;
  }
}

- (void)_setProducts:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[2] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[2];
    internal[2] = v5;
  }
}

- (void).cxx_destruct
{
}

@end