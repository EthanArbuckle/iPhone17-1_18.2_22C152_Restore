@interface TCTableStrokeFlattener
- (TCTableStrokeFlattener)initWithTableInfo:(id)a3;
- (id)horizontalStrokeStartingAtColumn:(unsigned __int16)a3 row:(unsigned __int16)a4;
- (id)verticalStrokeStartingAtColumn:(unsigned __int16)a3 row:(unsigned __int16)a4;
- (void)dealloc;
@end

@implementation TCTableStrokeFlattener

- (TCTableStrokeFlattener)initWithTableInfo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TCTableStrokeFlattener;
  if ([(TCTableStrokeFlattener *)&v5 init])
  {
    [a3 tableModel];
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mHorizontalStrokes = (void **)self->mHorizontalStrokes;
  if (mHorizontalStrokes)
  {
    v3 = *mHorizontalStrokes;
    if (*mHorizontalStrokes)
    {
      mHorizontalStrokes[1] = v3;
      operator delete(v3);
    }
    operator delete();
  }
  self->mHorizontalStrokes = 0;
  mVerticalStrokes = (void **)self->mVerticalStrokes;
  if (mVerticalStrokes)
  {
    objc_super v5 = *mVerticalStrokes;
    if (*mVerticalStrokes)
    {
      mVerticalStrokes[1] = v5;
      operator delete(v5);
    }
    operator delete();
  }
  self->mVerticalStrokes = 0;
  v6.receiver = self;
  v6.super_class = (Class)TCTableStrokeFlattener;
  [(TCTableStrokeFlattener *)&v6 dealloc];
}

- (id)verticalStrokeStartingAtColumn:(unsigned __int16)a3 row:(unsigned __int16)a4
{
  return *(id *)sub_21650C((uint64_t)self->mVerticalStrokes, a4 & 0xFF00FFFF | (a3 << 16));
}

- (id)horizontalStrokeStartingAtColumn:(unsigned __int16)a3 row:(unsigned __int16)a4
{
  return *(id *)sub_21650C((uint64_t)self->mHorizontalStrokes, a4 & 0xFF00FFFF | (a3 << 16));
}

@end