int main(int argc, const char **argv, const char **envp)
{
  int v3;
  int v4;
  uint64_t v5;

  dword_100008008 = 100;
  v3 = exclaves_boot();
  dword_10000800C = v3;
  if (v3)
  {
    v4 = v3;
    if (v3 != 46)
    {
      sub_100003ECC(&qword_100008000);
      v5 = swift_allocObject();
      *(_OWORD *)(v5 + 16) = xmmword_100003F60;
      *(void *)(v5 + 56) = &type metadata for String;
      *(void *)(v5 + 32) = 0xD000000000000015;
      *(void *)(v5 + 40) = 0x8000000100003F60;
      *(void *)(v5 + 88) = &type metadata for Int32;
      *(_DWORD *)(v5 + 64) = v4;
      print(_:separator:terminator:)();
      swift_bridgeObjectRelease();
    }
  }
  return 0;
}

uint64_t sub_100003ECC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t exclaves_boot()
{
  return _exclaves_boot();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}