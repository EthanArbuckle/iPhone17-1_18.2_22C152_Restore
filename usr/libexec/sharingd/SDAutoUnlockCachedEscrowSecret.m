@interface SDAutoUnlockCachedEscrowSecret
- (BOOL)isValid;
- (NSData)escrowSecret;
- (NSDate)expireDate;
- (SDAutoUnlockCachedEscrowSecret)initWithEscrowSecret:(id)a3;
- (id)getEscrowSecretCopyIfValid;
- (void)setEscrowSecret:(id)a3;
- (void)setExpireDate:(id)a3;
@end

@implementation SDAutoUnlockCachedEscrowSecret

- (SDAutoUnlockCachedEscrowSecret)initWithEscrowSecret:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SDAutoUnlockCachedEscrowSecret;
  v5 = [(SDAutoUnlockCachedEscrowSecret *)&v13 init];
  v6 = v5;
  if (v5)
  {
    [(SDAutoUnlockCachedEscrowSecret *)v5 setEscrowSecret:v4];
    v7 = +[NSDate now];
    v8 = [v7 dateByAddingTimeInterval:3600.0];
    [(SDAutoUnlockCachedEscrowSecret *)v6 setExpireDate:v8];

    dispatch_time_t v9 = dispatch_time(0, 3600000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100113440;
    block[3] = &unk_1008CA4B8;
    v12 = v6;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v6;
}

- (BOOL)isValid
{
  v3 = [(SDAutoUnlockCachedEscrowSecret *)self escrowSecret];
  if (v3)
  {
    id v4 = [(SDAutoUnlockCachedEscrowSecret *)self expireDate];
    v5 = +[NSDate date];
    v6 = [v4 laterDate:v5];
    v7 = [(SDAutoUnlockCachedEscrowSecret *)self expireDate];
    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)getEscrowSecretCopyIfValid
{
  v3 = [(SDAutoUnlockCachedEscrowSecret *)self escrowSecret];
  id v4 = [v3 copy];

  unsigned int v5 = [(SDAutoUnlockCachedEscrowSecret *)self isValid];
  id v6 = 0;
  if (v5 && v4) {
    id v6 = v4;
  }

  return v6;
}

- (NSData)escrowSecret
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEscrowSecret:(id)a3
{
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireDate, 0);

  objc_storeStrong((id *)&self->_escrowSecret, 0);
}

@end