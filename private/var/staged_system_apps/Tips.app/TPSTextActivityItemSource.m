@interface TPSTextActivityItemSource
- (TPSTextActivityItemSource)initWithTip:(id)a3;
- (TPSTip)tip;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setTip:(id)a3;
@end

@implementation TPSTextActivityItemSource

- (TPSTextActivityItemSource)initWithTip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSTextActivityItemSource;
  v6 = [(TPSTextActivityItemSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tip, a3);
  }

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  v4 = [(TPSTip *)self->_tip summary];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(TPSTip *)self->_tip bodyText];
  }
  v7 = v6;

  return v7;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  v10[0] = UIActivityTypeAirDrop;
  v10[1] = UIActivityTypePostToFacebook;
  v10[2] = UIActivityTypeMail;
  id v6 = +[NSArray arrayWithObjects:v10 count:3];
  if ([v5 isEqualToString:UIActivityTypeSaveToNotes])
  {
    uint64_t v7 = [(TPSTip *)self->_tip title];
  }
  else
  {
    if ([v6 containsObject:v5])
    {
      v8 = &stru_1000B98B0;
      goto LABEL_7;
    }
    uint64_t v7 = [(TPSTip *)self->_tip shareText];
  }
  v8 = (__CFString *)v7;
LABEL_7:

  return v8;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:UIActivityTypeMail] & 1) != 0
    || [v5 isEqualToString:UIActivityTypeCreateReminder])
  {
    id v6 = [(TPSTip *)self->_tip shareText];
  }
  else
  {
    id v6 = &stru_1000B98B0;
  }

  return v6;
}

- (TPSTip)tip
{
  return self->_tip;
}

- (void)setTip:(id)a3
{
}

- (void).cxx_destruct
{
}

@end