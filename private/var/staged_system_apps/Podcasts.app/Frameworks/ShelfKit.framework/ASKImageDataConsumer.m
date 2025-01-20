@interface ASKImageDataConsumer
- (ASKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4;
- (BOOL)retainAspectRatio;
- (CGSize)size;
- (double)scale;
- (id)objectForData:(id)a3 error:(id *)a4;
- (void)setRetainAspectRatio:(BOOL)a3;
@end

@implementation ASKImageDataConsumer

- (ASKImageDataConsumer)initWithSize:(CGSize)a3 scale:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)ASKImageDataConsumer;
  result = [(ASKImageDataConsumer *)&v8 init];
  if (result)
  {
    result->_size.CGFloat width = width;
    result->_size.CGFloat height = height;
    result->_scale = a4;
    result->_retainAspectRatio = 0;
  }
  return result;
}

- (id)objectForData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (ASKImageDataConsumer *)[objc_alloc((Class)UIImage) initWithData:v6];

  if (a4 && !v7)
  {
    NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
    CFStringRef v27 = @"Could not decode image";
    objc_super v8 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a4 = +[NSError errorWithDomain:@"ASKImageDataConsumerErrorDomain" code:-99 userInfo:v8];
  }
  [(ASKImageDataConsumer *)self size];
  BOOL v11 = v10 == CGSizeZero.width && v9 == CGSizeZero.height;
  v12 = v7;
  if (!v11)
  {
    if ([(ASKImageDataConsumer *)self retainAspectRatio]) {
      v12 = v7;
    }
    else {
      v12 = self;
    }
  }
  [(ASKImageDataConsumer *)v12 size];
  double v14 = v13;
  double v16 = v15;
  id v17 = objc_alloc_init((Class)UIGraphicsImageRendererFormat);
  [(ASKImageDataConsumer *)self scale];
  [v17 setScale:];
  id v18 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v17 format:v14];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = __44__ASKImageDataConsumer_objectForData_error___block_invoke;
  v22[3] = &unk_471158;
  v23 = v7;
  double v24 = v14;
  double v25 = v16;
  v19 = v7;
  v20 = [v18 imageWithActions:v22];

  return v20;
}

id __44__ASKImageDataConsumer_objectForData_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) drawInRect:0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48)];
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (BOOL)retainAspectRatio
{
  return self->_retainAspectRatio;
}

- (void)setRetainAspectRatio:(BOOL)a3
{
  self->_retainAspectRatio = a3;
}

@end