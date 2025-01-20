@interface MathNotesUpdateSafeAreaInsetsAction
- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)init;
- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithCoder:(id)a3;
- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithInfo:(id)a3 responder:(id)a4;
- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithXPCDictionary:(id)a3;
- (void)performActionForSceneController:(id)a3;
@end

@implementation MathNotesUpdateSafeAreaInsetsAction

- (void)performActionForSceneController:(id)a3
{
  id v4 = a3;
  v5 = self;
  MathNotesUpdateSafeAreaInsetsAction.performAction(forSceneController:)(v4);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithInfo:(id)a3 responder:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(MathNotesUpdateSafeAreaInsetsAction *)&v7 initWithInfo:a3 responder:a4];
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_257DA4928;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a5;
  return (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *)MathNotesUpdateSafeAreaInsetsAction.init(info:timeout:forResponseOn:withHandler:)(a3, a5, (uint64_t)v9, v10, a4);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(MathNotesUpdateSafeAreaInsetsAction *)&v3 init];
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithXPCDictionary:(id)a3
{
  return (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *)sub_257DA0F18(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithXPCDictionary_);
}

- (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction)initWithCoder:(id)a3
{
  return (_TtC15NotesUIServices35MathNotesUpdateSafeAreaInsetsAction *)sub_257DA0F18(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

@end