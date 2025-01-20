@interface JSSettingsViewController.EditNameTextFieldAlert
- (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert)initWithCoder:(id)a3;
- (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert)initWithNibName:(id)a3 bundle:(id)a4;
- (void)textFieldDidChange:(id)a3;
@end

@implementation JSSettingsViewController.EditNameTextFieldAlert

- (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_doneAction) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_currentName);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_431D10(v4);
}

- (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_doneAction));

  swift_bridgeObjectRelease();
}

@end