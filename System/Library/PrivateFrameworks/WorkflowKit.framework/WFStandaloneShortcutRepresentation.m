@interface WFStandaloneShortcutRepresentation
- (NSString)activityBundleIdentifier;
- (NSString)associatedAppBundleIdentifier;
- (NSString)launchIdForCurrentPlatform;
- (NSString)title;
- (WFStandaloneShortcutRepresentation)initWithBundleIdentifier:(id)a3;
- (WFStandaloneShortcutRepresentation)initWithINShortcut:(id)a3;
- (WFStandaloneShortcutRepresentation)initWithINShortcut:(id)a3 title:(id)a4;
- (WFStandaloneShortcutRepresentation)initWithTitle:(id)a3 associatedAppBundleIdentifier:(id)a4 launchIdForCurrentPlatform:(id)a5 activityBundleIdentifier:(id)a6;
@end

@implementation WFStandaloneShortcutRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_launchIdForCurrentPlatform, 0);
  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)activityBundleIdentifier
{
  return self->_activityBundleIdentifier;
}

- (NSString)launchIdForCurrentPlatform
{
  return self->_launchIdForCurrentPlatform;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (WFStandaloneShortcutRepresentation)initWithTitle:(id)a3 associatedAppBundleIdentifier:(id)a4 launchIdForCurrentPlatform:(id)a5 activityBundleIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFStandaloneShortcutRepresentation;
  v15 = [(WFStandaloneShortcutRepresentation *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    objc_storeStrong((id *)&v16->_associatedAppBundleIdentifier, a4);
    objc_storeStrong((id *)&v16->_launchIdForCurrentPlatform, a5);
    objc_storeStrong((id *)&v16->_activityBundleIdentifier, a6);
    v17 = v16;
  }

  return v16;
}

- (WFStandaloneShortcutRepresentation)initWithINShortcut:(id)a3 title:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 _associatedAppBundleIdentifier];
  v9 = [v7 intent];
  v10 = objc_msgSend(v9, "_intents_launchIdForCurrentPlatform");
  id v11 = [v7 activityBundleIdentifier];

  id v12 = [(WFStandaloneShortcutRepresentation *)self initWithTitle:v6 associatedAppBundleIdentifier:v8 launchIdForCurrentPlatform:v10 activityBundleIdentifier:v11];
  return v12;
}

- (WFStandaloneShortcutRepresentation)initWithINShortcut:(id)a3
{
  id v4 = a3;
  v5 = [v4 _title];
  id v6 = [(WFStandaloneShortcutRepresentation *)self initWithINShortcut:v4 title:v5];

  return v6;
}

- (WFStandaloneShortcutRepresentation)initWithBundleIdentifier:(id)a3
{
  return [(WFStandaloneShortcutRepresentation *)self initWithTitle:0 associatedAppBundleIdentifier:a3 launchIdForCurrentPlatform:a3 activityBundleIdentifier:a3];
}

@end