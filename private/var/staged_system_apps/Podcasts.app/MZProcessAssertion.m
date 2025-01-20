@interface MZProcessAssertion
- (MZProcessAssertion)initWithExpirationBlock:(id)a3 debugDescription:(id)a4;
- (NSString)description;
- (NSString)explanation;
- (RBSAssertion)systemAssertion;
- (id)expirationBlock;
- (unint64_t)identifier;
- (void)_withLockSetAssertion:(id)a3;
- (void)assertionWillInvalidate:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setExpirationBlock:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setSystemAssertion:(id)a3;
@end

@implementation MZProcessAssertion

- (MZProcessAssertion)initWithExpirationBlock:(id)a3 debugDescription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MZProcessAssertion;
  v8 = [(MZProcessAssertion *)&v21 init];
  if (v8)
  {
    if (qword_10060A7A0 != -1) {
      dispatch_once(&qword_10060A7A0, &stru_100550860);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&dword_10060A798);
    uint64_t v9 = ++qword_1005F4BD8;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_10060A798);
    v8->_identifier = v9;
    id v10 = [v6 copy];
    id expirationBlock = v8->_expirationBlock;
    v8->_id expirationBlock = v10;

    if ([v7 length])
    {
      v12 = +[NSString stringWithFormat:@"-%@", v7];
    }
    else
    {
      v12 = &stru_10056A8A0;
    }
    v13 = +[NSString stringWithFormat:@"com.apple.podcasts.storebookkeeper-%@", v12];
    v14 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"FinishTaskInterruptable"];
    id v15 = objc_alloc((Class)RBSAssertion);
    v16 = +[RBSTarget currentProcess];
    v22 = v14;
    v17 = +[NSArray arrayWithObjects:&v22 count:1];
    v18 = (RBSAssertion *)[v15 initWithExplanation:v13 target:v16 attributes:v17];
    systemAssertion = v8->_systemAssertion;
    v8->_systemAssertion = v18;

    [(RBSAssertion *)v8->_systemAssertion addObserver:v8];
    [(RBSAssertion *)v8->_systemAssertion acquireWithInvalidationHandler:&stru_100550840];
    v8->_lock._os_unfair_lock_opaque = 0;
  }
  return v8;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)MZProcessAssertion;
  v3 = [(MZProcessAssertion *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@, assertionID = %lu", v3, self->_identifier];

  return (NSString *)v4;
}

- (void)dealloc
{
  [(MZProcessAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MZProcessAssertion;
  [(MZProcessAssertion *)&v3 dealloc];
}

- (void)_withLockSetAssertion:(id)a3
{
  id v5 = a3;
  p_systemAssertion = &self->_systemAssertion;
  if (([(RBSAssertion *)self->_systemAssertion isEqual:v5] & 1) == 0)
  {
    id v7 = *p_systemAssertion;
    objc_storeStrong((id *)&self->_systemAssertion, a3);
    if (*p_systemAssertion) {
      [(RBSAssertion *)*p_systemAssertion addObserver:self];
    }
    [(RBSAssertion *)v7 removeObserver:self];
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000CF1CC;
    block[3] = &unk_10054D570;
    v11 = v7;
    uint64_t v9 = v7;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setSystemAssertion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(MZProcessAssertion *)self _withLockSetAssertion:v5];

  os_unfair_lock_unlock(p_lock);
}

- (RBSAssertion)systemAssertion
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_systemAssertion;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)assertionWillInvalidate:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_systemAssertion
    && ([(MZProcessAssertion *)self expirationBlock],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    objc_super v6 = [(MZProcessAssertion *)self expirationBlock];
    id v7 = (void (**)(void))[v6 copy];

    [(MZProcessAssertion *)self setExpirationBlock:0];
    os_unfair_lock_unlock(p_lock);
    if (v7)
    {
      v7[2](v7);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_systemAssertion) {
    [(MZProcessAssertion *)self _withLockSetAssertion:0];
  }

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (id)expirationBlock
{
  return self->_expirationBlock;
}

- (void)setExpirationBlock:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong(&self->_expirationBlock, 0);

  objc_storeStrong((id *)&self->_systemAssertion, 0);
}

@end