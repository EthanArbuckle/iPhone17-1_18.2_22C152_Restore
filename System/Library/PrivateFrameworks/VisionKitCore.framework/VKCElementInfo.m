@interface VKCElementInfo
+ (id)infoWithText:(id)a3 parent:(id)a4;
- (NSString)text;
- (id)children;
- (void)setText:(id)a3;
@end

@implementation VKCElementInfo

+ (id)infoWithText:(id)a3 parent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(VKCElementInfo);
  [(VKCElementInfo *)v7 setText:v6];

  [(VKCBaseElement *)v7 setParent:v5];
  return v7;
}

- (id)children
{
  return 0;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end