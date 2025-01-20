@interface GQDGraphic
- (id)graphicStyle;
- (void)dealloc;
@end

@implementation GQDGraphic

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDGraphic;
  [(GQDDrawable *)&v3 dealloc];
}

- (id)graphicStyle
{
  return self->mGraphicStyle;
}

@end