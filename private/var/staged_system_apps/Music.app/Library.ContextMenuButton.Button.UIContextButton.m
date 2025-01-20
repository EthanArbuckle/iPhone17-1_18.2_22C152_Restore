@interface Library.ContextMenuButton.Button.UIContextButton
- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)init;
- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)initWithCoder:(id)a3;
- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)layoutSubviews;
@end

@implementation Library.ContextMenuButton.Button.UIContextButton

- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)init
{
  return (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *)sub_100576270();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100576AA0();
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_100579D64();

  return v7;
}

- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_menuProvider);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = (char *)self
     + OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_preferredVisualSize;
  *(void *)id v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  id v6 = a3;

  result = (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton)initWithFrame:(CGRect)a3
{
  result = (_TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtCVVE5MusicO9MusicCore7Library17ContextMenuButtonP33_D5F4B96DB6B3519CEF4067078A2950BC6Button15UIContextButton_menuProvider));
}

@end