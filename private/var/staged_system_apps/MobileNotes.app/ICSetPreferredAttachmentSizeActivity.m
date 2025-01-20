@interface ICSetPreferredAttachmentSizeActivity
- (ICNAEventReporter)eventReporter;
- (ICNote)note;
- (ICSetPreferredAttachmentSizeActivity)initWithNote:(id)a3;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (id)menuWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setNote:(id)a3;
@end

@implementation ICSetPreferredAttachmentSizeActivity

- (ICSetPreferredAttachmentSizeActivity)initWithNote:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSetPreferredAttachmentSizeActivity;
  v6 = [(ICSetPreferredAttachmentSizeActivity *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_note, a3);
  }

  return v7;
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Attachment View" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"rectangle.3.group"];
}

- (id)activityType
{
  return @"com.apple.mobilenotes.setPreferredAttachmentSize";
}

- (id)menuWithCompletion:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000EC210;
  v12[3] = &unk_100629AD8;
  v12[4] = self;
  v4 = objc_retainBlock(v12);
  id v5 = objc_alloc((Class)ICAttachmentSizeMenu);
  v6 = [(ICSetPreferredAttachmentSizeActivity *)self activityTitle];
  v7 = [(ICSetPreferredAttachmentSizeActivity *)self activityImage];
  v8 = [(ICSetPreferredAttachmentSizeActivity *)self note];
  id v9 = objc_msgSend(v5, "initWithTitle:image:preferredViewSize:supportedSizes:supportsPlainLink:isOverrideVariant:selectedSizeHandler:plainLinkHandler:", v6, v7, objc_msgSend(v8, "attachmentViewType"), &off_10064B5F0, 0, 1, v4, 0);

  v10 = [v9 createMenu];

  return v10;
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
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
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end