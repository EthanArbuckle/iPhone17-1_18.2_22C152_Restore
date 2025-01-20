@interface RAPReportComposerCommentPart
- (RAPReportComposerCommentPart)initWithCommentQuestion:(id)a3;
- (void)beginEditingCommentIfPossible;
@end

@implementation RAPReportComposerCommentPart

- (RAPReportComposerCommentPart)initWithCommentQuestion:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RAPReportComposerCommentPart;
  v5 = [(RAPTablePart *)&v19 initWithSections:&__NSArray0__struct];
  if (v5)
  {
    if ([v4 emphasis] != (id)4)
    {
      v6 = [[RAPReportComposerCommentSection alloc] initWithQuestion:v4];
      commentSection = v5->_commentSection;
      v5->_commentSection = v6;
    }
    if ([v4 emphasis] != (id)3)
    {
      v8 = [[RAPReportComposerPhotosSection alloc] initWithQuestion:v4];
      photoSection = v5->_photoSection;
      v5->_photoSection = v8;
    }
    switch((unint64_t)[v4 emphasis])
    {
      case 0uLL:
      case 2uLL:
      case 5uLL:
        v24[0] = v5->_commentSection;
        v24[1] = v5->_photoSection;
        v10 = v24;
        goto LABEL_9;
      case 1uLL:
        v23[0] = v5->_photoSection;
        v23[1] = v5->_commentSection;
        v10 = v23;
LABEL_9:
        uint64_t v11 = 2;
        goto LABEL_13;
      case 3uLL:
        v22 = v5->_commentSection;
        v10 = &v22;
        goto LABEL_12;
      case 4uLL:
        v21 = v5->_photoSection;
        v10 = &v21;
LABEL_12:
        uint64_t v11 = 1;
LABEL_13:
        v12 = +[NSArray arrayWithObjects:v10 count:v11];
        [(RAPTablePart *)v5 setSections:v12];

        break;
      default:
        break;
    }
    if ([v4 shouldShowEmail])
    {
      v13 = [[RAPReportComposerEmailSection alloc] initWithQuestion:v4];
      emailSection = v5->_emailSection;
      v5->_emailSection = v13;

      v20 = v5->_emailSection;
      v15 = +[NSArray arrayWithObjects:&v20 count:1];
      v16 = [(RAPTablePart *)v5 sections];
      v17 = [v15 arrayByAddingObjectsFromArray:v16];
      [(RAPTablePart *)v5 setSections:v17];
    }
  }

  return v5;
}

- (void)beginEditingCommentIfPossible
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailSection, 0);
  objc_storeStrong((id *)&self->_photoSection, 0);

  objc_storeStrong((id *)&self->_commentSection, 0);
}

@end