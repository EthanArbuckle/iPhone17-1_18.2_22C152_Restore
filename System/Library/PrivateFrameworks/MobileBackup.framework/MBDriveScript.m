@interface MBDriveScript
- (MBDriveScript)initWithProgress:(id)a3;
- (id)operationAtIndex:(unint64_t)a3;
- (unint64_t)index;
- (unint64_t)operationCount;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3;
- (void)beginPerforming;
- (void)dealloc;
- (void)finishedPerforming;
- (void)insertOperation:(id)a3 atIndex:(unint64_t)a4;
- (void)performingOperation:(id)a3;
@end

@implementation MBDriveScript

- (MBDriveScript)initWithProgress:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBDriveScript;
  v4 = [(MBDriveScript *)&v6 init];
  if (v4)
  {
    v4->_operations = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:0];
    v4->_progress = (MBProgress *)a3;
    v4->_state = 0;
    v4->_index = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBDriveScript;
  [(MBDriveScript *)&v3 dealloc];
}

- (unint64_t)operationCount
{
  return (unint64_t)[(NSMutableArray *)self->_operations count];
}

- (id)operationAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_operations objectAtIndexedSubscript:a3];
}

- (void)addOperation:(id)a3
{
  if (self->_state) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveScript.m" lineNumber:44 description:@"Invalid state"];
  }
  [(NSMutableArray *)self->_operations addObject:a3];
  progress = self->_progress;
  [a3 duration];
  -[MBProgress addDuration:](progress, "addDuration:");
}

- (void)addOperations:(id)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(a3);
        }
        [(MBDriveScript *)self addOperation:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [a3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)insertOperation:(id)a3 atIndex:(unint64_t)a4
{
  [(NSMutableArray *)self->_operations insertObject:a3 atIndex:a4];
  progress = self->_progress;
  [a3 duration];
  -[MBProgress addDuration:](progress, "addDuration:");
}

- (void)beginPerforming
{
  if (self->_state || self->_index) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveScript.m" lineNumber:62 description:@"Invalid state"];
  }
  self->_state = 1;
}

- (void)performingOperation:(id)a3
{
  int state = self->_state;
  if (state)
  {
    if (state != 1) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveScript.m" lineNumber:71 description:@"Invalid state"];
    }
    id v7 = [(NSMutableArray *)self->_operations objectAtIndexedSubscript:self->_index];
    unsigned int v8 = [a3 type];
    if (v8 != [v7 type]) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBDriveScript.m", 74, @"Deviating from script (expecting %@, got %@)", +[MBDriveOperation stringForType:](MBDriveOperation, "stringForType:", [v7 type]), +[MBDriveOperation stringForType:](MBDriveOperation, "stringForType:", objc_msgSend(a3, "type")));
    }
    progress = self->_progress;
    [v7 duration];
    -[MBProgress updateWithDuration:size:](progress, "updateWithDuration:size:", [v7 size], v10);
    ++self->_index;
  }
}

- (void)finishedPerforming
{
  id index = self->_index;
  if (index != [(NSMutableArray *)self->_operations count])
  {
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [(NSMutableArray *)self->_operations count];
      unint64_t v7 = self->_index;
      id v8 = [(NSMutableArray *)self->_operations debugDescription];
      *(_DWORD *)buf = 134218498;
      id v15 = v6;
      __int16 v16 = 2048;
      unint64_t v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "MBDriveScript had (%ld) operations, and performed (%ld):\n%@", buf, 0x20u);
      id v9 = [(NSMutableArray *)self->_operations count];
      unint64_t v12 = self->_index;
      id v13 = [(NSMutableArray *)self->_operations debugDescription];
      id v11 = v9;
      _MBLog();
    }
  }
  if (self->_state != 1) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveScript.m" lineNumber:87 description:@"Invalid state"];
  }
  id v10 = self->_index;
  if (v10 != [(NSMutableArray *)self->_operations count]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBDriveScript.m", 88, @"Script not finished (performed: %ld != contained: %ld)", self->_index, [(NSMutableArray *)self->_operations count] object file lineNumber description];
  }
  if (![(MBProgress *)self->_progress isFinished]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBDriveScript.m" lineNumber:89 description:@"Progress not finished"];
  }
  self->_int state = 2;
}

- (unint64_t)index
{
  return self->_index;
}

@end