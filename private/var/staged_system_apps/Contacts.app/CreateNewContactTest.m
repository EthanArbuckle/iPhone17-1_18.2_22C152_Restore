@interface CreateNewContactTest
- (BOOL)prepareForTestWithOptions:(id)a3;
- (int64_t)iterations;
- (int64_t)totalIterations;
- (void)performTest;
- (void)setIterations:(int64_t)a3;
- (void)setTotalIterations:(int64_t)a3;
@end

@implementation CreateNewContactTest

- (BOOL)prepareForTestWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CreateNewContactTest;
  BOOL v5 = [(ContactsTest *)&v10 prepareForTestWithOptions:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"iterations"];
    -[CreateNewContactTest setTotalIterations:](self, "setTotalIterations:", (int)[v6 intValue]);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100006324;
    v9[3] = &unk_10001C488;
    v9[4] = self;
    v7 = objc_retainBlock(v9);
    [(ContactsTest *)self showContactListWithCompletionBlock:v7];
  }
  return v5;
}

- (void)performTest
{
  uint64_t v3 = [(CreateNewContactTest *)self iterations];
  if (v3 >= [(CreateNewContactTest *)self totalIterations])
  {
    v9 = (void *)UIApp;
    id v11 = [(ContactsTest *)self testOptions];
    objc_super v10 = [v11 objectForKeyedSubscript:@"testName"];
    [v9 finishedTest:v10];
  }
  else
  {
    [(CreateNewContactTest *)self setIterations:(char *)[(CreateNewContactTest *)self iterations] + 1];
    id v4 = (void *)UIApp;
    BOOL v5 = [(ContactsTest *)self testOptions];
    v6 = [v5 objectForKeyedSubscript:@"testName"];
    v7 = +[NSArray arrayWithObject:@"time"];
    [v4 startedSubTest:@"Create New Contact" forTest:v6 withMetrics:v7];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006514;
    v12[3] = &unk_10001C488;
    v12[4] = self;
    [UIApp installCACommitCompletionBlock:v12];
    v8 = [(ContactsTest *)self contactNavigationController];
    [v8 addContact:0 animated:0];
  }
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (int64_t)totalIterations
{
  return self->_totalIterations;
}

- (void)setTotalIterations:(int64_t)a3
{
  self->_totalIterations = a3;
}

@end