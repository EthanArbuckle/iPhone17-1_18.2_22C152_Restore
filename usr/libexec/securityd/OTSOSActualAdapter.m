@interface OTSOSActualAdapter
+ (id)sosCKKSViewList;
- (BOOL)essential;
- (BOOL)joinAfterRestore:(id *)a3;
- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4;
- (BOOL)resetToOffering:(id *)a3;
- (BOOL)safariViewSyncingEnabled:(id *)a3;
- (BOOL)sosEnabled;
- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4;
- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4;
- (CKKSListenerCollection)peerChangeListeners;
- (NSString)description;
- (NSString)providerID;
- (id)currentSOSSelf:(id *)a3;
- (id)currentState;
- (id)fetchSelfPeers:(id *)a3;
- (id)fetchTrustedPeers:(id *)a3;
- (id)initAsEssential:(BOOL)a3;
- (int)circleStatus:(id *)a3;
- (void)registerForPeerChangeUpdates:(id)a3;
- (void)sendSelfPeerChangedUpdate;
- (void)sendTrustedPeerSetChangedUpdate;
- (void)setEssential:(BOOL)a3;
- (void)setPeerChangeListeners:(id)a3;
@end

@implementation OTSOSActualAdapter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerChangeListeners, 0);

  objc_storeStrong((id *)&self->_providerID, 0);
}

- (void)setPeerChangeListeners:(id)a3
{
}

- (CKKSListenerCollection)peerChangeListeners
{
  return (CKKSListenerCollection *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)providerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEssential:(BOOL)a3
{
  self->_essential = a3;
}

- (BOOL)essential
{
  return self->_essential;
}

- (BOOL)resetToOffering:(id *)a3
{
  if (![(OTSOSActualAdapter *)self sosEnabled])
  {
    if (!a3)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    id v6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  int v4 = SOSCCResetToOffering();
  v5 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SOSCCResetToOffering complete: %d %@", buf, 0x12u);
  }

  if (a3)
  {
    id v6 = 0;
LABEL_8:
    *a3 = v6;
  }
  return v4;
}

- (BOOL)joinAfterRestore:(id *)a3
{
  if (![(OTSOSActualAdapter *)self sosEnabled])
  {
    if (!a3)
    {
      LOBYTE(v4) = 0;
      return v4;
    }
    id v6 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS unsupported on this platform"];
    LOBYTE(v4) = 0;
    goto LABEL_8;
  }
  int v4 = SOSCCRequestToJoinCircleAfterRestore();
  v5 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v9 = v4;
    __int16 v10 = 2112;
    uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SOSCCRequestToJoinCircleAfterRestore complete: %d %@", buf, 0x12u);
  }

  if (a3)
  {
    id v6 = 0;
LABEL_8:
    *a3 = v6;
  }
  return v4;
}

- (BOOL)safariViewSyncingEnabled:(id *)a3
{
  if ([(OTSOSActualAdapter *)self sosEnabled]) {
    return SOSCCView() == 1;
  }
  if (!a3) {
    return 0;
  }
  id v4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
  BOOL result = 0;
  *a3 = v4;
  return result;
}

- (id)currentState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = sub_10008DD90;
  int v9 = sub_10008DDA0;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008DDA8;
  v4[3] = &unk_100307348;
  v4[4] = self;
  v4[5] = &v5;
  +[SOSAccount performOnQuietAccountQueue:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)sendTrustedPeerSetChangedUpdate
{
  v3 = [(OTSOSActualAdapter *)self peerChangeListeners];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008DF28;
  v4[3] = &unk_1002F8AA0;
  v4[4] = self;
  [v3 iterateListeners:v4];
}

- (void)sendSelfPeerChangedUpdate
{
  v3 = [(OTSOSActualAdapter *)self peerChangeListeners];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008DFBC;
  v4[3] = &unk_1002F8AA0;
  v4[4] = self;
  [v3 iterateListeners:v4];
}

- (void)registerForPeerChangeUpdates:(id)a3
{
  id v4 = a3;
  id v5 = [(OTSOSActualAdapter *)self peerChangeListeners];
  [v5 registerListener:v4];
}

- (BOOL)updateCKKS4AllStatus:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if ([(OTSOSActualAdapter *)self sosEnabled])
  {
    CFTypeRef v12 = 0;
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v14 = sub_10022E4E0;
    v15 = &unk_1003094C0;
    BOOL v16 = v5;
    BOOL v6 = sub_10021CD84(&v12, &buf);
    uint64_t v7 = (void *)v12;
    if (!v6 || v12)
    {
      id v10 = sub_10000B070("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "octagon-sos: failed to update CKKS4All status in SOS: %@", (uint8_t *)&buf, 0xCu);
      }

      if (a4 && v7) {
        *a4 = v7;
      }
    }
    else
    {
      v8 = sub_10000B070("octagon-sos");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v9 = @"not supported";
        if (v5) {
          CFStringRef v9 = @"supported";
        }
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "successfully updated CKKS4All status in SOS to '%@'", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else if (a4)
  {
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
    LOBYTE(v6) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)updateOctagonKeySetWithAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(OTSOSActualAdapter *)self sosEnabled])
  {
    if (a4)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
      BOOL v38 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v38 = 0;
    }
    goto LABEL_24;
  }
  uint64_t v7 = [v6 publicSigningKey];
  if ([v7 _secKey])
  {
    v8 = [v6 publicEncryptionKey];
    id v9 = [v8 _secKey];

    if (v9)
    {
      uint64_t v87 = 0;
      v88 = &v87;
      uint64_t v89 = 0x2020000000;
      unint64_t v90 = 0xAAAAAAAAAAAAAAAALL;
      id v10 = [v6 signingKey];
      uint64_t v11 = [v10 keyData];

      unint64_t v90 = v11;
      uint64_t v83 = 0;
      v84 = &v83;
      uint64_t v85 = 0x2020000000;
      unint64_t v86 = 0xAAAAAAAAAAAAAAAALL;
      CFTypeRef v12 = [v6 encryptionKey];
      uint64_t v13 = [v12 keyData];

      unint64_t v86 = v13;
      v81[0] = 0;
      v81[1] = v81;
      v81[2] = 0x2020000000;
      unint64_t v82 = 0xAAAAAAAAAAAAAAAALL;
      v14 = [v6 publicSigningKey];
      uint64_t v15 = [v14 keyData];

      unint64_t v82 = v15;
      v79[0] = 0;
      v79[1] = v79;
      v79[2] = 0x2020000000;
      unint64_t v80 = 0xAAAAAAAAAAAAAAAALL;
      BOOL v16 = [v6 publicEncryptionKey];
      uint64_t v17 = [v16 keyData];

      unint64_t v80 = v17;
      uint64_t v75 = 0;
      v76 = &v75;
      uint64_t v77 = 0x2020000000;
      unint64_t v78 = 0xAAAAAAAAAAAAAAAALL;
      v18 = [v6 publicSigningKey];
      id v19 = [v18 _secKey];

      if (v19) {
        CFRetain(v19);
      }
      unint64_t v78 = (unint64_t)v19;
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      unint64_t v74 = 0xAAAAAAAAAAAAAAAALL;
      v20 = [v6 publicEncryptionKey];
      id v21 = [v20 _secKey];

      if (v21) {
        CFRetain(v21);
      }
      unint64_t v74 = (unint64_t)v21;
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x2020000000;
      unint64_t v70 = 0xAAAAAAAAAAAAAAAALL;
      v22 = [v6 signingKey];
      id v23 = [v22 _secKey];

      if (v23) {
        CFRetain(v23);
      }
      unint64_t v70 = (unint64_t)v23;
      uint64_t v63 = 0;
      v64 = &v63;
      uint64_t v65 = 0x2020000000;
      unint64_t v66 = 0xAAAAAAAAAAAAAAAALL;
      v24 = [v6 encryptionKey];
      id v25 = [v24 _secKey];

      if (v25) {
        CFRetain(v25);
      }
      unint64_t v66 = (unint64_t)v25;
      v26 = [(id)objc_opt_class() logger];
      v27 = [v26 startLogSystemMetricsForActivityNamed:@"OctagonSOSAdapterUpdateKeys"];

      uint64_t v59 = 0;
      v60 = &v59;
      uint64_t v61 = 0x2020000000;
      char v62 = -86;
      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x3032000000;
      v56 = sub_10008DD90;
      v57 = sub_10008DDA0;
      id v58 = 0;
      uint64_t v28 = v88[3];
      uint64_t v29 = v84[3];
      uint64_t v30 = v76[3];
      uint64_t v31 = v72[3];
      uint64_t v32 = v68[3];
      uint64_t v33 = v64[3];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10008E884;
      v41[3] = &unk_1002F8A78;
      id v34 = v27;
      id v42 = v34;
      v43 = &v59;
      v44 = &v53;
      v45 = &v87;
      v46 = &v83;
      v47 = v81;
      v48 = v79;
      v49 = &v75;
      v50 = &v71;
      v51 = &v67;
      v52 = &v63;
      v35 = v41;
      CFTypeRef v102 = 0;
      *(void *)long long buf = _NSConcreteStackBlock;
      uint64_t v92 = 3221225472;
      v93 = sub_10022DB30;
      v94 = &unk_100309558;
      uint64_t v96 = v28;
      uint64_t v97 = v29;
      uint64_t v98 = v30;
      uint64_t v99 = v31;
      v36 = v35;
      id v95 = v36;
      uint64_t v100 = v32;
      uint64_t v101 = v33;
      sub_10021CD84(&v102, buf);
      CFTypeRef v37 = v102;
      if (v102)
      {
        CFTypeRef v102 = 0;
        CFRelease(v37);
      }

      if (a4) {
        *a4 = (id) v54[5];
      }
      BOOL v38 = *((unsigned char *)v60 + 24) != 0;

      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v59, 8);

      _Block_object_dispose(&v63, 8);
      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&v71, 8);
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(v79, 8);
      _Block_object_dispose(v81, 8);
      _Block_object_dispose(&v83, 8);
      _Block_object_dispose(&v87, 8);
      goto LABEL_24;
    }
  }
  else
  {
  }
  v39 = sub_10000B070("octagon-sos");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "no octagon keys available skipping updating SOS record", buf, 2u);
  }

  BOOL v38 = 1;
LABEL_24:

  return v38;
}

- (BOOL)preloadOctagonKeySetOnAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(OTSOSActualAdapter *)self sosEnabled])
  {
    if (a4)
    {
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
      BOOL v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v33 = 0;
    }
    goto LABEL_24;
  }
  uint64_t v7 = [v6 publicSigningKey];
  if ([v7 _secKey])
  {
    v8 = [v6 publicEncryptionKey];
    id v9 = [v8 _secKey];

    if (v9)
    {
      uint64_t v77 = 0;
      unint64_t v78 = &v77;
      uint64_t v79 = 0x2020000000;
      unint64_t v80 = 0xAAAAAAAAAAAAAAAALL;
      id v10 = [v6 signingKey];
      uint64_t v11 = [v10 keyData];

      unint64_t v80 = v11;
      uint64_t v73 = 0;
      unint64_t v74 = &v73;
      uint64_t v75 = 0x2020000000;
      unint64_t v76 = 0xAAAAAAAAAAAAAAAALL;
      CFTypeRef v12 = [v6 encryptionKey];
      uint64_t v13 = [v12 keyData];

      unint64_t v76 = v13;
      uint64_t v69 = 0;
      unint64_t v70 = &v69;
      uint64_t v71 = 0x2020000000;
      unint64_t v72 = 0xAAAAAAAAAAAAAAAALL;
      v14 = [v6 publicSigningKey];
      id v15 = [v14 _secKey];

      if (v15) {
        CFRetain(v15);
      }
      unint64_t v72 = (unint64_t)v15;
      uint64_t v65 = 0;
      unint64_t v66 = &v65;
      uint64_t v67 = 0x2020000000;
      unint64_t v68 = 0xAAAAAAAAAAAAAAAALL;
      BOOL v16 = [v6 publicEncryptionKey];
      id v17 = [v16 _secKey];

      if (v17) {
        CFRetain(v17);
      }
      unint64_t v68 = (unint64_t)v17;
      uint64_t v61 = 0;
      char v62 = &v61;
      uint64_t v63 = 0x2020000000;
      unint64_t v64 = 0xAAAAAAAAAAAAAAAALL;
      v18 = [v6 signingKey];
      id v19 = [v18 _secKey];

      if (v19) {
        CFRetain(v19);
      }
      unint64_t v64 = (unint64_t)v19;
      uint64_t v57 = 0;
      id v58 = &v57;
      uint64_t v59 = 0x2020000000;
      unint64_t v60 = 0xAAAAAAAAAAAAAAAALL;
      v20 = [v6 encryptionKey];
      id v21 = [v20 _secKey];

      if (v21) {
        CFRetain(v21);
      }
      unint64_t v60 = (unint64_t)v21;
      v22 = [(id)objc_opt_class() logger];
      id v23 = [v22 startLogSystemMetricsForActivityNamed:@"OctagonSOSAdapterUpdateKeys"];

      uint64_t v53 = 0;
      v54 = &v53;
      uint64_t v55 = 0x2020000000;
      char v56 = -86;
      uint64_t v47 = 0;
      v48 = &v47;
      uint64_t v49 = 0x3032000000;
      v50 = sub_10008DD90;
      v51 = sub_10008DDA0;
      id v52 = 0;
      uint64_t v24 = v78[3];
      uint64_t v25 = v74[3];
      uint64_t v26 = v58[3];
      uint64_t v27 = v70[3];
      uint64_t v28 = v66[3];
      uint64_t v36 = v62[3];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10008EFF8;
      v37[3] = &unk_1002F8A50;
      id v29 = v23;
      id v38 = v29;
      v39 = &v53;
      v40 = &v47;
      v41 = &v77;
      id v42 = &v73;
      v43 = &v69;
      v44 = &v65;
      v45 = &v61;
      v46 = &v57;
      uint64_t v30 = v37;
      CFTypeRef v92 = 0;
      *(void *)long long buf = _NSConcreteStackBlock;
      uint64_t v82 = 3221225472;
      uint64_t v83 = sub_10022E224;
      v84 = &unk_100309558;
      uint64_t v86 = v24;
      uint64_t v87 = v25;
      uint64_t v88 = v27;
      uint64_t v89 = v28;
      uint64_t v31 = v30;
      id v85 = v31;
      uint64_t v90 = v36;
      uint64_t v91 = v26;
      sub_10021CD84(&v92, buf);
      CFTypeRef v32 = v92;
      if (v92)
      {
        CFTypeRef v92 = 0;
        CFRelease(v32);
      }

      if (a4) {
        *a4 = (id) v48[5];
      }
      BOOL v33 = *((unsigned char *)v54 + 24) != 0;

      _Block_object_dispose(&v47, 8);
      _Block_object_dispose(&v53, 8);

      _Block_object_dispose(&v57, 8);
      _Block_object_dispose(&v61, 8);
      _Block_object_dispose(&v65, 8);
      _Block_object_dispose(&v69, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v77, 8);
      goto LABEL_24;
    }
  }
  else
  {
  }
  id v34 = sub_10000B070("octagon-preload-keys");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "no octagon keys available skipping updating SOS record", buf, 2u);
  }

  BOOL v33 = 1;
LABEL_24:

  return v33;
}

- (id)fetchTrustedPeers:(id *)a3
{
  if ([(OTSOSActualAdapter *)self sosEnabled])
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = sub_10008DD90;
    id v21 = sub_10008DDA0;
    id v22 = (id)0xAAAAAAAAAAAAAAAALL;
    id v22 = +[NSMutableSet set];
    uint64_t v11 = 0;
    CFTypeRef v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = sub_10008DD90;
    id v15 = sub_10008DDA0;
    id v16 = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10008F3F4;
    v10[3] = &unk_1002F8A28;
    v10[4] = &v11;
    v10[5] = &v17;
    id v4 = v10;
    CFTypeRef v25 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10022E59C;
    v23[3] = &unk_100309508;
    BOOL v5 = v4;
    id v24 = v5;
    sub_10021CD84(&v25, v23);
    CFTypeRef v6 = v25;
    if (v25)
    {
      CFTypeRef v25 = 0;
      CFRelease(v6);
    }

    if (a3)
    {
      uint64_t v7 = (void *)v12[5];
      if (v7) {
        *a3 = v7;
      }
    }
    id v8 = (id)v18[5];
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  else if (a3)
  {
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
    id v8 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)fetchSelfPeers:(id *)a3
{
  if ([(OTSOSActualAdapter *)self sosEnabled])
  {
    BOOL v5 = [(OTSOSActualAdapter *)self currentSOSSelf:a3];
    if (v5) {
      CFTypeRef v6 = [[CKKSSelves alloc] initWithCurrent:v5 allSelves:0];
    }
    else {
      CFTypeRef v6 = 0;
    }
  }
  else if (a3)
  {
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
    CFTypeRef v6 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CFTypeRef v6 = 0;
  }

  return v6;
}

- (id)currentSOSSelf:(id *)a3
{
  if ([(OTSOSActualAdapter *)self sosEnabled])
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_10008DD90;
    uint64_t v49 = sub_10008DDA0;
    id v50 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x3032000000;
    id v42 = sub_10008DD90;
    v43 = sub_10008DDA0;
    id v44 = 0;
    uint64_t v33 = 0;
    id v34 = &v33;
    uint64_t v35 = 0x3032000000;
    uint64_t v36 = sub_10008DD90;
    CFTypeRef v37 = sub_10008DDA0;
    id v38 = 0;
    id obj = 0;
    uint64_t v32 = 0;
    unsigned int v5 = [(OTSOSActualAdapter *)self circleStatus:&obj];
    objc_storeStrong(&v38, obj);
    if (v5)
    {
      if (!v34[5])
      {
        uint64_t v6 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:24 description:@"Not in SOS circle, but no error returned"];
        uint64_t v7 = (void *)v34[5];
        v34[5] = v6;
      }
      id v8 = sub_10000B070("SecError");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (v5 + 1 > 4) {
          CFStringRef v9 = @"kSOSCCError";
        }
        else {
          CFStringRef v9 = off_1003079C8[v5 + 1];
        }
        uint64_t v24 = v34[5];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v24;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "octagon-sos: Not in circle : %@ %@", buf, 0x16u);
      }

      id v10 = 0;
      if (a3) {
        *a3 = (id) v34[5];
      }
      goto LABEL_37;
    }
    uint64_t v11 = (void *)sub_100225A7C((CFTypeRef *)&v32);
    if (!v11 || v32)
    {
      v20 = (void *)v34[5];
      v34[5] = v32;

      if (!v34[5])
      {
        uint64_t v21 = +[NSError errorWithDomain:@"CKKSErrorDomain" code:24 description:@"No SOS peer info available, but no error returned"];
        id v22 = (void *)v34[5];
        v34[5] = v21;
      }
      id v23 = sub_10000B070("SecError");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v32;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "octagon-sos: Error fetching self peer : %@", buf, 0xCu);
      }

      if (a3)
      {
        id v19 = (id) v34[5];
        goto LABEL_28;
      }
    }
    else
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10008FE8C;
      v30[3] = &unk_1002F8A00;
      v30[4] = &v33;
      v30[5] = &v45;
      v30[6] = &v39;
      CFTypeRef v12 = v30;
      CFTypeRef v51 = 0;
      *(void *)long long buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10022D368;
      uint64_t v53 = &unk_100309508;
      uint64_t v13 = v12;
      id v54 = v13;
      sub_10021CD84(&v51, buf);
      CFTypeRef v14 = v51;
      if (v51)
      {
        CFTypeRef v51 = 0;
        CFRelease(v14);
      }

      if (!v34[5])
      {
        CFTypeRef v25 = [CKKSSOSSelfPeer alloc];
        uint64_t v26 = v40[5];
        uint64_t v27 = v46[5];
        uint64_t v28 = +[OTSOSActualAdapter sosCKKSViewList];
        id v10 = [(CKKSSOSSelfPeer *)v25 initWithSOSPeerID:v11 encryptionKey:v26 signingKey:v27 viewList:v28];

        goto LABEL_36;
      }
      id v15 = +[CKKSLockStateTracker globalTracker];
      unsigned __int8 v16 = [v15 isLockedError:v34[5]];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = sub_10000B070("SecError");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = v34[5];
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "octagon-sos: Error fetching self encryption keys: %@", buf, 0xCu);
        }
      }
      if (a3)
      {
        id v19 = (id) v34[5];
LABEL_28:
        id v10 = 0;
        *a3 = v19;
LABEL_36:

LABEL_37:
        _Block_object_dispose(&v33, 8);

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v45, 8);

        goto LABEL_38;
      }
    }
    id v10 = 0;
    goto LABEL_36;
  }
  if (a3)
  {
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
    id v10 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
LABEL_38:

  return v10;
}

- (int)circleStatus:(id *)a3
{
  if ([(OTSOSActualAdapter *)self sosEnabled]) {
    return SOSCCThisDeviceIsInCircle();
  }
  if (a3)
  {
    *a3 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-4 description:@"SOS is not enabled for compatibility mode"];
  }
  return -1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<OTSOSActualAdapter e:%d>", [(OTSOSActualAdapter *)self essential]];
}

- (id)initAsEssential:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)OTSOSActualAdapter;
  id v4 = [(OTSOSActualAdapter *)&v17 init];
  unsigned int v5 = v4;
  if (v4)
  {
    v4->_essential = a3;
    providerID = v4->_providerID;
    v4->_providerID = (NSString *)@"[OTSOSActualAdapter]";

    uint64_t v7 = [[CKKSListenerCollection alloc] initWithName:@"ckks-sos"];
    peerChangeListeners = v5->_peerChangeListeners;
    v5->_peerChangeListeners = v7;

    CFStringRef v9 = v5;
    int out_token = 0;
    id v10 = (const char *)kSOSCCCircleOctagonKeysChangedNotification;
    uint64_t v11 = dispatch_get_global_queue(17, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100090184;
    v14[3] = &unk_100307B88;
    CFTypeRef v12 = v9;
    id v15 = v12;
    notify_register_dispatch(v10, &out_token, v11, v14);
  }
  return v5;
}

+ (id)sosCKKSViewList
{
  if (qword_10035CDA0 != -1) {
    dispatch_once(&qword_10035CDA0, &stru_1002F89D8);
  }
  id v2 = (void *)qword_10035CD98;

  return v2;
}

- (BOOL)sosEnabled
{
  if (dword_10035D448) {
    return dword_10035D448 == 2;
  }
  if (qword_10035D0A8 != -1) {
    dispatch_once(&qword_10035D0A8, &stru_100303AD8);
  }
  if (!byte_10035D0A0)
  {
    if (qword_10035D088 != -1) {
      dispatch_once(&qword_10035D088, &stru_100303A98);
    }
    if (byte_10035BC68) {
      int v11 = 2;
    }
    else {
      int v11 = 1;
    }
    dword_10035D448 = v11;
    if (!byte_10035BC68) {
      goto LABEL_43;
    }
    goto LABEL_36;
  }
  v1 = sub_10000B070("sos-compatibility");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "compatibility mode feature flag enabled, checking keychain for sos compatibility mode", buf, 2u);
  }

  dword_10035D448 = 1;
  v25[0] = kSecClass;
  v25[1] = kSecUseDataProtectionKeychain;
  v26[0] = kSecClassGenericPassword;
  v26[1] = &__kCFBooleanTrue;
  v25[2] = kSecAttrSynchronizable;
  v25[3] = kSecAttrAccessGroup;
  v26[2] = &__kCFBooleanFalse;
  v26[3] = @"com.apple.security.sos";
  v25[4] = kSecAttrAccount;
  v25[5] = kSecReturnData;
  v26[4] = @"sos-compatibility-mode";
  v26[5] = &__kCFBooleanTrue;
  v25[6] = kSecMatchLimit;
  v25[7] = kSecAttrAccessible;
  v26[6] = kSecMatchLimitOne;
  v26[7] = kSecAttrAccessibleAfterFirstUnlock;
  v25[8] = kSecAttrSysBound;
  v26[8] = &off_1003268D8;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:9];
  CFTypeRef result = 0;
  OSStatus v3 = SecItemCopyMatching(v2, &result);
  if (v3 == -25308)
  {
    CFTypeRef v12 = sub_10000B070("sos-compatibility");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "keychain is locked, will keep compatibility mode set to UNKNOWN", buf, 2u);
    }

    dword_10035D448 = 0;
    goto LABEL_43;
  }
  OSStatus v4 = v3;
  if (v3 == -25300)
  {
    uint64_t v13 = sub_10000B070("sos-compatibility");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_WORD *)long long buf = 0;
    CFTypeRef v14 = "could not find sos compatibility mode in the keychain, defaulting to OFF";
    goto LABEL_33;
  }
  if (v3)
  {
    uint64_t v13 = sub_10000B070("SecError");
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_35;
    }
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v24) = v4;
    CFTypeRef v14 = "sos-compatibility: failed to fetch sos compatibility mode from the keychain, error code: %d, defaulting to OFF";
    id v15 = v13;
    uint32_t v16 = 8;
    goto LABEL_34;
  }
  if (result)
  {
    CFTypeID v5 = CFGetTypeID(result);
    if (v5 == CFDataGetTypeID())
    {
      uint64_t v6 = (void *)result;
      id v7 = [objc_alloc((Class)NSString) initWithData:result encoding:134217984];
      id v8 = v7;
      int v9 = 1;
      if (v7)
      {
        unsigned int v10 = [v7 isEqualToString:@"enabled"];
        if (v10) {
          int v9 = 2;
        }
        else {
          int v9 = 1;
        }
      }
      else
      {
        unsigned int v10 = 0;
      }
      dword_10035D448 = v9;
      id v19 = sub_10000B070("sos-compatibility");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v20 = @"enabled";
        if (!v10) {
          CFStringRef v20 = @"disabled";
        }
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v24 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "SOS compatibility mode is %@", buf, 0xCu);
      }

      if ((v10 & 1) == 0) {
        goto LABEL_43;
      }
LABEL_36:
      uint64_t v18 = [(id)objc_opt_class() logger];
      [v18 logSuccessForEventNamed:@"SOSDeferralEventCompatibilityModeEnabled"];

      return 1;
    }
  }
  uint64_t v13 = sub_10000B070("SecError");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    CFTypeRef v14 = "sos-compatibility: unexpected return type, defaulting to OFF";
LABEL_33:
    id v15 = v13;
    uint32_t v16 = 2;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
  }
LABEL_35:

  int v17 = dword_10035D448;
  if (v17 == 2) {
    goto LABEL_36;
  }
LABEL_43:
  uint64_t v21 = [(id)objc_opt_class() logger];
  [v21 logSuccessForEventNamed:@"SOSDeferralEventCompatibilityModeDisabled"];

  return 0;
}

@end