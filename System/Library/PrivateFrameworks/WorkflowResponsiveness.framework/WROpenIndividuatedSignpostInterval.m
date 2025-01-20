@interface WROpenIndividuatedSignpostInterval
- (id)individuationIdentifier;
- (id)initWithSignpost:(void *)a3 individuationIdentifier:(void *)a4 timestampAndThread:;
- (id)signpost;
- (id)timestampAndThread;
@end

@implementation WROpenIndividuatedSignpostInterval

- (id)initWithSignpost:(void *)a3 individuationIdentifier:(void *)a4 timestampAndThread:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)WROpenIndividuatedSignpostInterval;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (id)signpost
{
  if (result) {
    return objc_getProperty(result, a2, 8, 1);
  }
  return result;
}

- (id)individuationIdentifier
{
  if (result) {
    return objc_getProperty(result, a2, 16, 1);
  }
  return result;
}

- (id)timestampAndThread
{
  if (result) {
    return objc_getProperty(result, a2, 24, 1);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampAndThread, 0);
  objc_storeStrong((id *)&self->_individuationIdentifier, 0);

  objc_storeStrong((id *)&self->_signpost, 0);
}

@end