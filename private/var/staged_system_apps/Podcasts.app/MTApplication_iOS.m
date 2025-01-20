@interface MTApplication_iOS
- (id)delegate;
- (id)nextResponder;
@end

@implementation MTApplication_iOS

- (id)nextResponder
{
  v2 = [(MTApplication_iOS *)self delegate];
  v3 = [v2 internalAppDelegate];

  v4 = [v3 commandController];

  return v4;
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)MTApplication_iOS;
  v2 = [(MTApplication *)&v4 delegate];

  return v2;
}

@end