@interface APDataAdaptorRepository
+ (BOOL)supportsSecureCoding;
+ (id)sharedRepository;
- (APDataAdaptorRepository)init;
- (APDataAdaptorRepository)initWithCoder:(id)a3;
- (APUnfairLock)lock;
- (NSMutableDictionary)adaptors;
- (NSMutableDictionary)registeredAdaptors;
- (id)adaptorWithIdentifier:(id)a3;
- (id)registerAdaptorClass:(Class)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAdaptors:(id)a3;
- (void)setLock:(id)a3;
- (void)setRegisteredAdaptors:(id)a3;
- (void)unregisterAdaptorClass:(Class)a3;
@end

@implementation APDataAdaptorRepository

+ (id)sharedRepository
{
  if (qword_1002888F8 != -1) {
    dispatch_once(&qword_1002888F8, &stru_100233F38);
  }
  v2 = (void *)qword_1002888F0;

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APDataAdaptorRepository)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APDataAdaptorRepository;
  v5 = [(APDataAdaptorRepository *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registeredAdaptors"];
    registeredAdaptors = v5->_registeredAdaptors;
    v5->_registeredAdaptors = (NSMutableDictionary *)v6;

    uint64_t v8 = +[NSMutableDictionary dictionary];
    adaptors = v5->_adaptors;
    v5->_adaptors = (NSMutableDictionary *)v8;

    v10 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    lock = v5->_lock;
    v5->_lock = v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(APDataAdaptorRepository *)self registeredAdaptors];
  [v4 encodeObject:v5 forKey:@"registeredAdaptors"];
}

- (APDataAdaptorRepository)init
{
  v11.receiver = self;
  v11.super_class = (Class)APDataAdaptorRepository;
  v2 = [(APDataAdaptorRepository *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    registeredAdaptors = v2->_registeredAdaptors;
    v2->_registeredAdaptors = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSMutableDictionary dictionary];
    adaptors = v2->_adaptors;
    v2->_adaptors = (NSMutableDictionary *)v5;

    v7 = (APUnfairLock *)[objc_alloc((Class)APUnfairLock) initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = v7;

    v9 = v2;
  }

  return v2;
}

- (id)adaptorWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(APDataAdaptorRepository *)self lock];
  [v5 lock];

  id v6 = [(NSMutableDictionary *)self->_adaptors valueForKey:v4];
  if (!v6)
  {
    v7 = (objc_class *)[(NSMutableDictionary *)self->_registeredAdaptors valueForKey:v4];
    if (v7 && (uint64_t v8 = v7, [(objc_class *)v7 isSubclassOfClass:objc_opt_class()]))
    {
      id v6 = objc_alloc_init(v8);
      if (v6) {
        [(NSMutableDictionary *)self->_adaptors setValue:v6 forKey:v4];
      }
    }
    else
    {
      v9 = APLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Adaptor %{public}@ is not a subclass of APDataAdaptor.", (uint8_t *)&v12, 0xCu);
      }

      id v6 = 0;
    }
  }
  v10 = [(APDataAdaptorRepository *)self lock];
  [v10 unlock];

  return v6;
}

- (id)registerAdaptorClass:(Class)a3
{
  if (!a3 || ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v16 = NSStringFromClass(a3);
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Adaptor is of type '%@'; must be of type 'APDataAdaptor'",
    id v6 = v16);

    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    v22 = v6;
    v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v15 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5203 userInfo:v17];
    goto LABEL_10;
  }
  uint64_t v5 = [(APDataAdaptorRepository *)self lock];
  [v5 lock];

  id v6 = [(objc_class *)a3 identifier];
  v7 = (objc_class *)[(NSMutableDictionary *)self->_registeredAdaptors objectForKeyedSubscript:v6];
  if (!v7)
  {
    [(NSMutableDictionary *)self->_registeredAdaptors setObject:a3 forKey:v6];
    goto LABEL_8;
  }
  uint64_t v8 = v7;
  v9 = NSStringFromClass(v7);
  v10 = NSStringFromClass(a3);
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if (v11)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  int v12 = NSStringFromClass(v8);
  id v13 = +[NSString stringWithFormat:@"Data adaptor '%@' is already registered for class %@", v6, v12];

  NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
  v20 = v13;
  objc_super v14 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v15 = +[NSError errorWithDomain:@"com.apple.ap.dataadaptors" code:5204 userInfo:v14];

LABEL_9:
  v17 = [(APDataAdaptorRepository *)self lock];
  [v17 unlock];
LABEL_10:

  return v15;
}

- (void)unregisterAdaptorClass:(Class)a3
{
  uint64_t v5 = [(APDataAdaptorRepository *)self lock];
  [v5 lock];

  registeredAdaptors = self->_registeredAdaptors;
  v7 = [(objc_class *)a3 identifier];
  [(NSMutableDictionary *)registeredAdaptors removeObjectForKey:v7];

  adaptors = self->_adaptors;
  v9 = [(objc_class *)a3 identifier];
  [(NSMutableDictionary *)adaptors removeObjectForKey:v9];

  id v10 = [(APDataAdaptorRepository *)self lock];
  [v10 unlock];
}

- (NSMutableDictionary)registeredAdaptors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegisteredAdaptors:(id)a3
{
}

- (NSMutableDictionary)adaptors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAdaptors:(id)a3
{
}

- (APUnfairLock)lock
{
  return (APUnfairLock *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_adaptors, 0);

  objc_storeStrong((id *)&self->_registeredAdaptors, 0);
}

@end