@interface MRDRoutedRemoteControlCommand
- (MRDRoutedRemoteControlCommand)initWithCommand:(id)a3 routedApp:(id)a4;
- (NSString)routedAppDisplayID;
- (id)description;
@end

@implementation MRDRoutedRemoteControlCommand

- (MRDRoutedRemoteControlCommand)initWithCommand:(id)a3 routedApp:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 _copyWithZone:0 usingConcreteClass:objc_opt_class()];

  v9 = (MRDRoutedRemoteControlCommand *)v8;
  if (v9)
  {
    v10 = (NSString *)[v6 copy];
    routedAppDisplayID = v9->_routedAppDisplayID;
    v9->_routedAppDisplayID = v10;

    id completionHandler = v9->super._completionHandler;
    v9->super._id completionHandler = 0;
  }
  return v9;
}

- (id)description
{
  v3 = (void *)MRMediaRemoteCopyCommandDescription();
  v4 = +[NSString stringWithFormat:@"<%@ %p, command = %@, routedToApp = %@>", objc_opt_class(), self, v3, self->_routedAppDisplayID];

  return v4;
}

- (NSString)routedAppDisplayID
{
  return self->_routedAppDisplayID;
}

- (void).cxx_destruct
{
}

@end