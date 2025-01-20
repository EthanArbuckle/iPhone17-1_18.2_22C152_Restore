@interface CBDevice
- (CBDevice)initWithBTStackDevice:(void *)a3 error:(id *)a4;
- (unint64_t)updateWithBLEDevice:(id)a3 btAddr:(unint64_t)a4;
- (unint64_t)updateWithClassicDevice:(void *)a3 deviceUUID:(id)a4;
@end

@implementation CBDevice

- (CBDevice)initWithBTStackDevice:(void *)a3 error:(id *)a4
{
  v21.receiver = self;
  v21.super_class = (Class)CBDevice;
  v6 = [(CBDevice *)&v21 init];
  if (!v6)
  {
    if (a4)
    {
      v19 = [(id)objc_opt_class() description];
      CBErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  uint64_t v7 = *((unsigned __int8 *)a3 + 128);
  uint64_t v8 = *((unsigned __int8 *)a3 + 129);
  uint64_t v9 = *((unsigned __int8 *)a3 + 130);
  uint64_t v10 = *((unsigned __int8 *)a3 + 131);
  uint64_t v11 = *((unsigned __int8 *)a3 + 133);
  unint64_t v12 = (v7 << 40) | (v8 << 32) | (v9 << 24) | (v10 << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 132) << 8);
  unint64_t v13 = v12 | v11;
  if (!(v12 | v11))
  {
    if (a4)
    {
      CBErrorF();
      v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_13:
    v17 = 0;
    goto LABEL_8;
  }
  v20[0] = v7;
  v20[1] = v8;
  v20[2] = v9;
  v20[3] = v10;
  v20[4] = BYTE1(v12);
  v20[5] = v11;
  id v14 = [objc_alloc((Class)NSData) initWithBytes:v20 length:6];
  [(CBDevice *)v6 setBtAddressData:v14];

  v22[0] = 0;
  v22[1] = 0;
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100998080);
  }
  sub_100014B58((uint64_t)off_1009F7ED8, v13, 1u, 1u, 0, 0, (unsigned __int8 *)v22);
  v15 = sub_100031234((const unsigned __int8 *)v22);
  v16 = [v15 UUIDString];
  if (v16)
  {
    [(CBDevice *)v6 setIdentifier:v16];
    v17 = v6;
  }
  else if (a4)
  {
    CBErrorF();
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

LABEL_8:
  return v17;
}

- (unint64_t)updateWithBLEDevice:(id)a3 btAddr:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v171 = 0;
  v172 = &v171;
  uint64_t v173 = 0x2020000000;
  __int16 v174 = 0;
  uint64_t v167 = 0;
  v168 = &v167;
  uint64_t v169 = 0x2020000000;
  char v170 = 0;
  uint64_t v163 = 0;
  v164 = &v163;
  uint64_t v165 = 0x2020000000;
  char v166 = 0;
  uint64_t v159 = 0;
  v160 = &v159;
  uint64_t v161 = 0x2020000000;
  char v162 = 0;
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x2020000000;
  char v158 = 0;
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x2020000000;
  __int16 v154 = 0;
  uint64_t v147 = 0;
  v148 = &v147;
  uint64_t v149 = 0x2020000000;
  char v150 = 0;
  uint64_t v141 = 0;
  v142 = &v141;
  uint64_t v143 = 0x3032000000;
  v144 = sub_10004CEDC;
  v145 = sub_10004CD40;
  id v146 = 0;
  uint64_t v137 = 0;
  v138 = &v137;
  uint64_t v139 = 0x2020000000;
  char v140 = 0;
  uint64_t v133 = 0;
  v134 = &v133;
  uint64_t v135 = 0x2020000000;
  char v136 = 0;
  uint64_t v129 = 0;
  v130 = &v129;
  uint64_t v131 = 0x2020000000;
  char v132 = 0;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = sub_10004CEDC;
  v127 = sub_10004CD40;
  id v128 = 0;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  char v122 = 0;
  uint64_t v113 = 0;
  v114 = &v113;
  uint64_t v115 = 0x3032000000;
  v116 = sub_10004CEDC;
  v117 = sub_10004CD40;
  id v118 = 0;
  uint64_t v109 = 0;
  v110 = &v109;
  uint64_t v111 = 0x2020000000;
  char v112 = 0;
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x3032000000;
  v106 = sub_10004CEDC;
  v107 = sub_10004CD40;
  id v108 = 0;
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  int v102 = 0;
  uint64_t v95 = 0;
  v96 = &v95;
  uint64_t v97 = 0x2020000000;
  char v98 = 0;
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100998080);
  }
  uint64_t v7 = off_1009F7ED8;
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100077584;
  v75[3] = &unk_100998040;
  v77 = &v171;
  v78 = &v155;
  v79 = &v151;
  v80 = &v163;
  v81 = &v159;
  v82 = &v141;
  v83 = &v137;
  v84 = &v133;
  v85 = &v129;
  v86 = &v123;
  v87 = &v119;
  id v76 = v6;
  v88 = &v167;
  v89 = &v113;
  v90 = &v109;
  v91 = &v103;
  v92 = &v99;
  v93 = &v95;
  v94 = &v147;
  v72 = v76;
  sub_1006C4850((uint64_t)v7, v76, v75);
  if (*((_WORD *)v172 + 12)
    && (unsigned int v8 = [(CBDevice *)self appearanceValue], v8 != *((unsigned __int16 *)v172 + 12)))
  {
    -[CBDevice setAppearanceValue:](self, "setAppearanceValue:");
    unint64_t v9 = 0x80000000000;
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((unint64_t)[(id)v104[5] length] < 5)
  {
    uint64_t v13 = 0;
    unsigned __int16 v12 = 0;
    uint64_t v11 = 0;
    if (!a4) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v10 = (unsigned __int8 *)[ (id) v104[5] bytes];
    uint64_t v11 = *v10;
    unsigned __int16 v12 = *(_WORD *)(v10 + 1);
    uint64_t v13 = *(unsigned __int16 *)(v10 + 3);
    if (!a4) {
      goto LABEL_18;
    }
  }
  LOBYTE(v73) = BYTE5(a4);
  BYTE1(v73) = BYTE4(a4);
  BYTE2(v73) = BYTE3(a4);
  HIBYTE(v73) = BYTE2(a4);
  LOBYTE(v74) = BYTE1(a4);
  HIBYTE(v74) = a4;
  id v14 = [(CBDevice *)self btAddressData];
  if ([v14 length] != (id)6
    || ((v15 = [v14 bytes], v73 == *(_DWORD *)v15)
      ? (BOOL v16 = v74 == v15[2])
      : (BOOL v16 = 0),
        !v16))
  {
    id v17 = [objc_alloc((Class)NSData) initWithBytes:&v73 length:6];
    [(CBDevice *)self setBtAddressData:v17];

    unint64_t v9 = 0x80000000000;
  }

LABEL_18:
  unsigned int v18 = *((unsigned __int8 *)v168 + 24);
  if (!*((unsigned char *)v168 + 24)) {
    goto LABEL_30;
  }
  if (v18 > 0xD) {
    v19 = "?";
  }
  else {
    v19 = off_100998180[(char)(v18 - 1)];
  }
  v20 = +[NSString stringWithFormat:@"%s", v19];
  objc_super v21 = [(CBDevice *)self btVersion];
  id v22 = v20;
  id v23 = v21;
  if (v22 == v23)
  {
  }
  else
  {
    v24 = v23;
    if ((v22 == 0) != (v23 != 0))
    {
      unsigned __int8 v25 = [v22 isEqual:v23];

      if (v25) {
        goto LABEL_29;
      }
    }
    else
    {
    }
    [(CBDevice *)self setBtVersion:v22];
    unint64_t v9 = 0x80000000000;
  }
LABEL_29:

LABEL_30:
  unsigned int v26 = [(CBDevice *)self connectedServices];
  int v27 = *((unsigned __int8 *)v156 + 24);
  if (qword_1009F7F20 != -1) {
    dispatch_once(&qword_1009F7F20, &stru_1009980A0);
  }
  unsigned int v28 = sub_100582740(qword_1009F7F18, v72);
  if (v28 && *((unsigned char *)v130 + 24)) {
    unsigned int v29 = v26 & 0xFFBFFFFF | (v27 << 22) | 0x10000;
  }
  else {
    unsigned int v29 = v26 & 0xFFBEFFFF | (v27 << 22);
  }
  if (v29 != v26)
  {
    -[CBDevice setConnectedServices:](self, "setConnectedServices:");
    v9 |= 0x80000200000uLL;
  }
  if (*((_WORD *)v152 + 12))
  {
    int v30 = *((unsigned __int16 *)v152 + 12);
    if (v30 != [(CBDevice *)self interval])
    {
      [(CBDevice *)self setInterval:*((unsigned __int16 *)v152 + 12)];
      v9 |= 0x80000000000uLL;
    }
  }
  id v31 = [(CBDevice *)self deviceFlags];
  uint64_t v32 = *((unsigned __int8 *)v138 + 24);
  unint64_t v33 = v32 << 41;
  if (*((unsigned char *)v110 + 24)) {
    unint64_t v33 = ((unint64_t)*((unsigned __int8 *)v138 + 24) << 41) | 0x2000;
  }
  if (*((unsigned char *)v164 + 24)) {
    uint64_t v34 = v33 | 0x200000;
  }
  else {
    uint64_t v34 = v33;
  }
  if (*((unsigned char *)v160 + 24)) {
    v34 |= 0x8000uLL;
  }
  if (!*((unsigned char *)v110 + 24) || *((unsigned char *)v96 + 24) || ((unsigned __int16)v31 & 0x4000) != 0)
  {
    unint64_t v35 = v34 | 0x40000000000;
    if (!*((unsigned char *)v160 + 24)) {
      goto LABEL_54;
    }
LABEL_55:
    unint64_t v36 = v35 | 0x1000;
    goto LABEL_56;
  }
  unint64_t v35 = v34 & 0xFFFFFBFFFFFFFFFFLL;
  if (*((unsigned char *)v160 + 24)) {
    goto LABEL_55;
  }
LABEL_54:
  if (*((unsigned __int8 *)v120 + 24) | v32) {
    goto LABEL_55;
  }
  unint64_t v36 = v35 & 0xFFFFFFFFFFFFEFFFLL;
LABEL_56:
  if ((id)(v36 & 0xFFFFFFFFFFFCFFFFLL | ((unint64_t)*((unsigned __int8 *)v134 + 24) << 17) | ((unint64_t)(*((unsigned char *)v134 + 24) == 0) << 16)) != v31)
  {
    -[CBDevice setDeviceFlags:](self, "setDeviceFlags:");
    v9 |= 0x80000000000uLL;
  }
  if (*((unsigned char *)v148 + 24))
  {
    int v37 = *((unsigned __int8 *)v148 + 24);
    if (v37 != [(CBDevice *)self deviceType])
    {
      [(CBDevice *)self setDeviceType:*((unsigned __int8 *)v148 + 24)];
      v9 |= 0x80000000000uLL;
    }
  }
  v38 = (void *)v142[5];
  if (v38)
  {
    v39 = [(CBDevice *)self idsDeviceID];

    if (v38 != v39)
    {
      [(CBDevice *)self setIdsDeviceID:v142[5]];
      v9 |= 0x80000000000uLL;
    }
  }
  if ([(id)v124[5] length])
  {
    v40 = (void *)v124[5];
    v41 = [(CBDevice *)self firmwareVersion];
    id v42 = v40;
    id v43 = v41;
    if (v42 == v43)
    {

      goto LABEL_72;
    }
    v44 = v43;
    if ((v42 == 0) == (v43 != 0))
    {
    }
    else
    {
      unsigned __int8 v45 = [v42 isEqual:v43];

      if (v45) {
        goto LABEL_72;
      }
    }
    [(CBDevice *)self setFirmwareVersion:v124[5]];
    v9 |= 0x80000000000uLL;
  }
LABEL_72:
  if ([(id)v114[5] length])
  {
    v46 = (void *)v114[5];
    v47 = [(CBDevice *)self name];
    id v48 = v46;
    id v49 = v47;
    if (v48 == v49)
    {
    }
    else
    {
      v50 = v49;
      if ((v48 == 0) == (v49 != 0))
      {

        goto LABEL_81;
      }
      unsigned __int8 v51 = [v48 isEqual:v49];

      if ((v51 & 1) == 0)
      {
LABEL_81:
        [(CBDevice *)self setName:v114[5]];
        v9 |= 0x80000000000uLL;
        if (!v13) {
          goto LABEL_84;
        }
        goto LABEL_82;
      }
    }
  }
  if (!v13) {
    goto LABEL_84;
  }
LABEL_82:
  if (v13 != [(CBDevice *)self productID])
  {
    [(CBDevice *)self setProductID:v13];
    v9 |= 0x80000000000uLL;
  }
LABEL_84:
  int v52 = *((_DWORD *)v100 + 6);
  if (v52 && v52 != [(CBDevice *)self bleRSSI])
  {
    [(CBDevice *)self setBleRSSI:*((unsigned int *)v100 + 6)];
    v9 |= 0x200000000uLL;
  }
  unsigned int v53 = [(CBDevice *)self supportedServices];
  if (v28) {
    int v54 = 0x10000;
  }
  else {
    int v54 = 0;
  }
  if ((v53 & 0xFFFEFFFF | v54) != [(CBDevice *)self supportedServices]) {
    -[CBDevice setSupportedServices:](self, "setSupportedServices:");
  }
  if (v12 && [(CBDevice *)self vendorID] != v12)
  {
    [(CBDevice *)self setVendorID:v12];
    v9 |= 0x80000000000uLL;
  }
  if (!v11) {
    goto LABEL_101;
  }
  if (v11 != [(CBDevice *)self vendorIDSource])
  {
    [(CBDevice *)self setVendorIDSource:v11];
    v9 |= 0x80000000000uLL;
  }
  if (v11 == 1 && v12 == 76) {
    BOOL v55 = 1;
  }
  else {
LABEL_101:
  }
    BOOL v55 = v11 == 2 && v12 == 1452;
  id v57 = [(CBDevice *)self productID];
  if (!v57) {
    id v57 = [(CBDevice *)self proximityPairingProductID];
  }
  if (v57) {
    BOOL v58 = v55;
  }
  else {
    BOOL v58 = 0;
  }
  if (v58)
  {
    v59 = +[CBProductInfo productInfoWithProductID:v57];
    v60 = [v59 productName];

    if (v60)
    {
      id v61 = [(CBDevice *)self productName];
      id v62 = v60;
      v63 = v62;
      if (v61 == v62)
      {
      }
      else
      {
        if (v61)
        {
          unsigned __int8 v64 = [v61 isEqual:v62];

          if (v64) {
            goto LABEL_122;
          }
        }
        else
        {
        }
        [(CBDevice *)self setProductName:v63];
        v9 |= 0x80000000000uLL;
      }
    }
LABEL_122:
  }
  [(CBDevice *)self deviceType];
  v65 = CBDeviceTypeToNSLocalizedString();
  if (v55)
  {
    v66 = [(CBDevice *)self name];
    if (!v66
      || ([(CBDevice *)self name],
          v67 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v68 = [v67 isEqualToString:v65],
          v67,
          v66,
          (v68 & 1) != 0))
    {
      v69 = sub_100077D6C((uint64_t)v57);
      if (v69)
      {
        [(CBDevice *)self setName:v69];
        v9 |= 0x80000000000uLL;
      }
    }
  }
  v70 = [(CBDevice *)self name];

  if (!v70)
  {
    [(CBDevice *)self setName:v65];
    v9 |= 0x80000000000uLL;
  }

  _Block_object_dispose(&v95, 8);
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v113, 8);

  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(&v129, 8);
  _Block_object_dispose(&v133, 8);
  _Block_object_dispose(&v137, 8);
  _Block_object_dispose(&v141, 8);

  _Block_object_dispose(&v147, 8);
  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v155, 8);
  _Block_object_dispose(&v159, 8);
  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(&v167, 8);
  _Block_object_dispose(&v171, 8);

  return v9;
}

- (unint64_t)updateWithClassicDevice:(void *)a3 deviceUUID:(id)a4
{
  id v241 = a4;
  if (qword_1009F7EE0 != -1) {
    dispatch_once(&qword_1009F7EE0, &stru_100998080);
  }
  id v6 = off_1009F7ED8;
  if (qword_1009F8080 != -1) {
    dispatch_once(&qword_1009F8080, &stru_1009980C0);
  }
  uint64_t v7 = off_1009F8078;
  if (qword_1009F8090 != -1) {
    dispatch_once(&qword_1009F8090, &stru_1009980E0);
  }
  unsigned int v8 = off_1009F8088;
  unsigned int v237 = sub_1004D6124((uint64_t)off_1009F8088, (uint64_t)a3);
  uint64_t v233 = (uint64_t)v7;
  v258 = 0;
  uint64_t v259 = 0;
  uint64_t v260 = 0;
  sub_10047FF14((uint64_t)a3, (uint64_t)&v258);
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 4)
  {
    v240 = 0;
    uint64_t v10 = 0;
LABEL_19:
    v239 = 0;
    goto LABEL_20;
  }
  unint64_t v9 = v258 + 72;
  if (v258[95] < 0) {
    unint64_t v9 = (void *)*v9;
  }
  uint64_t v10 = +[NSString stringWithUTF8String:v9];
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 9)
  {
    v240 = 0;
    goto LABEL_19;
  }
  uint64_t v11 = v258 + 192;
  if (v258[215] < 0) {
    uint64_t v11 = (void *)*v11;
  }
  v240 = +[NSString stringWithUTF8String:v11];
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 0xA) {
    goto LABEL_19;
  }
  unsigned __int16 v12 = v258 + 216;
  if (v258[239] < 0) {
    unsigned __int16 v12 = (void *)*v12;
  }
  v239 = +[NSString stringWithUTF8String:v12];
LABEL_20:
  uint64_t v231 = (uint64_t)v6;
  if (![v10 length])
  {
    id v16 = 0;
    v15 = 0;
    char v229 = 0;
    goto LABEL_35;
  }
  uint64_t v13 = sub_1006C69A0((uint64_t)v6, v10);
  if (!v13)
  {
    id v16 = 0;
    v15 = 0;
    char v229 = 0;
LABEL_34:

    goto LABEL_35;
  }
  if (sub_1006C7070((uint64_t)v6, v13)) {
    char v14 = 1;
  }
  else {
    char v14 = 2;
  }
  v15 = sub_1006C6DAC((uint64_t)v6, v13);
  char v229 = v14;
  if (sub_1006C6FB8((uint64_t)v6, v13) != 2)
  {
    id v16 = 0;
    goto LABEL_34;
  }
  id v16 = [v13 UUIDString];

  if (!v16) {
    goto LABEL_35;
  }
  id v17 = [(CBDevice *)self findMyCaseIdentifier];
  id v16 = v16;
  id v18 = v17;
  if (v16 == v18)
  {

    uint64_t v13 = v16;
    goto LABEL_34;
  }
  v19 = v18;
  if (v18)
  {
    unsigned __int8 v20 = [v16 isEqual:v18];

    if ((v20 & 1) == 0) {
      goto LABEL_473;
    }
LABEL_35:
    unint64_t v21 = 0;
    goto LABEL_36;
  }

LABEL_473:
  [(CBDevice *)self setFindMyCaseIdentifier:v16];
  unint64_t v21 = 0x80000000000;
LABEL_36:
  v236 = [v15 UUIDString];
  if (!v236) {
    goto LABEL_44;
  }
  id v22 = [(CBDevice *)self findMyGroupIdentifier];
  id v23 = v236;
  id v24 = v22;
  if (v23 == v24)
  {

    goto LABEL_44;
  }
  unsigned __int8 v25 = v24;
  if (!v24)
  {

    goto LABEL_43;
  }
  unsigned __int8 v26 = [v23 isEqual:v24];

  if ((v26 & 1) == 0)
  {
LABEL_43:
    [(CBDevice *)self setFindMyGroupIdentifier:v23];
    unint64_t v21 = 0x80000000000;
  }
LABEL_44:
  uint64_t v256 = 0;
  uint64_t v257 = 0;
  BOOL v234 = sub_10047B7A8((uint64_t)a3, (_DWORD *)&v257 + 1, &v257, (_DWORD *)&v256 + 1, &v256);
  uint64_t v27 = sub_1004879E4((uint64_t)a3);
  if (v27 != [(CBDevice *)self adaptiveVolumeConfig])
  {
    [(CBDevice *)self setAdaptiveVolumeConfig:v27];
    unint64_t v21 = 0x80000000000;
  }
  int v28 = sub_100487DD4((uint64_t)a3, 144);
  uint64_t v29 = sub_10003FB34();
  uint64_t v30 = v28 & sub_100350CA0(v29, 0);
  if (v30 == 1 && [(CBDevice *)self adaptiveVolumeCapability] != 1)
  {
    [(CBDevice *)self setAdaptiveVolumeCapability:v30];
    unint64_t v21 = 0x80000000000;
  }
  if (qword_1009F80A0 != -1) {
    dispatch_once(&qword_1009F80A0, &stru_100998100);
  }
  unsigned int v31 = sub_10028C1C0((uint64_t)off_1009F8098, (uint64_t)a3);
  if (v31 > 2) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = dword_1007B8120[v31];
  }
  if (v32 != [(CBDevice *)self audioStreamState])
  {
    [(CBDevice *)self setAudioStreamState:v32];
    v21 |= 0x80000000000uLL;
  }
  int v33 = sub_100487DD4((uint64_t)a3, 176);
  uint64_t v34 = sub_10003FB34();
  uint64_t v35 = v33 & sub_100350CA0(v34, 3u);
  if (v35 == 1 && [(CBDevice *)self autoAncCapability] != 1)
  {
    [(CBDevice *)self setAutoAncCapability:v35];
    v21 |= 0x80000000000uLL;
  }
  long long v254 = 0u;
  long long v255 = 0u;
  BOOL v235 = sub_1004764A0((uint64_t)a3);
  if (v235 || (int v36 = *((unsigned __int8 *)a3 + 1296), *((unsigned char *)a3 + 1296)))
  {
    sub_10047E490((uint64_t)a3, (uint64_t)&v254);
    int v36 = v254;
    __int16 v37 = BYTE4(v254);
  }
  else
  {
    __int16 v37 = 0;
  }
  if (v36 >= 100) {
    int v38 = 100;
  }
  else {
    int v38 = v36;
  }
  if ([(CBDevice *)self batteryInfoMain] != (unsigned __int16)(v38 & ~(unsigned __int16)(v38 >> 31) | (v37 << 8)))
  {
    [(CBDevice *)self setBatteryInfoMain:(unsigned __int16)(v38 & ~(unsigned __int16)(v38 >> 31) | (v37 << 8))];
    v21 |= 0x80000000000uLL;
  }
  __int16 v39 = BYTE12(v254);
  if (SDWORD2(v254) >= 100) {
    int v40 = 100;
  }
  else {
    int v40 = DWORD2(v254);
  }
  if ([(CBDevice *)self batteryInfoLeft] != (unsigned __int16)(v40 & ~(unsigned __int16)(v40 >> 31) | (v39 << 8)))
  {
    [(CBDevice *)self setBatteryInfoLeft:(unsigned __int16)(v40 & ~(unsigned __int16)(v40 >> 31) | (v39 << 8))];
    v21 |= 0x80000000000uLL;
  }
  __int16 v41 = BYTE4(v255);
  if ((int)v255 >= 100) {
    int v42 = 100;
  }
  else {
    int v42 = v255;
  }
  if ([(CBDevice *)self batteryInfoRight] != (unsigned __int16)(v42 & ~(unsigned __int16)(v42 >> 31) | (v41 << 8)))
  {
    [(CBDevice *)self setBatteryInfoRight:(unsigned __int16)(v42 & ~(unsigned __int16)(v42 >> 31) | (v41 << 8))];
    v21 |= 0x80000000000uLL;
  }
  __int16 v43 = BYTE12(v255);
  if (SDWORD2(v255) >= 100) {
    int v44 = 100;
  }
  else {
    int v44 = DWORD2(v255);
  }
  if ([(CBDevice *)self batteryInfoCase] != (unsigned __int16)(v44 & ~(unsigned __int16)(v44 >> 31) | (v43 << 8)))
  {
    [(CBDevice *)self setBatteryInfoCase:(unsigned __int16)(v44 & ~(unsigned __int16)(v44 >> 31) | (v43 << 8))];
    v21 |= 0x80000000000uLL;
  }
  *(_DWORD *)v253 = *((_DWORD *)a3 + 32);
  *(_WORD *)&v253[4] = *((_WORD *)a3 + 66);
  if (((unint64_t)v253[0] << 40) | ((unint64_t)v253[1] << 32) | ((unint64_t)v253[2] << 24) | ((unint64_t)v253[3] << 16) | ((unint64_t)v253[4] << 8) | v253[5])
  {
    LOBYTE(v249) = v253[0];
    *(_DWORD *)((char *)&v249 + 1) = *(_DWORD *)&v253[1];
    BYTE5(v249) = v253[5];
    unsigned __int8 v45 = [(CBDevice *)self btAddressData];
    if ([v45 length] != (id)6
      || ((v46 = (unsigned __int16 *)[v45 bytes], v249 == *(_DWORD *)v46)
        ? (BOOL v47 = WORD2(v249) == v46[2])
        : (BOOL v47 = 0),
          !v47))
    {
      id v48 = [objc_alloc((Class)NSData) initWithBytes:&v249 length:6];
      [(CBDevice *)self setBtAddressData:v48];

      v21 |= 0x80000000000uLL;
    }
  }
  uint64_t v252 = 0;
  long long v250 = 0u;
  *(_OWORD *)v251 = 0u;
  long long v249 = 0u;
  sub_10004191C(v251, "");
  if (sub_100480790((uint64_t)a3, (uint64_t)&v249) && (void)v250)
  {
    unsigned __int16 v49 = v250 >> 4;
    if (v249 < 2u)
    {
      unint64_t v50 = v250 & 0xF;
    }
    else
    {
      unint64_t v50 = ((unint64_t)v250 >> 20) & 0xFFF0 | v250 & 0xF;
      v49 |= WORD2(v250) & 0xFFF0;
    }
    unsigned __int8 v51 = +[NSString stringWithFormat:@"%u.%u.%u", (unsigned __int16)(v250 >> 8), v49, v50];
    int v52 = [(CBDevice *)self caseVersion];

    if (v51 != v52)
    {
      [(CBDevice *)self setCaseVersion:v51];
      v21 |= 0x80000000000uLL;
    }
  }
  uint64_t v53 = sub_10047637C((uint64_t)a3);
  if (v53 != [(CBDevice *)self classicRSSI])
  {
    [(CBDevice *)self setClassicRSSI:v53];
    v21 |= 0x200000000uLL;
  }
  __int16 v54 = sub_100487714((uint64_t)a3);
  if ([(CBDevice *)self clickHoldModeLeft] != HIBYTE(v54))
  {
    [(CBDevice *)self setClickHoldModeLeft:HIBYTE(v54)];
    v21 |= 0x80000000000uLL;
  }
  if ([(CBDevice *)self clickHoldModeRight] != v54)
  {
    [(CBDevice *)self setClickHoldModeRight:v54];
    v21 |= 0x80000000000uLL;
  }
  unsigned int v55 = sub_10048799C((uint64_t)a3);
  unsigned int v56 = v55;
  unint64_t v57 = v55 & 0xF;
  v238 = v10;
  v232 = v15;
  v230 = v16;
  if (v57 == 1)
  {
    int v60 = v55 >> 4;
    unsigned int v61 = (v55 >> 8) & 0xF;
    uint64_t v58 = (unsigned __int16)v55 >> 12;
    uint64_t v59 = HIWORD(v55) & 0xF;
  }
  else if ((v55 & 0xF) != 0)
  {
    int v60 = 0;
    unsigned int v61 = 0;
    uint64_t v58 = 0;
    uint64_t v59 = 0;
  }
  else
  {
    uint64_t v58 = 0;
    uint64_t v59 = 0;
    int v60 = v55 >> 4;
    unsigned int v61 = (v55 >> 8) & 0xF;
  }
  if (sub_100487DD4((uint64_t)a3, 80))
  {
    if (v56) {
      uint64_t v62 = v61;
    }
    else {
      uint64_t v62 = 2;
    }
    [(CBDevice *)self setCallMgmtMsg:(v58 << 24) | (v59 << 32) | (v62 << 16) | (v60 << 8) | v57];
    if ([(CBDevice *)self callMgmtMsg] == 1)
    {
      [(CBDevice *)self setMuteControlCapability:1];
    }
    else if (![(CBDevice *)self callMgmtMsg])
    {
      [(CBDevice *)self setEndCallCapability:1];
    }
    if (v62 != [(CBDevice *)self endCallConfig]
      || v59 != [(CBDevice *)self muteControlConfig])
    {
      [(CBDevice *)self setEndCallConfig:v62];
      [(CBDevice *)self setMuteControlConfig:v59];
      v21 |= 0x80000000000uLL;
    }
  }
  unsigned __int16 v63 = sub_100489318((uint64_t)a3);
  if (![(CBDevice *)self colorInfo]
    && [(CBDevice *)self colorInfo] != v63)
  {
    [(CBDevice *)self setColorInfo:v63];
    v21 |= 0x80000000000uLL;
  }
  unsigned __int8 v64 = (char *)a3 + 392;
  if (*((char *)a3 + 415) < 0)
  {
    sub_10003B098(__p, *((void **)a3 + 49), *((void *)a3 + 50));
  }
  else
  {
    *(_OWORD *)__p = *v64;
    uint64_t v248 = *((void *)a3 + 51);
  }
  if (SHIBYTE(v248) < 0)
  {
    v65 = __p[1];
    operator delete(__p[0]);
    if (!v65) {
      goto LABEL_142;
    }
  }
  else if (!HIBYTE(v248))
  {
    goto LABEL_142;
  }
  if (*((char *)a3 + 415) < 0)
  {
    sub_10003B098(__p, *((void **)a3 + 49), *((void *)a3 + 50));
  }
  else
  {
    *(_OWORD *)__p = *v64;
    uint64_t v248 = *((void *)a3 + 51);
  }
  if (v248 >= 0) {
    v66 = __p;
  }
  else {
    v66 = (void **)__p[0];
  }
  v67 = +[NSString stringWithUTF8String:v66];
  if (SHIBYTE(v248) < 0) {
    operator delete(__p[0]);
  }
  unsigned __int8 v68 = [(CBDevice *)self model];

  if (v67 != v68)
  {
    [(CBDevice *)self setModel:v67];
    v21 |= 0x80000000000uLL;
  }

LABEL_142:
  uint64_t v69 = sub_1004D41B4((uint64_t)v8, (uint64_t)a3);
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100998060);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    LOBYTE(__p[0]) = 0;
    sub_10001B8E0(__p);
    uint64_t v70 = sub_100197A30((uint64_t)v253);
    if (v70 && !*(unsigned char *)(v70 + 54)) {
      LODWORD(v69) = v69 | 0x800000;
    }
    uint64_t v71 = sub_100197A88((uint64_t)v253);
    sub_10001B910(__p);
    if (v71) {
      uint64_t v69 = v69 | 0x1000000;
    }
    else {
      uint64_t v69 = v69;
    }
    sub_10001B8AC(__p);
  }
  if (v69 != [(CBDevice *)self connectedServices])
  {
    [(CBDevice *)self setConnectedServices:v69];
    v21 |= 0x80000200000uLL;
  }
  int v72 = sub_100487A74((uint64_t)a3);
  if (v72 != [(CBDevice *)self conversationDetectConfig])
  {
    [(CBDevice *)self setConversationDetectConfig:v72];
    v21 |= 0x80000000000uLL;
  }
  int v73 = sub_100487DD4((uint64_t)a3, 160);
  uint64_t v74 = sub_10003FB34();
  uint64_t v75 = v73 & sub_100350CA0(v74, 2u);
  if (v75 == 1
    && [(CBDevice *)self conversationDetectCapability] != 1)
  {
    [(CBDevice *)self setConversationDetectCapability:v75];
    v21 |= 0x80000000000uLL;
  }
  uint64_t v76 = sub_100487834((uint64_t)a3);
  if (v76 != [(CBDevice *)self crownRotationDirection])
  {
    [(CBDevice *)self setCrownRotationDirection:v76];
    v21 |= 0x80000000000uLL;
  }
  id v77 = [(CBDevice *)self deviceFlags];
  int v78 = sub_100478B2C((uint64_t)a3, 12);
  int v79 = sub_100478B2C((uint64_t)a3, 16);
  int v80 = *((unsigned __int8 *)a3 + 960);
  int v81 = *((unsigned __int8 *)a3 + 976);
  int v82 = sub_100497A84(v233, (uint64_t)a3);
  int v83 = sub_100478B2C((uint64_t)a3, 27);
  int v84 = sub_100478B2C((uint64_t)a3, 26);
  uint64_t v85 = v81 != 0;
  uint64_t v86 = (v237 >> 19) & 1;
  if (v78) {
    v86 |= 0x1000000uLL;
  }
  if (v79) {
    v86 |= 0x4000000uLL;
  }
  if (v80) {
    uint64_t v87 = v86 | 0x2000000;
  }
  else {
    uint64_t v87 = v86;
  }
  if (v82) {
    uint64_t v88 = 2;
  }
  else {
    uint64_t v88 = 0;
  }
  if (v83) {
    uint64_t v89 = 4;
  }
  else {
    uint64_t v89 = 0;
  }
  if (v84) {
    uint64_t v90 = 8;
  }
  else {
    uint64_t v90 = 0;
  }
  unint64_t v91 = v87 & 0xFFFFFFFFCF7FFFF1 | (v85 << 29) | v88 | v89 | v90;
  if (!sub_100487DD4((uint64_t)a3, 64)
    || (uint64_t v92 = sub_100035F54(), !(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v92 + 792))(v92, 1)))
  {
    int v246 = 0;
LABEL_186:
    unint64_t v96 = v91 & 0xFFFFFFFFBFFFFFFFLL;
    goto LABEL_187;
  }
  int v246 = 0;
  if (qword_1009F7F00 != -1) {
    dispatch_once(&qword_1009F7F00, &stru_100998120);
  }
  sub_1004AB094((uint64_t)off_1009F7EF8, (uint64_t)a3, &v246);
  uint64_t v93 = v246 == 1;
  if (qword_1009F80B0 != -1) {
    dispatch_once(&qword_1009F80B0, &stru_100998140);
  }
  int v94 = sub_100573244((uint64_t)off_1009F80A8, (uint64_t)a3);
  unint64_t v95 = v91 | (v93 << 28);
  if (!v94)
  {
    unint64_t v91 = v95 | 0x800000;
    goto LABEL_186;
  }
  unint64_t v96 = v95 | 0x40800000;
LABEL_187:
  if (sub_100478B2C((uint64_t)a3, 32) && sub_1004874AC((uint64_t)a3) == 1) {
    unint64_t v97 = v96 | 0x10;
  }
  else {
    unint64_t v97 = v96 & 0xFFFFFFFFFFFFFFEFLL;
  }
  int v98 = sub_100478B2C((uint64_t)a3, 17);
  int v99 = sub_100478B2C((uint64_t)a3, 33);
  int v100 = sub_100487CFC((uint64_t)a3);
  if (qword_1009F7ED0 != -1) {
    dispatch_once(&qword_1009F7ED0, &stru_100998160);
  }
  BOOL v101 = sub_100008DC4(qword_1009F7EC8, v241);
  int v102 = sub_100040630((unsigned __int8 *)a3);
  sub_1006BE7F4(v231, v241, (uint64_t)__p);
  uint64_t v103 = 0x8000000;
  if (!v98) {
    uint64_t v103 = 0;
  }
  uint64_t v104 = 32;
  if (!v99) {
    uint64_t v104 = 0;
  }
  uint64_t v105 = v103 | v104;
  uint64_t v106 = 64;
  if (!v100) {
    uint64_t v106 = 0;
  }
  uint64_t v107 = v105 | v106;
  uint64_t v108 = 0x2000;
  if (!v101) {
    uint64_t v108 = 0;
  }
  unint64_t v109 = v107 | v108 | v97 & 0xFFFFFFFFF7EB1F9FLL;
  if (v102) {
    uint64_t v110 = 0x4000;
  }
  else {
    uint64_t v110 = 0;
  }
  if (SHIBYTE(v248) < 0)
  {
    BOOL v111 = __p[1] == 0;
    operator delete(__p[0]);
  }
  else
  {
    BOOL v111 = SHIBYTE(v248) == 0;
  }
  uint64_t v112 = 0x8000;
  if (v111) {
    uint64_t v112 = 0;
  }
  unint64_t v113 = v109 | v110 | v112 | ((unint64_t)*((unsigned __int8 *)a3 + 1435) << 18) | ((unint64_t)*((unsigned __int8 *)a3 + 1296) << 20);
  if (v235)
  {
    int v114 = sub_10048DBC8((uint64_t)a3);
    uint64_t v115 = 0x200000;
    if (!v114) {
      uint64_t v115 = 0;
    }
    unint64_t v116 = v115 | v113 & 0xFFFFFFFFFFDFFFFFLL;
    if (*((unsigned char *)a3 + 1436))
    {
      unint64_t v117 = v116 | 0x400000;
      goto LABEL_216;
    }
  }
  else
  {
    unint64_t v116 = v113 & 0xFFFFFFFFFFDFFFFFLL;
  }
  unint64_t v117 = v116 & 0xFFFFFFFFFFBFFFFFLL;
LABEL_216:
  uint64_t v118 = sub_10048787C((uint64_t)a3) == 1;
  int v119 = sub_10048C5E0((uint64_t)a3);
  BOOL v120 = sub_100480504((uint64_t)a3);
  int v121 = sub_100484FCC((uint64_t)a3);
  unint64_t v122 = v117 & 0xFFFFFBFF7FFFFFFFLL | (v118 << 31) | 0x40000001000;
  if (v111 | v102) {
    unint64_t v122 = v117 & 0xFFFFFAFF7FF4EFFFLL | (v118 << 31) & 0xFFFFFAFFFFF4EFFFLL | 0x40000000000;
  }
  uint64_t v123 = 0x20000;
  if (!v119) {
    uint64_t v123 = 0;
  }
  uint64_t v124 = 0x10000;
  if (v119) {
    uint64_t v124 = 0;
  }
  uint64_t v125 = 0x80000;
  if (!v120) {
    uint64_t v125 = 0;
  }
  uint64_t v126 = 0x10000000000;
  if (!v121) {
    uint64_t v126 = 0;
  }
  unint64_t v127 = v123 | v124 | v125 | v126 | v122 & 0xFFFFFEFFFFF4FFFFLL;
  if (v229) {
    unint64_t v128 = v127 & 0xFFFFFF7FFFFFFFFFLL | ((unint64_t)(v229 == 1) << 39);
  }
  else {
    unint64_t v128 = v127;
  }
  if ((id)v128 != v77)
  {
    -[CBDevice setDeviceFlags:](self, "setDeviceFlags:");
    v21 |= 0x80000000000uLL;
  }
  if (qword_1009F8070 != -1) {
    dispatch_once(&qword_1009F8070, &stru_100998060);
  }
  if (*((unsigned char *)off_1009F8068 + 60))
  {
    LOBYTE(v242) = 0;
    LOWORD(__p[0]) = 0;
    LOWORD(v243) = 0;
    sub_10047D450((uint64_t)a3, __p, &v242, &v243);
    if ((_BYTE)v242)
    {
      if (v242 > 0xDu) {
        uint64_t v129 = "?";
      }
      else {
        uint64_t v129 = off_100998180[(char)(v242 - 1)];
      }
      v130 = +[NSString stringWithFormat:@"%s", v129];
      uint64_t v131 = [(CBDevice *)self btVersion];
      id v132 = v130;
      id v133 = v131;
      if (v132 == v133)
      {
      }
      else
      {
        v134 = v133;
        if ((v132 == 0) != (v133 != 0))
        {
          unsigned __int8 v135 = [v132 isEqual:v133];

          if (v135) {
            goto LABEL_246;
          }
        }
        else
        {
        }
        [(CBDevice *)self setBtVersion:v132];
        v21 |= 0x80000000000uLL;
      }
LABEL_246:
    }
  }
  unsigned __int8 v136 = sub_100476054((uint64_t)a3);
  if ([(CBDevice *)self deviceType] != v136)
  {
    [(CBDevice *)self setDeviceType:v136];
    v21 |= 0x80000000000uLL;
  }
  __int16 v137 = sub_10047C698((uint64_t)a3);
  if (HIBYTE(v137) < 5u) {
    unsigned __int8 v138 = HIBYTE(v137) + 1;
  }
  else {
    unsigned __int8 v138 = 0;
  }
  if (v138 != [(CBDevice *)self doubleTapActionLeft])
  {
    [(CBDevice *)self setDoubleTapActionLeft:(char)v138];
    v21 |= 0x80000000000uLL;
  }
  if (v137 < 5u) {
    unsigned __int8 v139 = v137 + 1;
  }
  else {
    unsigned __int8 v139 = 0;
  }
  if (v139 != [(CBDevice *)self doubleTapActionRight])
  {
    [(CBDevice *)self setDoubleTapActionRight:(char)v139];
    v21 |= 0x80000000000uLL;
  }
  unsigned int v140 = [(CBDevice *)self doubleTapCapability];
  if (sub_100475E4C((uint64_t)a3, 0x80000u) == 4)
  {
    int v141 = sub_100478B2C((uint64_t)a3, 14) ? 2 : 1;
    if (v141 != v140)
    {
      [(CBDevice *)self setDoubleTapCapability:(char)v141];
      v21 |= 0x80000000000uLL;
    }
  }
  uint64_t v142 = sub_10047ECFC((uint64_t)a3);
  if (v142 != [(CBDevice *)self gapaFlags])
  {
    [(CBDevice *)self setGapaFlags:v142];
    v21 |= 0x80000000000uLL;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) < 0xB)
  {
    if (!v234) {
      goto LABEL_283;
    }
    uint64_t v227 = v256 >> 4;
    uint64_t v228 = v256 & 0xF;
    uint64_t v226 = BYTE1(v256);
    NSPrintF_safe();
    id v146 = (id)objc_claimAutoreleasedReturnValue();
    id v150 = [(CBDevice *)self firmwareVersion];

    if (v146 != v150)
    {
LABEL_281:
      [(CBDevice *)self setFirmwareVersion:v146];
      v21 |= 0x80000000000uLL;
    }
  }
  else
  {
    uint64_t v143 = v258 + 240;
    if (v258[263] < 0) {
      uint64_t v143 = (void *)*v143;
    }
    v144 = +[NSString stringWithUTF8String:v143];
    if ([v144 length])
    {
      v145 = [(CBDevice *)self firmwareVersion];
      id v146 = v144;
      id v147 = v145;
      if (v146 != v147)
      {
        v148 = v147;
        if ((v146 == 0) == (v147 != 0))
        {
        }
        else
        {
          unsigned __int8 v149 = [v146 isEqual:v147];

          if (v149) {
            goto LABEL_282;
          }
        }
        goto LABEL_281;
      }
    }
    else
    {
      id v146 = v144;
    }
  }
LABEL_282:

LABEL_283:
  if (*((unsigned char *)a3 + 1373)) {
    unsigned __int8 v151 = 2;
  }
  else {
    unsigned __int8 v151 = 1;
  }
  if ([(CBDevice *)self frequencyBand] != v151)
  {
    [(CBDevice *)self setFrequencyBand:v151];
    v21 |= 0x80000000000uLL;
  }
  if (sub_100487EFC((uint64_t)a3, 0xC0u) == 2) {
    char v152 = 1;
  }
  else {
    char v152 = 2;
  }
  if (v152 != [(CBDevice *)self hearingAidSupport])
  {
    [(CBDevice *)self setHearingAidSupport:v152];
    v21 |= 0x80000000000uLL;
  }
  if (sub_100487EFC((uint64_t)a3, 0xD0u) == 2) {
    char v153 = 1;
  }
  else {
    char v153 = 2;
  }
  if (v153 != [(CBDevice *)self hearingTestSupport])
  {
    [(CBDevice *)self setHearingTestSupport:v153];
    v21 |= 0x80000000000uLL;
  }
  uint64_t v154 = sub_100487564((uint64_t)a3);
  if (v154 != [(CBDevice *)self listeningMode])
  {
    [(CBDevice *)self setListeningMode:v154];
    v21 |= 0x80000000000uLL;
  }
  uint64_t v155 = sub_1004875AC((uint64_t)a3);
  if (v155 != [(CBDevice *)self listeningModeConfigs])
  {
    [(CBDevice *)self setListeningModeConfigs:v155];
    v21 |= 0x80000000000uLL;
  }
  unsigned int v156 = sub_10048741C((uint64_t)a3);
  if (v156 >= 3) {
    unsigned __int8 v157 = 0;
  }
  else {
    unsigned __int8 v157 = 0x20301u >> (8 * v156);
  }
  if (v157 != [(CBDevice *)self microphoneMode])
  {
    [(CBDevice *)self setMicrophoneMode:(char)v157];
    v21 |= 0x80000000000uLL;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v259 - (uint64_t)v258) >> 3) >= 2)
  {
    char v158 = v258 + 24;
    if (v258[47] < 0) {
      char v158 = (void *)*v158;
    }
    uint64_t v159 = +[NSString stringWithUTF8String:v158];
    if (![v159 length]) {
      goto LABEL_318;
    }
    v160 = [(CBDevice *)self modelUser];
    id v161 = v159;
    id v162 = v160;
    if (v161 == v162)
    {
    }
    else
    {
      uint64_t v163 = v162;
      if ((v161 == 0) == (v162 != 0))
      {
      }
      else
      {
        unsigned __int8 v164 = [v161 isEqual:v162];

        if (v164) {
          goto LABEL_318;
        }
      }
      [(CBDevice *)self setModelUser:v161];
      v21 |= 0x80000000000uLL;
    }
LABEL_318:
  }
  sub_100475EE0((uint64_t)a3, (uint64_t)__p);
  if (v248 >= 0) {
    uint64_t v165 = __p;
  }
  else {
    uint64_t v165 = (void **)__p[0];
  }
  char v166 = +[NSString stringWithUTF8String:v165];
  if (SHIBYTE(v248) < 0) {
    operator delete(__p[0]);
  }
  if ([v166 length])
  {
    uint64_t v167 = [(CBDevice *)self name];
    id v168 = v166;
    id v169 = v167;
    if (v168 == v169)
    {

      goto LABEL_332;
    }
    char v170 = v169;
    if ((v168 == 0) == (v169 != 0))
    {
    }
    else
    {
      unsigned __int8 v171 = [v168 isEqual:v169];

      if (v171) {
        goto LABEL_332;
      }
    }
    [(CBDevice *)self setName:v168];
    v21 |= 0x80000000000uLL;
  }
LABEL_332:
  if ([v166 length])
  {
    if (qword_1009F7EE0 != -1) {
      dispatch_once(&qword_1009F7EE0, &stru_100998080);
    }
    v172 = off_1009F7ED8;
    sub_100475EE0((uint64_t)a3, (uint64_t)v244);
    sub_1006C0EC4((uint64_t)v172, v241, (unsigned __int8 *)v244);
    if (v245 < 0) {
      operator delete(v244[0]);
    }
  }
  unsigned int v173 = [(CBDevice *)self primaryPlacement];
  unsigned int v174 = [(CBDevice *)self secondaryPlacement];
  unsigned int v175 = [(CBDevice *)self primaryBudSide];
  if (sub_100475E4C((uint64_t)a3, 0x80000u) == 4)
  {
    int v176 = sub_100487464((uint64_t)a3);
    LODWORD(__p[0]) = 3;
    int v242 = 3;
    int v243 = 3;
    if (v235)
    {
      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100998100);
      }
      sub_10028FEDC((uint64_t)off_1009F8098, (uint64_t)a3, (int *)__p, &v243);
      if (qword_1009F80A0 != -1) {
        dispatch_once(&qword_1009F80A0, &stru_100998100);
      }
      sub_100290170((uint64_t)off_1009F8098, (uint64_t)a3, &v242);
    }
    if (v176)
    {
      if (LODWORD(__p[0]) > 0xC) {
        int v177 = 0;
      }
      else {
        int v177 = dword_1007B812C[SLODWORD(__p[0])];
      }
      uint64_t v178 = 1;
      switch(v243)
      {
        case 0:
          break;
        case 1:
          uint64_t v178 = 2;
          break;
        case 2:
          uint64_t v178 = 3;
          break;
        case 10:
          uint64_t v178 = 4;
          break;
        case 11:
          uint64_t v178 = 5;
          break;
        case 12:
          uint64_t v178 = 6;
          break;
        default:
          uint64_t v178 = 0;
          break;
      }
    }
    else
    {
      int v177 = 7;
      uint64_t v178 = 7;
    }
    if (v242 == 2) {
      char v180 = 2;
    }
    else {
      char v180 = 3;
    }
    if (v242 == 1) {
      unsigned __int8 v179 = 1;
    }
    else {
      unsigned __int8 v179 = v180;
    }
  }
  else
  {
    int v177 = 0;
    uint64_t v178 = 0;
    unsigned __int8 v179 = 3;
  }
  if (v177 != v173)
  {
    -[CBDevice setPrimaryPlacement:](self, "setPrimaryPlacement:");
    v21 |= 0x80000000000uLL;
  }
  if (v178 != v174)
  {
    [(CBDevice *)self setSecondaryPlacement:v178];
    v21 |= 0x80000000000uLL;
  }
  if (v175 != v179)
  {
    [(CBDevice *)self setPrimaryBudSide:v179];
    v21 |= 0x80000000000uLL;
  }
  if (sub_100487464((uint64_t)a3)) {
    char v181 = 1;
  }
  else {
    char v181 = 2;
  }
  if (v181 != [(CBDevice *)self placementMode])
  {
    [(CBDevice *)self setPlacementMode:v181];
    v21 |= 0x80000000000uLL;
  }
  int v182 = sub_100487ABC((uint64_t)a3);
  if (v182 != [(CBDevice *)self selectiveSpeechListeningConfig])
  {
    [(CBDevice *)self setSelectiveSpeechListeningConfig:v182];
    v21 |= 0x80000000000uLL;
  }
  int v183 = sub_100487EFC((uint64_t)a3, 6u);
  uint64_t v184 = sub_10003FB34();
  unsigned int v185 = sub_100350CA0(v184, 4u);
  if (v183 == 3) {
    uint64_t v186 = v185;
  }
  else {
    uint64_t v186 = 0;
  }
  if (v186
    && [(CBDevice *)self selectiveSpeechListeningCapability] != 1)
  {
    [(CBDevice *)self setSelectiveSpeechListeningCapability:v186];
    v21 |= 0x80000000000uLL;
  }
  if ([v238 length])
  {
    v187 = [(CBDevice *)self serialNumber];
    id v188 = v238;
    id v189 = v187;
    if (v188 == v189)
    {

      goto LABEL_382;
    }
    v190 = v189;
    if ((v188 == 0) == (v189 != 0))
    {
    }
    else
    {
      unsigned __int8 v191 = [v188 isEqual:v189];

      if (v191) {
        goto LABEL_382;
      }
    }
    [(CBDevice *)self setSerialNumber:v188];
    v21 |= 0x80000000000uLL;
  }
LABEL_382:
  if (![v240 length]) {
    goto LABEL_390;
  }
  v192 = [(CBDevice *)self serialNumberLeft];
  id v193 = v240;
  id v194 = v192;
  if (v193 == v194)
  {

    goto LABEL_390;
  }
  v195 = v194;
  if ((v193 == 0) == (v194 != 0))
  {

    goto LABEL_389;
  }
  unsigned __int8 v196 = [v193 isEqual:v194];

  if ((v196 & 1) == 0)
  {
LABEL_389:
    [(CBDevice *)self setSerialNumberLeft:v193];
    v21 |= 0x80000000000uLL;
  }
LABEL_390:
  if (![v239 length]) {
    goto LABEL_398;
  }
  v197 = [(CBDevice *)self serialNumberRight];
  id v198 = v239;
  id v199 = v197;
  if (v198 == v199)
  {

    goto LABEL_398;
  }
  v200 = v199;
  if ((v198 == 0) == (v199 != 0))
  {

    goto LABEL_397;
  }
  unsigned __int8 v201 = [v198 isEqual:v199];

  if ((v201 & 1) == 0)
  {
LABEL_397:
    [(CBDevice *)self setSerialNumberRight:v198];
    v21 |= 0x80000000000uLL;
  }
LABEL_398:
  int v202 = sub_1004874AC((uint64_t)a3);
  if (v202 == 1) {
    uint64_t v203 = 1;
  }
  else {
    uint64_t v203 = 2 * (v202 == 2);
  }
  if (v203 != [(CBDevice *)self smartRoutingMode])
  {
    [(CBDevice *)self setSmartRoutingMode:v203];
    v21 |= 0x80000000000uLL;
  }
  uint64_t v204 = sub_100487D44((uint64_t)a3);
  if (v204 && v204 != [(CBDevice *)self interval])
  {
    [(CBDevice *)self setInterval:v204];
    v21 |= 0x80000000000uLL;
  }
  LODWORD(__p[0]) = 0;
  LOBYTE(v243) = 0;
  if (qword_1009F7F00 != -1) {
    dispatch_once(&qword_1009F7F00, &stru_100998120);
  }
  sub_1004AB624((uint64_t)off_1009F7EF8, (uint64_t)a3, @"global", (int *)__p, &v243);
  int v205 = (int)__p[0];
  if (v205 != [(CBDevice *)self spatialAudioMode])
  {
    [(CBDevice *)self setSpatialAudioMode:LODWORD(__p[0])];
    v21 |= 0x80000000000uLL;
  }
  if (v237 != [(CBDevice *)self supportedServices])
  {
    -[CBDevice setSupportedServices:](self, "setSupportedServices:");
    v21 |= 0x80000200000uLL;
  }
  if ([(CBDevice *)self productID]) {
    BOOL v206 = 0;
  }
  else {
    BOOL v206 = v234;
  }
  if (v206 && HIDWORD(v256))
  {
    -[CBDevice setProductID:](self, "setProductID:");
    v21 |= 0x80000000000uLL;
  }
  if ([(CBDevice *)self vendorID]) {
    BOOL v207 = 0;
  }
  else {
    BOOL v207 = v234;
  }
  if (v207 && v257)
  {
    [(CBDevice *)self setVendorID:(unsigned __int16)v257];
    v21 |= 0x80000000000uLL;
  }
  if ([(CBDevice *)self vendorIDSource]) {
    BOOL v208 = 0;
  }
  else {
    BOOL v208 = v234;
  }
  if (v208 && HIDWORD(v257))
  {
    [(CBDevice *)self setVendorIDSource:BYTE4(v257)];
    v21 |= 0x80000000000uLL;
  }
  if ([(CBDevice *)self vendorIDSource] == 1
    && [(CBDevice *)self vendorID] == 76)
  {
    BOOL v209 = 1;
  }
  else
  {
    BOOL v209 = [(CBDevice *)self vendorIDSource] == 2
        && [(CBDevice *)self vendorID] == 1452;
  }
  id v210 = [(CBDevice *)self productID];
  if (!v210) {
    id v210 = [(CBDevice *)self proximityPairingProductID];
  }
  if (v210) {
    BOOL v211 = v209;
  }
  else {
    BOOL v211 = 0;
  }
  if (v211)
  {
    v212 = +[CBProductInfo productInfoWithProductID:v210];
    v213 = [v212 productName];

    if (v213)
    {
      id v214 = [(CBDevice *)self productName];
      id v215 = v213;
      v216 = v215;
      if (v214 == v215)
      {
      }
      else
      {
        if (v214)
        {
          unsigned __int8 v217 = [v214 isEqual:v215];

          if (v217) {
            goto LABEL_453;
          }
        }
        else
        {
        }
        [(CBDevice *)self setProductName:v216];
        v21 |= 0x80000000000uLL;
      }
    }
LABEL_453:
  }
  [(CBDevice *)self deviceType];
  v218 = CBDeviceTypeToNSLocalizedString();
  if (v209)
  {
    v219 = v232;
    v220 = [(CBDevice *)self name];
    if (!v220
      || ([(CBDevice *)self name],
          v221 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v222 = [v221 isEqualToString:v218],
          v221,
          v220,
          (v222 & 1) != 0))
    {
      v223 = sub_100077D6C((uint64_t)v210);
      if (v223)
      {
        [(CBDevice *)self setName:v223];
        v21 |= 0x80000000000uLL;
      }
    }
  }
  else
  {
    v219 = v232;
  }
  v224 = [(CBDevice *)self name];

  if (!v224)
  {
    [(CBDevice *)self setName:v218];
    v21 |= 0x80000000000uLL;
  }

  if (SHIBYTE(v252) < 0) {
    operator delete(v251[0]);
  }

  *(void *)&long long v249 = &v258;
  sub_100051568((void ***)&v249);

  return v21;
}

@end