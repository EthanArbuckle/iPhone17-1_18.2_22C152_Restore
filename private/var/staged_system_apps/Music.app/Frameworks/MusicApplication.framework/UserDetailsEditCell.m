@interface UserDetailsEditCell
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)name;
- (NSString)nickname;
- (_TtC16MusicApplication19UserDetailsEditCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication19UserDetailsEditCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setName:(id)a3;
- (void)setNickname:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UserDetailsEditCell

- (_TtC16MusicApplication19UserDetailsEditCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19UserDetailsEditCell *)sub_1368D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19UserDetailsEditCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1389A4();
}

- (NSString)name
{
  return (NSString *)sub_136E90(self, (uint64_t)a2, (uint64_t (*)(void))sub_1380B8);
}

- (void)setName:(id)a3
{
  sub_AB6510();
  id v5 = a3;
  v6 = self;
  id v7 = sub_1380B8();
  id v8 = sub_AB64D0();
  [v7 setText:v8];

  swift_bridgeObjectRelease();
}

- (NSString)nickname
{
  return (NSString *)sub_136E90(self, (uint64_t)a2, (uint64_t (*)(void))sub_1380D8);
}

- (void)setNickname:(id)a3
{
  uint64_t v5 = sub_AB6510();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = self;
  id v10 = sub_1380D8();
  NSString v11 = sub_AB64D0();
  [v10 setText:v11];

  sub_138664(v5, v7);

  swift_bridgeObjectRelease();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UserDetailsEditCell();
  id v2 = v3.receiver;
  [(UserDetailsEditCell *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 layoutSubviews];
}

- (BOOL)becomeFirstResponder
{
  id v2 = self;
  id v3 = sub_1380B8();
  unsigned __int8 v4 = [v3 becomeFirstResponder];

  return v4;
}

- (BOOL)resignFirstResponder
{
  id v2 = self;
  id v3 = sub_1380B8();
  unsigned __int8 v4 = [v3 resignFirstResponder];

  if (v4)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unint64_t v6 = (_TtC16MusicApplication19UserDetailsEditCell *)sub_1380D8();
    unsigned __int8 v5 = [(UserDetailsEditCell *)v6 resignFirstResponder];

    id v2 = v6;
  }

  return v5;
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_137120();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_1377B8((uint64_t)a3);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v10 = sub_AB6510();
  unint64_t v12 = v11;
  id v13 = a3;
  id v14 = a5;
  v15 = self;
  LOBYTE(length) = sub_137C28(v13, location, length, v10, v12);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell_editDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell_validationRule));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nicknameTextField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___divider));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nicknamePrefixLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nameTextFieldTitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication19UserDetailsEditCell____lazy_storage___nicknameTextFieldTitleLabel);
}

@end