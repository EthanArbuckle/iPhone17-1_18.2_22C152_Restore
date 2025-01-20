@interface MapsDebugDateFieldTableRow
- (MapsDebugDateFieldTableRow)init;
- (NSDate)date;
- (id)get;
- (id)set;
- (void)_fieldDidChangeValue:(id)a3;
- (void)_showDatePicker;
- (void)configureCell:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setDate:(id)a3;
- (void)setGet:(id)a3;
- (void)setSet:(id)a3;
@end

@implementation MapsDebugDateFieldTableRow

- (MapsDebugDateFieldTableRow)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsDebugDateFieldTableRow;
  v2 = [(MapsDebugTableRow *)&v7 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100853174;
    v4[3] = &unk_1012E6708;
    objc_copyWeak(&v5, &location);
    [(MapsDebugTableRow *)v2 setSelectionAction:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  [(MapsDebugDateFieldTableRow *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugDateFieldTableRow;
  [(MapsDebugTableRow *)&v3 dealloc];
}

- (void)invalidate
{
  [(MapsDebugDateFieldTableRow *)self setGet:0];
  [(MapsDebugDateFieldTableRow *)self setSet:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsDebugDateFieldTableRow;
  [(MapsDebugTableRow *)&v3 invalidate];
}

- (void)configureCell:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)MapsDebugDateFieldTableRow;
  [(MapsDebugTableRow *)&v50 configureCell:v4];
  id v5 = [v4 contentView];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v6 = [v4 contentView];
  objc_super v7 = [v6 subviews];

  id v8 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v47;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v47 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        if ([v12 tag] == (id)999) {
          [v12 removeFromSuperview];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v9);
  }

  [v4 setSelectionStyle:0];
  objc_storeWeak((id *)&self->_cell, v4);
  if (!self->_dateLabel)
  {
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    dateLabel = self->_dateLabel;
    self->_dateLabel = v13;

    v15 = +[UIColor clearColor];
    [(UILabel *)self->_dateLabel setBackgroundColor:v15];

    [(UILabel *)self->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_dateLabel setTag:999];
  }
  v16 = [(MapsDebugDateFieldTableRow *)self get];

  if (v16)
  {
    v17 = [(MapsDebugDateFieldTableRow *)self get];
    v18 = v17[2]();
    [(MapsDebugDateFieldTableRow *)self setDate:v18];
  }
  v19 = [(MapsDebugDateFieldTableRow *)self date];

  if (!v19)
  {
    v20 = +[NSDate date];
    [(MapsDebugDateFieldTableRow *)self setDate:v20];
  }
  [(UILabel *)self->_dateLabel removeFromSuperview];
  v21 = [v4 contentView];
  [v21 addSubview:self->_dateLabel];

  [v4 setPreservesSuperviewLayoutMargins:1];
  v22 = [v4 contentView];
  [v22 setPreservesSuperviewLayoutMargins:1];

  v23 = [(MapsDebugTableRow *)self title];
  id v24 = [v23 length];

  v25 = self->_dateLabel;
  if (v24)
  {
    [(UILabel *)v25 setTextAlignment:2];
    v26 = [(UILabel *)self->_dateLabel leadingAnchor];
    v45 = [v5 textLayoutGuide];
    v44 = [v45 trailingAnchor];
    v43 = [v26 constraintEqualToAnchor:5.0];
    v52[0] = v43;
    v27 = [v5 trailingAnchor];
    v41 = [(UILabel *)self->_dateLabel trailingAnchor];
    v42 = v27;
    v28 = [v27 constraintEqualToAnchor:v41];
    v52[1] = v28;
    v29 = [(UILabel *)self->_dateLabel centerYAnchor];
    v30 = [v5 textLayoutGuide];
    v31 = [v30 centerYAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    v52[2] = v32;
    v33 = +[NSArray arrayWithObjects:v52 count:3];
  }
  else
  {
    [(UILabel *)v25 setTextAlignment:0];
    v40 = [(UILabel *)self->_dateLabel leadingAnchor];
    v45 = [v5 leadingAnchor];
    v44 = [v40 constraintEqualToAnchor:];
    v51[0] = v44;
    v34 = [v5 trailingAnchor];
    v42 = [(UILabel *)self->_dateLabel trailingAnchor];
    v43 = v34;
    v41 = [v34 constraintEqualToAnchor:v42];
    v51[1] = v41;
    v28 = [(UILabel *)self->_dateLabel topAnchor];
    v29 = [v5 topAnchor];
    v30 = [v28 constraintEqualToAnchor:v29];
    v51[2] = v30;
    v31 = [(UILabel *)self->_dateLabel bottomAnchor];
    v32 = [v5 bottomAnchor];
    [v31 constraintEqualToAnchor:v32];
    v36 = v35 = v5;
    v51[3] = v36;
    v33 = +[NSArray arrayWithObjects:v51 count:4];

    id v5 = v35;
    v26 = v40;
  }

  if (self->_lastConstraints)
  {
    v37 = [v4 contentView];
    [v37 removeConstraints:self->_lastConstraints];
  }
  v38 = [v4 contentView];
  [v38 addConstraints:v33];

  lastConstraints = self->_lastConstraints;
  self->_lastConstraints = v33;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  id v5 = a3;
  id v8 = objc_alloc_init((Class)NSDateFormatter);
  [v8 setTimeStyle:0];
  [v8 setDateStyle:1];
  v6 = [(MapsDebugDateFieldTableRow *)self date];
  objc_super v7 = [v8 stringFromDate:v6];
  [(UILabel *)self->_dateLabel setText:v7];
}

- (void)_fieldDidChangeValue:(id)a3
{
  id v8 = [a3 date];
  id v4 = [(MapsDebugDateFieldTableRow *)self date];
  unsigned __int8 v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    v6 = [(MapsDebugDateFieldTableRow *)self set];

    if (v6)
    {
      objc_super v7 = [(MapsDebugDateFieldTableRow *)self set];
      ((void (**)(void, id))v7)[2](v7, v8);
    }
    [(MapsDebugDateFieldTableRow *)self setDate:v8];
  }
}

- (void)_showDatePicker
{
  v2 = self;
  objc_super v3 = [(MapsDebugTableRow *)self title];
  id v4 = +[UIAlertController alertControllerWithTitle:v3 message:0 preferredStyle:0];

  unsigned __int8 v5 = objc_alloc_init(MapsDebugDataPickerViewController);
  v6 = [(MapsDebugDateFieldTableRow *)v2 date];
  objc_super v7 = [(MapsDebugDataPickerViewController *)v5 datePicker];
  [v7 setDate:v6];

  [v4 setContentViewController:v5];
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100853BFC;
  id v24 = &unk_1012E9640;
  v25 = v2;
  id v8 = v5;
  v26 = v8;
  id v9 = +[UIAlertAction actionWithTitle:@"Ok" style:0 handler:&v21];
  [v4 addAction:v9, v21, v22, v23, v24, v25];

  uint64_t v10 = +[UIAlertAction actionWithTitle:@"Cancel" style:1 handler:0];
  [v4 addAction:v10];

  v11 = [v4 popoverPresentationController];
  v2 = (MapsDebugDateFieldTableRow *)((char *)v2 + 112);
  id WeakRetained = objc_loadWeakRetained((id *)&v2->super.super.isa);
  v13 = [WeakRetained contentView];
  [v13 bounds];
  [v11 setSourceRect:];

  id v14 = objc_loadWeakRetained((id *)&v2->super.super.isa);
  v15 = [v14 contentView];
  [v11 setSourceView:v15];

  id v16 = objc_loadWeakRetained((id *)&v2->super.super.isa);
  if (v16)
  {
    v17 = v16;
    do
    {
      v18 = v17;
      v19 = +[UIViewController viewControllerForView:v17];
      v17 = [v17 superview];

      if (v19) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v17 == 0;
      }
    }
    while (!v20);
  }
  else
  {
    v19 = 0;
  }
  [v19 presentViewController:v4 animated:1 completion:0];
}

- (NSDate)date
{
  return self->_date;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_get, 0);
  objc_storeStrong(&self->_set, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_lastConstraints, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end