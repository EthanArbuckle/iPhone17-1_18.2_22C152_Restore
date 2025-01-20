@interface PathObject
+ (id)pathObjectWithPath:(const char *)a3 component:(const char *)a4;
- (PathObject)initWithPath:(const char *)a3 component:(const char *)a4;
- (char)path;
- (id)description;
- (int)len;
- (void)dealloc;
@end

@implementation PathObject

- (PathObject)initWithPath:(const char *)a3 component:(const char *)a4
{
  v20.receiver = self;
  v20.super_class = (Class)PathObject;
  v6 = [(PathObject *)&v20 init];
  v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  v8 = "/";
  p_path = (uint64_t *)&v6->_path;
  v10 = "";
  if (a4) {
    v10 = a4;
  }
  else {
    v8 = "";
  }
  int v11 = asprintf(&v6->_path, "%s%s%s", a3, v8, v10);
  v7->_len = v11;
  if (v11 == -1 || !*p_path) {
    goto LABEL_9;
  }
  if (v11 < 1024)
  {
LABEL_10:
    v18 = v7;
    goto LABEL_11;
  }
  STLog(2, @"path too long: %s", v12, v13, v14, v15, v16, v17, *p_path);
  free((void *)*p_path);
LABEL_9:
  v18 = 0;
LABEL_11:

  return v18;
}

+ (id)pathObjectWithPath:(const char *)a3 component:(const char *)a4
{
  v4 = [[PathObject alloc] initWithPath:a3 component:a4];

  return v4;
}

- (void)dealloc
{
  path = self->_path;
  if (path) {
    free(path);
  }
  v4.receiver = self;
  v4.super_class = (Class)PathObject;
  [(PathObject *)&v4 dealloc];
}

- (id)description
{
  v2 = NSString;
  v3 = [(PathObject *)self path];

  return (id)[v2 stringWithUTF8String:v3];
}

- (char)path
{
  return self->_path;
}

- (int)len
{
  return self->_len;
}

@end