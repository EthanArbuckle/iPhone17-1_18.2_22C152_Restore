@interface VUIActionSearchRAC
- (NSDictionary)additionalSubmissionParameters;
- (VUIActionSearchRAC)initWithContextData:(id)a3;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
@end

@implementation VUIActionSearchRAC

- (VUIActionSearchRAC)initWithContextData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIActionSearchRAC;
  v5 = [(VUIActionSearchRAC *)&v9 init];
  if (v5)
  {
    if (v4) {
      v6 = (NSDictionary *)v4;
    }
    else {
      v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    }
    additionalSubmissionParameters = v5->_additionalSubmissionParameters;
    v5->_additionalSubmissionParameters = v6;
  }
  return v5;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (+[VUIJSDevice isSearchEnabled]) {
    +[SearchRACViewPresenter launchRACSheetWithAdditionalParameters:self->_additionalSubmissionParameters];
  }
  else {
    NSLog(&cfstr_IgnoringSearch.isa);
  }
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    v5 = v6;
  }
}

- (NSDictionary)additionalSubmissionParameters
{
  return self->_additionalSubmissionParameters;
}

- (void).cxx_destruct
{
}

@end