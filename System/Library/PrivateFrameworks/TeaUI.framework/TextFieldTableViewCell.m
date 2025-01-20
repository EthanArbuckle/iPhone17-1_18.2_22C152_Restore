@interface TextFieldTableViewCell
- (_TtC5TeaUI22TextFieldTableViewCell)initWithCoder:(id)a3;
- (_TtC5TeaUI22TextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TextFieldTableViewCell

- (_TtC5TeaUI22TextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1B61B20F0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  return (_TtC5TeaUI22TextFieldTableViewCell *)sub_1B5F9A8D8(v4, v4, v6);
}

- (_TtC5TeaUI22TextFieldTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B5F9AB00();
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B5F9ABB4(v4);
}

- (void).cxx_destruct
{
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI22TextFieldTableViewCell_onChange));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI22TextFieldTableViewCell_textField);
}

@end