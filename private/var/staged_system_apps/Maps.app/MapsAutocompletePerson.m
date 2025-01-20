@interface MapsAutocompletePerson
+ (NSString)sharedLocationLabelIdentifier;
+ (void)autoCompletePersonFrom:(MapsSuggestionsEntry *)a3 completionHandler:(id)a4;
+ (void)autoCompletePersonWithContact:(CNContact *)a3 completionHandler:(id)a4;
+ (void)autoCompletePersonWithHandleIdentifier:(NSString *)a3 completionHandler:(id)a4;
- (AutocompleteMatchInfo)contactMatchInfo;
- (AutocompleteMatchInfo)handleMatchInfo;
- (BOOL)canShowOpenFindMy;
- (BOOL)canShowRequestLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)placeSummaryShowsStackedIconsAndLabels;
- (CNContact)contact;
- (NSString)description;
- (NSString)identifier;
- (NSString)locationJustNowForPin;
- (NSString)locationJustNowString;
- (NSString)locationString;
- (NSString)noSharedLocationString;
- (NSString)subTitle;
- (NSString)title;
- (NSURL)openFindMyURL;
- (NSURL)requestLocationURL;
- (_TtC4Maps22MapsAutocompletePerson)init;
- (_TtC4Maps22MapsAutocompletePerson)initWithContact:(id)a3 contactMatchInfo:(id)a4 handle:(id)a5 handleMatchInfo:(id)a6;
- (_TtC4Maps24MapsFindMyLocationHandle)handle;
- (id)contactPrioritizingWithAddressFor:(id)a3 kind:(unsigned int)a4 cnLabelValueIdentifier:(id)a5 followedBy:(id)a6;
- (id)copyWithZone:(void *)a3;
- (id)locationTimestampString:(BOOL)a3;
- (id)updatedContactFrom:(id)a3;
- (void)setContact:(id)a3;
- (void)setContactMatchInfo:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandleMatchInfo:(id)a3;
- (void)setPlaceSummaryShowsStackedIconsAndLabels:(BOOL)a3;
@end

@implementation MapsAutocompletePerson

+ (void)autoCompletePersonFrom:(MapsSuggestionsEntry *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015D6208;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015D5D10;
  v14[5] = v13;
  v15 = a3;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015DA440, (uint64_t)v14);
  swift_release();
}

+ (void)autoCompletePersonWithHandleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015DAD60;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015DAD68;
  v14[5] = v13;
  v15 = a3;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015DAD70, (uint64_t)v14);
  swift_release();
}

+ (void)autoCompletePersonWithContact:(CNContact *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1015DAD38;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1015D5D10;
  v14[5] = v13;
  v15 = a3;
  sub_1000A2D24((uint64_t)v9, (uint64_t)&unk_1015DA440, (uint64_t)v14);
  swift_release();
}

- (CNContact)contact
{
  return (CNContact *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact));
}

- (void)setContact:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact) = (Class)a3;
  id v3 = a3;
}

- (AutocompleteMatchInfo)contactMatchInfo
{
  return (AutocompleteMatchInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contactMatchInfo));
}

- (void)setContactMatchInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contactMatchInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contactMatchInfo) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps24MapsFindMyLocationHandle)handle
{
  return (_TtC4Maps24MapsFindMyLocationHandle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                        + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handle));
}

- (void)setHandle:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handle);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handle) = (Class)a3;
  id v3 = a3;
}

- (AutocompleteMatchInfo)handleMatchInfo
{
  return (AutocompleteMatchInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handleMatchInfo));
}

- (void)setHandleMatchInfo:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handleMatchInfo);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_handleMatchInfo) = (Class)a3;
  id v3 = a3;
}

- (BOOL)placeSummaryShowsStackedIconsAndLabels
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_placeSummaryShowsStackedIconsAndLabels);
}

- (void)setPlaceSummaryShowsStackedIconsAndLabels:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_placeSummaryShowsStackedIconsAndLabels) = a3;
}

- (NSString)locationString
{
  return (NSString *)sub_1001287C4();
}

- (NSString)locationJustNowString
{
  return (NSString *)sub_1001287C4();
}

- (NSString)locationJustNowForPin
{
  return (NSString *)sub_1001287C4();
}

- (NSString)noSharedLocationString
{
  return (NSString *)sub_1001287C4();
}

+ (NSString)sharedLocationLabelIdentifier
{
  if (qword_1015CBFF8 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC4Maps22MapsAutocompletePerson)initWithContact:(id)a3 contactMatchInfo:(id)a4 handle:(id)a5 handleMatchInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (_TtC4Maps22MapsAutocompletePerson *)sub_100326AB8(a3, a4, a5, a6);

  return v14;
}

- (NSString)title
{
  NSString v2 = self;
  id v3 = sub_100324794();

  return (NSString *)v3;
}

- (NSString)description
{
  return (NSString *)sub_100323C0C(self, (uint64_t)a2, (void (*)(void))sub_1003248A8);
}

- (NSURL)openFindMyURL
{
  NSString v2 = self;
  id v3 = sub_100324BF0();

  return (NSURL *)v3;
}

- (NSURL)requestLocationURL
{
  NSString v2 = self;
  sub_100324D44();
  id v4 = v3;

  return (NSURL *)v4;
}

- (BOOL)canShowRequestLocation
{
  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps22MapsAutocompletePerson_contact)) {
    return 0;
  }
  NSString v2 = self;
  sub_100324D44();
  id v4 = v3;

  if (!v4) {
    return 0;
  }

  return 1;
}

- (BOOL)canShowOpenFindMy
{
  NSString v2 = self;
  char v3 = sub_1003251D0();

  return v3 & 1;
}

- (id)locationTimestampString:(BOOL)a3
{
  id v4 = self;
  sub_100325258(a3);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (NSString)subTitle
{
  NSString v2 = self;
  NSString v3 = sub_10032554C();

  return (NSString *)v3;
}

- (NSString)identifier
{
  return (NSString *)sub_100323C0C(self, (uint64_t)a2, (void (*)(void))sub_1003256AC);
}

- (id)updatedContactFrom:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  id v6 = sub_100325894(v4);

  return v6;
}

- (id)contactPrioritizingWithAddressFor:(id)a3 kind:(unsigned int)a4 cnLabelValueIdentifier:(id)a5 followedBy:(id)a6
{
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  id v13 = a3;
  id v14 = a6;
  v15 = self;
  id v16 = sub_100325E60(v13, a4, v10, v12, a6);

  swift_bridgeObjectRelease();

  return v16;
}

- (id)copyWithZone:(void *)a3
{
  NSString v3 = self;
  sub_1003265A0(v6);

  sub_1000FF380(v6, v6[3]);
  id v4 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_1000FF22C((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  swift_getObjectType();
  if (a3)
  {
    NSString v5 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v6 = self;
  }
  sub_10011D518((uint64_t)v12, (uint64_t)v10);
  if (!v11)
  {
    sub_1001189D4((uint64_t)v10);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:

    BOOL v7 = 0;
    goto LABEL_9;
  }
  BOOL v7 = sub_100326DB4((uint64_t)v9, (uint64_t)self);

LABEL_9:
  sub_1001189D4((uint64_t)v12);
  return v7;
}

- (_TtC4Maps22MapsAutocompletePerson)init
{
  result = (_TtC4Maps22MapsAutocompletePerson *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end