@interface NearFieldManager
- (id)secureElementInfo;
- (void)getSecureElementWithReason:(id)a3 callback:(id)a4;
- (void)getSecureElementWithReason:(id)a3 handoffToken:(id)a4 completion:(id)a5;
- (void)setHandoffToken:(id)a3;
@end

@implementation NearFieldManager

- (id)secureElementInfo
{
  secureElementInfo = self->_secureElementInfo;
  if (secureElementInfo)
  {
LABEL_28:
    v9 = secureElementInfo;
    goto LABEL_29;
  }
  id v37 = 0;
  v4 = +[NFSecureElement embeddedSecureElementWithError:&v37];
  id v5 = v37;
  v6 = [v4 info];

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    v10 = [v6 sequenceCounter];
    uint64_t v11 = [v10 unsignedIntValue];

    uint64_t v12 = (uint64_t)[v6 deviceType];
    uint64_t v36 = v11;
    if (v12 <= 114)
    {
      switch(v12)
      {
        case ',':
          BOOL v32 = 1;
          uint64_t v15 = 4;
          break;
        case '7':
          BOOL v32 = 1;
          uint64_t v15 = 5;
          break;
        case 'd':
          goto LABEL_18;
        default:
          goto LABEL_22;
      }
      uint64_t v31 = v15;
      char v13 = 1;
      goto LABEL_24;
    }
    if (v12 != 210 && v12 != 200)
    {
      if (v12 != 115)
      {
LABEL_22:
        char v13 = 0;
        BOOL v32 = 1;
        uint64_t v14 = 6;
        goto LABEL_23;
      }
      BOOL v32 = v11 > 0x90B;
      char v13 = 1;
      uint64_t v14 = 2;
LABEL_23:
      uint64_t v31 = v14;
LABEL_24:
      id v16 = [v6 signingKeyType];
      BOOL v17 = v16 == (id)2;
      if ((v13 & 1) == 0 && v16 == (id)2)
      {
        v18 = [v6 persistentConfigID];
        unsigned int v19 = [v18 unsignedIntValue];

        BOOL v17 = HIBYTE(v19) != 80;
      }
      BOOL v33 = v17;
      v35 = [v6 serialNumber];
      v20 = [v35 hexStringAsData];
      v34 = [v6 ecdsaCertificate];
      v21 = [v34 hexStringAsData];
      v22 = +[SESTLV TLVWithTag:32545 value:v21];
      v23 = [v22 asData];
      v24 = [v6 rsaCertificate];
      v25 = [v24 hexStringAsData];
      v26 = +[SESTLV TLVWithTag:32545 value:v25];
      v27 = [v26 asData];
      +[SecureElementInfo withSEID:casdCertificate:casdCertificateRSA:isProd:isSkyOrLater:secureElementType:csn:chipID:](SecureElementInfo, "withSEID:casdCertificate:casdCertificateRSA:isProd:isSkyOrLater:secureElementType:csn:chipID:", v20, v23, v27, v33, v32, v31, v36, [v6 deviceType]);
      v28 = (SecureElementInfo *)objc_claimAutoreleasedReturnValue();
      v29 = self->_secureElementInfo;
      self->_secureElementInfo = v28;

      secureElementInfo = self->_secureElementInfo;
      goto LABEL_28;
    }
LABEL_18:
    BOOL v32 = v11 > 0xA17;
    char v13 = 1;
    uint64_t v14 = 3;
    goto LABEL_23;
  }
  v8 = sub_100058290();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v39 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to retrieve eSE info %@", buf, 0xCu);
  }

  v9 = 0;
LABEL_29:

  return v9;
}

- (void)getSecureElementWithReason:(id)a3 callback:(id)a4
{
  id v7 = a3;
  v8 = (void (**)(id, void *, void))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v9 = sub_100058290();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t internalState = self->_internalState;
    unsigned int v11 = [(NSMutableArray *)self->_queuedWaiters count];
    int v20 = 67240448;
    LODWORD(v21[0]) = internalState;
    WORD2(v21[0]) = 1026;
    *(_DWORD *)((char *)v21 + 6) = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Client request %{public}u queue (before) %{public}u", (uint8_t *)&v20, 0xEu);
  }

  switch(self->_internalState)
  {
    case 1uLL:
      queuedWaiters = self->_queuedWaiters;
      id v13 = +[SERequest newSERequestWithReason:v7 callback:v8];
      [(NSMutableArray *)queuedWaiters pushLast:v13];

      sub_100059E08((uint64_t)self);
      break;
    case 2uLL:
    case 5uLL:
    case 6uLL:
      goto LABEL_8;
    case 3uLL:
      uint64_t v14 = sub_100058290();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        reasonForInUseSession = self->_reasonForInUseSession;
        int v20 = 138543362;
        v21[0] = reasonForInUseSession;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Currently in use for %{public}@", (uint8_t *)&v20, 0xCu);
      }

LABEL_8:
      id v16 = self->_queuedWaiters;
      id v17 = +[SERequest newSERequestWithReason:v7 callback:v8];
      [(NSMutableArray *)v16 pushLast:v17];

      break;
    case 4uLL:
      self->_unint64_t internalState = 3;
      objc_storeStrong((id *)&self->_reasonForInUseSession, a3);
      v18 = sub_100058290();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v20 = 138543362;
        v21[0] = v7;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Free session claimed for reason %{public}@", (uint8_t *)&v20, 0xCu);
      }

      sub_100052B14((uint64_t)self->_timer);
      unsigned int v19 = sub_10005A080((id *)&self->super.isa);
      v8[2](v8, v19, 0);

      break;
    default:
      break;
  }
}

- (void)setHandoffToken:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005A1E8;
  v7[3] = &unk_10040D1A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getSecureElementWithReason:(id)a3 handoffToken:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v11 = [(NearFieldManager *)self secureElementInfo];
  uint64_t v12 = [v11 seid];

  if (v12)
  {
    id v13 = sub_100058290();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v9 asHexString];
      *(_DWORD *)buf = 138543618;
      id v34 = v8;
      __int16 v35 = 2114;
      uint64_t v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Getting SE for reason %{public}@ with token %{public}@", buf, 0x16u);
    }
    uint64_t v15 = objc_opt_new();
    id v16 = +[NFHardwareManager sharedHardwareManager];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10005A55C;
    v27[3] = &unk_10040DC50;
    id v17 = v15;
    id v28 = v17;
    v29 = self;
    id v30 = v8;
    id v18 = v10;
    id v32 = v18;
    id v31 = v12;
    unsigned int v19 = [v16 startSecureElementManagerSession:v27];

    int v20 = [v19 activateWithToken:v9];
    if (v20)
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10005AA84;
      v23[3] = &unk_10040C560;
      id v24 = v19;
      id v26 = v18;
      id v25 = v20;
      [v17 invoke:v23];
    }
  }
  else
  {
    v21 = sub_100058290();
    v22 = SESCreateAndLogError();
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v22);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handoffToken, 0);
  objc_storeStrong((id *)&self->_reasonForInUseSession, 0);
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_openingSession, 0);
  objc_storeStrong((id *)&self->_SEMSession, 0);
  objc_storeStrong((id *)&self->_secureElementInfo, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_queuedWaiters, 0);
}

@end