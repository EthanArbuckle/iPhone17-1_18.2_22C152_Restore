@interface TPSViewSourceProxy
+ (id)proxyWithViewMethod:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)viewMethod;
- (void)setViewMethod:(id)a3;
@end

@implementation TPSViewSourceProxy

+ (id)proxyWithViewMethod:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(TPSViewSourceProxy);
  [(TPSViewSourceProxy *)v4 setViewMethod:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)viewMethod
{
  return self->_viewMethod;
}

- (void)setViewMethod:(id)a3
{
}

- (void).cxx_destruct
{
}

@end