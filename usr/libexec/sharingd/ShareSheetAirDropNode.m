@interface ShareSheetAirDropNode
- (BOOL)isClassroom;
- (BOOL)isDisabled;
- (BOOL)isSuggestion;
- (CGImage)displayIcon;
- (CNContact)contact;
- (NSNumber)suggestionIndex;
- (NSSet)formattedHandles;
- (NSString)contactIdentifier;
- (NSString)description;
- (NSString)displayName;
- (NSString)model;
- (NSString)realName;
- (NSString)transportBundleID;
- (NSUUID)endpointUUID;
- (NSUUID)nodeIdentifier;
- (_TtC16DaemoniOSLibrary21ShareSheetAirDropNode)init;
- (id)displayNameForLocale:(id)a3;
- (int64_t)selectionReason;
- (void)setClassroom:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisplayIcon:(CGImage *)a3;
- (void)setDisplayName:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setFormattedHandles:(id)a3;
- (void)setModel:(id)a3;
- (void)setNodeIdentifier:(id)a3;
- (void)setRealName:(id)a3;
- (void)setSelectionReason:(int64_t)a3;
- (void)setSuggestion:(BOOL)a3;
- (void)setSuggestionIndex:(id)a3;
- (void)setTransportBundleID:(id)a3;
@end

@implementation ShareSheetAirDropNode

- (NSUUID)nodeIdentifier
{
  uint64_t v3 = sub_10000A844(&qword_100974EA0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier;
  swift_beginAccess();
  sub_10024A330((uint64_t)v6, (uint64_t)v5, &qword_100974EA0);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSUUID *)isa;
}

- (void)setNodeIdentifier:(id)a3
{
  uint64_t v5 = sub_10000A844(&qword_100974EA0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_10026B410((uint64_t)v7, (uint64_t)v10, &qword_100974EA0);
  swift_endAccess();
}

- (NSString)contactIdentifier
{
  return (NSString *)sub_10060F4D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contactIdentifier);
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return (NSString *)sub_10060F4D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayName);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)realName
{
  return (NSString *)sub_10060F4D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_realName);
}

- (void)setRealName:(id)a3
{
}

- (NSString)model
{
  return (NSString *)sub_10060F4D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_model);
}

- (void)setModel:(id)a3
{
}

- (NSSet)formattedHandles
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles))
  {
    swift_bridgeObjectRetain();
    v2.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.Class isa = 0;
  }

  return (NSSet *)v2.super.isa;
}

- (void)setFormattedHandles:(id)a3
{
  if (a3) {
    uint64_t v4 = (objc_class *)static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_formattedHandles) = v4;

  swift_bridgeObjectRelease();
}

- (NSNumber)suggestionIndex
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex));
}

- (void)setSuggestionIndex:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex) = (Class)a3;
  id v3 = a3;
}

- (NSString)transportBundleID
{
  return (NSString *)sub_10060F6F0();
}

- (void)setTransportBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_transportBundleID);
  uint64_t *v5 = v4;
  v5[1] = v6;

  swift_bridgeObjectRelease();
}

- (BOOL)isClassroom
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isClassroom);
}

- (void)setClassroom:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isClassroom) = a3;
}

- (BOOL)isDisabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isDisabled);
}

- (void)setDisabled:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isDisabled) = a3;
}

- (BOOL)isSuggestion
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isSuggestion);
}

- (void)setSuggestion:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_isSuggestion) = a3;
}

- (int64_t)selectionReason
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_selectionReason);
}

- (void)setSelectionReason:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_selectionReason) = (Class)a3;
}

- (CGImage)displayIcon
{
  return (CGImage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayIcon));
}

- (void)setDisplayIcon:(CGImage *)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayIcon);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayIcon) = a3;
  id v3 = a3;
}

- (id)displayNameForLocale:(id)a3
{
  uint64_t v5 = sub_10000A844(&qword_10097C320);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Locale._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Locale();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for Locale();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  uint64_t v10 = *(void *)&self->contactIdentifier[OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_displayName];
  swift_bridgeObjectRetain();
  sub_10000A7E8((uint64_t)v7, &qword_10097C320);
  if (v10)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }

  return v11;
}

- (NSUUID)endpointUUID
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v8.super.isa;
}

- (void)setEndpointUUID:(id)a3
{
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  NSUUID v8 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID;
  swift_beginAccess();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (CNContact)contact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact));
}

- (void)setContact:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact) = (Class)a3;
  id v3 = a3;
}

- (NSString)description
{
  NSSet v2 = self;
  sub_10060FCBC();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC16DaemoniOSLibrary21ShareSheetAirDropNode)init
{
  result = (_TtC16DaemoniOSLibrary21ShareSheetAirDropNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_nodeIdentifier, &qword_100974EA0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_suggestionIndex));
  swift_bridgeObjectRelease();

  NSString v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_endpointUUID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary21ShareSheetAirDropNode_contact);
}

@end