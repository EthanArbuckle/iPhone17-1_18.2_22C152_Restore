@interface MTShareUtilActivityViewController
- (BOOL)canShareFromTimestamp;
- (MTShareUtilActivityViewController)initWithDataSource:(id)a3 applicationActivities:(id)a4;
- (MTShareUtilDataSource)dataSource;
- (NSArray)applicationActivities;
- (id)_customizationGroupsForActivityViewController:(id)a3;
- (id)_titleForActivity:(id)a3;
- (id)customLocalizedActionTitleForActivityViewController:(id)a3;
- (id)titleForShareFromMode:(int64_t)a3;
- (int64_t)shareFromModeForShareMode:(int64_t)a3;
- (int64_t)shareModeForShareFromMode:(int64_t)a3;
- (void)setApplicationActivities:(id)a3;
- (void)setDataSource:(id)a3;
@end

@implementation MTShareUtilActivityViewController

- (MTShareUtilActivityViewController)initWithDataSource:(id)a3 applicationActivities:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MTShareUtilActivityViewController *)self setDataSource:v7];
  [(MTShareUtilActivityViewController *)self setApplicationActivities:v6];
  v8 = +[MTShareUtil shareActivityItems:v7];

  v11.receiver = self;
  v11.super_class = (Class)MTShareUtilActivityViewController;
  v9 = [(MTShareUtilActivityViewController *)&v11 initWithActivityItems:v8 applicationActivities:v6];

  return v9;
}

- (id)_titleForActivity:(id)a3
{
  if (UIActivityTypeCopyToPasteboard == a3)
  {
    v4 = +[NSBundle mainBundle];
    v3 = [v4 localizedStringForKey:@"Copy Link" value:&stru_10056A8A0 table:0];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MTShareUtilActivityViewController;
    v3 = -[MTShareUtilActivityViewController _titleForActivity:](&v6, "_titleForActivity:");
  }

  return v3;
}

- (id)customLocalizedActionTitleForActivityViewController:(id)a3
{
  v4 = [(MTShareUtilActivityViewController *)self dataSource];
  v5 = -[MTShareUtilActivityViewController titleForShareFromMode:](self, "titleForShareFromMode:", -[MTShareUtilActivityViewController shareFromModeForShareMode:](self, "shareFromModeForShareMode:", [v4 currentShareMode]));

  return v5;
}

- (id)_customizationGroupsForActivityViewController:(id)a3
{
  if ([(MTShareUtilActivityViewController *)self canShareFromTimestamp])
  {
    id v4 = objc_alloc((Class)NSArray);
    v5 = [(MTShareUtilActivityViewController *)self titleForShareFromMode:0];
    objc_super v6 = [(MTShareUtilActivityViewController *)self titleForShareFromMode:1];
    id v7 = [v4 initWithObjects:v5, v6, 0];

    v8 = [(MTShareUtilActivityViewController *)self dataSource];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000D3D54;
    v17[3] = &unk_100550A00;
    v17[4] = self;
    v9 = +[_UIActivityItemCustomization pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:](_UIActivityItemCustomization, "pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:", @"PodcastsShareFromPicker", v7, -[MTShareUtilActivityViewController shareFromModeForShareMode:](self, "shareFromModeForShareMode:", [v8 currentShareMode]), 0, v17);

    id v10 = objc_alloc((Class)_UIActivityItemCustomizationGroup);
    objc_super v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"Share From" value:&stru_10056A8A0 table:0];
    v19 = v9;
    v13 = +[NSArray arrayWithObjects:&v19 count:1];
    id v14 = [v10 _initGroupWithName:v12 identifier:@"PodcastsShareFromPickerGroup" customizations:v13];

    id v18 = v14;
    v15 = +[NSArray arrayWithObjects:&v18 count:1];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)titleForShareFromMode:(int64_t)a3
{
  id v5 = objc_alloc_init((Class)AVTimeFormatter);
  [v5 setStyle:1];
  if (a3 == 1)
  {
    [(MTShareUtilDataSource *)self->_dataSource selectedPlayerTime];
    if (v8 <= 0.0)
    {
      [(MTShareUtilDataSource *)self->_dataSource selectedReferenceTime];
      double v12 = v11;
      objc_super v6 = +[NSBundle mainBundle];
      v13 = [v6 localizedStringForKey:@"From %@" value:&stru_10056A8A0 table:0];
      dataSource = self->_dataSource;
      if (v12 <= 0.0) {
        [(MTShareUtilDataSource *)dataSource currentPlayerTime];
      }
      else {
        [(MTShareUtilDataSource *)dataSource selectedReferenceTime];
      }
      v15 = [v5 stringFromSeconds:];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v15);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = +[NSBundle mainBundle];
      v9 = [v6 localizedStringForKey:@"From %@" value:&stru_10056A8A0 table:0];
      [(MTShareUtilDataSource *)self->_dataSource selectedPlayerTime];
      id v10 = [v5 stringFromSeconds:];
      +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a3)
    {
      id v7 = &stru_10056A8A0;
      goto LABEL_12;
    }
    objc_super v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"From Start" value:&stru_10056A8A0 table:0];
  }

LABEL_12:

  return v7;
}

- (BOOL)canShareFromTimestamp
{
  return (id)[(MTShareUtilDataSource *)self->_dataSource supportedShareModes] == (id)4
      || (id)[(MTShareUtilDataSource *)self->_dataSource supportedShareModes] == (id)7;
}

- (int64_t)shareModeForShareFromMode:(int64_t)a3
{
  if (a3) {
    return 4;
  }
  else {
    return 2;
  }
}

- (int64_t)shareFromModeForShareMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 1;
  }
  else {
    return qword_10046B108[a3 - 1];
  }
}

- (MTShareUtilDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSArray)applicationActivities
{
  return self->_applicationActivities;
}

- (void)setApplicationActivities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationActivities, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end