@interface TSTArchivedLayoutHint
- (TSTArchivedLayoutHint)initWithContext:(id)a3 hint:(id)a4;
- (TSTLayoutHint)hint;
- (void)dealloc;
- (void)setHint:(id)a3;
@end

@implementation TSTArchivedLayoutHint

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTArchivedLayoutHint;
  [(TSTArchivedLayoutHint *)&v3 dealloc];
}

- (void)setHint:(id)a3
{
  if (self->mHint != a3)
  {
    [(TSPObject *)self willModify];

    self->mHint = (TSTLayoutHint *)a3;
  }
}

- (TSTArchivedLayoutHint)initWithContext:(id)a3 hint:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSTArchivedLayoutHint;
  v5 = [(TSPObject *)&v7 initWithContext:a3];
  if (v5) {
    v5->mHint = (TSTLayoutHint *)a4;
  }
  return v5;
}

- (TSTLayoutHint)hint
{
  return self->mHint;
}

@end