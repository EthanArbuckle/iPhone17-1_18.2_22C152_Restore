@interface OutlineController
- (BOOL)canCollapseAnyUUIDs:(id)a3;
- (BOOL)canExpandAnyUUIDs:(id)a3;
- (BOOL)isAsynchronous;
- (BOOL)isUUIDCollapsed:(id)a3;
- (BOOL)isUUIDCollapsible:(id)a3;
- (BOOL)isUUIDHidden:(id)a3;
- (BOOL)toggleCollapsedAtRange:(_NSRange)a3;
- (ICTTTextStorage)textStorage;
- (NSArray)invisibleRangeValues;
- (NSArray)rangesValuesContainingCollapsedRanges;
- (NSArray)rangesValuesContainingExpandedRanges;
- (NSArray)visibleRangeValues;
- (NSAttributedString)visibleAttributedText;
- (NSSet)collapsedUUIDs;
- (NSSet)interactedUUIDs;
- (NSString)debugDescription;
- (OutlineController)init;
- (OutlineController)initWithTextStorage:(id)a3 collapsedUUIDs:(id)a4 asynchronous:(BOOL)a5;
- (_NSRange)descendantRangeForUUID:(id)a3;
- (_NSRange)rangeForUUID:(id)a3;
- (_NSRange)visibleRange;
- (id)ancestorsForUUID:(id)a3;
- (id)closestVisibleAncestorForUUID:(id)a3;
- (id)descendantsForUUID:(id)a3;
- (int64_t)collapsibleSectionAffordanceUsages;
- (void)collapseAll;
- (void)collapseUUIDs:(id)a3;
- (void)collapsibleSectionAffordanceUsedForUUIDs:(id)a3;
- (void)expandAll;
- (void)expandAncestorsOfRange:(_NSRange)a3;
- (void)expandUUIDs:(id)a3;
- (void)mergingDidEndWithNotification:(id)a3;
- (void)mergingWillBeginWithNotification:(id)a3;
- (void)requestUpdate;
- (void)resetCollapsibleSectionAffordanceUsages;
- (void)setCollapsedUUIDs:(id)a3;
- (void)setInteractedUUIDs:(id)a3;
- (void)setIsAsynchronous:(BOOL)a3;
- (void)textStorageDidProcessEndEditingWithNotification:(id)a3;
- (void)toggleUUIDCollapsed:(id)a3;
- (void)update;
@end

@implementation OutlineController

- (ICTTTextStorage)textStorage
{
  return (ICTTTextStorage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___OutlineController_textStorage));
}

- (NSSet)collapsedUUIDs
{
  swift_beginAccess();
  v3 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5840);
  sub_1B0B8297C();

  swift_release();
  sub_1B0B7FE4C();
  sub_1B0A47254(&qword_1EBBB5708, MEMORY[0x1E4F27990]);
  v4 = (void *)sub_1B0B8272C();
  swift_bridgeObjectRelease();
  return (NSSet *)v4;
}

- (void)setCollapsedUUIDs:(id)a3
{
  sub_1B0B7FE4C();
  sub_1B0A47254(&qword_1EBBB5708, MEMORY[0x1E4F27990]);
  uint64_t v4 = sub_1B0B8273C();
  swift_beginAccess();
  uint64_t v7 = v4;
  v6[2] = &v7;
  v5 = self;
  swift_retain();
  sub_1B0A32918((uint64_t)sub_1B0A464AC, (uint64_t)v6);

  swift_release();
  swift_bridgeObjectRelease();
}

- (NSSet)interactedUUIDs
{
  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5840);
  sub_1B0B8297C();

  swift_release();
  sub_1B0B7FE4C();
  sub_1B0A47254(&qword_1EBBB5708, MEMORY[0x1E4F27990]);
  v3 = (void *)sub_1B0B8272C();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)setInteractedUUIDs:(id)a3
{
  sub_1B0B7FE4C();
  sub_1B0A47254(&qword_1EBBB5708, MEMORY[0x1E4F27990]);
  v5[2] = &v6;
  uint64_t v6 = sub_1B0B8273C();
  uint64_t v4 = self;
  swift_retain();
  sub_1B0A32918((uint64_t)sub_1B0A464AC, (uint64_t)v5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isAsynchronous
{
  v2 = (BOOL *)self + OBJC_IVAR___OutlineController_isAsynchronous;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAsynchronous:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B0A33ED0(a3);
}

- (OutlineController)initWithTextStorage:(id)a3 collapsedUUIDs:(id)a4 asynchronous:(BOOL)a5
{
  sub_1B0B7FE4C();
  sub_1B0A47254(&qword_1EBBB5708, MEMORY[0x1E4F27990]);
  uint64_t v7 = sub_1B0B8273C();
  return (OutlineController *)OutlineController.init(textStorage:collapsedUUIDs:asynchronous:)(a3, v7, a5);
}

- (void)requestUpdate
{
  v3 = (unsigned __int8 *)self + OBJC_IVAR___OutlineController_isAsynchronous;
  swift_beginAccess();
  int v4 = *v3;
  v5 = self;
  if (v4 == 1)
  {
    uint64_t v6 = (OutlineController *)sub_1B0A3DD98();
    [(OutlineController *)v6 requestFire];

    v5 = v6;
  }
  else
  {
    sub_1B0A33F98();
  }
}

- (BOOL)canCollapseAnyUUIDs:(id)a3
{
  return sub_1B0A371F4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1B0A34C9C);
}

- (BOOL)isUUIDCollapsible:(id)a3
{
  return sub_1B0A3A298(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1B0A35B00);
}

- (BOOL)isUUIDCollapsed:(id)a3
{
  uint64_t v4 = sub_1B0B7FE4C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7FE2C();
  swift_beginAccess();
  v8 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5840);
  sub_1B0B8297C();
  swift_release();
  LOBYTE(self) = sub_1B0A34D8C((uint64_t)v7, v10[2]);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return self & 1;
}

- (void)collapseUUIDs:(id)a3
{
}

- (void)toggleUUIDCollapsed:(id)a3
{
  uint64_t v4 = sub_1B0B7FE4C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7FE2C();
  v8 = self;
  sub_1B0A36968((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)collapseAll
{
  v2 = self;
  sub_1B0A36EC0();
}

- (BOOL)canExpandAnyUUIDs:(id)a3
{
  return sub_1B0A371F4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1B0A37110);
}

- (void)expandUUIDs:(id)a3
{
}

- (void)expandAncestorsOfRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = self;
  sub_1B0A376FC(location, length);
}

- (void)expandAll
{
  v2 = self;
  sub_1B0A37DE0();
}

- (void)collapsibleSectionAffordanceUsedForUUIDs:(id)a3
{
}

- (int64_t)collapsibleSectionAffordanceUsages
{
  v2 = self;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5840);
  sub_1B0B8297C();
  swift_release();
  int64_t v3 = *(void *)(v5 + 16);

  swift_bridgeObjectRelease();
  return v3;
}

- (_NSRange)visibleRange
{
  v2 = self;
  uint64_t v3 = sub_1B0A38274();
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (NSArray)visibleRangeValues
{
  return (NSArray *)sub_1B0A38EC0(self, (uint64_t)a2, (void (*)(void))sub_1B0A38C2C);
}

- (NSArray)invisibleRangeValues
{
  return (NSArray *)sub_1B0A38EC0(self, (uint64_t)a2, (void (*)(void))sub_1B0A38F3C);
}

- (NSArray)rangesValuesContainingCollapsedRanges
{
  return (NSArray *)sub_1B0A38EC0(self, (uint64_t)a2, (void (*)(void))sub_1B0A391CC);
}

- (NSArray)rangesValuesContainingExpandedRanges
{
  return (NSArray *)sub_1B0A38EC0(self, (uint64_t)a2, (void (*)(void))sub_1B0A39460);
}

- (NSAttributedString)visibleAttributedText
{
  v2 = self;
  id v3 = sub_1B0A3971C();

  return (NSAttributedString *)v3;
}

- (BOOL)toggleCollapsedAtRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = self;
  LOBYTE(length) = sub_1B0A39990(location, length);

  return length & 1;
}

- (void)resetCollapsibleSectionAffordanceUsages
{
  v3[2] = &v4;
  uint64_t v4 = MEMORY[0x1E4FBC870];
  v2 = self;
  swift_retain();
  sub_1B0A32918((uint64_t)sub_1B0A464AC, (uint64_t)v3);

  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isUUIDHidden:(id)a3
{
  return sub_1B0A3A298(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1B0A3A000);
}

- (_NSRange)rangeForUUID:(id)a3
{
  NSUInteger v3 = sub_1B0A3B2D0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1B0A3A390);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (_NSRange)descendantRangeForUUID:(id)a3
{
  NSUInteger v3 = sub_1B0A3B2D0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1B0A3A9D8);
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (id)closestVisibleAncestorForUUID:(id)a3
{
  uint64_t v4 = sub_1B0B7FE4C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  NSUInteger v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBBB5720);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7FE2C();
  v11 = self;
  sub_1B0A3B3D0((uint64_t)v7, v10);

  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v7, v4);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) != 1)
  {
    v13 = (void *)sub_1B0B7FE0C();
    v12(v10, v4);
  }
  return v13;
}

- (id)ancestorsForUUID:(id)a3
{
  return sub_1B0A3BE98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B0A3BA90);
}

- (id)descendantsForUUID:(id)a3
{
  return sub_1B0A3BE98(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B0A3BC94);
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1B0A3C020();

  NSUInteger v3 = (void *)sub_1B0B823CC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)textStorageDidProcessEndEditingWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1B0A3DF00(v4);
}

- (void)mergingWillBeginWithNotification:(id)a3
{
}

- (void)mergingDidEndWithNotification:(id)a3
{
}

- (void)update
{
  v2 = self;
  sub_1B0A33F98();
}

- (OutlineController)init
{
  _NSRange result = (OutlineController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  NSUInteger v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___OutlineController____lazy_storage___updateQueue);
}

@end