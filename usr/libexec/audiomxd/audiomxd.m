void start()
{
  std::string *v0;
  std::string *v1;
  int v2;
  NSObject *v3;
  NSObject *v4;
  std::__fs::filesystem::path *p_to;
  NSObject *v6;
  NSObject *v7;
  std::__fs::filesystem::path *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  _opaque_pthread_t *v12;
  const char *v13;
  uint32_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  int __relative_priority[2];
  std::error_code __ec;
  std::__fs::filesystem::path __new_symlink;
  std::__fs::filesystem::path __to;
  int out_token[2];
  int buf;
  const char *buf_4;
  __int16 v27;
  int v28;
  __int16 v29;
  std::__fs::filesystem::path *v30;
  __int16 v31;
  int val;

  +[NSError _setFileNameLocalizationEnabled:0];
  _set_user_dir_suffix();
  v0 = [+[NSString stringWithFormat:@"%@AudioCapture", NSTemporaryDirectory()] UTF8String];
  memset(&__to, 0, sizeof(__to));
  v1 = (std::string *)((char *)v0 - 1);
  do
  {
    v2 = v1->__r_.__value_.__s.__data_[1];
    v1 = (std::string *)((char *)v1 + 1);
  }
  while (v2);
  sub_1000047EC(&__to.__pn_, v0, v1);
  memset(&__new_symlink, 0, sizeof(__new_symlink));
  sub_1000047EC(&__new_symlink.__pn_, (std::string *)"/var/tmp/AudioCapture", (std::string *)"");
  __ec.__val_ = 0;
  __ec.__cat_ = std::system_category();
  std::__fs::filesystem::__create_directory_symlink(&__to, &__new_symlink, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ != 17)
    {
      v3 = CADefaultLog();
      v4 = v3;
      if (v3)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          p_to = &__to;
          if ((__to.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            p_to = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
          }
          buf = 136315906;
          buf_4 = "mediaserverd.mm";
          v27 = 1024;
          v28 = 204;
          v29 = 2080;
          v30 = p_to;
          v31 = 1024;
          val = __ec.__val_;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error creating symlink to %s. Code:%d", (uint8_t *)&buf, 0x22u);
        }
      }
    }
  }
  std::__fs::filesystem::__create_directory(&__to, &__ec);
  if (__ec.__val_)
  {
    if (__ec.__val_ != 17)
    {
      v6 = CADefaultLog();
      v7 = v6;
      if (v6)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v8 = &__to;
          if ((__to.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            v8 = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
          }
          buf = 136315906;
          buf_4 = "mediaserverd.mm";
          v27 = 1024;
          v28 = 208;
          v29 = 2080;
          v30 = v8;
          v31 = 1024;
          val = __ec.__val_;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Error creating %s path. Code:%d", (uint8_t *)&buf, 0x22u);
        }
      }
    }
  }
  setiopolicy_np(9, 0, 1);
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085D8);
  }
  v9 = os_signpost_id_generate((os_log_t)qword_10000C038);
  if (qword_10000C040 != -1) {
    dispatch_once(&qword_10000C040, &stru_1000085D8);
  }
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v9, "mediaserverdSubServerCreationTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      if (qword_10000C040 != -1) {
        dispatch_once(&qword_10000C040, &stru_1000085D8);
      }
    }
    v11 = qword_10000C038;
    if (os_signpost_enabled((os_log_t)qword_10000C038))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "mediaserverdStartTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
    }
  }
  pthread_set_fixedpriority_self();
  *(void *)__relative_priority = 0;
  v12 = pthread_self();
  if (!pthread_get_qos_class_np(v12, (qos_class_t *)&__relative_priority[1], __relative_priority)) {
    pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
  }
  v13 = getprogname();
  openlog(v13, 40, 24);
  getpid();
  proc_disable_wakemon();
  wd_endpoint_register();
  out_token[0] = 0;
  v14 = notify_register_dispatch("com.apple.language.changed", out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_100008638);
  if (v14)
  {
    v15 = CADefaultLog();
    v16 = v15;
    if (v15)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        buf = 136315650;
        buf_4 = "mediaserverd.mm";
        v27 = 1024;
        v28 = 148;
        v29 = 1024;
        LODWORD(v30) = v14;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d Could not register for language change notification, err = %u", (uint8_t *)&buf, 0x18u);
      }
    }
  }
  qword_10000C030 = (uint64_t)CFRunLoopGetCurrent();
  v17 = dispatch_queue_create("com.apple.coreaudio.mediaserverd.cleanup", 0);
  signal(15, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(13, (void (__cdecl *)(int))1);
  v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v17);
  if (v18)
  {
    v19 = v18;
    dispatch_source_set_event_handler(v18, &stru_1000085F8);
    dispatch_resume(v19);
    operator new();
  }
  __assert_rtn("main", "mediaserverd.mm", 258, "gSTS_TERM != NULL");
}

void sub_100003F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,char a39)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a38 < 0) {
    operator delete(a33);
  }
  _Unwind_Resume(a1);
}

const char *sub_10000406C()
{
  return "CAException";
}

void sub_100004078(std::exception *a1)
{
  std::exception::~exception(a1);

  operator delete();
}

void sub_1000040B4(uint64_t a1)
{
  sub_10000414C(a1);

  operator delete();
}

uint64_t sub_1000040F0()
{
  return 0;
}

uint64_t sub_1000040F8()
{
  return 0;
}

uint64_t sub_100004100(uint64_t result)
{
  *(unsigned char *)(result + 8) = 0;
  return result;
}

uint64_t sub_100004108(uint64_t result)
{
  *(unsigned char *)(result + 8) = 1;
  return result;
}

void sub_100004114(uint64_t a1)
{
  sub_10000414C(a1);

  operator delete();
}

uint64_t sub_10000414C(uint64_t result)
{
  *(void *)result = &off_100008588;
  if (*(unsigned char *)(result + 8))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v1 = 136315394;
      v2 = "CAD_SubServer.cpp";
      __int16 v3 = 1024;
      int v4 = 36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d  CAD_SubServer::~CAD_SubServer: still running at destruction", (uint8_t *)&v1, 0x12u);
    }
    __break(1u);
  }
  return result;
}

void sub_100004224(id a1)
{
  qword_10000C038 = (uint64_t)os_log_create("com.apple.coreaudio.mediaserverd", "service");
}

void sub_100004254(void *a1)
{
}

void sub_100004268()
{
}

void *sub_100004280(unint64_t a1)
{
  if (a1 >> 61) {
    sub_100004538();
  }
  return operator new(8 * a1);
}

uint64_t sub_1000042B8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t sub_1000042F4()
{
  if (!qword_10000C058) {
    qword_10000C058 = _sl_dlopen();
  }
  return qword_10000C058;
}

uint64_t sub_1000043C4()
{
  uint64_t v0 = sub_1000042F4();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *sub_100004420(uint64_t a1)
{
  v2 = (void *)sub_1000043C4();
  result = dlsym(v2, "MSNMonitorStartMic");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10000C060 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100004470(unint64_t a1)
{
  if (a1 >> 60) {
    sub_100004538();
  }
  return operator new(16 * a1);
}

void sub_1000044A8(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100004504(exception, a1);
}

void sub_1000044F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100004504(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100004538()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t sub_10000456C()
{
  uint64_t result = _sl_dlopen();
  qword_10000C058 = result;
  return result;
}

uint64_t sub_1000045E0()
{
  uint64_t result = audiomxd_enabled();
  if (result)
  {
    return AudioToolboxServerInit();
  }
  return result;
}

uint64_t sub_100004618()
{
  uint64_t result = audiomxd_enabled();
  if (result)
  {
    return AudioToolboxServerInit();
  }
  return result;
}

void sub_100004650(uint64_t a1)
{
  sub_10000414C(a1);

  operator delete();
}

void sub_10000468C(id a1)
{
  int v1 = CADefaultLog();
  if (v1)
  {
    v2 = v1;
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315394;
      int v4 = "mediaserverd.mm";
      __int16 v5 = 1024;
      int v6 = 260;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d SIGTERM received, process about to terminate.", (uint8_t *)&v3, 0x12u);
    }
  }
  if (qword_10000C030)
  {
    byte_10000C048 = 1;
    CFRunLoopStop((CFRunLoopRef)qword_10000C030);
  }
}

void sub_10000475C(id a1, int a2)
{
  v2 = CADefaultLog();
  if (v2)
  {
    int v3 = v2;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315394;
      __int16 v5 = "mediaserverd.mm";
      __int16 v6 = 1024;
      int v7 = 139;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d com.apple.language.changed notification received, audiomxd exiting", (uint8_t *)&v4, 0x12u);
    }
  }
  exit(0);
}

std::string *sub_1000047EC(std::string *this, std::string *a2, std::string *a3)
{
  int v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = (char *)a3 - (char *)a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    v10 = this;
  }
  if (v10 > v4 || (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    v13 = this;
    if ((v6 & 0x80) != 0) {
      v13 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    v14 = (char *)v13 + size;
    do
    {
      std::string::value_type v15 = v4->__r_.__value_.__s.__data_[0];
      int v4 = (std::string *)((char *)v4 + 1);
      *v14++ = v15;
    }
    while (v4 != a3);
    std::string::value_type *v14 = 0;
    std::string::size_type v16 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v16;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v16 & 0x7F;
    }
  }
  else
  {
    if (v7 >= 0x7FFFFFFFFFFFFFF8) {
      sub_1000049AC();
    }
    if (v7 > 0x16)
    {
      uint64_t v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v17 = v7 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_p = (std::string::value_type *)operator new(v17 + 1);
      std::string::size_type v24 = v7;
      int64_t v25 = v18 | 0x8000000000000000;
      __p = p_p;
    }
    else
    {
      HIBYTE(v25) = v7;
      p_p = (std::string::value_type *)&__p;
    }
    do
    {
      std::string::value_type v19 = v4->__r_.__value_.__s.__data_[0];
      int v4 = (std::string *)((char *)v4 + 1);
      *p_p++ = v19;
    }
    while (v4 != a3);
    std::string::value_type *p_p = 0;
    if (v25 >= 0) {
      v20 = (const std::string::value_type *)&__p;
    }
    else {
      v20 = (const std::string::value_type *)__p;
    }
    if (v25 >= 0) {
      std::string::size_type v21 = HIBYTE(v25);
    }
    else {
      std::string::size_type v21 = v24;
    }
    std::string::append(this, v20, v21);
    if (SHIBYTE(v25) < 0) {
      operator delete(__p);
    }
  }
  return this;
}

void sub_100004990(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000049AC()
{
}

void sub_1000049C4()
{
}

void sub_100004C8C()
{
  sub_100005FC0(v1);
  XPC_Connection::~XPC_Connection(v0);
  operator delete();
}

void sub_100004D04(uint64_t a1, xpc_object_t object)
{
  int v3 = *(_xpc_connection_s ***)(a1 + 40);
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  char v43 = 0;
  xpc_object_t v42 = object;
  if (object)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    xpc_object_t v5 = v42;
  }
  else
  {
    xpc_object_t v5 = 0;
    xpc_object_t reply = 0;
  }
  int Property = 560821095;
  xpc_object_t xdict = reply;
  char v40 = 1;
  v8 = v3 + 6;
  unint64_t v7 = v3[6];
  AudioFilePropertyID v37 = 0;
  if (!v5) {
    goto LABEL_8;
  }
  xpc_object_t v9 = xpc_dictionary_get_value(v5, "type");
  v10 = v9;
  if (!v9 || xpc_get_type(v9) != (xpc_type_t)&_xpc_type_uint64) {
    goto LABEL_8;
  }
  int v12 = xpc_uint64_get_value(v10);
  if (v12 > 1869636973)
  {
    switch(v12)
    {
      case 1869636974:
        if (!v42) {
          goto LABEL_61;
        }
        xpc_object_t v19 = xpc_dictionary_get_value(v42, "data");
        v20 = v19;
        if (!v19 || xpc_get_type(v19) != (xpc_type_t)&_xpc_type_data) {
          goto LABEL_61;
        }
        xpc_data_get_length(v20);
        bytes_ptr = (const char *)xpc_data_get_bytes_ptr(v20);
        uint64_t v29 = 0;
        int Property = sub_100005424(bytes_ptr, (CFURLRef *)&v29);
        if (Property) {
          goto LABEL_8;
        }
        LODWORD(inStartingPacket) = 0;
        sub_100005520((uint64_t)v42, "hint", &inStartingPacket);
        if (!v7)
        {
          int Property = AudioFileOpenURL((CFURLRef)v29, kAudioFileReadPermission, inStartingPacket, v3 + 6);
          if (!Property)
          {
            v22 = v3[6];
            ioDataSize[0] = 40;
            int Property = AudioFileGetProperty(v22, 0x64666D74u, ioDataSize, v3 + 16);
            if (Property) {
              AudioFileClose(v22);
            }
          }
          goto LABEL_8;
        }
        break;
      case 1886547824:
        if (v7)
        {
          if (!sub_100005520((uint64_t)v42, "selector", &v37)) {
            goto LABEL_61;
          }
          AudioFilePropertyID v23 = v37;
          int v24 = sub_100005580(v37);
          if ((v24 & 1) != 0 || v23 == 1633776244 || v23 == 1819243876 || v23 == 1768842863)
          {
            ioDataSize[0] = 0;
            isWritable[0] = 0;
            int Property = AudioFileGetPropertyInfo(v7, v23, ioDataSize, isWritable);
            if (Property) {
              goto LABEL_8;
            }
            if (v23 == 1633776244 || v23 == 1819243876 || v23 == 1768842863)
            {
              SInt64 inStartingPacket = 0;
              int Property = AudioFileGetProperty(v7, v23, ioDataSize, &inStartingPacket);
              if (!Property)
              {
                CFDataRef Data = CFPropertyListCreateData(kCFAllocatorDefault, (CFPropertyListRef)inStartingPacket, kCFPropertyListBinaryFormat_v1_0, 0, 0);
                uint64_t v29 = (uint64_t)Data;
                LOBYTE(value) = 1;
                if (Data)
                {
                  unsigned int Length = CFDataGetLength(Data);
                  BytePtr = CFDataGetBytePtr((CFDataRef)v29);
                  if (xdict) {
                    xpc_dictionary_set_data(xdict, "data", BytePtr, Length);
                  }
                  int Property = 0;
                }
                else
                {
                  int Property = 2003334207;
                }
                sub_100005758((uint64_t)&v29);
              }
              goto LABEL_8;
            }
            if (v24)
            {
              sub_100005794(&v29, ioDataSize[0]);
              int Property = AudioFileGetProperty(v7, v23, ioDataSize, (void *)v29);
              v28 = (void *)v29;
              if (Property)
              {
                if (v29) {
                  free((void *)v29);
                }
                goto LABEL_8;
              }
              if (xdict)
              {
                xpc_dictionary_set_data(xdict, "data", (const void *)v29, ioDataSize[0]);
                v28 = (void *)v29;
              }
              if (v28) {
                free(v28);
              }
LABEL_83:
              int Property = 0;
              goto LABEL_8;
            }
          }
          goto LABEL_76;
        }
        break;
      case 1919246692:
        UInt32 ioNumPackets = 0;
        SInt64 inStartingPacket = 0;
        if (v42)
        {
          xpc_object_t v13 = xpc_dictionary_get_value(v42, "numbytes");
          v14 = v13;
          if (v13)
          {
            if (xpc_get_type(v13) == (xpc_type_t)&_xpc_type_uint64)
            {
              UInt32 v15 = xpc_uint64_get_value(v14);
              UInt32 ioNumBytes = v15;
              if (sub_100005520((uint64_t)v42, "numpackets", &ioNumPackets))
              {
                if (sub_100005804((uint64_t)v42, &inStartingPacket))
                {
                  *(void *)isWritable = 0;
                  *(void *)ioDataSize = 0;
                  uint64_t value = 2;
                  uint64_t v29 = (uint64_t)off_100008818;
                  int fd = -1;
                  int Property = sub_10000586C((uint64_t)(v3 + 7), (uint64_t)(v3 + 16), v15, ioNumPackets, (unsigned int **)ioDataSize, (unsigned int **)isWritable, &v29);
                  if (Property) {
                    goto LABEL_8;
                  }
                  int Property = AudioFileReadPacketData(v7, 0, &ioNumBytes, *(AudioStreamPacketDescription **)isWritable, inStartingPacket, &ioNumPackets, *(void **)(*(void *)ioDataSize + 16));
                  if (Property) {
                    goto LABEL_8;
                  }
                  if (xdict)
                  {
                    xpc_dictionary_set_uint64(xdict, "numbytes", ioNumBytes);
                    if (xdict) {
                      xpc_dictionary_set_uint64(xdict, "numpackets", ioNumPackets);
                    }
                  }
                  int v16 = fd;
                  if (fd)
                  {
                    xpc_object_t v17 = xdict;
                    if (xdict)
                    {
                      xpc_dictionary_set_uint64(xdict, "bufsize", HIDWORD(value));
                      xpc_object_t v17 = xdict;
                      int v16 = fd;
                    }
                    xpc_dictionary_set_fd(v17, "bufFD", v16);
                  }
                  goto LABEL_83;
                }
              }
            }
          }
        }
LABEL_61:
        int Property = -50;
        goto LABEL_8;
      default:
        goto LABEL_8;
    }
    goto LABEL_63;
  }
  if (v12 == 1668050803)
  {
    AudioFileClose(*v8);
    int Property = 0;
    AudioFileID *v8 = 0;
    goto LABEL_8;
  }
  if (v12 == 1768842863)
  {
    if (v7)
    {
      if (!sub_100005520((uint64_t)v42, "selector", &v37)) {
        goto LABEL_61;
      }
      AudioFilePropertyID v18 = v37;
      if ((sub_100005580(v37) & 1) != 0 || v18 == 1633776244 || v18 == 1819243876 || v18 == 1768842863)
      {
        LODWORD(v29) = 0;
        LODWORD(inStartingPacket) = 0;
        int Property = AudioFileGetPropertyInfo(v7, v18, (UInt32 *)&v29, (UInt32 *)&inStartingPacket);
        if (!Property)
        {
          if (xdict)
          {
            xpc_dictionary_set_uint64(xdict, "size", v29);
            if (xdict) {
              xpc_dictionary_set_uint64(xdict, "writable", inStartingPacket);
            }
          }
        }
        goto LABEL_8;
      }
LABEL_76:
      int Property = 1886681407;
      goto LABEL_8;
    }
LABEL_63:
    int Property = 560951410;
  }
LABEL_8:
  if (xdict) {
    xpc_dictionary_set_int64(xdict, "status", Property);
  }
  unint64_t v11 = v3[1];
  if (v11) {
    xpc_connection_send_message(v11, xdict);
  }
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v38);
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v41);
}

void sub_10000537C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)&v32);
  XPC_Dictionary::~XPC_Dictionary((XPC_Dictionary *)(v30 - 72));
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

uint64_t sub_100005424(const char *a1, CFURLRef *a2)
{
  if (!a1) {
    return 4294967246;
  }
  if (strncmp(a1, "ipod-library", 0xCuLL)) {
    return 4294967253;
  }
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x201u);
  if (!v5) {
    return 4294967246;
  }
  CFStringRef v6 = v5;
  CFURLRef v7 = CFURLCreateWithString(kCFAllocatorDefault, v5, 0);
  CFRelease(v6);
  if (!v7) {
    return 4294967246;
  }
  if (!PUTIsPersistentURL())
  {
    CFRelease(v7);
    return 4294967253;
  }
  CFStringRef v8 = (const __CFString *)PUTCreatePathForPersistentURL();
  CFRelease(v7);
  uint64_t v4 = 4294967253;
  if (v8)
  {
    *a2 = CFURLCreateWithString(kCFAllocatorDefault, v8, 0);
    CFRelease(v8);
    if (*a2) {
      return 0;
    }
    else {
      return 4294967253;
    }
  }
  return v4;
}

uint64_t sub_100005520(uint64_t result, const char *a2, _DWORD *a3)
{
  if (result)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, a2);
    if (result)
    {
      uint64_t v4 = (void *)result;
      if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_uint64)
      {
        *a3 = xpc_uint64_get_value(v4);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100005580(int a1)
{
  uint64_t result = 1;
  if (a1 <= 1718775914)
  {
    if (a1 <= 1684434291)
    {
      if (a1 <= 1652125802)
      {
        if (a1 == 1650683508) {
          return result;
        }
        int v3 = 1651663220;
        goto LABEL_31;
      }
      if (a1 == 1652125803 || a1 == 1667787108) {
        return result;
      }
      int v3 = 1668112752;
    }
    else if (a1 > 1701082481)
    {
      if (a1 == 1701082482 || a1 == 1717988724) {
        return result;
      }
      int v3 = 1718383476;
    }
    else
    {
      if (a1 == 1684434292 || a1 == 1685022310) {
        return result;
      }
      int v3 = 1685289589;
    }
LABEL_31:
    if (a1 != v3) {
      return 0;
    }
    return result;
  }
  if (a1 > 1886086769)
  {
    if (a1 > 1886616164)
    {
      if (a1 == 1886616165 || a1 == 1920168566) {
        return result;
      }
      int v3 = 1935832164;
    }
    else
    {
      if (a1 == 1886086770 || a1 == 1886090594) {
        return result;
      }
      int v3 = 1886283375;
    }
    goto LABEL_31;
  }
  if (a1 > 1869640812)
  {
    if (a1 == 1869640813 || a1 == 1885564532) {
      return result;
    }
    int v3 = 1886085753;
    goto LABEL_31;
  }
  if (a1 != 1718775915 && a1 != 1768174452)
  {
    int v3 = 1835493731;
    goto LABEL_31;
  }
  return result;
}

uint64_t sub_100005758(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void *sub_100005794(void *a1, size_t size)
{
  *a1 = 0;
  uint64_t v4 = malloc_type_malloc(size, 0x7C51E058uLL);
  if (size && !v4)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    CFURLRef v7 = std::bad_alloc::bad_alloc(exception);
  }
  *a1 = v4;
  return a1;
}

uint64_t sub_100005804(uint64_t result, int64_t *a2)
{
  if (result)
  {
    uint64_t result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)result, "startingPacket");
    if (result)
    {
      int v3 = (void *)result;
      if (xpc_get_type((xpc_object_t)result) == (xpc_type_t)&_xpc_type_int64)
      {
        *a2 = xpc_int64_get_value(v3);
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_10000586C(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int **a5, unsigned int **a6, _DWORD *a7)
{
  uint64_t v14 = sub_100005EF8(*(unsigned __int8 *)(a1 + 56));
  unsigned int v15 = *(_DWORD *)(a2 + 28);
  if ((*(unsigned char *)(a2 + 12) & 0x20) != 0)
  {
    if (v15 - 65 <= 0xFFFFFFBF)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)address = 136315394;
        *(void *)&address[4] = "SharedAudioBufferList.h";
        __int16 v65 = 1024;
        int v66 = 90;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d  STACK_ABL: invalid number of buffers", address, 0x12u);
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &off_100008878;
      exception[2] = -50;
    }
    int v16 = 1;
  }
  else
  {
    int v16 = *(_DWORD *)(a2 + 28);
    unsigned int v15 = 1;
  }
  __chkstk_darwin(v14);
  AudioFilePropertyID v18 = (unsigned int *)((char *)&v62 - v17);
  bzero((char *)&v62 - v17, v19);
  *AudioFilePropertyID v18 = v15;
  v20 = v18 + 4;
  uint64_t v21 = v15;
  do
  {
    void *v20 = 0;
    *((_DWORD *)v20 - 2) = v16;
    *((_DWORD *)v20 - 1) = a3;
    v20 += 2;
    --v21;
  }
  while (v21);
  if ((a3 & 0xF) != 0) {
    uint64_t v22 = 16 - (a3 & 0xF);
  }
  else {
    uint64_t v22 = 0;
  }
  sub_100005EF8(*(unsigned __int8 *)(a1 + 56));
  unint64_t v23 = (v22 + a3) * v15 + 16 * a4 + 32;
  if (HIDWORD(v23)) {
    return 4294967188;
  }
  sub_100005EF8(*(unsigned __int8 *)(a1 + 56));
  if (*(void *)(a1 + 16) >= (unint64_t)v23) {
    goto LABEL_39;
  }
  size_t v24 = -(int)vm_page_size & (v23 + vm_page_size - 1);
  (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v25 = a7[2];
  switch(v25)
  {
    case 2:
      unsigned int v29 = atomic_fetch_add_explicit(&dword_10000C06C, 1u, memory_order_relaxed) + 1;
      *(_DWORD *)(a1 + 40) = v29;
      pid_t v30 = getpid();
      snprintf(address, 0x40uLL, "AppleABL.%x.%x", v30, v29);
      int v31 = shm_open(address, 514, 511);
      *(_DWORD *)(a1 + 36) = v31;
      if (v31 == -1)
      {
        sub_1000065C0((uint64_t)"shm_open");
        uint64_t memory_entry_64 = *__error();
      }
      else
      {
        ftruncate(v31, v24);
        *(void *)(a1 + 16) = v24;
        uint64_t v32 = mmap(0, v24, 3, 1, *(_DWORD *)(a1 + 36), 0);
        *(void *)(a1 + 24) = v32;
        if ((unint64_t)v32 + 1 > 1)
        {
          *(_WORD *)(a1 + 8) = 257;
          a7[3] = *(void *)(a1 + 16);
          int v33 = *(_DWORD *)(a1 + 36);
LABEL_36:
          a7[4] = v33;
          break;
        }
        uint64_t memory_entry_64 = *__error();
        sub_1000065C0((uint64_t)"mmap");
        close(*(_DWORD *)(a1 + 36));
        *(_DWORD *)(a1 + 36) = -1;
        shm_unlink(address);
      }
LABEL_27:
      if (memory_entry_64) {
        return memory_entry_64;
      }
      break;
    case 1:
      *(void *)(a1 + 16) = v24;
      v28 = mmap(0, v24, 3, 4097, -1, 0);
      *(void *)(a1 + 24) = v28;
      if ((unint64_t)v28 + 1 > 1)
      {
        *(_WORD *)(a1 + 8) = 257;
        xpc_object_t v35 = xpc_shmem_create(v28, *(void *)(a1 + 16));
        if (!v35) {
          xpc_object_t v35 = xpc_null_create();
        }
        v36 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v35;
        xpc_release(v36);
        a7[3] = *(void *)(a1 + 16);
        xpc_object_t v37 = *(xpc_object_t *)(a1 + 48);
        if (v37) {
          xpc_retain(*(xpc_object_t *)(a1 + 48));
        }
        else {
          xpc_object_t v37 = xpc_null_create();
        }
        v38 = (void *)*((void *)a7 + 2);
        *((void *)a7 + 2) = v37;
        xpc_release(v38);
        break;
      }
      uint64_t memory_entry_64 = *__error();
      sub_1000065C0((uint64_t)"mmap");
      goto LABEL_27;
    case 0:
      *(void *)address = 0;
      vm_size_t v26 = (v24 + vm_page_size - 1) & -(uint64_t)vm_page_size;
      if (v26)
      {
        uint64_t memory_entry_64 = vm_allocate(mach_task_self_, (vm_address_t *)address, (v24 + vm_page_size - 1) & -(uint64_t)vm_page_size, 1);
        if (memory_entry_64)
        {
          sub_1000064DC((uint64_t)"vm_allocate", memory_entry_64);
          return memory_entry_64;
        }
        memory_object_size_t size = v26;
        v62 = (int *)(a1 + 32);
        uint64_t memory_entry_64 = mach_make_memory_entry_64(mach_task_self_, &size, *(memory_object_offset_t *)address, 3, (mach_port_t *)(a1 + 32), 0);
        if (memory_entry_64)
        {
          vm_deallocate(mach_task_self_, *(vm_address_t *)address, v26);
          sub_1000064DC((uint64_t)"mach_make_memory_entry_64", memory_entry_64);
          return memory_entry_64;
        }
        ++dword_10000C068;
        uint64_t v34 = *(void *)address;
        **(_DWORD **)address = dword_10000C068;
        int v33 = *v62;
      }
      else
      {
        int v33 = 0;
        uint64_t v34 = 0;
        *(_DWORD *)(a1 + 32) = 0;
      }
      *(_WORD *)(a1 + 8) = 257;
      *(void *)(a1 + 16) = v26;
      *(void *)(a1 + 24) = v34;
      a7[3] = v26;
      goto LABEL_36;
  }
LABEL_39:
  unsigned int v39 = v18[2];
  unsigned int v40 = v18[3];
  v41 = *(unsigned int **)(a1 + 24);
  unsigned int *v41 = v15;
  v41[1] = v39;
  if ((v40 & 0xF) != 0) {
    int v42 = 16 - (v40 & 0xF);
  }
  else {
    int v42 = 0;
  }
  unsigned int v43 = v42 + v40;
  v41[2] = v43;
  v41[3] = v40;
  v41[4] = a4;
  if (v15)
  {
    unint64_t v44 = 0;
    v45 = (char *)(v41 + 8);
    v46 = (const void **)(v18 + 4);
    do
    {
      if (*v46)
      {
        memcpy(v45, *v46, v41[3]);
        unsigned int v43 = v41[2];
      }
      v45 += v43;
      ++v44;
      v46 += 2;
    }
    while (v44 < v15);
    v41 = *(unsigned int **)(a1 + 24);
    if (!v41) {
      return 4294967246;
    }
  }
  unsigned int v47 = *v41;
  v48 = *(unsigned int **)(a1 + 64);
  if (v48)
  {
    if (*v48 >= v47) {
      goto LABEL_53;
    }
    free(v48);
    *(void *)(a1 + 64) = 0;
  }
  v48 = (unsigned int *)malloc_type_malloc(16 * (v47 - 1) + 24, 0x7C51E058uLL);
  if (!v48)
  {
    v60 = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v61 = std::bad_alloc::bad_alloc(v60);
  }
  *(void *)(a1 + 64) = v48;
  unsigned int *v48 = v47;
LABEL_53:
  *a5 = v48;
  v49 = *(unsigned int **)(a1 + 24);
  v50 = *(_DWORD **)(a1 + 64);
  uint64_t v51 = *v49;
  if ((v51 - 1) >= *v50) {
    return 4294967246;
  }
  v52 = v49 + 8;
  _DWORD *v50 = v51;
  v53 = (unsigned int **)(v50 + 4);
  uint64_t v55 = v49[2];
  unsigned int v54 = v49[3];
  unsigned int v56 = v49[1];
  do
  {
    *v53 = v52;
    v52 = (unsigned int *)((char *)v52 + v55);
    *((_DWORD *)v53 - 2) = v56;
    *((_DWORD *)v53 - 1) = v54;
    v53 += 2;
    --v51;
  }
  while (v51);
  uint64_t memory_entry_64 = 0;
  if (v49[4]) {
    v57 = v52;
  }
  else {
    v57 = 0;
  }
  *a6 = v57;
  return memory_entry_64;
}

void sub_100005ED4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_100004254(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100005EF8(uint64_t result)
{
  if (!(_BYTE)result)
  {
    if (os_log_type_enabled(0, OS_LOG_TYPE_ERROR))
    {
      int v1 = 136315394;
      v2 = "SharedAudioBufferList.h";
      __int16 v3 = 1024;
      int v4 = 194;
      _os_log_impl((void *)&_mh_execute_header, 0, OS_LOG_TYPE_ERROR, "%25s:%-5d ASSERTION FAILURE [(mIsServer) != 0 is false]: ", (uint8_t *)&v1, 0x12u);
    }
    __break(1u);
  }
  return result;
}

void sub_100005FA8()
{
}

uint64_t sub_100005FC0(void *a1)
{
  *a1 = off_1000087F0;
  v2 = (void *)a1[8];
  if (v2)
  {
    free(v2);
    a1[8] = 0;
  }

  return sub_100006020((uint64_t)a1);
}

uint64_t sub_100006020(uint64_t a1)
{
  *(void *)a1 = off_1000088C0;
  sub_100006320(a1);
  xpc_release(*(xpc_object_t *)(a1 + 48));
  *(void *)(a1 + 48) = 0;
  return a1;
}

void sub_100006078(void *a1)
{
  sub_100005FC0(a1);

  operator delete();
}

void sub_1000060B4(XPC_Connection *a1)
{
  *(void *)a1 = off_1000087C8;
  v2 = (void *)*((void *)a1 + 24);
  if (v2)
  {
    os_release(v2);
    *((void *)a1 + 24) = 0;
  }
  __int16 v3 = (OpaqueAudioFileID *)*((void *)a1 + 6);
  if (v3)
  {
    AudioFileClose(v3);
    int v4 = (void *)*((void *)a1 + 24);
    if (v4)
    {
      os_release(v4);
      *((void *)a1 + 24) = 0;
    }
  }
  sub_100005FC0((void *)a1 + 7);
  XPC_Connection::~XPC_Connection(a1);

  operator delete();
}

void sub_100006154(XPC_Connection *a1)
{
  *(void *)a1 = off_1000087C8;
  v2 = (void *)*((void *)a1 + 24);
  if (v2)
  {
    os_release(v2);
    *((void *)a1 + 24) = 0;
  }
  __int16 v3 = (OpaqueAudioFileID *)*((void *)a1 + 6);
  if (v3)
  {
    AudioFileClose(v3);
    int v4 = (void *)*((void *)a1 + 24);
    if (v4)
    {
      os_release(v4);
      *((void *)a1 + 24) = 0;
    }
  }
  sub_100005FC0((void *)a1 + 7);

  XPC_Connection::~XPC_Connection(a1);
}

void sub_1000061E0()
{
}

uint64_t sub_1000061F8(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  a1[1] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  __int16 v3 = a1[2];
  if (v3)
  {
    dispatch_release(v3);
    a1[2] = 0;
  }
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    CFStringRef v5 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v5();
  }
  return result;
}

xpc_type_t sub_1000062A0(uint64_t a1, xpc_object_t object)
{
  uint64_t v2 = *(void *)(a1 + 32);
  xpc_type_t result = xpc_get_type(object);
  if (result == (xpc_type_t)&_xpc_type_connection)
  {
    int v4 = *(uint64_t (**)(void))(**(void **)v2 + 16);
    return (xpc_type_t)v4();
  }
  return result;
}

void sub_100006320(uint64_t a1)
{
  vm_address_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 9))
    {
      if (*(_DWORD *)(a1 + 32))
      {
        uint64_t v3 = vm_deallocate(mach_task_self_, v2, *(void *)(a1 + 16));
        if (v3) {
          sub_1000064DC((uint64_t)"vm_deallocate", v3);
        }
        mach_port_name_t v4 = *(_DWORD *)(a1 + 32);
        if (v4)
        {
          uint64_t v5 = mach_port_deallocate(mach_task_self_, v4);
          if (v5) {
            sub_1000064DC((uint64_t)"mach_port_deallocate", v5);
          }
        }
        *(unsigned char *)(a1 + 9) = 0;
        *(_DWORD *)(a1 + 32) = 0;
      }
      else if (xpc_get_type(*(xpc_object_t *)(a1 + 48)) == (xpc_type_t)&_xpc_type_null)
      {
        if (*(_DWORD *)(a1 + 36) != -1)
        {
          if (munmap(*(void **)(a1 + 24), *(void *)(a1 + 16))) {
            sub_1000065C0((uint64_t)"munmap");
          }
          if (close(*(_DWORD *)(a1 + 36))) {
            sub_1000065C0((uint64_t)"close");
          }
          if (*(unsigned char *)(a1 + 8))
          {
            int v8 = *(_DWORD *)(a1 + 40);
            pid_t v9 = getpid();
            snprintf(__str, 0x40uLL, "AppleABL.%x.%x", v9, v8);
            if (shm_unlink(__str)) {
              sub_1000065C0((uint64_t)"shm_unlink");
            }
          }
          *(_DWORD *)(a1 + 36) = -1;
        }
      }
      else
      {
        xpc_object_t v6 = xpc_null_create();
        CFURLRef v7 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v6;
        xpc_release(v7);
        if (munmap(*(void **)(a1 + 24), *(void *)(a1 + 16))) {
          sub_1000065C0((uint64_t)"munmap");
        }
      }
    }
    else if (*(unsigned char *)(a1 + 8))
    {
      free(*(void **)(a1 + 24));
    }
  }
  *(void *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = 0;
}

void sub_1000064CC(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_100004254(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000064DC(uint64_t a1, uint64_t a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136316162;
    xpc_object_t v6 = "SharableMemory.cpp";
    __int16 v7 = 1024;
    int v8 = 52;
    __int16 v9 = 2080;
    uint64_t v10 = a1;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 2080;
    uint64_t v14 = mach_error_string(a2);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: 0x%x (%s)", (uint8_t *)&v5, 0x2Cu);
  }
  return a2;
}

void sub_1000065C0(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v2 = *__error();
    int v3 = 136315906;
    mach_port_name_t v4 = "SharableMemory.cpp";
    __int16 v5 = 1024;
    int v6 = 58;
    __int16 v7 = 2080;
    uint64_t v8 = a1;
    __int16 v9 = 1024;
    int v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%25s:%-5d %s failed: errno %d", (uint8_t *)&v3, 0x22u);
  }
}

void sub_100006694(uint64_t a1)
{
  sub_100006020(a1);

  operator delete();
}

uint64_t AudioConverterPrepare()
{
  return _AudioConverterPrepare();
}

OSStatus AudioFileClose(AudioFileID inAudioFile)
{
  return _AudioFileClose(inAudioFile);
}

OSStatus AudioFileGetProperty(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *ioDataSize, void *outPropertyData)
{
  return _AudioFileGetProperty(inAudioFile, inPropertyID, ioDataSize, outPropertyData);
}

OSStatus AudioFileGetPropertyInfo(AudioFileID inAudioFile, AudioFilePropertyID inPropertyID, UInt32 *outDataSize, UInt32 *isWritable)
{
  return _AudioFileGetPropertyInfo(inAudioFile, inPropertyID, outDataSize, isWritable);
}

OSStatus AudioFileOpenURL(CFURLRef inFileRef, AudioFilePermissions inPermissions, AudioFileTypeID inFileTypeHint, AudioFileID *outAudioFile)
{
  return _AudioFileOpenURL(inFileRef, inPermissions, inFileTypeHint, outAudioFile);
}

OSStatus AudioFileReadPacketData(AudioFileID inAudioFile, Boolean inUseCache, UInt32 *ioNumBytes, AudioStreamPacketDescription *outPacketDescriptions, SInt64 inStartingPacket, UInt32 *ioNumPackets, void *outBuffer)
{
  return _AudioFileReadPacketData(inAudioFile, inUseCache, ioNumBytes, outPacketDescriptions, inStartingPacket, ioNumPackets, outBuffer);
}

uint64_t AudioToolboxServerInit()
{
  return _AudioToolboxServerInit();
}

uint64_t CADefaultLog()
{
  return _CADefaultLog();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MXInitialize()
{
  return _MXInitialize();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PUTCreatePathForPersistentURL()
{
  return _PUTCreatePathForPersistentURL();
}

uint64_t PUTIsPersistentURL()
{
  return _PUTIsPersistentURL();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
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

void XPC_Object::~XPC_Object(XPC_Object *this)
{
}

uint64_t XPC_Connection::Initialize(XPC_Connection *this)
{
  return XPC_Connection::Initialize(this);
}

void XPC_Connection::~XPC_Connection(XPC_Connection *this)
{
}

void XPC_Dictionary::~XPC_Dictionary(XPC_Dictionary *this)
{
}

uint64_t PlatformUtilities::processName(PlatformUtilities *this, int a2)
{
  return PlatformUtilities::processName(this, a2);
}

uint64_t PlatformUtilities_iOS::IsInternalBuild(PlatformUtilities_iOS *this)
{
  return PlatformUtilities_iOS::IsInternalBuild(this);
}

uint64_t CACFArray::GetCFType(CACFArray *this, uint64_t a2, const void **a3)
{
  return CACFArray::GetCFType(this, a2, a3);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return std::string::append(this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

const std::error_category *std::system_category(void)
{
  return std::system_category();
}

BOOL std::__fs::filesystem::__create_directory(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return std::__fs::filesystem::__create_directory(a1, a2);
}

void std::__fs::filesystem::__create_directory_symlink(const std::__fs::filesystem::path *__to, const std::__fs::filesystem::path *__new_symlink, std::error_code *__ec)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return std::bad_alloc::bad_alloc(this);
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t audiomxd_enabled()
{
  return _audiomxd_enabled();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return _mach_make_memory_entry_64(target_task, size, offset, permission, object_handle, parent_entry);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

void openlog(const char *a1, int a2, int a3)
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

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t proc_disable_wakemon()
{
  return _proc_disable_wakemon();
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return _pthread_get_qos_class_np(__pthread, __qos_class, __relative_priority);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_fixedpriority_self();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_timeshare_self();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
}

int shm_unlink(const char *a1)
{
  return _shm_unlink(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t tb_conclave_endpoint_for_service()
{
  return _tb_conclave_endpoint_for_service();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

uint64_t wd_endpoint_activate()
{
  return _wd_endpoint_activate();
}

uint64_t wd_endpoint_register()
{
  return _wd_endpoint_register();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_fd(xpc_object_t xdict, const char *key, int fd)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

xpc_object_t xpc_null_create(void)
{
  return _xpc_null_create();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return _xpc_shmem_create(region, length);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}