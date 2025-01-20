uint64_t sub_100005018(uint64_t a1)
{
  unint64_t v2;
  uint64_t vars8;

  v2 = sub_10000564C();

  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_1000050C4()
{
  unint64_t result = qword_10000C020;
  if (!qword_10000C020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C020);
  }
  return result;
}

uint64_t variable initialization expression of ConversationListFocusFilterAction._enableFocusFiltering()
{
  uint64_t v0 = sub_10000748C();
  uint64_t v19 = *(void *)(v0 - 8);
  uint64_t v20 = v0;
  __chkstk_darwin();
  v18 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000055B4(&qword_10000C028);
  __chkstk_darwin();
  v17 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000055B4(&qword_10000C030);
  __chkstk_darwin();
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000055B4(&qword_10000C038);
  __chkstk_darwin();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000074AC();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000074EC();
  __chkstk_darwin();
  sub_10000754C();
  __chkstk_darwin();
  uint64_t v11 = sub_1000074BC();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v16 = sub_1000055B4(&qword_10000C040);
  sub_10000753C();
  sub_1000074DC();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_1000074CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v6, 1, 1, v11);
  char v21 = 2;
  uint64_t v13 = sub_10000755C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  uint64_t v14 = sub_1000073CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v17, 1, 1, v14);
  (*(void (**)(char *, void, uint64_t))(v19 + 104))(v18, enum case for InputConnectionBehavior.default(_:), v20);
  return sub_10000742C();
}

uint64_t sub_1000055B4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000055FC()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10000564C()
{
  unint64_t result = qword_10000C048;
  if (!qword_10000C048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C048);
  }
  return result;
}

ValueMetadata *type metadata accessor for MessagesActionExtension()
{
  return &type metadata for MessagesActionExtension;
}

uint64_t ConversationListFocusFilterAction.enableFocusFiltering.getter()
{
  sub_1000073FC();
  return v1;
}

uint64_t ConversationListFocusFilterAction.enableFocusFiltering.setter()
{
  return sub_10000740C();
}

void (*ConversationListFocusFilterAction.enableFocusFiltering.modify(void *a1))(void *a1)
{
  uint64_t v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_1000073EC();
  return sub_100005774;
}

void sub_100005774(void *a1)
{
  unsigned __int8 v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

uint64_t ConversationListFocusFilterAction.$enableFocusFiltering.getter()
{
  return sub_10000741C();
}

char *ConversationListFocusFilterAction.openAppWhenRun.unsafeMutableAddressor()
{
  return &static ConversationListFocusFilterAction.openAppWhenRun;
}

uint64_t static ConversationListFocusFilterAction.openAppWhenRun.getter()
{
  return static ConversationListFocusFilterAction.openAppWhenRun;
}

uint64_t static ConversationListFocusFilterAction.openAppWhenRun.setter(char a1)
{
  uint64_t result = swift_beginAccess();
  static ConversationListFocusFilterAction.openAppWhenRun = a1;
  return result;
}

uint64_t (*static ConversationListFocusFilterAction.openAppWhenRun.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_1000058D8()
{
  uint64_t v0 = sub_1000074AC();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000074EC();
  __chkstk_darwin();
  sub_10000754C();
  __chkstk_darwin();
  uint64_t v4 = sub_1000074BC();
  sub_100007304(v4, static ConversationListFocusFilterAction.title);
  sub_100005B30(v4, (uint64_t)static ConversationListFocusFilterAction.title);
  sub_10000753C();
  sub_1000074DC();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for LocalizedStringResource.BundleDescription.main(_:), v0);
  return sub_1000074CC();
}

uint64_t ConversationListFocusFilterAction.title.unsafeMutableAddressor()
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000074BC();

  return sub_100005B30(v0, (uint64_t)static ConversationListFocusFilterAction.title);
}

uint64_t sub_100005B30(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static ConversationListFocusFilterAction.title.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000074BC();
  uint64_t v3 = sub_100005B30(v2, (uint64_t)static ConversationListFocusFilterAction.title);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static ConversationListFocusFilterAction.title.setter(uint64_t a1)
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000074BC();
  uint64_t v3 = sub_100005B30(v2, (uint64_t)static ConversationListFocusFilterAction.title);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static ConversationListFocusFilterAction.title.modify())()
{
  if (qword_10000C010 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000074BC();
  sub_100005B30(v0, (uint64_t)static ConversationListFocusFilterAction.title);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static ConversationListFocusFilterAction.description.getter@<X0>(uint64_t a1@<X8>)
{
  sub_1000055B4(&qword_10000C038);
  __chkstk_darwin();
  uint64_t v3 = &v12[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_1000074AC();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1000074EC();
  __chkstk_darwin();
  sub_10000754C();
  __chkstk_darwin();
  uint64_t v8 = sub_1000074BC();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  sub_10000753C();
  sub_1000074DC();
  (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, enum case for LocalizedStringResource.BundleDescription.main(_:), v4);
  sub_1000074CC();
  (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v3, 1, 1, v8);
  sub_10000744C();
  uint64_t v10 = sub_10000743C();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(a1, 0, 1, v10);
}

uint64_t ConversationListFocusFilterAction.perform()(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_10000758C();
  v2[4] = sub_10000757C();
  uint64_t v4 = sub_10000756C();
  return _swift_task_switch(sub_100006158, v4, v3);
}

uint64_t sub_100006158()
{
  swift_release();
  sub_1000073FC();
  int v1 = *(unsigned __int8 *)(v0 + 40);
  if (v1 == 2)
  {
    if (qword_10000C018 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_10000752C();
    sub_100005B30(v2, (uint64_t)qword_10000C4D0);
    uint64_t v3 = sub_10000750C();
    os_log_type_t v4 = sub_10000759C();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Focus filter action is not configured for the current focus", v5, 2u);
      uint64_t v6 = 0;
LABEL_10:
      swift_slowDealloc();
      goto LABEL_12;
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = v1 & 1;
    if (qword_10000C018 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_10000752C();
    sub_100005B30(v7, (uint64_t)qword_10000C4D0);
    uint64_t v3 = sub_10000750C();
    os_log_type_t v8 = sub_10000759C();
    if (os_log_type_enabled(v3, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 67109120;
      *(_DWORD *)(v0 + 40) = v6;
      sub_1000075AC();
      _os_log_impl((void *)&_mh_execute_header, v3, v8, "Focus filter action is configured for the current focus, with a value of %{BOOL}d", v9, 8u);
      goto LABEL_10;
    }
  }
LABEL_12:

  id v10 = [self messagesAppDomain];
  if (v10)
  {
    uint64_t v11 = v10;
    [v10 setConversationListFocusFilterActionEnabled:v6];
  }
  sub_1000073DC();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t ConversationListFocusFilterAction.appContext.getter()
{
  return FocusFilterAppContext.init(notificationFilterPredicate:)(0);
}

uint64_t ConversationListFocusFilterAction.displayRepresentation.getter@<X0>(uint64_t a1@<X8>)
{
  v17[0] = a1;
  uint64_t v1 = sub_1000055B4(&qword_10000C058);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000055B4(&qword_10000C038);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000074AC();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  id v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000074EC();
  __chkstk_darwin(v11 - 8);
  uint64_t v12 = sub_10000754C();
  __chkstk_darwin(v12 - 8);
  uint64_t v13 = sub_1000074BC();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_10000753C();
  sub_1000074DC();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for LocalizedStringResource.BundleDescription.main(_:), v7);
  sub_1000074CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v6, 1, 1, v13);
  uint64_t v15 = sub_10000746C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v3, 1, 1, v15);
  return sub_10000747C();
}

uint64_t sub_100006708()
{
  uint64_t v0 = sub_10000752C();
  sub_100007304(v0, qword_10000C4D0);
  sub_100005B30(v0, (uint64_t)qword_10000C4D0);
  return sub_10000751C();
}

uint64_t sub_100006788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100006838;
  return static SetFocusFilterIntent.suggestedFocusFilters(for:)(a1, a2, a3);
}

uint64_t sub_100006838(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_100006944(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000069E4;
  return ConversationListFocusFilterAction.perform()(a1, v4);
}

uint64_t sub_1000069E4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006AD8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s23MessagesActionExtension027ConversationListFocusFilterB0VACycfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_100006B04(uint64_t a1)
{
  unint64_t v2 = sub_10000702C();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100006B40(uint64_t a1)
{
  unint64_t v2 = sub_100007084();

  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t _s23MessagesActionExtension027ConversationListFocusFilterB0VACycfC_0()
{
  uint64_t v0 = sub_10000748C();
  uint64_t v24 = *(void *)(v0 - 8);
  uint64_t v25 = v0;
  __chkstk_darwin(v0);
  v23 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000055B4(&qword_10000C028);
  __chkstk_darwin(v2 - 8);
  v22 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000055B4(&qword_10000C030);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000055B4(&qword_10000C038);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000074AC();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000074EC();
  __chkstk_darwin(v14 - 8);
  uint64_t v15 = sub_10000754C();
  __chkstk_darwin(v15 - 8);
  uint64_t v16 = sub_1000074BC();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v21 = sub_1000055B4(&qword_10000C040);
  sub_10000753C();
  sub_1000074DC();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for LocalizedStringResource.BundleDescription.main(_:), v10);
  sub_1000074CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v9, 1, 1, v16);
  char v26 = 2;
  uint64_t v18 = sub_10000755C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 1, 1, v18);
  uint64_t v19 = sub_1000073CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v22, 1, 1, v19);
  (*(void (**)(char *, void, uint64_t))(v24 + 104))(v23, enum case for InputConnectionBehavior.default(_:), v25);
  return sub_10000742C();
}

unint64_t sub_10000702C()
{
  unint64_t result = qword_10000C060;
  if (!qword_10000C060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C060);
  }
  return result;
}

unint64_t sub_100007084()
{
  unint64_t result = qword_10000C068;
  if (!qword_10000C068)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C068);
  }
  return result;
}

unint64_t sub_1000070DC()
{
  unint64_t result = qword_10000C078;
  if (!qword_10000C078)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C078);
  }
  return result;
}

unint64_t sub_100007134()
{
  unint64_t result = qword_10000C080;
  if (!qword_10000C080)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C080);
  }
  return result;
}

uint64_t sub_100007188()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000071A4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000071F8()
{
  unint64_t result = qword_10000C090;
  if (!qword_10000C090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C090);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationListFocusFilterAction()
{
  return &type metadata for ConversationListFocusFilterAction;
}

unint64_t sub_100007260()
{
  unint64_t result = qword_10000C098;
  if (!qword_10000C098)
  {
    sub_1000072BC((uint64_t *)&unk_10000C0A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

uint64_t sub_1000072BC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100007304(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000737C()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_10000738C()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_10000739C()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_1000073CC()
{
  return type metadata accessor for IntentDialog();
}

uint64_t sub_1000073DC()
{
  return static IntentResult.result<>()();
}

uint64_t sub_1000073EC()
{
  return IntentParameter.wrappedValue.modify();
}

uint64_t sub_1000073FC()
{
  return IntentParameter.wrappedValue.getter();
}

uint64_t sub_10000740C()
{
  return IntentParameter.wrappedValue.setter();
}

uint64_t sub_10000741C()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000742C()
{
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)();
}

uint64_t sub_10000743C()
{
  return type metadata accessor for IntentDescription();
}

uint64_t sub_10000744C()
{
  return IntentDescription.init(_:categoryName:searchKeywords:)();
}

uint64_t sub_10000746C()
{
  return type metadata accessor for DisplayRepresentation.Image();
}

uint64_t sub_10000747C()
{
  return DisplayRepresentation.init(title:subtitle:image:)();
}

uint64_t sub_10000748C()
{
  return type metadata accessor for InputConnectionBehavior();
}

uint64_t sub_1000074AC()
{
  return type metadata accessor for LocalizedStringResource.BundleDescription();
}

uint64_t sub_1000074BC()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_1000074CC()
{
  return LocalizedStringResource.init(_:table:locale:bundle:comment:)();
}

uint64_t sub_1000074DC()
{
  return static Locale.current.getter();
}

uint64_t sub_1000074EC()
{
  return type metadata accessor for Locale();
}

uint64_t sub_1000074FC()
{
  return static AppExtension.main()();
}

uint64_t sub_10000750C()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000751C()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000752C()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000753C()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_10000754C()
{
  return type metadata accessor for String.LocalizationValue();
}

uint64_t sub_10000755C()
{
  return type metadata accessor for Bool.IntentDisplayName();
}

uint64_t sub_10000756C()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000757C()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10000758C()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10000759C()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000075AC()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorInMain()
{
  return _swift_errorInMain();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}