@interface GQDTPopupCell
- (id)resultCell;
- (void)dealloc;
@end

@implementation GQDTPopupCell

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTPopupCell;
  [(GQDTCell *)&v3 dealloc];
}

- (id)resultCell
{
  return self->mResultCell;
}

@end