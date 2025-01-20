@interface PDAccessPassSharingIDSService
- (BOOL)isEndpoint:(id)a3 forSameDeviceIn:(id)a4;
- (PDAccessPassSharingIDSService)init;
- (PDAccessPassSharingIDSService)initWithIDSSharingService:(id)a3 delegate:(id)a4;
- (id)resolveRemoteAddressForDeviceIdentifier:(id)a3;
- (unint64_t)type;
- (void)_cancelMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_generalMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)_handleMessageReceived:(id)a3 service:(id)a4 fromID:(id)a5 context:(id)a6 handler:(id)a7;
- (void)_sendProtoMessageTo:(id)a3 message:(id)a4 type:(unsigned __int16)a5 completion:(id)a6;
- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4;
- (void)closeEndpoint:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)devicesWithCompletion:(id)a3;
- (void)pingEndpoint:(id)a3 completion:(id)a4;
- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5;
- (void)relinquishEndpoint:(id)a3 completion:(id)a4;
- (void)remoteDeviceInformationForEndpoint:(id)a3 completion:(id)a4;
- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8;
- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5;
@end

@implementation PDAccessPassSharingIDSService

- (PDAccessPassSharingIDSService)init
{
  return 0;
}

- (PDAccessPassSharingIDSService)initWithIDSSharingService:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PDAccessPassSharingIDSService;
  v9 = [(PDAccessPassSharingIDSService *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_service, a3);
    [(PKIDSService *)v10->_service addDelegate:v10];
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passd.sharingidsservice.internal", 0);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passd.sharingidsservice.internal", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v13;

    v10->_lock._os_unfair_lock_opaque = 0;
    v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    messageIdentifierToEndpoint = v10->_messageIdentifierToEndpoint;
    v10->_messageIdentifierToEndpoint = v15;

    [(PKIDSService *)v10->_service setProtobufAction:"_generalMessageReceived:service:account:fromID:context:" target:v10 forIncomingRequestsOfType:15 queue:v10->_internalQueue];
    [(PKIDSService *)v10->_service setProtobufAction:"_cancelMessageReceived:service:account:fromID:context:" target:v10 forIncomingRequestsOfType:16 queue:v10->_internalQueue];
  }

  return v10;
}

- (void)dealloc
{
  [(PKIDSService *)self->_service removeDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)PDAccessPassSharingIDSService;
  [(PDAccessPassSharingIDSService *)&v3 dealloc];
}

- (void)devicesWithCompletion:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100361EF8;
  v7[3] = &unk_10072E598;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

- (void)remoteDeviceInformationForEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10036202C;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  dispatch_queue_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

- (id)resolveRemoteAddressForDeviceIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 _appearsToBeEmail])
  {
    id v4 = (id)IDSCopyIDForEmailAddress();
  }
  else if ([v3 _appearsToBePhoneNumber])
  {
    id v4 = (id)IDSCopyIDForPhoneNumber();
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (BOOL)isEndpoint:(id)a3 forSameDeviceIn:(id)a4
{
  v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 138412546;
    v36 = v5;
    __int16 v37 = 2112;
    v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSService: Comparing endpoints. \n %@ \n\n %@", (uint8_t *)&v35, 0x16u);
  }

  id v8 = [v5 deviceIdentifier];
  id v9 = [v6 deviceIdentifier];
  id v10 = v8;
  id v11 = v9;
  id v12 = v11;
  if (v10 == v11)
  {
  }
  else
  {
    if (!v10 || !v11)
    {

      goto LABEL_13;
    }
    unsigned int v13 = [v10 isEqualToString:v11];

    if (!v13)
    {
LABEL_13:
      v15 = (id)IDSCopyRawAddressForDestination();
      v16 = v12;
      v17 = v16;
      if (v15 == v16)
      {
      }
      else
      {
        if (!v12 || !v15)
        {

          goto LABEL_23;
        }
        unsigned int v18 = [v15 isEqualToString:v16];

        if (!v18)
        {
LABEL_23:
          v20 = (void *)IDSCopyRawAddressForDestination();
          v21 = v10;
          v22 = v20;
          v19 = v22;
          if (v21 == v22)
          {
          }
          else
          {
            if (!v10 || !v22)
            {

              goto LABEL_32;
            }
            unsigned int v23 = [v21 isEqualToString:v22];

            if (!v23)
            {
LABEL_32:
              v25 = v15;
              v26 = v19;
              if (v25 == v26)
              {
              }
              else
              {
                v27 = v26;
                if (!v15 || !v19)
                {

                  goto LABEL_43;
                }
                unsigned int v28 = [v25 isEqualToString:v26];

                if (!v28)
                {
LABEL_43:
                  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = 138412546;
                    v36 = v25;
                    __int16 v37 = 2112;
                    v38 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSService: lhsDestination: '%@' rhsDestination: '%@'", (uint8_t *)&v35, 0x16u);
                  }

                  v30 = [v5 idsCorrelationIdentifier];
                  v31 = [v6 idsCorrelationIdentifier];
                  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                  {
                    int v35 = 138412546;
                    v36 = v30;
                    __int16 v37 = 2112;
                    v38 = v31;
                    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSService: lhsCorrelation: '%@' rhsCorrelation: '%@'", (uint8_t *)&v35, 0x16u);
                  }

                  v29 = v30;
                  v32 = v31;
                  v33 = v32;
                  if (v29 == v32)
                  {
                  }
                  else
                  {
                    if (!v29 || !v32)
                    {

                      LOBYTE(v14) = 0;
                      id v7 = v29;
LABEL_57:

LABEL_58:
                      goto LABEL_59;
                    }
                    unsigned int v14 = [v29 isEqualToString:v32];

                    if (!v14) {
                      goto LABEL_58;
                    }
                  }
                  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v35) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSService: equal correlation identifiers", (uint8_t *)&v35, 2u);
                  }
                  LOBYTE(v14) = 1;
                  goto LABEL_57;
                }
              }
              if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v35) = 0;
                v24 = "IDSService: equal lhs destination and rhs destination";
                goto LABEL_40;
              }
              goto LABEL_41;
            }
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v35) = 0;
            v24 = "IDSService: equal rhs destination identifier with lhs device";
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v35, 2u);
          }
LABEL_41:
          LOBYTE(v14) = 1;
          v29 = v7;
LABEL_59:

LABEL_60:
          goto LABEL_61;
        }
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSService: equal lhs destination identifier with rhs device", (uint8_t *)&v35, 2u);
      }
      LOBYTE(v14) = 1;
      v19 = v7;
      goto LABEL_60;
    }
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v35) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDSService: equal device identifiers", (uint8_t *)&v35, 2u);
  }
  LOBYTE(v14) = 1;
  v15 = v7;
LABEL_61:

  return v14;
}

- (void)_generalMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10036280C;
  v12[3] = &unk_10074B060;
  id v13 = a6;
  unsigned int v14 = self;
  id v11 = v13;
  [(PDAccessPassSharingIDSService *)self _handleMessageReceived:a3 service:a4 fromID:v11 context:a7 handler:v12];
}

- (void)_cancelMessageReceived:(id)a3 service:(id)a4 account:(id)a5 fromID:(id)a6 context:(id)a7
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100362A8C;
  v12[3] = &unk_10074B060;
  id v13 = a6;
  unsigned int v14 = self;
  id v11 = v13;
  [(PDAccessPassSharingIDSService *)self _handleMessageReceived:a3 service:a4 fromID:v11 context:a7 handler:v12];
}

- (void)_handleMessageReceived:(id)a3 service:(id)a4 fromID:(id)a5 context:(id)a6 handler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned int v14 = (void (**)(id, PDSharingIDSEndpoint *, void *))a7;
  id v15 = a3;
  id v16 = objc_alloc((Class)PKProtobufIDSSharingMessageWrapper);
  v17 = [v15 data];

  id v18 = [v16 initWithData:v17];
  v19 = [v18 sessionIdentifier];
  if (v19)
  {
    v20 = [v11 deviceForFromID:v12];
    if (v20)
    {
      v21 = (void *)IDSCopyIDForDevice();
      uint64_t v22 = 1;
      if (v21)
      {
LABEL_4:
        unsigned int v23 = [[PDSharingIDSEndpoint alloc] initWithSessionIdentifier:v19];
        [(PDSharingIDSEndpoint *)v23 setIsDeviceOnSameIDSAccount:v22];
        [(PDSharingIDSEndpoint *)v23 setDeviceIdentifier:v21];
        v24 = [v13 senderCorrelationIdentifier];
        [(PDSharingIDSEndpoint *)v23 setIdsCorrelationIdentifier:v24];

        v25 = [v18 underlyingMessageData];
        v14[2](v14, v23, v25);

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {
      v21 = (void *)IDSCopyAddressDestinationForDestination();
      uint64_t v22 = 2;
      if (v21) {
        goto LABEL_4;
      }
    }
    v26 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "IDSService: Unable to find device identifier for message from '%@'", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_11;
  }
  v20 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    id v28 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "IDSService: Received message from %@, but no session identifier.", (uint8_t *)&v27, 0xCu);
  }
LABEL_12:
}

- (unint64_t)type
{
  return 2;
}

- (void)pingEndpoint:(id)a3 completion:(id)a4
{
}

- (void)sendMessageTo:(id)a3 message:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v8 transportIdentifier];
    id v13 = [v8 deviceIdentifier];
    int v17 = 138412803;
    id v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2113;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "IDSService<%@>: Sending message to %@ for \n\n %{private}@", (uint8_t *)&v17, 0x20u);
  }
  id v14 = objc_alloc_init((Class)PKProtobufIDSSharingMessageWrapper);
  id v15 = [v9 payload];
  [v14 setUnderlyingMessageData:v15];

  id v16 = [v8 transportIdentifier];
  [v14 setSessionIdentifier:v16];

  [(PDAccessPassSharingIDSService *)self _sendProtoMessageTo:v8 message:v14 type:15 completion:v10];
}

- (void)_sendProtoMessageTo:(id)a3 message:(id)a4 type:(unsigned __int16)a5 completion:(id)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [v10 deviceIdentifier];
  if (v13)
  {
    id v14 = [v10 transportIdentifier];
    [v11 setSessionIdentifier:v14];

    id v15 = objc_alloc((Class)IDSProtobuf);
    id v16 = [v11 data];
    id v17 = [v15 initWithProtobufData:v16 type:v7 isResponse:0];

    id v18 = +[PKIDSDestination destinationWithDeviceIdentifier:v13 name:0];
    v26[0] = IDSSendMessageOptionSendModeKey;
    v26[1] = IDSSendMessageOptionPushPriorityKey;
    v27[0] = &off_10078B808;
    v27[1] = &off_10078B820;
    __int16 v19 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    v20 = [(PKIDSService *)self->_service underlyingService];
    __int16 v21 = +[NSSet setWithObject:v18];
    id v24 = v10;
    id v25 = v12;
    PKProtobufSendWithOptions();
  }
  else
  {
    id v22 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = [v10 transportIdentifier];
      *(_DWORD *)buf = 138412290;
      v29 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "IDSService<%@>: Unable to send message to because no device identifier", buf, 0xCu);
    }
    PDBasicError();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v12 + 2))(v12, 0, v17);
  }
}

- (void)checkOutstandingMessagesOn:(id)a3 completion:(id)a4
{
}

- (void)closeEndpoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 transportIdentifier];
    *(_DWORD *)buf = 138412290;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDSService<%@>: Closing endpoint", buf, 0xCu);
  }
  id v10 = objc_alloc_init((Class)PKProtobufIDSSharingMessageWrapper);
  id v11 = [v6 transportIdentifier];
  [v10 setSessionIdentifier:v11];

  id v12 = objc_alloc_init((Class)NSData);
  [v10 setUnderlyingMessageData:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100363720;
  v14[3] = &unk_10072E570;
  id v15 = v7;
  id v13 = v7;
  [(PDAccessPassSharingIDSService *)self _sendProtoMessageTo:v6 message:v10 type:16 completion:v14];
}

- (void)relinquishEndpoint:(id)a3 completion:(id)a4
{
}

- (void)universalShareURLForEndpoint:(id)a3 urlDecoration:(id)a4 completion:(id)a5
{
}

- (void)prewarmEndpointCreationOfType:(unint64_t)a3 count:(unint64_t)a4 completion:(id)a5
{
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  id v10 = a5;
  id v11 = a8;
  internalQueue = self->_internalQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100363844;
  block[3] = &unk_10072E238;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(internalQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageIdentifierToEndpoint, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end