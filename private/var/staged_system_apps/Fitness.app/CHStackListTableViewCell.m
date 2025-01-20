@interface CHStackListTableViewCell
- (CHStackListTableViewCell)initWithCoder:(id)a3;
- (CHStackListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation CHStackListTableViewCell

- (CHStackListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (CHStackListTableViewCell *)sub_10038CF88(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  uint64_t v3 = sub_1000AFA94(&qword_100950DA8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (objc_class *)type metadata accessor for StackListTableViewCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(CHStackListTableViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for FitnessPlusStackViewModel();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR___CHStackListTableViewCell_fitnessPlusStackViewModel;
  swift_beginAccess();
  sub_1003604E0((uint64_t)v5, v9);
  swift_endAccess();
  [*(id *)((char *)&v7->super.super.super.super.isa + OBJC_IVAR___CHStackListTableViewCell_iconImageView) setImage:0];
}

- (CHStackListTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10038F754();
}

- (void).cxx_destruct
{
  sub_10008DB18((uint64_t)self + OBJC_IVAR___CHStackListTableViewCell_fitnessPlusStackViewModel, &qword_100950DA8);

  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CHStackListTableViewCell_dateLabel);
}

@end