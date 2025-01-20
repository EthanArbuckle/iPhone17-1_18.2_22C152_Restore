@interface ICActionSheetAlertAction
+ (id)actionWithTitle:(id)a3 iconImage:(id)a4 style:(int64_t)a5 handler:(id)a6;
- (ICActionSheetAlertAction)initWithTitle:(id)a3 iconImage:(id)a4 style:(int64_t)a5 handler:(id)a6;
@end

@implementation ICActionSheetAlertAction

+ (id)actionWithTitle:(id)a3 iconImage:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithTitle:v12 iconImage:v11 style:a5 handler:v10];

  return v13;
}

- (ICActionSheetAlertAction)initWithTitle:(id)a3 iconImage:(id)a4 style:(int64_t)a5 handler:(id)a6
{
  v16.receiver = self;
  v16.super_class = (Class)ICActionSheetAlertAction;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(ICActionSheetAlertAction *)&v16 class];
  objc_msgSend(v13, "_actionWithTitle:image:style:handler:shouldDismissHandler:", v12, v11, a5, v10, 0, v16.receiver, v16.super_class);
  v14 = (ICActionSheetAlertAction *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end