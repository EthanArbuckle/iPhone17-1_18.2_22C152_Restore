@interface PKBannerPresentableRequest
+ (id)createWithPresentable:(id)a3 context:(id)a4;
- (PKBannerPresentable)presentable;
- (PKBannerPresentableRequest)init;
- (id)context;
@end

@implementation PKBannerPresentableRequest

+ (id)createWithPresentable:(id)a3 context:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [PKBannerPresentableRequest alloc];
  id v9 = v7;
  id result = v6;
  id v11 = result;
  if (v8)
  {
    if (!v9)
    {
      __break(1u);
      return result;
    }
    v13.receiver = v8;
    v13.super_class = (Class)PKBannerPresentableRequest;
    v12 = objc_msgSendSuper2(&v13, sel_init);
    v8 = (PKBannerPresentableRequest *)v12;
    if (v12)
    {
      objc_storeStrong(v12 + 1, a3);
      objc_storeStrong(&v8->_context, a4);
    }
  }

  return v8;
}

- (PKBannerPresentableRequest)init
{
  return 0;
}

- (PKBannerPresentable)presentable
{
  return self->_presentable;
}

- (id)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);

  objc_storeStrong((id *)&self->_presentable, 0);
}

@end