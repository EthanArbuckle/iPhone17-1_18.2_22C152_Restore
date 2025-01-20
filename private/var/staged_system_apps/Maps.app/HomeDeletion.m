@interface HomeDeletion
- (BOOL)completed;
- (BOOL)success;
- (BOOL)tentativelyDeleted;
- (HomeDeletion)initWithObject:(id)a3 indexPath:(id)a4 identifierPath:(id)a5 contextualActionCompletionHandler:(id)a6;
- (IdentifierPath)identifierPath;
- (NSError)error;
- (NSIndexPath)indexPath;
- (id)contextualActionCompletionHandler;
- (id)description;
- (id)object;
- (void)markAsCompletedWithSuccess:(BOOL)a3 error:(id)a4;
- (void)markAsTentativelyDeleted;
@end

@implementation HomeDeletion

- (HomeDeletion)initWithObject:(id)a3 indexPath:(id)a4 identifierPath:(id)a5 contextualActionCompletionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HomeDeletion;
  v15 = [(HomeDeletion *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_object, a3);
    objc_storeStrong((id *)&v16->_indexPath, a4);
    objc_storeStrong((id *)&v16->_identifierPath, a5);
    id v17 = objc_retainBlock(v14);
    id contextualActionCompletionHandler = v16->_contextualActionCompletionHandler;
    v16->_id contextualActionCompletionHandler = v17;
  }
  return v16;
}

- (void)markAsTentativelyDeleted
{
  if (!self->_tentativelyDeleted && !self->_completed) {
    self->_tentativelyDeleted = 1;
  }
}

- (void)markAsCompletedWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7 = a4;
  if (!self->_completed)
  {
    self->_completed = 1;
    self->_success = a3;
    if (!a3)
    {
      id v8 = v7;
      objc_storeStrong((id *)&self->_error, a4);
      id v7 = v8;
    }
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  long long v13 = *(_OWORD *)&self->_object;
  identifierPath = self->_identifierPath;
  id v8 = sub_100097E28(self->_tentativelyDeleted);
  v9 = sub_100097E28(self->_completed);
  v10 = sub_100097E28(self->_success);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; object = <%@: %p>, indexPath = %@, identifierPath = %@, tentativelyDeleted = %@, completed = %@, success = %@, error = %@>",
    v4,
    self,
    v6,
    v13,
    identifierPath,
    v8,
    v9,
    v10,
  id v11 = self->_error);

  return v11;
}

- (id)object
{
  return self->_object;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (IdentifierPath)identifierPath
{
  return self->_identifierPath;
}

- (id)contextualActionCompletionHandler
{
  return self->_contextualActionCompletionHandler;
}

- (BOOL)tentativelyDeleted
{
  return self->_tentativelyDeleted;
}

- (BOOL)completed
{
  return self->_completed;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_contextualActionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_identifierPath, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);

  objc_storeStrong(&self->_object, 0);
}

@end