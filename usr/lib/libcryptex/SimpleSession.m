@interface SimpleSession
- (OS_session)session;
- (SimpleSession)initWithFlags:(unint64_t)a3;
- (SimpleSession)initWithSessionCore:(id)a3;
- (void)dealloc;
- (void)setSession:(id)a3;
@end

@implementation SimpleSession

- (SimpleSession)initWithFlags:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SimpleSession;
  v3 = [(SimpleSession *)&v7 init];
  uint64_t v4 = session_create();
  session = v3->_session;
  v3->_session = (OS_session *)v4;

  return v3;
}

- (SimpleSession)initWithSessionCore:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SimpleSession;
  id v3 = a3;
  uint64_t v4 = [(SimpleSession *)&v8 init];
  uint64_t v5 = session_create_from_core((uint64_t)v3);

  session = v4->_session;
  v4->_session = (OS_session *)v5;

  return v4;
}

- (void)dealloc
{
  session = self->_session;
  self->_session = 0;

  v4.receiver = self;
  v4.super_class = (Class)SimpleSession;
  [(SimpleSession *)&v4 dealloc];
}

- (OS_session)session
{
  return (OS_session *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end