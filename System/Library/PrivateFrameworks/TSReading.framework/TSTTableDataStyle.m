@interface TSTTableDataStyle
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithStyle:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataStyle

- (id)initObjectWithStyle:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataStyle;
  v4 = [(TSTTableDataStyle *)&v6 init];
  if (v4)
  {
    v4->mStyle = (TSSStyle *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return [(TSSStyle *)self->mStyle hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || !-[TSSStylesheet isEqual:](-[TSSStyle stylesheet](self->mStyle, "stylesheet"), "isEqual:", [*((id *)a3 + 2) stylesheet]))
  {
    return 0;
  }
  mStyle = self->mStyle;
  uint64_t v6 = *((void *)a3 + 2);

  return [(TSSStyle *)mStyle isEqual:v6];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   mStyle: %@", self->super.mRefCount, self->mStyle];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataStyle;
  [(TSTTableDataStyle *)&v3 dealloc];
}

@end