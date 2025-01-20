@interface TTRIRemindersListEditableSectionNameTextView
- (BOOL)canBecomeFocused;
- (_TtC9Reminders44TTRIRemindersListEditableSectionNameTextView)initWithCoder:(id)a3;
@end

@implementation TTRIRemindersListEditableSectionNameTextView

- (BOOL)canBecomeFocused
{
  return [(TTRIRemindersListEditableSectionNameTextView *)self isEditing];
}

- (_TtC9Reminders44TTRIRemindersListEditableSectionNameTextView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIRemindersListEditableSectionNameTextView();
  return [(TTRIRemindersListEditableSectionNameTextView *)&v5 initWithCoder:a3];
}

@end