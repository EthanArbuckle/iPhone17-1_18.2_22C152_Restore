@interface PUStoryColorGradeEditorItemOverlayLayout
- (NSIndexSet)axSelectedSpriteIndexes;
- (PUStoryColorGradeEditorItemOverlayLayout)init;
- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)axContentInfoAtSpriteIndex:(unsigned int)a3;
- (id)axSpriteIndexes;
- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)hitTestResultForSpriteIndex:(unsigned int)a3;
- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)objectReferenceForSpriteIndex:(unsigned int)a3;
- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4;
- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5;
- (void)displayScaleDidChange;
- (void)referenceSizeDidChange;
- (void)update;
- (void)viewEnvironmentDidChange;
@end

@implementation PUStoryColorGradeEditorItemOverlayLayout

- (void)update
{
  v2 = self;
  sub_1AEB89960();
}

- (void)referenceSizeDidChange
{
  v2 = self;
  sub_1AEB89B24();
}

- (void)displayScaleDidChange
{
  v2 = self;
  sub_1AEB89BC4(0, type metadata accessor for StoryColorGradeEditorItemLayout.OverlayLayout, (SEL *)&selRef_displayScaleDidChange, (uint64_t (*)(id))sub_1AEB89AA0);
}

- (void)viewEnvironmentDidChange
{
  v2 = self;
  sub_1AEB89C94();
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  sub_1AEB89D64(a3, v11);
  uint64_t v3 = v12;
  if (v12)
  {
    v4 = __swift_project_boxed_opaque_existential_0Tm(v11, v12);
    uint64_t v5 = *(void *)(v3 - 8);
    __n128 v6 = MEMORY[0x1F4188790](v4);
    v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v5 + 16))(v8, v6);
    v9 = (void *)sub_1AEF97E10();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v3);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v11);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AEF97980();
  swift_unknownObjectRelease();
  LODWORD(a5) = sub_1AEB89EEC(v10, a4, a5);

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v10);
  return a5;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = self;
  id v5 = sub_1AEB8A834(v3);

  return v5;
}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  sub_1AEB8A8D8(a3);

  v8 = (void *)sub_1AEF96DA0();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  uint64_t v8 = sub_1AEB8A9E4(a3);

  if (v8)
  {
    type metadata accessor for Key(0);
    sub_1AEAB1648();
    v9 = (void *)sub_1AEF96C80();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return sub_1AEB8ABF0(a3);
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  v4 = (void *)sub_1AEB8AC80(a3);
  return v4;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = sub_1AEB8AD20(a3);

  return v8;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6 = a4;
  uint64_t v7 = self;
  id v8 = sub_1AEB8AEA0(a3);

  return v8;
}

- (id)axSpriteIndexes
{
  uint64_t v0 = sub_1AEF93960();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790](v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AEB8B0D8((uint64_t)v3);
  v4 = (void *)sub_1AEF93900();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = self;
  id v5 = sub_1AEB8B1BC(v3);

  return v5;
}

- (NSIndexSet)axSelectedSpriteIndexes
{
  uint64_t v3 = sub_1AEF93960();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  sub_1AEB8B4C8((uint64_t)v6);

  id v8 = (void *)sub_1AEF93900();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSIndexSet *)v8;
}

- (PUStoryColorGradeEditorItemOverlayLayout)init
{
}

- (void).cxx_destruct
{
  sub_1AEA06AB8((uint64_t)self + OBJC_IVAR___PUStoryColorGradeEditorItemOverlayLayout_accessibleSpriteIndexes, &qword_1E9A9B1B0);
}

@end