@interface MBSFileChangeEnumerator
+ (id)enumeratorWithCache:(id)a3;
- (MBSFileChangeEnumerator)initWithCache:(id)a3;
- (id)_fileChangeFromStmt:(id)a3;
- (id)nextObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)_fetch;
- (void)dealloc;
@end

@implementation MBSFileChangeEnumerator

+ (id)enumeratorWithCache:(id)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCache:a3];
  return v3;
}

- (MBSFileChangeEnumerator)initWithCache:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBSFileChangeEnumerator;
  v4 = [(MBSFileChangeEnumerator *)&v6 init];
  if (v4) {
    v4->_stmt = (MBSCacheStmt *)[a3 _prepare:@"select *,rowid from FileChanges where rowid > ? order by rowid"];
  }
  return v4;
}

- (void)dealloc
{
  if (self->_count >= 1)
  {
    uint64_t v3 = 0;
    do

    while (v3 < self->_count);
  }

  v4.receiver = self;
  v4.super_class = (Class)MBSFileChangeEnumerator;
  [(MBSFileChangeEnumerator *)&v4 dealloc];
}

- (id)nextObject
{
  int count = self->_count;
  if (self->_next >= count)
  {
    [(MBSFileChangeEnumerator *)self _fetch];
    int count = self->_count;
  }
  if (!count) {
    return 0;
  }
  uint64_t next = self->_next;
  self->_uint64_t next = next + 1;
  return self->_objects[next];
}

- (id)_fileChangeFromStmt:(id)a3
{
  objc_super v6 = +[MBFileID fileIDWithString:](MBFileID, "fileIDWithString:", [a3 textColumn:0]);
  if (!v6) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBSFileChangeEnumerator.m" lineNumber:68 description:@"Failed to convert file change ID"];
  }
  id v7 = [a3 blobColumn:4];
  id v8 = [a3 intColumn:5];
  if (v7)
  {
    id v9 = v8;
    v10 = objc_alloc_init(MBSFileReference);
    [(MBSFileReference *)v10 setFileID:v7];
    [(MBSFileReference *)v10 setSnapshotID:v9];
  }
  else
  {
    v10 = 0;
  }
  id v11 = +[MBServiceFileChange fileChange];
  [v11 setFileID:v6];
  objc_msgSend(v11, "setType:", objc_msgSend(a3, "intColumn:", 1));
  objc_msgSend(v11, "setDomainName:", objc_msgSend(a3, "textColumn:", 2));
  objc_msgSend(v11, "setRelativePath:", objc_msgSend(a3, "textColumn:", 3));
  [v11 setDuplicateFileReference:v10];
  objc_msgSend(v11, "setSize:", objc_msgSend(a3, "int64Column:", 6));
  objc_msgSend(v11, "setResult:", objc_msgSend(a3, "intColumn:", 7));
  return v11;
}

- (void)_fetch
{
  if (self->_count >= 1)
  {
    uint64_t v3 = 0;
    do

    while (v3 < self->_count);
  }
  self->_uint64_t next = 0;
  self->_int count = 0;
  if (!self->_done)
  {
    [(MBSCacheStmt *)self->_stmt bindInt64:self->_lastRowID atIndex:1];
    int count = self->_count;
    if (count <= 63)
    {
      while ([(MBSCacheStmt *)self->_stmt step])
      {
        id v5 = [(MBSFileChangeEnumerator *)self _fileChangeFromStmt:self->_stmt];
        uint64_t v6 = self->_count;
        self->_int count = v6 + 1;
        self->_objects[v6] = v5;
        self->_lastRowID = [(MBSCacheStmt *)self->_stmt int64Column:8];
        int count = self->_count;
        if (count >= 64) {
          goto LABEL_10;
        }
      }
      int count = self->_count;
    }
LABEL_10:
    self->_done = count < 64;
    stmt = self->_stmt;
    [(MBSCacheStmt *)stmt reset];
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  int next = self->_next;
  int count = self->_count;
  if (next >= count)
  {
    [(MBSFileChangeEnumerator *)self _fetch];
    int next = self->_next;
    int count = self->_count;
  }
  stmt = (unint64_t *)self->_stmt;
  a3->var1 = &self->_objects[next];
  a3->var2 = stmt;
  self->_int next = count;
  return count - next;
}

@end