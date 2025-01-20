@interface ML3MusicLibrary_SortMapEntry
- (ML3MusicLibrary_SortMapEntry)initWithName:(id)a3 nameSection:(int)a4 sortKey:(id)a5;
- (ML3MusicLibrary_SortMapEntry)initWithName:(id)a3 nameSection:(int)a4 sortKey:(id)a5 nameOrder:(int64_t)a6 dirtyFlag:(BOOL)a7;
- (id)description;
@end

@implementation ML3MusicLibrary_SortMapEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortKey, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"(.nameSection=%d, .nameOrder = %15lld, .name = %@)", self->_nameSection, self->_nameOrder, self->_name];
}

- (ML3MusicLibrary_SortMapEntry)initWithName:(id)a3 nameSection:(int)a4 sortKey:(id)a5
{
  return [(ML3MusicLibrary_SortMapEntry *)self initWithName:a3 nameSection:*(void *)&a4 sortKey:a5 nameOrder:-1 dirtyFlag:0];
}

- (ML3MusicLibrary_SortMapEntry)initWithName:(id)a3 nameSection:(int)a4 sortKey:(id)a5 nameOrder:(int64_t)a6 dirtyFlag:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ML3MusicLibrary_SortMapEntry;
  v15 = [(ML3MusicLibrary_SortMapEntry *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->_nameSection = a4;
    objc_storeStrong((id *)&v15->_name, a3);
    objc_storeStrong((id *)&v16->_sortKey, a5);
    v16->_nameOrder = a6;
    v16->_dirty = a7;
  }

  return v16;
}

@end