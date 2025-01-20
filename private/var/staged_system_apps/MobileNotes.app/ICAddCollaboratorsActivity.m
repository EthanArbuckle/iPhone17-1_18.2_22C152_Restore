@interface ICAddCollaboratorsActivity
+ (NSString)defaultActivityTitle;
+ (NSString)defaultSystemImageName;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICAddCollaboratorsActivity)initWithDelegate:(id)a3;
- (ICAddCollaboratorsActivityDelegate)delegate;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)activityCategory;
- (void)performActivity;
- (void)setDelegate:(id)a3;
@end

@implementation ICAddCollaboratorsActivity

- (ICAddCollaboratorsActivity)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICAddCollaboratorsActivity;
  v5 = [(ICAddCollaboratorsActivity *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = v6;
  }

  return v6;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.addCollaborators";
}

- (id)activityTitle
{
  v3 = [(ICAddCollaboratorsActivity *)self delegate];

  if (!v3
    || ([(ICAddCollaboratorsActivity *)self delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 titleForAddCollaboratorsActivity:self],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v5 = [(id)objc_opt_class() defaultActivityTitle];
  }

  return v5;
}

+ (NSString)defaultActivityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Add People" value:&stru_10063F3D8 table:0];

  return (NSString *)v3;
}

- (int64_t)activityCategory
{
  return 0;
}

+ (NSString)defaultSystemImageName
{
  return (NSString *)@"person.crop.circle.badge.plus";
}

- (id)_systemImageName
{
  v3 = [(ICAddCollaboratorsActivity *)self delegate];

  if (!v3
    || ([(ICAddCollaboratorsActivity *)self delegate],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 systemImageNameForAddCollaboratorsActivity:self],
        v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v5 = [(id)objc_opt_class() defaultSystemImageName];
  }

  return v5;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  id v3 = [(ICAddCollaboratorsActivity *)self delegate];
  [v3 performAddCollaboratorsActivity:self];
}

- (ICAddCollaboratorsActivityDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICAddCollaboratorsActivityDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end