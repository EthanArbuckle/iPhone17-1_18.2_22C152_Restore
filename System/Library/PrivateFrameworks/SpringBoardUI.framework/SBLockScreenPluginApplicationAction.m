@interface SBLockScreenPluginApplicationAction
+ (id)actionWithBundleID:(id)a3;
+ (id)actionWithURL:(id)a3;
- (BOOL)isApplicationAction;
- (NSString)bundleID;
- (NSURL)url;
- (id)description;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)transitionStyle;
- (void)setBundleID:(id)a3;
- (void)setTransitionStyle:(unint64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation SBLockScreenPluginApplicationAction

+ (id)actionWithURL:(id)a3
{
  id v4 = a3;
  v5 = [a1 action];
  [v5 setURL:v4];

  [v5 setAuthenticationPolicy:0];

  return v5;
}

+ (id)actionWithBundleID:(id)a3
{
  id v4 = a3;
  v5 = [a1 action];
  [v5 setBundleID:v4];

  [v5 setAuthenticationPolicy:0];

  return v5;
}

- (BOOL)isApplicationAction
{
  return 1;
}

- (id)description
{
  return [(SBLockScreenPluginApplicationAction *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenPluginApplicationAction *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(SBLockScreenPluginAction *)self label];
  id v5 = (id)[v3 appendObject:v4 withName:@"label" skipIfNil:1];

  id v6 = (id)[v3 appendObject:self->_bundleID withName:@"bundleID" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_url withName:@"URL" skipIfNil:1];
  id v8 = (id)[v3 appendInteger:self->_transitionStyle withName:@"transitionStyle"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenPluginApplicationAction *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setURL:(id)a3
{
}

- (unint64_t)transitionStyle
{
  return self->_transitionStyle;
}

- (void)setTransitionStyle:(unint64_t)a3
{
  self->_transitionStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end