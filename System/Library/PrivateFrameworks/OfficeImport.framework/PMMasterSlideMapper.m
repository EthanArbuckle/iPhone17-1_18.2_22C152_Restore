@interface PMMasterSlideMapper
- (PMMasterSlideMapper)initWithPDSlide:(id)a3 parent:(id)a4;
- (void)mapMasterGraphicsAt:(id)a3 withState:(id)a4;
@end

@implementation PMMasterSlideMapper

- (PMMasterSlideMapper)initWithPDSlide:(id)a3 parent:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PMMasterSlideMapper;
  v8 = [(CMMapper *)&v11 initWithParent:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_slide, a3);
  }

  return v9;
}

- (void)mapMasterGraphicsAt:(id)a3 withState:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(PDSlideBase *)self->_slide drawables];
  v8 = [v7 objectEnumerator];
  while (1)
  {
    v9 = [v8 nextObject];
    v10 = v9;
    if (!v9) {
      break;
    }
    if (([v9 hidden] & 1) == 0)
    {
      objc_super v11 = [v10 clientData];
      v12 = v11;
      if (!v11 || ([v11 hasPlaceholder] & 1) == 0)
      {
        v13 = [(CMDrawableMapper *)[PMDrawableMapper alloc] initWithOadDrawable:v10 parent:self];
        [(PMDrawableMapper *)v13 mapAt:v14 withState:v6];
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end