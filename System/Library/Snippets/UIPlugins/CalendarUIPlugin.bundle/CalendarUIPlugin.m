uint64_t sub_3BCC()
{
  uint64_t v0;

  sub_3D40();
  sub_3D30();
  v0 = sub_3D20();
  swift_release();
  return v0;
}

uint64_t sub_3C48()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for CalendarUIPlugin()
{
  return self;
}

uint64_t sub_3C7C()
{
  return _swift_allocObject(v0, 16, 7);
}

unint64_t sub_3C90()
{
  unint64_t result = qword_8128;
  if (!qword_8128)
  {
    sub_3D50();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8128);
  }
  return result;
}

uint64_t sub_3CE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3C7C();
  *a1 = result;
  return result;
}

uint64_t sub_3D08()
{
  return sub_3BCC();
}

uint64_t sub_3D20()
{
  return CalendarSnippetProvider.snippet(for:mode:idiom:)();
}

uint64_t sub_3D30()
{
  return CalendarSnippetProvider.__allocating_init()();
}

uint64_t sub_3D40()
{
  return type metadata accessor for CalendarSnippetProvider();
}

uint64_t sub_3D50()
{
  return type metadata accessor for Snippet();
}

uint64_t self
{
  return _self;
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}