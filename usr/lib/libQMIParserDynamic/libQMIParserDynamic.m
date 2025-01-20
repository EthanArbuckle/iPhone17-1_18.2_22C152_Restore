uint64_t qmi::MutableMessageBase::MutableMessageBase(uint64_t this, __int16 a2)
{
  *(_WORD *)this = a2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  return this;
}

{
  *(_WORD *)this = a2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  return this;
}

unsigned __int8 *qmi::MessageBase::findTlvValue(qmi::MessageBase *this, int a2)
{
  v2 = (uint64_t *)*((void *)this + 1);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *v2;
  unint64_t v3 = v2[1];
  result = (unsigned __int8 *)(v4 + 7);
  if (v4 + 7 > v3) {
    return 0;
  }
  int v6 = *(unsigned __int8 *)(v4 + 4);
  uint64_t v7 = *(unsigned __int16 *)(v4 + 5);
  if (v6 != a2)
  {
    while (1)
    {
      v8 = &result[v7];
      result = v8 + 3;
      if ((unint64_t)(v8 + 3) > v3) {
        break;
      }
      int v9 = *v8;
      uint64_t v7 = *(unsigned __int16 *)(v8 + 1);
      if (v9 == a2) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

void std::__shared_ptr_emplace<qmi::SerializedMessage>::__on_zero_shared(uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

unint64_t tlv::throwIfNotEnoughBytes(unint64_t this, const unsigned __int8 *a2, unint64_t a3)
{
  if (this > (unint64_t)a2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException(exception);
    goto LABEL_7;
  }
  if ((a3 & 0x8000000000000000) != 0 || this + a3 > (unint64_t)a2)
  {
    unint64_t v4 = this;
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException((tlv::TlvParseException *)exception, a3, (unint64_t)&a2[-v4]);
LABEL_7:
  }
  return this;
}

void sub_2192DE194(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192DE1A8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **qmi::fixupHeader(void **result, int a2, char a3)
{
  if (*result)
  {
    unint64_t v3 = (unsigned char *)**result;
    unint64_t v4 = 8;
    if (a2) {
      unint64_t v4 = 9;
    }
    if ((*result)[1] - (void)v3 >= v4)
    {
      v3[5] = a3;
      v3[7] = *((unsigned char *)*result + 26);
      if (a2) {
        v3[8] = *((unsigned char *)*result + 27);
      }
    }
  }
  return result;
}

qmi::ResponseBase *qmi::ResponseBase::ResponseBase(std::__shared_weak_count **this, char *a2, unint64_t a3)
{
  if (*((_DWORD *)qmi::MessageBase::MessageBase((qmi::MessageBase *)this, a2, a3) + 1)) {
    return (qmi::ResponseBase *)this;
  }
  v5 = this[1];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v7 = v5->__vftable;
  unint64_t shared_owners = v5->__shared_owners_;
  v8 = (_WORD *)((char *)&v5->~__shared_weak_count + 7);
  if ((unint64_t)v8 > shared_owners) {
    goto LABEL_5;
  }
  int v10 = BYTE4(v7->~__shared_weak_count);
  uint64_t v11 = *(unsigned __int16 *)((char *)&v7->~__shared_weak_count + 5);
  if (v10 != 2)
  {
    while (1)
    {
      v12 = (unsigned __int8 *)v8 + v11;
      v8 = v12 + 3;
      if ((unint64_t)(v12 + 3) > shared_owners) {
        break;
      }
      int v13 = *v12;
      uint64_t v11 = *(unsigned __int16 *)(v12 + 1);
      if (v13 == 2) {
        goto LABEL_10;
      }
    }
LABEL_5:
    int v9 = 65542;
LABEL_6:
    *((_DWORD *)this + 1) = v9;
    return (qmi::ResponseBase *)this;
  }
LABEL_10:
  if (v11 != 4)
  {
    *((_DWORD *)this + 1) = 65543;
    v14 = this[2];
    this[1] = 0;
    this[2] = 0;
    if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
      return (qmi::ResponseBase *)this;
    }
    return (qmi::ResponseBase *)this;
  }
  if (!*v8) {
    return (qmi::ResponseBase *)this;
  }
  int v9 = (unsigned __int16)v8[1];
  if (v9) {
    goto LABEL_6;
  }
  *((_DWORD *)this + 1) = 65552;
  return (qmi::ResponseBase *)this;
}

void qmi::MutableMessageBase::~MutableMessageBase(qmi::MutableMessageBase *this)
{
  v2 = (void *)*((void *)this + 1);
  unint64_t v3 = (void *)*((void *)this + 2);
  if (v2 == v3)
  {
    if (!v2) {
      return;
    }
    goto LABEL_3;
  }
  do
  {
    if (*v2) {
      (*(void (**)(void))(*(void *)*v2 + 8))(*v2);
    }
    ++v2;
  }
  while (v2 != v3);
  v2 = (void *)*((void *)this + 1);
  if (v2)
  {
LABEL_3:
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  void *v3;

  v2 = (void *)*((void *)this + 1);
  unint64_t v3 = (void *)*((void *)this + 2);
  if (v2 == v3)
  {
    if (!v2) {
      return;
    }
    goto LABEL_3;
  }
  do
  {
    if (*v2) {
      (*(void (**)(void))(*(void *)*v2 + 8))(*v2);
    }
    ++v2;
  }
  while (v2 != v3);
  v2 = (void *)*((void *)this + 1);
  if (v2)
  {
LABEL_3:
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void qmi::MutableMessageBase::serialize(qmi::MutableMessageBase *this@<X0>, void *a2@<X8>)
{
  memset(a2, 170, 24);
  unint64_t v4 = (uint64_t *)*((void *)this + 1);
  v5 = (uint64_t *)*((void *)this + 2);
  if (v4 == v5)
  {
    *a2 = 0;
    a2[1] = 0;
    size_t v6 = 4;
    a2[2] = 0;
LABEL_8:
    v8 = operator new(v6);
    *a2 = v8;
    __int16 v9 = (_WORD)v8 + v6;
    a2[2] = (char *)v8 + v6;
    bzero(v8, v6);
    a2[1] = (char *)v8 + v6;
    goto LABEL_10;
  }
  size_t v6 = 4;
  do
  {
    uint64_t v7 = *v4++;
    v6 += (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
  }
  while (v4 != v5);
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (v6)
  {
    if ((v6 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_8;
  }
  __int16 v9 = 0;
  v8 = 0;
LABEL_10:
  _WORD *v8 = *(_WORD *)this;
  v8[1] = v9 - (_WORD)v8 - 4;
  int v10 = (void *)*((void *)this + 1);
  uint64_t v11 = (void *)*((void *)this + 2);
  if (v10 != v11)
  {
    v12 = v8 + 2;
    do
    {
      (*(void (**)(void, _WORD **))(*(void *)*v10 + 24))(*v10, &v12);
      ++v10;
    }
    while (v10 != v11);
    if (v12 != (_WORD *)a2[1]) {
      qmi::MutableMessageBase::sWriteErrorHandler();
    }
  }
}

void sub_2192DE550(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void qmi::MessageBase::~MessageBase(qmi::MessageBase *this)
{
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

{
  std::__shared_weak_count *v1;

  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1)
  {
    if (!atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(void *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

void *qmi::createRequest@<X0>(int a1@<W0>, __int16 *a2@<X1>, unsigned __int16 a3@<W2>, void *a4@<X8>)
{
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  v8 = (char *)operator new(0x38uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)v8 = &unk_26CAABCD0;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *a4 = v8 + 24;
  a4[1] = v8;
  if (a1) {
    uint64_t v9 = 9;
  }
  else {
    uint64_t v9 = 8;
  }
  size_t v10 = a3;
  size_t v11 = a3 + v9;
  v12 = operator new(v11);
  bzero(v12, v11);
  unsigned char *v12 = 1;
  *(_WORD *)(v12 + 1) = v11 - 1;
  v12[3] = 0;
  v12[4] = a1;
  *(_WORD *)(v12 + 5) = 0;
  v12[7] = 0;
  if (a1) {
    v12[8] = 0;
  }
  result = memcpy(&v12[v9], a2, v10);
  __int16 v14 = *a2;
  *((void *)v8 + 3) = v12;
  *((void *)v8 + 4) = &v12[v11];
  *((void *)v8 + 5) = &v12[v11];
  *((_WORD *)v8 + 24) = v14;
  return result;
}

void sub_2192DE76C(_Unwind_Exception *a1)
{
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

qmi::MessageBase *qmi::MessageBase::MessageBase(qmi::MessageBase *this, char *a2, unint64_t a3)
{
  *(_WORD *)this = 0;
  *(void *)((char *)this + 4) = 0;
  unint64_t v4 = (int *)((char *)this + 4);
  v5 = (void *)((char *)this + 8);
  *(void *)((char *)this + 12) = 0;
  *((_DWORD *)this + 5) = 0;
  if (a3 <= 3)
  {
    int v6 = 65540;
LABEL_5:
    *unint64_t v4 = v6;
    void *v5 = 0;
    *((void *)this + 2) = 0;
    return this;
  }
  *(_WORD *)this = *(_WORD *)a2;
  uint64_t v8 = *((unsigned __int16 *)a2 + 1);
  if (v8 + 4 > a3)
  {
    int v6 = 65541;
    goto LABEL_5;
  }
  size_t v10 = (std::__shared_weak_count *)operator new(0x30uLL);
  size_t v11 = v10;
  v10->__shared_owners_ = 0;
  p_unint64_t shared_owners = &v10->__shared_owners_;
  int v13 = &a2[v8];
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAAB610;
  v10[1].__vftable = 0;
  __int16 v14 = &v10[1].__vftable;
  v15 = (unsigned __int16 *)(v13 + 4);
  v10[1].__shared_owners_ = 0;
  v10[1].__shared_weak_owners_ = 0;
  int64_t v16 = (char *)v15 - a2;
  if (v15 == (unsigned __int16 *)a2)
  {
    *((void *)this + 2) = v10;
    v19 = (void *)((char *)this + 16);
    *((void *)this + 1) = v14;
LABEL_14:
    *unint64_t v4 = 65543;
    void *v5 = 0;
    void *v19 = 0;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    return this;
  }
  if (v16 < 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  v17 = (char *)operator new((char *)v15 - a2);
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v17;
  unint64_t v18 = (unint64_t)&v17[v16];
  v11[1].__shared_weak_owners_ = (uint64_t)&v17[v16];
  memcpy(v17, a2, v16);
  v11[1].__shared_owners_ = (uint64_t)&v17[v16];
  *((void *)this + 2) = v11;
  v19 = (void *)((char *)this + 16);
  *((void *)this + 1) = v14;
  if (v16 >= 7)
  {
    v21 = &v17[*(unsigned __int16 *)(v17 + 5)];
    v20 = v21 + 7;
    if ((unint64_t)(v21 + 10) <= v18)
    {
      do
      {
        v22 = &v20[*(unsigned __int16 *)(v20 + 1)];
        v20 = v22 + 3;
      }
      while ((unint64_t)(v22 + 6) <= v18);
    }
  }
  else
  {
    v20 = v17 + 4;
  }
  if (v20 != (char *)v18) {
    goto LABEL_14;
  }
  return this;
}

void sub_2192DE964(_Unwind_Exception *a1)
{
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_2192DE978(_Unwind_Exception *a1)
{
  v5 = *v3;
  if (*v3)
  {
    v2[1].__shared_owners_ = (uint64_t)v5;
    operator delete(v5);
  }
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v6);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void qmi::MessageBase::validateMsgId(qmi::MessageBase *this, int a2)
{
  if (!*((_DWORD *)this + 1) && *(unsigned __int16 *)this != a2)
  {
    *((_DWORD *)this + 1) = 65544;
    v2 = (std::__shared_weak_count *)*((void *)this + 2);
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
    if (v2)
    {
      if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
        std::__shared_weak_count::__release_weak(v2);
      }
    }
  }
}

uint64_t qmi::parse(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if ((a2 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (a2 < 8) {
    return 0;
  }
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  LOBYTE(v13) = *(unsigned char *)a1;
  unsigned int v4 = *(unsigned __int16 *)(a1 + 1);
  *(_DWORD *)((char *)&v13 + 2) = *(_DWORD *)(a1 + 1);
  BYTE6(v13) = *(unsigned char *)(a1 + 5);
  if (BYTE5(v13))
  {
    if (a2 < 9) {
      return 0;
    }
    unint64_t v10 = *(char *)(a1 + 6);
    if (v10 > 4) {
      int v11 = 3;
    }
    else {
      int v11 = dword_2192FACB8[v10];
    }
    LODWORD(v14) = v11;
    unsigned int v7 = 9;
    WORD2(v14) = *(_WORD *)(a1 + 7);
    unsigned int v8 = v4 + 1;
    uint64_t v9 = v4 - 8;
    if (v4 + 1 >= 9) {
      goto LABEL_15;
    }
LABEL_10:
    (*(void (**)(uint64_t, unint64_t *, void, uint64_t, void))(a3 + 16))(a3, &v13, 0, 0xFFFFFFFFLL, 0);
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = *(unsigned __int8 *)(a1 + 6);
  if (v6 >= 3) {
    unsigned int v6 = 3;
  }
  LODWORD(v14) = v6;
  unsigned int v7 = 8;
  WORD2(v14) = *(unsigned __int8 *)(a1 + 7);
  unsigned int v8 = v4 + 1;
  uint64_t v9 = v4 - 7;
  if (v4 + 1 < 8) {
    goto LABEL_10;
  }
LABEL_15:
  (*(void (**)(uint64_t, unint64_t *, uint64_t, uint64_t, void))(a3 + 16))(a3, &v13, a1 + v7, v9, a2 - v7);
  if (v4 >= a2) {
    return 0;
  }
  else {
    return v8;
  }
}

{
  void v4[5];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = ___ZN3qmi5parseEPKhiU13block_pointerFvRKNS_10QMuxHeaderES1_iE_block_invoke;
  v4[3] = &__block_descriptor_tmp;
  v4[4] = a3;
  return qmi::parse(a1, a2, (uint64_t)v4);
}

__n128 qmi::MutableMessageBase::MutableMessageBase(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return result;
}

{
  __n128 result;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 8) = 0;
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  return result;
}

const char *qmi::asString(unsigned int a1)
{
  __n128 result = "QMI_ERROR_NONE";
  switch(a1)
  {
    case 0u:
      return result;
    case 1u:
      __n128 result = "QMI_ERR_MALFORMED_MSG";
      break;
    case 2u:
      __n128 result = "QMI_ERR_NO_MEMORY";
      break;
    case 3u:
      __n128 result = "QMI_ERR_INTERNAL";
      break;
    case 4u:
      __n128 result = "QMI_ERR_ABORTED";
      break;
    case 5u:
      __n128 result = "QMI_ERR_CLIENT_IDS_EXHAUSTED";
      break;
    case 6u:
      __n128 result = "QMI_ERR_UNABORTABLE_TRANSACTION";
      break;
    case 7u:
      __n128 result = "QMI_ERR_INVALID_CLIENT_ID";
      break;
    case 8u:
      __n128 result = "QMI_ERR_NO_THRESHOLDS";
      break;
    case 9u:
      __n128 result = "QMI_ERR_INVALID_HANDLE";
      break;
    case 0xAu:
      __n128 result = "QMI_ERR_INVALID_PROFILE";
      break;
    case 0xBu:
      __n128 result = "QMI_ERR_INVALID_PINID";
      break;
    case 0xCu:
      __n128 result = "QMI_ERR_INCORRECT_PIN";
      break;
    case 0xDu:
      __n128 result = "QMI_ERR_NO_NETWORK_FOUND";
      break;
    case 0xEu:
      __n128 result = "QMI_ERR_CALL_FAILED";
      break;
    case 0xFu:
      __n128 result = "QMI_ERR_OUT_OF_CALL";
      break;
    case 0x10u:
      __n128 result = "QMI_ERR_NOT_PROVISIONED";
      break;
    case 0x11u:
      __n128 result = "QMI_ERR_MISSING_ARG";
      break;
    case 0x12u:
      __n128 result = "QMI_ERR_GENERIC_0012";
      break;
    case 0x13u:
      __n128 result = "QMI_ERR_ARG_TOO_LONG";
      break;
    case 0x14u:
      __n128 result = "QMI_ERR_GENERIC_0014";
      break;
    case 0x15u:
      __n128 result = "QMI_ERR_GENERIC_0015";
      break;
    case 0x16u:
      __n128 result = "QMI_ERR_INVALID_TX_ID";
      break;
    case 0x17u:
      __n128 result = "QMI_ERR_DEVICE_IN_USE";
      break;
    case 0x18u:
      __n128 result = "QMI_ERR_OP_NETWORK_UNSUPPORTED";
      break;
    case 0x19u:
      __n128 result = "QMI_ERR_OP_DEVICE_UNSUPPORTED";
      break;
    case 0x1Au:
      __n128 result = "QMI_ERR_NO_EFFECT";
      break;
    case 0x1Bu:
      __n128 result = "QMI_ERR_NO_FREE_PROFILE";
      break;
    case 0x1Cu:
      __n128 result = "QMI_ERR_INVALID_PDP_TYPE";
      break;
    case 0x1Du:
      __n128 result = "QMI_ERR_INVALID_TECH_PREF";
      break;
    case 0x1Eu:
      __n128 result = "QMI_ERR_INVALID_PROFILE_TYPE";
      break;
    case 0x1Fu:
      __n128 result = "QMI_ERR_INVALID_SERVICE_TYPE";
      break;
    case 0x20u:
      __n128 result = "QMI_ERR_INVALID_REGISTER_ACTION";
      break;
    case 0x21u:
      __n128 result = "QMI_ERR_INVALID_PS_ATTACH_ACTION";
      break;
    case 0x22u:
      __n128 result = "QMI_ERR_AUTHENTICATION_FAILED";
      break;
    case 0x23u:
      __n128 result = "QMI_ERR_PIN_BLOCKED";
      break;
    case 0x24u:
      __n128 result = "QMI_ERR_PIN_PERM_BLOCKED";
      break;
    case 0x25u:
      __n128 result = "QMI_ERR_UIM_NOT_INITIALIZED";
      break;
    case 0x26u:
      __n128 result = "QMI_ERR_MAX_QOS_REQUESTS_IN_USE";
      break;
    case 0x27u:
      __n128 result = "QMI_ERR_INCORRECT_FLOW_FILTER";
      break;
    case 0x28u:
      __n128 result = "QMI_ERR_NETWORK_QOS_UNAWARE";
      break;
    case 0x29u:
      __n128 result = "QMI_ERR_INVALID_ID";
      break;
    case 0x2Au:
      __n128 result = "QMI_ERR_REQUESTED_NUM_UNSUPPORTED";
      break;
    case 0x2Bu:
      __n128 result = "QMI_ERR_INTERFACE_NOT_FOUND";
      break;
    case 0x2Cu:
      __n128 result = "QMI_ERR_FLOW_SUSPENDED";
      break;
    case 0x2Du:
      __n128 result = "QMI_ERR_INVALID_DATA_FORMAT";
      break;
    case 0x2Eu:
      __n128 result = "QMI_ERR_GENERAL";
      break;
    case 0x2Fu:
      __n128 result = "QMI_ERR_UNKNOWN";
      break;
    case 0x30u:
      __n128 result = "QMI_ERR_INVALID_ARG";
      break;
    case 0x31u:
      __n128 result = "QMI_ERR_INVALID_INDEX";
      break;
    case 0x32u:
      __n128 result = "QMI_ERR_NO_ENTRY";
      break;
    case 0x33u:
      __n128 result = "QMI_ERR_DEVICE_STORAGE_FULL";
      break;
    case 0x34u:
      __n128 result = "QMI_ERR_DEVICE_NOT_READY";
      break;
    case 0x35u:
      __n128 result = "QMI_ERR_NETWORK_NOT_READY";
      break;
    case 0x36u:
      __n128 result = "QMI_ERR_CAUSE_CODE";
      break;
    case 0x37u:
      __n128 result = "QMI_ERR_MESSAGE_NOT_SENT";
      break;
    case 0x38u:
      __n128 result = "QMI_ERR_MESSAGE_DELIVERY_FAILURE";
      break;
    case 0x39u:
      __n128 result = "QMI_ERR_INVALID_MESSAGE_ID";
      break;
    case 0x3Au:
      __n128 result = "QMI_ERR_ENCODING";
      break;
    case 0x3Bu:
      __n128 result = "QMI_ERR_AUTHENTICATION_LOCK";
      break;
    case 0x3Cu:
      __n128 result = "QMI_ERR_INVALID_TRANSITION";
      break;
    case 0x3Du:
      __n128 result = "QMI_ERR_NOT_A_MCAST_IFACE";
      break;
    case 0x3Eu:
      __n128 result = "QMI_ERR_MAX_MCAST_REQUESTS_IN_USE";
      break;
    case 0x3Fu:
      __n128 result = "QMI_ERR_INVALID_MCAST_HANDLE";
      break;
    case 0x40u:
      __n128 result = "QMI_ERR_INVALID_IP_FAMILY_PREF";
      break;
    case 0x41u:
      __n128 result = "QMI_ERR_SESSION_INACTIVE";
      break;
    case 0x42u:
      __n128 result = "QMI_ERR_SESSION_INVALID";
      break;
    case 0x43u:
      __n128 result = "QMI_ERR_SESSION_OWNERSHIP";
      break;
    case 0x44u:
      __n128 result = "QMI_ERR_INSUFFICIENT_RESOURCES";
      break;
    case 0x45u:
      __n128 result = "QMI_ERR_DISABLED";
      break;
    case 0x46u:
      __n128 result = "QMI_ERR_INVALID_OPERATION";
      break;
    case 0x47u:
      __n128 result = "QMI_ERR_INVALID_QMI_CMD";
      break;
    case 0x48u:
      __n128 result = "QMI_ERR_TPDU_TYPE";
      break;
    case 0x49u:
      __n128 result = "QMI_ERR_SMSC_ADDR";
      break;
    case 0x4Au:
      __n128 result = "QMI_ERR_INFO_UNAVAILABLE";
      break;
    case 0x4Bu:
      __n128 result = "QMI_ERR_SEGMENT_TOO_LONG";
      break;
    case 0x4Cu:
      __n128 result = "QMI_ERR_SEGMENT_ORDER";
      break;
    case 0x4Du:
      __n128 result = "QMI_ERR_BUNDLING_NOT_SUPPORTED";
      break;
    case 0x4Eu:
      __n128 result = "QMI_ERR_OP_PARTIAL_FAILURE";
      break;
    case 0x4Fu:
      __n128 result = "QMI_ERR_POLICY_MISMATCH";
      break;
    case 0x50u:
      __n128 result = "QMI_ERR_SIM_FILE_NOT_FOUND";
      break;
    case 0x51u:
      __n128 result = "QMI_ERR_EXTENDED_INTERNAL";
      break;
    case 0x52u:
      __n128 result = "QMI_ERR_ACCESS_DENIED";
      break;
    case 0x53u:
      __n128 result = "QMI_ERR_HARDWARE_RESTRICTED";
      break;
    case 0x54u:
      __n128 result = "QMI_ERR_ACK_NOT_SENT";
      break;
    case 0x55u:
      __n128 result = "QMI_ERR_INJECT_TIMEOUT";
      break;
    case 0x56u:
      __n128 result = "QMI_ERR_GENERIC_0056";
      break;
    case 0x57u:
      __n128 result = "QMI_ERR_GENERIC_0057";
      break;
    case 0x58u:
      __n128 result = "QMI_ERR_GENERIC_0058";
      break;
    case 0x59u:
      __n128 result = "QMI_ERR_GENERIC_0059";
      break;
    case 0x5Au:
      __n128 result = "QMI_ERR_INCOMPATIBLE_STATE";
      break;
    case 0x5Bu:
      __n128 result = "QMI_ERR_FDN_RESTRICT";
      break;
    case 0x5Cu:
      __n128 result = "QMI_ERR_SUPS_FAILURE_CAUSE";
      break;
    case 0x5Du:
      __n128 result = "QMI_ERR_NO_RADIO";
      break;
    case 0x5Eu:
      __n128 result = "QMI_ERR_NOT_SUPPORTED";
      break;
    case 0x5Fu:
      __n128 result = "QMI_ERR_NO_SUBSCRIPTION";
      break;
    case 0x60u:
      __n128 result = "QMI_ERR_CARD_CALL_CONTROL_FAILED";
      break;
    case 0x61u:
      __n128 result = "QMI_ERR_NETWORK_ABORTED";
      break;
    case 0x62u:
      __n128 result = "QMI_ERR_MSG_BLOCKED";
      break;
    case 0x63u:
      __n128 result = "QMI_ERR_GENERIC_0063";
      break;
    case 0x64u:
      __n128 result = "QMI_ERR_INVALID_SESSION_TYPE";
      break;
    case 0x65u:
      __n128 result = "QMI_ERR_INVALID_PB_TYPE";
      break;
    case 0x66u:
      __n128 result = "QMI_ERR_NO_SIM";
      break;
    case 0x67u:
      __n128 result = "QMI_ERR_PB_NOT_READY";
      break;
    case 0x68u:
      __n128 result = "QMI_ERR_PIN_RESTRICTION";
      break;
    case 0x69u:
      __n128 result = "QMI_ERR_PIN2_RESTRICTION";
      break;
    case 0x6Au:
      __n128 result = "QMI_ERR_PUK_RESTRICTION";
      break;
    case 0x6Bu:
      __n128 result = "QMI_ERR_PUK2_RESTRICTION";
      break;
    case 0x6Cu:
      __n128 result = "QMI_ERR_PB_ACCESS_RESTRICTED";
      break;
    case 0x6Du:
      __n128 result = "QMI_ERR_PB_DELETE_IN_PROG";
      break;
    case 0x6Eu:
      __n128 result = "QMI_ERR_PB_TEXT_TOO_LONG";
      break;
    case 0x6Fu:
      __n128 result = "QMI_ERR_PB_NUMBER_TOO_LONG";
      break;
    case 0x70u:
      __n128 result = "QMI_ERR_PB_HIDDEN_KEY_RESTRICTION";
      break;
    case 0x71u:
      __n128 result = "QMI_ERR_PB_NOT_AVAILABLE";
      break;
    case 0x72u:
      __n128 result = "QMI_ERR_DEVICE_MEMORY_ERROR";
      break;
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xA0u:
    case 0xA1u:
    case 0xA2u:
    case 0xA3u:
    case 0xA4u:
    case 0xA5u:
    case 0xA6u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xADu:
    case 0xAEu:
    case 0xAFu:
    case 0xB0u:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xB6u:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xBEu:
    case 0xBFu:
    case 0xC0u:
    case 0xC1u:
    case 0xC2u:
    case 0xC3u:
    case 0xC4u:
    case 0xC5u:
    case 0xC6u:
    case 0xC7u:
    case 0xC8u:
    case 0x103u:
    case 0x104u:
    case 0x105u:
    case 0x106u:
    case 0x107u:
    case 0x108u:
    case 0x109u:
    case 0x10Au:
    case 0x10Bu:
    case 0x10Cu:
    case 0x10Du:
    case 0x10Eu:
    case 0x10Fu:
    case 0x110u:
    case 0x111u:
    case 0x112u:
    case 0x113u:
    case 0x114u:
    case 0x115u:
    case 0x116u:
    case 0x117u:
    case 0x118u:
    case 0x119u:
    case 0x11Au:
    case 0x11Bu:
    case 0x11Cu:
    case 0x11Du:
    case 0x11Eu:
    case 0x11Fu:
    case 0x120u:
    case 0x121u:
    case 0x122u:
    case 0x123u:
    case 0x124u:
    case 0x125u:
    case 0x126u:
    case 0x127u:
    case 0x128u:
    case 0x129u:
    case 0x12Au:
    case 0x12Bu:
    case 0x12Cu:
    case 0x12Du:
    case 0x12Eu:
    case 0x12Fu:
    case 0x130u:
    case 0x131u:
    case 0x132u:
    case 0x133u:
    case 0x134u:
    case 0x135u:
    case 0x136u:
    case 0x137u:
    case 0x138u:
    case 0x139u:
    case 0x13Au:
    case 0x13Bu:
    case 0x13Cu:
    case 0x13Du:
    case 0x13Eu:
    case 0x13Fu:
    case 0x140u:
    case 0x141u:
    case 0x142u:
    case 0x143u:
    case 0x144u:
    case 0x145u:
    case 0x146u:
    case 0x147u:
    case 0x148u:
    case 0x149u:
    case 0x14Au:
    case 0x14Bu:
    case 0x14Cu:
    case 0x14Du:
    case 0x14Eu:
    case 0x14Fu:
    case 0x150u:
    case 0x151u:
    case 0x152u:
    case 0x153u:
    case 0x154u:
    case 0x155u:
    case 0x156u:
    case 0x157u:
    case 0x158u:
    case 0x159u:
    case 0x15Au:
    case 0x15Bu:
    case 0x15Cu:
    case 0x15Du:
    case 0x15Eu:
    case 0x15Fu:
    case 0x160u:
    case 0x161u:
    case 0x162u:
    case 0x163u:
    case 0x164u:
    case 0x165u:
    case 0x166u:
    case 0x167u:
    case 0x168u:
    case 0x169u:
    case 0x16Au:
    case 0x16Bu:
    case 0x16Cu:
    case 0x16Du:
    case 0x16Eu:
    case 0x16Fu:
    case 0x170u:
    case 0x171u:
    case 0x172u:
    case 0x173u:
    case 0x174u:
    case 0x175u:
    case 0x176u:
    case 0x177u:
    case 0x178u:
    case 0x179u:
    case 0x17Au:
    case 0x17Bu:
    case 0x17Cu:
    case 0x17Du:
    case 0x17Eu:
    case 0x17Fu:
    case 0x180u:
    case 0x181u:
    case 0x182u:
    case 0x183u:
    case 0x184u:
    case 0x185u:
    case 0x186u:
    case 0x187u:
    case 0x188u:
    case 0x189u:
    case 0x18Au:
    case 0x18Bu:
    case 0x18Cu:
    case 0x18Du:
    case 0x18Eu:
    case 0x18Fu:
    case 0x190u:
    case 0x191u:
    case 0x192u:
    case 0x193u:
    case 0x194u:
    case 0x195u:
    case 0x196u:
    case 0x197u:
    case 0x198u:
    case 0x199u:
    case 0x19Au:
    case 0x19Bu:
    case 0x19Cu:
    case 0x19Du:
    case 0x19Eu:
    case 0x19Fu:
    case 0x1A0u:
    case 0x1A1u:
    case 0x1A2u:
    case 0x1A3u:
    case 0x1A4u:
    case 0x1A5u:
    case 0x1A6u:
    case 0x1A7u:
    case 0x1A8u:
    case 0x1A9u:
    case 0x1AAu:
    case 0x1ABu:
    case 0x1ACu:
    case 0x1ADu:
    case 0x1AEu:
    case 0x1AFu:
    case 0x1B0u:
    case 0x1B1u:
    case 0x1B2u:
    case 0x1B3u:
    case 0x1B4u:
    case 0x1B5u:
    case 0x1B6u:
    case 0x1B7u:
    case 0x1B8u:
    case 0x1B9u:
    case 0x1BAu:
    case 0x1BBu:
    case 0x1BCu:
    case 0x1BDu:
    case 0x1BEu:
    case 0x1BFu:
    case 0x1C0u:
    case 0x1C1u:
    case 0x1C2u:
    case 0x1C3u:
    case 0x1C4u:
    case 0x1C5u:
    case 0x1C6u:
    case 0x1C7u:
    case 0x1C8u:
    case 0x1C9u:
    case 0x1CAu:
    case 0x1CBu:
    case 0x1CCu:
    case 0x1CDu:
    case 0x1CEu:
    case 0x1CFu:
    case 0x1D0u:
    case 0x1D1u:
    case 0x1D2u:
    case 0x1D3u:
    case 0x1D4u:
    case 0x1D5u:
    case 0x1D6u:
    case 0x1D7u:
    case 0x1D8u:
    case 0x1D9u:
    case 0x1DAu:
    case 0x1DBu:
    case 0x1DCu:
    case 0x1DDu:
    case 0x1DEu:
    case 0x1DFu:
    case 0x1E0u:
    case 0x1E1u:
    case 0x1E2u:
    case 0x1E3u:
    case 0x1E4u:
    case 0x1E5u:
    case 0x1E6u:
    case 0x1E7u:
    case 0x1E8u:
    case 0x1E9u:
    case 0x1EAu:
    case 0x1EBu:
    case 0x1ECu:
    case 0x1EDu:
    case 0x1EEu:
    case 0x1EFu:
    case 0x1F0u:
    case 0x1F1u:
    case 0x1F2u:
    case 0x1F3u:
    case 0x207u:
LABEL_7:
      if (HIWORD(a1) == 57005) {
        __n128 result = "ATCS_UNKNOWN_ERROR";
      }
      else {
        __n128 result = "UNKNOWN ERROR";
      }
      break;
    case 0xC9u:
      __n128 result = "CM_CALL_CMD_ERR_CLIENT_ID_P";
      break;
    case 0xCAu:
      __n128 result = "CM_CALL_CMD_ERR_CALL_ID_P";
      break;
    case 0xCBu:
      __n128 result = "CM_CALL_CMD_ERR_NUM_CALL_IDS_P";
      break;
    case 0xCCu:
      __n128 result = "CM_CALL_CMD_ERR_CALL_TYPE_P";
      break;
    case 0xCDu:
      __n128 result = "CM_CALL_CMD_ERR_SRV_TYPE_P";
      break;
    case 0xCEu:
      __n128 result = "CM_CALL_CMD_ERR_SRV_OPT_P";
      break;
    case 0xCFu:
      __n128 result = "CM_CALL_CMD_ERR_MODE_PREF_P";
      break;
    case 0xD0u:
      __n128 result = "CM_CALL_CMD_ERR_NO_NUM_P";
      break;
    case 0xD1u:
      __n128 result = "CM_CALL_CMD_ERR_NULL_NUM_P";
      break;
    case 0xD2u:
      __n128 result = "CM_CALL_CMD_ERR_NUM_P";
      break;
    case 0xD3u:
      __n128 result = "CM_CALL_CMD_ERR_NUM_LEN_P";
      break;
    case 0xD4u:
      __n128 result = "CM_CALL_CMD_ERR_NULL_ALPHA_P";
      break;
    case 0xD5u:
      __n128 result = "CM_CALL_CMD_ERR_ALPHA_LEN_P";
      break;
    case 0xD6u:
      __n128 result = "CM_CALL_CMD_ERR_MISMATCH_P";
      break;
    case 0xD7u:
      __n128 result = "CM_CALL_CMD_ERR_NULL_PARAM_P";
      break;
    case 0xD8u:
      __n128 result = "CM_CALL_CMD_ERR_ACTIVATE_CODE_P";
      break;
    case 0xD9u:
      __n128 result = "CM_CALL_CMD_ERR_CALL_SUPS_P";
      break;
    case 0xDAu:
      __n128 result = "CM_CALL_CMD_ERR_QOS_LEN_P";
      break;
    case 0xDBu:
      __n128 result = "CM_CALL_CMD_ERR_LAST_ACT_DATA_NET_P";
      break;
    case 0xDCu:
      __n128 result = "CM_CALL_CMD_ERR_INVALID_PRIMARY_CALL_ID_P";
      break;
    case 0xDDu:
      __n128 result = "CM_CALL_CMD_ERR_INVALID_GROUP_ID_P";
      break;
    case 0xDEu:
      __n128 result = "CM_CALL_CMD_ERR_PROFILE_NUMBER_IN_USE_P";
      break;
    case 0xDFu:
      __n128 result = "CM_CALL_CMD_ERR_UMTS_CDMA_HANDOVER_REQ_P";
      break;
    case 0xE0u:
      __n128 result = "CM_CALL_CMD_ERR_UMTS_CDMA_HANDOVER_CNF_P";
      break;
    case 0xE1u:
      __n128 result = "CM_CALL_CMD_ERR_OFFLINE_S";
      break;
    case 0xE2u:
      __n128 result = "CM_CALL_CMD_ERR_CDMA_LOCK_S";
      break;
    case 0xE3u:
      __n128 result = "CM_CALL_CMD_ERR_FLASH_S";
      break;
    case 0xE4u:
      __n128 result = "CM_CALL_CMD_ERR_ORIG_RES_S";
      break;
    case 0xE5u:
      __n128 result = "CM_CALL_CMD_ERR_NO_FUNDS_S";
      break;
    case 0xE6u:
      __n128 result = "CM_CALL_CMD_ERR_EMERGENCY_MODE_S";
      break;
    case 0xE7u:
      __n128 result = "CM_CALL_CMD_ERR_IN_USE_S";
      break;
    case 0xE8u:
      __n128 result = "CM_CALL_CMD_ERR_SRV_TYPE_S";
      break;
    case 0xE9u:
      __n128 result = "CM_CALL_CMD_ERR_CALL_TYPE_S";
      break;
    case 0xEAu:
      __n128 result = "CM_CALL_CMD_ERR_CALL_STATE_S";
      break;
    case 0xEBu:
      __n128 result = "CM_CALL_CMD_ERR_SRV_STATE_S";
      break;
    case 0xECu:
      __n128 result = "CM_CALL_CMD_ERR_NO_SO_S";
      break;
    case 0xEDu:
      __n128 result = "CM_CALL_CMD_ERR_ALERT_ANS_BYPASS_S";
      break;
    case 0xEEu:
      __n128 result = "CM_CALL_CMD_ERR_UIM_NOT_PRESENT_S";
      break;
    case 0xEFu:
      __n128 result = "CM_CALL_CMD_ERR_BAD_PRIVACY_PREF_S";
      break;
    case 0xF0u:
      __n128 result = "CM_CALL_CMD_ERR_NO_CALL_ID_S";
      break;
    case 0xF1u:
      __n128 result = "CM_CALL_CMD_ERR_CALL_ORIG_FAIL_S";
      break;
    case 0xF2u:
      __n128 result = "CM_CALL_CMD_ERR_INVALID_MODE_S";
      break;
    case 0xF3u:
      __n128 result = "CM_CALL_CMD_ERR_INVALID_SIM_STATE_S";
      break;
    case 0xF4u:
      __n128 result = "CM_CALL_CMD_ERR_MAX_PRIMARY_PDP_CONTEXTS_S";
      break;
    case 0xF5u:
      __n128 result = "CM_CALL_CMD_ERR_MAX_SEC_PDP_CONTEXT_PER_PRI_S";
      break;
    case 0xF6u:
      __n128 result = "CM_CALL_CMD_ERR_NO_COLLOC_HDR";
      break;
    case 0xF7u:
      __n128 result = "CM_CALL_CMD_ERR_NO_BUF_L";
      break;
    case 0xF8u:
      __n128 result = "CM_CALL_CMD_ERR_MC_COM_L";
      break;
    case 0xF9u:
      __n128 result = "CM_CALL_CMD_ERR_OTHER";
      break;
    case 0xFAu:
      __n128 result = "CM_CALL_CMD_ERR_FUNCTION_UNAVAILABLE_DUE_TO_UNDEFINED_FEATURE";
      break;
    case 0xFBu:
      __n128 result = "CM_CALL_CMD_ERR_CALL_CONTROL_REJECTED";
      break;
    case 0xFCu:
      __n128 result = "CM_CALL_CMD_ERR_FAVORED_MODE_PREF_FOR_ORIGINATION";
      break;
    case 0xFDu:
      __n128 result = "CM_CALL_CMD_ERR_CONNECTION_ID_OUT_L";
      break;
    case 0xFEu:
      __n128 result = "CM_CALL_CMD_ERR_SUPS_SRV_ON_PROHIBITED_LINE_S";
      break;
    case 0xFFu:
      __n128 result = "CM_CALL_CMD_ERR_USER_DATA_LENGTH_P";
      break;
    case 0x100u:
      __n128 result = "CM_CALL_CMD_ERR_NON_NEGOT_BEARER_P";
      break;
    case 0x101u:
      __n128 result = "CM_CALL_CMD_ERR_INVALID_BC_P";
      break;
    case 0x102u:
      __n128 result = "CM_CALL_CMD_ERR_INVALID_ORIG_CLIENT_P";
      break;
    case 0x1F4u:
      __n128 result = "QMI_ERR_FILE_NOT_SUPPORTED";
      break;
    case 0x1F5u:
      __n128 result = "QMI_ERR_FILE_TRANSFER_BUSY";
      break;
    case 0x1F6u:
      __n128 result = "QMI_ERR_TOO_MANY_DUPLICATES";
      break;
    case 0x1F7u:
      __n128 result = "QMI_ERR_UNEXPECTED_SEG_NUMBER";
      break;
    case 0x1F8u:
      __n128 result = "QMI_ERR_UNSUPPORTED_QMI_CMD";
      break;
    case 0x1F9u:
      __n128 result = "QMI_ERR_PB_DESERIALIZE";
      break;
    case 0x1FAu:
      __n128 result = "QMI_ERR_PB_SERIALIZE";
      break;
    case 0x1FBu:
      __n128 result = "QMI_ERR_AWDC_CONFIG_SET";
      break;
    case 0x1FCu:
      __n128 result = "QMI_ERR_AWDC_CONFIG_DELETE";
      break;
    case 0x1FDu:
      __n128 result = "QMI_ERR_AWDC_SET_Q_METRICS";
      break;
    case 0x1FEu:
      __n128 result = "MAV_QMI_MEAS_ERROR_BAD_MEAS_ID";
      break;
    case 0x1FFu:
      __n128 result = "MAV_QMI_MEAS_ERROR_LISTENER_ERROR";
      break;
    case 0x200u:
      __n128 result = "MAV_QMI_MEAS_ERROR_BAD_MEAS_TYPE";
      break;
    case 0x201u:
      __n128 result = "MAV_QMI_ERR_DATA_IN_BUFFER";
      break;
    case 0x202u:
      __n128 result = "MAV_QMI_ERR_FAIL_ORIG_DURING_INCOMING";
      break;
    case 0x203u:
      __n128 result = "MAV_QMI_ERR_RTP_INITIALIZATION_FAILED";
      break;
    case 0x204u:
      __n128 result = "QMI_ERR_VINYL_NOCAPABLE_UICC";
      break;
    case 0x205u:
      __n128 result = "QMI_ERR_VINYL_NOT_READY";
      break;
    case 0x206u:
      __n128 result = "QMI_ERR_SECURITY_FAILURE";
      break;
    case 0x208u:
      __n128 result = "QMI_ERROR_ACTIVATION_NOT_READY";
      break;
    default:
      switch(a1)
      {
        case 0x10000u:
          __n128 result = "ATCS_MIN_ERROR_VALUE";
          break;
        case 0x10001u:
          __n128 result = "ATCS_TIMEOUT";
          break;
        case 0x10002u:
          __n128 result = "ATCS_CLIENT_NOT_READY";
          break;
        case 0x10003u:
          __n128 result = "ATCS_CANCELLED";
          break;
        case 0x10004u:
          __n128 result = "ATCS_BUF_NO_HEADER";
          break;
        case 0x10005u:
          __n128 result = "ATCS_BUF_TOO_SMALL";
          break;
        case 0x10006u:
          __n128 result = "ATCS_NO_RESULT_CODE";
          break;
        case 0x10007u:
          __n128 result = "ATCS_PARSING_ERROR";
          break;
        case 0x10008u:
          __n128 result = "ATCS_MSGID_MISMATCH";
          break;
        case 0x10009u:
          __n128 result = "ATCS_NULL_MESSAGE";
          break;
        case 0x1000Au:
        case 0x1000Bu:
        case 0x1000Cu:
        case 0x1000Du:
        case 0x1000Eu:
        case 0x1000Fu:
          goto LABEL_7;
        case 0x10010u:
          __n128 result = "ATCS_BAD_QMI_ERROR";
          break;
        case 0x10011u:
          __n128 result = "ATCS_SERVER_FAILURE";
          break;
        default:
          if (a1 != -559087616) {
            goto LABEL_7;
          }
          __n128 result = "ATCS_UNKNOWN_ERROR";
          break;
      }
      break;
  }
  return result;
}

{
  if (a1 > 2) {
    return "UNKNOWN";
  }
  else {
    return (&off_26439CDC8)[a1];
  }
}

void defaultParsingHandler(unsigned __int16 a1, unsigned __int16 a2, const unsigned __int8 *a3)
{
  exception = (tlv_parsing_exception *)__cxa_allocate_exception(0x20uLL);
  tlv_parsing_exception::tlv_parsing_exception(exception, a1, a2, v6);
}

void sub_2192DF674(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (*qmi::MessageBase::setParsingErrorHandler(void (*this)(unsigned __int16 a1, unsigned __int16 a2, const unsigned __int8 *a3), BOOL (*a2)(unsigned __int16, unsigned __int16, const unsigned __int8 *, unint64_t)))(unsigned __int16 a1, unsigned __int16 a2, const unsigned __int8 *a3)
{
  if (this) {
    v2 = this;
  }
  else {
    v2 = defaultParsingHandler;
  }
  qmi::MessageBase::sParsingErrorHandler = (uint64_t)v2;
  return this;
}

uint64_t qmi::MessageBase::MessageBase(uint64_t result, __int16 a2, int a3)
{
  *(_WORD *)__n128 result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

{
  *(_WORD *)__n128 result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t qmi::MessageBase::MessageBase(uint64_t result, int a2)
{
  *(_WORD *)__n128 result = 0;
  *(_DWORD *)(result + 4) = a2;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

{
  *(_WORD *)__n128 result = 0;
  *(_DWORD *)(result + 4) = a2;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  return result;
}

void qmi::MessageBase::setError(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)(a1 + 4) = a2;
  if (a3)
  {
    unint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    if (v3)
    {
      if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
}

void qmi::MessageBase::validateBuffer(qmi::MessageBase *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  if (v1)
  {
    uint64_t v3 = *v1;
    unint64_t v2 = v1[1];
    if (v3 + 7 <= v2)
    {
      uint64_t v4 = v3 + 7 + *(unsigned __int16 *)(v3 + 5);
      if (v4 + 3 <= v2)
      {
        do
        {
          uint64_t v6 = v4 + *(unsigned __int16 *)(v4 + 1);
          uint64_t v4 = v6 + 3;
        }
        while (v6 + 6 <= v2);
      }
    }
    else
    {
      uint64_t v4 = v3 + 4;
    }
    if (v4 != v2)
    {
      *((_DWORD *)this + 1) = 65543;
      v5 = (std::__shared_weak_count *)*((void *)this + 2);
      *((void *)this + 1) = 0;
      *((void *)this + 2) = 0;
      if (v5)
      {
        if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }
}

uint64_t std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  unint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

qmi::MessageBase *qmi::MessageBase::MessageBase(qmi::MessageBase *this, const qmi::MutableMessageBase *a2)
{
  *(_WORD *)this = *(_WORD *)a2;
  uint64_t v3 = (uint64_t **)((char *)this + 8);
  *(void *)((char *)this + 12) = 0;
  *(void *)((char *)this + 4) = 0;
  *((_DWORD *)this + 5) = 0;
  qmi::MutableMessageBase::serialize(a2, __p);
  uint64_t v4 = (char *)operator new(0x30uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)uint64_t v4 = &unk_26CAAB610;
  *(_OWORD *)(v4 + 24) = *(_OWORD *)__p;
  *((void *)v4 + 5) = v14;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v14 = 0;
  v5 = (std::__shared_weak_count *)*((void *)this + 2);
  *((void *)this + 1) = v4 + 24;
  *((void *)this + 2) = v4;
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  uint64_t v6 = *v3;
  if (!*v3) {
    return this;
  }
  uint64_t v8 = *v6;
  unint64_t v7 = v6[1];
  if (v8 + 7 <= v7)
  {
    uint64_t v9 = v8 + 7 + *(unsigned __int16 *)(v8 + 5);
    if (v9 + 3 <= v7)
    {
      do
      {
        uint64_t v12 = v9 + *(unsigned __int16 *)(v9 + 1);
        uint64_t v9 = v12 + 3;
      }
      while (v12 + 6 <= v7);
    }
  }
  else
  {
    uint64_t v9 = v8 + 4;
  }
  if (v9 == v7) {
    return this;
  }
  *((_DWORD *)this + 1) = 65543;
  unint64_t v10 = (std::__shared_weak_count *)*((void *)this + 2);
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  if (!v10 || atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return this;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  return this;
}

void sub_2192DFA8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
  {
    operator delete(__p);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v10);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v10);
  _Unwind_Resume(a1);
}

__int16 *qmi::MessageBase::swap(__int16 *this, qmi::MessageBase *a2)
{
  __int16 v2 = *this;
  *this = *(_WORD *)a2;
  *(_WORD *)a2 = v2;
  int v3 = *((_DWORD *)this + 1);
  *((_DWORD *)this + 1) = *((_DWORD *)a2 + 1);
  *((_DWORD *)a2 + 1) = v3;
  uint64_t v4 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v4;
  uint64_t v5 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v5;
  return this;
}

unsigned __int8 *qmi::MessageBase::findNextTlv(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a3 + 8);
  if (*(void *)a3) {
    BOOL v4 = *(void *)a3 + 3 > v3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return 0;
  }
  __n128 result = *(unsigned __int8 **)(a3 + 24);
  unint64_t v6 = *(unsigned __int16 *)(a3 + 18);
  if (*(unsigned __int8 *)(a3 + 16) != a2)
  {
    do
    {
      unint64_t v7 = &result[v6];
      *(void *)a3 = v7;
      if (!result) {
        break;
      }
      __n128 result = v7 + 3;
      if ((unint64_t)(v7 + 3) > v3) {
        return 0;
      }
      *(void *)(a3 + 24) = v7 + 1;
      int v8 = *v7;
      *(void *)(a3 + 24) = v7 + 2;
      uint64_t v9 = v7[1];
      *(void *)(a3 + 24) = result;
      unint64_t v6 = v9 | ((unint64_t)v7[2] << 8);
      *(unsigned char *)(a3 + 16) = v8;
      *(_WORD *)(a3 + 18) = v6;
    }
    while (v8 != a2);
  }
  return result;
}

void tlv_parsing_exception::tlv_parsing_exception(tlv_parsing_exception *this, unsigned __int16 a2, unsigned __int16 a3, const unsigned __int8 *a4)
{
  *((void *)this + 1) = 0;
  uint64_t v5 = (char *)this + 8;
  *(void *)this = &unk_26CAAB5E8;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[7] = v6;
  v26[8] = v6;
  v26[5] = v6;
  v26[6] = v6;
  v26[3] = v6;
  v26[4] = v6;
  v26[1] = v6;
  v26[2] = v6;
  long long v25 = v6;
  v26[0] = v6;
  *(_OWORD *)__p = v6;
  long long v24 = v6;
  long long v21 = v6;
  long long v22 = v6;
  long long v19 = v6;
  long long v20 = v6;
  long long v18 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v18);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)"tlv_parsing_exception: msgId=", 29);
  unint64_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)" tlvId=", 7);
  std::ostream::operator<<();
  if ((BYTE8(v25) & 0x10) != 0)
  {
    uint64_t v10 = v25;
    if ((unint64_t)v25 < *((void *)&v22 + 1))
    {
      *(void *)&long long v25 = *((void *)&v22 + 1);
      uint64_t v10 = *((void *)&v22 + 1);
    }
    int v11 = (const void *)v22;
    size_t v8 = v10 - v22;
    if ((unint64_t)(v10 - v22) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v25) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v17) = 0;
      p_dst = &__dst;
      goto LABEL_14;
    }
    int v11 = (const void *)*((void *)&v20 + 1);
    size_t v8 = *((void *)&v21 + 1) - *((void *)&v20 + 1);
    if (*((void *)&v21 + 1) - *((void *)&v20 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    p_dst = (long long *)operator new(v12 + 1);
    *((void *)&__dst + 1) = v8;
    unint64_t v17 = v13 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v17) = v8;
  p_dst = &__dst;
  if (v8) {
LABEL_13:
  }
    memmove(p_dst, v11, v8);
LABEL_14:
  *((unsigned char *)p_dst + v8) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*(void **)v5);
  }
  *(_OWORD *)uint64_t v5 = __dst;
  uint64_t v14 = (void *)MEMORY[0x263F8C2B8];
  *((void *)v5 + 2) = v17;
  *(void *)&long long v18 = *v14;
  uint64_t v15 = v14[9];
  *(void *)((char *)&v18 + *(void *)(v18 - 24)) = v14[8];
  *(void *)&long long v19 = v15;
  *((void *)&v19 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](v26);
}

void sub_2192DFF04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (*(char *)(v29 + 31) < 0) {
    operator delete(*v30);
  }
  std::exception::~exception((std::exception *)v29);
  _Unwind_Resume(a1);
}

void tlv_parsing_exception::~tlv_parsing_exception(std::exception *this)
{
  uint64_t v1 = this;
  this->__vftable = (std::exception_vtbl *)&unk_26CAAB5E8;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    this = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26CAAB5E8;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    std::exception::~exception(this);
  }
  else
  {
    std::exception::~exception(this);
  }
  operator delete(v2);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  uint64_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  size_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_2192E0370(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](a1 + 128);
  return a1;
}

uint64_t tlv_parsing_exception::what(tlv_parsing_exception *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void __clang_call_terminate(void *a1)
{
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x21D4872E0](v13, a1);
  if (LOBYTE(v13[0]))
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x21D4872F0](v13);
  return a1;
}

void sub_2192E06D8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21D4872F0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2192E06B8);
}

void sub_2192E072C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      size_t v12 = 0;
    }
    else {
      size_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v12 >= 0x17)
      {
        uint64_t v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v14 = v12 | 7;
        }
        uint64_t v15 = v14 + 1;
        uint64_t v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        uint64_t v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        int64_t v16 = __b;
      }
      else {
        int64_t v16 = (void **)__b[0];
      }
      uint64_t v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(void *)v6 + 96))(v6, v16, v12);
      uint64_t v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12) {
          return 0;
        }
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    uint64_t v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(void *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_2192E0920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26439CCA8, MEMORY[0x263F8C060]);
}

void sub_2192E099C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAAB610;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAAB610;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

uint64_t qmi::RandomMessageContext::generateRandomChars(uint64_t this, char *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    uint64_t v5 = this;
    do
    {
      this = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 16))(v5, 95);
      *a2++ = qmi::RandomMessageContext::generateRandomChars(char *,unsigned long)::PRINTABLE[this];
      --v3;
    }
    while (v3);
  }
  return this;
}

void qmi::sCreateRandomMessageContext(qmi *this@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  unsigned int v5 = this;
  uint64_t v7 = operator new(0x10uLL);
  *(void *)uint64_t v7 = &unk_26CAAB6B0;
  v7[2] = 1;
  size_t v8 = strlen(a2);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v9 = v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (void **)operator new(v11 + 1);
    size_t v21 = v9;
    int64_t v22 = v12 | 0x8000000000000000;
    long long __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v22) = v8;
  p_dst = (void **)&__dst;
  if (v8) {
LABEL_8:
  }
    memcpy(p_dst, a2, v9);
  *((unsigned char *)p_dst + v9) = 0;
  size_t v13 = HIBYTE(v22);
  uint64_t v14 = (void **)&__dst;
  if (v22 < 0)
  {
    uint64_t v14 = __dst;
    size_t v13 = v21;
  }
  if (v13)
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = *(char *)v14;
      uint64_t v14 = (void **)((char *)v14 + 1);
      unint64_t v15 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v16) ^ ((0xC6A4A7935BD1E995 * v16) >> 47))) ^ v15)
          + 3864292196u;
      --v13;
    }
    while (v13);
    unint64_t v17 = 0xC6A4A7935BD1E995 * v15;
    if (SHIBYTE(v22) < 0) {
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if (SHIBYTE(v22) < 0) {
LABEL_15:
    }
      operator delete(__dst);
  }
  unint64_t v18 = 1540483477
      * ((1540483477 * ((v17 >> 47) ^ v17)) ^ (678072505
                                                           * ((((0xC6A4A7935BD1E995 * v5) >> 32) >> 15) ^ (1540483477 * v5))
                                                           - 430675100))
      - 430675100;
  unsigned int v19 = v18
      + (((((v18 + 2 * v18) >> 32)
                       + ((v18 - ((v18 + 2 * v18) >> 32)) >> 1)) >> 30) | ((((v18 + 2 * v18) >> 32) + ((v18 - ((v18 + 2 * v18) >> 32)) >> 1)) >> 30 << 31));
  if (v19 <= 1) {
    unsigned int v19 = 1;
  }
  v7[2] = v19;
  *a3 = v7;
}

void sub_2192E0CB4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *qmi::sCreateAlwaysZeroRandomMessageContext@<X0>(void *a1@<X8>)
{
  uint64_t result = operator new(8uLL);
  void *result = &unk_26CAAB708;
  *a1 = result;
  return result;
}

void *qmi::sCreateZeroButLen1RandomMessageContext@<X0>(void *a1@<X8>)
{
  uint64_t result = operator new(8uLL);
  void *result = &unk_26CAAB760;
  *a1 = result;
  return result;
}

uint64_t anonymous namespace'::LinearRandomMessageContext::generateBytes(uint64_t this, char *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = &a2[a3];
    do
    {
      unsigned int v4 = *(_DWORD *)(this + 8);
      do
      {
        unsigned int v5 = v4 / 0xADC8;
        unsigned int v6 = 48271 * (v4 % 0xADC8);
        v5 *= 3399;
        BOOL v7 = v6 >= v5;
        unsigned int v8 = v6 - v5;
        if (v7) {
          int v9 = 0;
        }
        else {
          int v9 = 0x7FFFFFFF;
        }
        unsigned int v4 = v9 + v8;
      }
      while (v4 - 1 > 0x7FFFFEFF);
      *(_DWORD *)(this + 8) = v4;
      *a2++ = v4 - 1;
    }
    while (a2 != v3);
  }
  return this;
}

uint64_t anonymous namespace'::LinearRandomMessageContext::generateLength(_anonymous_namespace_::LinearRandomMessageContext *this, int a2)
{
  v3[0] = 0;
  v3[1] = a2;
  return std::uniform_int_distribution<unsigned int>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)this + 8, v3);
}

uint64_t anonymous namespace'::LinearRandomMessageContext::generateUnsigned(_anonymous_namespace_::LinearRandomMessageContext *this, int a2)
{
  v3[0] = 0;
  v3[1] = a2;
  return std::uniform_int_distribution<unsigned int>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)this + 8, v3);
}

uint64_t std::__independent_bits_engine<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>,unsigned int>::__eval(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t result = 0;
    unint64_t v14 = *(void *)(a1 + 24);
    if (!v14) {
      return result;
    }
    goto LABEL_20;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  unint64_t v4 = *(void *)(a1 + 16);
  int v5 = *(_DWORD *)(a1 + 48);
  unsigned int v6 = **(_DWORD **)a1;
  if (v4 >= 0x20)
  {
    uint64_t v15 = 0;
    do
    {
      unsigned int v16 = v6 / 0xADC8;
      unsigned int v17 = 48271 * (v6 % 0xADC8);
      v16 *= 3399;
      BOOL v11 = v17 >= v16;
      unsigned int v18 = v17 - v16;
      if (v11) {
        int v19 = 0;
      }
      else {
        int v19 = 0x7FFFFFFF;
      }
      unsigned int v6 = v19 + v18;
    }
    while (v6 - 1 >= v3 || ++v15 != v2);
    uint64_t result = (v6 - 1) & v5;
  }
  else
  {
    uint64_t v7 = 0;
    LODWORD(result) = 0;
    while (1)
    {
      unsigned int v9 = v6 / 0xADC8;
      unsigned int v10 = 48271 * (v6 % 0xADC8);
      v9 *= 3399;
      BOOL v11 = v10 >= v9;
      unsigned int v12 = v10 - v9;
      if (v11) {
        int v13 = 0;
      }
      else {
        int v13 = 0x7FFFFFFF;
      }
      unsigned int v6 = v13 + v12;
      if (v6 - 1 < v3)
      {
        uint64_t result = ((v6 - 1) & v5) + (result << v4);
        if (++v7 == v2) {
          break;
        }
      }
    }
  }
  **(_DWORD **)a1 = v6;
  unint64_t v14 = *(void *)(a1 + 24);
  if (v2 < v14)
  {
LABEL_20:
    long long v20 = *(unsigned int **)a1;
    unsigned int v21 = *(_DWORD *)(a1 + 44);
    unint64_t v22 = *(void *)(a1 + 16);
    int v23 = *(_DWORD *)(a1 + 52);
    unsigned int v24 = *v20;
    if (v22 >= 0x1F)
    {
      do
      {
        unsigned int v30 = v24 / 0xADC8;
        unsigned int v31 = 48271 * (v24 % 0xADC8);
        v30 *= 3399;
        BOOL v11 = v31 >= v30;
        unsigned int v32 = v31 - v30;
        if (v11) {
          int v33 = 0;
        }
        else {
          int v33 = 0x7FFFFFFF;
        }
        unsigned int v24 = v33 + v32;
      }
      while (v24 - 1 >= v21 || ++v2 != v14);
      uint64_t result = (v24 - 1) & v23;
      unsigned int *v20 = v24;
    }
    else
    {
      char v25 = v22 + 1;
      while (1)
      {
        unsigned int v26 = v24 / 0xADC8;
        unsigned int v27 = 48271 * (v24 % 0xADC8);
        v26 *= 3399;
        BOOL v11 = v27 >= v26;
        unsigned int v28 = v27 - v26;
        if (v11) {
          int v29 = 0;
        }
        else {
          int v29 = 0x7FFFFFFF;
        }
        unsigned int v24 = v29 + v28;
        if (v24 - 1 < v21)
        {
          uint64_t result = ((v24 - 1) & v23) + (result << v25);
          if (++v2 == v14) {
            break;
          }
        }
      }
      unsigned int *v20 = v24;
    }
  }
  return result;
}

uint64_t std::uniform_int_distribution<unsigned int>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a2[1];
  int v3 = v2 - *a2;
  if (v2 == *a2) {
    return v2;
  }
  unsigned int v4 = v3 + 1;
  if (v3 == -1)
  {
    uint64_t v20 = a1;
    long long v21 = xmmword_2192FA840;
    int64x2_t v22 = vdupq_n_s64(2uLL);
    long long v23 = xmmword_2192FA850;
    return std::__independent_bits_engine<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>,unsigned int>::__eval((uint64_t)&v20);
  }
  uint64_t v6 = __clz(v4);
  uint64_t v7 = 31;
  if (((v4 << v6) & 0x7FFFFFFF) != 0) {
    uint64_t v7 = 32;
  }
  unint64_t v8 = v7 - v6;
  v22.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v20 = a1;
  *(void *)&long long v21 = v7 - v6;
  BOOL v9 = (unint64_t)(v7 - v6) >= 0x1E;
  uint64_t v10 = v7 - v6 - 30;
  if (!v9) {
    uint64_t v10 = v8;
  }
  BOOL v11 = v10 != 0;
  if (v8 <= 0x1D) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = v11 + 1;
  }
  unint64_t v13 = v8 / v12;
  *((void *)&v21 + 1) = v13;
  v22.i64[0] = v12;
  unsigned int v14 = (-1 << v13) & 0x7FFFFFFE;
  if (v13 >= 0x20) {
    unsigned int v14 = 0;
  }
  LODWORD(v23) = v14;
  if (v14 / v12 < (v14 ^ 0x7FFFFFFE))
  {
    unint64_t v13 = v8 / ++v12;
    *((void *)&v21 + 1) = v13;
    v22.i64[0] = v12;
    if (v13 > 0x1F)
    {
      LODWORD(v23) = 0;
      v22.i64[1] = v12 - (v8 % v12);
      unint64_t v13 = 32;
      goto LABEL_20;
    }
    LODWORD(v23) = (-1 << (v8 / v12)) & 0x7FFFFFFE;
  }
  v22.i64[1] = v12 - v8 % v12;
  if (v13 > 0x1E)
  {
LABEL_20:
    int v15 = 0;
    DWORD1(v23) = 0;
    goto LABEL_21;
  }
  DWORD1(v23) = (-2 << v13) & 0x7FFFFFFE;
  int v15 = 1;
LABEL_21:
  unsigned int v17 = 0xFFFFFFFF >> -(char)v13;
  if (!v13) {
    unsigned int v17 = 0;
  }
  unsigned int v18 = 0xFFFFFFFF >> ~(_BYTE)v13;
  if (!v15) {
    unsigned int v18 = -1;
  }
  *((void *)&v23 + 1) = __PAIR64__(v18, v17);
  do
    unsigned int v19 = std::__independent_bits_engine<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>,unsigned int>::__eval((uint64_t)&v20);
  while (v19 >= v4);
  return *a2 + v19;
}

void anonymous namespace'::AlwaysZeroRandomMessageContext::generateBytes(_anonymous_namespace_::AlwaysZeroRandomMessageContext *this, void *a2, size_t a3)
{
}

uint64_t anonymous namespace'::AlwaysZeroRandomMessageContext::generateLength(_anonymous_namespace_::AlwaysZeroRandomMessageContext *this)
{
  return 0;
}

uint64_t anonymous namespace'::AlwaysZeroRandomMessageContext::generateUnsigned(_anonymous_namespace_::AlwaysZeroRandomMessageContext *this)
{
  return 0;
}

uint64_t anonymous namespace'::Len1RandomMessageContext::generateLength(_anonymous_namespace_::Len1RandomMessageContext *this)
{
  return 1;
}

BOOL qmi::isInternalError(int a1)
{
  return (a1 & 0xFFFF0000) != 0;
}

const char *qmi::asLongString()
{
  uint64_t result = "QMI Control Service";
  switch("QMI Control Service")
  {
    case 0u:
      return result;
    case 1u:
      uint64_t result = "QMI Wireless Data Service";
      break;
    case 2u:
      uint64_t result = "QMI Device Management Service";
      break;
    case 3u:
      uint64_t result = "QMI Network Access Service";
      break;
    case 4u:
      uint64_t result = "QMI Qos Service";
      break;
    case 5u:
      uint64_t result = "QMI Wireless Messaging Service";
      break;
    case 6u:
      uint64_t result = "QMI Position Determination Service";
      break;
    case 8u:
      uint64_t result = "QMI Access Terminal Service";
      break;
    case 9u:
      uint64_t result = "QMI Voice Service";
      break;
    case 0xAu:
      uint64_t result = "QMI Card App Toolkit";
      break;
    case 0xBu:
      uint64_t result = "QMI User Identity Module";
      break;
    case 0xCu:
      uint64_t result = "QMI Phonebook Manager Service";
      break;
    case 0x1Au:
      uint64_t result = "QMI Wireless Data Administrative Service";
      break;
    case 0x22u:
      uint64_t result = "QMI Coexistence Service";
      break;
    case 0x24u:
      uint64_t result = "QMI Persistent Device Service";
      break;
    case 0x28u:
      uint64_t result = "QMI 5WI 787 Service";
      break;
    case 0x2Au:
      uint64_t result = "QMI Data System Determination";
      break;
    case 0x2Bu:
      uint64_t result = "QMI Subsystem Control";
      break;
    case 0x2Cu:
      uint64_t result = "QMI Modem File System Extended Service";
      break;
    case 0x30u:
      uint64_t result = "QMI Data Filter Service";
      break;
    case 0x52u:
      uint64_t result = "QMI Media Service Extension";
      break;
    case 0xE1u:
      uint64_t result = "QMI Audio Service";
      break;
    case 0xE2u:
      uint64_t result = "QMI Board Support Package Service";
      break;
    case 0xE3u:
      uint64_t result = "QMI Carrier IQ Service";
      break;
    case 0xE4u:
      uint64_t result = "QMI Apple Wireless Diagnostics";
      break;
    case 0xE5u:
      uint64_t result = "QMI Vinyl Service";
      break;
    case 0xE6u:
      uint64_t result = "QMI Mav 5WI Service";
      break;
    case 0xE7u:
      uint64_t result = "QMI Enhnaced Link Quality Metric Service";
      break;
    case 0xE8u:
      uint64_t result = "QMI Mav P2P Service";
      break;
    case 0xE9u:
      uint64_t result = "QMI BSP APPS Service";
      break;
    case 0xEAu:
      uint64_t result = "QMI Stewie Service";
      break;
    default:
      uint64_t result = "Unknown Service";
      break;
  }
  return result;
}

const char *qmi::asShortString()
{
  uint64_t result = "CTL";
  switch("CTL")
  {
    case 0u:
      return result;
    case 1u:
      uint64_t result = "WDS";
      break;
    case 2u:
      uint64_t result = "DMS";
      break;
    case 3u:
      uint64_t result = "NAS";
      break;
    case 4u:
      uint64_t result = "QOS";
      break;
    case 5u:
      uint64_t result = "WMS";
      break;
    case 6u:
      uint64_t result = "PDS";
      break;
    case 8u:
      uint64_t result = "AT";
      break;
    case 9u:
      uint64_t result = "VS";
      break;
    case 0xAu:
      uint64_t result = "CAT";
      break;
    case 0xBu:
      uint64_t result = "UIM";
      break;
    case 0xCu:
      uint64_t result = "PBM";
      break;
    case 0x1Au:
      uint64_t result = "WDA";
      break;
    case 0x22u:
      uint64_t result = "COEX";
      break;
    case 0x24u:
      uint64_t result = "PDC";
      break;
    case 0x28u:
      uint64_t result = "787";
      break;
    case 0x2Au:
      uint64_t result = "DSD";
      break;
    case 0x2Bu:
      uint64_t result = "SSCTL";
      break;
    case 0x2Cu:
      uint64_t result = "MFSE";
      break;
    case 0x30u:
      uint64_t result = "DFS";
      break;
    case 0x52u:
      uint64_t result = "MS";
      break;
    case 0xE1u:
      uint64_t result = "AUDIO";
      break;
    case 0xE2u:
      uint64_t result = "BSP";
      break;
    case 0xE3u:
      uint64_t result = "CIQ";
      break;
    case 0xE4u:
      uint64_t result = "AWD";
      break;
    case 0xE5u:
      uint64_t result = "VINYL";
      break;
    case 0xE6u:
      uint64_t result = "MAVIMS";
      break;
    case 0xE7u:
      uint64_t result = "ELQM";
      break;
    case 0xE8u:
      uint64_t result = "P2P";
      break;
    case 0xE9u:
      uint64_t result = "APPS";
      break;
    case 0xEAu:
      uint64_t result = "SFT";
      break;
    default:
      uint64_t result = "???";
      break;
  }
  return result;
}

uint64_t qmi::serviceTypeFromString(uint64_t a1)
{
  int v2 = *(char *)(a1 + 23);
  if (v2 >= 0) {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v3 = *(void *)(a1 + 8);
  }
  if (v3 == 2)
  {
    if (v2 >= 0) {
      unsigned int v14 = (_WORD *)a1;
    }
    else {
      unsigned int v14 = *(_WORD **)a1;
    }
    if (!memcmp(v14, "AT", 2uLL)) {
      return 8;
    }
    if (*v14 == 21334) {
      return 9;
    }
  }
  else if (v3 == 3)
  {
    if (v2 >= 0) {
      unsigned int v4 = (unsigned char *)a1;
    }
    else {
      unsigned int v4 = *(unsigned char **)a1;
    }
    if (*(_WORD *)v4 == 21571 && v4[2] == 76) {
      return 0;
    }
    if (*(_WORD *)v4 == 17495 && v4[2] == 83) {
      return 1;
    }
    if (*(_WORD *)v4 == 19780 && v4[2] == 83) {
      return 2;
    }
    if (*(_WORD *)v4 == 16718 && v4[2] == 83) {
      return 3;
    }
    if (*(_WORD *)v4 == 20305 && v4[2] == 83) {
      return 4;
    }
    if (*(_WORD *)v4 == 19799 && v4[2] == 83) {
      return 5;
    }
    if (*(_WORD *)v4 == 17488 && v4[2] == 83) {
      return 6;
    }
    if (!memcmp(v4, "CAT", 3uLL)) {
      return 10;
    }
    if (*(_WORD *)v4 == 18773 && v4[2] == 77) {
      return 11;
    }
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "PBM")) {
    return 12;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "AUDIO")) {
    return 225;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "BSP")) {
    return 226;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "CIQ")) {
    return 227;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "AWD")) {
    return 228;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "COEX")) {
    return 34;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "DSD")) {
    return 42;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "MFSE")) {
    return 44;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "VINYL")) {
    return 229;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "MAVIMS")) {
    return 230;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "ELQM")) {
    return 231;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "PDC")) {
    return 36;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "P2P")) {
    return 232;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "MS")) {
    return 82;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "WDA")) {
    return 26;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "APPS")) {
    return 233;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "DFS")) {
    return 48;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "SSCTL")) {
    return 43;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "SFT")) {
    return -22;
  }
  else {
    return -1;
  }
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(const void **a1, char *__s)
{
  int v4 = *((char *)a1 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (v5 != strlen(__s)) {
    return 0;
  }
  if (v4 >= 0) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *a1;
  }
  return memcmp(v6, __s, v5) == 0;
}

void qmi::RandomMessageReporter::~RandomMessageReporter(qmi::RandomMessageReporter *this)
{
  *(void *)this = &unk_26CAAB7B8;
  int v2 = (void *)*((void *)this + 1);
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

BOOL qmi::RandomMessageReporter::verifyMessageId(std::string **this, int a2, int a3)
{
  if (a2 != a3)
  {
    memset(&v31, 0, sizeof(v31));
    std::string::append(&v31, 4uLL, 48);
    if (a2)
    {
      uint64_t v6 = &v31;
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v6 = (std::string *)v31.__r_.__value_.__r.__words[0];
      }
      std::string::size_type size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v31.__r_.__value_.__l.__size_;
      }
      unint64_t v8 = (char *)v6 + size - 1;
      unsigned __int16 v9 = a2;
      do
      {
        unsigned int v10 = v9;
        if ((v9 & 0xFu) >= 0xA) {
          char v11 = 87;
        }
        else {
          char v11 = 48;
        }
        unsigned char *v8 = v11 + (v9 & 0xF);
        if (v9 >= 0xA0u) {
          char v12 = 87;
        }
        else {
          char v12 = 48;
        }
        *(v8 - 1) = v12 + (v9 >> 4);
        unsigned __int16 v9 = HIBYTE(v9);
        v8 -= 2;
      }
      while (v10 >= 0x100);
    }
    unint64_t v13 = std::string::insert(&v31, 0, "QMI Message Id does not match: actual=0x", 0x28uLL);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    int v15 = std::string::append(&v32, ", expected=0x", 0xDuLL);
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v35.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, 4uLL, 48);
    unsigned __int8 v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    std::string::size_type v19 = __p.__r_.__value_.__l.__size_;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (a3)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        p_p = &__p;
        std::string::size_type v19 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      uint64_t v20 = (char *)p_p + v19 - 1;
      unsigned __int16 v21 = a3;
      do
      {
        unsigned int v22 = v21;
        if ((v21 & 0xFu) >= 0xA) {
          char v23 = 87;
        }
        else {
          char v23 = 48;
        }
        unsigned char *v20 = v23 + (v21 & 0xF);
        if (v21 >= 0xA0u) {
          char v24 = 87;
        }
        else {
          char v24 = 48;
        }
        *(v20 - 1) = v24 + (v21 >> 4);
        unsigned __int16 v21 = HIBYTE(v21);
        v20 -= 2;
      }
      while (v22 >= 0x100);
      unsigned __int8 v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      std::string::size_type v19 = __p.__r_.__value_.__l.__size_;
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((v17 & 0x80u) == 0) {
      char v25 = &__p;
    }
    else {
      char v25 = p_p;
    }
    if ((v17 & 0x80u) == 0) {
      std::string::size_type v26 = v17;
    }
    else {
      std::string::size_type v26 = v19;
    }
    unsigned int v27 = std::string::append(&v35, (const std::string::value_type *)v25, v26);
    long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    std::string::size_type v34 = v27->__r_.__value_.__r.__words[2];
    *(_OWORD *)int v33 = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_35:
        if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_36;
        }
        goto LABEL_42;
      }
    }
    else if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_35;
    }
    operator delete(v35.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_36:
      if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_37;
      }
LABEL_43:
      operator delete(v31.__r_.__value_.__l.__data_);
LABEL_37:
      memset(&v35, 170, sizeof(v35));
      ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v35);
      ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v35, v33);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v35.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v34) & 0x80000000) == 0) {
          return a2 != a3;
        }
      }
      else if ((SHIBYTE(v34) & 0x80000000) == 0)
      {
        return a2 != a3;
      }
      operator delete(v33[0]);
      return a2 != a3;
    }
LABEL_42:
    operator delete(v32.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_43;
  }
  return a2 != a3;
}

void sub_2192E2E0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 41) < 0) {
    operator delete(*(void **)(v33 - 64));
  }
  if (a33 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void qmi::RandomMessageReporter::reportMismatch(std::string **a1, uint64_t a2)
{
  memset(&__p, 170, sizeof(__p));
  ctu::join<std::__wrap_iter<char const**>>(a1[1], a1[2], "::", 2uLL, &__p);
  ((void (*)(std::string **, std::string *, uint64_t))(*a1)->__r_.__value_.__r.__words[2])(a1, &__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2192E2F6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL qmi::RandomMessageReporter::verifyTlvId(std::string **this, unsigned int a2, unsigned int a3)
{
  if (a2 != a3)
  {
    memset(&v27, 0, sizeof(v27));
    std::string::append(&v27, 2uLL, 48);
    if (a2)
    {
      uint64_t v6 = &v27;
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        uint64_t v6 = (std::string *)v27.__r_.__value_.__r.__words[0];
      }
      std::string::size_type size = HIBYTE(v27.__r_.__value_.__r.__words[2]);
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v27.__r_.__value_.__l.__size_;
      }
      unint64_t v8 = (char *)v6 + size;
      if ((a2 & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      *(v8 - 1) = v9 + (a2 & 0xF);
      if (a2 >= 0xA0) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 2) = v10 + (a2 >> 4);
    }
    char v11 = std::string::insert(&v27, 0, "TLV Id does not match: actual=0x", 0x20uLL);
    long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    unint64_t v13 = std::string::append(&v28, ", expected=0x", 0xDuLL);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, 2uLL, 48);
    unsigned __int8 v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    std::string::size_type v17 = __p.__r_.__value_.__l.__size_;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (a3)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        p_p = &__p;
        std::string::size_type v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      unsigned int v18 = (char *)p_p + v17;
      if ((a3 & 0xF) >= 0xA) {
        char v19 = 87;
      }
      else {
        char v19 = 48;
      }
      *(v18 - 1) = v19 + (a3 & 0xF);
      if (a3 >= 0xA0) {
        char v20 = 87;
      }
      else {
        char v20 = 48;
      }
      *(v18 - 2) = v20 + (a3 >> 4);
      unsigned __int8 v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      std::string::size_type v17 = __p.__r_.__value_.__l.__size_;
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((v15 & 0x80u) == 0) {
      unsigned __int16 v21 = &__p;
    }
    else {
      unsigned __int16 v21 = p_p;
    }
    if ((v15 & 0x80u) == 0) {
      std::string::size_type v22 = v15;
    }
    else {
      std::string::size_type v22 = v17;
    }
    char v23 = std::string::append(&v31, (const std::string::value_type *)v21, v22);
    long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    std::string::size_type v30 = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)int v29 = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_32:
        if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_33;
        }
        goto LABEL_39;
      }
    }
    else if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_32;
    }
    operator delete(v31.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_33:
      if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_34;
      }
LABEL_40:
      operator delete(v27.__r_.__value_.__l.__data_);
LABEL_34:
      memset(&v31, 170, sizeof(v31));
      ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v31);
      ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v31, v29);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v31.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v30) & 0x80000000) == 0) {
          return a2 != a3;
        }
      }
      else if ((SHIBYTE(v30) & 0x80000000) == 0)
      {
        return a2 != a3;
      }
      operator delete(v29[0]);
      return a2 != a3;
    }
LABEL_39:
    operator delete(v28.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_40;
  }
  return a2 != a3;
}

void sub_2192E3218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (*(char *)(v33 - 41) < 0) {
    operator delete(*(void **)(v33 - 64));
  }
  if (a33 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void qmi::RandomMessageReporter::reportTlvMissing(std::string **this, unsigned int a2)
{
  memset(&v13, 0, sizeof(v13));
  std::string::append(&v13, 2uLL, 48);
  if (a2)
  {
    int v4 = &v13;
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      int v4 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    uint64_t v6 = (char *)v4 + size;
    if ((a2 & 0xF) >= 0xA) {
      char v7 = 87;
    }
    else {
      char v7 = 48;
    }
    *(v6 - 1) = v7 + (a2 & 0xF);
    if (a2 >= 0xA0) {
      char v8 = 87;
    }
    else {
      char v8 = 48;
    }
    *(v6 - 2) = v8 + (a2 >> 4);
  }
  char v9 = std::string::insert(&v13, 0, "TLV 0x", 6uLL);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  char v11 = std::string::append(&v16, " is not present but was expected", 0x20uLL);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
  }
  else if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_15;
  }
  operator delete(v13.__r_.__value_.__l.__data_);
LABEL_15:
  memset(&v16, 170, sizeof(v16));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v16);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v16, __p);
  if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0) {
      return;
    }
LABEL_21:
    operator delete(__p[0]);
    return;
  }
  operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15) < 0) {
    goto LABEL_21;
  }
}

void sub_2192E347C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 - 25) < 0) {
    operator delete(*(void **)(v21 - 48));
  }
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void qmi::RandomMessageReporter::reportParseUnderrun(std::string **this)
{
  int v2 = operator new(0x48uLL);
  long long v3 = xmmword_2192FA910;
  strcpy((char *)v2, "Parse underrun; expected end of message but more bytes still remain");
  memset(&__p, 170, sizeof(__p));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &__p);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &__p, &v2);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v3) & 0x80000000) == 0) {
      return;
    }
LABEL_5:
    operator delete(v2);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v3) < 0) {
    goto LABEL_5;
  }
}

void sub_2192E35D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  _Unwind_Resume(exception_object);
}

void sub_2192E3618(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void qmi::RandomMessageReporter::reportTlvParseFailure(std::string **this, unsigned int a2)
{
  memset(&v13, 0, sizeof(v13));
  std::string::append(&v13, 2uLL, 48);
  if (a2)
  {
    int v4 = &v13;
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      int v4 = (std::string *)v13.__r_.__value_.__r.__words[0];
    }
    std::string::size_type size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = v13.__r_.__value_.__l.__size_;
    }
    uint64_t v6 = (char *)v4 + size;
    if ((a2 & 0xF) >= 0xA) {
      char v7 = 87;
    }
    else {
      char v7 = 48;
    }
    *(v6 - 1) = v7 + (a2 & 0xF);
    if (a2 >= 0xA0) {
      char v8 = 87;
    }
    else {
      char v8 = 48;
    }
    *(v6 - 2) = v8 + (a2 >> 4);
  }
  char v9 = std::string::insert(&v13, 0, "TLV 0x", 6uLL);
  long long v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  char v11 = std::string::append(&v16, " failed to parse", 0x10uLL);
  long long v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  std::string::size_type v15 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
  }
  else if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_15;
  }
  operator delete(v13.__r_.__value_.__l.__data_);
LABEL_15:
  memset(&v16, 170, sizeof(v16));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v16);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v16, __p);
  if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0) {
      return;
    }
LABEL_21:
    operator delete(__p[0]);
    return;
  }
  operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15) < 0) {
    goto LABEL_21;
  }
}

void sub_2192E37D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 - 25) < 0) {
    operator delete(*(void **)(v21 - 48));
  }
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26439CCB0, MEMORY[0x263F8C068]);
}

void sub_2192E3898(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

std::string *ctu::join<std::__wrap_iter<char const**>>@<X0>(std::string *result@<X0>, std::string *a2@<X1>, const void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (result != a2)
  {
    char v8 = result;
    uint64_t result = std::string::__assign_external(a5, result->__r_.__value_.__l.__data_);
    uint64_t v10 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v10 = a4 | 7;
    }
    if (a3)
    {
      if (a4 < 0x7FFFFFFFFFFFFFF8)
      {
        if (a4 >= 0x17)
        {
          size_t v19 = v10 + 1;
          unint64_t v20 = (v10 + 1) | 0x8000000000000000;
          for (i = (const char **)&v8->__r_.__value_.__l.__size_; i != (const char **)a2; ++i)
          {
            long long v24 = operator new(v19);
            size_t v29 = a4;
            int64_t v30 = v20;
            *(void *)__s = v24;
            memmove(v24, a3, a4);
            *((unsigned char *)v24 + a4) = 0;
            std::string::append(a5, (const std::string::value_type *)v24, a4);
            if (SHIBYTE(v30) < 0) {
              operator delete(*(void **)__s);
            }
            std::string::size_type v22 = *i;
            size_t v23 = strlen(v22);
            uint64_t result = std::string::append(a5, v22, v23);
          }
        }
        else if (a4)
        {
          for (j = (const char **)&v8->__r_.__value_.__l.__size_; j != (const char **)a2; ++j)
          {
            HIBYTE(v30) = a4;
            memmove(__s, a3, a4);
            __s[a4] = 0;
            if (v30 >= 0) {
              std::string::size_type v17 = __s;
            }
            else {
              std::string::size_type v17 = *(std::string::value_type **)__s;
            }
            if (v30 >= 0) {
              std::string::size_type v18 = HIBYTE(v30);
            }
            else {
              std::string::size_type v18 = v29;
            }
            std::string::append(a5, v17, v18);
            if (SHIBYTE(v30) < 0) {
              operator delete(*(void **)__s);
            }
            std::string::size_type v15 = *j;
            size_t v16 = strlen(v15);
            uint64_t result = std::string::append(a5, v15, v16);
          }
        }
        else
        {
          for (k = (const char **)&v8->__r_.__value_.__l.__size_; k != (const char **)a2; ++k)
          {
            HIBYTE(v30) = 0;
            __s[0] = 0;
            std::string::append(a5, __s, 0);
            if (SHIBYTE(v30) < 0) {
              operator delete(*(void **)__s);
            }
            std::string::size_type v26 = *k;
            size_t v27 = strlen(v26);
            uint64_t result = std::string::append(a5, v26, v27);
          }
        }
      }
      else if (&v8->__r_.__value_.__r.__words[1] != (std::string::size_type *)a2)
      {
        std::string::__throw_length_error[abi:ne180100]();
      }
    }
    else
    {
      for (m = (const char **)&v8->__r_.__value_.__l.__size_; m != (const char **)a2; ++m)
      {
        *(void *)__s = 0;
        size_t v29 = 0;
        int64_t v30 = 0;
        std::string::append(a5, __s, 0);
        if (SHIBYTE(v30) < 0) {
          operator delete(*(void **)__s);
        }
        long long v12 = *m;
        size_t v13 = strlen(v12);
        uint64_t result = std::string::append(a5, v12, v13);
      }
    }
  }
  return result;
}

void sub_2192E3B50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*(char *)(v15 + 23) < 0)
  {
    operator delete(*(void **)v15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        char v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          char v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22) {
            operator delete(v9);
          }
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        std::string::size_type v12 = 2 * v8;
        if (__n > 2 * v8) {
          std::string::size_type v12 = __n;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = HIBYTE(v10);
    char v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    char v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        char v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);

  return std::string::__assign_external(this, __s, v4);
}

_DWORD *sInitializeAtcsQmiMessageDefinitions(uint64_t **a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0)
  {
    long long v3 = (MessageCollection_QMI_CTL_Printers_h *)__cxa_guard_acquire(&_MergedGlobals);
    if (v3)
    {
      MessageCollection_QMI_CTL_Printers_h::MessageCollection_QMI_CTL_Printers_h(v3);
      __cxa_atexit((void (*)(void *))MessageCollection_QMI_CTL_Printers_h::~MessageCollection_QMI_CTL_Printers_h, &qword_26AA5F900, &dword_2192DD000);
      __cxa_guard_release(&_MergedGlobals);
    }
  }
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5F910;
  __int16 v7 = word_26AA5F912;
  char v8 = byte_26AA5F914;
  size_t v4 = &qword_26AA5F900;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5F948;
  __int16 v7 = word_26AA5F94A;
  char v8 = byte_26AA5F94C;
  size_t v4 = &qword_26AA5F938;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5F970;
  __int16 v7 = word_26AA5F972;
  char v8 = byte_26AA5F974;
  size_t v4 = &qword_26AA5F960;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5F9A8;
  __int16 v7 = word_26AA5F9AA;
  char v8 = byte_26AA5F9AC;
  size_t v4 = &qword_26AA5F998;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5F9D0;
  __int16 v7 = word_26AA5F9D2;
  char v8 = byte_26AA5F9D4;
  size_t v4 = &qword_26AA5F9C0;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5F9F8;
  __int16 v7 = word_26AA5F9FA;
  char v8 = byte_26AA5F9FC;
  size_t v4 = &qword_26AA5F9E8;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FA30;
  __int16 v7 = word_26AA5FA32;
  char v8 = byte_26AA5FA34;
  size_t v4 = &qword_26AA5FA20;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FA58;
  __int16 v7 = word_26AA5FA5A;
  char v8 = byte_26AA5FA5C;
  size_t v4 = &qword_26AA5FA48;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FA90;
  __int16 v7 = word_26AA5FA92;
  char v8 = byte_26AA5FA94;
  size_t v4 = &qword_26AA5FA80;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FAB8;
  __int16 v7 = word_26AA5FABA;
  char v8 = byte_26AA5FABC;
  size_t v4 = &qword_26AA5FAA8;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FAF0;
  __int16 v7 = word_26AA5FAF2;
  char v8 = byte_26AA5FAF4;
  size_t v4 = &qword_26AA5FAE0;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FB28;
  __int16 v7 = word_26AA5FB2A;
  char v8 = byte_26AA5FB2C;
  size_t v4 = &qword_26AA5FB18;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FB50;
  __int16 v7 = word_26AA5FB52;
  char v8 = byte_26AA5FB54;
  size_t v4 = &qword_26AA5FB40;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FB78;
  __int16 v7 = word_26AA5FB7A;
  char v8 = byte_26AA5FB7C;
  size_t v4 = &qword_26AA5FB68;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FB90;
  __int16 v7 = word_26AA5FB92;
  char v8 = byte_26AA5FB94;
  size_t v4 = &qword_26AA5FB80;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
  char v6 = -86;
  char v9 = -86;
  char v5 = byte_26AA5FBA8;
  __int16 v7 = word_26AA5FBAA;
  char v8 = byte_26AA5FBAC;
  size_t v4 = &qword_26AA5FB98;
  return std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v5, &v4);
}

void MessageCollection_QMI_CTL_Printers_h::~MessageCollection_QMI_CTL_Printers_h(MessageCollection_QMI_CTL_Printers_h *this)
{
  *((void *)this + 83) = &unk_26CAABFD0;
  *((void *)this + 72) = &unk_26CAABFA0;
  *((void *)this + 67) = &unk_26CAABF70;
  *((void *)this + 60) = &unk_26CAABF40;
  *((void *)this + 53) = &unk_26CAABF10;
  *((void *)this + 48) = &unk_26CAABEE0;
  *((void *)this + 41) = &unk_26CAABEB0;
  *((void *)this + 36) = &unk_26CAABE80;
  *((void *)this + 29) = &unk_26CAABE50;
  *((void *)this + 24) = &unk_26CAABE20;
  *((void *)this + 19) = &unk_26CAABDF0;
  *((void *)this + 12) = &unk_26CAABDC0;
  *((void *)this + 7) = &unk_26CAABD90;
  *(void *)this = &unk_26CAABD60;
}

void MessageCollection_QMI_CTL_Printers_h::MessageCollection_QMI_CTL_Printers_h(MessageCollection_QMI_CTL_Printers_h *this)
{
  byte_26AA5F910 = 0;
  word_26AA5F912 = 41;
  byte_26AA5F914 = 0;
  qword_26AA5F900 = (uint64_t)&unk_26CAABD60;
  *(void *)algn_26AA5F908 = "ctl::ConfigPowerSaveMode::Request";
  qword_26AA5F918 = (uint64_t)&unk_26CAAB838;
  unk_26AA5F920 = "ctl::tlv::PowerSaveDescriptor";
  qword_26AA5F928 = (uint64_t)&unk_26CAAB880;
  unk_26AA5F930 = "ctl::tlv::IndicationSet";
  byte_26AA5F948 = 0;
  word_26AA5F94A = 41;
  byte_26AA5F94C = 1;
  qword_26AA5F938 = (uint64_t)&unk_26CAABD90;
  unk_26AA5F940 = "ctl::ConfigPowerSaveMode::Response";
  qword_26AA5F950 = (uint64_t)&unk_26CAABAF8;
  unk_26AA5F958 = "QMI Response Result";
  byte_26AA5F970 = 0;
  word_26AA5F972 = 50;
  byte_26AA5F974 = 0;
  qword_26AA5F960 = (uint64_t)&unk_26CAABDC0;
  unk_26AA5F968 = "ctl::ConfigPowerSaveModeExt::Request";
  qword_26AA5F978 = (uint64_t)&unk_26CAAB838;
  unk_26AA5F980 = "ctl::tlv::PowerSaveDescriptor";
  qword_26AA5F988 = (uint64_t)&unk_26CAAB8C8;
  unk_26AA5F990 = "ctl::tlv::IndicationSetExt";
  byte_26AA5F9A8 = 0;
  word_26AA5F9AA = 50;
  byte_26AA5F9AC = 1;
  qword_26AA5F998 = (uint64_t)&unk_26CAABDF0;
  unk_26AA5F9A0 = "ctl::ConfigPowerSaveModeExt::Response";
  qword_26AA5F9B0 = (uint64_t)&unk_26CAABAF8;
  unk_26AA5F9B8 = "QMI Response Result";
  byte_26AA5F9D0 = 0;
  word_26AA5F9D2 = 34;
  byte_26AA5F9D4 = 0;
  qword_26AA5F9C0 = (uint64_t)&unk_26CAABE20;
  unk_26AA5F9C8 = "ctl::GetClientId::Request";
  qword_26AA5F9D8 = (uint64_t)&unk_26CAAB910;
  unk_26AA5F9E0 = "ctl::tlv::ServiceType";
  byte_26AA5F9F8 = 0;
  word_26AA5F9FA = 34;
  byte_26AA5F9FC = 1;
  qword_26AA5F9E8 = (uint64_t)&unk_26CAABE50;
  unk_26AA5F9F0 = "ctl::GetClientId::Response";
  qword_26AA5FA00 = (uint64_t)&unk_26CAABAF8;
  unk_26AA5FA08 = "QMI Response Result";
  qword_26AA5FA10 = (uint64_t)&unk_26CAAB958;
  unk_26AA5FA18 = "ctl::tlv::AssignedId";
  byte_26AA5FA30 = 0;
  word_26AA5FA32 = 35;
  byte_26AA5FA34 = 0;
  qword_26AA5FA20 = (uint64_t)&unk_26CAABE80;
  unk_26AA5FA28 = "ctl::ReleaseClientId::Request";
  qword_26AA5FA38 = (uint64_t)&unk_26CAAB958;
  unk_26AA5FA40 = "ctl::tlv::AssignedId";
  byte_26AA5FA58 = 0;
  word_26AA5FA5A = 35;
  byte_26AA5FA5C = 1;
  qword_26AA5FA48 = (uint64_t)&unk_26CAABEB0;
  unk_26AA5FA50 = "ctl::ReleaseClientId::Response";
  qword_26AA5FA60 = (uint64_t)&unk_26CAABAF8;
  unk_26AA5FA68 = "QMI Response Result";
  qword_26AA5FA70 = (uint64_t)&unk_26CAAB958;
  unk_26AA5FA78 = "ctl::tlv::AssignedId";
  qword_26AA5FA88 = (uint64_t)"ctl::RevokeClientId::Indication";
  byte_26AA5FA90 = 0;
  word_26AA5FA92 = 36;
  byte_26AA5FA94 = 2;
  qword_26AA5FA80 = (uint64_t)&unk_26CAABEE0;
  qword_26AA5FA98 = (uint64_t)&unk_26CAAB958;
  unk_26AA5FAA0 = "ctl::tlv::AssignedId";
  byte_26AA5FAB8 = 0;
  word_26AA5FABA = 38;
  byte_26AA5FABC = 0;
  qword_26AA5FAA8 = (uint64_t)&unk_26CAABF10;
  unk_26AA5FAB0 = "ctl::SetDataFormat::Request";
  qword_26AA5FAC0 = (uint64_t)&unk_26CAAB9A0;
  unk_26AA5FAC8 = "ctl::tlv::DataFormat";
  qword_26AA5FAD0 = (uint64_t)&unk_26CAAB9E8;
  unk_26AA5FAD8 = "ctl::tlv::LinkLayerProtocol";
  byte_26AA5FAF0 = 0;
  word_26AA5FAF2 = 38;
  byte_26AA5FAF4 = 1;
  qword_26AA5FAE0 = (uint64_t)&unk_26CAABF40;
  unk_26AA5FAE8 = "ctl::SetDataFormat::Response";
  qword_26AA5FAF8 = (uint64_t)&unk_26CAABAF8;
  unk_26AA5FB00 = "QMI Response Result";
  qword_26AA5FB10 = (uint64_t)"ctl::tlv::LinkLayerProtocol";
  qword_26AA5FB08 = (uint64_t)&unk_26CAAB9E8;
  qword_26AA5FB20 = (uint64_t)"ctl::SetPowerSaveMode::Request";
  byte_26AA5FB28 = 0;
  word_26AA5FB2A = 42;
  byte_26AA5FB2C = 0;
  qword_26AA5FB18 = (uint64_t)&unk_26CAABF70;
  qword_26AA5FB38 = (uint64_t)"ctl::tlv::PowerSaveState";
  qword_26AA5FB30 = (uint64_t)&unk_26CAABA30;
  qword_26AA5FB48 = (uint64_t)"ctl::SetPowerSaveMode::Response";
  byte_26AA5FB50 = 0;
  word_26AA5FB52 = 42;
  byte_26AA5FB54 = 1;
  qword_26AA5FB40 = (uint64_t)&unk_26CAABFA0;
  qword_26AA5FB60 = (uint64_t)"QMI Response Result";
  qword_26AA5FB58 = (uint64_t)&unk_26CAABAF8;
  qword_26AA5FB70 = (uint64_t)"ctl::Sync::Indication";
  byte_26AA5FB78 = 0;
  word_26AA5FB7A = 39;
  byte_26AA5FB7C = 2;
  qword_26AA5FB68 = (uint64_t)&unk_26CAAC138;
  qword_26AA5FB88 = (uint64_t)"ctl::Sync::Request";
  byte_26AA5FB90 = 0;
  word_26AA5FB92 = 39;
  byte_26AA5FB94 = 0;
  qword_26AA5FB80 = (uint64_t)&unk_26CAAC180;
  qword_26AA5FBA0 = (uint64_t)"ctl::Sync::Response";
  byte_26AA5FBA8 = 0;
  word_26AA5FBAA = 39;
  byte_26AA5FBAC = 1;
  qword_26AA5FB98 = (uint64_t)&unk_26CAABFD0;
  qword_26AA5FBB8 = (uint64_t)"QMI Response Result";
  qword_26AA5FBB0 = (uint64_t)&unk_26CAABAF8;
}

void TlvDefinitionImpl<ctl::tlv::PowerSaveDescriptor,(unsigned char)1>::parse(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = *a2;
  __int16 v7 = (const unsigned __int8 *)a2[1];
  unint64_t v13 = 0xAAAAAA0000000000;
  tlv::throwIfNotEnoughBytes(v6, v7, 4uLL);
  LODWORD(v13) = *(_DWORD *)v6;
  tlv::throwIfNotEnoughBytes(v6 + 4, v7, 1uLL);
  BYTE4(v13) = *(unsigned char *)(v6 + 4);
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v6 == -5)
  {
    TlvDefinition::sFillInParseFailure(a3, (uint64_t)a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    size_t v11 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_2192E4A8C(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E4AA0(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E4AB4(void *a1)
{
}

char *TlvDefinitionImpl<ctl::tlv::PowerSaveDescriptor,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  unint64_t v4 = 0xAAAAAA0000000000;
  ctl::tlv::build_tlv_field(a1, (uint64_t)&v4);
  uint64_t result = (char *)operator new(5uLL);
  *a2 = result;
  a2[1] = result + 5;
  a2[2] = result + 5;
  *(_DWORD *)uint64_t result = v4;
  result[4] = BYTE4(v4);
  return result;
}

void sub_2192E4B30(void *a1)
{
}

void sub_2192E4B3C(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void TlvAnnotation::~TlvAnnotation(xpc_object_t *this)
{
  this[4] = 0;
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void TlvAnnotation::TlvAnnotation(TlvAnnotation *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((unsigned char *)this + 24) = 0;
  *((void *)this + 2) = 0;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *((void *)this + 4) = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *((void *)this + 4) = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) != MEMORY[0x263EF86D8])
  {
    xpc_object_t v4 = xpc_null_create();
LABEL_8:
    *((void *)this + 4) = v4;
    goto LABEL_9;
  }
  xpc_retain(v3);
LABEL_9:
  xpc_release(v3);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSet,(unsigned char)17>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v7 = *(unsigned char **)a2;
  unint64_t v6 = *(const unsigned __int8 **)(a2 + 8);
  std::string __p = 0;
  size_t v16 = 0;
  uint64_t v17 = 0;
  tlv::throwIfNotAligned((unint64_t)v7, v6, 2uLL);
  unint64_t v8 = (unint64_t)(v6 - v7) >> 1;
  char v9 = 0;
  if (v8)
  {
    std::vector<unsigned short>::__append((uint64_t)&__p, v8);
    char v9 = __p;
  }
  memcpy(v9, v7, v6 - v7);
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v10 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v10;
  *(_OWORD *)(a3 + 16) = v10;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v11, *(const std::string::value_type **)(a1 + 8));
  if (v6)
  {
    ctl::tlv::print_tlv_field((uint64_t *)&__p, &object);
    xpc_object_t v12 = object;
    xpc_object_t object = xpc_null_create();
    unint64_t v13 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v12;
    xpc_release(v13);
    xpc_release(object);
  }
  else
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  if (__p)
  {
    size_t v16 = __p;
    operator delete(__p);
  }
}

void sub_2192E4D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  TlvAnnotation::~TlvAnnotation(v11);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2192E4DB8(void *a1)
{
}

void sub_2192E4DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (!a10) {
    JUMPOUT(0x2192E4DB0);
  }
  JUMPOUT(0x2192E4DA8);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSet,(unsigned char)17>::build(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  unint64_t v6 = 0;
  __int16 v7 = 0;
  uint64_t v8 = 0;
  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, &v6);
  xpc_release(object);
  xpc_object_t v3 = v6;
  size_t v4 = v7 - v6;
  if (v7 == v6)
  {
    memcpy(0, v6, v7 - v6);
    a2[1] = 0;
    if (!v3) {
      return;
    }
    goto LABEL_6;
  }
  if ((v4 & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  char v5 = (char *)operator new(v7 - v6);
  *a2 = v5;
  a2[1] = &v5[v4];
  a2[2] = &v5[v4];
  memcpy(v5, v3, v4);
  if (v3)
  {
LABEL_6:
    __int16 v7 = v3;
    operator delete(v3);
  }
}

void sub_2192E4EB0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  if (!a9) {
    JUMPOUT(0x2192E4E8CLL);
  }
  JUMPOUT(0x2192E4E80);
}

void sub_2192E4EE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
  {
    operator delete(__p);
    xpc_object_t v12 = *(void **)v10;
    if (!*(void *)v10) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    xpc_object_t v12 = *(void **)v10;
    if (!*(void *)v10) {
      goto LABEL_3;
    }
  }
  *(void *)(v10 + 8) = v12;
  operator delete(v12);
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSetExt,(unsigned char)16>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = *(unsigned __int8 **)a2;
  __int16 v7 = *(const unsigned __int8 **)(a2 + 8);
  std::string __p = 0;
  size_t v19 = 0;
  uint64_t v20 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v6, v7, 1uLL);
  unsigned int v9 = *v6;
  uint64_t v8 = (char *)(v6 + 1);
  unint64_t v10 = 2 * v9;
  tlv::throwIfNotEnoughBytes((unint64_t)v8, v7, v10);
  size_t v11 = 0;
  unint64_t v12 = v9;
  if (v9)
  {
    std::vector<unsigned short>::__append((uint64_t)&__p, v12);
    size_t v11 = __p;
  }
  memcpy(v11, v8, v10);
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v13;
  *(_OWORD *)(a3 + 16) = v13;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v14, *(const std::string::value_type **)(a1 + 8));
  if (&v8[v10])
  {
    ctl::tlv::print_tlv_field((uint64_t *)&__p, &object);
    xpc_object_t v15 = object;
    xpc_object_t object = xpc_null_create();
    size_t v16 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v15;
    xpc_release(v16);
    xpc_release(object);
  }
  else
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  if (__p)
  {
    size_t v19 = __p;
    operator delete(__p);
  }
}

void sub_2192E5060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  TlvAnnotation::~TlvAnnotation(v11);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_2192E509C(void *a1)
{
}

void sub_2192E50AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (!a10) {
    JUMPOUT(0x2192E5094);
  }
  JUMPOUT(0x2192E508CLL);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSetExt,(unsigned char)16>::build(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  __int16 v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, &v7);
  xpc_release(object);
  xpc_object_t v3 = v7;
  size_t v4 = v8 - (unsigned char *)v7;
  int64_t v5 = v8 - (unsigned char *)v7 + 1;
  if (v5 < 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v6 = operator new(v8 - (unsigned char *)v7 + 1);
  bzero(v6, v5);
  *a2 = v6;
  a2[1] = &v6[v5];
  a2[2] = &v6[v5];
  *unint64_t v6 = v4 >> 1;
  memcpy(v6 + 1, v3, v4);
  if (v3)
  {
    uint64_t v8 = v3;
    operator delete(v3);
  }
}

void sub_2192E5198(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  if (!a9) {
    JUMPOUT(0x2192E5170);
  }
  JUMPOUT(0x2192E5164);
}

void sub_2192E51C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
  {
    operator delete(__p);
    unint64_t v12 = *(void **)v10;
    if (!*(void *)v10) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    unint64_t v12 = *(void **)v10;
    if (!*(void *)v10) {
      goto LABEL_3;
    }
  }
  *(void *)(v10 + 8) = v12;
  operator delete(v12);
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::ServiceType,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 v7 = *(char **)a2;
  unint64_t v6 = *(const unsigned __int8 **)(a2 + 8);
  char v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 1uLL);
  char v13 = *v7;
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (char *)-1)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    size_t v11 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_2192E52D0(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E52E4(void *a1)
{
}

void sub_2192E52F4(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

unsigned char *TlvDefinitionImpl<ctl::tlv::ServiceType,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  extract_tlv_field(a1, "fSvcType", 0, &object);
  char v3 = sAttemptDecodeNumber(&object, &v7);
  xpc_release(object);
  size_t v4 = operator new(1uLL);
  *a2 = v4;
  *size_t v4 = v3;
  uint64_t result = v4 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_2192E5380(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E53A8(_Unwind_Exception *exception_object)
{
  char v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::AssignedId,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6 = *(unsigned char **)a2;
  BOOL v7 = *(const unsigned __int8 **)(a2 + 8);
  __int16 v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v6, v7, 1uLL);
  LOBYTE(v13) = *v6;
  tlv::throwIfNotEnoughBytes((unint64_t)(v6 + 1), v7, 1uLL);
  HIBYTE(v13) = v6[1];
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v6 == (unsigned char *)-2)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    size_t v11 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_2192E54B4(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E54C8(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E54DC(void *a1)
{
}

_WORD *TlvDefinitionImpl<ctl::tlv::AssignedId,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  __int16 v5 = 0;
  ctl::tlv::build_tlv_field(a1, &v5);
  char v3 = operator new(2uLL);
  *a2 = v3;
  *char v3 = v5;
  uint64_t result = v3 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_2192E5544(void *a1)
{
}

void sub_2192E5550(_Unwind_Exception *exception_object)
{
  char v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::DataFormat,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v7 = *(unsigned __int8 **)a2;
  unint64_t v6 = *(const unsigned __int8 **)(a2 + 8);
  int v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 1uLL);
  int v13 = *v7;
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (unsigned __int8 *)-1)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    size_t v11 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_2192E5634(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E5648(void *a1)
{
}

void sub_2192E5658(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

unsigned char *TlvDefinitionImpl<ctl::tlv::DataFormat,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  extract_tlv_field(a1, "fFormat", 0, &object);
  char v3 = sAttemptDecodeNumber(&object, &v7);
  xpc_release(object);
  size_t v4 = operator new(1uLL);
  *a2 = v4;
  *size_t v4 = v3;
  uint64_t result = v4 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_2192E56E4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E570C(_Unwind_Exception *exception_object)
{
  char v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::LinkLayerProtocol,(unsigned char)16>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v7 = *(unsigned __int16 **)a2;
  unint64_t v6 = *(const unsigned __int8 **)(a2 + 8);
  int v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 2uLL);
  int v13 = *v7;
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (unsigned __int16 *)-2)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    size_t v11 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_2192E57F0(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E5804(void *a1)
{
}

void sub_2192E5814(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

_WORD *TlvDefinitionImpl<ctl::tlv::LinkLayerProtocol,(unsigned char)16>::build@<X0>(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  extract_tlv_field(a1, "fProtocol", 0, &object);
  __int16 v3 = sAttemptDecodeNumber(&object, &v7);
  xpc_release(object);
  size_t v4 = operator new(2uLL);
  *a2 = v4;
  *size_t v4 = v3;
  uint64_t result = v4 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_2192E58A0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E58C8(_Unwind_Exception *exception_object)
{
  __int16 v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::PowerSaveState,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v7 = *(int **)a2;
  unint64_t v6 = *(const unsigned __int8 **)(a2 + 8);
  int v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 4uLL);
  int v13 = *v7;
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (int *)-4)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    xpc_object_t v10 = object;
    xpc_object_t object = xpc_null_create();
    size_t v11 = *(void **)(a3 + 32);
    *(void *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_2192E59AC(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_2192E59C0(void *a1)
{
}

void sub_2192E59D0(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

_DWORD *TlvDefinitionImpl<ctl::tlv::PowerSaveState,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  int v5 = 0;
  extract_tlv_field(a1, "fHandle", 0, &object);
  tlv::build_tlv_field(&object, &v5);
  xpc_release(object);
  __int16 v3 = operator new(4uLL);
  *a2 = v3;
  *__int16 v3 = v5;
  uint64_t result = v3 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_2192E5A60(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void sub_2192E5A88(_Unwind_Exception *exception_object)
{
  __int16 v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t print_tlv_field@<X0>(unsigned char *a1@<X8>)
{
  return print_tlv_field_as<unsigned short,ctl::LinkLayerProtocol>(a1);
}

{
  long long v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  const std::locale::facet *v7;
  int v8;
  void *v9;
  size_t v10;
  unsigned char *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned char *v15;
  long long v17;
  long long v18;
  long long v19;
  void *__src[2];
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::locale v26;

  char v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&xpc_object_t v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  size_t v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  std::string::size_type v22 = v2;
  size_t v19 = v2;
  *(_OWORD *)__src = v2;
  uint64_t v17 = v2;
  std::string::size_type v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  __int16 v3 = (void *)std::ostream::operator<<();
  size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  int v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 2;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    BOOL v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    long long v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    size_t v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&size_t v23 = __src[1];
      size_t v11 = __src[1];
    }
    unint64_t v12 = __src[0];
    xpc_object_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      xpc_object_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = (const void *)*((void *)&v18 + 1);
    xpc_object_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    int v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      int v13 = v10 | 7;
    }
    long long v14 = v13 + 1;
    xpc_object_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&uint64_t v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

{
  long long v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  const std::locale::facet *v7;
  int v8;
  void *v9;
  size_t v10;
  unsigned char *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned char *v15;
  long long v17;
  long long v18;
  long long v19;
  void *__src[2];
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::locale v26;

  char v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&xpc_object_t v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  size_t v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  std::string::size_type v22 = v2;
  size_t v19 = v2;
  *(_OWORD *)__src = v2;
  uint64_t v17 = v2;
  std::string::size_type v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  __int16 v3 = (void *)std::ostream::operator<<();
  size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  int v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 4;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    BOOL v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    long long v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    size_t v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&size_t v23 = __src[1];
      size_t v11 = __src[1];
    }
    unint64_t v12 = __src[0];
    xpc_object_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      xpc_object_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = (const void *)*((void *)&v18 + 1);
    xpc_object_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    int v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      int v13 = v10 | 7;
    }
    long long v14 = v13 + 1;
    xpc_object_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&uint64_t v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

{
  long long v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  const std::locale::facet *v7;
  int v8;
  void *v9;
  size_t v10;
  unsigned char *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned char *v15;
  long long v17;
  long long v18;
  long long v19;
  void *__src[2];
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::locale v26;

  char v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&xpc_object_t v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  size_t v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  std::string::size_type v22 = v2;
  size_t v19 = v2;
  *(_OWORD *)__src = v2;
  uint64_t v17 = v2;
  std::string::size_type v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  __int16 v3 = (void *)std::ostream::operator<<();
  size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  int v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 8;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    BOOL v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    long long v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    size_t v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&size_t v23 = __src[1];
      size_t v11 = __src[1];
    }
    unint64_t v12 = __src[0];
    xpc_object_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      xpc_object_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = (const void *)*((void *)&v18 + 1);
    xpc_object_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    int v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      int v13 = v10 | 7;
    }
    long long v14 = v13 + 1;
    xpc_object_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&uint64_t v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

{
  long long v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  const std::locale::facet *v7;
  int v8;
  void *v9;
  size_t v10;
  unsigned char *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned char *v15;
  long long v17;
  long long v18;
  long long v19;
  void *__src[2];
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::locale v26;

  char v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&xpc_object_t v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  size_t v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  std::string::size_type v22 = v2;
  size_t v19 = v2;
  *(_OWORD *)__src = v2;
  uint64_t v17 = v2;
  std::string::size_type v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  __int16 v3 = (void *)std::ostream::operator<<();
  size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  int v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 16;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    BOOL v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    long long v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    size_t v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&size_t v23 = __src[1];
      size_t v11 = __src[1];
    }
    unint64_t v12 = __src[0];
    xpc_object_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      xpc_object_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = (const void *)*((void *)&v18 + 1);
    xpc_object_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    int v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      int v13 = v10 | 7;
    }
    long long v14 = v13 + 1;
    xpc_object_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&uint64_t v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

{
  long long v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  const std::locale::facet *v7;
  int v8;
  void *v9;
  size_t v10;
  unsigned char *v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned char *v15;
  long long v17;
  long long v18;
  long long v19;
  void *__src[2];
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::locale v26;

  char v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&xpc_object_t v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  size_t v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  std::string::size_type v22 = v2;
  size_t v19 = v2;
  *(_OWORD *)__src = v2;
  uint64_t v17 = v2;
  std::string::size_type v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  __int16 v3 = (void *)std::ostream::operator<<();
  size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  int v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 16;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    BOOL v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    long long v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    size_t v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&size_t v23 = __src[1];
      size_t v11 = __src[1];
    }
    unint64_t v12 = __src[0];
    xpc_object_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      xpc_object_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = (const void *)*((void *)&v18 + 1);
    xpc_object_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    int v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      int v13 = v10 | 7;
    }
    long long v14 = v13 + 1;
    xpc_object_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&uint64_t v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

uint64_t print_tlv_field_as<unsigned short,ctl::LinkLayerProtocol>(unsigned char *a1)
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  long long v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  long long v22 = v2;
  long long v19 = v2;
  *(_OWORD *)__src = v2;
  long long v17 = v2;
  long long v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  __int16 v3 = (void *)std::ostream::operator<<();
  size_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  uint64_t v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 4;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    BOOL v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    int v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    size_t v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&long long v23 = __src[1];
      size_t v11 = __src[1];
    }
    unint64_t v12 = __src[0];
    size_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    unint64_t v12 = (const void *)*((void *)&v18 + 1);
    size_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    xpc_object_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

void sub_2192E5E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2192E5E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192E5E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ctl::tlv::print_tlv_field(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_tlv_field_as<unsigned char,qmi::ServiceType>(__p);
  if (v13 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  xpc_object_t v6 = xpc_string_create((const char *)v5);
  xpc_object_t v14 = v6;
  if (!v6)
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v14 = v6;
  }
  print_tlv_field_pair("fSvcType", &v14, &value);
  xpc_object_t v7 = *a1;
  xpc_object_t v8 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v8);
  xpc_object_t value = 0;
  xpc_release(v6);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  print_char_type(__p);
  if (v13 >= 0) {
    uint64_t v9 = __p;
  }
  else {
    uint64_t v9 = (void **)__p[0];
  }
  xpc_object_t v10 = xpc_string_create((const char *)v9);
  xpc_object_t v14 = v10;
  if (!v10)
  {
    xpc_object_t v10 = xpc_null_create();
    xpc_object_t v14 = v10;
  }
  print_tlv_field_pair("fClientId", &v14, &value);
  xpc_object_t v11 = value;
  xpc_array_append_value(v7, value);
  xpc_release(v11);
  xpc_object_t value = 0;
  xpc_release(v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *__p[2];
  char v9;
  xpc_object_t v10;
  xpc_object_t value;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_tlv_field_as<unsigned short,ctl::LinkLayerProtocol>(__p);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  xpc_object_t v6 = xpc_string_create((const char *)v5);
  xpc_object_t v10 = v6;
  if (!v6)
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v10 = v6;
  }
  print_tlv_field_pair("fProtocol", &v10, &value);
  xpc_object_t v7 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v7);
  xpc_object_t value = 0;
  xpc_release(v6);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  void **v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *__p[2];
  char v13;
  xpc_object_t v14;
  xpc_object_t value;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_number_field<unsigned int>(__p);
  if (v13 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  xpc_object_t v6 = xpc_string_create((const char *)v5);
  xpc_object_t v14 = v6;
  if (!v6)
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v14 = v6;
  }
  print_tlv_field_pair("fHandle", &v14, &value);
  xpc_object_t v7 = *a1;
  xpc_object_t v8 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v8);
  xpc_object_t value = 0;
  xpc_release(v6);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
  print_tlv_field_as<unsigned char,qmi::ServiceType>(__p);
  if (v13 >= 0) {
    uint64_t v9 = __p;
  }
  else {
    uint64_t v9 = (void **)__p[0];
  }
  xpc_object_t v10 = xpc_string_create((const char *)v9);
  xpc_object_t v14 = v10;
  if (!v10)
  {
    xpc_object_t v10 = xpc_null_create();
    xpc_object_t v14 = v10;
  }
  print_tlv_field_pair("fSvcType", &v14, &value);
  xpc_object_t v11 = value;
  xpc_array_append_value(v7, value);
  xpc_release(v11);
  xpc_object_t value = 0;
  xpc_release(v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *__p[2];
  char v9;
  xpc_object_t v10;
  xpc_object_t value;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_tlv_field_as<unsigned char,qmi::ServiceType>(__p);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  xpc_object_t v6 = xpc_string_create((const char *)v5);
  xpc_object_t v10 = v6;
  if (!v6)
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v10 = v6;
  }
  print_tlv_field_pair("fSvcType", &v10, &value);
  xpc_object_t v7 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v7);
  xpc_object_t value = 0;
  xpc_release(v6);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  long long v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  const std::locale::facet *v10;
  int v11;
  void *v12;
  size_t v13;
  void **v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  xpc_object_t v20;
  xpc_object_t v21;
  void *__dst[2];
  int64_t v23;
  xpc_object_t v24;
  xpc_object_t value;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  void *__p[2];
  long long v31;
  long long v32;
  _OWORD v33[9];
  unint64_t v34;
  std::locale v35;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  std::string::size_type v34 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&uint64_t v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[7] = v5;
  v33[8] = v5;
  v33[5] = v5;
  v33[6] = v5;
  v33[3] = v5;
  v33[4] = v5;
  v33[1] = v5;
  v33[2] = v5;
  std::string v32 = v5;
  v33[0] = v5;
  *(_OWORD *)std::string __p = v5;
  std::string v31 = v5;
  std::string v28 = v5;
  size_t v29 = v5;
  std::locale v26 = v5;
  size_t v27 = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v26);
  *(_DWORD *)((char *)&v26 + *(void *)(v26 - 24) + 8) = *(_DWORD *)((unsigned char *)&v26 + *(void *)(v26 - 24) + 8) & 0xFFFFFFB5 | 2;
  xpc_object_t v6 = (void *)std::ostream::operator<<();
  xpc_object_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" (0x", 4);
  xpc_object_t v8 = *v7;
  *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v7 + *(void *)(v8 - 24) + 24) = 2;
  uint64_t v9 = (char *)v7 + *(void *)(v8 - 24);
  if (*((_DWORD *)v9 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(void *)(v8 - 24)));
    xpc_object_t v10 = std::locale::use_facet(&v35, MEMORY[0x263F8C108]);
    xpc_object_t v11 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
    std::locale::~locale(&v35);
    *((_DWORD *)v9 + 36) = v11;
  }
  *((_DWORD *)v9 + 36) = 48;
  unint64_t v12 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)")", 1);
  if ((BYTE8(v32) & 0x10) != 0)
  {
    xpc_object_t v15 = v32;
    if ((unint64_t)v32 < *((void *)&v29 + 1))
    {
      *(void *)&std::string v32 = *((void *)&v29 + 1);
      xpc_object_t v15 = *((void *)&v29 + 1);
    }
    size_t v16 = (const void *)v29;
    char v13 = v15 - v29;
    if ((unint64_t)(v15 - v29) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_34;
    }
  }
  else
  {
    if ((BYTE8(v32) & 8) == 0)
    {
      char v13 = 0;
      HIBYTE(v23) = 0;
      xpc_object_t v14 = __dst;
      goto LABEL_24;
    }
    size_t v16 = (const void *)*((void *)&v27 + 1);
    char v13 = *((void *)&v28 + 1) - *((void *)&v27 + 1);
    if (*((void *)&v28 + 1) - *((void *)&v27 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_34:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v13 >= 0x17)
  {
    long long v17 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      long long v17 = v13 | 7;
    }
    long long v18 = v17 + 1;
    xpc_object_t v14 = (void **)operator new(v17 + 1);
    __dst[1] = (void *)v13;
    long long v23 = v18 | 0x8000000000000000;
    __dst[0] = v14;
    goto LABEL_23;
  }
  HIBYTE(v23) = v13;
  xpc_object_t v14 = __dst;
  if (v13) {
LABEL_23:
  }
    memmove(v14, v16, v13);
LABEL_24:
  *((unsigned char *)v14 + v13) = 0;
  *(void *)&std::locale v26 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v26 + *(void *)(v26 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v26 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v31) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v33);
  if (v23 >= 0) {
    long long v19 = (const char *)__dst;
  }
  else {
    long long v19 = (const char *)__dst[0];
  }
  uint64_t v20 = xpc_string_create(v19);
  long long v24 = v20;
  if (!v20)
  {
    uint64_t v20 = xpc_null_create();
    long long v24 = v20;
  }
  print_tlv_field_pair("fFormat", &v24, &value);
  uint64_t v21 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v21);
  xpc_object_t value = 0;
  xpc_release(v20);
  if (SHIBYTE(v23) < 0) {
    operator delete(__dst[0]);
  }
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *__p[2];
  char v9;
  xpc_object_t v10;
  xpc_object_t value;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_array_create(0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v3) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_number_field<unsigned int>(__p);
  if (v9 >= 0) {
    uint64_t v5 = __p;
  }
  else {
    uint64_t v5 = (void **)__p[0];
  }
  xpc_object_t v6 = xpc_string_create((const char *)v5);
  xpc_object_t v10 = v6;
  if (!v6)
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v10 = v6;
  }
  print_tlv_field_pair("fHandle", &v10, &value);
  xpc_object_t v7 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v7);
  xpc_object_t value = 0;
  xpc_release(v6);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
}

void sub_2192E6038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_release(v19);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

void xpc::array::~array(xpc_object_t *this)
{
  *this = 0;
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, unsigned char *a2)
{
  extract_tlv_field(a1, "fSvcType", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v6);
  xpc_release(object);
  extract_tlv_field(a1, "fClientId", 1uLL, &object);
  tlv::build_tlv_field(&object, a2 + 1);
  xpc_release(object);
  return 2;
}

{
  xpc_object_t object;
  BOOL v5;

  extract_tlv_field(a1, "fSvcType", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v5);
  xpc_release(object);
  return 1;
}

void sub_2192E61B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E6330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  uint64_t v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, _DWORD *a2)
{
  extract_tlv_field(a1, "fProtocol", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v5);
  xpc_release(object);
  return 1;
}

{
  xpc_object_t object;
  BOOL v5;

  extract_tlv_field(a1, "fFormat", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v5);
  xpc_release(object);
  return 1;
}

{
  xpc_object_t object;

  extract_tlv_field(a1, "fHandle", 0, &object);
  tlv::build_tlv_field(&object, a2);
  xpc_release(object);
  return 1;
}

void sub_2192E63FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E65FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_release(v19);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, uint64_t a2)
{
  extract_tlv_field(a1, "fHandle", 0, &object);
  tlv::build_tlv_field(&object, (_DWORD *)a2);
  xpc_release(object);
  extract_tlv_field(a1, "fSvcType", 1uLL, &object);
  *(unsigned char *)(a2 + 4) = sAttemptDecodeNumber(&object, &v6);
  xpc_release(object);
  return 2;
}

void sub_2192E6740(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void ctl::tlv::print_tlv_field(uint64_t *a1@<X0>, xpc_object_t *a2@<X8>)
{
  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v5) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_tlv_field<unsigned short>(&object, a1);
  xpc_object_t v7 = object;
  xpc_object_t v10 = object;
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v10 = v7;
  }
  print_tlv_field_pair("fEnabledIndSet", &v10, &value);
  xpc_object_t v8 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v8);
  xpc_object_t value = 0;
  xpc_release(v7);
  xpc_object_t v10 = 0;
  xpc_release(object);
}

{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t object;
  xpc_object_t v10;
  xpc_object_t value;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v5) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_tlv_field<unsigned short>(&object, a1);
  xpc_object_t v7 = object;
  xpc_object_t v10 = object;
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v10 = v7;
  }
  print_tlv_field_pair("fEnabledIndSet", &v10, &value);
  xpc_object_t v8 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v8);
  xpc_object_t value = 0;
  xpc_release(v7);
  xpc_object_t v10 = 0;
  xpc_release(object);
}

void sub_2192E689C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12)
{
  xpc_object_t v15 = v14;
  xpc_release(v15);
  xpc_release(v13);
  xpc_release(object);
  xpc::array::~array(v12);
  _Unwind_Resume(a1);
}

void print_tlv_field<unsigned short>(xpc_object_t *a1, uint64_t *a2)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_array_create(0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a1 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a1 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v5) == MEMORY[0x263EF86D8])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a1 = v6;
LABEL_9:
  xpc_release(v5);
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  if (*a2 != v8)
  {
    do
    {
      print_number_field<unsigned short>(__p);
      if (v12 >= 0) {
        uint64_t v9 = __p;
      }
      else {
        uint64_t v9 = (void **)__p[0];
      }
      xpc_object_t v10 = xpc_string_create((const char *)v9);
      if (!v10) {
        xpc_object_t v10 = xpc_null_create();
      }
      xpc_array_append_value(*a1, v10);
      xpc_release(v10);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
      v7 += 2;
    }
    while (v7 != v8);
  }
}

void sub_2192E6A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  xpc_release(v16);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v15);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v15);
  _Unwind_Resume(a1);
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, void *a2)
{
  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, a2);
  xpc_release(object);
  return 1;
}

{
  xpc_object_t object;

  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, a2);
  xpc_release(object);
  return 1;
}

void sub_2192E6AE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void tlv::build_tlv_field<unsigned short>(void *a1, void *a2)
{
  tlv::throwIfNotArray(a1);
  xpc_object_t v4 = (xpc_object_t)*a1;
  uint64_t v5 = MEMORY[0x263EF86D8];
  if (*a1 && MEMORY[0x21D4876E0](*a1) == v5) {
    xpc_retain(v4);
  }
  else {
    xpc_object_t v4 = xpc_null_create();
  }
  uint64_t v7 = (char *)*a2;
  uint64_t v6 = a2[1];
  xpc_object_t xarray = v4;
  if (MEMORY[0x21D4876E0](v4) == v5) {
    size_t count = xpc_array_get_count(v4);
  }
  else {
    size_t count = 0;
  }
  unint64_t v9 = count + ((v6 - (uint64_t)v7) >> 1);
  xpc_object_t v10 = (char *)*a2;
  if (v9 <= (uint64_t)(a2[2] - *a2) >> 1) {
    goto LABEL_20;
  }
  if ((v9 & 0x8000000000000000) != 0) {
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  }
  xpc_object_t v11 = (unsigned char *)a2[1];
  char v12 = (char *)operator new(2 * v9);
  uint64_t v13 = v11 - v10;
  xpc_object_t v14 = &v12[(v11 - v10) & 0xFFFFFFFFFFFFFFFELL];
  xpc_object_t v15 = v14;
  if (v11 != v10)
  {
    if ((unint64_t)(v13 - 2) < 0x1E)
    {
      xpc_object_t v15 = &v12[(v11 - v10) & 0xFFFFFFFFFFFFFFFELL];
      do
      {
LABEL_17:
        __int16 v24 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v15 - 1) = v24;
        v15 -= 2;
      }
      while (v11 != v10);
      goto LABEL_18;
    }
    xpc_object_t v15 = &v12[(v11 - v10) & 0xFFFFFFFFFFFFFFFELL];
    if ((unint64_t)(v11 - &v12[v13 & 0xFFFFFFFFFFFFFFFELL]) < 0x20) {
      goto LABEL_17;
    }
    uint64_t v16 = v13 >> 1;
    unint64_t v17 = ((unint64_t)(v13 - 2) >> 1) + 1;
    unint64_t v18 = 2 * (v17 & 0xFFFFFFFFFFFFFFF0);
    long long v19 = &v11[-v18];
    xpc_object_t v15 = &v14[-v18];
    uint64_t v20 = &v12[2 * v16 - 16];
    uint64_t v21 = (long long *)(v11 - 16);
    unint64_t v22 = v17 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v23 = *v21;
      *((_OWORD *)v20 - 1) = *(v21 - 1);
      *(_OWORD *)uint64_t v20 = v23;
      v20 -= 32;
      v21 -= 2;
      v22 -= 16;
    }
    while (v22);
    xpc_object_t v11 = v19;
    if (v17 != (v17 & 0xFFFFFFFFFFFFFFF0)) {
      goto LABEL_17;
    }
  }
LABEL_18:
  *a2 = v15;
  a2[1] = v14;
  a2[2] = &v12[2 * v9];
  if (v10) {
    operator delete(v10);
  }
LABEL_20:
  if (xarray)
  {
    xpc_retain(xarray);
    xpc_object_t v25 = xarray;
LABEL_23:
    xpc_retain(v25);
    std::locale v26 = v25;
    goto LABEL_24;
  }
  xpc_object_t v25 = xpc_null_create();
  if (v25) {
    goto LABEL_23;
  }
  xpc_object_t v25 = xpc_null_create();
  std::locale v26 = 0;
LABEL_24:
  xpc_release(v26);
  if (xarray)
  {
    xpc_retain(xarray);
    xpc_object_t v27 = xarray;
  }
  else
  {
    xpc_object_t v27 = xpc_null_create();
  }
  if (MEMORY[0x21D4876E0](xarray) == v5)
  {
    size_t v28 = xpc_array_get_count(xarray);
    if (v27) {
      goto LABEL_29;
    }
LABEL_31:
    xpc_object_t v53 = xpc_null_create();
    goto LABEL_32;
  }
  size_t v28 = 0;
  if (!v27) {
    goto LABEL_31;
  }
LABEL_29:
  xpc_retain(v27);
  xpc_object_t v53 = v27;
LABEL_32:
  xpc_release(v27);
  if (v28 || v25 != v53)
  {
    size_t v29 = 0;
    while (1)
    {
      std::string v31 = (char *)a2[1];
      unint64_t v30 = a2[2];
      if ((unint64_t)v31 >= v30) {
        break;
      }
      *(_WORD *)std::string v31 = 0;
      uint64_t v32 = (uint64_t)(v31 + 2);
LABEL_57:
      a2[1] = v32;
      xpc_object_t value = xpc_array_get_value(v25, v29);
      xpc_object_t object = value;
      if (value) {
        xpc_retain(value);
      }
      else {
        xpc_object_t object = xpc_null_create();
      }
      tlv::build_tlv_field(&object, (_WORD *)(a2[1] - 2));
      xpc_release(object);
      if (++v29 == v28 && v25 == v53) {
        goto LABEL_62;
      }
    }
    uint64_t v33 = (char *)*a2;
    uint64_t v34 = (uint64_t)&v31[-*a2];
    if (v34 <= -3) {
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v35 = v34 >> 1;
    unint64_t v36 = v30 - (void)v33;
    if (v36 <= (v34 >> 1) + 1) {
      unint64_t v37 = v35 + 1;
    }
    else {
      unint64_t v37 = v36;
    }
    if (v36 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v38 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v38 = v37;
    }
    if (v38)
    {
      if (v38 < 0) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      v39 = operator new(2 * v38);
      v40 = &v39[2 * v35];
      _WORD *v40 = 0;
      uint64_t v32 = (uint64_t)(v40 + 1);
      int64_t v41 = v31 - v33;
      if (v31 == v33) {
        goto LABEL_55;
      }
    }
    else
    {
      v39 = 0;
      v40 = (_WORD *)(2 * v35);
      *(_WORD *)(2 * v35) = 0;
      uint64_t v32 = 2 * v35 + 2;
      int64_t v41 = v31 - v33;
      if (v31 == v33)
      {
LABEL_55:
        *a2 = v40;
        a2[1] = v32;
        a2[2] = &v39[2 * v38];
        if (v33) {
          operator delete(v33);
        }
        goto LABEL_57;
      }
    }
    unint64_t v42 = v41 - 2;
    if (v42 < 0x1E) {
      goto LABEL_69;
    }
    if (v31 - v39 - (v34 & 0xFFFFFFFFFFFFFFFELL) < 0x20) {
      goto LABEL_69;
    }
    uint64_t v43 = (v42 >> 1) + 1;
    unint64_t v44 = 2 * (v43 & 0xFFFFFFFFFFFFFFF0);
    v45 = &v31[-v44];
    v40 = (_WORD *)((char *)v40 - v44);
    v46 = &v39[2 * v35 - 16];
    v47 = v31 - 16;
    unint64_t v48 = v43 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      long long v49 = *(_OWORD *)v47;
      *(v46 - 1) = *((_OWORD *)v47 - 1);
      _OWORD *v46 = v49;
      v46 -= 2;
      v47 -= 32;
      v48 -= 16;
    }
    while (v48);
    std::string v31 = v45;
    if (v43 != (v43 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_69:
      do
      {
        __int16 v50 = *((_WORD *)v31 - 1);
        v31 -= 2;
        *--v40 = v50;
      }
      while (v31 != v33);
    }
    goto LABEL_55;
  }
LABEL_62:
  xpc_release(v53);
  xpc_release(v25);
  xpc_release(xarray);
}

void sub_2192E6F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11)
{
  xpc_release(v12);
  xpc_release(v11);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_2192E6F74(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
}

void sub_2192E70BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12)
{
  xpc_object_t v15 = v14;
  xpc_release(v15);
  xpc_release(v13);
  xpc_release(object);
  xpc::array::~array(v12);
  _Unwind_Resume(a1);
}

void sub_2192E7178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void sub_2192E72E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  uint64_t v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

void sub_2192E73AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E783C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18)
{
  std::locale::~locale((std::locale *)(v19 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a18);
  xpc::array::~array(v18);
  _Unwind_Resume(a1);
}

void sub_2192E793C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
}

void sub_2192E7AA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  uint64_t v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

void sub_2192E7B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_2192E7CF4(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x21D487470](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](a1 + 112);
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t print_tlv_field_as<unsigned char,qmi::ServiceType>(unsigned char *a1)
{
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[7] = v2;
  v26[8] = v2;
  v26[5] = v2;
  v26[6] = v2;
  v26[3] = v2;
  v26[4] = v2;
  v26[1] = v2;
  v26[2] = v2;
  long long v25 = v2;
  v26[0] = v2;
  *(_OWORD *)std::string __p = v2;
  long long v24 = v2;
  long long v21 = v2;
  *(_OWORD *)__src = v2;
  long long v19 = v2;
  long long v20 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v19);
  *(_DWORD *)((char *)&v19 + *(void *)(v19 - 24) + 8) = *(_DWORD *)((unsigned char *)&v19 + *(void *)(v19 - 24) + 8) & 0xFFFFFFB5 | 2;
  uint64_t v3 = qmi::asShortString();
  size_t v4 = strlen(v3);
  uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)v3, v4);
  uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)" (0x", 4);
  uint64_t v7 = *v6;
  *(_DWORD *)((char *)v6 + *(void *)(*v6 - 24) + 8) = *(_DWORD *)((unsigned char *)v6 + *(void *)(*v6 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v6 + *(void *)(v7 - 24) + 24) = 2;
  uint64_t v8 = (char *)v6 + *(void *)(v7 - 24);
  if (*((_DWORD *)v8 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v6 + *(void *)(v7 - 24)));
    unint64_t v9 = std::locale::use_facet(&v28, MEMORY[0x263F8C108]);
    int v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 32);
    std::locale::~locale(&v28);
    *((_DWORD *)v8 + 36) = v10;
  }
  *((_DWORD *)v8 + 36) = 48;
  xpc_object_t v11 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)")", 1);
  if ((BYTE8(v25) & 0x10) != 0)
  {
    uint64_t v13 = (unsigned char *)v25;
    if ((void *)v25 < __src[1])
    {
      *(void **)&long long v25 = __src[1];
      uint64_t v13 = __src[1];
    }
    xpc_object_t v14 = __src[0];
    size_t v12 = v13 - (char *)__src[0];
    if ((unint64_t)(v13 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v25) & 8) == 0)
    {
      size_t v12 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    xpc_object_t v14 = (const void *)*((void *)&v20 + 1);
    size_t v12 = *((void *)&v21 + 1) - *((void *)&v20 + 1);
    if (*((void *)&v21 + 1) - *((void *)&v20 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v12 >= 0x17)
  {
    uint64_t v15 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v15 = v12 | 7;
    }
    uint64_t v16 = v15 + 1;
    unint64_t v17 = operator new(v15 + 1);
    *((void *)a1 + 1) = v12;
    *((void *)a1 + 2) = v16 | 0x8000000000000000;
    *(void *)a1 = v17;
    a1 = v17;
    goto LABEL_15;
  }
  a1[23] = v12;
  if (v12) {
LABEL_15:
  }
    memmove(a1, v14, v12);
LABEL_16:
  a1[v12] = 0;
  *(void *)&long long v19 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v19 + *(void *)(v19 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v19 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v26);
}

void sub_2192E81D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2192E81EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192E8200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
}

std::runtime_error *tlv::TlvBuildException::TlvBuildException(std::runtime_error *a1, const std::string *a2)
{
  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABA78;
  return result;
}

{
  std::runtime_error *result;

  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABA78;
  return result;
}

std::runtime_error *tlv::TlvBuildException::TlvBuildException(std::runtime_error *this, const char *a2)
{
  uint64_t result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABA78;
  return result;
}

{
  std::runtime_error *result;

  uint64_t result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABA78;
  return result;
}

void tlv::TlvBuildException::~TlvBuildException(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  operator delete(v1);
}

std::runtime_error *tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(std::runtime_error *a1, const std::string *a2)
{
  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
  return result;
}

{
  std::runtime_error *result;

  uint64_t result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
  return result;
}

std::runtime_error *tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(std::runtime_error *this, const char *a2)
{
  uint64_t result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
  return result;
}

{
  std::runtime_error *result;

  uint64_t result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
  return result;
}

void tlv::TlvBuildUnexpectedField::~TlvBuildUnexpectedField(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);

  operator delete(v1);
}

size_t tlv::throwIfBinarySizeNotEqual(xpc_object_t *a1, uint64_t a2)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_8;
  }
  if (MEMORY[0x21D4876E0](*a1) != MEMORY[0x263EF86F8])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object encountered, but not a XPC_TYPE_DATA as expected");
    goto LABEL_8;
  }
  size_t result = xpc_data_get_length(*a1);
  if (result != a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object does not have exactly the right number of elements!");
LABEL_8:
  }
  return result;
}

void sub_2192E8500(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E8514(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E8528(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::throwIfNotArray(void *a1)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_6;
  }
  uint64_t result = MEMORY[0x21D4876E0](*a1);
  if (result != MEMORY[0x263EF86D8])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object encountered, but not a XPC_TYPE_ARRAY as expected");
LABEL_6:
  }
  return result;
}

void sub_2192E85E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E85F4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::tryParseNumber(xpc_object_t *a1, unint64_t *a2)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
  }
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  if (v4 == MEMORY[0x263EF8738])
  {
    uint64_t value = xpc_int64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x263EF87A0])
  {
    uint64_t value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x263EF86E0])
  {
    xpc_object_t v8 = *a1;
    return xpc_BOOL_get_value(v8);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263EF8798];
    if (v4 == MEMORY[0x263EF8798])
    {
      memset(__p, 170, sizeof(__p));
      if (MEMORY[0x21D4876E0](*a1) == v5)
      {
        string_ptr = (char *)xpc_string_get_string_ptr(*a1);
        size_t length = xpc_string_get_length(*a1);
        std::string::basic_string[abi:ne180100](__p, string_ptr, length);
      }
      else
      {
        memset(__p, 0, sizeof(__p));
      }
      char v14 = 0;
      BOOL v11 = sAttemptDecodeNumber((uint64_t)__p, a2, &v14);
      if (v14) {
        BOOL v12 = v11;
      }
      else {
        BOOL v12 = 0;
      }
      if (v12)
      {
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
        return 1;
      }
      else
      {
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
}

void sub_2192E87EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL sAttemptDecodeNumber(uint64_t a1, unint64_t *a2, unsigned char *a3)
{
  size_t __idx = 0;
  *a2 = std::stoull((const std::string *)a1, &__idx, 0);
  *a3 = 1;
  uint64_t v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  return __idx == v5;
}

uint64_t tlv::tryParseNumber(xpc_object_t *a1, void *a2)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
  }
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  if (v4 == MEMORY[0x263EF8738])
  {
    uint64_t value = xpc_int64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x263EF87A0])
  {
    uint64_t value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x263EF86E0])
  {
    xpc_object_t v8 = *a1;
    return xpc_BOOL_get_value(v8);
  }
  else
  {
    uint64_t v5 = MEMORY[0x263EF8798];
    if (v4 != MEMORY[0x263EF8798]) {
      return 0;
    }
    memset(__p, 170, sizeof(__p));
    if (MEMORY[0x21D4876E0](*a1) == v5)
    {
      string_ptr = (char *)xpc_string_get_string_ptr(*a1);
      size_t length = xpc_string_get_length(*a1);
      std::string::basic_string[abi:ne180100](__p, string_ptr, length);
    }
    else
    {
      memset(__p, 0, sizeof(__p));
    }
    unint64_t v12 = 0;
    if (sAttemptDecodeNumber((uint64_t)__p, &v12, &v13))
    {
      *a2 = v12;
      if (SHIBYTE(__p[2]) < 0) {
        operator delete(__p[0]);
      }
      return 1;
    }
    else
    {
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0) {
        return 0;
      }
      operator delete(__p[0]);
      return 0;
    }
  }
}

void sub_2192E8AF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t tlv::parseEnumString(xpc_object_t *a1)
{
  return sAttemptDecodeNumber(a1, &v2);
}

uint64_t sAttemptDecodeNumber(xpc_object_t *a1, BOOL *a2)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_51;
  }
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  if (v4 == MEMORY[0x263EF8738])
  {
    int64_t value = xpc_int64_get_value(*a1);
    *a2 = value >= 0;
    return value;
  }
  if (v4 != MEMORY[0x263EF87A0])
  {
    if (v4 != MEMORY[0x263EF86E0])
    {
      uint64_t v5 = MEMORY[0x263EF8798];
      if (v4 == MEMORY[0x263EF8798])
      {
        memset(__p, 170, sizeof(__p));
        if (MEMORY[0x21D4876E0](*a1) == v5)
        {
          string_ptr = (char *)xpc_string_get_string_ptr(*a1);
          size_t length = xpc_string_get_length(*a1);
          std::string::basic_string[abi:ne180100](__p, string_ptr, length);
        }
        else
        {
          memset(__p, 0, sizeof(__p));
        }
        int64_t v30 = 0;
        if (sAttemptDecodeNumber((uint64_t)__p, (unint64_t *)&v30, a2))
        {
LABEL_46:
          int64_t value = v30;
          if (SHIBYTE(__p[2]) < 0) {
            operator delete(__p[0]);
          }
          return value;
        }
        unint64_t v11 = HIBYTE(__p[2]);
        unint64_t v12 = (char *)__p[1];
        if (SHIBYTE(__p[2]) >= 0) {
          size_t v13 = HIBYTE(__p[2]);
        }
        else {
          size_t v13 = (size_t)__p[1];
        }
        if (!v13) {
          goto LABEL_49;
        }
        char v14 = (void **)__p[0];
        if (SHIBYTE(__p[2]) >= 0) {
          uint64_t v15 = __p;
        }
        else {
          uint64_t v15 = (void **)__p[0];
        }
        uint64_t v16 = memchr(v15, 40, v13);
        unint64_t v17 = v16 - (unsigned char *)v15;
        if (!v16) {
          unint64_t v17 = -1;
        }
        do
        {
          if (!v13) {
            goto LABEL_49;
          }
          int v18 = *((unsigned __int8 *)v15 + --v13);
        }
        while (v18 != 41);
        if (v17 >= v13 || v13 == -1)
        {
LABEL_49:
          std::locale v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v26, "String, but could not find a valid number");
          v26->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
        }
        if ((v11 & 0x80) != 0)
        {
          if ((unint64_t)v12 > v17)
          {
LABEL_32:
            unint64_t v19 = v17 + 1;
            long long v20 = (char *)(~v17 + v13);
            if (&v12[-v19] >= v20) {
              size_t v21 = (size_t)v20;
            }
            else {
              size_t v21 = (size_t)&v12[-v19];
            }
            if (v21 >= 0x7FFFFFFFFFFFFFF8) {
              std::string::__throw_length_error[abi:ne180100]();
            }
            if (v21 >= 0x17)
            {
              uint64_t v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v21 | 7) != 0x17) {
                uint64_t v23 = v21 | 7;
              }
              uint64_t v24 = v23 + 1;
              unint64_t v22 = (void **)operator new(v23 + 1);
              __dst[1] = (void *)v21;
              unint64_t v29 = v24 | 0x8000000000000000;
              __dst[0] = v22;
            }
            else
            {
              HIBYTE(v29) = v21;
              unint64_t v22 = __dst;
              if (!v21)
              {
LABEL_43:
                *((unsigned char *)v22 + v21) = 0;
                BOOL v25 = sAttemptDecodeNumber((uint64_t)__dst, (unint64_t *)&v30, a2);
                if (SHIBYTE(v29) < 0) {
                  operator delete(__dst[0]);
                }
                if (v25) {
                  goto LABEL_46;
                }
                goto LABEL_49;
              }
            }
            memmove(v22, (char *)v14 + v19, v21);
            goto LABEL_43;
          }
        }
        else if (v17 < v11)
        {
          char v14 = __p;
          unint64_t v12 = (char *)v11;
          goto LABEL_32;
        }
        std::string::__throw_out_of_range[abi:ne180100]();
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Non-number type encountered.");
LABEL_51:
    }
    *a2 = 1;
    return xpc_BOOL_get_value(*a1);
  }
  *a2 = 1;
  xpc_object_t v7 = *a1;

  return xpc_uint64_get_value(v7);
}

void sub_2192E8EC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((a22 & 0x80000000) == 0) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if ((a22 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a17);
  _Unwind_Resume(exception_object);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, BOOL *a2)
{
  BOOL v6 = 0;
  uint64_t result = sAttemptDecodeNumber(a1, &v6);
  if (!v6 || result > 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Bool field is a number but out of range");
  }
  *a2 = result != 0;
  return result;
}

void sub_2192E8FE0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, unsigned char *a2)
{
  uint64_t result = sAttemptDecodeNumber(a1, &v5);
  if (result != (char)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Int8 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v5;

  BOOL v5 = 0;
  uint64_t result = sAttemptDecodeNumber(a1, &v5);
  if (!v5 || result > 0xFF)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt8 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

void sub_2192E9068(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E90FC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, _WORD *a2)
{
  uint64_t result = sAttemptDecodeNumber(a1, &v5);
  if (result != (__int16)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Int16 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v6;

  BOOL v6 = 0;
  uint64_t result = sAttemptDecodeNumber(a1, &v6);
  if (!v6 || result >> 16 != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt16 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

void sub_2192E9184(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E921C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, _DWORD *a2)
{
  uint64_t result = sAttemptDecodeNumber(a1, &v5);
  if (result != (int)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Bool field is a number but out of range");
  }
  *a2 = result;
  return result;
}

{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v6;

  BOOL v6 = 0;
  uint64_t result = sAttemptDecodeNumber(a1, &v6);
  if (!v6 || HIDWORD(result) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt32 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

void sub_2192E92A4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E933C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, uint64_t *a2)
{
  BOOL v5 = 0;
  uint64_t result = sAttemptDecodeNumber(a1, &v5);
  *a2 = result;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt64 field is a number but is negative");
  }
  return result;
}

void sub_2192E93C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float tlv::build_tlv_field(xpc_object_t *a1, float *a2)
{
  double v4 = NAN;
  tlv::build_tlv_field(a1, &v4);
  float result = v4;
  *a2 = result;
  return result;
}

void tlv::build_tlv_field(xpc_object_t *a1, double *a2)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_19;
  }
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  if (v4 == MEMORY[0x263EF8738])
  {
    double value = (double)xpc_int64_get_value(*a1);
LABEL_13:
    *a2 = value;
    return;
  }
  if (v4 == MEMORY[0x263EF87A0])
  {
    double value = (double)xpc_uint64_get_value(*a1);
    goto LABEL_13;
  }
  if (v4 == MEMORY[0x263EF86E0])
  {
    double value = (double)xpc_BOOL_get_value(*a1);
    goto LABEL_13;
  }
  if (v4 == MEMORY[0x263EF8710])
  {
    double value = xpc_double_get_value(*a1);
    goto LABEL_13;
  }
  uint64_t v5 = MEMORY[0x263EF8798];
  if (v4 != MEMORY[0x263EF8798])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Non-number type encountered.");
LABEL_19:
  }
  memset(&__str, 170, sizeof(__str));
  if (MEMORY[0x21D4876E0](*a1) == v5)
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    size_t length = xpc_string_get_length(*a1);
    std::string::basic_string[abi:ne180100](&__str, string_ptr, length);
  }
  else
  {
    memset(&__str, 0, sizeof(__str));
  }
  *a2 = std::stod(&__str, 0);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_2192E95D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_free_exception(v15);
  _Unwind_Resume(a1);
}

double tlv::build_tlv_field(xpc_object_t *a1, uint64_t a2)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
LABEL_46:
  }
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  uint64_t v5 = MEMORY[0x263EF8798];
  if (v4 != MEMORY[0x263EF8798])
  {
LABEL_44:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "String expected but got something else.");
    goto LABEL_46;
  }
  memset(__p, 170, sizeof(__p));
  if (MEMORY[0x21D4876E0](*a1) != v5)
  {
    char v7 = 0;
    memset(__p, 0, sizeof(__p));
    goto LABEL_21;
  }
  string_ptr = (char *)xpc_string_get_string_ptr(*a1);
  size_t length = xpc_string_get_length(*a1);
  std::string::basic_string[abi:ne180100](__p, string_ptr, length);
  char v7 = HIBYTE(__p[2]);
  char v14 = (void **)__p[0];
  uint64_t v15 = (char *)__p[1];
  unint64_t v18 = HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    size_t v12 = HIBYTE(__p[2]);
  }
  else {
    size_t v12 = (size_t)__p[1];
  }
  if (!v12)
  {
LABEL_21:
    int v13 = 1;
    if (v7 < 0) {
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (SHIBYTE(__p[2]) >= 0) {
    xpc_object_t v8 = __p;
  }
  else {
    xpc_object_t v8 = (void **)__p[0];
  }
  uint64_t v9 = memchr(v8, 34, v12);
  unint64_t v10 = v9 - (unsigned char *)v8;
  if (!v9) {
    unint64_t v10 = -1;
  }
  do
  {
    if (!v12)
    {
      int v13 = 1;
      goto LABEL_24;
    }
    int v11 = *((unsigned __int8 *)v8 + --v12);
  }
  while (v11 != 34);
  int v13 = 1;
  if (v10 >= v12 || v12 == -1)
  {
LABEL_24:
    if ((v7 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if ((v7 & 0x80) == 0)
  {
    if (v10 < v18)
    {
      char v14 = __p;
      uint64_t v15 = (char *)v18;
      goto LABEL_29;
    }
LABEL_47:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if ((unint64_t)v15 <= v10) {
    goto LABEL_47;
  }
LABEL_29:
  unint64_t v19 = v10 + 1;
  long long v20 = (char *)(~v10 + v12);
  if (&v15[-v19] >= v20) {
    size_t v21 = (size_t)v20;
  }
  else {
    size_t v21 = (size_t)&v15[-v19];
  }
  if (v21 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v21 >= 0x17)
  {
    uint64_t v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17) {
      uint64_t v23 = v21 | 7;
    }
    uint64_t v24 = v23 + 1;
    unint64_t v22 = (long long *)operator new(v23 + 1);
    *((void *)&v26 + 1) = v21;
    unint64_t v27 = v24 | 0x8000000000000000;
    *(void *)&long long v26 = v22;
  }
  else
  {
    HIBYTE(v27) = v21;
    unint64_t v22 = &v26;
    if (!v21) {
      goto LABEL_40;
    }
  }
  memmove(v22, (char *)v14 + v19, v21);
LABEL_40:
  *((unsigned char *)v22 + v21) = 0;
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  int v13 = 0;
  double result = *(double *)&v26;
  *(_OWORD *)a2 = v26;
  *(void *)(a2 + 16) = v27;
  if ((HIBYTE(__p[2]) & 0x80) == 0) {
    goto LABEL_26;
  }
LABEL_25:
  operator delete(__p[0]);
LABEL_26:
  if (v13) {
    goto LABEL_44;
  }
  return result;
}

{
  void *v3;
  double result;
  long long v5;
  uint64_t v6;

  sAttemptToDecodeData((unint64_t *)&v5, a1);
  uint64_t v3 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + 8) = v3;
    operator delete(v3);
  }
  double result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(void *)(a2 + 16) = v6;
  return result;
}

void sub_2192E9950(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192E996C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192E9980(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sAttemptToDecodeData(unint64_t *a1, xpc_object_t *a2)
{
  if (MEMORY[0x21D4876E0](*a2) == MEMORY[0x263EF8758])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
LABEL_61:
  }
  uint64_t v4 = MEMORY[0x21D4876E0](*a2);
  xpc_object_t v5 = *a2;
  if (v4 == MEMORY[0x263EF86F8])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(*a2);
    a1[1] = 0;
    a1[2] = 0;
    *a1 = 0;
    if (length)
    {
      size_t v13 = length;
      if ((length & 0x8000000000000000) != 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      char v14 = (char *)operator new(length);
      *a1 = (unint64_t)v14;
      uint64_t v15 = &v14[v13];
      a1[2] = (unint64_t)&v14[v13];
      memcpy(v14, bytes_ptr, v13);
      a1[1] = (unint64_t)v15;
    }
    return;
  }
  uint64_t v6 = MEMORY[0x21D4876E0](v5);
  uint64_t v7 = MEMORY[0x263EF8798];
  if (v6 != MEMORY[0x263EF8798])
  {
LABEL_59:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Non-data type encountered.");
    goto LABEL_61;
  }
  memset(__p, 170, sizeof(__p));
  if (MEMORY[0x21D4876E0](*a2) == v7)
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a2);
    size_t v17 = xpc_string_get_length(*a2);
    std::string::basic_string[abi:ne180100](__p, string_ptr, v17);
    unsigned int v10 = HIBYTE(__p[2]);
    uint64_t v9 = (void **)__p[0];
    xpc_object_t v8 = (const char *)__p[1];
  }
  else
  {
    xpc_object_t v8 = 0;
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    memset(__p, 0, sizeof(__p));
  }
  if ((v10 & 0x80u) == 0) {
    unint64_t v18 = __p;
  }
  else {
    unint64_t v18 = v9;
  }
  if ((v10 & 0x80u) == 0) {
    unint64_t v19 = (const char *)v10;
  }
  else {
    unint64_t v19 = v8;
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  ctu::parse_hex_impl((ctu *)v18, v19, 1, 0, &v39);
  unint64_t v20 = v39;
  *a1 = v39;
  size_t v21 = (void *)v40;
  *(_OWORD *)(a1 + 1) = v40;
  unint64_t v22 = v21;
  if ((void *)v20 != v21) {
    goto LABEL_17;
  }
  uint64_t v24 = HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0) {
    BOOL v25 = __p;
  }
  else {
    BOOL v25 = (void **)__p[0];
  }
  if (SHIBYTE(__p[2]) < 0) {
    uint64_t v24 = (uint64_t)__p[1];
  }
  if (!v24)
  {
LABEL_55:
    if (v22)
    {
      a1[1] = (unint64_t)v22;
      operator delete(v22);
    }
    char v23 = 1;
    if (SHIBYTE(__p[2]) < 0) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v26 = (void **)((char *)v25 + v24);
  unint64_t v27 = v25;
  std::locale v28 = (void **)((char *)v25 + v24);
  while (2)
  {
    for (i = (void **)((char *)v27 + 2); ; i = (void **)((char *)i + 1))
    {
      unint64_t v27 = (void **)((char *)i - 1);
      if (*((unsigned char *)i - 2) != 93)
      {
        if (v27 == v26) {
          goto LABEL_38;
        }
        continue;
      }
      if (v27 == v26) {
        goto LABEL_38;
      }
      if (*(unsigned char *)v27 == 58) {
        break;
      }
    }
    if (i != v26)
    {
      if (*(unsigned char *)i == 32) {
        std::locale v28 = (void **)((char *)i - 2);
      }
      continue;
    }
    break;
  }
LABEL_38:
  if (v28 == v26 || (int64_t v30 = (char *)v28 - (char *)v25, v30 == -1))
  {
    if (v24 >= 9)
    {
      uint64_t v33 = v25;
      while (1)
      {
        uint64_t v34 = (void **)memchr(v33, 91, v24 - 8);
        if (!v34) {
          break;
        }
        if (*v34 == (void *)0x736574796220305BLL && *((unsigned char *)v34 + 8) == 93)
        {
          if (v34 != v26 && (char *)v34 - (char *)v25 != -1) {
            goto LABEL_17;
          }
          goto LABEL_55;
        }
        uint64_t v33 = (void **)((char *)v34 + 1);
        uint64_t v24 = (char *)v26 - (char *)v33;
        if ((char *)v26 - (char *)v33 < 9) {
          goto LABEL_55;
        }
      }
    }
    goto LABEL_55;
  }
  ctu::parse_hex_impl((ctu *)((char *)v25 + v30 + 3), (const char *)(v24 - v30 - 3), 1, 0, &v39);
  long long v31 = v40;
  unint64_t v32 = v39;
  if (v22)
  {
    long long v37 = v40;
    operator delete(v22);
    long long v31 = v37;
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  *a1 = v32;
  *(_OWORD *)(a1 + 1) = v31;
  unint64_t v22 = (void *)v31;
  if (v32 == (void)v31) {
    goto LABEL_55;
  }
LABEL_17:
  char v23 = 0;
  if (SHIBYTE(__p[2]) < 0) {
LABEL_18:
  }
    operator delete(__p[0]);
LABEL_19:
  if (v23) {
    goto LABEL_59;
  }
}

void sub_2192E9D70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (v17)
  {
    *(void *)(v16 + 8) = v17;
    operator delete(v17);
  }
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void tlv::build_tlv_field(xpc_object_t *a1, char **a2)
{
  memset(__p, 170, sizeof(__p));
  sAttemptToDecodeData((unint64_t *)__p, a1);
  uint64_t v3 = (char *)__p[0];
  uint64_t v4 = (char *)__p[1];
  size_t v5 = (char *)__p[1] - (char *)__p[0];
  unint64_t v6 = (unint64_t)a2[2];
  uint64_t v7 = *a2;
  if (v6 - (unint64_t)*a2 < (char *)__p[1] - (char *)__p[0])
  {
    if (v7)
    {
      a2[1] = v7;
      operator delete(v7);
      unint64_t v6 = 0;
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
    }
    if ((v5 & 0x8000000000000000) != 0) {
      goto LABEL_32;
    }
    uint64_t v8 = 2 * v6;
    if (2 * v6 <= v5) {
      uint64_t v8 = v5;
    }
    size_t v9 = v6 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v8;
    if ((v9 & 0x8000000000000000) != 0) {
LABEL_32:
    }
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    unsigned int v10 = (char *)operator new(v9);
    *a2 = v10;
    a2[1] = v10;
    a2[2] = &v10[v9];
    memcpy(v10, v3, v5);
    a2[1] = &v10[v5];
    int v11 = __p[0];
    if (!__p[0]) {
      return;
    }
LABEL_30:
    __p[1] = v11;
    operator delete(v11);
    return;
  }
  size_t v12 = a2[1];
  size_t v13 = v12 - v7;
  if (v12 - v7 < v5)
  {
    char v14 = (char *)__p[0] + v13;
    if (v12 == v7)
    {
      uint64_t v15 = *a2;
      uint64_t v16 = *a2;
      if (v14 == __p[1]) {
        goto LABEL_29;
      }
    }
    else
    {
      memmove(*a2, __p[0], v13);
      uint64_t v15 = a2[1];
      uint64_t v16 = v15;
      if (v14 == v4) {
        goto LABEL_29;
      }
    }
    unint64_t v17 = &v4[(void)v7] - &v12[(void)v3];
    if (v17 >= 0x20)
    {
      uint64_t v16 = v15;
      if (&v15[v7 - &v12[(void)v3]] >= (char *)0x20)
      {
        v14 += v17 & 0xFFFFFFFFFFFFFFE0;
        uint64_t v16 = &v15[v17 & 0xFFFFFFFFFFFFFFE0];
        unint64_t v18 = v15 + 16;
        unint64_t v19 = &v3[v12 - v7 + 16];
        unint64_t v20 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          long long v21 = *(_OWORD *)v19;
          *(v18 - 1) = *((_OWORD *)v19 - 1);
          *unint64_t v18 = v21;
          v18 += 2;
          v19 += 32;
          v20 -= 32;
        }
        while (v20);
        if (v17 == (v17 & 0xFFFFFFFFFFFFFFE0))
        {
LABEL_29:
          a2[1] = v16;
          int v11 = __p[0];
          if (!__p[0]) {
            return;
          }
          goto LABEL_30;
        }
      }
    }
    else
    {
      uint64_t v16 = v15;
    }
    do
    {
      char v22 = *v14++;
      *v16++ = v22;
    }
    while (v14 != v4);
    goto LABEL_29;
  }
  if (__p[1] != __p[0]) {
    memmove(*a2, __p[0], (char *)__p[1] - (char *)__p[0]);
  }
  a2[1] = &v7[v5];
  int v11 = __p[0];
  if (__p[0]) {
    goto LABEL_30;
  }
}

void sub_2192E9FE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192EA35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  std::locale::~locale((std::locale *)(v26 - 56));
  a9 = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)&a9 + *(void *)(a9 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  a10 = MEMORY[0x263F8C318] + 16;
  if (a23 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](&a26);
  _Unwind_Resume(a1);
}

uint64_t print_char_type@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  long long v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  long long v22 = v2;
  long long v19 = v2;
  *(_OWORD *)__src = v2;
  long long v17 = v2;
  long long v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  uint64_t v3 = (void *)std::ostream::operator<<();
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  uint64_t v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 2;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    uint64_t v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    int v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  size_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    int v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&long long v23 = __src[1];
      int v11 = __src[1];
    }
    size_t v12 = __src[0];
    size_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    size_t v12 = (const void *)*((void *)&v18 + 1);
    size_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

void sub_2192EA7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2192EA7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192EA7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192EAB60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  std::locale::~locale((std::locale *)(v26 - 56));
  a9 = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)&a9 + *(void *)(a9 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  a10 = MEMORY[0x263F8C318] + 16;
  if (a23 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](&a26);
  _Unwind_Resume(a1);
}

uint64_t print_number_field<unsigned short>@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  long long v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  long long v22 = v2;
  long long v19 = v2;
  *(_OWORD *)__src = v2;
  long long v17 = v2;
  long long v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  uint64_t v3 = (void *)std::ostream::operator<<();
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  uint64_t v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 4;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    uint64_t v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    int v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    int v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&long long v23 = __src[1];
      int v11 = __src[1];
    }
    size_t v12 = __src[0];
    size_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    size_t v12 = (const void *)*((void *)&v18 + 1);
    size_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

void sub_2192EAFBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2192EAFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192EAFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192EB35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  std::locale::~locale((std::locale *)(v26 - 56));
  a9 = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)&a9 + *(void *)(a9 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  a10 = MEMORY[0x263F8C318] + 16;
  if (a23 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](&a26);
  _Unwind_Resume(a1);
}

uint64_t print_number_field<unsigned int>@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v2;
  v24[8] = v2;
  v24[5] = v2;
  v24[6] = v2;
  v24[3] = v2;
  v24[4] = v2;
  v24[1] = v2;
  v24[2] = v2;
  long long v23 = v2;
  v24[0] = v2;
  *(_OWORD *)std::string __p = v2;
  long long v22 = v2;
  long long v19 = v2;
  *(_OWORD *)__src = v2;
  long long v17 = v2;
  long long v18 = v2;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((unsigned char *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
  uint64_t v3 = (void *)std::ostream::operator<<();
  uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" (0x", 4);
  uint64_t v5 = *v4;
  *(_DWORD *)((char *)v4 + *(void *)(*v4 - 24) + 8) = *(_DWORD *)((unsigned char *)v4 + *(void *)(*v4 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v4 + *(void *)(v5 - 24) + 24) = 8;
  unint64_t v6 = (char *)v4 + *(void *)(v5 - 24);
  if (*((_DWORD *)v6 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(void *)(v5 - 24)));
    uint64_t v7 = std::locale::use_facet(&v26, MEMORY[0x263F8C108]);
    int v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 32);
    std::locale::~locale(&v26);
    *((_DWORD *)v6 + 36) = v8;
  }
  *((_DWORD *)v6 + 36) = 48;
  uint64_t v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)")", 1);
  if ((BYTE8(v23) & 0x10) != 0)
  {
    int v11 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&long long v23 = __src[1];
      int v11 = __src[1];
    }
    size_t v12 = __src[0];
    size_t v10 = v11 - (char *)__src[0];
    if ((unint64_t)(v11 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v10 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    size_t v12 = (const void *)*((void *)&v18 + 1);
    size_t v10 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    uint64_t v15 = operator new(v13 + 1);
    *((void *)a1 + 1) = v10;
    *((void *)a1 + 2) = v14 | 0x8000000000000000;
    *(void *)a1 = v15;
    a1 = v15;
    goto LABEL_15;
  }
  a1[23] = v10;
  if (v10) {
LABEL_15:
  }
    memmove(a1, v12, v10);
LABEL_16:
  a1[v10] = 0;
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D487470](v24);
}

void sub_2192EB7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::locale::~locale((std::locale *)(v9 - 56));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_2192EB7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192EB7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2192EBB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  std::locale::~locale((std::locale *)(v26 - 56));
  a9 = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)&a9 + *(void *)(a9 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  a10 = MEMORY[0x263F8C318] + 16;
  if (a23 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](&a26);
  _Unwind_Resume(a1);
}

void sub_2192EBFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  std::locale::~locale((std::locale *)(v26 - 56));
  a9 = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)&a9 + *(void *)(a9 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  a10 = MEMORY[0x263F8C318] + 16;
  if (a23 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](&a26);
  _Unwind_Resume(a1);
}

const char *asString(unsigned int a1)
{
  if (a1 > 5) {
    return "unknown";
  }
  else {
    return off_26439CD60[(char)a1];
  }
}

std::string *print_tlv_field@<X0>(unint64_t a1@<X0>, unsigned int a2@<W1>, std::string *a3@<X8>)
{
  return string_with_quotes<std::string>(a3, a1, a2);
}

std::string *string_with_quotes<std::string>(std::string *a1, unint64_t a2, unsigned int a3)
{
  memset(a1, 170, sizeof(std::string));
  *((unsigned char *)&a1->__r_.__value_.__s + 23) = 1;
  LOWORD(a1->__r_.__value_.__l.__data_) = 34;
  uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a2 + 8);
  }
  std::string::reserve(a1, v6 + 2);
  int v7 = *(char *)(a2 + 23);
  if (v7 >= 0) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = *(void *)a2;
  }
  if (v7 >= 0) {
    unint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v9 = *(void *)(a2 + 8);
  }
  if (v9)
  {
    char v10 = HIBYTE(a1->__r_.__value_.__r.__words[2]);
    if (v10 >= 0) {
      size_t size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
    }
    else {
      size_t size = a1->__r_.__value_.__l.__size_;
    }
    if (v10 >= 0) {
      size_t v12 = a1;
    }
    else {
      size_t v12 = (std::string *)a1->__r_.__value_.__r.__words[0];
    }
    if ((unint64_t)v12 <= v8 && (unint64_t)v12->__r_.__value_.__r.__words + size + 1 > v8)
    {
      uint64_t v14 = 0;
      memset(&v20, 0, sizeof(v20));
      do
        std::string::push_back(&v20, *(unsigned char *)(v8 + v14++));
      while (v9 != v14);
      std::string::size_type v15 = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v16 = &v20;
      }
      else {
        uint64_t v16 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v15 = v20.__r_.__value_.__l.__size_;
      }
      std::string::__insert_from_safe_copy[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>((char *)a1, v9, size, (uint64_t)v16, (char *)v16 + v15);
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v20.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      std::string::__insert_from_safe_copy[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>((char *)a1, v9, size, v8, (char *)(v8 + v9));
    }
  }
  std::string::append(a1, "\" (", 3uLL);
  if (a3 > 5) {
    long long v17 = "unknown";
  }
  else {
    long long v17 = off_26439CD60[(char)a3];
  }
  size_t v18 = strlen(v17);
  std::string::append(a1, v17, v18);
  return std::string::append(a1, ")", 1uLL);
}

void sub_2192EC290(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

std::string *print_tlv_field@<X0>(unint64_t a1@<X0>, std::string *a2@<X8>)
{
  return string_with_quotes<std::string>(a2, a1, 5u);
}

void print_tlv_field(unsigned char *a1@<X0>, int64_t a2@<X1>, unsigned int a3@<W2>, std::string *a4@<X8>)
{
  memset(a4, 170, sizeof(std::string));
  if (a3 > 5) {
    int v7 = "unknown";
  }
  else {
    int v7 = off_26439CD60[(char)a3];
  }
  size_t v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v9 = v8;
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    char v10 = operator new(v11 + 1);
    a4->__r_.__value_.__l.__size_ = v9;
    a4->__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    a4->__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
  }
  else
  {
    *((unsigned char *)&a4->__r_.__value_.__s + 23) = v8;
    char v10 = a4;
    if (!v8)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      if (a2 != 1) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  memcpy(v10, v7, v9);
  *((unsigned char *)v10 + v9) = 0;
  if (a2 != 1)
  {
LABEL_8:
    if (!a2)
    {
      std::string::append(a4, " [0 bytes]", 0xAuLL);
      return;
    }
    std::to_string(&v28, a2);
    uint64_t v13 = std::string::insert(&v28, 0, " [", 2uLL);
    long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    uint64_t v15 = std::string::append(&v29, " bytes]: ", 9uLL);
    long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    int64_t v31 = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)std::string __p = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    if (v31 >= 0) {
      long long v17 = __p;
    }
    else {
      long long v17 = (void **)__p[0];
    }
    if (v31 >= 0) {
      std::string::size_type v18 = HIBYTE(v31);
    }
    else {
      std::string::size_type v18 = (std::string::size_type)__p[1];
    }
    std::string::append(a4, (const std::string::value_type *)v17, v18);
    if (SHIBYTE(v31) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_23:
        if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_24;
        }
        goto LABEL_28;
      }
    }
    else if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_23;
    }
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_24:
      if (a2 < 1) {
        return;
      }
      goto LABEL_29;
    }
LABEL_28:
    operator delete(v28.__r_.__value_.__l.__data_);
    if (a2 < 1) {
      return;
    }
    goto LABEL_29;
  }
LABEL_14:
  std::string::append(a4, " [1 byte]: ", 0xBuLL);
LABEL_29:
  std::string::size_type size = HIBYTE(a4->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  std::string::reserve(a4, 3 * a2 + size - 1);
  if (*a1 >= 0xA0u) {
    char v20 = 87;
  }
  else {
    char v20 = 48;
  }
  std::string::push_back(a4, v20 + (*a1 >> 4));
  unsigned int v21 = *a1 & 0xF;
  if (v21 >= 0xA) {
    char v22 = 87;
  }
  else {
    char v22 = 48;
  }
  std::string::push_back(a4, v22 + v21);
  int64_t v23 = a2 - 1;
  if (v23)
  {
    uint64_t v24 = a1 + 1;
    do
    {
      std::string::push_back(a4, 32);
      if (*v24 >= 0xA0u) {
        char v25 = 87;
      }
      else {
        char v25 = 48;
      }
      std::string::push_back(a4, v25 + (*v24 >> 4));
      unsigned int v26 = *v24 & 0xF;
      if (v26 >= 0xA) {
        char v27 = 87;
      }
      else {
        char v27 = 48;
      }
      std::string::push_back(a4, v27 + v26);
      ++v24;
      --v23;
    }
    while (v23);
  }
}

void sub_2192EC5D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_8;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(char *)(v28 + 23) & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_8:
  operator delete(a10);
  if ((*(char *)(v28 + 23) & 0x80000000) == 0) {
LABEL_5:
  }
    _Unwind_Resume(exception_object);
LABEL_9:
  operator delete(*(void **)v28);
  _Unwind_Resume(exception_object);
}

void print_tlv_field(uint64_t a1@<X0>, unsigned int a2@<W1>, std::string *a3@<X8>)
{
}

{
  print_tlv_field(*(unsigned char **)a1, *(void *)(a1 + 8) - *(void *)a1, a2, a3);
}

void print_tlv_field(uint64_t a1@<X0>, std::string *a2@<X8>)
{
}

void print_tlv_field_pair(char *a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  keys[1] = *(char **)MEMORY[0x263EF8340];
  xpc_object_t values = *a2;
  keys[0] = a1;
  xpc_object_t v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  xpc_object_t v5 = v4;
  if (v4)
  {
    xpc_retain(v4);
    *a3 = v5;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a3 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x21D4876E0](v5) != MEMORY[0x263EF8708])
  {
    xpc_object_t v6 = xpc_null_create();
LABEL_8:
    *a3 = v6;
    goto LABEL_9;
  }
  xpc_retain(v5);
LABEL_9:
  xpc_release(v5);
}

{
  if (a1[23] < 0) {
    a1 = *(char **)a1;
  }
  print_tlv_field_pair(a1, a2, a3);
}

void sub_2192EC790(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void extract_tlv_field(xpc_object_t *a1@<X0>, const char *a2@<X2>, size_t a3@<X1>, void *a4@<X8>)
{
  uint64_t v8 = MEMORY[0x21D4876E0](*a1);
  uint64_t v9 = MEMORY[0x263EF86D8];
  if (v8 != MEMORY[0x263EF86D8])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
LABEL_20:
  }
  if (MEMORY[0x21D4876E0](*a1) != v9 || xpc_array_get_count(*a1) <= a3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object does not have enough elements!");
    goto LABEL_20;
  }
  xpc_object_t value = xpc_array_get_value(*a1, a3);
  uint64_t v11 = MEMORY[0x263EF8708];
  if (value)
  {
    xpc_object_t v12 = value;
    xpc_retain(value);
  }
  else
  {
    xpc_object_t v12 = xpc_null_create();
    if (!v12)
    {
      xpc_object_t v13 = xpc_null_create();
      xpc_object_t v12 = 0;
      goto LABEL_11;
    }
  }
  if (MEMORY[0x21D4876E0](v12) == v11)
  {
    xpc_retain(v12);
    xpc_object_t v13 = v12;
  }
  else
  {
    xpc_object_t v13 = xpc_null_create();
  }
LABEL_11:
  xpc_release(v12);
  if (MEMORY[0x21D4876E0](v13) != v11)
  {
    long long v17 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v17, "Object at index is not a dictionary type");
    goto LABEL_23;
  }
  if (xpc_dictionary_get_count(v13) != 1)
  {
    long long v17 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v17, "Object at index is a dictionary but does not have exactly one element");
LABEL_23:
    v17->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
  }
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v14 = xpc_dictionary_get_value(v13, a2);
  xpc_object_t v15 = v14;
  *a4 = v14;
  if (v14)
  {
    xpc_retain(v14);
  }
  else
  {
    xpc_object_t v15 = xpc_null_create();
    *a4 = v15;
  }
  if (MEMORY[0x21D4876E0](v15) == MEMORY[0x263EF8758])
  {
    std::string::size_type v18 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v18, "Object at index does not have the right name");
    v18->__vftable = (std::runtime_error_vtbl *)&unk_26CAABAA0;
  }
  xpc_release(v13);
}

void sub_2192ECA40(_Unwind_Exception *a1)
{
  __cxa_free_exception(v4);
  xpc_release(v3);
  void *v2 = 0;
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void extract_tlv_field(xpc_object_t *a1@<X0>, size_t a2@<X1>, const char *a3@<X2>, void *a4@<X8>)
{
  if (a3[23] < 0) {
    a3 = *(const char **)a3;
  }
  extract_tlv_field(a1, a3, a2, a4);
}

void TlvDefinition::sFillInParseFailure(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a1 + 24) = 3;
  xpc_object_t v4 = xpc_string_create("[ Unable to parse this TLV as defined ]");
  xpc_object_t v11 = v4;
  if (!v4)
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v11 = v4;
  }
  print_tlv_field_pair("parse_error", &v11, &value);
  xpc_object_t v5 = (void *)value.__r_.__value_.__r.__words[0];
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value.__r_.__value_.__l.__data_);
  xpc_release(v5);
  xpc_release(v4);
  print_tlv_field(*(unsigned char **)a2, *(void *)(a2 + 8) - *(void *)a2, 2u, &value);
  if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_std::string value = &value;
  }
  else {
    p_std::string value = (std::string *)value.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v7 = xpc_string_create((const char *)p_value);
  xpc_object_t v10 = v7;
  if (!v7)
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v10 = v7;
  }
  print_tlv_field_pair("bytes", &v10, &v11);
  xpc_object_t v8 = v11;
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v11);
  xpc_release(v8);
  xpc_object_t v11 = 0;
  xpc_release(v7);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(value.__r_.__value_.__l.__data_);
  }
}

void sub_2192ECC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_release(v18);
  xpc_release(v17);
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

void *TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::TlvDefinitionImpl(void *result)
{
  std::runtime_error *result = &unk_26CAABAF8;
  result[1] = "QMI Response Result";
  return result;
}

{
  std::runtime_error *result = &unk_26CAABAF8;
  result[1] = "QMI Response Result";
  return result;
}

size_t TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::parse@<X0>(uint64_t a1@<X0>, char **a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v7, *(const std::string::value_type **)(a1 + 8));
  xpc_object_t v8 = *a2;
  if (a2[1] - *a2 != 4) {
    goto LABEL_71;
  }
  int v9 = *(unsigned __int16 *)v8;
  unsigned int v10 = *((unsigned __int16 *)v8 + 1);
  unint64_t v85 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v84[7] = v11;
  v84[8] = v11;
  v84[5] = v11;
  v84[6] = v11;
  v84[3] = v11;
  v84[4] = v11;
  v84[1] = v11;
  v84[2] = v11;
  long long v83 = v11;
  v84[0] = v11;
  *(_OWORD *)v81 = v11;
  long long v82 = v11;
  long long v79 = v11;
  long long v80 = v11;
  long long v77 = v11;
  long long v78 = v11;
  long long v76 = v11;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v76);
  xpc_object_t v12 = (void *)std::ostream::operator<<();
  xpc_object_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" (0x", 4);
  uint64_t v14 = *v13;
  *(_DWORD *)((char *)v13 + *(void *)(*v13 - 24) + 8) = *(_DWORD *)((unsigned char *)v13 + *(void *)(*v13 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v13 + *(void *)(v14 - 24) + 24) = 4;
  xpc_object_t v15 = (char *)v13 + *(void *)(v14 - 24);
  if (*((_DWORD *)v15 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(void *)(v14 - 24)));
    long long v16 = std::locale::use_facet(__dst, MEMORY[0x263F8C108]);
    int v17 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 32);
    std::locale::~locale(__dst);
    *((_DWORD *)v15 + 36) = v17;
  }
  *((_DWORD *)v15 + 36) = 48;
  std::string::size_type v18 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)")", 1);
  if ((BYTE8(v83) & 0x10) != 0)
  {
    uint64_t v21 = v83;
    if ((unint64_t)v83 < *((void *)&v80 + 1))
    {
      *(void *)&long long v83 = *((void *)&v80 + 1);
      uint64_t v21 = *((void *)&v80 + 1);
    }
    char v22 = (const void *)v80;
    size_t v19 = v21 - v80;
    if ((unint64_t)(v21 - v80) > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_76;
    }
  }
  else
  {
    if ((BYTE8(v83) & 8) == 0)
    {
      size_t v19 = 0;
      BYTE7(v66) = 0;
      char v20 = (std::locale::__imp *)__dst;
      goto LABEL_17;
    }
    char v22 = (const void *)*((void *)&v78 + 1);
    size_t v19 = *((void *)&v79 + 1) - *((void *)&v78 + 1);
    if (*((void *)&v79 + 1) - *((void *)&v78 + 1) > 0x7FFFFFFFFFFFFFF7uLL) {
LABEL_76:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v19 >= 0x17)
  {
    uint64_t v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v23 = v19 | 7;
    }
    uint64_t v24 = v23 + 1;
    char v20 = (std::locale::__imp *)operator new(v23 + 1);
    __dst[1].__locale_ = (std::locale::__imp *)v19;
    *(void *)&long long v66 = v24 | 0x8000000000000000;
    __dst[0].__locale_ = v20;
    goto LABEL_16;
  }
  BYTE7(v66) = v19;
  char v20 = (std::locale::__imp *)__dst;
  if (v19) {
LABEL_16:
  }
    memmove(v20, v22, v19);
LABEL_17:
  *((unsigned char *)v20 + v19) = 0;
  if ((SBYTE7(v66) & 0x80u) == 0) {
    locale = (const char *)__dst;
  }
  else {
    locale = (const char *)__dst[0].__locale_;
  }
  xpc_object_t v26 = xpc_string_create(locale);
  xpc_object_t v75 = v26;
  if (!v26)
  {
    xpc_object_t v26 = xpc_null_create();
    xpc_object_t v75 = v26;
  }
  print_tlv_field_pair("fResult", &v75, &value);
  xpc_object_t v27 = value;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), value);
  xpc_release(v27);
  xpc_object_t value = 0;
  xpc_release(v26);
  if (SBYTE7(v66) < 0) {
    operator delete(__dst[0].__locale_);
  }
  unint64_t v74 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v73[7] = v28;
  v73[8] = v28;
  v73[5] = v28;
  v73[6] = v28;
  v73[3] = v28;
  v73[4] = v28;
  v73[1] = v28;
  v73[2] = v28;
  long long v72 = v28;
  v73[0] = v28;
  *(_OWORD *)std::string __p = v28;
  long long v71 = v28;
  long long v68 = v28;
  long long v69 = v28;
  long long v66 = v28;
  long long v67 = v28;
  *(_OWORD *)&__dst[0].__locale_ = v28;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)__dst);
  std::string v29 = (void *)std::ostream::operator<<();
  int64_t v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)" (0x", 4);
  uint64_t v31 = *v30;
  *(_DWORD *)((char *)v30 + *(void *)(*v30 - 24) + 8) = *(_DWORD *)((unsigned char *)v30 + *(void *)(*v30 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v30 + *(void *)(v31 - 24) + 24) = 4;
  unint64_t v32 = (char *)v30 + *(void *)(v31 - 24);
  if (*((_DWORD *)v32 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)v30 + *(void *)(v31 - 24)));
    uint64_t v33 = std::locale::use_facet((const std::locale *)&value, MEMORY[0x263F8C108]);
    int v34 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 32);
    std::locale::~locale((std::locale *)&value);
    *((_DWORD *)v32 + 36) = v34;
  }
  *((_DWORD *)v32 + 36) = 48;
  uint64_t v35 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)")", 1);
  if ((BYTE8(v72) & 0x10) != 0)
  {
    uint64_t v38 = v72;
    if ((unint64_t)v72 < *((void *)&v69 + 1))
    {
      *(void *)&long long v72 = *((void *)&v69 + 1);
      uint64_t v38 = *((void *)&v69 + 1);
    }
    unint64_t v39 = (const void *)v69;
    size_t v36 = v38 - v69;
    if ((unint64_t)(v38 - v69) > 0x7FFFFFFFFFFFFFF7) {
      goto LABEL_78;
    }
  }
  else
  {
    if ((BYTE8(v72) & 8) == 0)
    {
      size_t v36 = 0;
      HIBYTE(v63) = 0;
      p_xpc_object_t value = &value;
      goto LABEL_39;
    }
    unint64_t v39 = (const void *)*((void *)&v67 + 1);
    size_t v36 = *((void *)&v68 + 1) - *((void *)&v67 + 1);
    if (*((void *)&v68 + 1) - *((void *)&v67 + 1) > 0x7FFFFFFFFFFFFFF7uLL) {
LABEL_78:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v36 >= 0x17)
  {
    uint64_t v40 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v36 | 7) != 0x17) {
      uint64_t v40 = v36 | 7;
    }
    uint64_t v41 = v40 + 1;
    p_xpc_object_t value = operator new(v40 + 1);
    size_t v62 = v36;
    int64_t v63 = v41 | 0x8000000000000000;
    xpc_object_t value = p_value;
    goto LABEL_38;
  }
  HIBYTE(v63) = v36;
  p_xpc_object_t value = &value;
  if (v36) {
LABEL_38:
  }
    memmove(p_value, v39, v36);
LABEL_39:
  *((unsigned char *)p_value + v36) = 0;
  if (v63 >= 0) {
    unint64_t v42 = (const char *)&value;
  }
  else {
    unint64_t v42 = (const char *)value;
  }
  xpc_object_t v43 = xpc_string_create(v42);
  xpc_object_t v64 = v43;
  if (!v43)
  {
    xpc_object_t v43 = xpc_null_create();
    xpc_object_t v64 = v43;
  }
  print_tlv_field_pair("fResultCode", &v64, &v75);
  xpc_object_t v44 = v75;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), v75);
  xpc_release(v44);
  xpc_object_t v75 = 0;
  xpc_release(v43);
  if ((SHIBYTE(v63) & 0x80000000) == 0)
  {
    if (v9) {
      goto LABEL_46;
    }
LABEL_51:
    if (!v10)
    {
      xpc_object_t v49 = xpc_string_create("none");
      xpc_object_t v75 = v49;
      if (!v49)
      {
        xpc_object_t v49 = xpc_null_create();
        xpc_object_t v75 = v49;
      }
      print_tlv_field_pair("fError", &v75, &value);
      xpc_object_t v50 = value;
      xpc_array_append_value(*(xpc_object_t *)(a3 + 32), value);
      xpc_release(v50);
      xpc_object_t value = 0;
      xpc_release(v49);
    }
    goto LABEL_66;
  }
  operator delete(value);
  if (!v9) {
    goto LABEL_51;
  }
LABEL_46:
  v45 = qmi::asString(v10);
  size_t v46 = strlen(v45);
  if (v46 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v47 = v46;
  if (v46 >= 0x17)
  {
    uint64_t v51 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v46 | 7) != 0x17) {
      uint64_t v51 = v46 | 7;
    }
    uint64_t v52 = v51 + 1;
    unint64_t v48 = operator new(v51 + 1);
    size_t v62 = v47;
    int64_t v63 = v52 | 0x8000000000000000;
    xpc_object_t value = v48;
  }
  else
  {
    HIBYTE(v63) = v46;
    unint64_t v48 = &value;
    if (!v46) {
      goto LABEL_59;
    }
  }
  memmove(v48, v45, v47);
LABEL_59:
  *((unsigned char *)v48 + v47) = 0;
  if (v63 >= 0) {
    xpc_object_t v53 = (const char *)&value;
  }
  else {
    xpc_object_t v53 = (const char *)value;
  }
  xpc_object_t v54 = xpc_string_create(v53);
  xpc_object_t v64 = v54;
  if (!v54)
  {
    xpc_object_t v54 = xpc_null_create();
    xpc_object_t v64 = v54;
  }
  print_tlv_field_pair("fError", &v64, &v75);
  xpc_object_t v55 = v75;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), v75);
  xpc_release(v55);
  xpc_object_t v75 = 0;
  xpc_release(v54);
  if (SHIBYTE(v63) < 0) {
    operator delete(value);
  }
LABEL_66:
  __dst[0] = *(std::locale *)MEMORY[0x263F8C2B8];
  v56 = __dst[0].__locale_;
  uint64_t v57 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  v58 = *(std::locale::__imp **)(MEMORY[0x263F8C2B8] + 64);
  *(std::locale::__imp **)((char *)&__dst[0].__locale_ + *((void *)__dst[0].__locale_ - 3)) = v58;
  uint64_t v59 = v57;
  *(void *)&long long v66 = v57;
  *((void *)&v66 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v71) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](v73);
  *(void *)&long long v76 = v56;
  *(void *)((char *)&v76 + *((void *)v56 - 3)) = v58;
  *(void *)&long long v77 = v59;
  *((void *)&v77 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v82) < 0) {
    operator delete(v81[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](v84);
LABEL_71:
  size_t result = MEMORY[0x21D4876E0](*(void *)(a3 + 32));
  if (result != MEMORY[0x263EF86D8] || (size_t result = xpc_array_get_count(*(xpc_object_t *)(a3 + 32))) == 0) {
    *(unsigned char *)(a3 + 24) = 3;
  }
  return result;
}

void sub_2192ED628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  xpc_release(v57);
  xpc_release(v56);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a55);
  TlvAnnotation::~TlvAnnotation(v55);
  _Unwind_Resume(a1);
}

void sub_2192ED7E0(_Unwind_Exception *a1)
{
  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::build(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  xpc_object_t v4 = operator new(4uLL);
  *(_DWORD *)xpc_object_t v4 = 0;
  *a2 = v4;
  a2[1] = v4 + 2;
  a2[2] = v4 + 2;
  int v6 = 0;
  extract_tlv_field(a1, "fResult", 0, &object);
  tlv::build_tlv_field(&object, (_WORD *)&v6 + 1);
  xpc_release(object);
  extract_tlv_field(a1, "fResultCode", 1uLL, &object);
  tlv::build_tlv_field(&object, &v6);
  xpc_release(object);
  *xpc_object_t v4 = HIWORD(v6);
  v4[1] = v6;
}

void sub_2192ED8BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  *(void *)(v10 + 8) = v9;
  operator delete(v9);
  _Unwind_Resume(a1);
}

uint64_t std::multimap<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>::~multimap[abi:ne180100](uint64_t a1)
{
  return a1;
}

void *QmiMessageRegistry::create@<X0>(void *a1@<X8>)
{
  uint64_t v3 = operator new(0x30uLL);
  v3[1] = 0;
  _DWORD v3[2] = 0;
  *uint64_t v3 = &unk_26CAABC50;
  v3[5] = 0;
  xpc_object_t v4 = v3;
  a1[1] = v3;
  v3[4] = 0;
  size_t result = v3 + 4;
  v4[3] = result;
  *a1 = v4 + 3;
  return result;
}

_DWORD *QmiMessageRegistry::registerClass(uint64_t **this, const QmiMessageDefinition *a2)
{
  int v4 = -1431655766;
  __int16 v5 = -21846;
  LOBYTE(v4) = *((unsigned char *)a2 + 16);
  HIWORD(v4) = *((_WORD *)a2 + 9);
  LOBYTE(v5) = *((unsigned char *)a2 + 20);
  uint64_t v3 = a2;
  return std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(this, (uint64_t)&v4, &v3);
}

void QmiMessageRegistry::getAllQmiMessageDefinitions(QmiMessageRegistry **this@<X0>, void *a2@<X8>)
{
  a2[2] = 0;
  long long v2 = a2 + 2;
  *a2 = 0;
  a2[1] = 0;
  uint64_t v3 = this + 1;
  int v4 = *this;
  if (*this != (QmiMessageRegistry *)(this + 1))
  {
    int v6 = 0;
    do
    {
      uint64_t v7 = *((void *)v4 + 5);
      uint64_t v8 = *v2;
      char v9 = *(unsigned char *)(v7 + 16);
      if ((unint64_t)v6 >= *v2)
      {
        uint64_t v14 = (char *)*a2;
        uint64_t v15 = (uint64_t)&v6[-*a2] >> 5;
        if ((unint64_t)(v15 + 1) >> 59) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        __int16 v16 = *(_WORD *)(v7 + 18);
        char v17 = *(unsigned char *)(v7 + 20);
        std::string::size_type v18 = *(const char **)(v7 + 8);
        unint64_t v19 = v8 - (void)v14;
        unint64_t v20 = (v8 - (uint64_t)v14) >> 4;
        if (v20 <= v15 + 1) {
          unint64_t v20 = v15 + 1;
        }
        if (v19 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v21 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21)
        {
          if (v21 >> 59) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          char v22 = (char *)operator new(32 * v21);
        }
        else
        {
          char v22 = 0;
        }
        char v25 = &v22[32 * v15];
        unint64_t v42 = &v22[32 * v21];
        *char v25 = v9;
        *((_WORD *)v25 + 1) = v16;
        xpc_object_t v26 = v25 + 8;
        v25[4] = v17;
        size_t v27 = strlen(v18);
        if (v27 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        size_t v28 = v27;
        if (v27 >= 0x17)
        {
          uint64_t v37 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v27 | 7) != 0x17) {
            uint64_t v37 = v27 | 7;
          }
          uint64_t v38 = v37 + 1;
          xpc_object_t v26 = operator new(v37 + 1);
          *((void *)v25 + 2) = v28;
          *((void *)v25 + 3) = v38 | 0x8000000000000000;
          *((void *)v25 + 1) = v26;
        }
        else
        {
          v25[31] = v27;
          if (!v27)
          {
            *xpc_object_t v26 = 0;
            std::string v29 = v25;
            int v6 = v25 + 32;
            int64_t v30 = (char *)*a2;
            uint64_t v31 = (char *)a2[1];
            if (v31 != (char *)*a2) {
              goto LABEL_28;
            }
LABEL_39:
            *a2 = v29;
            a2[1] = v6;
            a2[2] = v42;
            goto LABEL_40;
          }
        }
        memmove(v26, v18, v28);
        v26[v28] = 0;
        std::string v29 = v25;
        int v6 = v25 + 32;
        int64_t v30 = (char *)*a2;
        uint64_t v31 = (char *)a2[1];
        if (v31 == (char *)*a2) {
          goto LABEL_39;
        }
LABEL_28:
        uint64_t v32 = 0;
        do
        {
          uint64_t v33 = &v29[v32];
          int v34 = &v31[v32];
          *(v33 - 32) = v31[v32 - 32];
          *((_WORD *)v33 - 15) = *(_WORD *)&v31[v32 - 30];
          *(v33 - 28) = v31[v32 - 28];
          long long v35 = *(_OWORD *)&v31[v32 - 24];
          *((void *)v33 - 1) = *(void *)&v31[v32 - 8];
          *(_OWORD *)(v33 - 24) = v35;
          *((void *)v34 - 2) = 0;
          *((void *)v34 - 1) = 0;
          *((void *)v34 - 3) = 0;
          v32 -= 32;
        }
        while (&v31[v32] != v30);
        uint64_t v31 = (char *)*a2;
        size_t v36 = (void **)a2[1];
        *a2 = &v29[v32];
        a2[1] = v6;
        a2[2] = v42;
        while (v36 != (void **)v31)
        {
          if (*((char *)v36 - 1) < 0) {
            operator delete(*(v36 - 3));
          }
          v36 -= 4;
        }
LABEL_40:
        if (v31) {
          operator delete(v31);
        }
        goto LABEL_42;
      }
      *int v6 = v9;
      *((_WORD *)v6 + 1) = *(_WORD *)(v7 + 18);
      v6[4] = *(unsigned char *)(v7 + 20);
      uint64_t v10 = v6 + 8;
      long long v11 = *(const char **)(v7 + 8);
      size_t v12 = strlen(v11);
      if (v12 > 0x7FFFFFFFFFFFFFF7) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      size_t v13 = v12;
      if (v12 >= 0x17)
      {
        uint64_t v23 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v23 = v12 | 7;
        }
        uint64_t v24 = v23 + 1;
        uint64_t v10 = operator new(v23 + 1);
        *((void *)v6 + 2) = v13;
        *((void *)v6 + 3) = v24 | 0x8000000000000000;
        *((void *)v6 + 1) = v10;
      }
      else
      {
        v6[31] = v12;
        if (!v12) {
          goto LABEL_22;
        }
      }
      memmove(v10, v11, v13);
LABEL_22:
      *((unsigned char *)v10 + v13) = 0;
      v6 += 32;
      a2[1] = v6;
LABEL_42:
      a2[1] = v6;
      unint64_t v39 = (QmiMessageRegistry *)*((void *)v4 + 1);
      if (v39)
      {
        do
        {
          uint64_t v40 = (QmiMessageRegistry **)v39;
          unint64_t v39 = *(QmiMessageRegistry **)v39;
        }
        while (v39);
      }
      else
      {
        do
        {
          uint64_t v40 = (QmiMessageRegistry **)*((void *)v4 + 2);
          BOOL v41 = *v40 == v4;
          int v4 = (QmiMessageRegistry *)v40;
        }
        while (!v41);
      }
      int v4 = (QmiMessageRegistry *)v40;
    }
    while (v40 != v3);
  }
}

void sub_2192EDD24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~__split_buffer((uint64_t)va);
  std::vector<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~vector[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void sub_2192EDD74(_Unwind_Exception *a1)
{
  std::vector<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~vector[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~vector[abi:ne180100](void **a1)
{
  long long v2 = (void **)*a1;
  if (*a1)
  {
    uint64_t v3 = (void **)a1[1];
    int v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0) {
          operator delete(*(v3 - 3));
        }
        v3 -= 4;
      }
      while (v3 != v2);
      int v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void QmiMessageRegistry::getDefinitions(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, unsigned int a4@<W3>, char **a5@<X8>)
{
  uint64_t v10 = (uint64_t *)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9) {
    goto LABEL_76;
  }
  while (1)
  {
    while (1)
    {
      unsigned int v11 = *(unsigned __int8 *)(v9 + 32);
      if (v11 == a2) {
        break;
      }
      if (v11 > a2) {
        goto LABEL_3;
      }
      if (v11 >= a2) {
        char v16 = 1;
      }
      else {
        char v16 = -1;
      }
      if ((v16 & 0x80) == 0) {
        goto LABEL_27;
      }
LABEL_25:
      uint64_t v9 = *(void *)(v9 + 8);
      if (!v9) {
        goto LABEL_76;
      }
    }
    unsigned int v12 = *(unsigned __int16 *)(v9 + 34);
    if (v12 != a3)
    {
      if (v12 > a3) {
        goto LABEL_3;
      }
      if (v12 >= a3) {
        char v17 = 1;
      }
      else {
        char v17 = -1;
      }
      if ((v17 & 0x80) == 0) {
        goto LABEL_27;
      }
      goto LABEL_25;
    }
    unsigned int v13 = *(unsigned __int8 *)(v9 + 36);
    BOOL v14 = v13 == a4;
    if (v13 <= a4) {
      break;
    }
LABEL_3:
    uint64_t v10 = (uint64_t *)v9;
    uint64_t v9 = *(void *)v9;
    if (!v9) {
      goto LABEL_76;
    }
  }
  if (v13 >= a4) {
    char v15 = 1;
  }
  else {
    char v15 = -1;
  }
  if (v14) {
    char v15 = 0;
  }
  if (v15 < 0) {
    goto LABEL_25;
  }
LABEL_27:
  uint64_t v18 = *(void *)v9;
  unint64_t v19 = (uint64_t *)v9;
  if (*(void *)v9)
  {
    unint64_t v19 = (uint64_t *)v9;
    do
    {
      unsigned int v22 = *(unsigned __int8 *)(v18 + 32);
      BOOL v23 = v22 == a2;
      if (v22 >= a2) {
        char v24 = 1;
      }
      else {
        char v24 = -1;
      }
      if (v23)
      {
        unsigned int v25 = *(unsigned __int16 *)(v18 + 34);
        BOOL v26 = v25 == a3;
        char v24 = v25 >= a3 ? 1 : -1;
        if (v26)
        {
          unsigned int v27 = *(unsigned __int8 *)(v18 + 36);
          BOOL v28 = v27 == a4;
          char v24 = v27 >= a4 ? 1 : -1;
          if (v28) {
            char v24 = 0;
          }
        }
      }
      BOOL v20 = (v24 & 0x80) == 0;
      if (v24 < 0) {
        unint64_t v21 = (uint64_t *)(v18 + 8);
      }
      else {
        unint64_t v21 = (uint64_t *)v18;
      }
      if (v20) {
        unint64_t v19 = (uint64_t *)v18;
      }
      uint64_t v18 = *v21;
    }
    while (*v21);
  }
  uint64_t v29 = *(void *)(v9 + 8);
  if (v29)
  {
    do
    {
      unsigned int v32 = *(unsigned __int8 *)(v29 + 32);
      BOOL v33 = v32 == a2;
      if (v32 <= a2) {
        char v34 = 1;
      }
      else {
        char v34 = -1;
      }
      if (v33)
      {
        unsigned int v35 = *(unsigned __int16 *)(v29 + 34);
        BOOL v36 = v35 == a3;
        char v34 = v35 <= a3 ? 1 : -1;
        if (v36)
        {
          unsigned int v37 = *(unsigned __int8 *)(v29 + 36);
          BOOL v38 = v37 == a4;
          char v34 = v37 <= a4 ? 1 : -1;
          if (v38) {
            char v34 = 0;
          }
        }
      }
      BOOL v30 = (v34 & 0x80) == 0;
      if (v34 < 0) {
        uint64_t v31 = (uint64_t *)v29;
      }
      else {
        uint64_t v31 = (uint64_t *)(v29 + 8);
      }
      if (!v30) {
        uint64_t v10 = (uint64_t *)v29;
      }
      uint64_t v29 = *v31;
    }
    while (*v31);
  }
  if (v19 != v10) {
    goto LABEL_202;
  }
LABEL_76:
  uint64_t v39 = qword_26AA5FBF0;
  if (!qword_26AA5FBF0) {
    goto LABEL_151;
  }
  uint64_t v10 = &qword_26AA5FBF0;
  while (2)
  {
    while (2)
    {
      unsigned int v40 = *(unsigned __int8 *)(v39 + 32);
      if (v40 != a2)
      {
        if (v40 > a2) {
          goto LABEL_78;
        }
        if (v40 >= a2) {
          char v45 = 1;
        }
        else {
          char v45 = -1;
        }
        if ((v45 & 0x80) == 0) {
          goto LABEL_102;
        }
        goto LABEL_100;
      }
      unsigned int v41 = *(unsigned __int16 *)(v39 + 34);
      if (v41 != a3)
      {
        if (v41 > a3)
        {
LABEL_78:
          uint64_t v10 = (uint64_t *)v39;
          uint64_t v39 = *(void *)v39;
          if (!v39) {
            goto LABEL_151;
          }
          continue;
        }
        if (v41 >= a3) {
          char v46 = 1;
        }
        else {
          char v46 = -1;
        }
        if ((v46 & 0x80) == 0) {
          goto LABEL_102;
        }
        goto LABEL_100;
      }
      break;
    }
    unsigned int v42 = *(unsigned __int8 *)(v39 + 36);
    BOOL v43 = v42 == a4;
    if (v42 > a4) {
      goto LABEL_78;
    }
    if (v42 >= a4) {
      char v44 = 1;
    }
    else {
      char v44 = -1;
    }
    if (v43) {
      char v44 = 0;
    }
    if (v44 < 0)
    {
LABEL_100:
      uint64_t v39 = *(void *)(v39 + 8);
      if (!v39) {
        goto LABEL_151;
      }
      continue;
    }
    break;
  }
LABEL_102:
  uint64_t v47 = *(void *)v39;
  unint64_t v19 = (uint64_t *)v39;
  if (*(void *)v39)
  {
    unint64_t v19 = (uint64_t *)v39;
    do
    {
      unsigned int v50 = *(unsigned __int8 *)(v47 + 32);
      BOOL v51 = v50 == a2;
      if (v50 >= a2) {
        char v52 = 1;
      }
      else {
        char v52 = -1;
      }
      if (v51)
      {
        unsigned int v53 = *(unsigned __int16 *)(v47 + 34);
        BOOL v54 = v53 == a3;
        char v52 = v53 >= a3 ? 1 : -1;
        if (v54)
        {
          unsigned int v55 = *(unsigned __int8 *)(v47 + 36);
          BOOL v56 = v55 == a4;
          char v52 = v55 >= a4 ? 1 : -1;
          if (v56) {
            char v52 = 0;
          }
        }
      }
      BOOL v48 = (v52 & 0x80) == 0;
      if (v52 < 0) {
        xpc_object_t v49 = (uint64_t *)(v47 + 8);
      }
      else {
        xpc_object_t v49 = (uint64_t *)v47;
      }
      if (v48) {
        unint64_t v19 = (uint64_t *)v47;
      }
      uint64_t v47 = *v49;
    }
    while (*v49);
  }
  uint64_t v57 = *(void *)(v39 + 8);
  if (v57)
  {
    do
    {
      unsigned int v60 = *(unsigned __int8 *)(v57 + 32);
      BOOL v61 = v60 == a2;
      if (v60 <= a2) {
        char v62 = 1;
      }
      else {
        char v62 = -1;
      }
      if (v61)
      {
        unsigned int v63 = *(unsigned __int16 *)(v57 + 34);
        BOOL v64 = v63 == a3;
        char v62 = v63 <= a3 ? 1 : -1;
        if (v64)
        {
          unsigned int v65 = *(unsigned __int8 *)(v57 + 36);
          BOOL v66 = v65 == a4;
          char v62 = v65 <= a4 ? 1 : -1;
          if (v66) {
            char v62 = 0;
          }
        }
      }
      BOOL v58 = (v62 & 0x80) == 0;
      if (v62 < 0) {
        uint64_t v59 = (uint64_t *)v57;
      }
      else {
        uint64_t v59 = (uint64_t *)(v57 + 8);
      }
      if (!v58) {
        uint64_t v10 = (uint64_t *)v57;
      }
      uint64_t v57 = *v59;
    }
    while (*v59);
  }
  if (v19 != v10) {
    goto LABEL_202;
  }
LABEL_151:
  long long v67 = operator new(0x30uLL);
  v67[3] = 0;
  long long v68 = (void **)(v67 + 3);
  v67[4] = 0;
  v67[5] = 0;
  unint64_t v136 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v69 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v69 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v135[7] = v69;
  v135[8] = v69;
  v135[5] = v69;
  v135[6] = v69;
  v135[3] = v69;
  v135[4] = v69;
  v135[1] = v69;
  v135[2] = v69;
  long long v134 = v69;
  v135[0] = v69;
  *(_OWORD *)std::string __p = v69;
  long long v133 = v69;
  long long v130 = v69;
  long long v131 = v69;
  long long v128 = v69;
  long long v129 = v69;
  long long v127 = v69;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v127);
  v70 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v128, (uint64_t)"(unknown ", 9);
  long long v71 = qmi::asShortString();
  size_t v72 = strlen(v71);
  v73 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v70, (uint64_t)v71, v72);
  unint64_t v74 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v73, (uint64_t)" ", 1);
  if (a4 > 2) {
    xpc_object_t v75 = (const char *)&unk_2192FD282;
  }
  else {
    xpc_object_t v75 = off_26439CD90[(char)a4];
  }
  size_t v76 = strlen(v75);
  long long v77 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v74, (uint64_t)v75, v76);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v77, (uint64_t)")", 1);
  if ((BYTE8(v134) & 0x10) != 0)
  {
    uint64_t v80 = v134;
    if ((unint64_t)v134 < *((void *)&v131 + 1))
    {
      *(void *)&long long v134 = *((void *)&v131 + 1);
      uint64_t v80 = *((void *)&v131 + 1);
    }
    v81 = (const void *)v131;
    size_t v78 = v80 - v131;
    if ((unint64_t)(v80 - v131) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_243;
    }
  }
  else
  {
    if ((BYTE8(v134) & 8) == 0)
    {
      size_t v78 = 0;
      HIBYTE(v126) = 0;
      p_dst = &__dst;
      goto LABEL_167;
    }
    v81 = (const void *)*((void *)&v129 + 1);
    size_t v78 = *((void *)&v130 + 1) - *((void *)&v129 + 1);
    if (*((void *)&v130 + 1) - *((void *)&v129 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_243:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v78 >= 0x17)
  {
    uint64_t v82 = (v78 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v78 | 7) != 0x17) {
      uint64_t v82 = v78 | 7;
    }
    uint64_t v83 = v82 + 1;
    p_dst = (long long *)operator new(v82 + 1);
    *((void *)&__dst + 1) = v78;
    unint64_t v126 = v83 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    long long v68 = (void **)(v67 + 3);
    goto LABEL_166;
  }
  HIBYTE(v126) = v78;
  p_dst = &__dst;
  if (v78) {
LABEL_166:
  }
    memmove(p_dst, v81, v78);
LABEL_167:
  *((unsigned char *)p_dst + v78) = 0;
  if (*((char *)v67 + 47) < 0) {
    operator delete(*v68);
  }
  *(_OWORD *)long long v68 = __dst;
  v84 = (void *)MEMORY[0x263F8C2B8];
  v68[2] = (void *)v126;
  *(void *)&long long v127 = *v84;
  uint64_t v85 = v84[9];
  *(void *)((char *)&v127 + *(void *)(v127 - 24)) = v84[8];
  *(void *)&long long v128 = v85;
  *((void *)&v128 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v133) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](v135);
  *long long v67 = &unk_26CAABB80;
  if (*((char *)v67 + 47) < 0) {
    long long v68 = (void **)*v68;
  }
  *((unsigned char *)v67 + 16) = a2;
  *((_WORD *)v67 + 9) = a3;
  *((unsigned char *)v67 + 20) = a4;
  *long long v67 = &unk_26CAABB80;
  v67[1] = v68;
  v86 = (uint64_t *)operator new(0x30uLL);
  unint64_t v19 = v86;
  *((unsigned char *)v86 + 32) = a2;
  *((unsigned char *)v86 + 33) = -86;
  *((_WORD *)v86 + 17) = a3;
  *((unsigned char *)v86 + 36) = a4;
  *((unsigned char *)v86 + 37) = -86;
  v86[5] = (uint64_t)v67;
  uint64_t v87 = qword_26AA5FBF0;
  if (qword_26AA5FBF0)
  {
    do
    {
      while (1)
      {
        v89 = (uint64_t *)v87;
        unsigned int v90 = *(unsigned __int8 *)(v87 + 32);
        BOOL v91 = v90 == a2;
        if (v90 <= a2) {
          char v92 = 1;
        }
        else {
          char v92 = -1;
        }
        if (v91)
        {
          unsigned int v93 = *(unsigned __int16 *)(v87 + 34);
          BOOL v94 = v93 == a3;
          char v92 = v93 <= a3 ? 1 : -1;
          if (v94)
          {
            unsigned int v95 = *(unsigned __int8 *)(v87 + 36);
            BOOL v96 = v95 == a4;
            char v92 = v95 <= a4 ? 1 : -1;
            if (v96) {
              char v92 = 0;
            }
          }
        }
        if ((v92 & 0x80) == 0) {
          break;
        }
        uint64_t v87 = *(void *)v87;
        v88 = v89;
        if (!*v89) {
          goto LABEL_195;
        }
      }
      uint64_t v87 = *(void *)(v87 + 8);
    }
    while (v87);
    v88 = v89 + 1;
  }
  else
  {
    v89 = &qword_26AA5FBF0;
    v88 = &qword_26AA5FBF0;
  }
LABEL_195:
  uint64_t *v86 = 0;
  v86[1] = 0;
  v86[2] = (uint64_t)v89;
  uint64_t *v88 = (uint64_t)v86;
  v97 = v86;
  if (*(void *)qword_26AA5FBE8)
  {
    qword_26AA5FBE8 = *(void *)qword_26AA5FBE8;
    v97 = (uint64_t *)*v88;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_26AA5FBF0, v97);
  ++qword_26AA5FBF8;
  v98 = (uint64_t *)v19[1];
  if (v98)
  {
    do
    {
      uint64_t v10 = v98;
      v98 = (uint64_t *)*v98;
    }
    while (v98);
  }
  else
  {
    uint64_t v10 = v19;
    do
    {
      v99 = v10;
      uint64_t v10 = (uint64_t *)v10[2];
    }
    while ((uint64_t *)*v10 != v99);
  }
LABEL_202:
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  if (v19 != v10)
  {
    v100 = 0;
    while (1)
    {
      uint64_t v101 = v19[5];
      unint64_t v102 = (unint64_t)a5[2];
      if ((unint64_t)v100 < v102)
      {
        *(void *)v100 = v101;
        v100 += 8;
        a5[1] = v100;
        v103 = (uint64_t *)v19[1];
        if (v103) {
          goto LABEL_226;
        }
        goto LABEL_228;
      }
      v104 = *a5;
      uint64_t v105 = v100 - *a5;
      uint64_t v106 = v105 >> 3;
      unint64_t v107 = (v105 >> 3) + 1;
      if (v107 >> 61) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v108 = v102 - (void)v104;
      if (v108 >> 2 > v107) {
        unint64_t v107 = v108 >> 2;
      }
      if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v109 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v109 = v107;
      }
      if (v109)
      {
        if (v109 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        v110 = operator new(8 * v109);
        v111 = &v110[8 * v106];
        *(void *)v111 = v101;
        uint64_t v112 = (uint64_t)(v111 + 8);
        v113 = (char *)(v100 - v104);
        if (v100 == v104)
        {
LABEL_223:
          *a5 = v111;
          a5[1] = (char *)v112;
          a5[2] = &v110[8 * v109];
          if (!v100) {
            goto LABEL_225;
          }
LABEL_224:
          operator delete(v100);
          goto LABEL_225;
        }
      }
      else
      {
        v110 = 0;
        v111 = (char *)(8 * v106);
        *(void *)(8 * v106) = v101;
        uint64_t v112 = 8 * v106 + 8;
        v113 = (char *)(v100 - v104);
        if (v100 == v104) {
          goto LABEL_223;
        }
      }
      unint64_t v114 = (unint64_t)(v113 - 8);
      if (v114 < 0x168)
      {
        v115 = v100;
        goto LABEL_219;
      }
      unint64_t v118 = (v100 - 8 - v104) & 0xFFFFFFFFFFFFFFF8;
      if (&v110[v105 - 8 - v118] > &v110[v105 - 8]) {
        break;
      }
      if (&v100[-v118 - 8] > v100 - 8)
      {
        v115 = v100;
        goto LABEL_219;
      }
      if ((unint64_t)(v100 - v110 - v105) < 0x20)
      {
        v115 = v100;
        goto LABEL_219;
      }
      uint64_t v119 = (v114 >> 3) + 1;
      uint64_t v120 = 8 * (v119 & 0x3FFFFFFFFFFFFFFCLL);
      v115 = &v100[-v120];
      v111 -= v120;
      v121 = &v110[8 * v106 - 16];
      v122 = v100 - 16;
      uint64_t v123 = v119 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v124 = *(_OWORD *)v122;
        *(v121 - 1) = *((_OWORD *)v122 - 1);
        _OWORD *v121 = v124;
        v121 -= 2;
        v122 -= 32;
        v123 -= 4;
      }
      while (v123);
      if (v119 != (v119 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_219;
      }
LABEL_220:
      v100 = *a5;
      *a5 = v111;
      a5[1] = (char *)v112;
      a5[2] = &v110[8 * v109];
      if (v100) {
        goto LABEL_224;
      }
LABEL_225:
      v100 = (char *)v112;
      a5[1] = (char *)v112;
      v103 = (uint64_t *)v19[1];
      if (v103)
      {
        do
        {
LABEL_226:
          v117 = v103;
          v103 = (uint64_t *)*v103;
        }
        while (v103);
        goto LABEL_204;
      }
      do
      {
LABEL_228:
        v117 = (uint64_t *)v19[2];
        BOOL v14 = *v117 == (void)v19;
        unint64_t v19 = v117;
      }
      while (!v14);
LABEL_204:
      unint64_t v19 = v117;
      if (v117 == v10) {
        return;
      }
    }
    v115 = v100;
    do
    {
LABEL_219:
      uint64_t v116 = *((void *)v115 - 1);
      v115 -= 8;
      *((void *)v111 - 1) = v116;
      v111 -= 8;
    }
    while (v115 != v104);
    goto LABEL_220;
  }
}

void sub_2192EE730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (v29[47] < 0) {
    operator delete(*v30);
  }
  operator delete(v29);
  _Unwind_Resume(a1);
}

uint64_t *QmiMessageDefinition::getDefaultTlvDefinition(QmiMessageDefinition *this)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_0, memory_order_acquire) & 1) != 0
    || !__cxa_guard_acquire(&_MergedGlobals_0))
  {
    return &qword_26AA5FBD8;
  }
  qword_26AA5FBD8 = (uint64_t)&unk_26CAABC08;
  unk_26AA5FBE0 = "(unknown tlv type)";
  __cxa_guard_release(&_MergedGlobals_0);
  return &qword_26AA5FBD8;
}

uint64_t std::__split_buffer<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v5 = v2 - 32;
      *(void *)(a1 + 16) = v2 - 32;
      if (*(char *)(v2 - 1) < 0)
      {
        operator delete(*(void **)(v2 - 24));
        uint64_t v5 = *(void *)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t *anonymous namespace'::UnknownQmiMessageDefinition::getTlvDefinition(_anonymous_namespace_::UnknownQmiMessageDefinition *this, int a2)
{
  if (a2 == 2 && *((unsigned char *)this + 20) == 1) {
    return &qword_26AA5FBC8;
  }
  size_t result = &qword_26AA5FBD8;
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_0, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&_MergedGlobals_0))
    {
      qword_26AA5FBD8 = (uint64_t)&unk_26CAABC08;
      unk_26AA5FBE0 = "(unknown tlv type)";
      __cxa_guard_release(&_MergedGlobals_0);
    }
    return &qword_26AA5FBD8;
  }
  return result;
}

uint64_t *anonymous namespace'::UnknownQmiMessageDefinition::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 20) == 1)
  {
    uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
    int v3 = (char)v2;
    if ((v2 & 0x80u) != 0) {
      uint64_t v2 = *(void *)(a2 + 8);
    }
    if (v2 == 13)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + 5);
      if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573) {
        return &qword_26AA5FBC8;
      }
    }
  }
  size_t result = &qword_26AA5FBD8;
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals_0, memory_order_acquire) & 1) == 0)
  {
    if (__cxa_guard_acquire(&_MergedGlobals_0))
    {
      qword_26AA5FBD8 = (uint64_t)&unk_26CAABC08;
      unk_26AA5FBE0 = "(unknown tlv type)";
      __cxa_guard_release(&_MergedGlobals_0);
    }
    return &qword_26AA5FBD8;
  }
  return result;
}

void anonymous namespace'::UnknownQmiMessageDefinition::~UnknownQmiMessageDefinition(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
}

{
  _anonymous_namespace_::UnknownQmiMessageDefinition *v1;
  uint64_t vars8;

  uint64_t v1 = (_anonymous_namespace_::UnknownQmiMessageDefinition *)this;
  if (*((char *)this + 47) < 0)
  {
    operator delete(this[3]);
    this = (void **)v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(this);
}

void anonymous namespace'::UnknownTlvType::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v7, *(const std::string::value_type **)(a1 + 8));
  *(unsigned char *)(a3 + 24) = 1;
  print_tlv_field(*(unsigned char **)a2, *(void *)(a2 + 8) - *(void *)a2, 2u, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  xpc_object_t v9 = xpc_string_create((const char *)p_p);
  xpc_object_t v12 = v9;
  if (!v9)
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v12 = v9;
  }
  print_tlv_field_pair("bytes", &v12, &value);
  xpc_object_t v10 = value;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), value);
  xpc_release(v10);
  xpc_object_t value = 0;
  xpc_release(v9);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_2192EED64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  BOOL v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    TlvAnnotation::~TlvAnnotation(v17);
    _Unwind_Resume(a1);
  }
  TlvAnnotation::~TlvAnnotation(v17);
  _Unwind_Resume(a1);
}

void anonymous namespace'::UnknownTlvType::build(xpc_object_t *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF86D8])
  {
    extract_tlv_field(a1, "bytes", 0, &object);
    sAttemptToDecodeData((unint64_t *)&v8, &object);
    xpc_object_t v5 = object;
    uint64_t v6 = v9;
    *(_OWORD *)a2 = v8;
    a2[2] = v6;
    xpc_release(v5);
  }
}

void sub_2192EEE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void std::string::__insert_from_safe_copy[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>(char *a1, unint64_t a2, size_t a3, uint64_t a4, char *a5)
{
  LODWORD(v10) = a1[23];
  if ((v10 & 0x80000000) != 0)
  {
    size_t v11 = *((void *)a1 + 1);
    unint64_t v15 = *((void *)a1 + 2);
    uint64_t v16 = v15 & 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v13 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v13 - v11 < a2)
    {
      unint64_t v12 = v11 + a2;
      if (0x7FFFFFFFFFFFFFF8 - v16 >= v11 + a2 - v13)
      {
        BOOL v14 = *(char **)a1;
        if (v13 > 0x3FFFFFFFFFFFFFF2)
        {
          size_t v18 = 0x7FFFFFFFFFFFFFF7;
          unint64_t v19 = (char *)operator new(0x7FFFFFFFFFFFFFF7uLL);
          if (!a3) {
            goto LABEL_17;
          }
          goto LABEL_16;
        }
LABEL_8:
        if (v12 <= 2 * v13) {
          unint64_t v12 = 2 * v13;
        }
        uint64_t v17 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v17 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v18 = v17 + 1;
        }
        else {
          size_t v18 = 23;
        }
        unint64_t v19 = (char *)operator new(v18);
        if (!a3) {
          goto LABEL_17;
        }
LABEL_16:
        memmove(v19, v14, a3);
LABEL_17:
        if (v11 != a3) {
          memmove(&v19[a3 + a2], &v14[a3], v11 - a3);
        }
        if (v13 != 22) {
          operator delete(v14);
        }
        *(void *)a1 = v19;
        *((void *)a1 + 2) = v18 | 0x8000000000000000;
        size_t v20 = v11 + a2;
        goto LABEL_27;
      }
LABEL_48:
      std::string::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = HIBYTE(v15);
    unint64_t v19 = *(char **)a1;
    size_t v21 = a3;
    size_t v22 = v11 - a3;
    if (v11 != a3) {
      goto LABEL_23;
    }
  }
  else
  {
    size_t v11 = a1[23];
    if (22 - v11 < a2)
    {
      unint64_t v12 = v11 + a2;
      if (v11 + a2 - 0x7FFFFFFFFFFFFFF8 >= 0x800000000000001ELL)
      {
        unint64_t v13 = 22;
        BOOL v14 = a1;
        goto LABEL_8;
      }
      goto LABEL_48;
    }
    unint64_t v19 = a1;
    size_t v21 = a3;
    size_t v22 = v11 - a3;
    if (v11 != a3)
    {
LABEL_23:
      memmove(&v19[a3 + a2], &v19[a3], v22);
      LOBYTE(v10) = a1[23];
      size_t v21 = v11;
    }
  }
  size_t v20 = v21 + a2;
  if ((v10 & 0x80) == 0)
  {
    a1[23] = v20 & 0x7F;
    v19[v20] = 0;
    if ((char *)a4 == a5) {
      return;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)a1 + 1) = v20;
  v19[v20] = 0;
  if ((char *)a4 == a5) {
    return;
  }
LABEL_28:
  BOOL v23 = &v19[a3];
  unint64_t v24 = (unint64_t)&a5[-a4];
  if ((unint64_t)&a5[-a4] < 8)
  {
    unsigned int v25 = (char *)a4;
    goto LABEL_46;
  }
  unsigned int v25 = (char *)a4;
  if ((unint64_t)&v23[-a4] < 0x20)
  {
    do
    {
LABEL_46:
      char v35 = *v25++;
      *v23++ = v35;
    }
    while (v25 != a5);
    return;
  }
  if (v24 < 0x20)
  {
    unint64_t v26 = 0;
    goto LABEL_41;
  }
  unint64_t v26 = v24 & 0xFFFFFFFFFFFFFFE0;
  unsigned int v27 = (long long *)(a4 + 16);
  BOOL v28 = &v19[a3 + 16];
  unint64_t v29 = v24 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    long long v30 = *v27;
    *((_OWORD *)v28 - 1) = *(v27 - 1);
    *(_OWORD *)BOOL v28 = v30;
    v27 += 2;
    v28 += 32;
    v29 -= 32;
  }
  while (v29);
  if (v24 == v26) {
    return;
  }
  if ((v24 & 0x18) == 0)
  {
    unsigned int v25 = (char *)(a4 + v26);
    v23 += v26;
    goto LABEL_46;
  }
LABEL_41:
  v23 += v24 & 0xFFFFFFFFFFFFFFF8;
  unsigned int v25 = (char *)(a4 + (v24 & 0xFFFFFFFFFFFFFFF8));
  uint64_t v31 = (uint64_t *)(a4 + v26);
  unsigned int v32 = &v19[v26 + a3];
  unint64_t v33 = v26 - (v24 & 0xFFFFFFFFFFFFFFF8);
  do
  {
    uint64_t v34 = *v31++;
    *(void *)unsigned int v32 = v34;
    v32 += 8;
    v33 += 8;
  }
  while (v33);
  if (v24 != (v24 & 0xFFFFFFFFFFFFFFF8)) {
    goto LABEL_46;
  }
}

void std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(*a1);
    std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__shared_ptr_emplace<QmiMessageRegistryPrivate>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAABC50;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<QmiMessageRegistryPrivate>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAABC50;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<QmiMessageRegistryPrivate>::__on_zero_shared(uint64_t a1)
{
}

_DWORD *std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(uint64_t **a1, uint64_t a2, void *a3)
{
  uint64_t v6 = operator new(0x30uLL);
  uint64_t v7 = v6;
  v6[8] = *(_DWORD *)a2;
  *((_WORD *)v6 + 18) = *(_WORD *)(a2 + 4);
  *((void *)v6 + 5) = *a3;
  long long v8 = a1 + 1;
  uint64_t v9 = (uint64_t **)a1[1];
  if (v9)
  {
    unsigned int v10 = *((unsigned __int8 *)v6 + 32);
    unsigned int v11 = *((unsigned __int16 *)v6 + 17);
    unsigned int v12 = *((unsigned __int8 *)v6 + 36);
    do
    {
      while (1)
      {
        long long v8 = v9;
        unsigned int v14 = *((unsigned __int8 *)v9 + 32);
        BOOL v15 = v10 == v14;
        if (v10 >= v14) {
          char v16 = 1;
        }
        else {
          char v16 = -1;
        }
        if (v15)
        {
          unsigned int v17 = *((unsigned __int16 *)v9 + 17);
          BOOL v18 = v11 == v17;
          char v16 = v11 >= v17 ? 1 : -1;
          if (v18)
          {
            unsigned int v19 = *((unsigned __int8 *)v9 + 36);
            BOOL v20 = v12 == v19;
            char v16 = v12 >= v19 ? 1 : -1;
            if (v20) {
              char v16 = 0;
            }
          }
        }
        if ((v16 & 0x80) == 0) {
          break;
        }
        uint64_t v9 = (uint64_t **)*v9;
        unint64_t v13 = v8;
        if (!*v8) {
          goto LABEL_23;
        }
      }
      uint64_t v9 = (uint64_t **)v9[1];
    }
    while (v9);
    unint64_t v13 = v8 + 1;
  }
  else
  {
    unint64_t v13 = a1 + 1;
  }
LABEL_23:
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = v8;
  *unint64_t v13 = (uint64_t *)v6;
  size_t v21 = (uint64_t *)**a1;
  size_t v22 = (uint64_t *)v6;
  if (v21)
  {
    *a1 = v21;
    size_t v22 = *v13;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v22);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v7;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    int v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *int v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          int v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        *uint64_t v9 = v2;
        *(void *)(v2 + 16) = v9;
        int v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *int v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      _DWORD v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    unsigned char *v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    xpc_object_t v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      int v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    int v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  unint64_t v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  void v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  *unint64_t v13 = (uint64_t)v3;
  _DWORD v3[2] = (uint64_t)v13;
  return result;
}

uint64_t _GLOBAL__sub_I_QMIMessageRegistry_cpp()
{
  qword_26AA5FBC8 = (uint64_t)&unk_26CAABAF8;
  unk_26AA5FBD0 = "QMI Response Result";
  __cxa_atexit((void (*)(void *))TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::~TlvDefinitionImpl, &qword_26AA5FBC8, &dword_2192DD000);
  qword_26AA5FBF0 = 0;
  qword_26AA5FBE8 = (uint64_t)&qword_26AA5FBF0;
  qword_26AA5FBF8 = 0;

  return __cxa_atexit((void (*)(void *))std::multimap<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>::~multimap[abi:ne180100], &qword_26AA5FBE8, &dword_2192DD000);
}

uint64_t ___ZN3qmi5parseEPKhiU13block_pointerFvRKNS_10QMuxHeaderES1_iE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (a5 < (int)a4)
  {
    a3 = 0;
    a4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, a2, a3, a4);
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
}

uint64_t qmi::createRequest@<X0>(int a1@<W0>, char a2@<W1>, __int16 a3@<W2>, unsigned int a4@<W3>, uint64_t a5@<X4>, void *a6@<X8>)
{
  if (a1) {
    uint64_t v11 = 9;
  }
  else {
    uint64_t v11 = 8;
  }
  uint64_t v12 = a4;
  size_t v13 = v11 + a4;
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  uint64_t v14 = operator new(v13);
  *a6 = v14;
  a6[2] = &v14[v13];
  bzero(v14, v13);
  a6[1] = &v14[v13];
  unsigned char *v14 = 1;
  *(_WORD *)(v14 + 1) = v13 - 1;
  v14[3] = 0;
  v14[4] = a1;
  v14[5] = a2;
  v14[6] = 0;
  v14[7] = a3;
  if (a1) {
    v14[8] = HIBYTE(a3);
  }
  return (*(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(a5 + 16))(a5, &v14[v11], v12);
}

void sub_2192EF704(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t qmi::stripRequestHeader(int a1, uint64_t **a2)
{
  uint64_t v2 = **a2;
  unint64_t v3 = (*a2)[1] - v2;
  unint64_t v4 = 8;
  if (a1) {
    unint64_t v4 = 9;
  }
  uint64_t v5 = v2 + v4;
  if (v3 >= v4) {
    return v5;
  }
  else {
    return 0;
  }
}

void *___ZN3qmi13createRequestEhNS_11buffer_viewE_block_invoke(uint64_t a1, void *__dst, size_t a3)
{
  if (*(void *)(a1 + 48) < a3) {
    a3 = *(void *)(a1 + 48);
  }
  return memcpy(__dst, *(const void **)(a1 + 32), a3);
}

void std::__shared_ptr_emplace<qmi::SerializedMessage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAABCD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<qmi::SerializedMessage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CAABCD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void defaultWriteHandler()
{
  exception = __cxa_allocate_exception(0x20uLL);
  tlv_write_exception::tlv_write_exception((uint64_t)exception);
}

void sub_2192EF824(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (*qmi::MutableMessageBase::setWriteErrorHandler(void (*result)()))()
{
  qmi::MutableMessageBase::sWriteErrorHandler = result;
  return result;
}

uint64_t qmi::MutableMessageBase::MutableMessageBase(uint64_t this)
{
  *(_WORD *)this = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  return this;
}

{
  *(_WORD *)this = 0;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  return this;
}

qmi::MutableMessageBase *qmi::MutableMessageBase::MutableMessageBase(qmi::MutableMessageBase *this, const qmi::MutableMessageBase *a2)
{
  __int16 v3 = *(_WORD *)a2;
  *((void *)this + 1) = 0;
  char v35 = (char **)((char *)this + 8);
  *(_WORD *)this = v3;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v4 = *((void *)a2 + 2);
  uint64_t v6 = v4 - v5;
  if (v4 != v5)
  {
    if (v6 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    int v8 = (char *)operator new(v4 - v5);
    *((void *)this + 1) = v8;
    *((void *)this + 2) = v8;
    *((void *)this + 3) = &v8[8 * (v6 >> 3)];
    uint64_t v9 = *((void *)a2 + 1);
    uint64_t v10 = *((void *)a2 + 2);
    while (1)
    {
      if (v9 == v10) {
        return this;
      }
      uint64_t v12 = (*(uint64_t (**)(void))(**(void **)v9 + 32))();
      uint64_t v13 = v12;
      BOOL v15 = (char *)*((void *)this + 2);
      unint64_t v14 = *((void *)this + 3);
      if ((unint64_t)v15 < v14)
      {
        *(void *)BOOL v15 = v12;
        uint64_t v11 = (uint64_t)(v15 + 8);
        goto LABEL_5;
      }
      char v16 = *v35;
      uint64_t v17 = v15 - *v35;
      uint64_t v18 = v17 >> 3;
      unint64_t v19 = (v17 >> 3) + 1;
      if (v19 >> 61) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = v14 - (void)v16;
      if (v20 >> 2 > v19) {
        unint64_t v19 = v20 >> 2;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v19;
      }
      if (v21)
      {
        if (v21 >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        size_t v22 = operator new(8 * v21);
        BOOL v23 = (uint64_t *)&v22[8 * v18];
        *BOOL v23 = v13;
        uint64_t v11 = (uint64_t)(v23 + 1);
        unint64_t v24 = (char *)(v15 - v16);
        if (v15 == v16)
        {
LABEL_17:
          *((void *)this + 1) = v23;
          *((void *)this + 2) = v11;
          *((void *)this + 3) = &v22[8 * v21];
          if (v15) {
            goto LABEL_27;
          }
          goto LABEL_5;
        }
      }
      else
      {
        size_t v22 = 0;
        BOOL v23 = (uint64_t *)(8 * v18);
        *(void *)(8 * v18) = v13;
        uint64_t v11 = 8 * v18 + 8;
        unint64_t v24 = (char *)(v15 - v16);
        if (v15 == v16) {
          goto LABEL_17;
        }
      }
      unint64_t v25 = (unint64_t)(v24 - 8);
      if (v25 < 0x58) {
        goto LABEL_34;
      }
      if ((unint64_t)(v15 - v22 - v17) < 0x20) {
        goto LABEL_34;
      }
      uint64_t v26 = (v25 >> 3) + 1;
      uint64_t v27 = 8 * (v26 & 0x3FFFFFFFFFFFFFFCLL);
      BOOL v28 = &v15[-v27];
      BOOL v23 = (uint64_t *)((char *)v23 - v27);
      unint64_t v29 = &v22[8 * v18 - 16];
      long long v30 = v15 - 16;
      uint64_t v31 = v26 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v32 = *(_OWORD *)v30;
        *(v29 - 1) = *((_OWORD *)v30 - 1);
        *unint64_t v29 = v32;
        v29 -= 2;
        v30 -= 32;
        v31 -= 4;
      }
      while (v31);
      BOOL v15 = v28;
      if (v26 != (v26 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_34:
        do
        {
          uint64_t v33 = *((void *)v15 - 1);
          v15 -= 8;
          *--BOOL v23 = v33;
        }
        while (v15 != v16);
      }
      BOOL v15 = *v35;
      *((void *)this + 1) = v23;
      *((void *)this + 2) = v11;
      *((void *)this + 3) = &v22[8 * v21];
      if (v15) {
LABEL_27:
      }
        operator delete(v15);
LABEL_5:
      *((void *)this + 2) = v11;
      v9 += 8;
    }
  }
  return this;
}

void sub_2192EFAA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10)
{
  uint64_t v12 = *a10;
  if (*a10)
  {
    *(void *)(v10 + 16) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t qmi::MutableMessageBase::MutableMessageBase(uint64_t this, const qmi::MessageBase *a2)
{
  *(_WORD *)this = *(_WORD *)a2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  return this;
}

{
  *(_WORD *)this = *(_WORD *)a2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(void *)(this + 8) = 0;
  return this;
}

const qmi::MutableMessageBase *qmi::MutableMessageBase::operator=(const qmi::MutableMessageBase *a1, const qmi::MutableMessageBase *a2)
{
  if (a1 != a2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)uint64_t v11 = v3;
    *(_OWORD *)&v11[16] = v3;
    qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v11, a2);
    __int16 v4 = *(_WORD *)a1;
    *(_WORD *)a1 = *(_WORD *)v11;
    *(_WORD *)uint64_t v11 = v4;
    long long v6 = *(_OWORD *)&v11[8];
    *(void *)&v11[8] = *((void *)a1 + 1);
    uint64_t v5 = *(void **)&v11[8];
    uint64_t v7 = *(void *)&v11[24];
    long long v8 = *((_OWORD *)a1 + 1);
    *(_OWORD *)((char *)a1 + 8) = v6;
    *((void *)a1 + 3) = v7;
    *(_OWORD *)&v11[16] = v8;
    uint64_t v9 = (void *)v8;
    if (v5 == (void *)v8)
    {
      if (v5)
      {
LABEL_4:
        *(void *)&v11[16] = v5;
        operator delete(v5);
      }
    }
    else
    {
      do
      {
        if (*v5) {
          (*(void (**)(void))(*(void *)*v5 + 8))(*v5);
        }
        ++v5;
      }
      while (v5 != v9);
      uint64_t v5 = *(void **)&v11[8];
      if (*(void *)&v11[8]) {
        goto LABEL_4;
      }
    }
  }
  return a1;
}

__int16 *qmi::MutableMessageBase::swap(__int16 *this, qmi::MutableMessageBase *a2)
{
  __int16 v2 = *this;
  *this = *(_WORD *)a2;
  *(_WORD *)a2 = v2;
  uint64_t v3 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v3;
  uint64_t v4 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v4;
  uint64_t v5 = *((void *)this + 3);
  *((void *)this + 3) = *((void *)a2 + 3);
  *((void *)a2 + 3) = v5;
  return this;
}

uint64_t qmi::MutableMessageBase::operator=(uint64_t a1, __int16 *a2)
{
  if ((__int16 *)a1 != a2)
  {
    __int16 v3 = *a2;
    uint64_t v4 = *((void *)a2 + 3);
    long long v5 = *(_OWORD *)(a2 + 4);
    *((void *)a2 + 2) = 0;
    *((void *)a2 + 3) = 0;
    *((void *)a2 + 1) = 0;
    *(_WORD *)a1 = v3;
    long long v6 = *(void **)(a1 + 8);
    uint64_t v7 = *(void **)(a1 + 16);
    *(_OWORD *)(a1 + 8) = v5;
    *(void *)(a1 + 24) = v4;
    if (v6 != v7)
    {
      long long v8 = v6;
      do
      {
        if (*v8) {
          (*(void (**)(void))(*(void *)*v8 + 8))(*v8);
        }
        ++v8;
      }
      while (v8 != v7);
    }
    if (v6) {
      operator delete(v6);
    }
  }
  return a1;
}

uint64_t qmi::MutableMessageBase::getSize(qmi::MutableMessageBase *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  __int16 v2 = (uint64_t *)*((void *)this + 2);
  for (uint64_t i = 4; v1 != v2; i += (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4))
    uint64_t v4 = *v1++;
  return i;
}

uint64_t tlv_write_exception::tlv_write_exception(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v2 = a1 + 8;
  *(void *)a1 = &unk_26CAABD38;
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[7] = v3;
  v26[8] = v3;
  v26[5] = v3;
  v26[6] = v3;
  v26[3] = v3;
  v26[4] = v3;
  v26[1] = v3;
  v26[2] = v3;
  long long v25 = v3;
  v26[0] = v3;
  *(_OWORD *)std::string __p = v3;
  long long v24 = v3;
  long long v21 = v3;
  long long v22 = v3;
  long long v19 = v3;
  long long v20 = v3;
  long long v18 = v3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v18);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v19, (uint64_t)"tlv_write_exception: msgId=", 27);
  uint64_t v4 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)" wrote ", 7);
  long long v5 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)" of ", 4);
  long long v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" expected bytes", 15);
  if ((BYTE8(v25) & 0x10) != 0)
  {
    uint64_t v9 = v25;
    if ((unint64_t)v25 < *((void *)&v22 + 1))
    {
      *(void *)&long long v25 = *((void *)&v22 + 1);
      uint64_t v9 = *((void *)&v22 + 1);
    }
    uint64_t v10 = (const void *)v22;
    size_t v7 = v9 - v22;
    if ((unint64_t)(v9 - v22) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v25) & 8) == 0)
    {
      size_t v7 = 0;
      HIBYTE(v17) = 0;
      p_dst = &__dst;
      goto LABEL_14;
    }
    uint64_t v10 = (const void *)*((void *)&v20 + 1);
    size_t v7 = *((void *)&v21 + 1) - *((void *)&v20 + 1);
    if (*((void *)&v21 + 1) - *((void *)&v20 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v7 >= 0x17)
  {
    uint64_t v11 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v11 = v7 | 7;
    }
    uint64_t v12 = v11 + 1;
    p_dst = (long long *)operator new(v11 + 1);
    *((void *)&__dst + 1) = v7;
    unint64_t v17 = v12 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v17) = v7;
  p_dst = &__dst;
  if (v7) {
LABEL_13:
  }
    memmove(p_dst, v10, v7);
LABEL_14:
  *((unsigned char *)p_dst + v7) = 0;
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)v2);
  }
  *(_OWORD *)uint64_t v2 = __dst;
  uint64_t v13 = (void *)MEMORY[0x263F8C2B8];
  *(void *)(v2 + 16) = v17;
  *(void *)&long long v18 = *v13;
  uint64_t v14 = v13[9];
  *(void *)((char *)&v18 + *(void *)(v18 - 24)) = v13[8];
  *(void *)&long long v19 = v14;
  *((void *)&v19 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x21D487470](v26);
  return a1;
}

void sub_2192F010C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (*(char *)(v29 + 31) < 0) {
    operator delete(*v30);
  }
  std::exception::~exception((std::exception *)v29);
  _Unwind_Resume(a1);
}

void tlv_write_exception::~tlv_write_exception(std::exception *this)
{
  uint64_t v1 = this;
  this->__vftable = (std::exception_vtbl *)&unk_26CAABD38;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    this = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26CAABD38;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    std::exception::~exception(this);
  }
  else
  {
    std::exception::~exception(this);
  }
  operator delete(v2);
}

uint64_t tlv_write_exception::what(tlv_write_exception *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, BOOL *a3)
{
  uint64_t result = (*(uint64_t (**)(qmi *, uint64_t, BOOL *))(*(void *)this + 16))(this, 1, a3);
  *(unsigned char *)a2 = result != 0;
  return result;
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, signed __int8 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 1);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unsigned __int8 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 1);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, __int16 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 2);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unsigned __int16 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 2);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, int *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 4);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unsigned int *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 4);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unint64_t *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 8);
}

uint64_t qmi::generateRandomField(uint64_t a1, std::string *a2)
{
  unint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 8))(a1, 20);
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
  {
    unint64_t size = a2->__r_.__value_.__l.__size_;
    if (size >= v4)
    {
      long long v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
      a2->__r_.__value_.__l.__size_ = v4;
      goto LABEL_7;
    }
LABEL_5:
    std::string::append(a2, v4 - size, 0);
    goto LABEL_8;
  }
  unint64_t size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  if (v4 > size) {
    goto LABEL_5;
  }
  *((unsigned char *)&a2->__r_.__value_.__s + 23) = v4 & 0x7F;
  long long v6 = a2;
LABEL_7:
  v6->__r_.__value_.__s.__data_[v4] = 0;
LABEL_8:
  int v7 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
  if (v7 >= 0) {
    long long v8 = a2;
  }
  else {
    long long v8 = (std::string *)a2->__r_.__value_.__r.__words[0];
  }
  if (v7 >= 0) {
    std::string::size_type v9 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v9 = a2->__r_.__value_.__l.__size_;
  }
  uint64_t v10 = *(uint64_t (**)(uint64_t, std::string *, std::string::size_type))(*(void *)a1 + 24);

  return v10(a1, v8, v9);
}

uint64_t qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *a2, int a3)
{
  uint64_t v3 = a2 ^ a3;
  if (v3 != 1) {
    return v3;
  }
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23[7] = v5;
  v23[8] = v5;
  v23[5] = v5;
  v23[6] = v5;
  v23[3] = v5;
  v23[4] = v5;
  v23[1] = v5;
  v23[2] = v5;
  v23[0] = v5;
  long long v21 = v5;
  long long v22 = v5;
  long long v19 = v5;
  *(_OWORD *)std::string __p = v5;
  long long v17 = v5;
  long long v18 = v5;
  long long v16 = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)"Mismatch in BOOL field: actual=", 31);
  long long v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v22) & 0x10) != 0)
  {
    uint64_t v9 = v22;
    if ((unint64_t)v22 < *((void *)&v19 + 1))
    {
      *(void *)&long long v22 = *((void *)&v19 + 1);
      uint64_t v9 = *((void *)&v19 + 1);
    }
    uint64_t v10 = (const void *)v19;
    size_t v7 = v9 - v19;
    if ((unint64_t)(v9 - v19) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v22) & 8) == 0)
    {
      size_t v7 = 0;
      HIBYTE(v15) = 0;
      long long v8 = __dst;
      goto LABEL_15;
    }
    uint64_t v10 = (const void *)*((void *)&v17 + 1);
    size_t v7 = *((void *)&v18 + 1) - *((void *)&v17 + 1);
    if (*((void *)&v18 + 1) - *((void *)&v17 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v7 >= 0x17)
  {
    uint64_t v11 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17) {
      uint64_t v11 = v7 | 7;
    }
    uint64_t v12 = v11 + 1;
    long long v8 = (void **)operator new(v11 + 1);
    __dst[1] = (void *)v7;
    unint64_t v15 = v12 | 0x8000000000000000;
    __dst[0] = v8;
    goto LABEL_14;
  }
  HIBYTE(v15) = v7;
  long long v8 = __dst;
  if (v7) {
LABEL_14:
  }
    memmove(v8, v10, v7);
LABEL_15:
  *((unsigned char *)v8 + v7) = 0;
  memset(&v25, 170, sizeof(v25));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v25);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v25, __dst);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v25.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v15) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v15) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v16 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v16 + *(void *)(v16 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v16 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v23);
  return v3;
}

void sub_2192F08B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F0914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F0928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *a2, int a3)
{
  int v4 = (int)a2;
  if (a2 == a3) {
    return v4 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in int8_t field: actual=", 33);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return v4 != a3;
}

{
  int v4;
  long long v6;
  void *v7;
  size_t v8;
  void **v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::string v26;

  int v4 = (int)a2;
  if (a2 == a3) {
    return v4 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in uint8_t field: actual=", 34);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return v4 != a3;
}

{
  int v4;
  long long v6;
  void *v7;
  size_t v8;
  void **v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::string v26;

  int v4 = (int)a2;
  if (a2 == a3) {
    return v4 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in int16_t field: actual=", 34);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return v4 != a3;
}

{
  int v4;
  long long v6;
  void *v7;
  size_t v8;
  void **v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::string v26;

  int v4 = (int)a2;
  if (a2 == a3) {
    return v4 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in uint16_t field: actual=", 35);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return v4 != a3;
}

{
  int v4;
  long long v6;
  void *v7;
  size_t v8;
  void **v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::string v26;

  int v4 = (int)a2;
  if (a2 == a3) {
    return v4 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in int32_t field: actual=", 34);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return v4 != a3;
}

{
  int v4;
  long long v6;
  void *v7;
  size_t v8;
  void **v9;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  void *__dst[2];
  unint64_t v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  void *__p[2];
  long long v22;
  long long v23;
  _OWORD v24[9];
  unint64_t v25;
  std::string v26;

  int v4 = (int)a2;
  if (a2 == a3) {
    return v4 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in uint32_t field: actual=", 35);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return v4 != a3;
}

void sub_2192F0C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F0C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F0CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F0FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F100C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F1020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F132C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F1388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F139C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F16A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F1704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F1718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F1A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F1A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F1A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F1DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F1DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F1E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *a2, qmi::RandomMessageReporter *a3)
{
  if (a2 == a3) {
    return a2 != a3;
  }
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v6;
  v24[8] = v6;
  v24[5] = v6;
  v24[6] = v6;
  v24[3] = v6;
  v24[4] = v6;
  v24[1] = v6;
  v24[2] = v6;
  v24[0] = v6;
  long long v22 = v6;
  long long v23 = v6;
  long long v20 = v6;
  *(_OWORD *)std::string __p = v6;
  long long v18 = v6;
  long long v19 = v6;
  long long v17 = v6;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mismatch in uint64_t field: actual=", 35);
  size_t v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v10 = v23;
    if ((unint64_t)v23 < *((void *)&v20 + 1))
    {
      *(void *)&long long v23 = *((void *)&v20 + 1);
      uint64_t v10 = *((void *)&v20 + 1);
    }
    uint64_t v11 = (const void *)v20;
    size_t v8 = v10 - v20;
    if ((unint64_t)(v10 - v20) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_24;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      HIBYTE(v16) = 0;
      uint64_t v9 = __dst;
      goto LABEL_15;
    }
    uint64_t v11 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_24:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v12 = v8 | 7;
    }
    uint64_t v13 = v12 + 1;
    uint64_t v9 = (void **)operator new(v12 + 1);
    __dst[1] = (void *)v8;
    unint64_t v16 = v13 | 0x8000000000000000;
    __dst[0] = v9;
    goto LABEL_14;
  }
  HIBYTE(v16) = v8;
  uint64_t v9 = __dst;
  if (v8) {
LABEL_14:
  }
    memmove(v9, v11, v8);
LABEL_15:
  *((unsigned char *)v9 + v8) = 0;
  memset(&v26, 170, sizeof(v26));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v26);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v26, __dst);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v26.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v16) & 0x80000000) == 0) {
      goto LABEL_17;
    }
LABEL_22:
    operator delete(__dst[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v16) < 0) {
    goto LABEL_22;
  }
LABEL_17:
  *(void *)&long long v17 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v24);
  return a2 != a3;
}

void sub_2192F211C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0)
  {
    operator delete(*(void **)(v16 - 88));
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a16);
      _Unwind_Resume(a1);
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_2192F2178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_2192F218C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t qmi::validateTlvFields(std::string **a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v6 = a2[23];
  size_t v7 = *((void *)a2 + 1);
  if ((v6 & 0x80u) == 0) {
    uint64_t v8 = a2[23];
  }
  else {
    uint64_t v8 = *((void *)a2 + 1);
  }
  uint64_t v9 = a3[23];
  int v10 = (char)v9;
  if ((v9 & 0x80u) != 0) {
    uint64_t v9 = *((void *)a3 + 1);
  }
  if (v8 != v9) {
    goto LABEL_17;
  }
  if (v10 >= 0) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = *(unsigned __int8 **)a3;
  }
  if ((v6 & 0x80) != 0)
  {
    uint64_t result = memcmp(*(const void **)a2, v11, v7);
    if (!result) {
      return result;
    }
LABEL_17:
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v40[7] = v14;
    v40[8] = v14;
    v40[5] = v14;
    v40[6] = v14;
    v40[3] = v14;
    v40[4] = v14;
    v40[1] = v14;
    v40[2] = v14;
    v40[0] = v14;
    long long v38 = v14;
    long long v39 = v14;
    long long v36 = v14;
    *(_OWORD *)unsigned int v37 = v14;
    long long v34 = v14;
    long long v35 = v14;
    long long v33 = v14;
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v33);
    unint64_t v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v33, (uint64_t)"Mismatch in string field: ", 26);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"actual=[", 8);
    uint64_t v16 = (void *)std::ostream::operator<<();
    long long v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)" bytes]:", 8);
    ctu::py_escape((char *)a2, 1, &v42);
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v18 = &v42;
    }
    else {
      long long v18 = (std::string *)v42.__r_.__value_.__r.__words[0];
    }
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v42.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v42.__r_.__value_.__l.__size_;
    }
    long long v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)v18, size);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)", expected=[", 12);
    long long v21 = (void *)std::ostream::operator<<();
    long long v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)" bytes]:", 8);
    ctu::py_escape((char *)a3, 1, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v24 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v24 = __p.__r_.__value_.__l.__size_;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)p_p, v24);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_31:
        char v25 = BYTE8(v39);
        if ((BYTE8(v39) & 0x10) == 0) {
          goto LABEL_32;
        }
        goto LABEL_37;
      }
    }
    else if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_31;
    }
    operator delete(v42.__r_.__value_.__l.__data_);
    char v25 = BYTE8(v39);
    if ((BYTE8(v39) & 0x10) == 0)
    {
LABEL_32:
      if ((v25 & 8) == 0)
      {
        std::string::size_type v26 = 0;
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
        unint64_t v27 = &__p;
        goto LABEL_47;
      }
      uint64_t v29 = (const void *)*((void *)&v34 + 1);
      std::string::size_type v26 = *((void *)&v35 + 1) - *((void *)&v34 + 1);
      if (*((void *)&v35 + 1) - *((void *)&v34 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_55:
      }
        std::string::__throw_length_error[abi:ne180100]();
LABEL_40:
      if (v26 >= 0x17)
      {
        uint64_t v30 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v26 | 7) != 0x17) {
          uint64_t v30 = v26 | 7;
        }
        uint64_t v31 = v30 + 1;
        unint64_t v27 = (std::string *)operator new(v30 + 1);
        __p.__r_.__value_.__l.__size_ = v26;
        __p.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v27;
      }
      else
      {
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = v26;
        unint64_t v27 = &__p;
        if (!v26)
        {
LABEL_47:
          v27->__r_.__value_.__s.__data_[v26] = 0;
          memset(&v42, 170, sizeof(v42));
          ctu::join<std::__wrap_iter<char const**>>(a1[1], a1[2], "::", 2uLL, &v42);
          ((void (*)(std::string **, std::string *, std::string *))(*a1)->__r_.__value_.__r.__words[2])(a1, &v42, &__p);
          if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v42.__r_.__value_.__l.__data_);
            if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
              goto LABEL_49;
            }
          }
          else if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
LABEL_49:
            *(void *)&long long v33 = *MEMORY[0x263F8C2C8];
            *(void *)((char *)&v33 + *(void *)(v33 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
            *((void *)&v33 + 1) = MEMORY[0x263F8C318] + 16;
            if (SHIBYTE(v38) < 0) {
              operator delete(v37[1]);
            }
            std::streambuf::~streambuf();
            std::ostream::~ostream();
            MEMORY[0x21D487470](v40);
            return 1;
          }
          operator delete(__p.__r_.__value_.__l.__data_);
          goto LABEL_49;
        }
      }
      memmove(v27, v29, v26);
      goto LABEL_47;
    }
LABEL_37:
    uint64_t v28 = v39;
    if ((unint64_t)v39 < *((void *)&v36 + 1))
    {
      *(void *)&long long v39 = *((void *)&v36 + 1);
      uint64_t v28 = *((void *)&v36 + 1);
    }
    uint64_t v29 = (const void *)v36;
    std::string::size_type v26 = v28 - v36;
    if ((unint64_t)(v28 - v36) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_55;
    }
    goto LABEL_40;
  }
  if (!v6) {
    return 0;
  }
  uint64_t v12 = a2;
  do
  {
    if (*v12 != *v11) {
      goto LABEL_17;
    }
    ++v12;
    ++v11;
    --v6;
  }
  while (v6);
  return 0;
}

void sub_2192F2624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 49) < 0) {
    operator delete(*(void **)(v16 - 72));
  }
  if (a15 < 0)
  {
    operator delete(__p);
    std::ostringstream::~ostringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *__s1, size_t __n, void *__s2, const void *a5)
{
  if ((const void *)__n == a5)
  {
    uint64_t result = memcmp(__s1, __s2, __n);
    if (!result) {
      return result;
    }
  }
  unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[7] = v11;
  v36[8] = v11;
  v36[5] = v11;
  v36[6] = v11;
  v36[3] = v11;
  v36[4] = v11;
  v36[1] = v11;
  v36[2] = v11;
  v36[0] = v11;
  long long v34 = v11;
  long long v35 = v11;
  long long v32 = v11;
  *(_OWORD *)long long v33 = v11;
  long long v30 = v11;
  long long v31 = v11;
  long long v29 = v11;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v29);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v29, (uint64_t)"Mismatch in binary blob field: actual=[", 39);
  uint64_t v12 = (void *)std::ostream::operator<<();
  uint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" bytes]:", 8);
  ctu::hex_sp(__s1, __n, &v38);
  if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v14 = &v38;
  }
  else {
    long long v14 = (std::string *)v38.__r_.__value_.__r.__words[0];
  }
  if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v38.__r_.__value_.__l.__size_;
  }
  uint64_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)v14, size);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)", expected=[", 12);
  long long v17 = (void *)std::ostream::operator<<();
  long long v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" bytes]:", 8);
  ctu::hex_sp((ctu *)__s2, (uint64_t)a5, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v20 = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)p_p, v20);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_17:
      char v21 = BYTE8(v35);
      if ((BYTE8(v35) & 0x10) == 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v24 = v35;
      if ((unint64_t)v35 < *((void *)&v32 + 1))
      {
        *(void *)&long long v35 = *((void *)&v32 + 1);
        uint64_t v24 = *((void *)&v32 + 1);
      }
      char v25 = (const void *)v32;
      std::string::size_type v22 = v24 - v32;
      if ((unint64_t)(v24 - v32) >= 0x7FFFFFFFFFFFFFF8) {
        goto LABEL_41;
      }
      goto LABEL_25;
    }
  }
  else if ((SHIBYTE(v38.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  operator delete(v38.__r_.__value_.__l.__data_);
  char v21 = BYTE8(v35);
  if ((BYTE8(v35) & 0x10) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  if ((v21 & 8) == 0)
  {
    std::string::size_type v22 = 0;
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
    long long v23 = &__p;
    goto LABEL_32;
  }
  char v25 = (const void *)*((void *)&v30 + 1);
  std::string::size_type v22 = *((void *)&v31 + 1) - *((void *)&v30 + 1);
  if (*((void *)&v31 + 1) - *((void *)&v30 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_41:
  }
    std::string::__throw_length_error[abi:ne180100]();
LABEL_25:
  if (v22 >= 0x17)
  {
    uint64_t v26 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v26 = v22 | 7;
    }
    uint64_t v27 = v26 + 1;
    long long v23 = (std::string *)operator new(v26 + 1);
    __p.__r_.__value_.__l.__size_ = v22;
    __p.__r_.__value_.__r.__words[2] = v27 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v23;
    goto LABEL_31;
  }
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = v22;
  long long v23 = &__p;
  if (v22) {
LABEL_31:
  }
    memmove(v23, v25, v22);
LABEL_32:
  v23->__r_.__value_.__s.__data_[v22] = 0;
  memset(&v38, 170, sizeof(v38));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v38);
  ((void (*)(std::string **, std::string *, std::string *))(*this)->__r_.__value_.__r.__words[2])(this, &v38, &__p);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v38.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_34;
    }
LABEL_39:
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_34;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_39;
  }
LABEL_34:
  *(void *)&long long v29 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v29 + *(void *)(v29 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  *((void *)&v29 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v34) < 0) {
    operator delete(v33[1]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D487470](v36);
  return 1;
}

void sub_2192F2AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (*(char *)(v16 - 65) < 0) {
    operator delete(*(void **)(v16 - 88));
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t qmi::validateTlvFields(std::string **a1, uint64_t a2, uint64_t a3)
{
  return qmi::validateTlvFields(a1, *(qmi::RandomMessageReporter **)a2, *(void *)(a2 + 8) - *(void *)a2, *(void **)a3, (const void *)(*(void *)(a3 + 8) - *(void *)a3));
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request *this)
{
  *(void *)this = &unk_26CAABD60;
}

{
  *(void *)this = &unk_26CAABD60;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 != 13)
  {
    if (v2 == 19)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
      uint64_t v5 = *v4;
      uint64_t v6 = v4[1];
      uint64_t v7 = *(uint64_t *)((char *)v4 + 11);
      BOOL v8 = v5 == 0x7661537265776F50 && v6 == 0x7069726373654465;
      if (v8 && v7 == 0x726F747069726373) {
        return (uint64_t *)((char *)a1 + 24);
      }
    }
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  if (v3 >= 0) {
    long long v11 = (uint64_t *)a2;
  }
  else {
    long long v11 = *(uint64_t **)a2;
  }
  uint64_t v12 = *v11;
  uint64_t v13 = *(uint64_t *)((char *)v11 + 5);
  if (v12 != 0x6974616369646E49 || v13 != 0x7465536E6F697461) {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  return (uint64_t *)((char *)a1 + 40);
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response *this)
{
  *(void *)this = &unk_26CAABD90;
}

{
  *(void *)this = &unk_26CAABD90;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 13
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *(uint64_t **)a2),
        (v5 = *v4, uint64_t v6 = *(uint64_t *)((char *)v4 + 5), v5 == 0x6C75736552696D51)
      ? (BOOL v7 = v6 == 0x65646F43746C7573)
      : (BOOL v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request *this)
{
  *(void *)this = &unk_26CAABDC0;
}

{
  *(void *)this = &unk_26CAABDC0;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 != 16)
  {
    if (v2 == 19)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
      uint64_t v5 = *v4;
      uint64_t v6 = v4[1];
      uint64_t v7 = *(uint64_t *)((char *)v4 + 11);
      BOOL v8 = v5 == 0x7661537265776F50 && v6 == 0x7069726373654465;
      if (v8 && v7 == 0x726F747069726373) {
        return (uint64_t *)((char *)a1 + 24);
      }
    }
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  if (v3 >= 0) {
    long long v11 = (uint64_t *)a2;
  }
  else {
    long long v11 = *(uint64_t **)a2;
  }
  uint64_t v13 = *v11;
  uint64_t v12 = v11[1];
  if (v13 != 0x6974616369646E49 || v12 != 0x7478457465536E6FLL) {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  return (uint64_t *)((char *)a1 + 40);
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response *this)
{
  *(void *)this = &unk_26CAABDF0;
}

{
  *(void *)this = &unk_26CAABDF0;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 13
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *(uint64_t **)a2),
        (v5 = *v4, uint64_t v6 = *(uint64_t *)((char *)v4 + 5), v5 == 0x6C75736552696D51)
      ? (BOOL v7 = v6 == 0x65646F43746C7573)
      : (BOOL v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_GetClientId_Request::~QmiMessageDefinitionImpl_ctl_GetClientId_Request(QmiMessageDefinitionImpl_ctl_GetClientId_Request *this)
{
  *(void *)this = &unk_26CAABE20;
}

{
  *(void *)this = &unk_26CAABE20;
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Request::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 11
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *(uint64_t **)a2),
        (v5 = *v4, uint64_t v6 = *(uint64_t *)((char *)v4 + 3), v5 == 0x5465636976726553)
      ? (BOOL v7 = v6 == 0x6570795465636976)
      : (BOOL v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_GetClientId_Response::~QmiMessageDefinitionImpl_ctl_GetClientId_Response(QmiMessageDefinitionImpl_ctl_GetClientId_Response *this)
{
  *(void *)this = &unk_26CAABE50;
}

{
  *(void *)this = &unk_26CAABE50;
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t **a2)
{
  uint64_t v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((char)v2 < 0) {
    uint64_t v2 = a2[1];
  }
  if (v2 != (uint64_t *)10)
  {
    if (v2 == (uint64_t *)13)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + 5);
      if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573) {
        return (uint64_t *)((char *)a1 + 24);
      }
    }
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  if (v3 >= 0) {
    uint64_t v9 = (uint64_t *)a2;
  }
  else {
    uint64_t v9 = *a2;
  }
  uint64_t v10 = *v9;
  int v11 = *((unsigned __int16 *)v9 + 4);
  if (v10 != 0x64656E6769737341 || v11 != 25673) {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  return (uint64_t *)((char *)a1 + 40);
}

void QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request::~QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request *this)
{
  *(void *)this = &unk_26CAABE80;
}

{
  *(void *)this = &unk_26CAABE80;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request::getTlvDefinition(QmiMessageDefinition *a1, uint64_t **a2)
{
  uint64_t v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((char)v2 < 0) {
    uint64_t v2 = a2[1];
  }
  if (v2 == (uint64_t *)10
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *a2),
        (v5 = *v4, int v6 = *((unsigned __int16 *)v4 + 4), v5 == 0x64656E6769737341) ? (v7 = v6 == 25673) : (v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response::~QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response *this)
{
  *(void *)this = &unk_26CAABEB0;
}

{
  *(void *)this = &unk_26CAABEB0;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t **a2)
{
  uint64_t v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((char)v2 < 0) {
    uint64_t v2 = a2[1];
  }
  if (v2 != (uint64_t *)10)
  {
    if (v2 == (uint64_t *)13)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + 5);
      if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573) {
        return (uint64_t *)((char *)a1 + 24);
      }
    }
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  if (v3 >= 0) {
    uint64_t v9 = (uint64_t *)a2;
  }
  else {
    uint64_t v9 = *a2;
  }
  uint64_t v10 = *v9;
  int v11 = *((unsigned __int16 *)v9 + 4);
  if (v10 != 0x64656E6769737341 || v11 != 25673) {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  return (uint64_t *)((char *)a1 + 40);
}

void QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication::~QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication(QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication *this)
{
  *(void *)this = &unk_26CAABEE0;
}

{
  *(void *)this = &unk_26CAABEE0;
}

uint64_t *QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication::getTlvDefinition(QmiMessageDefinition *a1, uint64_t **a2)
{
  uint64_t v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((char)v2 < 0) {
    uint64_t v2 = a2[1];
  }
  if (v2 == (uint64_t *)10
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *a2),
        (v5 = *v4, int v6 = *((unsigned __int16 *)v4 + 4), v5 == 0x64656E6769737341) ? (v7 = v6 == 25673) : (v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_SetDataFormat_Request::~QmiMessageDefinitionImpl_ctl_SetDataFormat_Request(QmiMessageDefinitionImpl_ctl_SetDataFormat_Request *this)
{
  *(void *)this = &unk_26CAABF10;
}

{
  *(void *)this = &unk_26CAABF10;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Request::getTlvDefinition(QmiMessageDefinition *a1, uint64_t **a2)
{
  uint64_t v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((char)v2 < 0) {
    uint64_t v2 = a2[1];
  }
  if (v2 != (uint64_t *)17)
  {
    if (v2 == (uint64_t *)10)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
      uint64_t v5 = *v4;
      int v6 = *((unsigned __int16 *)v4 + 4);
      if (v5 == 0x6D726F4661746144 && v6 == 29793) {
        return (uint64_t *)((char *)a1 + 24);
      }
    }
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  if (v3 >= 0) {
    uint64_t v9 = (uint64_t *)a2;
  }
  else {
    uint64_t v9 = *a2;
  }
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  int v12 = *((unsigned __int8 *)v9 + 16);
  if (v10 != 0x6579614C6B6E694CLL || v11 != 0x6F636F746F725072 || v12 != 108) {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  return (uint64_t *)((char *)a1 + 40);
}

void QmiMessageDefinitionImpl_ctl_SetDataFormat_Response::~QmiMessageDefinitionImpl_ctl_SetDataFormat_Response(QmiMessageDefinitionImpl_ctl_SetDataFormat_Response *this)
{
  *(void *)this = &unk_26CAABF40;
}

{
  *(void *)this = &unk_26CAABF40;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t **a2)
{
  uint64_t v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  int v3 = (char)v2;
  if ((char)v2 < 0) {
    uint64_t v2 = a2[1];
  }
  if (v2 != (uint64_t *)17)
  {
    if (v2 == (uint64_t *)13)
    {
      int v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + 5);
      if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573) {
        return (uint64_t *)((char *)a1 + 24);
      }
    }
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  if (v3 >= 0) {
    uint64_t v9 = (uint64_t *)a2;
  }
  else {
    uint64_t v9 = *a2;
  }
  uint64_t v10 = *v9;
  uint64_t v11 = v9[1];
  int v12 = *((unsigned __int8 *)v9 + 16);
  if (v10 != 0x6579614C6B6E694CLL || v11 != 0x6F636F746F725072 || v12 != 108) {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
  return (uint64_t *)((char *)a1 + 40);
}

void QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request::~QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request *this)
{
  *(void *)this = &unk_26CAABF70;
}

{
  *(void *)this = &unk_26CAABF70;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 14
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *(uint64_t **)a2),
        (v5 = *v4, uint64_t v6 = *(uint64_t *)((char *)v4 + 6), v5 == 0x7661537265776F50)
      ? (BOOL v7 = v6 == 0x6574617453657661)
      : (BOOL v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response::~QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response *this)
{
  *(void *)this = &unk_26CAABFA0;
}

{
  *(void *)this = &unk_26CAABFA0;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 13
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *(uint64_t **)a2),
        (v5 = *v4, uint64_t v6 = *(uint64_t *)((char *)v4 + 5), v5 == 0x6C75736552696D51)
      ? (BOOL v7 = v6 == 0x65646F43746C7573)
      : (BOOL v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

void QmiMessageDefinitionImpl_ctl_Sync_Response::~QmiMessageDefinitionImpl_ctl_Sync_Response(QmiMessageDefinitionImpl_ctl_Sync_Response *this)
{
  *(void *)this = &unk_26CAABFD0;
}

{
  *(void *)this = &unk_26CAABFD0;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Response::getTlvDefinition(QmiMessageDefinition *a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    uint64_t v2 = *(void *)(a2 + 8);
  }
  if (v2 == 13
    && (v3 >= 0 ? (int v4 = (uint64_t *)a2) : (int v4 = *(uint64_t **)a2),
        (v5 = *v4, uint64_t v6 = *(uint64_t *)((char *)v4 + 5), v5 == 0x6C75736552696D51)
      ? (BOOL v7 = v6 == 0x65646F43746C7573)
      : (BOOL v7 = 0),
        v7))
  {
    return (uint64_t *)((char *)a1 + 24);
  }
  else
  {
    return QmiMessageDefinition::getDefaultTlvDefinition(a1);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request *this, int a2)
{
  if (a2 == 17) {
    return (uint64_t *)((char *)this + 40);
  }
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  return QmiMessageDefinition::getDefaultTlvDefinition(this);
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response *this, int a2)
{
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request *this, int a2)
{
  if (a2 == 16) {
    return (uint64_t *)((char *)this + 40);
  }
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  return QmiMessageDefinition::getDefaultTlvDefinition(this);
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response *this, int a2)
{
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_GetClientId_Request *this, int a2)
{
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_GetClientId_Response *this, int a2)
{
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 40);
  }
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  return QmiMessageDefinition::getDefaultTlvDefinition(this);
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request *this, int a2)
{
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response *this, int a2)
{
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 40);
  }
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  return QmiMessageDefinition::getDefaultTlvDefinition(this);
}

uint64_t *QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication::getTlvDefinition(QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication *this, int a2)
{
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetDataFormat_Request *this, int a2)
{
  if (a2 == 16) {
    return (uint64_t *)((char *)this + 40);
  }
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  return QmiMessageDefinition::getDefaultTlvDefinition(this);
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetDataFormat_Response *this, int a2)
{
  if (a2 == 16) {
    return (uint64_t *)((char *)this + 40);
  }
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  return QmiMessageDefinition::getDefaultTlvDefinition(this);
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request *this, int a2)
{
  if (a2 == 1) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response *this, int a2)
{
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_Sync_Response *this, int a2)
{
  if (a2 == 2) {
    return (uint64_t *)((char *)this + 24);
  }
  else {
    return QmiMessageDefinition::getDefaultTlvDefinition(this);
  }
}

uint64_t ctu::llvm::StringRef::compare_lower(uint64_t a1, const char *a2, unint64_t a3)
{
  unint64_t v3 = a3;
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 < a3) {
    a3 = *(void *)(a1 + 8);
  }
  LODWORD(result) = ascii_strncasecmp(*(const char **)a1, a2, a3);
  if (v4 < v3) {
    unsigned int v6 = -1;
  }
  else {
    unsigned int v6 = 1;
  }
  if (v4 == v3) {
    unsigned int v6 = 0;
  }
  if (result) {
    return result;
  }
  else {
    return v6;
  }
}

uint64_t ascii_strncasecmp(const char *a1, const char *a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  while (1)
  {
    int v4 = *(unsigned __int8 *)a1++;
    unsigned __int8 v3 = v4;
    unsigned __int8 v5 = v4 + 32;
    if ((v4 - 65) < 0x1A) {
      unsigned __int8 v3 = v5;
    }
    int v7 = *(unsigned __int8 *)a2++;
    unsigned __int8 v6 = v7;
    unsigned __int8 v8 = v7 + 32;
    if ((v7 - 65) < 0x1A) {
      unsigned __int8 v6 = v8;
    }
    if (v3 != v6) {
      break;
    }
    if (!--a3) {
      return 0;
    }
  }
  if (v3 < v6) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 1;
  }
}

BOOL ctu::llvm::StringRef::startswith_lower(uint64_t a1, const char *a2, unint64_t a3)
{
  return *(void *)(a1 + 8) >= a3 && ascii_strncasecmp(*(const char **)a1, a2, a3) == 0;
}

BOOL ctu::llvm::StringRef::endswith_lower(void *a1, const char *a2, unint64_t a3)
{
  unint64_t v3 = a1[1];
  return v3 >= a3 && ascii_strncasecmp((const char *)(*a1 + v3 - a3), a2, a3) == 0;
}

uint64_t ctu::llvm::StringRef::compare_numeric(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v5 = a1[1];
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = a1[1];
  }
  if (v6)
  {
    uint64_t v7 = a2;
    unint64_t v8 = 0;
    unint64_t v9 = v6 + 1;
    uint64_t v10 = *a1;
    uint64_t v11 = -(uint64_t)v6;
    uint64_t v12 = a2 + 1;
    uint64_t v13 = *a1 + 1;
    do
    {
      unsigned int v14 = *(unsigned __int8 *)(v10 + v8);
      unsigned int v15 = *(unsigned __int8 *)(v7 + v8);
      if (v14 - 48 > 9 || v15 - 48 > 9)
      {
        unint64_t v17 = v8;
        if (v14 != v15)
        {
          if (v14 < v15) {
            return 0xFFFFFFFFLL;
          }
          else {
            return 1;
          }
        }
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = v13;
        uint64_t v20 = v12;
        do
        {
          if (!(v11 + v8 + v18))
          {
            unint64_t v17 = v6;
            unint64_t v27 = v9;
            goto LABEL_33;
          }
          unint64_t v21 = v8 + v18 + 1;
          int v22 = v21 < v5 && *(unsigned __int8 *)(v19 + v8) - 48 < 0xA;
          if (v21 >= a3)
          {
            int v25 = 5;
            unsigned int v24 = 1;
          }
          else
          {
            unsigned int v23 = (*(unsigned char *)(v20 + v8) - 48);
            v22 ^= v23 < 0xA;
            if (v23 < 0xA) {
              unsigned int v24 = -1;
            }
            else {
              unsigned int v24 = 1;
            }
            int v25 = 0;
          }
          if (v22) {
            uint64_t v3 = v24;
          }
          else {
            uint64_t v3 = v3;
          }
          if (v22) {
            int v26 = 1;
          }
          else {
            int v26 = v25;
          }
          ++v18;
          ++v20;
          ++v19;
        }
        while (!v26);
        if (v26 != 5) {
          return v3;
        }
        unint64_t v27 = v8 + v18;
        unint64_t v17 = v27 - 1;
LABEL_33:
        if (v27 != v8)
        {
          uint64_t v28 = v10;
          uint64_t v29 = v7;
          unint64_t v33 = v6;
          int v30 = memcmp((const void *)(v10 + v8), (const void *)(v7 + v8), v27 - v8);
          unint64_t v6 = v33;
          uint64_t v7 = v29;
          uint64_t v10 = v28;
          if (v30) {
            return (v30 >> 31) | 1u;
          }
        }
      }
      unint64_t v8 = v17 + 1;
    }
    while (v17 + 1 != v6);
  }
  if (v5 < a3) {
    unsigned int v31 = -1;
  }
  else {
    unsigned int v31 = 1;
  }
  if (v5 == a3) {
    return 0;
  }
  else {
    return v31;
  }
}

void *ctu::llvm::StringRef::lower@<X0>(ctu::llvm::StringRef *this@<X0>, void *a2@<X8>)
{
  memset(a2, 170, 24);
  uint64_t result = std::string::basic_string[abi:ne180100](a2, *((void *)this + 1), 0);
  uint64_t v4 = *((void *)this + 1);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      int v6 = *(unsigned __int8 *)(*(void *)this + i);
      if ((v6 - 65) < 0x1A) {
        LOBYTE(v6) = v6 + 32;
      }
      if (*((char *)result + 23) >= 0) {
        uint64_t v7 = result;
      }
      else {
        uint64_t v7 = (void *)*result;
      }
      *((unsigned char *)v7 + i) = v6;
    }
  }
  return result;
}

void *ctu::llvm::StringRef::upper@<X0>(ctu::llvm::StringRef *this@<X0>, void *a2@<X8>)
{
  memset(a2, 170, 24);
  uint64_t result = std::string::basic_string[abi:ne180100](a2, *((void *)this + 1), 0);
  uint64_t v4 = *((void *)this + 1);
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      int v6 = *(unsigned __int8 *)(*(void *)this + i);
      if ((v6 - 97) < 0x1A) {
        LOBYTE(v6) = v6 - 32;
      }
      if (*((char *)result + 23) >= 0) {
        uint64_t v7 = result;
      }
      else {
        uint64_t v7 = (void *)*result;
      }
      *((unsigned char *)v7 + i) = v6;
    }
  }
  return result;
}

uint64_t ctu::llvm::StringRef::find(uint64_t *a1, unsigned __int8 *a2, size_t a3, unint64_t a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  unint64_t v4 = a1[1];
  unint64_t v5 = v4 - a3;
  if (v4 < a3) {
    return -1;
  }
  unint64_t v6 = a4;
  if (a3 - 256 >= 0xFFFFFFFFFFFFFF01 && v4 > 0xF)
  {
    size_t v9 = v4 - a4;
    if (v4 > a4)
    {
      int8x16_t v21 = vdupq_n_s8(a3);
      int8x16_t v22 = v21;
      v20[12] = v21;
      v20[13] = v21;
      v20[10] = v21;
      v20[11] = v21;
      v20[8] = v21;
      v20[9] = v21;
      v20[6] = v21;
      v20[7] = v21;
      v20[4] = v21;
      v20[5] = v21;
      v20[2] = v21;
      v20[3] = v21;
      v20[0] = v21;
      v20[1] = v21;
      size_t v10 = a3 - 1;
      if (a3 != 1)
      {
        uint64_t v11 = 0;
        size_t v12 = a3 - 1;
        do
          *((unsigned char *)v20 + a2[v11++]) = v12--;
        while (v10 != v11);
      }
      if (v9 >= a3)
      {
        uint64_t v13 = *a1;
        while (1)
        {
          unint64_t v14 = v6 >= v4 ? v4 : v6;
          if (a3 <= v4 - v14 && (!a3 || !memcmp((const void *)(v13 + v14), a2, a3))) {
            break;
          }
          uint64_t v15 = *((unsigned __int8 *)v20 + *(unsigned __int8 *)(v13 + v6 + v10));
          v9 -= v15;
          v6 += v15;
          if (v9 < a3) {
            return -1;
          }
        }
        return v6;
      }
    }
    return -1;
  }
  unint64_t v16 = v5 + 1;
  if (v5 + 1 <= a4) {
    return -1;
  }
  uint64_t v17 = *a1;
  while (1)
  {
    unint64_t v18 = v6 >= v4 ? v4 : v6;
    if (a3 <= v4 - v18 && (!a3 || !memcmp((const void *)(v17 + v18), a2, a3))) {
      break;
    }
    if (v16 == ++v6) {
      return -1;
    }
  }
  return v6;
}

size_t ctu::llvm::StringRef::rfind(uint64_t *a1, void *__s2, size_t __n)
{
  size_t v3 = a1[1];
  size_t v4 = v3 - __n;
  if (v3 < __n) {
    return -1;
  }
  size_t v5 = v4 + 1;
  if (v4 == -1) {
    return -1;
  }
  uint64_t v9 = *a1;
  while (1)
  {
    --v5;
    size_t v10 = v4 >= v3 ? v3 : v4;
    if (__n <= v3 - v10)
    {
      if (!__n) {
        return v4;
      }
      if (!memcmp((const void *)(v9 + v10), __s2, __n)) {
        break;
      }
    }
    if (--v4 == -1) {
      return v4;
    }
  }
  return v5;
}

uint64_t ctu::llvm::StringRef::find_first_of(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  unint64_t v5 = a1[1];
  if (v5 <= a4) {
    return -1;
  }
  while (((*(void *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(unsigned char *)(*a1 + a4)) & 1) == 0)
  {
    if (v5 == ++a4) {
      return -1;
    }
  }
  return a4;
}

unint64_t ctu::llvm::StringRef::find_first_not_of(ctu::llvm::StringRef *this, unsigned __int8 a2, unint64_t a3)
{
  unint64_t v3 = *((void *)this + 1);
  if (v3 <= a3) {
    return -1;
  }
  while (*(unsigned __int8 *)(*(void *)this + a3) == a2)
  {
    if (v3 == ++a3) {
      return -1;
    }
  }
  return a3;
}

uint64_t ctu::llvm::StringRef::find_first_not_of(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  unint64_t v5 = a1[1];
  if (v5 <= a4) {
    return -1;
  }
  while (((*(void *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(unsigned char *)(*a1 + a4)) & 1) != 0)
  {
    if (v5 == ++a4) {
      return -1;
    }
  }
  return a4;
}

uint64_t ctu::llvm::StringRef::find_last_of(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a4 >= a1[1]) {
    unint64_t v5 = a1[1];
  }
  else {
    unint64_t v5 = a4;
  }
  while (v5)
  {
    unint64_t v6 = v5 - 1;
    unint64_t v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    uint64_t v8 = *(void *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    unint64_t v5 = v6;
    if (v8) {
      return v6;
    }
  }
  return -1;
}

unint64_t ctu::llvm::StringRef::find_last_not_of(ctu::llvm::StringRef *this, unsigned __int8 a2, unint64_t a3)
{
  if (a3 >= *((void *)this + 1)) {
    unint64_t v3 = *((void *)this + 1);
  }
  else {
    unint64_t v3 = a3;
  }
  while (v3)
  {
    unint64_t v4 = v3 - 1;
    int v5 = *(unsigned __int8 *)(*(void *)this + v3-- - 1);
    if (v5 != a2) {
      return v4;
    }
  }
  return -1;
}

uint64_t ctu::llvm::StringRef::find_last_not_of(void *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  for (; a3; --a3)
  {
    unsigned int v4 = *a2++;
    *(void *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a4 >= a1[1]) {
    unint64_t v5 = a1[1];
  }
  else {
    unint64_t v5 = a4;
  }
  while (v5)
  {
    unint64_t v6 = v5 - 1;
    unint64_t v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    uint64_t v8 = *(void *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    unint64_t v5 = v6;
    if ((v8 & 1) == 0) {
      return v6;
    }
  }
  return -1;
}

void ctu::llvm::StringRef::split(long long *a1, void **a2, unsigned __int8 *a3, size_t a4, int a5, uint64_t a6)
{
  long long v49 = *a1;
  uint64_t v6 = v49;
  if ((void)v49)
  {
    int v8 = a5;
    int v12 = 0;
    uint64_t v47 = (uint64_t)(a2 + 2);
    unint64_t v13 = *((void *)&v49 + 1);
    while (v8 < 0 || v12 < v8)
    {
      unint64_t v14 = ctu::llvm::StringRef::find((uint64_t *)&v49, a3, a4, 0);
      if (v14 >= v13) {
        unint64_t v15 = v13;
      }
      else {
        unint64_t v15 = v14;
      }
      unint64_t v16 = v14 + a4;
      if (v14 + a4 >= v13) {
        unint64_t v16 = v13;
      }
      uint64_t v17 = v6 + v16;
      unint64_t v18 = v13 - v16;
      uint64_t v19 = v6;
      if (v14 == -1) {
        unint64_t v20 = v13;
      }
      else {
        unint64_t v20 = v15;
      }
      if (v14 == -1) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = v17;
      }
      if (v14 == -1) {
        unint64_t v13 = 0;
      }
      else {
        unint64_t v13 = v18;
      }
      if ((a6 & 1) != 0 || v20)
      {
        int8x16_t v22 = a2[1];
        unint64_t v21 = (unint64_t)a2[2];
        if ((unint64_t)v22 >= v21)
        {
          unsigned int v24 = a3;
          uint64_t v25 = a6;
          uint64_t v26 = ((char *)v22 - (unsigned char *)*a2) >> 4;
          unint64_t v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 60) {
            goto LABEL_60;
          }
          uint64_t v28 = v21 - (void)*a2;
          if (v28 >> 3 > v27) {
            unint64_t v27 = v28 >> 3;
          }
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v29 = v27;
          }
          if (v29) {
            int v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>(v47, v29);
          }
          else {
            int v30 = 0;
          }
          unsigned int v31 = &v30[16 * v26];
          *(void *)unsigned int v31 = v19;
          *((void *)v31 + 1) = v20;
          unint64_t v33 = (char *)*a2;
          long long v32 = (char *)a2[1];
          long long v34 = v31;
          a6 = v25;
          if (v32 != *a2)
          {
            do
            {
              *((_OWORD *)v34 - 1) = *((_OWORD *)v32 - 1);
              v34 -= 16;
              v32 -= 16;
            }
            while (v32 != v33);
            long long v32 = (char *)*a2;
          }
          a3 = v24;
          uint64_t v23 = v31 + 16;
          *a2 = v34;
          a2[1] = v31 + 16;
          a2[2] = &v30[16 * v29];
          int v8 = a5;
          if (v32) {
            operator delete(v32);
          }
        }
        else
        {
          void *v22 = v19;
          v22[1] = v20;
          uint64_t v23 = v22 + 2;
        }
        a2[1] = v23;
      }
      *(void *)&long long v49 = v6;
      *((void *)&v49 + 1) = v13;
      ++v12;
      if (!v6) {
        return;
      }
    }
    if (v13 || a6)
    {
      long long v36 = a2[1];
      unint64_t v35 = (unint64_t)a2[2];
      if ((unint64_t)v36 >= v35)
      {
        uint64_t v38 = ((char *)v36 - (unsigned char *)*a2) >> 4;
        unint64_t v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 60) {
LABEL_60:
        }
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        uint64_t v40 = v35 - (void)*a2;
        if (v40 >> 3 > v39) {
          unint64_t v39 = v40 >> 3;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41) {
          std::string v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>(v47, v41);
        }
        else {
          std::string v42 = 0;
        }
        BOOL v43 = &v42[16 * v38];
        char v44 = &v42[16 * v41];
        *(_OWORD *)BOOL v43 = v49;
        unint64_t v37 = v43 + 16;
        char v46 = (char *)*a2;
        char v45 = (char *)a2[1];
        if (v45 != *a2)
        {
          do
          {
            *((_OWORD *)v43 - 1) = *((_OWORD *)v45 - 1);
            v43 -= 16;
            v45 -= 16;
          }
          while (v45 != v46);
          char v45 = (char *)*a2;
        }
        *a2 = v43;
        a2[1] = v37;
        a2[2] = v44;
        if (v45) {
          operator delete(v45);
        }
      }
      else
      {
        *long long v36 = v49;
        unint64_t v37 = v36 + 1;
      }
      a2[1] = v37;
    }
  }
}

uint64_t ctu::llvm::StringRef::count(uint64_t *a1, const void *a2, size_t a3)
{
  unint64_t v3 = a1[1];
  size_t v4 = v3 - a3;
  if (v3 < a3 || v4 == -1) {
    return 0;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  uint64_t v9 = *a1;
  size_t v10 = v4 + 1;
  do
  {
    if (v8 >= v3) {
      unint64_t v11 = v3;
    }
    else {
      unint64_t v11 = v8;
    }
    if (a3 <= v3 - v11 && (!a3 || !memcmp((const void *)(v9 + v11), a2, a3))) {
      ++v7;
    }
    ++v8;
  }
  while (v10 != v8);
  return v7;
}

uint64_t ctu::llvm::getAsUnsignedInteger(_WORD *a1, unint64_t a2, unsigned int a3, unint64_t *a4)
{
  if (a3)
  {
LABEL_2:
    if (!a2) {
      return 1;
    }
    goto LABEL_13;
  }
  if (a2 < 2)
  {
    if (!a2) {
      return 1;
    }
    goto LABEL_10;
  }
  switch(*a1)
  {
    case 0x7830:
      ++a1;
      a3 = 16;
LABEL_29:
      a2 -= 2;
      goto LABEL_2;
    case 0x6230:
      ++a1;
      a3 = 2;
      goto LABEL_29;
    case 0x6F30:
      ++a1;
      a3 = 8;
      goto LABEL_29;
  }
LABEL_10:
  if (*(unsigned char *)a1 == 48) {
    a3 = 8;
  }
  else {
    a3 = 10;
  }
LABEL_13:
  unint64_t v5 = 0;
  *a4 = 0;
  while (*(char *)a1 >= 48)
  {
    unsigned int v6 = *(unsigned __int8 *)a1;
    if (v6 >= 0x3A)
    {
      if (v6 < 0x61)
      {
        if (v6 - 65 > 0x19) {
          return 1;
        }
        int v7 = -55;
      }
      else
      {
        if (v6 >= 0x7B) {
          return 1;
        }
        int v7 = -87;
      }
    }
    else
    {
      int v7 = -48;
    }
    unsigned int v8 = v7 + v6;
    if (v8 >= a3) {
      break;
    }
    unint64_t v9 = v5 * a3 + v8;
    *a4 = v9;
    if (v9 / a3 < v5) {
      break;
    }
    a1 = (_WORD *)((char *)a1 + 1);
    unint64_t v5 = v9;
    if (!--a2) {
      return 0;
    }
  }
  return 1;
}

uint64_t ctu::llvm::getAsSignedInteger(_WORD *a1, unint64_t a2, unsigned int a3, uint64_t *a4)
{
  uint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  if (a2 && *(unsigned char *)a1 == 45)
  {
    if (ctu::llvm::getAsUnsignedInteger((_WORD *)((char *)a1 + 1), a2 - 1, a3, (unint64_t *)&v8)) {
      return 1;
    }
    uint64_t v5 = -v8;
    if (-v8 >= 0 && v8 != 0) {
      return 1;
    }
    goto LABEL_8;
  }
  char AsUnsignedInteger = ctu::llvm::getAsUnsignedInteger(a1, a2, a3, (unint64_t *)&v8);
  uint64_t result = 1;
  if ((AsUnsignedInteger & 1) == 0)
  {
    uint64_t v5 = v8;
    if ((v8 & 0x8000000000000000) == 0)
    {
LABEL_8:
      uint64_t result = 0;
      *a4 = v5;
    }
  }
  return result;
}

void *ctu::llvm::operator<<(void *a1, uint64_t a2)
{
  size_t v4 = *(void **)a2;
  if (v4)
  {
    std::string::basic_string[abi:ne180100](&__p, v4, *(void *)(a2 + 8));
    unsigned int v5 = HIBYTE(v14);
    unsigned int v6 = (void **)__p;
    uint64_t v7 = v13;
  }
  else
  {
    uint64_t v7 = 0;
    unsigned int v6 = 0;
    unsigned int v5 = 0;
    std::string __p = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  if ((v5 & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = v6;
  }
  if ((v5 & 0x80u) == 0) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = v7;
  }
  size_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)p_p, v9);
  if (SHIBYTE(v14) < 0) {
    operator delete(__p);
  }
  return v10;
}

void sub_2192F4664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unsigned int v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    unsigned int v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unsigned int v6 = operator new(v7 + 1);
    __dst[1] = __len;
    std::locale __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unsigned int v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

BOOL ctu::starts_with(const void *a1, size_t a2, const void *a3, size_t a4)
{
  if (a2 < a4) {
    return 0;
  }
  if (a4) {
    return memcmp(a1, a3, a4) == 0;
  }
  return 1;
}

BOOL ctu::ends_with(uint64_t a1, size_t a2, const void *a3, size_t a4)
{
  if (a2 < a4) {
    return 0;
  }
  if (a4) {
    return memcmp((const void *)(a1 + a2 - a4), a3, a4) == 0;
  }
  return 1;
}

double ctu::partition@<D0>(char *a1@<X0>, size_t a2@<X1>, unsigned __int8 *a3@<X2>, size_t a4@<X3>, uint64_t a5@<X8>)
{
  v17[0] = (uint64_t)a1;
  v17[1] = a2;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(void *)(a5 + 64) = 0;
  unint64_t v10 = ctu::llvm::StringRef::find(v17, a3, a4, 0);
  if (v10 == -1)
  {
    if (a1)
    {
      std::string::basic_string[abi:ne180100](&__dst, a1, a2);
    }
    else
    {
      long long __dst = 0uLL;
      uint64_t v16 = 0;
    }
    double result = *(double *)&__dst;
    *(_OWORD *)a5 = __dst;
    *(void *)(a5 + 16) = v16;
  }
  else
  {
    unint64_t v11 = v10;
    if (a1)
    {
      if (v10 >= a2) {
        size_t v12 = a2;
      }
      else {
        size_t v12 = v10;
      }
      std::string::basic_string[abi:ne180100](&__dst, a1, v12);
    }
    else
    {
      long long __dst = 0uLL;
      uint64_t v16 = 0;
    }
    *(_OWORD *)a5 = __dst;
    *(void *)(a5 + 16) = v16;
    if (a3)
    {
      std::string::basic_string[abi:ne180100](&__dst, a3, a4);
    }
    else
    {
      long long __dst = 0uLL;
      uint64_t v16 = 0;
    }
    *(_OWORD *)(a5 + 24) = __dst;
    *(void *)(a5 + 40) = v16;
    if (a1)
    {
      size_t v13 = v11 + a4;
      if (v11 + a4 >= a2) {
        size_t v13 = a2;
      }
      std::string::basic_string[abi:ne180100](&__dst, &a1[v13], a2 - v13);
    }
    else
    {
      long long __dst = 0uLL;
      uint64_t v16 = 0;
    }
    double result = *(double *)&__dst;
    *(_OWORD *)(a5 + 48) = __dst;
    *(void *)(a5 + 64) = v16;
  }
  return result;
}

void sub_2192F49F8(_Unwind_Exception *a1)
{
  std::tuple<std::string,std::string,std::string>::~tuple(v1);
  _Unwind_Resume(a1);
}

uint64_t std::tuple<std::string,std::string,std::string>::~tuple(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t ctu::split_any@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  v28[0] = a1;
  v28[1] = a2;
  a5[2] = 0;
  unint64_t v10 = a5 + 2;
  *a5 = 0;
  a5[1] = 0;
  unint64_t first_not_of = ctu::llvm::StringRef::find_first_not_of(v28, a3, a4, 0);
  uint64_t result = ctu::llvm::StringRef::find_first_of(v28, a3, a4, first_not_of);
  if ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = result;
    uint64_t v14 = 0;
    do
    {
      if (v13 == -1) {
        unint64_t v15 = a2;
      }
      else {
        unint64_t v15 = v13;
      }
      unint64_t v16 = v15 - first_not_of;
      uint64_t v17 = a1 + first_not_of;
      if ((unint64_t)v14 >= *v10)
      {
        uint64_t v18 = (v14 - *a5) >> 4;
        if ((unint64_t)(v18 + 1) >> 60) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v19 = *v10 - (void)*a5;
        uint64_t v20 = v19 >> 3;
        if (v19 >> 3 <= (unint64_t)(v18 + 1)) {
          uint64_t v20 = v18 + 1;
        }
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        int8x16_t v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>((uint64_t)v10, v21);
        unsigned int v24 = &v22[16 * v18];
        *(void *)unsigned int v24 = v17;
        *((void *)v24 + 1) = v16;
        uint64_t v26 = *a5;
        uint64_t v25 = a5[1];
        unint64_t v27 = v24;
        if (v25 != *a5)
        {
          do
          {
            *((_OWORD *)v27 - 1) = *((_OWORD *)v25 - 1);
            v27 -= 16;
            v25 -= 16;
          }
          while (v25 != v26);
          uint64_t v25 = *a5;
        }
        uint64_t v14 = v24 + 16;
        *a5 = v27;
        a5[1] = v24 + 16;
        a5[2] = &v22[16 * v23];
        if (v25) {
          operator delete(v25);
        }
      }
      else
      {
        *(void *)uint64_t v14 = v17;
        *((void *)v14 + 1) = v16;
        v14 += 16;
      }
      a5[1] = v14;
      unint64_t first_not_of = ctu::llvm::StringRef::find_first_not_of(v28, a3, a4, v13);
      uint64_t result = ctu::llvm::StringRef::find_first_of(v28, a3, a4, first_not_of);
      unint64_t v13 = result;
    }
    while ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

void sub_2192F4C18(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ctu::split_any_copy@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, std::__split_buffer<std::string>::pointer *a5@<X8>)
{
  uint64_t v5 = a4;
  unsigned int v6 = a3;
  uint64_t v30 = a1;
  unint64_t v31 = a2;
  a5[2] = 0;
  unint64_t v29 = (std::allocator<std::string> *)(a5 + 2);
  *a5 = 0;
  a5[1] = 0;
  unint64_t first_not_of = ctu::llvm::StringRef::find_first_not_of(&v30, a3, a4, 0);
  uint64_t result = ctu::llvm::StringRef::find_first_of(&v30, v6, v5, first_not_of);
  if ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL)
  {
    unint64_t v10 = result;
    unint64_t v11 = 0;
    uint64_t v28 = v6;
    do
    {
      size_t v12 = v10 - first_not_of;
      uint64_t v13 = v30;
      if (first_not_of >= v31) {
        unint64_t v14 = v31;
      }
      else {
        unint64_t v14 = first_not_of;
      }
      unint64_t v15 = (void *)(v30 + v14);
      if (v12 >= v31 - v14) {
        size_t v16 = v31 - v14;
      }
      else {
        size_t v16 = v12;
      }
      if ((unint64_t)v11 >= *(void *)v29)
      {
        unint64_t v17 = (unint64_t)*a5;
        unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)*a5) >> 3);
        unint64_t v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v20 = v5;
        if (0x5555555555555556 * ((uint64_t)(*(void *)v29 - v17) >> 3) > v19) {
          unint64_t v19 = 0x5555555555555556 * ((uint64_t)(*(void *)v29 - v17) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)v29 - v17) >> 3) >= 0x555555555555555) {
          unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v21 = v19;
        }
        v32.__end_cap_.__value_ = v29;
        if (v21)
        {
          if (v21 > 0xAAAAAAAAAAAAAAALL) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          int8x16_t v22 = (std::string *)operator new(24 * v21);
        }
        else
        {
          int8x16_t v22 = 0;
        }
        std::__split_buffer<std::string>::pointer begin = v22 + v18;
        v32.__first_ = v22;
        v32.__begin_ = begin;
        v32.__end_ = begin;
        v32.__end_cap_.__value_ = &v22[v21];
        if (v13)
        {
          std::string::basic_string[abi:ne180100](begin, v15, v16);
          unint64_t v17 = (unint64_t)*a5;
          unint64_t v11 = (std::string::__raw *)a5[1];
          std::__split_buffer<std::string>::pointer begin = v32.__begin_;
          std::__split_buffer<std::string>::pointer end = v32.__end_;
        }
        else
        {
          begin->__r_.__value_.__r.__words[0] = 0;
          begin->__r_.__value_.__l.__size_ = 0;
          std::__split_buffer<std::string>::pointer end = v22 + v18;
          begin->__r_.__value_.__r.__words[2] = 0;
        }
        if (v11 == (std::string::__raw *)v17)
        {
          int64x2_t v26 = vdupq_n_s64(v17);
        }
        else
        {
          do
          {
            long long v25 = *(_OWORD *)v11[-1].__words;
            begin[-1].__r_.__value_.__r.__words[2] = v11[-1].__words[2];
            *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v25;
            --begin;
            v11[-1].__words[1] = 0;
            v11[-1].__words[2] = 0;
            v11[-1].__words[0] = 0;
            --v11;
          }
          while (v11 != (std::string::__raw *)v17);
          int64x2_t v26 = *(int64x2_t *)a5;
        }
        unint64_t v11 = (std::string::__raw *)&end[1];
        *a5 = begin;
        a5[1] = end + 1;
        *(int64x2_t *)&v32.__begin_ = v26;
        unint64_t v27 = a5[2];
        a5[2] = v32.__end_cap_.__value_;
        v32.__end_cap_.__value_ = v27;
        v32.__first_ = (std::__split_buffer<std::string>::pointer)v26.i64[0];
        std::__split_buffer<std::string>::~__split_buffer(&v32);
        uint64_t v5 = v20;
        unsigned int v6 = v28;
      }
      else
      {
        if (v30)
        {
          std::string::basic_string[abi:ne180100](v11, (void *)(v30 + v14), v16);
        }
        else
        {
          v11->__words[0] = 0;
          v11->__words[1] = 0;
          v11->__words[2] = 0;
        }
        a5[1] = (std::__split_buffer<std::string>::pointer)++v11;
      }
      a5[1] = (std::__split_buffer<std::string>::pointer)v11;
      unint64_t first_not_of = ctu::llvm::StringRef::find_first_not_of(&v30, v6, v5, v10);
      uint64_t result = ctu::llvm::StringRef::find_first_of(&v30, v6, v5, first_not_of);
      unint64_t v10 = result;
    }
    while ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

void sub_2192F4EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, std::__split_buffer<std::string> *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14)
{
}

void ctu::py_escape(char *a1@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  uint64_t v6 = a1[23];
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a1 + 1);
  }
  uint64_t v7 = 2;
  if (!a2) {
    uint64_t v7 = 0;
  }
  std::string::reserve(a3, v6 + v7);
  if (a2) {
    std::string::push_back(a3, 34);
  }
  int v8 = a1[23];
  if (v8 >= 0) {
    uint64_t v9 = a1;
  }
  else {
    uint64_t v9 = *(char **)a1;
  }
  if (v8 >= 0) {
    uint64_t v10 = a1[23];
  }
  else {
    uint64_t v10 = *((void *)a1 + 1);
  }
  if (v10)
  {
    uint64_t v11 = MEMORY[0x263EF8318];
    do
    {
      size_t v12 = (ctu *)*v9;
      if ((int)v12 > 33)
      {
        switch(v12)
        {
          case '""':
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 34;
            goto LABEL_32;
          case '\'':
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 39;
            goto LABEL_32;
          case '\\':
            std::string::push_back(a3, 92);
            goto LABEL_32;
        }
      }
      else
      {
        switch(v12)
        {
          case 9:
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 116;
            goto LABEL_32;
          case 0xA:
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 110;
            goto LABEL_32;
          case 0xD:
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 114;
            goto LABEL_32;
        }
      }
      if ((v12 & 0x80000000) != 0) {
        int v13 = __maskrune(*v9, 0x40000uLL);
      }
      else {
        int v13 = *(_DWORD *)(v11 + 4 * v12 + 60) & 0x40000;
      }
      if (!v13)
      {
        std::string::push_back(a3, 92);
        std::string::push_back(a3, 120);
        ctu::hex0(v12, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        std::string::append(a3, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        goto LABEL_33;
      }
LABEL_32:
      std::string::push_back(a3, (std::string::value_type)v12);
LABEL_33:
      ++v9;
      --v10;
    }
    while (v10);
  }
  if (a2) {
    std::string::push_back(a3, 34);
  }
}

void sub_2192F5104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void ctu::replace_copy(char *__s@<X1>, uint64_t a2@<X0>, size_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, std::string *a6@<X8>)
{
  uint64_t v10 = a6;
  memset(a6, 170, sizeof(std::string));
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a6, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a6->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a6->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  std::string::size_type size = v10->__r_.__value_.__l.__size_;
  if ((v10->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    std::string::size_type v12 = HIBYTE(v10->__r_.__value_.__r.__words[2]);
  }
  else
  {
    uint64_t v10 = (std::string *)v10->__r_.__value_.__r.__words[0];
    std::string::size_type v12 = size;
  }
  for (; v12; --v12)
  {
    int v13 = (char *)memchr(__s, v10->__r_.__value_.__s.__data_[0], a3);
    if (v13) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = &__s[a3];
    }
    uint64_t v15 = v14 - __s;
    if (v15 < a5 && v15 != a3) {
      v10->__r_.__value_.__s.__data_[0] = *(unsigned char *)(a4 + v15);
    }
    uint64_t v10 = (std::string *)((char *)v10 + 1);
  }
}

unsigned char *ctu::replace(unsigned char *result, char *__s, size_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = (char)result[23];
  if (v5 >= 0) {
    uint64_t v6 = result;
  }
  else {
    uint64_t v6 = *(unsigned char **)result;
  }
  if (v5 >= 0) {
    uint64_t v7 = result[23];
  }
  else {
    uint64_t v7 = *((void *)result + 1);
  }
  if (v7)
  {
    std::string::size_type v12 = &__s[a3];
    do
    {
      uint64_t result = memchr(__s, (char)*v6, a3);
      if (result) {
        unint64_t v14 = result;
      }
      else {
        unint64_t v14 = v12;
      }
      uint64_t v15 = v14 - __s;
      if (v15 < a5 && v15 != a3) {
        *uint64_t v6 = *(unsigned char *)(a4 + v15);
      }
      ++v6;
      --v7;
    }
    while (v7);
  }
  return result;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    std::__split_buffer<std::string>::pointer v4 = (void **)v1[1];
    int v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    int v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  xpc_object_t v5 = *a1;
  if (v4 == MEMORY[0x263EF8738])
  {
    return xpc_int64_get_value(v5);
  }
  else
  {
    uint64_t v6 = MEMORY[0x21D4876E0](v5);
    xpc_object_t v7 = *a1;
    if (v6 == MEMORY[0x263EF87A0])
    {
      return xpc_uint64_get_value(v7);
    }
    else
    {
      if (MEMORY[0x21D4876E0](v7) == MEMORY[0x263EF86E0]) {
        return xpc::dyn_cast_or_default(a1, 0);
      }
      return a2;
    }
  }
}

BOOL xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  xpc_object_t v5 = *a1;
  if (v4 == MEMORY[0x263EF86E0]) {
    return v5 == (xpc_object_t)MEMORY[0x263EF8698];
  }
  uint64_t v6 = MEMORY[0x21D4876E0](v5);
  xpc_object_t v7 = *a1;
  if (v6 == MEMORY[0x263EF8738])
  {
    uint64_t value = xpc_int64_get_value(v7);
    return value != 0;
  }
  if (MEMORY[0x21D4876E0](v7) == MEMORY[0x263EF87A0])
  {
    uint64_t value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  return a2;
}

uint64_t xpc::dyn_cast_or_default(void *a1, int64_t value)
{
  uint64_t v4 = MEMORY[0x21D4876E0](*a1);
  xpc_object_t v5 = (void *)*a1;
  if (v4 == MEMORY[0x263EF8738])
  {
    uint64_t value = xpc_int64_get_value(v5);
    if (value < 0)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::out_of_range::out_of_range[abi:ne180100](exception, "dyn_cast to uint64_t requires nonnegative values");
      __cxa_throw(exception, (struct type_info *)off_26439CCB0, MEMORY[0x263F8C068]);
    }
    return value;
  }
  if (MEMORY[0x21D4876E0](v5) != MEMORY[0x263EF87A0]) {
    return value;
  }
  uint64_t v6 = (void *)*a1;

  return xpc_uint64_get_value(v6);
}

void sub_2192F567C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, int a2)
{
  return xpc::dyn_cast_or_default(a1, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, unsigned int a2)
{
  return xpc::dyn_cast_or_default(a1, a2);
}

uint64_t xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF86F8] && (bytes_ptr = xpc_data_get_bytes_ptr(*a1)) != 0)
  {
    uint64_t v11 = bytes_ptr;
    uint64_t result = xpc_data_get_length(*a1);
    if (result < 1)
    {
      unint64_t v14 = 0;
      int v13 = 0;
    }
    else
    {
      size_t v12 = result;
      int v13 = (char *)operator new(result);
      unint64_t v14 = &v13[v12];
      uint64_t result = (uint64_t)memcpy(v13, v11, v12);
    }
    *a3 = v13;
    a3[1] = v14;
    a3[2] = v14;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    uint64_t v6 = *(const void **)a2;
    uint64_t v7 = *(void *)(a2 + 8);
    size_t v8 = v7 - *(void *)a2;
    return (uint64_t)std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, v6, v7, v8);
  }
  return result;
}

void xpc::dyn_cast_or_default(xpc_object_t *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF86F8])
  {
    size_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = (uint64_t *)&v12;
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(*a1);
    if (bytes_ptr)
    {
      for (size_t i = xpc_data_get_length(*a1); i; --i)
      {
        std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>((uint64_t *)&v11, (uint64_t *)&v12, *bytes_ptr, *bytes_ptr);
        ++bytes_ptr;
      }
      size_t v8 = v12;
      *a3 = (uint64_t)v11;
      a3[1] = (uint64_t)v8;
      uint64_t v9 = a3 + 1;
      uint64_t v10 = v13;
      a3[2] = v13;
      if (v10)
      {
        v8[2] = v9;
        uint64_t v11 = (uint64_t *)&v12;
        size_t v12 = 0;
        uint64_t v13 = 0;
        size_t v8 = 0;
      }
      else
      {
        *a3 = (uint64_t)v9;
      }
    }
    else
    {
      std::set<unsigned char>::set[abi:ne180100](a3, a2);
      size_t v8 = v12;
    }
    std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(v8);
  }
  else
  {
    std::set<unsigned char>::set[abi:ne180100](a3, a2);
  }
}

void sub_2192F58CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

void xpc::dyn_cast_or_default(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8798])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    size_t length = xpc_string_get_length(*a1);
    std::string::basic_string[abi:ne180100](a3, string_ptr, length);
  }
  else if (*(char *)(a2 + 23) < 0)
  {
    size_t v8 = *(const std::string::value_type **)a2;
    std::string::size_type v9 = *(void *)(a2 + 8);
    std::string::__init_copy_ctor_external(a3, v8, v9);
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
}

size_t xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  if (MEMORY[0x21D4876E0](*a1) != MEMORY[0x263EF8798])
  {
    size_t result = strlen(a2);
    if (result >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = result;
    if (result >= 0x17)
    {
      uint64_t v10 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((result | 7) != 0x17) {
        uint64_t v10 = result | 7;
      }
      uint64_t v11 = v10 + 1;
      size_t v12 = operator new(v10 + 1);
      a3[1] = v7;
      a3[2] = v11 | 0x8000000000000000;
      *a3 = v12;
      a3 = v12;
    }
    else
    {
      *((unsigned char *)a3 + 23) = result;
      if (!result) {
        goto LABEL_13;
      }
    }
    size_t result = (size_t)memcpy(a3, a2, v7);
LABEL_13:
    *((unsigned char *)a3 + v7) = 0;
    return result;
  }
  string_ptr = (char *)xpc_string_get_string_ptr(*a1);
  size_t length = xpc_string_get_length(*a1);

  return (size_t)std::string::basic_string[abi:ne180100](a3, string_ptr, length);
}

double xpc::dyn_cast_or_default(void *a1, double a2)
{
  if (MEMORY[0x21D4876E0](*a1) != MEMORY[0x263EF8710]) {
    return a2;
  }
  xpc_object_t v5 = (void *)*a1;

  return xpc_double_get_value(v5);
}

uint64_t xpc::is_logically_false(xpc_object_t *a1)
{
  if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8758]) {
    return 1;
  }
  uint64_t v2 = MEMORY[0x21D4876E0](*a1);
  xpc_object_t v3 = *a1;
  if (v2 == MEMORY[0x263EF8738])
  {
    uint64_t value = xpc_int64_get_value(v3);
  }
  else
  {
    uint64_t v4 = MEMORY[0x21D4876E0](v3);
    xpc_object_t v5 = *a1;
    if (v4 == MEMORY[0x263EF87A0])
    {
      uint64_t value = xpc_uint64_get_value(v5);
    }
    else
    {
      uint64_t v6 = MEMORY[0x21D4876E0](v5);
      xpc_object_t v7 = *a1;
      if (v6 == MEMORY[0x263EF86E0]) {
        return !xpc_BOOL_get_value(v7);
      }
      uint64_t v8 = MEMORY[0x21D4876E0](v7);
      xpc_object_t v9 = *a1;
      if (v8 == MEMORY[0x263EF86F8])
      {
        uint64_t value = xpc_data_get_length(v9);
      }
      else
      {
        uint64_t v10 = MEMORY[0x21D4876E0](v9);
        xpc_object_t v11 = *a1;
        if (v10 == MEMORY[0x263EF8798])
        {
          uint64_t value = xpc_string_get_length(v11);
        }
        else
        {
          uint64_t v12 = MEMORY[0x21D4876E0](v11);
          xpc_object_t v13 = *a1;
          if (v12 == MEMORY[0x263EF86D8])
          {
            uint64_t value = xpc_array_get_count(v13);
          }
          else
          {
            if (MEMORY[0x21D4876E0](v13) != MEMORY[0x263EF8708]) {
              return 0;
            }
            uint64_t value = xpc_dictionary_get_count(*a1);
          }
        }
      }
    }
  }
  return value == 0;
}

BOOL xpc::is_logically_false(xpc_object_t *a1)
{
  return MEMORY[0x21D4876E0](*a1) != MEMORY[0x263EF8708] || xpc_dictionary_get_count(*a1) == 0;
}

BOOL xpc::is_logically_false(xpc_object_t *this, const xpc::array *a2)
{
  return MEMORY[0x21D4876E0](*this, a2) != MEMORY[0x263EF86D8] || xpc_array_get_count(*this) == 0;
}

void xpc::auto_reply::deleter(xpc_object_t *a1)
{
  if (a1)
  {
    if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8708])
    {
      remote_connection = xpc_dictionary_get_remote_connection(*a1);
      if (remote_connection) {
        xpc_connection_send_message(remote_connection, *a1);
      }
    }
    xpc_release(*a1);
    operator delete(a1);
  }
}

void xpc::auto_reply::deleter_with_conn(xpc_object_t *a1, xpc_connection_t *a2)
{
  if (a1)
  {
    if (MEMORY[0x21D4876E0](*a1) == MEMORY[0x263EF8708] && MEMORY[0x21D4876E0](*a2) == MEMORY[0x263EF86F0]) {
      xpc_connection_send_message(*a2, *a1);
    }
    xpc_release(*a1);
    operator delete(a1);
  }
}

void xpc::auto_reply::connect(void ***a1, xpc_object_t *a2)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    xpc_object_t v4 = *a2;
    if (*a2) {
      xpc_retain(*a2);
    }
    else {
      xpc_object_t v4 = xpc_null_create();
    }
    xpc_object_t v5 = *v2;
    uint64_t *v2 = v4;
    xpc_release(v5);
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v7 = *a2;
    *a2 = v6;
    xpc_release(v7);
  }
}

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    xpc_object_t v5 = result;
    if ((__sz & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    size_t result = operator new(__sz);
    uint64_t v8 = (char *)result;
    void *v5 = result;
    v5[1] = result;
    v5[2] = (char *)result + __sz;
    size_t v9 = a3 - (void)a2;
    if (v9) {
      size_t result = memcpy(result, a2, v9);
    }
    v5[1] = &v8[v9];
  }
  return result;
}

void sub_2192F5F18(_Unwind_Exception *exception_object)
{
  xpc_object_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::set<unsigned char>::set[abi:ne180100](uint64_t *a1, void *a2)
{
  a1[1] = 0;
  xpc_object_t v3 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t)(a1 + 1);
  xpc_object_t v4 = a2 + 1;
  xpc_object_t v5 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>(a1, v3, *((unsigned char *)v5 + 25), *((unsigned char *)v5 + 25));
      xpc_object_t v6 = (void *)v5[1];
      if (v6)
      {
        do
        {
          xpc_object_t v7 = v6;
          xpc_object_t v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          xpc_object_t v7 = (void *)v5[2];
          BOOL v8 = *v7 == (void)v5;
          xpc_object_t v5 = v7;
        }
        while (!v8);
      }
      xpc_object_t v5 = v7;
    }
    while (v7 != v4);
  }
  return a1;
}

void sub_2192F5FCC(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>(uint64_t *result, uint64_t *a2, unsigned __int8 a3, char a4)
{
  xpc_object_t v5 = a2;
  xpc_object_t v6 = result;
  xpc_object_t v7 = (uint64_t **)(result + 1);
  if (result + 1 != a2)
  {
    unsigned int v8 = *((unsigned __int8 *)a2 + 25);
    if (v8 <= a3)
    {
      if (v8 >= a3) {
        return result;
      }
      xpc_object_t v13 = a2 + 1;
      uint64_t v12 = (uint64_t *)a2[1];
      if (v12)
      {
        do
        {
          xpc_object_t v13 = v12;
          uint64_t v12 = (uint64_t *)*v12;
          xpc_object_t v5 = v13;
          unint64_t v14 = v13;
        }
        while (v12);
      }
      else
      {
        unint64_t v14 = a2;
        do
        {
          uint64_t v20 = v14;
          unint64_t v14 = (uint64_t *)v14[2];
        }
        while ((uint64_t *)*v14 != v20);
      }
      if (v14 == (uint64_t *)v7) {
        goto LABEL_42;
      }
      if (*((unsigned __int8 *)v14 + 25) > a3) {
        goto LABEL_42;
      }
      unint64_t v21 = *v7;
      xpc_object_t v13 = result + 1;
      xpc_object_t v5 = result + 1;
      if (!*v7) {
        goto LABEL_42;
      }
      while (1)
      {
        while (1)
        {
          xpc_object_t v5 = v21;
          unsigned int v22 = *((unsigned __int8 *)v21 + 25);
          if (v22 <= a3) {
            break;
          }
          unint64_t v21 = (uint64_t *)*v21;
          xpc_object_t v13 = v5;
          if (!*v5) {
            goto LABEL_42;
          }
        }
        if (v22 >= a3) {
          return result;
        }
        unint64_t v21 = (uint64_t *)v21[1];
        if (!v21)
        {
LABEL_30:
          xpc_object_t v13 = v5 + 1;
          goto LABEL_42;
        }
      }
    }
  }
  uint64_t v9 = *a2;
  if ((uint64_t *)*result == a2)
  {
    xpc_object_t v11 = a2;
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = (uint64_t *)*a2;
      do
      {
        xpc_object_t v11 = v10;
        uint64_t v10 = (uint64_t *)v10[1];
      }
      while (v10);
    }
    else
    {
      uint64_t v15 = a2;
      do
      {
        xpc_object_t v11 = (uint64_t *)v15[2];
        BOOL v16 = *v11 == (void)v15;
        uint64_t v15 = v11;
      }
      while (v16);
    }
    if (*((unsigned __int8 *)v11 + 25) >= a3)
    {
      unint64_t v18 = *v7;
      xpc_object_t v13 = result + 1;
      xpc_object_t v5 = result + 1;
      if (!*v7) {
        goto LABEL_42;
      }
      while (1)
      {
        while (1)
        {
          xpc_object_t v5 = v18;
          unsigned int v19 = *((unsigned __int8 *)v18 + 25);
          if (v19 <= a3) {
            break;
          }
          unint64_t v18 = (uint64_t *)*v18;
          xpc_object_t v13 = v5;
          if (!*v5) {
            goto LABEL_42;
          }
        }
        if (v19 >= a3) {
          return result;
        }
        unint64_t v18 = (uint64_t *)v18[1];
        if (!v18) {
          goto LABEL_30;
        }
      }
    }
  }
  if (v9) {
    unint64_t v17 = v11;
  }
  else {
    unint64_t v17 = a2;
  }
  if (v9) {
    xpc_object_t v13 = v11 + 1;
  }
  else {
    xpc_object_t v13 = a2;
  }
  if (!*v13)
  {
    xpc_object_t v5 = v17;
LABEL_42:
    uint64_t v23 = operator new(0x20uLL);
    v23[25] = a4;
    *(void *)uint64_t v23 = 0;
    *((void *)v23 + 1) = 0;
    *((void *)v23 + 2) = v5;
    *xpc_object_t v13 = (uint64_t)v23;
    uint64_t v24 = *(void *)*v6;
    if (v24)
    {
      *xpc_object_t v6 = v24;
      long long v25 = (uint64_t *)*v13;
    }
    else
    {
      long long v25 = (uint64_t *)v23;
    }
    size_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v6[1], v25);
    ++v6[2];
  }
  return result;
}

void ctu::hex(ctu *this@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  if (a2 >= 1)
  {
    xpc_object_t v3 = this;
    xpc_object_t v5 = (ctu *)((char *)this + a2);
    do
    {
      if (*(unsigned __int8 *)v3 >= 0xA0u) {
        char v6 = 87;
      }
      else {
        char v6 = 48;
      }
      std::string::push_back(a3, v6 + (*(unsigned char *)v3 >> 4));
      unsigned int v7 = *(unsigned char *)v3 & 0xF;
      if (v7 >= 0xA) {
        char v8 = 87;
      }
      else {
        char v8 = 48;
      }
      std::string::push_back(a3, v8 + v7);
      xpc_object_t v3 = (ctu *)((char *)v3 + 1);
    }
    while (v3 < v5);
  }
}

void sub_2192F6250(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::hex_sp(ctu *this@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  if (a2 >= 1)
  {
    xpc_object_t v3 = this;
    xpc_object_t v5 = (ctu *)((char *)this + a2);
    do
    {
      if (*(unsigned __int8 *)v3 >= 0xA0u) {
        char v6 = 87;
      }
      else {
        char v6 = 48;
      }
      std::string::push_back(a3, v6 + (*(unsigned char *)v3 >> 4));
      unsigned int v7 = *(unsigned char *)v3 & 0xF;
      if (v7 >= 0xA) {
        char v8 = 87;
      }
      else {
        char v8 = 48;
      }
      std::string::push_back(a3, v8 + v7);
      std::string::push_back(a3, 32);
      xpc_object_t v3 = (ctu *)((char *)v3 + 1);
    }
    while (v3 < v5);
    if (SHIBYTE(a3->__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = a3->__r_.__value_.__l.__size_;
      if (!size) {
        return;
      }
      std::string::size_type v10 = a3->__r_.__value_.__r.__words[0];
      std::string::size_type v9 = a3->__r_.__value_.__r.__words[0] + size;
    }
    else
    {
      if (!*((unsigned char *)&a3->__r_.__value_.__s + 23)) {
        return;
      }
      std::string::size_type v9 = (std::string::size_type)a3 + HIBYTE(a3->__r_.__value_.__r.__words[2]);
      std::string::size_type v10 = (std::string::size_type)a3;
    }
    std::string::erase(a3, ~v10 + v9, 1uLL);
  }
}

void sub_2192F6348(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::hex(ctu **a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = v2 - *a1;
  if (v2 == *a1) {
    xpc_object_t v4 = 0;
  }
  else {
    xpc_object_t v4 = *a1;
  }
  ctu::hex(v4, v3, a2);
}

void ctu::hex_sp(ctu **a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = v2 - *a1;
  if (v2 == *a1) {
    xpc_object_t v4 = 0;
  }
  else {
    xpc_object_t v4 = *a1;
  }
  ctu::hex_sp(v4, v3, a2);
}

void ctu::hex(ctu *this@<X0>, unint64_t a2@<X8>)
{
  unsigned __int8 v2 = this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    unsigned int v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  int v6 = *(char *)(a2 + 23);
  BOOL v7 = v6 < 0;
  if (v6 >= 0) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = *(void *)a2;
  }
  if (v7) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  std::string::size_type v10 = (unsigned char *)(v8 + v9 - 1);
  if (v9) {
    BOOL v11 = (unint64_t)v10 > v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = v8 + 1;
    do
    {
      char v13 = *(unsigned char *)(v12 - 1);
      *(unsigned char *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned __int16 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  unsigned __int8 v2 = (unsigned __int16)this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    unsigned int v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  int v6 = *(char *)(a2 + 23);
  BOOL v7 = v6 < 0;
  if (v6 >= 0) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = *(void *)a2;
  }
  if (v7) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  std::string::size_type v10 = (unsigned char *)(v8 + v9 - 1);
  if (v9) {
    BOOL v11 = (unint64_t)v10 > v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = v8 + 1;
    do
    {
      char v13 = *(unsigned char *)(v12 - 1);
      *(unsigned char *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned int v2;
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unsigned char *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  unsigned __int8 v2 = this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xF) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    std::string::size_type v10 = v2 > 0xF;
    v2 >>= 4;
  }
  while (v10);
  unsigned int v5 = *(char *)(a2 + 23);
  int v6 = v5 < 0;
  if (v5 >= 0) {
    BOOL v7 = a2;
  }
  else {
    BOOL v7 = *(void *)a2;
  }
  if (v6) {
    unint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    std::string::size_type v10 = (unint64_t)v9 > v7;
  }
  else {
    std::string::size_type v10 = 0;
  }
  if (v10)
  {
    BOOL v11 = v7 + 1;
    do
    {
      unint64_t v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  unsigned __int8 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  unsigned __int8 v2 = this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    unsigned int v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  int v6 = *(char *)(a2 + 23);
  BOOL v7 = v6 < 0;
  if (v6 >= 0) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = *(void *)a2;
  }
  if (v7) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  std::string::size_type v10 = (unsigned char *)(v8 + v9 - 1);
  if (v9) {
    BOOL v11 = (unint64_t)v10 > v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = v8 + 1;
    do
    {
      char v13 = *(unsigned char *)(v12 - 1);
      *(unsigned char *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned __int8 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  unsigned __int8 v2 = this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    unsigned int v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  int v6 = *(char *)(a2 + 23);
  BOOL v7 = v6 < 0;
  if (v6 >= 0) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = *(void *)a2;
  }
  if (v7) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  std::string::size_type v10 = (unsigned char *)(v8 + v9 - 1);
  if (v9) {
    BOOL v11 = (unint64_t)v10 > v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = v8 + 1;
    do
    {
      char v13 = *(unsigned char *)(v12 - 1);
      *(unsigned char *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned __int16 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  unsigned char *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  unsigned __int8 v2 = (unsigned __int16)this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    unsigned int v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  int v6 = *(char *)(a2 + 23);
  BOOL v7 = v6 < 0;
  if (v6 >= 0) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = *(void *)a2;
  }
  if (v7) {
    uint64_t v9 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
  }
  std::string::size_type v10 = (unsigned char *)(v8 + v9 - 1);
  if (v9) {
    BOOL v11 = (unint64_t)v10 > v8;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    unint64_t v12 = v8 + 1;
    do
    {
      char v13 = *(unsigned char *)(v12 - 1);
      *(unsigned char *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned int v2;
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unsigned char *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  unsigned __int8 v2 = this;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xF) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    std::string::size_type v10 = v2 > 0xF;
    v2 >>= 4;
  }
  while (v10);
  unsigned int v5 = *(char *)(a2 + 23);
  int v6 = v5 < 0;
  if (v5 >= 0) {
    BOOL v7 = a2;
  }
  else {
    BOOL v7 = *(void *)a2;
  }
  if (v6) {
    unint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    unint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    std::string::size_type v10 = (unint64_t)v9 > v7;
  }
  else {
    std::string::size_type v10 = 0;
  }
  if (v10)
  {
    BOOL v11 = v7 + 1;
    do
    {
      unint64_t v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

void sub_2192F643C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F650C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F65DC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::hex(unint64_t this@<X0>, unint64_t a2@<X8>)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    BOOL v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  int v5 = *(char *)(a2 + 23);
  BOOL v6 = v5 < 0;
  if (v5 >= 0) {
    unint64_t v7 = a2;
  }
  else {
    unint64_t v7 = *(void *)a2;
  }
  if (v6) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    BOOL v10 = (unint64_t)v9 > v7;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    unint64_t v11 = v7 + 1;
    do
    {
      char v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unsigned char *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    BOOL v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  int v5 = *(char *)(a2 + 23);
  BOOL v6 = v5 < 0;
  if (v5 >= 0) {
    unint64_t v7 = a2;
  }
  else {
    unint64_t v7 = *(void *)a2;
  }
  if (v6) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    BOOL v10 = (unint64_t)v9 > v7;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    unint64_t v11 = v7 + 1;
    do
    {
      char v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unsigned char *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    BOOL v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  int v5 = *(char *)(a2 + 23);
  BOOL v6 = v5 < 0;
  if (v5 >= 0) {
    unint64_t v7 = a2;
  }
  else {
    unint64_t v7 = *(void *)a2;
  }
  if (v6) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    BOOL v10 = (unint64_t)v9 > v7;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    unint64_t v11 = v7 + 1;
    do
    {
      char v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  unsigned char *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA) {
      char v4 = 87;
    }
    else {
      char v4 = 48;
    }
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    BOOL v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  int v5 = *(char *)(a2 + 23);
  BOOL v6 = v5 < 0;
  if (v5 >= 0) {
    unint64_t v7 = a2;
  }
  else {
    unint64_t v7 = *(void *)a2;
  }
  if (v6) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  else {
    uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  }
  uint64_t v9 = (unsigned char *)(v7 + v8 - 1);
  if (v8) {
    BOOL v10 = (unint64_t)v9 > v7;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    unint64_t v11 = v7 + 1;
    do
    {
      char v12 = *(unsigned char *)(v11 - 1);
      *(unsigned char *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

void sub_2192F66AC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F677C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F684C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F691C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F69EC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F6ABC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F6B8C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F6C5C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::hex0(ctu *this@<X0>, std::string *a2@<X8>)
{
  unsigned int v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 2uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (uint64_t)v6 + size;
    if ((v2 & 0xF) >= 0xA) {
      char v9 = 87;
    }
    else {
      char v9 = 48;
    }
    *(unsigned char *)(v8 - 1) = v9 + (v2 & 0xF);
    if (v2 >= 0xA0) {
      char v10 = 87;
    }
    else {
      char v10 = 48;
    }
    *(unsigned char *)(v8 - 2) = v10 + (v2 >> 4);
  }
}

{
  int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  unsigned int v9;
  char v10;
  char v11;

  unsigned int v2 = (int)this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 4uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      char v9 = (unsigned __int16)v2;
      if ((v2 & 0xFu) >= 0xA) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      char *v8 = v10 + (v2 & 0xF);
      if (v2 >= 0xA0u) {
        unint64_t v11 = 87;
      }
      else {
        unint64_t v11 = 48;
      }
      *(v8 - 1) = v11 + (v2 >> 4);
      LOWORD(v2) = BYTE1(v2);
      v8 -= 2;
    }
    while (v9 >= 0x100);
  }
}

{
  unsigned int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  char v9;
  char v10;
  BOOL v11;

  unsigned int v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 8uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      if ((v2 & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      char *v8 = v9 + (v2 & 0xF);
      if (v2 >= 0xA0u) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 1) = v10 + (v2 >> 4);
      v8 -= 2;
      unint64_t v11 = v2 >= 0x100;
      v2 >>= 8;
    }
    while (v11);
  }
}

{
  unsigned __int8 v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  uint64_t v8;
  char v9;
  char v10;

  unsigned int v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 2uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (uint64_t)v6 + size;
    if ((v2 & 0xFu) >= 0xA) {
      char v9 = 87;
    }
    else {
      char v9 = 48;
    }
    *(unsigned char *)(v8 - 1) = v9 + (v2 & 0xF);
    if (v2 >= 0xA0u) {
      char v10 = 87;
    }
    else {
      char v10 = 48;
    }
    *(unsigned char *)(v8 - 2) = v10 + (v2 >> 4);
  }
}

{
  unsigned __int8 v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  uint64_t v8;
  char v9;
  char v10;

  unsigned int v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 2uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (uint64_t)v6 + size;
    if ((v2 & 0xFu) >= 0xA) {
      char v9 = 87;
    }
    else {
      char v9 = 48;
    }
    *(unsigned char *)(v8 - 1) = v9 + (v2 & 0xF);
    if (v2 >= 0xA0u) {
      char v10 = 87;
    }
    else {
      char v10 = 48;
    }
    *(unsigned char *)(v8 - 2) = v10 + (v2 >> 4);
  }
}

{
  int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  unsigned int v9;
  char v10;
  char v11;

  unsigned int v2 = (int)this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 4uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      char v9 = (unsigned __int16)v2;
      if ((v2 & 0xFu) >= 0xA) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      char *v8 = v10 + (v2 & 0xF);
      if (v2 >= 0xA0u) {
        unint64_t v11 = 87;
      }
      else {
        unint64_t v11 = 48;
      }
      *(v8 - 1) = v11 + (v2 >> 4);
      LOWORD(v2) = BYTE1(v2);
      v8 -= 2;
    }
    while (v9 >= 0x100);
  }
}

{
  unsigned int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  char v9;
  char v10;
  BOOL v11;

  unsigned int v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 8uLL, 48);
  if (v2)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      if ((v2 & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      char *v8 = v9 + (v2 & 0xF);
      if (v2 >= 0xA0u) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 1) = v10 + (v2 >> 4);
      v8 -= 2;
      unint64_t v11 = v2 >= 0x100;
      v2 >>= 8;
    }
    while (v11);
  }
}

void sub_2192F6D00(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F6DC0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F6E80(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ctu::hex0(unint64_t this@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      unsigned char *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      BOOL v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      unsigned char *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      BOOL v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      unsigned char *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      BOOL v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  unsigned char *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    int v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    BOOL v5 = v4 < 0;
    BOOL v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0) {
      BOOL v6 = a2;
    }
    std::string::size_type size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5) {
      std::string::size_type size = a2->__r_.__value_.__l.__size_;
    }
    uint64_t v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA) {
        char v9 = 87;
      }
      else {
        char v9 = 48;
      }
      unsigned char *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u) {
        char v10 = 87;
      }
      else {
        char v10 = 48;
      }
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      BOOL v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

void sub_2192F6F40(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F7000(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F70A8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F7150(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F7210(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F72D0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F7390(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_2192F7450(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

double ctu::parse_hex@<D0>(ctu *a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  int v4 = (const char *)*((void *)a1 + 1);
  if (*((char *)a1 + 23) >= 0)
  {
    BOOL v5 = (const char *)*((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = *(ctu **)a1;
    BOOL v5 = v4;
  }
  return ctu::parse_hex(a1, v5, a2, a3);
}

double ctu::parse_hex@<D0>(ctu *a1@<X0>, const char *a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if (a3 == 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (a3 == 1)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 1;
      goto LABEL_8;
    }
    if (a3) {
      return result;
    }
    uint64_t v5 = 1;
  }
  uint64_t v6 = 0;
LABEL_8:
  ctu::parse_hex_impl(a1, a2, v5, v6, (unint64_t *)&v9);
  uint64_t v7 = v10;
  double result = *(double *)&v9;
  *(_OWORD *)a4 = v9;
  a4[2] = v7;
  return result;
}

void ctu::parse_hex_impl(ctu *this@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  uint64_t v6 = a3;
  uint64_t v7 = this;
  long long v9 = 0;
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  uint64_t v10 = &a2[(void)this];
  uint64_t v11 = MEMORY[0x263EF8318];
  if (!a3) {
    goto LABEL_9;
  }
LABEL_2:
  if (v7 == (ctu *)v10)
  {
LABEL_9:
    while (v7 != (ctu *)v10)
    {
LABEL_10:
      int v14 = *(unsigned __int8 *)v7;
      unsigned int v15 = v14 - 48;
      unsigned int v16 = v14 - 97;
      if ((v14 - 65) >= 6) {
        char v17 = -1;
      }
      else {
        char v17 = v14 - 55;
      }
      char v18 = v14 - 87;
      if (v16 > 5) {
        char v18 = v17;
      }
      if (v15 < 0xA) {
        char v18 = v15;
      }
      if ((char *)v7 + 1 == v10) {
        goto LABEL_51;
      }
      unsigned int v19 = (char *)v7 + 2;
      int v20 = *((unsigned __int8 *)v7 + 1);
      unsigned int v21 = v20 - 48;
      unsigned int v22 = v20 - 97;
      if ((v20 - 65) >= 6) {
        char v23 = -1;
      }
      else {
        char v23 = v20 - 55;
      }
      char v24 = v20 - 87;
      if (v22 > 5) {
        char v24 = v23;
      }
      if (v21 < 0xA) {
        char v24 = v21;
      }
      if (a4 && v19 != v10 && (*((unsigned char *)v7 + 2) != 32 || (unsigned int v19 = (char *)v7 + 3, (char *)v7 + 3 == v10))
        || v18 == -1
        || v24 == -1)
      {
LABEL_51:
        a5[1] = *a5;
        return;
      }
      char v25 = v24 | (16 * v18);
      unint64_t v26 = a5[2];
      if ((unint64_t)v9 >= v26)
      {
        uint64_t v28 = v6;
        uint64_t v29 = a4;
        unint64_t v30 = *a5;
        unint64_t v31 = &v9[-*a5];
        unint64_t v32 = (unint64_t)(v31 + 1);
        if ((uint64_t)(v31 + 1) < 0) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v33 = v26 - v30;
        if (2 * v33 > v32) {
          unint64_t v32 = 2 * v33;
        }
        if (v33 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v34 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v34 = v32;
        }
        if (v34) {
          unint64_t v35 = (char *)operator new(v34);
        }
        else {
          unint64_t v35 = 0;
        }
        long long v36 = &v31[(void)v35];
        unint64_t v37 = &v31[(void)v35];
        *unint64_t v37 = v25;
        unint64_t v27 = v37 + 1;
        if (v9 != (unsigned char *)v30)
        {
          uint64_t v38 = &v9[~v30];
          do
          {
            char v39 = *--v9;
            (v38--)[(void)v35] = v39;
          }
          while (v9 != (unsigned char *)v30);
          long long v9 = (unsigned char *)*a5;
          long long v36 = v35;
        }
        *a5 = (unint64_t)v36;
        a5[1] = (unint64_t)v27;
        a5[2] = (unint64_t)&v35[v34];
        a4 = v29;
        if (v9) {
          operator delete(v9);
        }
        uint64_t v6 = v28;
        uint64_t v11 = MEMORY[0x263EF8318];
      }
      else
      {
        *long long v9 = v25;
        unint64_t v27 = v9 + 1;
      }
      a5[1] = (unint64_t)v27;
      long long v9 = v27;
      uint64_t v7 = (ctu *)v19;
      if (v6) {
        goto LABEL_2;
      }
    }
  }
  else
  {
    do
    {
      unsigned int v12 = *(char *)v7;
      if ((v12 & 0x80000000) != 0) {
        int v13 = __maskrune(v12, 0x4000uLL);
      }
      else {
        int v13 = *(_DWORD *)(v11 + 4 * v12 + 60) & 0x4000;
      }
      if (!v13) {
        goto LABEL_10;
      }
      uint64_t v7 = (ctu *)((char *)v7 + 1);
    }
    while (v7 != (ctu *)v10);
  }
}

void sub_2192F7760(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int16 *ctl::parseField(unsigned __int16 *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  *a3 = *a1;
  return a1 + 1;
}

_WORD *ctl::writeField(_WORD *a1, __int16 a2)
{
  *a1 = a2;
  return a1 + 1;
}

uint64_t ctl::getFieldSize()
{
  return 2;
}

unsigned char *ctl::tlv::parseField(unsigned char *a1, const unsigned __int8 *a2, unsigned char *a3)
{
  *a3 = *a1;
  tlv::throwIfNotEnoughBytes((unint64_t)(a1 + 1), a2, 1uLL);
  a3[1] = a1[1];
  return a1 + 2;
}

{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 1uLL);
  *a3 = *a1;
  return a1 + 1;
}

unsigned char *ctl::tlv::writeField(unsigned char *a1, unsigned char *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return a1 + 2;
}

{
  *a1 = *a2;
  return a1 + 1;
}

uint64_t ctl::tlv::getFieldSize()
{
  return 2;
}

{
  return 2;
}

{
  return 5;
}

{
  return 1;
}

{
  return 1;
}

{
  return 4;
}

uint64_t tlv::parseV<ctl::tlv::AssignedId>(unint64_t *a1, int a2)
{
  uint64_t v3 = (unsigned __int8 *)*a1;
  int v4 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotEnoughBytes(*a1, v4, 1uLL);
  int v5 = *v3;
  tlv::throwIfNotEnoughBytes((unint64_t)(v3 + 1), v4, 1uLL);
  int v6 = v3[1];
  *a1 = (unint64_t)(v3 + 2);
  return v5 | (v6 << 8);
}

uint64_t sub_2192F78B4(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  return v2;
}

uint64_t tlv::size<ctl::tlv::AssignedId>()
{
  return 5;
}

unsigned char **tlv::writeV<ctl::tlv::AssignedId>(unsigned char **result, unsigned char *a2)
{
  unsigned int v2 = *result;
  unsigned char *v2 = *a2;
  v2[1] = a2[1];
  void *result = v2 + 2;
  return result;
}

unsigned __int16 *ctl::tlv::parseField(unsigned __int16 *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  *a3 = *a1;
  return a1 + 1;
}

_WORD *ctl::tlv::writeField(_WORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  return a1 + 1;
}

uint64_t tlv::parseV<ctl::tlv::LinkLayerProtocol>(unint64_t *a1, int a2)
{
  uint64_t v3 = (unsigned __int16 *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 2uLL);
  uint64_t result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_2192F7988(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::LinkLayerProtocol>()
{
  return 5;
}

_WORD **tlv::writeV<ctl::tlv::LinkLayerProtocol>(_WORD **result, _DWORD *a2)
{
  unsigned int v2 = *result;
  _WORD *v2 = *a2;
  void *result = v2 + 1;
  return result;
}

unint64_t ctl::tlv::parseField(unint64_t a1, const unsigned __int8 *a2, uint64_t a3)
{
  tlv::throwIfNotEnoughBytes(a1, a2, 4uLL);
  *(_DWORD *)a3 = *(_DWORD *)a1;
  tlv::throwIfNotEnoughBytes(a1 + 4, a2, 1uLL);
  unint64_t result = a1 + 5;
  *(unsigned char *)(a3 + 4) = *(unsigned char *)(a1 + 4);
  return result;
}

uint64_t ctl::tlv::writeField(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(unsigned char *)(a1 + 4) = *(unsigned char *)(a2 + 4);
  return a1 + 5;
}

unint64_t tlv::parseV<ctl::tlv::PowerSaveDescriptor>(unint64_t *a1, int a2)
{
  unint64_t v3 = *a1;
  int v4 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotEnoughBytes(*a1, v4, 4uLL);
  unsigned int v5 = *(_DWORD *)v3;
  tlv::throwIfNotEnoughBytes(v3 + 4, v4, 1uLL);
  uint64_t v6 = *(unsigned __int8 *)(v3 + 4);
  *a1 = v3 + 5;
  return (v6 << 32) | 0xAAAAAA0000000000 | v5;
}

void sub_2192F7AC0(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  JUMPOUT(0x2192F7AA4);
}

uint64_t tlv::size<ctl::tlv::PowerSaveDescriptor>()
{
  return 8;
}

uint64_t *tlv::writeV<ctl::tlv::PowerSaveDescriptor>(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *(_DWORD *)uint64_t v2 = *(_DWORD *)a2;
  *(unsigned char *)(v2 + 4) = *(unsigned char *)(a2 + 4);
  void *result = v2 + 5;
  return result;
}

const unsigned __int8 *ctl::tlv::parseField(unsigned char *a1, const unsigned __int8 *a2, char **a3)
{
  tlv::throwIfNotAligned((unint64_t)a1, a2, 2uLL);
  unint64_t v6 = (unint64_t)(a2 - a1) >> 1;
  uint64_t v7 = *a3;
  unint64_t v8 = (a3[1] - *a3) >> 1;
  if (v6 <= v8)
  {
    if (v6 < v8) {
      a3[1] = &v7[2 * v6];
    }
  }
  else
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v6 - v8);
    uint64_t v7 = *a3;
  }
  memcpy(v7, a1, a2 - a1);
  return a2;
}

char *ctl::tlv::writeField(char *a1, uint64_t a2)
{
  unint64_t v3 = *(const void **)a2;
  size_t v5 = *(void *)(a2 + 8) - (void)v3;
  memcpy(a1, v3, v5);
  return &a1[v5];
}

uint64_t ctl::tlv::getFieldSize(void *a1)
{
  return a1[1] - *a1;
}

{
  return a1[1] - *a1 + 1;
}

void *tlv::parseV<ctl::tlv::IndicationSet>@<X0>(unint64_t *a1@<X0>, signed int a2@<W1>, void **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  unint64_t v6 = (const void *)*a1;
  size_t v7 = a2;
  unint64_t v8 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotAligned(*a1, v8, 2uLL);
  if (a2 >= 2)
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v7 >> 1);
    long long v9 = *a3;
  }
  else
  {
    long long v9 = 0;
  }
  unint64_t result = memcpy(v9, v6, v7);
  *a1 = (unint64_t)v8;
  return result;
}

void sub_2192F7C44(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  JUMPOUT(0x2192F7C30);
}

void sub_2192F7C54(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t tlv::size<ctl::tlv::IndicationSet>(void *a1)
{
  return a1[1] - *a1 + 3;
}

void *tlv::writeV<ctl::tlv::IndicationSet>(void **a1, uint64_t a2)
{
  unint64_t v3 = (char *)*a1;
  int v4 = *(const void **)a2;
  size_t v6 = *(void *)(a2 + 8) - (void)v4;
  unint64_t result = memcpy(*a1, v4, v6);
  *a1 = &v3[v6];
  return result;
}

char *ctl::tlv::parseField(unsigned __int8 *a1, const unsigned __int8 *a2, char **a3)
{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 1uLL);
  unsigned int v8 = *a1;
  size_t v6 = (char *)(a1 + 1);
  unint64_t v7 = v8;
  unint64_t v9 = 2 * v8;
  tlv::throwIfNotEnoughBytes((unint64_t)v6, a2, v9);
  uint64_t v10 = *a3;
  unint64_t v11 = (a3[1] - *a3) >> 1;
  unint64_t v12 = v8 - v11;
  if (v8 <= v11)
  {
    if (v7 < v11) {
      a3[1] = &v10[2 * v7];
    }
  }
  else
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v12);
    uint64_t v10 = *a3;
  }
  memcpy(v10, v6, v9);
  return &v6[v9];
}

unsigned char *ctl::tlv::writeField(unsigned char *a1, _DWORD *a2)
{
  *a1 = (a2[2] - *a2) >> 1;
  uint64_t v2 = a1 + 1;
  unint64_t v3 = *(const void **)a2;
  size_t v5 = *((void *)a2 + 1) - (void)v3;
  memcpy(a1 + 1, v3, v5);
  return &v2[v5];
}

{
  *a1 = *a2;
  return a1 + 1;
}

void *tlv::parseV<ctl::tlv::IndicationSetExt>@<X0>(unint64_t *a1@<X0>, int a2@<W1>, void **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  size_t v5 = (unsigned __int8 *)*a1;
  size_t v6 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotEnoughBytes(*a1, v6, 1uLL);
  unsigned int v9 = *v5;
  unint64_t v7 = v5 + 1;
  unint64_t v8 = v9;
  unint64_t v10 = 2 * v9;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, v10);
  if (v9)
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v8);
    unint64_t v11 = *a3;
  }
  else
  {
    unint64_t v11 = 0;
  }
  unint64_t result = memcpy(v11, v7, v10);
  *a1 = (unint64_t)v7 + v10;
  return result;
}

void sub_2192F7E58(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  JUMPOUT(0x2192F7E44);
}

void sub_2192F7E68(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t tlv::size<ctl::tlv::IndicationSetExt>(void *a1)
{
  return a1[1] - *a1 + 4;
}

void *tlv::writeV<ctl::tlv::IndicationSetExt>(unsigned char **a1, _DWORD *a2)
{
  unint64_t v3 = *a1;
  *v3++ = (a2[2] - *a2) >> 1;
  int v4 = *(const void **)a2;
  size_t v6 = *((void *)a2 + 1) - (void)v4;
  unint64_t result = memcpy(v3, v4, v6);
  *a1 = &v3[v6];
  return result;
}

uint64_t tlv::parseV<ctl::tlv::ServiceType>(unint64_t *a1, int a2)
{
  unint64_t v3 = (unsigned __int8 *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 1uLL);
  uint64_t result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_2192F7F78(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::ServiceType>()
{
  return 4;
}

unsigned char **tlv::writeV<ctl::tlv::ServiceType>(unsigned char **result, unsigned char *a2)
{
  uint64_t v2 = *result;
  unsigned char *v2 = *a2;
  void *result = v2 + 1;
  return result;
}

unsigned __int8 *ctl::tlv::parseField(unsigned __int8 *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  *a3 = *a1;
  return a1 + 1;
}

uint64_t tlv::parseV<ctl::tlv::DataFormat>(unint64_t *a1, int a2)
{
  unint64_t v3 = (unsigned __int8 *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 1uLL);
  uint64_t result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_2192F8038(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::DataFormat>()
{
  return 4;
}

unsigned char **tlv::writeV<ctl::tlv::DataFormat>(unsigned char **result, _DWORD *a2)
{
  uint64_t v2 = *result;
  unsigned char *v2 = *a2;
  void *result = v2 + 1;
  return result;
}

_DWORD *ctl::tlv::parseField(_DWORD *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  *a3 = *a1;
  return a1 + 1;
}

_DWORD *ctl::tlv::writeField(_DWORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  return a1 + 1;
}

uint64_t tlv::parseV<ctl::tlv::PowerSaveState>(unint64_t *a1, int a2)
{
  unint64_t v3 = (unsigned int *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 4uLL);
  uint64_t result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_2192F80F8(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::PowerSaveState>()
{
  return 7;
}

_DWORD **tlv::writeV<ctl::tlv::PowerSaveState>(_DWORD **result, _DWORD *a2)
{
  uint64_t v2 = *result;
  _DWORD *v2 = *a2;
  void *result = v2 + 1;
  return result;
}

void std::vector<unsigned short>::__append(uint64_t a1, unint64_t a2)
{
  size_t v5 = *(char **)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 16);
  size_t v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 1)
  {
    if (a2)
    {
      bzero(v5, 2 * a2);
      size_t v6 = &v5[2 * a2];
    }
    *(void *)(a1 + 8) = v6;
  }
  else
  {
    unint64_t v7 = *(char **)a1;
    uint64_t v8 = (uint64_t)&v5[-*(void *)a1];
    uint64_t v9 = v8 >> 1;
    uint64_t v10 = (v8 >> 1) + a2;
    if (v10 < 0) {
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = v4 - (void)v7;
    if (v11 > v10) {
      uint64_t v10 = v11;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 < 0) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      int v13 = operator new(2 * v12);
    }
    else
    {
      int v13 = 0;
    }
    int v14 = &v13[2 * v9];
    size_t v15 = 2 * a2;
    unsigned int v16 = &v13[2 * v12];
    bzero(v14, v15);
    char v17 = &v14[v15];
    if (v5 != v7)
    {
      unint64_t v18 = v5 - v7 - 2;
      if (v18 < 0x1E) {
        goto LABEL_31;
      }
      if ((unint64_t)(v5 - v13 - v8) < 0x20) {
        goto LABEL_31;
      }
      uint64_t v19 = (v18 >> 1) + 1;
      unint64_t v20 = 2 * (v19 & 0xFFFFFFFFFFFFFFF0);
      size_t v6 = &v5[-v20];
      v14 -= v20;
      unsigned int v21 = &v13[2 * v9 - 16];
      unsigned int v22 = v5 - 16;
      unint64_t v23 = v19 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        long long v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        _OWORD *v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 16;
      }
      while (v23);
      if (v19 != (v19 & 0xFFFFFFFFFFFFFFF0))
      {
LABEL_31:
        do
        {
          __int16 v25 = *((_WORD *)v6 - 1);
          v6 -= 2;
          *((_WORD *)v14 - 1) = v25;
          v14 -= 2;
        }
        while (v6 != v7);
      }
    }
    *(void *)a1 = v14;
    *(void *)(a1 + 8) = v17;
    *(void *)(a1 + 16) = v16;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

std::logic_error *tlv::TlvParseException::TlvParseException(std::logic_error *this, unint64_t a2, unint64_t a3)
{
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_2192FB060;
  strcpy(__p.__r_.__value_.__l.__data_, "TLV parsing failed; expected ");
  std::to_string(&v12, a2);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    size_t v6 = &v12;
  }
  else {
    size_t v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v12.__r_.__value_.__l.__size_;
  }
  std::string::append(&__p, (const std::string::value_type *)v6, size);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  std::string::append(&__p, " bytes; got ", 0xCuLL);
  std::to_string(&v12, a3);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v8 = &v12;
  }
  else {
    uint64_t v8 = (std::string *)v12.__r_.__value_.__r.__words[0];
  }
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v9 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v9 = v12.__r_.__value_.__l.__size_;
  }
  std::string::append(&__p, (const std::string::value_type *)v8, v9);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  std::string::append(&__p, " bytes.", 7uLL);
  std::logic_error::logic_error(this, &__p);
  this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  this->__vftable = (std::logic_error_vtbl *)&unk_26CAAC1E0;
  return this;
}

void sub_2192F8440(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if ((a14 & 0x80000000) == 0) {
    _Unwind_Resume(exception_object);
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::logic_error *tlv::TlvParseException::TlvParseException(std::logic_error *this)
{
  uint64_t result = std::logic_error::logic_error(this, "TLV parsing failed; endpoint preceded beginning of buffer.");
  result->__vftable = (std::logic_error_vtbl *)&unk_26CAAC1E0;
  return result;
}

{
  std::logic_error *result;

  uint64_t result = std::logic_error::logic_error(this, "TLV parsing failed; endpoint preceded beginning of buffer.");
  result->__vftable = (std::logic_error_vtbl *)&unk_26CAAC1E0;
  return result;
}

unint64_t tlv::throwIfNotAligned(unint64_t this, const unsigned __int8 *a2, unint64_t a3)
{
  if (this > (unint64_t)a2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException(exception);
    goto LABEL_6;
  }
  unint64_t v3 = &a2[-this];
  if ((unint64_t)&a2[-this] % a3)
  {
    unint64_t v5 = (unint64_t)&v3[a3 - 1] / a3 * a3;
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException((tlv::TlvParseException *)exception, v5, (unint64_t)v3);
LABEL_6:
  }
  return this;
}

void sub_2192F85D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_2192F85EC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void tlv::TlvParseException::~TlvParseException(tlv::TlvParseException *this)
{
  uint64_t v1 = (void *)MEMORY[0x21D487220](this);

  operator delete(v1);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x270F98338](this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983C8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983D0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98778]();
}

{
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987B8]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987C8]();
}

{
  return MEMORY[0x270F987D0]();
}

{
  return MEMORY[0x270F987D8]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

double std::stod(const std::string *__str, size_t *__idx)
{
  MEMORY[0x270F98B68](__str, __idx);
  return result;
}

uint64_t std::stoll(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98BC0](__str, __idx, *(void *)&__base);
}

void std::locale::~locale(std::locale *this)
{
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98C90](__str, __idx, *(void *)&__base);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x270F98DF8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x270F98E00](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDBD18](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x270EDBFA8](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x270EDBFB8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x270EDC058](xdict);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x270EDC098](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x270EDC170](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x270EDC218](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x270EDC3D0](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x270EDC3F0](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}