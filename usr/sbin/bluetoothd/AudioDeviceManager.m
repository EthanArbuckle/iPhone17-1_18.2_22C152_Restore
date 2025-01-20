@interface AudioDeviceManager
+ (id)sharedManager;
- (AudioDeviceManager)init;
- (AudioSkywalkProvider)getAudioSkywalkProvider;
- (basic_string<char,)getClientBundleIDs;
- (dispatch_queue_s)getXpcQueue;
- (id).cxx_construct;
- (void)configureXPCListener;
- (void)dealloc;
- (void)forwardEvent:(void *)a3 forUid:()basic_string<char;
- (void)getDeviceForUID:()basic_string<char;
- (void)handleListenerEvent:(void *)a3;
- (void)publishAndRegisterDevice:(int)a3 withArgs:(void *)a4 uid:()basic_string<char device:()std:(std::allocator<char>> *)a5 :char_traits<char>;
- (void)removeXpcClient:(void *)a3;
- (void)republishAllAudioDevices;
- (void)sendMsg:(int)a3 withArgs:(void *)a4 uid:()basic_string<char;
@end

@implementation AudioDeviceManager

+ (id)sharedManager
{
  if (qword_100A125B8 != -1) {
    dispatch_once(&qword_100A125B8, &stru_1009A9DF0);
  }
  v2 = (void *)qword_100A125B0;

  return v2;
}

- (AudioDeviceManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AudioDeviceManager;
  v2 = [(AudioDeviceManager *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, -1);
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("AudioDeviceManager", v4);
    [(AudioDeviceManager *)v2 configureXPCListener];
  }
  return v2;
}

- (void)dealloc
{
  self->_audioSkywalkProvider = 0;
  v2.receiver = self;
  v2.super_class = (Class)AudioDeviceManager;
  [(AudioDeviceManager *)&v2 dealloc];
}

- (void)configureXPCListener
{
  mach_service = xpc_connection_create_mach_service("com.apple.BTAudioHALPlugin.xpc", (dispatch_queue_t)self->_queue, 1uLL);
  self->_listener = mach_service;
  if (mach_service)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10037DDE0;
    handler[3] = &unk_1009A9E18;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(self->_listener);
  }
}

- (void)handleListenerEvent:(void *)a3
{
  xpc_type_t type = xpc_get_type(a3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v7 = qword_100A19E48;
    if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      v11 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AudioDeviceManager received new xpc connection from %p", (uint8_t *)&v10, 0xCu);
    }
    operator new();
  }
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a3, _xpc_error_key_description);
    v9 = qword_100A19E48;
    if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_ERROR)) {
      sub_10075B4BC((uint64_t)string, v9);
    }
  }
  else
  {
    v5 = xpc_copy_description(a3);
    objc_super v6 = qword_100A19E48;
    if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_ERROR)) {
      sub_10075B534((uint64_t)v5, v6);
    }
    free(v5);
  }
}

- (void)publishAndRegisterDevice:(int)a3 withArgs:(void *)a4 uid:()basic_string<char device:()std:(std::allocator<char>> *)a5 :char_traits<char>
{
  uint64_t v6 = v5;
  uint64_t v9 = *(void *)&a3;
  if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0) {
    unint64_t var1 = a5->var0.var0.var0.var1.var1;
  }
  else {
    unint64_t var1 = *((unsigned __int8 *)&a5->var0.var0.var0.var1 + 23);
  }
  v12 = qword_100A19E48;
  if (!var1 && os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[AudioDeviceManager publishAndRegisterDevice:] uid is empty", buf, 2u);
    v12 = qword_100A19E48;
    if (v6) {
      goto LABEL_9;
    }
  }
  else if (v6)
  {
    goto LABEL_9;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "[AudioDeviceManager publishAndRegisterDevice:] device is nil", buf, 2u);
    v12 = qword_100A19E48;
  }
LABEL_9:
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    var0 = a5;
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 136446466;
    *(void *)&buf[4] = var0;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[AudioDeviceManager publishAndRegisterDevice:] Register audio device %{public}s with XpcAudioPluginDevice: %p", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  sub_10003AED0((uint64_t)buf, (uint64_t)&self->audioDeviceMapMutex);
  v16 = a5;
  sub_10037EDE4((uint64_t **)&self->audioDevices, (const void **)a5, (uint64_t)&unk_1007BE9D0, (long long **)&v16)[7] = v6;
  if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
  {
    sub_10003B098(__p, a5->var0.var0.var0.var1.var0, a5->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a5->var0.var0.var0.var0.var0;
    uint64_t v15 = *((void *)&a5->var0.var0.var0.var1 + 2);
  }
  [(AudioDeviceManager *)self sendMsg:v9 withArgs:a4 uid:__p];
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  sub_10003AFB4((uint64_t)buf);
}

- (void)sendMsg:(int)a3 withArgs:(void *)a4 uid:()basic_string<char
{
  *(_OWORD *)keys = *(_OWORD *)off_1009A9E38;
  v35 = "kBTAudioMsgArgs";
  xpc_object_t values = xpc_int64_create(a3);
  var0 = a5;
  if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0) {
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
  }
  xpc_object_t object = xpc_string_create((const char *)var0);
  v33 = a4;
  if (a4) {
    size_t v10 = 3;
  }
  else {
    size_t v10 = 2;
  }
  xpc_object_t v11 = xpc_dictionary_create((const char *const *)keys, &values, v10);
  v12 = qword_100A19E48;
  if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_DEBUG))
  {
    v24 = a5;
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0) {
      v24 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
    }
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v28 = a3;
    *(_WORD *)&v28[4] = 2082;
    *(void *)&v28[6] = v24;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Sending XPC message %d for %{public}s", buf, 0x12u);
  }
  if (a3 == 4)
  {
    if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0)
    {
      if (!a5->var0.var0.var0.var1.var1) {
        goto LABEL_12;
      }
    }
    else if (!*((unsigned char *)&a5->var0.var0.var0.var1 + 23))
    {
LABEL_12:
      v13 = qword_100A19E48;
      if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_FAULT)) {
        sub_10075B5F0(v13);
      }
    }
    v26[0] = 0;
    v26[1] = 0;
    sub_10003AED0((uint64_t)v26, (uint64_t)&self->audioDeviceMapMutex);
    v14 = (AudioDeviceManager *)sub_10003156C((uint64_t)&self->audioDevices, (const void **)a5);
    if (&self->audioDevices.__tree_.__pair1_ != (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)v14)
    {
      left = v14->audioDevices.__tree_.__pair1_.__value_.__left_;
      uint64_t v16 = sub_10037EF3C((uint64_t **)&self->audioDevices, (const void **)a5);
      v17 = qword_100A19E48;
      if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_DEFAULT))
      {
        if (*((char *)&a5->var0.var0.var0.var1 + 23) < 0) {
          a5 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)a5->var0.var0.var0.var1.var0;
        }
        unint64_t value = self->audioDevices.__tree_.__pair3_.__value_;
        *(_DWORD *)buf = 134218498;
        *(void *)v28 = v16;
        *(_WORD *)&v28[8] = 2082;
        *(void *)&v28[10] = a5;
        __int16 v29 = 2048;
        unint64_t v30 = value;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Erased %lu audio device %{public}s from audio device map. Map now has %lu devices", buf, 0x20u);
      }
      v19 = +[AudioDeviceManager sharedManager];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10037E5CC;
      block[3] = &unk_100997528;
      block[4] = left;
      dispatch_async((dispatch_queue_t)[v19 getXpcQueue], block);
    }
    sub_10003AFE8((uint64_t)v26);
    sub_10003AFB4((uint64_t)v26);
  }
  begin = (uint64_t *)self->xpcClients.__begin_;
  end = self->xpcClients.__end_;
  if (begin == (uint64_t *)end) {
    goto LABEL_24;
  }
  do
  {
    v22 = (_xpc_connection_s *)sub_1002599F0(*begin);
    xpc_connection_send_message(v22, v11);
    ++begin;
  }
  while (begin != (uint64_t *)end);
  if (self->xpcClients.__end_ == self->xpcClients.__begin_)
  {
LABEL_24:
    v23 = qword_100A19E48;
    if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_ERROR)) {
      sub_10075B5AC(v23);
    }
  }
  xpc_release(v11);
  xpc_release(object);
  xpc_release(values);
}

- (void)republishAllAudioDevices
{
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)self->audioDevices.__tree_.__begin_node_;
  p_pair1 = &self->audioDevices.__tree_.__pair1_;
  if (begin_node != &self->audioDevices.__tree_.__pair1_)
  {
    do
    {
      v4 = qword_100A19E48;
      if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_DEFAULT))
      {
        left = begin_node + 4;
        if (SHIBYTE(begin_node[6].__value_.__left_) < 0) {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)left->__value_.__left_;
        }
        *(_DWORD *)buf = 136315138;
        size_t v10 = left;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Republishing %s", buf, 0xCu);
      }
      sub_100310488((uint64_t)begin_node[7].__value_.__left_);
      uint64_t v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)begin_node[1].__value_.__left_;
      if (v6)
      {
        do
        {
          v7 = v6;
          uint64_t v6 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)v6->__value_.__left_;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)begin_node[2].__value_.__left_;
          BOOL v8 = v7->__value_.__left_ == begin_node;
          begin_node = v7;
        }
        while (!v8);
      }
      begin_node = v7;
    }
    while (v7 != p_pair1);
  }
}

- (void)forwardEvent:(void *)a3 forUid:()basic_string<char
{
  var0 = a4;
  v7 = (char *)&a4->var0.var0.var0.var1 + 23;
  if (*((char *)&a4->var0.var0.var0.var1 + 23) < 0)
  {
    sub_10003B098(__p, a4->var0.var0.var0.var1.var0, a4->var0.var0.var0.var1.var1);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a4->var0.var0.var0.var0.var0;
    uint64_t v12 = *((void *)&a4->var0.var0.var0.var1 + 2);
  }
  BOOL v8 = [(AudioDeviceManager *)self getDeviceForUID:__p];
  if (SHIBYTE(v12) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v9 = qword_100A19E48;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_DEBUG)) {
      sub_10075B634(v7, var0, v9);
    }
    sub_10030FEB4((uint64_t)v8, a3);
  }
  else if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_ERROR))
  {
    if (*v7 < 0) {
      var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
    }
    int int64 = xpc_dictionary_get_int64(a3, "kBTAudioMsgId");
    *(_DWORD *)buf = 136446466;
    v14 = var0;
    __int16 v15 = 1024;
    int v16 = int64;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "No device found for uid %{public}s to send msg %u", buf, 0x12u);
  }
}

- (void)getDeviceForUID:()basic_string<char
{
  v8[0] = 0;
  v8[1] = 0;
  sub_10003AED0((uint64_t)v8, (uint64_t)&self->audioDeviceMapMutex);
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0)
  {
    if (a3->var0.var0.var0.var1.var1) {
      goto LABEL_7;
    }
  }
  else if (*((unsigned char *)&a3->var0.var0.var0.var1 + 23))
  {
    goto LABEL_7;
  }
  uint64_t v5 = qword_100A19E48;
  if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_FAULT)) {
    sub_10075B6BC(v5);
  }
LABEL_7:
  if (&self->audioDevices.__tree_.__pair1_ == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, BT::XpcAudioPluginDevice *>, void *>>> *)sub_10003156C((uint64_t)&self->audioDevices, (const void **)a3)) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = *(void **)sub_10036C70C((uint64_t)&self->audioDevices, (const void **)a3);
  }
  sub_10003AFB4((uint64_t)v8);
  return v6;
}

- (AudioSkywalkProvider)getAudioSkywalkProvider
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10037E9F4;
  block[3] = &unk_100997450;
  block[4] = self;
  if (qword_100A125C0 != -1) {
    dispatch_once(&qword_100A125C0, block);
  }
  return self->_audioSkywalkProvider;
}

- (basic_string<char,)getClientBundleIDs
{
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = 0uLL;
  *((void *)&retstr->var0.var0.var0.var1 + 2) = 0;
  objc_super v2 = (char **)result->var0.var1.var0[0];
  for (unint64_t i = result->var0.var1.var0[1]; v2 != (char **)i; ++v2)
  {
    sub_100585234(*v2, (uint64_t)&v9);
    uint64_t v5 = std::string::append(&v9, ",");
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    int64_t v11 = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v6;
    v5->__r_.__value_.__l.__size_ = 0;
    v5->__r_.__value_.__r.__words[2] = 0;
    v5->__r_.__value_.__r.__words[0] = 0;
    if (v11 >= 0) {
      v7 = __p;
    }
    else {
      v7 = (void **)__p[0];
    }
    if (v11 >= 0) {
      std::string::size_type v8 = HIBYTE(v11);
    }
    else {
      std::string::size_type v8 = (std::string::size_type)__p[1];
    }
    result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)std::string::append((std::string *)retstr, (const std::string::value_type *)v7, v8);
    if (SHIBYTE(v11) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v9.__r_.__value_.__l.__data_);
    }
  }
  return result;
}

- (void)removeXpcClient:(void *)a3
{
  v7 = a3;
  uint64_t v5 = qword_100A19E48;
  if (os_log_type_enabled((os_log_t)qword_100A19E48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = sub_1002599F0((uint64_t)a3);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AudioDeviceManager removing xpc client for connection %p", buf, 0xCu);
  }
  long long v6 = (XpcAudioPluginClient **)sub_10037ECE4(self->xpcClients.__begin_, self->xpcClients.__end_, &v7);
  if (self->xpcClients.__end_ != v6) {
    self->xpcClients.__end_ = v6;
  }
  if (v7)
  {
    sub_1005851C4();
    operator delete();
  }
}

- (dispatch_queue_s)getXpcQueue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  sub_100052DA4(&self->audioDeviceMapMutex);
  sub_10004BA28((uint64_t)&self->audioDevices, (char *)self->audioDevices.__tree_.__pair1_.__value_.__left_);
  begin = self->xpcClients.__begin_;
  if (begin)
  {
    self->xpcClients.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  self->xpcClients.__begin_ = 0;
  self->xpcClients.__end_ = 0;
  self->audioDevices.__tree_.__pair3_.__value_ = 0;
  self->audioDevices.__tree_.__pair1_.__value_.__left_ = 0;
  self->xpcClients.__end_cap_.__value_ = 0;
  self->audioDevices.__tree_.__begin_node_ = &self->audioDevices.__tree_.__pair1_;
  sub_100052DA8(&self->audioDeviceMapMutex);
  return self;
}

@end