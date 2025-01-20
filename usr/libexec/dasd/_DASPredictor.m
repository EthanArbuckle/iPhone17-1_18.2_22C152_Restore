@interface _DASPredictor
+ (id)predictorWithKnowledgeStore:(id)a3 withQueue:(id)a4;
- (OS_dispatch_queue)queue;
- (void)deviceActivityLikelihood:(id)a3;
- (void)launchLikelihoodPredictionForApp:(id)a3 withHandler:(id)a4;
- (void)pluginLikelihoodWithHandler:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation _DASPredictor

+ (id)predictorWithKnowledgeStore:(id)a3 withQueue:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() predictorWithKnowledgeStore:v6];

  v8 = v5;
  dispatch_queue_t v9 = v8;
  if (!v8)
  {
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.daspredictor", v10);
  }
  [v7 setQueue:v9];

  return v7;
}

- (void)launchLikelihoodPredictionForApp:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FDC0;
  block[3] = &unk_100175A90;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

- (void)pluginLikelihoodWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FEC4;
  v7[3] = &unk_100175AB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)deviceActivityLikelihood:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002FFC0;
  v7[3] = &unk_100175AB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end