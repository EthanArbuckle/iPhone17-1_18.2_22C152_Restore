@interface EnvironmentsCreationAlertController
+ (id)alertControllerWithMessage:(id)a3 nameSelectionHandler:(id)a4;
+ (id)alertControllerWithTitle:(id)a3 message:(id)a4 nameSelectionHandler:(id)a5;
- (void)_textFieldValueDidChange:(id)a3;
@end

@implementation EnvironmentsCreationAlertController

+ (id)alertControllerWithMessage:(id)a3 nameSelectionHandler:(id)a4
{
  return [a1 alertControllerWithTitle:@"Add Custom Configuration" message:a3 nameSelectionHandler:a4];
}

+ (id)alertControllerWithTitle:(id)a3 message:(id)a4 nameSelectionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 alertControllerWithTitle:v8 message:v9 preferredStyle:1];
  objc_initWeak(&location, v11);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_100103F88;
  v26[4] = sub_100104850;
  id v27 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1007C2614;
  v24[3] = &unk_1012F8DC8;
  objc_copyWeak(&v25, &location);
  v24[4] = v26;
  [v11 addTextFieldWithConfigurationHandler:v24];
  v12 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v11 addAction:v12];

  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1007C26B0;
  v20 = &unk_1012E7940;
  objc_copyWeak(&v23, &location);
  id v13 = v10;
  id v21 = v13;
  v22 = v26;
  uint64_t v14 = +[UIAlertAction actionWithTitle:@"Create" style:0 handler:&v17];
  id v15 = v11[1];
  v11[1] = (id)v14;

  [v11[1] setEnabled:0 v17, v18, v19, v20];
  [v11 addAction:v11[1]];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  _Block_object_dispose(v26, 8);

  objc_destroyWeak(&location);

  return v11;
}

- (void)_textFieldValueDidChange:(id)a3
{
  id v4 = [a3 text];
  -[UIAlertAction setEnabled:](self->_createAction, "setEnabled:", [v4 length] != 0);
}

- (void).cxx_destruct
{
}

@end