@interface INRenewingRequest
- (ACAccount)account;
- (void)performRequestWithSession:(id)a3 withHandler:(id)a4;
- (void)setAccount:(id)a3;
@end

@implementation INRenewingRequest

- (void)performRequestWithSession:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(INRenewingRequest *)self urlString];

  if (v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)INRenewingRequest;
    [(INRenewingRequest *)&v10 performRequestWithSession:v6 withHandler:v7];
  }
  else
  {
    v9 = [(INRenewingRequest *)self account];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000E7BC;
    v11[3] = &unk_100041110;
    v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    +[INBagRenewal attemptRenewCredentialsWithAccount:v9 completion:v11];
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end