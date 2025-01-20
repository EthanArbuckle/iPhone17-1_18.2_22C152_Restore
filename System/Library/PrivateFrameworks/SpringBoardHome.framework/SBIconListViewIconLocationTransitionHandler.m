@interface SBIconListViewIconLocationTransitionHandler
- (NSString)description;
- (NSString)iconLocation;
- (NSString)reason;
- (SBIconListView)iconListView;
- (SBIconListViewIconLocationTransitionHandler)initWithIconLocation:(id)a3 reason:(id)a4 iconListView:(id)a5;
- (double)progress;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)completeTransition:(BOOL)a3;
- (void)setProgress:(double)a3;
@end

@implementation SBIconListViewIconLocationTransitionHandler

- (SBIconListViewIconLocationTransitionHandler)initWithIconLocation:(id)a3 reason:(id)a4 iconListView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBIconListViewIconLocationTransitionHandler;
  v11 = [(SBIconListViewIconLocationTransitionHandler *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_iconListView, v10);
    uint64_t v13 = [v9 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    uint64_t v15 = [v8 copy];
    iconLocation = v12->_iconLocation;
    v12->_iconLocation = (NSString *)v15;
  }
  return v12;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  id v5 = [(SBIconListViewIconLocationTransitionHandler *)self iconListView];
  [v5 iconLocationTransitionHandler:self setProgress:a3];
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconListViewIconLocationTransitionHandler *)self iconListView];
  [v5 iconLocationTransitionHandler:self completeTransition:v3];
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewIconLocationTransitionHandler *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconListViewIconLocationTransitionHandler *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBIconListViewIconLocationTransitionHandler *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBIconListViewIconLocationTransitionHandler *)self succinctDescriptionBuilder];
  id v5 = [(SBIconListViewIconLocationTransitionHandler *)self iconLocation];
  id v6 = (id)[v4 appendObject:v5 withName:@"iconLocation"];

  v7 = [(SBIconListViewIconLocationTransitionHandler *)self reason];
  id v8 = (id)[v4 appendObject:v7 withName:@"reason"];

  [(SBIconListViewIconLocationTransitionHandler *)self progress];
  id v9 = (id)objc_msgSend(v4, "appendFloat:withName:", @"progress");
  id v10 = [(SBIconListViewIconLocationTransitionHandler *)self iconListView];
  id v11 = (id)[v4 appendPointer:v10 withName:@"iconListView"];

  return v4;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBIconListView)iconListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconListView);
  return (SBIconListView *)WeakRetained;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_iconListView);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
}

@end