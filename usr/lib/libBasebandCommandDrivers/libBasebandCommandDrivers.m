uint64_t awd::AppContext::getAppID(awd::AppContext *this)
{
  return *((unsigned __int8 *)this + 8);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__16vectorIhNS_9allocatorIhEEEE(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

void awd::AppContext::operator()(dispatch_queue_t *a1, _OWORD *a2, long long *a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK3awd10AppContextclENS_10MetricInfoENS_11TriggerInfoE_block_invoke;
  v3[3] = &__block_descriptor_tmp_37;
  v3[4] = a1;
  v6[0] = *a2;
  *(_OWORD *)((char *)v6 + 12) = *(_OWORD *)((char *)a2 + 12);
  long long v4 = *a3;
  uint64_t v5 = *((void *)a3 + 2);
  dispatch_async(*a1, v3);
}

void *__copy_helper_block_e8_40c39_ZTSNSt3__16vectorIhNS_9allocatorIhEEEE(void *result, uint64_t a2)
{
  result[5] = 0;
  result[6] = 0;
  result[7] = 0;
  v3 = *(unsigned char **)(a2 + 40);
  v2 = *(unsigned char **)(a2 + 48);
  size_t v4 = v2 - v3;
  if (v2 != v3)
  {
    uint64_t v5 = result;
    if ((v4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    v6 = (char *)operator new(v2 - v3);
    v5[5] = v6;
    v5[6] = v6;
    v7 = &v6[v4];
    v5[7] = &v6[v4];
    result = memcpy(v6, v3, v4);
    v5[6] = v7;
  }
  return result;
}

void sub_21DBD9E5C(_Unwind_Exception *exception_object)
{
  size_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 48) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK3awd10AppContextclENS_10MetricInfoEjNSt3__16vectorIhNS2_9allocatorIhEEEE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v1)
  {
    uint64_t v2 = *(unsigned int *)(a1 + 92);
    size_t v4 = *(unsigned char **)(a1 + 40);
    v3 = *(unsigned char **)(a1 + 48);
    v11[0] = *(_OWORD *)(a1 + 64);
    *(_OWORD *)((char *)v11 + 12) = *(_OWORD *)(a1 + 76);
    v9 = 0;
    v10 = 0;
    __p = 0;
    size_t v5 = v3 - v4;
    if (v3 != v4)
    {
      if ((v5 & 0x8000000000000000) != 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      v6 = (char *)operator new(v3 - v4);
      v7 = &v6[v5];
      __p = v6;
      v10 = &v6[v5];
      memcpy(v6, v4, v5);
      v9 = v7;
    }
    (*(void (**)(uint64_t, _OWORD *, uint64_t, void **))(v1 + 16))(v1, v11, v2, &__p);
    if (__p)
    {
      v9 = __p;
      operator delete(__p);
    }
  }
}

void sub_21DBD9F38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void awd::AppContext::operator()(dispatch_queue_t *a1, _OWORD *a2, int a3, uint64_t a4)
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 1174405120;
  v8[2] = ___ZNK3awd10AppContextclENS_10MetricInfoEjNSt3__16vectorIhNS2_9allocatorIhEEEE_block_invoke;
  v8[3] = &__block_descriptor_tmp_38;
  *(_OWORD *)v12 = *a2;
  *(_OWORD *)&v12[12] = *(_OWORD *)((char *)a2 + 12);
  int v13 = a3;
  v8[4] = a1;
  __p = 0;
  v10 = 0;
  v11 = 0;
  v6 = *(const void **)a4;
  uint64_t v5 = *(void *)(a4 + 8);
  size_t v7 = v5 - *(void *)a4;
  if (v5 != *(void *)a4)
  {
    if ((v7 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    __p = operator new(v5 - *(void *)a4);
    v11 = (char *)__p + v7;
    memcpy(__p, v6, v7);
    v10 = (char *)__p + v7;
  }
  dispatch_async(*a1, v8);
  if (__p)
  {
    v10 = (char *)__p;
    operator delete(__p);
  }
}

void sub_21DBDA03C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZNK3awd10AppContextclENS_10MetricInfoENS_11TriggerInfoE_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result)
  {
    *(_OWORD *)((char *)v5 + 12) = *(_OWORD *)(a1 + 76);
    v5[0] = *(_OWORD *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 56);
    long long v3 = *(_OWORD *)(a1 + 40);
    return (*(uint64_t (**)(uint64_t, _OWORD *, long long *))(result + 16))(result, v5, &v3);
  }
  return result;
}

char *abm::data::getDataPropertyNameFromDict(xpc_object_t *a1)
{
  if (MEMORY[0x223C14EA0](*a1) != MEMORY[0x263EF8708]) {
    return "Unknown";
  }
  xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataProperty");
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  unsigned int v3 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v3 < 5) {
    return off_264476A20[v3];
  }
  else {
    return "Unknown";
  }
}

void sub_21DBDA16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::getDataPropertyTypeFromDict(xpc_object_t *a1)
{
  if (MEMORY[0x223C14EA0](*a1) != MEMORY[0x263EF8708]) {
    return 5;
  }
  xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataProperty");
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  unsigned int v4 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

void sub_21DBDA22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abm::data::DataAggregationProtocol::toDict(abm::data::DataAggregationProtocol *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v5) == MEMORY[0x263EF8708])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(0);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataAggregationProtocol", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationProtocol::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataAggregationProtocol", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

const char *abm::data::DataAggregationProtocol::asString(abm::data::DataAggregationProtocol *this)
{
  uint64_t v1 = *((int *)this + 3);
  if (v1 > 2) {
    return "unknown";
  }
  else {
    return off_264476A48[v1];
  }
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(0);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E720;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x223C14EA0](*a1) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(*a1, "kDataAggregationProtocol"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataAggregationProtocol");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    int v5 = xpc::dyn_cast_or_default();
    xpc_release(object);
    if (v5)
    {
      if (v5 == 1)
      {
        *(_DWORD *)(a2 + 12) = 1;
      }
      else if (v5 == 2)
      {
        *(_DWORD *)(a2 + 12) = 2;
      }
      else
      {
        *(unsigned char *)(a2 + 8) = 0;
        *(_DWORD *)(a2 + 12) = 3;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 12) = 0;
    }
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_21DBDA698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationProtocol>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E720;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (result >= 3)
  {
    *(unsigned char *)(a2 + 8) = 0;
    uint64_t result = 3;
  }
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxDatagrams::toDict(abm::data::DataAggregationMaxDatagrams *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v5) == MEMORY[0x263EF8708])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(1);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataAggregationMaxDatagrams", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxDatagrams::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxDatagrams", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(1);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E768;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x223C14EA0](*a1) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_21DBDAAB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E768;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxSize::toDict(abm::data::DataAggregationMaxSize *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v5) == MEMORY[0x263EF8708])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(2);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataAggregationMaxSize", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxSize::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxSize", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(2);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E7B0;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x223C14EA0](*a1) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_21DBDAEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E7B0;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataFlowControl::toDict(abm::data::DataFlowControl *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v5) == MEMORY[0x263EF8708])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(3);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_BOOL_create(*((unsigned char *)this + 9));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataFlowControl", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataFlowControl::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_BOOL_create(*(unsigned char *)(a1 + 9));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataFlowControl", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(3);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E7F8;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x223C14EA0](*a1) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(*a1, "kDataFlowControl"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataFlowControl");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(unsigned char *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_21DBDB2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataFlowControl>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E7F8;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(unsigned char *)(a2 + 9) = result != 0;
  return result;
}

void abm::data::DataPowerSave::toDict(abm::data::DataPowerSave *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v5) == MEMORY[0x263EF8708])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(4);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_BOOL_create(*((unsigned char *)this + 9));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataPowerSave", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataPowerSave::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_BOOL_create(*(unsigned char *)(a1 + 9));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataPowerSave", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
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
  if (MEMORY[0x223C14EA0](v3) == MEMORY[0x263EF8708])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(4);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E840;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x223C14EA0](*a1) == MEMORY[0x263EF8708] && xpc_dictionary_get_value(*a1, "kDataPowerSave"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataPowerSave");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(unsigned char *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_21DBDB6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataPowerSave>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_26CE7E840;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(unsigned char *)(a2 + 9) = result != 0;
  return result;
}

void __clang_call_terminate(void *a1)
{
}

BOOL trace::isModeActive(int a1)
{
  return !a1 || a1 == 6;
}

const char *trace::toString(unsigned int a1)
{
  if (a1 > 7) {
    return "Unknown";
  }
  else {
    return off_264476AC0[a1];
  }
}

{
  if (a1 > 3) {
    return "unknown";
  }
  else {
    return off_264476B00[a1];
  }
}

{
  if (a1 > 2) {
    return "Unknown";
  }
  else {
    return off_264476B20[a1];
  }
}

{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_264476B38[a1];
  }
}

const char *trace::dal::toString(unsigned int a1)
{
  if (a1 > 6) {
    return "TraceLevelUnknown";
  }
  else {
    return off_264476B58[a1];
  }
}

{
  if (a1 > 2) {
    return "TraceModeUnknown";
  }
  else {
    return off_264476B90[a1];
  }
}

uint64_t coex::CommandDriver::CommandDriver(uint64_t a1, void *a2, void *a3)
{
  *(void *)a1 = &unk_26CE7E888;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v44, "com.apple.telephony.abm", "coex.drv");
  xpc_object_t v6 = dispatch_queue_create("coex.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    xpc_object_t v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE7E980;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v45);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v43);
  *(void *)a1 = &unk_26CE7EAF0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v44);
  *(void *)a1 = &unk_26CE7E888;
  *(void *)(a1 + 104) = *a3;
  uint64_t v9 = a3[1];
  *(void *)(a1 + 112) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 120) = &unk_26CE7E9C0;
  xpc_object_t v10 = (uint64_t *)operator new(0x28uLL);
  xpc_object_t v11 = operator new(0x20uLL);
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
  *(_OWORD *)&v45.__r_.__value_.__r.__words[1] = (unint64_t)&v45;
  v47 = 0;
  uint64_t v48 = 0;
  v46 = &v47;
  v12 = operator new(0x40uLL);
  void *v12 = v12;
  v12[1] = v12;
  v12[5] = 0;
  v12[4] = 0;
  v12[2] = 0;
  v12[3] = v12 + 4;
  *(void *)xpc_object_t v11 = v12;
  *((void *)v11 + 1) = 0;
  int v13 = operator new(0x18uLL);
  v13[1] = 0x100000001;
  *int v13 = &unk_26CE7EB70;
  v13[2] = v12;
  *((void *)v11 + 1) = v13;
  v14 = operator new(1uLL);
  *((void *)v11 + 2) = v14;
  *((void *)v11 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v11 + 16, (uint64_t)v14, (atomic_uint **)v11 + 3);
  uint64_t *v10 = (uint64_t)v11;
  v10[1] = 0;
  v15 = operator new(0x18uLL);
  v15[1] = 0x100000001;
  void *v15 = &unk_26CE7EC40;
  v15[2] = v11;
  v10[1] = (uint64_t)v15;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v47);
  if (v45.__r_.__value_.__r.__words[2])
  {
    size = (std::string *)v45.__r_.__value_.__l.__size_;
    std::string::size_type v16 = v45.__r_.__value_.__r.__words[0];
    uint64_t v18 = *(void *)v45.__r_.__value_.__l.__size_;
    *(void *)(v18 + 8) = *(void *)(v45.__r_.__value_.__r.__words[0] + 8);
    **(void **)(v16 + 8) = v18;
    v45.__r_.__value_.__r.__words[2] = 0;
    if (size != &v45)
    {
      do
      {
        v19 = (std::string *)size->__r_.__value_.__l.__size_;
        data = (atomic_uint *)size[1].__r_.__value_.__l.__data_;
        if (data)
        {
          if (atomic_fetch_add(data + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)data + 16))(data);
            if (atomic_fetch_add(data + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)data + 24))(data);
            }
          }
        }
        operator delete(size);
        size = v19;
      }
      while (v19 != &v45);
    }
  }
  v10[2] = *(void *)*v10;
  v21 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v21, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v10 + 3, (uint64_t)v21);
  *(void *)(a1 + 128) = v10;
  *(void *)(a1 + 136) = 0;
  v22 = operator new(0x18uLL);
  v22[1] = 0x100000001;
  void *v22 = &unk_26CE7ED00;
  v22[2] = v10;
  *(void *)(a1 + 136) = v22;
  *(void *)(a1 + 144) = &unk_26CE7EA80;
  v23 = (uint64_t *)operator new(0x28uLL);
  v24 = operator new(0x20uLL);
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
  *(_OWORD *)&v45.__r_.__value_.__r.__words[1] = (unint64_t)&v45;
  v47 = 0;
  uint64_t v48 = 0;
  v46 = &v47;
  v25 = operator new(0x40uLL);
  void *v25 = v25;
  v25[1] = v25;
  v25[5] = 0;
  v25[4] = 0;
  v25[2] = 0;
  v25[3] = v25 + 4;
  *(void *)v24 = v25;
  *((void *)v24 + 1) = 0;
  v26 = operator new(0x18uLL);
  v26[1] = 0x100000001;
  void *v26 = &unk_26CE7ED60;
  v26[2] = v25;
  *((void *)v24 + 1) = v26;
  v27 = operator new(1uLL);
  *((void *)v24 + 2) = v27;
  *((void *)v24 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v24 + 16, (uint64_t)v27, (atomic_uint **)v24 + 3);
  uint64_t *v23 = (uint64_t)v24;
  v23[1] = 0;
  v28 = operator new(0x18uLL);
  v28[1] = 0x100000001;
  void *v28 = &unk_26CE7EDC0;
  v28[2] = v24;
  v23[1] = (uint64_t)v28;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v47);
  if (v45.__r_.__value_.__r.__words[2])
  {
    v30 = (std::string *)v45.__r_.__value_.__l.__size_;
    std::string::size_type v29 = v45.__r_.__value_.__r.__words[0];
    uint64_t v31 = *(void *)v45.__r_.__value_.__l.__size_;
    *(void *)(v31 + 8) = *(void *)(v45.__r_.__value_.__r.__words[0] + 8);
    **(void **)(v29 + 8) = v31;
    v45.__r_.__value_.__r.__words[2] = 0;
    if (v30 != &v45)
    {
      do
      {
        v32 = (std::string *)v30->__r_.__value_.__l.__size_;
        v33 = (atomic_uint *)v30[1].__r_.__value_.__l.__data_;
        if (v33)
        {
          if (atomic_fetch_add(v33 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v33 + 16))(v33);
            if (atomic_fetch_add(v33 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v33 + 24))(v33);
            }
          }
        }
        operator delete(v30);
        v30 = v32;
      }
      while (v32 != &v45);
    }
  }
  v23[2] = *(void *)*v23;
  v34 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v34, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v23 + 3, (uint64_t)v34);
  *(void *)(a1 + 152) = v23;
  *(void *)(a1 + 160) = 0;
  v35 = operator new(0x18uLL);
  v35[1] = 0x100000001;
  void *v35 = &unk_26CE7EE20;
  v35[2] = v23;
  *(void *)(a1 + 160) = v35;
  *((unsigned char *)&v43.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v43, "coex.drv");
  v36 = std::string::append(&v43, ".", 1uLL);
  long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  v38 = getprogname();
  size_t v39 = strlen(v38);
  v40 = std::string::append(&v45, v38, v39);
  long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  *(void *)(a1 + 184) = *((void *)&v40->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 168) = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v45.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_28:
    operator delete(v43.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_28;
  }
  return a1;
}

void sub_21DBDBEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::~signal(v26);
  boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(v25);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  ctu::SharedLoggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

void *boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE7EA80;
  xpc_object_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE7E9C0;
  xpc_object_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  xpc_object_t v2 = *(std::__shared_weak_count **)(result + 8);
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

void *ctu::SharedLoggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7E980;
  MEMORY[0x223C14900](a1 + 1);
  xpc_object_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE7E980;
  MEMORY[0x223C14900](a1 + 1);
  xpc_object_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t coex::CommandDriver::getName(coex::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 168;
  if (*((char *)this + 191) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  xpc_object_t v3 = (const char *)(a1 + 168);
  if (*(char *)(a1 + 191) < 0) {
    xpc_object_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264476980, MEMORY[0x263F8C060]);
}

void sub_21DBDCF04(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  size_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *ctu::SharedSynchronizable<coex::CommandDriver>::~SharedSynchronizable(void *a1)
{
  xpc_object_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void *ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7E980;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7E980;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE7E9C0;
  xpc_object_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

void boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE7EA80;
  uint64_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

void ctu::SharedLoggable<coex::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7E980;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  xpc_object_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    xpc_object_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        xpc_object_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t *boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  a1[1] = 0;
  boost::detail::shared_count::shared_count<boost::signals2::mutex>(&v5, a2);
  xpc_object_t v3 = (atomic_uint *)a1[1];
  a1[1] = (uint64_t)v5;
  size_t v5 = v3;
  if (v3)
  {
    if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
  }
  return a1;
}

void sub_21DBDD4BC(_Unwind_Exception *exception_object)
{
  xpc_object_t v3 = *(atomic_uint **)(v1 + 8);
  if (v3 && atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
  {
    (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
    if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
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
    xpc_object_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
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
          xpc_object_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        uint64_t *v9 = v2;
        *(void *)(v2 + 16) = v9;
        xpc_object_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        uint64_t *v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *size_t v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    size_t v5 = (unsigned char *)(v4 + 24);
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
      xpc_object_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    xpc_object_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  int v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  *int v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      xpc_object_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          int v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          xpc_object_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_base::destroy(uint64_t this)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

atomic_uint *boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>(uint64_t a1, uint64_t a2, atomic_uint **a3)
{
  size_t result = (atomic_uint *)operator new(0x18uLL);
  *((void *)result + 1) = 0x100000001;
  *(void *)size_t result = &unk_26CE7EBE0;
  *((void *)result + 2) = a2;
  int v6 = *a3;
  *a3 = result;
  if (v6 && atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
  {
    size_t result = (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
    if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
      return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
    }
  }
  return result;
}

void sub_21DBDDAF4(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_21DBDDB0C(_Unwind_Exception *a1)
{
}

void boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    xpc_object_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void *boost::detail::shared_count::shared_count<boost::signals2::mutex>(void *a1, uint64_t a2)
{
  *a1 = 0;
  uint64_t v4 = operator new(0x18uLL);
  v4[1] = 0x100000001;
  *uint64_t v4 = &unk_26CE7ECA0;
  v4[2] = a2;
  *a1 = v4;
  return a1;
}

void sub_21DBDDD1C(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1)
  {
    pthread_mutex_destroy(v1);
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_21DBDDD40(_Unwind_Exception *a1)
{
}

void boost::detail::sp_counted_impl_p<boost::signals2::mutex>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 16));
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    xpc_object_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    xpc_object_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        int v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        xpc_object_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      xpc_object_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          int v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          xpc_object_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    xpc_object_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    xpc_object_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>,coex::SubId)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

const char *awd::asString(char a1)
{
  if ((a1 + 1) > 6u) {
    return "AppID::kWirelessTelemetry";
  }
  else {
    return off_2644771B8[(char)(a1 + 1)];
  }
}

const char *awd::asString(int a1)
{
  if ((a1 - 1) > 2) {
    return "ClientState::kStopped";
  }
  else {
    return off_2644771A0[(char)(a1 - 1)];
  }
}

{
  const char *v1;

  uint64_t v1 = "PayloadType::kDeviceConfig";
  if (a1 == 1) {
    uint64_t v1 = "PayloadType::kComponentConfig";
  }
  if (a1 == 2) {
    return "PayloadType::kProfileConfig";
  }
  else {
    return v1;
  }
}

uint64_t awd::asString@<X0>(unsigned char *a1@<X8>)
{
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[7] = v2;
  v30[8] = v2;
  v30[5] = v2;
  v30[6] = v2;
  v30[3] = v2;
  v30[4] = v2;
  v30[1] = v2;
  v30[2] = v2;
  long long v29 = v2;
  v30[0] = v2;
  *(_OWORD *)__p = v2;
  long long v28 = v2;
  long long v25 = v2;
  *(_OWORD *)__src = v2;
  long long v23 = v2;
  long long v24 = v2;
  long long v22 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v22);
  xpc_object_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Profile: 0x", 11);
  *(_DWORD *)((char *)v3 + *(void *)(*v3 - 24) + 8) = *(_DWORD *)((unsigned char *)v3 + *(void *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v4 = (void *)std::ostream::operator<<();
  size_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Metric: 0x", 12);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v5 + *(void *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  int v6 = (void *)std::ostream::operator<<();
  uint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Component: 0x", 15);
  *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  int v8 = (void *)std::ostream::operator<<();
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", Submission: 0x", 16);
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 8) = *(_DWORD *)((unsigned char *)v9 + *(void *)(*v9 - 24) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v10 = (void *)std::ostream::operator<<();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", PII: ", 7);
  *(_DWORD *)((char *)v11 + *(void *)(*v11 - 24) + 8) |= 1u;
  uint64_t v12 = (void *)std::ostream::operator<<();
  int v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)", Location: ", 12);
  *(_DWORD *)((char *)v13 + *(void *)(*v13 - 24) + 8) |= 1u;
  std::ostream::operator<<();
  if ((BYTE8(v29) & 0x10) != 0)
  {
    v15 = (unsigned char *)v29;
    if ((void *)v29 < __src[1])
    {
      *(void **)&long long v29 = __src[1];
      v15 = __src[1];
    }
    std::string::size_type v16 = __src[0];
    size_t v14 = v15 - (char *)__src[0];
    if ((unint64_t)(v15 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_18;
    }
  }
  else
  {
    if ((BYTE8(v29) & 8) == 0)
    {
      size_t v14 = 0;
      a1[23] = 0;
      goto LABEL_14;
    }
    std::string::size_type v16 = (const void *)*((void *)&v24 + 1);
    size_t v14 = *((void *)&v25 + 1) - *((void *)&v24 + 1);
    if (*((void *)&v25 + 1) - *((void *)&v24 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_18:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    uint64_t v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v17 = v14 | 7;
    }
    uint64_t v18 = v17 + 1;
    v19 = operator new(v17 + 1);
    *((void *)a1 + 1) = v14;
    *((void *)a1 + 2) = v18 | 0x8000000000000000;
    *(void *)a1 = v19;
    a1 = v19;
    goto LABEL_13;
  }
  a1[23] = v14;
  if (v14) {
LABEL_13:
  }
    memmove(a1, v16, v14);
LABEL_14:
  a1[v14] = 0;
  *(void *)&long long v22 = *MEMORY[0x263F8C2B8];
  uint64_t v20 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v22 + *(void *)(v22 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v23 = v20;
  *((void *)&v23 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C14BF0](v30);
}

{
  long long v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  size_t v9;
  unsigned char *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned char *v14;
  uint64_t v15;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  void *__src[2];
  void *__p[2];
  long long v23;
  long long v24;
  _OWORD v25[9];
  unint64_t v26;

  v26 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v2;
  v25[8] = v2;
  v25[5] = v2;
  v25[6] = v2;
  v25[3] = v2;
  v25[4] = v2;
  v25[1] = v2;
  v25[2] = v2;
  long long v24 = v2;
  v25[0] = v2;
  *(_OWORD *)__p = v2;
  long long v23 = v2;
  uint64_t v20 = v2;
  *(_OWORD *)__src = v2;
  uint64_t v18 = v2;
  v19 = v2;
  uint64_t v17 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v17);
  xpc_object_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"Trigger: 0x", 11);
  *(_DWORD *)((char *)v3 + *(void *)(*v3 - 24) + 8) = *(_DWORD *)((unsigned char *)v3 + *(void *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v4 = (void *)std::ostream::operator<<();
  size_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Reference: 0x", 15);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v5 + *(void *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  int v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Type: ", 8);
  uint64_t v7 = (void *)std::ostream::operator<<();
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", Time: ", 8);
  *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24) + 8) = *(_DWORD *)((unsigned char *)v8 + *(void *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    uint64_t v10 = (unsigned char *)v24;
    if ((void *)v24 < __src[1])
    {
      *(void **)&long long v24 = __src[1];
      uint64_t v10 = __src[1];
    }
    uint64_t v11 = __src[0];
    uint64_t v9 = v10 - (char *)__src[0];
    if ((unint64_t)(v10 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_18;
    }
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      uint64_t v9 = 0;
      a1[23] = 0;
      goto LABEL_14;
    }
    uint64_t v11 = (const void *)*((void *)&v19 + 1);
    uint64_t v9 = *((void *)&v20 + 1) - *((void *)&v19 + 1);
    if (*((void *)&v20 + 1) - *((void *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_18:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 >= 0x17)
  {
    uint64_t v12 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v12 = v9 | 7;
    }
    int v13 = v12 + 1;
    size_t v14 = operator new(v12 + 1);
    *((void *)a1 + 1) = v9;
    *((void *)a1 + 2) = v13 | 0x8000000000000000;
    *(void *)a1 = v14;
    a1 = v14;
    goto LABEL_13;
  }
  a1[23] = v9;
  if (v9) {
LABEL_13:
  }
    memmove(a1, v11, v9);
LABEL_14:
  a1[v9] = 0;
  *(void *)&uint64_t v17 = *MEMORY[0x263F8C2B8];
  v15 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v17 + *(void *)(v17 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&uint64_t v18 = v15;
  *((void *)&v18 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v23) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C14BF0](v25);
}

void sub_21DBDEA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  size_t v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  int v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_21DBDECDC(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x223C14BF0](v1);
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
  MEMORY[0x223C14BF0](a1 + 128);
  return a1;
}

void sub_21DBDF184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t awd::asString@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[7] = v4;
  v24[8] = v4;
  v24[5] = v4;
  v24[6] = v4;
  v24[3] = v4;
  v24[4] = v4;
  v24[1] = v4;
  v24[2] = v4;
  long long v23 = v4;
  v24[0] = v4;
  *(_OWORD *)__p = v4;
  long long v22 = v4;
  long long v19 = v4;
  *(_OWORD *)__src = v4;
  long long v17 = v4;
  long long v18 = v4;
  long long v16 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v16);
  if (*(void *)a1)
  {
    size_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Application: ", 13);
    if ((*(unsigned char *)(*(void *)a1 + 8) + 1) > 6u) {
      uint64_t v6 = "AppID::kWirelessTelemetry";
    }
    else {
      uint64_t v6 = off_2644771B8[(char)(*(unsigned char *)(*(void *)a1 + 8) + 1)];
    }
    size_t v7 = strlen(v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v6, v7);
  }
  if ((BYTE8(v23) & 0x10) != 0)
  {
    uint64_t v9 = (unsigned char *)v23;
    if ((void *)v23 < __src[1])
    {
      *(void **)&long long v23 = __src[1];
      uint64_t v9 = __src[1];
    }
    uint64_t v10 = __src[0];
    size_t v8 = v9 - (char *)__src[0];
    if ((unint64_t)(v9 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_23;
    }
  }
  else
  {
    if ((BYTE8(v23) & 8) == 0)
    {
      size_t v8 = 0;
      a2[23] = 0;
      goto LABEL_19;
    }
    uint64_t v10 = (const void *)*((void *)&v18 + 1);
    size_t v8 = *((void *)&v19 + 1) - *((void *)&v18 + 1);
    if (*((void *)&v19 + 1) - *((void *)&v18 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_23:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17) {
      uint64_t v11 = v8 | 7;
    }
    uint64_t v12 = v11 + 1;
    int v13 = operator new(v11 + 1);
    *((void *)a2 + 1) = v8;
    *((void *)a2 + 2) = v12 | 0x8000000000000000;
    *(void *)a2 = v13;
    a2 = v13;
    goto LABEL_18;
  }
  a2[23] = v8;
  if (v8) {
LABEL_18:
  }
    memmove(a2, v10, v8);
LABEL_19:
  a2[v8] = 0;
  *(void *)&long long v16 = *MEMORY[0x263F8C2B8];
  uint64_t v14 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v16 + *(void *)(v16 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v17 = v14;
  *((void *)&v17 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C14BF0](v24);
}

void sub_21DBDF458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t awd::operator<<(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = MEMORY[0x223C149E0](a1, "Application: ");
    if ((*(unsigned char *)(*(void *)a2 + 8) + 1) > 6u) {
      size_t v5 = "AppID::kWirelessTelemetry";
    }
    else {
      size_t v5 = off_2644771B8[(char)(*(unsigned char *)(*(void *)a2 + 8) + 1)];
    }
    MEMORY[0x223C149E0](v4, v5);
  }
  return a1;
}

uint64_t awd::operator<<(uint64_t a1, unsigned char *a2)
{
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30[7] = v4;
  v30[8] = v4;
  v30[5] = v4;
  v30[6] = v4;
  v30[3] = v4;
  v30[4] = v4;
  v30[1] = v4;
  v30[2] = v4;
  long long v29 = v4;
  v30[0] = v4;
  *(_OWORD *)__p = v4;
  long long v28 = v4;
  long long v25 = v4;
  long long v26 = v4;
  long long v23 = v4;
  long long v24 = v4;
  long long v22 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v22);
  size_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Application: ", 13);
  if ((*a2 + 1) > 6u) {
    uint64_t v6 = "AppID::kWirelessTelemetry";
  }
  else {
    uint64_t v6 = off_2644771B8[(char)(*a2 + 1)];
  }
  size_t v7 = strlen(v6);
  size_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v6, v7);
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", PII allowed: ", 15);
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 8) |= 1u;
  uint64_t v10 = (void *)std::ostream::operator<<();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", Location allowed: ", 20);
  *(_DWORD *)((char *)v11 + *(void *)(*v11 - 24) + 8) |= 1u;
  std::ostream::operator<<();
  if ((BYTE8(v29) & 0x10) != 0)
  {
    uint64_t v14 = v29;
    if ((unint64_t)v29 < *((void *)&v26 + 1))
    {
      *(void *)&long long v29 = *((void *)&v26 + 1);
      uint64_t v14 = *((void *)&v26 + 1);
    }
    v15 = (const void *)v26;
    size_t v12 = v14 - v26;
    if ((unint64_t)(v14 - v26) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_23;
    }
  }
  else
  {
    if ((BYTE8(v29) & 8) == 0)
    {
      size_t v12 = 0;
      HIBYTE(v21) = 0;
      int v13 = __dst;
      goto LABEL_17;
    }
    v15 = (const void *)*((void *)&v24 + 1);
    size_t v12 = *((void *)&v25 + 1) - *((void *)&v24 + 1);
    if (*((void *)&v25 + 1) - *((void *)&v24 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_23:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v12 >= 0x17)
  {
    uint64_t v16 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v16 = v12 | 7;
    }
    uint64_t v17 = v16 + 1;
    int v13 = (void **)operator new(v16 + 1);
    __dst[1] = (void *)v12;
    unint64_t v21 = v17 | 0x8000000000000000;
    __dst[0] = v13;
    goto LABEL_16;
  }
  HIBYTE(v21) = v12;
  int v13 = __dst;
  if (v12) {
LABEL_16:
  }
    memmove(v13, v15, v12);
LABEL_17:
  *((unsigned char *)v13 + v12) = 0;
  MEMORY[0x223C149F0](a1, __dst);
  if (SHIBYTE(v21) < 0) {
    operator delete(__dst[0]);
  }
  *(void *)&long long v22 = *MEMORY[0x263F8C2B8];
  uint64_t v18 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v22 + *(void *)(v22 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v23 = v18;
  *((void *)&v23 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v28) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C14BF0](v30);
  return a1;
}

void sub_21DBDF840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t awd::operator<<(uint64_t a1)
{
  unint64_t v33 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[7] = v2;
  v32[8] = v2;
  v32[5] = v2;
  v32[6] = v2;
  v32[3] = v2;
  v32[4] = v2;
  v32[1] = v2;
  v32[2] = v2;
  long long v31 = v2;
  v32[0] = v2;
  *(_OWORD *)__p = v2;
  long long v30 = v2;
  long long v27 = v2;
  long long v28 = v2;
  long long v25 = v2;
  long long v26 = v2;
  long long v24 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v24);
  uint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v25, (uint64_t)"Profile: 0x", 11);
  *(_DWORD *)((char *)v3 + *(void *)(*v3 - 24) + 8) = *(_DWORD *)((unsigned char *)v3 + *(void *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  long long v4 = (void *)std::ostream::operator<<();
  size_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Metric: 0x", 12);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v5 + *(void *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v6 = (void *)std::ostream::operator<<();
  size_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Component: 0x", 15);
  *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 8;
  size_t v8 = (void *)std::ostream::operator<<();
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", Submission: 0x", 16);
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24) + 8) = *(_DWORD *)((unsigned char *)v9 + *(void *)(*v9 - 24) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v10 = (void *)std::ostream::operator<<();
  uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)", PII: ", 7);
  *(_DWORD *)((char *)v11 + *(void *)(*v11 - 24) + 8) |= 1u;
  size_t v12 = (void *)std::ostream::operator<<();
  int v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)", Location: ", 12);
  *(_DWORD *)((char *)v13 + *(void *)(*v13 - 24) + 8) |= 1u;
  std::ostream::operator<<();
  if ((BYTE8(v31) & 0x10) != 0)
  {
    uint64_t v16 = v31;
    if ((unint64_t)v31 < *((void *)&v28 + 1))
    {
      *(void *)&long long v31 = *((void *)&v28 + 1);
      uint64_t v16 = *((void *)&v28 + 1);
    }
    uint64_t v17 = (const void *)v28;
    size_t v14 = v16 - v28;
    if ((unint64_t)(v16 - v28) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v31) & 8) == 0)
    {
      size_t v14 = 0;
      HIBYTE(v23) = 0;
      v15 = __dst;
      goto LABEL_14;
    }
    uint64_t v17 = (const void *)*((void *)&v26 + 1);
    size_t v14 = *((void *)&v27 + 1) - *((void *)&v26 + 1);
    if (*((void *)&v27 + 1) - *((void *)&v26 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    uint64_t v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17) {
      uint64_t v18 = v14 | 7;
    }
    uint64_t v19 = v18 + 1;
    v15 = (void **)operator new(v18 + 1);
    __dst[1] = (void *)v14;
    unint64_t v23 = v19 | 0x8000000000000000;
    __dst[0] = v15;
    goto LABEL_13;
  }
  HIBYTE(v23) = v14;
  v15 = __dst;
  if (v14) {
LABEL_13:
  }
    memmove(v15, v17, v14);
LABEL_14:
  *((unsigned char *)v15 + v14) = 0;
  MEMORY[0x223C149F0](a1, __dst);
  if (SHIBYTE(v23) < 0) {
    operator delete(__dst[0]);
  }
  *(void *)&long long v24 = *MEMORY[0x263F8C2B8];
  uint64_t v20 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v24 + *(void *)(v24 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v25 = v20;
  *((void *)&v25 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v30) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C14BF0](v32);
  return a1;
}

{
  long long v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  size_t v9;
  void **v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *__dst[2];
  unint64_t v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  void *__p[2];
  long long v25;
  long long v26;
  _OWORD v27[9];
  unint64_t v28;

  long long v28 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[7] = v2;
  v27[8] = v2;
  v27[5] = v2;
  v27[6] = v2;
  v27[3] = v2;
  v27[4] = v2;
  v27[1] = v2;
  v27[2] = v2;
  long long v26 = v2;
  v27[0] = v2;
  *(_OWORD *)__p = v2;
  long long v25 = v2;
  long long v22 = v2;
  unint64_t v23 = v2;
  uint64_t v20 = v2;
  unint64_t v21 = v2;
  uint64_t v19 = v2;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v19);
  uint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v20, (uint64_t)"Trigger: 0x", 11);
  *(_DWORD *)((char *)v3 + *(void *)(*v3 - 24) + 8) = *(_DWORD *)((unsigned char *)v3 + *(void *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 8;
  long long v4 = (void *)std::ostream::operator<<();
  size_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", Reference: 0x", 15);
  *(_DWORD *)((char *)v5 + *(void *)(*v5 - 24) + 8) = *(_DWORD *)((unsigned char *)v5 + *(void *)(*v5 - 24) + 8) & 0xFFFFFFB5 | 8;
  uint64_t v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)", Type: ", 8);
  size_t v7 = (void *)std::ostream::operator<<();
  size_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)", Time: ", 8);
  *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24) + 8) = *(_DWORD *)((unsigned char *)v8 + *(void *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
  std::ostream::operator<<();
  if ((BYTE8(v26) & 0x10) != 0)
  {
    uint64_t v11 = v26;
    if ((unint64_t)v26 < *((void *)&v23 + 1))
    {
      *(void *)&long long v26 = *((void *)&v23 + 1);
      uint64_t v11 = *((void *)&v23 + 1);
    }
    size_t v12 = (const void *)v23;
    uint64_t v9 = v11 - v23;
    if ((unint64_t)(v11 - v23) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_20;
    }
  }
  else
  {
    if ((BYTE8(v26) & 8) == 0)
    {
      uint64_t v9 = 0;
      HIBYTE(v18) = 0;
      uint64_t v10 = __dst;
      goto LABEL_14;
    }
    size_t v12 = (const void *)*((void *)&v21 + 1);
    uint64_t v9 = *((void *)&v22 + 1) - *((void *)&v21 + 1);
    if (*((void *)&v22 + 1) - *((void *)&v21 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_20:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 >= 0x17)
  {
    int v13 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      int v13 = v9 | 7;
    }
    size_t v14 = v13 + 1;
    uint64_t v10 = (void **)operator new(v13 + 1);
    __dst[1] = (void *)v9;
    uint64_t v18 = v14 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_13;
  }
  HIBYTE(v18) = v9;
  uint64_t v10 = __dst;
  if (v9) {
LABEL_13:
  }
    memmove(v10, v12, v9);
LABEL_14:
  *((unsigned char *)v10 + v9) = 0;
  MEMORY[0x223C149F0](a1, __dst);
  if (SHIBYTE(v18) < 0) {
    operator delete(__dst[0]);
  }
  *(void *)&uint64_t v19 = *MEMORY[0x263F8C2B8];
  v15 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v19 + *(void *)(v19 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&uint64_t v20 = v15;
  *((void *)&v20 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v25) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x223C14BF0](v27);
  return a1;
}

void sub_21DBDFC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void sub_21DBE0054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0)
  {
    operator delete(__p);
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void awd::AppContext::setHandler(dispatch_queue_t *a1, void **a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_11ClientStateEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_0;
  v4[4] = a1;
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

{
  void *v3;
  void v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_13AppPropertiesEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_29;
  v4[4] = a1;
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

{
  void *v3;
  void v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvjhEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_30;
  v4[4] = a1;
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

{
  void *v3;
  void v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_11TriggerInfoEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_31;
  v4[4] = a1;
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

{
  void *v3;
  void v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEjNSt3__16vectorIhNS4_9allocatorIhEEEEEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_32;
  v4[4] = a1;
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

{
  void *v3;
  void v4[5];
  void *aBlock;

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1174405120;
  v4[2] = ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEtEEE_block_invoke;
  v4[3] = &__block_descriptor_tmp_33;
  v4[4] = a1;
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  aBlock = v3;
  dispatch_async(*a1, v4);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_11ClientStateEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  uint64_t v3 = *(const void **)(v2 + 16);
  *(void *)(v2 + 16) = v1;
  if (v3) {
    _Block_release(v3);
  }
}

void *__copy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd11ClientStateEEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 40);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd11ClientStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_13AppPropertiesEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  uint64_t v3 = *(const void **)(v2 + 32);
  *(void *)(v2 + 32) = v1;
  if (v3) {
    _Block_release(v3);
  }
}

void *__copy_helper_block_e8_40c80_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_13AppPropertiesEEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 40);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c80_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_13AppPropertiesEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvjhEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  uint64_t v3 = *(const void **)(v2 + 24);
  *(void *)(v2 + 24) = v1;
  if (v3) {
    _Block_release(v3);
  }
}

void *__copy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvjhEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 40);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSN8dispatch5blockIU13block_pointerFvjhEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoENS_11TriggerInfoEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  uint64_t v3 = *(const void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
  if (v3) {
    _Block_release(v3);
  }
}

void *__copy_helper_block_e8_40c78_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_11TriggerInfoEEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 40);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c78_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoENS1_11TriggerInfoEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEjNSt3__16vectorIhNS4_9allocatorIhEEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  uint64_t v3 = *(const void **)(v2 + 48);
  *(void *)(v2 + 48) = v1;
  if (v3) {
    _Block_release(v3);
  }
}

void *__copy_helper_block_e8_40c97_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEjNSt3__16vectorIhNS3_9allocatorIhEEEEEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 40);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c97_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEjNSt3__16vectorIhNS3_9allocatorIhEEEEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3awd10AppContext10setHandlerEN8dispatch5blockIU13block_pointerFvNS_10MetricInfoEtEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  if (v1) {
    uint64_t v1 = _Block_copy(v1);
  }
  uint64_t v3 = *(const void **)(v2 + 56);
  *(void *)(v2 + 56) = v1;
  if (v3) {
    _Block_release(v3);
  }
}

void *__copy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEtEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 40);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c61_ZTSN8dispatch5blockIU13block_pointerFvN3awd10MetricInfoEtEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void awd::AppContext::setProperties(dispatch_queue_t *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = ___ZN3awd10AppContext13setPropertiesERKNS_13AppPropertiesE_block_invoke;
  v2[3] = &__block_descriptor_tmp_34;
  v2[4] = a1;
  v2[5] = a2;
  dispatch_async(*a1, v2);
}

uint64_t ___ZN3awd10AppContext13setPropertiesERKNS_13AppPropertiesE_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(__int16 **)(result + 40);
  __int16 v3 = *v2;
  *(unsigned char *)(v1 + 10) = *((unsigned char *)v2 + 2);
  *(_WORD *)(v1 + 8) = v3;
  return result;
}

uint64_t awd::AppContext::getProperties(awd::AppContext *this)
{
  return *((unsigned __int16 *)this + 4) | (*((unsigned __int8 *)this + 10) << 16);
}

void awd::AppContext::operator()(dispatch_queue_t *a1, char a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 0x40000000;
  v2[2] = ___ZNK3awd10AppContextclENS_11ClientStateE_block_invoke;
  v2[3] = &__block_descriptor_tmp_35;
  v2[4] = a1;
  char v3 = a2;
  dispatch_async(*a1, v2);
}

uint64_t ___ZNK3awd10AppContextclENS_11ClientStateE_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

void awd::AppContext::operator()(dispatch_queue_t *a1, int a2, char a3)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK3awd10AppContextclEjh_block_invoke;
  v3[3] = &__block_descriptor_tmp_36;
  v3[4] = a1;
  int v4 = a2;
  char v5 = a3;
  dispatch_async(*a1, v3);
}

uint64_t ___ZNK3awd10AppContextclEjh_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
  }
  return result;
}

void awd::AppContext::operator()(dispatch_queue_t *a1, _OWORD *a2, __int16 a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZNK3awd10AppContextclENS_10MetricInfoEt_block_invoke;
  block[3] = &__block_descriptor_tmp_39;
  block[4] = a1;
  *(_OWORD *)int v4 = *a2;
  *(_OWORD *)&v4[12] = *(_OWORD *)((char *)a2 + 12);
  __int16 v5 = a3;
  dispatch_async(*a1, block);
}

uint64_t ___ZNK3awd10AppContextclENS_10MetricInfoEt_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 56);
  if (result)
  {
    *(_OWORD *)&v3[12] = *(_OWORD *)(a1 + 52);
    *(_OWORD *)char v3 = *(_OWORD *)(a1 + 40);
    return (*(uint64_t (**)(uint64_t, unsigned char *, void))(result + 16))(result, v3, *(unsigned __int16 *)(a1 + 68));
  }
  return result;
}

void awd::AppContext::operator()(dispatch_queue_t *a1, const void **a2, char a3)
{
  int v4 = *a2;
  if (*a2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 1174405120;
    _OWORD v6[2] = ___ZNK3awd10AppContextclEN8dispatch5blockIU13block_pointerFvbEEEb_block_invoke;
    v6[3] = &__block_descriptor_tmp_40;
    aBlock = _Block_copy(v4);
    char v8 = a3;
    dispatch_async(*a1, v6);
    if (aBlock) {
      _Block_release(aBlock);
    }
  }
}

uint64_t ___ZNK3awd10AppContextclEN8dispatch5blockIU13block_pointerFvbEEEb_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvbEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *awd::AwdCommandDriver::AwdCommandDriver(void *a1, void *a2, void *a3)
{
  *a1 = &unk_26CE7F000;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v11, "com.apple.telephony.abm", "awd.driver");
  uint64_t v6 = dispatch_queue_create("awd.driver", 0);
  a1[9] = 0;
  a1[10] = 0;
  a1[11] = v6;
  if (v6)
  {
    size_t v7 = v6;
    dispatch_retain(v6);
    a1[12] = 0;
    dispatch_release(v7);
  }
  else
  {
    a1[12] = 0;
  }
  *a1 = &unk_26CE7F118;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v13);
  a1[1] = &unk_26CE7EB30;
  a1[7] = *a2;
  uint64_t v8 = a2[1];
  a1[8] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v12);
  *a1 = &unk_26CE7F158;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v11);
  *a1 = &unk_26CE7F000;
  a1[13] = *a3;
  uint64_t v9 = a3[1];
  a1[14] = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  a1[17] = 0;
  a1[16] = 0;
  a1[15] = a1 + 16;
  return a1;
}

void sub_21DBE0D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a11);
  ctu::SharedSynchronizable<coex::CommandDriver>::~SharedSynchronizable(v13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

const char *awd::AwdCommandDriver::getName(awd::AwdCommandDriver *this)
{
  return "awd.driver";
}

void awd::AwdCommandDriver::~AwdCommandDriver(awd::AwdCommandDriver *this)
{
  *(void *)this = &unk_26CE7F000;
  std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(*((void **)this + 16));
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 14);
  if (!v2 || atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    *(void *)this = &unk_26CE7F118;
    MEMORY[0x223C14900]((char *)this + 8);
    char v3 = *((void *)this + 12);
    if (!v3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  *(void *)this = &unk_26CE7F118;
  MEMORY[0x223C14900]((char *)this + 8);
  char v3 = *((void *)this + 12);
  if (v3) {
LABEL_4:
  }
    dispatch_release(v3);
LABEL_5:
  int v4 = *((void *)this + 11);
  if (v4) {
    dispatch_release(v4);
  }
  __int16 v5 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void awd::AwdCommandDriver::checkIn(uint64_t a1, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v2 = (std::__shared_weak_count *)a2[1];
    uint64_t v6 = *a2;
    size_t v7 = v2;
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = a1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_7checkInENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke;
    block[3] = &__block_descriptor_tmp_59;
    block[4] = a1 + 72;
    void block[5] = &v6;
    uint64_t v4 = a1 + 88;
    char v3 = *(NSObject **)(a1 + 88);
    if (*(void *)(v4 + 8))
    {
      dispatch_async_and_wait(v3, block);
      __int16 v5 = v7;
      if (!v7) {
        return;
      }
    }
    else
    {
      dispatch_sync(v3, block);
      __int16 v5 = v7;
      if (!v7) {
        return;
      }
    }
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void awd::AwdCommandDriver::checkOut(uint64_t a1, uint64_t *a2)
{
  if (*a2)
  {
    uint64_t v2 = (std::__shared_weak_count *)a2[1];
    uint64_t v6 = *a2;
    size_t v7 = v2;
    if (v2) {
      atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v8 = a1;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_8checkOutENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke;
    block[3] = &__block_descriptor_tmp_60;
    block[4] = a1 + 72;
    void block[5] = &v6;
    uint64_t v4 = a1 + 88;
    char v3 = *(NSObject **)(a1 + 88);
    if (*(void *)(v4 + 8))
    {
      dispatch_async_and_wait(v3, block);
      __int16 v5 = v7;
      if (!v7) {
        return;
      }
    }
    else
    {
      dispatch_sync(v3, block);
      __int16 v5 = v7;
      if (!v7) {
        return;
      }
    }
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void awd::AwdCommandDriver::broadcastState_sync(void *a1, char a2)
{
  char v3 = (std::__shared_weak_count *)a1[10];
  if (!v3 || (uint64_t v5 = a1[9], (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  size_t v7 = v6;
  uint64_t v8 = operator new(0x10uLL);
  *(unsigned char *)uint64_t v8 = a2;
  v8[1] = a1;
  uint64_t v9 = a1[11];
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  uint64_t v10 = operator new(0x18uLL);
  void *v10 = v8;
  v10[1] = v5;
  v10[2] = v7;
  dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<awd::AwdCommandDriver>::execute_wrapped<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>(awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0,dispatch_queue_s *::default_delete<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
}

uint64_t ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

void ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 10;
  strcpy(a1, "awd.driver");
}

uint64_t ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void *ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7F118;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7F118;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x223C14AC0](v13, a1);
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
  MEMORY[0x223C14AD0](v13);
  return a1;
}

void sub_21DBE13FC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x223C14AD0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21DBE13DCLL);
}

void sub_21DBE1450(_Unwind_Exception *a1)
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
        int v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        int v13 = __b;
      }
      memset(v13, __c, v12);
      *((unsigned char *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0) {
        uint64_t v16 = __b;
      }
      else {
        uint64_t v16 = (void **)__b[0];
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

void sub_21DBE1644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *ctu::SharedLoggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7F118;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  char v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<awd::AwdCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7F118;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  char v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(*a1);
    std::__tree<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::__map_value_compare<awd::AppID,std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>,std::less<awd::AppID>,true>,std::allocator<std::__value_type<awd::AppID,std::shared_ptr<awd::AppContext>>>>::destroy(a1[1]);
    uint64_t v2 = (std::__shared_weak_count *)a1[6];
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      char v3 = a1;
    }
    else
    {
      char v3 = a1;
    }
    operator delete(v3);
  }
}

void ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_7checkInENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = v1[2];
  uint64_t v3 = *v1;
  unsigned int v4 = *(unsigned __int8 *)(*v1 + 8);
  uint64_t v6 = (uint64_t **)(v2 + 128);
  uint64_t v5 = *(unsigned __int8 **)(v2 + 128);
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (char *)v5;
        unsigned int v8 = v5[32];
        if (v4 >= v8) {
          break;
        }
        uint64_t v5 = *(unsigned __int8 **)v7;
        uint64_t v6 = (uint64_t **)v7;
        if (!*(void *)v7) {
          goto LABEL_8;
        }
      }
      if (v8 >= v4) {
        break;
      }
      uint64_t v5 = (unsigned __int8 *)*((void *)v7 + 1);
      if (!v5)
      {
        uint64_t v6 = (uint64_t **)(v7 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v7 = (char *)(v2 + 128);
LABEL_8:
    int v9 = v7;
    uint64_t v7 = (char *)operator new(0x38uLL);
    v7[32] = v4;
    *((void *)v7 + 5) = 0;
    *((void *)v7 + 6) = 0;
    *(void *)uint64_t v7 = 0;
    *((void *)v7 + 1) = 0;
    *((void *)v7 + 2) = v9;
    std::__shared_weak_count *v6 = (uint64_t *)v7;
    uint64_t v10 = **(void **)(v2 + 120);
    uint64_t v11 = (uint64_t *)v7;
    if (v10)
    {
      *(void *)(v2 + 120) = v10;
      uint64_t v11 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v2 + 128), v11);
    ++*(void *)(v2 + 136);
    uint64_t v3 = *v1;
  }
  uint64_t v12 = v1[1];
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  int v13 = (std::__shared_weak_count *)*((void *)v7 + 6);
  *((void *)v7 + 5) = v3;
  *((void *)v7 + 6) = v12;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  uint64_t v14 = (std::__shared_weak_count *)v1[1];
  uint64_t v22 = *v1;
  unint64_t v23 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v2 + 104))(v2, &v22);
  uint64_t v15 = v23;
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  uint64_t v16 = *(NSObject **)(v2 + 40);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = (std::__shared_weak_count *)v1[1];
    v19[0] = *v1;
    v19[1] = v17;
    if (v17) {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    awd::asString((uint64_t)v19, __p);
    if (v21 >= 0) {
      uint64_t v18 = __p;
    }
    else {
      uint64_t v18 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    long long v25 = v18;
    _os_log_debug_impl(&dword_21DBD9000, v16, OS_LOG_TYPE_DEBUG, "#D %s checked in!", buf, 0xCu);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
    if (v17)
    {
      if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
  }
}

void sub_21DBE1AC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (v16)
  {
    if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK3ctu20SharedSynchronizableIN3awd16AwdCommandDriverEE20execute_wrapped_syncIZNS2_8checkOutENSt3__110shared_ptrINS1_10AppContextEEEE3__0EEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOSA__block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v2 = (unsigned __int8 *)v1[2];
  uint64_t v3 = (unsigned __int8 **)*((void *)v2 + 16);
  if (!v3) {
    return;
  }
  unsigned int v4 = *(unsigned __int8 *)(*v1 + 8);
  uint64_t v5 = v2 + 128;
  do
  {
    unsigned int v6 = *((unsigned __int8 *)v3 + 32);
    BOOL v7 = v6 >= v4;
    if (v6 >= v4) {
      unsigned int v8 = v3;
    }
    else {
      unsigned int v8 = v3 + 1;
    }
    if (v7) {
      uint64_t v5 = (unsigned __int8 *)v3;
    }
    uint64_t v3 = (unsigned __int8 **)*v8;
  }
  while (*v8);
  if (v5 == v2 + 128 || v4 < v5[32]) {
    return;
  }
  int v9 = (std::__shared_weak_count *)*((void *)v5 + 6);
  uint64_t v48 = *((void *)v5 + 5);
  v49 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(unsigned __int8 *, uint64_t *))(*(void *)v2 + 112))(v2, &v48);
  uint64_t v10 = v49;
  if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  uint64_t v11 = *((void *)v2 + 5);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v37 = (std::__shared_weak_count *)v1[1];
    v45[0] = *v1;
    v45[1] = v37;
    if (v37) {
      atomic_fetch_add_explicit(&v37->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    awd::asString((uint64_t)v45, __p);
    if (v47 >= 0) {
      v38 = __p;
    }
    else {
      v38 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    v51 = v38;
    _os_log_debug_impl(&dword_21DBD9000, v11, OS_LOG_TYPE_DEBUG, "#D %s  checked out!", buf, 0xCu);
    if (v47 < 0) {
      operator delete(__p[0]);
    }
    if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  uint64_t v12 = (unsigned __int8 *)*((void *)v5 + 1);
  if (v12)
  {
    do
    {
      int v13 = v12;
      uint64_t v12 = *(unsigned __int8 **)v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v14 = v5;
    do
    {
      int v13 = (unsigned __int8 *)*((void *)v14 + 2);
      BOOL v27 = *(void *)v13 == (void)v14;
      uint64_t v14 = v13;
    }
    while (!v27);
  }
  if (*((unsigned __int8 **)v2 + 15) == v5)
  {
    *((void *)v2 + 15) = v13;
    uint64_t v15 = (unsigned __int8 *)*((void *)v2 + 16);
    --*((void *)v2 + 17);
    uint64_t v16 = *(void *)v5;
    uint64_t v17 = v5;
    if (!*(void *)v5) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v15 = (unsigned __int8 *)*((void *)v2 + 16);
    --*((void *)v2 + 17);
    uint64_t v16 = *(void *)v5;
    uint64_t v17 = v5;
    if (!*(void *)v5) {
      goto LABEL_30;
    }
  }
  uint64_t v18 = (unsigned __int8 *)*((void *)v5 + 1);
  if (!v18)
  {
    uint64_t v17 = v5;
    goto LABEL_36;
  }
  do
  {
    uint64_t v17 = v18;
    uint64_t v18 = *(unsigned __int8 **)v18;
  }
  while (v18);
LABEL_30:
  uint64_t v16 = *((void *)v17 + 1);
  if (!v16)
  {
    int v19 = 1;
    uint64_t v20 = (void ***)*((void *)v17 + 2);
    char v21 = *v20;
    if (*v20 == (void **)v17) {
      goto LABEL_32;
    }
LABEL_37:
    v20[1] = (void **)v16;
    int v22 = v17[24];
    if (v17 == v5) {
      goto LABEL_42;
    }
    goto LABEL_38;
  }
LABEL_36:
  int v19 = 0;
  *(void *)(v16 + 16) = *((void *)v17 + 2);
  uint64_t v20 = (void ***)*((void *)v17 + 2);
  char v21 = *v20;
  if (*v20 != (void **)v17) {
    goto LABEL_37;
  }
LABEL_32:
  *uint64_t v20 = (void **)v16;
  if (v17 != v15)
  {
    char v21 = v20[1];
    int v22 = v17[24];
    if (v17 == v5) {
      goto LABEL_42;
    }
LABEL_38:
    uint64_t v23 = *((void *)v5 + 2);
    *((void *)v17 + 2) = v23;
    *(void *)(v23 + 8 * (**((void **)v5 + 2) != (void)v5)) = v17;
    uint64_t v24 = *(void *)v5;
    *(void *)uint64_t v17 = *(void *)v5;
    *(void *)(v24 + 16) = v17;
    uint64_t v25 = *((void *)v5 + 1);
    *((void *)v17 + 1) = v25;
    if (v25) {
      *(void *)(v25 + 16) = v17;
    }
    v17[24] = v5[24];
    if (v15 == v5) {
      uint64_t v15 = v17;
    }
    goto LABEL_42;
  }
  char v21 = 0;
  uint64_t v15 = (unsigned __int8 *)v16;
  int v22 = v17[24];
  if (v17 != v5) {
    goto LABEL_38;
  }
LABEL_42:
  if (!v22 || !v15) {
    goto LABEL_111;
  }
  if (!v19)
  {
    *(unsigned char *)(v16 + 24) = 1;
    goto LABEL_111;
  }
  while (1)
  {
    long long v28 = (void ***)v21[2];
    if (*v28 != v21) {
      break;
    }
    if (*((unsigned char *)v21 + 24))
    {
      long long v30 = *v21;
      if (*v21) {
        goto LABEL_74;
      }
    }
    else
    {
      *((unsigned char *)v21 + 24) = 1;
      *((unsigned char *)v28 + 24) = 0;
      v34 = (void **)v21[1];
      void *v28 = v34;
      if (v34) {
        v34[2] = v28;
      }
      v21[2] = v28[2];
      v28[2][*v28[2] != v28] = v21;
      v21[1] = v28;
      v28[2] = v21;
      if (v15 == (unsigned __int8 *)v28) {
        uint64_t v15 = (unsigned __int8 *)v21;
      }
      char v21 = *v28;
      long long v30 = **v28;
      if (v30)
      {
LABEL_74:
        if (!v30[24]) {
          goto LABEL_106;
        }
      }
    }
    v35 = (uint64_t *)v21[1];
    if (v35 && !*((unsigned char *)v35 + 24))
    {
      if (v30 && !v30[24])
      {
LABEL_106:
        v35 = (uint64_t *)v21;
      }
      else
      {
        *((unsigned char *)v35 + 24) = 1;
        *((unsigned char *)v21 + 24) = 0;
        uint64_t v36 = *v35;
        v21[1] = (void *)*v35;
        if (v36) {
          *(void *)(v36 + 16) = v21;
        }
        v35[2] = (uint64_t)v21[2];
        *((void *)v21[2] + (*(void *)v21[2] != (void)v21)) = v35;
        uint64_t *v35 = (uint64_t)v21;
        v21[2] = v35;
        long long v30 = v21;
      }
      uint64_t v40 = v35[2];
      *((unsigned char *)v35 + 24) = *(unsigned char *)(v40 + 24);
      *(unsigned char *)(v40 + 24) = 1;
      v30[24] = 1;
      long long v41 = *(uint64_t **)v40;
      uint64_t v43 = *(void *)(*(void *)v40 + 8);
      *(void *)uint64_t v40 = v43;
      if (v43) {
        *(void *)(v43 + 16) = v40;
      }
      v41[2] = *(void *)(v40 + 16);
      *(void *)(*(void *)(v40 + 16) + 8 * (**(void **)(v40 + 16) != v40)) = v41;
      v41[1] = v40;
      goto LABEL_110;
    }
    *((unsigned char *)v21 + 24) = 0;
    uint64_t v26 = (unsigned __int8 *)v21[2];
    if (v26[24]) {
      BOOL v27 = v26 == v15;
    }
    else {
      BOOL v27 = 1;
    }
    if (v27) {
      goto LABEL_96;
    }
LABEL_50:
    char v21 = *(void ***)(*((void *)v26 + 2) + 8 * (**((void **)v26 + 2) == (void)v26));
  }
  if (*((unsigned char *)v21 + 24))
  {
    long long v29 = *v21;
    if (!*v21)
    {
LABEL_64:
      unint64_t v33 = (void **)v21[1];
      if (v33 && !*((unsigned char *)v33 + 24)) {
        goto LABEL_102;
      }
      *((unsigned char *)v21 + 24) = 0;
      uint64_t v26 = (unsigned __int8 *)v21[2];
      if (v26 == v15)
      {
        uint64_t v26 = v15;
LABEL_96:
        v26[24] = 1;
        goto LABEL_111;
      }
      if (!v26[24]) {
        goto LABEL_96;
      }
      goto LABEL_50;
    }
  }
  else
  {
    *((unsigned char *)v21 + 24) = 1;
    *((unsigned char *)v28 + 24) = 0;
    long long v31 = (void ****)v28[1];
    v32 = (void **)*v31;
    v28[1] = (void **)*v31;
    if (v32) {
      v32[2] = v28;
    }
    v31[2] = (void ***)v28[2];
    v28[2][*v28[2] != v28] = v31;
    *long long v31 = v28;
    v28[2] = (void **)v31;
    if (v15 == *v21) {
      uint64_t v15 = (unsigned __int8 *)v21;
    }
    char v21 = (void **)*((void *)*v21 + 1);
    long long v29 = *v21;
    if (!*v21) {
      goto LABEL_64;
    }
  }
  if (*((unsigned char *)v29 + 24)) {
    goto LABEL_64;
  }
  unint64_t v33 = (void **)v21[1];
  if (v33 && !*((unsigned char *)v33 + 24))
  {
LABEL_102:
    long long v29 = v21;
  }
  else
  {
    *((unsigned char *)v29 + 24) = 1;
    *((unsigned char *)v21 + 24) = 0;
    size_t v39 = (void *)v29[1];
    pthread_mutex_t *v21 = v39;
    if (v39) {
      v39[2] = v21;
    }
    v29[2] = v21[2];
    *((void *)v21[2] + (*(void *)v21[2] != (void)v21)) = v29;
    v29[1] = v21;
    v21[2] = v29;
    unint64_t v33 = v21;
  }
  uint64_t v40 = v29[2];
  *((unsigned char *)v29 + 24) = *(unsigned char *)(v40 + 24);
  *(unsigned char *)(v40 + 24) = 1;
  *((unsigned char *)v33 + 24) = 1;
  long long v41 = *(uint64_t **)(v40 + 8);
  uint64_t v42 = *v41;
  *(void *)(v40 + 8) = *v41;
  if (v42) {
    *(void *)(v42 + 16) = v40;
  }
  v41[2] = *(void *)(v40 + 16);
  *(void *)(*(void *)(v40 + 16) + 8 * (**(void **)(v40 + 16) != v40)) = v41;
  *long long v41 = v40;
LABEL_110:
  *(void *)(v40 + 16) = v41;
LABEL_111:
  v44 = (std::__shared_weak_count *)*((void *)v5 + 6);
  if (v44)
  {
    if (!atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  operator delete(v5);
}

void sub_21DBE21B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (v16)
  {
    if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void dispatch::async<void ctu::SharedSynchronizable<awd::AwdCommandDriver>::execute_wrapped<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>(awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0,dispatch_queue_s *::default_delete<awd::AwdCommandDriver::broadcastState_sync(awd::ClientState)::$_0>>)::{lambda(void *)#1}::__invoke(char **__p)
{
  uint64_t v2 = *__p;
  uint64_t v3 = *((void *)*__p + 1);
  unsigned int v4 = *(void **)(v3 + 120);
  uint64_t v5 = (void *)(v3 + 128);
  if (v4 == (void *)(v3 + 128))
  {
LABEL_18:
    operator delete(v2);
    goto LABEL_19;
  }
  do
  {
    unsigned int v6 = (dispatch_queue_t *)v4[5];
    BOOL v7 = (std::__shared_weak_count *)v4[6];
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v6)
    {
      char v8 = *v2;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 0x40000000;
      void v13[2] = ___ZNK3awd10AppContextclENS_11ClientStateE_block_invoke;
      v13[3] = &__block_descriptor_tmp_35;
      v13[4] = v6;
      char v14 = v8;
      dispatch_async(*v6, v13);
    }
    if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
      int v9 = (void *)v4[1];
      if (v9)
      {
        do
        {
LABEL_11:
          uint64_t v10 = v9;
          int v9 = (void *)*v9;
        }
        while (v9);
        goto LABEL_3;
      }
    }
    else
    {
      int v9 = (void *)v4[1];
      if (v9) {
        goto LABEL_11;
      }
    }
    do
    {
      uint64_t v10 = (void *)v4[2];
      BOOL v11 = *v10 == (void)v4;
      unsigned int v4 = v10;
    }
    while (!v11);
LABEL_3:
    unsigned int v4 = v10;
  }
  while (v10 != v5);
  if (v2) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v12 = (std::__shared_weak_count *)__p[2];
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  operator delete(__p);
}

void *cpms::CommandDriver::CommandDriver(void *a1, void *a2)
{
  *a1 = &unk_26CE7F198;
  unsigned int v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  uint64_t v5 = dispatch_queue_create("cpms.drv", v4);
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = v5;
  if (v5)
  {
    unsigned int v6 = v5;
    dispatch_retain(v5);
    a1[4] = 0;
    dispatch_release(v6);
  }
  else
  {
    a1[4] = 0;
  }
  ctu::OsLogLogger::OsLogLogger((ctu::OsLogLogger *)(a1 + 5), "com.apple.telephony.abm", "cpms.drv");
  *a1 = &unk_26CE7F198;
  uint64_t v7 = a2[1];
  a1[6] = *a2;
  a1[7] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

void sub_21DBE2528(_Unwind_Exception *exception_object)
{
  uint64_t v3 = v1[4];
  if (v3)
  {
    dispatch_release(v3);
    unsigned int v4 = v1[3];
    if (!v4)
    {
LABEL_3:
      uint64_t v5 = (std::__shared_weak_count *)v1[2];
      if (!v5) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else
  {
    unsigned int v4 = v1[3];
    if (!v4) {
      goto LABEL_3;
    }
  }
  dispatch_release(v4);
  uint64_t v5 = (std::__shared_weak_count *)v1[2];
  if (!v5) {
LABEL_4:
  }
    _Unwind_Resume(exception_object);
LABEL_7:
  std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(exception_object);
}

const char *cpms::CommandDriver::getName(cpms::CommandDriver *this)
{
  return "cpms.drv";
}

uint64_t coex::util::data_to_uint64(CFDataRef *a1)
{
  *(void *)buffer = 0;
  CFDataRef v2 = *a1;
  if (v2) {
    uint64_t v3 = ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get;
  }
  else {
    uint64_t v3 = 0;
  }
  if (!v3) {
    return 0;
  }
  v6.length = CFDataGetLength(v2);
  v6.location = 0;
  CFDataGetBytes(*a1, v6, buffer);
  return *(void *)buffer;
}

uint64_t ctu::SharedRef<__CFData const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFData const>::get(uint64_t a1)
{
  return *(void *)a1;
}

CFDataRef coex::util::uint64_to_data@<X0>(coex::util *this@<X0>, CFDataRef *a2@<X8>)
{
  *(void *)bytes = this;
  *a2 = (CFDataRef)0xAAAAAAAAAAAAAAAALL;
  CFDataRef result = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], bytes, 8);
  *a2 = result;
  return result;
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1211";
}

uint64_t radio::DebugCommandDriver::DebugCommandDriver(uint64_t a1, void *a2, void *a3)
{
  *(void *)a1 = &unk_26CE7F290;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, "com.apple.telephony.abm", "debug.drv");
  CFRange v6 = dispatch_queue_create("debug.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE7F388;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v18);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v17);
  *(void *)a1 = &unk_26CE7F3C8;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
  *(void *)a1 = &unk_26CE7F290;
  *(void *)(a1 + 104) = *a3;
  uint64_t v9 = a3[1];
  *(void *)(a1 + 112) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *((unsigned char *)&v17.__r_.__value_.__s + 23) = 9;
  strcpy((char *)&v17, "debug.drv");
  uint64_t v10 = std::string::append(&v17, ".", 1uLL);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  uint64_t v12 = getprogname();
  size_t v13 = strlen(v12);
  char v14 = std::string::append(&v18, v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  *(void *)(a1 + 136) = *((void *)&v14->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 120) = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v18.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_12:
    operator delete(v17.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_12;
  }
  return a1;
}

void sub_21DBE28A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if ((a15 & 0x80000000) == 0)
  {
    std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
    ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

void *ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7F388;
  MEMORY[0x223C14900](a1 + 1);
  CFDataRef v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE7F388;
  MEMORY[0x223C14900](a1 + 1);
  CFDataRef v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t radio::DebugCommandDriver::getName(radio::DebugCommandDriver *this)
{
  uint64_t result = (uint64_t)this + 120;
  if (*((char *)this + 143) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7F388;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7F388;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void ctu::SharedLoggable<radio::DebugCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7F388;
  MEMORY[0x223C14900](a1 + 1);
  CFDataRef v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void CommandDriverFactory::createNullFactory(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = operator new(0x58uLL);
  void *v3 = &unk_26CE7F408;
  _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(v3 + 1);
  v3[3] = 850045863;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[10] = 0;
  *a1 = v3;
  unsigned int v4 = operator new(0x20uLL);
  *unsigned int v4 = &unk_26CE7F508;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = v3;
  a1[1] = v4;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v6, "com.apple.telephony.abm", "driver.factory");
  size_t v5 = v7;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v6);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21DBD9000, v5, OS_LOG_TYPE_DEFAULT, "'NullFactory' instantiated!", v6, 2u);
  }
}

void sub_21DBE2D2C(_Unwind_Exception *a1)
{
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_21DBE2D40(_Unwind_Exception *a1)
{
  uint64_t v4 = v2;
  *uint64_t v1 = v4;
  std::mutex::~mutex(v3);
  uint64_t v6 = (std::__shared_weak_count *)v1[2];
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  operator delete(v1);
  _Unwind_Resume(a1);
}

void CommandDriverFactory::CommandDriverFactory(CommandDriverFactory *this)
{
  *(void *)this = &unk_26CE7F408;
  _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((void *)this + 1);
  *((void *)this + 3) = 850045863;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 10) = 0;
}

{
  *(void *)this = &unk_26CE7F408;
  _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_((void *)this + 1);
  *((void *)this + 3) = 850045863;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((void *)this + 10) = 0;
}

void CommandDriverFactory::create_default_global(CommandDriverFactory *this@<X0>, void *a2@<X8>)
{
  void (*v4)(uint8_t *__return_ptr);
  void (*v5)(uint8_t *__return_ptr);
  NSObject *v6;
  const char *v7;
  int v8;
  void (*v9)(uint8_t *__return_ptr);
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  std::__shared_weak_count *v17;
  NSObject *v18;
  uint8_t v19[8];
  NSObject *v20;
  uint8_t buf[16];
  uint64_t v22;

  int v22 = *MEMORY[0x263EF8340];
  if (qword_26AB33828 == -1)
  {
    if (_MergedGlobals) {
      goto LABEL_3;
    }
LABEL_31:
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    std::string v18 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DBD9000, v18, OS_LOG_TYPE_DEFAULT, "No CommandDriver dylib was loaded!", buf, 2u);
    }
    goto LABEL_33;
  }
  dispatch_once(&qword_26AB33828, &__block_literal_global);
  if (!_MergedGlobals) {
    goto LABEL_31;
  }
LABEL_3:
  int v3 = capabilities::radio::vendor(this);
  if ((v3 - 2) < 2)
  {
    uint64_t v4 = (void (*)(uint8_t *__return_ptr))dlsym((void *)_MergedGlobals, "_ZN23ARICommandDriverFactory21create_default_globalEv");
    if (v4)
    {
      size_t v5 = v4;
      ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
      uint64_t v6 = *(NSObject **)&buf[8];
      ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      uint64_t v7 = "Succeeded to load ARICommandDriverFactory!";
      goto LABEL_29;
    }
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    long long v15 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Failed to load ARICommandDriverFactory!";
LABEL_25:
      size_t v13 = v15;
      char v14 = 2;
      goto LABEL_26;
    }
    goto LABEL_33;
  }
  uint64_t v8 = v3;
  if (v3 != 1)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    long long v11 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v8;
      uint64_t v12 = "Detected unknown or not supported radio vendor: %d";
      size_t v13 = v11;
      char v14 = 8;
LABEL_26:
      _os_log_impl(&dword_21DBD9000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  uint64_t v9 = (void (*)(uint8_t *__return_ptr))dlsym((void *)_MergedGlobals, "_ZN23QMICommandDriverFactory21create_default_globalEv");
  if (!v9)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
    long long v15 = *(NSObject **)&buf[8];
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Failed to load QMICommandDriverFactory!";
      goto LABEL_25;
    }
LABEL_33:
    CommandDriverFactory::createNullFactory(a2);
    return;
  }
  size_t v5 = v9;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)buf, "com.apple.telephony.abm", "driver.factory");
  uint64_t v6 = *(NSObject **)&buf[8];
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)buf);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    goto LABEL_10;
  }
  *(_WORD *)buf = 0;
  uint64_t v7 = "Succeeded to load QMICommandDriverFactory!";
LABEL_29:
  _os_log_debug_impl(&dword_21DBD9000, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
LABEL_10:
  memset(buf, 170, sizeof(buf));
  v5(buf);
  if (*(void *)buf)
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, "com.apple.telephony.abm", "driver.factory");
    uint64_t v10 = v20;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v19 = 0;
      _os_log_impl(&dword_21DBD9000, v10, OS_LOG_TYPE_DEFAULT, "fully instantiated!", v19, 2u);
    }
    (*(void (**)(void))(**(void **)buf + 160))(*(void *)buf);
    *(_OWORD *)a2 = *(_OWORD *)buf;
  }
  else
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, "com.apple.telephony.abm", "driver.factory");
    uint64_t v16 = v20;
    ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v19 = 0;
      _os_log_impl(&dword_21DBD9000, v16, OS_LOG_TYPE_DEFAULT, "loaded but returned null!", v19, 2u);
    }
    CommandDriverFactory::createNullFactory(a2);
    std::string v17 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

void sub_21DBE3288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21DBE329C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21DBE32B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

const char *CommandDriverFactory::getName(CommandDriverFactory *this)
{
  return "driver.factory";
}

void CommandDriverFactory::createRadioCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::weakRadioCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::getRadioWorkloop(void *a1@<X8>)
{
  *a1 = 0;
}

void CommandDriverFactory::createRFSCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::weakRFSCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCoexCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createAntennaCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createAwdCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createHealthCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createLogCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDataCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::weakDataCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCPMSCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCoreDumpCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDebugCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDiagCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createTraceCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createDesenseCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::createCellularCertCommandDriver(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0;
}

void CommandDriverFactory::setRegistry(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = v2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void *___ZN12_GLOBAL__N_113sLoadTheDylibEv_block_invoke(capabilities::radio *a1)
{
  size_t result = (void *)capabilities::radio::vendor(a1);
  if ((result - 1) <= 2)
  {
    size_t result = dlopen(off_264477210[(int)result - 1], 1);
    _MergedGlobals = (uint64_t)result;
  }
  return result;
}

void std::__shared_ptr_pointer<CommandDriverFactory *,std::shared_ptr<CommandDriverFactory>::__shared_ptr_default_delete<CommandDriverFactory,CommandDriverFactory>,std::allocator<CommandDriverFactory>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_pointer<CommandDriverFactory *,std::shared_ptr<CommandDriverFactory>::__shared_ptr_default_delete<CommandDriverFactory,CommandDriverFactory>,std::allocator<CommandDriverFactory>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(char **)(a1 + 24);
  if (v1)
  {
    *(void *)uint64_t v1 = &unk_26CE7F408;
    std::mutex::~mutex((std::mutex *)(v1 + 24));
    uint64_t v2 = (std::__shared_weak_count *)*((void *)v1 + 2);
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v3 = v1;
    }
    operator delete(v3);
  }
}

uint64_t std::__shared_ptr_pointer<CommandDriverFactory *,std::shared_ptr<CommandDriverFactory>::__shared_ptr_default_delete<CommandDriverFactory,CommandDriverFactory>,std::allocator<CommandDriverFactory>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x800000021DBF53BALL) {
    return a1 + 24;
  }
  if (((v3 & 0x800000021DBF53BALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021DBF53BALL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021DBF53BALL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void _ZNSt3__115allocate_sharedB8ne180100I8RegistryNS_9allocatorIS1_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)operator new(0x38uLL);
  v2->__shared_owners_ = 0;
  p_shared_owners = &v2->__shared_owners_;
  v2->__shared_weak_owners_ = 0;
  v2->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CE7F558;
  Registry::Registry((Registry *)&v2[1]);
  *a1 = v4;
  a1[1] = v2;
  shared_owners = (std::__shared_weak_count *)v2[1].__shared_owners_;
  if (shared_owners)
  {
    if (shared_owners->__shared_owners_ != -1) {
      return;
    }
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v2[1].__vftable = (std::__shared_weak_count_vtbl *)&v2[1];
    v2[1].__shared_owners_ = (uint64_t)v2;
    std::__shared_weak_count::__release_weak(shared_owners);
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  else
  {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    v2[1].__vftable = (std::__shared_weak_count_vtbl *)&v2[1];
    v2[1].__shared_owners_ = (uint64_t)v2;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);

  std::__shared_weak_count::__release_weak(v2);
}

void sub_21DBE373C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Registry>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CE7F558;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Registry>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CE7F558;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<Registry>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 32);
    if (!v3) {
      return;
    }
  }

  std::__shared_weak_count::__release_weak(v3);
}

void CreateError(uint64_t a1@<X0>, CFIndex a2@<X1>, CFErrorRef *a3@<X8>)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string __p = *(std::string *)a1;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v11, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v11 = __p;
  }
  uint64_t v9 = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v12, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  }
  else {
    std::string v12 = v11;
  }
  uint64_t v10 = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (ctu::cf::convert_copy()) {
    uint64_t v6 = v10;
  }
  else {
    uint64_t v6 = 0;
  }
  if ((SHIBYTE(v12.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    uint64_t v8 = v6;
    if ((SHIBYTE(v11.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_15;
    }
LABEL_20:
    operator delete(v11.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  operator delete(v12.__r_.__value_.__l.__data_);
  uint64_t v8 = v6;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_20;
  }
LABEL_15:
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_16;
  }
LABEL_21:
  operator delete(__p.__r_.__value_.__l.__data_);
LABEL_16:
  v12.__r_.__value_.__r.__words[0] = *MEMORY[0x263EFFC48];
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)v6;
  *a3 = (CFErrorRef)0xAAAAAAAAAAAAAAAALL;
  *a3 = CFErrorCreateWithUserInfoKeysAndValues(v5, (CFErrorDomain)*MEMORY[0x263EFFC60], a2, (const void *const *)&v12.__r_.__value_.__l.__data_, (const void *const *)&v11.__r_.__value_.__l.__data_, 1);
  if (v6) {
    CFRelease(v6);
  }
}

void sub_21DBE39FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, int a16, const void *a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(a19);
    if (a14 < 0)
    {
LABEL_3:
      operator delete(__p);
      _Unwind_Resume(a1);
    }
  }
  else if (a14 < 0)
  {
    goto LABEL_3;
  }
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFString const>::~CFSharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  CFAllocatorRef v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    CFAllocatorRef v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t logs::collectionStateAsString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  switch((int)result)
  {
    case 0:
      a2[23] = 7;
      strcpy(a2, "Started");
      break;
    case 1:
      a2[23] = 7;
      strcpy(a2, "Stopped");
      break;
    case 2:
      a2[23] = 16;
      strcpy(a2, "EnteringLowPower");
      break;
    case 3:
      a2[23] = 15;
      strcpy(a2, "ExitingLowPower");
      break;
    case 4:
      a2[23] = 5;
      strcpy(a2, "Error");
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "Unknown");
      break;
  }
  return result;
}

const char *desense::asString(unsigned int a1)
{
  if (a1 > 2) {
    return "???";
  }
  else {
    return off_264477258[a1];
  }
}

uint64_t desense::CommandDriver::CommandDriver(uint64_t a1, void *a2, void *a3)
{
  *(void *)a1 = &unk_26CE7F5A8;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v44, "com.apple.telephony.abm", "desense.drv");
  std::string::size_type v6 = dispatch_queue_create("desense.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    std::string::size_type v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE7F690;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v45);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v43);
  *(void *)a1 = &unk_26CE7F7B0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v44);
  *(void *)a1 = &unk_26CE7F5A8;
  *(void *)(a1 + 104) = &unk_26CE7F6D0;
  uint64_t v9 = (uint64_t *)operator new(0x28uLL);
  uint64_t v10 = operator new(0x20uLL);
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
  *(_OWORD *)&v45.__r_.__value_.__r.__words[1] = (unint64_t)&v45;
  char v47 = 0;
  uint64_t v48 = 0;
  v46 = &v47;
  std::string v11 = operator new(0x40uLL);
  void *v11 = v11;
  v11[1] = v11;
  v11[5] = 0;
  v11[4] = 0;
  _OWORD v11[2] = 0;
  v11[3] = v11 + 4;
  *(void *)uint64_t v10 = v11;
  *((void *)v10 + 1) = 0;
  std::string v12 = operator new(0x18uLL);
  v12[1] = 0x100000001;
  void *v12 = &unk_26CE7F7F0;
  v12[2] = v11;
  *((void *)v10 + 1) = v12;
  uint64_t v13 = operator new(1uLL);
  *((void *)v10 + 2) = v13;
  *((void *)v10 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v10 + 16, (uint64_t)v13, (atomic_uint **)v10 + 3);
  uint64_t *v9 = (uint64_t)v10;
  v9[1] = 0;
  char v14 = operator new(0x18uLL);
  v14[1] = 0x100000001;
  void *v14 = &unk_26CE7F850;
  v14[2] = v10;
  v9[1] = (uint64_t)v14;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v47);
  if (v45.__r_.__value_.__r.__words[2])
  {
    size = (std::string *)v45.__r_.__value_.__l.__size_;
    std::string::size_type v15 = v45.__r_.__value_.__r.__words[0];
    uint64_t v17 = *(void *)v45.__r_.__value_.__l.__size_;
    *(void *)(v17 + 8) = *(void *)(v45.__r_.__value_.__r.__words[0] + 8);
    **(void **)(v15 + 8) = v17;
    v45.__r_.__value_.__r.__words[2] = 0;
    if (size != &v45)
    {
      do
      {
        std::string v18 = (std::string *)size->__r_.__value_.__l.__size_;
        data = (atomic_uint *)size[1].__r_.__value_.__l.__data_;
        if (data)
        {
          if (atomic_fetch_add(data + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)data + 16))(data);
            if (atomic_fetch_add(data + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)data + 24))(data);
            }
          }
        }
        operator delete(size);
        size = v18;
      }
      while (v18 != &v45);
    }
  }
  v9[2] = *(void *)*v9;
  uint64_t v20 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v20, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v9 + 3, (uint64_t)v20);
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = 0;
  char v21 = operator new(0x18uLL);
  v21[1] = 0x100000001;
  void *v21 = &unk_26CE7F8B0;
  v21[2] = v9;
  *(void *)(a1 + 120) = v21;
  *(void *)(a1 + 128) = &unk_26CE7F740;
  int v22 = (uint64_t *)operator new(0x28uLL);
  uint64_t v23 = operator new(0x20uLL);
  v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&v45;
  *(_OWORD *)&v45.__r_.__value_.__r.__words[1] = (unint64_t)&v45;
  char v47 = 0;
  uint64_t v48 = 0;
  v46 = &v47;
  uint64_t v24 = operator new(0x40uLL);
  void *v24 = v24;
  v24[1] = v24;
  v24[5] = 0;
  v24[4] = 0;
  v24[2] = 0;
  v24[3] = v24 + 4;
  *(void *)uint64_t v23 = v24;
  *((void *)v23 + 1) = 0;
  uint64_t v25 = operator new(0x18uLL);
  v25[1] = 0x100000001;
  void *v25 = &unk_26CE7F910;
  v25[2] = v24;
  *((void *)v23 + 1) = v25;
  uint64_t v26 = operator new(1uLL);
  *((void *)v23 + 2) = v26;
  *((void *)v23 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v23 + 16, (uint64_t)v26, (atomic_uint **)v23 + 3);
  uint64_t *v22 = (uint64_t)v23;
  v22[1] = 0;
  BOOL v27 = operator new(0x18uLL);
  v27[1] = 0x100000001;
  void *v27 = &unk_26CE7F970;
  v27[2] = v23;
  v22[1] = (uint64_t)v27;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v47);
  if (v45.__r_.__value_.__r.__words[2])
  {
    long long v29 = (std::string *)v45.__r_.__value_.__l.__size_;
    std::string::size_type v28 = v45.__r_.__value_.__r.__words[0];
    uint64_t v30 = *(void *)v45.__r_.__value_.__l.__size_;
    *(void *)(v30 + 8) = *(void *)(v45.__r_.__value_.__r.__words[0] + 8);
    **(void **)(v28 + 8) = v30;
    v45.__r_.__value_.__r.__words[2] = 0;
    if (v29 != &v45)
    {
      do
      {
        long long v31 = (std::string *)v29->__r_.__value_.__l.__size_;
        v32 = (atomic_uint *)v29[1].__r_.__value_.__l.__data_;
        if (v32)
        {
          if (atomic_fetch_add(v32 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v32 + 16))(v32);
            if (atomic_fetch_add(v32 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v32 + 24))(v32);
            }
          }
        }
        operator delete(v29);
        long long v29 = v31;
      }
      while (v31 != &v45);
    }
  }
  v22[2] = *(void *)*v22;
  unint64_t v33 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v33, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v22 + 3, (uint64_t)v33);
  *(void *)(a1 + 136) = v22;
  *(void *)(a1 + 144) = 0;
  v34 = operator new(0x18uLL);
  v34[1] = 0x100000001;
  void *v34 = &unk_26CE7F9D0;
  v34[2] = v22;
  *(void *)(a1 + 152) = *a3;
  *(void *)(a1 + 144) = v34;
  uint64_t v35 = a3[1];
  *(void *)(a1 + 160) = v35;
  if (v35) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v35 + 8), 1uLL, memory_order_relaxed);
  }
  *((unsigned char *)&v43.__r_.__value_.__s + 23) = 11;
  strcpy((char *)&v43, "desense.drv");
  uint64_t v36 = std::string::append(&v43, ".", 1uLL);
  long long v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
  v45.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v37;
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  v38 = getprogname();
  size_t v39 = strlen(v38);
  uint64_t v40 = std::string::append(&v45, v38, v39);
  long long v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
  *(void *)(a1 + 184) = *((void *)&v40->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 168) = v41;
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v45.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_28:
    operator delete(v43.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_28;
  }
  return a1;
}

void sub_21DBE438C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::~signal(v25);
  boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::~signal(a9);
  ctu::SharedLoggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

void *boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE7F740;
  uint64_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE7F6D0;
  uint64_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *ctu::SharedLoggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7F690;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE7F690;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t desense::CommandDriver::getName(desense::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 168;
  if (*((char *)this + 191) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 168);
  if (*(char *)(a1 + 191) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7F690;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7F690;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE7F6D0;
  uint64_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

void boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE7F740;
  uint64_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

void ctu::SharedLoggable<desense::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7F690;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          uint64_t v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          uint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(coex::SubId),boost::function<void ()(coex::SubId)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,coex::SubId)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          uint64_t v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          uint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::function<void ()(boost::signals2::connection const&,std::map<char const*,std::list<std::pair<unsigned long long,unsigned int>>>,coex::SubId)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

const char *radio::asString(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 7) {
    return "Unknown";
  }
  else {
    return off_264477510[v1];
  }
}

{
  unint64_t v1;

  unint64_t v1 = *a1;
  if (v1 > 2) {
    return "FactoryCalibrationStatus::kUnknown";
  }
  else {
    return off_264477608[v1];
  }
}

{
  unint64_t v1;

  unint64_t v1 = *a1;
  if (v1 > 2) {
    return "RFCalibrationStatus::kUnknown";
  }
  else {
    return off_264477638[v1];
  }
}

void radio::OpMode::~OpMode(radio::OpMode *this)
{
  uint64_t v2 = (void *)*((void *)this + 1);
  *((void *)this + 2) = v2;
  uint64_t v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
    uint64_t v2 = (void *)*((void *)this + 1);
  }
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  void *v2;
  void *v3;

  uint64_t v2 = (void *)*((void *)this + 1);
  *((void *)this + 2) = v2;
  uint64_t v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
    uint64_t v2 = (void *)*((void *)this + 1);
  }
  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }
}

void radio::OpMode::create(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = (char *)operator new(0x50uLL);
  *((void *)v3 + 1) = 0;
  *((void *)v3 + 2) = 0;
  *(void *)uint64_t v3 = &unk_26CE7FA30;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *((void *)v3 + 9) = 0;
  a1[1] = v3;
  *(_OWORD *)(v3 + 24) = 0u;
  v3 += 24;
  *a1 = v3;
  radio::OpMode::init((radio::OpMode *)v3);
}

void sub_21DBE6444(_Unwind_Exception *a1)
{
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void radio::OpMode::init(radio::OpMode *this)
{
  *(unsigned char *)this = 8;
  *((_WORD *)this + 1) = 0;
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    uint64_t v7 = operator new(7uLL);
    *(_DWORD *)uint64_t v7 = 262657;
    v7[2] = 1536;
    *((unsigned char *)v7 + 6) = 7;
    size_t v5 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v7;
    *((void *)this + 2) = (char *)v7 + 7;
    *((void *)this + 3) = (char *)v7 + 7;
    if (!v5) {
      return;
    }
    goto LABEL_9;
  }
  if (RadioVendor == 4)
  {
    uint64_t v8 = operator new(2uLL);
    size_t v5 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v8;
    *v8++ = 1;
    *((void *)this + 2) = v8;
    *((void *)this + 3) = v8;
    if (!v5) {
      return;
    }
    goto LABEL_9;
  }
  if (RadioVendor == 1)
  {
    uint64_t v3 = operator new(8uLL);
    void *v3 = 0xB09050403020100;
    uint64_t v4 = operator new(8uLL);
    *uint64_t v4 = 0x3000200010000;
    size_t v5 = (void *)*((void *)this + 1);
    *((void *)this + 1) = v3;
    *((void *)this + 2) = v3 + 1;
    uint64_t v6 = (void *)*((void *)this + 4);
    *((void *)this + 3) = v3 + 1;
    *((void *)this + 4) = v4;
    *((void *)this + 5) = v4 + 1;
    *((void *)this + 6) = v4 + 1;
    if (v6) {
      operator delete(v6);
    }
    if (v5)
    {
LABEL_9:
      operator delete(v5);
    }
  }
}

void sub_21DBE6590(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

unsigned char *radio::OpMode::setMode(unsigned char *result, char a2)
{
  *size_t result = a2;
  return result;
}

uint64_t radio::OpMode::setMode(uint64_t this, int a2)
{
  uint64_t v2 = *(void *)(this + 8);
  uint64_t v3 = *(void *)(this + 16);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    uint64_t v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3) {
        goto LABEL_5;
      }
    }
  }
  *(unsigned char *)this = v4;
  return this;
}

uint64_t radio::OpMode::convertMode(radio::OpMode *this, int a2)
{
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *((void *)this + 2);
  if (v2 == v3)
  {
LABEL_5:
    LOBYTE(v4) = 8;
  }
  else
  {
    uint64_t v4 = 0;
    while (*(unsigned __int8 *)(v2 + v4) != a2)
    {
      ++v4;
      if (v2 + v4 == v3) {
        goto LABEL_5;
      }
    }
  }
  return v4;
}

uint64_t radio::OpMode::getMode(radio::OpMode *this)
{
  return *(unsigned __int8 *)this;
}

uint64_t radio::OpMode::getModeValue(radio::OpMode *this)
{
  unint64_t v1 = *(unsigned __int8 *)this;
  uint64_t v2 = *((void *)this + 1);
  if (*((void *)this + 2) - v2 <= v1) {
    return 255;
  }
  else {
    return *(unsigned __int8 *)(v2 + v1);
  }
}

uint64_t radio::OpMode::convertMode(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (*(void *)(a1 + 16) - v2 <= (unint64_t)a2) {
    return 255;
  }
  else {
    return *(unsigned __int8 *)(v2 + a2);
  }
}

uint64_t radio::OpMode::setConfig(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 2) = a2;
  return result;
}

uint64_t radio::OpMode::setConfig(uint64_t this, int a2)
{
  uint64_t v2 = *(unsigned __int16 **)(this + 32);
  uint64_t v3 = *(unsigned __int16 **)(this + 40);
  if (v2 == v3)
  {
LABEL_5:
    __int16 v4 = 0;
  }
  else
  {
    __int16 v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3) {
        goto LABEL_5;
      }
    }
  }
  *(_WORD *)(this + 2) = v4;
  return this;
}

uint64_t radio::OpMode::convertConfig(radio::OpMode *this, int a2)
{
  uint64_t v2 = (unsigned __int16 *)*((void *)this + 4);
  uint64_t v3 = (unsigned __int16 *)*((void *)this + 5);
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    unsigned __int16 v4 = 0;
    while (*v2 != a2)
    {
      ++v2;
      ++v4;
      if (v2 == v3) {
        return 0;
      }
    }
  }
  return v4;
}

uint64_t radio::OpMode::getConfig(radio::OpMode *this)
{
  return *((unsigned __int16 *)this + 1);
}

uint64_t radio::OpMode::getConfigValue(radio::OpMode *this)
{
  unint64_t v1 = *((unsigned __int8 *)this + 2);
  uint64_t v2 = *((void *)this + 4);
  if (v1 >= (*((void *)this + 5) - v2) >> 1) {
    return 0xFFFFLL;
  }
  else {
    return *(unsigned __int16 *)(v2 + 2 * v1);
  }
}

uint64_t radio::OpMode::convertConfig(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2 >= (unint64_t)((*(void *)(a1 + 40) - v2) >> 1)) {
    return 0xFFFFLL;
  }
  else {
    return *(unsigned __int16 *)(v2 + 2 * a2);
  }
}

BOOL radio::OpMode::allowModeChange(radio::OpMode *this)
{
  unsigned int v1 = *((unsigned __int16 *)this + 1);
  if (v1 < 2) {
    return 1;
  }
  if (v1 == 3)
  {
    int v3 = *(unsigned __int8 *)this;
    if ((v3 & 0xFE) == 4) {
      return 0;
    }
  }
  else
  {
    int v3 = *(unsigned __int8 *)this;
  }
  return v3 != 2;
}

uint64_t radio::OpMode::getModeString@<X0>(radio::OpMode *this@<X0>, unsigned char *a2@<X8>)
{
  return radio::OpMode::modeToString((uint64_t)this, *(unsigned __int8 *)this, a2);
}

uint64_t radio::OpMode::modeToString@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned char *a3@<X8>)
{
  unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v38[7] = v6;
  v38[8] = v6;
  v38[5] = v6;
  v38[6] = v6;
  v38[3] = v6;
  v38[4] = v6;
  v38[1] = v6;
  v38[2] = v6;
  long long v37 = v6;
  v38[0] = v6;
  *(_OWORD *)std::string __p = v6;
  long long v36 = v6;
  long long v33 = v6;
  *(_OWORD *)__src = v6;
  long long v31 = v6;
  long long v32 = v6;
  long long v30 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v30);
  if (a2 > 7) {
    uint64_t v7 = "Unknown";
  }
  else {
    uint64_t v7 = off_264477510[(char)a2];
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)v7, v8);
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) < 2)
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    uint64_t v16 = *(void *)(a1 + 8);
    if (*(void *)(a1 + 16) - v16 <= (unint64_t)a2 || (unint64_t v17 = *(char *)(v16 + a2), v17 > 7)) {
      uint64_t v13 = "Unknown";
    }
    else {
      uint64_t v13 = off_2644775B0[v17];
    }
  }
  else if (RadioVendor == 1)
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    uint64_t v18 = *(void *)(a1 + 8);
    if (*(void *)(a1 + 16) - v18 <= (unint64_t)a2 || (unint64_t v19 = *(char *)(v18 + a2), v19 > 0xB)) {
      uint64_t v13 = "Unknown";
    }
    else {
      uint64_t v13 = off_264477550[v19];
    }
  }
  else
  {
    if (RadioVendor != 4) {
      goto LABEL_23;
    }
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v31, (uint64_t)" [ ", 3);
    uint64_t v11 = *(void *)(a1 + 8);
    unint64_t v12 = a2;
    uint64_t v13 = "Unknown";
    if (*(void *)(a1 + 16) - v11 > v12)
    {
      char v14 = *(unsigned char *)(v11 + v12);
      std::string::size_type v15 = "Online";
      if (v14 != 1) {
        std::string::size_type v15 = "Unknown";
      }
      if (v14) {
        uint64_t v13 = v15;
      }
      else {
        uint64_t v13 = "Airplane";
      }
    }
  }
  size_t v20 = strlen(v13);
  char v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)v13, v20);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)" ]", 2);
LABEL_23:
  if ((BYTE8(v37) & 0x10) != 0)
  {
    uint64_t v23 = (unsigned char *)v37;
    if ((void *)v37 < __src[1])
    {
      *(void **)&long long v37 = __src[1];
      uint64_t v23 = __src[1];
    }
    uint64_t v24 = __src[0];
    size_t v22 = v23 - (char *)__src[0];
    if ((unint64_t)(v23 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_40;
    }
  }
  else
  {
    if ((BYTE8(v37) & 8) == 0)
    {
      size_t v22 = 0;
      a3[23] = 0;
      goto LABEL_36;
    }
    uint64_t v24 = (const void *)*((void *)&v32 + 1);
    size_t v22 = *((void *)&v33 + 1) - *((void *)&v32 + 1);
    if (*((void *)&v33 + 1) - *((void *)&v32 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_40:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v22 >= 0x17)
  {
    uint64_t v25 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v22 | 7) != 0x17) {
      uint64_t v25 = v22 | 7;
    }
    uint64_t v26 = v25 + 1;
    BOOL v27 = operator new(v25 + 1);
    *((void *)a3 + 1) = v22;
    *((void *)a3 + 2) = v26 | 0x8000000000000000;
    *(void *)a3 = v27;
    a3 = v27;
    goto LABEL_35;
  }
  a3[23] = v22;
  if (v22) {
LABEL_35:
  }
    memmove(a3, v24, v22);
LABEL_36:
  a3[v22] = 0;
  *(void *)&long long v30 = *MEMORY[0x263F8C2B8];
  uint64_t v28 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v30 + *(void *)(v30 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v31 = v28;
  *((void *)&v31 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v36) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C14BF0](v38);
}

void sub_21DBE6BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21DBE6BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21DBE6BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21DBE6BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t radio::OpMode::modeToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v3 = *((void *)this + 1);
  uint64_t v4 = *((void *)this + 2);
  if (v3 == v4)
  {
LABEL_5:
    LOBYTE(v5) = 8;
  }
  else
  {
    uint64_t v5 = 0;
    while (*(unsigned __int8 *)(v3 + v5) != a2)
    {
      ++v5;
      if (v3 + v5 == v4) {
        goto LABEL_5;
      }
    }
  }
  return radio::OpMode::modeToString((uint64_t)this, v5, a3);
}

uint64_t radio::OpMode::getConfigString@<X0>(radio::OpMode *this@<X0>, unsigned char *a2@<X8>)
{
  return radio::OpMode::configToString((uint64_t)this, *((unsigned __int16 *)this + 1), a2);
}

uint64_t radio::OpMode::configToString@<X0>(uint64_t a1@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34[7] = v6;
  v34[8] = v6;
  v34[5] = v6;
  v34[6] = v6;
  v34[3] = v6;
  v34[4] = v6;
  v34[1] = v6;
  v34[2] = v6;
  long long v33 = v6;
  v34[0] = v6;
  *(_OWORD *)std::string __p = v6;
  long long v32 = v6;
  long long v29 = v6;
  *(_OWORD *)__src = v6;
  long long v27 = v6;
  long long v28 = v6;
  long long v26 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v26);
  if ((a2 - 1) > 2) {
    uint64_t v7 = "Unknown";
  }
  else {
    uint64_t v7 = off_2644775F0[(__int16)(a2 - 1)];
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v7, v8);
  int RadioVendor = TelephonyRadiosGetRadioVendor();
  if ((RadioVendor - 2) >= 2)
  {
    if (RadioVendor == 1)
    {
      unint64_t v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
      uint64_t v13 = *(void *)(a1 + 32);
      if (a2 >= (unint64_t)((*(void *)(a1 + 40) - v13) >> 1)
        || (unsigned int v14 = *(unsigned __int16 *)(v13 + 2 * a2) - 1, v14 > 2))
      {
        std::string::size_type v15 = "Unknown";
      }
      else
      {
        std::string::size_type v15 = off_2644775F0[(__int16)v14];
      }
      size_t v16 = strlen(v15);
      unint64_t v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)v15, v16);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" ]", 2);
    }
  }
  else
  {
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)" [ ", 3);
    uint64_t v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Invalid for ICE", 15);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" ]", 2);
  }
  if ((BYTE8(v33) & 0x10) != 0)
  {
    unint64_t v19 = (unsigned char *)v33;
    if ((void *)v33 < __src[1])
    {
      *(void **)&long long v33 = __src[1];
      unint64_t v19 = __src[1];
    }
    size_t v20 = __src[0];
    size_t v18 = v19 - (char *)__src[0];
    if ((unint64_t)(v19 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_29;
    }
  }
  else
  {
    if ((BYTE8(v33) & 8) == 0)
    {
      size_t v18 = 0;
      a3[23] = 0;
      goto LABEL_25;
    }
    size_t v20 = (const void *)*((void *)&v28 + 1);
    size_t v18 = *((void *)&v29 + 1) - *((void *)&v28 + 1);
    if (*((void *)&v29 + 1) - *((void *)&v28 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_29:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v18 >= 0x17)
  {
    uint64_t v21 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17) {
      uint64_t v21 = v18 | 7;
    }
    uint64_t v22 = v21 + 1;
    uint64_t v23 = operator new(v21 + 1);
    *((void *)a3 + 1) = v18;
    *((void *)a3 + 2) = v22 | 0x8000000000000000;
    *(void *)a3 = v23;
    a3 = v23;
    goto LABEL_24;
  }
  a3[23] = v18;
  if (v18) {
LABEL_24:
  }
    memmove(a3, v20, v18);
LABEL_25:
  a3[v18] = 0;
  *(void *)&long long v26 = *MEMORY[0x263F8C2B8];
  uint64_t v24 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v26 + *(void *)(v26 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v27 = v24;
  *((void *)&v27 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C14BF0](v34);
}

void sub_21DBE6FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21DBE6FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t radio::OpMode::configToString@<X0>(radio::OpMode *this@<X0>, int a2@<W1>, unsigned char *a3@<X8>)
{
  uint64_t v3 = (unsigned __int16 *)*((void *)this + 4);
  uint64_t v4 = (unsigned __int16 *)*((void *)this + 5);
  if (v3 == v4)
  {
LABEL_5:
    unsigned __int16 v5 = 0;
  }
  else
  {
    unsigned __int16 v5 = 0;
    while (*v3 != a2)
    {
      ++v3;
      ++v5;
      if (v3 == v4) {
        goto LABEL_5;
      }
    }
  }
  return radio::OpMode::configToString((uint64_t)this, v5, a3);
}

const char *radio::asStringV2(char *a1)
{
  unint64_t v1 = *a1;
  if (v1 > 2) {
    return "FactoryCalibrationStatus::kUnknown";
  }
  else {
    return off_264477620[v1];
  }
}

uint64_t radio::RFCalibration_t::toString@<X0>(radio::RFCalibration_t *this@<X0>, unsigned char *a2@<X8>)
{
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v64[7] = v4;
  v64[8] = v4;
  v64[5] = v4;
  v64[6] = v4;
  v64[3] = v4;
  v64[4] = v4;
  v64[1] = v4;
  v64[2] = v4;
  long long v63 = v4;
  v64[0] = v4;
  *(_OWORD *)std::string __p = v4;
  long long v62 = v4;
  long long v59 = v4;
  *(_OWORD *)__src = v4;
  long long v57 = v4;
  long long v58 = v4;
  long long v56 = v4;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v56);
  unint64_t v5 = *(char *)this;
  if (v5 > 2) {
    long long v6 = "RFCalibrationStatus::kUnknown";
  }
  else {
    long long v6 = off_264477638[v5];
  }
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)v6, v7);
  if (*(unsigned char *)this == 1)
  {
    size_t v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nGSM: ", 6);
    *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24) + 8) = *(_DWORD *)((unsigned char *)v8 + *(void *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"0x", 2);
    uint64_t v9 = (void *)std::ostream::operator<<();
    uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v10 + *(void *)(*v10 - 24) + 8) = *(_DWORD *)((unsigned char *)v10 + *(void *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"0x", 2);
    uint64_t v11 = (void *)std::ostream::operator<<();
    int v12 = *((unsigned __int16 *)this + 1);
    int v13 = *((unsigned __int16 *)this + 2);
    if (v12 == v13) {
      unsigned int v14 = " - CORRECT";
    }
    else {
      unsigned int v14 = " - INCORRECT";
    }
    if (v12 == v13) {
      uint64_t v15 = 10;
    }
    else {
      uint64_t v15 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v14, v15);
    size_t v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nCDMA: ", 7);
    *(_DWORD *)((char *)v16 + *(void *)(*v16 - 24) + 8) = *(_DWORD *)((unsigned char *)v16 + *(void *)(*v16 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"0x", 2);
    unint64_t v17 = (void *)std::ostream::operator<<();
    size_t v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v18 + *(void *)(*v18 - 24) + 8) = *(_DWORD *)((unsigned char *)v18 + *(void *)(*v18 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"0x", 2);
    unint64_t v19 = (void *)std::ostream::operator<<();
    int v20 = *((_DWORD *)this + 2);
    int v21 = *((_DWORD *)this + 3);
    if (v20 == v21) {
      uint64_t v22 = " - CORRECT";
    }
    else {
      uint64_t v22 = " - INCORRECT";
    }
    if (v20 == v21) {
      uint64_t v23 = 10;
    }
    else {
      uint64_t v23 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v22, v23);
    uint64_t v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nWCDMA: ", 8);
    *(_DWORD *)((char *)v24 + *(void *)(*v24 - 24) + 8) = *(_DWORD *)((unsigned char *)v24 + *(void *)(*v24 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)"0x", 2);
    uint64_t v25 = (void *)std::ostream::operator<<();
    long long v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v26 + *(void *)(*v26 - 24) + 8) = *(_DWORD *)((unsigned char *)v26 + *(void *)(*v26 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)"0x", 2);
    long long v27 = (void *)std::ostream::operator<<();
    int v28 = *((_DWORD *)this + 4);
    int v29 = *((_DWORD *)this + 5);
    if (v28 == v29) {
      long long v30 = " - CORRECT";
    }
    else {
      long long v30 = " - INCORRECT";
    }
    if (v28 == v29) {
      uint64_t v31 = 10;
    }
    else {
      uint64_t v31 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)v30, v31);
    long long v32 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nTDSCDMA: ", 10);
    *(_DWORD *)((char *)v32 + *(void *)(*v32 - 24) + 8) = *(_DWORD *)((unsigned char *)v32 + *(void *)(*v32 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v32, (uint64_t)"0x", 2);
    long long v33 = (void *)std::ostream::operator<<();
    v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v33, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v34 + *(void *)(*v34 - 24) + 8) = *(_DWORD *)((unsigned char *)v34 + *(void *)(*v34 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)"0x", 2);
    unint64_t v35 = (void *)std::ostream::operator<<();
    int v36 = *((_DWORD *)this + 6);
    int v37 = *((_DWORD *)this + 7);
    if (v36 == v37) {
      v38 = " - CORRECT";
    }
    else {
      v38 = " - INCORRECT";
    }
    if (v36 == v37) {
      uint64_t v39 = 10;
    }
    else {
      uint64_t v39 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)v38, v39);
    uint64_t v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v57, (uint64_t)"\nLTE: ", 6);
    *(_DWORD *)((char *)v40 + *(void *)(*v40 - 24) + 8) = *(_DWORD *)((unsigned char *)v40 + *(void *)(*v40 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v40, (uint64_t)"0x", 2);
    long long v41 = (void *)std::ostream::operator<<();
    uint64_t v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v41, (uint64_t)", mask: ", 8);
    *(_DWORD *)((char *)v42 + *(void *)(*v42 - 24) + 8) = *(_DWORD *)((unsigned char *)v42 + *(void *)(*v42 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"0x", 2);
    std::string v43 = (void *)std::ostream::operator<<();
    uint64_t v44 = *((void *)this + 4);
    uint64_t v45 = *((void *)this + 5);
    if (v44 == v45) {
      v46 = " - CORRECT";
    }
    else {
      v46 = " - INCORRECT";
    }
    if (v44 == v45) {
      uint64_t v47 = 10;
    }
    else {
      uint64_t v47 = 12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v43, (uint64_t)v46, v47);
  }
  if ((BYTE8(v63) & 0x10) != 0)
  {
    v49 = (unsigned char *)v63;
    if ((void *)v63 < __src[1])
    {
      *(void **)&long long v63 = __src[1];
      v49 = __src[1];
    }
    v50 = __src[0];
    size_t v48 = v49 - (char *)__src[0];
    if ((unint64_t)(v49 - (char *)__src[0]) >= 0x7FFFFFFFFFFFFFF8) {
      goto LABEL_53;
    }
  }
  else
  {
    if ((BYTE8(v63) & 8) == 0)
    {
      size_t v48 = 0;
      a2[23] = 0;
      goto LABEL_49;
    }
    v50 = (const void *)*((void *)&v58 + 1);
    size_t v48 = *((void *)&v59 + 1) - *((void *)&v58 + 1);
    if (*((void *)&v59 + 1) - *((void *)&v58 + 1) >= 0x7FFFFFFFFFFFFFF8uLL) {
LABEL_53:
    }
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v48 >= 0x17)
  {
    uint64_t v51 = (v48 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v48 | 7) != 0x17) {
      uint64_t v51 = v48 | 7;
    }
    uint64_t v52 = v51 + 1;
    v53 = operator new(v51 + 1);
    *((void *)a2 + 1) = v48;
    *((void *)a2 + 2) = v52 | 0x8000000000000000;
    *(void *)a2 = v53;
    a2 = v53;
    goto LABEL_48;
  }
  a2[23] = v48;
  if (v48) {
LABEL_48:
  }
    memmove(a2, v50, v48);
LABEL_49:
  a2[v48] = 0;
  *(void *)&long long v56 = *MEMORY[0x263F8C2B8];
  uint64_t v54 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)&v56 + *(void *)(v56 - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  *(void *)&long long v57 = v54;
  *((void *)&v57 + 1) = MEMORY[0x263F8C318] + 16;
  if (SHIBYTE(v62) < 0) {
    operator delete(__p[1]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x223C14BF0](v64);
}

void sub_21DBE7718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned char *radio::RFCalibration_t::RFCalibration_t(unsigned char *this)
{
  *this = 2;
  return this;
}

{
  *this = 2;
  return this;
}

BOOL radio::RFCalibration_t::fill(uint64_t a1, const __CFDictionary **a2)
{
  CFDictionaryRef v2 = *a2;
  if (v2) {
    uint64_t v3 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v3 = 0;
  }
  if (!v3) {
    return 0;
  }
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v13, v2);
  int Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v13, @"BasebandRFCalibrationPresentStatus");
  *(unsigned char *)a1 = Bool;
  if (Bool)
  {
    *(_WORD *)(a1 + 2) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandGSMCalibrationStatus");
    *(_WORD *)(a1 + 4) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandGSMCalibrationMask");
    *(_DWORD *)(a1 + 8) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandCDMACalibrationStatus");
    *(_DWORD *)(a1 + 12) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandCDMACalibrationMask");
    *(_DWORD *)(a1 + 16) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandWCDMACalibrationStatus");
    *(_DWORD *)(a1 + 20) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandWCDMACalibrationMask");
    *(_DWORD *)(a1 + 24) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandTDSCDMACalibrationStatus");
    *(_DWORD *)(a1 + 28) = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v13, @"BasebandTDSCDMACalibrationMask");
    unint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberRef v6 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, @"BasebandLTECalibrationStatus");
    CFNumberRef v7 = v6;
    if (v6)
    {
      if (CFNumberGetValue(v6, kCFNumberSInt64Type, &valuePtr))
      {
        *(void *)(a1 + 32) = valuePtr;
        int v8 = 1;
      }
      else
      {
        int v8 = 0;
      }
      CFRelease(v7);
      unint64_t valuePtr = 0;
    }
    else
    {
      int v8 = 1;
    }
    CFNumberRef v10 = (const __CFNumber *)ctu::cf::map_adapter::copyCFNumberRef((ctu::cf::map_adapter *)v13, @"BasebandLTECalibrationMask");
    CFNumberRef v11 = v10;
    if (v10)
    {
      if (CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr)) {
        *(void *)(a1 + 40) = valuePtr;
      }
      else {
        int v8 = 0;
      }
      CFRelease(v11);
    }
  }
  else
  {
    int v8 = 0;
  }
  MEMORY[0x223C149D0](v13);
  return v8 != 0;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const char *radio::asString(_DWORD *a1)
{
  unsigned int v1 = *a1 - 1;
  if (v1 > 4) {
    return "Other";
  }
  else {
    return off_264477650[v1];
  }
}

const char *radio::asString(unsigned char *a1)
{
  unsigned int v1 = "Invalid";
  if (!*a1) {
    unsigned int v1 = "Disabled";
  }
  if (*a1 == 1) {
    return "Enabled";
  }
  else {
    return v1;
  }
}

{
  const char *v1;

  unsigned int v1 = "Invalid";
  if (!*a1) {
    unsigned int v1 = "Disabled";
  }
  if (*a1 == 1) {
    return "Enabled";
  }
  else {
    return v1;
  }
}

uint64_t radio::BasebandProperties::create(const __CFDictionary **a1)
{
  CFDictionaryRef v1 = *a1;
  if (!*a1) {
    return 0xAAAAAAAAAAAAAA00;
  }
  v7[0] = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)v7, v1);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyCoredumpSupported");
  int Bool = ctu::cf::map_adapter::getBool((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x223C14990](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyPowerSequenceIndex");
  int Int = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x223C14990](&v8);
  ctu::cf::MakeCFString::MakeCFString((ctu::cf::MakeCFString *)&v8, "kBasebandPropertyBasebandVersion");
  uint64_t v4 = ctu::cf::map_adapter::getInt((ctu::cf::map_adapter *)v7, v8);
  MEMORY[0x223C14990](&v8);
  MEMORY[0x223C149D0](v7);
  uint64_t v5 = 256;
  if (!Bool) {
    uint64_t v5 = 0;
  }
  return (Int << 16) | (unint64_t)(v4 << 32) | v5 | 1;
}

void sub_21DBE7B1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  MEMORY[0x223C14990](va1);
  MEMORY[0x223C149D0]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void radio::BasebandProperties::toDict(radio::BasebandProperties *this@<X0>, __CFDictionary **a2@<X8>)
{
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  ctu::cf::insert<char const*,BOOL>(Mutable, (const __CFString **)"kBasebandPropertyCoredumpSupported", *((unsigned __int8 *)this + 1), (uint64_t)v4, v6);
  CFNumberRef v7 = (const void *)*((unsigned __int16 *)this + 1);
  unint64_t valuePtr = 0;
  ctu::cf::convert_copy((ctu::cf *)&valuePtr, (const __CFString **)"kBasebandPropertyPowerSequenceIndex", (const char *)0x8000100, (uint64_t)v4, v8);
  uint64_t v9 = valuePtr;
  unint64_t valuePtr = v7;
  CFNumberRef v10 = CFNumberCreate(v4, kCFNumberLongLongType, &valuePtr);
  CFNumberRef v12 = v10;
  if (v9 && v10)
  {
    CFDictionaryAddValue(Mutable, v9, v10);
  }
  else if (!v10)
  {
    goto LABEL_6;
  }
  CFRelease(v12);
LABEL_6:
  if (v9) {
    CFRelease(v9);
  }
  int v13 = (const void *)*((unsigned int *)this + 1);
  unint64_t valuePtr = 0;
  ctu::cf::convert_copy((ctu::cf *)&valuePtr, (const __CFString **)"kBasebandPropertyBasebandVersion", (const char *)0x8000100, (uint64_t)v4, v11);
  unsigned int v14 = valuePtr;
  unint64_t valuePtr = v13;
  CFNumberRef v15 = CFNumberCreate(v4, kCFNumberLongLongType, &valuePtr);
  CFNumberRef v16 = v15;
  if (v14 && v15)
  {
    CFDictionaryAddValue(Mutable, v14, v15);
  }
  else if (!v15)
  {
    goto LABEL_13;
  }
  CFRelease(v16);
LABEL_13:
  if (v14) {
    CFRelease(v14);
  }
  if (Mutable)
  {
    CFTypeID v17 = CFGetTypeID(Mutable);
    if (v17 == CFDictionaryGetTypeID())
    {
      *a2 = Mutable;
      CFRetain(Mutable);
    }
    else
    {
      *a2 = 0;
    }
    CFRelease(Mutable);
  }
  else
  {
    *a2 = 0;
  }
}

void sub_21DBE7D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, const void *a11)
{
}

void sub_21DBE7D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  CFDictionaryRef v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CE7FA30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<radio::OpMode>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26CE7FA30;
  std::__shared_weak_count::~__shared_weak_count(a1);

  operator delete(v1);
}

void std::__shared_ptr_emplace<radio::OpMode>::__on_zero_shared(void *a1)
{
  CFDictionaryRef v2 = (void *)a1[4];
  a1[5] = v2;
  uint64_t v3 = (void *)a1[7];
  if (v3)
  {
    a1[8] = v3;
    operator delete(v3);
    CFDictionaryRef v2 = (void *)a1[4];
  }
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
}

uint64_t ctu::cf::insert<char const*,BOOL>(__CFDictionary *a1, const __CFString **a2, int a3, uint64_t a4, const __CFAllocator *a5)
{
  key = 0;
  ctu::cf::convert_copy((ctu::cf *)&key, a2, (const char *)0x8000100, a4, a5);
  CFNumberRef v7 = key;
  CFAllocatorRef v8 = (void **)MEMORY[0x263EFFB40];
  if (!a3) {
    CFAllocatorRef v8 = (void **)MEMORY[0x263EFFB38];
  }
  uint64_t v9 = *v8;
  key = *v8;
  if (v7) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  uint64_t v11 = !v10;
  if (v10)
  {
    if (!v9) {
      goto LABEL_13;
    }
  }
  else
  {
    CFDictionaryAddValue(a1, v7, v9);
  }
  CFRelease(v9);
LABEL_13:
  if (v7) {
    CFRelease(v7);
  }
  return v11;
}

void sub_21DBE7F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  CFDictionaryRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t radio::CommandDriver::CommandDriver(uint64_t a1, void *a2, dispatch_object_t *a3, void *a4)
{
  *(void *)a1 = &unk_26CE7FA80;
  CFNumberRef v7 = *a3;
  if (*a3) {
    dispatch_retain(*a3);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v40, "com.apple.telephony.abm", "radio.drv");
  if (v7) {
    dispatch_retain(v7);
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  uint64_t v9 = dispatch_queue_create_with_target_V2("radio.drv", initially_inactive, v7);
  dispatch_set_qos_class_floor(v9, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v9);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  *(void *)(a1 + 96) = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  if (v9) {
    dispatch_release(v9);
  }
  if (v7) {
    dispatch_release(v7);
  }
  *(void *)a1 = &unk_26CE7FD70;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v42);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v10 = a2[1];
  *(void *)(a1 + 64) = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v41);
  *(void *)a1 = &unk_26CE7FE90;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v40);
  if (v7) {
    dispatch_release(v7);
  }
  *(void *)a1 = &unk_26CE7FA80;
  *(void *)(a1 + 104) = &unk_26CE7FDB0;
  uint64_t v11 = (uint64_t *)operator new(0x28uLL);
  CFNumberRef v12 = operator new(0x20uLL);
  uint64_t v42 = (uint64_t)&v42;
  std::string v43 = &v42;
  v46 = 0;
  uint64_t v47 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v46;
  int v13 = operator new(0x40uLL);
  *int v13 = v13;
  v13[1] = v13;
  void v13[5] = 0;
  v13[4] = 0;
  void v13[2] = 0;
  v13[3] = v13 + 4;
  *(void *)CFNumberRef v12 = v13;
  *((void *)v12 + 1) = 0;
  unsigned int v14 = operator new(0x18uLL);
  v14[1] = 0x100000001;
  void *v14 = &unk_26CE7FED0;
  v14[2] = v13;
  *((void *)v12 + 1) = v14;
  CFNumberRef v15 = operator new(1uLL);
  *((void *)v12 + 2) = v15;
  *((void *)v12 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v12 + 16, (uint64_t)v15, (atomic_uint **)v12 + 3);
  uint64_t *v11 = (uint64_t)v12;
  v11[1] = 0;
  CFNumberRef v16 = operator new(0x18uLL);
  v16[1] = 0x100000001;
  *CFNumberRef v16 = &unk_26CE7FF30;
  v16[2] = v12;
  v11[1] = (uint64_t)v16;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v46);
  if (v44)
  {
    uint64_t v17 = v42;
    size_t v18 = v43;
    uint64_t v19 = *v43;
    *(void *)(v19 + 8) = *(void *)(v42 + 8);
    **(void **)(v17 + 8) = v19;
    uint64_t v44 = 0;
    if (v18 != &v42)
    {
      do
      {
        int v20 = (uint64_t *)v18[1];
        int v21 = (atomic_uint *)v18[3];
        if (v21)
        {
          if (atomic_fetch_add(v21 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v21 + 16))(v21);
            if (atomic_fetch_add(v21 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v21 + 24))(v21);
            }
          }
        }
        operator delete(v18);
        size_t v18 = v20;
      }
      while (v20 != &v42);
    }
  }
  _OWORD v11[2] = *(void *)*v11;
  uint64_t v22 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v22, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v11 + 3, (uint64_t)v22);
  *(void *)(a1 + 112) = v11;
  *(void *)(a1 + 120) = 0;
  uint64_t v23 = operator new(0x18uLL);
  v23[1] = 0x100000001;
  void *v23 = &unk_26CE7FF90;
  v23[2] = v11;
  *(void *)(a1 + 120) = v23;
  *(void *)(a1 + 128) = &unk_26CE7FE20;
  uint64_t v24 = (uint64_t *)operator new(0x28uLL);
  uint64_t v25 = operator new(0x20uLL);
  uint64_t v42 = (uint64_t)&v42;
  std::string v43 = &v42;
  v46 = 0;
  uint64_t v47 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v46;
  long long v26 = operator new(0x40uLL);
  void *v26 = v26;
  v26[1] = v26;
  v26[5] = 0;
  v26[4] = 0;
  v26[2] = 0;
  v26[3] = v26 + 4;
  *(void *)uint64_t v25 = v26;
  *((void *)v25 + 1) = 0;
  long long v27 = operator new(0x18uLL);
  v27[1] = 0x100000001;
  void *v27 = &unk_26CE7FFF0;
  v27[2] = v26;
  *((void *)v25 + 1) = v27;
  int v28 = operator new(1uLL);
  *((void *)v25 + 2) = v28;
  *((void *)v25 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v25 + 16, (uint64_t)v28, (atomic_uint **)v25 + 3);
  uint64_t *v24 = (uint64_t)v25;
  v24[1] = 0;
  int v29 = operator new(0x18uLL);
  v29[1] = 0x100000001;
  *int v29 = &unk_26CE80050;
  v29[2] = v25;
  v24[1] = (uint64_t)v29;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v46);
  if (v44)
  {
    uint64_t v30 = v42;
    uint64_t v31 = v43;
    uint64_t v32 = *v43;
    *(void *)(v32 + 8) = *(void *)(v42 + 8);
    **(void **)(v30 + 8) = v32;
    uint64_t v44 = 0;
    if (v31 != &v42)
    {
      do
      {
        long long v33 = (uint64_t *)v31[1];
        v34 = (atomic_uint *)v31[3];
        if (v34)
        {
          if (atomic_fetch_add(v34 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v34 + 16))(v34);
            if (atomic_fetch_add(v34 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v34 + 24))(v34);
            }
          }
        }
        operator delete(v31);
        uint64_t v31 = v33;
      }
      while (v33 != &v42);
    }
  }
  v24[2] = *(void *)*v24;
  unint64_t v35 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v35, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v24 + 3, (uint64_t)v35);
  *(void *)(a1 + 136) = v24;
  *(void *)(a1 + 144) = 0;
  int v36 = operator new(0x18uLL);
  v36[1] = 0x100000001;
  void *v36 = &unk_26CE800B0;
  v36[2] = v24;
  *(void *)(a1 + 216) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a1 + 144) = v36;
  *(void *)(a1 + 152) = a1 + 152;
  *(void *)(a1 + 160) = a1 + 152;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = a1 + 176;
  *(void *)(a1 + 184) = a1 + 176;
  *(void *)(a1 + 200) = 0;
  *(void *)(a1 + 208) = 0;
  *(void *)(a1 + 192) = 0;
  *(void *)(a1 + 224) = 0xAAAAAAAAAAAAAAAALL;
  int v37 = (char *)operator new(0x50uLL);
  *((void *)v37 + 1) = 0;
  *((void *)v37 + 2) = 0;
  *(void *)int v37 = &unk_26CE7FA30;
  *(_OWORD *)(v37 + 40) = 0u;
  *(_OWORD *)(v37 + 56) = 0u;
  *((void *)v37 + 9) = 0;
  *(_OWORD *)(v37 + 24) = 0u;
  *(void *)(a1 + 216) = v37 + 24;
  *(void *)(a1 + 224) = v37;
  radio::OpMode::init((radio::OpMode *)(v37 + 24));
  *(void *)(a1 + 232) = *a4;
  uint64_t v38 = a4[1];
  *(void *)(a1 + 240) = v38;
  if (v38) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v38 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 248) = 0;
  *(void *)(a1 + 256) = 0;
  *(unsigned char *)(a1 + 287) = 9;
  strcpy((char *)(a1 + 264), "radio.drv");
  return a1;
}

void sub_21DBE8690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v14);
  dispatch::callback<void({block_pointer})(BOOL,std::vector<unsigned char>,std::vector<unsigned char>,std::vector<unsigned char>)>::~callback((uint64_t)(v10 + 25));
  std::list<dispatch::block<BOOL({block_pointer})(BOOL)>>::~list(v12);
  std::list<dispatch::block<BOOL({block_pointer})(radio::OperatingMode)>>::~list(v11);
  boost::signals2::signal<void (),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::~signal(v13);
  boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::~signal(a10);
  ctu::SharedLoggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v10);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(BOOL,std::vector<unsigned char>,std::vector<unsigned char>,std::vector<unsigned char>)>::~callback(uint64_t a1)
{
  CFDictionaryRef v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

uint64_t *std::list<dispatch::block<BOOL({block_pointer})(BOOL)>>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        CFNumberRef v7 = (uint64_t *)v3[1];
        CFAllocatorRef v6 = (const void *)v3[2];
        if (v6) {
          _Block_release(v6);
        }
        operator delete(v3);
        uint64_t v3 = v7;
      }
      while (v7 != a1);
    }
  }
  return a1;
}

uint64_t *std::list<dispatch::block<BOOL({block_pointer})(radio::OperatingMode)>>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        CFNumberRef v7 = (uint64_t *)v3[1];
        CFAllocatorRef v6 = (const void *)v3[2];
        if (v6) {
          _Block_release(v6);
        }
        operator delete(v3);
        uint64_t v3 = v7;
      }
      while (v7 != a1);
    }
  }
  return a1;
}

void *boost::signals2::signal<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE7FE20;
  uint64_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE7FDB0;
  uint64_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *ctu::SharedLoggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7FD70;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE7FD70;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t radio::CommandDriver::getName(radio::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 264;
  if (*((char *)this + 287) < 0) {
    return *(void *)result;
  }
  return result;
}

void *radio::CommandDriver::watchOperatingMode_sync(uint64_t a1, void **a2)
{
  uint64_t v4 = operator new(0x18uLL);
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t result = *a2;
  if (*a2) {
    uint64_t result = _Block_copy(result);
  }
  uint64_t v7 = *(void *)(a1 + 152);
  CFAllocatorRef v6 = (void *)(a1 + 152);
  v4[1] = v6;
  v4[2] = result;
  *uint64_t v4 = v7;
  *(void *)(v7 + 8) = v4;
  void *v6 = v4;
  ++v6[2];
  return result;
}

void radio::CommandDriver::watchOperatingMode(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    uint64_t v4 = _Block_copy(*(const void **)a2);
    uint64_t v5 = *(NSObject **)(a2 + 8);
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(NSObject **)(a2 + 8);
  if (v5) {
LABEL_3:
  }
    dispatch_retain(v5);
LABEL_4:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_1;
  if (v4)
  {
    CFNumberRef v12 = _Block_copy(v4);
    dispatch_object_t object = v5;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  CFNumberRef v12 = 0;
  dispatch_object_t object = v5;
  if (v5) {
LABEL_6:
  }
    dispatch_retain(v5);
LABEL_7:
  CFAllocatorRef v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1174405120;
  v9[2] = ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_3;
  v9[3] = &__block_descriptor_tmp_5;
  v9[4] = a1;
  if (v6) {
    CFAllocatorRef v8 = _Block_copy(v6);
  }
  else {
    CFAllocatorRef v8 = 0;
  }
  uint64_t v10 = v8;
  ctu::SharedSynchronizable<radio::CommandDriver>::execute_wrapped((uint64_t *)(a1 + 72), (uint64_t)v9);
  if (v10) {
    _Block_release(v10);
  }
  if (v7) {
    _Block_release(v7);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v12) {
    _Block_release(v12);
  }
  if (v5) {
    dispatch_release(v5);
  }
  if (v4) {
    _Block_release(v4);
  }
}

uint64_t ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke(uint64_t a1, int a2)
{
  if (!*(void *)(a1 + 32) || !*(void *)(a1 + 40)) {
    return 0;
  }
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  block[0] = @"KeyBasebandOperatingMode";
  if (@"KeyBasebandOperatingMode") {
    CFRetain(@"KeyBasebandOperatingMode");
  }
  int valuePtr = a2;
  CFNumberRef v6 = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
  CFNumberRef v7 = v6;
  CFNumberRef v17 = v6;
  if (@"KeyBasebandOperatingMode") {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    CFDictionaryAddValue(Mutable, @"KeyBasebandOperatingMode", v6);
LABEL_13:
    CFRelease(v7);
    goto LABEL_14;
  }
  if (v6) {
    goto LABEL_13;
  }
LABEL_14:
  if (@"KeyBasebandOperatingMode") {
    CFRelease(@"KeyBasebandOperatingMode");
  }
  if (Mutable) {
    CFRetain(Mutable);
  }
  uint64_t v10 = *(const void **)(a1 + 32);
  if (v10) {
    uint64_t v11 = _Block_copy(v10);
  }
  else {
    uint64_t v11 = 0;
  }
  CFNumberRef v12 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEclIJS5_NS3_IS6_EEEEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_123;
  if (v11)
  {
    aBlock = _Block_copy(v11);
    CFTypeRef v15 = 0;
    CFTypeRef cf = Mutable;
    if (!Mutable) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  aBlock = 0;
  CFTypeRef v15 = 0;
  CFTypeRef cf = Mutable;
  if (Mutable) {
LABEL_25:
  }
    CFRetain(Mutable);
LABEL_26:
  dispatch_async(v12, block);
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v11) {
    _Block_release(v11);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
    CFRelease(Mutable);
  }
  return 1;
}

void sub_21DBE9A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, const void *a17)
{
}

void sub_21DBE9A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void sub_21DBE9AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

void sub_21DBE9ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void __copy_helper_block_e8_32c103_ZTSN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v4 = *(void **)(a2 + 32);
  if (v4) {
    CFAllocatorRef v4 = _Block_copy(v4);
  }
  uint64_t v5 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  if (v5)
  {
    dispatch_retain(v5);
  }
}

void __destroy_helper_block_e8_32c103_ZTSN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

void ___ZN5radio13CommandDriver18watchOperatingModeEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CFDictionaryRef v1 = *(const void **)(a1 + 40);
  if (v1) {
    uint64_t v3 = _Block_copy(v1);
  }
  else {
    uint64_t v3 = 0;
  }
  CFAllocatorRef v4 = operator new(0x18uLL);
  *CFAllocatorRef v4 = 0;
  v4[1] = 0;
  if (v3) {
    uint64_t v5 = _Block_copy(v3);
  }
  else {
    uint64_t v5 = 0;
  }
  v4[2] = v5;
  uint64_t v7 = *(void *)(v2 + 152);
  CFNumberRef v6 = (void *)(v2 + 152);
  *CFAllocatorRef v4 = v7;
  v4[1] = v6;
  *(void *)(v7 + 8) = v4;
  void *v6 = v4;
  ++v6[2];
  if (v3) {
    _Block_release(v3);
  }
}

void sub_21DBE9C04(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_40c65_ZTSN8dispatch5blockIU13block_pointerFbN5radio13OperatingModeEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c65_ZTSN8dispatch5blockIU13block_pointerFbN5radio13OperatingModeEEEE(uint64_t a1)
{
  CFDictionaryRef v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void radio::CommandDriver::handleOperatingModeChanged_sync(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    if (a2 > 7) {
      int v20 = "Unknown";
    }
    else {
      int v20 = off_264477738[(char)a2];
    }
    LODWORD(v21) = 136315138;
    *(void *)((char *)&v21 + 4) = v20;
    _os_log_debug_impl(&dword_21DBD9000, v4, OS_LOG_TYPE_DEBUG, "#D Notifying operating mode: %s", (uint8_t *)&v21, 0xCu);
  }
  uint64_t v5 = a1 + 152;
  uint64_t v22 = *(void *)(a1 + 168);
  uint64_t v6 = v22;
  long long v21 = *(_OWORD *)(a1 + 152);
  *(void *)(a1 + 152) = &v21;
  *(void *)(a1 + 160) = &v21;
  *(void *)(a1 + 168) = 0;
  if (v6)
  {
    **((void **)&v21 + 1) = &v21;
    uint64_t v7 = (void *)(v21 + 8);
  }
  else
  {
    uint64_t v7 = (void *)&v21 + 1;
    *(void *)&long long v21 = &v21;
  }
  void *v7 = &v21;
  *(void *)(a1 + 152) = a1 + 152;
  *(void *)(a1 + 160) = v5;
  uint64_t v8 = *((void *)&v21 + 1);
  if (*((long long **)&v21 + 1) != &v21)
  {
    do
    {
      uint64_t v9 = *(const void **)(v8 + 16);
      if (v9) {
        uint64_t v10 = _Block_copy(v9);
      }
      else {
        uint64_t v10 = 0;
      }
      if ((*((unsigned int (**)(void *, uint64_t))v10 + 2))(v10, a2))
      {
        uint64_t v11 = _Block_copy(v10);
        CFNumberRef v12 = operator new(0x18uLL);
        void *v12 = 0;
        v12[1] = 0;
        int v13 = v11 ? _Block_copy(v11) : 0;
        v12[1] = v5;
        v12[2] = v13;
        uint64_t v14 = *(void *)(a1 + 152);
        void *v12 = v14;
        *(void *)(v14 + 8) = v12;
        *(void *)(a1 + 152) = v12;
        ++*(void *)(a1 + 168);
        if (v11) {
          _Block_release(v11);
        }
      }
      _Block_release(v10);
      uint64_t v8 = *(void *)(v8 + 8);
    }
    while ((long long *)v8 != &v21);
    uint64_t v6 = v22;
  }
  if (v6)
  {
    CFNumberRef v16 = (long long *)*((void *)&v21 + 1);
    uint64_t v15 = v21;
    uint64_t v17 = **((void **)&v21 + 1);
    *(void *)(v17 + 8) = *(void *)(v21 + 8);
    **(void **)(v15 + 8) = v17;
    uint64_t v22 = 0;
    if (v16 != &v21)
    {
      do
      {
        uint64_t v19 = (long long *)*((void *)v16 + 1);
        size_t v18 = (const void *)*((void *)v16 + 2);
        if (v18) {
          _Block_release(v18);
        }
        operator delete(v16);
        CFNumberRef v16 = v19;
      }
      while (v19 != &v21);
    }
  }
}

void sub_21DBE9EA8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void *radio::CommandDriver::watchClientState_sync(void *result, const void **a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    uint64_t v3 = result;
    CFAllocatorRef v4 = operator new(0x18uLL);
    *CFAllocatorRef v4 = 0;
    v4[1] = 0;
    uint64_t result = _Block_copy(v2);
    uint64_t v5 = v3[22];
    v3 += 22;
    v4[1] = v3;
    v4[2] = result;
    *CFAllocatorRef v4 = v5;
    *(void *)(v5 + 8) = v4;
    void *v3 = v4;
    ++v3[2];
  }
  return result;
}

void radio::CommandDriver::handleClientStateChanged_sync(radio::CommandDriver *this, uint64_t a2)
{
  CFAllocatorRef v4 = (char *)this + 176;
  uint64_t v21 = *((void *)this + 24);
  uint64_t v5 = v21;
  long long v20 = *((_OWORD *)this + 11);
  *((void *)this + 22) = &v20;
  *((void *)this + 23) = &v20;
  *((void *)this + 24) = 0;
  if (v5)
  {
    **((void **)&v20 + 1) = &v20;
    uint64_t v6 = (void *)(v20 + 8);
  }
  else
  {
    uint64_t v6 = (void *)&v20 + 1;
    *(void *)&long long v20 = &v20;
  }
  void *v6 = &v20;
  *((void *)this + 22) = (char *)this + 176;
  *((void *)this + 23) = v4;
  for (uint64_t i = *((void *)&v20 + 1); (long long *)i != &v20; uint64_t i = *(void *)(i + 8))
  {
    uint64_t v8 = *(const void **)(i + 16);
    if (v8) {
      uint64_t v9 = _Block_copy(v8);
    }
    else {
      uint64_t v9 = 0;
    }
    if ((*((unsigned int (**)(void *, uint64_t))v9 + 2))(v9, a2))
    {
      uint64_t v10 = _Block_copy(v9);
      if (v10)
      {
        uint64_t v11 = operator new(0x18uLL);
        void *v11 = 0;
        v11[1] = 0;
        CFNumberRef v12 = _Block_copy(v10);
        v11[1] = v4;
        _OWORD v11[2] = v12;
        uint64_t v13 = *((void *)this + 22);
        void *v11 = v13;
        *(void *)(v13 + 8) = v11;
        *((void *)this + 22) = v11;
        ++*((void *)this + 24);
        _Block_release(v10);
      }
    }
    _Block_release(v9);
  }
  if ((a2 & 1) == 0)
  {
    uint64_t v14 = *((void *)this + 27);
    *(unsigned char *)uint64_t v14 = 8;
    *(_WORD *)(v14 + 2) = 0;
  }
  if (v21)
  {
    CFNumberRef v16 = (long long *)*((void *)&v20 + 1);
    uint64_t v15 = v20;
    uint64_t v17 = **((void **)&v20 + 1);
    *(void *)(v17 + 8) = *(void *)(v20 + 8);
    **(void **)(v15 + 8) = v17;
    uint64_t v21 = 0;
    if (v16 != &v20)
    {
      do
      {
        uint64_t v19 = (long long *)*((void *)v16 + 1);
        size_t v18 = (const void *)*((void *)v16 + 2);
        if (v18) {
          _Block_release(v18);
        }
        operator delete(v16);
        CFNumberRef v16 = v19;
      }
      while (v19 != &v20);
    }
  }
}

void sub_21DBEA11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_release(v10);
  _Block_release(v9);
  std::list<dispatch::block<BOOL({block_pointer})(BOOL)>>::~list(&a9);
  _Unwind_Resume(a1);
}

void radio::CommandDriver::watchClientState(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2)
  {
    CFAllocatorRef v4 = _Block_copy(*(const void **)a2);
    uint64_t v5 = *(NSObject **)(a2 + 8);
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  CFAllocatorRef v4 = 0;
  uint64_t v5 = *(NSObject **)(a2 + 8);
  if (v5) {
LABEL_3:
  }
    dispatch_retain(v5);
LABEL_4:
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_9;
  if (v4)
  {
    CFNumberRef v12 = _Block_copy(v4);
    dispatch_object_t object = v5;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  CFNumberRef v12 = 0;
  dispatch_object_t object = v5;
  if (v5) {
LABEL_6:
  }
    dispatch_retain(v5);
LABEL_7:
  uint64_t v6 = _Block_copy(aBlock);
  uint64_t v7 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 1174405120;
  v9[2] = ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_10;
  v9[3] = &__block_descriptor_tmp_11;
  v9[4] = a1;
  if (v6) {
    uint64_t v8 = _Block_copy(v6);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v10 = v8;
  ctu::SharedSynchronizable<radio::CommandDriver>::execute_wrapped((uint64_t *)(a1 + 72), (uint64_t)v9);
  if (v10) {
    _Block_release(v10);
  }
  if (v7) {
    _Block_release(v7);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v12) {
    _Block_release(v12);
  }
  if (v5) {
    dispatch_release(v5);
  }
  if (v4) {
    _Block_release(v4);
  }
}

uint64_t ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke(uint64_t a1, int a2)
{
  if (!*(void *)(a1 + 32) || !*(void *)(a1 + 40)) {
    return 0;
  }
  uint64_t v4 = *MEMORY[0x263EFFB08];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 1, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  ctu::cf::insert<char const*,BOOL>(Mutable, (const __CFString **)"kKeyTransportClientStarted", a2, v4, v6);
  if (Mutable) {
    CFRetain(Mutable);
  }
  uint64_t v7 = *(const void **)(a1 + 32);
  if (v7) {
    uint64_t v8 = _Block_copy(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v10 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEclIJS5_NS3_IS6_EEEEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_123;
  if (v8)
  {
    aBlock = _Block_copy(v8);
    CFTypeRef v13 = 0;
    CFTypeRef cf = Mutable;
    if (!Mutable) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  aBlock = 0;
  CFTypeRef v13 = 0;
  CFTypeRef cf = Mutable;
  if (Mutable) {
LABEL_13:
  }
    CFRetain(Mutable);
LABEL_14:
  dispatch_async(v10, block);
  if (cf) {
    CFRelease(cf);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v8) {
    _Block_release(v8);
  }
  if (Mutable)
  {
    CFRelease(Mutable);
    CFRelease(Mutable);
  }
  return 1;
}

void sub_21DBEA4E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void ___ZN5radio13CommandDriver16watchClientStateEN8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS5_IK14__CFDictionaryEEEEE_block_invoke_10(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = _Block_copy(v2);
    if (v4)
    {
      uint64_t v5 = operator new(0x18uLL);
      *uint64_t v5 = 0;
      v5[1] = 0;
      _OWORD v5[2] = _Block_copy(v4);
      uint64_t v7 = *(void *)(v3 + 176);
      CFAllocatorRef v6 = (void *)(v3 + 176);
      *uint64_t v5 = v7;
      v5[1] = v6;
      *(void *)(v7 + 8) = v5;
      void *v6 = v5;
      ++v6[2];
      _Block_release(v4);
    }
  }
}

void sub_21DBEA57C(_Unwind_Exception *a1)
{
  _Block_release(v1);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFbbEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 40);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSN8dispatch5blockIU13block_pointerFbbEEE(uint64_t a1)
{
  CFDictionaryRef v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t radio::CommandDriver::getSimSlotInfo(uint64_t a1, uint64_t *a2)
{
  if ((*((char *)a2 + 23) & 0x80000000) == 0)
  {
    uint64_t v2 = *((unsigned __int8 *)a2 + 23);
    if (v2 > 2)
    {
      unint64_t v3 = v2 - 3;
      goto LABEL_7;
    }
LABEL_19:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  unint64_t v4 = a2[1];
  BOOL v5 = v4 >= 3;
  unint64_t v3 = v4 - 3;
  if (!v5) {
    goto LABEL_19;
  }
  a2 = (uint64_t *)*a2;
LABEL_7:
  if (*(_WORD *)((char *)a2 + v3) == 12579 && *((unsigned char *)a2 + v3 + 2) == 35) {
    return 2;
  }
  uint64_t v7 = (unsigned __int16 *)((char *)a2 + v3);
  int v8 = *v7;
  int v9 = *((unsigned __int8 *)v7 + 2);
  return v8 == 12323 && v9 == 35;
}

uint64_t ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (const char *)(a1 + 264);
  if (*(char *)(a1 + 287) < 0) {
    unint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7FD70;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE7FD70;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_264476988, MEMORY[0x263F8C068]);
}

void sub_21DBEA844(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  size_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE7FDB0;
  uint64_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

void boost::signals2::signal<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE7FE20;
  uint64_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

void ctu::SharedLoggable<radio::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE7FD70;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  unint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    unint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        unint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      unint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          uint64_t v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          unint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    unint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    unint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(ctu::cf::CFSharedRef<__CFDictionary const>),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::function<void ()(boost::signals2::connection const&,ctu::cf::CFSharedRef<__CFDictionary const>)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    unint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        unint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      unint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          uint64_t v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          unint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(unsigned int),boost::function<void ()(unsigned int)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    unint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    unint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(unsigned int),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(unsigned int)>,boost::function<void ()(boost::signals2::connection const&,unsigned int)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEclIJS5_NS3_IS6_EEEEEvDpT__block_invoke(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (const void *)a1[5];
  CFTypeRef v7 = v2;
  if (v2) {
    CFRetain(v2);
  }
  uint64_t v4 = (const void *)a1[6];
  if (v4 && (CFTypeID v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
  {
    CFTypeRef cf = v4;
    CFRetain(v4);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  (*(void (**)(uint64_t, CFTypeRef *, CFTypeRef *))(v3 + 16))(v3, &v7, &cf);
  if (cf) {
    CFRelease(cf);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_21DBEB908(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf, CFTypeRef a10)
{
  if (cf) {
    CFRelease(cf);
  }
  if (a10) {
    CFRelease(a10);
  }
  _Unwind_Resume(exception_object);
}

CFTypeRef __copy_helper_block_e8_32c100_ZTSN8dispatch5blockIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE40c38_ZTSN3ctu2cf11CFSharedRefI9__CFErrorEE48c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(void *a1, void *a2)
{
  uint64_t v4 = (const void *)a2[4];
  if (!v4)
  {
    uint64_t v6 = (const void *)a2[5];
    a1[4] = 0;
    a1[5] = v6;
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  CFTypeID v5 = _Block_copy(v4);
  uint64_t v6 = (const void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  if (v6) {
LABEL_5:
  }
    CFRetain(v6);
LABEL_6:
  CFTypeRef result = (CFTypeRef)a2[6];
  a1[6] = result;
  if (result) {
    return CFRetain(result);
  }
  return result;
}

void __destroy_helper_block_e8_32c100_ZTSN8dispatch5blockIU13block_pointerFvN3ctu2cf11CFSharedRefI9__CFErrorEENS3_IK14__CFDictionaryEEEEE40c38_ZTSN3ctu2cf11CFSharedRefI9__CFErrorEE48c44_ZTSN3ctu2cf11CFSharedRefI14__CFDictionaryEE(void *a1)
{
  uint64_t v2 = (const void *)a1[6];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[5];
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)a1[4];
  if (v4) {
    _Block_release(v4);
  }
}

void ctu::SharedSynchronizable<radio::CommandDriver>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  CFTypeRef v7 = v6;
  int v8 = a1[2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN5radio13CommandDriverEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_26CE80138;
  void block[5] = v5;
  CFNumberRef v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  uint64_t v10 = v12;
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_8:
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_8;
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableIN5radio13CommandDriverEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIKN5radio13CommandDriverEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c50_ZTSNSt3__110shared_ptrIKN5radio13CommandDriverEEE(uint64_t a1)
{
  CFDictionaryRef v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t data::CommandDriver::CommandDriver(uint64_t a1, void *a2, void *a3)
{
  *(void *)a1 = &unk_26CE80178;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v19, "com.apple.telephony.abm", "data.drv");
  uint64_t v6 = dispatch_queue_create("data.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    CFTypeRef v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE80290;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v18);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v17);
  *(void *)a1 = &unk_26CE802D0;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v19);
  *(void *)a1 = &unk_26CE80178;
  *(void *)(a1 + 104) = *a3;
  uint64_t v9 = a3[1];
  *(void *)(a1 + 112) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *((unsigned char *)&v17.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v17, "data.drv");
  uint64_t v10 = std::string::append(&v17, "::", 2uLL);
  long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v11;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  CFNumberRef v12 = getprogname();
  size_t v13 = strlen(v12);
  uint64_t v14 = std::string::append(&v18, v12, v13);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  *(void *)(a1 + 136) = *((void *)&v14->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 120) = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v18.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v17.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_12:
    operator delete(v17.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_12;
  }
  return a1;
}

void sub_21DBEBE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if ((a15 & 0x80000000) == 0)
  {
    std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
    ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

void *ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80290;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE80290;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t data::CommandDriver::getName(data::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 120;
  if (*((char *)this + 143) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80290;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80290;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void ctu::SharedLoggable<data::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80290;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

uint64_t radio::RFSCommandDriver::RFSCommandDriver(uint64_t a1, void *a2, void *a3)
{
  *(void *)a1 = &unk_26CE80310;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v31, "com.apple.telephony.abm", "rfs.drv");
  uint64_t v6 = dispatch_queue_create("rfs.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE80418;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v32);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v30);
  *(void *)a1 = &unk_26CE80458;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v31);
  *(void *)a1 = &unk_26CE80310;
  *(void *)(a1 + 104) = &unk_26CE80498;
  uint64_t v9 = (uint64_t *)operator new(0x28uLL);
  uint64_t v10 = operator new(0x20uLL);
  v32.__r_.__value_.__r.__words[0] = (std::string::size_type)&v32;
  *(_OWORD *)&v32.__r_.__value_.__r.__words[1] = (unint64_t)&v32;
  v34[0] = 0;
  v34[1] = 0;
  long long v33 = v34;
  long long v11 = operator new(0x40uLL);
  void *v11 = v11;
  v11[1] = v11;
  v11[5] = 0;
  v11[4] = 0;
  _OWORD v11[2] = 0;
  v11[3] = v11 + 4;
  *(void *)uint64_t v10 = v11;
  *((void *)v10 + 1) = 0;
  CFNumberRef v12 = operator new(0x18uLL);
  v12[1] = 0x100000001;
  void *v12 = &unk_26CE80508;
  v12[2] = v11;
  *((void *)v10 + 1) = v12;
  size_t v13 = operator new(1uLL);
  *((void *)v10 + 2) = v13;
  *((void *)v10 + 3) = 0;
  boost::detail::sp_pointer_construct<boost::signals2::optional_last_value<void>,boost::signals2::optional_last_value<void>>((uint64_t)v10 + 16, (uint64_t)v13, (atomic_uint **)v10 + 3);
  uint64_t *v9 = (uint64_t)v10;
  v9[1] = 0;
  uint64_t v14 = operator new(0x18uLL);
  v14[1] = 0x100000001;
  void *v14 = &unk_26CE80568;
  v14[2] = v10;
  v9[1] = (uint64_t)v14;
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v34[0]);
  if (v32.__r_.__value_.__r.__words[2])
  {
    size = (std::string *)v32.__r_.__value_.__l.__size_;
    std::string::size_type v15 = v32.__r_.__value_.__r.__words[0];
    uint64_t v17 = *(void *)v32.__r_.__value_.__l.__size_;
    *(void *)(v17 + 8) = *(void *)(v32.__r_.__value_.__r.__words[0] + 8);
    **(void **)(v15 + 8) = v17;
    v32.__r_.__value_.__r.__words[2] = 0;
    if (size != &v32)
    {
      do
      {
        std::string v18 = (std::string *)size->__r_.__value_.__l.__size_;
        data = (atomic_uint *)size[1].__r_.__value_.__l.__data_;
        if (data)
        {
          if (atomic_fetch_add(data + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)data + 16))(data);
            if (atomic_fetch_add(data + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)data + 24))(data);
            }
          }
        }
        operator delete(size);
        size = v18;
      }
      while (v18 != &v32);
    }
  }
  v9[2] = *(void *)*v9;
  long long v20 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v20, 0);
  boost::shared_ptr<boost::signals2::mutex>::shared_ptr<boost::signals2::mutex>(v9 + 3, (uint64_t)v20);
  *(void *)(a1 + 112) = v9;
  *(void *)(a1 + 120) = 0;
  uint64_t v21 = operator new(0x18uLL);
  v21[1] = 0x100000001;
  void *v21 = &unk_26CE805C8;
  v21[2] = v9;
  *(void *)(a1 + 128) = *a3;
  *(void *)(a1 + 120) = v21;
  uint64_t v22 = a3[1];
  *(void *)(a1 + 136) = v22;
  if (v22) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
  }
  *((unsigned char *)&v30.__r_.__value_.__s + 23) = 7;
  strcpy((char *)&v30, "rfs.drv");
  uint64_t v23 = std::string::append(&v30, "::", 2uLL);
  long long v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
  v32.__r_.__value_.__r.__words[2] = v23->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v24;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  uint64_t v25 = getprogname();
  size_t v26 = strlen(v25);
  long long v27 = std::string::append(&v32, v25, v26);
  long long v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
  *(void *)(a1 + 160) = *((void *)&v27->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 144) = v28;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v30.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_20:
    operator delete(v30.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_20;
  }
  return a1;
}

void sub_21DBEC64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::~signal(v25);
  ctu::SharedLoggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

void *boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_26CE80498;
  uint64_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *ctu::SharedLoggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80418;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE80418;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void radio::RFSCommandDriver::~RFSCommandDriver(void **this)
{
  *this = &unk_26CE80310;
  if (*((char *)this + 167) < 0) {
    operator delete(this[18]);
  }
  uint64_t v2 = (std::__shared_weak_count *)this[17];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    this[13] = &unk_26CE80498;
    uint64_t v3 = (atomic_uint *)this[15];
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    this[13] = &unk_26CE80498;
    uint64_t v3 = (atomic_uint *)this[15];
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
  {
    (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
    if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
    }
  }
LABEL_10:
  *this = &unk_26CE80418;
  MEMORY[0x223C14900](this + 1);
  uint64_t v4 = this[12];
  if (v4) {
    dispatch_release(v4);
  }
  size_t v5 = this[11];
  if (v5) {
    dispatch_release(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)this[10];
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

uint64_t radio::RFSCommandDriver::getName(radio::RFSCommandDriver *this)
{
  uint64_t result = (uint64_t)this + 144;
  if (*((char *)this + 167) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 144);
  if (*(char *)(a1 + 167) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80418;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80418;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void ctu::SharedLoggable<radio::RFSCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80418;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::~signal(void *__p)
{
  void *__p = &unk_26CE80498;
  uint64_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }

  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        size_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          size_t v5 = (uint64_t *)v3[1];
          uint64_t v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          uint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(BOOL),boost::function<void ()(BOOL)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  CFDictionaryRef v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(BOOL),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(BOOL)>,boost::function<void ()(boost::signals2::connection const&,BOOL)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t diag::CommandDriver::CommandDriver(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  *(void *)a1 = &unk_26CE80628;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v23, "com.apple.telephony.abm", "diag.drv");
  uint64_t v8 = dispatch_queue_create("diag.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v8;
  if (v8)
  {
    uint64_t v9 = v8;
    dispatch_retain(v8);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v9);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE80710;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v22);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v10 = a2[1];
  *(void *)(a1 + 64) = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v21);
  *(void *)a1 = &unk_26CE80750;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v23);
  *(void *)a1 = &unk_26CE80628;
  long long v11 = *(void **)a3;
  if (*(void *)a3) {
    long long v11 = _Block_copy(v11);
  }
  *(void *)(a1 + 104) = v11;
  CFNumberRef v12 = *(NSObject **)(a3 + 8);
  *(void *)(a1 + 112) = v12;
  if (v12) {
    dispatch_retain(v12);
  }
  *(void *)(a1 + 120) = *a4;
  uint64_t v13 = a4[1];
  *(void *)(a1 + 128) = v13;
  if (v13) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
  }
  *((unsigned char *)&v21.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v21, "diag.drv");
  uint64_t v14 = std::string::append(&v21, "::", 2uLL);
  long long v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  v22.__r_.__value_.__r.__words[2] = v14->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v22.__r_.__value_.__l.__data_ = v15;
  v14->__r_.__value_.__l.__size_ = 0;
  v14->__r_.__value_.__r.__words[2] = 0;
  v14->__r_.__value_.__r.__words[0] = 0;
  CFNumberRef v16 = getprogname();
  size_t v17 = strlen(v16);
  std::string v18 = std::string::append(&v22, v16, v17);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  *(void *)(a1 + 152) = *((void *)&v18->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 136) = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v22.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_16:
    operator delete(v21.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_16;
  }
  return a1;
}

void sub_21DBEDBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v25);
  dispatch::callback<void({block_pointer})(diag::CommandDriver::Event,dispatch::group_session)>::~callback(v24);
  ctu::SharedLoggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(v23);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(diag::CommandDriver::Event,dispatch::group_session)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void *ctu::SharedLoggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80710;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE80710;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t diag::CommandDriver::getName(diag::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 136;
  if (*((char *)this + 159) < 0) {
    return *(void *)result;
  }
  return result;
}

const char *diag::CommandDriver::asString(unsigned int a1)
{
  if (a1 > 6) {
    return "Unknown";
  }
  else {
    return off_264477788[a1];
  }
}

void diag::CommandDriver::notifyOfEvent_sync(void *a1, unsigned int a2, dispatch_object_t *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (const void *)a1[13];
  if (!v4 || !a1[14]) {
    return;
  }
  uint64_t v6 = *a3;
  if (*a3 && (dispatch_retain(*a3), dispatch_group_enter(v6), (uint64_t v4 = (const void *)a1[13]) == 0)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = _Block_copy(v4);
  }
  uint64_t v8 = a1[14];
  *(void *)&long long v11 = MEMORY[0x263EF8330];
  *((void *)&v11 + 1) = 1174405120;
  CFNumberRef v12 = ___ZNK8dispatch8callbackIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEclIJS3_S4_EEEvDpT__block_invoke;
  uint64_t v13 = &__block_descriptor_tmp_2;
  if (!v7)
  {
    unsigned int v16 = a2;
    aBlock = 0;
    dispatch_group_t group = v6;
    if (!v6) {
      goto LABEL_13;
    }
LABEL_11:
    dispatch_retain(v6);
    if (group) {
      dispatch_group_enter(group);
    }
    goto LABEL_13;
  }
  unsigned int v16 = a2;
  aBlock = _Block_copy(v7);
  dispatch_group_t group = v6;
  if (v6) {
    goto LABEL_11;
  }
LABEL_13:
  dispatch_async(v8, &v11);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v7) {
    _Block_release(v7);
  }
  if (v6)
  {
    dispatch_group_leave(v6);
    dispatch_release(v6);
  }
  uint64_t v9 = a1[5];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (a2 > 6) {
      uint64_t v10 = "Unknown";
    }
    else {
      uint64_t v10 = off_264477788[a2];
    }
    LODWORD(v11) = 136315138;
    *(void *)((char *)&v11 + 4) = v10;
    _os_log_impl(&dword_21DBD9000, v9, OS_LOG_TYPE_DEFAULT, "#I %s", (uint8_t *)&v11, 0xCu);
  }
}

void sub_21DBEDF2C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 136);
  if (*(char *)(a1 + 159) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80710;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80710;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void ctu::SharedLoggable<diag::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80710;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEclIJS3_S4_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(a1 + 40);
  dispatch_group_t group = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v3);
  }
  (*(void (**)(uint64_t, uint64_t, dispatch_group_t *))(v2 + 16))(v2, v1, &group);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
}

void sub_21DBEE21C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_group_t group)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  _Unwind_Resume(exception_object);
}

void __copy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 32);
  if (v4) {
    uint64_t v4 = _Block_copy(v4);
  }
  size_t v5 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  if (v5)
  {
    dispatch_retain(v5);
    uint64_t v6 = *(NSObject **)(a1 + 40);
    if (v6)
    {
      dispatch_group_enter(v6);
    }
  }
}

void __destroy_helper_block_e8_32c89_ZTSN8dispatch5blockIU13block_pointerFvN4diag13CommandDriver5EventENS_13group_sessionEEEE40c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 40);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(const void **)(a1 + 32);
  if (v4) {
    _Block_release(v4);
  }
}

uint64_t logs::CommandDriver::CommandDriver(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, const void **a6, void *a7)
{
  *(void *)a1 = &unk_26CE807C0;
  int v7 = *((char *)a6 + 23);
  if (v7 >= 0) {
    size_t v8 = *((unsigned __int8 *)a6 + 23);
  }
  else {
    size_t v8 = (size_t)a6[1];
  }
  unint64_t v9 = v8 + 12;
  memset(v44, 170, sizeof(v44));
  if (v8 + 12 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v9 > 0x16)
  {
    uint64_t v15 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v15 = v9 | 7;
    }
    size_t v16 = v15 + 1;
    uint64_t v17 = operator new(v15 + 1);
    unint64_t v18 = v16 | 0x8000000000000000;
    v44[1] = (void *)(v8 + 12);
    v44[2] = (void *)(v16 | 0x8000000000000000);
    v44[0] = v17;
    long long v19 = v17 + 3;
    v17[2] = 779249014;
    *(void *)uint64_t v17 = *(void *)"logs.driver.";
    if (v7 >= 0) {
      uint64_t v13 = a6;
    }
    else {
      uint64_t v13 = *a6;
    }
    memmove(v17 + 3, v13, v8);
    *((unsigned char *)v19 + v8) = 0;
    p_p = (long long *)operator new(v16);
    *((void *)&__p + 1) = v8 + 12;
    uint64_t v43 = v18;
    *(void *)&long long __p = p_p;
    *((_DWORD *)p_p + 2) = 779249014;
    *(void *)p_p = *(void *)"logs.driver.";
    goto LABEL_17;
  }
  v44[2] = 0;
  HIBYTE(v44[2]) = v8 + 12;
  BYTE5(v44[1]) = 0;
  HIWORD(v44[1]) = 0;
  strcpy((char *)v44, "logs.driver.");
  if (v8)
  {
    if (v7 >= 0) {
      uint64_t v13 = a6;
    }
    else {
      uint64_t v13 = *a6;
    }
    memmove((char *)&v44[1] + 4, v13, v8);
    *((unsigned char *)&v44[1] + v8 + 4) = 0;
    uint64_t v43 = 0;
    HIBYTE(v43) = v8 + 12;
    strcpy((char *)&__p, "logs.driver.");
    p_p = &__p;
    BYTE13(__p) = 0;
    HIWORD(__p) = 0;
LABEL_17:
    uint64_t v20 = a4;
    memmove((char *)p_p + 12, v13, v8);
    goto LABEL_18;
  }
  uint64_t v43 = 0xC00000000000000;
  BYTE13(__p) = 0;
  HIWORD(__p) = 0;
  p_p = &__p;
  strcpy((char *)&__p, "logs.driver.");
  uint64_t v20 = a4;
LABEL_18:
  *((unsigned char *)p_p + v8 + 12) = 0;
  if (SHIBYTE(v44[2]) >= 0) {
    std::string v21 = (const char *)v44;
  }
  else {
    std::string v21 = (const char *)v44[0];
  }
  std::string v22 = dispatch_queue_create(v21, 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v22;
  if (v22)
  {
    uint64_t v23 = v22;
    dispatch_retain(v22);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v23);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE808B0;
  ctu::LoggerCommonBase::LoggerCommonBase();
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v24 = a2[1];
  *(void *)(a1 + 64) = v24;
  if (v24) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v24 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)a1 = &unk_26CE808F0;
  if (SHIBYTE(v43) < 0)
  {
    operator delete((void *)__p);
    if ((SHIBYTE(v44[2]) & 0x80000000) == 0) {
      goto LABEL_28;
    }
  }
  else if ((SHIBYTE(v44[2]) & 0x80000000) == 0)
  {
    goto LABEL_28;
  }
  operator delete(v44[0]);
LABEL_28:
  *(void *)a1 = &unk_26CE807C0;
  *(void *)(a1 + 104) = *a7;
  uint64_t v25 = a7[1];
  *(void *)(a1 + 112) = v25;
  if (v25) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v25 + 8), 1uLL, memory_order_relaxed);
  }
  size_t v26 = *(void **)a3;
  if (*(void *)a3) {
    size_t v26 = _Block_copy(v26);
  }
  *(void *)(a1 + 120) = v26;
  long long v27 = *(NSObject **)(a3 + 8);
  *(void *)(a1 + 128) = v27;
  if (v27) {
    dispatch_retain(v27);
  }
  long long v28 = *(void **)v20;
  if (*(void *)v20) {
    long long v28 = _Block_copy(v28);
  }
  *(void *)(a1 + 136) = v28;
  int v29 = *(NSObject **)(v20 + 8);
  *(void *)(a1 + 144) = v29;
  if (v29) {
    dispatch_retain(v29);
  }
  *(void *)(a1 + 152) = 0xAAAAAAAAAAAAAAAALL;
  int v30 = *((char *)a6 + 23);
  if (v30 >= 0) {
    size_t v31 = *((unsigned __int8 *)a6 + 23);
  }
  else {
    size_t v31 = (size_t)a6[1];
  }
  *(void *)(a1 + 160) = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v32 = v31 + 12;
  *(void *)(a1 + 168) = 0xAAAAAAAAAAAAAAAALL;
  if (v31 + 12 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v32 >= 0x17)
  {
    uint64_t v34 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17) {
      uint64_t v34 = v32 | 7;
    }
    uint64_t v35 = v34 + 1;
    int v36 = operator new(v34 + 1);
    *(void *)(a1 + 160) = v32;
    *(void *)(a1 + 168) = v35 | 0x8000000000000000;
    *(void *)(a1 + 152) = v36;
    v36[2] = 779249014;
    *(void *)int v36 = *(void *)"logs.driver.";
    long long v33 = v36 + 3;
  }
  else
  {
    *(void *)(a1 + 160) = 0;
    *(void *)(a1 + 168) = 0;
    *(unsigned char *)(a1 + 175) = v32;
    *(_DWORD *)(a1 + 160) = 779249014;
    *(void *)(a1 + 152) = *(void *)"logs.driver.";
    long long v33 = (void *)(a1 + 164);
    if (!v31) {
      goto LABEL_52;
    }
  }
  if (v30 >= 0) {
    int v37 = a6;
  }
  else {
    int v37 = *a6;
  }
  memmove(v33, v37, v31);
LABEL_52:
  *((unsigned char *)v33 + v31) = 0;
  return a1;
}

void sub_21DBEE738(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<std::vector<unsigned char>>,BOOL)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

uint64_t dispatch::callback<void({block_pointer})(logs::CollectionState)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void *ctu::SharedLoggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE808B0;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE808B0;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t logs::CommandDriver::getName(logs::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 152;
  if (*((char *)this + 175) < 0) {
    return *(void *)result;
  }
  return result;
}

void logs::CommandDriver::notifyState_sync(uint64_t a1, int a2)
{
  uint64_t v3 = *(const void **)(a1 + 120);
  if (v3 && *(void *)(a1 + 128))
  {
    size_t v5 = _Block_copy(v3);
    uint64_t v6 = v5;
    int v7 = *(NSObject **)(a1 + 128);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 1174405120;
    v9[2] = ___ZNK8dispatch8callbackIU13block_pointerFvN4logs15CollectionStateEEEclIJS2_EEEvDpT__block_invoke;
    v9[3] = &__block_descriptor_tmp_3;
    if (v5) {
      size_t v8 = _Block_copy(v5);
    }
    else {
      size_t v8 = 0;
    }
    aBlock = v8;
    int v11 = a2;
    dispatch_async(v7, v9);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v6) {
      _Block_release(v6);
    }
  }
}

void logs::CommandDriver::sendLogData_sync(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v6 = *a2;
  size_t v5 = (std::__shared_weak_count *)a2[1];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v7 = *(const void **)(a1 + 136);
  if (v7) {
    size_t v8 = _Block_copy(v7);
  }
  else {
    size_t v8 = 0;
  }
  unint64_t v9 = *(NSObject **)(a1 + 144);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1174405120;
  v12[2] = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEclIJS7_bEEEvDpT__block_invoke;
  v12[3] = &__block_descriptor_tmp_15;
  if (!v8)
  {
    aBlock = 0;
    uint64_t v14 = v6;
    uint64_t v15 = v5;
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  aBlock = _Block_copy(v8);
  uint64_t v14 = v6;
  uint64_t v15 = v5;
  if (v5) {
LABEL_8:
  }
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_9:
  char v16 = a3;
  dispatch_async(v9, v12);
  uint64_t v10 = v15;
  if (!v15 || atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    int v11 = aBlock;
    if (!aBlock) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  int v11 = aBlock;
  if (aBlock) {
LABEL_12:
  }
    _Block_release(v11);
LABEL_13:
  if (v8) {
    _Block_release(v8);
  }
  if (v5)
  {
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

uint64_t ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 152);
  if (*(char *)(a1 + 175) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    size_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE808B0;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE808B0;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void ctu::SharedLoggable<logs::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE808B0;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN4logs15CollectionStateEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c66_ZTSN8dispatch5blockIU13block_pointerFvN4logs15CollectionStateEEEE(uint64_t a1, uint64_t a2)
{
  size_t result = *(void **)(a2 + 32);
  if (result) {
    size_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c66_ZTSN8dispatch5blockIU13block_pointerFvN4logs15CollectionStateEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEclIJS7_bEEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *, void))(v2 + 16))(v2, &v5, *(unsigned __int8 *)(a1 + 56));
  uint64_t v4 = v6;
  if (v6)
  {
    if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

void sub_21DBEEED4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10)
  {
    if (!atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_32c98_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEE40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(void *a1, void *a2)
{
  size_t result = (void *)a2[4];
  if (result) {
    size_t result = _Block_copy(result);
  }
  uint64_t v6 = a2[5];
  uint64_t v5 = a2[6];
  a1[4] = result;
  a1[5] = v6;
  a1[6] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c98_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrINS1_6vectorIhNS1_9allocatorIhEEEEEEbEEE40c57_ZTSNSt3__110shared_ptrINS_6vectorIhNS_9allocatorIhEEEEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(const void **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(const void **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  _Block_release(v3);
}

uint64_t antenna::CommandDriver::CommandDriver(uint64_t a1, void *a2, dispatch_object_t *a3, void *a4)
{
  *(void *)a1 = &unk_26CE80990;
  uint64_t v7 = *a3;
  if (*a3) {
    dispatch_retain(*a3);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v21, "com.apple.telephony.abm", "antenna.drv");
  if (v7) {
    dispatch_retain(v7);
  }
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  unint64_t v9 = dispatch_queue_create_with_target_V2("antenna.drv", initially_inactive, v7);
  dispatch_set_qos_class_floor(v9, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v9);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  *(void *)(a1 + 96) = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  if (v9) {
    dispatch_release(v9);
  }
  if (v7) {
    dispatch_release(v7);
  }
  *(void *)a1 = &unk_26CE80AB8;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v20);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v10 = a2[1];
  *(void *)(a1 + 64) = v10;
  if (v10) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v19);
  *(void *)a1 = &unk_26CE80AF8;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v21);
  if (v7) {
    dispatch_release(v7);
  }
  *(void *)a1 = &unk_26CE80990;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 112) = 0;
  *(void *)(a1 + 104) = a1 + 112;
  *(void *)(a1 + 128) = *a4;
  uint64_t v11 = a4[1];
  *(void *)(a1 + 136) = v11;
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = 0;
  *((unsigned char *)&v19.__r_.__value_.__s + 23) = 11;
  strcpy((char *)&v19, "antenna.drv");
  CFNumberRef v12 = std::string::append(&v19, "::", 2uLL);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v20.__r_.__value_.__r.__words[2] = v12->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  uint64_t v14 = getprogname();
  size_t v15 = strlen(v14);
  char v16 = std::string::append(&v20, v14, v15);
  long long v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  *(void *)(a1 + 176) = *((void *)&v16->__r_.__value_.__l + 2);
  *(_OWORD *)(a1 + 160) = v17;
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return a1;
    }
LABEL_23:
    operator delete(v19.__r_.__value_.__l.__data_);
    return a1;
  }
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_23;
  }
  return a1;
}

void sub_21DBEF2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v25);
  std::shared_ptr<Registry>::~shared_ptr[abi:ne180100](v24);
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(*(void **)(v23 + 112));
  ctu::SharedLoggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable((void *)v23);
  _Unwind_Resume(a1);
}

void *ctu::SharedLoggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80AB8;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_26CE80AB8;
  MEMORY[0x223C14900](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

uint64_t antenna::CommandDriver::getName(antenna::CommandDriver *this)
{
  uint64_t result = (uint64_t)this + 160;
  if (*((char *)this + 183) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t antenna::CommandDriver::convertModeToState(uint64_t a1, unsigned int a2)
{
  if (a2 > 3) {
    return 2;
  }
  else {
    return dword_21DBF70B0[a2];
  }
}

void antenna::CommandDriver::registerHandler(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 152);
  *(_OWORD *)(a1 + 144) = v2;
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

uint64_t ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 160);
  if (*(char *)(a1 + 183) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    size_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80AB8;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80AB8;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void ctu::SharedLoggable<antenna::CommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80AB8;
  MEMORY[0x223C14900](a1 + 1);
  long long v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

uint64_t radio::HealthCommandDriver::LinkStats::LinkStats(uint64_t this)
{
  *(void *)this = 0;
  *(_DWORD *)(this + 8) = 0;
  return this;
}

{
  *(void *)this = 0;
  *(_DWORD *)(this + 8) = 0;
  return this;
}

uint64_t radio::HealthCommandDriver::HealthCommandDriver(uint64_t a1, void *a2, void *a3)
{
  *(void *)a1 = &unk_26CE80B38;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v11, "com.apple.telephony.abm", "radio.health.drv");
  uint64_t v6 = dispatch_queue_create("radio.health.drv", 0);
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = v6;
  if (v6)
  {
    uint64_t v7 = v6;
    dispatch_retain(v6);
    *(void *)(a1 + 96) = 0;
    dispatch_release(v7);
  }
  else
  {
    *(void *)(a1 + 96) = 0;
  }
  *(void *)a1 = &unk_26CE80C28;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v13);
  *(void *)(a1 + 8) = &unk_26CE7EB30;
  *(void *)(a1 + 56) = *a2;
  uint64_t v8 = a2[1];
  *(void *)(a1 + 64) = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v12);
  *(void *)a1 = &unk_26CE80C68;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v11);
  *(void *)a1 = &unk_26CE80B38;
  *(void *)(a1 + 104) = *a3;
  uint64_t v9 = a3[1];
  *(void *)(a1 + 112) = v9;
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  *(unsigned char *)(a1 + 143) = 16;
  strcpy((char *)(a1 + 120), "radio.health.drv");
  return a1;
}

void sub_21DBEF8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a11);
  ctu::SharedSynchronizable<coex::CommandDriver>::~SharedSynchronizable(v13);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

uint64_t radio::HealthCommandDriver::getName(radio::HealthCommandDriver *this)
{
  uint64_t result = (uint64_t)this + 120;
  if (*((char *)this + 143) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x270F97428](a1 + 8);
}

size_t ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (const char *)(a1 + 120);
  if (*(char *)(a1 + 143) < 0) {
    uint64_t v3 = *(const char **)v3;
  }
  size_t result = strlen(v3);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = result;
  if (result >= 0x17)
  {
    uint64_t v6 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v6 = result | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    a2[1] = v5;
    a2[2] = v7 | 0x8000000000000000;
    *a2 = v8;
    a2 = v8;
  }
  else
  {
    *((unsigned char *)a2 + 23) = result;
    if (!result)
    {
      *(unsigned char *)a2 = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(a2, v3, v5);
  *((unsigned char *)a2 + v5) = 0;
  return result;
}

uint64_t ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x270F978E0](a1 + 8);
}

void *ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80C28;
  MEMORY[0x223C14900](a1 + 1);
  return a1;
}

void ctu::Loggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_26CE80C28;
  MEMORY[0x223C14900](a1 + 1);

  operator delete(a1);
}

void *ctu::SharedLoggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80C28;
  MEMORY[0x223C14900](a1 + 1);
  long long v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<radio::HealthCommandDriver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_26CE80C28;
  MEMORY[0x223C14900](a1 + 1);
  long long v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }

  operator delete(a1);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t TelephonyRadiosGetRadioVendor()
{
  return MEMORY[0x270F97168]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x270F96D28](this);
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x270F97268]();
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972A8](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x270F972D0]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x270F972D8](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x270F97430]();
}

{
  return MEMORY[0x270F97438]();
}

uint64_t ctu::cf::MakeCFString::MakeCFString(ctu::cf::MakeCFString *this, const char *a2)
{
  return MEMORY[0x270F974F0](this, a2);
}

void ctu::cf::MakeCFString::~MakeCFString(ctu::cf::MakeCFString *this)
{
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x270F97500](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x270F97508]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F97518](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x270F977A8]();
}

{
  return MEMORY[0x270F977B8]();
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x270F977F0]();
}

{
  return MEMORY[0x270F97808]();
}

{
  return MEMORY[0x270F97820]();
}

void Registry::Registry(Registry *this)
{
}

uint64_t ctu::cf::map_adapter::copyCFNumberRef(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F978F8](this, a2);
}

uint64_t ctu::cf::map_adapter::getInt(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97908](this, a2);
}

uint64_t ctu::cf::map_adapter::getBool(ctu::cf::map_adapter *this, const __CFString *a2)
{
  return MEMORY[0x270F97910](this, a2);
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

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9440](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x270EDBDD8](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC210](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}