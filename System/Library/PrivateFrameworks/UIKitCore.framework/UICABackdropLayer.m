@interface UICABackdropLayer
- (void)setValue:(id)a3 forKeyPath:(id)a4;
@end

@implementation UICABackdropLayer

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(UICABackdropLayer *)self valueForKeyPath:v7];
  if (([v8 isEqual:v6] & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)UICABackdropLayer;
    [(UICABackdropLayer *)&v9 setValue:v6 forKeyPath:v7];
  }
}

@end