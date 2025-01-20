@interface SACloudChannelsInterface
- (BOOL)isSubscribedChannel:(id)a3;
- (SACloudChannel)channelProxy;
- (SACloudChannelsInterface)initWithQueue:(id)a3 isProduction:(BOOL)a4 channelType:(int)a5;
- (id).cxx_construct;
- (id)getPushConnection;
- (void)addToSubscribedChannels:(id)a3;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)removeFromSubscribedChannels:(id)a3;
- (void)setChannelProxy:(SACloudChannel *)a3;
- (void)subscribe:(id)a3 topic:(id)a4;
- (void)unsubcribeForgottenChannels:(id)a3;
- (void)unsubcribeForgottenChannelsForTopic:(id)a3 topicName:(id)a4;
- (void)unsubscribe:(id)a3 topic:(id)a4;
@end

@implementation SACloudChannelsInterface

- (SACloudChannelsInterface)initWithQueue:(id)a3 isProduction:(BOOL)a4 channelType:(int)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = +[NSArray arrayWithObjects:@"com.apple.aps.locationd.safetyalert", @"com.apple.aps.mantis.safetyalert", 0];
  v23.receiver = self;
  v23.super_class = (Class)SACloudChannelsInterface;
  v11 = [(SACloudChannelsInterface *)&v23 init];
  v12 = v11;
  if (v11)
  {
    p_queue = &v11->_queue;
    objc_storeStrong((id *)&v11->_queue, a3);
    v14 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      __int16 v28 = 1026;
      BOOL v29 = v6;
      __int16 v30 = 1026;
      int v31 = a5;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,initWithQueue\", \"isProduction\":%{public}hhd, \"type\":%{public}d}", buf, 0x1Eu);
    }
    id v15 = objc_alloc((Class)APSConnection);
    v16 = &APSEnvironmentProduction;
    if (!v6) {
      v16 = &APSEnvironmentDevelopment;
    }
    v17 = (APSConnection *)[v15 initWithEnvironmentName:*v16 namedDelegatePort:@"com.apple.aps.safetyalerts" queue:*p_queue];
    pushConnection = v12->_pushConnection;
    v12->_pushConnection = v17;

    [(APSConnection *)v12->_pushConnection setDelegate:v12];
    id v19 = objc_alloc_init((Class)NSMutableArray);
    [v19 addObjectsFromArray:v10];
    [(APSConnection *)v12->_pushConnection _setEnabledTopics:v19];
    [(APSConnection *)v12->_pushConnection requestTokenForTopic:@"com.apple.aps.locationd.safetyalert" identifier:0];
    [(APSConnection *)v12->_pushConnection requestTokenForTopic:@"com.apple.aps.mantis.safetyalert" identifier:0];
    v20 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v25 = 0;
      __int16 v26 = 2082;
      v27 = "";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,#channel,Waiting for push notifications\"}", buf, 0x12u);
    }
  }
  v21 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v25 = 0;
    __int16 v26 = 2082;
    v27 = "";
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,Created SACloudChannelsInterface\"}", buf, 0x12u);
  }

  return v12;
}

- (BOOL)isSubscribedChannel:(id)a3
{
  id v4 = a3;
  begin = (char *)self->_activeSubscibedChannels.__begin_;
  end = (char *)self->_activeSubscibedChannels.__end_;
  v18 = self;
  id v7 = v4;
  if (begin != end)
  {
    while (1)
    {
      if (begin[23] < 0)
      {
        sub_100004CB8(&__dst, *(void **)begin, *((void *)begin + 1));
      }
      else
      {
        long long v8 = *(_OWORD *)begin;
        __dst.__r_.__value_.__r.__words[2] = *((void *)begin + 2);
        *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v8;
      }
      id v9 = v7;
      int v10 = std::string::compare(&__dst, (const std::string::value_type *)[v9 UTF8String]);
      v11 = (id)SALogObjectGeneral;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = SHIBYTE(__dst.__r_.__value_.__r.__words[2]);
        std::string::size_type v13 = __dst.__r_.__value_.__r.__words[0];
        id v14 = [v9 UTF8String];
        *(_DWORD *)buf = 68289795;
        p_dst = &__dst;
        if (v12 < 0) {
          p_dst = (std::string *)v13;
        }
        int v21 = 0;
        __int16 v22 = 2082;
        objc_super v23 = "";
        __int16 v24 = 2081;
        int v25 = p_dst;
        __int16 v26 = 2081;
        id v27 = v14;
        __int16 v28 = 1026;
        int v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,isSubscribedChannel\", \"candidate\":%{private, location:escape_only}s, \"matchedWith\":%{private, location:escape_only}s, \"result\":%{public}d}", buf, 0x2Cu);
      }

      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__dst.__r_.__value_.__l.__data_);
      }
      if (!v10) {
        break;
      }
      begin += 24;
      if (begin == end)
      {
        begin = end;
        break;
      }
    }
  }

  BOOL v16 = begin != v18->_activeSubscibedChannels.__end_;
  return v16;
}

- (void)addToSubscribedChannels:(id)a3
{
  id v4 = a3;
  __int16 v26 = v4;
  if (![(SACloudChannelsInterface *)self isSubscribedChannel:v4])
  {
    sub_10000DD48(__p, (char *)[v4 UTF8String]);
    value = (char *)self->_activeSubscibedChannels.__end_cap_.__value_;
    end = (char *)self->_activeSubscibedChannels.__end_;
    if (end >= value)
    {
      begin = self->_activeSubscibedChannels.__begin_;
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      unint64_t v10 = v9 + 1;
      if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_1000050E8();
      }
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      if (2 * v11 > v10) {
        unint64_t v10 = 2 * v11;
      }
      if (v11 >= 0x555555555555555) {
        unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v12 = v10;
      }
      *(void *)&v30[24] = &self->_activeSubscibedChannels.__end_cap_;
      if (v12) {
        std::string::size_type v13 = (char *)sub_100005100((uint64_t)&self->_activeSubscibedChannels.__end_cap_, v12);
      }
      else {
        std::string::size_type v13 = 0;
      }
      id v14 = &v13[24 * v9];
      *(void *)buf = v13;
      *(void *)__int16 v30 = v14;
      *(void *)&v30[16] = &v13[24 * v12];
      long long v15 = *(_OWORD *)__p;
      *((void *)v14 + 2) = v28;
      *(_OWORD *)id v14 = v15;
      __p[1] = 0;
      uint64_t v28 = 0;
      __p[0] = 0;
      *(void *)&v30[8] = v14 + 24;
      sub_100005070((uint64_t *)&self->_activeSubscibedChannels, buf);
      BOOL v16 = self->_activeSubscibedChannels.__end_;
      sub_100005268((uint64_t)buf);
      int v17 = SHIBYTE(v28);
      self->_activeSubscibedChannels.__end_ = v16;
      if (v17 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v7 = *(_OWORD *)__p;
      *((void *)end + 2) = v28;
      *(_OWORD *)end = v7;
      self->_activeSubscibedChannels.__end_ = end + 24;
    }
  }
  v18 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v4 UTF8String];
    int v20 = -1431655765
        * ((unint64_t)((char *)self->_activeSubscibedChannels.__end_
                            - (char *)self->_activeSubscibedChannels.__begin_) >> 3);
    *(_DWORD *)buf = 68289539;
    *(_DWORD *)&uint8_t buf[4] = 0;
    *(_WORD *)__int16 v30 = 2082;
    *(void *)&v30[2] = "";
    *(_WORD *)&v30[10] = 2081;
    *(void *)&v30[12] = v19;
    *(_WORD *)&v30[20] = 1026;
    *(_DWORD *)&v30[22] = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,addToSubscribedChannels\", \"channel\":%{private, location:escape_only}s, \"len\":%{public}d}", buf, 0x22u);
  }

  int v21 = (char *)self->_activeSubscibedChannels.__begin_;
  for (i = (char *)self->_activeSubscibedChannels.__end_; v21 != i; v21 += 24)
  {
    if (v21[23] < 0)
    {
      sub_100004CB8(__p, *(void **)v21, *((void *)v21 + 1));
    }
    else
    {
      long long v23 = *(_OWORD *)v21;
      uint64_t v28 = *((void *)v21 + 2);
      *(_OWORD *)__p = v23;
    }
    __int16 v24 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      if (v28 >= 0) {
        int v25 = __p;
      }
      else {
        int v25 = (void **)__p[0];
      }
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)__int16 v30 = 2082;
      *(void *)&v30[2] = "";
      *(_WORD *)&v30[10] = 2081;
      *(void *)&v30[12] = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,addToSubscribedChannels,active\", \"channel\":%{private, location:escape_only}s}", buf, 0x1Cu);
    }
    if (SHIBYTE(v28) < 0) {
      operator delete(__p[0]);
    }
  }
}

- (void)removeFromSubscribedChannels:(id)a3
{
  id v4 = a3;
  begin = (long long *)self->_activeSubscibedChannels.__begin_;
  end = (long long *)self->_activeSubscibedChannels.__end_;
  id v7 = v4;
  if (begin != end)
  {
    while (1)
    {
      if (*((char *)begin + 23) < 0)
      {
        sub_100004CB8(&__p, *(void **)begin, *((void *)begin + 1));
      }
      else
      {
        long long v8 = *begin;
        __p.__r_.__value_.__r.__words[2] = *((void *)begin + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      int v9 = std::string::compare(&__p, (const std::string::value_type *)[v7 UTF8String]);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (!v9) {
        break;
      }
      begin = (long long *)((char *)begin + 24);
      if (begin == end)
      {
        begin = end;
        break;
      }
    }
  }

  unint64_t v10 = (long long *)self->_activeSubscibedChannels.__end_;
  if (begin != v10)
  {
    sub_1000439C0((uint64_t)&__p, (long long *)((char *)begin + 24), v10, (uint64_t)begin);
    unint64_t v12 = v11;
    for (i = (void **)self->_activeSubscibedChannels.__end_; i != v12; i -= 3)
    {
      if (*((char *)i - 1) < 0) {
        operator delete(*(i - 3));
      }
    }
    self->_activeSubscibedChannels.__end_ = v12;
  }
}

- (id)getPushConnection
{
  return self->_pushConnection;
}

- (void)subscribe:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = SALogObjectGeneral;
  if (v6)
  {
    int v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2081;
      id v16 = [v6 UTF8String];
      __int16 v17 = 2081;
      id v18 = [v7 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,subscribe\", \"channel\":%{private, location:escape_only}s, \"channelTopic\":%{private, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
    }

    id v10 = [objc_alloc((Class)PKPublicChannel) initWithChannelID:v6];
    [(SACloudChannelsInterface *)self addToSubscribedChannels:v6];
    [(APSConnection *)self->_pushConnection subscribeToChannel:v10 forTopic:v7];
  }
  else if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    int v11 = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ch,subscribeWithNilChannel\"}", (uint8_t *)&v11, 0x12u);
  }
}

- (void)unsubscribe:(id)a3 topic:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = SALogObjectGeneral;
  if (v6)
  {
    int v9 = (id)SALogObjectGeneral;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 68289539;
      int v12 = 0;
      __int16 v13 = 2082;
      id v14 = "";
      __int16 v15 = 2081;
      id v16 = [v6 UTF8String];
      __int16 v17 = 2081;
      id v18 = [v7 UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#ch,unsubscribe\", \"channel\":%{private, location:escape_only}s, \"channelTopic\":%{private, location:escape_only}s}", (uint8_t *)&v11, 0x26u);
    }

    id v10 = [objc_alloc((Class)PKPublicChannel) initWithChannelID:v6];
    [(SACloudChannelsInterface *)self removeFromSubscribedChannels:v6];
    [(APSConnection *)self->_pushConnection unsubscribeFromChannel:v10 forTopic:v7];
  }
  else if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    int v11 = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    id v14 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#ch,unsubscribeWithNilChannel\"}", (uint8_t *)&v11, 0x12u);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v15 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 68289795;
    v17[1] = 0;
    __int16 v18 = 2082;
    id v19 = "";
    __int16 v20 = 2113;
    id v21 = v11;
    __int16 v22 = 2113;
    id v23 = v12;
    __int16 v24 = 2113;
    id v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,received push token\", \"token\":%{private, location:escape_only}@, \"topic\":%{private, location:escape_only}@, \"identifier\":%{private, location:escape_only}@}", (uint8_t *)v17, 0x30u);
  }
  id v16 = [(SACloudChannelsInterface *)self channelProxy];
  (*((void (**)(SACloudChannel *, uint64_t))v16->var0 + 5))(v16, 1);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v9 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 68289283;
    v11[1] = 0;
    __int16 v12 = 2082;
    id v13 = "";
    __int16 v14 = 2113;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,received public push token\", \"token\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x1Cu);
  }
  id v10 = [(SACloudChannelsInterface *)self channelProxy];
  (*((void (**)(SACloudChannel *, uint64_t))v10->var0 + 6))(v10, 1);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v9 = [v7 topic];
  id v10 = [v7 userInfo];
  id v11 = [v7 incomingInterface];
  id v23 = kIncomingMessageInterfaceKey;
  __int16 v12 = +[NSNumber numberWithInt:v11];
  __int16 v24 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  __int16 v14 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 68289539;
    v16[1] = 0;
    __int16 v17 = 2082;
    __int16 v18 = "";
    __int16 v19 = 2113;
    __int16 v20 = v9;
    __int16 v21 = 2113;
    id v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,Received push message\", \"topic\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)v16, 0x26u);
  }
  [v10 enumerateKeysAndObjectsUsingBlock:&stru_1000FA8F8];
  [v13 enumerateKeysAndObjectsUsingBlock:&stru_1000FA918];
  id v15 = [(SACloudChannelsInterface *)self channelProxy];
  (*((void (**)(SACloudChannel *, void *, void *))v15->var0 + 4))(v15, v10, v13);
}

- (void)unsubcribeForgottenChannels:(id)a3
{
  id v4 = a3;
  -[SACloudChannelsInterface unsubcribeForgottenChannelsForTopic:topicName:](self, "unsubcribeForgottenChannelsForTopic:topicName:");
  [(SACloudChannelsInterface *)self unsubcribeForgottenChannelsForTopic:v4 topicName:@"com.apple.aps.mantis.safetyalert"];
}

- (void)unsubcribeForgottenChannelsForTopic:(id)a3 topicName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v8 = [(SACloudChannelsInterface *)self getPushConnection];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100098D00;
    v10[3] = &unk_1000FA940;
    id v11 = v7;
    __int16 v12 = self;
    id v13 = v6;
    [v8 getRegisteredChannelsForTopic:v11 withCompletion:v10];
  }
  else
  {
    int v9 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      int v15 = 0;
      __int16 v16 = 2082;
      __int16 v17 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#channel,unsubcribeForgottenChannels,invalid topic\"}", buf, 0x12u);
    }
  }
}

- (SACloudChannel)channelProxy
{
  return self->_channelProxy;
}

- (void)setChannelProxy:(SACloudChannel *)a3
{
  self->_channelProxy = a3;
}

- (void).cxx_destruct
{
  p_activeSubscibedChannels = &self->_activeSubscibedChannels;
  sub_100005360((void ***)&p_activeSubscibedChannels);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudChannel, 0);
  objc_storeStrong((id *)&self->_pushConnection, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end