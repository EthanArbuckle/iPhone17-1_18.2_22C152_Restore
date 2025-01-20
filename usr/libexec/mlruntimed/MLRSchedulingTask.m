@interface MLRSchedulingTask
- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4;
- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4 maxTimeLimit:(double)a5;
- (NSString)bundleIdentifier;
- (double)maxTimeLimit;
- (id)description;
- (int64_t)source;
@end

@implementation MLRSchedulingTask

- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4 maxTimeLimit:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MLRSchedulingTask;
  v10 = [(MLRSchedulingTask *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    v11->_source = a4;
    v11->_maxTimeLimit = a5;
  }

  return v11;
}

- (MLRSchedulingTask)initWithBundleIdentifier:(id)a3 taskSource:(int64_t)a4
{
  return [(MLRSchedulingTask *)self initWithBundleIdentifier:a3 taskSource:a4 maxTimeLimit:0.0];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(MLRSchedulingTask *)self bundleIdentifier];
  int64_t v6 = [(MLRSchedulingTask *)self source];
  [(MLRSchedulingTask *)self maxTimeLimit];
  v8 = +[NSString stringWithFormat:@"%@(%@, %ld, %f)", v4, v5, v6, v7];

  return v8;
}

- (int64_t)source
{
  return self->_source;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)maxTimeLimit
{
  return self->_maxTimeLimit;
}

- (void).cxx_destruct
{
}

@end