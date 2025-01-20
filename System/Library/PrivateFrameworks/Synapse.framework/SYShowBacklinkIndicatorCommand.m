@interface SYShowBacklinkIndicatorCommand
- (BOOL)isActive;
- (SYShowBacklinkIndicatorCommand)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4;
- (SYShowBacklinkIndicatorCommandImpl)_impl;
- (void)invalidate;
- (void)runWithCompletion:(id)a3;
- (void)set_impl:(id)a3;
@end

@implementation SYShowBacklinkIndicatorCommand

- (SYShowBacklinkIndicatorCommand)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SYShowBacklinkIndicatorCommand;
  v8 = [(SYShowBacklinkIndicatorCommand *)&v14 init];
  if (v8)
  {
    BOOL v9 = SYIsPhone();
    v10 = off_1E6463498;
    if (!v9) {
      v10 = off_1E64634A0;
    }
    uint64_t v11 = [objc_alloc(*v10) initWithDomainIdentifiers:v6 linkIdentifiers:v7];
    impl = v8->__impl;
    v8->__impl = (SYShowBacklinkIndicatorCommandImpl *)v11;
  }
  return v8;
}

- (BOOL)isActive
{
  v2 = [(SYShowBacklinkIndicatorCommand *)self _impl];
  char v3 = [v2 isActive];

  return v3;
}

- (void)runWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SYShowBacklinkIndicatorCommand *)self _impl];
  [v5 runWithCompletion:v4];
}

- (void)invalidate
{
  id v2 = [(SYShowBacklinkIndicatorCommand *)self _impl];
  [v2 invalidate];
}

- (SYShowBacklinkIndicatorCommandImpl)_impl
{
  return self->__impl;
}

- (void)set_impl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end