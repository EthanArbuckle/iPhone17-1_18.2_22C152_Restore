uint64_t sub_3CD0()
{
  uint64_t v0;

  return _swift_allocObject(v0, 16, 7);
}

uint64_t sub_3CE0()
{
  return sub_3DD0();
}

uint64_t sub_3CF8()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SiriAppLaunchUIPlugin()
{
  return self;
}

unint64_t sub_3D30()
{
  unint64_t result = qword_8128;
  if (!qword_8128)
  {
    sub_3DC0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8128);
  }
  return result;
}

uint64_t sub_3D80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_3CD0();
  *a1 = result;
  return result;
}

uint64_t sub_3DA8()
{
  return sub_3CE0();
}

uint64_t sub_3DC0()
{
  return type metadata accessor for AppLaunchDataModels();
}

uint64_t sub_3DD0()
{
  return static SnippetProvider.snippet(for:mode:idiom:)();
}

uint64_t self
{
  return _self;
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}