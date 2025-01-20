@interface GQDBGTheme
- (id)stylesheet;
- (void)dealloc;
@end

@implementation GQDBGTheme

- (void)dealloc
{
  mTemplateSlides = self->mTemplateSlides;
  if (mTemplateSlides) {
    CFRelease(mTemplateSlides);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDBGTheme;
  [(GQDBGTheme *)&v4 dealloc];
}

- (id)stylesheet
{
  return self->mStylesheet;
}

@end