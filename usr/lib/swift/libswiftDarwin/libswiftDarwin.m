uint64_t S_IFMT.getter()
{
  return 61440;
}

uint64_t open(_:_:_:)(const char *a1, int a2, unsigned __int16 a3)
{
  return _fcntl_overlay_open(a1, a2, a3);
}

uint64_t S_IFREG.getter()
{
  return 0x8000;
}

uint64_t S_IFDIR.getter()
{
  return 0x4000;
}

uint64_t _fcntl_overlay_fcntl(int a1, int a2, uint64_t a3)
{
  return fcntl(a1, a2, a3);
}

uint64_t _fcntl_overlay_open(const char *a1, int a2, unsigned int a3)
{
  return open(a1, a2, a3);
}

uint64_t S_IRWXU.getter()
{
  return 448;
}

uint64_t S_IRWXO.getter()
{
  return 7;
}

uint64_t S_IRWXG.getter()
{
  return 56;
}

uint64_t MAP_FAILED.getter()
{
  return -1;
}

Swift::Int32 __swiftcall fcntl(_:_:)(Swift::Int32 a1, Swift::Int32 a2)
{
  return _fcntl_overlay_fcntl(a1, a2, 0);
}

uint64_t S_IFCHR.getter()
{
  return 0x2000;
}

uint64_t S_IFBLK.getter()
{
  return 24576;
}

uint64_t noErr.getter()
{
  return 0;
}

uint64_t S_IWUSR.getter()
{
  return 128;
}

uint64_t S_IRUSR.getter()
{
  return 256;
}

uint64_t S_IROTH.getter()
{
  return 4;
}

uint64_t S_IRGRP.getter()
{
  return 32;
}

uint64_t S_IXUSR.getter()
{
  return 64;
}

uint64_t open(_:_:)(const char *a1, int a2)
{
  return _fcntl_overlay_open(a1, a2, 0);
}

uint64_t S_IWOTH.getter()
{
  return 2;
}

uint64_t S_IWGRP.getter()
{
  return 16;
}

char ***environ.getter()
{
  result = _NSGetEnviron();
  if (!result)
  {
    __break(1u);
    goto LABEL_5;
  }
  result = (char ***)*result;
  if (!result) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t openat(_:_:_:)(int a1, const char *a2, int a3)
{
  return _fcntl_overlay_openat(a1, a2, a3, 0);
}

uint64_t _fcntl_overlay_openat(int a1, const char *a2, int a3, unsigned int a4)
{
  return openat(a1, a2, a3, a4);
}

uint64_t openat(_:_:_:_:)(int a1, const char *a2, int a3, unsigned __int16 a4)
{
  return _fcntl_overlay_openat(a1, a2, a3, a4);
}

uint64_t MachErrorCode.init(rawValue:)(unsigned int a1)
{
  unint64_t v1 = specialized MachErrorCode.init(rawValue:)(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance MachErrorCode(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance MachErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance MachErrorCode()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance MachErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance MachErrorCode@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized MachErrorCode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance MachErrorCode(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t specialized MachErrorCode.init(rawValue:)(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 0u:
      uint64_t v2 = 0;
      unsigned __int8 v1 = 0;
      break;
    case 1u:
      return v2 | ((unint64_t)v1 << 32);
    case 2u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 2;
      break;
    case 3u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 3;
      break;
    case 4u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 4;
      break;
    case 5u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 5;
      break;
    case 6u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 6;
      break;
    case 7u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 7;
      break;
    case 8u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 8;
      break;
    case 9u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 9;
      break;
    case 0xAu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 10;
      break;
    case 0xBu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 11;
      break;
    case 0xCu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 12;
      break;
    case 0xDu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 13;
      break;
    case 0xEu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 14;
      break;
    case 0xFu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 15;
      break;
    case 0x10u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 16;
      break;
    case 0x11u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 17;
      break;
    case 0x12u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 18;
      break;
    case 0x13u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 19;
      break;
    case 0x14u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 20;
      break;
    case 0x15u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 21;
      break;
    case 0x16u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 22;
      break;
    case 0x17u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 23;
      break;
    case 0x18u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 24;
      break;
    case 0x19u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 25;
      break;
    case 0x1Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 26;
      break;
    case 0x1Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 27;
      break;
    case 0x1Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 28;
      break;
    case 0x1Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 29;
      break;
    case 0x1Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 30;
      break;
    case 0x1Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 31;
      break;
    case 0x20u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 32;
      break;
    case 0x21u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 33;
      break;
    case 0x22u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 34;
      break;
    case 0x23u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 35;
      break;
    case 0x24u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 36;
      break;
    case 0x25u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 37;
      break;
    case 0x26u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 38;
      break;
    case 0x27u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 39;
      break;
    case 0x28u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 40;
      break;
    case 0x29u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 41;
      break;
    case 0x2Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 42;
      break;
    case 0x2Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 43;
      break;
    case 0x2Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 44;
      break;
    case 0x2Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 45;
      break;
    case 0x2Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 46;
      break;
    case 0x2Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 47;
      break;
    case 0x30u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 48;
      break;
    case 0x31u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 49;
      break;
    case 0x32u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 50;
      break;
    case 0x33u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 51;
      break;
    default:
      uint64_t v2 = 0;
      unsigned __int8 v1 = 1;
      break;
  }
  return v2 | ((unint64_t)v1 << 32);
}

unint64_t lazy protocol witness table accessor for type MachErrorCode and conformance MachErrorCode()
{
  unint64_t result = lazy protocol witness table cache variable for type MachErrorCode and conformance MachErrorCode;
  if (!lazy protocol witness table cache variable for type MachErrorCode and conformance MachErrorCode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MachErrorCode and conformance MachErrorCode);
  }
  return result;
}

ValueMetadata *type metadata accessor for MachErrorCode()
{
  return &type metadata for MachErrorCode;
}

uint64_t DarwinBoolean._value.setter(uint64_t result)
{
  *unsigned __int8 v1 = result;
  return result;
}

uint64_t (*DarwinBoolean._value.modify())()
{
  return DarwinBoolean._value.modify;
}

uint64_t DarwinBoolean.init(_:)(char a1)
{
  return a1 & 1;
}

BOOL DarwinBoolean.BOOLValue.getter(char a1)
{
  return a1 != 0;
}

uint64_t DarwinBoolean.init(BOOLeanLiteral:)(char a1)
{
  return a1 & 1;
}

unsigned char *protocol witness for ExpressibleByBooleanLiteral.init(BOOLeanLiteral:) in conformance DarwinBoolean@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t DarwinBoolean.customMirror.getter()
{
  return Mirror.init(reflecting:)();
}

uint64_t protocol witness for CustomReflectable.customMirror.getter in conformance DarwinBoolean()
{
  return Mirror.init(reflecting:)();
}

uint64_t DarwinBoolean.description.getter(char a1)
{
  if (a1) {
    return 1702195828;
  }
  else {
    return 0x65736C6166;
  }
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DarwinBoolean()
{
  if (*v0) {
    return 1702195828;
  }
  else {
    return 0x65736C6166;
  }
}

uint64_t static DarwinBoolean.== infix(_:_:)(char a1, char a2)
{
  return (a1 == 0) ^ (a2 != 0);
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance DarwinBoolean(unsigned char *a1, unsigned char *a2)
{
  return (*a1 == 0) ^ (*a2 != 0);
}

uint64_t _convertBoolToDarwinBoolean(_:)(char a1)
{
  return a1 & 1;
}

BOOL _convertDarwinBooleanToBool(_:)(char a1)
{
  return a1 != 0;
}

uint64_t associated type witness table accessor for ExpressibleByBooleanLiteral.BooleanLiteralType : _ExpressibleByBuiltinBooleanLiteral in DarwinBoolean()
{
  return MEMORY[0x263F8D528];
}

ValueMetadata *type metadata accessor for DarwinBoolean()
{
  return &type metadata for DarwinBoolean;
}

uint64_t SEM_FAILED.getter()
{
  return -1;
}

sem_t *sem_open(_:_:_:_:)(const char *a1, int a2, unsigned __int16 a3, uint64_t a4)
{
  return _semaphore_overlay_sem_open4(a1, a2, a3, a4);
}

sem_t *_semaphore_overlay_sem_open4(const char *a1, int a2, unsigned int a3, uint64_t a4)
{
  return sem_open(a1, a2, a3, a4);
}

uint64_t _sys_ioctl_overlay_ioctl(int a1, unint64_t a2, uint64_t a3)
{
  return ioctl(a1, a2, a3);
}

Swift::Int32 __swiftcall ioctl(_:_:)(Swift::Int32 a1, Swift::UInt a2)
{
  return _sys_ioctl_overlay_ioctl(a1, a2, 0);
}

uint64_t TIOCHPCL.getter()
{
  return 536900610;
}

uint64_t TIOCGETP.getter()
{
  return 1074164744;
}

uint64_t TIOCSETP.getter()
{
  return 2147906569;
}

uint64_t TIOCSETN.getter()
{
  return 2147906570;
}

uint64_t TIOCSETC.getter()
{
  return 2147906577;
}

uint64_t TIOCGETC.getter()
{
  return 1074164754;
}

uint64_t TIOCLBIS.getter()
{
  return 2147775615;
}

uint64_t TIOCLBIC.getter()
{
  return 2147775614;
}

uint64_t TIOCLSET.getter()
{
  return 2147775613;
}

uint64_t TIOCLGET.getter()
{
  return 1074033788;
}

uint64_t TIOCSLTC.getter()
{
  return 2147906677;
}

uint64_t TIOCGLTC.getter()
{
  return 1074164852;
}

uint64_t extern_proc.p_starttime.getter()
{
  return *(void *)v0;
}

uint64_t extern_proc.p_starttime.setter(uint64_t result, int a2)
{
  *(void *)uint64_t v2 = result;
  *(_DWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*extern_proc.p_starttime.modify(uint64_t a1))(uint64_t result)
{
  *(void *)(a1 + 16) = v1;
  int v2 = *(_DWORD *)(v1 + 8);
  *(void *)a1 = *(void *)v1;
  *(_DWORD *)(a1 + 8) = v2;
  return extern_proc.p_starttime.modify;
}

uint64_t extern_proc.p_starttime.modify(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 16);
  int v2 = *(_DWORD *)(result + 8);
  *(void *)uint64_t v1 = *(void *)result;
  *(_DWORD *)(v1 + 8) = v2;
  return result;
}

uint64_t sub_20DB4D868@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(_DWORD *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(_DWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_20DB4D87C(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(_DWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t S_IFIFO.getter()
{
  return 4096;
}

uint64_t S_IFLNK.getter()
{
  return 40960;
}

uint64_t S_IFSOCK.getter()
{
  return 49152;
}

uint64_t S_IFWHT.getter()
{
  return 57344;
}

uint64_t S_IXGRP.getter()
{
  return 8;
}

uint64_t S_IXOTH.getter()
{
  return 1;
}

uint64_t S_ISUID.getter()
{
  return 2048;
}

uint64_t S_ISGID.getter()
{
  return 1024;
}

uint64_t S_ISVTX.getter()
{
  return 512;
}

uint64_t S_ISTXT.getter()
{
  return 512;
}

uint64_t S_IREAD.getter()
{
  return 256;
}

uint64_t S_IWRITE.getter()
{
  return 128;
}

uint64_t S_IEXEC.getter()
{
  return 64;
}

uint64_t TIOCMODG.getter()
{
  return 1074033667;
}

uint64_t TIOCMODS.getter()
{
  return 2147775492;
}

uint64_t TIOCEXCL.getter()
{
  return 536900621;
}

uint64_t TIOCNXCL.getter()
{
  return 536900622;
}

uint64_t TIOCFLUSH.getter()
{
  return 2147775504;
}

uint64_t TIOCGETA.getter()
{
  return 1078490131;
}

uint64_t TIOCSETA.getter()
{
  return 2152231956;
}

uint64_t TIOCSETAW.getter()
{
  return 2152231957;
}

uint64_t TIOCSETAF.getter()
{
  return 2152231958;
}

uint64_t TIOCGETD.getter()
{
  return 1074033690;
}

uint64_t TIOCSETD.getter()
{
  return 2147775515;
}

uint64_t TIOCIXON.getter()
{
  return 536900737;
}

uint64_t TIOCIXOFF.getter()
{
  return 536900736;
}

uint64_t TIOCSBRK.getter()
{
  return 536900731;
}

uint64_t TIOCCBRK.getter()
{
  return 536900730;
}

uint64_t TIOCSDTR.getter()
{
  return 536900729;
}

uint64_t TIOCCDTR.getter()
{
  return 536900728;
}

uint64_t TIOCGPGRP.getter()
{
  return 1074033783;
}

uint64_t TIOCSPGRP.getter()
{
  return 2147775606;
}

uint64_t TIOCOUTQ.getter()
{
  return 1074033779;
}

uint64_t TIOCSTI.getter()
{
  return 2147578994;
}

uint64_t TIOCNOTTY.getter()
{
  return 536900721;
}

uint64_t TIOCPKT.getter()
{
  return 2147775600;
}

uint64_t TIOCSTOP.getter()
{
  return 536900719;
}

uint64_t TIOCSTART.getter()
{
  return 536900718;
}

uint64_t TIOCMSET.getter()
{
  return 2147775597;
}

uint64_t TIOCMBIS.getter()
{
  return 2147775596;
}

uint64_t TIOCMBIC.getter()
{
  return 2147775595;
}

uint64_t TIOCMGET.getter()
{
  return 1074033770;
}

uint64_t TIOCREMOTE.getter()
{
  return 2147775593;
}

uint64_t TIOCGWINSZ.getter()
{
  return 1074295912;
}

uint64_t TIOCSWINSZ.getter()
{
  return 2148037735;
}

uint64_t TIOCUCNTL.getter()
{
  return 2147775590;
}

uint64_t TIOCSTAT.getter()
{
  return 536900709;
}

uint64_t TIOCSCONS.getter()
{
  return 536900707;
}

uint64_t TIOCCONS.getter()
{
  return 2147775586;
}

uint64_t TIOCSCTTY.getter()
{
  return 536900705;
}

uint64_t TIOCEXT.getter()
{
  return 2147775584;
}

uint64_t TIOCSIG.getter()
{
  return 536900703;
}

uint64_t TIOCDRAIN.getter()
{
  return 536900702;
}

uint64_t TIOCMSDTRWAIT.getter()
{
  return 2147775579;
}

uint64_t TIOCMGDTRWAIT.getter()
{
  return 1074033754;
}

uint64_t TIOCTIMESTAMP.getter()
{
  return 1074820185;
}

uint64_t TIOCDCDTIMESTAMP.getter()
{
  return 1074820184;
}

uint64_t TIOCSDRAINWAIT.getter()
{
  return 2147775575;
}

uint64_t TIOCGDRAINWAIT.getter()
{
  return 1074033750;
}

uint64_t TIOCDSIMICROCODE.getter()
{
  return 536900693;
}

uint64_t TIOCPTYGRANT.getter()
{
  return 536900692;
}

uint64_t TIOCPTYGNAME.getter()
{
  return 1082160211;
}

uint64_t TIOCPTYUNLK.getter()
{
  return 536900690;
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t Mirror.init(reflecting:)()
{
  return MEMORY[0x270F9FCA8]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x270ED7D08]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x270EDA840](*(void *)&a1, a2, *(void *)&a3);
}

sem_t *sem_open(const char *a1, int a2, ...)
{
  return (sem_t *)MEMORY[0x270EDB348](a1, *(void *)&a2);
}