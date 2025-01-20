@interface ASRAlternativesBehaviour
- (BOOL)handleTapWithRecognizer:(id)a3;
- (_TtC17SequoiaTranslator24ASRAlternativesBehaviour)init;
- (void)asrAlternativeSelectedWithIndex:(int64_t)a3;
- (void)dealloc;
- (void)menuDidHideWithSender:(id)a3;
@end

@implementation ASRAlternativesBehaviour

- (_TtC17SequoiaTranslator24ASRAlternativesBehaviour)init
{
  return (_TtC17SequoiaTranslator24ASRAlternativesBehaviour *)sub_100011B18();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ASRAlternativesBehaviour();
  [(ASRAlternativesBehaviour *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24ASRAlternativesBehaviour_delegate);
  v3 = *(void **)&self->currentAlternatives[OBJC_IVAR____TtC17SequoiaTranslator24ASRAlternativesBehaviour_currentAlternatives];
}

- (BOOL)handleTapWithRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_1000126F8(v4);

  return self & 1;
}

- (void)asrAlternativeSelectedWithIndex:(int64_t)a3
{
  id v4 = self;
  sub_100012854(a3);
}

- (void)menuDidHideWithSender:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100012A14();

  sub_10000AB68((uint64_t)&v5);
}

@end