@interface ICIntentsExtension
- (ICIntentsExtension)init;
- (id)handlerForIntent:(id)a3;
- (void)dealloc;
- (void)noteContextDidUnlockObjectCreation:(id)a3;
- (void)noteContextWillLockObjectCreation:(id)a3;
- (void)persistentContainerDidUnlockDatabase:(id)a3;
- (void)persistentContainerWillLockDatabase:(id)a3;
@end

@implementation ICIntentsExtension

- (ICIntentsExtension)init
{
  v7.receiver = self;
  v7.super_class = (Class)ICIntentsExtension;
  v2 = [(ICIntentsExtension *)&v7 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"persistentContainerWillLockDatabase:" name:ICPersistentContainerWillLockDatabaseNotification object:0];
    [v3 addObserver:v2 selector:"persistentContainerDidUnlockDatabase:" name:ICPersistentContainerDidUnlockDatabaseNotification object:0];
    databaseLockingBackgroundTask = v2->_databaseLockingBackgroundTask;
    v2->_databaseLockingBackgroundTask = 0;

    [v3 addObserver:v2 selector:"noteContextWillLockObjectCreation:" name:NoteContextWillLockObjectCreationNotification object:0];
    [v3 addObserver:v2 selector:"noteContextDidUnlockObjectCreation:" name:NoteContextDidUnlockObjectCreationNotification object:0];
    objectCreationLockingBackgroundTask = v2->_objectCreationLockingBackgroundTask;
    v2->_objectCreationLockingBackgroundTask = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if (self->_databaseLockingBackgroundTask)
  {
    v4 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100013CF0();
    }

    [(RBSAssertion *)self->_databaseLockingBackgroundTask invalidate];
    databaseLockingBackgroundTask = self->_databaseLockingBackgroundTask;
    self->_databaseLockingBackgroundTask = 0;
  }
  if (self->_objectCreationLockingBackgroundTask)
  {
    v6 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100013CBC();
    }

    [(RBSAssertion *)self->_objectCreationLockingBackgroundTask invalidate];
    objectCreationLockingBackgroundTask = self->_objectCreationLockingBackgroundTask;
    self->_objectCreationLockingBackgroundTask = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ICIntentsExtension;
  [(ICIntentsExtension *)&v8 dealloc];
}

- (void)persistentContainerWillLockDatabase:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ICIntentsExtension persistentContainerWillLockDatabase:]";
    __int16 v18 = 1024;
    int v19 = 65;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = +[RBSTarget currentProcess];
  objc_super v7 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
  id v8 = objc_alloc((Class)RBSAssertion);
  v15 = v7;
  v9 = +[NSArray arrayWithObjects:&v15 count:1];
  v10 = (RBSAssertion *)[v8 initWithExplanation:@"Finish Database-locking operation" target:v6 attributes:v9];
  databaseLockingBackgroundTask = self->_databaseLockingBackgroundTask;
  self->_databaseLockingBackgroundTask = v10;

  objc_initWeak((id *)buf, self);
  v12 = self->_databaseLockingBackgroundTask;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000035F4;
  v13[3] = &unk_100020738;
  objc_copyWeak(&v14, (id *)buf);
  [(RBSAssertion *)v12 acquireWithInvalidationHandler:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)persistentContainerDidUnlockDatabase:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[ICIntentsExtension persistentContainerDidUnlockDatabase:]";
    __int16 v9 = 1024;
    int v10 = 82;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v7, 0x12u);
  }

  if (self->_databaseLockingBackgroundTask)
  {
    v5 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100013D24();
    }

    [(RBSAssertion *)self->_databaseLockingBackgroundTask invalidate];
    databaseLockingBackgroundTask = self->_databaseLockingBackgroundTask;
    self->_databaseLockingBackgroundTask = 0;
  }
}

- (void)noteContextWillLockObjectCreation:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[ICIntentsExtension noteContextWillLockObjectCreation:]";
    __int16 v18 = 1024;
    int v19 = 93;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s:%d", buf, 0x12u);
  }

  v6 = +[RBSTarget currentProcess];
  int v7 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
  id v8 = objc_alloc((Class)RBSAssertion);
  v15 = v7;
  __int16 v9 = +[NSArray arrayWithObjects:&v15 count:1];
  int v10 = (RBSAssertion *)[v8 initWithExplanation:@"Finish object creation-locking operation" target:v6 attributes:v9];
  objectCreationLockingBackgroundTask = self->_objectCreationLockingBackgroundTask;
  self->_objectCreationLockingBackgroundTask = v10;

  objc_initWeak((id *)buf, self);
  v12 = self->_objectCreationLockingBackgroundTask;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003A34;
  v13[3] = &unk_100020738;
  objc_copyWeak(&v14, (id *)buf);
  [(RBSAssertion *)v12 acquireWithInvalidationHandler:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)noteContextDidUnlockObjectCreation:(id)a3
{
  id v4 = os_log_create("com.apple.notes", "Intents");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[ICIntentsExtension noteContextDidUnlockObjectCreation:]";
    __int16 v9 = 1024;
    int v10 = 110;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v7, 0x12u);
  }

  if (self->_objectCreationLockingBackgroundTask)
  {
    v5 = os_log_create("com.apple.notes", "Intents");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100013D58();
    }

    [(RBSAssertion *)self->_objectCreationLockingBackgroundTask invalidate];
    objectCreationLockingBackgroundTask = self->_objectCreationLockingBackgroundTask;
    self->_objectCreationLockingBackgroundTask = 0;
  }
}

- (id)handlerForIntent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = &off_100020448;
LABEL_11:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = &off_100020438;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = &off_1000203F8;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = &off_1000203D0;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = &off_100020468;
    goto LABEL_11;
  }
  id v5 = 0;
LABEL_12:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectCreationLockingBackgroundTask, 0);

  objc_storeStrong((id *)&self->_databaseLockingBackgroundTask, 0);
}

@end