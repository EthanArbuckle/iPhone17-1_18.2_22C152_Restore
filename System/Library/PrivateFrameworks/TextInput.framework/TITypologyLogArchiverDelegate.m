@interface TITypologyLogArchiverDelegate
- (NSMutableSet)objects;
- (TITypologyLogArchiverDelegate)init;
- (id)archiver:(id)a3 willEncodeObject:(id)a4;
@end

@implementation TITypologyLogArchiverDelegate

- (void).cxx_destruct
{
}

- (NSMutableSet)objects
{
  return self->_objects;
}

- (id)archiver:(id)a3 willEncodeObject:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = [(TITypologyLogArchiverDelegate *)self objects];
        uint64_t v7 = [v6 count];

        v8 = [(TITypologyLogArchiverDelegate *)self objects];
        [v8 addObject:v5];

        v9 = [(TITypologyLogArchiverDelegate *)self objects];
        uint64_t v10 = [v9 count];

        if (v10 == v7)
        {
          v11 = [(TITypologyLogArchiverDelegate *)self objects];
          uint64_t v12 = [v11 member:v5];

          id v5 = (id)v12;
        }
      }
    }
  }
  id v13 = v5;

  return v13;
}

- (TITypologyLogArchiverDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)TITypologyLogArchiverDelegate;
  v2 = [(TITypologyLogArchiverDelegate *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    objects = v2->_objects;
    v2->_objects = v3;
  }
  return v2;
}

@end