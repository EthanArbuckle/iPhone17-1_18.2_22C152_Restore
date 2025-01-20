@interface RUIImageView
- (void)setImage:(id)a3;
@end

@implementation RUIImageView

- (void)setImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RUIImageView;
  -[RUIImageView setImage:](&v5, sel_setImage_);
  [(RUIImageView *)self setHidden:a3 == 0];
}

@end