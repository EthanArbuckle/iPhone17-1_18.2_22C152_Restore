uint64_t sub_100003794@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  void (*v22)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = a1;
  sub_100003B20();
  v28 = v1;
  ((void (*)(void))__chkstk_darwin)();
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_100003CA8();
  v25 = *(void *)(v27 - 8);
  v4 = v25;
  v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v24 - v8;
  v24 = (char *)&v24 - v8;
  v10 = sub_100003C88();
  v26 = *(void *)(v10 - 8);
  v11 = v26;
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v24 - v15;
  sub_100003C78();
  sub_100003C98();
  v17 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v17(v14, v16, v10);
  v18 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v19 = v9;
  v20 = v27;
  v18(v7, v19, v27);
  v17(v3, v14, v10);
  v18(&v3[*(int *)(v28 + 48)], v7, v20);
  sub_100003CC8();
  v21 = *(void (**)(char *, uint64_t))(v25 + 8);
  v21(v24, v20);
  v22 = *(void (**)(char *, uint64_t))(v26 + 8);
  v22(v16, v10);
  v21(v7, v20);
  return ((uint64_t (*)(char *, uint64_t))v22)(v14, v10);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100003AA0()
{
  unint64_t result = qword_100008090;
  if (!qword_100008090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008090);
  }
  return result;
}

ValueMetadata *type metadata accessor for HealthBalanceWidgets()
{
  return &type metadata for HealthBalanceWidgets;
}

uint64_t sub_100003B04(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100003E0C, 1);
}

void sub_100003B20()
{
  if (!qword_100008098)
  {
    sub_100003C88();
    sub_100003CA8();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_100008098);
    }
  }
}

unint64_t sub_100003B94()
{
  unint64_t result = qword_1000080A0;
  if (!qword_1000080A0)
  {
    sub_100003BEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000080A0);
  }
  return result;
}

void sub_100003BEC()
{
  if (!qword_1000080A8)
  {
    sub_100003B20();
    unint64_t v0 = sub_100003CB8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000080A8);
    }
  }
}

uint64_t sub_100003C44()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100003C78()
{
  return BalanceOneDayWidget.init()();
}

uint64_t sub_100003C88()
{
  return type metadata accessor for BalanceOneDayWidget();
}

uint64_t sub_100003C98()
{
  return BalanceSevenDaysWidget.init()();
}

uint64_t sub_100003CA8()
{
  return type metadata accessor for BalanceSevenDaysWidget();
}

uint64_t sub_100003CB8()
{
  return type metadata accessor for TupleWidget();
}

uint64_t sub_100003CC8()
{
  return TupleWidget.init(_:)();
}

uint64_t sub_100003CD8()
{
  return static WidgetBundle.main()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t self
{
  return _self;
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}