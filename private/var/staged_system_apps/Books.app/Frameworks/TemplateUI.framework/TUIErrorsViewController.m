@interface TUIErrorsViewController
- (NSArray)errors;
- (TUIErrorsViewController)initWithErrors:(id)a3;
- (id)errorTextFromError:(id)a3;
- (id)infoTextFromError:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation TUIErrorsViewController

- (TUIErrorsViewController)initWithErrors:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUIErrorsViewController;
  v5 = [(TUIErrorsViewController *)&v9 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = (NSArray *)[v4 copy];
    errors = v5->_errors;
    v5->_errors = v6;
  }
  return v5;
}

- (id)errorTextFromError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:@"TUIErrorDomain"];

  if (v5)
  {
    v6 = TUIErrorToString((uint64_t)[v3 code]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)infoTextFromError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:@"TUIErrorDomain"];

  if (v5)
  {
    v6 = [v3 userInfo];
    v7 = [v6 objectForKeyedSubscript:@"TUIErrorInfoKey"];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v6 objectForKeyedSubscript:NSLocalizedDescriptionKey];
    }
    v11 = v9;

    v10 = [v11 description];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_errors count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  errors = self->_errors;
  id v7 = a3;
  v8 = -[NSArray objectAtIndexedSubscript:](errors, "objectAtIndexedSubscript:", [a4 row]);
  id v9 = [v7 dequeueReusableCellWithIdentifier:@"cell"];

  if (!v9) {
    id v9 = [objc_alloc((Class)UITableViewCell) initWithStyle:3 reuseIdentifier:@"cell"];
  }
  v10 = [(TUIErrorsViewController *)self infoTextFromError:v8];
  v11 = [v9 textLabel];
  [v11 setText:v10];

  v12 = [(TUIErrorsViewController *)self errorTextFromError:v8];
  v13 = [v9 detailTextLabel];
  [v13 setText:v12];

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[NSArray objectAtIndexedSubscript:](self->_errors, "objectAtIndexedSubscript:", [v7 row]);
  id v9 = [v8 domain];
  unsigned int v10 = [v9 isEqualToString:@"TUIErrorDomain"];

  if (v10)
  {
    v11 = [v8 userInfo];
    v12 = [v11 objectForKeyedSubscript:@"TUIErrorLocationsKey"];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_18ED9C;
    v24[3] = &unk_251D18;
    id v13 = objc_alloc_init((Class)NSMutableString);
    id v25 = v13;
    [v12 enumerateObjectsWithOptions:2 usingBlock:v24];
    v14 = [(TUIErrorsViewController *)self infoTextFromError:v8];
    v15 = +[UIAlertController alertControllerWithTitle:v14 message:v13 preferredStyle:0];

    objc_initWeak(&location, self);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_18EDCC;
    v20 = &unk_2577E8;
    objc_copyWeak(&v22, &location);
    id v21 = v7;
    v16 = +[UIAlertAction actionWithTitle:@"Done" style:0 handler:&v17];
    [v15 addAction:v16, v17, v18, v19, v20];

    [(TUIErrorsViewController *)self presentViewController:v15 animated:1 completion:0];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

- (NSArray)errors
{
  return self->_errors;
}

- (void).cxx_destruct
{
}

@end