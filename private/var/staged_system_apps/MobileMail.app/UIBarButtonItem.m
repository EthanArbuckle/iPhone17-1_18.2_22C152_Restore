@interface UIBarButtonItem
+ (id)mailBoldBarButtonItemFont;
+ (id)mailDefaultBarButtonItemFont;
+ (id)mf_newFixedSpaceItem;
+ (id)mf_newFixedSpaceItemWithWidth:(double)a3;
+ (id)mf_newFlexibleSpaceItem;
+ (id)mf_newMultiBarButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (id)mf_newSelectionBarButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (void)mf_configureMultiBarButtonItem:(id)a3 usingStyle:(int64_t)a4;
+ (void)mf_configureSelectionBarButtonItem:(id)a3 usingStyle:(unint64_t)a4;
@end

@implementation UIBarButtonItem

+ (id)mf_newFlexibleSpaceItem
{
  id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];

  return v2;
}

+ (id)mf_newFixedSpaceItem
{
  return [a1 mf_newFixedSpaceItemWithWidth:28.0];
}

+ (id)mf_newFixedSpaceItemWithWidth:(double)a3
{
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
  [v4 setWidth:a3];

  return v4;
}

+ (void)mf_configureMultiBarButtonItem:(id)a3 usingStyle:(int64_t)a4
{
  id v5 = a3;
  id v11 = v5;
  switch(a4)
  {
    case 0:
      v6 = +[NSBundle mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"EDIT" value:&stru_100619928 table:@"Main"];
      goto LABEL_7;
    case 1:
      v6 = +[NSBundle mainBundle];
      uint64_t v8 = [v6 localizedStringForKey:@"DONE" value:&stru_100619928 table:@"Main"];
      goto LABEL_5;
    case 2:
      v6 = +[NSBundle mainBundle];
      uint64_t v8 = [v6 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
LABEL_5:
      v9 = (void *)v8;
      uint64_t v10 = 2;
      goto LABEL_8;
    case 3:
      v6 = +[NSBundle mainBundle];
      uint64_t v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
LABEL_7:
      v9 = (void *)v7;
      uint64_t v10 = 0;
LABEL_8:

      id v5 = v11;
      break;
    default:
      v9 = 0;
      uint64_t v10 = 0;
      break;
  }
  [v5 setStyle:v10];
  [v11 setTitle:v9];
}

+ (id)mf_newMultiBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)UIBarButtonItem);
  uint64_t v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"EDIT" value:&stru_100619928 table:@"Main"];
  id v9 = [v6 initWithTitle:v8 style:0 target:v5 action:a4];

  id v10 = objc_alloc((Class)NSSet);
  id v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"EDIT" value:&stru_100619928 table:@"Main"];
  v20[0] = v12;
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"DONE" value:&stru_100619928 table:@"Main"];
  v20[1] = v14;
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"CANCEL" value:&stru_100619928 table:@"Main"];
  v20[2] = v16;
  v17 = +[NSArray arrayWithObjects:v20 count:3];
  id v18 = [v10 initWithArray:v17];
  [v9 setPossibleTitles:v18];

  return v9;
}

+ (id)mailDefaultBarButtonItemFont
{
  return +[UIFont systemFontOfSize:17.0];
}

+ (id)mailBoldBarButtonItemFont
{
  return +[UIFont boldSystemFontOfSize:17.0];
}

+ (id)mf_newSelectionBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)UIBarButtonItem);
  uint64_t v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"SELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
  id v9 = [v6 initWithTitle:v8 style:0 target:v5 action:a4];

  id v10 = objc_alloc((Class)NSSet);
  id v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"SELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
  v18[0] = v12;
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"DESELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
  v18[1] = v14;
  v15 = +[NSArray arrayWithObjects:v18 count:2];
  id v16 = [v10 initWithArray:v15];
  [v9 setPossibleTitles:v16];

  return v9;
}

+ (void)mf_configureSelectionBarButtonItem:(id)a3 usingStyle:(unint64_t)a4
{
  id v7 = a3;
  if (a4 == 1)
  {
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"DESELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
    [v7 setTitle:v6];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"SELECT_ALL_BUTTON" value:&stru_100619928 table:@"Main"];
    [v7 setTitle:v6];
  }

LABEL_6:
}

@end