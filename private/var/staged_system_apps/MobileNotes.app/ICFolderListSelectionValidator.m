@interface ICFolderListSelectionValidator
- (BOOL)hidesCallNotesInCustomFolders;
- (BOOL)hidesMathNotesInCustomFolders;
- (BOOL)hidesSystemPaperNotesInCustomFolders;
- (BOOL)isSelectionAppropriateForObject:(id)a3 selectedContainerIdentifiers:(id)a4;
- (BOOL)isSelectionAppropriateForObject:(id)a3 selectedContainerIdentifiers:(id)a4 tagSelection:(id)a5;
- (BOOL)isSelectionAppropriateForObject:(id)a3 tagSelection:(id)a4;
- (BOOL)isSelectionAppropriateForObjectID:(id)a3 selectedContainerIdentifiers:(id)a4;
- (BOOL)isSelectionAppropriateForObjectID:(id)a3 selectedContainerIdentifiers:(id)a4 tagSelection:(id)a5;
- (BOOL)isSelectionAppropriateForObjectID:(id)a3 tagSelection:(id)a4;
- (ICFolderListSelectionValidator)init;
- (ICFolderListSelectionValidator)initWithModernContext:(id)a3 htmlContext:(id)a4;
- (ICFolderListSelectionValidator)initWithModernContext:(id)a3 htmlContext:(id)a4 hidesSystemPaperNotesInCustomFolders:(BOOL)a5 hidesMathNotesInCustomFolders:(BOOL)a6 hidesCallNotesInCustomFolders:(BOOL)a7;
- (NSManagedObjectContext)htmlContext;
- (NSManagedObjectContext)modernContext;
@end

@implementation ICFolderListSelectionValidator

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_htmlContext);
}

- (ICFolderListSelectionValidator)initWithModernContext:(id)a3 htmlContext:(id)a4 hidesSystemPaperNotesInCustomFolders:(BOOL)a5 hidesMathNotesInCustomFolders:(BOOL)a6 hidesCallNotesInCustomFolders:(BOOL)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_modernContext) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_htmlContext) = (Class)a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesSystemPaperNotesInCustomFolders) = a5;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesMathNotesInCustomFolders) = a6;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesCallNotesInCustomFolders) = a7;
  v17.receiver = self;
  v17.super_class = ObjectType;
  id v14 = a3;
  id v15 = a4;
  return [(ICFolderListSelectionValidator *)&v17 init];
}

- (NSManagedObjectContext)modernContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICFolderListSelectionValidator_modernContext));
}

- (NSManagedObjectContext)htmlContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICFolderListSelectionValidator_htmlContext));
}

- (BOOL)hidesSystemPaperNotesInCustomFolders
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesSystemPaperNotesInCustomFolders);
}

- (BOOL)hidesMathNotesInCustomFolders
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesMathNotesInCustomFolders);
}

- (BOOL)hidesCallNotesInCustomFolders
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICFolderListSelectionValidator_hidesCallNotesInCustomFolders);
}

- (ICFolderListSelectionValidator)initWithModernContext:(id)a3 htmlContext:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = [[ICFolderListSelectionValidator alloc] initWithModernContext:v8 htmlContext:v9 hidesSystemPaperNotesInCustomFolders:[v7 hidesSystemPaperNotesInCustomFolders] hidesMathNotesInCustomFolders:[v7 hidesMathNotesInCustomFolders] hidesCallNotesInCustomFolders:[v7 hidesCallNotesInCustomFolders]];

  return v10;
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3 selectedContainerIdentifiers:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_100031418(0, (unint64_t *)&qword_1006A0020);
    sub_10002C8EC(&qword_10069F128, (unint64_t *)&qword_1006A0020);
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  id v8 = self;
  id v9 = (ICFolderListSelectionValidator *)sub_10002CE88(v7);
  if (v9)
  {
    v10 = v9;
    char v11 = sub_10002CFD0(v9, v4, 0);

    id v8 = v10;
  }
  else
  {
    char v11 = 1;
  }

  swift_bridgeObjectRelease();
  return v11 & 1;
}

- (BOOL)isSelectionAppropriateForObject:(id)a3 selectedContainerIdentifiers:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    sub_100031418(0, (unint64_t *)&qword_1006A0020);
    sub_10002C8EC(&qword_10069F128, (unint64_t *)&qword_1006A0020);
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v7 = a3;
  id v8 = self;
  char v9 = sub_10002CFD0(v7, v4, 0);

  swift_bridgeObjectRelease();
  return v9 & 1;
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3 tagSelection:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = (ICFolderListSelectionValidator *)a4;
  char v9 = (ICFolderListSelectionValidator *)sub_10002CE88(v6);
  if (v9)
  {
    v10 = v9;
    char v11 = sub_10002CFD0(v9, 0, v8);

    id v8 = v7;
    id v7 = v10;
  }
  else
  {
    char v11 = 1;
  }

  return v11 & 1;
}

- (BOOL)isSelectionAppropriateForObject:(id)a3 tagSelection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  LOBYTE(a4) = sub_10002CFD0(v6, 0, a4);

  return a4 & 1;
}

- (BOOL)isSelectionAppropriateForObjectID:(id)a3 selectedContainerIdentifiers:(id)a4 tagSelection:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    sub_100031418(0, (unint64_t *)&qword_1006A0020);
    sub_10002C8EC(&qword_10069F128, (unint64_t *)&qword_1006A0020);
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v9 = a3;
  v10 = self;
  id v11 = a5;
  v12 = (ICFolderListSelectionValidator *)sub_10002CE88(v9);
  if (v12)
  {
    v13 = v12;
    char v14 = sub_10002CFD0(v12, v6, a5);

    v10 = v13;
  }
  else
  {
    char v14 = 1;
  }

  swift_bridgeObjectRelease();
  return v14 & 1;
}

- (BOOL)isSelectionAppropriateForObject:(id)a3 selectedContainerIdentifiers:(id)a4 tagSelection:(id)a5
{
  uint64_t v6 = (uint64_t)a4;
  if (a4)
  {
    sub_100031418(0, (unint64_t *)&qword_1006A0020);
    sub_10002C8EC(&qword_10069F128, (unint64_t *)&qword_1006A0020);
    uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v9 = a3;
  id v10 = a5;
  id v11 = self;
  char v12 = sub_10002CFD0(v9, v6, a5);

  swift_bridgeObjectRelease();
  return v12 & 1;
}

- (ICFolderListSelectionValidator)init
{
  result = (ICFolderListSelectionValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end