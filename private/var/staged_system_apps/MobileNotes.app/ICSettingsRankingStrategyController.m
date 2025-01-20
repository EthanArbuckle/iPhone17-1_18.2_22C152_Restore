@interface ICSettingsRankingStrategyController
- (id)specifiers;
- (id)stateSpecifierNamed:(id)a3 state:(unint64_t)a4 group:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation ICSettingsRankingStrategyController

- (id)specifiers
{
  v3 = +[NSMutableArray array];
  v4 = +[PSSpecifier emptyGroupSpecifier];
  [v4 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  [v3 addObject:v4];
  v5 = ICInternalSettingsDomain();
  v6 = +[ICSearchRankingStrategySwitch ICSearchRankingStrategyDisplayNames];
  id v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = PSDefaultsKey;
    do
    {
      v10 = +[ICSearchRankingStrategySwitch ICSearchRankingStrategyDisplayNames];
      v11 = [v10 objectAtIndexedSubscript:v8];
      v12 = [(ICSettingsRankingStrategyController *)self stateSpecifierNamed:v11 state:v8 group:v4];

      [v12 setProperty:v5 forKey:v9];
      [v3 addObject:v12];

      ++v8;
      v13 = +[ICSearchRankingStrategySwitch ICSearchRankingStrategyDisplayNames];
      id v14 = [v13 count];
    }
    while (v8 < (unint64_t)v14);
  }
  v15 = +[PSSpecifier emptyGroupSpecifier];
  [v15 setProperty:@"Bucket Boundaries:\n1\t9.36 minutes\n2\t20.36 minutes\n3\t44.30 minutes\n4\t1.61 hours\n5\t3.50 hours\n6\t7.61 hours\n7\t16.55 hours\n8\t1.50 days\n9\t3.27 days\n10\t1.02 weeks\n11\t2.21 weeks\n12\t1.11 months\n13\t2.41 months\n14\t5.24 months\n15\t0.95 years\n16\t2.07 years\n17\t4.50 years\n18\t9.79 years" forKey:PSFooterTextGroupKey];
  [v3 addObject:v15];
  [(ICSettingsRankingStrategyController *)self setSpecifiers:v3];

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)ICSettingsRankingStrategyController;
  id v7 = a4;
  [(ICSettingsRankingStrategyController *)&v15 tableView:a3 didSelectRowAtIndexPath:v7];
  unint64_t v8 = -[ICSettingsRankingStrategyController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7, v15.receiver, v15.super_class);

  objc_opt_class();
  uint64_t v9 = [v8 userInfo];
  v10 = ICDynamicCast();

  objc_opt_class();
  uint64_t v11 = kICSearchRankingCurrentStrategyKey;
  v12 = [v10 objectForKeyedSubscript:kICSearchRankingCurrentStrategyKey];
  v13 = ICDynamicCast();

  if (v13)
  {
    +[ICSettingsUtilities setObject:v13 forKey:v11];
  }
  else
  {
    id v14 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1004D5190((uint64_t)self, a2, v14);
    }
  }
  [(ICSettingsRankingStrategyController *)self reloadSpecifiers];
}

- (id)stateSpecifierNamed:(id)a3 state:(unint64_t)a4 group:(id)a5
{
  id v8 = a5;
  uint64_t v9 = +[PSSpecifier preferenceSpecifierNamed:a3 target:self set:0 get:0 detail:0 cell:3 edit:0];
  uint64_t v10 = kICSearchRankingCurrentStrategyKey;
  uint64_t v17 = kICSearchRankingCurrentStrategyKey;
  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a4];
  v18 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v9 setUserInfo:v12];

  id v13 = +[ICSearchRankingStrategySwitch defaultStrategy];
  id v14 = +[ICSettingsUtilities objectForKey:v10];
  objc_super v15 = v14;
  if (v14) {
    id v13 = [v14 unsignedIntegerValue];
  }
  if (v13 == (id)a4) {
    [v8 setProperty:v9 forKey:PSRadioGroupCheckedSpecifierKey];
  }

  return v9;
}

@end