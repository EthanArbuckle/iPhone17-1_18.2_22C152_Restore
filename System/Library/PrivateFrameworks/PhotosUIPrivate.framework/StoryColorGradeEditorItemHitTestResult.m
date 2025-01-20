@interface StoryColorGradeEditorItemHitTestResult
- (_TtC15PhotosUIPrivate38StoryColorGradeEditorItemHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6;
@end

@implementation StoryColorGradeEditorItemHitTestResult

- (_TtC15PhotosUIPrivate38StoryColorGradeEditorItemHitTestResult)initWithSpriteReference:(id)a3 layout:(id)a4 identifier:(id)a5 userDataProvider:(id)a6
{
  v9 = _Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_1AEAD28BC;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  return (_TtC15PhotosUIPrivate38StoryColorGradeEditorItemHitTestResult *)sub_1AEAD2600(v11, a4, a5, (uint64_t)v9, v10);
}

@end