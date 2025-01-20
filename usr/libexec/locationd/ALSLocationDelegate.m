@interface ALSLocationDelegate
- (ALSLocationDelegate)initWithRequester:(void *)a3;
- (void)addRequesterWithOutstandingRequest:(id)a3;
- (void)dealloc;
- (void)finished:(id)a3;
- (void)processCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7;
- (void)processScdmaCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7;
- (void)processWireless:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7 surroundingWifiBands:(const void *)a8;
- (void)requester:(id)a3 didFailWithError:(id)a4;
- (void)requester:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5;
- (void)requesterDidFinish:(id)a3;
@end

@implementation ALSLocationDelegate

- (ALSLocationDelegate)initWithRequester:(void *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ALSLocationDelegate;
  v4 = [(ALSLocationDelegate *)&v6 init];
  if (v4)
  {
    v4->fRequestersWithOutstandingRequests = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v4->fRequester = a3;
  }
  return v4;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  fRequestersWithOutstandingRequests = self->fRequestersWithOutstandingRequests;
  id v4 = [(NSMutableSet *)fRequestersWithOutstandingRequests countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(fRequestersWithOutstandingRequests);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) cancel];
      }
      id v5 = [(NSMutableSet *)fRequestersWithOutstandingRequests countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ALSLocationDelegate;
  [(ALSLocationDelegate *)&v8 dealloc];
}

- (void)requester:(id)a3 didReceiveResponse:(id)a4 forRequest:(id)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  id v9 = [a4 cellTowers];
  id v52 = [a4 scdmaCellTowers];
  id v10 = [a4 cdmaCellTowers];
  id v11 = [a4 lteCellTowers];
  id v50 = [a4 nr5GCellTowers];
  id v12 = [a4 wirelessAPs];
  [a3 timestamp];
  double v14 = Current - v13;
  v51 = v12;
  if ([v12 count])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    v15 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240960;
      *(_DWORD *)&buf[4] = [a3 tag];
      *(_WORD *)&buf[8] = 2050;
      *(double *)&buf[10] = v14;
      __int16 v63 = 2050;
      v64 = (const char *)[v12 count];
      __int16 v65 = 1026;
      unsigned int v66 = [a3 type];
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "@AlsFlow, reply, tag, %{public}d, wifi, rtt, %{public}.1f, aps, %{public}lu, type, %{public}d", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      *(_DWORD *)__p = 67240960;
      *(_DWORD *)&__p[4] = [a3 tag];
      *(_WORD *)&__p[8] = 2050;
      *(double *)&__p[10] = v14;
      *(_WORD *)&__p[18] = 2050;
      *(void *)&__p[20] = [v12 count];
      __int16 v60 = 1026;
      unsigned int v61 = [a3 type];
      v45 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v45);
      if (v45 != buf) {
        free(v45);
      }
    }
  }
  if ([v9 count]
    || [v10 count]
    || [v11 count]
    || [v52 count]
    || [v50 count])
  {
    unsigned int v16 = [v9 count];
    unsigned int v17 = [v10 count];
    unsigned int v18 = [v11 count];
    unsigned int v19 = [v52 count];
    signed int v20 = v17 + v16 + v18 + v19 + [v50 count];
    if ((id)v20 == [v9 count])
    {
      v21 = "gsm";
    }
    else if ((id)v20 == [v11 count])
    {
      v21 = "lte";
    }
    else if ((id)v20 == [v10 count])
    {
      v21 = "cdma";
    }
    else if ((id)v20 == [v52 count])
    {
      v21 = "scdma";
    }
    else if ((id)v20 == [v50 count])
    {
      v21 = "nr";
    }
    else
    {
      v21 = "multiple";
    }
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    v22 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v23 = [a3 tag];
      *(_DWORD *)buf = 67240962;
      *(_DWORD *)&buf[4] = v23;
      *(_WORD *)&buf[8] = 2050;
      *(double *)&buf[10] = v14;
      __int16 v63 = 2082;
      v64 = v21;
      __int16 v65 = 1026;
      unsigned int v66 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "@AlsFlow, reply, tag, %{public}d, cell, rtt, %{public}.1f, %{public}s, %{public}d", buf, 0x22u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      *(_DWORD *)__p = 67240962;
      *(_DWORD *)&__p[4] = [a3 tag];
      *(_WORD *)&__p[8] = 2050;
      *(double *)&__p[10] = v14;
      *(_WORD *)&__p[18] = 2082;
      *(void *)&__p[20] = v21;
      __int16 v60 = 1026;
      unsigned int v61 = v20;
      v44 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v44);
      if (v44 != buf) {
        free(v44);
      }
    }
  }
  (*(void (**)(uint64_t *))(qword_10247C7E8 + 16))(&qword_10247C7E8);
  ++dword_10247C81C;
  (*(void (**)(uint64_t *))(qword_10247C7E8 + 24))(&qword_10247C7E8);
  sub_100134750(buf, "didReceiveResponse");
  sub_100D3B360((uint64_t)&qword_10247C7E8, (uint64_t *)buf, *((_DWORD *)self->fRequester + 118));
  if (SBYTE3(v64) < 0) {
    operator delete(*(void **)buf);
  }
  if ([v10 count])
  {
    fRequester = self->fRequester;
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10062F610;
    v56[3] = &unk_1022B6D48;
    v56[4] = v10;
    v56[5] = self;
    v56[6] = a3;
    *(double *)&v56[7] = Current;
    sub_10062F590((uint64_t)fRequester, (int)[a3 type], (int)[a3 tag], (uint64_t)v56);
  }
  if ([v11 count])
  {
    v25 = self->fRequester;
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1006302EC;
    v55[3] = &unk_1022B6D48;
    v55[4] = v11;
    v55[5] = self;
    v55[6] = a3;
    *(double *)&v55[7] = Current;
    sub_10062F590((uint64_t)v25, (int)[a3 type], (int)[a3 tag], (uint64_t)v55);
  }
  if ([v50 count])
  {
    v26 = self->fRequester;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100630C70;
    v54[3] = &unk_1022B6D48;
    v54[4] = v50;
    v54[5] = self;
    v54[6] = a3;
    *(double *)&v54[7] = Current;
    sub_10062F590((uint64_t)v26, (int)[a3 type], (int)[a3 tag], (uint64_t)v54);
  }
  if ([v52 count]) {
    -[ALSLocationDelegate processScdmaCells:inRange:timeReceived:requestType:tag:](self, "processScdmaCells:inRange:timeReceived:requestType:tag:", v52, 0, [v52 count], [a3 type], [a3 tag], Current);
  }
  if ([v9 count])
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    v27 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v9 count];
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "AlsCell, gsm, unbatched, %{public}lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      id v46 = [v9 count];
      *(_DWORD *)__p = 134349056;
      *(void *)&__p[4] = v46;
      v47 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v47);
      if (v47 != buf) {
        free(v47);
      }
    }
    -[ALSLocationDelegate processCells:inRange:timeReceived:requestType:tag:](self, "processCells:inRange:timeReceived:requestType:tag:", v9, 0, [v9 count], [a3 type], [a3 tag], Current);
  }
  if ([v51 count])
  {
    memset(__p, 0, 24);
    if (![a3 type] && objc_msgSend(a5, "surroundingWifiBandsCount"))
    {
      for (unint64_t i = 0; i < (unint64_t)[a5 surroundingWifiBandsCount]; ++i)
      {
        unsigned int v32 = [a5 surroundingWifiBandsAtIndex:i];
        unsigned int v33 = v32;
        v34 = *(char **)&__p[8];
        if (*(void *)&__p[8] >= *(void *)&__p[16])
        {
          v36 = *(char **)__p;
          uint64_t v37 = (uint64_t)(*(void *)&__p[8] - *(void *)__p) >> 2;
          unint64_t v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 62) {
            sub_1001D7FD4();
          }
          uint64_t v39 = *(void *)&__p[16] - *(void *)__p;
          if ((uint64_t)(*(void *)&__p[16] - *(void *)__p) >> 1 > v38) {
            unint64_t v38 = v39 >> 1;
          }
          if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v40 = v38;
          }
          if (v40)
          {
            v41 = (char *)sub_10017EA34((uint64_t)&__p[16], v40);
            v36 = *(char **)__p;
            v34 = *(char **)&__p[8];
          }
          else
          {
            v41 = 0;
          }
          v42 = (unsigned int *)&v41[4 * v37];
          unsigned int *v42 = v33;
          v35 = v42 + 1;
          while (v34 != v36)
          {
            unsigned int v43 = *((_DWORD *)v34 - 1);
            v34 -= 4;
            *--v42 = v43;
          }
          *(void *)__p = v42;
          *(void *)&__p[8] = v35;
          *(void *)&__p[16] = &v41[4 * v40];
          if (v36) {
            operator delete(v36);
          }
        }
        else
        {
          **(_DWORD **)&__p[8] = v32;
          v35 = v34 + 4;
        }
        *(void *)&__p[8] = v35;
      }
    }
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    v29 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      id v30 = [v51 count];
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "AlsWifi, unbatched, %{public}lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      id v48 = [v51 count];
      int v57 = 134349056;
      id v58 = v48;
      v49 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didReceiveResponse:forRequest:]", "%s\n", v49);
      if (v49 != buf) {
        free(v49);
      }
    }
    -[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:](self, "processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:", v51, 0, [v51 count], [a3 type], [a3 tag], __p, Current);
    if (*(void *)__p)
    {
      *(void *)&__p[8] = *(void *)__p;
      operator delete(*(void **)__p);
    }
  }
}

- (void)requesterDidFinish:(id)a3
{
  if (-[NSMutableSet containsObject:](self->fRequestersWithOutstandingRequests, "containsObject:"))
  {
    sub_100134750(__p, "requesterDidFinish");
    sub_100D3B360((uint64_t)&qword_10247C7E8, (uint64_t *)__p, *((_DWORD *)self->fRequester + 118));
    if (v13 < 0) {
      operator delete(*(void **)__p);
    }
    id v5 = [a3 downloadPayloadSize];
    (*(void (**)(uint64_t *))(qword_10247C7E8 + 16))(&qword_10247C7E8);
    dword_10247C814 += (int)v5;
    (*(void (**)(uint64_t *))(qword_10247C7E8 + 24))(&qword_10247C7E8);
    [a3 setFinished:1];
    [(ALSLocationDelegate *)self finished:a3];
    [(NSMutableSet *)self->fRequestersWithOutstandingRequests removeObject:a3];
    if (qword_1024195F0 != -1) {
      dispatch_once(&qword_1024195F0, &stru_1022BF530);
    }
    uint64_t v6 = qword_1024195F8;
    if (os_log_type_enabled((os_log_t)qword_1024195F8, OS_LOG_TYPE_INFO))
    {
      id v7 = [(NSMutableSet *)self->fRequestersWithOutstandingRequests count];
      *(_DWORD *)__p = 134218240;
      *(void *)&__p[4] = v5;
      __int16 v11 = 2048;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "AlsRequester, didFinish, payload, %lu, outstanding, %ld", __p, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(__p, 0x65CuLL);
      if (qword_1024195F0 != -1) {
        dispatch_once(&qword_1024195F0, &stru_1022BF530);
      }
      [(NSMutableSet *)self->fRequestersWithOutstandingRequests count];
      objc_super v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requesterDidFinish:]", "%s\n", v8);
LABEL_21:
      if (v8 != __p) {
        free(v8);
      }
    }
  }
  else
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022BF510);
    }
    id v9 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)__p = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Unknown pbrequester object received in delegate callback", __p, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(__p, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022BF510);
      }
      objc_super v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[ALSLocationDelegate requesterDidFinish:]", "%s\n", v8);
      goto LABEL_21;
    }
  }
}

- (void)requester:(id)a3 didFailWithError:(id)a4
{
  if (-[NSMutableSet containsObject:](self->fRequestersWithOutstandingRequests, "containsObject:"))
  {
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    id v7 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [a3 tag];
      double Current = CFAbsoluteTimeGetCurrent();
      [a3 timestamp];
      *(_DWORD *)buf = 67240704;
      *(_DWORD *)&buf[4] = v8;
      __int16 v28 = 2050;
      double v29 = Current - v10;
      __int16 v30 = 2050;
      id v31 = [a4 code];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "@AlsFlow, reply, tag, %{public}d, error, rtt, %{public}.1lf, code, %{public}ld", buf, 0x1Cu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      unsigned int v21 = [a3 tag];
      double v22 = CFAbsoluteTimeGetCurrent();
      [a3 timestamp];
      *(_DWORD *)v26 = 67240704;
      *(_DWORD *)&v26[4] = v21;
      *(_WORD *)&v26[8] = 2050;
      *(double *)&v26[10] = v22 - v23;
      *(_WORD *)&v26[18] = 2050;
      *(void *)&v26[20] = [a4 code];
      v24 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v24);
      if (v24 != (char *)buf) {
        free(v24);
      }
    }
    unsigned int v11 = [a3 type];
    if (v11 == 1)
    {
      sub_10063241C((uint64_t)self->fRequester, (int)[a3 type], (int)[a3 tag]);
    }
    else if (v11)
    {
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022BF550);
      }
      double v14 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
      {
        unsigned int v15 = [a3 tag];
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)&buf[4] = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "query: received error for unknown requester type (tag %{public}d)", buf, 8u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_1022BF550);
        }
        *(_DWORD *)v26 = 67240192;
        *(_DWORD *)&v26[4] = [a3 tag];
        v25 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v25);
        if (v25 != (char *)buf) {
          free(v25);
        }
      }
    }
    else
    {
      sub_10063239C((uint64_t)self->fRequester, (int)[a3 type], (int)[a3 tag]);
    }
    sub_100134750(buf, "didFailWithError");
    sub_100D3B360((uint64_t)&qword_10247C7E8, (uint64_t *)buf, *((_DWORD *)self->fRequester + 118));
    if (SBYTE3(v31) < 0) {
      operator delete(*(void **)buf);
    }
    [(NSMutableSet *)self->fRequestersWithOutstandingRequests removeObject:a3];
    if (qword_1024195F0 != -1) {
      dispatch_once(&qword_1024195F0, &stru_1022BF530);
    }
    unsigned int v16 = qword_1024195F8;
    if (os_log_type_enabled((os_log_t)qword_1024195F8, OS_LOG_TYPE_INFO))
    {
      sub_1000FECE0((const __CFString *)[a4 domain], (uint64_t)buf);
      int v17 = SBYTE3(v31);
      unsigned int v18 = *(uint8_t **)buf;
      id v19 = [(NSMutableSet *)self->fRequestersWithOutstandingRequests count];
      signed int v20 = buf;
      if (v17 < 0) {
        signed int v20 = v18;
      }
      *(_DWORD *)v26 = 136315394;
      *(void *)&v26[4] = v20;
      *(_WORD *)&v26[12] = 2048;
      *(void *)&v26[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "AlsRequester, didFailWithError, code, %s, outstanding, %ld", v26, 0x16u);
      if (SBYTE3(v31) < 0) {
        operator delete(*(void **)buf);
      }
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024195F0 != -1) {
        dispatch_once(&qword_1024195F0, &stru_1022BF530);
      }
      sub_1000FECE0((const __CFString *)[a4 domain], (uint64_t)v26);
      [(NSMutableSet *)self->fRequestersWithOutstandingRequests count];
      char v13 = (char *)_os_log_send_and_compose_impl();
      if ((v26[23] & 0x80000000) != 0) {
        operator delete(*(void **)v26);
      }
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v13);
      if (v13 != (char *)buf) {
LABEL_45:
      }
        free(v13);
    }
  }
  else
  {
    if (qword_102419600 != -1) {
      dispatch_once(&qword_102419600, &stru_1022BF510);
    }
    id v12 = qword_102419608;
    if (os_log_type_enabled((os_log_t)qword_102419608, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Unknown pbrequester object received in delegate callback", buf, 2u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_102419600 != -1) {
        dispatch_once(&qword_102419600, &stru_1022BF510);
      }
      *(_WORD *)v26 = 0;
      char v13 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[ALSLocationDelegate requester:didFailWithError:]", "%s\n", v13);
      if (v13 != (char *)buf) {
        goto LABEL_45;
      }
    }
  }
}

- (void)finished:(id)a3
{
  if (qword_1024195F0 != -1) {
    dispatch_once(&qword_1024195F0, &stru_1022BF530);
  }
  id v5 = qword_1024195F8;
  if (os_log_type_enabled((os_log_t)qword_1024195F8, OS_LOG_TYPE_INFO))
  {
    id v6 = [(NSMutableSet *)self->fRequestersWithOutstandingRequests count];
    *(_DWORD *)buf = 134217984;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "AlsRequester, finished, outstanding, %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024195F0 != -1) {
      dispatch_once(&qword_1024195F0, &stru_1022BF530);
    }
    [(NSMutableSet *)self->fRequestersWithOutstandingRequests count];
    id v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate finished:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  if (([a3 processingCellTowers] & 1) == 0
    && ([a3 processingWirelessAPs] & 1) == 0)
  {
    if ([a3 finished]) {
      sub_1006326AC((uint64_t)self->fRequester, (int)[a3 type], (int)[a3 tag]);
    }
  }
}

- (void)processCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    double v14 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      NSUInteger v23 = length;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AlsCell, gsm, rx, %{public}lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      int v20 = 134349056;
      NSUInteger v21 = length;
      unsigned int v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate processCells:inRange:timeReceived:requestType:tag:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    fRequester = self->fRequester;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100632974;
    v17[3] = &unk_1022BF390;
    v17[6] = location;
    v17[7] = length;
    v17[4] = a3;
    v17[5] = self;
    int v18 = a6;
    int v19 = a7;
    *(double *)&v17[8] = a5;
    sub_10062F590((uint64_t)fRequester, a6, a7, (uint64_t)v17);
  }
}

- (void)processScdmaCells:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7
{
  if (a4.length)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    double v14 = qword_1024193A8;
    if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      NSUInteger v23 = length;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "AlsCell, scdma, rx, %{public}lu", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193A0 != -1) {
        dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
      }
      int v20 = 134349056;
      NSUInteger v21 = length;
      unsigned int v16 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate processScdmaCells:inRange:timeReceived:requestType:tag:]", "%s\n", v16);
      if (v16 != (char *)buf) {
        free(v16);
      }
    }
    fRequester = self->fRequester;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100633328;
    v17[3] = &unk_1022BF390;
    v17[6] = location;
    v17[7] = length;
    v17[4] = a3;
    v17[5] = self;
    int v18 = a6;
    int v19 = a7;
    *(double *)&v17[8] = a5;
    sub_10062F590((uint64_t)fRequester, a6, a7, (uint64_t)v17);
  }
}

- (void)processWireless:(id)a3 inRange:(_NSRange)a4 timeReceived:(double)a5 requestType:(int)a6 tag:(int)a7 surroundingWifiBands:(const void *)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = &qword_102419000;
  if (qword_1024193A0 != -1) {
    dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
  }
  char v13 = qword_1024193A8;
  if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    *(void *)&uint8_t buf[4] = length;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "AlsWifi, rx, %{public}lu", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193A0 != -1) {
      dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
    }
    *(_DWORD *)__p = 134349056;
    *(void *)&__p[4] = length;
    v115 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]", "%s\n", v115);
    if (v115 != buf) {
      free(v115);
    }
  }
  if (length)
  {
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v129 = 0;
    v130 = 0;
    v131 = 0;
    NSUInteger v122 = location + length;
    if (location < location + length)
    {
      __asm { FMOV            V0.2D, #-1.0 }
      long long v121 = _Q0;
      id v119 = a3;
      do
      {
        id v19 = [a3 objectAtIndex:location];
        sub_1000FECE0((const __CFString *)[v19 macID], (uint64_t)buf);
        uint64_t v128 = sub_100B38F04((uint64_t)buf);
        if (SHIBYTE(v162) < 0) {
          operator delete(*(void **)buf);
        }
        if (![v19 hasLocation]
          || (objc_msgSend(objc_msgSend(v19, "location"), "accuracy") & 0x80000000) != 0)
        {
          uint64_t v21 = v128;
          long long v127 = 0uLL;
          v123[0] = 0;
          v123[1] = 0;
          int v124 = 0;
          memset(v135, 0, 25);
          *(void *)&v158[3] = -1;
          *(void *)&v158[11] = -1;
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask")) {
            unsigned int v23 = [v19 location].infoMask;
          }
          else {
            unsigned int v23 = 1;
          }
          if (v12[116] != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
          }
          v24 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEFAULT))
          {
            sub_100B39278((std::string *)__p);
            v25 = __p[23] >= 0 ? __p : *(unsigned char **)__p;
            unsigned int v26 = [v19 location].hasInfoMask;
            *(_DWORD *)buf = 136381443;
            *(void *)&uint8_t buf[4] = v25;
            __int16 v160 = 2050;
            NSUInteger v161 = location;
            __int16 v162 = 1026;
            *(_DWORD *)v163 = v26;
            *(_WORD *)&v163[4] = 1026;
            *(_DWORD *)&v163[6] = v23;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "AlsWifi, unknown, %{private}s, %{public}lu, hasInfoMask, %{public}d, infoMask, 0x%{public}x", buf, 0x22u);
            if ((__p[23] & 0x80000000) != 0) {
              operator delete(*(void **)__p);
            }
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v12[116] != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
            }
            sub_100B39278(&v126);
            if ((v126.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v96 = &v126;
            }
            else {
              v96 = (std::string *)v126.__r_.__value_.__r.__words[0];
            }
            unsigned int v97 = [objc_msgSend(v19, "location") hasInfoMask];
            *(_DWORD *)__p = 136381443;
            *(void *)&__p[4] = v96;
            *(_WORD *)&unsigned char __p[12] = 2050;
            *(void *)&__p[14] = location;
            *(_WORD *)&__p[22] = 1026;
            *(_DWORD *)&__p[24] = v97;
            *(_WORD *)&unsigned char __p[28] = 1026;
            *(_DWORD *)&__p[30] = v23;
            v98 = (char *)_os_log_send_and_compose_impl();
            if (SHIBYTE(v126.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v126.__r_.__value_.__l.__data_);
            }
            sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]", "%s\n", v98);
            if (v98 != buf) {
              free(v98);
            }
          }
          v27 = v130;
          if (v130 >= v131)
          {
            unint64_t v31 = 0xD37A6F4DE9BD37A7 * ((v130 - (unsigned char *)v129) >> 3);
            unint64_t v32 = v31 + 1;
            if (v31 + 1 > 0x1642C8590B21642) {
              sub_1001D7FD4();
            }
            if (0xA6F4DE9BD37A6F4ELL * ((v131 - (unsigned char *)v129) >> 3) > v32) {
              unint64_t v32 = 0xA6F4DE9BD37A6F4ELL * ((v131 - (unsigned char *)v129) >> 3);
            }
            if (0xD37A6F4DE9BD37A7 * ((v131 - (unsigned char *)v129) >> 3) >= 0xB21642C8590B21) {
              unint64_t v33 = 0x1642C8590B21642;
            }
            else {
              unint64_t v33 = v32;
            }
            if (v33) {
              v34 = (char *)sub_10050F820((uint64_t)&v131, v33);
            }
            else {
              v34 = 0;
            }
            __int16 v60 = &v34[184 * v31];
            *(_DWORD *)__int16 v60 = 0xFFFF;
            *(_OWORD *)(v60 + 4) = v127;
            *(_OWORD *)(v60 + 20) = xmmword_101D25030;
            *(_OWORD *)(v60 + 36) = v121;
            *(_OWORD *)(v60 + 52) = v121;
            *(void *)(v60 + 68) = 0xBFF0000000000000;
            *(CFAbsoluteTime *)(v60 + 76) = Current;
            *((_DWORD *)v60 + 21) = 0;
            *((void *)v60 + 11) = 0xBFF0000000000000;
            *((_OWORD *)v60 + 6) = *(_OWORD *)v123;
            *((_DWORD *)v60 + 28) = v124;
            *(void *)(v60 + 116) = 0xBFF0000000000000;
            *((_DWORD *)v60 + 31) = 0x7FFFFFFF;
            long long v61 = *(_OWORD *)&v135[9];
            *((_OWORD *)v60 + 8) = *(_OWORD *)v135;
            *(_OWORD *)(v60 + 137) = v61;
            long long v62 = *(_OWORD *)v158;
            *((_DWORD *)v60 + 42) = *(_DWORD *)&v158[15];
            *((_DWORD *)v60 + 43) = v23;
            *(_OWORD *)(v60 + 153) = v62;
            *((void *)v60 + 22) = v21;
            v64 = (char *)v129;
            __int16 v63 = v130;
            __int16 v65 = v60;
            if (v130 != v129)
            {
              do
              {
                long long v66 = *(_OWORD *)(v63 - 184);
                long long v67 = *(_OWORD *)(v63 - 168);
                long long v68 = *(_OWORD *)(v63 - 152);
                *(_OWORD *)(v65 - 136) = *(_OWORD *)(v63 - 136);
                *(_OWORD *)(v65 - 152) = v68;
                *(_OWORD *)(v65 - 168) = v67;
                *(_OWORD *)(v65 - 184) = v66;
                long long v69 = *(_OWORD *)(v63 - 120);
                long long v70 = *(_OWORD *)(v63 - 104);
                long long v71 = *(_OWORD *)(v63 - 88);
                *(_OWORD *)(v65 - 72) = *(_OWORD *)(v63 - 72);
                *(_OWORD *)(v65 - 88) = v71;
                *(_OWORD *)(v65 - 104) = v70;
                *(_OWORD *)(v65 - 120) = v69;
                long long v72 = *(_OWORD *)(v63 - 56);
                long long v73 = *(_OWORD *)(v63 - 40);
                long long v74 = *(_OWORD *)(v63 - 24);
                *((void *)v65 - 1) = *((void *)v63 - 1);
                *(_OWORD *)(v65 - 24) = v74;
                *(_OWORD *)(v65 - 40) = v73;
                *(_OWORD *)(v65 - 56) = v72;
                v65 -= 184;
                v63 -= 184;
              }
              while (v63 != v64);
              __int16 v63 = v64;
            }
            __int16 v30 = v60 + 184;
            v129 = v65;
            v130 = v60 + 184;
            v131 = &v34[184 * v33];
            if (v63) {
              operator delete(v63);
            }
          }
          else
          {
            *(_DWORD *)v130 = 0xFFFF;
            *(_OWORD *)(v27 + 4) = v127;
            *(_OWORD *)(v27 + 20) = xmmword_101D25030;
            *(_OWORD *)(v27 + 36) = v121;
            *(_OWORD *)(v27 + 52) = v121;
            *(void *)(v27 + 68) = 0xBFF0000000000000;
            *(CFAbsoluteTime *)(v27 + 76) = Current;
            *((_DWORD *)v27 + 21) = 0;
            *((void *)v27 + 11) = 0xBFF0000000000000;
            *((_OWORD *)v27 + 6) = *(_OWORD *)v123;
            *((_DWORD *)v27 + 28) = v124;
            *(void *)(v27 + 116) = 0xBFF0000000000000;
            *((_DWORD *)v27 + 31) = 0x7FFFFFFF;
            long long v28 = *(_OWORD *)v135;
            *(_OWORD *)(v27 + 137) = *(_OWORD *)&v135[9];
            *((_OWORD *)v27 + 8) = v28;
            long long v29 = *(_OWORD *)v158;
            *((_DWORD *)v27 + 42) = *(_DWORD *)&v158[15];
            *((_DWORD *)v27 + 43) = v23;
            *(_OWORD *)(v27 + 153) = v29;
            __int16 v30 = v27 + 184;
            *((void *)v27 + 22) = v21;
          }
          v130 = v30;
        }
        else
        {
          *(void *)&__p[4] = 0;
          *(void *)&unsigned char __p[12] = 0;
          *(_OWORD *)&__p[36] = v121;
          *(_OWORD *)&__p[52] = v121;
          *(_OWORD *)&__p[68] = v121;
          *(_DWORD *)__p = 0xFFFF;
          *(_DWORD *)&__p[84] = 0;
          *(void *)&__p[88] = 0xBFF0000000000000;
          long long v153 = 0uLL;
          LODWORD(v154) = 0;
          *(void *)((char *)&v154 + 4) = 0xBFF0000000000000;
          *(void *)v156 = 0;
          long long v155 = 0uLL;
          v156[8] = 0;
          *(void *)&v156[12] = -1;
          *(void *)&v156[20] = -1;
          HIDWORD(v154) = 0x7FFFFFFF;
          *(_DWORD *)&v156[28] = 0;
          uint64_t v157 = v128;
          *(_OWORD *)&__p[20] = xmmword_101D25030;
          if ((int)objc_msgSend(objc_msgSend(v19, "location"), "accuracy") < 1000000) {
            double v20 = (double)[(int)[v19 location] accuracy];
          }
          else {
            double v20 = (double)(int)[v19 location].accuracy / 1000000.0;
          }
          *(double *)&__p[20] = v20;
          *(double *)&__p[76] = a5;
          *(double *)&__p[4] = (double)(uint64_t)[v19 location].latitude / 100000000.0;
          *(double *)&unsigned char __p[12] = (double)(uint64_t)[[v19 location] longitude] / 100000000.0;
          DWORD1(v155) = 1;
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasAltitude")
            && objc_msgSend(objc_msgSend(v19, "location"), "hasVerticalAccuracy"))
          {
            *(double *)&unsigned char __p[28] = (double)[v19 location].altitude / 100.0;
            *(double *)&__p[36] = (double)(int)[v19 location].verticalAccuracy / 100.0;
          }
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasConfidence")) {
            unsigned int v35 = [objc_msgSend(v19, "location") confidence];
          }
          else {
            unsigned int v35 = 50;
          }
          *(_DWORD *)&__p[84] = v35;
          if ([v19 hasChannel]) {
            *(_DWORD *)&v156[16] = [v19 channel];
          }
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasScore")) {
            *(_DWORD *)&v156[12] = [v19 location].score;
          }
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasReach")) {
            *(_DWORD *)&v156[20] = [objc_msgSend(objc_msgSend(v19, "location"), "reach")];
          }
          if (objc_msgSend(objc_msgSend(v19, "location"), "hasInfoMask")) {
            *(_DWORD *)&v156[28] = [objc_msgSend(objc_msgSend(v19, "location"), "infoMask")];
          }
          if ([v19 hasNumZaxisHarvestTraces]) {
            *(_DWORD *)&v156[24] = [v19 numZaxisHarvestTraces];
          }
          if (v12[116] != -1) {
            dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
          }
          v36 = qword_1024193A8;
          if (os_log_type_enabled((os_log_t)qword_1024193A8, OS_LOG_TYPE_DEBUG))
          {
            sub_100B39278((std::string *)v135);
            if (v135[23] >= 0) {
              uint64_t v37 = v135;
            }
            else {
              uint64_t v37 = *(unsigned char **)v135;
            }
            sub_100B9B6EC();
            if ((v126.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              unint64_t v38 = &v126;
            }
            else {
              unint64_t v38 = (std::string *)v126.__r_.__value_.__r.__words[0];
            }
            int v39 = *(_DWORD *)&v156[12];
            int v40 = *(_DWORD *)&v156[16];
            uint64_t v41 = *(void *)&__p[28];
            int v42 = *(_DWORD *)&v156[20];
            unsigned int v43 = [v19 location].hasInfoMask;
            *(_DWORD *)buf = 136383235;
            *(void *)&uint8_t buf[4] = v37;
            __int16 v160 = 2050;
            NSUInteger v161 = location;
            __int16 v162 = 2081;
            *(void *)v163 = v38;
            *(_WORD *)&v163[8] = 1026;
            int v164 = v39;
            __int16 v165 = 1026;
            int v166 = v40;
            __int16 v167 = 2050;
            uint64_t v168 = v41;
            __int16 v169 = 1026;
            int v170 = v42;
            __int16 v171 = 1026;
            unsigned int v172 = v43;
            __int16 v173 = 1026;
            int v174 = *(_DWORD *)&v156[28];
            __int16 v175 = 1026;
            int v176 = *(_DWORD *)&v156[24];
            __int16 v177 = 1026;
            int v178 = a6;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "AlsWifi, valid, location, %{private}s, %{public}lu, %{private}s, score, %{public}d, channel, %{public}d, alt, %{public}.2lf, reach, %{public}d, hasInfoMask, %{public}d, infoMask, 0x%{public}x, numHarvestTraces, %{public}d, type, %{public}d", buf, 0x54u);
            if (SHIBYTE(v126.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v126.__r_.__value_.__l.__data_);
            }
            a3 = v119;
            id v12 = &qword_102419000;
            if ((v135[23] & 0x80000000) != 0) {
              operator delete(*(void **)v135);
            }
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (v12[116] != -1) {
              dispatch_once(&qword_1024193A0, &stru_1022BF4C8);
            }
            sub_100B39278(&v126);
            if ((v126.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v99 = &v126;
            }
            else {
              v99 = (std::string *)v126.__r_.__value_.__r.__words[0];
            }
            sub_100B9B6EC();
            if (v125 >= 0) {
              v100 = v123;
            }
            else {
              v100 = (void **)v123[0];
            }
            int v101 = *(_DWORD *)&v156[12];
            int v102 = *(_DWORD *)&v156[16];
            uint64_t v103 = *(void *)&__p[28];
            int v104 = *(_DWORD *)&v156[20];
            unsigned int v105 = [v19 location].hasInfoMask;
            *(_DWORD *)v135 = 136383235;
            *(void *)&v135[4] = v99;
            *(_WORD *)&v135[12] = 2050;
            *(void *)&v135[14] = location;
            *(_WORD *)&v135[22] = 2081;
            *(void *)&v135[24] = v100;
            __int16 v136 = 1026;
            int v137 = v101;
            __int16 v138 = 1026;
            int v139 = v102;
            __int16 v140 = 2050;
            uint64_t v141 = v103;
            __int16 v142 = 1026;
            int v143 = v104;
            __int16 v144 = 1026;
            unsigned int v145 = v105;
            __int16 v146 = 1026;
            int v147 = *(_DWORD *)&v156[28];
            __int16 v148 = 1026;
            int v149 = *(_DWORD *)&v156[24];
            __int16 v150 = 1026;
            int v151 = a6;
            v106 = (char *)_os_log_send_and_compose_impl();
            if (v125 < 0) {
              operator delete(v123[0]);
            }
            a3 = v119;
            id v12 = &qword_102419000;
            if (SHIBYTE(v126.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v126.__r_.__value_.__l.__data_);
            }
            sub_1004BA5E4("Generic", 1, 0, 2, "-[ALSLocationDelegate processWireless:inRange:timeReceived:requestType:tag:surroundingWifiBands:]", "%s\n", v106);
            if (v106 != buf) {
              free(v106);
            }
          }
          v44 = v133;
          if (v133 >= v134)
          {
            v55 = v132;
            unint64_t v56 = 0xD37A6F4DE9BD37A7 * ((v133 - (unsigned char *)v132) >> 3);
            unint64_t v57 = v56 + 1;
            if (v56 + 1 > 0x1642C8590B21642) {
              sub_1001D7FD4();
            }
            if (0xA6F4DE9BD37A6F4ELL * ((v134 - (unsigned char *)v132) >> 3) > v57) {
              unint64_t v57 = 0xA6F4DE9BD37A6F4ELL * ((v134 - (unsigned char *)v132) >> 3);
            }
            if (0xD37A6F4DE9BD37A7 * ((v134 - (unsigned char *)v132) >> 3) >= 0xB21642C8590B21) {
              unint64_t v58 = 0x1642C8590B21642;
            }
            else {
              unint64_t v58 = v57;
            }
            if (v58)
            {
              v59 = (char *)sub_10050F820((uint64_t)&v134, v58);
              v55 = v132;
              v44 = v133;
            }
            else
            {
              v59 = 0;
            }
            v75 = &v59[184 * v56];
            long long v76 = *(_OWORD *)__p;
            long long v77 = *(_OWORD *)&__p[16];
            long long v78 = *(_OWORD *)&__p[48];
            *((_OWORD *)v75 + 2) = *(_OWORD *)&__p[32];
            *((_OWORD *)v75 + 3) = v78;
            *(_OWORD *)v75 = v76;
            *((_OWORD *)v75 + 1) = v77;
            long long v79 = *(_OWORD *)&__p[64];
            long long v80 = *(_OWORD *)&__p[80];
            long long v81 = v154;
            *((_OWORD *)v75 + 6) = v153;
            *((_OWORD *)v75 + 7) = v81;
            *((_OWORD *)v75 + 4) = v79;
            *((_OWORD *)v75 + 5) = v80;
            long long v82 = v155;
            long long v83 = *(_OWORD *)v156;
            long long v84 = *(_OWORD *)&v156[16];
            *((void *)v75 + 22) = v157;
            *((_OWORD *)v75 + 9) = v83;
            *((_OWORD *)v75 + 10) = v84;
            *((_OWORD *)v75 + 8) = v82;
            if (v44 == v55)
            {
              v95 = &v59[184 * v56];
            }
            else
            {
              v85 = &v59[184 * v56];
              do
              {
                long long v86 = *(_OWORD *)((char *)v44 - 184);
                long long v87 = *(_OWORD *)((char *)v44 - 168);
                long long v88 = *(_OWORD *)((char *)v44 - 152);
                *(_OWORD *)(v85 - 136) = *(_OWORD *)((char *)v44 - 136);
                *(_OWORD *)(v85 - 152) = v88;
                *(_OWORD *)(v85 - 168) = v87;
                *(_OWORD *)(v85 - 184) = v86;
                long long v89 = *(_OWORD *)((char *)v44 - 120);
                long long v90 = *(_OWORD *)((char *)v44 - 104);
                long long v91 = *(_OWORD *)((char *)v44 - 88);
                *(_OWORD *)(v85 - 72) = *(_OWORD *)((char *)v44 - 72);
                *(_OWORD *)(v85 - 88) = v91;
                *(_OWORD *)(v85 - 104) = v90;
                *(_OWORD *)(v85 - 120) = v89;
                long long v92 = *(_OWORD *)((char *)v44 - 56);
                long long v93 = *(_OWORD *)((char *)v44 - 40);
                long long v94 = *(_OWORD *)((char *)v44 - 24);
                v95 = v85 - 184;
                *((void *)v85 - 1) = *((void *)v44 - 1);
                *(_OWORD *)(v85 - 24) = v94;
                *(_OWORD *)(v85 - 40) = v93;
                *(_OWORD *)(v85 - 56) = v92;
                v44 = (_OWORD *)((char *)v44 - 184);
                v85 -= 184;
              }
              while (v44 != v55);
            }
            v54 = v75 + 184;
            v132 = v95;
            v133 = v75 + 184;
            v134 = &v59[184 * v58];
            if (v55) {
              operator delete(v55);
            }
          }
          else
          {
            long long v45 = *(_OWORD *)__p;
            long long v46 = *(_OWORD *)&__p[16];
            long long v47 = *(_OWORD *)&__p[48];
            *((_OWORD *)v133 + 2) = *(_OWORD *)&__p[32];
            v44[3] = v47;
            _OWORD *v44 = v45;
            v44[1] = v46;
            long long v48 = *(_OWORD *)&__p[64];
            long long v49 = *(_OWORD *)&__p[80];
            long long v50 = v154;
            v44[6] = v153;
            v44[7] = v50;
            v44[4] = v48;
            v44[5] = v49;
            long long v51 = v155;
            long long v52 = *(_OWORD *)v156;
            long long v53 = *(_OWORD *)&v156[16];
            *((void *)v44 + 22) = v157;
            v44[9] = v52;
            v44[10] = v53;
            v44[8] = v51;
            v54 = (char *)v44 + 184;
          }
          v133 = v54;
        }
        ++location;
      }
      while (location != v122);
    }
    v107 = *(int **)a8;
    v108 = (int *)*((void *)a8 + 1);
    if (*(int **)a8 == v108)
    {
      int v113 = 0;
    }
    else
    {
      char v109 = 0;
      char v110 = 0;
      do
      {
        while (1)
        {
          while (1)
          {
            int v112 = *v107++;
            int v111 = v112;
            if (v112 != 1) {
              break;
            }
            char v109 = 1;
            if (v107 == v108)
            {
              if (v110) {
                int v113 = 3;
              }
              else {
                int v113 = 1;
              }
              goto LABEL_140;
            }
          }
          if (v111 != 2) {
            break;
          }
          char v110 = 1;
          if (v107 == v108)
          {
            if (v109) {
              int v113 = 3;
            }
            else {
              int v113 = 2;
            }
            goto LABEL_140;
          }
        }
      }
      while (v107 != v108);
      if (v110) {
        int v113 = 3;
      }
      else {
        int v113 = 1;
      }
      if (v110) {
        int v114 = 2;
      }
      else {
        int v114 = 0;
      }
      if ((v109 & 1) == 0) {
        int v113 = v114;
      }
    }
LABEL_140:
    sub_100634BA0((uint64_t)self->fRequester, (uint64_t)&v132, (uint64_t)&v129, a6, a7, v113);
    if (v129)
    {
      v130 = (char *)v129;
      operator delete(v129);
    }
    if (v132)
    {
      v133 = (char *)v132;
      operator delete(v132);
    }
  }
}

- (void)addRequesterWithOutstandingRequest:(id)a3
{
}

@end