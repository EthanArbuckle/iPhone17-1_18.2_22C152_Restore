@interface GQDBGSlide
- (GQDBGSlide)init;
- (id)noteFrame;
- (id)templateSlide;
- (void)dealloc;
@end

@implementation GQDBGSlide

- (GQDBGSlide)init
{
  v3.receiver = self;
  v3.super_class = (Class)GQDBGSlide;
  result = [(GQDBGSlide *)&v3 init];
  if (result) {
    result->super.mCallGenerator = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDBGSlide;
  [(GQDBGAbstractSlide *)&v3 dealloc];
}

- (id)templateSlide
{
  return self->mTemplate;
}

- (id)noteFrame
{
  return self->mNoteFrame;
}

@end