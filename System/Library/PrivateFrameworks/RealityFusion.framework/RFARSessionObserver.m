@interface RFARSessionObserver
- (BOOL)pinchLeft;
- (BOOL)pinchRight;
- (OS_dispatch_group)dispatchGroup;
- (OS_dispatch_queue)backgroundComputeQueue;
- (RFARSessionObserver)init;
- (id).cxx_construct;
- (void)dealloc;
- (void)processAddedAnchors:(id)a3;
- (void)processRemovedAnchors:(id)a3;
- (void)processUpdatedAnchors:(id)a3;
- (void)processUpdatedExternalAnchors:(id)a3;
- (void)session:(id)a3 didAddAnchors:(id)a4;
- (void)session:(id)a3 didRemoveAnchors:(id)a4;
- (void)session:(id)a3 didUpdateAnchors:(id)a4;
- (void)session:(id)a3 didUpdateExternalAnchors:(id)a4;
- (void)setBackgroundComputeQueue:(id)a3;
- (void)setCallback:(function<void (rf::data_flow::provider::InputData)&&;
- (void)setDispatchGroup:(id)a3;
- (void)updateSession:(id)a3 withTime:(double)a4;
@end

@implementation RFARSessionObserver

- (RFARSessionObserver)init
{
  v3.receiver = self;
  v3.super_class = (Class)RFARSessionObserver;
  return [(RFARSessionObserver *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RFARSessionObserver;
  [(RFARSessionObserver *)&v2 dealloc];
}

- (void)processAddedAnchors:(id)a3
{
  id v4 = a3;
  v5 = *((void *)self + 21);
  v6 = *((void *)self + 22);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__RFARSessionObserver_processAddedAnchors___block_invoke;
  v8[3] = &unk_264C683C0;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_group_async(v5, v6, v8);
}

void __43__RFARSessionObserver_processAddedAnchors___block_invoke(uint64_t a1)
{
  void (**v10)(long long *__return_ptr);
  void *v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  void (*v17)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  id **v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  ARAnchor *v25;
  rf *v26;
  NSObject *v27;
  void **v28;
  void *p_p;
  uint64_t v30;
  long long v32;
  uint64_t v33;
  long long *v34;
  char v35;
  uint64_t v36;
  id **v37;
  unsigned char *v38;
  void (**v39)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  void *__p;
  char v41;
  char v42;
  void *v43[2];
  uint64_t v44;
  unsigned char v45[16];
  uint64_t v46;
  uint64_t v47;
  void **v48;
  char v49;
  uint64_t (*v50)(_anonymous_namespace_ *, ARAnchor *);
  uint64_t v51;
  id **v52;
  char v53;
  void (*v54)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  char v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  long long v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  void v66[4];
  long long v67;
  long long v68;
  long long v69;
  long long v70;
  _OWORD v71[6];
  uint64_t v72;
  char v73;
  char v74;
  __int16 v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  long long v86;
  long long v87;
  long long v88;
  long long v89;
  long long v90;
  long long v91;
  long long v92;
  long long v93;
  long long v94;
  long long v95;
  long long v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  long long v100;
  long long v101;
  long long v102;
  long long v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  __int16 v114;
  char v115;
  char v116;
  char v117;
  char v118;
  char v119;
  char v120;
  char v121;
  void v122[3];
  char v123;
  unsigned char buf[12];
  __int16 v125;
  void *v126;
  uint64_t v127;

  v127 = *MEMORY[0x263EF8340];
  v73 = 0;
  v74 = 0;
  v75 = 0;
  v97 = 0;
  v99 = 0;
  v98 = 0;
  v105 = 0;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v111 = 0;
  v112 = 0;
  v113 = 0;
  v114 = 0;
  v115 = 0;
  v116 = 0;
  v117 = 0;
  v118 = 0;
  v119 = 0;
  v120 = 0;
  v121 = 0;
  v72 = 0;
  memset(v71, 0, sizeof(v71));
  v70 = 0u;
  v69 = 0u;
  v68 = 0u;
  v67 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  objc_super v2 = (void **)(a1 + 32);
  v1 = *(void **)(a1 + 32);
  v96 = 0u;
  v104 = 0;
  v103 = 0u;
  v102 = 0u;
  v101 = 0u;
  v100 = 0u;
  uint64_t v3 = [v1 count];
  v66[0] = &unk_26E8F3C48;
  v66[3] = v66;
  std::function<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::operator()((uint64_t)&v56, (uint64_t)v66, *v2);
  std::vector<rf::data_flow::provider::InputMesh>::__vdeallocate((void **)&v67);
  v67 = v56;
  *(void *)&v68 = v57;
  *(void *)&v57 = 0;
  v56 = 0uLL;
  rf::data_flow::provider::InputData::~InputData((void **)&v56);
  v46 = 0;
  v47 = v3;
  v48 = v2;
  v49 = 1;
  LOBYTE(v51) = 0;
  v53 = 0;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v45);
  uint64_t v4 = v51;
  v5 = v52;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v45);
  uint64_t v6 = v47;
  v43[1] = 0;
  v44 = 0;
  v43[0] = 0;
  *((void *)&v56 + 1) = v5;
  *(void *)&v57 = v45;
  *((void *)&v57 + 1) = &v54;
  if (v47 != v4)
  {
    unint64_t v7 = 0;
    uint64_t v8 = v4;
    do
    {
      *(void *)&v56 = v8 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v57, (uint64_t)&v56);
      ++v7;
      uint64_t v8 = v56;
    }
    while (v6 != (void)v56);
    __p = v43;
    v41 = 0;
    std::vector<rf::data_flow::EnvironmentProbe>::__vallocate[abi:ne180100](v43, v7);
    v36 = v4;
    v37 = v5;
    v38 = v45;
    v39 = &v54;
    *(void **)&v32 = v43[1];
    *(void **)buf = v43[1];
    v122[0] = &v44;
    v122[1] = buf;
    v122[2] = &v32;
    id v9 = v43[1];
    v123 = 0;
    do
    {
      v10 = (void (**)(long long *__return_ptr))v39;
      v11 = [**v37 objectAtIndexedSubscript:(int)v4];
      (*v10)(&v56);

      v12 = v56;
      v13 = v58;
      v9[1] = v57;
      v9[2] = v13;
      *id v9 = v12;
      v14 = v59;
      v15 = v60;
      v16 = v62;
      v9[5] = v61;
      v9[6] = v16;
      v9[3] = v14;
      v9[4] = v15;
      *((unsigned char *)v9 + 112) = 0;
      *((unsigned char *)v9 + 120) = 0;
      if (v64)
      {
        *((void *)v9 + 14) = v63;
        *((unsigned char *)v9 + 120) = 1;
      }
      *((void *)v9 + 16) = v65;
      v36 = v4 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v38, (uint64_t)&v36);
      id v9 = (_OWORD *)(v32 + 144);
      *(void *)&v32 = v32 + 144;
      uint64_t v4 = v36;
    }
    while (v6 != v36);
    v123 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<rf::data_flow::EnvironmentProbe>,rf::data_flow::EnvironmentProbe*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v122);
    v43[1] = v9;
  }
  std::vector<rf::data_flow::EnvironmentProbe>::__vdeallocate((uint64_t *)&v76);
  v76 = *(_OWORD *)v43;
  *(void *)&v77 = v44;
  v43[1] = 0;
  v44 = 0;
  v43[0] = 0;
  *(void *)&v56 = v43;
  std::vector<rf::data_flow::EnvironmentProbe>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  v17 = (void (*)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>))*(id *)(a1 + 40);
  v46 = 0;
  v47 = v3;
  v48 = v2;
  v49 = 1;
  LOBYTE(v51) = 0;
  v53 = 0;
  v54 = v17;
  v55 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v45);
  v19 = v51;
  v18 = v52;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v45);
  v20 = v47;
  v33 = 0;
  v32 = 0uLL;
  *((void *)&v56 + 1) = v18;
  *(void *)&v57 = v45;
  *((void *)&v57 + 1) = &v54;
  if (v47 != v19)
  {
    v21 = 0;
    v22 = v19;
    do
    {
      *(void *)&v56 = v22 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v57, (uint64_t)&v56);
      ++v21;
      v22 = v56;
    }
    while (v20 != (void)v56);
    v34 = &v32;
    v35 = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v32, v21);
    v23 = 0;
    v36 = v19;
    v37 = v18;
    v38 = v45;
    v39 = &v54;
    v24 = *((void *)&v32 + 1);
    do
    {
      v25 = [**v37 objectAtIndexedSubscript:(int)v19];
      v26 = (rf *)rf::data_flow::validateAnchor((uint64_t)&v56);
      v27 = rf::realityFusionLogObject(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        rf::helpers::getDebugDescriptionForAnchorType((uint64_t)&v56, v43);
        if (v44 >= 0) {
          v28 = v43;
        }
        else {
          v28 = (void **)v43[0];
        }
        rf::helpers::getRFUUIDFromAnchor((uint64_t)&v56, (uint64_t)v122);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v122, &__p);
        p_p = &__p;
        if (v42 < 0) {
          p_p = __p;
        }
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v28;
        v125 = 2080;
        v126 = p_p;
        _os_log_impl(&dword_235A7C000, v27, OS_LOG_TYPE_DEFAULT, "RFARSessionObserver: Adding %s anchor %s", buf, 0x16u);
        if (v42 < 0) {
          operator delete(__p);
        }
        if (SHIBYTE(v44) < 0) {
          operator delete(v43[0]);
        }
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v24 + v23, (uint64_t)&v56);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v56);
      v36 = v19 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ43__RFARSessionObserver_processAddedAnchors__EUb_E3__0EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v38, (uint64_t)&v36);
      v19 = v36;
      v23 += 272;
    }
    while (v20 != v36);
    *((void *)&v32 + 1) = v24 + v23;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)v71 + 1);
  *(_OWORD *)((char *)v71 + 8) = v32;
  *((void *)&v71[1] + 1) = v33;
  v33 = 0;
  v32 = 0uLL;
  *(void *)&v56 = &v32;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v56);
  if (v55) {

  }
  v30 = *(void *)(*(void *)(a1 + 40) + 32);
  if (!v30) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, long long *))(*(void *)v30 + 48))(v30, &v67);
  std::__function::__value_func<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::~__value_func[abi:ne180100](v66);
  rf::data_flow::provider::InputData::~InputData((void **)&v67);
}

- (void)processUpdatedAnchors:(id)a3
{
  id v4 = a3;
  v5 = *((void *)self + 21);
  uint64_t v6 = *((void *)self + 22);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__RFARSessionObserver_processUpdatedAnchors___block_invoke;
  v8[3] = &unk_264C683C0;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  dispatch_group_async(v5, v6, v8);
}

void __45__RFARSessionObserver_processUpdatedAnchors___block_invoke(uint64_t a1)
{
  void (**v11)(long long *__return_ptr);
  void *v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  void (*v18)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  void *v19;
  id **v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  ARAnchor *v26;
  uint64_t v27;
  long long v28;
  void v29[3];
  char v30;
  long long v31;
  unsigned char *v32;
  void (**v33)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id **v37;
  uint64_t *v38;
  void (**v39)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  unsigned char v40[16];
  uint64_t v41;
  uint64_t v42;
  void **v43;
  char v44;
  uint64_t (*v45)(_anonymous_namespace_ *, ARAnchor *);
  char *v46;
  id **v47;
  char v48;
  void (*v49)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>);
  char v50;
  long long v51;
  _OWORD v52[6];
  uint64_t v53;
  char v54;
  uint64_t v55;
  void v56[4];
  _OWORD v57[6];
  long long v58;
  long long v59;
  long long v60;
  long long v61;
  uint64_t v62;
  char v63;
  char v64;
  __int16 v65;
  long long v66;
  uint64_t v67[4];
  long long v68;
  long long v69;
  long long v70;
  long long v71;
  long long v72;
  long long v73;
  long long v74;
  long long v75;
  long long v76;
  long long v77;
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  long long v89;
  long long v90;
  long long v91;
  long long v92;
  char v93;
  char v94;
  char v95;
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  __int16 v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  uint64_t v111;

  v111 = *MEMORY[0x263EF8340];
  v63 = 0;
  v64 = 0;
  v65 = 0;
  v86 = 0;
  v88 = 0;
  v87 = 0;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  v100 = 0;
  v101 = 0;
  v102 = 0;
  v103 = 0;
  v104 = 0;
  v105 = 0;
  v106 = 0;
  v107 = 0;
  v108 = 0;
  v109 = 0;
  v110 = 0;
  v62 = 0;
  v61 = 0u;
  v60 = 0u;
  v59 = 0u;
  v58 = 0u;
  v66 = 0u;
  memset(v67, 0, sizeof(v67));
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  uint64_t v3 = (void **)(a1 + 32);
  objc_super v2 = *(void **)(a1 + 32);
  memset(v57, 0, sizeof(v57));
  v93 = 0;
  v92 = 0u;
  v91 = 0u;
  v90 = 0u;
  v89 = 0u;
  uint64_t v4 = [v2 count];
  v56[0] = &unk_26E8F3CD8;
  v56[3] = v56;
  std::function<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::operator()((uint64_t)&v51, (uint64_t)v56, *v3);
  std::vector<rf::data_flow::provider::InputMesh>::__vdeallocate((void **)&v57[1] + 1);
  *(_OWORD *)((char *)&v57[1] + 8) = *(_OWORD *)((char *)v52 + 8);
  *((void *)&v57[2] + 1) = *((void *)&v52[1] + 1);
  memset((char *)v52 + 8, 0, 24);
  rf::data_flow::provider::InputData::~InputData((void **)&v51);
  v41 = 0;
  v42 = v4;
  v43 = v3;
  v44 = 1;
  LOBYTE(v46) = 0;
  v48 = 0;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v40);
  v5 = v46;
  uint64_t v6 = v47;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v40);
  uint64_t v7 = v42;
  v29[0] = 0;
  v28 = 0uLL;
  *((void *)&v51 + 1) = v6;
  *(void *)&v52[0] = v40;
  *((void *)&v52[0] + 1) = &v49;
  if ((char *)v42 != v5)
  {
    unint64_t v8 = 0;
    id v9 = v5;
    do
    {
      *(void *)&v51 = v9 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(*(uint64_t *)&v52[0], (uint64_t)&v51);
      ++v8;
      id v9 = (char *)v51;
    }
    while (v7 != (void)v51);
    v29[2] = &v28;
    v30 = 0;
    std::vector<rf::data_flow::EnvironmentProbe>::__vallocate[abi:ne180100](&v28, v8);
    *(void *)&v31 = v5;
    *((void *)&v31 + 1) = v6;
    v32 = v40;
    v33 = &v49;
    v34 = *((void *)&v28 + 1);
    v35 = *((void *)&v28 + 1);
    v36 = v29;
    v37 = (id **)&v34;
    v38 = &v35;
    uint64_t v10 = *((void *)&v28 + 1);
    LOBYTE(v39) = 0;
    do
    {
      v11 = (void (**)(long long *__return_ptr))v33;
      v12 = objc_msgSend(***((id ***)&v31 + 1), "objectAtIndexedSubscript:", (int)v5, (void)v28);
      (*v11)(&v51);

      v13 = v51;
      v14 = v52[1];
      *(_OWORD *)(v10 + 16) = v52[0];
      *(_OWORD *)(v10 + 32) = v14;
      *(_OWORD *)uint64_t v10 = v13;
      v15 = v52[2];
      v16 = v52[3];
      v17 = v52[5];
      *(_OWORD *)(v10 + 80) = v52[4];
      *(_OWORD *)(v10 + 96) = v17;
      *(_OWORD *)(v10 + 48) = v15;
      *(_OWORD *)(v10 + 64) = v16;
      *(unsigned char *)(v10 + 112) = 0;
      *(unsigned char *)(v10 + 120) = 0;
      if (v54)
      {
        *(void *)(v10 + 112) = v53;
        *(unsigned char *)(v10 + 120) = 1;
      }
      *(void *)(v10 + 128) = v55;
      *(void *)&v31 = v5 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v32, (uint64_t)&v31);
      uint64_t v10 = v35 + 144;
      v35 += 144;
      v5 = (char *)v31;
    }
    while (v7 != (void)v31);
    LOBYTE(v39) = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<rf::data_flow::EnvironmentProbe>,rf::data_flow::EnvironmentProbe*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&v36);
    *((void *)&v28 + 1) = v10;
  }
  std::vector<rf::data_flow::EnvironmentProbe>::__vdeallocate(&v67[1]);
  *(_OWORD *)&v67[1] = v28;
  v67[3] = v29[0];
  v29[0] = 0;
  v28 = 0uLL;
  *(void *)&v51 = &v28;
  std::vector<rf::data_flow::EnvironmentProbe>::__destroy_vector::operator()[abi:ne180100]((void ***)&v51);
  v18 = (void (*)(_anonymous_namespace_ *@<X0>, uint64_t@<X8>))*(id *)(a1 + 40);
  v41 = 0;
  v42 = v4;
  v43 = v3;
  v44 = 1;
  LOBYTE(v46) = 0;
  v48 = 0;
  v49 = v18;
  v50 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v40);
  v19 = v46;
  v20 = v47;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v40);
  v21 = (void *)v42;
  v32 = 0;
  v31 = 0uLL;
  *((void *)&v51 + 1) = v20;
  *(void *)&v52[0] = v40;
  *((void *)&v52[0] + 1) = &v49;
  if ((void *)v42 != v19)
  {
    v22 = 0;
    v23 = v19;
    do
    {
      *(void *)&v51 = (char *)v23 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(*(uint64_t *)&v52[0], (uint64_t)&v51);
      ++v22;
      v23 = (void *)v51;
    }
    while (v21 != (void *)v51);
    *(void *)&v28 = &v31;
    BYTE8(v28) = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v31, v22);
    v24 = 0;
    v36 = v19;
    v37 = v20;
    v38 = (uint64_t *)v40;
    v39 = &v49;
    v25 = *((void *)&v31 + 1);
    do
    {
      v26 = [**v37 objectAtIndexedSubscript:(int)v19];
      rf::data_flow::validateAnchor((uint64_t)&v51);

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v25 + v24, (uint64_t)&v51);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v51);
      v36 = (void *)((char *)v19 + 1);
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processUpdatedAnchors__EUb0_E3__2EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v38, (uint64_t)&v36);
      v19 = v36;
      v24 += 272;
    }
    while (v21 != v36);
    *((void *)&v31 + 1) = v25 + v24;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)&v58);
  v58 = v31;
  *(void *)&v59 = v32;
  v32 = 0;
  v31 = 0uLL;
  *(void *)&v51 = &v31;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v51);
  if (v50) {

  }
  v27 = *(void *)(*(void *)(a1 + 40) + 32);
  if (!v27) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, _OWORD *))(*(void *)v27 + 48))(v27, v57);
  std::__function::__value_func<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::~__value_func[abi:ne180100](v56);
  rf::data_flow::provider::InputData::~InputData((void **)v57);
}

- (void)processRemovedAnchors:(id)a3
{
  id v4 = a3;
  v5 = *((void *)self + 21);
  uint64_t v6 = *((void *)self + 22);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__RFARSessionObserver_processRemovedAnchors___block_invoke;
  v8[3] = &unk_264C683C0;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_group_async(v5, v6, v8);
}

void __45__RFARSessionObserver_processRemovedAnchors___block_invoke(uint64_t a1)
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  char v78 = 0;
  char v79 = 0;
  __int16 v80 = 0;
  uint64_t v102 = 0;
  uint64_t v104 = 0;
  uint64_t v103 = 0;
  char v110 = 0;
  char v111 = 0;
  char v112 = 0;
  char v113 = 0;
  char v114 = 0;
  char v115 = 0;
  char v116 = 0;
  char v117 = 0;
  char v118 = 0;
  __int16 v119 = 0;
  char v120 = 0;
  char v121 = 0;
  char v122 = 0;
  char v123 = 0;
  char v124 = 0;
  char v125 = 0;
  char v126 = 0;
  uint64_t v77 = 0;
  memset(v76, 0, sizeof(v76));
  long long v75 = 0u;
  long long v74 = 0u;
  long long v73 = 0u;
  *(_OWORD *)__p = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v3 = (void **)(a1 + 32);
  objc_super v2 = *(void **)(a1 + 32);
  memset(v71, 0, sizeof(v71));
  char v109 = 0;
  long long v108 = 0u;
  long long v107 = 0u;
  long long v106 = 0u;
  long long v105 = 0u;
  uint64_t v4 = [v2 count];
  v70[0] = &unk_26E8F3D58;
  v70[3] = v70;
  std::function<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::operator()((uint64_t)&v60, (uint64_t)v70, *v3);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  *(_OWORD *)__p = v66;
  *(void *)&long long v73 = v67;
  v67 = 0;
  long long v66 = 0uLL;
  rf::data_flow::provider::InputData::~InputData((void **)&v60);
  v63 = 0;
  uint64_t v64 = v4;
  v65 = v3;
  LOBYTE(v66) = 1;
  LOBYTE(v67) = 0;
  char v69 = 0;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v61);
  uint64_t v6 = v67;
  v5 = v68;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v61);
  id v7 = (char *)v64;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  v46 = 0;
  *((void *)&v49 + 1) = v5;
  *(void *)&long long v50 = &v61;
  if ((_OWORD *)v64 == v6)
  {
    uint64_t v8 = 0;
  }
  else
  {
    unint64_t v9 = 0;
    uint64_t v10 = v6;
    do
    {
      *(void *)&long long v49 = (char *)v10 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v50, (uint64_t)&v49);
      ++v9;
      uint64_t v10 = (_OWORD *)v49;
    }
    while (v7 != (char *)v49);
    std::vector<rf::data_flow::RFUUID>::__vallocate[abi:ne180100](&v46, v9);
    uint64_t v11 = 0;
    v43 = v5;
    v44 = &v61;
    uint64_t v12 = v47;
    *(void *)&long long v13 = 136315138;
    long long v36 = v13;
    do
    {
      v14 = objc_msgSend(**v43, "objectAtIndexedSubscript:", (int)v6, v36);
      v15 = [v14 identifier];
      rf::data_flow::RFUUID::copy(v15, (uint64_t)&v49);

      v17 = rf::realityFusionLogObject(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)&v49, v127);
        v20 = v127;
        if (v128 < 0) {
          v20 = (void **)v127[0];
        }
        *(_DWORD *)buf = v36;
        *(void *)&buf[4] = v20;
        _os_log_debug_impl(&dword_235A7C000, v17, OS_LOG_TYPE_DEBUG, "RFARSessionObserver: Removing probe %s", buf, 0xCu);
        if (v128 < 0) {
          operator delete(v127[0]);
        }
      }

      v18 = (_OWORD *)(v12 + v11);
      long long v19 = v50;
      _OWORD *v18 = v49;
      v18[1] = v19;
      v42 = (char *)v6 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v44, (uint64_t)&v42);
      uint64_t v6 = v42;
      v11 += 32;
    }
    while (v7 != v42);
    uint64_t v8 = v12 + v11;
    uint64_t v47 = v12 + v11;
  }
  if ((void)v84)
  {
    *((void *)&v84 + 1) = v84;
    operator delete((void *)v84);
    uint64_t v8 = v47;
  }
  *(void *)&long long v84 = v46;
  *((void *)&v84 + 1) = v8;
  *(void *)&long long v85 = v48;
  id v21 = *(id *)(a1 + 40);
  *((void *)&v50 + 1) = 0;
  v51 = (char *)v4;
  v52 = v3;
  char v53 = 1;
  LOBYTE(v55) = 0;
  char v57 = 0;
  id v58 = v21;
  char v59 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v49 + 8);
  v23 = v55;
  v22 = v56;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)&v49 + 8);
  v24 = v51;
  uint64_t v39 = 0;
  long long v38 = 0uLL;
  v61 = v22;
  uint64_t v62 = (uint64_t)&v49 + 8;
  v63 = &v58;
  if (v51 != v23)
  {
    unint64_t v25 = 0;
    v26 = v23;
    do
    {
      v60 = v26 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE(v62, (uint64_t)&v60);
      ++v25;
      v26 = v60;
    }
    while (v24 != v60);
    v40 = &v38;
    char v41 = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v38, v25);
    uint64_t v27 = 0;
    v42 = v23;
    v43 = v22;
    v44 = (id ***)&v49 + 1;
    v45 = &v58;
    uint64_t v28 = *((void *)&v38 + 1);
    *(void *)&long long v29 = 136315394;
    long long v37 = v29;
    do
    {
      objc_msgSend(**v43, "objectAtIndexedSubscript:", (int)v23, v37);
      v30 = (ARAnchor *)objc_claimAutoreleasedReturnValue();
      v31 = (rf *)rf::data_flow::validateAnchor((uint64_t)&v60);
      v32 = rf::realityFusionLogObject(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        rf::helpers::getDebugDescriptionForAnchorType((uint64_t)&v60, &v46);
        if (v48 >= 0) {
          v33 = &v46;
        }
        else {
          v33 = v46;
        }
        rf::helpers::getRFUUIDFromAnchor((uint64_t)&v60, (uint64_t)v127);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v127, buf);
        v34 = buf;
        if (v130 < 0) {
          v34 = *(unsigned char **)buf;
        }
        *(_DWORD *)v131 = v37;
        v132 = v33;
        __int16 v133 = 2080;
        v134 = v34;
        _os_log_debug_impl(&dword_235A7C000, v32, OS_LOG_TYPE_DEBUG, "RFARSessionObserver: Removing %s anchor %s", v131, 0x16u);
        if (v130 < 0) {
          operator delete(*(void **)buf);
        }
        if (SHIBYTE(v48) < 0) {
          operator delete(v46);
        }
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v28 + v27, (uint64_t)&v60);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v60);
      v42 = v23 + 1;
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ45__RFARSessionObserver_processRemovedAnchors__EUb1_E3__4EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v44, (uint64_t)&v42);
      v23 = v42;
      v27 += 272;
    }
    while (v24 != v42);
    *((void *)&v38 + 1) = v28 + v27;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)v76 + 1);
  *(_OWORD *)((char *)v76 + 8) = v38;
  *((void *)&v76[1] + 1) = v39;
  uint64_t v39 = 0;
  long long v38 = 0uLL;
  v60 = (char *)&v38;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v60);
  if (v59) {

  }
  uint64_t v35 = *(void *)(*(void *)(a1 + 40) + 32);
  if (!v35) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, _OWORD *))(*(void *)v35 + 48))(v35, v71);
  std::__function::__value_func<rf::data_flow::provider::InputData ()(NSArray<ARAnchor *> *)>::~__value_func[abi:ne180100](v70);
  rf::data_flow::provider::InputData::~InputData((void **)v71);
}

- (void)processUpdatedExternalAnchors:(id)a3
{
  id v4 = a3;
  v5 = *((void *)self + 21);
  uint64_t v6 = *((void *)self + 22);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__RFARSessionObserver_processUpdatedExternalAnchors___block_invoke;
  v8[3] = &unk_264C683C0;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_group_async(v5, v6, v8);
}

void __53__RFARSessionObserver_processUpdatedExternalAnchors___block_invoke(uint64_t a1)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  char v48 = 0;
  char v49 = 0;
  __int16 v50 = 0;
  uint64_t v72 = 0;
  uint64_t v74 = 0;
  uint64_t v73 = 0;
  char v80 = 0;
  char v81 = 0;
  char v82 = 0;
  char v83 = 0;
  char v84 = 0;
  char v85 = 0;
  char v86 = 0;
  char v87 = 0;
  char v88 = 0;
  __int16 v89 = 0;
  char v90 = 0;
  char v91 = 0;
  char v92 = 0;
  char v93 = 0;
  char v94 = 0;
  char v95 = 0;
  char v96 = 0;
  uint64_t v47 = 0;
  long long v46 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v3 = a1 + 32;
  objc_super v2 = *(void **)(a1 + 32);
  memset(v45, 0, sizeof(v45));
  char v79 = 0;
  long long v78 = 0u;
  long long v77 = 0u;
  long long v76 = 0u;
  long long v75 = 0u;
  uint64_t v4 = [v2 count];
  uint64_t v5 = a1;
  id v6 = *(id *)(a1 + 40);
  v35[2] = 0;
  long long v36 = (void **)v4;
  uint64_t v37 = v3;
  char v38 = 1;
  LOBYTE(v40) = 0;
  char v42 = 0;
  id v43 = v6;
  char v44 = 1;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v35);
  uint64_t v8 = v40;
  id v7 = v41;
  _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE11cache_beginEv((uint64_t)v35);
  id v9 = v36;
  uint64_t v24 = 0;
  long long v23 = 0uLL;
  v97[1] = v7;
  long long v98 = v35;
  long long v99 = &v43;
  if (v36 == v8)
  {
    uint64_t v10 = a1;
  }
  else
  {
    unint64_t v11 = 0;
    uint64_t v12 = v8;
    do
    {
      v97[0] = (void **)((char *)v12 + 1);
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v98, (uint64_t)v97);
      ++v11;
      uint64_t v12 = v97[0];
    }
    while (v9 != v97[0]);
    unint64_t v25 = &v23;
    char v26 = 0;
    std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vallocate[abi:ne180100](&v23, v11);
    uint64_t v13 = 0;
    uint64_t v27 = v8;
    uint64_t v28 = (id **)v7;
    long long v29 = v35;
    v30 = &v43;
    uint64_t v14 = *((void *)&v23 + 1);
    *(void *)&long long v15 = 136315394;
    long long v22 = v15;
    uint64_t v10 = a1;
    do
    {
      objc_msgSend(**v28, "objectAtIndexedSubscript:", (int)v8, v22);
      v16 = (ARAnchor *)objc_claimAutoreleasedReturnValue();
      v17 = (rf *)rf::data_flow::validateAnchor((uint64_t)v97);
      v18 = rf::realityFusionLogObject(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        rf::helpers::getDebugDescriptionForAnchorType((uint64_t)v97, v33);
        if (v34 >= 0) {
          long long v19 = v33;
        }
        else {
          long long v19 = (void **)v33[0];
        }
        rf::helpers::getRFUUIDFromAnchor((uint64_t)v97, (uint64_t)v100);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v100, __p);
        v20 = __p;
        if (v32 < 0) {
          v20 = (void **)__p[0];
        }
        *(_DWORD *)buf = v22;
        uint64_t v102 = v19;
        __int16 v103 = 2080;
        uint64_t v104 = v20;
        _os_log_impl(&dword_235A7C000, v18, OS_LOG_TYPE_DEFAULT, "RFARSessionObserver: Marking %s anchor %s external", buf, 0x16u);
        if (v32 < 0) {
          operator delete(__p[0]);
        }
        uint64_t v10 = v5;
        if (v34 < 0) {
          operator delete(v33[0]);
        }
      }

      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v14 + v13, (uint64_t)v97);
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v97);
      uint64_t v27 = (void **)((char *)v8 + 1);
      _ZN6ranges14remove_if_viewINS_14transform_viewINS_9iota_viewImmEEZZ53__RFARSessionObserver_processUpdatedExternalAnchors__EUb2_E3__7EENS_14logical_negateIPFbP8ARAnchorEEEE15satisfy_forwardERNS_14basic_iteratorINS_14adaptor_cursorINSD_INS3_6cursorEEENS_19iter_transform_viewIS3_NS_10indirectedIS4_EEE7adaptorILb0EEEEEEE((uint64_t)v29, (uint64_t)&v27);
      uint64_t v8 = v27;
      v13 += 272;
    }
    while (v9 != v27);
    *((void *)&v23 + 1) = v14 + v13;
  }
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__vdeallocate((void **)&v46);
  long long v46 = v23;
  uint64_t v47 = v24;
  uint64_t v24 = 0;
  long long v23 = 0uLL;
  v97[0] = (void **)&v23;
  std::vector<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__destroy_vector::operator()[abi:ne180100](v97);
  if (v44) {

  }
  uint64_t v21 = *(void *)(*(void *)(v10 + 40) + 32);
  if (!v21) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, _OWORD *))(*(void *)v21 + 48))(v21, v45);
  rf::data_flow::provider::InputData::~InputData((void **)v45);
}

- (void)session:(id)a3 didAddAnchors:(id)a4
{
}

- (void)session:(id)a3 didUpdateAnchors:(id)a4
{
}

- (void)session:(id)a3 didRemoveAnchors:(id)a4
{
}

- (void)session:(id)a3 didUpdateExternalAnchors:(id)a4
{
}

- (void)setCallback:(function<void (rf::data_flow::provider::InputData)&&
{
  v10[3] = *MEMORY[0x263EF8340];
  f = (function<void (rf::data_flow::provider::InputData &&)> *)a3->__f_.__f_;
  if (f)
  {
    if (f == a3)
    {
      id v9 = v8;
      (*(void (**)(function<void (rf::data_flow::provider::InputData &&)> *, void *))(*(void *)a3->__f_.__buf_.__lx
                                                                                                 + 24))(a3, v8);
    }
    else
    {
      id v9 = (void *)(*(uint64_t (**)(function<void (rf::data_flow::provider::InputData &&)> *, SEL))(*(void *)f->__f_.__buf_.__lx + 16))(f, a2);
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v5 = (char *)self + 8;
  if (v8 != (void *)((char *)self + 8))
  {
    id v6 = v9;
    id v7 = (char *)*((void *)self + 4);
    if (v9 == v8)
    {
      if (v7 == v5)
      {
        (*(void (**)(void *, void *))(v8[0] + 24))(v8, v10);
        (*(void (**)(void *))(*v9 + 32))(v9);
        id v9 = 0;
        (*(void (**)(void, void *))(**((void **)self + 4) + 24))(*((void *)self + 4), v8);
        (*(void (**)(void))(**((void **)self + 4) + 32))(*((void *)self + 4));
        *((void *)self + 4) = 0;
        id v9 = v8;
        (*(void (**)(void *, char *))(v10[0] + 24))(v10, (char *)self + 8);
        (*(void (**)(void *))(v10[0] + 32))(v10);
      }
      else
      {
        (*(void (**)(void *, char *))(v8[0] + 24))(v8, (char *)self + 8);
        (*(void (**)(void *))(*v9 + 32))(v9);
        id v9 = (void *)*((void *)self + 4);
      }
      *((void *)self + 4) = v5;
    }
    else if (v7 == v5)
    {
      (*(void (**)(char *, void *))(*(void *)v5 + 24))((char *)self + 8, v8);
      (*(void (**)(void))(**((void **)self + 4) + 32))(*((void *)self + 4));
      *((void *)self + 4) = v9;
      id v9 = v8;
    }
    else
    {
      id v9 = (void *)*((void *)self + 4);
      *((void *)self + 4) = v6;
    }
  }
  std::__function::__value_func<void ()(rf::data_flow::provider::InputData &&)>::~__value_func[abi:ne180100](v8);
}

- (OS_dispatch_group)dispatchGroup
{
  return (OS_dispatch_group *)*((id *)self + 21);
}

- (void)updateSession:(id)a3 withTime:(double)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 96));
  uint64_t v7 = *((void *)self + 10);
  if (*((unsigned char *)self + 88)) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = v7 - 1;
    do
    {
      uint64_t v10 = rf::realityFusionLogObject(v6);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v11 = [*(id *)(*(void *)(*((void *)self + 6) + ((*((void *)self + 9) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((void *)self + 9) & 0x1FFLL)) identifier];
        id v12 = [v11 UUIDString];
        uint64_t v13 = [v12 UTF8String];
        *(_DWORD *)buf = 136315138;
        uint64_t v18 = v13;
        _os_log_impl(&dword_235A7C000, v10, OS_LOG_TYPE_DEFAULT, "RFARSessionObserver: Attempting to re-add anchor %s in queue to ARKit", buf, 0xCu);
      }
      [v5 addAnchor:*(void *)(*(void *)(*((void *)self + 6) + ((*((void *)self + 9) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((void *)self + 9) & 0x1FFLL))];
      objc_release(*(id *)(*(void *)(*((void *)self + 6) + ((*((void *)self + 9) >> 6) & 0x3FFFFFFFFFFFFF8))
                         + 8 * (*((void *)self + 9) & 0x1FFLL)));
      int64x2_t v14 = vaddq_s64(*(int64x2_t *)((char *)self + 72), (int64x2_t)xmmword_235AFA6C0);
      *(int64x2_t *)((char *)self + 72) = v14;
      if (v14.i64[0] >= 0x400uLL)
      {
        operator delete(**((void ***)self + 6));
        *((void *)self + 6) += 8;
        *((void *)self + 9) -= 512;
      }
      BOOL v16 = v9-- != 0;
    }
    while (*((unsigned char *)self + 88) && v16);
  }
  std::mutex::unlock((std::mutex *)((char *)self + 96));
}

- (void)setDispatchGroup:(id)a3
{
}

- (OS_dispatch_queue)backgroundComputeQueue
{
  return (OS_dispatch_queue *)*((void *)self + 22);
}

- (void)setBackgroundComputeQueue:(id)a3
{
}

- (BOOL)pinchLeft
{
  return *((unsigned char *)self + 161);
}

- (BOOL)pinchRight
{
  return *((unsigned char *)self + 162);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 22, 0);
  objc_storeStrong((id *)self + 21, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 96));
  uint64_t v3 = (void **)*((void *)self + 6);
  uint64_t v4 = (void **)*((void *)self + 7);
  if (v4 == v3)
  {
    id v5 = (void *)((char *)self + 80);
    uint64_t v4 = (void **)*((void *)self + 6);
  }
  else
  {
    id v5 = (void *)((char *)self + 80);
    unint64_t v6 = *((void *)self + 9);
    uint64_t v7 = &v3[v6 >> 9];
    BOOL v8 = (void **)((char *)*v7 + 8 * (v6 & 0x1FF));
    uint64_t v9 = *(uint64_t *)((char *)v3 + (((*((void *)self + 10) + v6) >> 6) & 0x3FFFFFFFFFFFFF8))
       + 8 * ((*((void *)self + 10) + v6) & 0x1FF);
    if (v8 != (void **)v9)
    {
      do
      {
        uint64_t v10 = *v8++;

        if ((char *)v8 - (unsigned char *)*v7 == 4096)
        {
          unint64_t v11 = (void **)v7[1];
          ++v7;
          BOOL v8 = v11;
        }
      }
      while (v8 != (void **)v9);
      uint64_t v3 = (void **)*((void *)self + 6);
      uint64_t v4 = (void **)*((void *)self + 7);
    }
  }
  void *v5 = 0;
  unint64_t v12 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      uint64_t v4 = (void **)*((void *)self + 7);
      uint64_t v3 = (void **)(*((void *)self + 6) + 8);
      *((void *)self + 6) = v3;
      unint64_t v12 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  unint64_t v13 = v12 >> 3;
  if (v13 == 1)
  {
    uint64_t v14 = 256;
    goto LABEL_14;
  }
  if (v13 == 2)
  {
    uint64_t v14 = 512;
LABEL_14:
    *((void *)self + 9) = v14;
  }
  if (v3 != v4)
  {
    do
    {
      long long v15 = *v3++;
      operator delete(v15);
    }
    while (v3 != v4);
    uint64_t v17 = *((void *)self + 6);
    uint64_t v16 = *((void *)self + 7);
    if (v16 != v17) {
      *((void *)self + 7) = v16 + ((v17 - v16 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  uint64_t v18 = (void *)*((void *)self + 5);
  if (v18) {
    operator delete(v18);
  }
  std::__function::__value_func<void ()(rf::data_flow::provider::InputData &&)>::~__value_func[abi:ne180100]((void *)self + 1);
}

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((void *)self + 12) = 850045863;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((void *)self + 19) = 0;
  return self;
}

@end