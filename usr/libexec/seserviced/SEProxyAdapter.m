@interface SEProxyAdapter
- (id)transceive:(id)a3 outError:(id *)a4;
@end

@implementation SEProxyAdapter

- (id)transceive:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000538AC;
  v21 = sub_1000538BC;
  id v22 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_1000538AC;
  v15 = sub_1000538BC;
  id v16 = 0;
  proxy = self->_proxy;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000538C4;
  v10[3] = &unk_10040D8D8;
  v10[4] = &v17;
  v10[5] = &v11;
  [(SEProxyInterface *)proxy transceive:v6 callback:v10];
  if (a4) {
    *a4 = (id) v12[5];
  }
  id v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);

  return v8;
}

- (void).cxx_destruct
{
}

@end