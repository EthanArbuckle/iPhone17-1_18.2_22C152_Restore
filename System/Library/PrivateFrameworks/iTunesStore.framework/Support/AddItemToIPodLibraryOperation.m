@interface AddItemToIPodLibraryOperation
- (AddItemToIPodLibraryOperation)initWithIPodLibraryItem:(id)a3;
- (IPodLibraryItem)IPodLibraryItem;
- (NSNumber)insertedItemPersistentIdentifier;
- (id)_libraryItem;
- (void)_setInsertedItemPersistentIdentifier:(int64_t)a3;
- (void)dealloc;
- (void)run;
@end

@implementation AddItemToIPodLibraryOperation

- (AddItemToIPodLibraryOperation)initWithIPodLibraryItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AddItemToIPodLibraryOperation;
  v4 = [(AddItemToIPodLibraryOperation *)&v6 init];
  if (v4) {
    v4->_libraryItem = (IPodLibraryItem *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AddItemToIPodLibraryOperation;
  [(AddItemToIPodLibraryOperation *)&v3 dealloc];
}

- (IPodLibraryItem)IPodLibraryItem
{
  [(AddItemToIPodLibraryOperation *)self lock];
  objc_super v3 = (IPodLibraryItem *)[(IPodLibraryItem *)self->_libraryItem copy];
  [(AddItemToIPodLibraryOperation *)self unlock];
  return v3;
}

- (NSNumber)insertedItemPersistentIdentifier
{
  [(AddItemToIPodLibraryOperation *)self lock];
  objc_super v3 = self->_insertedItemPersistentIdentifier;
  [(AddItemToIPodLibraryOperation *)self unlock];
  return v3;
}

- (void)run
{
  uint64_t v13 = 0;
  id v3 = [(AddItemToIPodLibraryOperation *)self _libraryItem];
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2112;
    id v17 = [v3 itemMediaPath];
    LODWORD(v12) = 22;
    v11 = &v14;
    uint64_t v7 = _os_log_send_and_compose_impl();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v7, 4, &v14, v12);
      free(v8);
      v11 = (int *)v9;
      SSFileLog();
    }
  }
  id v10 = objc_msgSend(+[IPodLibrary deviceIPodLibrary](IPodLibrary, "deviceIPodLibrary", v11), "addLibraryItem:error:", v3, &v13);
  [(AddItemToIPodLibraryOperation *)self _setInsertedItemPersistentIdentifier:v10];
  [(AddItemToIPodLibraryOperation *)self setError:v13];
  [(AddItemToIPodLibraryOperation *)self setSuccess:v10 != 0];
}

- (id)_libraryItem
{
  [(AddItemToIPodLibraryOperation *)self lock];
  id v3 = self->_libraryItem;
  [(AddItemToIPodLibraryOperation *)self unlock];
  return v3;
}

- (void)_setInsertedItemPersistentIdentifier:(int64_t)a3
{
  [(AddItemToIPodLibraryOperation *)self lock];

  self->_insertedItemPersistentIdentifier = (NSNumber *)[objc_alloc((Class)NSNumber) initWithLongLong:a3];

  [(AddItemToIPodLibraryOperation *)self unlock];
}

@end