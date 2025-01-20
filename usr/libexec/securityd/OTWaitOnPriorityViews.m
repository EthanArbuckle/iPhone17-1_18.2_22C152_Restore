@interface OTWaitOnPriorityViews
- (OTOperationDependencies)operationDependencies;
- (OTWaitOnPriorityViews)initWithDependencies:(id)a3;
- (void)groupStart;
- (void)setOperationDependencies:(id)a3;
@end

@implementation OTWaitOnPriorityViews

- (void).cxx_destruct
{
}

- (void)setOperationDependencies:(id)a3
{
}

- (OTOperationDependencies)operationDependencies
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  v6 = sub_1001CC1E8;
  v7 = &unk_1003077A0;
  objc_copyWeak(&v8, &location);
  v3 = +[CKKSResultOperation named:@"proceed-after-fetch" withBlock:&v4];
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (OTWaitOnPriorityViews)initWithDependencies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OTWaitOnPriorityViews;
  v6 = [(CKKSGroupOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_operationDependencies, a3);
  }

  return v7;
}

@end