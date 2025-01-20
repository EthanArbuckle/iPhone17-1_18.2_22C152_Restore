@interface COSSoftwareUpdateAutomaticUpdateContoller
- (PSSpecifier)automaticUpdateGroup;
- (PSSpecifier)automaticUpdateSwitchSpecifier;
- (id)automaticUpdateStatus;
- (id)specifiers;
- (void)armedAutoUpdateForAutomaticUpdatesToggled:(id)a3 forSpecifier:(id)a4;
- (void)setAutomaticUpdateGroup:(id)a3;
- (void)setAutomaticUpdateSwitchSpecifier:(id)a3;
@end

@implementation COSSoftwareUpdateAutomaticUpdateContoller

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  v3 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = +[PSSpecifier groupSpecifierWithID:@"AUTOMATIC_UPDATES_DETAIL_GROUP"];
    [(COSSoftwareUpdateAutomaticUpdateContoller *)self setAutomaticUpdateGroup:v6];

    id v7 = objc_alloc((Class)NSMutableArray);
    v8 = [(COSSoftwareUpdateAutomaticUpdateContoller *)self automaticUpdateGroup];
    id v9 = [v7 initWithObjects:v8, 0];

    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"AUTOMATIC_UPDATES" value:&stru_100249230 table:@"Software Update"];
    v12 = +[PSSpecifier preferenceSpecifierNamed:v11 target:self set:"armedAutoUpdateForAutomaticUpdatesToggled:forSpecifier:" get:"automaticUpdateStatus" detail:0 cell:6 edit:0];
    [(COSSoftwareUpdateAutomaticUpdateContoller *)self setAutomaticUpdateSwitchSpecifier:v12];

    v13 = +[NSBundle mainBundle];
    v14 = SFLocalizableWAPIStringKeyForKey();
    v15 = [v13 localizedStringForKey:v14 value:&stru_100249230 table:@"Software Update"];

    v16 = [(COSSoftwareUpdateAutomaticUpdateContoller *)self automaticUpdateGroup];
    [v16 setProperty:v15 forKey:PSFooterTextGroupKey];

    v17 = [(COSSoftwareUpdateAutomaticUpdateContoller *)self automaticUpdateSwitchSpecifier];
    [v9 addObject:v17];

    v18 = *(void **)&self->BPSListController_opaque[v2];
    *(void *)&self->BPSListController_opaque[v2] = v9;
    id v19 = v9;

    id v4 = *(id *)&self->BPSListController_opaque[v2];
  }

  return v4;
}

- (void)armedAutoUpdateForAutomaticUpdatesToggled:(id)a3 forSpecifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  sub_100033160((uint64_t)v4);
}

- (id)automaticUpdateStatus
{
  id v2 = sub_100033280();

  return +[NSNumber numberWithBool:v2];
}

- (PSSpecifier)automaticUpdateGroup
{
  return self->_automaticUpdateGroup;
}

- (void)setAutomaticUpdateGroup:(id)a3
{
}

- (PSSpecifier)automaticUpdateSwitchSpecifier
{
  return self->_automaticUpdateSwitchSpecifier;
}

- (void)setAutomaticUpdateSwitchSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automaticUpdateSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_automaticUpdateGroup, 0);
}

@end