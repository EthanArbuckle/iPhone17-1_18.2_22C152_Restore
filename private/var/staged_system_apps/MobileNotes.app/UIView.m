@interface UIView
- (id)_icaxKeyboardImpl;
- (void)ic_addCreateNoteInteractionWithFolderHandler:(id)a3;
- (void)ic_addReplaceSelectionInteractionWithTextHandler:(id)a3;
- (void)ic_addSetParagraphStyleInteractionWithStyleHandler:(id)a3;
- (void)ic_annotateWithAccount:(id)a3;
- (void)ic_annotateWithAttachment:(id)a3;
- (void)ic_annotateWithFolder:(id)a3;
- (void)ic_annotateWithNote:(id)a3;
- (void)ic_annotateWithNoteContainer:(id)a3;
- (void)ic_annotateWithTable:(id)a3;
- (void)ic_annotateWithTag:(id)a3;
- (void)ic_removeLinkActionInteractions;
@end

@implementation UIView

- (void)ic_annotateWithNote:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10000C830(a3);
}

- (void)ic_addCreateNoteInteractionWithFolderHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_10002B9EC;
  *(void *)(v6 + 24) = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction());
  sub_100035308();
  v8 = self;
  swift_retain();
  id v9 = (id)UIAppIntentInteraction.init<A>(intent:perform:)();
  [(UIView *)v8 addInteraction:v9];

  swift_release();
}

- (void)ic_addReplaceSelectionInteractionWithTextHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1001A36CC;
  *(void *)(v6 + 24) = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction());
  sub_1000344C0();
  v8 = self;
  swift_retain();
  id v9 = (id)UIAppIntentInteraction.init<A>(intent:perform:)();
  [(UIView *)v8 addInteraction:v9];

  swift_release();
}

- (void)ic_addSetParagraphStyleInteractionWithStyleHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1001A36CC;
  *(void *)(v6 + 24) = v5;
  id v7 = objc_allocWithZone((Class)type metadata accessor for UIAppIntentInteraction());
  sub_1000342B8();
  v8 = self;
  swift_retain();
  id v9 = (id)UIAppIntentInteraction.init<A>(intent:perform:)();
  [(UIView *)v8 addInteraction:v9];

  swift_release();
}

- (void)ic_annotateWithAttachment:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_100018DB4(a3);
}

- (id)_icaxKeyboardImpl
{
  NSClassFromString(@"UIKeyboardImpl");
  if (objc_opt_isKindOfClass())
  {
    v3 = self;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = [(UIView *)self subviews];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) _icaxKeyboardImpl];
          if (v9)
          {
            v3 = (UIView *)v9;

            goto LABEL_13;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    v3 = 0;
  }
LABEL_13:

  return v3;
}

- (void)ic_removeLinkActionInteractions
{
  v2 = self;
  sub_1004A3E54();
}

- (void)ic_annotateWithFolder:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1004A3FE4(a3);
}

- (void)ic_annotateWithAccount:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1004A4280(a3);
}

- (void)ic_annotateWithNoteContainer:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1004A451C((uint64_t)a3);
}

- (void)ic_annotateWithTag:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1004A46F8(a3);
}

- (void)ic_annotateWithTable:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1004A497C(a3);
}

@end