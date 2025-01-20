@interface TrainingTaskProtectedDefaults
- (TrainingTaskProtectedDefaults)init;
@end

@implementation TrainingTaskProtectedDefaults

- (TrainingTaskProtectedDefaults)init
{
  v12.receiver = self;
  v12.super_class = (Class)TrainingTaskProtectedDefaults;
  v2 = [(TrainingTaskProtectedDefaults *)&v12 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("TrainingdTaskProtectedDefaults", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = sub_10000E3D8();
    v7 = +[NSMutableDictionary dictionaryWithContentsOfURL:v6];
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = +[NSMutableDictionary dictionary];
    }
    defaults = v2->_defaults;
    v2->_defaults = v9;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_defaults, 0);
}

@end