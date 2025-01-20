@interface RCDispatchGroup
- (RCDispatchGroup)initWithEnterCount:(int)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)leave;
@end

@implementation RCDispatchGroup

- (RCDispatchGroup)initWithEnterCount:(int)a3 completionQueue:(id)a4 completion:(id)a5
{
  v8 = a4;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RCDispatchGroup;
  id v10 = [(RCDispatchGroup *)&v14 init];
  if (v10)
  {
    dispatch_group_t v11 = dispatch_group_create();
    v12 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;

    if (a3 >= 1)
    {
      do
      {
        dispatch_group_enter(*((dispatch_group_t *)v10 + 1));
        --a3;
      }
      while (a3);
    }
    dispatch_group_notify(*((dispatch_group_t *)v10 + 1), v8, v9);
  }

  return (RCDispatchGroup *)v10;
}

- (void)leave
{
}

- (void).cxx_destruct
{
}

@end