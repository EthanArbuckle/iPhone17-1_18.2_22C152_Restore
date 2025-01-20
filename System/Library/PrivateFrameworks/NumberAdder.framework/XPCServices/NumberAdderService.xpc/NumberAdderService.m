int main(int argc, const char **argv, const char **envp)
{
  sub_10000380C();
}

void sub_10000380C()
{
}

void sub_100003850()
{
}

void NumberAdderService::NumberAdderService(NumberAdderService *this)
{
  *(void *)this = off_100008378;
  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = off_1000083B0;
  *((_DWORD *)v2 + 6) = 31337;
  *((_OWORD *)this + 2) = 0u;
  *((void *)this + 1) = v2 + 3;
  *((void *)this + 2) = v2;
  *((_OWORD *)this + 3) = 0u;
  *((void *)this + 8) = 0;
  *((_DWORD *)this + 18) = 1065353216;
  *((void *)this + 3) = dispatch_queue_create("com.apple.lomoqa.numberadderservice.serialQ", 0);
  uint64_t listener = xpc_connection_create_listener();
  NumberAdderService::startService((uint64_t)this, listener);
}

void sub_10000394C(_Unwind_Exception *a1)
{
  sub_100004F1C((uint64_t)(v1 + 5));
  sub_100004ECC(v2, 0);
  sub_100004C4C(v1);
  _Unwind_Resume(a1);
}

void NumberAdderService::startService(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (*(void *)(a1 + 24)) {
      operator new();
    }
    sub_100006704();
  }
  sub_100006578();
}

void sub_100003A68(uint64_t a1)
{
  v2 = operator new(0x20uLL);
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = off_1000083B0;
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  *(void *)(a1 + 16) = v2;
  *((_DWORD *)v2 + 6) = 31337;
  *(void *)(a1 + 8) = v2 + 3;
  if (v3)
  {
    sub_100004BD8(v3);
  }
}

void sub_100003AE8(void *a1)
{
}

void sub_100003AFC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  sub_100004FA0(&v3, v2);
}

void sub_100003DBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, std::__shared_weak_count *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,std::__shared_weak_count *a29,uint64_t a30,std::__shared_weak_count *a31)
{
  if (v33) {
    sub_100004BD8(v33);
  }
  if (a13) {
    sub_100004BD8(a13);
  }
  if (a22) {
    std::__shared_weak_count::__release_weak(a22);
  }
  if (a20) {
    std::__shared_weak_count::__release_weak(a20);
  }
  if (a31) {
    std::__shared_weak_count::__release_weak(a31);
  }
  if (a29) {
    std::__shared_weak_count::__release_weak(a29);
  }
  v36 = *(std::__shared_weak_count **)(v34 - 104);
  if (v36) {
    std::__shared_weak_count::__release_weak(v36);
  }
  v37 = *(std::__shared_weak_count **)(v34 - 120);
  if (v37)
  {
    std::__shared_weak_count::__release_weak(v37);
    if (!v32)
    {
LABEL_17:
      if (!v31) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if (!v32)
  {
    goto LABEL_17;
  }
  std::__shared_weak_count::__release_weak(v32);
  if (!v31)
  {
LABEL_19:
    v38 = *(std::__shared_weak_count **)(v34 - 88);
    if (v38) {
      sub_100004BD8(v38);
    }
    _Unwind_Resume(exception_object);
  }
LABEL_18:
  std::__shared_weak_count::__release_weak(v31);
  goto LABEL_19;
}

void sub_100003E74(void *a1, uint64_t *a2)
{
  uint64_t v2 = a1[4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3321888768;
  v8 = sub_100003F70;
  v9 = &unk_100008288;
  uint64_t v4 = a1[7];
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  uint64_t v10 = v2;
  uint64_t v11 = v4;
  v12 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v5 = (std::__shared_weak_count *)a2[1];
  uint64_t v13 = *a2;
  v14 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = a1[6];
  if (v6 && *(void *)(v6 + 8) != -1) {
    v8(v7);
  }
  if (v14) {
    sub_100004BD8(v14);
  }
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
}

void sub_100003F4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, std::__shared_weak_count *a18)
{
  if (a18) {
    sub_100004BD8(a18);
  }
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003F70(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        uint64_t v9 = a1[5];
        uint64_t v10 = v4;
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v6 = a1[7];
        v7 = (std::__shared_weak_count *)a1[8];
        v8[0] = v6;
        v8[1] = v7;
        if (v7) {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        NumberAdderService::handleMessage(v3, &v9, (uint64_t)v8);
        if (v7) {
          sub_100004BD8(v7);
        }
        if (v10) {
          sub_100004BD8(v10);
        }
      }
      sub_100004BD8(v5);
    }
  }
}

void sub_100004018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (v13) {
    sub_100004BD8(v13);
  }
  if (a12) {
    sub_100004BD8(a12);
  }
  sub_100004BD8(v12);
  _Unwind_Resume(a1);
}

void NumberAdderService::handleMessage(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  sub_100005428(a1 + 40, a2, a2);
  uint64_t v6 = CLConnectionMessage::name(*(CLConnectionMessage **)a3);
  if (*(char *)(v6 + 23) < 0)
  {
    sub_100004CD0(__p, *(void **)v6, *(void *)(v6 + 8));
  }
  else
  {
    long long v7 = *(_OWORD *)v6;
    uint64_t v32 = *(void *)(v6 + 16);
    *(_OWORD *)__p = v7;
  }
  v8 = _os_activity_create((void *)&_mh_execute_header, "CL: #NumberAdderService handling message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  if (qword_10000C1C0 != -1) {
    dispatch_once(&qword_10000C1C0, &stru_100008410);
  }
  uint64_t v9 = qword_10000C1C8;
  if (os_log_type_enabled((os_log_t)qword_10000C1C8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = __p;
    if (v32 < 0) {
      uint64_t v10 = (void **)__p[0];
    }
    *(_DWORD *)buf = 68289538;
    int v34 = 0;
    __int16 v35 = 2082;
    v36 = "";
    __int16 v37 = 2082;
    v38 = "activity";
    __int16 v39 = 2082;
    v40 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#NumberAdderService handling message\", \"event\":%{public, location:escape_only}s, \"messageName\":%{public, location:escape_only}s}", buf, 0x26u);
  }
  uint64_t v11 = (void *)HIBYTE(v32);
  if (v32 < 0) {
    uint64_t v11 = __p[1];
  }
  if (v11 != (void *)27) {
    goto LABEL_25;
  }
  v12 = __p;
  if (v32 < 0) {
    v12 = (void **)__p[0];
  }
  uint64_t v13 = *v12;
  v14 = v12[1];
  v15 = v12[2];
  uint64_t v16 = *(uint64_t *)((char *)v12 + 19);
  BOOL v17 = v13 == (void *)0x656E6E6F434C436BLL && v14 == (void *)0x6D754E6E6F697463;
  BOOL v18 = v17 && v15 == (void *)0x7265646441726562;
  if (v18 && v16 == 0x6464417265646441)
  {
    uint64_t v24 = *a2;
    v25 = (std::__shared_weak_count *)a2[1];
    v29[0] = v24;
    v29[1] = (uint64_t)v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v26 = *(CLConnectionMessage **)a3;
    uint64_t v27 = *(void *)(a3 + 8);
    v28[0] = v26;
    v28[1] = (CLConnectionMessage *)v27;
    if (v27) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v27 + 8), 1uLL, memory_order_relaxed);
    }
    NumberAdderService::handleAddRequest(a1, v29, v28);
    if (v27) {
      sub_100004BD8((std::__shared_weak_count *)v27);
    }
    if (v25) {
      sub_100004BD8(v25);
    }
  }
  else
  {
LABEL_25:
    if (qword_10000C1C0 != -1) {
      dispatch_once(&qword_10000C1C0, &stru_100008410);
    }
    v20 = qword_10000C1C8;
    if (os_log_type_enabled((os_log_t)qword_10000C1C8, OS_LOG_TYPE_FAULT))
    {
      v21 = __p;
      if (v32 < 0) {
        v21 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 2082;
      v38 = (const char *)v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#NumberAdderService received unknown message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
      if (qword_10000C1C0 != -1) {
        dispatch_once(&qword_10000C1C0, &stru_100008410);
      }
    }
    v22 = qword_10000C1C8;
    if (os_signpost_enabled((os_log_t)qword_10000C1C8))
    {
      v23 = __p;
      if (v32 < 0) {
        v23 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289282;
      int v34 = 0;
      __int16 v35 = 2082;
      v36 = "";
      __int16 v37 = 2082;
      v38 = (const char *)v23;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#NumberAdderService received unknown message", "{\"msg%{public}.0s\":\"#NumberAdderService received unknown message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
  }
  os_activity_scope_leave(&state);
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[0]);
  }
}

void sub_100004424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (v19) {
    sub_100004BD8(v19);
  }
  if (v20) {
    sub_100004BD8(v20);
  }
  os_activity_scope_leave(&state);
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *sub_100004470(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_1000044A4(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_100004BD8(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void *sub_1000044F4(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100004528(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_100004578(void *a1)
{
  uint64_t v1 = a1[4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  uint64_t v6 = sub_100004644;
  long long v7 = &unk_1000082E8;
  uint64_t v3 = a1[7];
  uint64_t v2 = (std::__shared_weak_count *)a1[8];
  uint64_t v8 = v1;
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[6];
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
}

void sub_10000462C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_100004644(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        uint64_t v6 = a1[5];
        long long v7 = v4;
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 24));
        sub_100005128((void *)(v3 + 40), &v6);
        if (v7) {
          sub_100004BD8(v7);
        }
      }
      sub_100004BD8(v5);
    }
  }
}

void sub_1000046CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100004BD8(a10);
  }
  sub_100004BD8(v10);
  _Unwind_Resume(a1);
}

uint64_t sub_1000046EC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_100004708(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void sub_100004718(void *a1)
{
  uint64_t v1 = a1[4];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  uint64_t v6 = sub_1000047E4;
  long long v7 = &unk_1000082E8;
  uint64_t v3 = a1[7];
  uint64_t v2 = (std::__shared_weak_count *)a1[8];
  uint64_t v8 = v1;
  uint64_t v9 = v3;
  uint64_t v10 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[6];
  if (v4 && *(void *)(v4 + 8) != -1) {
    v6(v5);
  }
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
}

void sub_1000047CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000047E4(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      v5 = v4;
      if (a1[5])
      {
        uint64_t v6 = a1[5];
        long long v7 = v4;
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 24));
        sub_100005128((void *)(v3 + 40), &v6);
        if (v7) {
          sub_100004BD8(v7);
        }
      }
      sub_100004BD8(v5);
    }
  }
}

void sub_10000486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100004BD8(a10);
  }
  sub_100004BD8(v10);
  _Unwind_Resume(a1);
}

void NumberAdderService::handleAddRequest(uint64_t a1, uint64_t *a2, CLConnectionMessage **a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  sub_100004E18(&__p, "com.apple.lomoqa.numberadderservice");
  char isEntitled = CLConnection::isEntitled();
  char v6 = isEntitled;
  if (SBYTE3(v16) < 0)
  {
    operator delete(__p);
    if (v6) {
      goto LABEL_3;
    }
  }
  else if (isEntitled)
  {
LABEL_3:
    Dictionary = (void *)CLConnectionMessage::getDictionary(*a3);
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(objc_msgSend(Dictionary, "objectForKey:", @"kCLConnectionNumberAdderNumber2Key"), "intValue")+ objc_msgSend(objc_msgSend(Dictionary, "objectForKey:", @"kCLConnectionNumberAdderNumber1Key"), "intValue"));
    CLConnectionMessage::sendReply();
    return;
  }
  if (qword_10000C1C0 != -1) {
    dispatch_once(&qword_10000C1C0, &stru_100008410);
  }
  uint64_t v8 = qword_10000C1C8;
  if (os_log_type_enabled((os_log_t)qword_10000C1C8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *a2;
    __p = (void *)68289282;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2050;
    uint64_t v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#NumberAdderService connection lacks proper entitlement.\", \"connection\":\"%{public}p\"}", (uint8_t *)&__p, 0x1Cu);
    if (qword_10000C1C0 != -1) {
      dispatch_once(&qword_10000C1C0, &stru_100008410);
    }
  }
  uint64_t v10 = qword_10000C1C8;
  if (os_signpost_enabled((os_log_t)qword_10000C1C8))
  {
    uint64_t v11 = *a2;
    __p = (void *)68289282;
    __int16 v13 = 2082;
    v14 = "";
    __int16 v15 = 2050;
    uint64_t v16 = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#NumberAdderService connection lacks proper entitlement.", "{\"msg%{public}.0s\":\"#NumberAdderService connection lacks proper entitlement.\", \"connection\":\"%{public}p\"}", (uint8_t *)&__p, 0x1Cu);
  }
}

void sub_100004ACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100004AF0(void *a1)
{
  sub_100004C4C(a1);
  operator delete();
}

void sub_100004B28()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100004B5C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000083B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100004B7C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000083B0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

void sub_100004BD8(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *sub_100004C4C(void *a1)
{
  *a1 = off_100008378;
  sub_100003A68((uint64_t)a1);
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    sub_100004BD8(v2);
  }
  return a1;
}

void sub_100004CA0(id a1)
{
  qword_10000C1C8 = (uint64_t)os_log_create("com.apple.lomoqa.NumberAdderService", "NumberAdderService");
}

void *sub_100004CD0(unsigned char *__dst, void *__src, unint64_t a3)
{
  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_100004D70();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    void v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_100004D70()
{
}

void sub_100004D88(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100004DE4(exception, a1);
}

void sub_100004DD0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100004DE4(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100004E18(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_100004D70();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

CLConnectionServer *sub_100004ECC(CLConnectionServer **a1, CLConnectionServer *a2)
{
  result = *a1;
  *a1 = a2;
  if (result)
  {
    CLConnectionServer::~CLConnectionServer(result);
    operator delete();
  }
  return result;
}

uint64_t sub_100004F1C(uint64_t a1)
{
  sub_100004F58(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_100004F58(int a1, void *__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      size_t v4 = (std::__shared_weak_count *)v2[3];
      if (v4) {
        sub_100004BD8(v4);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_100004FA0(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_100005008(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1) {
    CLConnection::deferredDelete(v1);
  }
  __cxa_rethrow();
}

void sub_100005020(_Unwind_Exception *a1)
{
}

void sub_100005038(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

CLConnection *sub_100005070(uint64_t a1)
{
  result = *(CLConnection **)(a1 + 24);
  if (result) {
    return (CLConnection *)CLConnection::deferredDelete(result);
  }
  return result;
}

uint64_t sub_100005094(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else {
    return 0;
  }
}

BOOL sub_1000050D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

uint64_t *sub_100005128(void *a1, void *a2)
{
  result = sub_100005160(a1, a2);
  if (result)
  {
    sub_10000524C(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *sub_100005160(void *a1, void *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  unint64_t v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v5;
    if (v5 >= *(void *)&v2) {
      unint64_t v7 = v5 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v7 = v5 & (*(void *)&v2 - 1);
  }
  uint64_t v8 = *(void **)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  result = (void *)*v8;
  if (*v8)
  {
    do
    {
      unint64_t v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2) {
          return result;
        }
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(void *)&v2) {
            v10 %= *(void *)&v2;
          }
        }
        else
        {
          v10 &= *(void *)&v2 - 1;
        }
        if (v10 != v7) {
          return 0;
        }
      }
      result = (void *)*result;
    }
    while (result);
  }
  return result;
}

uint64_t sub_10000524C(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  sub_100005298(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    sub_1000053CC((uint64_t)&v6, v3);
  }
  return v2;
}

void *sub_100005298@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    unint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_1000053CC(uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    int8x8_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3) {
      sub_100004BD8(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void *sub_100005428(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  unint64_t v7 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v6 >> 47) ^ v6);
  unint64_t v8 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = 0x9DDFEA08EB382D69 * (v7 ^ (v7 >> 47));
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
    }
    else
    {
      unint64_t v3 = v8 & (v9 - 1);
    }
    unint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = (void *)*i)
      {
        unint64_t v13 = i[1];
        if (v13 == v8)
        {
          if (i[2] == *a2) {
            return i;
          }
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v13 >= v9) {
              v13 %= v9;
            }
          }
          else
          {
            v13 &= v9 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  v14 = (void *)(a1 + 16);
  i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v8;
  uint64_t v15 = a3[1];
  i[2] = *a3;
  i[3] = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v9 || (float)(v17 * (float)v9) < v16)
  {
    BOOL v18 = 1;
    if (v9 >= 3) {
      BOOL v18 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v9);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    sub_1000056B8(a1, v21);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v22 = *(void *)a1;
  v23 = *(void **)(*(void *)a1 + 8 * v3);
  if (v23)
  {
    void *i = *v23;
LABEL_40:
    void *v23 = i;
    goto LABEL_41;
  }
  void *i = *v14;
  void *v14 = i;
  *(void *)(v22 + 8 * v3) = v14;
  if (*i)
  {
    unint64_t v24 = *(void *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v24 >= v9) {
        v24 %= v9;
      }
    }
    else
    {
      v24 &= v9 - 1;
    }
    v23 = (void *)(*(void *)a1 + 8 * v24);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_10000569C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  sub_1000053CC(v11, v10);
  _Unwind_Resume(a1);
}

void sub_1000056B8(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_1000057A8(a1, prime);
    }
  }
}

void sub_1000057A8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_100004B28();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void sub_100005930(void *a1, int a2, int a3, int a4, const char *a5, const char *a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_signpost_emit_with_name_impl(a1, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, a5, a6, &buf, 0x26u);
}

void sub_10000595C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_impl(a1, v13, OS_LOG_TYPE_FAULT, a4, &buf, 0x26u);
}

void sub_10000597C(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_impl(a1, v13, OS_LOG_TYPE_INFO, a4, &buf, 0x26u);
}

BOOL sub_10000599C()
{
  uint64_t v1 = qword_10000C1C8;
  return os_log_type_enabled(v1, OS_LOG_TYPE_FAULT);
}

void sub_100005ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

id sub_100005AD0(uint64_t a1)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    xpc_connection_create("com.apple.lomoqa.numberadderservice", (dispatch_queue_t)[*(id *)(a1 + 32) connectionQueue]);
    operator new();
  }
  return result;
}

void sub_100005BA0()
{
}

id sub_100005C94(uint64_t a1)
{
  return [*(id *)(a1 + 32) setup];
}

uint64_t sub_100005D48(uint64_t a1)
{
  return CLConnection::deferredDelete(*(CLConnection **)(a1 + 32));
}

void sub_100005E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005E30(uint64_t a1, uint64_t *a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  int8x8_t v4 = (std::__shared_weak_count *)a2[1];
  uint64_t v5 = *a2;
  uint64_t v6 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [Weak handleMessage:&v5];
  if (v6) {
    sub_100004BD8(v6);
  }
}

void sub_100005E8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_100004BD8(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100005F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005FA4(uint64_t a1, uint64_t a2)
{
}

void sub_100005FB4(uint64_t a1)
{
}

void sub_100005FC0(uint64_t a1)
{
  v6[0] = @"kCLConnectionNumberAdderNumber1Key";
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 48)];
  v6[1] = @"kCLConnectionNumberAdderNumber2Key";
  v7[0] = v2;
  v7[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 52)];
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  sub_1000063C4("kCLConnectionNumberAdderAdd", &v3);
  CLConnection::sendMessage();
  if (v4) {
    sub_100004BD8(v4);
  }
}

void sub_1000060F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15)
{
  if (a15) {
    sub_100004BD8(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006110(uint64_t a1, CLConnectionMessage **a2)
{
  uint64_t v3 = *a2;
  int8x8_t v4 = (objc_class *)objc_opt_class();
  ObjectOfClass = (void *)CLConnectionMessage::getObjectOfClass(v3, v4);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, [ObjectOfClass intValue]);
  uint64_t v7 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  _Block_release(v7);
}

void sub_100006318(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
}

void sub_100006368(id a1)
{
  qword_10000C1D8 = (uint64_t)os_log_create("com.apple.lomoqa.NumberAdderFramework", "NumberAdder");
}

CLConnection *sub_100006398(CLConnection **a1, CLConnection *a2)
{
  id result = *a1;
  *a1 = a2;
  if (result) {
    return (CLConnection *)CLConnection::deferredDelete(result);
  }
  return result;
}

void *sub_1000063C4@<X0>(char *a1@<X1>, void *a2@<X8>)
{
  int8x8_t v4 = operator new(0x70uLL);
  id result = sub_100006428(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_100006414(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *sub_100006428(void *a1, char *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_1000085A8;
  sub_100006504((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_100006470(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_100006484(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000085A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1000064A4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000085A8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

void sub_1000064F8(uint64_t a1)
{
}

uint64_t sub_100006504(uint64_t a1, char *a2)
{
  sub_100004E18(&__p, a2);
  CLConnectionMessage::CLConnectionMessage();
  if (v5 < 0) {
    operator delete(__p);
  }
  return a1;
}

void sub_10000655C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006578()
{
  if (qword_10000C1C0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    if (sub_10000599C())
    {
      sub_100005904();
      sub_10000595C((void *)&_mh_execute_header, v1, v2, "{\"msg%{public}.0s\":\"#NumberAdderService service can't be null\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, (uint64_t)v18, v19, (uint64_t)v20, v21, v22);
      if (qword_10000C1C0 != -1) {
        dispatch_once(&qword_10000C1C0, &stru_100008410);
      }
    }
    if (os_signpost_enabled(*(os_log_t *)(v0 + 456)))
    {
      sub_100005904();
      sub_100005930((void *)&_mh_execute_header, v7, v8, v9, "#NumberAdderService service can't be null", "{\"msg%{public}.0s\":\"#NumberAdderService service can't be null\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v10, v11, (uint64_t)v18, v19, (uint64_t)v20, v21, v22);
      if (qword_10000C1C0 != -1) {
        dispatch_once(&qword_10000C1C0, &stru_100008410);
      }
    }
    if (os_log_type_enabled(*(os_log_t *)(v0 + 456), OS_LOG_TYPE_INFO))
    {
      sub_100005904();
      sub_10000597C((void *)&_mh_execute_header, v12, v13, "{\"msg%{public}.0s\":\"#NumberAdderService service can't be null\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v16, v17, (uint64_t)v18, v19, (uint64_t)v20, v21, v22);
    }
    uint64_t v19 = 40;
    unint64_t v20 = "startService";
    BOOL v18 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationIPCTemplate/NumberAdder/XPCService/NumberAdderService.mm";
    abort_report_np();
    __break(1u);
LABEL_11:
    dispatch_once(&qword_10000C1C0, &stru_100008410);
  }
}

void sub_100006704()
{
  if (qword_10000C1C0 != -1) {
    goto LABEL_11;
  }
  while (1)
  {
    if (sub_10000599C())
    {
      sub_100005904();
      sub_10000595C((void *)&_mh_execute_header, v1, v2, "{\"msg%{public}.0s\":\"#NumberAdderService fServiceQueue can't be null\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v3, v4, v5, v6, (uint64_t)v18, v19, (uint64_t)v20, v21, v22);
      if (qword_10000C1C0 != -1) {
        dispatch_once(&qword_10000C1C0, &stru_100008410);
      }
    }
    if (os_signpost_enabled(*(os_log_t *)(v0 + 456)))
    {
      sub_100005904();
      sub_100005930((void *)&_mh_execute_header, v7, v8, v9, "#NumberAdderService fServiceQueue can't be null", "{\"msg%{public}.0s\":\"#NumberAdderService fServiceQueue can't be null\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v10, v11, (uint64_t)v18, v19, (uint64_t)v20, v21, v22);
      if (qword_10000C1C0 != -1) {
        dispatch_once(&qword_10000C1C0, &stru_100008410);
      }
    }
    if (os_log_type_enabled(*(os_log_t *)(v0 + 456), OS_LOG_TYPE_INFO))
    {
      sub_100005904();
      sub_10000597C((void *)&_mh_execute_header, v12, v13, "{\"msg%{public}.0s\":\"#NumberAdderService fServiceQueue can't be null\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v14, v15, v16, v17, (uint64_t)v18, v19, (uint64_t)v20, v21, v22);
    }
    uint64_t v19 = 41;
    unint64_t v20 = "startService";
    BOOL v18 = "/Library/Caches/com.apple.xbs/Sources/CoreLocationIPCTemplate/NumberAdder/XPCService/NumberAdderService.mm";
    abort_report_np();
    __break(1u);
LABEL_11:
    dispatch_once(&qword_10000C1C0, &stru_100008410);
  }
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CLConnection::isEntitled()
{
  return CLConnection::isEntitled();
}

uint64_t CLConnection::sendMessage()
{
  return CLConnection::sendMessage();
}

uint64_t CLConnection::deferredDelete(CLConnection *this)
{
  return CLConnection::deferredDelete(this);
}

uint64_t CLConnection::setInterruptionHandler()
{
  return CLConnection::setInterruptionHandler();
}

uint64_t CLConnection::setDisconnectionHandler()
{
  return CLConnection::setDisconnectionHandler();
}

uint64_t CLConnection::setDefaultMessageHandler()
{
  return CLConnection::setDefaultMessageHandler();
}

uint64_t CLConnection::start(CLConnection *this)
{
  return CLConnection::start(this);
}

uint64_t CLConnection::CLConnection()
{
  return CLConnection::CLConnection();
}

uint64_t CLConnectionServer::CLConnectionServer()
{
  return CLConnectionServer::CLConnectionServer();
}

void CLConnectionServer::~CLConnectionServer(CLConnectionServer *this)
{
}

uint64_t CLConnectionMessage::sendReply()
{
  return CLConnectionMessage::sendReply();
}

uint64_t CLConnectionMessage::CLConnectionMessage()
{
  return CLConnectionMessage::CLConnectionMessage();
}

uint64_t CLConnectionMessage::getDictionary(CLConnectionMessage *this)
{
  return CLConnectionMessage::getDictionary(this);
}

uint64_t CLConnectionMessage::getObjectOfClass(CLConnectionMessage *this, objc_class *a2)
{
  return CLConnectionMessage::getObjectOfClass(this, a2);
}

uint64_t CLConnectionMessage::name(CLConnectionMessage *this)
{
  return CLConnectionMessage::name(this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return std::__shared_weak_count::lock(this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

uint64_t xpc_connection_create_listener()
{
  return _xpc_connection_create_listener();
}

void xpc_release(xpc_object_t object)
{
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionQueue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}