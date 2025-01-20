@interface PREditorBackgroundTask
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (PREditorBackgroundTask)initWithReason:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation PREditorBackgroundTask

- (PREditorBackgroundTask)initWithReason:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREditorBackgroundTask;
  v5 = [(PREditorBackgroundTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    reason = v5->_reason;
    v5->_reason = (NSString *)v6;
  }
  return v5;
}

- (void)dealloc
{
  if (![(PREditorBackgroundTask *)self isInvalidated])
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must end a background task using -[PREditor endBackgroundTask:completionStatus:]" userInfo:0];
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)PREditorBackgroundTask;
  [(PREditorBackgroundTask *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(PREditorBackgroundTask *)self reason];
  id v5 = (id)[v6 appendObject:v4 withName:@"reason"];
}

- (NSString)reason
{
  return self->_reason;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
}

@end