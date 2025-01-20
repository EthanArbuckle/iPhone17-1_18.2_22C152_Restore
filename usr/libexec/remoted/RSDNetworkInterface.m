@interface RSDNetworkInterface
- (RSDNetworkInterface)initWithName:(const char *)a3 error:(id *)a4;
- (char)name;
- (in6_addr)local_address;
- (unsigned)index;
- (void)dealloc;
- (void)setIndex:(unsigned int)a3;
@end

@implementation RSDNetworkInterface

- (RSDNetworkInterface)initWithName:(const char *)a3 error:(id *)a4
{
  *(void *)v23.__u6_addr8 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v23.__u6_addr32[2] = 0xAAAAAAAAAAAAAAAALL;
  v22.receiver = self;
  v22.super_class = (Class)RSDNetworkInterface;
  v6 = [(RSDNetworkInterface *)&v22 init];
  if (!v6)
  {
    v11 = 0;
    id v15 = 0;
LABEL_10:
    v18 = 0;
    goto LABEL_18;
  }
  unsigned int v7 = if_nametoindex(a3);
  v6->_index = v7;
  if (v7)
  {
    int v8 = sub_10001F918(a3, &v23, 0);
    if (!v8)
    {
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          v19 = strdup(a3);
          if (v19) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        v19 = strdup(a3);
        if (!v19) {
          sub_10003872C(a3, &v24, v29);
        }
      }
      v6->_name = v19;
      v20 = (in6_addr *)malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
      if (!v20) {
        sub_10003CED4(&v24, v29);
      }
      v11 = 0;
      v6->_local_address = v20;
      in6_addr *v20 = v23;
      goto LABEL_17;
    }
    int v9 = v8;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    v10 = +[NSString stringWithFormat:@"network_copy_interface_address_in6: %s", strerror(v8)];
    v26 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];

    id v12 = objc_alloc((Class)NSError);
    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = v9;
  }
  else
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    v16 = +[NSString stringWithFormat:@"failed to find interface index for name %s", a3];
    v28 = v16;
    v11 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

    id v12 = objc_alloc((Class)NSError);
    NSErrorDomain v13 = NSPOSIXErrorDomain;
    uint64_t v14 = 22;
  }
  id v17 = [v12 initWithDomain:v13 code:v14 userInfo:v11];
  id v15 = v17;
  if (!v17)
  {
LABEL_17:
    v18 = v6;
    id v15 = 0;
    goto LABEL_18;
  }
  if (!a4) {
    goto LABEL_10;
  }
  id v15 = v17;
  v18 = 0;
  *a4 = v15;
LABEL_18:

  return v18;
}

- (void)dealloc
{
  free(self->_name);
  self->_name = 0;
  free(self->_local_address);
  self->_local_address = 0;
  v3.receiver = self;
  v3.super_class = (Class)RSDNetworkInterface;
  [(RSDNetworkInterface *)&v3 dealloc];
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (char)name
{
  return self->_name;
}

- (in6_addr)local_address
{
  return self->_local_address;
}

@end