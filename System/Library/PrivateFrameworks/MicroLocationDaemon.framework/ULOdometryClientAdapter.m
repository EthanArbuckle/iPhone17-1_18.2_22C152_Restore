@interface ULOdometryClientAdapter
- (id)didReceiveOdometryErrorBlock;
- (id)didReceiveOdometryUpdateBlock;
- (void)didReceiveOdometryError:(id)a3 withDate:(id)a4;
- (void)didReceiveOdometryUpdate:(id)a3 uuid:(id)a4;
- (void)setDidReceiveOdometryErrorBlock:(id)a3;
- (void)setDidReceiveOdometryUpdateBlock:(id)a3;
@end

@implementation ULOdometryClientAdapter

- (void)didReceiveOdometryError:(id)a3 withDate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(ULOdometryClientAdapter *)self didReceiveOdometryErrorBlock];
  ((void (**)(void, id, id))v7)[2](v7, v8, v6);
}

- (void)didReceiveOdometryUpdate:(id)a3 uuid:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(ULOdometryClientAdapter *)self didReceiveOdometryUpdateBlock];
  ((void (**)(void, id, id))v7)[2](v7, v8, v6);
}

- (id)didReceiveOdometryErrorBlock
{
  return self->_didReceiveOdometryErrorBlock;
}

- (void)setDidReceiveOdometryErrorBlock:(id)a3
{
}

- (id)didReceiveOdometryUpdateBlock
{
  return self->_didReceiveOdometryUpdateBlock;
}

- (void)setDidReceiveOdometryUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didReceiveOdometryUpdateBlock, 0);
  objc_storeStrong(&self->_didReceiveOdometryErrorBlock, 0);
}

@end