@interface MapsDebugTextFieldTableRow
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (MapsDebugTextFieldTableRow)init;
- (NSString)placeholderText;
- (NSString)text;
- (id)_setupTextField;
- (id)didBeginEditing;
- (id)done;
- (id)filter;
- (id)get;
- (id)set;
- (int64_t)inputType;
- (int64_t)maximumNumberOfCharacters;
- (void)_donePressed:(id)a3;
- (void)_fieldDidChangeValue:(id)a3;
- (void)configureCell:(id)a3;
- (void)configureCollectionViewCell:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDidBeginEditing:(id)a3;
- (void)setDone:(id)a3;
- (void)setFilter:(id)a3;
- (void)setGet:(id)a3;
- (void)setInputType:(int64_t)a3;
- (void)setMaximumNumberOfCharacters:(int64_t)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setSet:(id)a3;
- (void)setText:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation MapsDebugTextFieldTableRow

- (MapsDebugTextFieldTableRow)init
{
  v8.receiver = self;
  v8.super_class = (Class)MapsDebugTextFieldTableRow;
  v2 = [(MapsDebugTableRow *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(MapsDebugTextFieldTableRow *)v2 setPlaceholderText:@"Value"];
    objc_initWeak(&location, v3);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100851CC8;
    v5[3] = &unk_1012E6708;
    objc_copyWeak(&v6, &location);
    [(MapsDebugTableRow *)v3 setSelectionAction:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)dealloc
{
  [(MapsDebugTextFieldTableRow *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugTextFieldTableRow;
  [(MapsDebugTableRow *)&v3 dealloc];
}

- (void)invalidate
{
  [(MapsDebugTextFieldTableRow *)self setGet:0];
  [(MapsDebugTextFieldTableRow *)self setSet:0];
  [(UITextField *)self->_textField removeTarget:self action:"_fieldDidChangeValue:" forControlEvents:0x20000];
  [(UITextField *)self->_textField removeTarget:self action:"_fieldDidChangeValue:" forControlEvents:0x40000];
  objc_super v3 = [(UITextField *)self->_textField delegate];

  if (v3 == self) {
    [(UITextField *)self->_textField setDelegate:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)MapsDebugTextFieldTableRow;
  [(MapsDebugTableRow *)&v4 invalidate];
}

- (id)_setupTextField
{
  objc_super v3 = [(UITextField *)self->_textField traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  textField = self->_textField;
  if (!textField)
  {
    id v6 = [objc_alloc((Class)UITextField) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v7 = self->_textField;
    self->_textField = v6;

    objc_super v8 = +[UIColor secondaryLabelColor];
    [(UITextField *)self->_textField setTextColor:v8];

    if (v4 == (id)5) {
      +[UIFont systemFontOfSize:15.0];
    }
    else {
    v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    }
    [(UITextField *)self->_textField setFont:v9];

    v10 = +[UIColor clearColor];
    [(UITextField *)self->_textField setBackgroundColor:v10];

    [(UITextField *)self->_textField setReturnKeyType:9];
    [(UITextField *)self->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextField *)self->_textField setTag:999];
    textField = self->_textField;
  }
  [(UITextField *)textField setDelegate:self];
  v11 = [(MapsDebugTextFieldTableRow *)self placeholderText];
  [(UITextField *)self->_textField setPlaceholder:v11];

  [(UITextField *)self->_textField setAdjustsFontForContentSizeCategory:1];
  unint64_t v12 = (unint64_t)[(MapsDebugTextFieldTableRow *)self inputType] - 1;
  if (v12 > 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = qword_100F72640[v12];
  }
  [(UITextField *)self->_textField setKeyboardType:v13];
  [(UITextField *)self->_textField setAutocorrectionType:(char *)[(MapsDebugTextFieldTableRow *)self inputType] - 1 < (char *)3];
  [(UITextField *)self->_textField setAutocapitalizationType:2 * ((char *)[(MapsDebugTextFieldTableRow *)self inputType] - 1 > (char *)2)];
  id v14 = [(UITextField *)self->_textField keyboardType];
  if (v14 == (id)8 || v14 == (id)4)
  {
    id v15 = objc_alloc_init((Class)UIToolbar);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 setBarStyle:0];
    [v15 setUserInteractionEnabled:1];
    [v15 setTranslucent:1];
    id v16 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    id v17 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_donePressed:"];
    v24[0] = v16;
    v24[1] = v17;
    v18 = +[NSArray arrayWithObjects:v24 count:2];
    [v15 setItems:v18];

    [(UITextField *)self->_textField setInputAccessoryView:v15];
  }
  v19 = [(MapsDebugTextFieldTableRow *)self get];

  if (v19)
  {
    v20 = [(MapsDebugTextFieldTableRow *)self get];
    v21 = v20[2]();
    [(UITextField *)self->_textField setText:v21];
  }
  [(UITextField *)self->_textField addTarget:self action:"_fieldDidChangeValue:" forControlEvents:0x20000];
  [(UITextField *)self->_textField addTarget:self action:"_fieldDidChangeValue:" forControlEvents:0x40000];
  [(UITextField *)self->_textField sizeToFit];
  [(UITextField *)self->_textField removeFromSuperview];
  [(UITextField *)self->_textField setAccessibilityIdentifier:@"MapsDebugTextField"];
  v22 = self->_textField;

  return v22;
}

- (void)configureCollectionViewCell:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)MapsDebugTextFieldTableRow;
  [(MapsDebugTableRow *)&v49 configureCollectionViewCell:v4];
  id v5 = v4;
  id v6 = [v5 contentView];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v7 = [v5 contentView];
  objc_super v8 = [v7 subviews];

  id v9 = [v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ([v13 tag] == (id)999) {
          [v13 removeFromSuperview];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v10);
  }

  id v14 = [(MapsDebugTextFieldTableRow *)self _setupTextField];
  textField = self->_textField;
  self->_textField = v14;

  [(UITextField *)self->_textField setClearButtonMode:1];
  id v16 = +[UIColor labelColor];
  [(UITextField *)self->_textField setTextColor:v16];

  [v6 addSubview:self->_textField];
  [v5 setPreservesSuperviewLayoutMargins:1];
  [v6 setPreservesSuperviewLayoutMargins:1];
  id v17 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  v18 = [(MapsDebugTableRow *)self title];
  id v19 = [v18 length];

  v20 = self->_textField;
  if (v19)
  {
    [(UITextField *)v20 setTextAlignment:2];
    v21 = [(UITextField *)self->_textField leadingAnchor];
    v22 = [v6 textLayoutGuide];
    v44 = [v22 trailingAnchor];
    v43 = [v21 constraintEqualToAnchor:16.0];
    v51[0] = v43;
    v23 = [(UITextField *)self->_textField trailingAnchor];
    v24 = [v6 trailingAnchor];
    v42 = v23;
    v25 = [v23 constraintEqualToAnchor:v24 constant:-16.0];
    v51[1] = v25;
    v26 = +[NSArray arrayWithObjects:v51 count:2];
    [(NSArray *)v17 addObjectsFromArray:v26];
  }
  else
  {
    [(UITextField *)v20 setTextAlignment:0];
    v40 = [(UITextField *)self->_textField leadingAnchor];
    uint64_t v39 = [v6 leadingAnchor];
    v44 = [v40 constraintEqualToAnchor:v39 constant:16.0];
    v50[0] = v44;
    v27 = [(UITextField *)self->_textField trailingAnchor];
    v42 = [v6 trailingAnchor];
    v43 = v27;
    v24 = [v27 constraintEqualToAnchor:v42 constant:-16.0];
    v50[1] = v24;
    v25 = [(UITextField *)self->_textField topAnchor];
    v26 = [v6 topAnchor];
    v38 = [v25 constraintEqualToAnchor:v26 constant:6.0];
    v50[2] = v38;
    v37 = [(UITextField *)self->_textField bottomAnchor];
    v28 = [v6 bottomAnchor];
    [v37 constraintEqualToAnchor:v28 constant:-6.0];
    v41 = v6;
    v30 = v29 = v17;
    v50[3] = v30;
    +[NSArray arrayWithObjects:v50 count:4];
    v32 = id v31 = v5;
    [(NSArray *)v29 addObjectsFromArray:v32];

    id v5 = v31;
    v22 = (void *)v39;

    id v17 = v29;
    id v6 = v41;

    v21 = v40;
  }

  v33 = [(UITextField *)self->_textField centerYAnchor];
  v34 = [v6 centerYAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  [(NSArray *)v17 addObject:v35];

  if (self->_lastConstraints) {
    [v6 removeConstraints:];
  }
  [v6 addConstraints:v17];
  lastConstraints = self->_lastConstraints;
  self->_lastConstraints = v17;
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MapsDebugTextFieldTableRow;
  [(MapsDebugTableRow *)&v39 configureCell:v4];
  id v5 = [v4 contentView];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = [v4 contentView];
  v7 = [v6 subviews];

  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        unint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v12 tag] == (id)999) {
          [v12 removeFromSuperview];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v9);
  }

  [v4 setSelectionStyle:0];
  uint64_t v13 = [(MapsDebugTextFieldTableRow *)self _setupTextField];
  [v5 addSubview:v13];

  v34 = v4;
  [v4 setPreservesSuperviewLayoutMargins:1];
  [v5 setPreservesSuperviewLayoutMargins:1];
  id v14 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  id v15 = [(MapsDebugTableRow *)self title];
  id v16 = [v15 length];

  textField = self->_textField;
  if (v16)
  {
    [(UITextField *)textField setTextAlignment:2];
    [(UITextField *)self->_textField leadingAnchor];
    v18 = v32 = v14;
    id v19 = [v5 textLayoutGuide];
    v33 = [v19 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:5.0];
    v41[0] = v20;
    v21 = [(UITextField *)self->_textField trailingAnchor];
    v22 = [v5 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:-5.0];
    v41[1] = v23;
    v24 = +[NSArray arrayWithObjects:v41 count:2];
    [(NSArray *)v32 addObjectsFromArray:v24];

    v25 = v18;
    id v14 = v32;
  }
  else
  {
    [(UITextField *)textField setTextAlignment:0];
    v25 = [(UITextField *)self->_textField leadingAnchor];
    id v19 = [v5 leadingAnchor];
    v33 = [v25 constraintEqualToAnchor:v19 constant:5.0];
    v40[0] = v33;
    v20 = [(UITextField *)self->_textField trailingAnchor];
    v21 = [v5 trailingAnchor];
    v22 = [v20 constraintEqualToAnchor:v21 constant:-5.0];
    v40[1] = v22;
    v23 = +[NSArray arrayWithObjects:v40 count:2];
    [(NSArray *)v14 addObjectsFromArray:v23];
  }

  v26 = [(UITextField *)self->_textField centerYAnchor];
  v27 = [v5 centerYAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [(NSArray *)v14 addObject:v28];

  v29 = [v5 heightAnchor];
  v30 = [v29 constraintGreaterThanOrEqualToConstant:44.0];
  [(NSArray *)v14 addObject:v30];

  if (self->_lastConstraints) {
    [v5 removeConstraints:];
  }
  [v5 addConstraints:v14];
  lastConstraints = self->_lastConstraints;
  self->_lastConstraints = v14;
}

- (void)_fieldDidChangeValue:(id)a3
{
  id v6 = [a3 text];
  id v4 = [(MapsDebugTextFieldTableRow *)self set];

  if (v4)
  {
    id v5 = [(MapsDebugTextFieldTableRow *)self set];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
  [(MapsDebugTextFieldTableRow *)self setText:v6];
}

- (void)_donePressed:(id)a3
{
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  [a3 resignFirstResponder];
  id v4 = [(MapsDebugTextFieldTableRow *)self done];

  if (v4)
  {
    id v5 = [(MapsDebugTextFieldTableRow *)self done];
    id v6 = [(MapsDebugTextFieldTableRow *)self text];
    ((void (**)(void, void *))v5)[2](v5, v6);
  }
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = [(MapsDebugTextFieldTableRow *)self didBeginEditing];

  if (v4)
  {
    id v5 = [(MapsDebugTextFieldTableRow *)self didBeginEditing];
    v5[2]();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  if (![(MapsDebugTextFieldTableRow *)self maximumNumberOfCharacters]) {
    goto LABEL_5;
  }
  NSUInteger v11 = length + location;
  unint64_t v12 = [v9 text];
  id v13 = [v12 length];

  if (v11 > (unint64_t)v13
    || ([v9 text],
        id v14 = objc_claimAutoreleasedReturnValue(),
        id v15 = (char *)[v14 length],
        id v16 = &v15[(void)[v10 length] - length],
        v14,
        v16 > (char *)[(MapsDebugTextFieldTableRow *)self maximumNumberOfCharacters]))
  {
    char v17 = 0;
  }
  else
  {
LABEL_5:
    v18 = [(MapsDebugTextFieldTableRow *)self filter];

    if (v18)
    {
      id v19 = [(MapsDebugTextFieldTableRow *)self filter];
      char v17 = ((uint64_t (**)(void, id))v19)[2](v19, v10);
    }
    else if ((id)[(MapsDebugTextFieldTableRow *)self inputType] == (id)1)
    {
      if (qword_10160FBF0 != -1) {
        dispatch_once(&qword_10160FBF0, &stru_1012FABF8);
      }
      char v17 = [v10 rangeOfCharacterFromSet:qword_10160FBE8] == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      char v17 = 1;
    }
  }

  return v17;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
}

- (id)set
{
  return self->_set;
}

- (void)setSet:(id)a3
{
}

- (id)get
{
  return self->_get;
}

- (void)setGet:(id)a3
{
}

- (id)done
{
  return self->_done;
}

- (void)setDone:(id)a3
{
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (int64_t)maximumNumberOfCharacters
{
  return self->_maximumNumberOfCharacters;
}

- (void)setMaximumNumberOfCharacters:(int64_t)a3
{
  self->_maximumNumberOfCharacters = a3;
}

- (id)didBeginEditing
{
  return self->_didBeginEditing;
}

- (void)setDidBeginEditing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didBeginEditing, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong(&self->_done, 0);
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_lastConstraints, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end