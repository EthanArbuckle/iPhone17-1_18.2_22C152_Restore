@interface ICLightContentActivity
- (ICLightContentActivity)initWithNote:(id)a3;
- (ICNote)note;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setNote:(id)a3;
@end

@implementation ICLightContentActivity

- (ICLightContentActivity)initWithNote:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLightContentActivity;
  v6 = [(ICLightContentActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_note, a3);
  }

  return v7;
}

- (id)activityTitle
{
  v2 = [(ICLightContentActivity *)self note];
  unsigned int v3 = [v2 prefersLightBackground];
  v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"Use Dark Background";
  }
  else {
    CFStringRef v6 = @"Use Light Background";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_10063F3D8 table:0];

  return v7;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.lightContent";
}

- (id)activityImage
{
  v2 = [(ICLightContentActivity *)self note];
  unsigned int v3 = [v2 prefersLightBackground];
  v4 = @"circle.righthalf.fill";
  if (v3) {
    v4 = @"circle.lefthalf.fill";
  }
  id v5 = v4;

  CFStringRef v6 = +[UIImage systemImageNamed:v5];

  return v6;
}

- (void)performActivityWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t, void *))a3;
  id v5 = [(ICLightContentActivity *)self note];
  [v5 managedObjectContext];
  objc_super v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  v11 = sub_10011B1B8;
  v12 = &unk_100625860;
  id v13 = v5;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v14;
  id v7 = v5;
  [v6 performBlockAndWait:&v9];
  -[ICLightContentActivity activityDidFinish:](self, "activityDidFinish:", 1, v9, v10, v11, v12);
  if (v4)
  {
    v8 = [(ICLightContentActivity *)self activityType];
    v4[2](v4, 1, v8);
  }
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
}

@end