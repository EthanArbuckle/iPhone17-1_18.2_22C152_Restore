@interface CryptexSessionList
+ (id)createCryptexSessionList;
+ (id)sharedList;
- (NSMutableArray)list;
- (OS_os_log)log_handle;
- (id)findCryptexSession:(char *)a3;
- (void)addCryptexSession:(id)a3;
- (void)removeCryptexSession:(id)a3;
- (void)setList:(id)a3;
- (void)setLog_handle:(id)a3;
@end

@implementation CryptexSessionList

+ (id)createCryptexSessionList
{
  v2 = (char *)objc_alloc_init((Class)a1);
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.libcryptex", "usermanager");
    v4 = (void *)*((void *)v2 + 27);
    *((void *)v2 + 27) = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 26);
    *((void *)v2 + 26) = v5;

    pthread_rwlock_init((pthread_rwlock_t *)(v2 + 8), 0);
  }

  return v2;
}

+ (id)sharedList
{
  if (qword_10005E408 != -1) {
    dispatch_once(&qword_10005E408, &stru_1000595C0);
  }
  v2 = (void *)qword_10005E410;

  return v2;
}

- (void)addCryptexSession:(id)a3
{
  p_rw_lock = &self->rw_lock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rw_lock);
  v6 = [(CryptexSessionList *)self list];
  [v6 addObject:v5];

  pthread_rwlock_unlock(p_rw_lock);
}

- (void)removeCryptexSession:(id)a3
{
  p_rw_lock = &self->rw_lock;
  id v5 = a3;
  pthread_rwlock_wrlock(p_rw_lock);
  v6 = [(CryptexSessionList *)self list];
  [v6 removeObject:v5];

  pthread_rwlock_unlock(p_rw_lock);
}

- (id)findCryptexSession:(char *)a3
{
  p_rw_lock = &self->rw_lock;
  pthread_rwlock_rdlock(&self->rw_lock);
  v6 = [(CryptexSessionList *)self list];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000F004;
  v12[3] = &unk_1000595E0;
  v12[4] = a3;
  id v7 = [v6 indexOfObjectPassingTest:v12];

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: couldn't find session for cryptex that exited.", v11, 2u);
    }
    v8 = 0;
  }
  else
  {
    v9 = [(CryptexSessionList *)self list];
    v8 = [v9 objectAtIndexedSubscript:v7];
  }
  pthread_rwlock_unlock(p_rw_lock);

  return v8;
}

- (NSMutableArray)list
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setList:(id)a3
{
}

- (OS_os_log)log_handle
{
  return self->_log_handle;
}

- (void)setLog_handle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_handle, 0);

  objc_storeStrong((id *)&self->_list, 0);
}

@end