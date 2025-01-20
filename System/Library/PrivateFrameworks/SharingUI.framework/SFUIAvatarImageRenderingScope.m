@interface SFUIAvatarImageRenderingScope
+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 backgroundStyle:(unint64_t)a7;
- (CNAvatarImageRenderingScope)scope;
- (void)setScope:(id)a3;
@end

@implementation SFUIAvatarImageRenderingScope

+ (id)scopeWithPointSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5 style:(unint64_t)a6 backgroundStyle:(unint64_t)a7
{
  BOOL v9 = a5;
  double height = a3.height;
  double width = a3.width;
  v13 = objc_alloc_init(SFUIAvatarImageRenderingScope);
  if (a7 - 2 >= 3) {
    unint64_t v14 = 0;
  }
  else {
    unint64_t v14 = a7 - 1;
  }
  v15 = objc_msgSend(getCNAvatarImageRenderingScopeClass(), "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", v9, a6 == 2, v14, width, height, a4);
  [(SFUIAvatarImageRenderingScope *)v13 setScope:v15];

  return v13;
}

- (CNAvatarImageRenderingScope)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
}

- (void).cxx_destruct
{
}

@end