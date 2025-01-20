@interface _TUIResourceLoaderTask
- (BOOL)isLoaded;
- (_TUIResourceLoaderTask)initWithSessionDataTask:(id)a3;
- (double)priority;
- (void)cancel;
- (void)resume;
- (void)setPriority:(double)a3;
@end

@implementation _TUIResourceLoaderTask

- (_TUIResourceLoaderTask)initWithSessionDataTask:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUIResourceLoaderTask;
  v6 = [(_TUIResourceLoaderTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sessionDataTask, a3);
  }

  return v7;
}

- (double)priority
{
  [(NSURLSessionDataTask *)self->_sessionDataTask priority];
  return v2;
}

- (void)setPriority:(double)a3
{
  *(float *)&a3 = a3;
  [(NSURLSessionDataTask *)self->_sessionDataTask setPriority:a3];
}

- (BOOL)isLoaded
{
  return [(NSURLSessionDataTask *)self->_sessionDataTask state] == (char *)&def_141F14 + 3;
}

- (void)resume
{
}

- (void)cancel
{
}

- (void).cxx_destruct
{
}

@end