@interface OspreyConnectionHandle
- (OspreyConnectionHandle)initWithConnectionKey:(id)a3 willRelease:(id)a4;
- (id)connectionKey;
- (void)dealloc;
@end

@implementation OspreyConnectionHandle

- (OspreyConnectionHandle)initWithConnectionKey:(id)a3 willRelease:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OspreyConnectionHandle;
  v8 = [(OspreyConnectionHandle *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id connectionKey = v8->_connectionKey;
    v8->_id connectionKey = (id)v9;

    uint64_t v11 = [v7 copy];
    id willRelease = v8->_willRelease;
    v8->_id willRelease = (id)v11;
  }
  return v8;
}

- (void)dealloc
{
  id willRelease = (void (**)(id, OspreyConnectionHandle *))self->_willRelease;
  if (willRelease) {
    willRelease[2](willRelease, self);
  }
  v4.receiver = self;
  v4.super_class = (Class)OspreyConnectionHandle;
  [(OspreyConnectionHandle *)&v4 dealloc];
}

- (id)connectionKey
{
  return self->_connectionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionKey, 0);

  objc_storeStrong(&self->_willRelease, 0);
}

@end