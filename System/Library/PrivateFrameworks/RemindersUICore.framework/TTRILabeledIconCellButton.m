@interface TTRILabeledIconCellButton
- (BOOL)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent;
- (_TtC15RemindersUICoreP33_477181F179A9CC91739A5D360525B70925TTRILabeledIconCellButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICoreP33_477181F179A9CC91739A5D360525B70925TTRILabeledIconCellButton)initWithFrame:(CGRect)a3;
@end

@implementation TTRILabeledIconCellButton

- (BOOL)ttriAccessibilityShouldUseViewHierarchyForFindingScrollParent
{
  return 1;
}

- (_TtC15RemindersUICoreP33_477181F179A9CC91739A5D360525B70925TTRILabeledIconCellButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRILabeledIconCellButton();
  return -[TTRILabeledIconCellButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICoreP33_477181F179A9CC91739A5D360525B70925TTRILabeledIconCellButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRILabeledIconCellButton();
  return [(TTRILabeledIconCellButton *)&v5 initWithCoder:a3];
}

@end