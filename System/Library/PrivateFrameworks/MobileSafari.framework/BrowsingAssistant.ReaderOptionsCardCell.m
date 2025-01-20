@interface BrowsingAssistant.ReaderOptionsCardCell
- (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell)initWithCoder:(id)a3;
- (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell)initWithFrame:(CGRect)a3;
- (void)fontDownloadDidFail:(id)a3;
- (void)fontDownloadDidUpdate:(id)a3;
- (void)hideReader:(id)a3;
- (void)listenToPage:(id)a3;
- (void)reloadFonts;
- (void)updateTheme;
- (void)userDidChangeTheme:(id)a3;
@end

@implementation BrowsingAssistant.ReaderOptionsCardCell

- (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C6A90C8();
}

- (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell *)sub_18C6A587C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateTheme
{
  v2 = self;
  sub_18C6A6B1C();
}

- (void)userDidChangeTheme:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18C6A6C1C((uint64_t)v4);
}

- (void)reloadFonts
{
  v2 = self;
  sub_18C6A7370();
}

- (void)fontDownloadDidUpdate:(id)a3
{
  uint64_t v4 = sub_18C6F7FE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F7FB8();
  v8 = self;
  sub_18C6A7370();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)fontDownloadDidFail:(id)a3
{
  uint64_t v4 = sub_18C6F7FE8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F7FB8();
  v8 = self;
  sub_18C6A8474();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)listenToPage:(id)a3
{
}

- (void)hideReader:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_themePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_fontPicker));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_listenToPageButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_hideReaderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_listenToPageAction));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant21ReaderOptionsCardCell_hideReaderAction);
}

@end