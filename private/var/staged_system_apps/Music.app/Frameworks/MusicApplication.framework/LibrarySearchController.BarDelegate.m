@interface LibrarySearchController.BarDelegate
- (_TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate)init;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarCancelButtonClicked:(id)a3;
- (void)searchBarTextDidBeginEditing:(id)a3;
- (void)searchBarTextDidEndEditing:(id)a3;
@end

@implementation LibrarySearchController.BarDelegate

- (void)searchBarTextDidBeginEditing:(id)a3
{
}

- (void)searchBarTextDidEndEditing:(id)a3
{
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v7 = sub_AB6510();
  v8 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_text);
  uint64_t *v8 = v7;
  v8[1] = v9;
  id v10 = a3;
  id v11 = a4;
  v13 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = *(void (**)(_TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate *))((char *)&v13->super.isa + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_textDidChange);
  if (v12)
  {
    swift_retain();
    v12(v13);
    sub_1A528((uint64_t)v12);
  }

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_477CE0(v4);
}

- (_TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_text);
  void *v3 = 0;
  v3[1] = 0;
  id v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_didBeginEditing);
  *id v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_didEndEditing);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_textDidChange);
  void *v6 = 0;
  v6[1] = 0;
  uint64_t v7 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_didCancel);
  v8 = (objc_class *)type metadata accessor for LibrarySearchController.BarDelegate();
  *uint64_t v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(LibrarySearchController.BarDelegate *)&v10 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_didBeginEditing));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_didEndEditing));
  sub_1A528(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_textDidChange));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCC16MusicApplication23LibrarySearchControllerP33_74DC0E8E86C2700EAF59346E7D7979E311BarDelegate_didCancel);

  sub_1A528(v3);
}

@end