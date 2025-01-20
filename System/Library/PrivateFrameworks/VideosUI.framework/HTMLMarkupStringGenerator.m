@interface HTMLMarkupStringGenerator
- (_TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidFindNewline:(id)a3;
@end

@implementation HTMLMarkupStringGenerator

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator_parser));
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator_logger;
  uint64_t v4 = sub_1E3877538();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator_accumulator));
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  uint64_t v6 = sub_1E387C928();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1E2C9DFF4(v6, v8);

  swift_bridgeObjectRelease();
}

- (_TtC8VideosUIP33_70C0F06A93052F168F0C06E79A36531E25HTMLMarkupStringGenerator)init
{
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_1E2F8A3C0(v8);
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1E2F8A5D0(a4);
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1E2F8A6F0();
}

- (void)parserDidFindNewline:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E2F8A7DC();
}

@end