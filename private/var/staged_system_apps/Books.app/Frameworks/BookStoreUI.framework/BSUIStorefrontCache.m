@interface BSUIStorefrontCache
+ (BSUIStorefrontCache)sharedInstance;
- (BSUIStorefrontCache)initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4;
- (NSURLSession)session;
- (id)_resolveURLString:(id)a3 size:(CGSize)a4 fileType:(id)a5;
- (void)imageWithURLString:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)imageWithURLString:(id)a3 size:(CGSize)a4 fileType:(id)a5 completion:(id)a6;
- (void)setSession:(id)a3;
@end

@implementation BSUIStorefrontCache

+ (BSUIStorefrontCache)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_86CC;
  block[3] = &unk_38E198;
  block[4] = a1;
  if (qword_3D4058 != -1) {
    dispatch_once(&qword_3D4058, block);
  }
  v2 = (void *)qword_3D4060;

  return (BSUIStorefrontCache *)v2;
}

- (BSUIStorefrontCache)initWithMemoryCapacity:(unint64_t)a3 diskCapacity:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)BSUIStorefrontCache;
  v6 = [(BSUIStorefrontCache *)&v15 init];
  if (v6)
  {
    v7 = +[NSURLSessionConfiguration defaultSessionConfiguration];
    id v8 = objc_alloc((Class)NSURLCache);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    id v11 = [v8 initWithMemoryCapacity:a3 diskCapacity:a4 diskPath:v10];
    [v7 setURLCache:v11];

    uint64_t v12 = +[NSURLSession sessionWithConfiguration:v7];
    session = v6->_session;
    v6->_session = (NSURLSession *)v12;
  }
  return v6;
}

- (void)imageWithURLString:(id)a3 size:(CGSize)a4 completion:(id)a5
{
}

- (void)imageWithURLString:(id)a3 size:(CGSize)a4 fileType:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  uint64_t v12 = -[BSUIStorefrontCache _resolveURLString:size:fileType:](self, "_resolveURLString:size:fileType:", a3, a5, width, height);
  session = self->_session;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_8908;
  v16[3] = &unk_38E1C0;
  id v17 = v11;
  id v14 = v11;
  objc_super v15 = [(NSURLSession *)session dataTaskWithURL:v12 completionHandler:v16];
  [v15 resume];
}

- (id)_resolveURLString:(id)a3 size:(CGSize)a4 fileType:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a5;
  id v9 = [a3 mutableCopy];
  v10 = (__CFString *)v8;
  uint64_t v12 = v10;
  if (([(__CFString *)v10 isEqualToString:@"jpeg"] & 1) == 0)
  {
    uint64_t v12 = v10;
    if (([(__CFString *)v10 isEqualToString:@"png"] & 1) == 0)
    {

      uint64_t v12 = @"jpeg";
    }
  }
  BOOL v13 = width <= 0.0;
  if (height <= 0.0) {
    BOOL v13 = 1;
  }
  float v14 = width;
  if (v13) {
    float v14 = 100.0;
  }
  unint64_t v20 = llroundf(v14);
  if (v13) {
    float v15 = 100.0;
  }
  else {
    float v15 = height;
  }
  *(float *)&double v11 = height;
  v16 = +[NSString stringWithFormat:@"%d", v11, v20];
  [v9 replaceOccurrencesOfString:@"{w}" withString:v16 options:2 range:[v9 length]];

  id v17 = +[NSString stringWithFormat:@"%d", llroundf(v15)];
  [v9 replaceOccurrencesOfString:@"{h}" withString:v17 options:2 range:[v9 length]];

  [v9 replaceOccurrencesOfString:@"{f}" withString:v12 options:2 range:[v9 length]];
  v18 = +[NSURL URLWithString:v9];

  return v18;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end