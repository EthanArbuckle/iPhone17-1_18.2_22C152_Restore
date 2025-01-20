@interface PLSortedAlbumListChangeNotification
+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5;
- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4;
- (BOOL)countDidChange;
- (BOOL)shouldReload;
- (PLSortedAlbumListChangeNotification)init;
- (PLSortedAlbumListChangeNotification)initWithSortedAlbumList:(id)a3 albumListChangeNotification:(id)a4;
- (id)_changedObjects;
- (id)albumList;
- (id)description;
- (id)object;
@end

@implementation PLSortedAlbumListChangeNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingNotification, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
}

- (id)_changedObjects
{
  return [(PLContainerChangeNotification *)self->_backingNotification _changedObjects];
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  return 0;
}

- (id)description
{
  v3 = (void *)MEMORY[0x19F38D3B0](self, a2);
  v4 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v5 = objc_opt_class();
  v6 = [(PLSortedAlbumListChangeNotification *)self object];
  v7 = [v4 stringWithFormat:@"<%@: %p> sorted album list: %p backing note: <%@: %p>", v5, self, v6, objc_opt_class(), self->_backingNotification];

  return v7;
}

- (BOOL)countDidChange
{
  return [(PLContainerChangeNotification *)self->_backingNotification countDidChange];
}

- (BOOL)shouldReload
{
  return 1;
}

- (id)albumList
{
  return self->_albumList;
}

- (id)object
{
  return self->_albumList;
}

- (PLSortedAlbumListChangeNotification)initWithSortedAlbumList:(id)a3 albumListChangeNotification:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLSortedAlbumListChangeNotification;
  v9 = [(PLContainerChangeNotification *)&v12 _init];
  v10 = (PLSortedAlbumListChangeNotification *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 12, a3);
    objc_storeStrong((id *)&v10->_backingNotification, a4);
  }

  return v10;
}

- (PLSortedAlbumListChangeNotification)init
{
  return 0;
}

+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    id v11 = v8;
    id v12 = v10;
    if (v11)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    objc_opt_class();
    objc_opt_isKindOfClass();
    v13 = (void *)[objc_alloc((Class)a1) initWithSortedAlbumList:v11 albumListChangeNotification:v12];
  }
  return v13;
}

@end