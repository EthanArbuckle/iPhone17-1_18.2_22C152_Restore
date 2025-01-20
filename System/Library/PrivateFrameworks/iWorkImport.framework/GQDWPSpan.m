@interface GQDWPSpan
- (id)characterStyle;
- (void)dealloc;
@end

@implementation GQDWPSpan

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDWPSpan;
  [(GQDWPTextList *)&v3 dealloc];
}

- (id)characterStyle
{
  return self->mCharStyle;
}

@end