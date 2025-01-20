void AlgsDevice::StreamingClient::translate(AlgsDevice::StreamingClient *this, PacketCollection *a2, PacketCollection *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  OUTLINED_FUNCTION_15();
  v6 = *(void *)(v3 + 104);
  if (v6)
  {
    v7 = v3;
    if (*(void *)(v3 + 112))
    {
      v8 = v5;
      v9 = v4;
      v10 = 0;
      for (i = 0; i < *(unsigned int *)(v6 + 20); ++i)
      {
        v12 = *(void *)(v7 + 112);
        if (i >= *(unsigned int *)(v12 + 20)) {
          break;
        }
        v13 = *(void *)(v6 + 8);
        v14 = *(void *)(v12 + 8);
        v15 = PacketCollection::getFor(v8, *(void *)(v13 + v10), *(void *)(v13 + v10 + 8), *(unsigned __int8 *)(v13 + v10 + 33));
        if (v15
          || (v15 = PacketCollection::getFor(v9, *(void *)(v13 + v10), *(void *)(v13 + v10 + 8), *(unsigned __int8 *)(v13 + v10 + 33))) != 0)
        {
          *(_OWORD *)v15 = *(_OWORD *)(v14 + v10);
          *(unsigned char *)(v15 + 33) = *(unsigned char *)(v14 + v10 + 33);
          if (*(unsigned char *)(v15 + 32) == 2)
          {
            *(unsigned char *)(v15 + 32) = 1;
            OUTLINED_FUNCTION_18();
            (*(void (**)(uint64_t))(v16 + 16))(v9);
          }
        }
        v6 = *(void *)(v7 + 104);
        v10 += 80;
      }
    }
  }
  OUTLINED_FUNCTION_12();
}

uint64_t PacketCollection::getFor(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = *(unsigned int *)(a1 + 20);
  while (1)
  {
    if (v6 == v5) {
      return 0;
    }
    uint64_t v7 = *(void *)(a1 + 8);
    BOOL v8 = *(void *)(v7 + v4) == a2 && *(void *)(v7 + v4 + 8) == a3;
    if (v8 && *(unsigned __int8 *)(v7 + v4 + 33) == a4) {
      break;
    }
    ++v5;
    v4 += 80;
  }
  uint64_t v10 = 0;
  if ((v5 & 0x80000000) == 0 && v6 > v5)
  {
    uint64_t v10 = v7 + 80 * v5;
    int v11 = *(unsigned __int8 *)(v10 + 32);
    BOOL v12 = v11 == 2 && *(unsigned char *)(*(void *)(a1 + 32) + 2 * v5) != 0;
    if (v11 == 1 || v12)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 2 * v5 + 1) = 1;
      return v10;
    }
    return 0;
  }
  return v10;
}

uint64_t AlgTaskNode::runTask(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_20(this, a2, a3);
  if ((v8 & 1) == 0) {
    (*(void (**)(uint64_t))(*(void *)v7 + 64))(v7);
  }
  for (unint64_t i = 0; i < *(unsigned int *)(v7 + 124); ++i)
  {
    uint64_t v10 = *(void **)(*(void *)(v7 + 112) + 8 * i);
    int v11 = *(void (**)(void, void))(v5 + 80);
    if (v11) {
      v11(*(void *)(v5 + 88), v10[13]);
    }
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v10 + 16))(v10, v6, v5, v4, v3, v8);
  }
  if ((v8 & 1) == 0) {
    (*(void (**)(uint64_t))(*(void *)v7 + 72))(v7);
  }
  OUTLINED_FUNCTION_30();
  return 0;
}

uint64_t AlgWorkNode::runStep(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_20(this, a2, a3);
  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 32))(v3);
  }
  OUTLINED_FUNCTION_30();
  return v5;
}

void AlgWorkNode::runPrologue(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = *((unsigned int *)a2 + 17);
  while (v7 != v5)
  {
    uint64_t v8 = *((void *)a2 + 1) + 80 * *(unsigned __int8 *)(*((void *)a2 + 7) - v6 + v5);
    BOOL v9 = *(void *)v8 == *((void *)this + 13) && *(unsigned char *)(v8 + 33) == 1;
    if (v9
      && (AlgWorkNode::injectDataIfOnList(*((void *)this + 10), *((_DWORD *)this + 23), *((void *)a2 + 1) + 80 * *(unsigned __int8 *)(*((void *)a2 + 7) - v6 + v5))|| AlgWorkNode::injectDataIfOnList(*((void *)this + 1), *((_DWORD *)this + 5), v8)|| AlgWorkNode::injectDataIfOnList(*((void *)this + 4), *((_DWORD *)this + 11), v8)))
    {
      *(unsigned char *)(*((void *)a2 + 4) + 2 * *(unsigned __int8 *)(*((void *)a2 + 7) - v6 + v5)) = 1;
      PacketCollection::popIterableAt(a2, v5 - v6++);
    }
    ++v5;
  }
  OUTLINED_FUNCTION_22();

  AlgWorkNode::runPrologue(v10, v11);
}

void AlgWorkNode::runPrologue(AlgWorkNode *this, AlgDataExtractor *a2)
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2();
  while (v4 != v3)
  {
    OUTLINED_FUNCTION_7();
    BOOL v6 = v6 && v5 == 1;
    if (v6
      && (OUTLINED_FUNCTION_16(*(void *)(v2 + 80), *(_DWORD *)(v2 + 92))
       || OUTLINED_FUNCTION_16(*(void *)(v2 + 8), *(_DWORD *)(v2 + 20))))
    {
      OUTLINED_FUNCTION_17();
    }
    ++v3;
  }
  OUTLINED_FUNCTION_12();
}

void AlgWorkNode::runEpilogue(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_15();
  uint64_t v10 = v9;
  OUTLINED_FUNCTION_2();
  while (v6 != v4)
  {
    uint64_t v11 = *(void *)(v10 + 8) + *(unsigned __int8 *)(*(void *)(v10 + 56) - v5 + v4) * (unint64_t)v7;
    if (*(void *)v11 == *(void *)(v3 + 104)
      && *(unsigned char *)(v11 + 33) == 2
      && AlgWorkNode::injectDataIfOnList(*(void *)(v3 + 56), *(_DWORD *)(v3 + 68), v11))
    {
      *(unsigned char *)(*(void *)(v10 + 32) + 2 * *(unsigned __int8 *)(*(void *)(v10 + 56) - v5 + v4)) = v8;
      PacketCollection::popIterableAt((_DWORD *)v10, v4 - v5++);
    }
    ++v4;
  }
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_12();
  AlgWorkNode::runEpilogue(v13, v14);
}

void AlgWorkNode::runEpilogue(AlgWorkNode *this, AlgDataExtractor *a2)
{
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_2();
  while (v4 != v3)
  {
    OUTLINED_FUNCTION_7();
    BOOL v6 = v6 && v5 == 2;
    if (v6
      && (OUTLINED_FUNCTION_16(*(void *)(v2 + 56), *(_DWORD *)(v2 + 68))
       || OUTLINED_FUNCTION_16(*(void *)(v2 + 32), *(_DWORD *)(v2 + 44))))
    {
      OUTLINED_FUNCTION_17();
    }
    ++v3;
  }
  OUTLINED_FUNCTION_12();
}

BOOL AlgWorkNode::injectDataIfOnList(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v4 = 0;
  unint64_t v5 = a2;
  do
  {
    if (a2 == v4)
    {
      unint64_t v6 = a2;
      return v6 < v5;
    }
    unint64_t v6 = v4;
    uint64_t v7 = *(void *)(a1 + 8 * v4++);
  }
  while (*(void *)(v7 + 8) != *(void *)(a3 + 8));
  char v8 = *(void **)(a3 + 56);
  uint64_t v9 = v8 & 3;
  if ((v8 & 3) != 0)
  {
    char v8 = operator new(*(void *)(a3 + 24));
    memcpy(v8, *(const void **)(a3 + 56), *(void *)(a3 + 24));
  }
  OUTLINED_FUNCTION_18();
  (*(void (**)(uint64_t, void *))(v10 + 32))(v7, v8);
  *(unsigned char *)(v7 + 29) = 1;
  if (v9 && v8) {
    operator delete[](v8);
  }
  return v6 < v5;
}

uint64_t SABinaryWriter::writeData(SABinaryWriter *this, __int16 a2, unsigned int a3, const void *a4)
{
  v11[0] = a2;
  unsigned __int16 v7 = (a3 + 3) & 0xFFFC;
  v11[1] = v7;
  int v10 = 0;
  int v8 = SABinaryWriter::write(this, v11, 4uLL);
  uint64_t result = 0;
  if (v8)
  {
    if (a4)
    {
      uint64_t result = SABinaryWriter::write(this, a4, a3);
      if (result) {
        return SABinaryWriter::write(this, &v10, v7 - (unint64_t)a3);
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void sub_25BF1554C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PacketCollection::add(PacketCollection *this, const AlgDataPacket *a2)
{
  uint64_t v3 = *((void *)a2 + 8);
  if (!v3)
  {
    while (80 * *((unsigned int *)this + 5) != v3)
    {
      uint64_t v5 = *((void *)this + 1);
      if (*(void *)a2 == *(void *)(v5 + v3))
      {
        uint64_t v6 = v5 + v3;
        if (*((void *)a2 + 1) == *(void *)(v6 + 8)
          && *((unsigned __int8 *)a2 + 33) == *(unsigned __int8 *)(v6 + 33))
        {
          return 0;
        }
      }
      v3 += 80;
    }
  }
  SAList<AlgDataPacket>::push_back((uint64_t)this + 8);
  SAList<PacketBookkeeper>::push_back((uint64_t)this + 32);
  SAList<unsigned char>::push_back((uint64_t)this + 56);
  return 1;
}

void SAList<unsigned char>::push_back(uint64_t a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1);
  if (!v3)
  {
    uint64_t v3 = (uint64_t)operator new(*(unsigned int *)(v1 + 8));
    *(void *)uint64_t v1 = v3;
  }
  *(unsigned char *)(v3 + *(unsigned int *)(v1 + 12)) = *v2;
  OUTLINED_FUNCTION_4();
}

void *operator new(size_t a1)
{
  return malloc_type_malloc(a1, 0x8C5DC2A9uLL);
}

void SAList<PacketBookkeeper>::push_back(uint64_t a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1);
  if (!v3)
  {
    uint64_t v3 = (uint64_t)operator new(2 * *(unsigned int *)(v1 + 8));
    *(void *)uint64_t v1 = v3;
  }
  *(_WORD *)(v3 + 2 * *(unsigned int *)(v1 + 12)) = *v2;
  OUTLINED_FUNCTION_4();
}

void SAList<AlgDataPacket>::push_back(uint64_t a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1);
  if (!v3)
  {
    uint64_t v3 = (uint64_t)operator new(80 * *(unsigned int *)(v1 + 8));
    *(void *)uint64_t v1 = v3;
  }
  memcpy((void *)(v3 + 80 * *(unsigned int *)(v1 + 12)), v2, 0x50uLL);
  OUTLINED_FUNCTION_4();
}

void PacketCollection::~PacketCollection(PacketCollection *this)
{
  *(void *)this = &unk_27096BEB0;
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2) {
    operator delete[](v2);
  }
  uint64_t v3 = (void *)*((void *)this + 4);
  if (v3) {
    operator delete[](v3);
  }
  unint64_t v4 = (void *)*((void *)this + 1);
  if (v4) {
    operator delete[](v4);
  }
}

{
  void *v1;
  uint64_t vars8;

  PacketCollection::~PacketCollection(this);

  operator delete(v1);
}

uint64_t PacketCollection::PacketCollection(uint64_t result, int a2, char a3)
{
  *(void *)uint64_t result = &unk_27096BEB0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 0;
  *(unsigned char *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = a2;
  *(_DWORD *)(result + 44) = 0;
  *(unsigned char *)(result + 48) = a3;
  *(void *)(result + 56) = 0;
  *(_DWORD *)(result + 64) = a2;
  *(_DWORD *)(result + 68) = 0;
  *(unsigned char *)(result + 72) = a3;
  return result;
}

uint64_t AlgsDevice::StreamingClient::setBuffer(AlgsDevice::StreamingClient *this, void *a2)
{
  OUTLINED_FUNCTION_13();
  uint64_t result = OUTLINED_FUNCTION_36();
  *(void *)(v4 + 40) = 0;
  *(void *)(v4 + 48) = v3;
  *(void *)(v4 + 56) = v2;
  *(void *)(v4 + 64) = 0;
  *(unsigned char *)(v4 + 72) = 0;
  *(unsigned char *)(v4 + 74) = 0;
  *(void *)(v4 + 80) = 0;
  return result;
}

BOOL StreamingWriter::writeInjExtData(StreamingWriter *this, int a2, PacketCollection *a3)
{
  if (!a3) {
    return 1;
  }
  uint64_t v5 = 0;
  uint64_t v6 = (StreamingWriter *)((char *)this + 8);
  unint64_t v7 = -1;
  while (1)
  {
    unint64_t v8 = *((unsigned int *)a3 + 5);
    BOOL result = ++v7 >= v8;
    if (v7 >= v8) {
      break;
    }
    uint64_t v10 = v5 + 80;
    uint64_t v11 = *((void *)a3 + 1) + v5;
    char v12 = SABinaryWriter::addInjExtData(v6, a2, *(void *)v11, *(void *)(v11 + 8), *(unsigned __int8 *)(v11 + 33) == 1, *(_WORD *)(v11 + 16), *(unsigned __int16 *)(v11 + 24), *(const void **)(v11 + 56));
    uint64_t v5 = v10;
    if ((v12 & 1) == 0) {
      return 0;
    }
  }
  return result;
}

uint64_t StreamingParser::numberOfPackets(StreamingParser *this, unint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  long long v8 = *(_OWORD *)((char *)this + 24);
  long long v28 = *(_OWORD *)((char *)this + 8);
  long long v29 = v8;
  long long v30 = *(_OWORD *)((char *)this + 40);
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  v25 = a2;
  v26 = a3;
  v27 = a4;
  *((void *)&v29 + 1) = &v25;
  if (*((void *)&v28 + 1) < 2uLL || *(unsigned char *)v28 != 1) {
    return 0;
  }
  uint64_t result = 0;
  switch(*(unsigned char *)(v28 + 1))
  {
    case 2:
      uint64_t v10 = OUTLINED_FUNCTION_38(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke, a5, a6, a7, a8, v24, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27, v28);
      uint64_t result = SABinaryParser::parseRunFrame(v10, v11, v12, v13);
      break;
    case 3:
      v14 = (uint64_t *)OUTLINED_FUNCTION_38(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, a6, a7, a8, v24, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27, v28);
      uint64_t result = SABinaryParser::parseInjExtFrame(v14, v15, v16, v17, v18);
      break;
    case 5:
      v19 = (uint64_t *)OUTLINED_FUNCTION_38(0, (uint64_t)a2, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, (uint64_t)a4, a5, a6, a7, a8, v24, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27, v28);
      uint64_t result = SABinaryParser::parseConfigure(v19, v20, v21, 0);
      break;
    case 6:
      v22 = (uint64_t *)OUTLINED_FUNCTION_38(0, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke, a6, a7, a8, v24, (uint64_t)v25, (uint64_t)v26, (uint64_t)v27, v28);
      uint64_t result = SABinaryParser::parseInfo(v22, v23, 0, 0);
      break;
    default:
      return result;
  }
  return result;
}

unint64_t AlgsDevice::getInfo(AlgsDevice *this)
{
  return *((unsigned int *)this + 18) | ((unint64_t)*((unsigned __int8 *)this + 76) << 32) | ((unint64_t)*((unsigned __int8 *)this + 77) << 40) | ((unint64_t)*((unsigned __int8 *)this + 112) << 48);
}

uint64_t ConditionalAlgTaskNode::runTask(ConditionalAlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  return 0;
}

_DWORD *PacketCollection::popIterableAt(_DWORD *this, uint64_t a2)
{
  int v2 = this[17];
  uint64_t v3 = (v2 - 1);
  if (v3 == a2)
  {
    if (v2) {
      this[17] = v3;
    }
  }
  else
  {
    this[17] = v3;
    return memmove((void *)(*((void *)this + 7) + a2), (const void *)(*((void *)this + 7) + a2 + 1), v3 - a2);
  }
  return this;
}

uint64_t AlgDataExtractor::requestFor(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a4) {
    return 0;
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_28();
  return v4();
}

uint64_t StreamingWriter::writeExtPoints(StreamingWriter *this, AlgDataExtractor *a2)
{
  uint64_t v2 = 1;
  if (a2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (StreamingWriter *)((char *)this + 8);
    uint64_t v7 = -1;
    while (++v7 < (unint64_t)*((unsigned int *)a2 + 5))
    {
      long long v8 = (long long *)(*((void *)a2 + 1) + v5);
      long long v9 = *v8;
      int v10 = *((unsigned __int8 *)v8 + 33);
      int v11 = *((unsigned __int8 *)this + 32);
      BOOL v12 = v11 == 3 || v11 == 5;
      if (v12 || *((unsigned char *)this + 33))
      {
        v5 += 80;
        char v15 = 3;
        long long v16 = v9;
        char v13 = v10 == 1 ? 1 : 2;
        char v17 = v13;
        if (SABinaryWriter::write(v6, &v15, 0x12uLL)) {
          continue;
        }
      }
      return 0;
    }
    return 1;
  }
  return v2;
}

uint64_t StreamingParser::addPacket(uint64_t a1, uint64_t a2, int a3)
{
  long long v15 = *(_OWORD *)(a2 + 1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_28();
  uint64_t result = v13(v5, v6, v7, v8, v9, v10, v11, v12, v15, *((void *)&v15 + 1));
  if (a3 == 2)
  {
    if (result) {
      *(unsigned char *)(*(void *)(a1 + 32) + 2 * *(unsigned int *)(a1 + 20) - 2) = 1;
    }
  }
  return result;
}

uint64_t SABinaryWriter::addInjExtData(SABinaryWriter *this, int a2, uint64_t a3, uint64_t a4, int a5, __int16 a6, unsigned int a7, const void *a8)
{
  if ((*((unsigned char *)this + 24) & 0xFE) != 2) {
    return 0;
  }
  if (a2) {
    char v12 = 1;
  }
  else {
    char v12 = 2;
  }
  char v15 = v12;
  uint64_t v16 = a3;
  uint64_t v17 = a4;
  if (a5) {
    char v13 = 1;
  }
  else {
    char v13 = 2;
  }
  char v18 = v13;
  uint64_t result = SABinaryWriter::write(this, &v15, 0x12uLL);
  if (result) {
    return SABinaryWriter::writeData(this, a6, a7, a8);
  }
  return result;
}

BOOL SABinaryParser::parseInjExtFrame(uint64_t *a1, unsigned int (*a2)(uint64_t, void), uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v6 - v5) < 2) {
    return 0;
  }
  a1[2] = v5 + 2;
  if ((unint64_t)(v6 - (v5 + 2)) < 8) {
    return 0;
  }
  uint64_t v8 = *a1;
  a1[2] = v5 + 10;
  if (a2)
  {
    if (!a2(a1[3], *(void *)(v8 + v5 + 2))) {
      return 0;
    }
  }
  OUTLINED_FUNCTION_22();

  return SABinaryParser::parseInjExtData(v9, v10, v11, a5);
}

BOOL SABinaryParser::parseInjExtData(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(void))
{
  while (1)
  {
    unint64_t v8 = *(void *)(a1 + 8);
    unint64_t v9 = *(void *)(a1 + 16);
    unint64_t v10 = v8 - v9;
    if (v8 <= v9) {
      return v8 <= v9;
    }
    uint64_t v11 = (unsigned __int8 *)(*(void *)a1 + v9);
    int v12 = (char)*v11;
    if (v12 < 0)
    {
      uint64_t v14 = *(void *)(a1 + 40);
      if (!v14) {
        return v8 <= v9;
      }
      unsigned int v15 = v12 & 0x7F;
      if (v15 >= *(unsigned __int8 *)(a1 + 32)) {
        return v8 <= v9;
      }
      uint64_t v16 = (unsigned __int8 *)(v14 + 22 * v15);
      unint64_t v17 = *((unsigned __int16 *)v16 + 10);
      if (v10 <= v17) {
        return v8 <= v9;
      }
      *(void *)(a1 + 16) = v9 + v17 + 1;
      if (*v16 == 1)
      {
        if (a2)
        {
          uint64_t v18 = *(void *)(a1 + 24);
          v19 = (char *)(v11 + 1);
          uint64_t v11 = v16;
LABEL_20:
          if ((a2(v18, v11, v19) & 1) == 0) {
            return v8 <= v9;
          }
        }
      }
      else if (a3)
      {
        uint64_t v21 = *(void *)(a1 + 24);
        v22 = (char *)(v11 + 1);
        uint64_t v11 = v16;
LABEL_26:
        if ((a3(v21, v11, v22) & 1) == 0) {
          return v8 <= v9;
        }
      }
    }
    else
    {
      if (v10 < 0x12) {
        return v8 <= v9;
      }
      int v13 = *v11;
      *(void *)(a1 + 16) = v9 + 18;
      if (v13 == 3)
      {
        if (a4 && (a4(*(void *)(a1 + 24)) & 1) == 0) {
          return v8 <= v9;
        }
      }
      else
      {
        if (v8 - (v9 + 18) < 4) {
          return v8 <= v9;
        }
        *(void *)(a1 + 16) = v9 + 22;
        unint64_t v20 = *((unsigned __int16 *)v11 + 10);
        if (v8 - (v9 + 22) < v20) {
          return v8 <= v9;
        }
        *(void *)(a1 + 16) = v9 + 22 + v20;
        if (v13 == 2)
        {
          if (a3)
          {
            uint64_t v21 = *(void *)(a1 + 24);
            v22 = (char *)(v11 + 22);
            goto LABEL_26;
          }
        }
        else
        {
          if (v13 != 1) {
            return v8 <= v9;
          }
          if (a2)
          {
            uint64_t v18 = *(void *)(a1 + 24);
            v19 = (char *)(v11 + 22);
            goto LABEL_20;
          }
        }
      }
    }
  }
}

uint64_t AlgDataPacket::AlgDataPacket(uint64_t result, uint64_t a2, uint64_t a3, int a4, char a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  *(void *)uint64_t result = a2;
  *(void *)(result + 8) = a3;
  *(_DWORD *)(result + 16) = a4;
  *(void *)(result + 24) = a8;
  *(unsigned char *)(result + 32) = a5;
  *(unsigned char *)(result + 33) = a6;
  *(_WORD *)(result + 34) = 0;
  *(void *)(result + 40) = a9;
  *(_DWORD *)(result + 48) = a10;
  *(void *)(result + 64) = 0;
  *(void *)(result + 72) = 0;
  *(void *)(result + 56) = a7;
  return result;
}

uint64_t TouchService::TouchServiceAlgsDevice::planNode(TouchService::TouchServiceAlgsDevice *this)
{
  return *((void *)this + 15);
}

uint64_t AlgTaskNode::runStep(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v3 + 40))();
}

void AlgsDevice::handleInputStream(AlgsDevice *this, const void *a2, unint64_t a3, void *a4, unint64_t *a5, unsigned __int8 *a6, unsigned __int16 *a7, const void **a8)
{
  OUTLINED_FUNCTION_15();
  unint64_t v9 = v8;
  uint64_t v11 = v10;
  int v13 = v12;
  unsigned int v15 = v14;
  unint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  AlgsDevice::StreamingClient::setBuffer(*(AlgsDevice::StreamingClient **)(v20 + 64), v22);
  uint64_t v27 = *(void *)(v21 + 64);
  if (v13) {
    unsigned char *v13 = 0;
  }
  long long v29 = (unsigned char *)(v27 + 128);
  char v28 = *(unsigned char *)(v27 + 128);
  uint64_t v30 = *(void *)(v27 + 136);
  uint64_t v89 = v27 + 128;
  uint64_t v90 = v19;
  uint64_t v92 = 0;
  v93 = 0;
  uint64_t v91 = v17;
  LOBYTE(v94) = v28;
  uint64_t v95 = v30;
  if (v17 < 2 || *(unsigned char *)v19 != 1)
  {
LABEL_108:
    uint64_t v87 = 0;
    if (!v15) {
      goto LABEL_110;
    }
LABEL_109:
    *unsigned int v15 = v87;
    goto LABEL_110;
  }
  switch(*(unsigned char *)(v19 + 1))
  {
    case 1:
      v110 = (unint64_t *)&v107;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      uint64_t v92 = 2;
      v93 = (BOOL *)&v110;
      if (v17 == 2) {
        goto LABEL_108;
      }
      uint64_t v31 = *(unsigned __int8 *)(v19 + 2);
      LOBYTE(v107) = *(unsigned char *)(v19 + 2);
      if (v17 == 3) {
        goto LABEL_10;
      }
      if (!SABinaryParser::parseInfoData(&v90, (uint64_t (*)(uint64_t, void, void, void, void))StreamingParser::parseReset(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke, 0, 0))goto LABEL_108; {
      uint64_t v31 = v107;
      }
LABEL_10:
      uint64_t v32 = *(void *)(v27 + 32);
      OUTLINED_FUNCTION_19();
      (*(void (**)(uint64_t, uint64_t))(v33 + 40))(v32, v31);
      uint64_t v34 = 0;
      *(unsigned char *)(v32 + 77) = v31;
      uint64_t v35 = v32 + 32;
      while (v34 != 16)
      {
        if (*(void *)(v35 + v34))
        {
          OUTLINED_FUNCTION_0();
          (*(void (**)(void))(v36 + 16))();
        }
        v34 += 8;
      }
      goto LABEL_101;
    case 2:
      unint64_t v100 = 0;
      unint64_t v101 = 0;
      if ((StreamingParser::numberOfPackets((StreamingParser *)&v89, &v101, &v100, 0, v23, v24, v25, v26) & 1) == 0) {
        goto LABEL_108;
      }
      uint64_t v37 = *(void *)(v27 + 104);
      int v38 = v101;
      if (v37)
      {
        int v38 = v101 + *(_DWORD *)(v37 + 20);
        v101 += *(unsigned int *)(v37 + 20);
      }
      AlgDataInjector::AlgDataInjector((uint64_t)&v107, v38);
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v110, v100);
      OUTLINED_FUNCTION_32();
      if (SABinaryParser::parseRunFrame(&v90, (unsigned int (*)(void))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_0::__invoke, (uint64_t (*)(uint64_t, unsigned __int8 *, char *))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_1::__invoke, (uint64_t (*)(uint64_t, unsigned __int8 *, char *))StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_2::__invoke))
      {
        AlgsDevice::StreamingClient::translate((AlgsDevice::StreamingClient *)v27, (PacketCollection *)&v107, (PacketCollection *)&v110);
        *(unsigned char *)(v27 + 97) = 1;
        AlgsDevice::run(*(void *)(v27 + 32));
        PacketCollection::~PacketCollection((PacketCollection *)&v110);
        v39 = &v107;
        goto LABEL_100;
      }
      PacketCollection::~PacketCollection((PacketCollection *)&v110);
      v67 = &v107;
      goto LABEL_107;
    case 3:
      unint64_t v100 = 0;
      unint64_t v101 = 0;
      unint64_t v99 = 0;
      if ((StreamingParser::numberOfPackets((StreamingParser *)&v89, &v101, &v100, &v99, v23, v24, v25, v26) & 1) == 0) {
        goto LABEL_108;
      }
      uint64_t v40 = *(void *)(v27 + 104);
      int v41 = v101;
      if (v40)
      {
        int v41 = v101 + *(_DWORD *)(v40 + 20);
        v101 += *(unsigned int *)(v40 + 20);
      }
      AlgDataInjector::AlgDataInjector((uint64_t)v96, v41);
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v110, v100);
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v107, v99);
      *(void *)v102 = v27 + 88;
      v103 = v96;
      v104 = &v110;
      v105 = &v107;
      v93 = v102;
      BOOL v42 = SABinaryParser::parseInjExtFrame(&v90, (unsigned int (*)(uint64_t, void))StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke, (uint64_t)StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke, (uint64_t)StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_2::__invoke, (uint64_t (*)(void))StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_3::__invoke);
      if (!v42)
      {
        PacketCollection::~PacketCollection((PacketCollection *)&v107);
        PacketCollection::~PacketCollection((PacketCollection *)&v110);
        v67 = (unint64_t **)v96;
        goto LABEL_107;
      }
      uint64_t v43 = HIDWORD(v109);
      v44 = (uint64_t *)(v108 + 72);
      if (HIDWORD(v109))
      {
        do
        {
          *(v44 - 1) = (uint64_t)AlgsDevice::StreamingClient::extraction;
          uint64_t *v44 = v27;
          --v43;
          v44 += 10;
        }
        while (v43);
      }
      AlgsDevice::StreamingClient::translate((AlgsDevice::StreamingClient *)v27, (PacketCollection *)v96, (PacketCollection *)&v110);
      *(unsigned char *)(v27 + 97) = 1;
      AlgsDevice::injExtWith();
      *(void *)(v27 + 88) = 0;
      PacketCollection::~PacketCollection((PacketCollection *)&v107);
      PacketCollection::~PacketCollection((PacketCollection *)&v110);
      PacketCollection::~PacketCollection((PacketCollection *)v96);
      if (!v42) {
        goto LABEL_108;
      }
      goto LABEL_101;
    case 4:
      if (v17 - 5 >= 0xFFFFFFFFFFFFFFFDLL)
      {
        int v45 = 1;
        if (v13)
        {
          unsigned char *v13 = 1;
          int v45 = 0;
        }
        if (v11) {
          *uint64_t v11 = 0;
        }
      }
      else
      {
        int v45 = *(unsigned __int8 *)(v19 + 2);
        if (v13)
        {
          unsigned char *v13 = v45;
          int v45 = 0;
        }
        if (v11) {
          *uint64_t v11 = *(_WORD *)(v19 + 3);
        }
        if (v9) {
          *unint64_t v9 = v19 + 5;
        }
      }
      if (v13) {
        int v45 = *v13;
      }
      if (v11 && v45 == 1 && *v11 && *(unsigned __int8 *)*v9 == 255) {
        *(unsigned char *)*unint64_t v9 = *(unsigned char *)(*(void *)(v27 + 32) + 77);
      }
      goto LABEL_101;
    case 5:
      v102[0] = 0;
      LOBYTE(v101) = 0;
      *(void *)v96 = 0;
      if ((StreamingParser::numberOfPackets((StreamingParser *)&v89, 0, 0, (unint64_t *)v96, v23, v24, v25, v26) & 1) == 0)goto LABEL_108; {
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v110, *(int *)v96);
      }
      v107 = &v101;
      v108 = v102;
      v109 = &v110;
      v93 = (BOOL *)&v107;
      if (!SABinaryParser::parseConfigure(&v90, (unsigned int (*)(uint64_t, BOOL))StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_0::__invoke, (uint64_t)StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_1::__invoke, (unsigned int (*)(uint64_t, uint64_t))StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_2::__invoke))goto LABEL_106; {
      int v47 = v101;
      }
      if (v101 <= 2u)
      {
        AlgsDevice::StreamingClient::configure((AlgsDevice::StreamingClient *)v27, v102[0], (AlgDataExtractor *)&v110);
        int v47 = v101;
      }
      if (v47 == 3 && HIDWORD(v111)) {
        StreamingWriter::writeConfigure((StreamingWriter *)(v27 + 40), v102[0], (AlgDataExtractor *)&v110, v46);
      }
      else {
        AlgsDevice::StreamingClient::configureStatus((AlgsDevice::StreamingClient *)v27);
      }
      goto LABEL_99;
    case 6:
      LODWORD(v101) = 0;
      LOBYTE(v100) = 0;
      LOBYTE(v99) = 0;
      __int16 v106 = 0;
      *(void *)v96 = 0;
      *(void *)&v96[8] = 16;
      char v97 = 0;
      *(void *)v102 = 0;
      if ((StreamingParser::numberOfPackets((StreamingParser *)&v89, 0, 0, (unint64_t *)v102, v23, v24, v25, v26) & 1) == 0)
      {
        SAList<char const*>::~SAList((void **)v96);
        goto LABEL_108;
      }
      AlgDataExtractor::AlgDataExtractor((uint64_t)&v107, *(int *)v102);
      v110 = &v100;
      *(void *)&long long v111 = &v101;
      *((void *)&v111 + 1) = &v99;
      *(void *)&long long v112 = (char *)&v106 + 1;
      *((void *)&v112 + 1) = v96;
      *(void *)&long long v113 = &v106;
      *((void *)&v113 + 1) = &v107;
      v93 = (BOOL *)&v110;
      if (SABinaryParser::parseInfo(&v90, (uint64_t (*)(uint64_t, void, void, void, void))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke, (uint64_t (*)(uint64_t, const char *))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_1::__invoke, (uint64_t (*)(uint64_t, BOOL))StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_2::__invoke))
      {
        uint64_t v55 = *(void *)(v27 + 32);
        if (v101 && v101 != *(_DWORD *)(v55 + 72))
        {
          StreamingWriter::writeInfo(v27 + 40, v100, v101, v99, HIBYTE(v106), (uint64_t)v96, v106);
          char v58 = 1;
        }
        else
        {
          unint64_t Info = AlgsDevice::getInfo(*(AlgsDevice **)(v27 + 32));
          AlgDataExtractor::AlgDataExtractor((uint64_t)&v110, *(_DWORD *)(v55 + 48));
          AlgsDevice::getClientExtractor(v55, (uint64_t)&v110);
          StreamingWriter::writeInfo(v27 + 40, BYTE5(Info), Info, BYTE4(Info), BYTE6(Info), *(void *)(v27 + 32) + 80, *(unsigned char *)(v27 + 96));
          char v58 = v57;
          PacketCollection::~PacketCollection((PacketCollection *)&v110);
        }
      }
      else
      {
        char v58 = 0;
      }
      PacketCollection::~PacketCollection((PacketCollection *)&v107);
      SAList<char const*>::~SAList((void **)v96);
      if ((v58 & 1) == 0) {
        goto LABEL_108;
      }
      goto LABEL_101;
    case 7:
      *(_DWORD *)v102 = 0;
      AlgDataExtractor::AlgDataExtractor((AlgDataExtractor *)&v110);
      AlgDataExtractor::AlgDataExtractor((AlgDataExtractor *)&v107);
      OUTLINED_FUNCTION_32();
      if (v17 < 6) {
        goto LABEL_105;
      }
      uint64_t v92 = 6;
      if (!StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke((_DWORD **)v96, *(_DWORD *)(v19 + 2)))goto LABEL_105; {
      unint64_t v59 = v92;
      }
      unint64_t v60 = v91 - v92;
      break;
    case 8:
      OUTLINED_FUNCTION_0();
      v49 = (AlgWorkNode *)(*(uint64_t (**)(void))(v48 + 48))();
      unsigned int TreeSize = AlgWorkNode::getTreeSize(v49);
      unint64_t v51 = AlgsDevice::getInfo(*(AlgsDevice **)(v27 + 32));
      *(_DWORD *)((char *)&v110 + 1) = 0;
      LOBYTE(v110) = BYTE5(v51);
      if (!SABinaryWriter::writeHeader(v27 + 48, 8))
      {
        *(void *)(v27 + 64) += 4 * TreeSize;
        goto LABEL_108;
      }
      char v52 = SABinaryWriter::write((SABinaryWriter *)(v27 + 48), &v110, 5uLL);
      *(void *)(v27 + 64) += 4 * TreeSize;
      if ((v52 & 1) == 0) {
        goto LABEL_108;
      }
      OUTLINED_FUNCTION_0();
      uint64_t v54 = (*(uint64_t (**)(void))(v53 + 48))();
      if (!AlgWorkNode::getTreeInfo(v54, v27, 1)) {
        goto LABEL_108;
      }
      goto LABEL_101;
    case 9:
      LOBYTE(v107) = 0;
      v110 = (unint64_t *)&v107;
      *(void *)&long long v111 = v27 + 128;
      if (v17 - 2 <= 2) {
        goto LABEL_108;
      }
      if (!StreamingParser::parsePacketCache(unsigned char &,StreamingPacketCache &)::$_0::__invoke((uint64_t)&v110, *(unsigned char *)(v19 + 2), *(unsigned __int8 *)(v19 + 3), (const void *)(v19 + 4)))goto LABEL_108; {
      uint64_t v64 = *v29;
      }
      if (!*v29) {
        goto LABEL_108;
      }
      v65 = (SABinaryWriter *)(v27 + 48);
      v66 = *(const void **)(v27 + 136);
      LOBYTE(v110) = 1;
      BYTE1(v110) = v64;
      SABinaryWriter::updateCacheSizes(v64, (uint64_t)v66);
      if (!SABinaryWriter::writeHeader((uint64_t)v65, 9)
        || (SABinaryWriter::write(v65, &v110, 2uLL) & 1) == 0
        || (SABinaryWriter::write(v65, v66, 22 * v64) & 1) == 0)
      {
        goto LABEL_108;
      }
      goto LABEL_101;
    default:
      goto LABEL_108;
  }
  while (1)
  {
    uint64_t v61 = v59;
    if (v91 <= v59) {
      break;
    }
    if (v60 < 0x12) {
      goto LABEL_104;
    }
    uint64_t v62 = v90 + v59;
    if (*(unsigned char *)(v90 + v59) != 3 || v60 - 18 < 0x12) {
      goto LABEL_104;
    }
    v63 = (unsigned char *)(v90 + v59 + 18);
    v59 += 36;
    if (*v63 != 3)
    {
      v61 += 36;
      goto LABEL_104;
    }
    v60 -= 36;
    if ((StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke((uint64_t)v93, v62, (uint64_t)v63) & 1) == 0)
    {
      v61 += 36;
LABEL_104:
      uint64_t v92 = v61;
LABEL_105:
      PacketCollection::~PacketCollection((PacketCollection *)&v107);
LABEL_106:
      v67 = &v110;
LABEL_107:
      PacketCollection::~PacketCollection((PacketCollection *)v67);
      goto LABEL_108;
    }
  }
  uint64_t v92 = v59;
  int v68 = *(_DWORD *)v102;
  if (*(_DWORD *)v102 == *(_DWORD *)(*(void *)(v27 + 32) + 72))
  {
    AlgsDevice::StreamingClient::configureTranslation((AlgsDevice::StreamingClient *)v27, (const PacketCollection *)&v110, (const PacketCollection *)&v107);
    int v68 = *(_DWORD *)v102;
  }
  *(_DWORD *)v96 = v68;
  if (SABinaryWriter::writeHeader(v27 + 48, 7))
  {
    int v69 = SABinaryWriter::write((SABinaryWriter *)(v27 + 48), v96, 4uLL);
    if (v69)
    {
      if (HIDWORD(v111) == HIDWORD(v109))
      {
        uint64_t v77 = 0;
        uint64_t v78 = -1;
        do
        {
          if (++v78 >= (unint64_t)HIDWORD(v111)) {
            break;
          }
          if (*(unsigned char *)(v27 + 72) != 7) {
            break;
          }
          int v79 = OUTLINED_FUNCTION_25(v69, v70, v71, v72, v73, v74, v75, v76, *(void *)&v108[v77], *(void *)&v108[v77 + 8], v89, v90, v91, v92, (uint64_t)v93, v94, v95, 3, *(_OWORD *)(v111 + v77) >> 56,
                  HIBYTE(*(_OWORD *)(v111 + v77)),
                  v98);
          if ((v79 & 1) == 0) {
            break;
          }
          v77 += 80;
          int v69 = OUTLINED_FUNCTION_25(v79, v80, v81, v82, v83, v84, v85, v86, v88[0], v88[1], v89, v90, v91, v92, (uint64_t)v93, v94, v95, v96[0], *(_OWORD *)v88 >> 56,
                  SHIBYTE(v88[1]),
                  v98);
        }
        while ((v69 & 1) != 0);
      }
    }
  }
  PacketCollection::~PacketCollection((PacketCollection *)&v107);
LABEL_99:
  v39 = &v110;
LABEL_100:
  PacketCollection::~PacketCollection((PacketCollection *)v39);
LABEL_101:
  uint64_t v87 = AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v21 + 64));
  if (v15) {
    goto LABEL_109;
  }
LABEL_110:
  OUTLINED_FUNCTION_12();
}

void sub_25BF169E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  PacketCollection::~PacketCollection((PacketCollection *)&a36);
  PacketCollection::~PacketCollection((PacketCollection *)(v36 - 184));
  _Unwind_Resume(a1);
}

void AlgsDevice::StreamingClient::finish(AlgsDevice::StreamingClient *this)
{
  if (*((_WORD *)this + 10) && *(void *)(*((void *)this + 4) + 104))
  {
    AlgsDevice::StreamingClient::saveTimestamp((uint64_t)this, 0x652B2D24D46);
    *(unsigned char *)(*((void *)this + 1) + 5) = *((unsigned char *)this + 20);
    uint64_t v2 = SABinaryWriter::addExtractionData((AlgsDevice::StreamingClient *)((char *)this + 48), 0x3779B8717A8905ELL, 0xC0246BF06F597652, 0, 39424, *((unsigned __int16 *)this + 8), *((const void **)this + 1));
    if (v2) {
      *((unsigned char *)this + 97) = 1;
    }
    else {
      OUTLINED_FUNCTION_1(v2);
    }
  }
  if (!*((unsigned char *)this + 97) && !*((void *)this + 11)) {
    OUTLINED_FUNCTION_1(0);
  }
  *((unsigned char *)this + 97) = 0;
}

void AlgsDevice::StreamingClient::start(uint64_t a1, int *a2, PacketCollection *a3, AlgDataExtractor *a4)
{
  uint64_t v4 = a1 + 48;
  if (*(void *)(a1 + 48))
  {
    unint64_t v9 = (_OWORD *)(a1 + 40);
    *(_WORD *)(a1 + 20) = 0;
    AlgsDevice::StreamingClient::saveTimestamp(a1, 0x310E1E39B3);
    int v10 = *(unsigned __int8 *)(a1 + 96);
    *(unsigned char *)(a1 + 97) |= v10;
    if (!v10) {
      a3 = 0;
    }
    if (a2)
    {
      int v11 = *a2;
      uint64_t v13 = *((void *)a2 + 1);
      int v12 = (const void *)*((void *)a2 + 2);
      if (SABinaryWriter::writeHeader(v4, 2)
        && SABinaryWriter::writeData((SABinaryWriter *)v4, v11, (unsigned __int16)v13, v12)
        && StreamingWriter::writeInjExtData((StreamingWriter *)(v4 - 8), 1, a3))
      {
        goto LABEL_14;
      }
LABEL_13:
      OUTLINED_FUNCTION_36();
      *(unsigned char *)(v4 + 24) = 0;
      *unint64_t v9 = 0u;
      *(_OWORD *)(v4 + 8) = 0u;
      *(unsigned char *)(a1 + 74) = 0;
      *(void *)(a1 + 80) = 0;
      goto LABEL_14;
    }
    uint64_t v14 = *(void *)(a1 + 88);
    if ((SABinaryWriter::writeHeader(v4, 3) & 1) == 0
      || !SABinaryWriter::write((SABinaryWriter *)v4, &v14, 8uLL)
      || !StreamingWriter::writeInjExtData((StreamingWriter *)(v4 - 8), 1, a3)
      || (StreamingWriter::writeExtPoints((StreamingWriter *)(v4 - 8), a4) & 1) == 0)
    {
      goto LABEL_13;
    }
  }
LABEL_14:
  OUTLINED_FUNCTION_24();
}

uint64_t AlgsDevice::StreamingClient::saveTimestamp(uint64_t this, uint64_t a2)
{
  uint64_t v2 = *(void *)(this + 24);
  if (v2)
  {
    uint64_t v3 = this;
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(this + 32) + 104);
    if (v4)
    {
      unsigned int v6 = *(unsigned __int16 *)(this + 20);
      if (v6 == *(unsigned __int16 *)(this + 18))
      {
        AlgsDevice::StreamingClient::profileAlloc((AlgsDevice::StreamingClient *)this, 2 * (*(_WORD *)(this + 16) & 0x7FFF));
        unsigned int v6 = *(unsigned __int16 *)(v3 + 20);
        uint64_t v2 = *(void *)(v3 + 24);
        uint64_t v4 = *(uint64_t (**)(void))(*(void *)(v3 + 32) + 104);
      }
      *(void *)(v2 + 16 * v6) = a2;
      this = v4();
      uint64_t v7 = *(unsigned __int16 *)(v3 + 20);
      *(void *)(*(void *)(v3 + 24) + 16 * v7 + 8) = this;
      *(_WORD *)(v3 + 20) = v7 + 1;
    }
  }
  return this;
}

uint64_t AlgsDevice::StreamingClient::resetBuffer(AlgsDevice::StreamingClient *this)
{
  uint64_t v1 = *((void *)this + 8);
  OUTLINED_FUNCTION_1(0);
  return v1;
}

uint64_t AlgsDevice::newPlanNode(AlgsDevice *this)
{
  return 1;
}

BOOL AlgsDevice::injExtWith()
{
  OUTLINED_FUNCTION_13();
  for (uint64_t i = 32; i != 48; i += 8)
  {
    if (*(void *)(v2 + i))
    {
      OUTLINED_FUNCTION_0();
      (*(void (**)(void))(v4 + 24))();
    }
  }
  OUTLINED_FUNCTION_35();
  uint64_t v6 = v5();
  int v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void, uint64_t))(*(void *)v6 + 40))(v6, v1, v0, 0, 0, 1);
  for (uint64_t j = 0; j != 16; j += 8)
  {
    if (*(void *)(v2 + 32 + j))
    {
      OUTLINED_FUNCTION_0();
      (*(void (**)(void))(v9 + 32))();
    }
  }
  return v7 == 0;
}

void sub_25BF16F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25BF177E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF1803C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_25BF182EC(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  operator delete(v4);

  _Unwind_Resume(a1);
}

uint64_t SASGetTimestampCallback(void)
{
  return mach_continuous_time() * _timebase / *(unsigned int *)algn_26B34C1E4 / 0x3E8;
}

void sub_25BF18458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF18710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF18B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF18C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF19100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_25BF19524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  PacketCollection::~PacketCollection((PacketCollection *)(v13 - 96));
  _Unwind_Resume(a1);
}

void sub_25BF1959C()
{
}

void sub_25BF197A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  _Unwind_Resume(a1);
}

void sub_25BF198E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF19A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF19C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF19DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF19F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF1A0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF1A368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25BF1A470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t TouchService::RadiusCorrectionStep::RadiusCorrectionStep(uint64_t a1, uint64_t a2, float a3)
{
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *uint64_t v6 = &unk_27096AE40;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v6 + 14), 0xAC3E099B4E55F2C9, 0);
  *(void *)(a1 + 112) = &unk_27096AE90;
  *(_OWORD *)(a1 + 144) = xmmword_25BF260F0;
  *(_DWORD *)(a1 + 128) = 31235;
  *(_DWORD *)(a1 + 136) = 16;
  *(void *)(a1 + 160) = a2;
  *(float *)(a1 + 168) = a3;
  TouchService::RadiusCorrectionStep::runNodeRegistrations((TouchService::RadiusCorrectionStep *)a1);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(a1 + 160) + 40);
  unint64_t v8 = (char *)operator new(20 * v7);
  if (v7)
  {
    uint64_t v9 = v8;
    do
    {
      *uint64_t v9 = 0;
      *(void *)(v9 + 12) = 0;
      *(void *)(v9 + 4) = 0;
      v9 += 20;
    }
    while (v9 != &v8[20 * v7]);
  }
  *(void *)(a1 + 176) = v8;
  return a1;
}

void sub_25BF1A924(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::RadiusCorrectionStep::runNodeRegistrations(TouchService::RadiusCorrectionStep *this)
{
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 80, (uint64_t)this + 112);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 20));
  uint64_t v2 = *((void *)this + 20);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v2);
}

void *PlainDataNode<TouchService::RadiusCorrectionParams>::~PlainDataNode(void *result)
{
  *uint64_t result = &unk_27096BC60;
  return result;
}

void AlgWorkNode::~AlgWorkNode(AlgWorkNode *this)
{
  *(void *)this = &unk_27096BD98;
  if (*((_DWORD *)this + 5)) {
    *((_DWORD *)this + 5) = 0;
  }
  if (*((_DWORD *)this + 11)) {
    *((_DWORD *)this + 11) = 0;
  }
  if (*((_DWORD *)this + 17)) {
    *((_DWORD *)this + 17) = 0;
  }
  if (*((_DWORD *)this + 23)) {
    *((_DWORD *)this + 23) = 0;
  }
  uint64_t v2 = (void *)*((void *)this + 10);
  if (v2) {
    operator delete[](v2);
  }
  uint64_t v3 = (void *)*((void *)this + 7);
  if (v3) {
    operator delete[](v3);
  }
  uint64_t v4 = (void *)*((void *)this + 4);
  if (v4) {
    operator delete[](v4);
  }
  uint64_t v5 = (void *)*((void *)this + 1);
  if (v5) {
    operator delete[](v5);
  }
}

void TouchService::RadiusCorrectionStep::~RadiusCorrectionStep(TouchService::RadiusCorrectionStep *this)
{
  *(void *)this = &unk_27096AE40;
  uint64_t v2 = (void *)*((void *)this + 22);
  if (v2) {
    operator delete[](v2);
  }
  *((void *)this + 14) = &unk_27096BC60;

  AlgWorkNode::~AlgWorkNode(this);
}

{
  void *v1;
  uint64_t vars8;

  TouchService::RadiusCorrectionStep::~RadiusCorrectionStep(this);

  operator delete(v1);
}

float TouchService::RadiusCorrectionStep::quantizeRadius(TouchService::RadiusCorrectionStep *this, float a2, float a3, float a4, float a5)
{
  if (a2 <= a4) {
    float v8 = a4;
  }
  else {
    float v8 = a2;
  }
  unsigned int v9 = (float)((float)(v8 - a4) / a5);
  float v10 = fmodf(v8 - a4, a5);
  if (v8 <= a3 || v10 <= (float)(a5 * 0.667))
  {
    BOOL v12 = v8 < a3;
    if (v10 <= (float)(a5 * 0.333)) {
      BOOL v12 = 0;
    }
    unsigned int v13 = v12 + v9;
  }
  else
  {
    unsigned int v13 = v9 + 1;
  }
  return a4 + (float)((float)v13 * a5);
}

uint64_t TouchService::RadiusCorrectionStep::run(TouchService::RadiusCorrectionStep *this)
{
  if ((*(unsigned int (**)(void))(**((void **)this + 20) + 40))(*((void *)this + 20)))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = (TouchService::RadiusCorrectionStep *)(*(uint64_t (**)(void))(*(void *)(*((void *)this + 20) + 32) + 8))();
      uint64_t v5 = *((void *)this + 22);
      unsigned int v6 = *((unsigned __int8 *)v4 + v2);
      uint64_t v7 = (unsigned char *)(v5 + 20 * *((unsigned __int8 *)v4 + v2));
      if (*((unsigned __int8 *)v4 + v2 + 1) - 5 > 0xFFFFFFFB)
      {
        float v8 = v4;
        if (*v7) {
          _D1 = vmla_n_f32((float32x2_t)vrev64_s32((int32x2_t)vmul_n_f32(*(float32x2_t *)((char *)v4 + v2 + 20), 1.0 - *((float *)this + 36))), *(float32x2_t *)(v5 + 20 * *((unsigned __int8 *)v4 + v2) + 4), *((float *)this + 36));
        }
        else {
          _D1 = (float32x2_t)vrev64_s32(*(int32x2_t *)((char *)v4 + v2 + 20));
        }
        *uint64_t v7 = 1;
        uint64_t v10 = v5 + 20 * v6;
        *(float32x2_t *)(v10 + 4) = _D1;
        _S2 = *((float *)this + 38);
        float v12 = *((float *)this + 37);
        __asm { FMLA            S8, S2, V1.S[1] }
        float v18 = *((float *)this + 42) + *((float *)this + 42);
        float v19 = TouchService::RadiusCorrectionStep::quantizeRadius(v4, vmlas_n_f32(*((float *)this + 39), _S2, _D1.f32[0]), *(float *)(v10 + 12), v12, v18);
        uint64_t v20 = (float *)((char *)v8 + v2);
        v20[6] = v19;
        float v22 = TouchService::RadiusCorrectionStep::quantizeRadius(v21, _S8, *(float *)(v10 + 16), v12, v18);
        v20[5] = v22;
        *(float *)(v10 + 12) = v19;
        *(float *)(v10 + 16) = v22;
      }
      else
      {
        *(void *)((char *)v4 + v2 + 20) = 0;
        *uint64_t v7 = 0;
        *(void *)(v5 + 20 * v6 + 12) = 0;
      }
      ++v3;
      v2 += 48;
    }
    while (v3 < (*(unsigned int (**)(void))(**((void **)this + 20) + 40))(*((void *)this + 20)));
  }
  return 0;
}

uint64_t PlainDataNode<TouchService::RadiusCorrectionParams>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  *(void *)(a3 + 56) = a1 + 32;
  return a2(a3);
}

__n128 PlainDataNode<TouchService::RadiusCorrectionParams>::injectBuffer(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[2] = *a2;
  return result;
}

uint64_t *TouchService::TapEventGenerationStep::TapEventGenerationStep(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  AlgWorkNode::AlgWorkNode((AlgWorkNode *)a1);
  *float v8 = &unk_27096AEE0;
  v8[14] = a3;
  v8[15] = a4;
  v8[16] = a2;
  AlgWorkNode::registerAlgDataNode((uint64_t)(v8 + 1), a3);
  AlgWorkNode::registerAlgDataNode((uint64_t)(a1 + 7), a1[15]);
  return a1;
}

void sub_25BF1AE28(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

uint64_t TouchService::TapEventGenerationStep::run(TouchService::TapEventGenerationStep *this)
{
  uint64_t v2 = *((void *)this + 14);
  uint64_t v1 = *((void *)this + 15);
  if (*(unsigned char *)(v2 + 32))
  {
    uint64_t v3 = *((void *)this + 16);
    int v4 = *(_DWORD *)(v3 + 8);
    uint64_t v5 = *(void *)(v3 + 16);
    *(_WORD *)(v1 + 88) = 257;
    int v6 = *(_DWORD *)(v2 + 40);
    float v7 = 1.0 - *(float *)(v2 + 44);
    *(unsigned char *)(v1 + 104) = 1;
    *(_DWORD *)(v1 + 40) = v4;
    *(void *)(v1 + 32) = v5;
    *(_DWORD *)(v1 + 52) = 131074;
    *(_DWORD *)(v1 + 56) = v6;
    *(float *)(v1 + 60) = v7;
    float v8 = SALoggingGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      TouchService::TapEventGenerationStep::run(v8);
    }
  }
  else
  {
    *(unsigned char *)(v1 + 104) = 0;
  }
  return 0;
}

void TouchService::TapEventGenerationStep::~TapEventGenerationStep(TouchService::TapEventGenerationStep *this)
{
  AlgWorkNode::~AlgWorkNode(this);

  operator delete(v1);
}

void TouchService::TapEventGenerationStep::run(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_25BF13000, log, OS_LOG_TYPE_DEBUG, "TapEventGenerationStep: Tap generated. \n", v1, 2u);
}

AlgWorkNode *TouchService::EventInfoStep::EventInfoStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  AlgWorkNode::AlgWorkNode(a1);
  *(void *)uint64_t v18 = &unk_27096AF30;
  *(void *)(v18 + 112) = a3;
  *(void *)(v18 + 120) = a4;
  *(void *)(v18 + 128) = a5;
  *(void *)(v18 + 136) = a6;
  *(void *)(v18 + 144) = a7;
  *(void *)(v18 + 152) = a8;
  *(void *)(v18 + 160) = a9;
  *(void *)(v18 + 168) = a10;
  *(void *)(v18 + 176) = a2;
  *(unsigned char *)(v18 + 208) = 0;
  TouchService::EventInfoStep::runNodeRegistrations((TouchService::EventInfoStep *)v18);
  return a1;
}

{
  return TouchService::EventInfoStep::EventInfoStep(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_25BF1AFEC(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::EventInfoStep::runNodeRegistrations(TouchService::EventInfoStep *this)
{
  uint64_t v2 = (char *)this + 8;
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 14));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 15));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 16));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 17));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 18));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 19));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 20));
  uint64_t v3 = *((void *)this + 21);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v3);
}

uint64_t TouchService::EventInfoStep::baselineAdaptNotification(uint64_t this)
{
  if (*(unsigned char *)(*(void *)(this + 120) + 32))
  {
    uint64_t v1 = this;
    this = (*(uint64_t (**)(void))(**(void **)(this + 136) + 40))(*(void *)(this + 136));
    if (this
      || *(unsigned char *)(*(void *)(v1 + 112) + 32)
      && (this = (*(uint64_t (**)(void))(**(void **)(v1 + 152) + 40))(*(void *)(v1 + 152)),
          this))
    {
      if (*(unsigned char *)(v1 + 208))
      {
        uint64_t v2 = *(void *)(v1 + 192);
        uint64_t v3 = *(void *)(v1 + 200);
        *(unsigned char *)(v3 + 33) = *(unsigned char *)(v2 + 104) ^ 1;
        *(unsigned char *)(v3 + 32) = 1;
        *(unsigned char *)(v3 + 56) = 2;
        uint64_t v4 = *(void *)(*(void *)(v1 + 176) + 16) + 0xF4240u / *(_DWORD *)(*(void *)(v1 + 112) + 36);
        *(void *)(v3 + 40) = v4 + *(unsigned int *)(*(void *)(v1 + 120) + 36);
        *(void *)(v3 + 48) = v4;
        *(unsigned char *)(v3 + 64) = 1;
        *(unsigned char *)(v2 + 104) = 1;
      }
    }
  }
  return this;
}

uint64_t TouchService::EventInfoStep::run(TouchService::EventInfoStep *this)
{
  uint64_t v1 = *((void *)this + 21);
  *(unsigned char *)(*((void *)this + 20) + 64) = 0;
  *(unsigned char *)(v1 + 64) = 0;
  if (*(unsigned char *)(*((void *)this + 15) + 32)
    && ((*(unsigned int (**)(void))(**((void **)this + 17) + 40))(*((void *)this + 17))
     || *(unsigned char *)(*((void *)this + 14) + 32)
     && (*(unsigned int (**)(void))(**((void **)this + 19) + 40))(*((void *)this + 19))))
  {
    uint64_t v3 = *((void *)this + 16);
    int v4 = *(unsigned __int8 *)(v3 + 104);
    if (*(unsigned char *)(v3 + 104) || *(unsigned char *)(*((void *)this + 18) + 104))
    {
      *((_DWORD *)this + 46) = 0;
      uint64_t v5 = *((void *)this + 14);
      if (*(unsigned char *)(v5 + 32))
      {
        uint64_t v6 = *((void *)this + 18);
        if (*(unsigned char *)(v6 + 104))
        {
          int v7 = *(unsigned __int8 *)(v6 + 88);
          uint64_t v8 = *((void *)this + 21);
          uint64_t v9 = *((void *)this + 22);
          *(unsigned char *)(v8 + 33) = *(unsigned char *)(v6 + 104) ^ 1;
          *(unsigned char *)(v8 + 32) = v7;
          *(unsigned char *)(v8 + 56) = 0;
          uint64_t v10 = 36;
          if (!v7) {
            uint64_t v10 = 40;
          }
          uint64_t v11 = *(void *)(v9 + 16) + 0xF4240u / *(_DWORD *)(v5 + 36);
          *(void *)(v8 + 40) = v11 + *(unsigned int *)(*((void *)this + 15) + v10);
          *(void *)(v8 + 48) = v11;
          *(unsigned char *)(v8 + 64) = 1;
          *((void *)this + 24) = v6;
          *((void *)this + 25) = v8;
          *((unsigned char *)this + 208) = v7;
        }
      }
      if (v4)
      {
        uint64_t v12 = *((void *)this + 20);
        int v13 = *(unsigned __int8 *)(v3 + 88);
        *(unsigned char *)(v12 + 33) = v4 ^ 1;
        *(unsigned char *)(v12 + 32) = v13;
        *(unsigned char *)(v12 + 56) = 0;
        uint64_t v14 = 36;
        if (!v13) {
          uint64_t v14 = 40;
        }
        uint64_t v15 = *(void *)(*((void *)this + 22) + 16) + 0xF4240u / *(_DWORD *)(v5 + 36);
        *(void *)(v12 + 40) = v15 + *(unsigned int *)(*((void *)this + 15) + v14);
        *(void *)(v12 + 48) = v15;
        *(unsigned char *)(v12 + 64) = 1;
        *((void *)this + 24) = v3;
        *((void *)this + 25) = v12;
        *((unsigned char *)this + 208) = v13;
      }
    }
    else
    {
      unsigned int v16 = *((_DWORD *)this + 46);
      uint64_t v17 = *((void *)this + 15);
      if (!(v16 % *(unsigned __int16 *)(v17 + 34)))
      {
        uint64_t v18 = *((void *)this + 20);
        *(_WORD *)(v18 + 32) = 256;
        *(unsigned char *)(v18 + 56) = 1;
        uint64_t v19 = *(void *)(*((void *)this + 22) + 16) + 0xF4240u / *(_DWORD *)(*((void *)this + 14) + 36);
        *(void *)(v18 + 40) = v19 + *(unsigned int *)(v17 + 40);
        *(void *)(v18 + 48) = v19;
        *(unsigned char *)(v18 + 64) = 1;
        *(unsigned char *)(v3 + 104) = 1;
        *((unsigned char *)this + 208) = 0;
      }
      *((_DWORD *)this + 46) = v16 + 1;
    }
  }
  return 0;
}

AlgWorkNode *TouchService::EventGenerationStep::EventGenerationStep(AlgWorkNode *a1, float a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  AlgWorkNode::AlgWorkNode(a1);
  *(void *)uint64_t v20 = &unk_27096AF80;
  *(void *)(v20 + 112) = a4;
  *(void *)(v20 + 120) = a5;
  *(void *)(v20 + 128) = a7;
  *(void *)(v20 + 136) = a8;
  *(void *)(v20 + 144) = a9;
  *(void *)(v20 + 152) = a13;
  *(void *)(v20 + 160) = a10;
  *(void *)(v20 + 168) = a11;
  *(void *)(v20 + 176) = a6;
  *(float *)(v20 + 184) = a2;
  *(void *)(v20 + 192) = a12;
  TouchService::EventGenerationStep::runNodeRegistrations((TouchService::EventGenerationStep *)v20);
  return a1;
}

{
  return TouchService::EventGenerationStep::EventGenerationStep(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

void sub_25BF1B454(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::EventGenerationStep::runNodeRegistrations(TouchService::EventGenerationStep *this)
{
  uint64_t v2 = (char *)this + 8;
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 14));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 15));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 16));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 17));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 18));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 20));
  uint64_t v3 = *((void *)this + 21);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v3);
}

BOOL TouchService::EventGenerationStep::isFingerInEvents(TouchService::EventGenerationStep *this, int a2)
{
  if (!(*(unsigned int (**)(void))(**((void **)this + 21) + 40))(*((void *)this + 21))) {
    return 0;
  }
  unint64_t v4 = 0;
  uint64_t v5 = 12;
  do
  {
    int v6 = *(_DWORD *)((*(uint64_t (**)(void))(*(void *)(*((void *)this + 21) + 32) + 8))() + v5);
    BOOL v7 = v6 == a2;
    if (v6 == a2) {
      break;
    }
    ++v4;
    v5 += 72;
  }
  while (v4 < (*(unsigned int (**)(void))(**((void **)this + 21) + 40))(*((void *)this + 21)));
  return v7;
}

uint64_t TouchService::EventGenerationStep::attributesFromFlags(TouchService::EventGenerationStep *this)
{
  unsigned int v1 = (this << 12) & 0x2000 | ((this & 1) << 11);
  if (((unsigned __int16)this & 0x100) != 0) {
    int v2 = 134479872;
  }
  else {
    int v2 = 0x40000;
  }
  if ((this & 4) != 0) {
    return (this << 17) & 0x4000000 | (((this >> 10) & 1) << 25) | (((this >> 11) & 1) << 24) | v2 | v1;
  }
  else {
    return v1;
  }
}

BOOL TouchService::EventGenerationStep::generateFingerEvent(uint64_t a1, unsigned char *a2, unsigned __int8 *a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  *(void *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  uint64_t v8 = *(void *)(a1 + 176);
  *(void *)a4 = *(void *)(v8 + 16);
  *(_DWORD *)(a4 + 8) = *(_DWORD *)(v8 + 8);
  if (!a3)
  {
    long long v29 = SALoggingGeneral();
    BOOL result = os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG);
    if (!result) {
      return result;
    }
    TouchService::EventGenerationStep::generateFingerEvent((uint64_t)a2, v29);
    return 0;
  }
  uint64_t v11 = *(float **)(a1 + 120);
  float v12 = v11[9];
  if (v12 <= 0.0 || (float v13 = v11[8], v13 <= 0.0))
  {
    uint64_t v30 = SALoggingGeneral();
    BOOL result = os_log_type_enabled(v30, OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    TouchService::EventGenerationStep::generateFingerEvent(a3, v30);
    return 0;
  }
  *(float *)&a7 = (float)(int)(float)(v12 / 1000.0) * 1000.0;
  *(_DWORD *)(a4 + 12) = *a3;
  int v15 = a3[2];
  *(_DWORD *)(a4 + 16) = v15;
  unsigned int v16 = *(_DWORD *)(*(void *)(a1 + 112) + 32);
  if (!v16) {
    unsigned int v16 = 480;
  }
  float v17 = 25400.0 / (float)v16;
  *(float *)(a4 + 24) = (float)(v17 * (float)(int)(float)((float)(*((float *)a3 + 1) - v11[10]) / v17)) / v13;
  *(float *)(a4 + 28) = 1.0
                      - (float)((float)(v17 * (float)(int)(float)((float)(*((float *)a3 + 2) - v11[11]) / v17)) / v12);
  *(int32x2_t *)(a4 + 32) = vrev64_s32((int32x2_t)vdiv_f32(*(float32x2_t *)(a3 + 20), (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0)));
  *(float *)(a4 + 40) = *(float *)(a1 + 184) / *(float *)&a7;
  *(void *)(a4 + 44) = *((void *)a3 + 4);
  *(float *)(a4 + 52) = (float)(*((float *)a3 + 7) * 180.0) / 3.1416;
  int v18 = a3[1];
  *(unsigned char *)(a4 + 57) = (v18 - 3) < 2;
  unsigned int v19 = v18 - 1;
  *(unsigned char *)(a4 + 56) = (v18 - 1) < 6;
  uint64_t v20 = (TouchService::EventGenerationStep *)*((unsigned __int16 *)a3 + 22);
  if ((__int16)v20 >= 0) {
    unsigned int v21 = (v20 << 8) & 0x800;
  }
  else {
    unsigned int v21 = (((v20 >> 3) & 1) << 11) | 0x4000;
  }
  *(_DWORD *)(a4 + 60) = v21;
  int v22 = TouchService::EventGenerationStep::attributesFromFlags(v20);
  *(_DWORD *)(a4 + 20) = v22;
  *(_WORD *)(a4 + 64) = (v20 >> 7) & 0x80;
  if (*(unsigned char *)(*(void *)(a1 + 152) + 30) == 1)
  {
    v22 |= 0x20000u;
    *(_DWORD *)(a4 + 20) = v22;
  }
  if (a2)
  {
    if (!a2[56] && v19 >= 6)
    {
      uint64_t v23 = SALoggingGeneral();
      BOOL result = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      int v25 = *(_DWORD *)(a4 + 12);
      int v26 = *(_DWORD *)(a4 + 16);
      int v27 = a3[1];
      int v63 = 67109632;
      *(_DWORD *)uint64_t v64 = v25;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v26;
      *(_WORD *)v65 = 1024;
      *(_DWORD *)&v65[2] = v27;
      char v28 = "EventGenerationStep:  P%d F%d stage=%d already gone -> skipping";
LABEL_47:
      _os_log_debug_impl(&dword_25BF13000, v23, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v63, 0x14u);
      return 0;
    }
  }
  else
  {
    if (v19 >= 6)
    {
      uint64_t v23 = SALoggingGeneral();
      BOOL result = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      int v36 = *(_DWORD *)(a4 + 12);
      int v37 = *(_DWORD *)(a4 + 16);
      int v38 = a3[1];
      int v63 = 67109632;
      *(_DWORD *)uint64_t v64 = v36;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v37;
      *(_WORD *)v65 = 1024;
      *(_DWORD *)&v65[2] = v38;
      char v28 = "EventGenerationStep:  New P%d F%d stage=%d not in range -> skipping";
      goto LABEL_47;
    }
    a2 = &TouchService::EventGenerationStep::generateFingerEvent(SADigitizerEventPacket const*,SAPreciseContact const*,SADigitizerEventPacket&)::empty_finger;
  }
  int v31 = *((_DWORD *)a2 + 5);
  if (((v31 ^ v22) & 0xF042800) != 0)
  {
    v22 |= 0x40u;
    *(_DWORD *)(a4 + 20) = v22;
    int v31 = *((_DWORD *)a2 + 5);
  }
  if ((v31 & 0x20000) != 0)
  {
    v22 |= 0x20000u;
    *(_DWORD *)(a4 + 20) = v22;
  }
  if ((v15 - 6) <= 0xFFFFFFFA)
  {
    if ((*((_DWORD *)a2 + 4) - 1) > 4)
    {
      uint64_t v23 = SALoggingGeneral();
      BOOL result = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (!result) {
        return result;
      }
      int v39 = *(_DWORD *)(a4 + 12);
      int v40 = *(_DWORD *)(a4 + 16);
      int v41 = a3[1];
      int v63 = 67109632;
      *(_DWORD *)uint64_t v64 = v39;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v40;
      *(_WORD *)v65 = 1024;
      *(_DWORD *)&v65[2] = v41;
      char v28 = "EventGenerationStep:  New P%d F%d stage=%d not a finger -> skipping";
      goto LABEL_47;
    }
    *(_DWORD *)(a4 + 20) = v22 | 0x80;
    *(_WORD *)(a4 + 56) = 0;
    uint64_t v32 = SALoggingGeneral();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      int v60 = *(_DWORD *)(a4 + 12);
      int v61 = *(_DWORD *)(a4 + 16);
      int v62 = a3[1];
      int v63 = 67109632;
      *(_DWORD *)uint64_t v64 = v60;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v61;
      *(_WORD *)v65 = 1024;
      *(_DWORD *)&v65[2] = v62;
      _os_log_debug_impl(&dword_25BF13000, v32, OS_LOG_TYPE_DEBUG, "EventGenerationStep:  P%d F%d stage=%d turned into no finger -> canceling", (uint8_t *)&v63, 0x14u);
    }
  }
  int v33 = a2[56];
  if (*(unsigned __int8 *)(a4 + 56) != v33) {
    *(_DWORD *)(a4 + 20) |= 1u;
  }
  int v34 = *(unsigned __int8 *)(a4 + 57);
  if (v34 != a2[57]) {
    *(_DWORD *)(a4 + 20) |= 2u;
  }
  if (v33)
  {
    if (*(_DWORD *)(a4 + 16) != *((_DWORD *)a2 + 4)) {
      *(_DWORD *)(a4 + 20) |= 0x20u;
    }
    if (v34 && (*(float *)(a4 + 24) != *((float *)a2 + 6) || *(float *)(a4 + 28) != *((float *)a2 + 7))) {
      *(_DWORD *)(a4 + 20) |= 4u;
    }
  }
  uint64_t v35 = SALoggingGeneral();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    int v42 = a3[1];
    int v43 = *(unsigned __int8 *)(a4 + 56);
    int v44 = *(unsigned __int8 *)(a4 + 57);
    if (a2 == (unsigned char *)&TouchService::EventGenerationStep::generateFingerEvent(SADigitizerEventPacket const*,SAPreciseContact const*,SADigitizerEventPacket&)::empty_finger) {
      int v45 = "New ";
    }
    else {
      int v45 = "";
    }
    int v46 = *(_DWORD *)(a4 + 16);
    int v47 = *(_DWORD *)(a4 + 20);
    double v48 = *((float *)a3 + 1);
    double v49 = *((float *)a3 + 2);
    double v50 = *(float *)(a4 + 24);
    double v51 = *(float *)(a4 + 28);
    double v52 = *(float *)(a4 + 36);
    double v53 = *(float *)(a4 + 32);
    double v54 = *(float *)(a4 + 48);
    double v55 = *(float *)(a4 + 44);
    int v57 = *(_DWORD *)(a4 + 8);
    int v56 = *(_DWORD *)(a4 + 12);
    int v58 = *(_DWORD *)(a4 + 60);
    int v59 = *(unsigned __int16 *)(a4 + 64);
    int v63 = 136319491;
    *(void *)uint64_t v64 = v45;
    *(_WORD *)&v64[8] = 1024;
    *(_DWORD *)v65 = v56;
    *(_WORD *)&v65[4] = 1024;
    int v66 = v46;
    __int16 v67 = 1024;
    int v68 = v42;
    __int16 v69 = 1024;
    int v70 = v43;
    __int16 v71 = 1024;
    int v72 = v44;
    __int16 v73 = 1024;
    int v74 = v47;
    __int16 v75 = 2053;
    double v76 = v48;
    __int16 v77 = 2053;
    double v78 = v49;
    __int16 v79 = 2053;
    double v80 = v50;
    __int16 v81 = 2053;
    double v82 = v51;
    __int16 v83 = 2048;
    double v84 = v52;
    __int16 v85 = 2048;
    double v86 = v53;
    __int16 v87 = 2048;
    double v88 = v54;
    __int16 v89 = 2048;
    double v90 = v55;
    __int16 v91 = 1024;
    int v92 = v57;
    __int16 v93 = 1024;
    int v94 = v58;
    __int16 v95 = 1024;
    int v96 = v59;
    _os_log_debug_impl(&dword_25BF13000, v35, OS_LOG_TYPE_DEBUG, "EventGenerationStep:  %sP%d -> F%d stage=%d range=%d touch=%d mask=0x%x pos_um=(%{sensitive}.3f,%{sensitive}.3f) x=%{sensitive}.8f y=%{sensitive}.8f majorR=%f minorR=%f density=%f quality=%f GC=%d option_mask=0x%x phase=0x%x\n", (uint8_t *)&v63, 0x92u);
  }
  return 1;
}

int32x2_t TouchService::EventGenerationStep::generateHandEvent(TouchService::EventGenerationStep *this)
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 20);
  *(unsigned char *)(v2 + 104) = 0;
  if ((*(unsigned int (**)(void))(**((void **)this + 21) + 40))(*((void *)this + 21)))
  {
    uint64_t v4 = *((void *)this + 17);
    long long v6 = *(_OWORD *)(v4 + 64);
    long long v5 = *(_OWORD *)(v4 + 80);
    long long v7 = *(_OWORD *)(v4 + 48);
    *(void *)(v2 + 96) = *(void *)(v4 + 96);
    *(_OWORD *)(v2 + 64) = v6;
    *(_OWORD *)(v2 + 80) = v5;
    *(_OWORD *)(v2 + 48) = v7;
    *(_OWORD *)(v2 + 32) = *(_OWORD *)(v4 + 32);
    uint64_t v8 = *((void *)this + 22);
    *(_DWORD *)(v2 + 40) = *(_DWORD *)(v8 + 8);
    *(void *)(v2 + 32) = *(void *)(v8 + 16);
    *(_WORD *)(v2 + 88) = 0;
    *(_DWORD *)(v2 + 92) = 0;
    *(void *)(v2 + 48) = 0x8000000001;
    if ((*(unsigned int (**)(void))(**((void **)this + 21) + 40))(*((void *)this + 21)))
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v11 = 0;
      do
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 21) + 32) + 8))();
        int v13 = *(unsigned __int8 *)(v2 + 89);
        uint64_t v14 = v12 + v9;
        int v15 = *(unsigned __int8 *)(v12 + v9 + 57);
        int v16 = *(unsigned __int8 *)(v2 + 88);
        if (*(unsigned char *)(v2 + 88)) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = *(unsigned char *)(v12 + v9 + 56) == 0;
        }
        int v18 = !v17;
        if (*(unsigned char *)(v12 + v9 + 57)) {
          BOOL v19 = v13 == 0;
        }
        else {
          BOOL v19 = 0;
        }
        if (v19 || v18 != 0)
        {
          unsigned int v11 = 0;
          *(void *)(v2 + 56) = 0;
          int v15 = *(unsigned __int8 *)(v14 + 57);
        }
        int v21 = v13 | v15;
        *(unsigned char *)(v2 + 89) = v21 != 0;
        BOOL v22 = (v16 | *(unsigned __int8 *)(v14 + 56)) != 0;
        *(unsigned char *)(v2 + 88) = v22;
        *(_DWORD *)(v2 + 92) |= *(_DWORD *)(v14 + 60);
        if (v21) {
          BOOL v23 = *(unsigned char *)(v14 + 57) == 0;
        }
        else {
          BOOL v23 = 1;
        }
        if (!v23 || v21 == 0 && v22 && *(unsigned char *)(v14 + 56))
        {
          ++v11;
          *(float32x2_t *)(v2 + 56) = vadd_f32(*(float32x2_t *)(v12 + v9 + 24), *(float32x2_t *)(v2 + 56));
        }
        unsigned int v24 = *(_DWORD *)(v2 + 52) | *(_DWORD *)(v12 + v9 + 20) & 0xFFFFFF7C;
        *(_DWORD *)(v2 + 52) = v24;
        int v25 = *(_DWORD *)(v12 + v9 + 20);
        if ((v25 & 0x80) == 0)
        {
          *(_DWORD *)(v2 + 52) = v24 & 0xFFFFFF7F;
          int v25 = *(_DWORD *)(v12 + v9 + 20);
        }
        if ((v25 & 3) != 0) {
          *(unsigned char *)(*((void *)this + 20) + 104) = 1;
        }
        ++v10;
        v9 += 72;
      }
      while (v10 < (*(unsigned int (**)(void))(**((void **)this + 21) + 40))(*((void *)this + 21)));
    }
    else
    {
      unsigned int v11 = 0;
    }
    int v26 = getInRangeEvents(*((void **)this + 21));
    int v27 = getInRangeEvents(*((void **)this + 18));
    if (!v26) {
      *(_DWORD *)(v2 + 52) &= 0x200A3u;
    }
    if (v26 != v27) {
      *(_DWORD *)(v2 + 52) |= 0x20u;
    }
    if ((v26 == 0) == (v27 != 0)) {
      *(_DWORD *)(v2 + 52) |= 1u;
    }
    BOOL v28 = hasTouchingEvents(*((void *)this + 21));
    if (v28 != hasTouchingEvents(*((void *)this + 18))) {
      *(_DWORD *)(v2 + 52) |= 2u;
    }
    if (v11 >= 2)
    {
      *(float *)result.i32 = (float)v11;
      int32x2_t result = (int32x2_t)vdiv_f32(*(float32x2_t *)(v2 + 56), (float32x2_t)vdup_lane_s32(result, 0));
      *(int32x2_t *)(v2 + 56) = result;
    }
    uint64_t v29 = *((void *)this + 20);
    if ((*(_DWORD *)(v2 + 52) & 0xF0FBD7FF) != 0)
    {
      *(unsigned char *)(v29 + 104) = 1;
    }
    else if (!*(unsigned char *)(v29 + 104))
    {
      return result;
    }
    uint64_t v30 = SALoggingGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      int v31 = *(_DWORD *)(v2 + 48);
      int v32 = (*(uint64_t (**)(void))(**((void **)this + 21) + 40))(*((void *)this + 21));
      int v33 = *(unsigned __int8 *)(v2 + 88);
      int v34 = *(unsigned __int8 *)(v2 + 89);
      int v35 = *(_DWORD *)(v2 + 52);
      double v36 = *(float *)(v2 + 56);
      double v37 = *(float *)(v2 + 60);
      int v38 = *(_DWORD *)(v2 + 40);
      int v39 = *(_DWORD *)(v2 + 92);
      v40[0] = 67111169;
      v40[1] = v31;
      __int16 v41 = 1024;
      int v42 = v32;
      __int16 v43 = 1024;
      int v44 = v33;
      __int16 v45 = 1024;
      int v46 = v34;
      __int16 v47 = 1024;
      int v48 = v35;
      __int16 v49 = 2053;
      double v50 = v36;
      __int16 v51 = 2053;
      double v52 = v37;
      __int16 v53 = 1024;
      int v54 = v38;
      __int16 v55 = 1024;
      int v56 = v39;
      _os_log_debug_impl(&dword_25BF13000, v30, OS_LOG_TYPE_DEBUG, "EventGenerationStep: H%d fingers=%d -> range=%d touch=%d mask=0x%x x=%{sensitive}f y=%{sensitive}f GC=%d option_mask=0x%x\n", (uint8_t *)v40, 0x40u);
    }
  }
  return result;
}

uint64_t getInRangeEvents(void *a1)
{
  if (!(*(unsigned int (**)(void *))(*a1 + 40))(a1)) {
    return 0;
  }
  uint64_t v2 = 0;
  unint64_t v3 = 0;
  LODWORD(v4) = 0;
  do
  {
    uint64_t v5 = (*(uint64_t (**)(void *))(a1[4] + 8))(a1 + 4);
    int v6 = 1 << *(_DWORD *)(v5 + v2 + 16);
    if (!*(unsigned char *)(v5 + v2 + 56)) {
      int v6 = 0;
    }
    uint64_t v4 = v6 | v4;
    ++v3;
    v2 += 72;
  }
  while (v3 < (*(unsigned int (**)(void *))(*a1 + 40))(a1));
  return v4;
}

BOOL hasTouchingEvents(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (!(*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(a1)) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = 57;
  do
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v2 + 8))(v2);
    BOOL v6 = *(unsigned char *)(v5 + v4) != 0;
    if (*(unsigned char *)(v5 + v4)) {
      break;
    }
    ++v3;
    v4 += 72;
  }
  while (v3 < (*(unsigned int (**)(uint64_t))(*(void *)a1 + 40))(a1));
  return v6;
}

uint64_t TouchService::EventGenerationStep::run(TouchService::EventGenerationStep *this)
{
  uint64_t v2 = *((void *)this + 18);
  if (!**((unsigned char **)this + 24))
  {
    if ((*(unsigned int (**)(void))(*(void *)v2 + 40))(*((void *)this + 18)))
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      uint64_t v10 = 0;
      do
      {
        uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 18) + 32) + 8))() + v8;
        uint64_t v12 = (v10 + 1);
        TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 21), v10 + 1);
        PathWithId = (unsigned __int8 *)TouchService::PlainPathCollection::getPathWithId(*((TouchService::PlainPathCollection **)this + 16), *(_DWORD *)(v11 + 12));
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 21) + 32) + 8))();
        if (!TouchService::EventGenerationStep::generateFingerEvent((uint64_t)this, (unsigned char *)v11, PathWithId, v14 + 72 * v10, v15, v16, v17))
        {
          TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 21), v10);
          uint64_t v12 = v10;
        }
        ++v9;
        v8 += 72;
        uint64_t v10 = v12;
      }
      while (v9 < (*(unsigned int (**)(void))(**((void **)this + 18) + 40))(*((void *)this + 18)));
    }
    else
    {
      uint64_t v12 = 0;
    }
    TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 21), v12);
    if (!(*(unsigned int (**)(void))(**((void **)this + 16) + 40))(*((void *)this + 16)))
    {
LABEL_18:
      TouchService::EventGenerationStep::generateHandEvent(this);
      return 0;
    }
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    while (1)
    {
      uint64_t v20 = (unsigned __int8 *)((*(uint64_t (**)(void))(*(void *)(*((void *)this + 16) + 32) + 8))() + v18);
      if (!*v20 || TouchService::EventGenerationStep::isFingerInEvents(this, *v20)) {
        goto LABEL_16;
      }
      uint64_t v21 = (v12 + 1);
      TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 21), v12 + 1);
      uint64_t v22 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 21) + 32) + 8))();
      if (!TouchService::EventGenerationStep::generateFingerEvent((uint64_t)this, 0, v20, v22 + 72 * v12, v23, v24, v25))break; {
LABEL_17:
      }
      ++v19;
      v18 += 48;
      uint64_t v12 = v21;
      if (v19 >= (*(unsigned int (**)(void))(**((void **)this + 16) + 40))(*((void *)this + 16))) {
        goto LABEL_18;
      }
    }
    TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 21), v12);
LABEL_16:
    uint64_t v21 = v12;
    goto LABEL_17;
  }
  TouchService::PlainPathCollection::operator=(*((void *)this + 21), v2);
  uint64_t v3 = *((void *)this + 20);
  uint64_t v4 = *((void *)this + 17);
  *(_OWORD *)(v3 + 32) = *(_OWORD *)(v4 + 32);
  long long v6 = *(_OWORD *)(v4 + 64);
  long long v5 = *(_OWORD *)(v4 + 80);
  long long v7 = *(_OWORD *)(v4 + 48);
  *(void *)(v3 + 96) = *(void *)(v4 + 96);
  *(_OWORD *)(v3 + 64) = v6;
  *(_OWORD *)(v3 + 80) = v5;
  *(_OWORD *)(v3 + 48) = v7;
  return 0;
}

void TouchService::EventGenerationStep::generateFingerEvent(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (a1) {
    int v2 = *(_DWORD *)(a1 + 12);
  }
  else {
    int v2 = -1;
  }
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_25BF13000, a2, OS_LOG_TYPE_DEBUG, "EventGenerationStep:  Old P%d already gone", (uint8_t *)v3, 8u);
}

void TouchService::EventGenerationStep::generateFingerEvent(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = a1[2];
  int v4 = a1[1];
  v5[0] = 67109632;
  v5[1] = v2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_error_impl(&dword_25BF13000, a2, OS_LOG_TYPE_ERROR, "EventGenerationStep:  P%d F%d stage=%d invalid surface descriptor -> skipping", (uint8_t *)v5, 0x14u);
}

uint64_t TouchService::TouchTask::TouchTask(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v27 = ConditionalAlgTaskNode::ConditionalAlgTaskNode((AlgTaskNode *)a1, 0x377B146B853171BLL, a2);
  *(void *)int v27 = &unk_27096AFD0;
  *((void *)v27 + 18) = a3;
  TouchService::PlainPathCollection::PlainPathCollection((char *)v27 + 176, 0xBFCA37ADAF690F9DLL, 18, 0);
  AlgDataNode::AlgDataNode((AlgDataNode *)(a1 + 232), 0x14186292CB5EC19FLL, 0);
  *(void *)(a1 + 232) = &unk_27096B098;
  *(void *)(a1 + 328) = 0;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_DWORD *)(a1 + 248) = 31232;
  *(_DWORD *)(a1 + 256) = 72;
  *(unsigned char *)(a1 + 336) = 0;
  TouchService::TouchServiceEventCollection::TouchServiceEventCollection(a1 + 344, 0x726D3482B33B0E37, 18, 0);
  *(void *)(a1 + 408) = a4;
  *(void *)(a1 + 416) = a5;
  *(void *)(a1 + 424) = a6;
  *(void *)(a1 + 432) = a7;
  *(void *)(a1 + 440) = a8;
  *(void *)(a1 + 448) = a9;
  *(void *)(a1 + 456) = a19;
  *(void *)(a1 + 464) = a10;
  *(void *)(a1 + 472) = a20;
  TouchService::PlainPathCollection::PlainPathCollection(a1 + 480, 0x377AC42062A2DE2, 18, 0);
  TouchService::PlainPathCollection::PlainPathCollection(a1 + 536, 0xAD07F595BC326A50, 18, 0);
  *(void *)(a1 + 592) = a11;
  *(void *)(a1 + 600) = a12;
  *(void *)(a1 + 608) = a13;
  *(void *)(a1 + 616) = a14;
  *(void *)(a1 + 624) = a15;
  *(void *)(a1 + 632) = a16;
  *(void *)(a1 + 640) = a17;
  *(void *)(a1 + 648) = a18;
  TouchService::PathTrackingStep::PathTrackingStep((TouchService::PathTrackingStep *)(a1 + 656), *(TouchService::PlainPathCollection **)(a1 + 432), (TouchService::PlainPathCollection *)(a1 + 480));
  TouchService::ContactReclassificationStep::ContactReclassificationStep((AlgWorkNode *)(a1 + 784), *(void *)(a1 + 144), *(void *)(a1 + 416), *(void *)(a1 + 424), *(void *)(a1 + 464), *(void *)(a1 + 432), *(void *)(a1 + 472));
  TouchService::CoreAnalyticsStep::CoreAnalyticsStep(a1 + 960, *(void *)(a1 + 432), *(void *)(a1 + 592), *(void *)(a1 + 632), *(void *)(a1 + 144), 0);
  TouchService::TipOffsetStep::TipOffsetStep((TouchService::TipOffsetStep *)(a1 + 1128), *(DeviceOrientationNode **)(a1 + 424), *(TouchService::PlainPathCollection **)(a1 + 432));
  TouchService::HysteresisFilterStep::HysteresisFilterStep(a1 + 1296, *(void *)(a1 + 408), *(void *)(a1 + 416), *(void *)(a1 + 424), *(void *)(a1 + 432), *(void *)(a1 + 144), 0);
  TouchService::RadiusCorrectionStep::RadiusCorrectionStep(a1 + 1568, *(void *)(a1 + 432), 0, 1000.0);
  TouchService::InterpolationStep::InterpolationStep((AlgWorkNode *)(a1 + 1752), *(void *)(a1 + 144), a1 + 152, *(void *)(a1 + 408), *(void *)(a1 + 440), *(void *)(a1 + 432), a1 + 480, a1 + 536);
  TouchService::EventGenerationStep::EventGenerationStep((AlgWorkNode *)(a1 + 1952), 1000.0, 0xE6B14D7065085DALL, *(void *)(a1 + 408), *(void *)(a1 + 416), a1 + 152, a1 + 536, a1 + 232, a1 + 344, *(void *)(a1 + 600), *(void *)(a1 + 608), a1 + 400, *(void *)(a1 + 456));
  TouchService::EventGenerationStep::EventGenerationStep((AlgWorkNode *)(a1 + 2152), 1000.0, 0x194876B5C87728CFLL, *(void *)(a1 + 408), *(void *)(a1 + 416), *(void *)(a1 + 144), *(void *)(a1 + 432), *(void *)(a1 + 600), *(void *)(a1 + 608), *(void *)(a1 + 616), *(void *)(a1 + 624), a1 + 401, *(void *)(a1 + 456));
  TouchService::EventInfoStep::EventInfoStep((AlgWorkNode *)(a1 + 2352), *(void *)(a1 + 144), *(void *)(a1 + 440), *(void *)(a1 + 448), *(void *)(a1 + 616), *(void *)(a1 + 624), *(void *)(a1 + 600), *(void *)(a1 + 608), *(void *)(a1 + 640), *(void *)(a1 + 648));
  TouchService::TouchTask::runNodeRegistrations((TouchService::TouchTask *)a1);
  *(_WORD *)(a1 + 400) = 1;
  return a1;
}

{
  return TouchService::TouchTask::TouchTask(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20);
}

void sub_25BF1C9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _Unwind_Exception *exception_object, AlgWorkNode *a14, TouchService::CoreAnalyticsStep *a15, AlgWorkNode *a16, AlgWorkNode *a17, TouchService::TouchServiceEventCollection *a18, TouchService::PlainPathCollection *a19)
{
  AlgWorkNode::~AlgWorkNode(v28);
  AlgWorkNode::~AlgWorkNode(v27);
  AlgWorkNode::~AlgWorkNode(v22);
  TouchService::InterpolationStep::~InterpolationStep(v26);
  TouchService::RadiusCorrectionStep::~RadiusCorrectionStep(v25);
  TouchService::HysteresisFilterStep::~HysteresisFilterStep(v20);
  *((void *)v19 + 141) = &unk_27096B2C8;
  *((void *)v19 + 155) = &unk_27096BC60;
  AlgWorkNode::~AlgWorkNode(a14);
  TouchService::CoreAnalyticsStep::~CoreAnalyticsStep(a15);
  AlgWorkNode::~AlgWorkNode(a16);
  AlgWorkNode::~AlgWorkNode(a17);
  TouchService::PlainPathCollection::~PlainPathCollection(v24);
  TouchService::PlainPathCollection::~PlainPathCollection(v23);
  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection(a18);
  *uint64_t v21 = &unk_27096BC60;
  TouchService::PlainPathCollection::~PlainPathCollection(a19);
  AlgTaskNode::~AlgTaskNode(v19);
  _Unwind_Resume(a1);
}

void sub_25BF1CAE4()
{
}

void sub_25BF1CAEC()
{
}

void sub_25BF1CAF4()
{
}

void sub_25BF1CAFC()
{
}

void sub_25BF1CB04()
{
}

void sub_25BF1CB0C()
{
}

void sub_25BF1CB14()
{
}

void sub_25BF1CB1C()
{
}

void sub_25BF1CB24()
{
}

void sub_25BF1CB2C()
{
}

void sub_25BF1CB34()
{
}

void *TouchService::TouchTask::runNodeRegistrations(TouchService::TouchTask *this)
{
  int v2 = (char *)this + 8;
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 51));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 52));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 53));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 54));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 55));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 56));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 57));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 58));
  uint64_t v3 = *((void *)this + 59);
  if (v3) {
    AlgWorkNode::registerAlgDataNode((uint64_t)v2, v3);
  }
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 32, (uint64_t)this + 480);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 32, (uint64_t)this + 536);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 77));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 78));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 75));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 76));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 74));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 79));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 80));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 81));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 656));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 784));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 960));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 1128));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 1296));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 1568));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 1752));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 1952));
  ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 2152));

  return ConditionalAlgTaskNode::registerChild(this, (TouchService::TouchTask *)((char *)this + 2352));
}

uint64_t TouchService::TouchTask::invalidateOutputNodes(TouchService::TouchTask *this)
{
  *(unsigned char *)(*((void *)this + 77) + 104) = 0;
  *(unsigned char *)(*((void *)this + 75) + 104) = 0;
  *(unsigned char *)(*((void *)this + 80) + 64) = 0;
  *(unsigned char *)(*((void *)this + 81) + 64) = 0;
  *(unsigned char *)(*((void *)this + 79) + 36) = 0;
  return TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 74), 0);
}

uint64_t TouchService::TouchTask::baselineAdaptNotification(TouchService::TouchTask *this)
{
  return TouchService::EventInfoStep::baselineAdaptNotification((uint64_t)this + 2352);
}

uint64_t TouchService::TouchTask::runBeforeChildren(TouchService::TouchTask *this)
{
  TouchService::PlainPathCollection::operator=((uint64_t)this + 176, *((void *)this + 54));
  *((unsigned char *)this + 400) = *(unsigned char *)(*((void *)this + 55) + 32) ^ 1;
  return 0;
}

uint64_t TouchService::TouchTask::runAfterChildren(TouchService::TouchTask *this)
{
  TouchService::PlainPathCollection::operator=((uint64_t)this + 480, (uint64_t)this + 176);
  uint64_t v2 = *((void *)this + 77);
  *(_OWORD *)((char *)this + 264) = *(_OWORD *)(v2 + 32);
  long long v4 = *(_OWORD *)(v2 + 64);
  long long v3 = *(_OWORD *)(v2 + 80);
  long long v5 = *(_OWORD *)(v2 + 48);
  *((void *)this + 41) = *(void *)(v2 + 96);
  *(_OWORD *)((char *)this + 296) = v4;
  *(_OWORD *)((char *)this + 312) = v3;
  *(_OWORD *)((char *)this + 280) = v5;
  TouchService::PlainPathCollection::operator=((uint64_t)this + 344, *((void *)this + 78));
  if (!*(unsigned char *)(*((void *)this + 55) + 32))
  {
    TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 76), 0);
    *(unsigned char *)(*((void *)this + 75) + 104) = 0;
  }
  return 0;
}

void TouchService::TouchTask::~TouchTask(TouchService::TouchTask *this)
{
  TouchService::TouchTask::~TouchTask(this);

  operator delete(v1);
}

{
  uint64_t vars8;

  *(void *)this = &unk_27096AFD0;
  AlgWorkNode::~AlgWorkNode((TouchService::TouchTask *)((char *)this + 2352));
  AlgWorkNode::~AlgWorkNode((TouchService::TouchTask *)((char *)this + 2152));
  AlgWorkNode::~AlgWorkNode((TouchService::TouchTask *)((char *)this + 1952));
  TouchService::InterpolationStep::~InterpolationStep((TouchService::TouchTask *)((char *)this + 1752));
  TouchService::RadiusCorrectionStep::~RadiusCorrectionStep((TouchService::TouchTask *)((char *)this + 1568));
  TouchService::HysteresisFilterStep::~HysteresisFilterStep((TouchService::TouchTask *)((char *)this + 1296));
  *((void *)this + 141) = &unk_27096B2C8;
  *((void *)this + 155) = &unk_27096BC60;
  AlgWorkNode::~AlgWorkNode((TouchService::TouchTask *)((char *)this + 1128));
  TouchService::CoreAnalyticsStep::~CoreAnalyticsStep((TouchService::TouchTask *)((char *)this + 960));
  AlgWorkNode::~AlgWorkNode((TouchService::TouchTask *)((char *)this + 784));
  AlgWorkNode::~AlgWorkNode((TouchService::TouchTask *)((char *)this + 656));
  TouchService::PlainPathCollection::~PlainPathCollection((TouchService::TouchTask *)((char *)this + 536));
  TouchService::PlainPathCollection::~PlainPathCollection((TouchService::TouchTask *)((char *)this + 480));
  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection((TouchService::TouchTask *)((char *)this + 344));
  *((void *)this + 29) = &unk_27096BC60;
  TouchService::PlainPathCollection::~PlainPathCollection((TouchService::TouchTask *)((char *)this + 176));

  AlgTaskNode::~AlgTaskNode(this);
}

uint64_t AlgTaskNode::children(AlgTaskNode *this)
{
  return (uint64_t)this + 112;
}

uint64_t AlgTaskNode::run(AlgTaskNode *this)
{
  return 1280;
}

AlgWorkNode *TouchService::ContactReclassificationStep::ContactReclassificationStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  AlgWorkNode::AlgWorkNode(a1);
  void *v14 = &unk_27096B048;
  v14[14] = a2;
  v14[15] = a3;
  v14[16] = a4;
  v14[17] = a7;
  v14[18] = a5;
  v14[19] = a6;
  v14[20] = 0;
  v14[21] = 0;
  if (a7)
  {
    uint64_t v18 = a3;
    uint64_t v19 = a4;
    uint64_t v20 = a6;
    uint64_t v21 = a7;
    double v16 = &v18;
    uint64_t v17 = 4;
  }
  else
  {
    uint64_t v18 = a3;
    uint64_t v19 = a4;
    uint64_t v20 = a6;
    double v16 = &v18;
    uint64_t v17 = 3;
  }
  SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize((uint64_t)a1 + 8, (uint64_t)&v16);
  return a1;
}

void sub_25BF1CF5C(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

uint64_t TouchService::ContactReclassificationStep::run(TouchService::ContactReclassificationStep *this)
{
  v19[3] = *MEMORY[0x263EF8340];
  (*(void (**)(void))(**((void **)this + 19) + 40))(*((void *)this + 19));
  MEMORY[0x270FA5388]();
  long long v4 = (char *)v19 - v3;
  if (v2 >= 0x200) {
    size_t v5 = 512;
  }
  else {
    size_t v5 = v2;
  }
  bzero((char *)v19 - v3, v5);
  if ((*(unsigned int (**)(void))(**((void **)this + 19) + 40))(*((void *)this + 19)))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      *(void *)&v4[8 * v7++] = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 19) + 32) + 8))() + v6;
      v6 += 48;
    }
    while (v7 < (*(unsigned int (**)(void))(**((void **)this + 19) + 40))(*((void *)this + 19)));
  }
  uint64_t v8 = *((void *)this + 17);
  if (v8) {
    uint64_t v9 = *(void *)(v8 + 32);
  }
  else {
    uint64_t v9 = 0;
  }
  memset(v19, 0, 24);
  if ((*(unsigned int (**)(void))(**((void **)this + 18) + 40))(*((void *)this + 18)))
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      v19[v11++] = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 18) + 128) + 8))() + v10;
      v10 += 28;
    }
    while (v11 < (*(unsigned int (**)(void))(**((void **)this + 18) + 40))(*((void *)this + 18)));
  }
  uint64_t v12 = **((void **)this + 14);
  int v13 = (float *)(*((void *)this + 15) + 32);
  char v14 = *(unsigned char *)(*((void *)this + 16) + 30);
  unsigned __int8 v15 = (*(uint64_t (**)(void))(**((void **)this + 19) + 40))(*((void *)this + 19));
  *(double *)v16.i64 = (*(double (**)(void))(**((void **)this + 18) + 40))(*((void *)this + 18));
  TouchService::ContactReclassification<62ull,(unsigned char)3>::reclassify((int8x16_t *)this + 10, v12, v13, v14, v9, (uint64_t)v4, v15, v19, v16, v17);
  return 0;
}

void SAList<std::reference_wrapper<AlgDataNode>>::appendAndResize(uint64_t a1, uint64_t a2)
{
  SAList<std::reference_wrapper<AlgDataNode>>::resize(a1, *(_DWORD *)(a1 + 12) + *(_DWORD *)(a2 + 8));
  uint64_t v4 = *(void *)(a2 + 8);
  if (v4)
  {
    size_t v5 = *(void **)a2;
    uint64_t v6 = 8 * v4;
    do
    {
      SAList<std::reference_wrapper<AlgDataNode>>::push_back(a1, v5++);
      v6 -= 8;
    }
    while (v6);
  }
}

void SAList<std::reference_wrapper<AlgDataNode>>::resize(uint64_t a1, unsigned int a2)
{
  int v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)(a1 + 8) = a2;
  if (a2)
  {
    if (v2 != a2)
    {
      uint64_t v4 = *(void **)a1;
      if (*(void *)a1)
      {
        size_t v5 = operator new(8 * a2);
        *(void *)a1 = v5;
        memcpy(v5, v4, 8 * *(unsigned int *)(a1 + 12));
        operator delete[](v4);
      }
    }
  }
}

void *SAList<std::reference_wrapper<AlgDataNode>>::push_back(uint64_t a1, void *a2)
{
  int32x2_t result = *(void **)a1;
  if (!result)
  {
    int32x2_t result = operator new(8 * *(unsigned int *)(a1 + 8));
    *(void *)a1 = result;
  }
  result[(*(_DWORD *)(a1 + 12))++] = *a2;
  return result;
}

uint64_t TouchService::ContactReclassification<62ull,(unsigned char)3>::reclassify(int8x16_t *a1, uint64_t a2, float *a3, char a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t *a8, int8x16_t a9, unsigned __int8 a10)
{
  char v38 = a4;
  if (a7)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v14 = a10;
    if (a5) {
      BOOL v15 = (unint64_t)(a2 - a5) >> 8 > 0xC34;
    }
    else {
      BOOL v15 = 1;
    }
    char v16 = v15;
    uint64_t v32 = a7;
    char v34 = v16 ^ 1;
    while (1)
    {
      uint64_t v17 = *(void *)(a6 + 8 * v12);
      uint64_t v18 = 1 << *(unsigned char *)v17;
      uint64_t v19 = a1->i64[0];
      if (*(unsigned __int8 *)(v17 + 1) >= 3u && ((1 << *(unsigned char *)(v17 + 2)) & 0x3E) != 0)
      {
        a1->i64[0] = v18 | v19;
        int v20 = 1;
      }
      else
      {
        int v20 = 0;
      }
      int v35 = v20;
      if (v14) {
        break;
      }
      int v36 = 0;
LABEL_41:
      if (((v35 | v36) & 1) == 0)
      {
        a9 = vandq_s8(*a1, (int8x16_t)vdupq_n_s64(~v18));
        *a1 = a9;
      }
      v13 |= v18;
      ++v12;
      uint64_t v14 = a10;
      if (v12 == v32) {
        goto LABEL_46;
      }
    }
    int v36 = 0;
    uint64_t v37 = v18 & v19;
    if ((v18 & v19) != 0) {
      int v21 = 0;
    }
    else {
      int v21 = v20;
    }
    uint64_t v22 = a8;
    while (1)
    {
      uint64_t v23 = *v22;
      if ((*(_DWORD *)(*v22 + 16) >> v38))
      {
        *(float *)a9.i32 = TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(a3, &v38, *v22, *(double *)a9.i64);
        float v27 = *(float *)(v17 + 4);
        if (v27 >= *(float *)a9.i32 && v27 <= v25)
        {
          a9.i32[0] = *(_DWORD *)(v17 + 8);
          if (*(float *)a9.i32 >= v24 && *(float *)a9.i32 <= v26)
          {
            if (v21)
            {
              a1->i64[1] |= v18;
LABEL_34:
              if (((*(_DWORD *)(v23 + 20) >> *(unsigned char *)(v17 + 2)) & 1) != 0
                && *(unsigned __int8 *)(v17 + 1) >= 3u
                && (*(_DWORD *)&v34 & (*(unsigned __int8 *)(v23 + 17) >> 1) & 1) == 0)
              {
                *(unsigned char *)(v17 + 2) = *(unsigned char *)(v23 + 26);
                if (!v37) {
                  *(_WORD *)(v17 + 44) |= *(_WORD *)(v23 + 24);
                }
                int v36 = 1;
              }
              goto LABEL_28;
            }
            if (!v37 || (a1->i64[1] & v18) != 0) {
              goto LABEL_34;
            }
          }
        }
      }
LABEL_28:
      ++v22;
      if (!--v14) {
        goto LABEL_41;
      }
    }
  }
  unint64_t v13 = 0;
LABEL_46:
  *a1 = vandq_s8(*a1, (int8x16_t)vdupq_n_s64(v13));
  return 1;
}

float TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(float *a1, char *a2, uint64_t a3, double a4)
{
  if (*(unsigned char *)(a3 + 16)) {
    char v4 = *a2;
  }
  else {
    char v4 = 1;
  }
  switch(v4)
  {
    case 1:
      *(float *)&a4 = *a1;
      double v6 = TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(a3, a4, a1[1]);
      float result = a1[2] + *(float *)&v6;
      break;
    case 2:
      *(float *)&a4 = *a1;
      TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(a3, a4, a1[1]);
      float result = a1[4] - v8;
      break;
    case 3:
      *(float *)&a4 = a1[1];
      TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(a3, a4, *a1);
      float result = a1[4] - v9;
      break;
    case 4:
      *(float *)&a4 = a1[1];
      TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(a3, a4, *a1);
      float result = a1[2] + v10;
      break;
    default:
      float result = 0.0;
      break;
  }
  return result;
}

double TouchService::ContactReclassification<62ull,(unsigned char)3>::regionCoords(uint64_t a1, double a2, float a3)
{
  *((float *)&a2 + 1) = a3;
  int8x16_t v3 = (int8x16_t)vdupq_lane_s64(*(uint64_t *)&a2, 0);
  float32x4_t v4 = vmulq_f32(*(float32x4_t *)a1, (float32x4_t)vbslq_s8((int8x16_t)vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vdupq_lane_s32(*(int32x2_t *)(a1 + 16), 0), (int8x16_t)xmmword_25BF26250)), (int8x16_t)vdupq_n_s32(0x447A0000u), v3));
  v5.i64[0] = 0x8000000080000000;
  v5.i64[1] = 0x8000000080000000;
  *(void *)&double result = vaddq_f32(v4, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_f32(v4), v3, v5)).u64[0];
  return result;
}

void AlgTaskNode::~AlgTaskNode(AlgTaskNode *this)
{
  *(void *)this = &unk_27096BD20;
  if (*((_DWORD *)this + 31)) {
    *((_DWORD *)this + 31) = 0;
  }
  int v2 = (void *)*((void *)this + 14);
  if (v2) {
    operator delete[](v2);
  }

  AlgWorkNode::~AlgWorkNode(this);
}

{
  void *v1;
  uint64_t vars8;

  AlgTaskNode::~AlgTaskNode(this);

  operator delete(v1);
}

uint64_t PlainDataNodeWithValidity<SADigitizerEventPacket>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 104))
  {
    *(void *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

__n128 PlainDataNode<SADigitizerEventPacket>::injectBuffer(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 32) = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 96) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v3;
  *(_OWORD *)(a1 + 80) = v4;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

TouchService::TouchServiceTTWPlan *TouchService::TouchServiceTTWPlan::TouchServiceTTWPlan(TouchService::TouchServiceTTWPlan *this)
{
  AlgTaskNode::AlgTaskNode(this);
  *int v2 = &unk_27096B100;
  long long v3 = v2 + 20;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v2 + 20), 0x726DB665A87D6D56, 0);
  *((void *)this + 20) = &unk_27096B178;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 24) = 0;
  *((_DWORD *)this + 54) = 0;
  *((_DWORD *)this + 44) = 28672;
  *((_DWORD *)this + 46) = 28;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceTTWPlan *)((char *)this + 224), 0x1AE6533682FB2CLL, 0);
  *((void *)this + 40) = 0;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 19) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_DWORD *)this + 60) = 31232;
  *((_DWORD *)this + 62) = 72;
  *((void *)this + 28) = &unk_27096B098;
  *((unsigned char *)this + 328) = 0;
  TouchService::TapEventGenerationStep::TapEventGenerationStep((char *)this + 336, (char *)this + 136, v3, (char *)this + 224);
  TouchService::TouchServiceTTWPlan::runNodeRegistrations(this);
  *((unsigned char *)this + 192) = 0;
  return this;
}

void sub_25BF1DA14(_Unwind_Exception *a1)
{
  int8x16_t v5 = v4;
  AlgWorkNode::~AlgWorkNode(v5);
  *long long v3 = &unk_27096BC60;
  *int v2 = &unk_27096BC60;
  AlgTaskNode::~AlgTaskNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::TouchServiceTTWPlan::runNodeRegistrations(TouchService::TouchServiceTTWPlan *this)
{
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, (uint64_t)this + 160);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 224);
  long long v3 = (char *)this + 336;
  return SAList<std::reference_wrapper<AlgDataNode>>::push_back((uint64_t)this + 112, &v3);
}

uint64_t TouchService::TouchServiceTTWPlan::runPlan(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[17] = 0;
  a1[18] = 0;
  unint64_t v7 = a1 + 17;
  v7[2] = 0;
  if (a2 && *(_DWORD *)a2 == 0x2000)
  {
    memcpy(v7, *(const void **)(a2 + 16), *(void *)(a2 + 8));
    uint64_t v8 = a1[17];
    uint64_t v9 = *((unsigned int *)a1 + 36);
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  float v10 = *(uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, void))(*a1 + 40);

  return v10(a1, a3, a4, v8, v9, 0);
}

uint64_t TouchService::TouchServiceTTWPlan::runAfterChildren(TouchService::TouchServiceTTWPlan *this)
{
  *((unsigned char *)this + 192) = 0;
  return 0;
}

void TouchService::TouchServiceTTWPlan::~TouchServiceTTWPlan(TouchService::TouchServiceTTWPlan *this)
{
  *(void *)this = &unk_27096B100;
  AlgWorkNode::~AlgWorkNode((TouchService::TouchServiceTTWPlan *)((char *)this + 336));
  *((void *)this + 28) = &unk_27096BC60;
  *((void *)this + 20) = &unk_27096BC60;

  AlgTaskNode::~AlgTaskNode(this);
}

{
  void *v2;
  uint64_t vars8;

  *(void *)this = &unk_27096B100;
  AlgWorkNode::~AlgWorkNode((TouchService::TouchServiceTTWPlan *)((char *)this + 336));
  *((void *)this + 28) = &unk_27096BC60;
  *((void *)this + 20) = &unk_27096BC60;
  AlgTaskNode::~AlgTaskNode(this);

  operator delete(v2);
}

__n128 PlainDataNode<TTWResults>::injectBuffer(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 44) = *(_OWORD *)(a2 + 12);
  *(__n128 *)(a1 + 32) = result;
  return result;
}

TouchService::PathTrackingStep *TouchService::PathTrackingStep::PathTrackingStep(TouchService::PathTrackingStep *this, TouchService::PlainPathCollection *a2, TouchService::PlainPathCollection *a3)
{
  AlgWorkNode::AlgWorkNode(this);
  *(void *)double v6 = &unk_27096B1C8;
  *((void *)v6 + 14) = a2;
  *((void *)v6 + 15) = a3;
  TouchService::PathTrackingStep::runNodeRegistrations(v6);
  return this;
}

void sub_25BF1DD44(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::PathTrackingStep::runNodeRegistrations(TouchService::PathTrackingStep *this)
{
  int v2 = (char *)this + 8;
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 14));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 15));
  uint64_t v3 = *((void *)this + 14);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v3);
}

uint64_t TouchService::PathTrackingStep::run(TouchService::PathTrackingStep *this)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if ((*(unsigned int (**)(void))(**((void **)this + 15) + 40))(*((void *)this + 15)))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    *(void *)&long long v2 = 67109632;
    long long v39 = v2;
    do
    {
      uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 15) + 32) + 8))();
      double v6 = (unsigned __int8 *)(v5 + v3);
      if (*(unsigned char *)(v5 + v3 + 1))
      {
        uint64_t v7 = v5;
        if (!TouchService::PlainPathCollection::getPathWithId(*((TouchService::PlainPathCollection **)this + 14), *v6))
        {
          uint64_t v8 = SALoggingGeneral();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v9 = *(unsigned __int8 *)(v7 + v3);
            int v10 = *(unsigned __int8 *)(v7 + v3 + 2);
            int v11 = v6[1];
            *(_DWORD *)buf = v39;
            *(_DWORD *)&buf[4] = v9;
            LOWORD(v43) = 1024;
            *(_DWORD *)((char *)&v43 + 2) = v10;
            HIWORD(v43) = 1024;
            LODWORD(v44) = v11;
            _os_log_impl(&dword_25BF13000, v8, OS_LOG_TYPE_INFO, "PathTrackingStep:  Lost P%d F%d stage=%d", buf, 0x14u);
          }
          uint64_t v12 = *((void *)this + 14);
          char v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 40))(v12);
          TouchService::TouchServicePathStatsCollection::setNumPathStats(v12, v13 + 1);
          uint64_t v14 = (void *)*((void *)this + 14);
          unsigned int v15 = (*(uint64_t (**)(void *))(*v14 + 40))(v14) - 1;
          uint64_t v16 = (*(uint64_t (**)(void *))(v14[4] + 8))(v14 + 4) + 48 * v15;
          long long v18 = *((_OWORD *)v6 + 1);
          long long v17 = *((_OWORD *)v6 + 2);
          *(_OWORD *)uint64_t v16 = *(_OWORD *)v6;
          *(_OWORD *)(v16 + 16) = v18;
          *(_OWORD *)(v16 + 32) = v17;
          *(unsigned char *)(v16 + 1) = 0;
        }
      }
      ++v4;
      v3 += 48;
    }
    while (v4 < (*(unsigned int (**)(void))(**((void **)this + 15) + 40))(*((void *)this + 15)));
  }
  v52[0] = 0;
  v52[1] = 0;
  char v53 = 0;
  v50[0] = 0;
  v50[1] = 0;
  char v51 = 0;
  v48[0] = 0;
  v48[1] = 0;
  char v49 = 0;
  if ((*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14)))
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    char v21 = 0;
    unsigned int v22 = 0;
    while (1)
    {
      uint64_t v23 = (unsigned __int8 *)((*(uint64_t (**)(void))(*(void *)(*((void *)this + 14) + 32) + 8))() + v19);
      uint64_t PathWithId = TouchService::PlainPathCollection::getPathWithId(*((TouchService::PlainPathCollection **)this + 15), *v23);
      uint64_t v25 = v23[2];
      if (v25 > 0x10 || (v25 - 6) > 0xFFFFFFFA) {
        goto LABEL_26;
      }
      ++v22;
      if (v23[1] - 3 > 1)
      {
        if (!PathWithId || *(unsigned __int8 *)(PathWithId + 1) - 3 > 1) {
          goto LABEL_26;
        }
        char v21 = 1;
        uint64_t v29 = v50;
      }
      else if (PathWithId)
      {
        unsigned int v27 = *(unsigned __int8 *)(PathWithId + 1) - 5;
        BOOL v28 = v27 < 0xFFFFFFFE;
        if (v27 >= 0xFFFFFFFE) {
          uint64_t v29 = v48;
        }
        else {
          uint64_t v29 = v52;
        }
        v21 |= v28;
      }
      else
      {
        char v21 = 1;
        uint64_t v29 = v52;
      }
      ++*((unsigned char *)v29 + v25);
LABEL_26:
      ++v20;
      v19 += 48;
      if (v20 >= (*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14)))
      {
        if (v21)
        {
          unint64_t v30 = (18 * v22) | 1;
          MEMORY[0x270FA5388]();
          uint64_t v32 = &v40[-v31 - 16];
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          v40[-v31 - 16] = 0;
          *(void *)buf = v52;
          __int16 v43 = "make";
          int v44 = v50;
          __int16 v45 = "break";
          int v46 = v48;
          __int16 v47 = "touching";
          do
          {
            if (v34 + 18 <= v30)
            {
              unint64_t v35 = 0;
              int v36 = &v43;
              do
              {
                if ((*(v36 - 1))[v33]) {
                  v34 += snprintf((char *)&v32[v34], v30 - v34, "(%d F%d %s)", (*(v36 - 1))[v33], v33, *v36);
                }
                if (v35 > 1) {
                  break;
                }
                ++v35;
                v36 += 2;
              }
              while (v34 + 18 <= v30);
            }
            ++v33;
          }
          while (v33 != 17);
          uint64_t v37 = SALoggingGeneral();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int v40 = 136446210;
            __int16 v41 = v32;
            _os_log_impl(&dword_25BF13000, v37, OS_LOG_TYPE_DEFAULT, "PathTrackingStep: Non-finger paths found %{public}s", v40, 0xCu);
          }
        }
        return 0;
      }
    }
  }
  return 0;
}

char **SAServiceVersionDescriptor(void)
{
  return &SensingAlgsServiceDetailedVersionDescriptor;
}

uint64_t TouchService::TouchServicePathStatsCollection::TouchServicePathStatsCollection(uint64_t a1, uint64_t a2, int a3)
{
  AlgDataNode::AlgDataNode((AlgDataNode *)a1, a2, 0);
  *(void *)uint64_t v5 = &unk_27096B218;
  *(void *)(v5 + 32) = &unk_27096B260;
  *(unsigned char *)(v5 + 40) = a3;
  *(_DWORD *)(v5 + 16) = 31237;
  size_t v6 = (24 * a3) | 4u;
  *(_DWORD *)(a1 + 44) = v6;
  uint64_t v7 = operator new(v6);
  *(void *)(a1 + 48) = v7;
  size_t v8 = *(unsigned int *)(a1 + 44);
  *(_DWORD *)(a1 + 24) = v8;
  bzero(v7, v8);
  return a1;
}

void sub_25BF1E350(_Unwind_Exception *a1)
{
  void *v1 = &unk_27096BC60;
  _Unwind_Resume(a1);
}

void TouchService::TouchServicePathStatsCollection::~TouchServicePathStatsCollection(TouchService::TouchServicePathStatsCollection *this)
{
  *(void *)this = &unk_27096B218;
  *((void *)this + 4) = &unk_27096B260;
  long long v2 = (void *)*((void *)this + 6);
  if (v2) {
    operator delete[](v2);
  }
  *(void *)this = &unk_27096BC60;
}

{
  void *v1;
  uint64_t vars8;

  TouchService::TouchServicePathStatsCollection::~TouchServicePathStatsCollection(this);

  operator delete(v1);
}

uint64_t TouchService::TouchServicePathStatsCollection::setNumPathStats(uint64_t this, char a2)
{
  **(unsigned char **)(this + 48) = a2;
  return this;
}

void *TouchService::TouchServicePathStatsCollection::injectBuffer(void **this, const unsigned __int8 *a2)
{
  return memcpy(this[6], a2, *((unsigned int *)this + 11));
}

uint64_t TouchService::TouchServicePathStatsCollection::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v3 = *(unsigned char **)(result + 48);
  if (*v3)
  {
    *(void *)(a3 + 56) = v3;
    *(void *)(a3 + 48) = (24 * *v3) | 4;
    return a2(a3);
  }
  return result;
}

uint64_t TouchService::TouchServicePathStatsCollection::numElems(TouchService::TouchServicePathStatsCollection *this)
{
  return **((unsigned __int8 **)this + 6);
}

uint64_t TouchService::TouchServicePathStatsCollection::contents(TouchService::TouchServicePathStatsCollection *this)
{
  return *((void *)this + 6) + 4;
}

uint64_t non-virtual thunk to'TouchService::TouchServicePathStatsCollection::numElems(TouchService::TouchServicePathStatsCollection *this)
{
  return **((unsigned __int8 **)this + 2);
}

uint64_t non-virtual thunk to'TouchService::TouchServicePathStatsCollection::contents(TouchService::TouchServicePathStatsCollection *this)
{
  return *((void *)this + 2) + 4;
}

TouchService::TipOffsetStep *TouchService::TipOffsetStep::TipOffsetStep(TouchService::TipOffsetStep *this, DeviceOrientationNode *a2, TouchService::PlainPathCollection *a3)
{
  AlgWorkNode::AlgWorkNode(this);
  *size_t v6 = &unk_27096B2C8;
  AlgDataNode::AlgDataNode((AlgDataNode *)(v6 + 14), 0x5FBF74E53ABC4E5DLL, 0);
  *((void *)this + 14) = &unk_27096B318;
  *((_DWORD *)this + 32) = 32779;
  *((_DWORD *)this + 34) = 8;
  *((void *)this + 19) = a2;
  *((void *)this + 20) = a3;
  *((void *)this + 18) = 0x449A400000000000;
  TouchService::TipOffsetStep::runNodeRegistrations(this);
  return this;
}

void sub_25BF1E56C(_Unwind_Exception *a1)
{
  *long long v2 = &unk_27096BC60;
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::TipOffsetStep::runNodeRegistrations(TouchService::TipOffsetStep *this)
{
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 80, (uint64_t)this + 112);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 19));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 20));
  uint64_t v2 = *((void *)this + 20);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v2);
}

uint64_t TouchService::TipOffsetStep::run(int32x2_t *this)
{
  int32x2_t v2 = this[19];
  if ((*(unsigned int (**)(void))(**(void **)&this[20] + 40))(*(void *)&this[20]))
  {
    uint64_t v3 = 0;
    for (uint64_t i = 4; ; i += 48)
    {
      uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(*(void *)&this[20] + 32) + 8))();
      int v7 = *(unsigned __int8 *)(*(void *)&v2 + 30);
      if (v7 == 2) {
        break;
      }
      if (v7 == 3)
      {
        float32x2_t v11 = (float32x2_t)vrev64_s32(this[18]);
        float32x2_t v12 = *(float32x2_t *)(v5 + i);
        LODWORD(v10) = vsub_f32(v12, v11).u32[0];
        v6.n128_u64[0] = (unint64_t)vadd_f32(v12, v11);
      }
      else
      {
        if (v7 != 4)
        {
          v6.n128_u64[0] = (unint64_t)vadd_f32((float32x2_t)this[18], *(float32x2_t *)(v5 + i));
          goto LABEL_11;
        }
        float32x2_t v8 = (float32x2_t)vrev64_s32(this[18]);
        float32x2_t v9 = *(float32x2_t *)(v5 + i);
        LODWORD(v10) = vadd_f32(v9, v8).u32[0];
        v6.n128_u64[0] = (unint64_t)vsub_f32(v9, v8);
      }
      HIDWORD(v10) = v6.n128_u32[1];
      *(void *)(v5 + i) = v10;
LABEL_12:
      if (++v3 >= (unint64_t)(*(unsigned int (**)(void, __n128))(**(void **)&this[20] + 40))(*(void *)&this[20], v6))return 0; {
    }
      }
    v6.n128_u64[0] = (unint64_t)vsub_f32(*(float32x2_t *)(v5 + i), (float32x2_t)this[18]);
LABEL_11:
    *(void *)(v5 + i) = v6.n128_u64[0];
    goto LABEL_12;
  }
  return 0;
}

void TouchService::TipOffsetStep::~TipOffsetStep(TouchService::TipOffsetStep *this)
{
  *(void *)this = &unk_27096B2C8;
  *((void *)this + 14) = &unk_27096BC60;
  AlgWorkNode::~AlgWorkNode(this);
}

{
  void *v1;
  uint64_t vars8;

  *(void *)this = &unk_27096B2C8;
  *((void *)this + 14) = &unk_27096BC60;
  AlgWorkNode::~AlgWorkNode(this);

  operator delete(v1);
}

uint64_t PlainDataNode<SAPoint>::injectBuffer(uint64_t result, void *a2)
{
  *(void *)(result + 32) = *a2;
  return result;
}

AlgWorkNode *TouchService::CoreAnalyticsStep::CoreAnalyticsStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  AlgWorkNode::AlgWorkNode(a1);
  *(void *)uint64_t v10 = &unk_27096B368;
  *(void *)(v10 + 112) = a2;
  *(void *)(v10 + 120) = a3;
  *(void *)(v10 + 128) = a4;
  *(void *)(v10 + 136) = a5;
  *(void *)(v10 + 144) = 0;
  *(unsigned char *)(v10 + 152) = 0;
  TouchService::CoreAnalyticsStep::runNodeRegistrations((TouchService::CoreAnalyticsStep *)v10);
  size_t v11 = 24 * *(unsigned __int8 *)(*((void *)a1 + 14) + 40);
  float32x2_t v12 = operator new(v11);
  bzero(v12, v11);
  *((void *)a1 + 20) = v12;
  return a1;
}

void sub_25BF1E8A4(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::CoreAnalyticsStep::runNodeRegistrations(TouchService::CoreAnalyticsStep *this)
{
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 14));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, *((void *)this + 15));
  uint64_t v2 = *((void *)this + 16);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v2);
}

void TouchService::CoreAnalyticsStep::~CoreAnalyticsStep(TouchService::CoreAnalyticsStep *this)
{
  *(void *)this = &unk_27096B368;
  uint64_t v2 = (void *)*((void *)this + 20);
  if (v2) {
    operator delete[](v2);
  }

  AlgWorkNode::~AlgWorkNode(this);
}

{
  void *v1;
  uint64_t vars8;

  TouchService::CoreAnalyticsStep::~CoreAnalyticsStep(this);

  operator delete(v1);
}

uint64_t TouchService::CoreAnalyticsStep::generatePathStats(TouchService::CoreAnalyticsStep *this)
{
  TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 15), 0);
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14));
  if (result)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 14) + 32) + 8))();
      uint64_t v7 = v5 + v3;
      uint64_t v8 = *((void *)this + 20);
      unsigned int v9 = *(unsigned __int8 *)(v5 + v3);
      uint64_t v10 = v8 + 24 * *(unsigned __int8 *)(v5 + v3);
      if (*(unsigned __int8 *)(v5 + v3 + 1) - 3 > 1)
      {
        if (*(float *)(v8 + 24 * *(unsigned __int8 *)(v5 + v3) + 4) != 0.0)
        {
          uint64_t v20 = *((void *)this + 15);
          char v21 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 40))(v20);
          TouchService::TouchServicePathStatsCollection::setNumPathStats(v20, v21 + 1);
          unsigned int v22 = (void *)*((void *)this + 15);
          unsigned int v23 = (*(uint64_t (**)(void *))(*v22 + 40))(v22) - 1;
          uint64_t v24 = (*(uint64_t (**)(void *))(v22[4] + 8))(v22 + 4);
          uint64_t v25 = *(void *)(v10 + 16);
          uint64_t v26 = v24 + 24 * v23;
          *(_OWORD *)uint64_t v26 = *(_OWORD *)v10;
          *(void *)(v26 + 16) = v25;
          *(void *)(v10 + 8) = 0;
          *(void *)(v10 + 16) = 0;
          *(void *)uint64_t v10 = 0;
        }
      }
      else
      {
        float v11 = *(float *)(v7 + 20);
        float v12 = *(float *)(v7 + 24);
        float v13 = sqrtf(v11 * v12) / 1000.0;
        *(float *)v6.i32 = v11 / v12;
        uint64_t v14 = v8 + 24 * *(unsigned __int8 *)(v5 + v3);
        float v16 = *(float *)(v14 + 4);
        unsigned int v15 = (float *)(v14 + 4);
        float v17 = v16;
        if (v16 == 0.0)
        {
          *(float *)uint64_t v10 = v13;
          *unsigned int v15 = v13;
          long long v18 = (int32x2_t *)(v8 + 24 * v9);
          int32x2_t v19 = vdup_n_s32(*(unsigned __int8 *)(v5 + v3 + 2));
          v18[1] = vdup_lane_s32(v6, 0);
          v18[2] = v19;
        }
        else
        {
          if (v13 < *(float *)v10)
          {
            *(float *)uint64_t v10 = v13;
            *(_DWORD *)(v8 + 24 * v9 + 8) = v6.i32[0];
          }
          if (v13 > v17)
          {
            *unsigned int v15 = v13;
            *(_DWORD *)(v8 + 24 * v9 + 12) = v6.i32[0];
          }
          *(_DWORD *)(v8 + 24 * v9 + 20) = *(unsigned __int8 *)(v5 + v3 + 2);
        }
      }
      ++v4;
      uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14));
      v3 += 48;
    }
    while (v4 < result);
  }
  return result;
}

float TouchService::CoreAnalyticsStep::generateDurationBetweenTouches(TouchService::CoreAnalyticsStep *this)
{
  *(unsigned char *)(*((void *)this + 16) + 36) = 0;
  if ((*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14)))
  {
    unint64_t v3 = 0;
    uint64_t v4 = 1;
    while (*(unsigned __int8 *)((*(uint64_t (**)(void))(*(void *)(*((void *)this + 14) + 32) + 8))()
                                             + v4)
          - 3 > 1)
    {
      ++v3;
      v4 += 48;
      if (v3 >= (*(unsigned int (**)(void))(**((void **)this + 14) + 40))(*((void *)this + 14))) {
        goto LABEL_5;
      }
    }
    if (!*((unsigned char *)this + 152))
    {
      *((unsigned char *)this + 152) = 1;
      uint64_t v5 = *((void *)this + 18);
      if (v5)
      {
        uint64_t v6 = *((void *)this + 16);
        float result = (float)(unint64_t)(*(void *)(*((void *)this + 17) + 16) - v5) / 1000000.0;
        *(float *)(v6 + 32) = result;
        *(unsigned char *)(v6 + 36) = 1;
      }
    }
  }
  else
  {
LABEL_5:
    if (*((unsigned char *)this + 152))
    {
      *((unsigned char *)this + 152) = 0;
      *((void *)this + 18) = *(void *)(*((void *)this + 17) + 16);
    }
  }
  return result;
}

uint64_t TouchService::CoreAnalyticsStep::run(TouchService::CoreAnalyticsStep *this)
{
  return 0;
}

AlgWorkNode *TouchService::HysteresisFilterStep::HysteresisFilterStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  AlgWorkNode::AlgWorkNode(a1);
  *float v12 = &unk_27096B3B8;
  PlainDataNode<TouchService::HysteresisFilterParams>::PlainDataNode((AlgDataNode *)(v12 + 14), 0x1BE28DBAFB9D43C2, 0, 0);
  *((void *)a1 + 28) = a2;
  *((void *)a1 + 29) = a3;
  *((void *)a1 + 30) = a4;
  *((void *)a1 + 31) = a5;
  *((void *)a1 + 32) = a6;
  TouchService::HysteresisFilterStep::runNodeRegistrations(a1);
  *((void *)a1 + 33) = operator new(8 * *(unsigned __int8 *)(*((void *)a1 + 31) + 40));
  if (*(unsigned char *)(*((void *)a1 + 31) + 40))
  {
    unint64_t v13 = 0;
    uint64_t v14 = (void *)((char *)a1 + 144);
    do
    {
      unsigned int v15 = operator new(0x90uLL);
      *unsigned int v15 = 0;
      v15[1] = 0;
      v15[2] = v14;
      *((_DWORD *)v15 + 6) = 0;
      v15[4] = v14;
      *((unsigned char *)v15 + 40) = 0;
      v15[6] = 0;
      v15[7] = 0;
      *((_DWORD *)v15 + 16) = 0;
      *((unsigned char *)v15 + 72) = 0;
      *((_DWORD *)v15 + 24) = 0;
      v15[10] = 0;
      v15[11] = 0;
      *((unsigned char *)v15 + 104) = 0;
      v15[14] = 0;
      v15[15] = 0;
      *((_DWORD *)v15 + 32) = 0;
      *((_WORD *)v15 + 68) = 0;
      *(void *)(*((void *)a1 + 33) + 8 * v13++) = v15;
    }
    while (v13 < *(unsigned __int8 *)(*((void *)a1 + 31) + 40));
  }
  return a1;
}

void sub_25BF1EE88(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::HysteresisFilterStep::runNodeRegistrations(TouchService::HysteresisFilterStep *this)
{
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 80, (uint64_t)this + 112);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 28));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 29));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 30));
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 31));
  uint64_t v2 = *((void *)this + 31);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v2);
}

void TouchService::HysteresisFilterStep::~HysteresisFilterStep(TouchService::HysteresisFilterStep *this)
{
  *(void *)this = &unk_27096B3B8;
  uint64_t v2 = *((void *)this + 31);
  if (*(unsigned char *)(v2 + 40))
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void **)(*((void *)this + 33) + 8 * v3);
      if (v4)
      {
        operator delete(v4);
        uint64_t v2 = *((void *)this + 31);
      }
      ++v3;
    }
    while (v3 < *(unsigned __int8 *)(v2 + 40));
  }
  uint64_t v5 = (void *)*((void *)this + 33);
  if (v5) {
    operator delete[](v5);
  }
  *((void *)this + 14) = &unk_27096BC60;

  AlgWorkNode::~AlgWorkNode(this);
}

{
  void *v1;
  uint64_t vars8;

  TouchService::HysteresisFilterStep::~HysteresisFilterStep(this);

  operator delete(v1);
}

uint64_t TouchService::HysteresisFilterStep::run(TouchService::HysteresisFilterStep *this)
{
  unsigned int v2 = *(_DWORD *)(*((void *)this + 28) + 32);
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 31) + 40))(*((void *)this + 31));
  if (result)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    float v6 = 25400.0 / (float)v2;
    while (1)
    {
      uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 31) + 32) + 8))();
      uint64_t v8 = *(unsigned __int8 *)(v7 + v4);
      if (!*(unsigned char *)(v7 + v4) || v8 >= *(unsigned __int8 *)(*((void *)this + 31) + 40)) {
        break;
      }
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)(*((void *)this + 33) + 8 * v8);
      TouchService::HysteresisFilter::update(v10, **((void **)this + 32), (float *)(v7 + v4), (unsigned char *)(*((void *)this + 30) + 30), *((void *)this + 29) + 32, v6);
      *(void *)(v9 + v4 + 4) = *(void *)(v10 + 8);
      ++v5;
      v4 += 48;
      if (v5 >= (*(unsigned int (**)(void))(**((void **)this + 31) + 40))(*((void *)this + 31))) {
        return 0;
      }
    }
    return 1;
  }
  return result;
}

void TouchService::HysteresisFilter::update(uint64_t a1, unint64_t a2, float *a3, unsigned char *a4, uint64_t a5, float a6)
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  unsigned int v11 = *((unsigned __int8 *)a3 + 1);
  BOOL v12 = v11 - 3 < 2;
  if (v11 < 5 || *(unsigned char *)(a1 + 136) == 0)
  {
    if (*(unsigned char *)(a1 + 136)) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 - 3 >= 2;
    }
    char v15 = !v14;
    *(unsigned char *)(a1 + 136) = v12;
    if (v11 < 3 || (v15 & 1) != 0) {
      goto LABEL_16;
    }
    int v16 = *(unsigned __int8 *)(a1 + 137);
  }
  else
  {
    int v16 = *(unsigned __int8 *)(a1 + 137);
    *(unsigned char *)(a1 + 136) = v12;
    if (v16)
    {
LABEL_16:
      uint64_t v17 = *(void *)(a3 + 1);
      *(void *)a1 = v17;
      *(void *)(a1 + 8) = v17;
      *(unsigned char *)(a1 + 137) = 0;
      *(unsigned char *)(a1 + 40) = 0;
      *(unsigned char *)(a1 + 72) = 0;
      *(_DWORD *)(a1 + 24) = 0;
      uint64_t v18 = a1 + 24;
      InstabilityFilter::update(v18, a2, (uint64_t)a3, 0);
      return;
    }
  }
  int32x2_t v19 = (float *)(a1 + 24);
  InstabilityFilter::update(a1 + 24, a2, (uint64_t)a3, v16 != 0);
  uint64_t v20 = *(void *)(a1 + 16);
  float v21 = *(float *)(v20 + 60);
  if (*a4 == 1)
  {
    float v21 = *(float *)(v20 + 60);
    if (*(unsigned char *)(v20 + 68))
    {
      float v21 = *(float *)(v20 + 60);
      if ((float)(a3[2] - *(float *)(a5 + 12)) < *(float *)(v20 + 72)) {
        float v21 = *(float *)(v20 + 76);
      }
    }
  }
  float v22 = *(float *)(a1 + 24);
  float v23 = *(float *)(v20 + 60) * v22;
  float v24 = v21 * v22;
  float v25 = *(float *)a1;
  float v26 = *(float *)(a1 + 4);
  float v27 = a3[1];
  float v28 = v23 + *(float *)a1;
  if ((float)(v27 - *(float *)a1) <= v23) {
    float v28 = a3[1];
  }
  if ((float)(*(float *)a1 - v27) > v23) {
    float v29 = v25 - v23;
  }
  else {
    float v29 = v28;
  }
  *(float *)a1 = v29;
  float v30 = a3[2];
  if ((float)(v26 - v30) <= v24)
  {
    float v31 = a3[2];
    if ((float)(v30 - v26) > v24) {
      float v31 = v24 + v26;
    }
  }
  else
  {
    float v31 = v26 - v24;
  }
  *(float *)(a1 + 4) = v31;
  float v32 = *(float *)(v20 + 64);
  float v33 = v27 - v29;
  float v34 = v27 + v32;
  if ((float)(v29 - v27) <= v32) {
    float v34 = v29;
  }
  float v35 = v27 - v32;
  if (v33 > v32) {
    float v36 = v35;
  }
  else {
    float v36 = v34;
  }
  float v37 = v30 - v31;
  float v38 = v30 + v32;
  if ((float)(v31 - v30) <= v32) {
    float v38 = v31;
  }
  float v39 = v30 - v32;
  if (v37 > v32) {
    float v40 = v39;
  }
  else {
    float v40 = v38;
  }
  float v41 = -a6;
  if (a6 >= 0.0) {
    float v41 = a6;
  }
  if (v29 >= v36 || (float)(v36 - v29) >= v41)
  {
    if ((float)(v29 - v36) >= v41 || v29 <= v36) {
      float v42 = v36;
    }
    else {
      float v42 = v29 - v41;
    }
  }
  else
  {
    float v42 = v41 + v29;
  }
  if (v31 >= v40 || (float)(v40 - v31) >= v41)
  {
    BOOL v45 = (float)(v31 - v40) >= v41 || v31 <= v40;
    float v46 = v31 - v41;
    if (v45) {
      float v44 = v40;
    }
    else {
      float v44 = v46;
    }
  }
  else
  {
    float v44 = v41 + v31;
  }
  BOOL v47 = v31 != v44 || v29 != v42;
  char v48 = *(unsigned char *)(a1 + 137) | v47;
  *(unsigned char *)(a1 + 137) = v48;
  *(float *)a1 = v42;
  *(float *)(a1 + 4) = v44;
  if (v48)
  {
    BOOL v49 = v42 != *(float *)(a1 + 8) || v44 != *(float *)(a1 + 12);
    *(void *)(a1 + 8) = *(void *)a1;
  }
  else
  {
    BOOL v49 = 0;
  }
  double v50 = SALoggingGeneral();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    int v51 = *(unsigned __int8 *)a3;
    int v52 = *((unsigned __int8 *)a3 + 2);
    int v53 = *((unsigned __int8 *)a3 + 1);
    double v54 = *v19;
    double v55 = a3[1];
    double v56 = a3[2];
    v57[0] = 67112961;
    v57[1] = v51;
    __int16 v58 = 1024;
    int v59 = v52;
    __int16 v60 = 1024;
    int v61 = v53;
    __int16 v62 = 1024;
    BOOL v63 = v47;
    __int16 v64 = 1024;
    BOOL v65 = v49;
    __int16 v66 = 2048;
    double v67 = v54;
    __int16 v68 = 2048;
    double v69 = v23;
    __int16 v70 = 2048;
    double v71 = v24;
    __int16 v72 = 2053;
    double v73 = v55;
    __int16 v74 = 2053;
    double v75 = v56;
    __int16 v76 = 2053;
    double v77 = v25;
    __int16 v78 = 2053;
    double v79 = v26;
    __int16 v80 = 2053;
    double v81 = v29;
    __int16 v82 = 2053;
    double v83 = v31;
    __int16 v84 = 2053;
    double v85 = v42;
    __int16 v86 = 2053;
    double v87 = v44;
    _os_log_debug_impl(&dword_25BF13000, v50, OS_LOG_TYPE_DEBUG, "HysteresisFilterStep:  P%d -> F%d stage=%d slid=%d moved=%d instability=%0.3f(x:%.0f, y:%.0f) input=(%{sensitive}.0f,%{sensitive}.0f) old=(%{sensitive}.0f,%{sensitive}.0f) hide=(%{sensitive}.0f,%{sensitive}.0f) new=(%{sensitive}.0f,%{sensitive}.0f)\n", (uint8_t *)v57, 0x8Eu);
  }
}

void InstabilityFilter::update(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  *(_OWORD *)(a1 + 60) = *(_OWORD *)(a1 + 28);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = a2;
  float32x2_t v6 = vdiv_f32(*(float32x2_t *)(a3 + 20), (float32x2_t)vdup_n_s32(0x447A0000u));
  *(float32x2_t *)(a1 + 32) = v6;
  float v7 = *(float *)(a3 + 32);
  *(float *)(a1 + 40) = v7;
  int v8 = *(unsigned __int8 *)(a3 + 1);
  unsigned int v9 = v8 - 1;
  if (*(unsigned char *)(a1 + 48))
  {
    if (v9 < 6 && (v8 - 5) < 0xFFFFFFFE || *(void *)(a1 + 56) > a2) {
      goto LABEL_5;
    }
  }
  else if (v9 < 6)
  {
LABEL_5:
    *(unsigned char *)(a1 + 80) = 1;
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(a1 + 60) = *(_OWORD *)(a1 + 28);
    *(void *)(a1 + 88) = a2;
    *(float *)(a1 + 96) = v7;
    *(_DWORD *)(a1 + 100) = v6.i32[0];
    *(_DWORD *)(a1 + 104) = 0;
    *(_DWORD *)a1 = 0;
  }
  if (*(unsigned char *)(a1 + 80))
  {
    float v10 = (double)(a2 - *(void *)(a1 + 88)) / 1000000.0;
    unsigned int v11 = *(float **)(a1 + 8);
    float v12 = (double)(a2 - *(void *)(a1 + 56)) / 1000000.0;
    float v13 = v12 / 0.008;
    float32x2_t v53 = v6;
    float v14 = powf(flt_25BF26460[v11[12] < v10], v12 / 0.008);
    float v15 = 1.0;
    float v16 = (float)(v7 * (float)(1.0 - v14)) + (float)(v14 * *(float *)(a1 + 96));
    *(float *)(a1 + 96) = v16;
    float v17 = powf(0.95, v13);
    float v18 = (float)((float)(1.0 - v17) * v53.f32[0]) + (float)(v17 * *(float *)(a1 + 100));
    *(float *)(a1 + 100) = v18;
    float v19 = *(float *)(a1 + 72);
    if (v7 <= v19) {
      float v20 = *(float *)(a1 + 72);
    }
    else {
      float v20 = v7;
    }
    if (v20 > 0.0)
    {
      float v21 = fabsf((float)((float)(v7 - v19) * 100.0) / v20);
      float v22 = 1.0;
      if (a4) {
        float v22 = v11[11];
      }
      float v23 = v22 * v11[9];
      float v24 = 0.0;
      if (v21 > v23)
      {
        float v25 = v22 * v11[10];
        BOOL v26 = v21 < v25;
        float v24 = (float)(v21 - v23) / (float)(v25 - v23);
        if (!v26) {
          float v24 = 1.0;
        }
      }
      float v27 = powf(v24, 1.5);
      if ((a4 & (v7 < v16)) != 0) {
        float v27 = 0.0;
      }
      float v52 = v27;
      float v28 = 1.0;
      if (v10 > 0.0)
      {
        float v28 = 0.0;
        if (v10 < 0.5) {
          float v28 = (float)(0.5 - v10) + (float)(0.5 - v10);
        }
      }
      float v29 = (float)((float)(v11[8] + -1.0) * v28) + 1.0;
      float v30 = vabds_f32(v53.f32[0], *(float *)(a1 + 64));
      float v31 = vabds_f32(v53.f32[1], *(float *)(a1 + 68));
      if (v30 > v31) {
        float v31 = v30;
      }
      float v32 = v29 * v11[6];
      float v33 = 0.0;
      if (v31 > v32) {
        float v33 = (float)(v31 - v32) / (float)((float)(v29 * v11[7]) - v32);
      }
      float v34 = powf(v33, 1.5);
      float v35 = *(float *)(a1 + 104);
      float v36 = 0.75;
      if (v7 < v16) {
        float v36 = 0.5;
      }
      if (v34 > v35) {
        float v36 = 0.25;
      }
      float v37 = powf(v36, v13);
      float v38 = (float)(v34 * (float)(1.0 - v37)) + (float)(v37 * v35);
      *(float *)(a1 + 104) = v38;
      float v40 = v11[2];
      float v39 = v11[3];
      float v41 = 0.0;
      if (v53.f32[0] > v40) {
        float v41 = (float)(v53.f32[0] - v40) / (float)(v39 - v40);
      }
      float v43 = v11[4];
      float v42 = v11[5];
      float v44 = 0.0;
      if (v53.f32[1] > v43) {
        float v44 = (float)(v53.f32[1] - v43) / (float)(v42 - v43);
      }
      if (v53.f32[1] <= 6.0)
      {
        float v45 = 1.0;
        if (v53.f32[0] > 6.0) {
          float v45 = v53.f32[0] / 6.0;
        }
      }
      else
      {
        float v45 = v53.f32[0] / v53.f32[1];
      }
      float v46 = 0.0;
      if (v45 > *v11) {
        float v46 = (float)(v45 - *v11) / (float)(v11[1] - *v11);
      }
      float v47 = (float)(v18 - v42) / (float)((float)(v39 + 0.5) - v42);
      if (v18 <= v42) {
        float v47 = 0.0;
      }
      if (v38 <= v46) {
        float v38 = v46;
      }
      if (v44 <= v41) {
        float v44 = v41;
      }
      if (v38 <= v44) {
        float v38 = v44;
      }
      if (v38 <= v47) {
        float v38 = v47;
      }
      if (v52 <= v38) {
        float v15 = v38;
      }
      else {
        float v15 = v52;
      }
    }
    float v48 = 0.0;
    if ((a4 & 1) == 0)
    {
      if (v10 <= 0.0)
      {
        float v48 = 1.0;
        float v51 = 0.2;
      }
      else
      {
        float v50 = v11[13];
        float v49 = v11[14];
        float v51 = 0.0;
        if (v50 > v10) {
          float v48 = (float)(v50 - v10) / v50;
        }
        if (v49 > v10) {
          float v51 = (float)((float)(v49 - v10) / v49) * 0.2;
        }
      }
      if (v48 <= v51) {
        float v48 = v51;
      }
    }
    if (v15 > v48) {
      float v48 = v15;
    }
    *(float *)a1 = v48;
  }
}

double PlainDataNode<TouchService::HysteresisFilterParams>::PlainDataNode(AlgDataNode *a1, uint64_t a2, int a3, char a4)
{
  AlgDataNode::AlgDataNode(a1, a2, a4);
  *(void *)uint64_t v4 = &unk_27096B408;
  *(_OWORD *)(v4 + 32) = xmmword_25BF26470;
  *(_OWORD *)(v4 + 48) = xmmword_25BF26480;
  *(_OWORD *)(v4 + 64) = xmmword_25BF26490;
  *(_OWORD *)(v4 + 80) = xmmword_25BF264A0;
  *(_DWORD *)(v4 + 96) = 1134493696;
  *(unsigned char *)(v4 + 100) = 1;
  double result = 2.2518004e15;
  *(void *)(v4 + 104) = 0x43200000459C4000;
  *(_DWORD *)(v4 + 16) = 31234;
  *(_DWORD *)(v4 + 24) = 80;
  return result;
}

__n128 PlainDataNode<TouchService::HysteresisFilterParams>::injectBuffer(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 32) = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 96) = v4;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

uint64_t TouchService::PlainPathCollection::PlainPathCollection(uint64_t a1, uint64_t a2, int a3)
{
  AlgDataNode::AlgDataNode((AlgDataNode *)a1, a2, 1);
  *(void *)uint64_t v5 = &unk_27096B458;
  *(void *)(v5 + 32) = &unk_27096B4A0;
  *(unsigned char *)(v5 + 40) = a3;
  *(_DWORD *)(v5 + 16) = 12288;
  size_t v6 = (48 * a3) | 4u;
  *(_DWORD *)(a1 + 44) = v6;
  float v7 = operator new(v6);
  *(void *)(a1 + 48) = v7;
  size_t v8 = *(unsigned int *)(a1 + 44);
  *(_DWORD *)(a1 + 24) = v8;
  bzero(v7, v8);
  **(unsigned char **)(a1 + 48) = 0;
  *(_WORD *)(*(void *)(a1 + 48) + 2) = 0;
  return a1;
}

void sub_25BF1FB1C(_Unwind_Exception *a1)
{
  void *v1 = &unk_27096BC60;
  _Unwind_Resume(a1);
}

void TouchService::PlainPathCollection::~PlainPathCollection(TouchService::PlainPathCollection *this)
{
  *(void *)this = &unk_27096B458;
  *((void *)this + 4) = &unk_27096B4A0;
  unsigned int v2 = (void *)*((void *)this + 6);
  if (v2) {
    operator delete[](v2);
  }
  *(void *)this = &unk_27096BC60;
}

{
  void *v1;
  uint64_t vars8;

  TouchService::PlainPathCollection::~PlainPathCollection(this);

  operator delete(v1);
}

uint64_t TouchService::PlainPathCollection::operator=(uint64_t a1, uint64_t a2)
{
  return a1;
}

uint64_t TouchService::PlainPathCollection::getPathWithId(TouchService::PlainPathCollection *this, int a2)
{
  long long v4 = (char *)this + 32;
  if (!(*(unsigned int (**)(TouchService::PlainPathCollection *))(*(void *)this + 40))(this)) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = (*(uint64_t (**)(char *))(*(void *)v4 + 8))(v4);
    if (*(unsigned __int8 *)(v7 + v5) == a2) {
      break;
    }
    ++v6;
    v5 += 48;
    if (v6 >= (*(unsigned int (**)(TouchService::PlainPathCollection *))(*(void *)this + 40))(this)) {
      return 0;
    }
  }
  return v7 + v5;
}

void *TouchService::PlainPathCollection::injectBuffer(void **this, const unsigned __int8 *a2, size_t a3)
{
  return memcpy(this[6], a2, a3);
}

uint64_t TouchService::PlainPathCollection::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  long long v3 = *(unsigned __int8 **)(a1 + 48);
  *(void *)(a3 + 56) = v3;
  *(void *)(a3 + 48) = (48 * *v3) | 4;
  return a2(a3);
}

TouchService::TouchServiceActivePlan *TouchService::TouchServiceActivePlan::TouchServiceActivePlan(TouchService::TouchServiceActivePlan *this)
{
  AlgTaskNode::AlgTaskNode(this);
  *unsigned int v2 = &unk_27096B508;
  v2[21] = 0;
  v2[22] = 0;
  v2[20] = 0;
  uint64_t v6 = (uint64_t)(v2 + 23);
  SurfaceDescriptorNode::SurfaceDescriptorNode((SurfaceDescriptorNode *)(v2 + 23), 0x29965DE49819D20DLL);
  DeviceOrientationNode::DeviceOrientationNode((uint64_t)this + 240, 0x83DB5EE3F6A933E1);
  TouchService::PlainPathCollection::PlainPathCollection((char *)this + 272, 0x310DDDD485, 18, 0);
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 328), 0xEDBB78967950011, 0);
  *((void *)this + 41) = &unk_27096B5E8;
  *((unsigned char *)this + 360) = 0;
  *((_DWORD *)this + 91) = 0;
  *((_DWORD *)this + 86) = 31236;
  *((_DWORD *)this + 88) = 8;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 368), 0x4D123D542B029C57, 0);
  *((void *)this + 46) = &unk_27096B638;
  *((unsigned char *)this + 400) = 0;
  *((_WORD *)this + 201) = 0;
  *(void *)((char *)this + 404) = 0;
  *((_DWORD *)this + 96) = 31238;
  *((_DWORD *)this + 98) = 12;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 416), 0x43B0D8573E93CC26, 0);
  *((void *)this + 52) = &unk_27096B688;
  *((unsigned char *)this + 446) = 0;
  *((_DWORD *)this + 108) = 20482;
  *((_DWORD *)this + 110) = 1;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 448), 0xFC9144553B9D1414, 0);
  *((void *)this + 60) = 0;
  *(void *)((char *)this + 487) = 0;
  *((_DWORD *)this + 116) = 20527;
  *((_DWORD *)this + 118) = 16;
  *((void *)this + 56) = &unk_27096B580;
  *((void *)this + 62) = (char *)this + 446;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 504), 0xBFD069D33EF501AALL, 0);
  *((void *)this + 63) = &unk_27096B6D8;
  *((unsigned char *)this + 534) = 0;
  *((_DWORD *)this + 130) = 20480;
  *((_DWORD *)this + 132) = 1;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 536), 0xC117575754B910ECLL, 0);
  *((void *)this + 67) = &unk_27096B728;
  *((_DWORD *)this + 142) = 0;
  *((_DWORD *)this + 138) = 20486;
  *((_DWORD *)this + 140) = 4;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 576), 0x84A7C1216FAC7749, 0);
  *((void *)this + 72) = &unk_27096B728;
  *((_DWORD *)this + 152) = 0;
  *((_DWORD *)this + 148) = 20486;
  *((_DWORD *)this + 150) = 4;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 616), 0xB0A60E3AEC10AE51, 0);
  uint64_t v5 = v3;
  *((void *)this + 77) = &unk_27096B688;
  *((unsigned char *)this + 646) = 0;
  *((_DWORD *)this + 158) = 20482;
  *((_DWORD *)this + 160) = 1;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 648), 0x614773EFA4E20E8CLL, 0);
  *((void *)this + 81) = &unk_27096B688;
  *((unsigned char *)this + 678) = 0;
  *((_DWORD *)this + 166) = 20482;
  *((_DWORD *)this + 168) = 1;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 680), 0x7E2F3B82958BC45, 0);
  *((void *)this + 85) = &unk_27096B778;
  *((void *)this + 89) = 0;
  *((unsigned char *)this + 720) = 0;
  *((_DWORD *)this + 181) = 0;
  *((_DWORD *)this + 174) = 31243;
  *((_DWORD *)this + 176) = 16;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 728), 0x450AA5C3F7652727, 0);
  *((void *)this + 91) = &unk_27096B6D8;
  *((unsigned char *)this + 758) = 0;
  *((_DWORD *)this + 186) = 20480;
  *((_DWORD *)this + 188) = 1;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 760), 0x377A1603BFB01C2, 0);
  *((void *)this + 107) = 0;
  *(_OWORD *)((char *)this + 824) = 0u;
  *(_OWORD *)((char *)this + 840) = 0u;
  *(_OWORD *)((char *)this + 792) = 0u;
  *(_OWORD *)((char *)this + 808) = 0u;
  *((_DWORD *)this + 194) = 31232;
  *((_DWORD *)this + 196) = 72;
  *((void *)this + 95) = &unk_27096B098;
  *((unsigned char *)this + 864) = 0;
  TouchService::TouchServiceEventCollection::TouchServiceEventCollection((char *)this + 872, 0xBB59337C2FBD0775, 18, 0);
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 928), 0x348FFB668AEB850DLL, 0);
  *((void *)this + 128) = 0;
  *((_OWORD *)this + 62) = 0u;
  *((_OWORD *)this + 63) = 0u;
  *((_OWORD *)this + 60) = 0u;
  *((_OWORD *)this + 61) = 0u;
  *((_DWORD *)this + 236) = 31232;
  *((_DWORD *)this + 238) = 72;
  *((void *)this + 116) = &unk_27096B098;
  *((unsigned char *)this + 1032) = 0;
  TouchService::TouchServiceEventCollection::TouchServiceEventCollection((char *)this + 1040, 0xA6CEC30BA0ABCAE0, 18, 0);
  TouchService::TouchServicePathStatsCollection::TouchServicePathStatsCollection((char *)this + 1096, 0x377AB9DB80CC6E1, 18, 0);
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 1152), 0xE6B312786F98B150, 0);
  *((_DWORD *)this + 296) = 0;
  *((_DWORD *)this + 292) = 20481;
  *((_DWORD *)this + 294) = 4;
  *((void *)this + 144) = &unk_27096B7C8;
  *((unsigned char *)this + 1188) = 0;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 1192), 0x3779E57A5AD9093, 0);
  *(_OWORD *)((char *)this + 1224) = 0u;
  *(_OWORD *)((char *)this + 1240) = 0u;
  *((_DWORD *)this + 302) = 31239;
  *((_DWORD *)this + 304) = 32;
  *((void *)this + 149) = &unk_27096B830;
  *((unsigned char *)this + 1256) = 0;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 1264), 0x348FF85DF49E13DELL, 0);
  *((_OWORD *)this + 82) = 0u;
  *((_OWORD *)this + 81) = 0u;
  *((_DWORD *)this + 320) = 31239;
  *((_DWORD *)this + 322) = 32;
  *((void *)this + 158) = &unk_27096B830;
  *((unsigned char *)this + 1328) = 0;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 1336), 0xDACD1AB81EF736C2, 0);
  *((_WORD *)this + 683) = 0;
  *((_DWORD *)this + 338) = 20480;
  *((_DWORD *)this + 340) = 1;
  *((void *)this + 167) = &unk_27096B898;
  AlgDataNode::AlgDataNode((TouchService::TouchServiceActivePlan *)((char *)this + 1368), 0x802C362E537882D8, 1);
  *(_OWORD *)((char *)this + 1476) = 0u;
  *(_OWORD *)((char *)this + 1448) = 0u;
  *(_OWORD *)((char *)this + 1464) = 0u;
  *(_OWORD *)((char *)this + 1416) = 0u;
  *(_OWORD *)((char *)this + 1432) = 0u;
  *(_OWORD *)((char *)this + 1400) = 0u;
  *((_DWORD *)this + 350) = 2047803400;
  *((_WORD *)this + 702) = 28;
  *((_DWORD *)this + 346) = 39426;
  *((_DWORD *)this + 348) = 92;
  *((void *)this + 171) = &unk_27096B8E8;
  *((void *)this + 187) = &unk_27096B930;
  *((_WORD *)this + 752) = 0;
  TouchService::TouchTask::TouchTask((uint64_t)this + 1512, (uint64_t)this + 728, (uint64_t)this + 136, (uint64_t)this + 576, v6, (uint64_t)this + 240, (uint64_t)this + 272, (uint64_t)this + 328, (uint64_t)this + 368, (uint64_t)this + 1368, (uint64_t)this + 1096, (uint64_t)this + 928, (uint64_t)this + 1040, (uint64_t)this + 760, (uint64_t)this + 872, (uint64_t)this + 1152, (uint64_t)this + 1192, (uint64_t)this + 1264, v5,
    0);
  TouchService::TouchServiceActivePlan::runNodeRegistrations(this);
  *((unsigned char *)this + 270) = 1;
  *((unsigned char *)this + 360) = 0;
  *((unsigned char *)this + 400) = 0;
  *((unsigned char *)this + 446) = 1;
  *((unsigned char *)this + 646) = 0;
  *((unsigned char *)this + 678) = 0;
  *((unsigned char *)this + 720) = 0;
  *((_DWORD *)this + 152) = 480;
  return this;
}

void sub_25BF20548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,_Unwind_Exception *exception_object,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,TouchService::TouchServiceEventCollection *a28,TouchService::TouchServiceEventCollection *a29)
{
  TouchService::TouchTask::~TouchTask(v36);
  *float v37 = &unk_27096BC60;
  *float v33 = &unk_27096BC60;
  *float v31 = &unk_27096BC60;
  *float v30 = &unk_27096BC60;
  *float v34 = &unk_27096BC60;
  TouchService::TouchServicePathStatsCollection::~TouchServicePathStatsCollection(v35);
  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection(a28);
  *float v32 = &unk_27096BC60;
  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection(a29);
  *float v38 = &unk_27096BC60;
  **(void **)(v39 - 152) = &unk_27096BC60;
  *a22 = &unk_27096BC60;
  *a23 = &unk_27096BC60;
  **(void **)(v39 - 144) = &unk_27096BC60;
  **(void **)(v39 - 136) = &unk_27096BC60;
  *a24 = &unk_27096BC60;
  *a25 = &unk_27096BC60;
  *a26 = &unk_27096BC60;
  *a27 = &unk_27096BC60;
  **(void **)(v39 - 128) = &unk_27096BC60;
  **(void **)(v39 - 120) = &unk_27096BC60;
  TouchService::PlainPathCollection::~PlainPathCollection(*(TouchService::PlainPathCollection **)(v39 - 112));
  DeviceOrientationNode::~DeviceOrientationNode(*(DeviceOrientationNode **)(v39 - 104));
  **(void **)(v39 - 96) = &unk_27096BC60;
  AlgTaskNode::~AlgTaskNode(v29);
  _Unwind_Resume(a1);
}

void sub_25BF207F0()
{
}

void sub_25BF207F8()
{
}

void sub_25BF20800()
{
}

void sub_25BF20808()
{
}

void sub_25BF20810()
{
}

void sub_25BF20818()
{
}

void sub_25BF20820()
{
}

void sub_25BF20828()
{
}

void sub_25BF20830()
{
}

void sub_25BF20838()
{
}

void sub_25BF20840()
{
}

void sub_25BF20848()
{
}

void sub_25BF20850()
{
}

void sub_25BF20858()
{
}

void sub_25BF20860()
{
}

void sub_25BF20868()
{
}

void sub_25BF20870()
{
}

void sub_25BF20878()
{
}

void sub_25BF20880()
{
}

void sub_25BF20888()
{
}

void sub_25BF20890()
{
}

void *TouchService::TouchServiceActivePlan::runNodeRegistrations(TouchService::TouchServiceActivePlan *this)
{
  unsigned int v2 = (char *)this + 8;
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, (uint64_t)this + 184);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 240);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 272);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 328);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 368);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 416);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 448);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 504);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 536);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 576);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 616);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 648);
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, (uint64_t)this + 680);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 80, (uint64_t)this + 1368);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 760);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 872);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 928);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 1040);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 1096);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 1152);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 1192);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 1264);
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, (uint64_t)this + 1336);
  long long v4 = (char *)this + 1512;
  return SAList<std::reference_wrapper<AlgDataNode>>::push_back((uint64_t)this + 112, &v4);
}

uint64_t TouchService::TouchServiceActivePlan::runPlan(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[17] = 0;
  a1[18] = 0;
  uint64_t v7 = a1 + 17;
  a1[19] = 0;
  if (a2 && *(_DWORD *)a2 == 0x2000)
  {
    memcpy(a1 + 17, *(const void **)(a2 + 16), *(void *)(a2 + 8));
    uint64_t v8 = *v7;
    if (*v7) {
      goto LABEL_9;
    }
    if (a1[19]) {
      goto LABEL_6;
    }
  }
  if (*((_DWORD *)a1 + 36))
  {
LABEL_6:
    uint64_t v8 = 0;
  }
  else
  {
    *(_OWORD *)uint64_t v7 = *((_OWORD *)a1 + 10);
    v7[2] = a1[22];
    ++*((_DWORD *)a1 + 36);
    unsigned int v9 = *((_DWORD *)a1 + 91);
    uint64_t v8 = a1[17];
    if (v9)
    {
      uint64_t v10 = 0xF4240 / v9;
      v8 += v10;
      a1[17] = v8;
      a1[19] += v10;
    }
  }
LABEL_9:
  *((_OWORD *)a1 + 10) = *(_OWORD *)v7;
  a1[22] = v7[2];
  if (!a1[19]) {
    a1[19] = v8;
  }
  unsigned int v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*a1 + 40);

  return v11(a1, a3, a4);
}

uint64_t TouchService::TouchServiceActivePlan::runBeforeChildren(TouchService::TouchServiceActivePlan *this)
{
  int v1 = *((unsigned __int8 *)this + 301);
  *((unsigned char *)this + 758) = v1;
  if (!v1)
  {
    long long v4 = (TouchService::TouchServiceActivePlan *)((char *)this + 1512);
    TouchService::TouchTask::invalidateOutputNodes((TouchService::TouchServiceActivePlan *)((char *)this + 1512));
    if (*((unsigned char *)this + 565))
    {
      if (*((unsigned char *)this + 568)) {
        TouchService::TouchTask::baselineAdaptNotification(v4);
      }
    }
  }
  return 0;
}

uint64_t TouchService::TouchServiceActivePlan::runAfterChildren(TouchService::TouchServiceActivePlan *this)
{
  *((unsigned char *)this + 494) = 0;
  *((unsigned char *)this + 646) = 0;
  *((unsigned char *)this + 678) = 0;
  *((unsigned char *)this + 720) = 0;
  *((unsigned char *)this + 1367) = 0;
  if (*((unsigned char *)this + 534) && *((unsigned char *)this + 533)) {
    *((_WORD *)this + 683) = 257;
  }
  return 0;
}

void TouchService::TouchServiceActivePlan::~TouchServiceActivePlan(TouchService::TouchServiceActivePlan *this)
{
  TouchService::TouchServiceActivePlan::~TouchServiceActivePlan(this);

  operator delete(v1);
}

{
  uint64_t vars8;

  *(void *)this = &unk_27096B508;
  TouchService::TouchTask::~TouchTask((TouchService::TouchServiceActivePlan *)((char *)this + 1512));
  *((void *)this + 171) = &unk_27096BC60;
  *((void *)this + 167) = &unk_27096BC60;
  *((void *)this + 158) = &unk_27096BC60;
  *((void *)this + 149) = &unk_27096BC60;
  *((void *)this + 144) = &unk_27096BC60;
  TouchService::TouchServicePathStatsCollection::~TouchServicePathStatsCollection((TouchService::TouchServiceActivePlan *)((char *)this + 1096));
  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection((TouchService::TouchServiceActivePlan *)((char *)this + 1040));
  *((void *)this + 116) = &unk_27096BC60;
  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection((TouchService::TouchServiceActivePlan *)((char *)this + 872));
  *((void *)this + 95) = &unk_27096BC60;
  *((void *)this + 91) = &unk_27096BC60;
  *((void *)this + 85) = &unk_27096BC60;
  *((void *)this + 81) = &unk_27096BC60;
  *((void *)this + 77) = &unk_27096BC60;
  *((void *)this + 72) = &unk_27096BC60;
  *((void *)this + 67) = &unk_27096BC60;
  *((void *)this + 63) = &unk_27096BC60;
  *((void *)this + 56) = &unk_27096BC60;
  *((void *)this + 52) = &unk_27096BC60;
  *((void *)this + 46) = &unk_27096BC60;
  *((void *)this + 41) = &unk_27096BC60;
  TouchService::PlainPathCollection::~PlainPathCollection((TouchService::TouchServiceActivePlan *)((char *)this + 272));
  DeviceOrientationNode::~DeviceOrientationNode((TouchService::TouchServiceActivePlan *)((char *)this + 240));
  *((void *)this + 23) = &unk_27096BC60;

  AlgTaskNode::~AlgTaskNode(this);
}

uint64_t PhoneTelemetryDataNode::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!**(unsigned char **)(result + 48) || *(unsigned char *)(result + 46))
  {
    *(void *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

uint64_t PlainDataNode<EventInfoParams>::injectBuffer(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 40) = *((_DWORD *)a2 + 2);
  *(void *)(result + 32) = v2;
  return result;
}

uint64_t PlainDataNode<unsigned char>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  *(void *)(a3 + 56) = a1 + 30;
  return a2(a3);
}

uint64_t PlainDataNode<unsigned char>::injectBuffer(uint64_t result, unsigned char *a2)
{
  *(unsigned char *)(result + 30) = *a2;
  return result;
}

uint64_t PlainDataNode<unsigned int>::injectBuffer(uint64_t result, _DWORD *a2)
{
  *(_DWORD *)(result + 32) = *a2;
  return result;
}

uint64_t PlainDataNodeWithValidity<float>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 36))
  {
    *(void *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

uint64_t PlainDataNodeWithValidity<SAEventInfo>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 64))
  {
    *(void *)(a3 + 56) = result + 32;
    return a2(a3);
  }
  return result;
}

__n128 PlainDataNode<SAEventInfo>::injectBuffer(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 48) = v3;
  return result;
}

uint64_t PlainDataNodeWithValidity<BOOL>::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (*(unsigned char *)(result + 31))
  {
    *(void *)(a3 + 56) = result + 30;
    return a2(a3);
  }
  return result;
}

uint64_t SADynamicArray<ContactReclassificationRegion,(unsigned short)3>::sendCallback(unsigned __int16 *a1, uint64_t (*a2)(void *), void *a3)
{
  if (*((unsigned char *)a1 + 136)
    || (uint64_t result = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1), result))
  {
    a3[4] = a1[16];
    a3[5] = a1 + 16;
    a3[7] = (*(uint64_t (**)(unsigned __int16 *))(*(void *)a1 + 48))(a1);
    a3[6] = 28 * (*(unsigned int (**)(unsigned __int16 *))(*(void *)a1 + 40))(a1);
    return a2(a3);
  }
  return result;
}

void SADynamicArray<ContactReclassificationRegion,(unsigned short)3>::injectBuffer(uint64_t a1, unsigned __int16 *a2)
{
  if (*(unsigned char *)(a1 + 137) || !*(unsigned char *)(a1 + 29))
  {
    *(_WORD *)(a1 + 38) = a2[3];
    unsigned int v3 = a2[2];
    size_t v4 = v3 >= 0x1C ? 28 : a2[2];
    if (a2[3])
    {
      unint64_t v5 = 0;
      uint64_t v6 = (char *)a2 + *a2;
      if (v3 <= 0x1C) {
        size_t v7 = 28 - v3;
      }
      else {
        size_t v7 = 0;
      }
      uint64_t v8 = (char *)(a1 + 40);
      do
      {
        memcpy(v8, &v6[v5 * a2[2]], v4);
        if (v3 <= 0x1B) {
          bzero(&v8[v4], v7);
        }
        ++v5;
        v8 += 28;
      }
      while (v5 < a2[3]);
    }
  }
}

uint64_t SADynamicArray<ContactReclassificationRegion,(unsigned short)3>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 38);
}

uint64_t SADynamicArray<ContactReclassificationRegion,(unsigned short)3>::contents(uint64_t a1)
{
  return a1 + 40;
}

uint64_t non-virtual thunk to'SADynamicArray<ContactReclassificationRegion,(unsigned short)3>::numElems(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 - 90);
}

uint64_t non-virtual thunk to'SADynamicArray<ContactReclassificationRegion,(unsigned short)3>::contents(uint64_t a1)
{
  return a1 - 88;
}

uint64_t TouchService::TouchServiceAlgsDevice::TouchServiceAlgsDevice(uint64_t a1, char a2, int a3, char a4)
{
  uint64_t v8 = SAServiceVersionDescriptor();
  unsigned int v9 = (TouchService::TouchServiceAlgsDevice *)AlgsDevice::AlgsDevice(a1, a2, (uint64_t)"TouchServiceDefaultPersonality", a3, a4, *v8, 1);
  *(void *)a1 = &unk_27096B9B0;
  *(void *)(a1 + 120) = 0;
  *(unsigned char *)(a1 + 128) = a2;
  TouchService::TouchServiceAlgsDevice::newPlanNode(v9, 0);
  return a1;
}

void sub_25BF211DC(_Unwind_Exception *a1)
{
  AlgsDevice::~AlgsDevice(v1);
  _Unwind_Resume(a1);
}

void TouchService::TouchServiceAlgsDevice::~TouchServiceAlgsDevice(TouchService::TouchServiceAlgsDevice *this)
{
  *(void *)this = &unk_27096B9B0;
  uint64_t v2 = *((void *)this + 15);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }

  AlgsDevice::~AlgsDevice(this);
}

{
  void *v1;
  uint64_t vars8;

  TouchService::TouchServiceAlgsDevice::~TouchServiceAlgsDevice(this);

  operator delete(v1);
}

uint64_t TouchService::TouchServiceAlgsDevice::newPlanNode(TouchService::TouchServiceAlgsDevice *this, int a2)
{
  if (a2 == 1)
  {
    uint64_t v6 = *((void *)this + 15);
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
    size_t v7 = (TouchService::TouchServiceTTWPlan *)operator new(0x1D8uLL);
    uint64_t active = TouchService::TouchServiceTTWPlan::TouchServiceTTWPlan(v7);
    goto LABEL_9;
  }
  if (!a2)
  {
    uint64_t v3 = *((void *)this + 15);
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    size_t v4 = (TouchService::TouchServiceActivePlan *)operator new(0xFF0uLL);
    uint64_t active = TouchService::TouchServiceActivePlan::TouchServiceActivePlan(v4);
LABEL_9:
    *((void *)this + 15) = active;
    return 1;
  }
  return 0;
}

uint64_t TouchService::TouchServiceEventCollection::TouchServiceEventCollection(uint64_t a1, uint64_t a2, int a3)
{
  AlgDataNode::AlgDataNode((AlgDataNode *)a1, a2, 0);
  *(void *)uint64_t v5 = &unk_27096BA10;
  *(void *)(v5 + 32) = &unk_27096BA58;
  *(unsigned char *)(v5 + 40) = a3;
  *(_DWORD *)(v5 + 16) = 31233;
  size_t v6 = (72 * a3 + 8);
  *(_DWORD *)(a1 + 44) = v6;
  size_t v7 = operator new(v6);
  *(void *)(a1 + 48) = v7;
  size_t v8 = *(unsigned int *)(a1 + 44);
  *(_DWORD *)(a1 + 24) = v8;
  bzero(v7, v8);
  **(unsigned char **)(a1 + 48) = 0;
  return a1;
}

void sub_25BF21408(_Unwind_Exception *a1)
{
  void *v1 = &unk_27096BC60;
  _Unwind_Resume(a1);
}

void TouchService::TouchServiceEventCollection::~TouchServiceEventCollection(TouchService::TouchServiceEventCollection *this)
{
  *(void *)this = &unk_27096BA10;
  *((void *)this + 4) = &unk_27096BA58;
  uint64_t v2 = (void *)*((void *)this + 6);
  if (v2) {
    operator delete[](v2);
  }
  *(void *)this = &unk_27096BC60;
}

{
  void *v1;
  uint64_t vars8;

  TouchService::TouchServiceEventCollection::~TouchServiceEventCollection(this);

  operator delete(v1);
}

void *TouchService::TouchServiceEventCollection::injectBuffer(void **this, const unsigned __int8 *a2)
{
  return memcpy(this[6], a2, *((unsigned int *)this + 11));
}

uint64_t TouchService::TouchServiceEventCollection::sendCallback(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v3 = *(unsigned char **)(result + 48);
  if (*v3)
  {
    *(void *)(a3 + 56) = v3;
    *(void *)(a3 + 48) = 72 * *v3 + 8;
    return a2(a3);
  }
  return result;
}

uint64_t TouchService::TouchServiceEventCollection::contents(TouchService::TouchServiceEventCollection *this)
{
  return *((void *)this + 6) + 8;
}

uint64_t non-virtual thunk to'TouchService::TouchServiceEventCollection::contents(TouchService::TouchServiceEventCollection *this)
{
  return *((void *)this + 2) + 8;
}

AlgWorkNode *TouchService::InterpolationStep::InterpolationStep(AlgWorkNode *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  AlgWorkNode::AlgWorkNode(a1);
  *(void *)float v16 = &unk_27096BAC0;
  *((void *)v16 + 14) = a2;
  *((void *)v16 + 15) = a3;
  *((void *)v16 + 16) = a4;
  *((void *)v16 + 17) = a5;
  *((void *)v16 + 18) = a6;
  *((void *)v16 + 19) = a7;
  *((void *)v16 + 20) = a8;
  *((void *)v16 + 23) = 0;
  *((void *)v16 + 24) = 0;
  *((void *)v16 + 22) = 0;
  TouchService::InterpolationStep::runNodeRegistrations(v16);
  *((void *)a1 + 21) = operator new(8 * *(unsigned __int8 *)(*((void *)a1 + 18) + 40));
  if (*(unsigned char *)(*((void *)a1 + 18) + 40))
  {
    unint64_t v17 = 0;
    do
    {
      float v18 = operator new(0x58uLL);
      *(void *)float v18 = *((void *)a1 + 17) + 32;
      uint64_t v19 = 4;
      do
      {
        float v20 = (char *)&v18[v19];
        *float v20 = 0;
        *((_DWORD *)v20 + 1) = 0;
        *((_DWORD *)v20 + 2) = 0;
        *((void *)v20 + 2) = 0;
        v19 += 6;
      }
      while (v20 + 24 != (char *)(v18 + 22));
      v18[2] = 0;
      for (uint64_t i = 4; i != 22; i += 6)
        LOBYTE(v18[i]) = 0;
      *(void *)(*((void *)a1 + 21) + 8 * v17++) = v18;
    }
    while (v17 < *(unsigned __int8 *)(*((void *)a1 + 18) + 40));
  }
  return a1;
}

{
  return TouchService::InterpolationStep::InterpolationStep(a1, a2, a3, a4, a5, a6, a7, a8);
}

void sub_25BF2167C(_Unwind_Exception *a1)
{
  AlgWorkNode::~AlgWorkNode(v1);
  _Unwind_Resume(a1);
}

void *TouchService::InterpolationStep::runNodeRegistrations(TouchService::InterpolationStep *this)
{
  uint64_t v2 = (char *)this + 8;
  AlgWorkNode::registerAlgDataNode((uint64_t)this + 8, *((void *)this + 16));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 17));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 18));
  AlgWorkNode::registerAlgDataNode((uint64_t)v2, *((void *)this + 19));
  uint64_t v3 = *((void *)this + 20);

  return AlgWorkNode::registerAlgDataNode((uint64_t)this + 56, v3);
}

void TouchService::InterpolationStep::~InterpolationStep(TouchService::InterpolationStep *this)
{
  *(void *)this = &unk_27096BAC0;
  uint64_t v2 = *((void *)this + 18);
  if (*(unsigned char *)(v2 + 40))
  {
    unint64_t v3 = 0;
    do
    {
      size_t v4 = *(void **)(*((void *)this + 21) + 8 * v3);
      if (v4)
      {
        operator delete(v4);
        uint64_t v2 = *((void *)this + 18);
      }
      ++v3;
    }
    while (v3 < *(unsigned __int8 *)(v2 + 40));
  }
  uint64_t v5 = (void *)*((void *)this + 21);
  if (v5) {
    operator delete[](v5);
  }

  AlgWorkNode::~AlgWorkNode(this);
}

{
  void *v1;
  uint64_t vars8;

  TouchService::InterpolationStep::~InterpolationStep(this);

  operator delete(v1);
}

uint64_t TouchService::InterpolationStep::run(TouchService::InterpolationStep *this)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v2 = *((void *)this + 17);
  if (*(unsigned char *)(v2 + 32))
  {
    unint64_t v3 = ((unint64_t)*(unsigned int *)(v2 + 36) + 1000000) / (2 * *(_DWORD *)(v2 + 36));
    uint64_t v4 = *((void *)this + 22);
    float v49 = (char *)this + 176;
    size_t v6 = (uint64_t *)*((void *)this + 14);
    uint64_t v5 = *((void *)this + 15);
    *(_DWORD *)(v5 + 8) = *((_DWORD *)v6 + 2);
    uint64_t v7 = *v6;
    if (*v6 - v4 <= 3 * v3)
    {
      unint64_t v8 = (unint64_t)(v4 + v7) >> 1;
      unint64_t v9 = (unint64_t)(*((void *)this + 24) + v6[2]) >> 1;
    }
    else
    {
      unint64_t v8 = v7 - v3;
      unint64_t v9 = v6[2] - v3;
    }
    *(void *)uint64_t v5 = v8;
    *(void *)(v5 + 16) = v9;
    TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 20), 0);
    if ((*(unsigned int (**)(void))(**((void **)this + 18) + 40))(*((void *)this + 18)))
    {
      uint64_t v11 = 0;
      unsigned __int8 v12 = 0;
      while (1)
      {
        uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 18) + 32) + 8))();
        float v14 = (unsigned __int8 *)(v13 + 48 * v12);
        unsigned int v15 = *v14;
        if (!*v14 || v15 >= *(unsigned __int8 *)(*((void *)this + 18) + 40)) {
          return 1;
        }
        uint64_t v16 = v13;
        uint64_t PathWithId = TouchService::PlainPathCollection::getPathWithId(*((TouchService::PlainPathCollection **)this + 19), v15);
        uint64_t v18 = (v11 + 1);
        TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 20), v11 + 1);
        uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(*((void *)this + 20) + 32) + 8))();
        uint64_t v20 = v19;
        float v21 = (_OWORD *)(v19 + 48 * v11);
        long long v23 = *((_OWORD *)v14 + 1);
        long long v22 = *((_OWORD *)v14 + 2);
        *float v21 = *(_OWORD *)v14;
        v21[1] = v23;
        v21[2] = v22;
        if (PathWithId
          && *(unsigned __int8 *)(PathWithId + 1) - 3 >= 2
          && *(unsigned __int8 *)(v16 + 48 * v12 + 1) - 3 <= 1)
        {
          *(unsigned char *)(v19 + 48 * v11 + 1) = 2;
        }
        float v24 = *(TouchService::PathInterpolator **)(*((void *)this + 21) + 8 * *v14);
        uint64_t v25 = v16 + 48 * v12;
        int v27 = *(unsigned __int8 *)(v25 + 1);
        BOOL v26 = (unsigned __int8 *)(v25 + 1);
        if ((v27 - 1) >= 6)
        {
          *((_DWORD *)v24 + 2) = 0;
          for (uint64_t i = 16; i != 88; i += 24)
            *((unsigned char *)v24 + i) = 0;
        }
        else
        {
          unsigned int v50 = v11;
          uint64_t v51 = 0;
          float v28 = 25400.0 / (float)*(unsigned int *)(*((void *)this + 16) + 32);
          TouchService::PathInterpolator::update((uint64_t)v24, **((void **)this + 14), (uint64_t)v14);
          if (TouchService::PathInterpolator::interpolateAt(v24, **((void **)this + 15), (float *)&v51 + 1, (float *)&v51, v28))
          {
            uint64_t v29 = v20 + 48 * v11;
            uint64_t v30 = v20 + 48 * v50;
            *(_DWORD *)(v30 + 4) = HIDWORD(v51);
            float v31 = (float *)(v30 + 4);
            *(_DWORD *)(v29 + 8) = v51;
            float v32 = (float *)(v29 + 8);
            *(unsigned char *)float v21 = *v14;
            float v33 = SALoggingGeneral();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              int v34 = *v14;
              uint64_t v35 = v16 + 48 * v12;
              int v36 = *(unsigned __int8 *)(v35 + 2);
              int v37 = *v26;
              double v38 = *(float *)(v35 + 4);
              double v39 = *(float *)(v35 + 8);
              double v40 = *v31;
              double v41 = *v32;
              *(_DWORD *)buf = 67110657;
              int v53 = v34;
              __int16 v54 = 1024;
              int v55 = v36;
              __int16 v56 = 1024;
              int v57 = v37;
              __int16 v58 = 2053;
              double v59 = v38;
              __int16 v60 = 2053;
              double v61 = v39;
              __int16 v62 = 2053;
              double v63 = v40;
              __int16 v64 = 2053;
              double v65 = v41;
              _os_log_debug_impl(&dword_25BF13000, v33, OS_LOG_TYPE_DEBUG, "InterpolationStep:  P%d -> F%d stage=%d path=(%{sensitive}.3f,%{sensitive}.3f) interp=(%{sensitive}.3f,%{sensitive}.3f)\n", buf, 0x3Cu);
            }
          }
          else
          {
            TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 20), v11);
            uint64_t v18 = v11;
          }
        }
        ++v12;
        uint64_t v11 = v18;
        if ((*(unsigned int (**)(void))(**((void **)this + 18) + 40))(*((void *)this + 18)) <= v12) {
          goto LABEL_23;
        }
      }
    }
    else
    {
LABEL_23:
      float v43 = (unsigned __int8 *)*((void *)this + 18);
      if (v43[40] >= 2u)
      {
        unint64_t v44 = 1;
        do
        {
          if (!TouchService::PlainPathCollection::getPathWithId((TouchService::PlainPathCollection *)v43, v44))
          {
            uint64_t v45 = *(void *)(*((void *)this + 21) + 8 * v44);
            *(_DWORD *)(v45 + 8) = 0;
            for (uint64_t j = 16; j != 88; j += 24)
              *(unsigned char *)(v45 + j) = 0;
          }
          ++v44;
          float v43 = (unsigned __int8 *)*((void *)this + 18);
        }
        while (v44 < v43[40]);
      }
      uint64_t result = 0;
      uint64_t v47 = *((void *)this + 14);
      uint64_t v48 = *(void *)(v47 + 16);
      *(_OWORD *)float v49 = *(_OWORD *)v47;
      *((void *)v49 + 2) = v48;
    }
  }
  else
  {
    TouchService::TouchServicePathStatsCollection::setNumPathStats(*((void *)this + 20), 0);
    return 0;
  }
  return result;
}

uint64_t TouchService::PathInterpolator::update(uint64_t result, unint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(result + 8);
  if (v3 && *(void *)(result + 32) >= a2)
  {
    *(_DWORD *)(result + 8) = 0;
    for (uint64_t i = 16; i != 88; i += 24)
      *(unsigned char *)(result + i) = 0;
  }
  else
  {
    BOOL v4 = *(unsigned __int8 *)(a3 + 1) - 3 < 2;
    uint64_t v5 = *(void *)(a3 + 4);
    *(_OWORD *)(result + 64) = *(_OWORD *)(result + 40);
    *(void *)(result + 80) = *(void *)(result + 56);
    *(_OWORD *)(result + 40) = *(_OWORD *)(result + 16);
    *(void *)(result + 56) = *(void *)(result + 32);
    *(unsigned char *)(result + 16) = v4;
    *(void *)(result + 20) = v5;
    *(void *)(result + 32) = a2;
    *(_DWORD *)(result + 8) = v3 + 1;
  }
  return result;
}

BOOL TouchService::PathInterpolator::interpolateAt(TouchService::PathInterpolator *this, uint64_t a2, float *a3, float *a4, float a5)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  unsigned int v6 = *((_DWORD *)this + 2);
  if (v6 < 2)
  {
    unsigned __int8 v12 = SALoggingGeneral();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      TouchService::PathInterpolator::interpolateAt(a2, v12);
    }
    return v6 > 1;
  }
  BOOL v11 = *((unsigned char *)this + 16) && *((unsigned char *)this + 40) && *((unsigned char *)this + 64) == 0;
  float v13 = *((float *)this + 5);
  float v14 = *((float *)this + 11);
  BOOL v15 = vabds_f32(v13, v14) < a5 && vabds_f32(*((float *)this + 6), *((float *)this + 12)) < a5;
  uint64_t v16 = *((void *)this + 4);
  if (v6 < 3)
  {
    BOOL v20 = 0;
  }
  else
  {
    unint64_t v17 = (unint64_t)(float)((float)(((*(_DWORD *)(*(void *)this + 4) >> 1) + 1000000)
                                          / *(_DWORD *)(*(void *)this + 4))
                                  * 2.5);
    uint64_t v18 = *((void *)this + 10);
    unint64_t v19 = v16 - v18;
    BOOL v20 = v16 - v18 > v17;
    if (!v11 && !v15 && v19 <= v17)
    {
      float v21 = (float)(unint64_t)(a2 - v18);
      float v22 = (float)v19;
      float v23 = (float)(unint64_t)(*((void *)this + 7) - v18);
      *a3 = Interpolation::polynomial2ndOrder(this, v21, v13, v14, *((float *)this + 17), (float)v19, v23, 0.0);
      *a4 = Interpolation::polynomial2ndOrder(v24, v21, *((float *)this + 6), *((float *)this + 12), *((float *)this + 18), v22, v23, 0.0);
      uint64_t v25 = SALoggingGeneral();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        double v26 = *a3;
        double v27 = *a4;
        int v40 = 134218753;
        *(double *)double v41 = a5;
        *(_WORD *)&v41[8] = 2048;
        uint64_t v42 = a2;
        *(_WORD *)float v43 = 2053;
        *(double *)&v43[2] = v26;
        *(_WORD *)&v43[10] = 2053;
        *(double *)&v43[12] = v27;
        float v28 = "InterpolationStep:  2nd-order Polynomial Interpolation Occurred(quantum=%.3f) at t=%llu: output=(%{sensiti"
              "ve}.3f,%{sensitive}.3f)\n";
        uint64_t v29 = v25;
        uint32_t v30 = 42;
LABEL_20:
        _os_log_debug_impl(&dword_25BF13000, v29, OS_LOG_TYPE_DEBUG, v28, (uint8_t *)&v40, v30);
        return v6 > 1;
      }
      return v6 > 1;
    }
  }
  uint64_t v31 = *((void *)this + 7);
  float v32 = (float)(unint64_t)(a2 - v31);
  float v33 = (float)(unint64_t)(v16 - v31);
  *a3 = Interpolation::polynomial1stOrder(this, v32, v13, v14, v33, 0.0);
  *a4 = Interpolation::polynomial1stOrder(v34, v32, *((float *)this + 6), *((float *)this + 12), v33, 0.0);
  uint64_t v35 = SALoggingGeneral();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    int v37 = *((_DWORD *)this + 2);
    double v38 = *a3;
    double v39 = *a4;
    int v40 = 67110913;
    *(_DWORD *)double v41 = v37;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v15;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = v11;
    HIWORD(v42) = 1024;
    *(_DWORD *)float v43 = v20;
    *(_WORD *)&v43[4] = 2048;
    *(double *)&v43[6] = a5;
    *(_WORD *)&v43[14] = 2048;
    *(void *)&v43[16] = a2;
    __int16 v44 = 2053;
    double v45 = v38;
    __int16 v46 = 2053;
    double v47 = v39;
    float v28 = "InterpolationStep:  Linear Interpolation Occurred(_count=%d, is_stationary=%d, is_2nd_touching=%d, is_frame_dr"
          "opped=%d, quantum=%.3f) at t=%llu: output=(%{sensitive}.3f,%{sensitive}.3f)\n";
    uint64_t v29 = v35;
    uint32_t v30 = 66;
    goto LABEL_20;
  }
  return v6 > 1;
}

void TouchService::PathInterpolator::interpolateAt(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_25BF13000, a2, OS_LOG_TYPE_DEBUG, "InterpolationStep:  Interpolation Didn't Occur at t=%llu", (uint8_t *)&v2, 0xCu);
}

uint64_t SALoggingGeneral()
{
  if (qword_26B34C1F0 != -1) {
    dispatch_once(&qword_26B34C1F0, &__block_literal_global);
  }
  return _MergedGlobals;
}

os_log_t __SALoggingGeneral_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensingAlgs", "General");
  _MergedGlobals = (uint64_t)result;
  return result;
}

uint64_t SALoggingHIDEventSignpost()
{
  if (qword_26B34C200 != -1) {
    dispatch_once(&qword_26B34C200, &__block_literal_global_17);
  }
  return qword_26B34C1F8;
}

os_log_t __SALoggingHIDEventSignpost_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SensingAlgs", "HIDEventSignpost");
  qword_26B34C1F8 = (uint64_t)result;
  return result;
}

void DeviceOrientationNode::~DeviceOrientationNode(DeviceOrientationNode *this)
{
  *(void *)this = &unk_27096BC60;
}

uint64_t DeviceOrientationNode::DeviceOrientationNode(uint64_t result, uint64_t a2)
{
  *(_WORD *)(result + 28) = 0;
  *(_WORD *)(result + 20) = 0;
  *(unsigned char *)(result + 30) = 0;
  *(_DWORD *)(result + 24) = 1;
  *(void *)os_log_t result = &unk_27096BB50;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 20521;
  return result;
}

__n128 PlainDataNode<SASensorSurfaceDescriptor>::injectBuffer(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[3].n128_u64[0] = a2[1].n128_u64[0];
  a1[2] = result;
  return result;
}

uint64_t PlainDataNode<SASensorSurfaceDescriptor>::sendCallback(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  return OUTLINED_FUNCTION_9(a2, a3, a1 + 32);
}

void SurfaceDescriptorNode::~SurfaceDescriptorNode(SurfaceDescriptorNode *this)
{
  *(void *)this = &unk_27096BC60;
}

void SurfaceDescriptorNode::SurfaceDescriptorNode(SurfaceDescriptorNode *this, uint64_t a2)
{
  *((_WORD *)this + 14) = 0;
  *((_WORD *)this + 10) = 0;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 4) = 20508;
  *((_DWORD *)this + 6) = 24;
  *(void *)this = &unk_27096BBA0;
  *((void *)this + 1) = a2;
}

float Interpolation::polynomial1stOrder(Interpolation *this, float a2, float a3, float a4, float a5, float a6)
{
  return (float)((float)((float)(a2 - a5) / (float)(a6 - a5)) * a4)
       + (float)((float)((float)(a2 - a6) / (float)(a5 - a6)) * a3);
}

float Interpolation::polynomial2ndOrder(Interpolation *this, float a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  return (float)((float)((float)((float)((float)(a2 - a6) * (float)(a2 - a8))
                               / (float)((float)(a7 - a6) * (float)(a7 - a8)))
                       * a4)
               + (float)((float)((float)((float)(a2 - a7) * (float)(a2 - a8))
                               / (float)((float)(a6 - a7) * (float)(a6 - a8)))
                       * a3))
       + (float)((float)((float)((float)(a2 - a6) * (float)(a2 - a7)) / (float)((float)(a8 - a6) * (float)(a8 - a7)))
               * a5);
}

BOOL AlgsDevice::injExtWith(AlgsDevice *this, AlgDataInjector *a2, AlgDataExtractor *a3, void *a4, unint64_t *a5)
{
  uint64_t v7 = (AlgsDevice::StreamingClient *)OUTLINED_FUNCTION_27((uint64_t)this);
  AlgsDevice::StreamingClient::setBuffer(v7, v8);
  BOOL v9 = AlgsDevice::injExtWith();
  uint64_t v10 = AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v6 + 64));
  if (v5) {
    *uint64_t v5 = v10;
  }
  return v9;
}

BOOL AlgsDevice::runPlan(uint64_t a1)
{
  uint64_t v3 = (AlgsDevice::StreamingClient *)OUTLINED_FUNCTION_27(a1);
  AlgsDevice::StreamingClient::setBuffer(v3, v4);
  BOOL v5 = AlgsDevice::run(v2);
  uint64_t v6 = AlgsDevice::StreamingClient::resetBuffer(*(AlgsDevice::StreamingClient **)(v2 + 64));
  if (v1) {
    uint64_t *v1 = v6;
  }
  return v5;
}

BOOL AlgsDevice::run(uint64_t a1)
{
  for (uint64_t i = 32; i != 48; i += 8)
  {
    if (*(void *)(a1 + i))
    {
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_22();
      v3();
    }
  }
  uint64_t v4 = *(void *)(a1 + 56);
  SAList<unsigned char>::clear(v4 + 56);
  for (unsigned int j = 0; *(_DWORD *)(v4 + 20) > j; ++j)
    SAList<unsigned char>::push_back(v4 + 56);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_35();
  v6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_22();
  int v8 = v7();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_35();
  uint64_t v10 = (AlgWorkNode *)v9();
  AlgWorkNode::resetInjectionState(v10);
  uint64_t v11 = 0;
  uint64_t v12 = a1 + 32;
  while (v11 != 16)
  {
    if (*(void *)(v12 + v11))
    {
      OUTLINED_FUNCTION_0();
      (*(void (**)(void))(v13 + 32))();
    }
    v11 += 8;
  }
  return v8 == 0;
}

BOOL AlgsDevice::runPlan(AlgsDevice *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0();
  uint64_t v6 = (*(uint64_t (**)(void))(v5 + 48))();
  BOOL v7 = (*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 48))(v6, v4, v3) == 0;
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_35();
  BOOL v9 = (AlgWorkNode *)v8();
  AlgWorkNode::resetInjectionState(v9);
  return v7;
}

uint64_t AlgsDevice::AlgsDevice(uint64_t a1, char a2, uint64_t a3, int a4, char a5, const char *a6, char a7)
{
  *(void *)a1 = &unk_27096BC08;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v13 = operator new(0x60uLL);
  *(void *)(a1 + 56) = AlgDataExtractor::AlgDataExtractor((uint64_t)v13, 0);
  float v14 = (char *)operator new(0x98uLL);
  *(void *)float v14 = &unk_27096BE20;
  *((void *)v14 + 1) = 0;
  *((_WORD *)v14 + 8) = 256;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = a1;
  v14[74] = 0;
  *((void *)v14 + 10) = 0;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 56) = 0u;
  v14[72] = 0;
  OUTLINED_FUNCTION_36();
  *((void *)v14 + 11) = 0;
  v14[97] = 0;
  *((void *)v14 + 13) = 0;
  *((void *)v14 + 14) = 0;
  v14[120] = a2;
  v14[128] = 0;
  *((void *)v14 + 17) = 0;
  v14[144] = a2;
  AlgDataExtractor::AlgDataExtractor((uint64_t)v17, 0);
  AlgsDevice::StreamingClient::configure((AlgsDevice::StreamingClient *)v14, 0, (AlgDataExtractor *)v17);
  PacketCollection::~PacketCollection((PacketCollection *)v17);
  *(void *)(a1 + 64) = v14;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 16;
  *(unsigned char *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  *(unsigned char *)(a1 + 112) = a7;
  *(unsigned char *)(a1 + 76) = a5;
  *(_DWORD *)(a1 + 72) = a4;
  *(unsigned char *)(a1 + 77) = 0;
  if (a6) {
    BOOL v15 = a6;
  }
  else {
    BOOL v15 = "SensingAlgsService-53~1114";
  }
  AlgsDevice::addVersion((AlgsDevice *)a1, v15);
  return a1;
}

void sub_25BF22708(_Unwind_Exception *a1)
{
  SAList<char const*>::~SAList(v1);
  _Unwind_Resume(a1);
}

void *AlgDataExtractor::AlgDataExtractor(uint64_t a1, int a2)
{
  __n128 result = (void *)PacketCollection::PacketCollection(a1, a2, 1);
  *__n128 result = &unk_27096BE80;
  result[10] = 0;
  result[11] = 0;
  return result;
}

uint64_t AlgsDevice::addVersion(AlgsDevice *this, const char *a2)
{
  if (!a2 || !*a2) {
    return 0;
  }
  SAList<char const*>::push_back((uint64_t)this + 80);
  return 1;
}

void **SAList<char const*>::~SAList(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    operator delete[](v2);
  }
  return a1;
}

void SAList<char const*>::push_back(uint64_t a1)
{
  uint64_t v3 = OUTLINED_FUNCTION_3(a1);
  if (!v3)
  {
    uint64_t v3 = (uint64_t)OUTLINED_FUNCTION_31();
    *(void *)uint64_t v1 = v3;
  }
  *(void *)(v3 + 8 * *(unsigned int *)(v1 + 12)) = *v2;
  OUTLINED_FUNCTION_4();
}

void AlgsDevice::~AlgsDevice(AlgsDevice *this)
{
  *(void *)this = &unk_27096BC08;
  if (*((void *)this + 7))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v2 + 8))();
  }
  if (*((void *)this + 8))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v3 + 8))();
  }
  SAList<char const*>::~SAList((void **)this + 10);
}

void AlgsDevice::configureInternalClient(uint64_t a1, const PacketCollection *a2, uint64_t a3)
{
}

void AlgsDevice::addClient(uint64_t a1, unsigned int a2, uint64_t a3, const PacketCollection *a4)
{
  *(void *)(a1 + 8 * a2 + 32) = a3;
  uint64_t v4 = a1 + 4 * a2;
  int v6 = *(_DWORD *)(v4 + 48);
  uint64_t v5 = (_DWORD *)(v4 + 48);
  if (v6 | *((_DWORD *)a4 + 5))
  {
    uint64_t v10 = a2;
    uint64_t v11 = *(const PacketCollection **)(a1 + 56);
    uint64_t v12 = operator new(0x60uLL);
    uint64_t v13 = AlgDataExtractor::AlgDataExtractor((uint64_t)v12, *((_DWORD *)a4 + 5) - *v5 + *((_DWORD *)v11 + 5));
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    *(void *)(a1 + 56) = v13;
    uint64_t v16 = a2 ? v11 : a4;
    *((_OWORD *)v13 + 5) = *((_OWORD *)v16 + 5);
    uint64_t v17 = a1 + 48;
    uint64_t v18 = 4 * v10;
    while (v14 != 8)
    {
      if (v18 == v14)
      {
        unint64_t v19 = a4;
        uint64_t v20 = -1;
        unint64_t v21 = 0;
      }
      else
      {
        uint64_t v20 = *(unsigned int *)(v17 + v14);
        unint64_t v19 = v11;
        unint64_t v21 = v15;
      }
      PacketCollection::append(*(PacketCollection **)(a1 + 56), v19, v20, v21);
      v15 += *(unsigned int *)(v17 + v14);
      v14 += 4;
    }
    *uint64_t v5 = *((_DWORD *)a4 + 5);
    if (v11)
    {
      OUTLINED_FUNCTION_19();
      float v23 = *(void (**)(const PacketCollection *))(v22 + 8);
      v23(v11);
    }
  }
}

void AlgsDevice::configureStreaming(AlgsDevice::StreamingClient **this, char a2, AlgDataExtractor *a3, void *a4, unint64_t *a5)
{
  AlgsDevice::StreamingClient::configure(this[8], a2, a3);
  if (a4)
  {
    AlgsDevice::StreamingClient::setBuffer(this[8], a4);
    if (AlgsDevice::StreamingClient::configureStatus(this[8]))
    {
      unint64_t v8 = AlgsDevice::StreamingClient::resetBuffer(this[8]);
      if (!a5) {
        return;
      }
    }
    else
    {
      unint64_t v8 = 0;
      if (!a5) {
        return;
      }
    }
    *a5 = v8;
  }
}

uint64_t AlgsDevice::configureTranslation(AlgsDevice::StreamingClient **this, const PacketCollection *a2, const PacketCollection *a3)
{
  return AlgsDevice::StreamingClient::configureTranslation(this[8], a2, a3);
}

uint64_t AlgsDevice::getClientExtractor(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0;
  uint64_t v5 = 0;
LABEL_4:
  uint64_t v6 = 80 * (v5 + v4);
  for (unint64_t i = v4; i < *(unsigned int *)(a1 + 48); ++i)
  {
    OUTLINED_FUNCTION_8();
    (*(void (**)(uint64_t))(v8 + 16))(a2);
    v6 += 80;
  }
  do
  {
    v5 += *(unsigned int *)(a1 + 4 * v4++ + 48);
    if (!v4) {
      goto LABEL_4;
    }
  }
  while (v4 != 2);
  return a2;
}

void AlgDataNode::sendCallback(uint64_t a1, void (*a2)(void *), uint64_t a3)
{
  size_t v3 = *(void *)(a3 + 48) + *(void *)(a3 + 32);
  if (v3)
  {
    if (v3 < 0x81)
    {
      MEMORY[0x270FA5388]();
      OUTLINED_FUNCTION_19();
      uint64_t v9 = OUTLINED_FUNCTION_34();
      v10(v9);
      uint64_t v11 = OUTLINED_FUNCTION_26();
      a2(v11);
    }
    else
    {
      uint64_t v5 = operator new(v3);
      OUTLINED_FUNCTION_19();
      uint64_t v6 = OUTLINED_FUNCTION_34();
      v7(v6);
      uint64_t v8 = OUTLINED_FUNCTION_26();
      a2(v8);
      if (v5)
      {
        operator delete[](v5);
      }
    }
  }
}

uint64_t *AlgDataNode::extractBuffer(uint64_t *this, unsigned __int8 *a2)
{
  int v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    v4[0] = a2;
    v4[1] = 0;
    uint64_t v3 = *this;
    v4[2] = this[1];
    int v5 = *((_DWORD *)this + 4);
    char v6 = 0;
    uint64_t v7 = *((unsigned __int16 *)this + 10);
    uint64_t v8 = 0;
    uint64_t v9 = ((v2 + 3) & 0xFFFFFFFC) - v7;
    uint64_t v10 = 0;
    return (uint64_t *)(*(uint64_t (**)(uint64_t *, void *(*)(void **), void *))(v3 + 24))(this, AlgDataNode::extractBuffer(unsigned char *)const::$_0::__invoke, v4);
  }
  return this;
}

void *AlgDataNode::extractBuffer(unsigned char *)const::$_0::__invoke(void **a1)
{
  int v2 = (char *)*a1;
  memcpy(*a1, a1[5], (size_t)a1[4]);
  uint64_t v3 = (char *)a1[4] + (void)v2;
  size_t v5 = (size_t)a1[6];
  unint64_t v4 = (char *)a1[7];

  return memcpy(v3, v4, v5);
}

void AlgDataNode::~AlgDataNode(AlgDataNode *this)
{
  *(void *)this = &unk_27096BC60;
}

void AlgDataNode::AlgDataNode(AlgDataNode *this, uint64_t a2, char a3)
{
  *(void *)this = &unk_27096BC60;
  *((void *)this + 1) = a2;
  *((unsigned char *)this + 28) = a3;
  *((unsigned char *)this + 29) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_DWORD *)this + 6) = 0;
  *((_WORD *)this + 10) = 0;
}

void ConditionalAlgTaskNode::~ConditionalAlgTaskNode(ConditionalAlgTaskNode *this)
{
  AlgTaskNode::~AlgTaskNode(this);

  operator delete(v1);
}

AlgTaskNode *ConditionalAlgTaskNode::ConditionalAlgTaskNode(AlgTaskNode *a1, uint64_t a2, uint64_t a3)
{
  AlgTaskNode::AlgTaskNode(a1);
  *size_t v5 = &unk_27096BCA8;
  v5[17] = a3;
  AlgWorkNode::registerAlgDataNode((uint64_t)(v5 + 1), a3);
  return a1;
}

void sub_25BF22E74(_Unwind_Exception *a1)
{
  AlgTaskNode::~AlgTaskNode(v1);
  _Unwind_Resume(a1);
}

void *ConditionalAlgTaskNode::registerChild(ConditionalAlgTaskNode *this, AlgWorkNode *a2)
{
  uint64_t v3 = a2;
  return SAList<std::reference_wrapper<AlgDataNode>>::push_back((uint64_t)this + 112, &v3);
}

uint64_t AlgTaskNode::runPlan(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 8);
  if (a2 && *(_DWORD *)a2 == 0x2000)
  {
    unint64_t v4 = *(uint64_t **)(a2 + 16);
    uint64_t v5 = *v4;
    int v6 = *((_DWORD *)v4 + 2);
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
  }
  *(void *)(v3 + 40) = v5;
  *(_DWORD *)(v3 + 48) = v6;
  OUTLINED_FUNCTION_0();
  return (*(uint64_t (**)(void))(v7 + 48))();
}

uint64_t AlgTaskNode::runPlan(AlgTaskNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  return 1;
}

void AlgTaskNode::AlgTaskNode(AlgTaskNode *this)
{
  uint64_t v1 = OUTLINED_FUNCTION_14((uint64_t)this, COERCE_DOUBLE(16));
  *(void *)(v1 + 104) = v2;
  *(void *)(v1 + 112) = 0;
  *(void *)uint64_t v1 = &unk_27096BD20;
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 120) = 32;
  *(unsigned char *)(v1 + 128) = 0;
}

uint64_t *AlgWorkNode::children(AlgWorkNode *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B34C208, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B34C208))
  {
    qword_26B34C218 = 0;
    byte_26B34C220 = 0;
    qword_26B34C210 = 0;
    __cxa_atexit((void (*)(void *))SAList<std::reference_wrapper<AlgWorkNode>>::~SAList, &qword_26B34C210, &dword_25BF13000);
    __cxa_guard_release(&qword_26B34C208);
  }
  return &qword_26B34C210;
}

BOOL AlgWorkNode::extractDataIfOnList(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  unint64_t v5 = 0;
  unint64_t v6 = a2;
  do
  {
    if (a2 == v5)
    {
      unint64_t v7 = a2;
      return v7 < v6;
    }
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a1 + 8 * v5++);
  }
  while (*(void *)(v8 + 8) != *(void *)(a3 + 8));
  *(_DWORD *)(a3 + 16) = *(_DWORD *)(v8 + 16);
  size_t v9 = (*(_DWORD *)(v8 + 24) + 3) & 0xFFFFFFFC;
  *(void *)(a3 + 24) = v9;
  *(void *)(a3 + 40) = a4;
  *(_DWORD *)(a3 + 48) = a5;
  if (*(void *)(a3 + 64))
  {
    OUTLINED_FUNCTION_8();
    (*(void (**)(uint64_t))(v10 + 24))(v8);
  }
  else
  {
    if (!*(void *)(a3 + 56)) {
      *(void *)(a3 + 56) = operator new(v9);
    }
    OUTLINED_FUNCTION_8();
    (*(void (**)(uint64_t))(v11 + 16))(v8);
  }
  return v7 < v6;
}

void AlgWorkNode::AlgWorkNode(AlgWorkNode *this)
{
  *(void *)this = &unk_27096BD98;
  *((void *)this + 1) = 0;
  uint64_t v1 = OUTLINED_FUNCTION_14((uint64_t)this, COERCE_DOUBLE(16));
  *(void *)(v1 + 104) = v2;
}

void *AlgWorkNode::registerAlgDataNode(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  return SAList<std::reference_wrapper<AlgDataNode>>::push_back(a1, &v3);
}

uint64_t AlgWorkNode::getDataNodeInfo(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v8 = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  unsigned int v3 = (*(_DWORD *)(a1 + 24) + 3) & 0xFFFFFFFC;
  int v6 = *(_DWORD *)(a1 + 16);
  unsigned int v7 = v3;
  LOBYTE(v8) = a2;
  return AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a3, &v5);
}

uint64_t AlgWorkNode::getTreeInfo(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    goto LABEL_3;
  }
  char v5 = *(unsigned char *)(a1 + 44) + *(unsigned char *)(a1 + 20) + *(unsigned char *)(a1 + 68) + *(unsigned char *)(a1 + 92);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_5();
  char v7 = v5 + *(unsigned char *)(v6() + 12);
  uint64_t v8 = *(void *)(a1 + 104);
  uint64_t v31 = 0;
  uint64_t v30 = v8;
  uint64_t v32 = 0;
  BYTE1(v32) = v7;
  int v9 = AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a2, &v30);
  uint64_t result = 0;
  if (v9)
  {
LABEL_3:
    unint64_t v11 = 0;
    while (v11 < *(unsigned int *)(a1 + 20))
    {
      DataNodeunint64_t Info = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 8) + 8 * v11++), 2, a2);
      if ((DataNodeInfo & 1) == 0) {
        return 0;
      }
    }
    unint64_t v13 = 0;
    while (v13 < *(unsigned int *)(a1 + 44))
    {
      char v14 = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 32) + 8 * v13++), 4, a2);
      if ((v14 & 1) == 0) {
        return 0;
      }
    }
    unint64_t v15 = 0;
    while (v15 < *(unsigned int *)(a1 + 68))
    {
      char v16 = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 56) + 8 * v15++), 3, a2);
      if ((v16 & 1) == 0) {
        return 0;
      }
    }
    unint64_t v17 = 0;
    while (v17 < *(unsigned int *)(a1 + 92))
    {
      char v18 = AlgWorkNode::getDataNodeInfo(*(void *)(*(void *)(a1 + 80) + 8 * v17++), 5, a2);
      if ((v18 & 1) == 0) {
        return 0;
      }
    }
    unint64_t v19 = 0;
    do
    {
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_5();
      unint64_t v21 = *(unsigned int *)(v20() + 12);
      uint64_t result = v19 >= v21;
      if (v19 >= v21) {
        break;
      }
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_5();
      float v23 = *(unsigned char **)(*(void *)v22() + 8 * v19);
      char v24 = v23[44] + v23[20] + v23[68] + v23[92];
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_5();
      char v26 = v24 + *(unsigned char *)(v25() + 12);
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_5();
      uint64_t v28 = *(void *)(*(void *)v27() + 8 * v19);
      uint64_t v31 = 0;
      uint64_t v32 = 1;
      uint64_t v30 = *(void *)(v28 + 104);
      BYTE1(v32) = v26;
      uint64_t result = AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(a2, &v30);
      if (!result) {
        break;
      }
      Treeunint64_t Info = AlgWorkNode::getTreeInfo(v23, a2, 0);
      uint64_t result = 0;
      ++v19;
    }
    while ((TreeInfo & 1) != 0);
  }
  return result;
}

uint64_t AlgWorkNode::getTreeSize(AlgWorkNode *this)
{
  unint64_t v1 = 0;
  for (int i = *((unsigned __int16 *)this + 10)
          + *((unsigned __int16 *)this + 22)
          + *((unsigned __int16 *)this + 34)
          + *((unsigned __int16 *)this + 46)
          + 1; ; i += AlgWorkNode::getTreeSize(*(AlgWorkNode **)(*v5 + 8 * v1++)))
  {
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_5();
    if (v1 >= *(unsigned int *)(v3() + 12)) {
      break;
    }
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_5();
    char v5 = (void *)v4();
  }
  return (unsigned __int16)i;
}

uint64_t *AlgWorkNode::resetInjectionStateOnList(uint64_t *result, unsigned int a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    do
    {
      uint64_t v3 = *result++;
      *(unsigned char *)(v3 + 29) = 0;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t AlgWorkNode::resetInjectionState(AlgWorkNode *this)
{
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 10), *((_DWORD *)this + 23));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 1), *((_DWORD *)this + 5));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 4), *((_DWORD *)this + 11));
  AlgWorkNode::resetInjectionStateOnList(*((uint64_t **)this + 7), *((_DWORD *)this + 17));
  for (unint64_t i = 0; ; ++i)
  {
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_5();
    uint64_t result = v3();
    if (i >= *(unsigned int *)(result + 12)) {
      break;
    }
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_5();
    int v6 = (void *)v5();
    AlgWorkNode::resetInjectionState(*(AlgWorkNode **)(*v6 + 8 * i));
  }
  return result;
}

void StreamingPacketCache::~StreamingPacketCache(StreamingPacketCache *this)
{
  unint64_t v1 = (void *)*((void *)this + 1);
  if (v1) {
    operator delete[](v1);
  }
}

uint64_t SABinaryParser::parseInfoData(uint64_t *a1, uint64_t (*a2)(uint64_t, void, void, void, void), uint64_t (*a3)(uint64_t, const char *), uint64_t (*a4)(uint64_t, BOOL))
{
  uint64_t v4 = a1[2];
  if ((unint64_t)(a1[1] - v4) < 7) {
    return 0;
  }
  uint64_t v8 = *a1;
  a1[2] = v4 + 7;
  if (!a2
    || (uint64_t result = a2(a1[3], *(unsigned __int8 *)(v8 + v4), *(unsigned int *)(v8 + v4 + 1), *(unsigned __int8 *)(v8 + v4 + 5), *(unsigned __int8 *)(v8 + v4 + 6)), result))
  {
    while (1)
    {
      uint64_t v10 = a1[1];
      uint64_t v11 = a1[2];
      uint64_t result = v10 == v11;
      if (v10 == v11) {
        break;
      }
      uint64_t v12 = *a1;
      unint64_t v13 = (unsigned __int8 *)(*a1 + v11);
      int v14 = *v13;
      uint64_t v15 = v11 + 1;
      a1[2] = v11 + 1;
      if (!v14)
      {
        if (v10 == v15) {
          return 0;
        }
        uint64_t v19 = v11 + 2;
        a1[2] = v19;
        if (a4)
        {
          uint64_t result = a4(a1[3], *(unsigned char *)(v12 + v15) != 0);
          if (!result) {
            return result;
          }
          uint64_t v10 = a1[1];
          uint64_t v19 = a1[2];
        }
        if (v10 == v19) {
          return 1;
        }
        uint64_t v20 = OUTLINED_FUNCTION_37();
        return SABinaryParser::parseInjExtData(v20, v21, v22, v23);
      }
      unint64_t v16 = *v13;
      if (v10 - v15 >= v16)
      {
        a1[2] = v15 + v16;
        unsigned int v18 = *v13;
        unint64_t v17 = (const char *)(v13 + 1);
        if (strnlen(v17, v18) != v18 && (!a3 || (a3(a1[3], v17) & 1) != 0)) {
          continue;
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t StreamingParser::parseReset(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2, int a3, char a4, char a5)
{
  if (*(void *)a1) {
    **(unsigned char **)a1 = a2;
  }
  char v5 = *(_DWORD **)(a1 + 8);
  if (v5) {
    *char v5 = a3;
  }
  int v6 = *(unsigned char **)(a1 + 16);
  if (v6) {
    *int v6 = a4;
  }
  char v7 = *(unsigned char **)(a1 + 24);
  if (v7) {
    *char v7 = a5;
  }
  return 1;
}

uint64_t StreamingParser::addPoint(uint64_t a1, uint64_t a2)
{
  return AlgDataExtractor::requestFor(a1, *(void *)(a2 + 1), *(void *)(a2 + 9), *(unsigned __int8 *)(a2 + 17));
}

BOOL SABinaryParser::parseRunFrame(void *a1, unsigned int (*a2)(void), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(uint64_t, unsigned __int8 *, char *))
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v4 - v5) < 2) {
    return 0;
  }
  a1[2] = v5 + 2;
  if ((unint64_t)(v4 - (v5 + 2)) < 4) {
    return 0;
  }
  uint64_t v8 = *a1 + v5 + 2;
  uint64_t v9 = v5 + 6;
  a1[2] = v9;
  unint64_t v10 = *(unsigned __int16 *)(v8 + 2);
  if (v4 - v9 < v10) {
    return 0;
  }
  a1[2] = v9 + v10;
  if (a2)
  {
    if (!a2(a1[3])) {
      return 0;
    }
  }

  return SABinaryParser::parseInjExtData((uint64_t)a1, a3, a4, 0);
}

uint64_t StreamingParser::parseRun(InjectionInfo *,AlgDataInjector *,AlgDataExtractor *)::$_0::__invoke(uint64_t *a1, unsigned __int16 *a2)
{
  uint64_t v2 = *a1;
  *(_DWORD *)uint64_t v2 = *a2;
  *(void *)(v2 + 8) = a2[1];
  *(void *)(v2 + 16) = a2 + 2;
  return 1;
}

uint64_t StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_3::__invoke(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPoint(*(void *)(a1 + 24), a2);
}

uint64_t StreamingParser::parseInjExt(unsigned long long *,AlgDataInjector *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke(void **a1, uint64_t a2)
{
  **a1 = a2;
  return 1;
}

BOOL SABinaryParser::parseConfigure(uint64_t *a1, unsigned int (*a2)(uint64_t, BOOL), uint64_t a3, unsigned int (*a4)(uint64_t, uint64_t))
{
  uint64_t v5 = a1[1];
  uint64_t v4 = a1[2];
  if ((unint64_t)(v5 - v4) < 2) {
    return 0;
  }
  a1[2] = v4 + 2;
  if (v5 == v4 + 2) {
    return 0;
  }
  uint64_t v9 = *a1;
  unint64_t v10 = (unsigned __int8 *)(*a1 + v4 + 2);
  uint64_t v11 = v4 + 3;
  a1[2] = v4 + 3;
  unsigned int v12 = *v10;
  unint64_t v13 = v10;
  if (v12 < 2)
  {
LABEL_9:
    if (!a2 || !v13 || a2(a1[3], *v13 != 0)) {
      goto LABEL_12;
    }
    return 0;
  }
  if (v5 != v11)
  {
    unint64_t v13 = (unsigned char *)(v9 + v11);
    a1[2] = v4 + 4;
    goto LABEL_9;
  }
  if (v12 != 3) {
    return 0;
  }
LABEL_12:
  if (a4)
  {
    uint64_t v14 = *v10 <= 2u ? 2 : *v10;
    if (!a4(a1[3], v14)) {
      return 0;
    }
  }
  uint64_t v15 = OUTLINED_FUNCTION_37();

  return SABinaryParser::parseInjExtData(v15, v16, v17, v18);
}

uint64_t SABinaryParser::parseInfo(uint64_t *a1, uint64_t (*a2)(uint64_t, void, void, void, void), uint64_t (*a3)(uint64_t, const char *), uint64_t (*a4)(uint64_t, BOOL))
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v4 - v5) < 2) {
    return 0;
  }
  uint64_t v6 = v5 + 2;
  a1[2] = v6;
  if (v4 == v6) {
    return 1;
  }
  else {
    return SABinaryParser::parseInfoData(a1, a2, a3, a4);
  }
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_2::__invoke(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 16);
  if (v1) {
    ++*v1;
  }
  return 1;
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_1::__invoke(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 8);
  if (v1) {
    ++*v1;
  }
  return 1;
}

uint64_t StreamingParser::numberOfPackets(unsigned long *,unsigned long *,unsigned long *)const::$_0::__invoke(void **a1)
{
  if (*a1) {
    ++**a1;
  }
  return 1;
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_2::__invoke(unsigned char **a1, char a2)
{
  return OUTLINED_FUNCTION_21(a2, *a1);
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPoint(*(void *)(a1 + 16), a2);
}

uint64_t StreamingParser::parseConfigure(unsigned char *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_21(a2, *(unsigned char **)(a1 + 8));
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_0::__invoke(uint64_t a1, char a2, int a3, char a4, char a5)
{
  if (*(void *)a1) {
    **(unsigned char **)a1 = a2;
  }
  uint64_t v5 = *(_DWORD **)(a1 + 8);
  if (v5) {
    *uint64_t v5 = a3;
  }
  uint64_t v6 = *(unsigned char **)(a1 + 16);
  if (v6) {
    *uint64_t v6 = a4;
  }
  char v7 = *(unsigned char **)(a1 + 24);
  if (v7) {
    *char v7 = a5;
  }
  return 1;
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_3::__invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_2::__invoke(uint64_t a1, char a2)
{
  return OUTLINED_FUNCTION_21(a2, *(unsigned char **)(a1 + 40));
}

uint64_t StreamingParser::parseInfo(unsigned char *,unsigned int *,unsigned char *,unsigned char *,SAList<char const*> *,BOOL *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1)
{
  return 1;
}

uint64_t StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_1::__invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 8);
  if (v5) {
    uint64_t v6 = StreamingParser::addPoint(v5, a2);
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  if (v7) {
    return v6 & StreamingParser::addPoint(v7, a3);
  }
  return v6;
}

uint64_t StreamingParser::parseConfigureTranslation(unsigned int *,AlgDataExtractor *,AlgDataExtractor *)::$_0::__invoke(_DWORD **a1, int a2)
{
  **a1 = a2;
  return 1;
}

uint64_t StreamingParser::parsePacketCache(unsigned char &,StreamingPacketCache &)::$_0::__invoke(uint64_t a1, char a2, unsigned int a3, const void *a4)
{
  **(unsigned char **)a1 = a2;
  uint64_t v6 = *(unsigned __int8 **)(a1 + 8);
  uint64_t v7 = (void *)*((void *)v6 + 1);
  if (v7) {
    operator delete[](v7);
  }
  *uint64_t v6 = a3;
  uint64_t v8 = operator new(22 * a3);
  *((void *)v6 + 1) = v8;
  memcpy(v8, a4, 22 * *v6);
  return 1;
}

uint64_t SABinaryWriter::updateCacheSizes(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v3 = (_WORD *)(a2 + 20);
  if (result)
  {
    do
    {
      *uint64_t v3 = (*v3 + 3) & 0xFFFC;
      v3 += 11;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t SABinaryWriter::writeHeader(uint64_t a1, char a2)
{
  if (*(unsigned char *)(a1 + 24)) {
    return 0;
  }
  *(void *)(a1 + 16) = 0;
  *(unsigned char *)(a1 + 24) = a2;
  v3[0] = 1;
  v3[1] = a2;
  return SABinaryWriter::write((SABinaryWriter *)a1, v3, 2uLL);
}

uint64_t SABinaryWriter::write(SABinaryWriter *this, const void *a2, size_t __n)
{
  if (*(void *)this)
  {
    uint64_t v5 = *((void *)this + 2);
    if (*((void *)this + 1) - v5 < __n)
    {
      uint64_t result = 0;
      *((unsigned char *)this + 24) = 0;
      return result;
    }
    memcpy((void *)(*(void *)this + v5), a2, __n);
  }
  *((void *)this + 2) += __n;
  return 1;
}

void StreamingWriter::writeResetOrInfo(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(unsigned char *)(a1 + 33) = 0;
  uint64_t v11 = (SABinaryWriter *)(a1 + 8);
  if (a2)
  {
    uint64_t v12 = OUTLINED_FUNCTION_29();
    if ((SABinaryWriter::writeHeader(v12, 1) & 1) == 0 || (uint64_t v13 = SABinaryWriter::write(v11, v28, 7uLL), (v13 & 1) == 0))
    {
LABEL_34:
      OUTLINED_FUNCTION_24();
      return;
    }
  }
  else
  {
    uint64_t v14 = OUTLINED_FUNCTION_29();
    if ((SABinaryWriter::writeHeader(v14, 6) & 1) == 0) {
      goto LABEL_34;
    }
    uint64_t v13 = SABinaryWriter::write(v11, v28, 7uLL);
    if (!v13) {
      goto LABEL_34;
    }
  }
  unint64_t v15 = 0;
  while (v15 < *(unsigned int *)(a7 + 12))
  {
    unint64_t v16 = *(unsigned char **)(*(void *)a7 + 8 * v15);
    int v17 = *(unsigned __int8 *)(a1 + 32);
    if (v17 == 1)
    {
      if (!v16) {
        goto LABEL_34;
      }
    }
    else
    {
      if (v16) {
        BOOL v18 = v17 == 6;
      }
      else {
        BOOL v18 = 0;
      }
      if (!v18) {
        goto LABEL_34;
      }
    }
    if (*v16)
    {
      size_t v19 = *(void *)(a1 + 16) + ~*(void *)(a1 + 24);
      size_t v20 = strnlen(*(const char **)(*(void *)a7 + 8 * v15), v19);
      if (v20 != v19)
      {
        unsigned __int8 v21 = v20 + 1;
        if (v20 + 1 <= 0xFF)
        {
          v28[0] = v20 + 1;
          if (OUTLINED_FUNCTION_23(v20, v28))
          {
            uint64_t v13 = SABinaryWriter::write(v11, v16, v21);
            ++v15;
            if (v13) {
              continue;
            }
          }
        }
      }
    }
    goto LABEL_34;
  }
  int v22 = *(unsigned __int8 *)(a1 + 32);
  if (v22 != 6 && v22 != 1) {
    goto LABEL_34;
  }
  if (*(unsigned char *)(a1 + 33)) {
    goto LABEL_34;
  }
  *(unsigned char *)(a1 + 33) = 1;
  v28[0] = 0;
  char v29 = a8;
  uint64_t v24 = OUTLINED_FUNCTION_23(v13, v28);
  if ((v24 & 1) == 0 || !OUTLINED_FUNCTION_23(v24, &v29)) {
    goto LABEL_34;
  }
  OUTLINED_FUNCTION_24();
  StreamingWriter::writeExtPoints(v25, v26);
}

void StreamingWriter::writeInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
}

uint64_t StreamingWriter::writeConfigure(StreamingWriter *this, char a2, AlgDataExtractor *a3, AlgDataExtractor *a4)
{
  char v11 = 3;
  uint64_t v7 = SABinaryWriter::writeHeader((uint64_t)this + 8, 5);
  if ((v7 & 1) == 0) {
    return 0;
  }
  uint64_t v8 = OUTLINED_FUNCTION_23(v7, &v11);
  if (!v8) {
    return 0;
  }
  char v10 = a2;
  if (!OUTLINED_FUNCTION_23(v8, &v10)) {
    return 0;
  }

  return StreamingWriter::writeExtPoints(this, a3);
}

uint64_t SABinaryWriter::addExtractionData(SABinaryWriter *this, uint64_t a2, uint64_t a3, int a4, __int16 a5, unsigned int a6, const void *a7)
{
  return SABinaryWriter::addInjExtData(this, 0, a2, a3, a4, a5, a6, a7);
}

uint64_t PacketCollection::reset(PacketCollection *this)
{
  uint64_t v1 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v3 = *((unsigned int *)this + 5);
    if (i >= v3) {
      break;
    }
    uint64_t v4 = *((void *)this + 1) + v1;
    *(void *)(v4 + 24) = 0;
    *(_WORD *)(v4 + 32) = 0;
    *(void *)(v4 + 40) = 0;
    *(_DWORD *)(v4 + 48) = 0;
    *(void *)(v4 + 56) = 0;
    *(void *)uint64_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 16) = 0;
    v1 += 80;
  }
  for (int j = *((_DWORD *)this + 11); --j != -1; *((_DWORD *)this + 11) = j)
    ;
  for (int k = v3 - 1; k != -1; --k)
    *((_DWORD *)this + 5) = k;
  return SAList<unsigned char>::clear((uint64_t)this + 56);
}

uint64_t SAList<unsigned char>::clear(uint64_t result)
{
  for (int i = *(_DWORD *)(result + 12); --i != -1; *(_DWORD *)(result + 12) = i)
    ;
  return result;
}

void AlgDataInjector::~AlgDataInjector(AlgDataInjector *this)
{
  PacketCollection::~PacketCollection(this);

  operator delete(v1);
}

uint64_t AlgDataExtractor::reset(AlgDataExtractor *this)
{
  unint64_t v2 = 0;
  uint64_t v3 = 1;
  uint64_t v4 = 56;
  while (v2 < *((unsigned int *)this + 11))
  {
    if (!*(unsigned char *)(*((void *)this + 4) + v3))
    {
      uint64_t v5 = *(void **)(*((void *)this + 1) + v4);
      if (v5) {
        operator delete[](v5);
      }
    }
    ++v2;
    v3 += 2;
    v4 += 80;
  }

  return PacketCollection::reset(this);
}

void AlgDataExtractor::~AlgDataExtractor(AlgDataExtractor *this)
{
  PacketCollection::~PacketCollection(this);

  operator delete(v1);
}

void PacketCollection::append(PacketCollection *this, const PacketCollection *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  uint64_t v5 = *((unsigned int *)a2 + 5);
  if (a3 != -1) {
    uint64_t v5 = a3;
  }
  unint64_t v6 = v5 + a4;
  uint64_t v7 = (char *)this + 8;
  uint64_t v8 = (char *)this + 32;
  uint64_t v9 = (char *)this + 56;
  uint64_t v10 = 80 * a4;
  while (v4 < v6)
  {
    SAList<AlgDataPacket>::push_back((uint64_t)v7);
    SAList<PacketBookkeeper>::push_back((uint64_t)v8);
    SAList<unsigned char>::push_back((uint64_t)v9);
    ++v4;
    v10 += 80;
  }
  OUTLINED_FUNCTION_24();
}

uint64_t AlgDataExtractor::callbackFor(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (!a4) {
    return 0;
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_28();
  return v4();
}

void AlgsDevice::StreamingClient::profileAlloc(AlgsDevice::StreamingClient *this, unsigned int a2)
{
  *((_WORD *)this + 8) = a2;
  *((_WORD *)this + 9) = (a2 + 1048568) >> 4;
  uint64_t v3 = (void *)*((void *)this + 1);
  unint64_t v4 = operator new(a2);
  *((void *)this + 1) = v4;
  if (v3)
  {
    OUTLINED_FUNCTION_22();
    memcpy(v5, v6, v7);
    operator delete(v3);
  }
  else
  {
    *(_DWORD *)unint64_t v4 = 20488;
    v4[4] = 2;
    v4[6] = 2;
  }
  *((void *)this + 3) = *((void *)this + 1) + 8;
}

void AlgsDevice::StreamingClient::reset(AlgsDevice::StreamingClient *this)
{
  if (*((void *)this + 6))
  {
    unint64_t v2 = (int *)*((void *)this + 4);
    unint64_t Info = AlgsDevice::getInfo((AlgsDevice *)v2);
    AlgDataExtractor::AlgDataExtractor((uint64_t)v4, v2[12]);
    AlgsDevice::getClientExtractor((uint64_t)v2, (uint64_t)v4);
    StreamingWriter::writeResetOrInfo((uint64_t)this + 40, 1, BYTE5(Info), Info, BYTE4(Info), BYTE6(Info), *((void *)this + 4) + 80, *((unsigned char *)this + 96));
    PacketCollection::~PacketCollection((PacketCollection *)v4);
  }
}

void sub_25BF24390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  PacketCollection::~PacketCollection((PacketCollection *)va);
  _Unwind_Resume(a1);
}

void AlgsDevice::StreamingClient::~StreamingClient(AlgsDevice::StreamingClient *this)
{
  AlgsDevice::StreamingClient::~StreamingClient(this);

  operator delete(v1);
}

{
  uint64_t v2;
  uint64_t v3;

  *(void *)this = &unk_27096BE20;
  if (*((void *)this + 13))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v2 + 8))();
  }
  if (*((void *)this + 14))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v3 + 8))();
  }
  operator delete(*((void **)this + 1));
  StreamingPacketCache::~StreamingPacketCache((AlgsDevice::StreamingClient *)((char *)this + 128));
}

void AlgsDevice::StreamingClient::configure(AlgsDevice::StreamingClient *this, char a2, AlgDataExtractor *a3)
{
  *((unsigned char *)this + 96) = a2;
  operator delete(*((void **)this + 1));
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 3) = 0;
  while (v6 < *((unsigned int *)a3 + 5))
  {
    size_t v7 = (void *)(*((void *)a3 + 1) + v5);
    if (*v7 == 0x3779B8717A8905ELL && v7[1] == 0xC0246BF06F597652)
    {
      *((void *)a3 + 10) = AlgsDevice::StreamingClient::configure(BOOL,AlgDataExtractor &)::$_0::__invoke;
      *((void *)a3 + 11) = this;
      AlgsDevice::StreamingClient::profileAlloc(this, *((unsigned __int16 *)this + 8));
    }
    v7[8] = AlgsDevice::StreamingClient::extraction;
    v7[9] = this;
    ++v6;
    v5 += 80;
  }
  uint64_t v9 = *((void *)this + 4);

  AlgsDevice::addClient(v9, 0, (uint64_t)this, a3);
}

double AlgsDevice::StreamingClient::extraction(__int16 *a1)
{
  uint64_t v1 = *(void *)a1;
  unint64_t v2 = (SABinaryWriter *)(*(void *)a1 + 48);
  if (*(void *)v2)
  {
    if (SABinaryWriter::addExtractionData((SABinaryWriter *)(*(void *)a1 + 48), *((void *)a1 + 1), *((void *)a1 + 2), *((unsigned __int8 *)a1 + 28) == 1, a1[12], (unsigned __int16)(*((_DWORD *)a1 + 12) + a1[16]), 0)&& SABinaryWriter::write(v2, *((const void **)a1 + 5), (unsigned __int16)a1[16])&& SABinaryWriter::write(v2, *((const void **)a1 + 7), (unsigned __int16)a1[24]))
    {
      *(unsigned char *)(v1 + 97) = 1;
    }
    else
    {
      OUTLINED_FUNCTION_36();
      *(unsigned char *)(v1 + 72) = 0;
      double result = 0.0;
      *(_OWORD *)(v1 + 40) = 0u;
      *(_OWORD *)(v1 + 56) = 0u;
      *(unsigned char *)(v1 + 74) = 0;
      *(void *)(v1 + 80) = 0;
    }
  }
  return result;
}

uint64_t AlgsDevice::StreamingClient::configureTranslation(AlgsDevice::StreamingClient *this, const PacketCollection *a2, const PacketCollection *a3)
{
  OUTLINED_FUNCTION_13();
  size_t v7 = (void *)(v6 + 104);
  if (*(void *)(v6 + 104))
  {
    OUTLINED_FUNCTION_0();
    (*(void (**)(void))(v8 + 8))();
  }
  uint64_t result = *(void *)(v5 + 112);
  if (result)
  {
    OUTLINED_FUNCTION_0();
    uint64_t result = (*(uint64_t (**)(void))(v10 + 8))();
  }
  int v11 = *(_DWORD *)(v4 + 20);
  if (v11) {
    BOOL v12 = v11 == *(_DWORD *)(v3 + 20);
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v13 = operator new(0x50uLL);
    *(void *)(v5 + 104) = PacketCollection::PacketCollection((uint64_t)v13, *(_DWORD *)(v4 + 20), *(unsigned char *)(v5 + 120));
    uint64_t v14 = operator new(0x50uLL);
    uint64_t result = PacketCollection::PacketCollection((uint64_t)v14, *(_DWORD *)(v3 + 20), *(unsigned char *)(v5 + 120));
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    *(void *)(v5 + 112) = result;
    while (v16 < *(unsigned int *)(v4 + 20))
    {
      OUTLINED_FUNCTION_0();
      (*(void (**)(void))(v17 + 16))();
      OUTLINED_FUNCTION_0();
      uint64_t result = (*(uint64_t (**)(void))(v18 + 16))();
      ++v16;
      v15 += 80;
    }
  }
  else
  {
    *size_t v7 = 0;
    v7[1] = 0;
  }
  return result;
}

uint64_t AlgsDevice::StreamingClient::writeTreeInfo(void)::$_0::__invoke(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)(a1 + 72) != 8) {
    return 0;
  }
  unint64_t v3 = 0;
  uint64_t v4 = (SABinaryWriter *)(a1 + 48);
  char v5 = *((unsigned char *)a2 + 16);
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 17);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = v9 + *(void *)(a1 + 64);
  unint64_t v11 = *(unsigned __int16 *)(v9 + 5);
  BOOL v12 = (void *)(v10 - 16 * v11);
  for (int i = v12; ; i += 2)
  {
    if (v11 == v3)
    {
      unint64_t v3 = *(unsigned __int16 *)(v9 + 5);
      __int16 v14 = *(_WORD *)(v9 + 5);
      goto LABEL_8;
    }
    if (*i == v6) {
      break;
    }
    ++v3;
  }
  __int16 v14 = v3;
LABEL_8:
  uint64_t v15 = *(unsigned __int16 *)(v9 + 3);
  unint64_t v16 = v9 + 7 + 4 * v15;
  if (v16 >= (unint64_t)v12) {
    return 0;
  }
  *(_WORD *)unint64_t v16 = v14;
  *(unsigned char *)(v16 + 2) = v8;
  *(unsigned char *)(v16 + 3) = v5;
  *(_WORD *)(v9 + 3) = v15 + 1;
  if (v3 >= v11)
  {
    v18[0] = v6;
    v18[1] = v7;
    uint64_t result = SABinaryWriter::write(v4, v18, 0x10uLL);
    if (!result) {
      return result;
    }
    ++*(_WORD *)(v9 + 5);
  }
  return 1;
}

void AlgDataExtractor::AlgDataExtractor(AlgDataExtractor *this)
{
  *((void *)this + 2) = 16;
  *((unsigned char *)this + 24) = 1;
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 16;
  *((unsigned char *)this + 48) = 1;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 16;
  *((unsigned char *)this + 72) = 1;
  *(void *)this = &unk_27096BE80;
  *((void *)this + 1) = 0;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
}

uint64_t AlgsDevice::StreamingClient::configureStatus(AlgsDevice::StreamingClient *this)
{
  uint64_t v2 = *((void *)this + 4);
  AlgDataExtractor::AlgDataExtractor((uint64_t)v6, *(_DWORD *)(v2 + 48));
  AlgsDevice::getClientExtractor(v2, (uint64_t)v6);
  uint64_t v4 = StreamingWriter::writeConfigure((AlgsDevice::StreamingClient *)((char *)this + 40), *((unsigned char *)this + 96), (AlgDataExtractor *)v6, v3);
  PacketCollection::~PacketCollection((PacketCollection *)v6);
  return v4;
}

void sub_25BF24918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *AlgDataInjector::AlgDataInjector(uint64_t a1, int a2)
{
  uint64_t result = (void *)PacketCollection::PacketCollection(a1, a2, 1);
  *uint64_t result = &unk_27096BEE0;
  return result;
}

double OUTLINED_FUNCTION_1(uint64_t a1)
{
  SABinaryWriter::updateCacheSizes(a1, 0);
  *(unsigned char *)(v1 + 72) = 0;
  double result = 0.0;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(unsigned char *)(v1 + 74) = 0;
  *(void *)(v1 + 80) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  return *(void *)a1;
}

void OUTLINED_FUNCTION_4()
{
  ++*(_DWORD *)(v0 + 12);
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t (*a1)(uint64_t)@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  *(void *)(a2 + 56) = a3;
  return a1(a2);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPacket(*(void *)(a1 + 8), a2, 1);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  return StreamingParser::addPacket(*(void *)(a1 + 16), a2, 2);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t result, double a2)
{
  *(double *)(result + 16) = a2;
  *(unsigned char *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(double *)(result + 40) = a2;
  *(unsigned char *)(result + 48) = 0;
  *(void *)(result + 56) = 0;
  *(double *)(result + 64) = a2;
  *(unsigned char *)(result + 72) = 0;
  *(void *)(result + 80) = 0;
  *(double *)(result + 88) = a2;
  *(unsigned char *)(result + 96) = 0;
  return result;
}

BOOL OUTLINED_FUNCTION_16(uint64_t a1, unsigned int a2)
{
  return AlgWorkNode::extractDataIfOnList(a1, a2, v4, v3, v2);
}

_DWORD *OUTLINED_FUNCTION_17()
{
  *(unsigned char *)(*(void *)(v0 + 32) + 2 * *(unsigned __int8 *)(*(void *)(v0 + 56) - v2 + v1)) = v3;
  return PacketCollection::popIterableAt((_DWORD *)v0, v1 - v2);
}

void OUTLINED_FUNCTION_20(AlgWorkNode *this, AlgDataInjector *a2, AlgDataExtractor *a3)
{
  AlgWorkNode::runPrologue(this, a2, a3);
}

uint64_t OUTLINED_FUNCTION_21@<X0>(char a1@<W1>, unsigned char *a2@<X8>)
{
  *a2 = a1;
  return 1;
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, const void *a2)
{
  return SABinaryWriter::write(v2, a2, 1uLL);
}

uint64_t OUTLINED_FUNCTION_25(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20,char a21)
{
  if (v21) {
    char v25 = v23;
  }
  else {
    char v25 = v23 + 1;
  }
  a21 = v25;
  return SABinaryWriter::write(v22, &a18, 0x12uLL);
}

void *OUTLINED_FUNCTION_26()
{
  v0[5] = v1;
  v0[7] = v1 + v0[4];
  return v0;
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1)
{
  return *(void *)(a1 + 64);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return v0;
}

void OUTLINED_FUNCTION_30()
{
  AlgWorkNode::runEpilogue(v2, v1, v0);
}

void *OUTLINED_FUNCTION_31()
{
  size_t v2 = 8 * *(unsigned int *)(v0 + 8);
  return operator new(v2);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_36()
{
  return SABinaryWriter::updateCacheSizes(0, 0);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return v0;
}

char *OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return &a13;
}

uint64_t IOHIDEventCreateNavigationSwipeEvent()
{
  return MEMORY[0x270EF4290]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x270EF43D8]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x270EDA170]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}