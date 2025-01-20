@interface CheckForDemotedApplicationsOperation
- (BOOL)hasDemotedApplications;
- (CheckForDemotedApplicationsOperation)init;
- (void)run;
@end

@implementation CheckForDemotedApplicationsOperation

- (CheckForDemotedApplicationsOperation)init
{
  v4.receiver = self;
  v4.super_class = (Class)CheckForDemotedApplicationsOperation;
  v2 = [(CheckForDemotedApplicationsOperation *)&v4 init];
  if (v2) {
    NSLog(@"here in init");
  }
  return v2;
}

- (void)run
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v3 = +[LSApplicationWorkspace defaultWorkspace];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10018EAA0;
  v4[3] = &unk_1003A4B88;
  v4[4] = &v5;
  [v3 enumerateBundlesOfType:0 block:v4];

  self->_hasDemotedApplications = *((unsigned char *)v6 + 24);
  [(CheckForDemotedApplicationsOperation *)self setError:0];
  [(CheckForDemotedApplicationsOperation *)self setSuccess:1];
  _Block_object_dispose(&v5, 8);
}

- (BOOL)hasDemotedApplications
{
  return self->_hasDemotedApplications;
}

@end