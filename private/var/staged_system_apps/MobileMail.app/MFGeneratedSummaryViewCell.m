@interface MFGeneratedSummaryViewCell
- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3;
- (ConversationCellViewModel)viewModel;
- (MFGeneratedSummaryViewCell)initWithCoder:(id)a3;
- (MFGeneratedSummaryViewCell)initWithFrame:(CGRect)a3;
- (MFGeneratedSummaryViewCellDelegate)delegate;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)_displayMetricsDidChange;
- (void)prepareForReuse;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation MFGeneratedSummaryViewCell

- (MFGeneratedSummaryViewCellDelegate)delegate
{
  v2 = self;
  id v5 = (id)GeneratedSummaryViewCell.delegate.getter();

  return (MFGeneratedSummaryViewCellDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  GeneratedSummaryViewCell.delegate.setter();
}

- (ConversationCellViewModel)viewModel
{
  v2 = self;
  id v5 = GeneratedSummaryViewCell.viewModel.getter();

  return (ConversationCellViewModel *)v5;
}

- (void)setViewModel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  GeneratedSummaryViewCell.viewModel.setter(a3);
}

- (MFGeneratedSummaryViewCell)initWithFrame:(CGRect)a3
{
  return (MFGeneratedSummaryViewCell *)sub_1002C1398(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MFGeneratedSummaryViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002C1C60();
}

- (void)_displayMetricsDidChange
{
  v2 = self;
  GeneratedSummaryViewCell._displayMetricsDidChange()();
}

- (void)prepareForReuse
{
  v2 = self;
  GeneratedSummaryViewCell.prepareForReuse()();
}

- (BOOL)canBeginDragWithTouchAtPoint:(CGPoint)a3
{
  id v3 = self;
  GeneratedSummaryViewCell.canBeginDragWithTouch(at:)();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  id v5 = self;
  Class isa = GeneratedSummaryViewCell.preferredLayoutAttributesFitting(_:)((UICollectionViewLayoutAttributes)a3).super.isa;

  return isa;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v8.value.super.super.super.Class isa = (Class)a3;
  GeneratedSummaryViewCell.willMove(toWindow:)(v8);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___MFGeneratedSummaryViewCell_summaryContext));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___MFGeneratedSummaryViewCell_summaryView));
  sub_100287934();
}

@end