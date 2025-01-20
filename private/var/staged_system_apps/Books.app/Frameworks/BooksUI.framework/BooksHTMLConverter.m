@interface BooksHTMLConverter
- (_TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter)init;
- (void)parser:(id)a3 didEndElement:(unint64_t)a4;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidFindNewline:(id)a3;
@end

@implementation BooksHTMLConverter

- (_TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter)init
{
  result = (_TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_parser));
  v3 = (char *)self + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_currentString;
  uint64_t v4 = sub_2695D0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)parser:(id)a3 didStartElement:(unint64_t)a4 attributes:(id)a5
{
  type metadata accessor for NQMLAttributeName(0);
  sub_1C09D0();
  uint64_t v8 = sub_26D240();
  id v9 = a3;
  v10 = self;
  sub_1BFB44(a4, v8);

  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didEndElement:(unint64_t)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC7BooksUIP33_E4697B72F90B920AD6B6858623E47B6D18BooksHTMLConverter_tagStack;
  swift_beginAccess();
  if (*(void *)(*(void *)v6 + 16))
  {
    id v7 = a3;
    uint64_t v8 = self;
    sub_1BFADC();
    if (v9 == 1) {
      sub_1BF9EC(*(void *)(*(void *)v6 + 16) - 1);
    }
    swift_endAccess();

    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_26D430();
  id v6 = a3;
  id v7 = self;
  sub_1BFD30();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  uint64_t v5 = sub_2695D0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  sub_2695A0();
  swift_beginAccess();
  sub_2695C0();
  swift_endAccess();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_1C03B4();
}

@end