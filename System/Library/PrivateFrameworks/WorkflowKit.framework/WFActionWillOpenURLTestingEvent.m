@interface WFActionWillOpenURLTestingEvent
- (NSString)bundleIdentifier;
- (NSURL)URL;
- (WFActionWillOpenURLTestingEvent)initWithAction:(id)a3 URL:(id)a4 bundleIdentifier:(id)a5;
@end

@implementation WFActionWillOpenURLTestingEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (WFActionWillOpenURLTestingEvent)initWithAction:(id)a3 URL:(id)a4 bundleIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFActionWillOpenURLTestingEvent.m", 16, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)WFActionWillOpenURLTestingEvent;
  v12 = [(WFActionTestingEvent *)&v17 initWithAction:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a4);
    objc_storeStrong((id *)&v13->_bundleIdentifier, a5);
    v14 = v13;
  }

  return v13;
}

@end