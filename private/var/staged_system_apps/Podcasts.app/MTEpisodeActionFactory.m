@interface MTEpisodeActionFactory
+ (id)addToUpNextAction;
+ (id)markPlayedAction;
+ (id)markUnplayedAction;
+ (id)playNextAction;
+ (id)removeFromUpNext;
+ (id)shareAction;
+ (id)viewAction;
@end

@implementation MTEpisodeActionFactory

+ (id)playNextAction
{
  v2 = +[UIImage imageNamed:@"UpNext"];
  v3 = [IMAction alloc];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Play Next" value:&stru_10056A8A0 table:0];
  v6 = [(IMAction *)v3 initWithTitle:v5 icon:v2];

  [(IMAction *)v6 setConditionBlock:&stru_10054F698];
  [(IMAction *)v6 setActionBlock:&stru_10054F6D8];

  return v6;
}

+ (id)addToUpNextAction
{
  v2 = +[UIImage imageNamed:@"UpNext"];
  v3 = [IMAction alloc];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"Play Last" value:&stru_10056A8A0 table:0];
  v6 = [(IMAction *)v3 initWithTitle:v5 icon:v2];

  [(IMAction *)v6 setConditionBlock:&stru_10054F6F8];
  [(IMAction *)v6 setActionBlock:&stru_10054F718];

  return v6;
}

+ (id)removeFromUpNext
{
  v2 = +[UIImage imageNamed:@"UpNext"];
  v3 = [IMAction alloc];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"REMOVE_FROM_QUEUE" value:&stru_10056A8A0 table:0];
  v6 = [(IMAction *)v3 initWithTitle:v5 icon:v2];

  [(IMAction *)v6 setConditionBlock:&stru_10054F738];
  [(IMAction *)v6 setActionBlock:&stru_10054F758];

  return v6;
}

+ (id)markUnplayedAction
{
  v2 = objc_opt_new();
  [v2 setTitleBlock:&stru_10054F798];
  [v2 setConditionBlock:&stru_10054F7B8];
  [v2 setActionBlock:&stru_10054F7D8];

  return v2;
}

+ (id)markPlayedAction
{
  v2 = objc_opt_new();
  [v2 setTitleBlock:&stru_10054F7F8];
  [v2 setConditionBlock:&stru_10054F818];
  [v2 setActionBlock:&stru_10054F838];

  return v2;
}

+ (id)viewAction
{
  v2 = [IMAction alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"VIEW_DOCUMENT" value:&stru_10056A8A0 table:0];
  v5 = [(IMAction *)v2 initWithTitle:v4 icon:0];

  [(IMAction *)v5 setConditionBlock:&stru_10054F858];
  [(IMAction *)v5 setActionBlock:&stru_10054F878];

  return v5;
}

+ (id)shareAction
{
  v2 = [IMPopoverAction alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Share Episode" value:&stru_10056A8A0 table:0];
  v5 = [(IMAction *)v2 initWithTitle:v4 icon:0];

  [(IMAction *)v5 setConditionBlock:&stru_10054F898];
  [(IMAction *)v5 setButtonItemBlock:&stru_10054F8D8];
  objc_initWeak(&location, v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A493C;
  v7[3] = &unk_10054F900;
  objc_copyWeak(&v8, &location);
  [(IMAction *)v5 setActionBlock:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

@end