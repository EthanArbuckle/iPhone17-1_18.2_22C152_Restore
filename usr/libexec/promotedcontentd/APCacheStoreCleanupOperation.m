@interface APCacheStoreCleanupOperation
- (APCacheStoreCleanupOperation)initWithFilesEnumerator:(id)a3 expirationDate:(id)a4;
- (NSDate)now;
- (NSEnumerator)filesEnumerator;
- (double)duration;
- (double)maxObjectLifetime;
- (id)ancientItemBlock;
- (id)removalBlock;
- (void)main;
- (void)setAncientItemBlock:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFilesEnumerator:(id)a3;
- (void)setMaxObjectLifetime:(double)a3;
- (void)setNow:(id)a3;
- (void)setRemovalBlock:(id)a3;
@end

@implementation APCacheStoreCleanupOperation

- (APCacheStoreCleanupOperation)initWithFilesEnumerator:(id)a3 expirationDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = +[NSString stringWithFormat:@"%@ filesEnumerator cannot be nil", objc_opt_class()];
    APSimulateCrash();

    if (v9) {
      goto LABEL_3;
    }
  }
  v17 = +[NSString stringWithFormat:@"%@ expirationDate cannot be nil", objc_opt_class()];
  APSimulateCrash();

LABEL_3:
  v10 = [(APCacheStoreCleanupOperation *)self init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_filesEnumerator, a3);
    [v9 timeIntervalSince1970];
    v11->_expirationDate = v12;
    v11->_maxObjectLifetime = 864000.0;
    uint64_t v13 = +[NSDate now];
    now = v11->_now;
    v11->_now = (NSDate *)v13;
  }
  return v11;
}

- (void)main
{
  v3 = +[NSDate now];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  do
  {
    if ([(APCacheStoreCleanupOperation *)self isCancelled]) {
      break;
    }
    BOOL v8 = sub_100174494((double *)self);
    v9 = +[NSDate now];
    [v9 timeIntervalSince1970];
    double v11 = v10;

    double v6 = v11 - v5;
    if (v11 - v5 > 600.0) {
      break;
    }
  }
  while (v8);
  id v13 = +[NSDate now];
  [v13 timeIntervalSince1970];
  [(APCacheStoreCleanupOperation *)self setDuration:v12 - v5];
}

- (double)maxObjectLifetime
{
  return self->_maxObjectLifetime;
}

- (void)setMaxObjectLifetime:(double)a3
{
  self->_maxObjectLifetime = a3;
}

- (id)removalBlock
{
  return self->_removalBlock;
}

- (void)setRemovalBlock:(id)a3
{
}

- (id)ancientItemBlock
{
  return self->_ancientItemBlock;
}

- (void)setAncientItemBlock:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSEnumerator)filesEnumerator
{
  return self->_filesEnumerator;
}

- (void)setFilesEnumerator:(id)a3
{
}

- (NSDate)now
{
  return self->_now;
}

- (void)setNow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_filesEnumerator, 0);
  objc_storeStrong(&self->_ancientItemBlock, 0);

  objc_storeStrong(&self->_removalBlock, 0);
}

@end