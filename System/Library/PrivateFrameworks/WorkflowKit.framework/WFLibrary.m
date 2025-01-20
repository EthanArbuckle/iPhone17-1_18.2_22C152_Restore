@interface WFLibrary
+ (void)performWithoutNotifyingObservers:(id)a3 error:(id *)a4;
- (BOOL)addShortcutWithIdentifier:(id)a3 toCollectionWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)appendShortcutWithIdentifier:(id)a3 toFolder:(id)a4 error:(id *)a5;
- (BOOL)deleteFolderWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)insertShortcutWithIdentifier:(id)a3 atIndex:(int64_t)a4 toCollection:(id)a5 error:(id *)a6;
- (BOOL)mergeWithOther:(id)a3 error:(id *)a4;
- (BOOL)moveFolders:(id)a3 toIndexes:(id)a4 error:(id *)a5;
- (BOOL)moveShortcutWithIdentifier:(id)a3 toFolder:(id)a4 error:(id *)a5;
- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(int64_t)a4 ofCollectionWithIdentifier:(id)a5 error:(id *)a6;
- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(int64_t)a4 ofFolderWithIdentifier:(id)a5 error:(id *)a6;
- (BOOL)removeShortcutWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeShortcutWithIdentifier:(id)a3 fromCollectionWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setShortcutOrdering:(id)a3 forCollectionIdentifier:(id)a4 error:(id *)a5;
- (BOOL)setShortcutOrdering:(id)a3 forFolderIdentifier:(id)a4 error:(id *)a5;
- (BOOL)tombstoneFolderWithIdentifier:(id)a3 error:(id *)a4;
- (NSArray)collections;
- (NSArray)folders;
- (NSArray)shortcutIdentifiers;
- (NSString)dotRepresentation;
- (NSString)identifier;
- (NSString)version;
- (WFLibrary)init;
- (WFLibrary)initWithIdentifier:(id)a3 version:(id)a4;
- (WFLibrary)initWithIdentifier:(id)a3 version:(id)a4 data:(id)a5;
- (id)capsuleDataWithError:(id *)a3;
- (id)collectionAndFolderIdentifiersContainingShortcut:(id)a3 error:(id *)a4;
- (id)collectionWithIdentifier:(id)a3;
- (id)collectionWithWorkflowType:(id)a3;
- (id)collectionsAndFoldersContainingShortcut:(id)a3 error:(id *)a4;
- (id)collectionsContainingShortcut:(id)a3;
- (id)folderContainingShortcut:(id)a3 error:(id *)a4;
- (id)folderWithIdentifier:(id)a3 error:(id *)a4;
- (id)folderWithName:(id)a3 tombstoned:(BOOL)a4;
- (id)indexOfShortcutWithIdentifier:(id)a3 inCollectionWithIdentifier:(id)a4 error:(id *)a5;
- (id)indexOfShortcutWithShortcut:(id)a3 folderIdentifier:(id)a4 error:(id *)a5;
- (id)insertFolderWithName:(id)a3 icon:(unsigned __int16)a4 identifier:(id)a5 error:(id *)a6;
- (id)shortcutIdentifiersWithQuery:(id)a3 error:(id *)a4;
- (id)shortcutsInFolderWithIdentifier:(id)a3 error:(id *)a4;
- (id)updateFolderWithIdentifier:(id)a3 newName:(id)a4 newIcon:(unsigned __int16)a5 error:(id *)a6;
- (void)insertShortcutWithId:(id)a3;
- (void)overwriteShortcutsAndFolders:(id)a3 folders:(id)a4;
- (void)prependShortcutWithId:(id)a3;
@end

@implementation WFLibrary

- (NSString)dotRepresentation
{
  v2 = self;
  Library.dotRepresentation.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1C8532618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)collections
{
  v2 = self;
  Library.collections.getter();

  sub_1C7F42470(0, (unint64_t *)&qword_1EA5161F0);
  uint64_t v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (BOOL)addShortcutWithIdentifier:(id)a3 toCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  return sub_1C800B77C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.addShortcut(identifier:toCollectionWithIdentifier:));
}

- (BOOL)insertShortcutWithIdentifier:(id)a3 atIndex:(int64_t)a4 toCollection:(id)a5 error:(id *)a6
{
  return sub_1C800B90C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Library.insertShortcut(identifier:atIndex:toCollection:));
}

- (BOOL)removeShortcutWithIdentifier:(id)a3 fromCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  return sub_1C800B77C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.removeShortcut(identifier:fromCollectionWithIdentifier:));
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(int64_t)a4 ofCollectionWithIdentifier:(id)a5 error:(id *)a6
{
  return sub_1C800B90C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))Library.moveShortcut(identifier:toIndex:ofCollectionWithIdentifier:));
}

- (id)collectionsAndFoldersContainingShortcut:(id)a3 error:(id *)a4
{
  sub_1C8532658();
  v5 = self;
  Library.collectionsAndFoldersContaining(shortcut:)();
  swift_bridgeObjectRelease();

  sub_1C7F42470(0, (unint64_t *)&qword_1EA5161F0);
  v6 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)collectionAndFolderIdentifiersContainingShortcut:(id)a3 error:(id *)a4
{
  sub_1C8532658();
  v5 = self;
  Library.collectionAndFolderIdentifiersContaining(shortcut:)();
  swift_bridgeObjectRelease();

  v6 = (void *)sub_1C8532A28();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)collectionsContainingShortcut:(id)a3
{
  uint64_t v4 = sub_1C8532658();
  uint64_t v6 = v5;
  v7 = self;
  Library.collectionsContaining(shortcut:)(v4, v6);

  swift_bridgeObjectRelease();
  sub_1C7F42470(0, (unint64_t *)&qword_1EA5161F0);
  v8 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionWithWorkflowType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = (void *)Library.collection(workflowType:)(v4);

  return v6;
}

- (id)collectionWithIdentifier:(id)a3
{
  uint64_t v4 = sub_1C8532658();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)Library.collection(identifier:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)indexOfShortcutWithIdentifier:(id)a3 inCollectionWithIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1C8532658();
  v9 = v8;
  uint64_t v10 = sub_1C8532658();
  v12 = v11;
  v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  v16.super.super.isa = Library.indexOfShortcut(identifier:inCollectionWithIdentifier:)(v14, v15).super.super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v17.super.super.isa)
  {
    if (a5)
    {
      v18 = (void *)sub_1C8530048();

      id v19 = v18;
      v16.super.super.isa = 0;
      *a5 = v18;
    }
    else
    {

      v16.super.super.isa = 0;
    }
  }
  return v16.super.super.isa;
}

- (BOOL)setShortcutOrdering:(id)a3 forCollectionIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1C8532838();
  uint64_t v8 = sub_1C8532658();
  uint64_t v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  Library.setShortcutOrdering(_:forCollectionIdentifier:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      Swift::String v14 = (void *)sub_1C8530048();

      id v15 = v14;
      *a5 = v14;
    }
    else
    {
    }
  }
  return v13 == 0;
}

- (NSString)version
{
  return (NSString *)sub_1C8067F28((uint64_t)self, (uint64_t)a2, (void (*)(void))Library.version.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_1C8067F28((uint64_t)self, (uint64_t)a2, (void (*)(void))Library.identifier.getter);
}

- (WFLibrary)initWithIdentifier:(id)a3 version:(id)a4 data:(id)a5
{
  sub_1C8532658();
  sub_1C8532658();
  id v6 = a5;
  sub_1C8530128();

  return (WFLibrary *)Library.init(identifier:version:data:)();
}

- (WFLibrary)initWithIdentifier:(id)a3 version:(id)a4
{
  return (WFLibrary *)Library.init(identifier:version:)();
}

- (void)overwriteShortcutsAndFolders:(id)a3 folders:(id)a4
{
  uint64_t v5 = sub_1C8532838();
  type metadata accessor for LibraryCollection();
  unint64_t v6 = sub_1C8532838();
  uint64_t v7 = self;
  sub_1C806831C(v5, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)capsuleDataWithError:(id *)a3
{
  uint64_t v3 = self;
  uint64_t v4 = sub_1C80686F8();
  unint64_t v6 = v5;

  uint64_t v7 = (void *)sub_1C8530118();
  sub_1C7F76230(v4, v6);
  return v7;
}

- (BOOL)mergeWithOther:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  sub_1C8068814(v5);

  return 1;
}

+ (void)performWithoutNotifyingObservers:(id)a3 error:(id *)a4
{
  id v5 = _Block_copy(a3);
  v6[2] = v5;
  sub_1C806893C((uint64_t)sub_1C806AA5C, (uint64_t)v6, a4);
  _Block_release(v5);
}

- (WFLibrary)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSArray)folders
{
  v2 = self;
  Library.folders.getter();

  sub_1C8120CD0();
  uint64_t v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)folderWithName:(id)a3 tombstoned:(BOOL)a4
{
  uint64_t v6 = sub_1C8532658();
  uint64_t v8 = v7;
  v9 = self;
  uint64_t v10 = (void *)Library.folderWithName(_:tombstoned:)(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)insertFolderWithName:(id)a3 icon:(unsigned __int16)a4 identifier:(id)a5 error:(id *)a6
{
  uint64_t v6 = a4;
  uint64_t v8 = sub_1C8532658();
  uint64_t v10 = v9;
  uint64_t v11 = sub_1C8532658();
  uint64_t v13 = v12;
  Swift::String v14 = self;
  id v15 = (void *)Library.insertFolder(name:icon:identifier:)(v8, v10, v6, v11, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v15;
}

- (BOOL)deleteFolderWithIdentifier:(id)a3 error:(id *)a4
{
  return sub_1C811FFCC();
}

- (id)updateFolderWithIdentifier:(id)a3 newName:(id)a4 newIcon:(unsigned __int16)a5 error:(id *)a6
{
  sub_1C8532658();
  sub_1C8532658();
  uint64_t v7 = self;
  uint64_t v8 = (void *)Library.update(folderWithIdentifier:newName:newIcon:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v8;
}

- (BOOL)appendShortcutWithIdentifier:(id)a3 toFolder:(id)a4 error:(id *)a5
{
  return sub_1C811F964(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.appendShortcut(identifier:toFolder:));
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toFolder:(id)a4 error:(id *)a5
{
  return sub_1C811F964(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))Library.moveShortcut(identifier:toFolder:));
}

- (BOOL)moveShortcutWithIdentifier:(id)a3 toIndex:(int64_t)a4 ofFolderWithIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_1C8532658();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1C8532658();
  Swift::String v14 = v13;
  id v15 = self;
  v16._countAndFlagsBits = v9;
  v16._object = v11;
  v17._countAndFlagsBits = v12;
  v17._object = v14;
  Library.moveShortcut(identifier:toIndex:ofFolderWithIdentifier:)(v16, a4, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v18)
  {
    if (a6)
    {
      id v19 = (void *)sub_1C8530048();

      id v20 = v19;
      *a6 = v19;
    }
    else
    {
    }
  }
  return v18 == 0;
}

- (BOOL)setShortcutOrdering:(id)a3 forFolderIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1C8532838();
  uint64_t v8 = sub_1C8532658();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  Library.setShortcutOrdering(_:forFolderIdentifier:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      Swift::String v14 = (void *)sub_1C8530048();

      id v15 = v14;
      *a5 = v14;
    }
    else
    {
    }
  }
  return v13 == 0;
}

- (BOOL)tombstoneFolderWithIdentifier:(id)a3 error:(id *)a4
{
  return sub_1C811FFCC();
}

- (id)shortcutsInFolderWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1C8532658();
  uint64_t v7 = v6;
  uint64_t v8 = self;
  Library.shortcuts(inFolderWithIdentifier:)(v5, v7);
  swift_bridgeObjectRelease();

  uint64_t v9 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v9;
}

- (id)folderContainingShortcut:(id)a3 error:(id *)a4
{
  return sub_1C8120560();
}

- (id)folderWithIdentifier:(id)a3 error:(id *)a4
{
  return sub_1C8120560();
}

- (BOOL)moveFolders:(id)a3 toIndexes:(id)a4 error:(id *)a5
{
  sub_1C8120CD0();
  uint64_t v8 = sub_1C8532838();
  uint64_t v9 = (NSIndexSet *)a4;
  uint64_t v10 = self;
  Library.moveFolders(_:toIndexes:)((Swift::OpaquePointer)v8, v9);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a5)
    {
      Swift::String v12 = (void *)sub_1C8530048();

      id v13 = v12;
      *a5 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (id)indexOfShortcutWithShortcut:(id)a3 folderIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1C8532658();
  uint64_t v9 = v8;
  uint64_t v10 = sub_1C8532658();
  Swift::String v12 = v11;
  id v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  v16.super.super.isa = Library.indexOfShortcut(shortcut:folderIdentifier:)(v14, v15).super.super.isa;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v17.super.super.isa)
  {
    if (a5)
    {
      v18 = (void *)sub_1C8530048();

      id v19 = v18;
      v16.super.super.isa = 0;
      *a5 = v18;
    }
    else
    {

      v16.super.super.isa = 0;
    }
  }
  return v16.super.super.isa;
}

- (NSArray)shortcutIdentifiers
{
  v2 = self;
  Library.shortcutIdentifiers.getter();

  uint64_t v3 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)prependShortcutWithId:(id)a3
{
}

- (void)insertShortcutWithId:(id)a3
{
}

- (BOOL)removeShortcutWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_1C8532658();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  Library.remove(shortcutWithIdentifier:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      Swift::String v12 = (void *)sub_1C8530048();

      id v13 = v12;
      *a4 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (id)shortcutIdentifiersWithQuery:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  Library.shortcutIdentifiers(query:)(v5);

  uint64_t v7 = (void *)sub_1C8532828();
  swift_bridgeObjectRelease();
  return v7;
}

@end