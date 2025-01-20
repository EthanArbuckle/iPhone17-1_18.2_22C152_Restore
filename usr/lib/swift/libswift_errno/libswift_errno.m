uint64_t _errno_overlay_getErrno()
{
  return *__error();
}

uint64_t POSIXErrorCode.init(rawValue:)(unsigned int a1)
{
  unint64_t v1 = specialized POSIXErrorCode.init(rawValue:)(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

unint64_t specialized POSIXErrorCode.init(rawValue:)(unsigned int a1)
{
  unsigned __int8 v1 = 0;
  uint64_t v2 = a1;
  switch(a1)
  {
    case 1u:
      goto LABEL_10;
    case 2u:
      uint64_t v2 = 2;
      goto LABEL_10;
    case 3u:
      uint64_t v2 = 3;
      goto LABEL_10;
    case 4u:
      uint64_t v2 = 4;
      goto LABEL_10;
    case 5u:
      uint64_t v2 = 5;
      goto LABEL_10;
    case 6u:
      uint64_t v2 = 6;
      goto LABEL_10;
    case 7u:
      uint64_t v2 = 7;
      goto LABEL_10;
    case 8u:
      uint64_t v2 = 8;
      goto LABEL_10;
    case 9u:
      uint64_t v2 = 9;
LABEL_10:
      unsigned __int8 v1 = 0;
      break;
    case 0xAu:
      return v2 | ((unint64_t)v1 << 32);
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
    case 0x34u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 52;
      break;
    case 0x35u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 53;
      break;
    case 0x36u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 54;
      break;
    case 0x37u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 55;
      break;
    case 0x38u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 56;
      break;
    case 0x39u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 57;
      break;
    case 0x3Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 58;
      break;
    case 0x3Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 59;
      break;
    case 0x3Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 60;
      break;
    case 0x3Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 61;
      break;
    case 0x3Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 62;
      break;
    case 0x3Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 63;
      break;
    case 0x40u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 64;
      break;
    case 0x41u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 65;
      break;
    case 0x42u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 66;
      break;
    case 0x43u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 67;
      break;
    case 0x44u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 68;
      break;
    case 0x45u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 69;
      break;
    case 0x46u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 70;
      break;
    case 0x47u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 71;
      break;
    case 0x48u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 72;
      break;
    case 0x49u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 73;
      break;
    case 0x4Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 74;
      break;
    case 0x4Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 75;
      break;
    case 0x4Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 76;
      break;
    case 0x4Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 77;
      break;
    case 0x4Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 78;
      break;
    case 0x4Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 79;
      break;
    case 0x50u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 80;
      break;
    case 0x51u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 81;
      break;
    case 0x52u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 82;
      break;
    case 0x53u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 83;
      break;
    case 0x54u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 84;
      break;
    case 0x55u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 85;
      break;
    case 0x56u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 86;
      break;
    case 0x57u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 87;
      break;
    case 0x58u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 88;
      break;
    case 0x59u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 89;
      break;
    case 0x5Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 90;
      break;
    case 0x5Bu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 91;
      break;
    case 0x5Cu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 92;
      break;
    case 0x5Du:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 93;
      break;
    case 0x5Eu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 94;
      break;
    case 0x5Fu:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 95;
      break;
    case 0x60u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 96;
      break;
    case 0x61u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 97;
      break;
    case 0x62u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 98;
      break;
    case 0x63u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 99;
      break;
    case 0x64u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 100;
      break;
    case 0x65u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 101;
      break;
    case 0x67u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 103;
      break;
    case 0x68u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 104;
      break;
    case 0x69u:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 105;
      break;
    case 0x6Au:
      unsigned __int8 v1 = 0;
      uint64_t v2 = 106;
      break;
    default:
      uint64_t v2 = 0;
      unsigned __int8 v1 = 1;
      break;
  }
  return v2 | ((unint64_t)v1 << 32);
}

int *_errno_overlay_setErrno(int a1)
{
  result = __error();
  int *result = a1;
  return result;
}

int *(*errno.modify(_DWORD *a1))(int *a1)
{
  *a1 = _errno_overlay_getErrno();
  return errno.modify;
}

int *errno.modify(int *a1)
{
  return _errno_overlay_setErrno(*a1);
}

uint64_t static POSIXErrorCode.EWOULDBLOCK.getter()
{
  return 35;
}

uint64_t static POSIXErrorCode.ELAST.getter()
{
  return 106;
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance POSIXErrorCode(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance POSIXErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance POSIXErrorCode()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance POSIXErrorCode()
{
  Swift::UInt32 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance POSIXErrorCode@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = specialized POSIXErrorCode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(unsigned char *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance POSIXErrorCode(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t lazy protocol witness table accessor for type POSIXErrorCode and conformance POSIXErrorCode()
{
  unint64_t result = lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode;
  if (!lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type POSIXErrorCode and conformance POSIXErrorCode);
  }
  return result;
}

ValueMetadata *type metadata accessor for POSIXErrorCode()
{
  return &type metadata for POSIXErrorCode;
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

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}