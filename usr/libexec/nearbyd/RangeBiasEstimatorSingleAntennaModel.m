@interface RangeBiasEstimatorSingleAntennaModel
- (BOOL)checkCirsValid:(id)a3;
- (BOOL)configureWithResourceFileHandler:(id)a3;
- (BOOL)predictBiasEstimate:(unsigned __int8)a3 scaledInputFeatures:(id)a4 output:(id *)a5;
- (NSNumber)biasCorrectionEstimate;
- (RangeBiasEstimatorSingleAntennaModel)init;
- (id).cxx_construct;
- (id)consumeInputFeatures:(id)a3;
- (id)createAndPopulateBiasEstimatorInput:(const void *)a3 ofDimension:(id)a4;
- (id)getResourcePathWithBundleName:()basic_string<char bundleDir:()std:(std::allocator<char>> *)data :char_traits<char> resourceName:resourceExtension:;
- (id)loadResourcesWithResourceIndex:(int)a3;
- (id)predictOutput:(id)a3;
- (id)preprocessInputFeatures:(id)a3;
- (id)scaleCirValuesIfRequired:(id)a3;
- (pair<std::vector<double>,)getNormalizedCirAndPeakMagnitude:(RangeBiasEstimatorSingleAntennaModel *)self;
- (vector<double,)getNormalizedFftCir:(RangeBiasEstimatorSingleAntennaModel *)self;
- (void)addBundleNameToModelResourcePackage:()basic_string<char andBundleDirectory:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)setBiasCorrectionEstimate:(id)a3;
@end

@implementation RangeBiasEstimatorSingleAntennaModel

- (RangeBiasEstimatorSingleAntennaModel)init
{
  v63.receiver = self;
  v63.super_class = (Class)RangeBiasEstimatorSingleAntennaModel;
  v2 = [(RangeBiasEstimatorSingleAntennaModel *)&v63 init];

  if (v2)
  {
    if (byte_1008AAA07 < 0)
    {
      sub_100002DE4(__dst, (void *)xmmword_1008AA9F0, *((unint64_t *)&xmmword_1008AA9F0 + 1));
    }
    else
    {
      *(_OWORD *)__dst = xmmword_1008AA9F0;
      uint64_t v53 = unk_1008AAA00;
    }
    if (byte_1008AAA1F < 0)
    {
      sub_100002DE4(&v54, (void *)xmmword_1008AAA08, *((unint64_t *)&xmmword_1008AAA08 + 1));
    }
    else
    {
      long long v54 = xmmword_1008AAA08;
      uint64_t v55 = unk_1008AAA18;
    }
    int v56 = 0;
    LOBYTE(v57) = 0;
    char v59 = 0;
    LOBYTE(v60) = 0;
    char v62 = 0;
    if (byte_1008AAA37 < 0)
    {
      sub_100002DE4(v41, (void *)xmmword_1008AAA20, *((unint64_t *)&xmmword_1008AAA20 + 1));
    }
    else
    {
      *(_OWORD *)v41 = xmmword_1008AAA20;
      uint64_t v42 = unk_1008AAA30;
    }
    if (byte_1008AAA4F < 0)
    {
      sub_100002DE4(&v43, (void *)xmmword_1008AAA38, *((unint64_t *)&xmmword_1008AAA38 + 1));
    }
    else
    {
      long long v43 = xmmword_1008AAA38;
      uint64_t v44 = unk_1008AAA48;
    }
    int v45 = 0;
    LOBYTE(v46) = 0;
    char v48 = 0;
    LOBYTE(v49) = 0;
    char v51 = 0;
    if (byte_1008AAA67 < 0)
    {
      sub_100002DE4(v30, (void *)xmmword_1008AAA50, *((unint64_t *)&xmmword_1008AAA50 + 1));
    }
    else
    {
      *(_OWORD *)v30 = xmmword_1008AAA50;
      uint64_t v31 = unk_1008AAA60;
    }
    if (byte_1008AAA7F < 0)
    {
      sub_100002DE4(&v32, (void *)xmmword_1008AAA68, *((unint64_t *)&xmmword_1008AAA68 + 1));
    }
    else
    {
      long long v32 = xmmword_1008AAA68;
      uint64_t v33 = unk_1008AAA78;
    }
    int v34 = 1;
    LOBYTE(v35) = 0;
    char v37 = 0;
    LOBYTE(v38) = 0;
    char v40 = 0;
    if (byte_1008AAA97 < 0)
    {
      sub_100002DE4(v19, (void *)xmmword_1008AAA80, *((unint64_t *)&xmmword_1008AAA80 + 1));
    }
    else
    {
      *(_OWORD *)v19 = xmmword_1008AAA80;
      uint64_t v20 = unk_1008AAA90;
    }
    if (byte_1008AAAAF < 0)
    {
      sub_100002DE4(&v21, (void *)xmmword_1008AAA98, *((unint64_t *)&xmmword_1008AAA98 + 1));
    }
    else
    {
      long long v21 = xmmword_1008AAA98;
      uint64_t v22 = unk_1008AAAA8;
    }
    int v23 = 1;
    LOBYTE(v24) = 0;
    char v26 = 0;
    LOBYTE(__p) = 0;
    char v29 = 0;
    sub_100374128((char *)v68, (long long *)__dst);
    sub_100374128(v69, (long long *)v41);
    long long v15 = 0uLL;
    v16 = 0;
    *(void *)&v66[0] = &v15;
    BYTE8(v66[0]) = 0;
    *(void *)&long long v15 = operator new(0xF0uLL);
    *((void *)&v15 + 1) = v15;
    v16 = (NIMLModelResource *)(v15 + 240);
    *((void *)&v15 + 1) = sub_100374454((uint64_t)&v16, v68, &v70, (char *)v15);
    sub_100374128((char *)v66, (long long *)v30);
    sub_100374128(v67, (long long *)v19);
    long long v17 = 0uLL;
    v18 = 0;
    v64 = (void **)&v17;
    char v65 = 0;
    *(void *)&long long v17 = operator new(0xF0uLL);
    *((void *)&v17 + 1) = v17;
    v18 = (NIMLModelResource *)(v17 + 240);
    *((void *)&v17 + 1) = sub_100374454((uint64_t)&v18, v66, v68, (char *)v17);
    sub_100374228((void **)&v2->_modelResourcePackage.trainedModelResources.__begin_);
    *(_OWORD *)&v2->_modelResourcePackage.trainedModelResources.__begin_ = v15;
    v2->_modelResourcePackage.trainedModelResources.__end_cap_.__value_ = v16;
    long long v15 = 0uLL;
    v16 = 0;
    sub_100374228((void **)&v2->_modelResourcePackage.dataTranformerResources.__begin_);
    *(_OWORD *)&v2->_modelResourcePackage.dataTranformerResources.__begin_ = v17;
    v2->_modelResourcePackage.dataTranformerResources.__end_cap_.__value_ = v18;
    long long v17 = 0uLL;
    v18 = 0;
    v64 = (void **)&v17;
    sub_100374320(&v64);
    v64 = (void **)&v15;
    sub_100374320(&v64);
    for (uint64_t i = 0; i != -240; i -= 120)
    {
      v4 = (void **)((char *)v66 + i);
      if (v67[i + 112] && *((char *)v4 + 231) < 0) {
        operator delete(v4[26]);
      }
      if (*((unsigned char *)v4 + 200) && v67[i + 79] < 0) {
        operator delete(v4[22]);
      }
      v5 = (void **)((char *)v66 + i);
      if (v67[i + 47] < 0) {
        operator delete(v5[18]);
      }
      if (*((char *)v5 + 143) < 0) {
        operator delete(v4[15]);
      }
    }
    for (uint64_t j = 0; j != -240; j -= 120)
    {
      v7 = (void **)((char *)v68 + j);
      if (v69[j + 112] && *((char *)v7 + 231) < 0) {
        operator delete(v7[26]);
      }
      if (*((unsigned char *)v7 + 200) && v69[j + 79] < 0) {
        operator delete(v7[22]);
      }
      v8 = (void **)((char *)v68 + j);
      if (v69[j + 47] < 0) {
        operator delete(v8[18]);
      }
      if (*((char *)v8 + 143) < 0) {
        operator delete(v7[15]);
      }
    }
    remoteTxAntennaMask = v2->_remoteTxAntennaMask;
    v2->_remoteTxAntennaMask = 0;

    biasCorrectionEstimate = v2->_biasCorrectionEstimate;
    v2->_biasCorrectionEstimate = 0;

    neuralNetworkRangeBiasEstimatorModelAntennaMask1 = v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 = 0;

    neuralNetworkRangeBiasEstimatorModelAntennaMask2 = v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = 0;

    if (v29 && v28 < 0) {
      operator delete(__p);
    }
    if (v26 && v25 < 0) {
      operator delete(v24);
    }
    if (SHIBYTE(v22) < 0) {
      operator delete((void *)v21);
    }
    if (SHIBYTE(v20) < 0) {
      operator delete(v19[0]);
    }
    if (v40 && v39 < 0) {
      operator delete(v38);
    }
    if (v37 && v36 < 0) {
      operator delete(v35);
    }
    if (SHIBYTE(v33) < 0) {
      operator delete((void *)v32);
    }
    if (SHIBYTE(v31) < 0) {
      operator delete(v30[0]);
    }
    if (v51 && v50 < 0) {
      operator delete(v49);
    }
    if (v48 && v47 < 0) {
      operator delete(v46);
    }
    if (SHIBYTE(v44) < 0) {
      operator delete((void *)v43);
    }
    if (SHIBYTE(v42) < 0) {
      operator delete(v41[0]);
    }
    if (v62 && v61 < 0) {
      operator delete(v60);
    }
    if (v59 && v58 < 0) {
      operator delete(v57);
    }
    if (SHIBYTE(v55) < 0) {
      operator delete((void *)v54);
    }
    if (SHIBYTE(v53) < 0) {
      operator delete(__dst[0]);
    }
  }
  v13 = v2;

  return v13;
}

- (BOOL)configureWithResourceFileHandler:(id)a3
{
  id v4 = a3;
  v5 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#bias-est, Configuring bias estimator with resource file handler", buf, 2u);
  }
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100434C2C();
    }
    goto LABEL_20;
  }
  id v6 = [v4 bundleName];
  sub_100004950(v22, (char *)[v6 UTF8String]);
  id v7 = [v4 resourceBundleDir];
  sub_100004950(__p, (char *)[v7 UTF8String]);
  [(RangeBiasEstimatorSingleAntennaModel *)self addBundleNameToModelResourcePackage:v22 andBundleDirectory:__p];
  if (v21 < 0) {
    operator delete(__p[0]);
  }

  if (v23 < 0) {
    operator delete(v22[0]);
  }

  v8 = [(RangeBiasEstimatorSingleAntennaModel *)self loadResourcesWithResourceIndex:0];
  neuralNetworkRangeBiasEstimatorModelAntennaMask1 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
  self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 = v8;

  if (!self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1)
  {
    uint64_t v17 = qword_1008ABDE0;
    BOOL v16 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 67109120;
    int v25 = 1;
    v18 = v17;
    goto LABEL_19;
  }
  uint64_t v10 = [(RangeBiasEstimatorSingleAntennaModel *)self loadResourcesWithResourceIndex:1];
  neuralNetworkRangeBiasEstimatorModelAntennaMask2 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  p_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = &self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  *p_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = (NeuralNetworkModelWithDataTransformer *)v10;

  v13 = *p_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  v14 = qword_1008ABDE0;
  BOOL v15 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (!v15)
    {
LABEL_20:
      BOOL v16 = 0;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 67109120;
    int v25 = 2;
    v18 = v14;
LABEL_19:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#bias-est, Unable to initialize Model with resources for antenna %d, bypassing bias estimation.", buf, 8u);
    goto LABEL_20;
  }
  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#bias-est, Espresso Model initialized for both antennas", buf, 2u);
  }
  BOOL v16 = 1;
LABEL_21:

  return v16;
}

- (id)consumeInputFeatures:(id)a3
{
  id v4 = a3;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1008AAAE8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1008AAAE8))
  {
    dword_1008AAAE0 = *((_DWORD *)sub_100007D00() + 186);
    __cxa_guard_release(&qword_1008AAAE8);
  }
  biasCorrectionEstimate = self->_biasCorrectionEstimate;
  self->_biasCorrectionEstimate = 0;

  if (v4)
  {
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 antennaMask]);
    id v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    remoteTxAntennaMask = self->_remoteTxAntennaMask;
    self->_remoteTxAntennaMask = v6;

    v8 = [v4 cirPacket1];
    if ([v8 count] != (id)8) {
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 226, "[CIRValuesPacket1 count] == kDimCIRSamples");
    }
    unsigned __int8 v9 = [(RangeBiasEstimatorSingleAntennaModel *)self checkCirsValid:v8];
    uint64_t v10 = [v4 cirPacket2];
    if ([v10 count] != (id)8) {
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 230, "[CIRValuesPacket2 count] == kDimCIRSamples");
    }
    char v11 = v9 & [(RangeBiasEstimatorSingleAntennaModel *)self checkCirsValid:v10];
    v12 = qword_1008ABDE0;
    BOOL v13 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) == 0)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#bias-est, Invalid CIRs, not calculating bias estimate.", buf, 2u);
      }
      v38 = 0;
      goto LABEL_43;
    }
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#bias-est, Valid CIRs, continuing ... ", buf, 2u);
    }
    v14 = [(RangeBiasEstimatorSingleAntennaModel *)self scaleCirValuesIfRequired:v8];
    uint64_t v15 = [(RangeBiasEstimatorSingleAntennaModel *)self scaleCirValuesIfRequired:v10];
    BOOL v16 = (void *)v15;
    if (v14 && v15)
    {
      [(RangeBiasEstimatorSingleAntennaModel *)self getNormalizedCirAndPeakMagnitude:v14];
      [(RangeBiasEstimatorSingleAntennaModel *)self getNormalizedCirAndPeakMagnitude:v16];
      [(RangeBiasEstimatorSingleAntennaModel *)self getNormalizedFftCir:v14];
      [(RangeBiasEstimatorSingleAntennaModel *)self getNormalizedFftCir:v16];
      if (v71 - (unsigned char *)v70 == 56)
      {
        if (v69 - (unsigned char *)__p == 56)
        {
          [v4 rttInitiator];
          double v18 = v17;
          [v4 tatInitiator];
          double v20 = v19;
          [v4 rttResponder];
          double v22 = v21;
          [v4 tatResponder];
          double v24 = v23;
          double v25 = v22 + v23;
          if (v22 + v23 == 0.0) {
            __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 266, "(tat_r + rtt_r) != 0");
          }
          [v4 leadingEdgePacket1];
          double v27 = v26;
          [v4 firstPathIndexPacket1];
          double v29 = v28;
          [v4 leadingEdgePacket2];
          double v31 = v30;
          [v4 firstPathIndexPacket2];
          double v33 = v31 - v32;
          if (dword_1008AAAE0 == 1) {
            double v34 = v27 - v29 + -1.0;
          }
          else {
            double v34 = v27 - v29;
          }
          if (dword_1008AAAE0 == 1) {
            double v35 = v33 + -1.0;
          }
          else {
            double v35 = v33;
          }
          [v4 toaNoiseRms];
          if (v36 == 0.0 || v77 == 0.0 || v74 == 0.0)
          {
            char v37 = qword_1008ABDE0;
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "#bias-est, Cannot calculate snr, returning nil", buf, 2u);
            }
            v38 = 0;
          }
          else
          {
            [v4 toaNoiseRms:(double)v74];
            long double __xa = v41;
            double v63 = log10(v77);
            double v62 = log10(__xa);
            [v4 toaNoiseRms];
            long double v43 = v42;
            double __x = log10(v74);
            double v61 = log10(v43);
            [v4 soiRssiDbm];
            uint64_t v45 = v44;
            [v4 rssiDbm];
            uint64_t v60 = v46;
            uint64_t v59 = v45;
            [v4 tofPicSecond];
            uint64_t v58 = v47;
            if (dword_1008AAAE0 == 1) {
              double v48 = 0.100000001;
            }
            else {
              double v48 = 1.0;
            }
            [v4 toaNoiseRms];
            double v57 = v49;
            [v4 toaPpwinRms];
            double v56 = v50;
            [v4 toaPpwinPeak];
            *(void *)buf = v60;
            uint64_t v79 = v59;
            uint64_t v80 = v58;
            double v81 = v57 * v48;
            double v82 = v48 * v56;
            double v83 = v48 * v51;
            double v84 = v62 * -20.0 + v63 * 20.0;
            double v85 = v61 * -20.0 + __x * 20.0;
            double v86 = v34;
            double v87 = v35;
            double v88 = v18 - v24;
            double v89 = v22 - v20;
            double v90 = (v18 + v20 - v25) / v25 * 1000000.0;
            uint64_t v91 = *(void *)v70;
            uint64_t v92 = *((void *)v70 + 1);
            uint64_t v93 = *((void *)v70 + 2);
            uint64_t v94 = *((void *)v70 + 3);
            uint64_t v95 = *((void *)v70 + 4);
            uint64_t v96 = *((void *)v70 + 5);
            uint64_t v97 = *((void *)v70 + 6);
            uint64_t v98 = *(void *)__p;
            uint64_t v99 = *((void *)__p + 1);
            uint64_t v100 = *((void *)__p + 2);
            uint64_t v101 = *((void *)__p + 3);
            uint64_t v102 = *((void *)__p + 4);
            uint64_t v103 = *((void *)__p + 5);
            uint64_t v104 = *((void *)__p + 6);
            uint64_t v105 = *(void *)v75;
            uint64_t v106 = *((void *)v75 + 1);
            uint64_t v107 = *((void *)v75 + 2);
            uint64_t v108 = *((void *)v75 + 3);
            uint64_t v109 = *((void *)v75 + 4);
            uint64_t v110 = *((void *)v75 + 5);
            uint64_t v111 = *((void *)v75 + 6);
            uint64_t v112 = *((void *)v75 + 7);
            uint64_t v113 = *(void *)v72;
            uint64_t v114 = *((void *)v72 + 1);
            uint64_t v115 = *((void *)v72 + 2);
            uint64_t v116 = *((void *)v72 + 3);
            uint64_t v117 = *((void *)v72 + 4);
            uint64_t v118 = *((void *)v72 + 5);
            uint64_t v119 = *((void *)v72 + 6);
            uint64_t v120 = *((void *)v72 + 7);
            sub_100370CC0(&v66, buf, 0x2BuLL);
            if (v67 - (unsigned char *)v66 != 344) {
              __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", 347, "rangeBiasEstimatorModelInputParams.size() == kDimInputFeaturesSingleAntennaRangeBiasModel");
            }
            v52 = +[NSNumber numberWithInt:43];
            v38 = [(RangeBiasEstimatorSingleAntennaModel *)self createAndPopulateBiasEstimatorInput:&v66 ofDimension:v52];

            if (v38)
            {
              id v53 = v38;
            }
            else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
            {
              sub_100434C94();
            }

            if (v66)
            {
              v67 = v66;
              operator delete(v66);
            }
          }
          if (__p)
          {
            v69 = __p;
            operator delete(__p);
          }
          if (v70)
          {
            v71 = v70;
            operator delete(v70);
          }
          if (v72)
          {
            v73 = v72;
            operator delete(v72);
          }
          if (v75)
          {
            v76 = v75;
            operator delete(v75);
          }
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        long long v54 = "normalizedFftCirPacket1.size() == normalizedFftCirPacket2.size()";
        int v55 = 257;
      }
      else
      {
        long long v54 = "normalizedFftCirPacket1.size() == kDimExtractedFftCir";
        int v55 = 256;
      }
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]", "NRBYRangeBiasEstimator.mm", v55, v54);
    }
    char v39 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "#bias-est, Scaling CIRs failed, not calculating bias estimate.", buf, 2u);
    }
    v38 = 0;
    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100434C60();
  }
  v38 = 0;
LABEL_44:

  return v38;
}

- (id)preprocessInputFeatures:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 featureValueForName:@"input"];
    id v7 = [v6 multiArrayValue];

    if ([v7 count] == (id)43)
    {
      if ((uint64_t)[v7 count] > 12)
      {
        uint64_t v8 = 0;
        __p = 0;
        double v42 = 0;
        long double v43 = 0;
        do
        {
          unsigned __int8 v9 = [v7 objectAtIndexedSubscript:v8];
          [v9 doubleValue];
          uint64_t v11 = v10;
          v12 = v42;
          if (v42 >= v43)
          {
            v14 = (char *)__p;
            uint64_t v15 = (v42 - (unsigned char *)__p) >> 3;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 61) {
              sub_1000267C4();
            }
            uint64_t v17 = v43 - (unsigned char *)__p;
            if ((v43 - (unsigned char *)__p) >> 2 > v16) {
              unint64_t v16 = v17 >> 2;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              double v19 = (char *)sub_100056BF0((uint64_t)&v43, v18);
              v14 = (char *)__p;
              v12 = v42;
            }
            else
            {
              double v19 = 0;
            }
            double v20 = &v19[8 * v15];
            *(void *)double v20 = v11;
            BOOL v13 = v20 + 8;
            while (v12 != v14)
            {
              uint64_t v21 = *((void *)v12 - 1);
              v12 -= 8;
              *((void *)v20 - 1) = v21;
              v20 -= 8;
            }
            __p = v20;
            double v42 = v13;
            long double v43 = &v19[8 * v18];
            if (v14) {
              operator delete(v14);
            }
          }
          else
          {
            *(void *)double v42 = v10;
            BOOL v13 = v12 + 8;
          }
          double v42 = v13;

          ++v8;
        }
        while (v8 != 13);
        double v22 = +[NSNumber numberWithInt:13];
        double v23 = [(RangeBiasEstimatorSingleAntennaModel *)self createAndPopulateBiasEstimatorInput:&__p ofDimension:v22];

        if (v23)
        {
          if ([(NSNumber *)self->_remoteTxAntennaMask intValue] != 1
            && [(NSNumber *)self->_remoteTxAntennaMask intValue] != 2)
          {
            __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]", "NRBYRangeBiasEstimator.mm", 380, "[_remoteTxAntennaMask intValue] == kAntennaMask1 || [_remoteTxAntennaMask intValue] == kAntennaMask2");
          }
          double v24 = (id)qword_1008ABDE0;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v25 = [(NSNumber *)self->_remoteTxAntennaMask intValue];
            *(_DWORD *)buf = 67109120;
            LODWORD(v45) = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "#bias-est, Using Antenna %d NN bias model", buf, 8u);
          }

          unsigned int v26 = [(NSNumber *)self->_remoteTxAntennaMask intValue];
          if (v26 == 2)
          {
            double v27 = [(NeuralNetworkModelWithDataTransformer *)self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2 rangeBiasEstimatorModelDataTransformer];
            uint64_t v28 = [v27 applyTransformation:v23];
          }
          else
          {
            if (v26 != 1)
            {
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
                sub_100434CFC();
              }
              char v40 = qword_1008ABDE0;
              if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Libraries/NearbyAlgorithms/RangeBiasEstimation/NRB"
                      "YRangeBiasEstimator.mm";
                __int16 v46 = 1024;
                int v47 = 392;
                __int16 v48 = 2080;
                double v49 = "-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]";
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "#bias-est, %s:%d: assertion failure in %s", buf, 0x1Cu);
              }
              abort();
            }
            double v27 = [(NeuralNetworkModelWithDataTransformer *)self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 rangeBiasEstimatorModelDataTransformer];
            uint64_t v28 = [v27 applyTransformation:v23];
          }
          double v30 = (void *)v28;

          if (v30)
          {
            double v31 = [v30 featureValueForName:@"input"];
            double v32 = [v31 multiArrayValue];

            for (uint64_t i = 0; i != 13; ++i)
            {
              double v34 = [v32 objectAtIndexedSubscript:i];
              [v7 setObject:v34 atIndexedSubscript:i];
            }
            double v35 = [[RangeBiasEstimatorInput alloc] initWithData:v7];
            double v29 = v35;
            if (v35)
            {
              double v36 = v35;
            }
            else if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
            {
              sub_100434C94();
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
              sub_100434D30();
            }
            double v29 = 0;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
            sub_100434C94();
          }
          double v29 = 0;
        }

        if (__p)
        {
          double v42 = (char *)__p;
          operator delete(__p);
        }

        goto LABEL_52;
      }
      v38 = "kStartIdxOfFeaturesThatRequireScaling+kLengthOfFeaturesThatRequireScaling <= [inputFeatureMultiArray count]";
      int v39 = 366;
    }
    else
    {
      v38 = "[inputFeatureMultiArray count] == kDimInputFeaturesSingleAntennaRangeBiasModel";
      int v39 = 365;
    }
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]", "NRBYRangeBiasEstimator.mm", v39, v38);
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
    sub_100434CC8();
  }
  double v29 = 0;
LABEL_52:

  return v29;
}

- (id)predictOutput:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100434D64();
    }
    goto LABEL_13;
  }
  if (![(RangeBiasEstimatorSingleAntennaModel *)self predictBiasEstimate:[(NSNumber *)self->_remoteTxAntennaMask intValue] scaledInputFeatures:v4 output:v20])
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100434E14();
    }
LABEL_13:
    id v13 = 0;
    goto LABEL_21;
  }
  if (v20[10] != 11) {
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel predictOutput:]", "NRBYRangeBiasEstimator.mm", 449, "output.width == kDimOutputSingleAntennaRangeBiasModel");
  }
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:11];
  uint64_t v6 = 0;
  double v7 = 0.0;
  *(void *)&long long v8 = 67109376;
  long long v19 = v8;
  double v9 = 0.0;
  do
  {
    double v10 = *(float *)(v20[0] + 4 * v6);
    uint64_t v11 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v19;
      *(_DWORD *)double v22 = v6;
      *(_WORD *)&v22[4] = 2048;
      *(double *)&v22[6] = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#bias-est, Output Probability index = %d, value = %f", buf, 0x12u);
    }
    v12 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10, v19);
    [v5 setObject:v12 atIndexedSubscript:v6];

    double v7 = v7 + v10;
    double v9 = v9 + dbl_1004C3C18[v6++] * v10;
  }
  while (v6 != 11);
  v14 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)double v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#bias-est, biasCorrectionEstimate = %f", buf, 0xCu);
  }
  uint64_t v15 = +[NSNumber numberWithDouble:v9];
  biasCorrectionEstimate = self->_biasCorrectionEstimate;
  self->_biasCorrectionEstimate = v15;

  if (v7 >= 1.00001 || v7 <= 0.99999) {
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel predictOutput:]", "NRBYRangeBiasEstimator.mm", 467, "(totalProbability < 1.0 + epsilon) && (totalProbability > 1.0 - epsilon)");
  }
  uint64_t v17 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG)) {
    sub_100434D98(v17, v7);
  }
  id v13 = [v5 copy];

LABEL_21:

  return v13;
}

- (void)addBundleNameToModelResourcePackage:()basic_string<char andBundleDirectory:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  id v4 = v3;
  begin = self->_modelResourcePackage.trainedModelResources.__begin_;
  if (self->_modelResourcePackage.trainedModelResources.__end_ != begin)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 56;
    do
    {
      sub_10025974C((std::string *)((char *)begin + v9 + 32), (const std::string *)a3);
      sub_10025974C((std::string *)((char *)self->_modelResourcePackage.trainedModelResources.__begin_ + v9), v4);
      ++v8;
      begin = self->_modelResourcePackage.trainedModelResources.__begin_;
      v9 += 120;
    }
    while (0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.trainedModelResources.__end_ - begin) >> 3) > v8);
  }
  double v10 = self->_modelResourcePackage.dataTranformerResources.__begin_;
  if (self->_modelResourcePackage.dataTranformerResources.__end_ != v10)
  {
    unint64_t v11 = 0;
    uint64_t v12 = 56;
    do
    {
      sub_10025974C((std::string *)((char *)v10 + v12 + 32), (const std::string *)a3);
      sub_10025974C((std::string *)((char *)self->_modelResourcePackage.dataTranformerResources.__begin_ + v12), v4);
      ++v11;
      double v10 = self->_modelResourcePackage.dataTranformerResources.__begin_;
      v12 += 120;
    }
    while (0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.dataTranformerResources.__end_ - v10) >> 3) > v11);
  }
}

- (id)getResourcePathWithBundleName:()basic_string<char bundleDir:()std:(std::allocator<char>> *)data :char_traits<char> resourceName:resourceExtension:
{
  uint64_t v6 = v5;
  double v7 = v4;
  if (*((char *)v3 + 23) < 0) {
    v3 = (uint64_t *)*v3;
  }
  uint64_t v9 = +[NSString stringWithUTF8String:v3];
  if (*((char *)&data->__r_.__value_.var0.var1 + 23) < 0) {
    data = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)data->__r_.__value_.var0.var1.__data_;
  }
  double v10 = +[NSString stringWithUTF8String:data];
  unint64_t v11 = [v9 stringByAppendingPathComponent:v10];

  uint64_t v12 = +[NSBundle bundleWithPath:v11];
  id v13 = v11;
  double v20 = (char *)[v13 UTF8String];
  sub_1002BA388(&v22.__pn_, &v20);
  std::__fs::filesystem::__status(&v22, 0);
  unsigned __int8 v14 = v21;
  if (SHIBYTE(v22.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__pn_.__r_.__value_.__l.__data_);
  }
  if (v14 != 255 && v14)
  {
    if (*((char *)v7 + 23) < 0) {
      double v7 = (uint64_t *)*v7;
    }
    uint64_t v17 = +[NSString stringWithUTF8String:v7];
    if (*((char *)v6 + 23) < 0) {
      uint64_t v6 = (uint64_t *)*v6;
    }
    unint64_t v18 = +[NSString stringWithUTF8String:v6];
    uint64_t v15 = [v12 pathForResource:v17 ofType:v18];

    if (v15)
    {
      uint64_t v15 = v15;
      unint64_t v16 = v15;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100434E48();
      }
      unint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v15 = (id)qword_1008ABDE0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100434E7C((uint64_t)[v13 UTF8String], (uint8_t *)&v22, v15);
    }
    unint64_t v16 = 0;
  }

  return v16;
}

- (id)loadResourcesWithResourceIndex:(int)a3
{
  uint64_t v66 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  sub_100374584((char *)&v66, (long long *)self->_modelResourcePackage.trainedModelResources.__begin_, (long long *)self->_modelResourcePackage.trainedModelResources.__end_, 0xEEEEEEEEEEEEEEEFLL* ((self->_modelResourcePackage.trainedModelResources.__end_- self->_modelResourcePackage.trainedModelResources.__begin_) >> 3));
  double v63 = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  sub_100374584((char *)&v63, (long long *)self->_modelResourcePackage.dataTranformerResources.__begin_, (long long *)self->_modelResourcePackage.dataTranformerResources.__end_, 0xEEEEEEEEEEEEEEEFLL* ((self->_modelResourcePackage.dataTranformerResources.__end_- self->_modelResourcePackage.dataTranformerResources.__begin_) >> 3));
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((v67 - v66) >> 3);
  if (v5 != 0xEEEEEEEEEEEEEEEFLL * ((v64 - (uint64_t)v63) >> 3))
  {
    v38 = "trainedModelResourceArray.size() == dataTransformerResourceArray.size()";
    int v39 = 514;
    goto LABEL_88;
  }
  if (v5 <= a3)
  {
    v38 = "trainedModelResourceArray.size() > index";
    int v39 = 515;
LABEL_88:
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]", "NRBYRangeBiasEstimator.mm", v39, v38);
  }
  uint64_t v6 = 0;
  int v7 = a3;
  int v42 = a3 + 1;
  char v8 = 1;
  do
  {
    char v9 = v8;
    memset(&v61, 0, sizeof(v61));
    memset(&v60, 0, sizeof(v60));
    memset(&v59, 0, sizeof(v59));
    memset(&v58, 0, sizeof(v58));
    if (v8)
    {
      uint64_t v10 = v66 + 120 * v7;
      if (*(unsigned char *)(v10 + 80) && *(unsigned char *)(v66 + 120 * v7 + 112))
      {
        std::string::operator=(&v59, (const std::string *)(v10 + 56));
        uint64_t v11 = v66 + 120 * v7;
        if (!*(unsigned char *)(v11 + 112)) {
          goto LABEL_90;
        }
        std::string::operator=(&v58, (const std::string *)(v11 + 88));
        std::string::operator=(&v61, (const std::string *)(v66 + 120 * v7));
        uint64_t v12 = v66 + 120 * v7;
        int v13 = *(_DWORD *)(v12 + 48);
        std::string::operator=(&v60, (const std::string *)(v12 + 24));
        goto LABEL_13;
      }
      int v36 = 533;
      char v37 = "trainedModelResourceArray[index].bundleDirectory.has_value() && trainedModelResourceArray[index].bundleName.has_value()";
LABEL_85:
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]", "NRBYRangeBiasEstimator.mm", v36, v37);
    }
    unsigned __int8 v14 = &v63[15 * v7];
    if (!*((unsigned char *)v14 + 80) || !LOBYTE(v63[15 * v7 + 14]))
    {
      int v36 = 541;
      char v37 = "dataTransformerResourceArray[index].bundleDirectory.has_value() && dataTransformerResourceArray[index].bundl"
            "eName.has_value()";
      goto LABEL_85;
    }
    std::string::operator=(&v59, (const std::string *)(v14 + 7));
    uint64_t v15 = &v63[15 * v7];
    if (!*((unsigned char *)v15 + 112)) {
LABEL_90:
    }
      sub_10000AE44();
    std::string::operator=(&v58, (const std::string *)(v15 + 11));
    std::string::operator=(&v61, (const std::string *)&v63[15 * v7]);
    unint64_t v16 = &v63[15 * v7];
    int v13 = *((_DWORD *)v16 + 12);
    std::string::operator=(&v60, (const std::string *)v16 + 1);
LABEL_13:
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
      sub_100002DE4(&__dst, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
    }
    else {
      std::string __dst = v58;
    }
    if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
      sub_100002DE4(&v56, v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
    }
    else {
      std::string v56 = v59;
    }
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
      sub_100002DE4(&v55, v61.__r_.__value_.__l.__data_, v61.__r_.__value_.__l.__size_);
    }
    else {
      std::string v55 = v61;
    }
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
      sub_100002DE4(&__p, v60.__r_.__value_.__l.__data_, v60.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v60;
    }
    uint64_t v17 = [(RangeBiasEstimatorSingleAntennaModel *)self getResourcePathWithBundleName:&__dst bundleDir:&v56 resourceName:&v55 resourceExtension:&__p];
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v55.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v56.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__dst.__r_.__value_.__l.__data_);
    }
    id v18 = v17;
    sub_100004950(v52, (char *)[v18 UTF8String]);
    long long v19 = (const std::__fs::filesystem::path *)sub_10019C9FC(&buf, (char *)v52);
    std::__fs::filesystem::__status(v19, 0);
    uint8_t v20 = v70[0];
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    if (v20 == 255 || !v20)
    {
      uint64_t v21 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT))
      {
        double v31 = v52;
        if (v53 < 0) {
          double v31 = (void **)v52[0];
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v31;
        _os_log_fault_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "#bias-est, Unable to locate resource file %s, bypassing bias estimation.", (uint8_t *)&buf, 0xCu);
      }
LABEL_38:
      char v22 = 0;
      goto LABEL_39;
    }
    if (v13 == 1)
    {
      unsigned int v25 = [RangeBiasEstimatorModelDataTransformer alloc];
      if (v53 >= 0) {
        unsigned int v26 = v52;
      }
      else {
        unsigned int v26 = (void **)v52[0];
      }
      double v27 = +[NSString stringWithUTF8String:v26];
      uint64_t v28 = +[NSURL fileURLWithPath:v27];
      double v29 = [(RangeBiasEstimatorModelDataTransformer *)v25 initWithContentsOfURL:v28];

      double v30 = qword_1008ABDE0;
      if (v29)
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.__r_.__value_.__l.__data_) = 67109120;
          HIDWORD(buf.__r_.__value_.__r.__words[0]) = v42;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#bias-est, Loaded data transformer model %d", (uint8_t *)&buf, 8u);
        }
        char v22 = 1;
        uint64_t v6 = v29;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100434F1C(&v46, v47);
        }
        char v22 = 0;
        uint64_t v6 = 0;
      }
    }
    else if (v13)
    {
      char v22 = 1;
    }
    else
    {
      uint64_t context = espresso_create_context();
      uint64_t plan = espresso_create_plan();
      if (espresso_plan_add_network())
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100434EF0(&v50, v51);
        }
        goto LABEL_38;
      }
      if (espresso_plan_build())
      {
        if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
          sub_100434EC4(&v48, v49);
        }
        goto LABEL_38;
      }
      long long v62 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
      double v32 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long v70 = 67109120;
        *(_DWORD *)&v70[4] = v42;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bias-est, Loaded NN model %d", v70, 8u);
      }
      char v22 = 1;
      uint64_t v40 = plan;
      uint64_t v41 = context;
    }
LABEL_39:
    if (v53 < 0) {
      operator delete(v52[0]);
    }

    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v58.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v59.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v60.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v61.__r_.__value_.__l.__data_);
    }
    if ((v22 & 1) == 0)
    {
      double v33 = 0;
      goto LABEL_80;
    }
    char v8 = 0;
  }
  while ((v9 & 1) != 0);
  if (!v6) {
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]", "NRBYRangeBiasEstimator.mm", 603, "rangeBiasEstimatorModelDataTransformer != nil");
  }
  double v34 = [NeuralNetworkModelWithDataTransformer alloc];
  long long v43 = v62;
  uint64_t v44 = v40;
  uint64_t v45 = v41;
  double v33 = [(NeuralNetworkModelWithDataTransformer *)v34 initWithNeuralNetworkModel:&v43 andDataTransformer:v6];
LABEL_80:

  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&v63;
  sub_100374320((void ***)&v61);
  double v63 = (void **)&v66;
  sub_100374320(&v63);

  return v33;
}

- (BOOL)checkCirsValid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = 0;
  int v5 = 0;
  do
  {
    uint64_t v6 = [v3 objectAtIndex:v4];
    int v7 = [v6 real];
    [v7 doubleValue];
    if (v8 == 0.0)
    {
      char v9 = [v3 objectAtIndex:v4];
      uint64_t v10 = [v9 imag];
      [v10 doubleValue];
      double v12 = v11;

      if (v12 == 0.0) {
        ++v5;
      }
    }
    else
    {
    }
    ++v4;
  }
  while (v4 != 8);
  if (v5 == 8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100434F48();
    }
LABEL_17:
    BOOL v23 = 0;
    goto LABEL_18;
  }
  uint64_t v13 = 0;
  double v14 = 0.0;
  double v15 = 0.0;
  do
  {
    unint64_t v16 = [v3 objectAtIndex:v13];
    uint64_t v17 = [v16 real];
    [v17 doubleValue];
    double v19 = v18;

    uint8_t v20 = [v3 objectAtIndex:v13];
    uint64_t v21 = [v20 imag];
    [v21 doubleValue];
    double v15 = v15 + v19;
    double v14 = v14 + v22;

    ++v13;
  }
  while (v13 != 8);
  BOOL v23 = 1;
  if (v15 == 0.0 && v14 == 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_100434F7C();
    }
    goto LABEL_17;
  }
LABEL_18:

  return v23;
}

- (id)createAndPopulateBiasEstimatorInput:(const void *)a3 ofDimension:(id)a4
{
  int v5 = +[NSArray arrayWithObject:a4];
  id v22 = 0;
  id v6 = [objc_alloc((Class)MLMultiArray) initWithShape:v5 dataType:65600 error:&v22];
  id v7 = v22;
  double v8 = qword_1008ABDE0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
      sub_100434FB0((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
    double v15 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#bias-est, Created biasEstimatorInputMLArray, populating values.", v21, 2u);
    }
    if (*((void *)a3 + 1) != *(void *)a3)
    {
      unint64_t v16 = 0;
      do
      {
        uint64_t v17 = +[NSNumber numberWithInt:v16];
        double v18 = +[NSNumber numberWithDouble:*(double *)(*(void *)a3 + 8 * v16)];
        BOOL v23 = v17;
        double v19 = +[NSArray arrayWithObjects:&v23 count:1];
        [v6 setObject:v18 forKeyedSubscript:v19];

        ++v16;
      }
      while (v16 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
    }
    double v15 = [[RangeBiasEstimatorInput alloc] initWithData:v6];
  }

  return v15;
}

- (BOOL)predictBiasEstimate:(unsigned __int8)a3 scaledInputFeatures:(id)a4 output:(id *)a5
{
  int v5 = a3;
  id v7 = a4;
  std::string __p = 0;
  double v35 = 0;
  int v36 = 0;
  double v8 = [v7 featureValueForName:@"input"];
  uint64_t v9 = [v8 multiArrayValue];

  for (uint64_t i = 0; i != 43; ++i)
  {
    uint64_t v11 = [v9 objectAtIndexedSubscript:i];
    [v11 doubleValue];
    float v13 = v12;
    uint64_t v14 = v35;
    if (v35 >= v36)
    {
      unint64_t v16 = __p;
      uint64_t v17 = v35 - __p;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 62) {
        sub_1000267C4();
      }
      uint64_t v19 = (char *)v36 - (char *)__p;
      if (((char *)v36 - (char *)__p) >> 1 > v18) {
        unint64_t v18 = v19 >> 1;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        uint64_t v21 = (char *)sub_10003B54C((uint64_t)&v36, v20);
        unint64_t v16 = __p;
        uint64_t v14 = v35;
      }
      else
      {
        uint64_t v21 = 0;
      }
      id v22 = (float *)&v21[4 * v17];
      *id v22 = v13;
      double v15 = v22 + 1;
      while (v14 != v16)
      {
        int v23 = *((_DWORD *)v14-- - 1);
        *((_DWORD *)v22-- - 1) = v23;
      }
      std::string __p = v22;
      int v36 = (float *)&v21[4 * v20];
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      float *v35 = v13;
      double v15 = v35 + 1;
    }
    double v35 = v15;
  }
  uint64_t v38 = 43;
  if (espresso_buffer_pack_tensor_shape())
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004350B8();
    }
    goto LABEL_22;
  }
  if (v5 == 2)
  {
    neuralNetworkRangeBiasEstimatorModelAntennaMask2 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (neuralNetworkRangeBiasEstimatorModelAntennaMask2) {
      [(NeuralNetworkModelWithDataTransformer *)neuralNetworkRangeBiasEstimatorModelAntennaMask2 neuralNetworkModel];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    if (espresso_network_bind_buffer())
    {
      if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        BOOL v24 = 0;
        goto LABEL_23;
      }
LABEL_35:
      sub_100435084();
      goto LABEL_22;
    }
    uint64_t v28 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (v28) {
      [(NeuralNetworkModelWithDataTransformer *)v28 neuralNetworkModel];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    if (espresso_network_bind_buffer())
    {
      if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
LABEL_47:
      sub_100435050();
      goto LABEL_22;
    }
    double v30 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (v30) {
      goto LABEL_55;
    }
  }
  else
  {
    if (v5 != 1)
    {
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_FAULT)) {
        sub_100434CFC();
      }
      double v33 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)std::string buf = 136315650;
        *(void *)&uint8_t buf[4] = "/Library/Caches/com.apple.xbs/Sources/Proximity/Libraries/NearbyAlgorithms/RangeBiasEstimat"
                             "ion/NRBYRangeBiasEstimator.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 723;
        *(_WORD *)&buf[18] = 2080;
        *(void *)&buf[20] = "-[RangeBiasEstimatorSingleAntennaModel predictBiasEstimate:scaledInputFeatures:output:]";
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#bias-est, %s:%d: assertion failure in %s", buf, 0x1Cu);
      }
      abort();
    }
    neuralNetworkRangeBiasEstimatorModelAntennaMask1 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    if (neuralNetworkRangeBiasEstimatorModelAntennaMask1) {
      [(NeuralNetworkModelWithDataTransformer *)neuralNetworkRangeBiasEstimatorModelAntennaMask1 neuralNetworkModel];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    if (espresso_network_bind_buffer())
    {
      if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_35;
    }
    double v29 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    if (v29) {
      [(NeuralNetworkModelWithDataTransformer *)v29 neuralNetworkModel];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    if (espresso_network_bind_buffer())
    {
      if (!os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      goto LABEL_47;
    }
    double v30 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    if (v30)
    {
LABEL_55:
      [(NeuralNetworkModelWithDataTransformer *)v30 neuralNetworkModel];
      goto LABEL_57;
    }
  }
  memset(buf, 0, sizeof(buf));
LABEL_57:
  int v31 = espresso_plan_execute_sync();
  double v32 = qword_1008ABDE0;
  if (v31)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10043501C();
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bias-est, Executed espresso plan.", buf, 2u);
  }
  BOOL v24 = 1;
LABEL_23:

  if (__p) {
    operator delete(__p);
  }

  return v24;
}

- (pair<std::vector<double>,)getNormalizedCirAndPeakMagnitude:(RangeBiasEstimatorSingleAntennaModel *)self
{
  id v5 = a4;
  uint64_t v6 = 0;
  std::string __p = 0;
  v52 = 0;
  char v53 = 0;
  do
  {
    id v7 = [v5 objectAtIndexedSubscript:v6];
    double v8 = [v7 real];
    [v8 doubleValue];
    long double v10 = v9;
    uint64_t v11 = [v5 objectAtIndexedSubscript:v6];
    double v12 = [v11 imag];
    [v12 doubleValue];
    long double v14 = v13;

    double v15 = hypot(v10, v14);
    double v16 = v15;
    uint64_t v17 = v52;
    if (v52 >= v53)
    {
      uint64_t v19 = (double *)__p;
      uint64_t v20 = ((char *)v52 - (unsigned char *)__p) >> 3;
      unint64_t v21 = v20 + 1;
      if ((unint64_t)(v20 + 1) >> 61) {
        sub_1000267C4();
      }
      uint64_t v22 = (char *)v53 - (unsigned char *)__p;
      if (((char *)v53 - (unsigned char *)__p) >> 2 > v21) {
        unint64_t v21 = v22 >> 2;
      }
      if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v23 = v21;
      }
      if (v23)
      {
        BOOL v24 = (char *)sub_100056BF0((uint64_t)&v53, v23);
        uint64_t v19 = (double *)__p;
        uint64_t v17 = v52;
      }
      else
      {
        BOOL v24 = 0;
      }
      unsigned int v25 = (double *)&v24[8 * v20];
      *unsigned int v25 = v16;
      unint64_t v18 = v25 + 1;
      while (v17 != v19)
      {
        uint64_t v26 = *((void *)v17-- - 1);
        *((void *)v25-- - 1) = v26;
      }
      std::string __p = v25;
      v52 = v18;
      char v53 = (double *)&v24[8 * v23];
      if (v19) {
        operator delete(v19);
      }
    }
    else
    {
      double *v52 = v15;
      unint64_t v18 = v17 + 1;
    }
    v52 = v18;
    ++v6;
  }
  while (v6 != 8);
  double v27 = (double *)__p;
  uint64_t v28 = (double *)((char *)__p + 8);
  if (__p != v18 && v28 != v18)
  {
    double v30 = *(double *)__p;
    int v31 = (double *)((char *)__p + 8);
    do
    {
      double v32 = *v31++;
      double v33 = v32;
      if (v30 < v32)
      {
        double v30 = v33;
        double v27 = v28;
      }
      uint64_t v28 = v31;
    }
    while (v31 != v18);
  }
  double v34 = *v27;
  char v48 = 0;
  double v49 = 0;
  char v50 = 0;
  if (v34 == 0.0) {
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:]", "NRBYRangeBiasEstimator.mm", 749, "maxMagnitude != 0");
  }
  double v35 = 0;
  for (uint64_t i = 0; i != 8; ++i)
  {
    double v37 = log10(fmax(*((double *)__p + i), 1.0e-12) / v34) * 20.0;
    if (v35 >= v50)
    {
      uint64_t v38 = v48;
      uint64_t v39 = v35 - v48;
      unint64_t v40 = v39 + 1;
      if ((unint64_t)(v39 + 1) >> 61) {
        sub_1000267C4();
      }
      uint64_t v41 = (char *)v50 - (char *)v48;
      if (((char *)v50 - (char *)v48) >> 2 > v40) {
        unint64_t v40 = v41 >> 2;
      }
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v42 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v40;
      }
      if (v42)
      {
        long long v43 = (char *)sub_100056BF0((uint64_t)&v50, v42);
        uint64_t v38 = v48;
        double v35 = v49;
      }
      else
      {
        long long v43 = 0;
      }
      uint64_t v44 = (double *)&v43[8 * v39];
      *uint64_t v44 = v37;
      uint64_t v45 = v44 + 1;
      while (v35 != v38)
      {
        uint64_t v46 = *((void *)v35-- - 1);
        *((void *)v44-- - 1) = v46;
      }
      char v48 = v44;
      char v50 = (double *)&v43[8 * v42];
      if (v38) {
        operator delete(v38);
      }
      double v35 = v45;
    }
    else
    {
      *v35++ = v37;
    }
    double v49 = v35;
  }
  retstr->var0.var0 = 0;
  retstr->var0.var1 = 0;
  retstr->var0.var2.var0 = 0;
  sub_10015036C(retstr, v48, (uint64_t)v35, v35 - v48);
  retstr->var1 = v34;
  if (v48) {
    operator delete(v48);
  }
  if (__p)
  {
    v52 = (double *)__p;
    operator delete(__p);
  }

  return result;
}

- (vector<double,)getNormalizedFftCir:(RangeBiasEstimatorSingleAntennaModel *)self
{
  id v5 = a4;
  uint64_t v6 = 0;
  *(void *)&long long v7 = 0x1000000010;
  do
  {
    int32x2_t v8 = vadd_s32((int32x2_t)qword_1004C3C70[v6], (int32x2_t)0x1000000010);
    v87[++v6] = vsub_s32(v8, (int32x2_t)(*(void *)&vsra_n_u32((uint32x2_t)v8, (uint32x2_t)vcltz_s32(v8), 0x1CuLL) & 0xFFFFFFF0FFFFFFF0));
  }
  while (v6 != 4);
  double v9 = 0;
  int v10 = 0;
  std::string __p = 0;
  double v86 = 0;
  v87[0] = 0;
  do
  {
    if ((unint64_t)v9 >= v87[0])
    {
      uint64_t v11 = (char *)__p;
      uint64_t v12 = (v9 - (unsigned char *)__p) >> 4;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60) {
        sub_1000267C4();
      }
      uint64_t v14 = v87[0] - (void)__p;
      if ((uint64_t)(v87[0] - (void)__p) >> 3 > v13) {
        unint64_t v13 = v14 >> 3;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        double v16 = (char *)sub_10015344C((uint64_t)v87, v15);
        uint64_t v11 = (char *)__p;
        double v9 = v86;
      }
      else
      {
        double v16 = 0;
      }
      uint64_t v17 = &v16[16 * v12];
      *(void *)uint64_t v17 = 0;
      *((void *)v17 + 1) = 0;
      unint64_t v18 = v17;
      if (v9 != v11)
      {
        do
        {
          long long v7 = *((_OWORD *)v9 - 1);
          *((_OWORD *)v18 - 1) = v7;
          v18 -= 16;
          v9 -= 16;
        }
        while (v9 != v11);
        uint64_t v11 = (char *)__p;
      }
      double v9 = v17 + 16;
      std::string __p = v18;
      double v86 = v17 + 16;
      v87[0] = &v16[16 * v15];
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *(void *)double v9 = 0;
      *((void *)v9 + 1) = 0;
      v9 += 16;
    }
    double v86 = v9;
    ++v10;
  }
  while (v10 != 16);
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v20 = [v5 objectAtIndexedSubscript:i];
    unint64_t v21 = [v20 real];
    [v21 doubleValue];
    uint64_t v23 = v22;
    BOOL v24 = [v5 objectAtIndexedSubscript:i];
    unsigned int v25 = [v24 imag];
    [v25 doubleValue];
    uint64_t v26 = (char *)__p + 16 * *((int *)&v87[1] + i);
    *uint64_t v26 = v23;
    v26[1] = v27;
  }
  if ((unint64_t)(v86 - (unsigned char *)__p) <= 0xFF) {
    __assert_rtn("fft_NpointCIR", "NRBYRangeBiasEstimator.mm", 887, "fft_in.size() >= N");
  }
  uint64_t v28 = 0;
  __src = 0;
  double v83 = 0;
  double v84 = 0;
  do
  {
    double v30 = *(double *)__p;
    double v29 = *((double *)__p + 1);
    int v31 = v28;
    for (uint64_t j = 16; j != 256; j += 16)
    {
      double v33 = (char *)__p;
      float64x2_t v77 = vmulq_n_f64((float64x2_t)xmmword_1004C3C00, (double)v31);
      sub_100154C40(v77.f64);
      uint64_t v79 = v34;
      std::string __dst = v35;
      double v30 = v30 + sub_100154A74((double *)&v33[j], (double *)&v79);
      double v29 = v29 + v36;
      v31 += v28;
    }
    double v37 = v83;
    if (v83 >= v84)
    {
      uint64_t v39 = (double *)__src;
      uint64_t v40 = ((char *)v83 - (unsigned char *)__src) >> 4;
      unint64_t v41 = v40 + 1;
      if ((unint64_t)(v40 + 1) >> 60) {
        sub_1000267C4();
      }
      uint64_t v42 = (char *)v84 - (unsigned char *)__src;
      if (((char *)v84 - (unsigned char *)__src) >> 3 > v41) {
        unint64_t v41 = v42 >> 3;
      }
      if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v43 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v41;
      }
      if (v43)
      {
        uint64_t v44 = (char *)sub_10015344C((uint64_t)&v84, v43);
        uint64_t v39 = (double *)__src;
        double v37 = v83;
      }
      else
      {
        uint64_t v44 = 0;
      }
      uint64_t v45 = (double *)&v44[16 * v40];
      *uint64_t v45 = v30;
      v45[1] = v29;
      uint64_t v46 = v45;
      if (v37 != v39)
      {
        do
        {
          *((_OWORD *)v46 - 1) = *((_OWORD *)v37 - 1);
          v46 -= 2;
          v37 -= 2;
        }
        while (v37 != v39);
        uint64_t v39 = (double *)__src;
      }
      uint64_t v38 = (uint64_t)(v45 + 2);
      __src = v46;
      double v83 = v45 + 2;
      double v84 = (double *)&v44[16 * v43];
      if (v39) {
        operator delete(v39);
      }
    }
    else
    {
      *double v83 = v30;
      v37[1] = v29;
      uint64_t v38 = (uint64_t)(v37 + 2);
    }
    double v83 = (double *)v38;
    ++v28;
  }
  while (v28 != 16);
  std::string __dst = 0;
  uint64_t v81 = 0;
  uint64_t v79 = 0;
  sub_1003746B0(&v79, (char *)__src + 128, v38, (v38 - ((uint64_t)__src + 128)) >> 4);
  sub_10037472C((uint64_t)&v79, (uint64_t)__dst, (char *)__src, (char *)__src + 128, 8);
  if ((unsigned char *)__dst - (unsigned char *)v79 != 256) {
    __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]", "NRBYRangeBiasEstimator.mm", 789, "calculatedFftCir16ptShifted.size() == kDimFft");
  }
  float64_t v47 = 0.0;
  uint64_t v48 = 0;
  float64x2_t v77 = 0uLL;
  v78 = 0;
  do
  {
    double v49 = (char *)v79 + 16 * dword_1004C3C90[v48];
    if (*(void *)&v47 >= (unint64_t)v78)
    {
      uint64_t v50 = (uint64_t)(*(void *)&v47 - *(void *)&v77.f64[0]) >> 4;
      if ((unint64_t)(v50 + 1) >> 60) {
        sub_1000267C4();
      }
      unint64_t v51 = (uint64_t)&v78[-*(void *)&v77.f64[0]] >> 3;
      if (v51 <= v50 + 1) {
        unint64_t v51 = v50 + 1;
      }
      if ((unint64_t)&v78[-*(void *)&v77.f64[0]] >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v52 = v51;
      }
      if (v52) {
        char v53 = (char *)sub_10015344C((uint64_t)&v78, v52);
      }
      else {
        char v53 = 0;
      }
      long long v54 = &v53[16 * v50];
      *(_OWORD *)long long v54 = *v49;
      float64_t v55 = v77.f64[1];
      float64_t v56 = v77.f64[0];
      double v57 = v54;
      if (*(void *)&v77.f64[1] != *(void *)&v77.f64[0])
      {
        do
        {
          *((_OWORD *)v57 - 1) = *(_OWORD *)(*(void *)&v55 - 16);
          v57 -= 16;
          *(void *)&v55 -= 16;
        }
        while (*(void *)&v55 != *(void *)&v56);
        float64_t v55 = v77.f64[0];
      }
      *(void *)&float64_t v47 = v54 + 16;
      *(void *)&v77.f64[0] = v57;
      *(void *)&v77.f64[1] = v54 + 16;
      v78 = &v53[16 * v52];
      if (v55 != 0.0) {
        operator delete(*(void **)&v55);
      }
    }
    else
    {
      **(_OWORD **)&float64_t v47 = *v49;
      *(void *)&v47 += 16;
    }
    v77.f64[1] = v47;
    ++v48;
  }
  while (v48 != 7);
  float64_t v58 = v77.f64[0];
  long long v76 = *(_OWORD *)(*(void *)&v77.f64[0] + 48);
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  if (*(void *)&v47 == *(void *)&v58) {
    goto LABEL_85;
  }
  unint64_t v59 = 0;
  float64_t v47 = v58;
  do
  {
    if (hypot(*(long double *)&v76, *((long double *)&v76 + 1)) == 0.0) {
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]", "NRBYRangeBiasEstimator.mm", 804, "std::abs(peakCir) != 0");
    }
    double v60 = sub_1003738DC((double *)(*(void *)&v47 + 16 * v59), (long double *)&v76);
    long double v62 = hypot(v60, v61);
    if (v62 == 0.0) {
      __assert_rtn("-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]", "NRBYRangeBiasEstimator.mm", 806, "normalizedFftMagnitude != 0");
    }
    double v63 = log10(v62) * 20.0;
    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      uint64_t v67 = retstr->var0;
      uint64_t v68 = var1 - retstr->var0;
      unint64_t v69 = v68 + 1;
      if ((unint64_t)(v68 + 1) >> 61) {
        sub_1000267C4();
      }
      uint64_t v70 = (char *)var0 - (char *)v67;
      if (v70 >> 2 > v69) {
        unint64_t v69 = v70 >> 2;
      }
      if ((unint64_t)v70 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v71 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v71 = v69;
      }
      if (v71)
      {
        v72 = (char *)sub_100056BF0((uint64_t)&retstr->var2, v71);
        uint64_t v67 = retstr->var0;
        var1 = retstr->var1;
      }
      else
      {
        v72 = 0;
      }
      v73 = (double *)&v72[8 * v68];
      double *v73 = v63;
      uint64_t v66 = v73 + 1;
      while (var1 != v67)
      {
        uint64_t v74 = *((void *)var1-- - 1);
        *((void *)v73-- - 1) = v74;
      }
      retstr->var0 = v73;
      retstr->var1 = v66;
      retstr->var2.var0 = (double *)&v72[8 * v71];
      if (v67) {
        operator delete(v67);
      }
    }
    else
    {
      double *var1 = v63;
      uint64_t v66 = var1 + 1;
    }
    retstr->var1 = v66;
    ++v59;
    float64_t v47 = v77.f64[0];
  }
  while (v59 < (uint64_t)(*(void *)&v77.f64[1] - *(void *)&v77.f64[0]) >> 4);
  if (*(void *)&v77.f64[0])
  {
LABEL_85:
    v77.f64[1] = v47;
    operator delete(*(void **)&v47);
  }
  if (v79)
  {
    std::string __dst = v79;
    operator delete(v79);
  }
  if (__src)
  {
    double v83 = (double *)__src;
    operator delete(__src);
  }
  if (__p)
  {
    double v86 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

- (id)scaleCirValuesIfRequired:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)sub_100007D00() + 186);
  if (!v5)
  {
    id v3 = [v4 copy];
    goto LABEL_16;
  }
  if (v5 == 2)
  {
    double v32 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bias-est, Unknown platform", v34, 2u);
    }
    goto LABEL_15;
  }
  if (v5 != 1) {
    goto LABEL_16;
  }
  uint64_t v6 = 0;
  float v7 = 0.0;
  float v8 = 0.0;
  do
  {
    double v9 = [v4 objectAtIndexedSubscript:v6];
    int v10 = [v9 real];
    [v10 doubleValue];
    double v12 = v11;

    unint64_t v13 = [v4 objectAtIndexedSubscript:v6];
    uint64_t v14 = [v13 imag];
    [v14 doubleValue];
    float v8 = fmax(fabs(v12), v8);
    float v7 = fmax(fabs(v15), v7);

    ++v6;
  }
  while (v6 != 8);
  float v16 = fmaxf(v8, v7);
  if (v16 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_1004350EC();
    }
LABEL_15:
    id v3 = 0;
    goto LABEL_16;
  }
  id v17 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v18 = 0;
  double v19 = (float)(32767.0 / v16);
  do
  {
    uint64_t v20 = [v4 objectAtIndexedSubscript:v18];
    unint64_t v21 = [v20 real];
    [v21 doubleValue];
    double v23 = v22;

    BOOL v24 = [v4 objectAtIndexedSubscript:v18];
    unsigned int v25 = [v24 imag];
    [v25 doubleValue];
    double v27 = v26;

    uint64_t v28 = [Complex alloc];
    double v29 = +[NSNumber numberWithDouble:v23 * v19];
    double v30 = +[NSNumber numberWithDouble:v27 * v19];
    int v31 = [(Complex *)v28 initWithRealPart:v29 imagPart:v30];
    [v17 addObject:v31];

    ++v18;
  }
  while (v18 != 8);
  id v3 = [v17 copy];

LABEL_16:

  return v3;
}

- (NSNumber)biasCorrectionEstimate
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBiasCorrectionEstimate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biasCorrectionEstimate, 0);
  objc_storeStrong((id *)&self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2, 0);
  objc_storeStrong((id *)&self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1, 0);
  p_dataTranformerResources = (NIMLModelResourcePackage *)&self->_modelResourcePackage.dataTranformerResources;
  sub_100374320((void ***)&p_dataTranformerResources);
  p_dataTranformerResources = &self->_modelResourcePackage;
  sub_100374320((void ***)&p_dataTranformerResources);
  objc_storeStrong((id *)&self->_remoteTxAntennaMask, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end