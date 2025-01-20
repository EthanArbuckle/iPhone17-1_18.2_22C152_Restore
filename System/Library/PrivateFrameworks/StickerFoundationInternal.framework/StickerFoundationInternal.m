void sub_25E3B9CF4()
{
  void *v0;
  id v1;

  v0 = (void *)sub_25E3B9EC0();
  v1 = objc_msgSend(self, sel_bundleWithIdentifier_, v0);

  if (v1) {
    qword_26A6ED4E0 = (uint64_t)v1;
  }
  else {
    __break(1u);
  }
}

uint64_t static String.stk_localized(_:tableName:value:comment:)()
{
  if (qword_26A6ED4D8 != -1) {
    swift_once();
  }
  return sub_25E3B9EB0();
}

uint64_t String.stk_localized.getter()
{
  if (qword_26A6ED4D8 != -1) {
    swift_once();
  }
  return sub_25E3B9EB0();
}

uint64_t sub_25E3B9EB0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_25E3B9EC0()
{
  return MEMORY[0x270EF19B0]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}