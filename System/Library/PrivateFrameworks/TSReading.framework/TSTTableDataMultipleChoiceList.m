@interface TSTTableDataMultipleChoiceList
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithPopUpMenuModel:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataMultipleChoiceList

- (id)initObjectWithPopUpMenuModel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataMultipleChoiceList;
  v4 = [(TSTTableDataMultipleChoiceList *)&v6 init];
  if (v4)
  {
    v4->mPopUpMenuModel = (TSTPopUpMenuModel *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  return [(TSTPopUpMenuModel *)self->mPopUpMenuModel hash];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mPopUpMenuModel = self->mPopUpMenuModel;
  uint64_t v6 = *((void *)a3 + 2);

  return [(TSTPopUpMenuModel *)mPopUpMenuModel isEqual:v6];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   mPopUpMenuModel: %@", self->super.mRefCount, self->mPopUpMenuModel];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataMultipleChoiceList;
  [(TSTTableDataMultipleChoiceList *)&v3 dealloc];
}

@end