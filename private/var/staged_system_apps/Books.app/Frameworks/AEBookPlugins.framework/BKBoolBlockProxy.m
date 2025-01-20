@interface BKBoolBlockProxy
- (BKBoolBlockProxy)initWithBlock:(id)a3;
- (id)work;
- (void)executeWithParam:(BOOL)a3;
- (void)setWork:(id)a3;
@end

@implementation BKBoolBlockProxy

- (BKBoolBlockProxy)initWithBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKBoolBlockProxy;
  v5 = [(BKBoolBlockProxy *)&v9 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id work = v5->_work;
    v5->_id work = v6;
  }
  return v5;
}

- (void)executeWithParam:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_retainBlock(self->_work);
  if (v4)
  {
    id v5 = v4;
    (*((void (**)(id, BOOL))v4 + 2))(v4, v3);
    id v4 = v5;
  }
}

- (id)work
{
  return self->_work;
}

- (void)setWork:(id)a3
{
}

- (void).cxx_destruct
{
}

@end