uint64_t UnsafeMutableMIDIEventPacketPointer.count.getter()
{
  uint64_t v0;

  return *(unsigned int *)(*(void *)v0 + 8);
}

uint64_t key path getter for UnsafeMutableMIDIEventPacketPointer.count : UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(unsigned int *)(*(void *)result + 8);
  return result;
}

unint64_t *key path setter for UnsafeMutableMIDIEventPacketPointer.count : UnsafeMutableMIDIEventPacketPointer(unint64_t *result, uint64_t a2)
{
  unint64_t v2 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(v2))
  {
    *(_DWORD *)(*(void *)a2 + 8) = v2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t UnsafeMutableMIDIEventPacketPointer.count.setter(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!HIDWORD(result))
  {
    *(_DWORD *)(*(void *)v1 + 8) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIEventPacketPointer.count.modify(void *a1))(unint64_t *result, char a2)
{
  uint64_t v2 = *v1;
  a1[1] = *v1;
  *a1 = *(unsigned int *)(v2 + 8);
  return UnsafeMutableMIDIEventPacketPointer.count.modify;
}

unint64_t *UnsafeMutableMIDIEventPacketPointer.count.modify(unint64_t *result, char a2)
{
  unint64_t v2 = *result;
  if (a2)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (!HIDWORD(v2))
    {
LABEL_7:
      *(_DWORD *)(result[1] + 8) = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!HIDWORD(v2)) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t (*UnsafeMutableMIDIEventPacketPointer.timeStamp.modify(uint64_t (*result)()))()
{
  unint64_t v2 = *v1;
  *((void *)result + 1) = *v1;
  uint64_t v3 = *v2;
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)result = v3;
    return UnsafeMutableMIDIEventPacketPointer.timeStamp.modify;
  }
  return result;
}

uint64_t UnsafeMutableMIDIEventPacketPointer.startIndex.getter()
{
  return 0;
}

uint64_t key path getter for UnsafeMutableMIDIEventPacketPointer.subscript(_:) : UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, _DWORD *a3@<X8>)
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(void *)result + 8))
  {
    *a3 = *(_DWORD *)(*(void *)result + 4 * v3 + 12);
    return result;
  }
  __break(1u);
  return result;
}

_DWORD *key path setter for UnsafeMutableMIDIEventPacketPointer.subscript(_:) : UnsafeMutableMIDIEventPacketPointer(_DWORD *result, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(void *)a2 + 8))
  {
    *(_DWORD *)(*(void *)a2 + 4 * v3 + 12) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIEventPacketPointer.subscript.setter(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(void *)v2 + 8) > a2)
  {
    *(_DWORD *)(*(void *)v2 + 4 * a2 + 12) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIEventPacketPointer.subscript.modify(unint64_t *(*result)(unint64_t *result, char a2), unint64_t a2))(unint64_t *result, char a2)
{
  uint64_t v3 = *v2;
  *(void *)result = a2;
  *((void *)result + 1) = v3;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(v3 + 8) > a2)
  {
    *((_DWORD *)result + 4) = *(_DWORD *)(v3 + 4 * a2 + 12);
    return UnsafeMutableMIDIEventPacketPointer.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t *UnsafeMutableMIDIEventPacketPointer.subscript.modify(unint64_t *result, char a2)
{
  unint64_t v3 = *result;
  unint64_t v2 = result[1];
  unint64_t v4 = *(unsigned int *)(v2 + 8);
  BOOL v5 = *result >= v4;
  if (a2)
  {
    if (*result < v4)
    {
LABEL_5:
      *(_DWORD *)(v2 + 4 * v3 + 12) = *((_DWORD *)result + 4);
      return result;
    }
    __break(1u);
  }
  if (!v5) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

_DWORD *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIEventPacketPointer(_DWORD *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(void *)v2 + 8))
  {
    *(_DWORD *)(*(void *)v2 + 4 * v3 + 12) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *(**a1)(unint64_t *result, char a2), unint64_t *a2))()
{
  unint64_t v4 = (unint64_t *(*)(unint64_t *, char))malloc(0x28uLL);
  *a1 = v4;
  *((void *)v4 + 4) = UnsafeMutableMIDIEventPacketPointer.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

uint64_t *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t *a1, uint64_t *a2)
{
  return specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *a1, a1[1], a1[2]);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer(void (***a1)(uint64_t a1, uint64_t a2), uint64_t *a2))()
{
  unint64_t v4 = (void (**)(uint64_t, uint64_t))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

void (*specialized MutableCollection<>.subscript.modify(void (**a1)(uint64_t a1, uint64_t a2), uint64_t a2, uint64_t a3))(uint64_t a1, uint64_t a2)
{
  result = (void (*)(uint64_t, uint64_t))malloc(0x30uLL);
  *a1 = result;
  *((void *)result + 4) = a3;
  *((void *)result + 5) = v3;
  *((void *)result + 3) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = *v3;
    if (*(unsigned int *)(*v3 + 8) >= a3)
    {
      *((void *)result + 1) = a3;
      *((void *)result + 2) = v8;
      *(void *)result = a2;
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

{
  uint64_t *v3;
  void (*result)(uint64_t, uint64_t);
  uint64_t v8;

  result = (void (*)(uint64_t, uint64_t))malloc(0x30uLL);
  *a1 = result;
  *((void *)result + 4) = a3;
  *((void *)result + 5) = v3;
  *((void *)result + 3) = a2;
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v8 = *v3;
    if (*(unsigned __int16 *)(*v3 + 8) >= a3)
    {
      *((void *)result + 1) = a3;
      *((void *)result + 2) = v8;
      *(void *)result = a2;
      return MutableCollection<>.subscript.modifyspecialized ;
    }
  }
  __break(1u);
  return result;
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t a1, uint64_t a2)
{
}

{
  MutableCollection<>.subscript.modifyspecialized (a1, a2, (void (*)(void, void, void, void, void, void))specialized _writeBackMutableSlice<A, B>(_:bounds:slice:));
}

void MutableCollection<>.subscript.modifyspecialized (uint64_t a1, uint64_t a2, void (*a3)(void, void, void, void, void, void))
{
  unint64_t v3 = *(void **)a1;
  a3(*(void *)(*(void *)a1 + 40), v3[3], *(void *)(*(void *)a1 + 32), *v3, v3[1], v3[2]);

  free(v3);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

unint64_t specialized MutableCollection.swapAt(_:_:)(unint64_t result, unint64_t a2)
{
  if (result != a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v3 = *v2;
      unint64_t v4 = *(unsigned __int16 *)(*v2 + 8);
      if (v4 > result)
      {
        if ((a2 & 0x8000000000000000) == 0)
        {
          if (v4 > a2)
          {
            uint64_t v5 = v3 + 10;
            char v6 = *(unsigned char *)(v3 + 10 + result);
            *(unsigned char *)(v5 + result) = *(unsigned char *)(v5 + a2);
            if (*(unsigned __int16 *)(*v2 + 8) > a2)
            {
              *(unsigned char *)(*v2 + a2 + 10) = v6;
              return result;
            }
LABEL_13:
            __break(1u);
            return result;
          }
LABEL_12:
          __break(1u);
          goto LABEL_13;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;

  if (result != a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v3 = *v2;
      unint64_t v4 = *(unsigned int *)(*v2 + 8);
      if (v4 > result)
      {
        if ((a2 & 0x8000000000000000) == 0)
        {
          if (v4 > a2)
          {
            uint64_t v5 = v3 + 12;
            char v6 = *(_DWORD *)(v3 + 12 + 4 * result);
            *(_DWORD *)(v5 + 4 * result) = *(_DWORD *)(v5 + 4 * a2);
            if (*(unsigned int *)(*v2 + 8) > a2)
            {
              *(_DWORD *)(*v2 + 4 * a2 + 12) = v6;
              return result;
            }
LABEL_13:
            __break(1u);
            return result;
          }
LABEL_12:
          __break(1u);
          goto LABEL_13;
        }
LABEL_11:
        __break(1u);
        goto LABEL_12;
      }
    }
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t protocol witness for MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:) in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)();
}

uint64_t protocol witness for MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:) in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)();
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  return protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer(a1, a2, a3, (uint64_t (*)(void, uint64_t, void, void))specialized RandomAccessCollection.index(_:offsetBy:limitedBy:), a4);
}

unint64_t specialized RandomAccessCollection.index(_:offsetBy:limitedBy:)(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(unsigned int *)(a4 + 8);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2) {
      goto LABEL_13;
    }
    return 0;
  }
  if (v6 <= 0 && v6 > a2) {
    return 0;
  }
LABEL_13:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7) {
    goto LABEL_16;
  }
  if (result > v4) {
LABEL_17:
  }
    __break(1u);
  return result;
}

{
  unint64_t v4;
  uint64_t v6;
  BOOL v7;

  unint64_t v4 = *(unsigned __int16 *)(a4 + 8);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = a3 - result;
  if (a2 >= 1)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2) {
      goto LABEL_13;
    }
    return 0;
  }
  if (v6 <= 0 && v6 > a2) {
    return 0;
  }
LABEL_13:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7) {
    goto LABEL_16;
  }
  if (result > v4) {
LABEL_17:
  }
    __break(1u);
  return result;
}

void protocol witness for Collection.startIndex.getter in conformance UnsafeMutableMIDIEventPacketPointer(void *a1@<X8>)
{
  *a1 = 0;
}

void protocol witness for Collection.endIndex.getter in conformance UnsafeMutableMIDIEventPacketPointer(void *a1@<X8>)
{
  *a1 = *(unsigned int *)(*(void *)v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t (*result)(), unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(void *)v2 + 8))
  {
    *(_DWORD *)unint64_t result = *(_DWORD *)(*(void *)v2 + 4 * v3 + 12);
    return protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIEventPacketPointer;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance UnsafeMutableMIDIEventPacketPointer(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 8);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return *(_DWORD *)(*(void *)v0 + 8) == 0;
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t (*a4)(void, uint64_t, void, void)@<X5>, uint64_t a5@<X8>)
{
  uint64_t result = a4(*a1, a2, *a3, *v5);
  *(void *)a5 = result;
  *(unsigned char *)(a5 + 8) = v8 & 1;
  return result;
}

uint64_t MIDIEventPacket.WordSequence.Iterator.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)result + 8);
  *a2 = *(void *)result + 12;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

Swift::UInt32_optional __swiftcall MIDIEventPacket.WordSequence.Iterator.next()()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  if (v1 < v2)
  {
    uint64_t v3 = *(unsigned int *)(*v0 + 4 * v1);
    v0[1] = v1 + 1;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (Swift::UInt32_optional)(v3 | ((unint64_t)(v1 >= v2) << 32));
}

void protocol witness for IteratorProtocol.next() in conformance MIDIEventPacket.WordSequence.Iterator(uint64_t a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  if (v2 < v3)
  {
    int v4 = *(_DWORD *)(*v1 + 4 * v2);
    v1[1] = v2 + 1;
  }
  else
  {
    int v4 = 0;
  }
  *(_DWORD *)a1 = v4;
  *(unsigned char *)(a1 + 4) = v2 >= v3;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance MIDIEventPacket.WordSequence()
{
  return 0;
}

uint64_t protocol witness for Sequence._customContainsEquatableElement(_:) in conformance MIDIEventPacket.WordSequence()
{
  return 2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MIDIEventPacket.WordSequence()
{
  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

void *specialized Sequence._copyContents(initializing:)(void *result, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7 + 8;
  uint64_t v8 = *(unsigned int *)(a7 + 4);
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *uint64_t result = v7;
    result[1] = a3;
    result[2] = v8;
    return (void *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v8)
    {
      *a2 = v7;
      if (a3 != 1)
      {
        if (v8 == 1)
        {
          a3 = 1;
        }
        else
        {
          uint64_t v9 = 0;
          while (1)
          {
            v7 += 4 * *(unsigned int *)(v7 + 8) + 12;
            a2[v9 + 1] = v7;
            if (a3 - 2 == v9) {
              break;
            }
            if (v8 - 1 == ++v9)
            {
              a3 = v9 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t *specialized Sequence._copyContents(initializing:)(unint64_t *result, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  unint64_t v6 = (unint64_t)(a6 + 1);
  unint64_t v7 = v8;
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *uint64_t result = v6;
    result[1] = a3;
    result[2] = v7;
    return (unint64_t *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v7)
    {
      *a2 = v6;
      if (a3 != 1)
      {
        if (v7 == 1)
        {
          a3 = 1;
        }
        else
        {
          uint64_t v9 = 0;
          while (1)
          {
            unint64_t v6 = (v6 + *(unsigned __int16 *)(v6 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
            a2[v9 + 1] = v6;
            if (a3 - 2 == v9) {
              break;
            }
            if (v7 - 1 == ++v9)
            {
              a3 = v9 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

void *specialized Sequence._copyContents(initializing:)(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 8;
  uint64_t v5 = *(unsigned int *)(a4 + 4);
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *uint64_t result = v4;
    result[1] = a3;
    result[2] = v5;
    return (void *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v5)
    {
      *a2 = v4;
      if (a3 != 1)
      {
        if (v5 == 1)
        {
          a3 = 1;
        }
        else
        {
          uint64_t v6 = 0;
          while (1)
          {
            v4 += 4 * *(unsigned int *)(v4 + 8) + 12;
            a2[v6 + 1] = v4;
            if (a3 - 2 == v6) {
              break;
            }
            if (v5 - 1 == ++v6)
            {
              a3 = v6 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

unint64_t *specialized Sequence._copyContents(initializing:)(unint64_t *result, unint64_t *a2, uint64_t a3, unsigned int *a4)
{
  unsigned int v6 = *a4;
  unint64_t v4 = (unint64_t)(a4 + 1);
  unint64_t v5 = v6;
  if (!a2)
  {
LABEL_8:
    a3 = 0;
    goto LABEL_9;
  }
  if (!a3)
  {
LABEL_9:
    *uint64_t result = v4;
    result[1] = a3;
    result[2] = v5;
    return (unint64_t *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (v5)
    {
      *a2 = v4;
      if (a3 != 1)
      {
        if (v5 == 1)
        {
          a3 = 1;
        }
        else
        {
          uint64_t v7 = 0;
          while (1)
          {
            unint64_t v4 = (v4 + *(unsigned __int16 *)(v4 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
            a2[v7 + 1] = v4;
            if (a3 - 2 == v7) {
              break;
            }
            if (v5 - 1 == ++v7)
            {
              a3 = v7 + 1;
              goto LABEL_9;
            }
          }
        }
      }
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance MIDIEventPacket.WordSequence()
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)();
}

uint64_t MIDIEventPacket.WordCollection.startIndex.getter()
{
  return 0;
}

unint64_t UnsafeMutableMIDIEventPacketPointer.subscript.getter(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned int *)(*(void *)v1 + 8) > result)
  {
    return *(unsigned int *)(*(void *)v1 + 4 * result + 12);
  }
  __break(1u);
  return result;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(void *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(unsigned int *)(*(void *)v2 + 8))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *result)
{
  unint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(unsigned int *)(*(void *)v1 + 8))
  {
    *uint64_t result = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result[1];
    uint64_t v5 = *v2;
    if (v4 <= *(unsigned int *)(*v2 + 8))
    {
      a2[1] = v4;
      a2[2] = v5;
      *a2 = v3;
      return result;
    }
  }
  __break(1u);
  return result;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned int *)(*(void *)v3 + 8))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance UnsafeMutableMIDIEventPacketPointer(unint64_t *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *(unsigned int *)(*(void *)v2 + 8);
  if (*result <= v4 && v3 <= v4) {
    return (unint64_t *)(v3 - *result);
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance UnsafeMutableMIDIEventPacketPointer@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(void *)v2 + 8))
  {
    __break(1u);
  }
  else
  {
    BOOL v4 = __OFADD__(v3, 1);
    uint64_t v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t *result)
{
  uint64_t v2 = *result;
  if (*result >= (unint64_t)*(unsigned int *)(*(void *)v1 + 8))
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = __OFADD__(v2, 1);
    uint64_t v4 = v2 + 1;
    if (!v3)
    {
      *uint64_t result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance MIDIEventPacket.WordCollection()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIEventPacket.WordCollection(void *a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

void MIDIEventPacket.WordSequence.makeIterator()(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 8);
  *a1 = *(void *)v1 + 12;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return *(unsigned int *)(*(void *)v0 + 8);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIEventPacketPointer()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIEventPacketPointer(void *a1, _DWORD *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

size_t MIDIEventPacket.Builder.__allocating_init(maximumNumberMIDIWords:)(uint64_t a1)
{
  size_t result = swift_allocObject();
  *(void *)(result + 24) = 0;
  if (a1 < 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  if ((unint64_t)(a1 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  size_t v3 = result;
  size_t result = 4 * a1 + 12;
  if (__OFADD__(4 * a1, 12))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  size_t result = (size_t)calloc(result, 1uLL);
  if (result)
  {
    *(void *)(v3 + 16) = result;
    swift_beginAccess();
    *(void *)(v3 + 24) = a1;
    return v3;
  }
LABEL_9:
  __break(1u);
  return result;
}

int64_t MIDIEventPacket.Builder.init(maximumNumberMIDIWords:)(int64_t result)
{
  *(void *)(v1 + 24) = 0;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_7;
  }
  int64_t v2 = result;
  if ((unint64_t)(result - 0x2000000000000000) >> 62 != 3)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  size_t result = 4 * result + 12;
  if (__OFADD__(4 * v2, 12))
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  size_t result = (int64_t)calloc(result, 1uLL);
  if (result)
  {
    *(void *)(v1 + 16) = result;
    swift_beginAccess();
    *(void *)(v1 + 24) = v2;
    return v1;
  }
LABEL_9:
  __break(1u);
  return result;
}

uint64_t MIDIEventPacket.Builder.count.getter()
{
  swift_beginAccess();
  return *(unsigned int *)(*(void *)(v0 + 16) + 8);
}

uint64_t (*MIDIEventPacket.Builder.timeStamp.modify(void *a1))()
{
  size_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  size_t result = (uint64_t (*)())swift_beginAccess();
  uint64_t v5 = **(void **)(v1 + 16);
  if (v5 < 0)
  {
    __break(1u);
  }
  else
  {
    v3[3] = v5;
    return MIDIEventPacket.Builder.timeStamp.modify;
  }
  return result;
}

uint64_t MIDIEventPacket.Builder.append(_:)(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(unsigned int *)(v4 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = v5 + v6;
  if (__OFADD__(v5, v6))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t result = swift_beginAccess();
  if (*(void *)(v1 + 24) < v7)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (v6)
  {
    unsigned int v8 = (int *)(a1 + 32);
    uint64_t v9 = *(unsigned int *)(v4 + 8);
    while (v9 != -1)
    {
      int v10 = *v8++;
      *(_DWORD *)(v4 + 12 + 4 * v9++) = v10;
      *(_DWORD *)(v4 + 8) = v9;
      if (!--v6) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t static MIDIEventList.sizeInBytes(pktList:)(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  for (int i = *(_DWORD *)(a1 + 4); i; --i)
    v1 += 4 * *(unsigned int *)(v1 + 8) + 12;
  return v1 - a1;
}

uint64_t MIDIEventPacketNext(uint64_t a1)
{
  return a1 + 4 * *(unsigned int *)(a1 + 8) + 12;
}

MIDIEventList *UnsafeMutableMIDIEventListPointer.init(_:wordSize:inProtocol:)@<X0>(MIDIProtocolID protocol@<W2>, MIDIEventList *result@<X0>, uint64_t a3@<X1>, uint64_t a4@<X8>)
{
  if ((unint64_t)(a3 - 0x2000000000000000) >> 62 == 3)
  {
    uint64_t v6 = result;
    uint64_t v7 = 4 * a3;
    uint64_t result = (MIDIEventList *)MIDIEventListInit(result, protocol);
    *(void *)a4 = v7;
    *(void *)(a4 + 8) = result;
    *(_DWORD *)(a4 + 16) = protocol;
    *(void *)(a4 + 24) = v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void MIDIEventList.UnsafeSequence.makeIterator()(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 4);
  *a1 = *(void *)v1 + 8;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t MIDIEventList.UnsafeSequence.Iterator.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)result + 4);
  *a2 = *(void *)result + 8;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

uint64_t MIDIEventList.UnsafeSequence.count.getter()
{
  return *(unsigned int *)(*(void *)v0 + 4);
}

uint64_t MIDIEventList.UnsafeSequence.Iterator.next()()
{
  uint64_t v1 = v0[1];
  if (v1 >= v0[2]) {
    return 0;
  }
  uint64_t result = *v0;
  if (v1 >= 1)
  {
    result += 4 * *(unsigned int *)(result + 8) + 12;
    *uint64_t v0 = result;
  }
  v0[1] = v1 + 1;
  return result;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator(MIDIEventPacketNext, a1);
}

void protocol witness for Sequence.makeIterator() in conformance MIDIEventList.UnsafeSequence(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)(*(void *)v1 + 4);
  *a1 = *(void *)v1 + 8;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MIDIEventList.UnsafeSequence()
{
  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIEventList.UnsafeSequence(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t UnsafeMutableMIDIEventListPointer.listSizeInBytes.getter()
{
  return *(void *)v0;
}

uint64_t UnsafeMutableMIDIEventListPointer.lastPacket.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t UnsafeMutableMIDIEventListPointer.midiProtocol.getter()
{
  return *(unsigned int *)(v0 + 16);
}

double UnsafeMutableMIDIEventListPointer.init(_:wordSize:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (a1 && (UnsafeMutableMIDIEventListPointer.init(_:wordSize:)(&v6), (uint64_t v3 = v8) != 0))
  {
    uint64_t v4 = v7;
    double result = *(double *)&v6;
    *(_OWORD *)a2 = v6;
    *(void *)(a2 + 16) = v4;
    *(void *)(a2 + 24) = v3;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t UnsafeMutableMIDIEventListPointer.count.getter()
{
  return *(unsigned int *)(*(void *)(v0 + 24) + 4);
}

Swift::Void __swiftcall UnsafeMutableMIDIEventListPointer.clear()()
{
  *(void *)(v0 + 8) = MIDIEventListInit(*(MIDIEventList **)(v0 + 24), (MIDIProtocolID)*(_DWORD *)(v0 + 16));
}

MIDIEventPacket *UnsafeMutableMIDIEventListPointer.append(timestamp:words:)(MIDITimeStamp time, uint64_t a2)
{
  uint64_t v3 = *(MIDIEventPacket **)(v2 + 8);
  if (!v3) {
    return 0;
  }
  double result = MIDIEventListAdd(*(MIDIEventList **)(v2 + 24), *(void *)v2, v3, time, *(void *)(a2 + 16), (const UInt32 *)(a2 + 32));
  *(void *)(v2 + 8) = result;
  return result;
}

void UnsafeMutableMIDIEventListPointer.makeIterator()(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = v2 + 8;
  uint64_t v4 = *(unsigned int *)(v2 + 4);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = v4;
}

void protocol witness for Sequence.makeIterator() in conformance UnsafeMutableMIDIEventListPointer(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 24);
  uint64_t v3 = v2 + 8;
  uint64_t v4 = *(unsigned int *)(v2 + 4);
  *a1 = v3;
  a1[1] = 0;
  a1[2] = v4;
}

void protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIEventListPointer()
{
  specialized _copySequenceToContiguousArray<A>(_:)(*(void *)v0, *(void *)(v0 + 8), *(unsigned int *)(v0 + 16), *(void *)(v0 + 24));
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIEventListPointer(void *a1, void *a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *(void *)v3, *(void *)(v3 + 8), *(unsigned int *)(v3 + 16), *(void *)(v3 + 24));
}

MIDIEventList *MIDIEventList.Builder.__allocating_init(inProtocol:wordSize:)(MIDIProtocolID a1, uint64_t a2)
{
  double result = (MIDIEventList *)swift_allocObject();
  if (a2 < 69)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((unint64_t)(a2 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v5 = result;
  size_t v6 = 4 * a2;
  double result = (MIDIEventList *)calloc(v6, 1uLL);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = MIDIEventListInit(result, a1);
    *(void *)&v5->packet[0].wordCount = v6;
    *(void *)&v5->packet[0].words[1] = v8;
    v5->packet[0].words[3] = a1;
    *(void *)&v5->packet[0].words[5] = v7;
    return v5;
  }
LABEL_7:
  __break(1u);
  return result;
}

MIDIEventList *MIDIEventList.Builder.init(inProtocol:wordSize:)(MIDIEventList *result, uint64_t a2)
{
  if (a2 < 69)
  {
    __break(1u);
    goto LABEL_6;
  }
  if ((unint64_t)(a2 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  MIDIProtocolID v3 = (int)result;
  uint64_t v4 = 4 * a2;
  double result = (MIDIEventList *)calloc(4 * a2, 1uLL);
  if (result)
  {
    uint64_t v5 = result;
    size_t v6 = MIDIEventListInit(result, v3);
    *(void *)(v2 + 16) = v4;
    *(void *)(v2 + 24) = v6;
    *(_DWORD *)(v2 + 32) = v3;
    *(void *)(v2 + 40) = v5;
    return (MIDIEventList *)v2;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t MIDIEventList.Builder.deinit()
{
  swift_beginAccess();
  free(*(void **)(v0 + 40));
  return v0;
}

uint64_t MIDIEventList.Builder.__deallocating_deinit()
{
  swift_beginAccess();
  free(*(void **)(v0 + 40));
  return swift_deallocClassInstance();
}

MIDIEventPacket *MIDIEventList.Builder.append(timestamp:words:)(MIDITimeStamp a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(MIDIEventPacket **)(v2 + 24);
  if (v5)
  {
    size_t v6 = MIDIEventListAdd(*(MIDIEventList **)(v2 + 40), *(void *)(v2 + 16), v5, a1, *(void *)(a2 + 16), (const UInt32 *)(a2 + 32));
    *(void *)(v2 + 24) = v6;
  }
  else
  {
    size_t v6 = 0;
  }
  swift_endAccess();
  return v6;
}

Swift::Void __swiftcall MIDIEventList.Builder.clear()()
{
  swift_beginAccess();
  *(void *)(v0 + 24) = MIDIEventListInit(*(MIDIEventList **)(v0 + 40), (MIDIProtocolID)*(_DWORD *)(v0 + 32));
  swift_endAccess();
}

uint64_t MIDIEventList.Builder.count.getter()
{
  swift_beginAccess();
  return *(unsigned int *)(*(void *)(v0 + 40) + 4);
}

uint64_t MIDIEventList.Builder.withUnsafePointer<A>(_:)(uint64_t (*a1)(void))
{
  swift_beginAccess();
  return a1(*(void *)(v1 + 40));
}

uint64_t MIDIEventList.Builder.withUnsafeMutableMIDIEventListPointer<A>(_:)(void (*a1)(uint64_t))
{
  swift_beginAccess();
  a1(v1 + 16);
  return swift_endAccess();
}

uint64_t UnsafeMutableMIDIPacketPointer.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

{
  *a2 = result;
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.count.getter()
{
  return *(unsigned __int16 *)(*(void *)v0 + 8);
}

uint64_t key path getter for UnsafeMutableMIDIPacketPointer.count : UnsafeMutableMIDIPacketPointer@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = *(unsigned __int16 *)(*(void *)result + 8);
  return result;
}

unint64_t *key path setter for UnsafeMutableMIDIPacketPointer.count : UnsafeMutableMIDIPacketPointer(unint64_t *result, uint64_t a2)
{
  unint64_t v2 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(v2 >> 16))
  {
    *(_WORD *)(*(void *)a2 + 8) = v2;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t UnsafeMutableMIDIPacketPointer.count.setter(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(result >> 16))
  {
    *(_WORD *)(*(void *)v1 + 8) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIPacketPointer.count.modify(void *a1))(unint64_t *result, char a2)
{
  uint64_t v2 = *v1;
  a1[1] = *v1;
  *a1 = *(unsigned __int16 *)(v2 + 8);
  return UnsafeMutableMIDIPacketPointer.count.modify;
}

unint64_t *UnsafeMutableMIDIPacketPointer.count.modify(unint64_t *result, char a2)
{
  unint64_t v2 = *result;
  if (a2)
  {
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
      goto LABEL_9;
    }
    if (!(v2 >> 16))
    {
LABEL_7:
      *(_WORD *)(result[1] + 8) = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (!(v2 >> 16)) {
    goto LABEL_7;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.timeStamp.getter()
{
  uint64_t result = **v0;
  if (result < 0) {
    __break(1u);
  }
  return result;
}

uint64_t **key path getter for UnsafeMutableMIDIPacketPointer.timeStamp : UnsafeMutableMIDIPacketPointer@<X0>(uint64_t **result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = **result;
  if (v2 < 0) {
    __break(1u);
  }
  else {
    *a2 = v2;
  }
  return result;
}

void *key path setter for UnsafeMutableMIDIPacketPointer.timeStamp : UnsafeMutableMIDIPacketPointer(void *result, void **a2)
{
  if ((*result & 0x8000000000000000) != 0) {
    __break(1u);
  }
  else {
    **a2 = *result;
  }
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.timeStamp.setter(uint64_t result)
{
  if (result < 0) {
    __break(1u);
  }
  else {
    **uint64_t v1 = result;
  }
  return result;
}

uint64_t (*UnsafeMutableMIDIPacketPointer.timeStamp.modify(uint64_t (*result)()))()
{
  uint64_t v2 = *v1;
  *((void *)result + 1) = *v1;
  uint64_t v3 = *v2;
  if (v3 < 0)
  {
    __break(1u);
  }
  else
  {
    *(void *)uint64_t result = v3;
    return UnsafeMutableMIDIEventPacketPointer.timeStamp.modify;
  }
  return result;
}

uint64_t *UnsafeMutableMIDIEventPacketPointer.timeStamp.modify(uint64_t *result, char a2)
{
  uint64_t v2 = *result;
  if (a2)
  {
    if ((v2 & 0x8000000000000000) == 0)
    {
LABEL_5:
      *(void *)result[1] = v2;
      return result;
    }
    __break(1u);
  }
  if ((v2 & 0x8000000000000000) == 0) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.startIndex.getter()
{
  return 0;
}

uint64_t key path getter for UnsafeMutableMIDIPacketPointer.subscript(_:) : UnsafeMutableMIDIPacketPointer@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, unsigned char *a3@<X8>)
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(void *)result + 8))
  {
    *a3 = *(unsigned char *)(*(void *)result + v3 + 10);
    return result;
  }
  __break(1u);
  return result;
}

unsigned char *key path setter for UnsafeMutableMIDIPacketPointer.subscript(_:) : UnsafeMutableMIDIPacketPointer(unsigned char *result, uint64_t a2, unint64_t *a3)
{
  unint64_t v3 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(void *)a2 + 8))
  {
    *(unsigned char *)(*(void *)a2 + v3 + 10) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t UnsafeMutableMIDIPacketPointer.subscript.setter(uint64_t result, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned __int16 *)(*(void *)v2 + 8) > a2)
  {
    *(unsigned char *)(*(void *)v2 + a2 + 10) = result;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *(*UnsafeMutableMIDIPacketPointer.subscript.modify(unint64_t *(*result)(unint64_t *result, char a2), unint64_t a2))(unint64_t *result, char a2)
{
  uint64_t v3 = *v2;
  *(void *)uint64_t result = a2;
  *((void *)result + 1) = v3;
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned __int16 *)(v3 + 8) > a2)
  {
    *((unsigned char *)result + 16) = *(unsigned char *)(v3 + a2 + 10);
    return UnsafeMutableMIDIPacketPointer.subscript.modify;
  }
  __break(1u);
  return result;
}

unint64_t *UnsafeMutableMIDIPacketPointer.subscript.modify(unint64_t *result, char a2)
{
  unint64_t v3 = *result;
  unint64_t v2 = result[1];
  unint64_t v4 = *(unsigned __int16 *)(v2 + 8);
  BOOL v5 = *result >= v4;
  if (a2)
  {
    if (*result < v4)
    {
LABEL_5:
      *(unsigned char *)(v2 + v3 + 10) = *((unsigned char *)result + 16);
      return result;
    }
    __break(1u);
  }
  if (!v5) {
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

unsigned char *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIPacketPointer(unsigned char *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(void *)v2 + 8))
  {
    *(unsigned char *)(*(void *)v2 + v3 + 10) = *result;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIPacketPointer(unint64_t *(**a1)(unint64_t *result, char a2), unint64_t *a2))()
{
  unint64_t v4 = (unint64_t *(*)(unint64_t *, char))malloc(0x28uLL);
  *a1 = v4;
  *((void *)v4 + 4) = UnsafeMutableMIDIPacketPointer.subscript.modify(v4, *a2);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

uint64_t *protocol witness for MutableCollection.subscript.setter in conformance UnsafeMutableMIDIPacketPointer(uint64_t *a1, uint64_t *a2)
{
  return specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(v2, *a2, a2[1], *a1, a1[1], a1[2]);
}

uint64_t (*protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIPacketPointer(void (***a1)(uint64_t a1, uint64_t a2), uint64_t *a2))()
{
  unint64_t v4 = (void (**)(uint64_t, uint64_t))malloc(0x28uLL);
  *a1 = v4;
  v4[4] = specialized MutableCollection<>.subscript.modify(v4, *a2, a2[1]);
  return protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer;
}

void protocol witness for MutableCollection.subscript.modify in conformance UnsafeMutableMIDIEventPacketPointer(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

unint64_t protocol witness for MutableCollection.partition(by:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  unint64_t result = specialized MutableCollection<>._partitionImpl(by:)(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

unint64_t protocol witness for MutableCollection.swapAt(_:_:) in conformance UnsafeMutableMIDIPacketPointer(unint64_t *a1, unint64_t *a2)
{
  return specialized MutableCollection.swapAt(_:_:)(*a1, *a2);
}

uint64_t protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  return protocol witness for RandomAccessCollection.index(_:offsetBy:limitedBy:) in conformance UnsafeMutableMIDIEventPacketPointer(a1, a2, a3, (uint64_t (*)(void, uint64_t, void, void))specialized RandomAccessCollection.index(_:offsetBy:limitedBy:), a4);
}

void protocol witness for Collection.endIndex.getter in conformance UnsafeMutableMIDIPacketPointer(void *a1@<X8>)
{
  *a1 = *(unsigned __int16 *)(*(void *)v1 + 8);
}

uint64_t (*protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIPacketPointer(uint64_t (*result)(), unint64_t *a2))()
{
  unint64_t v3 = *a2;
  if ((*a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(void *)v2 + 8))
  {
    *(unsigned char *)unint64_t result = *(unsigned char *)(*(void *)v2 + v3 + 10);
    return protocol witness for Collection.subscript.read in conformance UnsafeMutableMIDIEventPacketPointer;
  }
  __break(1u);
  return result;
}

void protocol witness for Collection.indices.getter in conformance UnsafeMutableMIDIPacketPointer(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v1 + 8);
  *a1 = 0;
  a1[1] = v2;
}

BOOL protocol witness for Collection.isEmpty.getter in conformance UnsafeMutableMIDIPacketPointer()
{
  return *(_WORD *)(*(void *)v0 + 8) == 0;
}

void protocol witness for Collection._customIndexOfEquatableElement(_:) in conformance UnsafeMutableMIDIPacketPointer(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

uint64_t MIDIPacket.ByteSequence.Iterator.init(_:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(unsigned __int16 *)(*(void *)result + 8);
  *a2 = *(void *)result + 10;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

Swift::UInt8_optional __swiftcall MIDIPacket.ByteSequence.Iterator.next()()
{
  uint64_t v1 = v0[1];
  uint64_t v2 = v0[2];
  if (v1 < v2)
  {
    __int16 v3 = *(unsigned __int8 *)(*v0 + v1);
    v0[1] = v1 + 1;
  }
  else
  {
    __int16 v3 = 0;
  }
  return (Swift::UInt8_optional)(v3 | ((v1 >= v2) << 8));
}

void protocol witness for IteratorProtocol.next() in conformance MIDIPacket.ByteSequence.Iterator(unsigned char *a1@<X8>)
{
  uint64_t v2 = v1[1];
  uint64_t v3 = v1[2];
  if (v2 < v3)
  {
    char v4 = *(unsigned char *)(*v1 + v2);
    v1[1] = v2 + 1;
  }
  else
  {
    char v4 = 0;
  }
  *a1 = v4;
  a1[1] = v2 >= v3;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance MIDIPacket.ByteSequence()
{
  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

uint64_t MIDIPacket.ByteCollection.startIndex.getter()
{
  return 0;
}

unint64_t UnsafeMutableMIDIPacketPointer.subscript.getter(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(unsigned __int16 *)(*(void *)v1 + 8) > result)
  {
    return *(unsigned __int8 *)(*(void *)v1 + result + 10);
  }
  __break(1u);
  return result;
}

void *protocol witness for BidirectionalCollection.index(before:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(void *result@<X0>, unint64_t *a2@<X8>)
{
  unint64_t v3 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v3 < *(unsigned __int16 *)(*(void *)v2 + 8))
  {
    *a2 = v3;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for BidirectionalCollection.formIndex(before:) in conformance UnsafeMutableMIDIPacketPointer(unint64_t *result)
{
  unint64_t v2 = *result - 1;
  if (__OFSUB__(*result, 1))
  {
    __break(1u);
  }
  else if (v2 < *(unsigned __int16 *)(*(void *)v1 + 8))
  {
    *unint64_t result = v2;
    return result;
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.subscript.getter in conformance UnsafeMutableMIDIPacketPointer@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v4 = result[1];
    uint64_t v5 = *v2;
    if (v4 <= *(unsigned __int16 *)(*v2 + 8))
    {
      a2[1] = v4;
      a2[2] = v5;
      *a2 = v3;
      return result;
    }
  }
  __break(1u);
  return result;
}

void *protocol witness for RandomAccessCollection.index(_:offsetBy:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(void *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else if (v4 <= *(unsigned __int16 *)(*(void *)v3 + 8))
  {
    *a3 = v4;
    return result;
  }
  __break(1u);
  return result;
}

unint64_t *protocol witness for RandomAccessCollection.distance(from:to:) in conformance UnsafeMutableMIDIPacketPointer(unint64_t *result, unint64_t *a2)
{
  unint64_t v3 = *a2;
  unint64_t v4 = *(unsigned __int16 *)(*(void *)v2 + 8);
  if (*result <= v4 && v3 <= v4) {
    return (unint64_t *)(v3 - *result);
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance UnsafeMutableMIDIEventPacketPointer(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = a2[1];
  if (*result >= *a2)
  {
    BOOL v5 = __OFSUB__(v2, v3);
    BOOL v4 = v2 - v3 < 0;
  }
  else
  {
    BOOL v5 = 0;
    BOOL v4 = 0;
  }
  if (v4 == v5) {
    __break(1u);
  }
  return result;
}

void *protocol witness for Collection._failEarlyRangeCheck(_:bounds:) in conformance UnsafeMutableMIDIEventPacketPointer(void *result, void *a2)
{
  if (*result < *a2 || a2[1] < *result) {
    __break(1u);
  }
  return result;
}

{
  if (*result < *a2 || a2[1] < result[1]) {
    __break(1u);
  }
  return result;
}

uint64_t *protocol witness for Collection.index(after:) in conformance UnsafeMutableMIDIPacketPointer@<X0>(uint64_t *result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *result;
  if (*result >= (unint64_t)*(unsigned __int16 *)(*(void *)v2 + 8))
  {
    __break(1u);
  }
  else
  {
    BOOL v4 = __OFADD__(v3, 1);
    uint64_t v5 = v3 + 1;
    if (!v4)
    {
      *a2 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t *protocol witness for Collection.formIndex(after:) in conformance UnsafeMutableMIDIPacketPointer(uint64_t *result)
{
  uint64_t v2 = *result;
  if (*result >= (unint64_t)*(unsigned __int16 *)(*(void *)v1 + 8))
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = __OFADD__(v2, 1);
    uint64_t v4 = v2 + 1;
    if (!v3)
    {
      *unint64_t result = v4;
      return result;
    }
  }
  __break(1u);
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance MIDIPacket.ByteCollection(void *a1@<X8>)
{
  *a1 = *v1;
  a1[1] = 0;
}

void *protocol witness for Sequence._copyToContiguousArray() in conformance MIDIPacket.ByteCollection()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIPacket.ByteCollection(void *a1, uint64_t a2, unint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

void MIDIPacket.ByteSequence.makeIterator()(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v1 + 8);
  *a1 = *(void *)v1 + 10;
  a1[1] = 0;
  a1[2] = v2;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance UnsafeMutableMIDIPacketPointer()
{
  return *(unsigned __int16 *)(*(void *)v0 + 8);
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIPacketPointer()
{
  return specialized _copyCollectionToContiguousArray<A>(_:)(*v0);
}

void *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIPacketPointer(void *a1, unsigned char *a2, uint64_t a3)
{
  return specialized Sequence._copySequenceContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t UnsafePointer<A>.bytes()@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t key path getter for MIDIPacket.Builder.capacity : MIDIPacket.Builder@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  *a2 = *(void *)(v3 + 24);
  return result;
}

uint64_t key path setter for MIDIPacket.Builder.capacity : MIDIPacket.Builder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t result = swift_beginAccess();
  *(void *)(v3 + 24) = v2;
  return result;
}

uint64_t MIDIPacket.Builder.capacity.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 24);
}

size_t MIDIPacket.Builder.__allocating_init(maximumNumberMIDIBytes:)(uint64_t a1)
{
  size_t result = swift_allocObject();
  *(void *)(result + 24) = 0;
  if (a1 < 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  size_t v3 = result;
  size_t result = a1 + 10;
  if (__OFADD__(a1, 10))
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  size_t result = (size_t)calloc(result, 1uLL);
  if (result)
  {
    *(void *)(v3 + 16) = result;
    swift_beginAccess();
    *(void *)(v3 + 24) = a1;
    return v3;
  }
LABEL_7:
  __break(1u);
  return result;
}

int64_t MIDIPacket.Builder.init(maximumNumberMIDIBytes:)(int64_t result)
{
  *(void *)(v1 + 24) = 0;
  if (result < 1)
  {
    __break(1u);
    goto LABEL_6;
  }
  int64_t v2 = result;
  BOOL v3 = __OFADD__(result, 10);
  result += 10;
  if (v3)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  size_t result = (int64_t)calloc(result, 1uLL);
  if (result)
  {
    *(void *)(v1 + 16) = result;
    swift_beginAccess();
    *(void *)(v1 + 24) = v2;
    return v1;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t MIDIEventPacket.Builder.deinit()
{
  swift_beginAccess();
  free(*(void **)(v0 + 16));
  return v0;
}

uint64_t MIDIEventPacket.Builder.__deallocating_deinit()
{
  swift_beginAccess();
  free(*(void **)(v0 + 16));
  return swift_deallocClassInstance();
}

uint64_t MIDIPacket.Builder.count.getter()
{
  swift_beginAccess();
  return *(unsigned __int16 *)(*(void *)(v0 + 16) + 8);
}

uint64_t key path getter for MIDIEventPacket.Builder.timeStamp : MIDIEventPacket.Builder@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = swift_beginAccess();
  uint64_t v5 = **(void **)(v3 + 16);
  if (v5 < 0) {
    __break(1u);
  }
  else {
    *a2 = v5;
  }
  return result;
}

uint64_t key path setter for MIDIEventPacket.Builder.timeStamp : MIDIEventPacket.Builder(uint64_t *a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void **)(*a2 + 16);
  uint64_t result = swift_beginAccess();
  if (v2 < 0) {
    __break(1u);
  }
  else {
    **uint64_t v3 = v2;
  }
  return result;
}

uint64_t MIDIEventPacket.Builder.timeStamp.getter()
{
  swift_beginAccess();
  uint64_t result = **(void **)(v0 + 16);
  if (result < 0) {
    __break(1u);
  }
  return result;
}

uint64_t MIDIEventPacket.Builder.timeStamp.setter(uint64_t a1)
{
  uint64_t v3 = (void **)(v1 + 16);
  uint64_t result = swift_beginAccess();
  if (a1 < 0) {
    __break(1u);
  }
  else {
    **uint64_t v3 = a1;
  }
  return result;
}

void MIDIEventPacket.Builder.timeStamp.modify(void **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = v2[3];
  if (a2)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
LABEL_5:
      **(void **)(v2[4] + 16) = v3;
      free(v2);
      return;
    }
    __break(1u);
  }
  if ((v3 & 0x8000000000000000) == 0) {
    goto LABEL_5;
  }
  __break(1u);
}

uint64_t MIDIPacket.Builder.append(_:)(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(unsigned __int16 *)(v4 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = v5 + v6;
  if (__OFADD__(v5, v6))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t result = swift_beginAccess();
  if (*(void *)(v1 + 24) < v7)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  if (v6)
  {
    uint64_t v8 = (char *)(a1 + 32);
    unsigned int v9 = *(unsigned __int16 *)(v4 + 8);
    while (v9 != 0xFFFF)
    {
      char v10 = *v8++;
      *(unsigned char *)(v4 + 10 + v9++) = v10;
      *(_WORD *)(v4 + 8) = v9;
      if (!--v6) {
        return result;
      }
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t MIDIEventPacket.Builder.withUnsafePointer<A>(_:)(uint64_t (*a1)(void))
{
  swift_beginAccess();
  return a1(*(void *)(v1 + 16));
}

unint64_t static MIDIPacketList.sizeInBytes(pktList:)(int *a1)
{
  unint64_t v1 = (unint64_t)(a1 + 1);
  for (int i = *a1; i; --i)
    unint64_t v1 = (v1 + *(unsigned __int16 *)(v1 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
  return v1 - (void)a1;
}

unint64_t MIDIPacketNext(uint64_t a1)
{
  return (a1 + *(unsigned __int16 *)(a1 + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
}

MIDIPacket *UnsafeMutableMIDIPacketListPointer.init(_:byteSize:)@<X0>(MIDIPacketList *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = MIDIPacketListInit(a1);
  *a3 = a2;
  a3[1] = result;
  a3[2] = a1;
  return result;
}

void MIDIPacketList.UnsafeSequence.makeIterator()(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)*v1;
  *a1 = *v1 + 4;
  a1[1] = 0;
  a1[2] = v2;
}

void *MIDIPacketList.UnsafeSequence.Iterator.init(_:)@<X0>(void *result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(unsigned int *)*result;
  *a2 = *result + 4;
  a2[1] = 0;
  a2[2] = v2;
  return result;
}

uint64_t MIDIPacketList.UnsafeSequence.count.getter()
{
  return **v0;
}

unint64_t MIDIPacketList.UnsafeSequence.Iterator.next()()
{
  uint64_t v1 = v0[1];
  if (v1 >= (uint64_t)v0[2]) {
    return 0;
  }
  unint64_t result = *v0;
  if (v1 >= 1)
  {
    unint64_t result = (result + *(unsigned __int16 *)(result + 8) + 13) & 0xFFFFFFFFFFFFFFFCLL;
    *uint64_t v0 = result;
  }
  v0[1] = v1 + 1;
  return result;
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MIDIPacketList.UnsafeSequence.Iterator@<X0>(uint64_t *a1@<X8>)
{
  return protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator((uint64_t (*)(uint64_t))MIDIPacketNext, a1);
}

uint64_t protocol witness for IteratorProtocol.next() in conformance MIDIEventList.UnsafeSequence.Iterator@<X0>(uint64_t (*a1)(uint64_t)@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4 = v2[1];
  if (v4 >= v2[2])
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t result = *v2;
    if (v4 >= 1)
    {
      uint64_t result = a1(result);
      *uint64_t v2 = result;
    }
    v2[1] = v4 + 1;
  }
  *a2 = result;
  return result;
}

void protocol witness for Sequence.makeIterator() in conformance MIDIPacketList.UnsafeSequence(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int *)*v1;
  *a1 = *v1 + 4;
  a1[1] = 0;
  a1[2] = v2;
}

unsigned int *protocol witness for Sequence._copyToContiguousArray() in conformance MIDIPacketList.UnsafeSequence()
{
  return specialized _copySequenceToContiguousArray<A>(_:)(*v0);
}

unint64_t *protocol witness for Sequence._copyContents(initializing:) in conformance MIDIPacketList.UnsafeSequence(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t UnsafeMutableMIDIPacketListPointer.listSizeInBytes.getter()
{
  return *(void *)v0;
}

uint64_t UnsafeMutableMIDIPacketListPointer.lastPacket.getter()
{
  return *(void *)(v0 + 8);
}

MIDIPacket *UnsafeMutableMIDIPacketListPointer.init(_:byteSize:)@<X0>(MIDIPacket *pktlist@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = pktlist;
  if (pktlist) {
    pktlist = MIDIPacketListInit((MIDIPacketList *)pktlist);
  }
  else {
    a2 = 0;
  }
  *a3 = a2;
  a3[1] = pktlist;
  a3[2] = v3;
  return pktlist;
}

uint64_t UnsafeMutableMIDIPacketListPointer.count.getter()
{
  return **(unsigned int **)(v0 + 16);
}

Swift::Void __swiftcall UnsafeMutableMIDIPacketListPointer.clear()()
{
  *(void *)(v0 + 8) = MIDIPacketListInit(*(MIDIPacketList **)(v0 + 16));
}

MIDIPacket *UnsafeMutableMIDIPacketListPointer.append(timestamp:data:)(MIDITimeStamp time, uint64_t a2)
{
  uint64_t v3 = *(MIDIPacket **)(v2 + 8);
  if (!v3) {
    return 0;
  }
  uint64_t result = MIDIPacketListAdd(*(MIDIPacketList **)(v2 + 16), *(void *)v2, v3, time, *(void *)(a2 + 16), (const Byte *)(a2 + 32));
  *(void *)(v2 + 8) = result;
  return result;
}

void UnsafeMutableMIDIPacketListPointer.makeIterator()(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int **)(v1 + 16);
  uint64_t v3 = *v2;
  *a1 = v2 + 1;
  a1[1] = 0;
  a1[2] = v3;
}

void protocol witness for Sequence.makeIterator() in conformance UnsafeMutableMIDIPacketListPointer(void *a1@<X8>)
{
  uint64_t v2 = *(unsigned int **)(v1 + 16);
  uint64_t v3 = *v2;
  *a1 = v2 + 1;
  a1[1] = 0;
  a1[2] = v3;
}

void protocol witness for Sequence._copyToContiguousArray() in conformance UnsafeMutableMIDIPacketListPointer()
{
  specialized _copySequenceToContiguousArray<A>(_:)(*(void *)v0, *(void *)(v0 + 8), *(unsigned int **)(v0 + 16));
}

unint64_t *protocol witness for Sequence._copyContents(initializing:) in conformance UnsafeMutableMIDIPacketListPointer(unint64_t *a1, unint64_t *a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *(void *)v3, *(void *)(v3 + 8), *(unsigned int **)(v3 + 16));
}

MIDIPacketList *MIDIPacketList.Builder.__allocating_init(byteSize:)(int64_t a1)
{
  uint64_t result = (MIDIPacketList *)swift_allocObject();
  if (a1 < 272)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = result;
    uint64_t result = (MIDIPacketList *)calloc(a1, 1uLL);
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = MIDIPacketListInit(result);
      *(void *)&v3->packet[0].data[2] = a1;
      *(void *)&v3->packet[0].data[10] = v5;
      *(void *)&v3->packet[0].data[18] = v4;
      return v3;
    }
  }
  __break(1u);
  return result;
}

int64_t MIDIPacketList.Builder.init(byteSize:)(int64_t result)
{
  if (result < 272)
  {
    __break(1u);
  }
  else
  {
    int64_t v2 = result;
    uint64_t result = (int64_t)calloc(result, 1uLL);
    if (result)
    {
      int64_t v3 = result;
      uint64_t v4 = MIDIPacketListInit((MIDIPacketList *)result);
      v1[2] = v2;
      v1[3] = v4;
      v1[4] = v3;
      return (int64_t)v1;
    }
  }
  __break(1u);
  return result;
}

uint64_t MIDIPacketList.Builder.deinit()
{
  swift_beginAccess();
  free(*(void **)(v0 + 32));
  return v0;
}

uint64_t MIDIPacketList.Builder.__deallocating_deinit()
{
  swift_beginAccess();
  free(*(void **)(v0 + 32));
  return swift_deallocClassInstance();
}

MIDIPacket *MIDIPacketList.Builder.append(timestamp:data:)(MIDITimeStamp a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t v5 = *(MIDIPacket **)(v2 + 24);
  if (v5)
  {
    uint64_t v6 = MIDIPacketListAdd(*(MIDIPacketList **)(v2 + 32), *(void *)(v2 + 16), v5, a1, *(void *)(a2 + 16), (const Byte *)(a2 + 32));
    *(void *)(v2 + 24) = v6;
  }
  else
  {
    uint64_t v6 = 0;
  }
  swift_endAccess();
  return v6;
}

Swift::Void __swiftcall MIDIPacketList.Builder.clear()()
{
  swift_beginAccess();
  *(void *)(v0 + 24) = MIDIPacketListInit(*(MIDIPacketList **)(v0 + 32));
  swift_endAccess();
}

uint64_t MIDIPacketList.Builder.count.getter()
{
  swift_beginAccess();
  return **(unsigned int **)(v0 + 32);
}

uint64_t MIDIPacketList.Builder.withUnsafePointer<A>(_:)(uint64_t (*a1)(void))
{
  swift_beginAccess();
  return a1(*(void *)(v1 + 32));
}

unint64_t lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer()
{
  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, (void (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.Indices : RandomAccessCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, (void (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
}

uint64_t associated type witness table accessor for Collection.Index : Comparable in UnsafeMutableMIDIEventPacketPointer()
{
  return MEMORY[0x263F8D6E0];
}

uint64_t associated type witness table accessor for Collection.Indices : Collection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>);
}

uint64_t associated type witness table accessor for Collection.Indices : BidirectionalCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(&lazy protocol witness table cache variable for type Range<Int> and conformance <> Range<A>);
}

uint64_t lazy protocol witness table accessor for type Range<Int> and conformance <> Range<A>(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Range<Int>);
    lazy protocol witness table accessor for type Int and conformance Int();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in UnsafeMutableMIDIEventPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIEventPacketPointer>, (void (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIEventPacketPointer and conformance UnsafeMutableMIDIEventPacketPointer);
}

unint64_t lazy protocol witness table accessor for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordSequence.Iterator and conformance MIDIEventPacket.WordSequence.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection()
{
  unint64_t result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection;
  if (!lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIEventPacket.WordCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIEventPacket.WordCollection>, (void (*)(void))lazy protocol witness table accessor for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIEventPacket.WordCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIEventPacket.WordCollection>, (void (*)(void))lazy protocol witness table accessor for type MIDIEventPacket.WordCollection and conformance MIDIEventPacket.WordCollection);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIEventPacket.WordCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<MIDIEventPacket.WordCollection>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in MIDIEventPacket.WordCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<MIDIEventPacket.WordCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<MIDIEventPacket.WordCollection>);
}

unint64_t lazy protocol witness table accessor for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIEventList.UnsafeSequence.Iterator and conformance MIDIEventList.UnsafeSequence.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer()
{
  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer;
  if (!lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : MutableCollection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, (void (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, (void (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in UnsafeMutableMIDIPacketPointer()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<UnsafeMutableMIDIPacketPointer> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<UnsafeMutableMIDIPacketPointer>, (void (*)(void))lazy protocol witness table accessor for type UnsafeMutableMIDIPacketPointer and conformance UnsafeMutableMIDIPacketPointer);
}

unint64_t lazy protocol witness table accessor for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteSequence.Iterator and conformance MIDIPacket.ByteSequence.Iterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection()
{
  unint64_t result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection;
  if (!lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : RandomAccessCollection in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIPacket.ByteCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIPacket.ByteCollection>, (void (*)(void))lazy protocol witness table accessor for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
}

uint64_t associated type witness table accessor for Collection.SubSequence : BidirectionalCollection in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIPacket.ByteCollection> and conformance <> Slice<A>, &demangling cache variable for type metadata for Slice<MIDIPacket.ByteCollection>, (void (*)(void))lazy protocol witness table accessor for type MIDIPacket.ByteCollection and conformance MIDIPacket.ByteCollection);
}

uint64_t lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance <> Slice<A>(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t associated type witness table accessor for Collection.SubSequence : Collection in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type Slice<MIDIPacket.ByteCollection> and conformance Slice<A>, &demangling cache variable for type metadata for Slice<MIDIPacket.ByteCollection>);
}

uint64_t associated type witness table accessor for Sequence.Iterator : IteratorProtocol in MIDIPacket.ByteCollection()
{
  return lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(&lazy protocol witness table cache variable for type IndexingIterator<MIDIPacket.ByteCollection> and conformance IndexingIterator<A>, &demangling cache variable for type metadata for IndexingIterator<MIDIPacket.ByteCollection>);
}

uint64_t lazy protocol witness table accessor for type Slice<UnsafeMutableMIDIEventPacketPointer> and conformance Slice<A>(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator;
  if (!lazy protocol witness table cache variable for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type MIDIPacketList.UnsafeSequence.Iterator and conformance MIDIPacketList.UnsafeSequence.Iterator);
  }
  return result;
}

uint64_t sub_212839838()
{
  return 0;
}

uint64_t sub_212839848()
{
  return 0;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIEventPacketPointer()
{
  return &type metadata for UnsafeMutableMIDIEventPacketPointer;
}

ValueMetadata *type metadata accessor for MIDIEventPacket.WordSequence()
{
  return &type metadata for MIDIEventPacket.WordSequence;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for MIDIEventPacket.WordSequence.Iterator()
{
  return &type metadata for MIDIEventPacket.WordSequence.Iterator;
}

ValueMetadata *type metadata accessor for MIDIEventPacket.WordCollection()
{
  return &type metadata for MIDIEventPacket.WordCollection;
}

uint64_t type metadata accessor for MIDIEventPacket.Builder()
{
  return self;
}

uint64_t method lookup function for MIDIEventPacket.Builder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MIDIEventPacket.Builder);
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.capacity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.__allocating_init(maximumNumberMIDIWords:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.count.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.timeStamp.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.timeStamp.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.timeStamp.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.append(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.withUnsafePointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of MIDIEventPacket.Builder.withUnsafeMutableMIDIEventPacketPointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

ValueMetadata *type metadata accessor for MIDIEventList.UnsafeSequence()
{
  return &type metadata for MIDIEventList.UnsafeSequence;
}

ValueMetadata *type metadata accessor for MIDIEventList.UnsafeSequence.Iterator()
{
  return &type metadata for MIDIEventList.UnsafeSequence.Iterator;
}

uint64_t initializeBufferWithCopyOfBuffer for UnsafeMutableMIDIEventListPointer(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for UnsafeMutableMIDIEventListPointer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 24)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeMutableMIDIEventListPointer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    if (a3 >= 2) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 32) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIEventListPointer()
{
  return &type metadata for UnsafeMutableMIDIEventListPointer;
}

uint64_t type metadata accessor for MIDIEventList.Builder()
{
  return self;
}

uint64_t method lookup function for MIDIEventList.Builder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MIDIEventList.Builder);
}

uint64_t dispatch thunk of MIDIEventList.Builder.__allocating_init(inProtocol:wordSize:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.append(timestamp:words:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.clear()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.count.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.withUnsafePointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MIDIEventList.Builder.withUnsafeMutableMIDIEventListPointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIPacketPointer()
{
  return &type metadata for UnsafeMutableMIDIPacketPointer;
}

ValueMetadata *type metadata accessor for MIDIPacket.ByteSequence()
{
  return &type metadata for MIDIPacket.ByteSequence;
}

ValueMetadata *type metadata accessor for MIDIPacket.ByteSequence.Iterator()
{
  return &type metadata for MIDIPacket.ByteSequence.Iterator;
}

ValueMetadata *type metadata accessor for MIDIPacket.ByteCollection()
{
  return &type metadata for MIDIPacket.ByteCollection;
}

uint64_t type metadata accessor for MIDIPacket.Builder()
{
  return self;
}

uint64_t method lookup function for MIDIPacket.Builder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MIDIPacket.Builder);
}

uint64_t dispatch thunk of MIDIPacket.Builder.capacity.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.__allocating_init(maximumNumberMIDIBytes:)()
{
  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.count.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.timeStamp.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 160))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.timeStamp.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 168))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.timeStamp.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 176))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.append(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 184))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.withUnsafePointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 192))();
}

uint64_t dispatch thunk of MIDIPacket.Builder.withUnsafeMutableMIDIPacketPointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 200))();
}

uint64_t getEnumTagSinglePayload for UnsafeMutableMIDIEventPacketPointer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeMutableMIDIEventPacketPointer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MIDIPacketList.UnsafeSequence()
{
  return &type metadata for MIDIPacketList.UnsafeSequence;
}

uint64_t getEnumTagSinglePayload for MIDIEventPacket.WordSequence.Iterator(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for MIDIEventPacket.WordSequence.Iterator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MIDIPacketList.UnsafeSequence.Iterator()
{
  return &type metadata for MIDIPacketList.UnsafeSequence.Iterator;
}

uint64_t getEnumTagSinglePayload for UnsafeMutableMIDIPacketListPointer(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)(a1 + 16)) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsafeMutableMIDIPacketListPointer(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsafeMutableMIDIPacketListPointer()
{
  return &type metadata for UnsafeMutableMIDIPacketListPointer;
}

uint64_t type metadata accessor for MIDIPacketList.Builder()
{
  return self;
}

uint64_t method lookup function for MIDIPacketList.Builder(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MIDIPacketList.Builder);
}

uint64_t dispatch thunk of MIDIPacketList.Builder.__allocating_init(byteSize:)()
{
  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MIDIPacketList.Builder.append(timestamp:data:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 120))();
}

uint64_t dispatch thunk of MIDIPacketList.Builder.clear()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 128))();
}

uint64_t dispatch thunk of MIDIPacketList.Builder.count.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 136))();
}

uint64_t dispatch thunk of MIDIPacketList.Builder.withUnsafePointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 144))();
}

uint64_t dispatch thunk of MIDIPacketList.Builder.withUnsafeMutableMIDIPacketListPointer<A>(_:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 152))();
}

void type metadata accessor for MIDIProtocolID(uint64_t a1)
{
}

void *__swift_memcpy272_4(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x110uLL);
}

uint64_t getEnumTagSinglePayload for MIDIPacketList(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 272)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MIDIPacketList(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 264) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 272) = v3;
  return result;
}

void type metadata accessor for MIDIPacketList(uint64_t a1)
{
}

void *__swift_memcpy268_4(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x10CuLL);
}

uint64_t getEnumTagSinglePayload for MIDIPacket(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 268)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MIDIPacket(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 264) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 268) = v3;
  return result;
}

void type metadata accessor for MIDIPacket(uint64_t a1)
{
}

void *__swift_memcpy276_4(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x114uLL);
}

uint64_t getEnumTagSinglePayload for MIDIEventList(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 276)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for MIDIEventList(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 264) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 272) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 276) = v3;
  return result;
}

void type metadata accessor for MIDIEventList(uint64_t a1)
{
}

void type metadata accessor for MIDIEventPacket(uint64_t a1)
{
}

void type metadata accessor for MIDIProtocolID(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t *specialized _writeBackMutableSlice<A, B>(_:bounds:slice:)(uint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v6 = *result;
  unint64_t v7 = *(unsigned int *)(*result + 8);
  if ((uint64_t)v7 < a3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a2 >= a3)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (1)
    {
      unint64_t v9 = a4 + v8;
      if (a4 + v8 >= a5) {
        break;
      }
      if (a4 < 0) {
        goto LABEL_20;
      }
      if (v9 >= *(unsigned int *)(a6 + 8)) {
        goto LABEL_21;
      }
      if (a2 + v8 >= v7) {
        goto LABEL_22;
      }
      *(_DWORD *)(v6 + 4 * a2 + 12 + 4 * v8) = *(_DWORD *)(a6 + 4 * a4 + 12 + 4 * v8);
      uint64_t v6 = *result;
      unint64_t v7 = *(unsigned int *)(*result + 8);
      if (a2 + v8 >= v7) {
        goto LABEL_23;
      }
      if (v9 >= *(unsigned int *)(a6 + 8)) {
        goto LABEL_24;
      }
      if (~a2 + a3 == v8) {
        goto LABEL_16;
      }
      ++v8;
      if (!(a4 - a5 + v8))
      {
        __break(1u);
LABEL_16:
        a4 += v8 + 1;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_17:
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  if (a2 < 0)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v6 = *result;
  unint64_t v7 = *(unsigned __int16 *)(*result + 8);
  if ((uint64_t)v7 < a3)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (a2 != a3)
  {
    if (a4 == a5)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    if (a2 >= a3)
    {
LABEL_29:
      __break(1u);
      return result;
    }
    uint64_t v8 = 0;
    while (1)
    {
      unint64_t v9 = a4 + v8;
      if (a4 + v8 >= a5) {
        break;
      }
      if (a4 < 0) {
        goto LABEL_20;
      }
      if (v9 >= *(unsigned __int16 *)(a6 + 8)) {
        goto LABEL_21;
      }
      if (a2 + v8 >= v7) {
        goto LABEL_22;
      }
      *(unsigned char *)(v6 + a2 + v8 + 10) = *(unsigned char *)(a4 + a6 + 10 + v8);
      uint64_t v6 = *result;
      unint64_t v7 = *(unsigned __int16 *)(*result + 8);
      if (a2 + v8 >= v7) {
        goto LABEL_23;
      }
      if (v9 >= *(unsigned __int16 *)(a6 + 8)) {
        goto LABEL_24;
      }
      if (~a2 + a3 == v8) {
        goto LABEL_16;
      }
      ++v8;
      if (!(a4 - a5 + v8))
      {
        __break(1u);
LABEL_16:
        a4 += v8 + 1;
        goto LABEL_17;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_17:
  if (a4 != a5)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  return result;
}

unint64_t specialized MutableCollection<>._partitionImpl(by:)(unint64_t result)
{
  uint64_t v3 = *v1;
  int64_t v4 = *(unsigned int *)(*v1 + 8);
  if (v4)
  {
    uint64_t v5 = (uint64_t (*)(int *))result;
    unint64_t v6 = 0;
    while (v6 < *(unsigned int *)(v3 + 8))
    {
      int v11 = *(_DWORD *)(v3 + 4 * v6 + 12);
      __n128 result = v5(&v11);
      if (v2) {
        return v6;
      }
      uint64_t v3 = *v1;
      int64_t v7 = *(unsigned int *)(*v1 + 8);
      if (result)
      {
        if (v4 > v7) {
          goto LABEL_25;
        }
        if ((uint64_t)v6 >= v4 - 1) {
          return v6;
        }
        for (int64_t i = v4 + 2; ; --i)
        {
          int64_t v4 = i - 3;
          if (i - 3 >= v7)
          {
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          int v10 = *(_DWORD *)(v3 + 4 * i);
          __n128 result = v5(&v10);
          if ((result & 1) == 0) {
            break;
          }
          uint64_t v3 = *v1;
          int64_t v7 = *(unsigned int *)(*v1 + 8);
          if (v4 > v7) {
            goto LABEL_23;
          }
          int64_t v9 = i - 4;
          if ((uint64_t)v6 >= v9) {
            return v6;
          }
        }
        __n128 result = specialized MutableCollection.swapAt(_:_:)(v6, i - 3);
        uint64_t v3 = *v1;
        if (v6 >= *(unsigned int *)(*v1 + 8)) {
          goto LABEL_27;
        }
      }
      else if (v6 >= v7)
      {
        goto LABEL_26;
      }
      if ((uint64_t)++v6 >= v4) {
        return v6;
      }
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t (*v5)(char *);
  unint64_t v6;
  int64_t v7;
  int64_t i;
  int64_t v9;
  char v10;
  char v11;

  uint64_t v3 = *v1;
  int64_t v4 = *(unsigned __int16 *)(*v1 + 8);
  if (*(_WORD *)(*v1 + 8))
  {
    uint64_t v5 = (uint64_t (*)(char *))result;
    unint64_t v6 = 0;
    while (v6 < *(unsigned __int16 *)(v3 + 8))
    {
      int v11 = *(unsigned char *)(v3 + v6 + 10);
      __n128 result = v5(&v11);
      if (v2) {
        return v6;
      }
      uint64_t v3 = *v1;
      int64_t v7 = *(unsigned __int16 *)(*v1 + 8);
      if (result)
      {
        if (v4 > v7) {
          goto LABEL_25;
        }
        if ((uint64_t)v6 >= v4 - 1) {
          return v6;
        }
        for (int64_t i = v4 + 9; ; --i)
        {
          int64_t v4 = i - 10;
          if (i - 10 >= v7)
          {
            __break(1u);
LABEL_23:
            __break(1u);
            goto LABEL_24;
          }
          int v10 = *(unsigned char *)(v3 + i);
          __n128 result = v5(&v10);
          if ((result & 1) == 0) {
            break;
          }
          uint64_t v3 = *v1;
          int64_t v7 = *(unsigned __int16 *)(*v1 + 8);
          if (v4 > v7) {
            goto LABEL_23;
          }
          int64_t v9 = i - 11;
          if ((uint64_t)v6 >= v9) {
            return v6;
          }
        }
        __n128 result = specialized MutableCollection.swapAt(_:_:)(v6, i - 10);
        uint64_t v3 = *v1;
        if (v6 >= *(unsigned __int16 *)(*v1 + 8)) {
          goto LABEL_27;
        }
      }
      else if (v6 >= v7)
      {
        goto LABEL_26;
      }
      if ((uint64_t)++v6 >= v4) {
        return v6;
      }
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t specialized _copySequenceToContiguousArray<A>(_:)(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = 0;
  if (v1)
  {
    int64_t v4 = (int *)(result + 12);
    uint64_t v5 = (_DWORD *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      int v7 = *v4++;
      int v6 = v7;
      if (!v3)
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_26;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
        int v11 = (void *)swift_allocObject();
        int64_t v12 = _swift_stdlib_malloc_size(v11);
        uint64_t v13 = v12 - 32;
        if (v12 < 32) {
          uint64_t v13 = v12 - 29;
        }
        uint64_t v14 = v13 >> 2;
        v11[2] = v10;
        v11[3] = 2 * (v13 >> 2);
        unint64_t v15 = (unint64_t)(v11 + 4);
        uint64_t v16 = v2[3] >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v15 >= (unint64_t)v2 + 4 * v16 + 32) {
            memmove(v11 + 4, v2 + 4, 4 * v16);
          }
          v2[2] = 0;
        }
        uint64_t v5 = (_DWORD *)(v15 + 4 * v16);
        uint64_t v3 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - v16;
        __n128 result = swift_release();
        uint64_t v2 = v11;
      }
      BOOL v18 = __OFSUB__(v3--, 1);
      if (v18) {
        break;
      }
      *v5++ = v6;
      if (!--v1) {
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
LABEL_21:
  unint64_t v19 = v2[3];
  if (v19 < 2) {
    return (uint64_t)v2;
  }
  unint64_t v20 = v19 >> 1;
  BOOL v18 = __OFSUB__(v20, v3);
  uint64_t v21 = v20 - v3;
  if (!v18)
  {
    v2[2] = v21;
    return (uint64_t)v2;
  }
LABEL_27:
  __break(1u);
  return result;
}

{
  uint64_t v1;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;

  uint64_t v1 = *(unsigned int *)(result + 4);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  if (v1)
  {
    uint64_t v3 = *(void *)(MEMORY[0x263F8EE78] + 24);
    if ((uint64_t)((v3 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_42;
    }
    int64_t v4 = result + 8;
    uint64_t v5 = v3 & 0xFFFFFFFFFFFFFFFELL;
    if (v5 <= 1) {
      int v6 = 1;
    }
    else {
      int v6 = v5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
    int v7 = (void *)swift_allocObject();
    unint64_t v8 = _swift_stdlib_malloc_size(v7);
    int64_t v9 = v8 - 32;
    if (v8 < 32) {
      int64_t v9 = v8 - 25;
    }
    uint64_t v10 = v9 >> 3;
    v7[2] = v6;
    v7[3] = 2 * v10;
    int v11 = v7 + 4;
    int64_t v12 = v2[3] >> 1;
    uint64_t v13 = &v7[v12 + 4];
    uint64_t v14 = v10 & 0x7FFFFFFFFFFFFFFFLL;
    if (v2[2])
    {
      if (v7 != v2 || v11 >= &v2[v12 + 4]) {
        memcpy(v11, v2 + 4, 8 * v12);
      }
      v2[2] = 0;
    }
    __n128 result = swift_release();
    uint64_t v16 = v14 + ~v12;
    *uint64_t v13 = v4;
    if (v1 != 1)
    {
      for (int64_t i = v1 - 1; i; --i)
      {
        BOOL v18 = *(unsigned int *)(v4 + 8);
        if (v16)
        {
          ++v13;
          unint64_t v19 = __OFSUB__(v16--, 1);
          if (v19) {
            goto LABEL_41;
          }
        }
        else
        {
          unint64_t v20 = v7[3];
          if ((uint64_t)((v20 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_42;
          }
          uint64_t v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
          if (v21 <= 1) {
            v22 = 1;
          }
          else {
            v22 = v21;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
          v23 = (void *)swift_allocObject();
          v24 = _swift_stdlib_malloc_size(v23);
          v25 = v24 - 32;
          if (v24 < 32) {
            v25 = v24 - 25;
          }
          v26 = v25 >> 3;
          v23[2] = v22;
          v23[3] = 2 * (v25 >> 3);
          v27 = (unint64_t)(v23 + 4);
          v28 = v7[3] >> 1;
          if (v7[2])
          {
            v29 = v7 + 4;
            if (v23 != v7 || v27 >= (unint64_t)v29 + 8 * v28) {
              memmove(v23 + 4, v29, 8 * v28);
            }
            v7[2] = 0;
          }
          uint64_t v13 = (uint64_t *)(v27 + 8 * v28);
          v30 = (v26 & 0x7FFFFFFFFFFFFFFFLL) - v28;
          __n128 result = swift_release();
          int v7 = v23;
          unint64_t v19 = __OFSUB__(v30, 1);
          uint64_t v16 = v30 - 1;
          if (v19)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return result;
          }
        }
        v4 += 4 * v18 + 12;
        *uint64_t v13 = v4;
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
    int v7 = (void *)MEMORY[0x263F8EE78];
  }
  v31 = v7[3];
  if (v31 >= 2)
  {
    v32 = v31 >> 1;
    unint64_t v19 = __OFSUB__(v32, v16);
    v33 = v32 - v16;
    if (v19) {
      goto LABEL_43;
    }
    v7[2] = v33;
  }
  return (uint64_t)v7;
}

{
  uint64_t v1;
  void *v2;
  size_t v3;
  char *v4;
  unsigned char *v5;
  char v6;
  char v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  size_t v12;
  unint64_t v13;
  size_t v14;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  uint64_t v1 = *(unsigned __int16 *)(result + 8);
  uint64_t v2 = (void *)MEMORY[0x263F8EE78];
  uint64_t v3 = 0;
  if (*(_WORD *)(result + 8))
  {
    int64_t v4 = (char *)(result + 10);
    uint64_t v5 = (unsigned char *)(MEMORY[0x263F8EE78] + 32);
    while (1)
    {
      int v7 = *v4++;
      int v6 = v7;
      if (!v3)
      {
        unint64_t v8 = v2[3];
        if ((uint64_t)((v8 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_24;
        }
        int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
        if (v9 <= 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v9;
        }
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
        int v11 = (void *)swift_allocObject();
        int64_t v12 = 2 * _swift_stdlib_malloc_size(v11) - 64;
        v11[2] = v10;
        v11[3] = v12;
        uint64_t v13 = (unint64_t)(v11 + 4);
        uint64_t v14 = v2[3] >> 1;
        if (v2[2])
        {
          if (v11 != v2 || v13 >= (unint64_t)v2 + v14 + 32) {
            memmove(v11 + 4, v2 + 4, v14);
          }
          v2[2] = 0;
        }
        uint64_t v5 = (unsigned char *)(v13 + v14);
        uint64_t v3 = (v12 >> 1) - v14;
        __n128 result = swift_release();
        uint64_t v2 = v11;
      }
      uint64_t v16 = __OFSUB__(v3--, 1);
      if (v16) {
        break;
      }
      *v5++ = v6;
      if (!--v1) {
        goto LABEL_19;
      }
    }
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
LABEL_19:
  v17 = v2[3];
  if (v17 < 2) {
    return (uint64_t)v2;
  }
  BOOL v18 = v17 >> 1;
  uint64_t v16 = __OFSUB__(v18, v3);
  unint64_t v19 = v18 - v3;
  if (!v16)
  {
    v2[2] = v19;
    return (uint64_t)v2;
  }
LABEL_25:
  __break(1u);
  return result;
}

void specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned int *)(a4 + 4);
  uint64_t v5 = (void *)MEMORY[0x263F8EE78];
  if (v4)
  {
    unint64_t v6 = *(void *)(MEMORY[0x263F8EE78] + 24);
    if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_42;
    }
    uint64_t v7 = a4 + 8;
    int64_t v8 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    uint64_t v13 = v12 >> 3;
    v10[2] = v9;
    v10[3] = 2 * v13;
    uint64_t v14 = v10 + 4;
    uint64_t v15 = v5[3] >> 1;
    uint64_t v16 = &v10[v15 + 4];
    uint64_t v17 = v13 & 0x7FFFFFFFFFFFFFFFLL;
    if (v5[2])
    {
      if (v10 != v5 || v14 >= &v5[v15 + 4]) {
        memcpy(v14, v5 + 4, 8 * v15);
      }
      v5[2] = 0;
    }
    swift_release();
    uint64_t v19 = v17 + ~v15;
    *uint64_t v16 = v7;
    if (v4 != 1)
    {
      for (uint64_t i = v4 - 1; i; --i)
      {
        uint64_t v21 = *(unsigned int *)(v7 + 8);
        if (v19)
        {
          ++v16;
          BOOL v22 = __OFSUB__(v19--, 1);
          if (v22) {
            goto LABEL_41;
          }
        }
        else
        {
          unint64_t v23 = v10[3];
          if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_42;
          }
          int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
          if (v24 <= 1) {
            uint64_t v25 = 1;
          }
          else {
            uint64_t v25 = v24;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIEventPacket>>);
          v26 = (void *)swift_allocObject();
          int64_t v27 = _swift_stdlib_malloc_size(v26);
          uint64_t v28 = v27 - 32;
          if (v27 < 32) {
            uint64_t v28 = v27 - 25;
          }
          uint64_t v29 = v28 >> 3;
          v26[2] = v25;
          v26[3] = 2 * (v28 >> 3);
          unint64_t v30 = (unint64_t)(v26 + 4);
          uint64_t v31 = v10[3] >> 1;
          if (v10[2])
          {
            v32 = v10 + 4;
            if (v26 != v10 || v30 >= (unint64_t)v32 + 8 * v31) {
              memmove(v26 + 4, v32, 8 * v31);
            }
            v10[2] = 0;
          }
          uint64_t v16 = (void *)(v30 + 8 * v31);
          uint64_t v33 = (v29 & 0x7FFFFFFFFFFFFFFFLL) - v31;
          swift_release();
          uint64_t v10 = v26;
          BOOL v22 = __OFSUB__(v33, 1);
          uint64_t v19 = v33 - 1;
          if (v22)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return;
          }
        }
        v7 += 4 * v21 + 12;
        *uint64_t v16 = v7;
      }
    }
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v34 = v10[3];
  if (v34 >= 2)
  {
    unint64_t v35 = v34 >> 1;
    BOOL v22 = __OFSUB__(v35, v19);
    unint64_t v36 = v35 - v19;
    if (v22) {
      goto LABEL_43;
    }
    v10[2] = v36;
  }
}

unsigned int *specialized _copySequenceToContiguousArray<A>(_:)(unsigned int *result)
{
  unint64_t v1 = (unint64_t)(result + 1);
  uint64_t v2 = *result;
  uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  if (v2)
  {
    unint64_t v4 = *(void *)(MEMORY[0x263F8EE78] + 24);
    if ((uint64_t)((v4 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_42;
    }
    int64_t v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
    if (v5 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
    uint64_t v7 = (void *)swift_allocObject();
    int64_t v8 = _swift_stdlib_malloc_size(v7);
    uint64_t v9 = v8 - 32;
    if (v8 < 32) {
      uint64_t v9 = v8 - 25;
    }
    uint64_t v10 = v9 >> 3;
    v7[2] = v6;
    v7[3] = 2 * v10;
    int64_t v11 = v7 + 4;
    uint64_t v12 = v3[3] >> 1;
    uint64_t v13 = &v7[v12 + 4];
    uint64_t v14 = v10 & 0x7FFFFFFFFFFFFFFFLL;
    if (v3[2])
    {
      if (v7 != v3 || v11 >= &v3[v12 + 4]) {
        memcpy(v11, v3 + 4, 8 * v12);
      }
      v3[2] = 0;
    }
    __n128 result = (unsigned int *)swift_release();
    uint64_t v16 = v14 + ~v12;
    *uint64_t v13 = v1;
    if (v2 != 1)
    {
      for (uint64_t i = v2 - 1; i; --i)
      {
        uint64_t v18 = *(unsigned __int16 *)(v1 + 8);
        if (v16)
        {
          ++v13;
          BOOL v19 = __OFSUB__(v16--, 1);
          if (v19) {
            goto LABEL_41;
          }
        }
        else
        {
          unint64_t v20 = v7[3];
          if ((uint64_t)((v20 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_42;
          }
          int64_t v21 = v20 & 0xFFFFFFFFFFFFFFFELL;
          if (v21 <= 1) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v21;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
          unint64_t v23 = (void *)swift_allocObject();
          int64_t v24 = _swift_stdlib_malloc_size(v23);
          uint64_t v25 = v24 - 32;
          if (v24 < 32) {
            uint64_t v25 = v24 - 25;
          }
          uint64_t v26 = v25 >> 3;
          v23[2] = v22;
          v23[3] = 2 * (v25 >> 3);
          unint64_t v27 = (unint64_t)(v23 + 4);
          uint64_t v28 = v7[3] >> 1;
          if (v7[2])
          {
            uint64_t v29 = v7 + 4;
            if (v23 != v7 || v27 >= (unint64_t)v29 + 8 * v28) {
              memmove(v23 + 4, v29, 8 * v28);
            }
            v7[2] = 0;
          }
          uint64_t v13 = (unint64_t *)(v27 + 8 * v28);
          uint64_t v30 = (v26 & 0x7FFFFFFFFFFFFFFFLL) - v28;
          __n128 result = (unsigned int *)swift_release();
          uint64_t v7 = v23;
          BOOL v19 = __OFSUB__(v30, 1);
          uint64_t v16 = v30 - 1;
          if (v19)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return result;
          }
        }
        unint64_t v1 = (v1 + v18 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        *uint64_t v13 = v1;
      }
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v7 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v31 = v7[3];
  if (v31 >= 2)
  {
    unint64_t v32 = v31 >> 1;
    BOOL v19 = __OFSUB__(v32, v16);
    unint64_t v33 = v32 - v16;
    if (v19) {
      goto LABEL_43;
    }
    v7[2] = v33;
  }
  return (unsigned int *)v7;
}

void specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  unint64_t v3 = (unint64_t)(a3 + 1);
  uint64_t v4 = *a3;
  int64_t v5 = (void *)MEMORY[0x263F8EE78];
  if (v4)
  {
    unint64_t v6 = *(void *)(MEMORY[0x263F8EE78] + 24);
    if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0) {
      goto LABEL_42;
    }
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
    uint64_t v9 = (void *)swift_allocObject();
    int64_t v10 = _swift_stdlib_malloc_size(v9);
    uint64_t v11 = v10 - 32;
    if (v10 < 32) {
      uint64_t v11 = v10 - 25;
    }
    uint64_t v12 = v11 >> 3;
    v9[2] = v8;
    v9[3] = 2 * v12;
    uint64_t v13 = v9 + 4;
    uint64_t v14 = v5[3] >> 1;
    uint64_t v15 = &v9[v14 + 4];
    uint64_t v16 = v12 & 0x7FFFFFFFFFFFFFFFLL;
    if (v5[2])
    {
      if (v9 != v5 || v13 >= &v5[v14 + 4]) {
        memcpy(v13, v5 + 4, 8 * v14);
      }
      v5[2] = 0;
    }
    swift_release();
    uint64_t v18 = v16 + ~v14;
    *uint64_t v15 = v3;
    if (v4 != 1)
    {
      for (uint64_t i = v4 - 1; i; --i)
      {
        uint64_t v20 = *(unsigned __int16 *)(v3 + 8);
        if (v18)
        {
          ++v15;
          BOOL v21 = __OFSUB__(v18--, 1);
          if (v21) {
            goto LABEL_41;
          }
        }
        else
        {
          unint64_t v22 = v9[3];
          if ((uint64_t)((v22 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_42;
          }
          int64_t v23 = v22 & 0xFFFFFFFFFFFFFFFELL;
          if (v23 <= 1) {
            uint64_t v24 = 1;
          }
          else {
            uint64_t v24 = v23;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UnsafePointer<MIDIPacket>>);
          uint64_t v25 = (void *)swift_allocObject();
          int64_t v26 = _swift_stdlib_malloc_size(v25);
          uint64_t v27 = v26 - 32;
          if (v26 < 32) {
            uint64_t v27 = v26 - 25;
          }
          uint64_t v28 = v27 >> 3;
          v25[2] = v24;
          v25[3] = 2 * (v27 >> 3);
          unint64_t v29 = (unint64_t)(v25 + 4);
          uint64_t v30 = v9[3] >> 1;
          if (v9[2])
          {
            unint64_t v31 = v9 + 4;
            if (v25 != v9 || v29 >= (unint64_t)v31 + 8 * v30) {
              memmove(v25 + 4, v31, 8 * v30);
            }
            v9[2] = 0;
          }
          uint64_t v15 = (unint64_t *)(v29 + 8 * v30);
          uint64_t v32 = (v28 & 0x7FFFFFFFFFFFFFFFLL) - v30;
          swift_release();
          uint64_t v9 = v25;
          BOOL v21 = __OFSUB__(v32, 1);
          uint64_t v18 = v32 - 1;
          if (v21)
          {
LABEL_41:
            __break(1u);
LABEL_42:
            __break(1u);
LABEL_43:
            __break(1u);
            return;
          }
        }
        unint64_t v3 = (v3 + v20 + 13) & 0xFFFFFFFFFFFFFFFCLL;
        *uint64_t v15 = v3;
      }
    }
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v9 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v33 = v9[3];
  if (v33 >= 2)
  {
    unint64_t v34 = v33 >> 1;
    BOOL v21 = __OFSUB__(v34, v18);
    unint64_t v35 = v34 - v18;
    if (v21) {
      goto LABEL_43;
    }
    v9[2] = v35;
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(unsigned int *)(a4 + 8);
  int64_t v5 = (_DWORD *)(a4 + 12);
  if (!a2)
  {
    uint64_t v6 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
LABEL_22:
    uint64_t v6 = a3;
    goto LABEL_23;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = *(unsigned int *)(a4 + 8);
    if (v4)
    {
      *a2 = *v5;
      unint64_t v7 = a3 - 1;
      if (a3 != 1)
      {
        unint64_t v8 = a3 - 2;
        if (a3 - 2 >= (unint64_t)(v4 - 1)) {
          unint64_t v8 = v4 - 1;
        }
        if (v8 < v7) {
          unint64_t v7 = v8;
        }
        unint64_t v9 = v7 + 1;
        if (v9 > 8 && (unint64_t)a2 - a4 - 12 >= 0x20)
        {
          uint64_t v12 = v9 & 7;
          if ((v9 & 7) == 0) {
            uint64_t v12 = 8;
          }
          unint64_t v13 = v9 - v12;
          uint64_t v10 = v9 - v12 + 1;
          uint64_t v11 = &a2[v13];
          uint64_t v14 = (long long *)(a4 + 32);
          uint64_t v15 = a2 + 5;
          do
          {
            long long v16 = *v14;
            *(v15 - 1) = *(v14 - 1);
            *uint64_t v15 = v16;
            v14 += 2;
            v15 += 2;
            v13 -= 8;
          }
          while (v13);
        }
        else
        {
          uint64_t v10 = 1;
          uint64_t v11 = a2;
        }
        uint64_t v17 = v11 + 1;
        while (a3 != v10)
        {
          if (v4 == v10)
          {
            uint64_t v6 = v4;
            goto LABEL_23;
          }
          *v17++ = v5[v10];
          if (a3 == ++v10) {
            goto LABEL_22;
          }
        }
        __break(1u);
        goto LABEL_26;
      }
      goto LABEL_22;
    }
LABEL_23:
    *uint64_t result = v5;
    result[1] = v6;
    result[2] = v4;
    return (void *)v6;
  }
LABEL_26:
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (unsigned char *)(a4 + 10);
  uint64_t v5 = *(unsigned __int16 *)(a4 + 8);
  if (!a2)
  {
    uint64_t v6 = 0;
    goto LABEL_23;
  }
  if (!a3)
  {
LABEL_22:
    uint64_t v6 = a3;
    goto LABEL_23;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v6 = *(unsigned __int16 *)(a4 + 8);
    if (*(_WORD *)(a4 + 8))
    {
      *a2 = *v4;
      unint64_t v7 = a3 - 1;
      if (a3 != 1)
      {
        unint64_t v8 = a3 - 2;
        if (a3 - 2 >= (unint64_t)(v5 - 1)) {
          unint64_t v8 = v5 - 1;
        }
        if (v8 < v7) {
          unint64_t v7 = v8;
        }
        unint64_t v9 = v7 + 1;
        if (v9 > 0x10 && (unint64_t)&a2[-a4 - 10] >= 0x10)
        {
          uint64_t v12 = v9 & 0xF;
          if ((v9 & 0xF) == 0) {
            uint64_t v12 = 16;
          }
          unint64_t v13 = v9 - v12;
          uint64_t v10 = v9 - v12 + 1;
          uint64_t v11 = &a2[v13];
          uint64_t v14 = a2 + 1;
          uint64_t v15 = (long long *)(a4 + 11);
          do
          {
            long long v16 = *v15++;
            *v14++ = v16;
            v13 -= 16;
          }
          while (v13);
        }
        else
        {
          uint64_t v10 = 1;
          uint64_t v11 = a2;
        }
        uint64_t v17 = v11 + 1;
        while (a3 != v10)
        {
          if (v5 == v10)
          {
            uint64_t v6 = v5;
            goto LABEL_23;
          }
          *v17++ = v4[v10];
          if (a3 == ++v10) {
            goto LABEL_22;
          }
        }
        __break(1u);
        goto LABEL_26;
      }
      goto LABEL_22;
    }
LABEL_23:
    *uint64_t result = v4;
    result[1] = v6;
    result[2] = v5;
    return (void *)v6;
  }
LABEL_26:
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (!a2)
  {
LABEL_10:
    unint64_t v4 = 0;
    goto LABEL_11;
  }
  if (!a3)
  {
LABEL_12:
    unint64_t v4 = a3;
    goto LABEL_14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = *(unsigned __int16 *)(a4 + 8);
    if (*(_WORD *)(a4 + 8))
    {
      uint64_t v5 = 0;
      while (1)
      {
        *(unsigned char *)(a2 + v5) = *(unsigned char *)(a4 + 10 + v5);
        if (a3 - 1 == v5) {
          goto LABEL_12;
        }
        unint64_t v6 = v5 + 1;
        if (v5 + 1 == v4)
        {
          a3 = v5 + 1;
          goto LABEL_14;
        }
        unint64_t v4 = *(unsigned __int16 *)(a4 + 8);
        ++v5;
        if (v6 >= v4)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
    }
LABEL_11:
    a3 = 0;
LABEL_14:
    *uint64_t result = a4;
    result[1] = v4;
    return (void *)a3;
  }
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2)
  {
LABEL_11:
    a3 = 0;
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    *uint64_t result = a4;
    result[1] = a3;
    return (void *)a3;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (*(_DWORD *)(a4 + 8))
    {
      uint64_t v4 = 0;
      while (1)
      {
        *(_DWORD *)(a2 + 4 * v4) = *(_DWORD *)(a4 + 12 + 4 * v4);
        if (a3 - 1 == v4) {
          goto LABEL_12;
        }
        unint64_t v5 = *(unsigned int *)(a4 + 8);
        BOOL v6 = v4 + 1 >= v5;
        if (v4 + 1 == v5)
        {
          a3 = v4 + 1;
          goto LABEL_12;
        }
        ++v4;
        if (v6)
        {
          __break(1u);
          goto LABEL_11;
        }
      }
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if (!v1) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 29;
  }
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 2);
  if (specialized Sequence._copySequenceContents(initializing:)(&v7, (uint64_t)(v3 + 4), v1, a1) != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

{
  unint64_t v1;
  void *v3;
  size_t v4;
  uint64_t v6;

  uint64_t v1 = *(unsigned __int16 *)(a1 + 8);
  if (!*(_WORD *)(a1 + 8)) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  unint64_t v3 = (void *)swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * v4 - 64;
  if (specialized Sequence._copySequenceContents(initializing:)(&v6, (uint64_t)(v3 + 4), v1, a1) != (void *)v1)
  {
    __break(1u);
    return (void *)MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 8);
  if (!v1) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt32>);
  uint64_t v3 = swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  uint64_t v5 = v4 - 32;
  if (v4 < 32) {
    uint64_t v5 = v4 - 29;
  }
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * (v5 >> 2);
  if (specialized Sequence._copySequenceContents(initializing:)(v7, (_DWORD *)(v3 + 32), v1, a1) != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  void v6[3];

  uint64_t v1 = *(unsigned __int16 *)(a1 + 8);
  if (!*(_WORD *)(a1 + 8)) {
    return MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  uint64_t v3 = swift_allocObject();
  int64_t v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  if (specialized Sequence._copySequenceContents(initializing:)(v6, (unsigned char *)(v3 + 32), v1, a1) != (void *)v1)
  {
    __break(1u);
    return MEMORY[0x263F8EE78];
  }
  return v3;
}

uint64_t MutableCollection.withContiguousMutableStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D4C8]();
}

uint64_t MutableCollection._withUnsafeMutableBufferPointerIfSupported<A>(_:)()
{
  return MEMORY[0x270F9D4D0]();
}

uint64_t Sequence.withContiguousStorageIfAvailable<A>(_:)()
{
  return MEMORY[0x270F9D968]();
}

MIDIEventPacket *__cdecl MIDIEventListAdd(MIDIEventList *evtlist, ByteCount listSize, MIDIEventPacket *curPacket, MIDITimeStamp time, ByteCount wordCount, const UInt32 *words)
{
  return (MIDIEventPacket *)MEMORY[0x270EE7488](evtlist, listSize, curPacket, time, wordCount, words);
}

MIDIEventPacket *__cdecl MIDIEventListInit(MIDIEventList *evtlist, MIDIProtocolID protocol)
{
  return (MIDIEventPacket *)MEMORY[0x270EE7490](evtlist, *(void *)&protocol);
}

MIDIPacket *__cdecl MIDIPacketListAdd(MIDIPacketList *pktlist, ByteCount listSize, MIDIPacket *curPacket, MIDITimeStamp time, ByteCount nData, const Byte *data)
{
  return (MIDIPacket *)MEMORY[0x270EE74C8](pktlist, listSize, curPacket, time, nData, data);
}

MIDIPacket *__cdecl MIDIPacketListInit(MIDIPacketList *pktlist)
{
  return (MIDIPacket *)MEMORY[0x270EE74D0](pktlist);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}