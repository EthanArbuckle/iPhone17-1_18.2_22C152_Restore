@interface MIBUNetworkInfoResponse
- (BOOL)_deserialize:(id)a3;
- (MIBUNetworkInfo)networkInfo;
- (MIBUNetworkInfoResponse)init;
- (id)serialize;
- (void)setNetworkInfo:(id)a3;
@end

@implementation MIBUNetworkInfoResponse

- (MIBUNetworkInfoResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUNetworkInfoResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUNetworkInfoResponse *)v2 setNetworkInfo:0];
  }
  return v3;
}

- (id)serialize
{
  v3 = objc_opt_new();
  v4 = [(MIBUNetworkInfoResponse *)self networkInfo];

  if (v4)
  {
    if (![(MIBUNFCResponse *)self rejected])
    {
      objc_super v5 = [(MIBUNetworkInfoResponse *)self networkInfo];
      [v5 networkName];
      v65 = v66 = v5;
      if (v65)
      {
        v64 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v6 = [v64 networkName];
      }
      else
      {
        uint64_t v6 = objc_opt_new();
        v64 = (void *)v6;
      }
      v40 = (void *)v6;
      v68[0] = v6;
      v7 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 RSSI]);
      v68[1] = v8;
      v9 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v9 noise]);
      v68[2] = v10;
      v11 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v11 channel]);
      v68[3] = v12;
      v57 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v57 channelWidth]);
      v68[4] = v56;
      v55 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 channelBand]);
      v68[5] = v54;
      v53 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v52 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v53 PHYMode]);
      v68[6] = v52;
      v51 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v50 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v51 numberOfSpatialStreams]);
      v68[7] = v50;
      v13 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v48 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 MCSIndex]);
      v68[8] = v48;
      v47 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v67 = [v47 MACAddress];
      if (v67)
      {
        v46 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v14 = [v46 MACAddress];
      }
      else
      {
        uint64_t v14 = objc_opt_new();
        v46 = (void *)v14;
      }
      v39 = (void *)v14;
      v68[9] = v14;
      v45 = [(MIBUNetworkInfoResponse *)self networkInfo];
      uint64_t v15 = [v45 iPV4Address];
      v58 = (void *)v12;
      v59 = v11;
      if (v15)
      {
        v43 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v16 = [v43 iPV4Address];
      }
      else
      {
        uint64_t v16 = objc_opt_new();
        v43 = (void *)v16;
      }
      v44 = (void *)v15;
      v38 = (void *)v16;
      v68[10] = v16;
      v41 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v17 = [v41 iPV6Address];
      v62 = (void *)v8;
      v63 = v7;
      v60 = (void *)v10;
      v61 = v9;
      v18 = v3;
      if (v17)
      {
        v19 = [(MIBUNetworkInfoResponse *)self networkInfo];
        uint64_t v20 = [v19 iPV6Address];
      }
      else
      {
        uint64_t v20 = objc_opt_new();
        v19 = (void *)v20;
      }
      v21 = (void *)v20;
      v68[11] = v20;
      v22 = [(MIBUNetworkInfoResponse *)self networkInfo];
      v23 = [v22 BSSID];
      v49 = v13;
      if (v23)
      {
        v7 = [(MIBUNetworkInfoResponse *)self networkInfo];
        v24 = [v7 BSSID];
      }
      else
      {
        v24 = objc_opt_new();
      }
      v68[12] = v24;
      v25 = +[NSArray arrayWithObjects:v68 count:13];
      unsigned __int8 v42 = [v18 serialize:&off_1000611F8 withValue:v25];

      if (v23)
      {

        v24 = v7;
      }

      if (v17) {
      v3 = v18;
      }
      if (v44) {

      }
      if (v67) {
      if (v65)
      }

      if (v42)
      {
        v26 = [(MIBUNFCResponse *)self error];
        unsigned __int8 v27 = [v18 serializeResponseError:v26];

        if (v27)
        {
          v4 = [v18 serializedData];
          goto LABEL_31;
        }
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059590);
        }
        v37 = (void *)qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003E31C(v37, self);
        }
      }
      else
      {
        if (qword_10006C958 != -1) {
          dispatch_once(&qword_10006C958, &stru_100059570);
        }
        v29 = qword_10006C950;
        if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
          sub_10003E3C4(v29, v30, v31, v32, v33, v34, v35, v36);
        }
      }
    }
    v4 = 0;
  }
LABEL_31:

  return v4;
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[MIBUDeserializer alloc] initWithData:v4];

  uint64_t v6 = [(MIBUDeserializer *)v5 deserialize];
  if (!v6)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000595B0);
    }
    unsigned __int8 v42 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E3FC(v42, v43, v44, v45, v46, v47, v48, v49);
    }
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    uint64_t v34 = 0;
    uint64_t v33 = 0;
    v37 = 0;
    v39 = 0;
    uint64_t v31 = 0;
    id v65 = 0;
    goto LABEL_15;
  }
  id v72 = 0;
  unsigned __int8 v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v72];
  id v65 = v72;
  if ((v7 & 1) == 0)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_1000595D0);
    }
    v50 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003E434(v50, v51, v52, v53, v54, v55, v56, v57);
    }
    v71 = 0;
    v68 = 0;
    v69 = 0;
    v70 = 0;
    v66 = 0;
    v67 = 0;
    v63 = 0;
    v64 = 0;
    uint64_t v34 = 0;
    uint64_t v33 = 0;
    v37 = 0;
    v39 = 0;
    uint64_t v31 = 0;
LABEL_15:
    BOOL v40 = 0;
    goto LABEL_4;
  }
  uint64_t v58 = [v6 objectForKey:&off_10005FF28];
  v63 = [v6 objectForKey:&off_10005FF40];
  v71 = [v6 objectForKey:&off_10005FF58];
  v70 = [v6 objectForKey:&off_10005FF70];
  v69 = [v6 objectForKey:&off_10005FF88];
  uint64_t v8 = [v6 objectForKey:&off_10005FFA0];
  v9 = [v6 objectForKey:&off_10005FFB8];
  uint64_t v10 = [v6 objectForKey:&off_10005FFD0];
  v11 = [v6 objectForKey:&off_10005FFE8];
  uint64_t v60 = [v6 objectForKey:&off_100060000];
  uint64_t v59 = [v6 objectForKey:&off_100060018];
  uint64_t v61 = [v6 objectForKey:&off_100060030];
  uint64_t v62 = [v6 objectForKey:&off_100060048];
  uint64_t v12 = objc_alloc_init(MIBUNetworkInfo);
  [(MIBUNetworkInfoResponse *)self setNetworkInfo:v12];

  v13 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v13 setNetworkName:v58];

  id v14 = [v63 longValue];
  [(MIBUNetworkInfoResponse *)self networkInfo];
  v16 = uint64_t v15 = v5;
  [v16 setRSSI:v14];

  id v17 = [v71 longValue];
  v18 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v18 setNoise:v17];

  id v19 = [v70 longValue];
  uint64_t v20 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v20 setChannel:v19];

  uint64_t v21 = (int)[v69 intValue];
  v22 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v22 setChannelWidth:v21];

  v67 = v8;
  uint64_t v23 = (int)[v8 intValue];
  v24 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v24 setChannelBand:v23];

  v66 = v9;
  uint64_t v25 = (int)[v9 intValue];
  v26 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v26 setPHYMode:v25];

  v68 = v10;
  id v27 = [v10 unsignedLongValue];
  v28 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v28 setNumberOfSpatialStreams:v27];

  v64 = v11;
  id v29 = [v11 unsignedLongValue];
  uint64_t v30 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v30 setMCSIndex:v29];

  objc_super v5 = v15;
  uint64_t v31 = (void *)v58;
  uint64_t v32 = [(MIBUNetworkInfoResponse *)self networkInfo];
  uint64_t v33 = (void *)v59;
  uint64_t v34 = (void *)v60;
  [v32 setMACAddress:];

  uint64_t v35 = [(MIBUNetworkInfoResponse *)self networkInfo];
  [v35 setIPV4Address:v59];

  uint64_t v36 = [(MIBUNetworkInfoResponse *)self networkInfo];
  v37 = (void *)v61;
  [v36 setIPV6Address:];

  v38 = [(MIBUNetworkInfoResponse *)self networkInfo];
  v39 = (void *)v62;
  [v38 setBSSID:];

  BOOL v40 = 1;
LABEL_4:
  [(MIBUNFCResponse *)self setError:v65];

  return v40;
}

- (MIBUNetworkInfo)networkInfo
{
  return self->_networkInfo;
}

- (void)setNetworkInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end