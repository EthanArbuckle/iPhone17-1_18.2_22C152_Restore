@interface _TUIElementImagePlainBuilder
- (NSString)role;
- (TUIImageModel)imageModel;
- (void)setImageModel:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation _TUIElementImagePlainBuilder

- (TUIImageModel)imageModel
{
  return self->_imageModel;
}

- (void)setImageModel:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_imageModel, 0);
}

@end