void sub_235AEA7EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,char a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *a51,uint64_t a52,int a53,__int16 a54,char a55,char a56)
{
  uint64_t v56;

  if (a46 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v56 - 185) < 0) {
    operator delete(*(void **)(v56 - 208));
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<std::string const,std::unordered_map<std::string,ARReferenceImage * {__strong}>>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::pair<std::string const,ARReferenceImage * {__strong}>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::function<void ()(NSSet<ARReferenceImage *> *)>::operator()(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *))(*(void *)v3 + 48))(v3, &v4);
}

void sub_235AEAAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, unint64_t *a8)
{
  LODWORD(v138) = a7;
  uint64_t v10 = a5;
  uint64_t ComponentByClass = a4;
  uint64_t v169 = *MEMORY[0x263EF8340];
  int v14 = *(unsigned __int8 *)(a1 + 408);
  int v15 = *(_DWORD *)(a6 + 2824);
  if (*(unsigned char *)(a1 + 408)) {
    BOOL v16 = v15 == 2;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    *(unsigned char *)(a1 + 409) = 1;
    rf::helpers::cacheAnchorBeforeTravelMode(a4, a5);
    int v14 = *(unsigned __int8 *)(a1 + 408);
    int v15 = *(_DWORD *)(a6 + 2824);
  }
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    *(unsigned char *)(a1 + 409) = 1;
    if (!ComponentByClass || REAnchoringComponentGetDescriptorType() != 1) {
      goto LABEL_31;
    }
    uint64_t v18 = v10;
    DescriptorCacheduint64_t AnchorIdentifier = (const unsigned __int8 *)REAnchoringComponentGetDescriptorCachedAnchorIdentifier();
    if (uuid_compare(UUID_NULL, DescriptorCachedAnchorIdentifier)
      && (char v156 = 0,
          unint64_t v157 = 0,
          uuid_clear(uu),
          *(void *)uuid_t uu = DescriptorCachedAnchorIdentifier,
          char v156 = 1,
          AnchorFromAllAnchors = rf::helpers::tryGetAnchorFromAllAnchors(a6, (uint64_t)uu),
          v21))
    {
      uint64_t v22 = (uint64_t)AnchorFromAllAnchors;
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v158, (uint64_t)AnchorFromAllAnchors);
      rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(a1, a3, (uint64_t)v158, v18, (rf::helpers *)(a6 + 80), 1);
      v23 = (rf *)std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v158);
      v24 = rf::realityFusionLogObject(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        rf::helpers::getRFUUIDFromAnchor(v22, (uint64_t)v147);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v147, __p);
        int v25 = v146;
        v26 = (void **)__p[0];
        uint64_t Name = REEntityGetName();
        v28 = __p;
        if (v25 < 0) {
          v28 = v26;
        }
        *(_DWORD *)buf = 136315394;
        v152 = v28;
        __int16 v153 = 2080;
        uint64_t v154 = Name;
        _os_log_impl(&dword_235A7C000, v24, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Restoring cached anchor %s for entity %s.", buf, 0x16u);
        if (v146 < 0) {
          operator delete(__p[0]);
        }
      }

      if (std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((void *)(a6 + 120), (uint64_t)uu))
      {
        REAnchorComponentSetIsAnchorExternal();
        if (REAnchorComponentGetSendIsAnchoredToClient()) {
          RENetworkMarkComponentDirty();
        }
        uint64_t v29 = *(void *)(a1 + 48);
        if (!v29) {
          goto LABEL_30;
        }
        int v30 = 4;
        goto LABEL_29;
      }
      uint64_t v29 = *(void *)(a1 + 48);
      if (v29)
      {
        int v30 = 1;
LABEL_29:
        *(void *)v147 = a3;
        LODWORD(__p[0]) = v30;
        (*(void (**)(uint64_t, unsigned char *, void **))(*(void *)v29 + 48))(v29, v147, __p);
      }
    }
    else
    {
      rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
      REAnchoringComponentSetDescriptorCachedAnchorIdentifier();
    }
LABEL_30:
    uint64_t v10 = v18;
LABEL_31:
    REAnchorComponentGetComponentType();
    uint64_t ComponentByClass = REEntityGetComponentByClass();
  }
  v140 = (rf::helpers *)(a6 + 80);
  int isRemotelyOwned = rf::helpers::isRemotelyOwned();
  int AnchoredLocally = 0;
  if ((isRemotelyOwned & 1) == 0 && ComponentByClass) {
    int AnchoredLocally = REAnchorComponentGetAnchoredLocally();
  }
  REAnchoringComponentGetDescriptorType();
  v144[0] = a8;
  v144[1] = (unint64_t *)a1;
  REEntityIsEnabledInHierarchy();
  if (isRemotelyOwned)
  {
    if (REAnchoringComponentGetDescriptorType() < 2) {
      return;
    }
    LODWORD(v137) = rf::helpers::needAnchoringInClientProcessForEntity((unsigned char *)(a1 + 161), a3);
    if (!ComponentByClass) {
      return;
    }
    LODWORD(v139) = isRemotelyOwned;
    uint64_t v141 = v10;
  }
  else
  {
    LODWORD(v139) = 0;
    uint64_t v141 = v10;
    LODWORD(v137) = rf::helpers::needAnchoringInClientProcessForEntity((unsigned char *)(a1 + 161), a3);
    if (!ComponentByClass) {
      goto LABEL_145;
    }
  }
  uint64_t AnchorIdentifier = REAnchorComponentGetAnchorIdentifier();
  char v156 = 0;
  unint64_t v157 = 0;
  uuid_clear(uu);
  *(void *)uuid_t uu = AnchorIdentifier;
  char v156 = 1;
  v35 = rf::PlacementComponentTypeInfo::instance(v34);
  if (*v35) {
    uint64_t CustomComponent = REEntityGetCustomComponent();
  }
  else {
    uint64_t CustomComponent = 0;
  }
  REClientAnchorSyncComponentGetComponentType();
  unint64_t v8 = REEntityGetComponentByClass();
  uint64_t IsAnchorExternal = (uint64_t)std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((void *)(a6 + 120), (uint64_t)uu);
  if (IsAnchorExternal)
  {
    uint64_t IsAnchorExternal = REAnchorComponentGetIsAnchorExternal();
    int v136 = IsAnchorExternal ^ 1;
  }
  else
  {
    int v136 = 0;
  }
  if (v139)
  {
    uint64_t IsAnchorExternal = REAnchorComponentGetRequiresLocalAnchoring();
    if ((IsAnchorExternal & 1) == 0) {
      uint64_t IsAnchorExternal = REAnchorComponentSetRequiresLocalAnchoring();
    }
  }
  else if ((AnchoredLocally | v137 ^ 1) == 1)
  {
    uint64_t IsAnchorExternal = rf::helpers::validateAnchorState(v141, ComponentByClass, a6);
    if ((IsAnchorExternal & 1) == 0)
    {
      v46 = rf::realityFusionLogObject((rf *)IsAnchorExternal);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v158 = 0;
        _os_log_impl(&dword_235A7C000, v46, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Failed to validate anchor state.", v158, 2u);
      }
      goto LABEL_69;
    }
  }
  int v38 = *(unsigned __int8 *)(a1 + 160);
  if (*(unsigned char *)(a1 + 160))
  {
    uint64_t IsAnchorExternal = rf::helpers::isAnchoringTypeAuthorizedForSelf(v141, *(void *)(a6 + 160));
    if (!IsAnchorExternal) {
      goto LABEL_67;
    }
    int v38 = *(unsigned __int8 *)(a1 + 160);
  }
  if (!v38)
  {
    if (v8)
    {
      uint64_t IsAnchorExternal = rf::helpers::isAnchoringTypeAuthorizedForPeer(v141, (void *)(a6 + 168));
      if ((IsAnchorExternal & 1) == 0)
      {
LABEL_67:
        v46 = rf::realityFusionLogObject((rf *)IsAnchorExternal);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v47 = REEntityGetName();
          uint64_t LocalId = REEntityGetLocalId();
          *(_DWORD *)v158 = 136315394;
          *(void *)&v158[4] = v47;
          *(_WORD *)&v158[12] = 2048;
          *(void *)&v158[14] = LocalId;
          _os_log_impl(&dword_235A7C000, v46, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Entity %s(%llu) is no longer authorized to be anchored.", v158, 0x16u);
        }
LABEL_69:

        rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
        goto LABEL_131;
      }
    }
  }
  v39 = rf::helpers::kCameraIdentifier((rf::helpers *)IsAnchorExternal);
  v40 = uu;
  if (v156) {
    v40 = *(unsigned __int8 **)uu;
  }
  if (*((unsigned char *)v39 + 16)) {
    v41 = *(const unsigned __int8 **)v39;
  }
  else {
    v41 = (const unsigned __int8 *)v39;
  }
  if (uuid_compare(v40, v41) || !rf::helpers::getInternalActiveCamera())
  {
    v134 = v35;
    uint64_t v135 = CustomComponent;
    unint64_t v42 = v157;
    if (!v157)
    {
      v132 = uu;
      if (v156) {
        v132 = *(unsigned __int8 **)uu;
      }
      unint64_t v42 = ((*(void *)v132 >> 2) + (*(void *)v132 << 6) + *((void *)v132 + 1) + 2654435769) ^ *(void *)v132;
      unint64_t v157 = v42;
    }
    unint64_t v8 = *(void *)(a6 + 2264);
    if (v8)
    {
      uint8x8_t v43 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
      v43.i16[0] = vaddlv_u8(v43);
      unint64_t v44 = v43.u32[0];
      if (v43.u32[0] > 1uLL)
      {
        unint64_t v45 = v42;
        if (v42 >= v8) {
          unint64_t v45 = v42 % v8;
        }
      }
      else
      {
        unint64_t v45 = (v8 - 1) & v42;
      }
      v54 = *(void **)(*(void *)(a6 + 2256) + 8 * v45);
      if (v54)
      {
        v55 = (void *)*v54;
        if (*v54)
        {
          do
          {
            unint64_t v56 = v55[1];
            if (v42 == v56)
            {
              if (rf::data_flow::RFUUID::Equality::operator()(a6 + 2288, (uint64_t)(v55 + 2), (uint64_t)uu))
              {
                std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v158, v55[6]);
                updated = rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)v158, v140);
                unint64_t v73 = *a8 + 1;
                *a8 = v73;
                if (v73 >= *(void *)(a1 + 464))
                {
                  v74 = rf::realityFusionLogObject(updated);
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                  {
                    unint64_t v130 = *a8;
                    uint64_t v131 = *(void *)(a1 + 464);
                    *(_DWORD *)v147 = 134218240;
                    *(void *)&v147[4] = v130;
                    __int16 v148 = 2048;
                    uint64_t v149 = v131;
                    _os_log_error_impl(&dword_235A7C000, v74, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", v147, 0x16u);
                  }
                }
                if (v135)
                {
                  if (std::function<BOOL ()(REComponent *)>::operator()((uint64_t)(v134 + 5), v135))
                  {
                    std::function<void ()(REComponent *)>::operator()((uint64_t)(v134 + 9), v135);
                    uint64_t v75 = *(void *)(a1 + 48);
                    if (v75) {
                      std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v75, a3, 3);
                    }
                  }
                }
                if (v138) {
                  rf::helpers::updateShadowMarker(a3, (uint64_t)v140);
                }
                std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v158);
                goto LABEL_131;
              }
            }
            else
            {
              if (v44 > 1)
              {
                if (v56 >= v8) {
                  v56 %= v8;
                }
              }
              else
              {
                v56 &= v8 - 1;
              }
              if (v56 != v45) {
                break;
              }
            }
            v55 = (void *)*v55;
          }
          while (v55);
        }
      }
    }
    v57 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>((void *)(a6 + 2296), (uint64_t)uu);
    if (v57)
    {
      if ((v139 & 1) != 0
        || (rf::data_flow::consumer::AnchorManagementConsumer::matchAndReanchorEntity((rf::PlacementComponentTypeInfo *)a1, a3, (uint64_t)(v57 + 6), v140) & 1) == 0)
      {
        v58 = (rf::PlacementComponentTypeInfo *)rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
        if (v135)
        {
          rf::PlacementComponentTypeInfo::instance(v58);
          REEntityRemoveComponentByClass();
        }
      }
    }
    else if (v136)
    {
      v59 = rf::realityFusionLogObject(0);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v60 = REEntityGetName();
        uint64_t v61 = REEntityGetLocalId();
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)uu, v147);
        v62 = v150 >= 0 ? v147 : *(unsigned char **)v147;
        *(_DWORD *)v158 = 136315650;
        *(void *)&v158[4] = v60;
        *(_WORD *)&v158[12] = 2048;
        *(void *)&v158[14] = v61;
        *(_WORD *)&v158[22] = 2080;
        *(void *)&v158[24] = v62;
        _os_log_impl(&dword_235A7C000, v59, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Marking entity external %s, %llu, holding anchor with identifier %s", v158, 0x20u);
        if (v150 < 0) {
          operator delete(*(void **)v147);
        }
      }

      REAnchorComponentSetIsAnchorExternal();
      if (REAnchorComponentGetSendIsAnchoredToClient()) {
        RENetworkMarkComponentDirty();
      }
      uint64_t v63 = *(void *)(a1 + 48);
      if (v63) {
        std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v63, a3, 4);
      }
    }
    else if (v135 && std::function<BOOL ()(REComponent *)>::operator()((uint64_t)(v134 + 5), v135))
    {
      v64 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(v140, (uint64_t)uu);
      if (v64)
      {
        rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)(v64 + 6), v140);
        rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(REScene *,REEntity *,REComponent *,REComponent *,rf::ARStateData const&,BOOL,unsigned long long &)::$_0::operator()(v144);
        std::function<void ()(REComponent *)>::operator()((uint64_t)(v134 + 9), v135);
        uint64_t v65 = *(void *)(a1 + 48);
        if (v65) {
          std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v65, a3, 3);
        }
      }
    }
    else if (v139)
    {
      if ((REAnchorComponentGetAnchoredLocally() & 1) == 0)
      {
        v66 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(v140, (uint64_t)uu);
        if (v66)
        {
          rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)(v66 + 6), v140);
          rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(REScene *,REEntity *,REComponent *,REComponent *,rf::ARStateData const&,BOOL,unsigned long long &)::$_0::operator()(v144);
        }
      }
    }
LABEL_131:
    REAnchorComponentGetComponentType();
    uint64_t v76 = REEntityGetComponentByClass();
    v77 = (const char *)REEntityGetName();
    if (!strcmp(v77, "Reality Simulation System Portal")) {
      int v78 = _os_feature_enabled_impl() ^ 1;
    }
    else {
      int v78 = 0;
    }
    v79 = (const char *)REEntityGetName();
    if (v141)
    {
      BOOL v80 = strcmp(v79, "AccessibilityMRServer-main-world-anchor") == 0;
      int DescriptorType = REAnchoringComponentGetDescriptorType();
      if ((v78 | v80) == 1 && DescriptorType == 1)
      {
        if (v76)
        {
          if ((*(_DWORD *)(a6 + 2824) | 2) == 2)
          {
            v82 = (rf *)REAnchorComponentGetIsAnchorExternal();
            if (v82)
            {
              v83 = rf::realityFusionLogObject(v82);
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v84 = REEntityGetName();
                uint64_t v85 = REEntityGetLocalId();
                *(_DWORD *)v158 = 136315394;
                *(void *)&v158[4] = v84;
                *(_WORD *)&v158[12] = 2048;
                *(void *)&v158[14] = v85;
                _os_log_impl(&dword_235A7C000, v83, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Relocalizing entity %s, %llu, because tracking is regained", v158, 0x16u);
              }

              REAnchorComponentSetIsAnchorExternal();
              if (REAnchorComponentGetSendIsAnchoredToClient()) {
                RENetworkMarkComponentDirty();
              }
              rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(a1, a3);
            }
          }
        }
      }
    }
LABEL_145:
    REAnchorComponentGetComponentType();
    uint64_t v86 = REEntityGetComponentByClass();
    int IsAnchored = REEntityIsAnchored();
    if (v86)
    {
      int v88 = REAnchorComponentGetIsAnchorExternal();
      if (v139) {
        LODWORD(v86) = 0;
      }
      else {
        LODWORD(v86) = REAnchorComponentGetAnchoredLocally();
      }
    }
    else
    {
      int v88 = 0;
    }
    int v89 = v137;
    if (!*(unsigned char *)(a1 + 160)) {
      int v89 = 0;
    }
    if (v89 == 1)
    {
      int v90 = rf::helpers::isAnchoringTypeAuthorizedForSelf(v141, *(void *)(a6 + 160)) ^ 1;
      if (!IsAnchored) {
        goto LABEL_154;
      }
    }
    else
    {
      int v90 = 1;
      if (!IsAnchored)
      {
LABEL_154:
        if (v88) {
          goto LABEL_243;
        }
LABEL_158:
        if (*(unsigned char *)(a1 + 160))
        {
          if ((rf::helpers::shouldAnchorEntityInClientProcess(a3, (unsigned char *)(a1 + 161), *(void *)(*(void *)(a1 + 8) + 224)) & 1) == 0)
          {
LABEL_243:
            if (v138) {
              rf::helpers::updateShadowMarker(a3, (uint64_t)v140);
            }
            return;
          }
LABEL_226:
          REAnchoringComponentGetComponentType();
          uint64_t v116 = REEntityGetComponentByClass();
          if (!v116)
          {
            rf::getMessage((rf *)"Anchoring component should not be null.", v158);
            rf::internal::logAssert((const char *)v158);
            if ((char)v158[23] < 0) {
              operator delete(*(void **)v158);
            }
            rf::internal::debugBreakHandler(v133);
          }
          uint64_t SceneNullable = REEntityGetSceneNullable();
          v118 = (rf *)rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor((uint64_t)v158, a1, SceneNullable, v116, v140);
          if (v168)
          {
            std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)uu, (uint64_t)v158);
            rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(a1, a3, (uint64_t)uu, v116, v140, 1);
            v119 = (rf *)std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
            v120 = rf::realityFusionLogObject(v119);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v121 = REEntityGetName();
              if (!v168) {
                std::__throw_bad_optional_access[abi:ne180100]();
              }
              uint64_t v122 = v121;
              rf::helpers::getRFUUIDFromAnchor((uint64_t)v158, (uint64_t)v147);
              rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v147, __p);
              if (v146 >= 0) {
                v123 = __p;
              }
              else {
                v123 = (void **)__p[0];
              }
              *(_DWORD *)buf = 136315394;
              v152 = (void **)v122;
              __int16 v153 = 2080;
              uint64_t v154 = (uint64_t)v123;
              _os_log_impl(&dword_235A7C000, v120, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Anchoring entity %s to anchor %s.", buf, 0x16u);
              if (v146 < 0) {
                operator delete(__p[0]);
              }
            }

            v118 = *(rf **)(a1 + 48);
            if (v118)
            {
              *(void *)v147 = a3;
              LODWORD(__p[0]) = 1;
              v118 = (rf *)(*(uint64_t (**)(rf *, unsigned char *, void **))(*(void *)v118 + 48))(v118, v147, __p);
            }
            if (v168) {
              v118 = (rf *)std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v158);
            }
          }
          unint64_t v124 = *a8 + 1;
          *a8 = v124;
          if (v124 >= *(void *)(a1 + 464))
          {
            v125 = rf::realityFusionLogObject(v118);
            if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
            {
              unint64_t v126 = *a8;
              uint64_t v127 = *(void *)(a1 + 464);
              *(_DWORD *)v158 = 134218240;
              *(void *)&v158[4] = v126;
              *(_WORD *)&v158[12] = 2048;
              *(void *)&v158[14] = v127;
              _os_log_error_impl(&dword_235A7C000, v125, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", v158, 0x16u);
            }
          }
          goto LABEL_243;
        }
        REClientAnchorSyncComponentGetComponentType();
        if (REEntityGetComponentByClass())
        {
          uint64_t v91 = *(void *)(a1 + 8);
          memset(v158, 0, sizeof(v158));
          LODWORD(v159) = *(_DWORD *)(v91 + 264);
          std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)v158, *(void *)(v91 + 240));
          v92 = *(void **)(v91 + 248);
          if (v92)
          {
            unint64_t v93 = *(void *)&v158[8];
            do
            {
              unint64_t v94 = v92[2];
              if (v93)
              {
                uint8x8_t v95 = (uint8x8_t)vcnt_s8((int8x8_t)v93);
                v95.i16[0] = vaddlv_u8(v95);
                if (v95.u32[0] > 1uLL)
                {
                  unint64_t v8 = v92[2];
                  if (v93 <= v94) {
                    unint64_t v8 = v94 % v93;
                  }
                }
                else
                {
                  unint64_t v8 = v94 & (v93 - 1);
                }
                v96 = *(void **)(*(void *)v158 + 8 * v8);
                if (v96)
                {
                  for (i = (void *)*v96; i; i = (void *)*i)
                  {
                    unint64_t v98 = i[1];
                    if (v98 == v94)
                    {
                      if (i[2] == v94) {
                        goto LABEL_202;
                      }
                    }
                    else
                    {
                      if (v95.u32[0] > 1uLL)
                      {
                        if (v98 >= v93) {
                          v98 %= v93;
                        }
                      }
                      else
                      {
                        v98 &= v93 - 1;
                      }
                      if (v98 != v8) {
                        break;
                      }
                    }
                  }
                }
              }
              v99 = operator new(0x20uLL);
              void *v99 = 0;
              v99[1] = v94;
              *((_OWORD *)v99 + 1) = *((_OWORD *)v92 + 1);
              float v100 = (float)(unint64_t)(*(void *)&v158[24] + 1);
              if (!v93 || (float)(*(float *)&v159 * (float)v93) < v100)
              {
                BOOL v101 = (v93 & (v93 - 1)) != 0;
                if (v93 < 3) {
                  BOOL v101 = 1;
                }
                unint64_t v102 = v101 | (2 * v93);
                unint64_t v103 = vcvtps_u32_f32(v100 / *(float *)&v159);
                if (v102 <= v103) {
                  size_t v104 = v103;
                }
                else {
                  size_t v104 = v102;
                }
                std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>((uint64_t)v158, v104);
                unint64_t v93 = *(void *)&v158[8];
                if ((*(void *)&v158[8] & (*(void *)&v158[8] - 1)) != 0)
                {
                  if (*(void *)&v158[8] <= v94) {
                    unint64_t v8 = v94 % *(void *)&v158[8];
                  }
                  else {
                    unint64_t v8 = v94;
                  }
                }
                else
                {
                  unint64_t v8 = (*(void *)&v158[8] - 1) & v94;
                }
              }
              uint64_t v105 = *(void *)v158;
              v106 = *(void **)(*(void *)v158 + 8 * v8);
              if (v106)
              {
                void *v99 = *v106;
              }
              else
              {
                void *v99 = *(void *)&v158[16];
                *(void *)&v158[16] = v99;
                *(void *)(v105 + 8 * v8) = &v158[16];
                if (!*v99) {
                  goto LABEL_201;
                }
                unint64_t v107 = *(void *)(*v99 + 8);
                if ((v93 & (v93 - 1)) != 0)
                {
                  if (v107 >= v93) {
                    v107 %= v93;
                  }
                }
                else
                {
                  v107 &= v93 - 1;
                }
                v106 = (void *)(*(void *)v158 + 8 * v107);
              }
              void *v106 = v99;
LABEL_201:
              ++*(void *)&v158[24];
LABEL_202:
              v92 = (void *)*v92;
            }
            while (v92);
          }
          char shouldAnchorEntityRequiringClientAnchoring = rf::helpers::shouldAnchorEntityRequiringClientAnchoring(a3, v158);
          std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)v158);
          if ((shouldAnchorEntityRequiringClientAnchoring & 1) == 0) {
            goto LABEL_243;
          }
        }
        if (*(unsigned char *)(a1 + 60) || *(unsigned char *)(a1 + 58) || *(unsigned char *)(a1 + 59))
        {
          RENetworkComponentGetComponentType();
          if (REEntityGetComponentByClass())
          {
            if (*(unsigned char *)(a1 + 60))
            {
              uint64_t Parent = a3;
              do
              {
                BOOL v110 = Parent != 0;
                if (!Parent) {
                  break;
                }
                unint64_t v111 = REEntityGetLocalId();
                uint64_t Parent = REEntityGetParent();
              }
              while (!std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((void *)(a1 + 280), v111));
            }
            else
            {
              BOOL v110 = 0;
            }
            BOOL v113 = 0;
            if (*(unsigned char *)(a1 + 58) || *(unsigned char *)(a1 + 59))
            {
              unint64_t v112 = RENetworkComponentOwnerPeerID();
              if (std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((void *)(a1 + 200), v112)|| std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>((void *)(a1 + 240), v112))
              {
                BOOL v113 = 1;
              }
            }
            uint64_t v114 = REEntityGetParent();
            int v115 = v113;
            if (!v114)
            {
              if (*(unsigned char *)(a1 + 58)) {
                int v115 = 1;
              }
              else {
                int v115 = v113;
              }
            }
            if (!v110 && (v113 | v115) != 1) {
              goto LABEL_243;
            }
          }
        }
        goto LABEL_226;
      }
    }
    if ((v90 | v86 | v88)) {
      goto LABEL_243;
    }
    goto LABEL_158;
  }
  REEntityGetComponent();
  RETransformComponentGetWorldMatrix4x4F();
  InternalActiveCamera = (rf::helpers *)rf::helpers::getInternalActiveCamera();
  if (InternalActiveCamera)
  {
    REEntityGetComponent();
    InternalActiveCamera = (rf::helpers *)RETransformComponentGetWorldMatrix4x4F();
    long long v142 = v50;
    long long v137 = v51;
    long long v138 = v52;
    long long v139 = v53;
  }
  else
  {
    long long v142 = 0u;
  }
  v67 = rf::helpers::kCameraIdentifier(InternalActiveCamera);
  long long v68 = v67[1];
  *(_OWORD *)v158 = *v67;
  *(_OWORD *)&v158[16] = v68;
  long long v159 = v142;
  long long v160 = v137;
  long long v161 = v138;
  long long v162 = v139;
  int v163 = 16842752;
  int v164 = 0;
  char v165 = 0;
  uint64_t v166 = 0;
  int v167 = 0;
  v69 = rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(a1, a3, (uint64_t)v158, v140);
  unint64_t v70 = *a8 + 1;
  *a8 = v70;
  if (v70 >= *(void *)(a1 + 464))
  {
    v71 = rf::realityFusionLogObject(v69);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      unint64_t v128 = *a8;
      uint64_t v129 = *(void *)(a1 + 464);
      *(_DWORD *)v147 = 134218240;
      *(void *)&v147[4] = v128;
      __int16 v148 = 2048;
      uint64_t v149 = v129;
      _os_log_error_impl(&dword_235A7C000, v71, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", v147, 0x16u);
    }
  }
  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v158);
}

void sub_235AEBD10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (SLOBYTE(STACK[0x207]) < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::unanchorEntity(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  REAnchorComponentGetComponentType();
  uint64_t ComponentByClass = (rf *)REEntityGetComponentByClass();
  if (!ComponentByClass)
  {
    rf::getMessage((rf *)"Anchor component should not be null.", uu);
    rf::internal::logAssert((const char *)uu);
    if (v18 < 0) {
      operator delete(*(void **)uu);
    }
    uint64_t ComponentByClass = (rf *)rf::internal::debugBreakHandler(v13);
  }
  v5 = rf::realityFusionLogObject(ComponentByClass);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t Name = REEntityGetName();
    uint64_t AnchorIdentifier = REAnchorComponentGetAnchorIdentifier();
    char v17 = 0;
    uint64_t v19 = 0;
    uuid_clear(uu);
    *(void *)uuid_t uu = AnchorIdentifier;
    char v17 = 1;
    rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)uu, __p);
    unint64_t v8 = v15 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315394;
    uint64_t v21 = Name;
    __int16 v22 = 2080;
    v23 = v8;
    _os_log_impl(&dword_235A7C000, v5, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Unanchoring entity %s from anchor %s", buf, 0x16u);
    if (v15 < 0) {
      operator delete(__p[0]);
    }
  }

  if (rf::helpers::isRemotelyOwned())
  {
    v9 = (rf::AnchorMetadataComponent *)REAnchorComponentSetAnchoredLocally();
  }
  else
  {
    REAnchorComponentGetComponentType();
    v9 = (rf::AnchorMetadataComponent *)REEntityRemoveComponentByClass();
  }
  uint64_t v10 = (rf::AnchorMetadataComponent *)rf::AnchorMetadataComponent::instance(v9);
  if (*(void *)v10)
  {
    rf::AnchorMetadataComponent::instance(v10);
    uint64_t CustomComponent = (rf::AnchorMetadataComponent *)REEntityGetCustomComponent();
    if (CustomComponent)
    {
      rf::AnchorMetadataComponent::instance(CustomComponent);
      REEntityRemoveComponentByClass();
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(result, a2, 2);
  }
  return result;
}

void sub_235AEBFD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::updateReceiveIsAnchoredOnClientForComponent(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (*(unsigned char *)(result + 160)) {
      uint64_t v4 = rf::helpers::needAnchoringInClientProcessForEntity((unsigned char *)(result + 161), a2) ^ 1;
    }
    else {
      uint64_t v4 = 0;
    }
    return MEMORY[0x270F1BFA0](a3, v4);
  }
  return result;
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, rf::helpers *a5, int a6)
{
  uint64_t v214 = *MEMORY[0x263EF8340];
  uint64_t v175 = a4;
  REAnchorComponentGetComponentType();
  uint64_t ComponentByClass = REEntityGetComponentByClass();
  if (ComponentByClass)
  {
    RERetain();
    uint64_t v10 = ComponentByClass;
    uint64_t v11 = a1;
  }
  else
  {
    REAnchorComponentGetComponentType();
    uint64_t v10 = REComponentCreateByClass();
    REAnchoringComponentGetComponentType();
    uint64_t v12 = REEntityGetComponentByClass();
    if (v10)
    {
      if (v12)
      {
        REClientAnchorSyncComponentGetComponentType();
        uint64_t v13 = REEntityGetComponentByClass();
        if (!*(unsigned char *)(a1 + 160) && !v13)
        {
          unsigned int DescriptorType = REAnchoringComponentGetDescriptorType();
          if (DescriptorType <= 4 && ((1 << DescriptorType) & 0x16) != 0) {
            REAnchorComponentSetSendIsAnchoredToClient();
          }
        }
      }
    }
    uint64_t v11 = a1;
    rf::data_flow::consumer::AnchorManagementConsumer::updateReceiveIsAnchoredOnClientForComponent(a1, a2, v10);
  }
  REAnchorComponentSetAnchoredLocally();
  CameraAnchor = rf::helpers::getCameraAnchor(a5);
  rf::helpers::getTransformFromAnchor(a3, (uint64_t)&v175, (uint64_t)(CameraAnchor + 4), v11 + 168, &v171);
  simd_float4 v161 = v172;
  simd_float4 v166 = v171;
  simd_float4 v150 = v174;
  simd_float4 v155 = v173;
  REAnchorComponentSetWorldTransform();
  if (REAnchoringComponentGetMode() || REAnchoringComponentGetDescriptorType() == 1)
  {
    std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)&v189, a3);
  }
  else
  {
    uu[16] = 0;
    *(void *)&uu[24] = 0;
    uuid_clear(uu);
    uuid_generate_random(uu);
    simd_float4 v198 = v171;
    simd_float4 v199 = v172;
    simd_float4 v200 = v173;
    *(simd_float4 *)v201 = v174;
    *(_DWORD *)&v201[16] = 16842752;
    *(_DWORD *)&v201[20] = 0;
    v201[24] = 0;
    simd_float4 v193 = v173;
    v194[0] = v174;
    long long v189 = *(_OWORD *)uu;
    float32x4_t v190 = *(float32x4_t *)&uu[16];
    simd_float4 v191 = v171;
    simd_float4 v192 = v172;
    *(simd_float4 *)((char *)v194 + 9) = *(simd_float4 *)&v201[9];
    uint64_t v195 = 0;
    int v196 = 0;
    if (*(void *)(a1 + 88))
    {
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)uu, (uint64_t)&v189);
      uint64_t v104 = *(void *)(a1 + 88);
      if (!v104) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint8_t *__return_ptr))(*(void *)v104 + 48))(v210);
      if (v196) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      long long v189 = *(_OWORD *)v210;
      float32x4_t v190 = (float32x4_t)v211;
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
    }
    uint64_t v105 = *(void *)(a1 + 120);
    if (v105) {
      std::function<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::operator()(v105, (uint64_t)&v189);
    }
    REAnchoringComponentSetDescriptorTransform();
  }
  rf::helpers::getRFUUIDFromAnchor((uint64_t)&v189, (uint64_t)uu);
  BOOL v16 = (rf::PlacementComponentTypeInfo *)REAnchorComponentSetAnchorIdentifier();
  char v17 = rf::PlacementComponentTypeInfo::instance(v16);
  if (*v17) {
    uint64_t CustomComponent = REEntityGetCustomComponent();
  }
  else {
    uint64_t CustomComponent = 0;
  }
  PreviousWorldTransform = (float32x4_t *)REAnchoringComponentGetPreviousWorldTransform();
  if (PreviousWorldTransform)
  {
    float32x4_t v133 = PreviousWorldTransform[1];
    float32x4_t v136 = *PreviousWorldTransform;
    float32x4_t v139 = PreviousWorldTransform[3];
    float32x4_t v144 = PreviousWorldTransform[2];
    v215.columns[1] = v161;
    v215.columns[0] = v166;
    v215.columns[3] = v150;
    v215.columns[2] = v155;
    simd_float4x4 v216 = __invert_f4(v215);
    uint64_t v20 = 0;
    *(float32x4_t *)v210 = v136;
    simd_float4 v211 = (simd_float4)v133;
    simd_float4 v212 = (simd_float4)v144;
    float32x4_t v213 = v139;
    do
    {
      *(float32x4_t *)&uu[v20] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v216.columns[0], COERCE_FLOAT(*(_OWORD *)&v210[v20])), (float32x4_t)v216.columns[1], *(float32x2_t *)&v210[v20], 1), (float32x4_t)v216.columns[2], *(float32x4_t *)&v210[v20], 2), (float32x4_t)v216.columns[3], *(float32x4_t *)&v210[v20], 3);
      v20 += 16;
    }
    while (v20 != 64);
    RETransformComponentGetComponentType();
    if (!REEntityGetComponentByClass())
    {
      uint64_t v21 = rf::realityFusionLogObject(0);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t Name = REEntityGetName();
        rf::helpers::getBaseAnchorProperties(a3);
        rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)uu, v210);
        if (v211.i8[7] >= 0) {
          v23 = v210;
        }
        else {
          v23 = *(uint8_t **)v210;
        }
        buf.columns[0].i32[0] = 136315394;
        *(uint64_t *)((char *)buf.columns[0].i64 + 4) = Name;
        buf.columns[0].i16[6] = 2080;
        *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)v23;
        _os_log_impl(&dword_235A7C000, v21, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer::anchorEntity(): Transform component not found when attempting to anchor entity %s to anchor %s, adding one now", (uint8_t *)&buf, 0x16u);
        if (v211.i8[7] < 0) {
          operator delete(*(void **)v210);
        }
      }
      RETransformComponentGetComponentType();
      REEntityAddComponentByClass();
    }
    REMakeSRTFromMatrix();
    RETransformComponentSetLocalSRT();
    RENetworkMarkComponentDirty();
    goto LABEL_30;
  }
  if (*(_DWORD *)(a3 + 256) != 1 || CustomComponent || !a6)
  {
LABEL_30:
    if (CustomComponent) {
      std::function<void ()(REComponent *)>::operator()((uint64_t)(v17 + 9), CustomComponent);
    }
    goto LABEL_82;
  }
  long long v24 = *(_OWORD *)(a3 + 80);
  simd_float4 v200 = *(simd_float4 *)(a3 + 64);
  *(_OWORD *)v201 = v24;
  *(_OWORD *)&v201[9] = *(_OWORD *)(a3 + 89);
  long long v25 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)uuid_t uu = *(_OWORD *)a3;
  *(_OWORD *)&uu[16] = v25;
  simd_float4 v26 = *(simd_float4 *)(a3 + 48);
  simd_float4 v198 = *(simd_float4 *)(a3 + 32);
  simd_float4 v199 = v26;
  id v202 = *(id *)(a3 + 112);
  simd_float4 v27 = *(simd_float4 *)(a3 + 176);
  v203.columns[2] = *(simd_float4 *)(a3 + 160);
  v203.columns[3] = v27;
  long long v204 = *(_OWORD *)(a3 + 192);
  simd_float4 v28 = *(simd_float4 *)(a3 + 144);
  v203.columns[0] = *(simd_float4 *)(a3 + 128);
  v203.columns[1] = v28;
  uint64_t v29 = *(const void **)(a3 + 216);
  uint64_t v205 = *(void *)(a3 + 208);
  v206 = 0;
  uint64_t v30 = *(void *)(a3 + 224);
  uint64_t v208 = 0;
  v207 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v206, v29, v30, (v30 - (uint64_t)v29) >> 4);
  REAnchoringComponentGetDescriptorBounds();
  float32x2_t v167 = v31;
  simd_float4 v180 = v200;
  v181[0] = *(float32x4_t *)v201;
  *(float32x4_t *)((char *)v181 + 9) = *(float32x4_t *)&v201[9];
  long long v176 = *(_OWORD *)uu;
  long long v177 = *(_OWORD *)&uu[16];
  simd_float4 v178 = v198;
  simd_float4 v179 = v199;
  id v182 = v202;
  simd_float4x4 v183 = v203;
  long long v184 = v204;
  uint64_t v185 = v205;
  __p = 0;
  uint64_t v188 = 0;
  v187 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v206, (uint64_t)v207, (v207 - (unsigned char *)v206) >> 4);
  float32x2_t v162 = (float32x2_t)__PAIR64__(DWORD2(v184), v184);
  float v32 = 0.0;
  if (!v185)
  {
    uint64_t v33 = 0;
    float32x4_t v34 = (float32x4_t)v178;
    float32x4_t v35 = (float32x4_t)v179;
    float32x4_t v36 = (float32x4_t)v180;
    float32x4_t v37 = v181[0];
    simd_float4x4 buf = v183;
    do
    {
      *(float32x4_t *)&v210[v33 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(*(_OWORD *)&buf.columns[v33])), v35, *(float32x2_t *)buf.columns[v33].f32, 1), v36, (float32x4_t)buf.columns[v33], 2), v37, (float32x4_t)buf.columns[v33], 3);
      ++v33;
    }
    while (v33 != 4);
    float32x4_t v140 = *(float32x4_t *)v210;
    float32x4_t v145 = (float32x4_t)v212;
    float32x4_t v151 = (float32x4_t)v211;
    float32x4_t v156 = v213;
    int v38 = (float32x4_t *)rf::helpers::getCameraAnchor(a5);
    float32x4_t v146 = vmlaq_f32(vaddq_f32(v145, vmlaq_f32(vmulq_f32(v140, (float32x4_t)0), (float32x4_t)0, v151)), (float32x4_t)0, v156);
    float32x4_t v157 = (float32x4_t)v179;
    float32x4_t v39 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v157, (int32x4_t)v157), (int8x16_t)v179, 0xCuLL);
    int32x4_t v40 = (int32x4_t)vmlaq_f32(vmulq_f32(v39, vnegq_f32(v38[4])), (float32x4_t)v179, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v38[4], (int32x4_t)v38[4]), (int8x16_t)v38[4], 0xCuLL));
    float32x4_t v41 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v40, v40), (int8x16_t)v40, 0xCuLL);
    float32x4_t v42 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v41, (int32x4_t)v41), (int8x16_t)v41, 0xCuLL), vnegq_f32((float32x4_t)v179)), v41, v39);
    float32x4_t v43 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v42, (int32x4_t)v42), (int8x16_t)v42, 0xCuLL);
    int32x4_t v44 = (int32x4_t)vmulq_f32(v42, v42);
    v44.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v44.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v44, 2), *(float32x2_t *)v44.i8)).u32[0];
    *(float32x2_t *)v39.f32 = vrsqrte_f32((float32x2_t)v44.u32[0]);
    *(float32x2_t *)v39.f32 = vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32)));
    float32x4_t v152 = vmulq_n_f32(v43, vmul_f32(*(float32x2_t *)v39.f32, vrsqrts_f32((float32x2_t)v44.u32[0], vmul_f32(*(float32x2_t *)v39.f32, *(float32x2_t *)v39.f32))).f32[0]);
    float32x4_t v45 = vmulq_f32(v146, v152);
    float v46 = acosf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v45, 2), vaddq_f32(v45, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v45.f32, 1))).f32[0], -1.0), 1.0));
    float32x4_t v47 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v152, (int32x4_t)v152), (int8x16_t)v152, 0xCuLL), vnegq_f32(v146)), v152, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v146, (int32x4_t)v146), (int8x16_t)v146, 0xCuLL));
    float32x4_t v48 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v47, (int32x4_t)v47), (int8x16_t)v47, 0xCuLL);
    int32x4_t v49 = (int32x4_t)vmulq_f32(v47, v47);
    v49.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v49.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v49, 2), *(float32x2_t *)v49.i8)).u32[0];
    float32x2_t v50 = vrsqrte_f32((float32x2_t)v49.u32[0]);
    float32x2_t v51 = vmul_f32(v50, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v50, v50)));
    float32x4_t v52 = vmulq_f32(v157, vmulq_n_f32(v48, vmul_f32(v51, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v51, v51))).f32[0]));
    if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v52, 2), vaddq_f32(v52, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v52.f32, 1))).f32[0] <= 0.0)float v46 = -v46; {
    float v32 = rf::helpers::rotationThatFitsRect(v46, *(double *)&v167, *(double *)&v162);
    }
    float v53 = sqrtf(vaddv_f32(vmul_f32(v167, v167)));
    if (v53 >= 0.00000011921)
    {
      float v54 = acosf(v167.f32[0] / v53);
      float v158 = fabsf(v53 * cosf(v32 + v54));
      float v55 = acosf(v167.f32[1] / v53);
      float32x2_t v167 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(fabsf(v53 * cosf(v32 + v55))), LODWORD(v158));
    }
  }
  unint64_t v56 = (float32x4_t *)rf::helpers::getCameraAnchor(a5);
  float32x4_t v57 = vnegq_f32(v56[4]);
  float32x4_t v58 = vmulq_f32((float32x4_t)v179, v57);
  float32x4_t v59 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2), vaddq_f32(v58, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 1)));
  if (v59.f32[0] <= -0.00000011921)
  {
    float32x4_t v60 = vmulq_f32((float32x4_t)v179, vsubq_f32(v181[0], v56[5]));
    float v61 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))), v59).f32[0];
    if (v61 >= 0.0)
    {
      float v147 = v61;
      float32x4_t v153 = v56[5];
      float32x4_t v159 = v57;
      simd_float4x4 v217 = __invert_f4(v183);
      float32x4_t v137 = (float32x4_t)v217.columns[0];
      float32x4_t v141 = (float32x4_t)v217.columns[1];
      float32x4_t v131 = (float32x4_t)v217.columns[3];
      float32x4_t v134 = (float32x4_t)v217.columns[2];
      v217.columns[0] = v178;
      v217.columns[1] = v179;
      v217.columns[2] = v180;
      v217.columns[3] = (simd_float4)v181[0];
      simd_float4x4 v218 = __invert_f4(v217);
      uint64_t v62 = 0;
      simd_float4x4 buf = v218;
      do
      {
        *(float32x4_t *)&v210[v62 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v137, COERCE_FLOAT(*(_OWORD *)&buf.columns[v62])), v141, *(float32x2_t *)buf.columns[v62].f32, 1), v134, (float32x4_t)buf.columns[v62], 2), v131, (float32x4_t)buf.columns[v62], 3);
        ++v62;
      }
      while (v62 != 4);
      float32x4_t v63 = vaddq_f32(v153, vmulq_n_f32(v159, v147));
      v64 = (const float *)&v213;
      float32x2_t v65 = (float32x2_t)*(_OWORD *)vld2_f32(v64).val;
      int8x16_t v66 = (int8x16_t)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v210, v63.f32[0]), (float32x4_t)v211, *(float32x2_t *)v63.f32, 1), (float32x4_t)v212, v63, 2);
      int32x4_t v67 = (int32x4_t)vextq_s8(v66, v66, 8uLL);
      *(float32x2_t *)v67.i8 = vadd_f32(v65, (float32x2_t)vzip1_s32(*(int32x2_t *)v66.i8, *(int32x2_t *)v67.i8));
      float32x2_t v68 = vmul_f32(v167, (float32x2_t)0x3F0000003F000000);
      *(float32x2_t *)v66.i8 = vmul_f32(v162, (float32x2_t)0x3F0000003F000000);
      *(float32x2_t *)v67.i8 = vminnm_f32(vmaxnm_f32(*(float32x2_t *)v67.i8, vsub_f32(v68, *(float32x2_t *)v66.i8)), vsub_f32(*(float32x2_t *)v66.i8, v68));
      int32x4_t v168 = vtrn2q_s32(vzip1q_s32((int32x4_t)xmmword_235AF7AA0, v67), (int32x4_t)xmmword_235AF7AA0);
      *(float32x2_t *)v66.i8 = vrsqrte_f32((float32x2_t)1065353216);
      *(float32x2_t *)v66.i8 = vmul_f32(*(float32x2_t *)v66.i8, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v66.i8, *(float32x2_t *)v66.i8)));
      float32x4_t v69 = vmulq_n_f32((float32x4_t)xmmword_235AF75F0, vmul_f32(*(float32x2_t *)v66.i8, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(*(float32x2_t *)v66.i8, *(float32x2_t *)v66.i8))).f32[0]);
      float v70 = v69.f32[1];
      float v71 = v69.f32[2];
      float32x4_t v142 = v69;
      float v148 = vmulq_f32(v69, v69).f32[0];
      float v72 = vmuls_lane_f32(v69.f32[1], *(float32x2_t *)v69.f32, 1);
      float v73 = vmuls_lane_f32(v69.f32[0], *(float32x2_t *)v69.f32, 1);
      float v74 = vmuls_lane_f32(v69.f32[0], v69, 2);
      __float2 v75 = __sincosf_stret(v32);
      uint64_t v76 = 0;
      float v77 = vmuls_lane_f32(v75.__sinval, *(float32x2_t *)v142.f32, 1);
      float v78 = vmuls_lane_f32(v75.__sinval, v142, 2);
      float v79 = 1.0 - v75.__cosval;
      v80.i32[3] = 0;
      float32x4_t v81 = (float32x4_t)v183.columns[0];
      float32x4_t v82 = (float32x4_t)v183.columns[1];
      float32x4_t v83 = (float32x4_t)v183.columns[2];
      float32x4_t v84 = (float32x4_t)v183.columns[3];
      float32x4_t v163 = (float32x4_t)xmmword_235AF75E0;
      buf.columns[0] = (simd_float4)xmmword_235AF75E0;
      float32x4_t v154 = (float32x4_t)xmmword_235AF75F0;
      buf.columns[1] = (simd_float4)xmmword_235AF75F0;
      float32x4_t v160 = (float32x4_t)xmmword_235AF7600;
      buf.columns[2] = (simd_float4)xmmword_235AF7600;
      buf.columns[3] = (simd_float4)v168;
      do
      {
        *(float32x4_t *)&v210[v76 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&buf.columns[v76])), v82, *(float32x2_t *)buf.columns[v76].f32, 1), v83, (float32x4_t)buf.columns[v76], 2), v84, (float32x4_t)buf.columns[v76], 3);
        ++v76;
      }
      while (v76 != 4);
      uint64_t v85 = 0;
      v80.f32[1] = v72 + (float)(v75.__cosval * (float)(1.0 - v72));
      v86.i32[3] = 0;
      v87.f32[0] = v148 + (float)(v75.__cosval * (float)(1.0 - v148));
      v87.f32[1] = v78 + (float)(v73 * v79);
      v87.i64[1] = COERCE_UNSIGNED_INT(-(float)(v77 - (float)(v74 * (float)(1.0 - v75.__cosval))));
      v80.f32[2] = (float)(v75.__sinval * v142.f32[0]) + (float)((float)(v70 * v71) * v79);
      v86.f32[0] = v77 + (float)(v74 * v79);
      v86.f32[1] = -(float)((float)(v75.__sinval * v142.f32[0]) - (float)((float)(v70 * v71) * v79));
      v86.f32[2] = (float)(v71 * v71) + (float)(v75.__cosval * (float)(1.0 - (float)(v71 * v71)));
      float32x4_t v88 = *(float32x4_t *)v210;
      float32x4_t v89 = (float32x4_t)v211;
      float32x4_t v90 = (float32x4_t)v212;
      float32x4_t v91 = v213;
      buf.columns[0] = v87;
      v80.f32[0] = -(float)(v78 - (float)(v73 * (float)(1.0 - v75.__cosval)));
      buf.columns[1] = v80;
      buf.columns[2] = v86;
      buf.columns[3] = (simd_float4)xmmword_235AF7AA0;
      do
      {
        *(float32x4_t *)&v210[v85 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v88, COERCE_FLOAT(*(_OWORD *)&buf.columns[v85])), v89, *(float32x2_t *)buf.columns[v85].f32, 1), v90, (float32x4_t)buf.columns[v85], 2), v91, (float32x4_t)buf.columns[v85], 3);
        ++v85;
      }
      while (v85 != 4);
      simd_float4 v135 = v211;
      simd_float4 v138 = *(simd_float4 *)v210;
      simd_float4 v143 = (simd_float4)v213;
      simd_float4 v149 = v212;
      RETransformComponentGetComponentType();
      if (!REEntityGetComponentByClass())
      {
        v92 = rf::realityFusionLogObject(0);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v210 = 0;
          _os_log_impl(&dword_235A7C000, v92, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Plane Anchor entity require Transform component to function", v210, 2u);
        }

        unint64_t v94 = rf::realityFusionLogObject(v93);
        if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v210 = 0;
          _os_log_impl(&dword_235A7C000, v94, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Adding Transform component", v210, 2u);
        }

        RETransformComponentGetComponentType();
        REEntityAddComponentByClass();
      }
      RETransformComponentGetLocalSRT();
      RESRTMatrix();
      simd_float4 v99 = v95;
      float32x4_t v100 = (float32x4_t)xmmword_235AF7AA0;
      if (!v185)
      {
        simd_float4 v128 = v96;
        simd_float4 v129 = v95;
        simd_float4 v130 = v98;
        simd_float4 v132 = v97;
        float v101 = v180.f32[0];
        float v102 = 1.0;
        if (v180.f32[0] <= 1.0) {
          float v102 = v180.f32[0];
        }
        if (v102 < -1.0) {
          float v102 = -1.0;
        }
        float v165 = asinf(v102);
        if (fabsf(v101) >= 0.9999)
        {
          unint64_t v164 = __PAIR64__(LODWORD(v165), COERCE_UNSIGNED_INT(atan2f(v179.f32[2], v179.f32[1])));
          float v103 = 0.0;
        }
        else
        {
          unint64_t v164 = __PAIR64__(LODWORD(v165), COERCE_UNSIGNED_INT(atan2f(-v180.f32[1], v180.f32[2])));
          float v103 = atan2f(-v179.f32[0], v178.f32[0]);
        }
        __float2 v106 = __sincosf_stret(*(float *)&v164);
        __float2 v107 = __sincosf_stret(*((float *)&v164 + 1));
        __float2 v108 = __sincosf_stret(v103);
        v109.f32[0] = v107.__cosval * v108.__cosval;
        v109.f32[1] = (float)(v106.__cosval * v108.__sinval)
                    + (float)((float)(v106.__sinval * v108.__cosval) * v107.__sinval);
        v110.i32[3] = 0;
        v109.i64[1] = COERCE_UNSIGNED_INT((float)(v106.__sinval * v108.__sinval)- (float)((float)(v106.__cosval * v108.__cosval) * v107.__sinval));
        v111.i32[3] = 0;
        v111.f32[0] = -(float)(v107.__cosval * v108.__sinval);
        v111.f32[1] = (float)(v106.__cosval * v108.__cosval)
                    - (float)((float)(v106.__sinval * v108.__sinval) * v107.__sinval);
        v111.f32[2] = (float)(v106.__sinval * v108.__cosval)
                    + (float)((float)(v106.__cosval * v108.__sinval) * v107.__sinval);
        float32x4_t v154 = v111;
        v110.i32[0] = LODWORD(v107.__sinval);
        v110.f32[1] = -(float)(v106.__sinval * v107.__cosval);
        v110.f32[2] = v106.__cosval * v107.__cosval;
        float32x4_t v160 = v110;
        float32x4_t v163 = v109;
        float32x4_t v100 = (float32x4_t)xmmword_235AF7AA0;
        simd_float4 v98 = v130;
        simd_float4 v97 = v132;
        simd_float4 v96 = v128;
        simd_float4 v99 = v129;
      }
      uint64_t v112 = 0;
      buf.columns[0] = v138;
      buf.columns[1] = v135;
      buf.columns[2] = v149;
      buf.columns[3] = v143;
      do
      {
        *(float32x4_t *)&v210[v112 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v163, COERCE_FLOAT(*(_OWORD *)&buf.columns[v112])), v154, *(float32x2_t *)buf.columns[v112].f32, 1), v160, (float32x4_t)buf.columns[v112], 2), v100, (float32x4_t)buf.columns[v112], 3);
        ++v112;
      }
      while (v112 != 4);
      uint64_t v113 = 0;
      float32x4_t v114 = *(float32x4_t *)v210;
      float32x4_t v115 = (float32x4_t)v211;
      float32x4_t v116 = (float32x4_t)v212;
      float32x4_t v117 = v213;
      buf.columns[0] = v99;
      buf.columns[1] = v96;
      buf.columns[2] = v97;
      buf.columns[3] = v98;
      do
      {
        *(float32x4_t *)&v210[v113 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(_OWORD *)&buf.columns[v113])), v115, *(float32x2_t *)buf.columns[v113].f32, 1), v116, (float32x4_t)buf.columns[v113], 2), v117, (float32x4_t)buf.columns[v113], 3);
        ++v113;
      }
      while (v113 != 4);
      REMakeSRTFromMatrix();
      RETransformComponentSetLocalSRT();
      RENetworkMarkComponentDirty();
    }
  }
  if (__p)
  {
    v187 = __p;
    operator delete(__p);
  }

  if (v206)
  {
    v207 = v206;
    operator delete(v206);
  }

LABEL_82:
  REAnchorComponentSetEnableShadows();
  if (!ComponentByClass)
  {
    REClientAnchorSyncComponentGetComponentType();
    uint64_t v118 = REEntityGetComponentByClass();
    char v119 = rf::helpers::needAnchoringInClientProcessForEntity((unsigned char *)(a1 + 161), a2);
    rf::helpers::isRemotelyOwned();
    if (*(unsigned char *)(a1 + 160)) {
      char v120 = v119 ^ 1;
    }
    else {
      char v120 = v118 == 0;
    }
    if ((v120 & 1) == 0)
    {
      RENetworkComponentGetComponentType();
      uint64_t v121 = REEntityGetComponentByClass();
      if (v121) {
        MEMORY[0x237DED990](v121, v10);
      }
    }
    REEntityAddExistingComponent();
  }
  rf::helpers::getRFUUIDFromAnchor(a3, (uint64_t)v210);
  uint64_t v122 = (rf *)relocalizeEntityIfNeeded((uint64_t)v210, a5);
  if (v122)
  {
    v123 = rf::realityFusionLogObject(v122);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v124 = REEntityGetName();
      uint64_t LocalId = REEntityGetLocalId();
      rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v210, &buf);
      if (buf.columns[1].i8[7] >= 0) {
        p_simd_float4x4 buf = &buf;
      }
      else {
        p_simd_float4x4 buf = (simd_float4x4 *)buf.columns[0].i64[0];
      }
      *(_DWORD *)uuid_t uu = 136315650;
      *(void *)&uu[4] = v124;
      *(_WORD *)&uu[12] = 2048;
      *(void *)&uu[14] = LocalId;
      *(_WORD *)&uu[22] = 2080;
      *(void *)&uu[24] = p_buf;
      _os_log_impl(&dword_235A7C000, v123, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Relocalizing entity %s, %llu for in-place re-anchoring with identifier %s", uu, 0x20u);
      if (buf.columns[1].i8[7] < 0) {
        operator delete((void *)buf.columns[0].i64[0]);
      }
    }
  }
  RERelease();
  return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v189);
}

void sub_235AECFB8(_Unwind_Exception *a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&STACK[0x210]);
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2;
  int v4 = a3;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *, int *))(*(void *)a1 + 48))(a1, &v5, &v4);
}

void *rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, rf::helpers *a5)
{
  uint64_t v152 = *MEMORY[0x263EF8340];
  uint64_t v117 = a4;
  v141[0] = &unk_26E8F6840;
  v141[1] = &v117;
  float32x4_t v142 = v141;
  switch(REAnchoringComponentGetDescriptorType())
  {
    case 0u:
      if (rf::helpers::getInternalActiveCamera())
      {
        REEntityGetComponent();
        WorldMatrix4x4F = (rf::helpers *)RETransformComponentGetWorldMatrix4x4F();
        long long v110 = v10;
        long long v112 = v9;
        long long v106 = v12;
        long long v108 = v11;
        uint64_t v13 = rf::helpers::kCameraIdentifier(WorldMatrix4x4F);
        long long v14 = v13[1];
        *(_OWORD *)a1 = *v13;
        *(_OWORD *)(a1 + 16) = v14;
        *(_OWORD *)(a1 + 32) = v112;
        *(_OWORD *)(a1 + 48) = v110;
        *(_OWORD *)(a1 + 64) = v108;
        *(_OWORD *)(a1 + 80) = v106;
        *(void *)(a1 + 96) = 16842752;
        *(unsigned char *)(a1 + 104) = 0;
        *(void *)(a1 + 112) = 0;
      }
      else
      {
        CameraAnchor = rf::helpers::getCameraAnchor(a5);
        long long v63 = *(_OWORD *)CameraAnchor;
        long long v64 = *((_OWORD *)CameraAnchor + 2);
        *(_OWORD *)(a1 + 16) = *((_OWORD *)CameraAnchor + 1);
        *(_OWORD *)(a1 + 32) = v64;
        *(_OWORD *)a1 = v63;
        long long v65 = *((_OWORD *)CameraAnchor + 3);
        long long v66 = *((_OWORD *)CameraAnchor + 4);
        long long v67 = *((_OWORD *)CameraAnchor + 5);
        *(_OWORD *)(a1 + 89) = *(_OWORD *)((char *)CameraAnchor + 89);
        *(_OWORD *)(a1 + 64) = v66;
        *(_OWORD *)(a1 + 80) = v67;
        *(_OWORD *)(a1 + 48) = v65;
        *(void *)(a1 + 112) = (id)CameraAnchor[14];
      }
      *(_DWORD *)(a1 + 256) = 0;
      goto LABEL_55;
    case 1u:
      REAnchoringComponentGetWorldTransformOfDescriptorTransform();
      float32x4_t v107 = v29;
      float32x4_t v109 = v28;
      float32x4_t v111 = v30;
      long long v113 = v31;
      LOBYTE(v121) = 0;
      *((void *)&v121 + 1) = 0;
      uuid_clear(v120);
      float32x4_t v32 = v107;
      float32x4_t v33 = vmulq_f32(v109, v109);
      float32x4_t v37 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1)));
      v37.f32[0] = sqrtf(v37.f32[0]);
      float32x4_t v34 = vmulq_f32(v32, v32);
      float32x4_t v35 = v111;
      float32x4_t v36 = vmulq_f32(v35, v35);
      v37.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v34, 2), vaddq_f32(v34, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v34.f32, 1))).f32[0]);
      v37.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).f32[0]);
      float32x4_t v38 = vmulq_f32(v109, vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(vextq_s8((int8x16_t)v35, (int8x16_t)v35, 0xCuLL), (int8x16_t)v111, 8uLL), vnegq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v32, (int32x4_t)v32), (int8x16_t)v107, 0xCuLL))), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v111, 0xCuLL), (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v32, (int8x16_t)v32, 0xCuLL), (int8x16_t)v107, 8uLL)));
      int32x2_t v40 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v38, 2), vaddq_f32(v38, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v38.f32, 1))).u64[0];
      BOOL v39 = *(float *)v40.i32 <= 0.0;
      v40.i32[0] = -1.0;
      if (!v39) {
        *(float *)v40.i32 = 1.0;
      }
      float32x4_t v41 = vmulq_n_f32(v37, *(float *)v40.i32);
      v40.i32[0] = v41.i32[2];
      double v42 = fabsf(v41.f32[2]);
      if (v42 <= 0.00001) {
        *(float *)v40.i32 = 1.0;
      }
      float32x4_t v43 = (float32x4_t)vdupq_lane_s32(v40, 0);
      LODWORD(v42) = v41.i32[1];
      if (fabsf(v41.f32[1]) <= 0.00001) {
        *(float *)&double v42 = 1.0;
      }
      float32x4_t v44 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v42, 0);
      if (fabsf(v41.f32[0]) <= 0.00001) {
        v41.f32[0] = 1.0;
      }
      float32x4_t v122 = vdivq_f32(v109, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0));
      float32x4_t v123 = vdivq_f32(v107, v44);
      float32x4_t v124 = vdivq_f32(v111, v43);
      *(_OWORD *)v125 = v113;
      *(_DWORD *)&v125[16] = 16842752;
      *(_DWORD *)&v125[20] = 0;
      v125[24] = 0;
      *(_OWORD *)uuid_t uu = *(_OWORD *)v120;
      long long v144 = v121;
      float32x4_t v147 = v124;
      v148[0] = v113;
      *(_OWORD *)((char *)v148 + 9) = *(_OWORD *)&v125[9];
      float32x4_t v145 = v122;
      float32x4_t v146 = v123;
      uint64_t v149 = 0;
      int v150 = 0;
      if (*(void *)(a2 + 88))
      {
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v140, (uint64_t)uu);
        uint64_t v45 = *(void *)(a2 + 88);
        if (!v45) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        (*(void (**)(unsigned __int8 *__return_ptr))(*(void *)v45 + 48))(v120);
        if (v150) {
          std::__throw_bad_variant_access[abi:ne180100]();
        }
        *(_OWORD *)uuid_t uu = *(_OWORD *)v120;
        long long v144 = v121;
        std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v140);
      }
      uint64_t v46 = *(void *)(a2 + 120);
      if (v46) {
        std::function<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::operator()(v46, (uint64_t)uu);
      }
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(a1, (uint64_t)uu);
      *(unsigned char *)(a1 + 272) = 1;
      goto LABEL_59;
    case 2u:
      Descriptoruint64_t AnchorIdentifier = (char *)REAnchoringComponentGetDescriptorAnchorIdentifier();
      *((void *)&v135 + 1) = a5;
      p_Descriptoruint64_t AnchorIdentifier = (uint64_t *)&DescriptorAnchorIdentifier;
      LOBYTE(v137) = 1;
      char v138 = 0;
      char v139 = 0;
      if (!ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>>((uint64_t)&v135)) {
        goto LABEL_11;
      }
      BOOL v16 = ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>>((uint64_t)&v135);
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)uu, (uint64_t)(v16 + 6));
      if (v150 == -1) {
        std::__throw_bad_variant_access[abi:ne180100]();
      }
      *(void *)uuid_t v120 = &v118;
      ((void (*)(long long *__return_ptr, unsigned __int8 *, unsigned __int8 *))off_26E8F67D0[v150])(&v128, v120, uu);
      id v17 = v134;
      float32x4_t v124 = v132;
      *(_OWORD *)v125 = v133[0];
      *(_OWORD *)&v125[9] = *(_OWORD *)((char *)v133 + 9);
      *(_OWORD *)uuid_t v120 = v128;
      long long v121 = v129;
      float32x4_t v122 = v130;
      float32x4_t v123 = v131;
      id v126 = v17;
      int v127 = 0;
      if (!v142) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      if ((*(unsigned int (**)(void *, unsigned __int8 *))(*v142 + 48))(v142, v120))
      {
        std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(a1, (uint64_t)v120);
        char v18 = 1;
      }
      else
      {
        char v18 = 0;
        *(unsigned char *)a1 = 0;
      }
      *(unsigned char *)(a1 + 272) = v18;
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v120);

LABEL_59:
      std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
      return std::__function::__value_func<BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__value_func[abi:ne180100](v141);
    case 3u:
      Entity = (rf::PlacementComponentTypeInfo *)REComponentGetEntity();
      uint64_t v20 = rf::PlacementComponentTypeInfo::instance(Entity);
      if (!*v20 || (uint64_t v21 = v20, (CustomComponent = REEntityGetCustomComponent()) == 0))
      {
        if (rf::helpers::getInternalActiveCamera())
        {
          REEntityGetComponent();
          RETransformComponentGetWorldMatrix4x4F();
          *(_OWORD *)uuid_t uu = v57;
          long long v144 = v58;
          float32x4_t v59 = uu;
          float32x4_t v145 = v60;
          float32x4_t v146 = v61;
        }
        else
        {
          uu[0] = 0;
          float32x4_t v59 = (unsigned __int8 *)(rf::helpers::getCameraAnchor(a5) + 4);
        }
        long long v68 = *((_OWORD *)v59 + 1);
        long long v128 = *(_OWORD *)v59;
        long long v129 = v68;
        float32x4_t v69 = *((float32x4_t *)v59 + 3);
        float32x4_t v130 = *((float32x4_t *)v59 + 2);
        float32x4_t v131 = v69;
        *((void *)&v121 + 1) = a5;
        v122.i64[0] = v117;
        v122.i8[8] = 1;
        v123.i8[0] = 0;
        v123.i8[8] = 0;
        v124.i8[0] = (char)a5;
        v124.i8[7] = HIBYTE(a5);
        *(__int16 *)((char *)&v124.i16[2] + 1) = HIDWORD(a5) >> 8;
        *(__int32 *)((char *)v124.i32 + 1) = (unint64_t)a5 >> 8;
        v124.i64[1] = (uint64_t)&v128;
        v125[0] = 1;
        v125[8] = 0;
        LOBYTE(v126) = 0;
        for (i = (void *)*((void *)a5 + 2); i; i = (void *)*i)
        {
          if (rf::helpers::planeAnchorMatches((uint64_t)(i + 6))) {
            break;
          }
        }
        v123.i64[0] = (uint64_t)i;
        v123.i8[8] = 1;
        *(void *)uuid_t uu = i;
        *(void *)&uu[8] = &v121;
        *(void *)&long long v144 = &v124;
        ranges::remove_if_view<ranges::transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_5>>::satisfy_forward((uint64_t)uu, v50, v51, v52, v53, v54, v55, v56);
        *(_OWORD *)&v125[8] = *(_OWORD *)uu;
        *(void *)&v125[24] = v144;
        LOBYTE(v126) = 1;
        long long v135 = *(_OWORD *)uu;
        unint64_t v115 = 0;
        unint64_t v116 = 0;
        Descriptoruint64_t AnchorIdentifier = 0;
        p_Descriptoruint64_t AnchorIdentifier = (uint64_t *)v144;
        float32x4_t v137 = v120;
        uint64_t v118 = (uint64_t *)&DescriptorAnchorIdentifier;
        char v119 = 0;
        while ((void)v135)
        {
          ranges::basic_iterator<ranges::adaptor_cursor<ranges::basic_iterator<ranges::adaptor_cursor<std::__hash_map_const_iterator<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>,void *> *>>,ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>>::adaptor>>,ranges::iter_transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,ranges::indirected<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>>::adaptor<false>>>::operator*((uint64_t)uu, v135, (uint64_t)p_DescriptorAnchorIdentifier, v71, v72, v73, v74, v75);
          if (v115 >= v116)
          {
            unint64_t v78 = 0x8E38E38E38E38E39 * ((uint64_t)(v115 - (void)DescriptorAnchorIdentifier) >> 5);
            unint64_t v79 = v78 + 1;
            if (v78 + 1 > 0xE38E38E38E38E3) {
              std::vector<int>::__throw_length_error[abi:ne180100]();
            }
            if (0x1C71C71C71C71C72 * ((uint64_t)(v116 - (void)DescriptorAnchorIdentifier) >> 5) > v79) {
              unint64_t v79 = 0x1C71C71C71C71C72 * ((uint64_t)(v116 - (void)DescriptorAnchorIdentifier) >> 5);
            }
            if (0x8E38E38E38E38E39 * ((uint64_t)(v116 - (void)DescriptorAnchorIdentifier) >> 5) >= 0x71C71C71C71C71) {
              unint64_t v80 = 0xE38E38E38E38E3;
            }
            else {
              unint64_t v80 = v79;
            }
            if (v80)
            {
              if (v80 > 0xE38E38E38E38E3) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              float32x4_t v81 = (char *)operator new(288 * v80);
            }
            else
            {
              float32x4_t v81 = 0;
            }
            float32x4_t v82 = &v81[288 * v80];
            uint64_t v83 = std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)&v81[288 * v78], (uint64_t)uu);
            *(void *)(v83 + 272) = v151;
            unint64_t v77 = v83 + 288;
            uint64_t v85 = (uint64_t)DescriptorAnchorIdentifier;
            float32x4_t v84 = (char *)v115;
            if ((char *)v115 == DescriptorAnchorIdentifier)
            {
              Descriptoruint64_t AnchorIdentifier = (char *)v83;
              unint64_t v115 = v83 + 288;
              unint64_t v116 = (unint64_t)v82;
            }
            else
            {
              do
              {
                uint64_t v86 = v83;
                uint64_t v83 = std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v83 - 288, (uint64_t)(v84 - 288));
                *(void *)(v86 - 16) = *((void *)v84 - 2);
                v84 -= 288;
              }
              while (v84 != (char *)v85);
              float32x4_t v84 = DescriptorAnchorIdentifier;
              uint64_t v87 = v115;
              Descriptoruint64_t AnchorIdentifier = (char *)v83;
              unint64_t v115 = v77;
              unint64_t v116 = (unint64_t)v82;
              while ((char *)v87 != v84)
              {
                v87 -= 288;
                std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor(v87);
              }
            }
            if (v84) {
              operator delete(v84);
            }
          }
          else
          {
            uint64_t v76 = std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor(v115, (uint64_t)uu);
            *(void *)(v76 + 272) = v151;
            unint64_t v77 = v76 + 288;
          }
          unint64_t v115 = v77;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
          for (j = *(void **)v135; ; j = (void *)*j)
          {
            *(void *)&long long v135 = j;
            if (!j || rf::helpers::planeAnchorMatches((uint64_t)(j + 6))) {
              break;
            }
          }
          ranges::remove_if_view<ranges::transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_5>>::satisfy_forward((uint64_t)&v135, v88, v89, v90, v91, v92, v93, v94);
        }
        uint64_t v96 = (uint64_t)DescriptorAnchorIdentifier;
        uint64_t v97 = v115;
        if (DescriptorAnchorIdentifier != (char *)v115)
        {
          uint64_t v98 = v115 - (void)DescriptorAnchorIdentifier;
          if (v115 - (void)DescriptorAnchorIdentifier == 288)
          {
            ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>((uint64_t)DescriptorAnchorIdentifier, v115, 0, (uint64_t)&v135);
          }
          else
          {
            uint64_t v99 = 0;
            uint64_t v100 = 0x8E38E38E38E38E39 * (v98 >> 5);
            do
            {
              v100 >>= 1;
              v99 += 2;
            }
            while (v100 != 1);
            ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>((uint64_t)DescriptorAnchorIdentifier, v115, v99, (uint64_t)&v135);
            if (v98 >= 4609)
            {
              uint64_t v101 = v96 + 4608;
              ranges::detail::insertion_sort<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(v96, v96 + 4608);
              if (v96 + 4608 != v97)
              {
                do
                {
                  std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)uu, v101);
                  uint64_t v151 = *(void *)(v101 + 272);
                  if ((v151 & 0xFF00000000) == 0) {
LABEL_112:
                  }
                    std::__throw_bad_optional_access[abi:ne180100]();
                  uint64_t v102 = v96;
                  while (1)
                  {
                    if (!*(unsigned char *)(v102 + 4596)) {
                      goto LABEL_112;
                    }
                    if (*(float *)&v151 >= *(float *)(v102 + 4592)) {
                      break;
                    }
                    std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v102 + 4608, v102 + 4320);
                    *(_DWORD *)(v102 + 4880) = *(_DWORD *)(v102 + 4592);
                    *(unsigned char *)(v102 + 4884) = *(unsigned char *)(v102 + 4596);
                    v102 -= 288;
                    if (!BYTE4(v151)) {
                      goto LABEL_112;
                    }
                  }
                  std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v102 + 4608, (uint64_t)uu);
                  char v103 = BYTE4(v151);
                  *(_DWORD *)(v102 + 4880) = v151;
                  *(unsigned char *)(v102 + 4884) = v103;
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)uu);
                  v101 += 288;
                  v96 += 288;
                }
                while (v101 != v97);
              }
              goto LABEL_107;
            }
          }
          ranges::detail::insertion_sort<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(v96, v97);
        }
LABEL_107:
        if ((char *)v115 == DescriptorAnchorIdentifier)
        {
          char v104 = 0;
          *(unsigned char *)a1 = 0;
        }
        else
        {
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)DescriptorAnchorIdentifier);
          char v104 = 1;
        }
        *(unsigned char *)(a1 + 272) = v104;
        *(void *)uuid_t uu = &DescriptorAnchorIdentifier;
        std::vector<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)uu);
        return std::__function::__value_func<BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__value_func[abi:ne180100](v141);
      }
      v23 = (_OWORD *)std::function<unsigned char const* ()(REComponent *)>::operator()((uint64_t)(v21 + 1), CustomComponent);
      LOBYTE(v144) = 0;
      *((void *)&v144 + 1) = 0;
      uuid_clear(uu);
      *(_OWORD *)uuid_t uu = *v23;
      long long v24 = std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(a5, (uint64_t)uu);
      if (v24)
      {
        if (!v142) {
          std::__throw_bad_function_call[abi:ne180100]();
        }
        uint64_t v25 = (uint64_t)(v24 + 6);
        if ((*(unsigned int (**)(void *, void *))(*v142 + 48))(v142, v24 + 6))
        {
          std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, v25);
          goto LABEL_55;
        }
      }
LABEL_50:
      char v49 = 0;
      *(unsigned char *)a1 = 0;
LABEL_56:
      *(unsigned char *)(a1 + 272) = v49;
      return std::__function::__value_func<BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__value_func[abi:ne180100](v141);
    case 4u:
      *(void *)&uu[8] = a5;
      *(void *)&long long v144 = &v117;
      BYTE8(v144) = 1;
      v145.i8[0] = 0;
      v145.i8[8] = 0;
      if (!ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>>((uint64_t)uu)) {
        goto LABEL_50;
      }
      char v15 = ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>>((uint64_t)uu);
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)(v15 + 6));
      goto LABEL_55;
    case 5u:
      *(void *)&uu[8] = a5;
      *(void *)&long long v144 = &v117;
      BYTE8(v144) = 1;
      v145.i8[0] = 0;
      v145.i8[8] = 0;
      if (!ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>>((uint64_t)uu)) {
        goto LABEL_50;
      }
      float32x4_t v47 = ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>>((uint64_t)uu);
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)(v47 + 6));
      goto LABEL_55;
    case 6u:
      simd_float4 v26 = (uint64_t *)*((void *)a5 + 2);
      if (!v26) {
        goto LABEL_50;
      }
      while (*((_DWORD *)v26 + 76) != 4 || *((unsigned char *)v26 + 147) == 0)
      {
        simd_float4 v26 = (uint64_t *)*v26;
        if (!v26) {
          goto LABEL_50;
        }
      }
      goto LABEL_23;
    case 7u:
      simd_float4 v26 = (uint64_t *)*((void *)a5 + 2);
      if (!v26) {
        goto LABEL_50;
      }
      while (*((_DWORD *)v26 + 76) != 5 || *((unsigned char *)v26 + 147) == 0)
      {
        simd_float4 v26 = (uint64_t *)*v26;
        if (!v26) {
          goto LABEL_50;
        }
      }
LABEL_23:
      std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, (uint64_t)(v26 + 6));
LABEL_55:
      char v49 = 1;
      goto LABEL_56;
    default:
LABEL_11:
      *(unsigned char *)a1 = 0;
      *(unsigned char *)(a1 + 272) = 0;
      return std::__function::__value_func<BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__value_func[abi:ne180100](v141);
  }
}

void sub_235AEDBC8(_Unwind_Exception *a1)
{
}

rf *rf::data_flow::consumer::AnchorManagementConsumer::updateEntityWithAnchor(uint64_t a1, uint64_t a2, uint64_t a3, rf::helpers *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  REAnchorComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REAnchoringComponentGetComponentType();
  uint64_t ComponentByClass = REEntityGetComponentByClass();
  rf::helpers::getRFUUIDFromAnchor(a3, (uint64_t)v23);
  unint64_t v8 = (rf *)relocalizeEntityIfNeeded((uint64_t)v23, a4);
  if (v8)
  {
    long long v9 = rf::realityFusionLogObject(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t Name = REEntityGetName();
      uint64_t LocalId = REEntityGetLocalId();
      rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)v23, __p);
      long long v12 = v28 >= 0 ? __p : *(unsigned char **)__p;
      *(_DWORD *)simd_float4x4 buf = 136315650;
      *(void *)&uint8_t buf[4] = Name;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = LocalId;
      __int16 v21 = 2080;
      __int16 v22 = v12;
      _os_log_impl(&dword_235A7C000, v9, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Relocalizing entity %s, %llu, holding anchor with identifier %s", buf, 0x20u);
      if (v28 < 0) {
        operator delete(*(void **)__p);
      }
    }

    uint64_t v13 = *(void *)(a1 + 48);
    if (v13)
    {
      *(void *)simd_float4x4 buf = a2;
      *(_DWORD *)__p = 5;
      (*(void (**)(uint64_t, unsigned char *, unsigned char *))(*(void *)v13 + 48))(v13, buf, __p);
    }
  }
  CameraAnchor = rf::helpers::getCameraAnchor(a4);
  rf::helpers::getTransformFromAnchor(a3, (uint64_t)&ComponentByClass, (uint64_t)(CameraAnchor + 4), a1 + 168, buf);
  REAnchorComponentSetWorldTransform();
  if (REAnchorComponentGetAnchoredLocally()) {
    return (rf *)rf::helpers::isRemotelyOwned();
  }
  REAnchorComponentSetAnchoredLocally();
  uint64_t result = (rf *)rf::helpers::isRemotelyOwned();
  if (result)
  {
    BOOL v16 = rf::realityFusionLogObject(result);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = REEntityGetName();
      rf::helpers::getRFUUIDFromAnchor(a3, (uint64_t)buf);
      rf::data_flow::RFUUID::string((rf::data_flow::RFUUID *)buf, v23);
      if (v24 >= 0) {
        char v18 = v23;
      }
      else {
        char v18 = (void **)v23[0];
      }
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = v17;
      __int16 v26 = 2080;
      simd_float4 v27 = v18;
      _os_log_impl(&dword_235A7C000, v16, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer: Anchoring remote entity %s to anchor %s.", __p, 0x16u);
      if (v24 < 0) {
        operator delete(v23[0]);
      }
    }

    uint64_t result = *(rf **)(a1 + 48);
    if (result) {
      return (rf *)std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()((uint64_t)result, a2, 1);
    }
  }
  return result;
}

void sub_235AEDFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void rf::data_flow::consumer::AnchorManagementConsumer::matchOrUpdateAnchorComponent(REScene *,REEntity *,REComponent *,REComponent *,rf::ARStateData const&,BOOL,unsigned long long &)::$_0::operator()(unint64_t **a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v1 = a1[1];
  unint64_t v2 = **a1 + 1;
  **a1 = v2;
  if (v2 >= v1[58])
  {
    int v4 = rf::realityFusionLogObject((rf *)a1);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = **a1;
      unint64_t v6 = v1[58];
      int v7 = 134218240;
      unint64_t v8 = v5;
      __int16 v9 = 2048;
      unint64_t v10 = v6;
      _os_log_error_impl(&dword_235A7C000, v4, OS_LOG_TYPE_ERROR, "AnchorManagementConsumer: %llu anchoring updated this frame, which more than %llu, this could cause backboardd hang", (uint8_t *)&v7, 0x16u);
    }
  }
}

uint64_t rf::data_flow::consumer::AnchorManagementConsumer::matchAndReanchorEntity(rf::PlacementComponentTypeInfo *a1, uint64_t a2, uint64_t a3, rf::helpers *a4)
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a3 + 256) != 1 || *rf::PlacementComponentTypeInfo::instance(a1) && REEntityGetCustomComponent()) {
    return 0;
  }
  if (*(_DWORD *)(a3 + 256) != 1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  long long v9 = *(_OWORD *)(a3 + 80);
  long long v98 = *(_OWORD *)(a3 + 64);
  v99[0] = v9;
  *(_OWORD *)((char *)v99 + 9) = *(_OWORD *)(a3 + 89);
  long long v10 = *(_OWORD *)(a3 + 16);
  long long v94 = *(_OWORD *)a3;
  long long v95 = v10;
  long long v11 = *(_OWORD *)(a3 + 32);
  long long v97 = *(_OWORD *)(a3 + 48);
  long long v96 = v11;
  id v100 = *(id *)(a3 + 112);
  long long v12 = *(_OWORD *)(a3 + 176);
  long long v103 = *(_OWORD *)(a3 + 160);
  long long v104 = v12;
  long long v105 = *(_OWORD *)(a3 + 192);
  long long v13 = *(_OWORD *)(a3 + 144);
  long long v101 = *(_OWORD *)(a3 + 128);
  long long v102 = v13;
  long long v14 = *(const void **)(a3 + 216);
  uint64_t v106 = *(void *)(a3 + 208);
  float32x4_t v107 = 0;
  uint64_t v15 = *(void *)(a3 + 224);
  uint64_t v109 = 0;
  long long v108 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&v107, v14, v15, (v15 - (uint64_t)v14) >> 4);
  REAnchoringComponentGetComponentType();
  uint64_t ComponentByClass = REEntityGetComponentByClass();
  if (REAnchoringComponentGetDescriptorType() == 3)
  {
    int DescriptorAlignment = REAnchoringComponentGetDescriptorAlignment();
    unint64_t DescriptorClassification = REAnchoringComponentGetDescriptorClassification();
    REAnchoringComponentGetDescriptorBounds();
    uint64_t v54 = v17;
    RETransformComponentGetComponentType();
    if (!REEntityGetComponentByClass())
    {
      char v18 = rf::realityFusionLogObject(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)simd_float4x4 buf = 136315138;
        *(void *)&uint8_t buf[4] = REEntityGetName();
        _os_log_impl(&dword_235A7C000, v18, OS_LOG_TYPE_DEFAULT, "AnchorManagementConsumer::matchAndReanchorEntity(): Transform component not found when attempting to match & reanchor entity %s, adding one", buf, 0xCu);
      }

      RETransformComponentGetComponentType();
      REEntityAddComponentByClass();
    }
    RETransformComponentGetLocalSRT();
    float32x4_t v50 = v19;
    CameraAnchor = rf::helpers::getCameraAnchor(a4);
    rf::helpers::getTransformFromAnchor(a3, (uint64_t)&ComponentByClass, (uint64_t)(CameraAnchor + 4), (uint64_t)a1 + 168, &v55);
    __int16 v21 = (void *)*((void *)a4 + 2);
    if (v21)
    {
      uint64_t v47 = (uint64_t)a1;
      float32x4_t v22 = vaddq_f32(v58, vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v55, v50.f32[0]), (float32x4_t)0, v56), v57, v50, 2));
      float32x4_t v48 = vdivq_f32(v22, (float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 3));
      float32x4_t v49 = vmlaq_f32(vaddq_f32(vmulq_f32(v55, (float32x4_t)0), v56), (float32x4_t)0, v57);
      float32x4_t v51 = vnegq_f32(v49);
      float32x4_t v52 = vaddq_f32(v48, vmulq_f32(v49, (float32x4_t)vdupq_n_s32(0x3D4CCCCDu)));
      float32x2_t v23 = (float32x2_t)vdup_n_s32(0x3DCCCCCDu);
      while (1)
      {
        std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)buf, (uint64_t)(v21 + 6));
        if (v93 != 1)
        {
          std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
          goto LABEL_31;
        }
        float32x4_t v66 = (float32x4_t)v82;
        v67[0] = *(float32x4_t *)v83;
        *(float32x4_t *)((char *)v67 + 9) = *(float32x4_t *)&v83[9];
        long long v62 = *(_OWORD *)buf;
        long long v63 = v79;
        float32x4_t v64 = (float32x4_t)v80;
        float32x4_t v65 = v81;
        id v68 = v84;
        simd_float4 v71 = v87;
        simd_float4 v72 = v88;
        long long v73 = v89;
        uint64_t v74 = v90;
        simd_float4 v69 = v85;
        simd_float4 v70 = v86;
        uint64_t v76 = 0;
        uint64_t v77 = 0;
        __p = 0;
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(&__p, v91, v92, (v92 - (uint64_t)v91) >> 4);
        char v24 = (_BYTE)v63 ? (const unsigned __int8 *)v62 : (const unsigned __int8 *)&v62;
        uint64_t v25 = (_BYTE)v95 ? (const unsigned __int8 *)v94 : (const unsigned __int8 *)&v94;
        if (!uuid_compare(v24, v25)) {
          break;
        }
        if (DescriptorAlignment != 255)
        {
          if (v74)
          {
            if (v74 != 1 || (DescriptorAlignment & 2) == 0) {
              break;
            }
          }
          else if ((DescriptorAlignment & 1) == 0)
          {
            break;
          }
        }
        uint64_t v27 = rf::helpers::classificationMatches(SHIDWORD(v74), DescriptorClassification);
        char v26 = 1;
        if (v27 && *(float *)&v73 >= *(float *)&v54 && *((float *)&v73 + 2) >= *((float *)&v54 + 1))
        {
          uint64_t v35 = rf::helpers::rayPlaneHitTestInBounds(v52, v51, (simd_float4)v64, v65, (simd_float4)v66, v67[0], v27, v28, v29, v30, v31, v32, v33, v34, v71, v72, v69, v70, (float32x4_t)v71);
          if ((v35 & 0xFF00000000) != 0)
          {
            if (*(float *)&v35 == 0.0) {
              unsigned __int8 v36 = 0;
            }
            else {
              unsigned __int8 v36 = -127;
            }
            if (*(float *)&v35 > 0.0) {
              unsigned __int8 v36 = 1;
            }
            if (*(float *)&v35 < 0.0) {
              unsigned __int8 v36 = -1;
            }
          }
          else
          {
            unsigned __int8 v36 = -1;
          }
          if (v36 == 129 || (v36 & 0x80) == 0)
          {
            uint64_t v37 = 0;
            float32x4_t v38 = v64;
            float32x4_t v39 = v65;
            float32x4_t v40 = v66;
            float32x4_t v41 = v67[0];
            v60[0] = v69;
            v60[1] = v70;
            v60[2] = v71;
            v60[3] = v72;
            do
            {
              v60[v37 + 4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v38, COERCE_FLOAT(v60[v37])), v39, *(float32x2_t *)&v60[v37], 1), v40, (float32x4_t)v60[v37], 2), v41, (float32x4_t)v60[v37], 3);
              ++v37;
            }
            while (v37 != 4);
            float32x4_t v42 = vmlaq_f32(vaddq_f32(vmulq_f32(v38, (float32x4_t)0), v39), (float32x4_t)0, v40);
            int8x16_t v43 = (int8x16_t)vabdq_f32(v49, v42);
            char v26 = 1;
            if (*(float *)v43.i32 <= 0.1)
            {
              v43.i32[0] = vextq_s8(v43, v43, 8uLL).u32[0];
              *(int32x2_t *)v43.i8 = vcgt_f32(*(float32x2_t *)v43.i8, v23);
              if ((v43.i8[4] & 1) == 0 && (v43.i8[0] & 1) == 0)
              {
                float32x4_t v44 = vmulq_f32(v42, vsubq_f32(v48, (float32x4_t)v60[7]));
                if (fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v44, 2), vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v44.f32, 1))).f32[0]) <= 0.05)
                {
                  std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor((uint64_t)v61, (uint64_t)buf);
                  rf::data_flow::consumer::AnchorManagementConsumer::anchorEntity(v47, a2, (uint64_t)v61, ComponentByClass, a4, 0);
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v61);
                  uint64_t v45 = *(void *)(v47 + 48);
                  if (v45) {
                    std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator()(v45, a2, 1);
                  }
                  RETransformComponentGetLocalSRT();
                  RETransformComponentSetLocalSRT();
                  char v26 = 0;
                }
              }
            }
          }
        }
LABEL_26:
        if (__p)
        {
          uint64_t v76 = __p;
          operator delete(__p);
        }

        std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)buf);
        if ((v26 & 1) == 0)
        {
          uint64_t v8 = 1;
          goto LABEL_58;
        }
LABEL_31:
        __int16 v21 = (void *)*v21;
        if (!v21) {
          goto LABEL_57;
        }
      }
      char v26 = 1;
      goto LABEL_26;
    }
  }
LABEL_57:
  uint64_t v8 = 0;
LABEL_58:
  if (v107)
  {
    long long v108 = v107;
    operator delete(v107);
  }

  return v8;
}

void sub_235AEE6BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t std::function<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (!a1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 48))(a1, &v3);
}

void *std::function<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::swap[abi:ne180100](v4, a1);
  std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::~__value_func[abi:ne180100](v4);
  return a1;
}

void *std::function<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::swap[abi:ne180100](v4, a1);
  std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::~__value_func[abi:ne180100](v4);
  return a1;
}

void *std::function<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::swap[abi:ne180100](v4, a1);
  std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::~__value_func[abi:ne180100](v4);
  return a1;
}

void *std::function<void ()(NSSet<ARReferenceImage *> *)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::__value_func[abi:ne180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::swap[abi:ne180100](v4, a1);
  std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::~__value_func[abi:ne180100](v4);
  return a1;
}

uint64_t relocalizeEntityIfNeeded(uint64_t a1, void *a2)
{
  uint64_t result = REAnchorComponentGetIsAnchorExternal();
  if (result)
  {
    uint64_t result = (uint64_t)std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,std::shared_ptr<rf::data_flow::consumer::Mesh>>>>::find<rf::data_flow::RFUUID>(a2, a1);
    if (result)
    {
      REAnchorComponentSetIsAnchorExternal();
      if (REAnchorComponentGetSendIsAnchoredToClient()) {
        RENetworkMarkComponentDirty();
      }
      return 1;
    }
  }
  return result;
}

void rf::data_flow::consumer::AnchorManagementConsumer::~AnchorManagementConsumer(id *this)
{
  *this = &unk_26E8F6738;
  std::__hash_table<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>>>::~__hash_table((uint64_t)(this + 59));
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::~__hash_table((uint64_t)(this + 52));

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 45));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 40));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 35));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 30));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 25));
  RESharedPtr<REAsset>::~RESharedPtr(this + 23);
  std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::~__value_func[abi:ne180100](this + 16);
  std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::~__value_func[abi:ne180100](this + 12);
  std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::~__value_func[abi:ne180100](this + 8);
  std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::~__value_func[abi:ne180100](this + 3);
}

{
  uint64_t vars8;

  *this = &unk_26E8F6738;
  std::__hash_table<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>>>::~__hash_table((uint64_t)(this + 59));
  std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::~__hash_table((uint64_t)(this + 52));

  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 45));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 40));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 35));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 30));
  std::__hash_table<std::__hash_value_type<unsigned long,unsigned long>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,unsigned long>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,unsigned long>>>::~__hash_table((uint64_t)(this + 25));
  RESharedPtr<REAsset>::~RESharedPtr(this + 23);
  std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::~__value_func[abi:ne180100](this + 16);
  std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::~__value_func[abi:ne180100](this + 12);
  std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::~__value_func[abi:ne180100](this + 8);
  std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::~__value_func[abi:ne180100](this + 3);
  JUMPOUT(0x237DEE2B0);
}

uint64_t std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t ranges::remove_if_view<std::span<REComponent *,18446744073709551615ul>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>>::satisfy_forward(uint64_t result, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = result + 8 * a2;
  if (*a3 != v3)
  {
    do
    {
      uint64_t Object = RECustomComponentGetObject();
      uint64_t result = REComponentGetEntity();
      if (*(unsigned char *)(Object + 21))
      {
        uint64_t result = rf::helpers::isRemotelyOwned();
        if (!result) {
          break;
        }
      }
      uint64_t v6 = *a3 + 8;
      *a3 = v6;
    }
    while (v6 != v3);
  }
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  uint64_t result = RENetworkMarkComponentDirty();
  *(unsigned char *)(**(void **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t ***a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  RENetworkMarkComponentDirty();
  uint64_t v4 = **v3;
  *(unsigned char *)(v4 + 72) = 0;
  long long v8 = *(_OWORD *)(a2 + 192);
  long long v9 = 0u;
  long long v5 = *(_OWORD *)(a2 + 176);
  long long v6 = v8;
  DWORD1(v6) = DWORD1(v9);
  *(_DWORD *)(v4 + 16) = 1;
  *(_OWORD *)(v4 + 32) = v5;
  *(_OWORD *)(**v3 + 48) = v6;
  return RENetworkMarkComponentDirty();
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  uint64_t result = RENetworkMarkComponentDirty();
  *(unsigned char *)(**(void **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  uint64_t result = RENetworkMarkComponentDirty();
  *(unsigned char *)(**(void **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  uint64_t result = RENetworkMarkComponentDirty();
  *(unsigned char *)(**(void **)v1 + 72) = 0;
  return result;
}

uint64_t std::__variant_detail::__visitation::__base::__dispatcher<5ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::updateAnchorDefinitionComponents(REScene *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>(uint64_t *a1)
{
  uint64_t v1 = *a1;
  RETransformComponentGetComponentType();
  REEntityGetOrAddComponentByClass();
  REMakeSRTFromMatrix();
  RETransformComponentSetWorldSRT();
  uint64_t result = RENetworkMarkComponentDirty();
  *(unsigned char *)(**(void **)v1 + 72) = 0;
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ARReferenceImage * {__strong}>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ARReferenceImage * {__strong}>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void *ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_1>>>(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 40)) {
    return *(void **)(a1 + 32);
  }
  for (i = *(void **)(*(void *)(a1 + 8) + 16); i; i = (void *)*i)
  {
    rf::helpers::getRFUUIDFromAnchor((uint64_t)(i + 6), (uint64_t)v5);
    if (v6) {
      uint64_t v3 = (const unsigned __int8 *)v5[0];
    }
    else {
      uint64_t v3 = (const unsigned __int8 *)v5;
    }
    if (!uuid_compare(v3, **(const unsigned __int8 ***)(a1 + 16))) {
      break;
    }
  }
  *(void *)(a1 + 32) = i;
  *(unsigned char *)(a1 + 40) = 1;
  return i;
}

id std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  id result = *(id *)(a1 + 112);
  *(void *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<1ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  id result = *(id *)(a1 + 112);
  *(void *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<2ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  id result = *(id *)(a1 + 112);
  *(void *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<3ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  id result = *(id *)(a1 + 112);
  *(void *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<4ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  id result = *(id *)(a1 + 112);
  *(void *)(a2 + 112) = result;
  return result;
}

id std::__variant_detail::__visitation::__base::__dispatcher<5ul>::__dispatch[abi:ne180100]<std::__variant_detail::__visitation::__variant::__value_visitor<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_2> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> &>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  long long v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v3;
  *(_OWORD *)(a2 + 89) = *(_OWORD *)(a1 + 89);
  long long v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  long long v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 48) = v5;
  id result = *(id *)(a1 + 112);
  *(void *)(a2 + 112) = result;
  return result;
}

void std::vector<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    long long v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor(v4 - 288);
      while ((void *)v4 != v2);
      long long v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_7>>>(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    return *(void **)(a1 + 32);
  }
  for (i = *(void **)(*(void *)(a1 + 8) + 16); i; i = (void *)*i)
  {
    if (rf::helpers::imageAnchorMatches((uint64_t)(i + 6), **(void **)(a1 + 16), 1)) {
      break;
    }
  }
  *(void *)(a1 + 32) = i;
  *(unsigned char *)(a1 + 40) = 1;
  return i;
}

void *ranges::view_facade<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>,(ranges::cardinality)-1>::begin<ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_8>>>(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    return *(void **)(a1 + 32);
  }
  for (i = *(void **)(*(void *)(a1 + 8) + 16); i; i = (void *)*i)
  {
    if (rf::helpers::objectAnchorMatches((uint64_t)(i + 6))) {
      break;
    }
  }
  *(void *)(a1 + 32) = i;
  *(unsigned char *)(a1 + 40) = 1;
  return i;
}

uint64_t ___ZZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorENK3__0cvU13block_pointerF20REEventHandlerResultPvPKvEEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(int8x8_t **)(a1 + 32);
  unint64_t v2 = v1 + 52;
  long long v3 = (unsigned __int8 *)(a1 + 40);
  v25[0] = (long long *)(a1 + 40);
  if (*((void *)std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&v1[52], (unsigned __int8 *)(a1 + 40), v25)+ 8))
  {
    unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v1[55], (uint64_t)v3);
    int8x8_t v5 = v1[53];
    if (v5)
    {
      unint64_t v6 = v4;
      uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
      v7.i16[0] = vaddlv_u8(v7);
      unint64_t v8 = v7.u32[0];
      if (v7.u32[0] > 1uLL)
      {
        unint64_t v9 = v4;
        if (v4 >= *(void *)&v5) {
          unint64_t v9 = v4 % *(void *)&v5;
        }
      }
      else
      {
        unint64_t v9 = (*(void *)&v5 - 1) & v4;
      }
      long long v10 = *(int8x8_t ***)(*(void *)v2 + 8 * v9);
      if (v10)
      {
        for (i = *v10; i; i = (int8x8_t *)*i)
        {
          unint64_t v12 = (unint64_t)i[1];
          if (v12 == v6)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)&v1[56], (unsigned __int8 *)&i[2], v3))
            {
              int8x8_t v13 = v1[53];
              unint64_t v14 = (unint64_t)i[1];
              uint8x8_t v15 = (uint8x8_t)vcnt_s8(v13);
              v15.i16[0] = vaddlv_u8(v15);
              if (v15.u32[0] > 1uLL)
              {
                BOOL v16 = v1 + 55;
                if (v14 >= *(void *)&v13) {
                  v14 %= *(void *)&v13;
                }
              }
              else
              {
                v14 &= *(void *)&v13 - 1;
                BOOL v16 = v1 + 55;
              }
              uint64_t v17 = *(int8x8_t **)(*(void *)v2 + 8 * v14);
              do
              {
                char v18 = v17;
                uint64_t v17 = (int8x8_t *)*v17;
              }
              while (v17 != i);
              if (v18 == &v1[54]) {
                goto LABEL_36;
              }
              unint64_t v19 = (unint64_t)v18[1];
              if (v15.u32[0] > 1uLL)
              {
                if (v19 >= *(void *)&v13) {
                  v19 %= *(void *)&v13;
                }
              }
              else
              {
                v19 &= *(void *)&v13 - 1;
              }
              if (v19 != v14)
              {
LABEL_36:
                if (!*(void *)i) {
                  goto LABEL_37;
                }
                unint64_t v20 = *(void *)(*(void *)i + 8);
                if (v15.u32[0] > 1uLL)
                {
                  if (v20 >= *(void *)&v13) {
                    v20 %= *(void *)&v13;
                  }
                }
                else
                {
                  v20 &= *(void *)&v13 - 1;
                }
                if (v20 != v14) {
LABEL_37:
                }
                  *(void *)(*(void *)v2 + 8 * v14) = 0;
              }
              int8x8_t v21 = *i;
              if (*i)
              {
                unint64_t v22 = *(void *)(*(void *)&v21 + 8);
                if (v15.u32[0] > 1uLL)
                {
                  if (v22 >= *(void *)&v13) {
                    v22 %= *(void *)&v13;
                  }
                }
                else
                {
                  v22 &= *(void *)&v13 - 1;
                }
                if (v22 != v14)
                {
                  *(void *)(*(void *)v2 + 8 * v22) = v18;
                  int8x8_t v21 = *i;
                }
              }
              *char v18 = v21;
              int8x8_t *i = 0;
              --*(void *)v16;
              v25[0] = (long long *)i;
              v25[1] = (long long *)&v1[54];
              char v26 = 1;
              std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25);
              break;
            }
          }
          else
          {
            if (v8 > 1)
            {
              if (v12 >= *(void *)&v5) {
                v12 %= *(void *)&v5;
              }
            }
            else
            {
              v12 &= *(void *)&v5 - 1;
            }
            if (v12 != v9) {
              break;
            }
          }
        }
      }
    }
    if (v1[19])
    {
      id v23 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      std::function<void ()(NSSet<ARReferenceImage *> *)>::operator()((uint64_t)&v1[16], v23);
    }
  }
  return 1;
}

void sub_235AEF80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __copy_helper_block_ea8_32c128_ZTSKZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorE3__0(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  unint64_t v2 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v2, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
  }
  else
  {
    long long v3 = *(_OWORD *)(a2 + 40);
    v2->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
    *(_OWORD *)&v2->__r_.__value_.__l.__data_ = v3;
  }
}

void __destroy_helper_block_ea8_32c128_ZTSKZN2rf9data_flow8consumer24AnchorManagementConsumer37listenToSceneRemovalForReferenceAssetEP7RESceneP16REServiceLocatorE3__0(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

char *std::__hash_table<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, long long **a3)
{
  uint8x8_t v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    int8x8_t v13 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      unint64_t v14 = (char *)*v13;
      if (*v13)
      {
        do
        {
          unint64_t v15 = *((void *)v14 + 1);
          if (v15 == v9)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)v14 + 16, a2)) {
              return v14;
            }
          }
          else
          {
            if (v12 > 1)
            {
              if (v15 >= v10) {
                v15 %= v10;
              }
            }
            else
            {
              v15 &= v10 - 1;
            }
            if (v15 != v3) {
              break;
            }
          }
          unint64_t v14 = *(char **)v14;
        }
        while (v14);
      }
    }
  }
  BOOL v16 = *a3;
  uint64_t v17 = (void *)(a1 + 16);
  unint64_t v14 = (char *)operator new(0x50uLL);
  v30[0] = v14;
  v30[1] = a1 + 16;
  char v31 = 0;
  *(void *)unint64_t v14 = 0;
  *((void *)v14 + 1) = v9;
  char v18 = (std::string *)(v14 + 16);
  if (*((char *)v16 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v18, *(const std::string::value_type **)v16, *((void *)v16 + 1));
  }
  else
  {
    long long v19 = *v16;
    *((void *)v14 + 4) = *((void *)v16 + 2);
    *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v19;
  }
  *(_OWORD *)(v14 + 56) = 0u;
  *(_OWORD *)(v14 + 40) = 0u;
  *((_DWORD *)v14 + 18) = 1065353216;
  char v31 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v21 = *(float *)(a1 + 32);
  if (!v10 || (float)(v21 * (float)v10) < v20)
  {
    BOOL v22 = 1;
    if (v10 >= 3) {
      BOOL v22 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v10);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    std::__hash_table<std::__hash_value_type<rf::data_flow::RFUUID,long long>,std::__unordered_map_hasher<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,true>,std::__unordered_map_equal<rf::data_flow::RFUUID,std::__hash_value_type<rf::data_flow::RFUUID,long long>,rf::data_flow::RFUUID::Equality,rf::data_flow::RFUUID::Hash,true>,std::allocator<std::__hash_value_type<rf::data_flow::RFUUID,long long>>>::__rehash<true>(a1, v25);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  uint64_t v26 = *(void *)a1;
  uint64_t v27 = *(void **)(*(void *)a1 + 8 * v3);
  if (v27)
  {
    *(void *)unint64_t v14 = *v27;
LABEL_41:
    *uint64_t v27 = v14;
    goto LABEL_42;
  }
  *(void *)unint64_t v14 = *v17;
  *uint64_t v17 = v14;
  *(void *)(v26 + 8 * v3) = v17;
  if (*(void *)v14)
  {
    unint64_t v28 = *(void *)(*(void *)v14 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v28 >= v10) {
        v28 %= v10;
      }
    }
    else
    {
      v28 &= v10 - 1;
    }
    uint64_t v27 = (void *)(*(void *)a1 + 8 * v28);
    goto LABEL_41;
  }
LABEL_42:
  v30[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)v30);
  return v14;
}

void sub_235AEFB48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unordered_map<std::string,ARReferenceImage * {__strong}>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__func()
{
}

void *std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *id result = &unk_26E8F6840;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E8F6840;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = *(unsigned int *)(a2 + 256);
  if (v2 == -1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  int8x8_t v5 = &v4;
  return ((uint64_t (*)(uint64_t **))off_26E8F68B0[v2])(&v5);
}

uint64_t std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0,std::allocator<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_0>,BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::target_type()
{
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

uint64_t _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5EEE10__dispatchB8ne180100IONS1_9__variant15__value_visitorIZZN2rf9data_flow8consumer24AnchorManagementConsumer14matchingAnchorEP7RESceneP11REComponentRKNS_13unordered_mapINS9_6RFUUIDENS_7variantIJNS9_12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEENSH_4HashENSH_8EqualityENS_9allocatorINS_4pairIKSH_SP_EEEEEEENK3__0clERKSP_EUlTyRKT_E_EEJRKNS0_6__baseILNS0_6_TraitE1EJSJ_SK_SL_SM_SN_SO_EEEEEEDcS13_DpT0_(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a2 + 99);
}

void *std::__function::__value_func<BOOL ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> const&)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t ranges::remove_if_view<ranges::transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_5>>::satisfy_forward(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v8 = *(uint64_t **)result;
  if (*(void *)result)
  {
    uint64_t v9 = result;
LABEL_3:
    ranges::basic_iterator<ranges::adaptor_cursor<ranges::basic_iterator<ranges::adaptor_cursor<std::__hash_map_const_iterator<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>,void *> *>>,ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>>::adaptor>>,ranges::iter_transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,ranges::indirected<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>>::adaptor<false>>>::operator*((uint64_t)v12, (uint64_t)v8, *(void *)(v9 + 16), a4, a5, a6, a7, a8);
    int v10 = v12[276];
    id result = std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v12);
    if (!v10)
    {
      for (uint64_t i = **(void **)v9; ; uint64_t i = *v8)
      {
        *(void *)uint64_t v9 = i;
        if (!i) {
          break;
        }
        id result = rf::helpers::planeAnchorMatches(i + 48);
        unint64_t v8 = *(uint64_t **)v9;
        if (result)
        {
          if (v8) {
            goto LABEL_3;
          }
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t ranges::basic_iterator<ranges::adaptor_cursor<ranges::basic_iterator<ranges::adaptor_cursor<std::__hash_map_const_iterator<std::__hash_const_iterator<std::__hash_node<std::__hash_value_type<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>,void *> *>>,ranges::remove_if_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,ranges::logical_negate<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>>::adaptor>>,ranges::iter_transform_view<ranges::filter_view<ranges::ref_view<std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_3>,ranges::indirected<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_4>>::adaptor<false>>>::operator*(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a2 + 304) != 1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  uint64_t v9 = a2 + 48;
  uint64_t v10 = rf::helpers::rayPlaneHitTestInBounds(*(float32x4_t *)(*(void *)(a3 + 8) + 48), vnegq_f32(*(float32x4_t *)(*(void *)(a3 + 8) + 32)), *(simd_float4 *)(a2 + 80), *(float32x4_t *)(a2 + 96), *(simd_float4 *)(a2 + 112), *(float32x4_t *)(a2 + 128), a1, a2, a3, a4, a5, a6, a7, a8, *(simd_float4 *)(a2 + 176), *(simd_float4 *)(a2 + 192), *(simd_float4 *)(a2 + 176), *(simd_float4 *)(a2 + 192), *(float32x4_t *)(a2 + 208));
  uint64_t result = std::__variant_detail::__copy_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__copy_constructor(a1, v9);
  *(void *)(a1 + 272) = v10;
  return result;
}

uint64_t ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a2 - result;
  if (a2 - result >= 4609)
  {
    uint64_t v7 = a2;
    uint64_t v8 = result;
    uint64_t v34 = -288 - result;
    uint64_t v35 = (int *)(result + 272);
    do
    {
      if (!a3)
      {
        unint64_t v28 = v4 / 0x120;
        unint64_t v29 = (v4 / 0x120 - 2) >> 1;
        unint64_t v30 = v29 + 1;
        uint64_t v31 = v8 + 288 * v29;
        do
        {
          ranges::detail::sift_down_n_fn::operator()<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,std::reference_wrapper<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6>,std::reference_wrapper<ranges::identity>>(v8, v28, v31);
          v31 -= 288;
          --v30;
        }
        while (v30);
        uint64_t v32 = v28 + 1;
        uint64_t v33 = (int *)(v8 + 288 * v28 - 16);
        do
        {
          std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>::swap[abi:ne180100]<true,0>(v8, (uint64_t)(v33 - 68));
          std::optional<float>::swap[abi:ne180100](v35, v33);
          uint64_t result = ranges::detail::sift_down_n_fn::operator()<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,std::reference_wrapper<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6>,std::reference_wrapper<ranges::identity>>(v8, v32 - 2, v8);
          --v32;
          v33 -= 72;
        }
        while (v32 > 2);
        return result;
      }
      unint64_t v9 = v8 + 288 * (v4 / 0x240);
      unint64_t v37 = v9;
      uint64_t v38 = v8;
      uint64_t v36 = v7 - 288;
      if (!*(unsigned char *)(v8 + 276) || !*(unsigned char *)(v9 + 276)) {
LABEL_40:
      }
        std::__throw_bad_optional_access[abi:ne180100]();
      float v10 = *(float *)(v8 + 272);
      float v11 = *(float *)(v9 + 272);
      if (v10 >= v11)
      {
        if (!*(unsigned char *)(v7 - 12)) {
          goto LABEL_40;
        }
        float v12 = *(float *)(v7 - 16);
        if (v10 < v12)
        {
          uint64_t v13 = &v38;
          goto LABEL_17;
        }
        uint64_t v13 = (uint64_t *)&v37;
        float v10 = v11;
      }
      else
      {
        if (!*(unsigned char *)(v7 - 12)) {
          goto LABEL_40;
        }
        float v12 = *(float *)(v7 - 16);
        if (v11 < v12)
        {
          uint64_t v13 = (uint64_t *)&v37;
          goto LABEL_17;
        }
        uint64_t v13 = &v38;
      }
      if (v10 < v12) {
        uint64_t v13 = &v36;
      }
LABEL_17:
      unint64_t v14 = *v13;
      uint64_t v15 = v8;
      for (unint64_t i = v7; ; unint64_t i = v23)
      {
        uint64_t v17 = 0;
        float v18 = *(float *)(v14 + 272);
        do
        {
          if (!*(unsigned char *)(v15 + v17 + 276) || !*(unsigned char *)(v14 + 276)) {
            goto LABEL_40;
          }
          float v19 = *(float *)(v15 + v17 + 272);
          v17 += 288;
        }
        while (v19 < v18);
        uint64_t v20 = v15 + v17;
        float v21 = (int *)(v15 + v17 - 16);
        unint64_t v22 = v15 + v17 - 288;
        do
        {
          if (!*(unsigned char *)(i - 12)) {
            goto LABEL_40;
          }
          unint64_t v23 = i - 288;
          float v24 = *(float *)(i - 16);
          i -= 288;
        }
        while (v18 < v24);
        if (v22 >= v23) {
          break;
        }
        std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>::swap[abi:ne180100]<true,0>(v15 + v17 - 288, v23);
        std::optional<float>::swap[abi:ne180100](v21, (int *)(v23 + 272));
        if (v23 == v14) {
          unint64_t v25 = v22;
        }
        else {
          unint64_t v25 = v14;
        }
        if (v22 == v14) {
          unint64_t v14 = v23;
        }
        else {
          unint64_t v14 = v25;
        }
        uint64_t v15 = v20;
      }
      uint64_t v26 = v15 + v17;
      uint64_t v27 = v15 + v17 - 288;
      uint64_t result = ranges::detail::introsort_loop<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,long,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(v27, v7, --a3, a4);
      unint64_t v4 = v26 + v34;
      uint64_t v7 = v27;
    }
    while (v26 + v34 > 4608);
  }
  return result;
}

uint64_t ranges::detail::sift_down_n_fn::operator()<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,std::reference_wrapper<rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6>,std::reference_wrapper<ranges::identity>>(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v3 = a2 - 2;
  if (a2 < 2) {
    return result;
  }
  uint64_t v4 = a3;
  uint64_t v5 = result;
  uint64_t v6 = v3 >> 1;
  if ((uint64_t)(v3 >> 1) < (uint64_t)(0x8E38E38E38E38E39 * ((a3 - result) >> 5))) {
    return result;
  }
  uint64_t v8 = (0x1C71C71C71C71C72 * ((a3 - result) >> 5)) | 1;
  uint64_t v9 = result + 288 * v8;
  if (0x1C71C71C71C71C72 * ((a3 - result) >> 5) + 2 < a2)
  {
    if (!*(unsigned char *)(v9 + 276) || !*(unsigned char *)(v9 + 564)) {
LABEL_29:
    }
      std::__throw_bad_optional_access[abi:ne180100]();
    float v10 = *(float *)(v9 + 272);
    float v11 = *(float *)(v9 + 560);
    v9 += 288 * (v10 < v11);
    if (v10 < v11) {
      uint64_t v8 = 0x1C71C71C71C71C72 * ((a3 - result) >> 5) + 2;
    }
  }
  if (!*(unsigned char *)(v9 + 276) || !*(unsigned char *)(a3 + 276)) {
    goto LABEL_29;
  }
  if (*(float *)(v9 + 272) >= *(float *)(a3 + 272))
  {
    std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v18, a3);
    uint64_t v19 = *(void *)(v4 + 272);
    do
    {
      uint64_t v12 = v9;
      std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v4, v9);
      int v13 = *(_DWORD *)(v9 + 272);
      *(unsigned char *)(v4 + 276) = *(unsigned char *)(v9 + 276);
      *(_DWORD *)(v4 + 272) = v13;
      if (v6 < v8) {
        break;
      }
      uint64_t v9 = v5 + 288 * ((2 * v8) | 1);
      if (2 * v8 + 2 >= a2)
      {
        uint64_t v8 = (2 * v8) | 1;
      }
      else
      {
        if (!*(unsigned char *)(v9 + 276) || !*(unsigned char *)(v9 + 564)) {
          std::__throw_bad_optional_access[abi:ne180100]();
        }
        float v14 = *(float *)(v9 + 272);
        float v15 = *(float *)(v9 + 560);
        v9 += 288 * (v14 < v15);
        uint64_t v8 = v14 >= v15 ? (2 * v8) | 1 : 2 * v8 + 2;
      }
      if (!*(unsigned char *)(v9 + 276) || BYTE4(v19) == 0) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      uint64_t v4 = v12;
    }
    while (*(float *)(v9 + 272) >= *(float *)&v19);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v12, (uint64_t)v18);
    int v17 = v19;
    *(unsigned char *)(v12 + 276) = BYTE4(v19);
    *(_DWORD *)(v12 + 272) = v17;
    return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v18);
  }
  return result;
}

void sub_235AF0310(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>::swap[abi:ne180100]<true,0>(uint64_t result, uint64_t a2)
{
  v9[35] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(unsigned int *)(result + 256);
  uint64_t v3 = *(unsigned int *)(a2 + 256);
  if (v2 != -1 || v3 != -1)
  {
    uint64_t v6 = result;
    BOOL v7 = v2 == -1;
    if (v2 == -1) {
      uint64_t v2 = -1;
    }
    if (v3 == -1) {
      BOOL v8 = v7;
    }
    else {
      BOOL v8 = v2 == v3;
    }
    if (v8)
    {
      return ((uint64_t (*)(void *, uint64_t, uint64_t))off_26E8F68F0[v2])(v9, result, a2);
    }
    else
    {
      std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v9, a2);
      std::__variant_detail::__ctor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_construct[abi:ne180100]<std::__variant_detail::__impl<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>(a2, v6);
      std::__variant_detail::__ctor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_construct[abi:ne180100]<std::__variant_detail::__impl<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>(v6, (uint64_t)v9);
      return std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v9);
    }
  }
  return result;
}

void sub_235AF0424(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::__variant_detail::__ctor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_construct[abi:ne180100]<std::__variant_detail::__impl<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(unsigned int *)(result + 256);
  if (v4 != -1) {
    uint64_t result = ((uint64_t (*)(char *, uint64_t))off_26E8F6770[v4])(&v7, result);
  }
  *(_DWORD *)(v3 + 256) = -1;
  uint64_t v5 = *(unsigned int *)(a2 + 256);
  if (v5 != -1)
  {
    uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))off_26E8F6920[v5])(&v6, v3, a2);
    *(_DWORD *)(v3 + 256) = v5;
  }
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, long long *a2, long long *a3)
{
  long long v17 = a2[4];
  *(_OWORD *)float v18 = a2[5];
  *(_OWORD *)&v18[9] = *(long long *)((char *)a2 + 89);
  long long v13 = *a2;
  long long v14 = a2[1];
  long long v15 = a2[2];
  long long v16 = a2[3];
  uint64_t v4 = *((void *)a2 + 14);
  *((void *)a2 + 14) = 0;
  long long v6 = a3[1];
  long long v5 = a3[2];
  *a2 = *a3;
  a2[1] = v6;
  a2[2] = v5;
  long long v7 = a3[3];
  long long v8 = a3[4];
  long long v9 = a3[5];
  *(long long *)((char *)a2 + 89) = *(long long *)((char *)a3 + 89);
  a2[4] = v8;
  a2[5] = v9;
  a2[3] = v7;
  uint64_t v10 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  float v11 = (void *)*((void *)a2 + 14);
  *((void *)a2 + 14) = v10;

  a3[4] = v17;
  a3[5] = *(_OWORD *)v18;
  *(long long *)((char *)a3 + 89) = *(_OWORD *)&v18[9];
  *a3 = v13;
  a3[1] = v14;
  a3[2] = v15;
  a3[3] = v16;
  uint64_t v12 = (void *)*((void *)a3 + 14);
  *((void *)a3 + 14) = v4;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, long long *a2, long long *a3)
{
  long long v33 = a2[4];
  *(_OWORD *)uint64_t v34 = a2[5];
  *(_OWORD *)&v34[9] = *(long long *)((char *)a2 + 89);
  long long v29 = *a2;
  long long v30 = a2[1];
  long long v31 = a2[2];
  long long v32 = a2[3];
  uint64_t v5 = *((void *)a2 + 14);
  *((void *)a2 + 14) = 0;
  long long v24 = a2[9];
  long long v23 = a2[8];
  uint64_t v28 = *((void *)a2 + 26);
  long long v27 = a2[12];
  long long v26 = a2[11];
  long long v25 = a2[10];
  uint64_t v6 = (uint64_t)a2 + 216;
  __n128 v22 = *(__n128 *)((char *)a2 + 216);
  uint64_t v7 = *((void *)a2 + 29);
  *((void *)a2 + 27) = 0;
  *((void *)a2 + 28) = 0;
  *((void *)a2 + 29) = 0;
  long long v8 = *a3;
  long long v9 = a3[2];
  a2[1] = a3[1];
  a2[2] = v9;
  *a2 = v8;
  long long v10 = a3[3];
  long long v11 = a3[4];
  long long v12 = a3[5];
  *(long long *)((char *)a2 + 89) = *(long long *)((char *)a3 + 89);
  a2[4] = v11;
  a2[5] = v12;
  a2[3] = v10;
  uint64_t v13 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  long long v14 = (void *)*((void *)a2 + 14);
  *((void *)a2 + 14) = v13;

  long long v15 = a3[9];
  a2[8] = a3[8];
  a2[9] = v15;
  long long v16 = a3[10];
  long long v17 = a3[11];
  long long v18 = a3[12];
  *((void *)a2 + 26) = *((void *)a3 + 26);
  a2[11] = v17;
  a2[12] = v18;
  a2[10] = v16;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE13__move_assignERS4_NS_17integral_constantIbLb1EEE(v6, (__n128 *)((char *)a3 + 216));
  a3[4] = v33;
  a3[5] = *(_OWORD *)v34;
  *(long long *)((char *)a3 + 89) = *(_OWORD *)&v34[9];
  *a3 = v29;
  a3[1] = v30;
  a3[2] = v31;
  a3[3] = v32;
  uint64_t v19 = (void *)*((void *)a3 + 14);
  *((void *)a3 + 14) = v5;

  a3[10] = v25;
  a3[11] = v26;
  a3[12] = v27;
  *((void *)a3 + 26) = v28;
  a3[8] = v23;
  a3[9] = v24;
  uint64_t v20 = (void *)*((void *)a3 + 27);
  if (v20)
  {
    *((void *)a3 + 28) = v20;
    operator delete(v20);
  }
  __n128 result = v22;
  *(long long *)((char *)a3 + 216) = (__int128)v22;
  *((void *)a3 + 29) = v7;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, long long *a2, long long *a3)
{
  *(_OWORD *)long long v33 = a2[5];
  *(_OWORD *)&v33[9] = *(long long *)((char *)a2 + 89);
  long long v28 = *a2;
  long long v29 = a2[1];
  long long v31 = a2[3];
  long long v32 = a2[4];
  long long v30 = a2[2];
  uint64_t v5 = *((void *)a2 + 14);
  *((void *)a2 + 14) = 0;
  char v6 = *((unsigned char *)a2 + 128);
  uint64_t v7 = (uint64_t)a2 + 136;
  uint64_t v22 = *((void *)a2 + 17);
  *(void *)long long v27 = *((void *)a2 + 18);
  *(void *)&v27[7] = *(void *)((char *)a2 + 151);
  char v8 = *((unsigned char *)a2 + 159);
  *((void *)a2 + 17) = 0;
  *((void *)a2 + 18) = 0;
  *((void *)a2 + 19) = 0;
  long long v9 = a2 + 10;
  uint64_t v24 = *((void *)a2 + 20);
  *(void *)long long v26 = *((void *)a2 + 21);
  *(void *)&v26[7] = *(void *)((char *)a2 + 175);
  char v23 = *((unsigned char *)a2 + 183);
  *((void *)a2 + 21) = 0;
  *((void *)a2 + 22) = 0;
  *((void *)a2 + 20) = 0;
  __n128 v25 = (__n128)a2[12];
  long long v10 = *a3;
  long long v11 = a3[2];
  a2[1] = a3[1];
  a2[2] = v11;
  *a2 = v10;
  long long v12 = a3[3];
  long long v13 = a3[4];
  long long v14 = a3[5];
  *(long long *)((char *)a2 + 89) = *(long long *)((char *)a3 + 89);
  a2[4] = v13;
  a2[5] = v14;
  a2[3] = v12;
  uint64_t v15 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  long long v16 = (void *)*((void *)a2 + 14);
  *((void *)a2 + 14) = v15;

  *((unsigned char *)a2 + 128) = *((unsigned char *)a3 + 128);
  long long v17 = (void **)a3 + 17;
  if (*((char *)a2 + 159) < 0) {
    operator delete(*(void **)v7);
  }
  long long v18 = *(_OWORD *)v17;
  *(void *)(v7 + 16) = *((void *)a3 + 19);
  *(_OWORD *)uint64_t v7 = v18;
  *((unsigned char *)a3 + 159) = 0;
  *((unsigned char *)a3 + 136) = 0;
  if (*((char *)a2 + 183) < 0) {
    operator delete(*(void **)v9);
  }
  long long v19 = a3[10];
  *((void *)v9 + 2) = *((void *)a3 + 22);
  long long *v9 = v19;
  *((unsigned char *)a3 + 183) = 0;
  *((unsigned char *)a3 + 160) = 0;
  a2[12] = a3[12];
  a3[4] = v32;
  a3[5] = *(_OWORD *)v33;
  *(long long *)((char *)a3 + 89) = *(_OWORD *)&v33[9];
  *a3 = v28;
  a3[1] = v29;
  a3[2] = v30;
  a3[3] = v31;
  uint64_t v20 = (void *)*((void *)a3 + 14);
  *((void *)a3 + 14) = v5;

  *((unsigned char *)a3 + 128) = v6;
  if (*((char *)a3 + 159) < 0) {
    operator delete(*v17);
  }
  *((void *)a3 + 17) = v22;
  *((void *)a3 + 18) = *(void *)v27;
  *(void *)((char *)a3 + 151) = *(void *)&v27[7];
  *((unsigned char *)a3 + 159) = v8;
  if (*((char *)a3 + 183) < 0) {
    operator delete(*((void **)a3 + 20));
  }
  *((void *)a3 + 20) = v24;
  *((void *)a3 + 21) = *(void *)v26;
  *(void *)((char *)a3 + 175) = *(void *)&v26[7];
  *((unsigned char *)a3 + 183) = v23;
  __n128 result = v25;
  a3[12] = (__int128)v25;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, long long *a2, long long *a3)
{
  long long v37 = a2[4];
  *(_OWORD *)uint64_t v38 = a2[5];
  *(_OWORD *)&v38[9] = *(long long *)((char *)a2 + 89);
  long long v33 = *a2;
  long long v34 = a2[1];
  long long v35 = a2[2];
  long long v36 = a2[3];
  uint64_t v5 = *((void *)a2 + 14);
  *((void *)a2 + 14) = 0;
  uint64_t v7 = a2 + 8;
  uint64_t v6 = *((void *)a2 + 16);
  *(void *)&v32[7] = *(void *)((char *)a2 + 143);
  *(void *)long long v32 = *((void *)a2 + 17);
  char v8 = *((unsigned char *)a2 + 151);
  *((void *)a2 + 16) = 0;
  *((void *)a2 + 17) = 0;
  *((void *)a2 + 18) = 0;
  uint64_t v9 = (uint64_t)a2 + 152;
  uint64_t v26 = *((void *)a2 + 19);
  *(void *)long long v31 = *((void *)a2 + 20);
  *(void *)&v31[7] = *(void *)((char *)a2 + 167);
  char v10 = *((unsigned char *)a2 + 175);
  *((void *)a2 + 20) = 0;
  *((void *)a2 + 21) = 0;
  *((void *)a2 + 19) = 0;
  __n128 v29 = (__n128)a2[13];
  long long v30 = a2[14];
  long long v27 = a2[11];
  long long v28 = a2[12];
  long long v11 = *a3;
  long long v12 = a3[2];
  a2[1] = a3[1];
  a2[2] = v12;
  *a2 = v11;
  long long v13 = a3[3];
  long long v14 = a3[4];
  long long v15 = a3[5];
  *(long long *)((char *)a2 + 89) = *(long long *)((char *)a3 + 89);
  a2[4] = v14;
  a2[5] = v15;
  a2[3] = v13;
  uint64_t v16 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  long long v17 = (void *)*((void *)a2 + 14);
  *((void *)a2 + 14) = v16;

  long long v18 = (void **)(a3 + 8);
  if (*((char *)a2 + 151) < 0) {
    operator delete(*(void **)v7);
  }
  long long v19 = *(_OWORD *)v18;
  *((void *)v7 + 2) = *((void *)a3 + 18);
  *uint64_t v7 = v19;
  *((unsigned char *)a3 + 151) = 0;
  *((unsigned char *)a3 + 128) = 0;
  if (*((char *)a2 + 175) < 0) {
    operator delete(*(void **)v9);
  }
  long long v20 = *(long long *)((char *)a3 + 152);
  *(void *)(v9 + 16) = *((void *)a3 + 21);
  *(_OWORD *)uint64_t v9 = v20;
  *((unsigned char *)a3 + 175) = 0;
  *((unsigned char *)a3 + 152) = 0;
  long long v21 = a3[11];
  long long v22 = a3[12];
  long long v23 = a3[14];
  a2[13] = a3[13];
  a2[14] = v23;
  a2[11] = v21;
  a2[12] = v22;
  a3[4] = v37;
  a3[5] = *(_OWORD *)v38;
  *(long long *)((char *)a3 + 89) = *(_OWORD *)&v38[9];
  *a3 = v33;
  a3[1] = v34;
  a3[2] = v35;
  a3[3] = v36;
  uint64_t v24 = (void *)*((void *)a3 + 14);
  *((void *)a3 + 14) = v5;

  if (*((char *)a3 + 151) < 0) {
    operator delete(*v18);
  }
  *((void *)a3 + 16) = v6;
  *((void *)a3 + 17) = *(void *)v32;
  *(void *)((char *)a3 + 143) = *(void *)&v32[7];
  *((unsigned char *)a3 + 151) = v8;
  if (*((char *)a3 + 175) < 0) {
    operator delete(*((void **)a3 + 19));
  }
  *((void *)a3 + 19) = v26;
  *((void *)a3 + 20) = *(void *)v31;
  *(void *)((char *)a3 + 167) = *(void *)&v31[7];
  *((unsigned char *)a3 + 175) = v10;
  a3[11] = v27;
  a3[12] = v28;
  __n128 result = v29;
  a3[13] = (__int128)v29;
  a3[14] = v30;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, long long *a2, long long *a3)
{
  long long v33 = a2[4];
  *(_OWORD *)long long v34 = a2[5];
  *(_OWORD *)&v34[9] = *(long long *)((char *)a2 + 89);
  long long v29 = *a2;
  long long v30 = a2[1];
  long long v31 = a2[2];
  long long v32 = a2[3];
  uint64_t v5 = *((void *)a2 + 14);
  *((void *)a2 + 14) = 0;
  __n128 v23 = (__n128)a2[10];
  long long v24 = a2[11];
  long long v21 = a2[8];
  long long v22 = a2[9];
  long long v27 = a2[14];
  long long v28 = a2[15];
  long long v25 = a2[12];
  long long v26 = a2[13];
  long long v6 = *a3;
  long long v7 = a3[2];
  a2[1] = a3[1];
  a2[2] = v7;
  *a2 = v6;
  long long v8 = a3[3];
  long long v9 = a3[4];
  long long v10 = a3[5];
  *(long long *)((char *)a2 + 89) = *(long long *)((char *)a3 + 89);
  a2[4] = v9;
  a2[5] = v10;
  a2[3] = v8;
  uint64_t v11 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  long long v12 = (void *)*((void *)a2 + 14);
  *((void *)a2 + 14) = v11;

  long long v13 = a3[8];
  long long v14 = a3[9];
  long long v15 = a3[11];
  a2[10] = a3[10];
  a2[11] = v15;
  a2[8] = v13;
  a2[9] = v14;
  long long v16 = a3[12];
  long long v17 = a3[13];
  long long v18 = a3[15];
  a2[14] = a3[14];
  a2[15] = v18;
  a2[12] = v16;
  a2[13] = v17;
  a3[4] = v33;
  a3[5] = *(_OWORD *)v34;
  *(long long *)((char *)a3 + 89) = *(_OWORD *)&v34[9];
  *a3 = v29;
  a3[1] = v30;
  a3[2] = v31;
  a3[3] = v32;
  long long v19 = (void *)*((void *)a3 + 14);
  *((void *)a3 + 14) = v5;

  a3[12] = v25;
  a3[13] = v26;
  a3[14] = v27;
  a3[15] = v28;
  a3[8] = v21;
  a3[9] = v22;
  __n128 result = v23;
  a3[10] = (__int128)v23;
  a3[11] = v24;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__implIJN2rf9data_flow12CustomAnchorENS8_11PlaneAnchorENS8_11ImageAnchorENS8_12ObjectAnchorENS8_10FaceAnchorENS8_10BodyAnchorEEE6__swapB8ne180100ERSF_EUlRT_RT0_E_JRNS0_6__baseILNS0_6_TraitE1EJS9_SA_SB_SC_SD_SE_EEESQ_EEEDcSH_DpT0_(uint64_t a1, long long *a2, long long *a3)
{
  long long v19 = a2[4];
  *(_OWORD *)long long v20 = a2[5];
  *(_OWORD *)&v20[9] = *(long long *)((char *)a2 + 89);
  long long v15 = *a2;
  long long v16 = a2[1];
  long long v17 = a2[2];
  long long v18 = a2[3];
  uint64_t v5 = *((void *)a2 + 14);
  *((void *)a2 + 14) = 0;
  int v6 = *((_DWORD *)a2 + 32);
  long long v7 = *a3;
  long long v8 = a3[2];
  a2[1] = a3[1];
  a2[2] = v8;
  *a2 = v7;
  long long v9 = a3[3];
  long long v10 = a3[4];
  long long v11 = a3[5];
  *(long long *)((char *)a2 + 89) = *(long long *)((char *)a3 + 89);
  a2[4] = v10;
  a2[5] = v11;
  a2[3] = v9;
  uint64_t v12 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  long long v13 = (void *)*((void *)a2 + 14);
  *((void *)a2 + 14) = v12;

  *((_DWORD *)a2 + 32) = *((_DWORD *)a3 + 32);
  a3[4] = v19;
  a3[5] = *(_OWORD *)v20;
  *(long long *)((char *)a3 + 89) = *(_OWORD *)&v20[9];
  *a3 = v15;
  a3[1] = v16;
  a3[2] = v17;
  a3[3] = v18;
  long long v14 = (void *)*((void *)a3 + 14);
  *((void *)a3 + 14) = v5;

  *((_DWORD *)a3 + 32) = v6;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v3 = *a3;
  long long v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  __n128 result = (__n128)a3[3];
  long long v6 = a3[4];
  long long v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(long long *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(__n128 *)(a2 + 48) = result;
  uint64_t v8 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  *(void *)(a2 + 112) = v8;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v3 = *a3;
  long long v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  long long v5 = a3[3];
  long long v6 = a3[4];
  long long v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(long long *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  uint64_t v8 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  *(void *)(a2 + 112) = v8;
  long long v9 = a3[9];
  *(_OWORD *)(a2 + 128) = a3[8];
  *(_OWORD *)(a2 + 144) = v9;
  long long v10 = a3[10];
  long long v11 = a3[12];
  uint64_t v12 = *((void *)a3 + 26);
  *(_OWORD *)(a2 + 176) = a3[11];
  *(_OWORD *)(a2 + 192) = v11;
  *(_OWORD *)(a2 + 160) = v10;
  *(void *)(a2 + 208) = v12;
  *(void *)(a2 + 216) = 0;
  *(void *)(a2 + 224) = 0;
  *(void *)(a2 + 232) = 0;
  __n128 result = *(__n128 *)((char *)a3 + 216);
  *(__n128 *)(a2 + 216) = result;
  *(void *)(a2 + 232) = *((void *)a3 + 29);
  *((void *)a3 + 27) = 0;
  *((void *)a3 + 28) = 0;
  *((void *)a3 + 29) = 0;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v3 = *a3;
  long long v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  long long v5 = a3[3];
  long long v6 = a3[4];
  long long v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(long long *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  uint64_t v8 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  *(void *)(a2 + 112) = v8;
  *(unsigned char *)(a2 + 128) = *((unsigned char *)a3 + 128);
  long long v9 = *(long long *)((char *)a3 + 136);
  *(void *)(a2 + 152) = *((void *)a3 + 19);
  *(_OWORD *)(a2 + 136) = v9;
  *((void *)a3 + 18) = 0;
  *((void *)a3 + 19) = 0;
  *((void *)a3 + 17) = 0;
  uint64_t v10 = *((void *)a3 + 22);
  *(_OWORD *)(a2 + 160) = a3[10];
  *(void *)(a2 + 176) = v10;
  *((void *)a3 + 21) = 0;
  *((void *)a3 + 22) = 0;
  *((void *)a3 + 20) = 0;
  __n128 result = (__n128)a3[12];
  *(__n128 *)(a2 + 192) = result;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v3 = *a3;
  long long v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  long long v5 = a3[3];
  long long v6 = a3[4];
  long long v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(long long *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  uint64_t v8 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  *(void *)(a2 + 112) = v8;
  uint64_t v9 = *((void *)a3 + 18);
  *(_OWORD *)(a2 + 128) = a3[8];
  *(void *)(a2 + 144) = v9;
  *((void *)a3 + 17) = 0;
  *((void *)a3 + 18) = 0;
  *((void *)a3 + 16) = 0;
  long long v10 = *(long long *)((char *)a3 + 152);
  *(void *)(a2 + 168) = *((void *)a3 + 21);
  *(_OWORD *)(a2 + 152) = v10;
  *((void *)a3 + 20) = 0;
  *((void *)a3 + 21) = 0;
  *((void *)a3 + 19) = 0;
  __n128 result = (__n128)a3[11];
  long long v12 = a3[12];
  long long v13 = a3[14];
  *(_OWORD *)(a2 + 208) = a3[13];
  *(_OWORD *)(a2 + 224) = v13;
  *(__n128 *)(a2 + 176) = result;
  *(_OWORD *)(a2 + 192) = v12;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v3 = *a3;
  long long v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  long long v5 = a3[3];
  long long v6 = a3[4];
  long long v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(long long *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  uint64_t v8 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  *(void *)(a2 + 112) = v8;
  long long v9 = a3[8];
  long long v10 = a3[9];
  long long v11 = a3[11];
  *(_OWORD *)(a2 + 160) = a3[10];
  *(_OWORD *)(a2 + 176) = v11;
  *(_OWORD *)(a2 + 128) = v9;
  *(_OWORD *)(a2 + 144) = v10;
  __n128 result = (__n128)a3[12];
  long long v13 = a3[13];
  long long v14 = a3[15];
  *(_OWORD *)(a2 + 224) = a3[14];
  *(_OWORD *)(a2 + 240) = v14;
  *(__n128 *)(a2 + 192) = result;
  *(_OWORD *)(a2 + 208) = v13;
  return result;
}

float _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm5ELm5EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJN2rf9data_flow12CustomAnchorENS9_11PlaneAnchorENS9_11ImageAnchorENS9_12ObjectAnchorENS9_10FaceAnchorENS9_10BodyAnchorEEEEE19__generic_constructB8ne180100INS0_6__implIJSA_SB_SC_SD_SE_SF_EEEEEvRSH_OT_EUlRSM_OT0_E_JRNS0_6__baseILNS0_6_TraitE1EJSA_SB_SC_SD_SE_SF_EEEOSV_EEEDcSM_DpT0_(uint64_t a1, uint64_t a2, long long *a3)
{
  long long v3 = *a3;
  long long v4 = a3[2];
  *(_OWORD *)(a2 + 16) = a3[1];
  *(_OWORD *)(a2 + 32) = v4;
  *(_OWORD *)a2 = v3;
  long long v5 = a3[3];
  long long v6 = a3[4];
  long long v7 = a3[5];
  *(_OWORD *)(a2 + 89) = *(long long *)((char *)a3 + 89);
  *(_OWORD *)(a2 + 64) = v6;
  *(_OWORD *)(a2 + 80) = v7;
  *(_OWORD *)(a2 + 48) = v5;
  uint64_t v8 = *((void *)a3 + 14);
  *((void *)a3 + 14) = 0;
  *(void *)(a2 + 112) = v8;
  float result = *((float *)a3 + 32);
  *(float *)(a2 + 128) = result;
  return result;
}

int *std::optional<float>::swap[abi:ne180100](int *result, int *a2)
{
  if ((*((unsigned char *)result + 4) != 0) != (*((unsigned char *)a2 + 4) != 0))
  {
    if (*((unsigned char *)result + 4))
    {
      *a2 = *result;
      *((unsigned char *)a2 + 4) = 1;
      if (*((unsigned char *)result + 4)) {
        *((unsigned char *)result + 4) = 0;
      }
    }
    else
    {
      *float result = *a2;
      *((unsigned char *)result + 4) = 1;
      if (*((unsigned char *)a2 + 4)) {
        *((unsigned char *)a2 + 4) = 0;
      }
    }
  }
  else if (*((unsigned char *)result + 4))
  {
    int v2 = *result;
    *float result = *a2;
    *a2 = v2;
  }
  return result;
}

uint64_t ranges::detail::insertion_sort<std::__wrap_iter<std::pair<std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,std::optional<float>> *>,rf::data_flow::consumer::AnchorManagementConsumer::matchingAnchor(REScene *,REComponent *,std::unordered_map<rf::data_flow::RFUUID,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<std::pair<rf::data_flow::RFUUID const,std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>>> const&)::$_6,ranges::identity>(uint64_t result, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (result != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 288;
    if (result + 288 != a2)
    {
      long long v5 = (float *)(result + 272);
      uint64_t v6 = result;
      do
      {
        uint64_t v7 = v6;
        uint64_t v6 = v4;
        std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v16, v4);
        uint64_t v8 = *(void *)(v7 + 560);
        uint64_t v17 = v8;
        if ((v8 & 0xFF00000000) == 0 || !*(unsigned char *)(v3 + 276)) {
          std::__throw_bad_optional_access[abi:ne180100]();
        }
        if (*v5 <= *(float *)&v8)
        {
          std::__variant_detail::__move_constructor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)v14, (uint64_t)v16);
          uint64_t v15 = v17;
          if ((v17 & 0xFF00000000) == 0) {
LABEL_20:
          }
            std::__throw_bad_optional_access[abi:ne180100]();
          uint64_t v12 = v6;
          while (1)
          {
            if (!*(unsigned char *)(v12 - 12)) {
              goto LABEL_20;
            }
            if (*(float *)&v15 >= *(float *)(v12 - 16)) {
              break;
            }
            std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v12, v12 - 288);
            *(_DWORD *)(v12 + 272) = *(_DWORD *)(v12 - 16);
            *(unsigned char *)(v12 + 276) = *(unsigned char *)(v12 - 12);
            v12 -= 288;
            if (!BYTE4(v15)) {
              goto LABEL_20;
            }
          }
          std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v12, (uint64_t)v14);
          int v13 = v15;
          *(unsigned char *)(v12 + 276) = BYTE4(v15);
          *(_DWORD *)(v12 + 272) = v13;
          std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v14);
        }
        else
        {
          if (v6 != v3)
          {
            uint64_t v9 = v6;
            do
            {
              uint64_t v10 = v9 - 288;
              std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v9, v9 - 288);
              *(_DWORD *)(v10 + 560) = *(_DWORD *)(v10 + 272);
              *(unsigned char *)(v10 + 564) = *(unsigned char *)(v10 + 276);
              uint64_t v9 = v10;
            }
            while (v10 != v3);
          }
          std::__variant_detail::__assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>>::__generic_assign[abi:ne180100]<std::__variant_detail::__move_assignment<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>>(v3, (uint64_t)v16);
          int v11 = v17;
          *(unsigned char *)(v3 + 276) = BYTE4(v17);
          *(_DWORD *)long long v5 = v11;
        }
        float result = std::__variant_detail::__dtor<std::__variant_detail::__traits<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v16);
        uint64_t v4 = v6 + 288;
      }
      while (v6 + 288 != a2);
    }
  }
  return result;
}

void sub_235AF1304(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::find<unsigned long long>(void *a1, unint64_t a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (*(void *)&v2 <= a2) {
      unint64_t v4 = a2 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v4 = (*(void *)&v2 - 1) & a2;
  }
  long long v5 = *(void **)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  float result = (void *)*v5;
  if (*v5)
  {
    do
    {
      unint64_t v7 = result[1];
      if (v7 == a2)
      {
        if (result[2] == a2) {
          return result;
        }
      }
      else
      {
        if (v3.u32[0] > 1uLL)
        {
          if (v7 >= *(void *)&v2) {
            v7 %= *(void *)&v2;
          }
        }
        else
        {
          v7 &= *(void *)&v2 - 1;
        }
        if (v7 != v4) {
          return 0;
        }
      }
      float result = (void *)*result;
    }
    while (result);
  }
  return result;
}

void *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>(float *a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *((void *)a1 + 1);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (unint64_t i = *v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  unint64_t i = operator new(0x18uLL);
  void *i = 0;
  i[1] = v6;
  i[2] = *a3;
  float v12 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v13 = a1[8];
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      int8x8_t prime = (int8x8_t)v16;
    }
    else {
      int8x8_t prime = (int8x8_t)v15;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v7 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v7) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        unint64_t v24 = std::__next_prime(v24);
      }
      else
      {
        uint64_t v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2) {
          unint64_t v24 = v26;
        }
      }
      if (*(void *)&prime <= v24) {
        int8x8_t prime = (int8x8_t)v24;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v18 = operator new(8 * *(void *)&prime);
          long long v19 = *(void **)a1;
          *(void *)a1 = v18;
          if (v19) {
            operator delete(v19);
          }
          uint64_t v20 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v20++) = 0;
          while (*(void *)&prime != v20);
          long long v21 = (void *)*((void *)a1 + 2);
          if (v21)
          {
            unint64_t v22 = v21[1];
            uint8x8_t v23 = (uint8x8_t)vcnt_s8(prime);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              if (v22 >= *(void *)&prime) {
                v22 %= *(void *)&prime;
              }
            }
            else
            {
              v22 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v22) = a1 + 4;
            long long v27 = (void *)*v21;
            if (*v21)
            {
              do
              {
                unint64_t v28 = v27[1];
                if (v23.u32[0] > 1uLL)
                {
                  if (v28 >= *(void *)&prime) {
                    v28 %= *(void *)&prime;
                  }
                }
                else
                {
                  v28 &= *(void *)&prime - 1;
                }
                if (v28 != v22)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v28))
                  {
                    *(void *)(*(void *)a1 + 8 * v28) = v21;
                    goto LABEL_55;
                  }
                  *long long v21 = *v27;
                  *long long v27 = **(void **)(*(void *)a1 + 8 * v28);
                  **(void **)(*(void *)a1 + 8 * v28) = v27;
                  long long v27 = v21;
                }
                unint64_t v28 = v22;
LABEL_55:
                long long v21 = v27;
                long long v27 = (void *)*v27;
                unint64_t v22 = v28;
              }
              while (v27);
            }
          }
          unint64_t v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        long long v33 = *(void **)a1;
        *(void *)a1 = 0;
        if (v33) {
          operator delete(v33);
        }
        unint64_t v7 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  long long v29 = *(void **)a1;
  long long v30 = *(void **)(*(void *)a1 + 8 * v3);
  if (v30)
  {
    void *i = *v30;
LABEL_72:
    *long long v30 = i;
    goto LABEL_73;
  }
  void *i = *((void *)a1 + 2);
  *((void *)a1 + 2) = i;
  v29[v3] = a1 + 4;
  if (*i)
  {
    unint64_t v31 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7) {
        v31 %= v7;
      }
    }
    else
    {
      v31 &= v7 - 1;
    }
    long long v30 = (void *)(*(void *)a1 + 8 * v31);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return i;
}

void sub_235AF17D8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__erase_unique<unsigned long long>(void *a1, unint64_t *a2)
{
  float result = std::__hash_table<std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,rf::data_flow::provider::SyntheticARData>>>::find<unsigned long>(a1, a2);
  if (result)
  {
    std::__hash_table<rf::data_flow::RFUUID,rf::data_flow::RFUUID::Hash,rf::data_flow::RFUUID::Equality,std::allocator<rf::data_flow::RFUUID>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

void *std::__function::__value_func<void ()(REEntity *,rf::data_flow::consumer::AnchoringState)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    unint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        float result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        float result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      float result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_235AF1A84(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__value_func<rf::data_flow::RFUUID ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor>)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    unint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        float result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        float result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      float result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_235AF1CF0(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__value_func<void ()(std::variant<rf::data_flow::CustomAnchor,rf::data_flow::PlaneAnchor,rf::data_flow::ImageAnchor,rf::data_flow::ObjectAnchor,rf::data_flow::FaceAnchor,rf::data_flow::BodyAnchor> *)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    unint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        float result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        float result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      float result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_235AF1F5C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::__function::__value_func<void ()(NSSet<ARReferenceImage *> *)>::swap[abi:ne180100](void *result, void *a2)
{
  v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    unint64_t v3 = result;
    unint64_t v4 = (void *)result[3];
    long long v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        float result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        float result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      float result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_235AF21C8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,rf::data_flow::consumer::AnchorManagementConsumer::SceneSubscription>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

uint64_t rf::data_flow::consumer::SyntheticEnvironmentConsumer::SyntheticEnvironmentConsumer(uint64_t a1)
{
  *(void *)a1 = &unk_26E8F6960;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  uint64_t v2 = *MEMORY[0x263F375C8];
  *(void *)(a1 + 40) = *MEMORY[0x263F375C8];
  *(void *)(a1 + 48) = v2;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 1065353216;
  *(void *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(unsigned char *)(a1 + 160) = 0;
  unint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unint64_t v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  *(void *)(a1 + 200) = dispatch_queue_create("RealityFusionSyntheticEnvironmentConsumer", v4);

  *(void *)(a1 + 208) = dispatch_group_create();
  return a1;
}

void rf::data_flow::consumer::SyntheticEnvironmentConsumer::~SyntheticEnvironmentConsumer(rf::data_flow::consumer::SyntheticEnvironmentConsumer *this)
{
  *(void *)this = &unk_26E8F6960;
  uint64_t v2 = *((void *)this + 26);
  if (v2)
  {
    dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    unint64_t v3 = (void *)*((void *)this + 26);
    *((void *)this + 26) = 0;
  }
  unint64_t v4 = (void *)*((void *)this + 25);
  *((void *)this + 25) = 0;

  rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeAllSyntheticAssets(this);
  std::__function::__value_func<void ()(NSURL *,NSError *)>::~__value_func[abi:ne180100]((void *)this + 21);
  std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::~deque[abi:ne180100]((uint64_t)this + 112);
  std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::~__hash_table((uint64_t)this + 72);
  RESharedPtr<REEntity>::~RESharedPtr((void *)this + 8);
  RESharedPtr<REAsset>::~RESharedPtr((void *)this + 7);
  RESharedPtr<REAsset>::~RESharedPtr((void *)this + 4);
  RESharedPtr<REAsset>::~RESharedPtr((void *)this + 3);
}

{
  uint64_t vars8;

  rf::data_flow::consumer::SyntheticEnvironmentConsumer::~SyntheticEnvironmentConsumer(this);
  JUMPOUT(0x237DEE2B0);
}

uint64_t rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeAllSyntheticAssets(rf::data_flow::consumer::SyntheticEnvironmentConsumer *this)
{
  uint64_t result = *((void *)this + 8);
  if (result)
  {
    if (!REEntityGetSceneNullable())
    {
      rf::getMessage((rf *)"Synthetic environments root entity has been removed from the scene!", __p);
      rf::internal::logAssert((const char *)__p);
      if (v5 < 0) {
        operator delete(__p[0]);
      }
      rf::internal::debugBreakHandler(v3);
    }
    std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::clear((uint64_t)this + 72);
    REEntitySetParent();
    if (*((void *)this + 8)) {
      RERelease();
    }
    *((void *)this + 8) = 0;
    return rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeRenderGraphProviders((uint64_t)this);
  }
  return result;
}

void sub_235AF2458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t rf::data_flow::consumer::SyntheticEnvironmentConsumer::removeRenderGraphProviders(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *MEMORY[0x263F375C8];
  if (*(void *)(result + 48) != *MEMORY[0x263F375C8])
  {
    uint64_t result = RESceneRenderGraphFileProviderArrayRemove();
    *(void *)(v1 + 48) = v2;
  }
  if (*(void *)(v1 + 40) != v2)
  {
    uint64_t result = RESceneRenderGraphFileProviderArrayRemove();
    *(void *)(v1 + 40) = v2;
  }
  return result;
}

void std::function<void ()(NSURL *,NSError *)>::operator()(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  uint64_t v5 = *(void *)(a1 + 24);
  if (!v5) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, id *, id *))(*(void *)v5 + 48))(v5, &v7, &v6);
}

void sub_235AF25A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke(uint64_t a1)
{
  return MEMORY[0x270F1FD70](*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void ___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 48);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    unint64_t v3 = rf::realityFusionLogObject((rf *)a1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)simd_float4x4 buf = 136315138;
      *(void *)&uint8_t buf[4] = REEntityGetName();
      _os_log_impl(&dword_235A7C000, v3, OS_LOG_TYPE_DEFAULT, "SyntheticEnvironmentConsumer failed importing asset at path %s", buf, 0xCu);
    }

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)simd_float4x4 buf = 138412290;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_error_impl(&dword_235A7C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    RERelease();
    if (*(void *)(v2 + 192)) {
      std::function<void ()(NSURL *,NSError *)>::operator()(v2 + 168, *(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    }
LABEL_8:
    CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    return;
  }
  unint64_t v4 = (rf *)RESceneImportOperationPublishToEngine();
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v5 = rf::realityFusionLogObject(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)simd_float4x4 buf = 136315138;
      *(void *)&uint8_t buf[4] = REEntityGetName();
      _os_log_impl(&dword_235A7C000, v5, OS_LOG_TYPE_DEFAULT, "SyntheticEnvironmentConsumer failed to publish imported asset at path %s", buf, 0xCu);
    }

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)simd_float4x4 buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_error_impl(&dword_235A7C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    RERelease();
    if (*(void *)(v2 + 192)) {
      std::function<void ()(NSURL *,NSError *)>::operator()(v2 + 168, *(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    }
    goto LABEL_8;
  }
  if (RESceneImportOperationGetSceneAsset())
  {
    int ChildCount = REEntityGetChildCount();
    if (ChildCount >= 1)
    {
      unint64_t v7 = ChildCount + 1;
      do
      {
        uint64_t Child = REEntityGetChild();
        MEMORY[0x237DED700](Child);
        --v7;
      }
      while (v7 > 1);
    }
    REEntitySubtreeLoadFromAsset();
    uint64_t v9 = *(void *)(a1 + 56);
    long long v21 = 0u;
    long long v22 = 0u;
    *(_OWORD *)simd_float4x4 buf = 0u;
    std::deque<REEntity *>::__add_back_capacity(buf);
    uint64_t v10 = *((void *)&v22 + 1);
    *(void *)(*(void *)(*(void *)&buf[8] + (((*((void *)&v22 + 1) + (void)v22) >> 6) & 0x3FFFFFFFFFFFFF8))
              + 8 * ((*((void *)&v22 + 1) + v22) & 0x1FF)) = v9;
    BOOL v11 = __CFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    *((void *)&v22 + 1) = v12;
    if (!v11)
    {
      do
      {
        uint64_t v13 = (((void)v21 - *(void *)&buf[8]) << 6) - 1;
        if ((void)v21 == *(void *)&buf[8]) {
          uint64_t v13 = 0;
        }
        *((void *)&v22 + 1) = v12 - 1;
        if ((unint64_t)(v13 - (v22 + v12 - 1)) >= 0x400)
        {
          operator delete(*(void **)(v21 - 8));
          *(void *)&long long v21 = v21 - 8;
        }
        REMeshComponentGetComponentType();
        if (REEntityGetComponentByClass())
        {
          if (REMeshComponentGetMaterialCount())
          {
            REMeshComponentGetMaterialAtIndex();
            if (REMaterialAssetGetTextureAsset())
            {
              REMeshComponentRemoveAllMaterials();
              REMeshComponentAddMaterial();
              REMaterialParameterBlockArrayComponentGetComponentType();
              REEntityGetOrAddComponentByClass();
              if (!REMaterialParameterBlockArrayComponentGetBlockAtIndex())
              {
                RERenderManagerMaterialParameterBlockCreateWithAsset();
                REMaterialParameterBlockArrayComponentSetBlockAtIndex();
                RERelease();
              }
              REMaterialParameterBlockSetTextureFromAsset();
            }
          }
        }
        uint64_t v14 = REEntityGetChildCount();
        if (v14)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            uint64_t v19 = REEntityGetChild();
            std::deque<REEntity *>::push_back(buf, &v19);
          }
        }
        uint64_t v12 = *((void *)&v22 + 1);
      }
      while (*((void *)&v22 + 1));
    }
    std::deque<REEntity *>::~deque[abi:ne180100](buf);
  }
  else
  {
    rf::getMessage((rf *)"Couldn't get scene asset from import operation", buf);
    rf::internal::logAssert((const char *)buf);
    if (SBYTE7(v21) < 0) {
      operator delete(*(void **)buf);
    }
    rf::internal::debugBreakHandler(v18);
  }
  RERelease();
  if (*(void *)(v2 + 192)) {
    std::function<void ()(NSURL *,NSError *)>::operator()(v2 + 168, *(void **)(a1 + 32), 0);
  }
  *(unsigned char *)(v2 + 160) = 0;
}

void sub_235AF2A9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void rf::data_flow::consumer::SyntheticEnvironmentConsumer::consumeLatestUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a2 + 32) && *(unsigned char *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 8);
    std::mutex::lock((std::mutex *)v4);
    long long v128 = (std::mutex *)v4;
    if (*(void *)(v4 + 2664))
    {
      if (!*(unsigned char *)(a2 + 32) || !*(unsigned char *)(a2 + 16)) {
        goto LABEL_217;
      }
      uint64_t v5 = MEMORY[0x237DEDE50](*(void *)(a2 + 8));
      if (v5 && REAssetGetAssetManager() != v5)
      {
        *(void *)simd_float4x4 buf = REAssetManagerCreateAssetHandle();
        uint64_t v6 = *(void *)(a1 + 24);
        *(void *)(a1 + 24) = *(void *)buf;
        if (v6) {
          RERelease();
        }
        *(void *)simd_float4x4 buf = 0;
        RESharedPtr<REAsset>::~RESharedPtr(buf);
        REAssetHandleLoadNow();
        if ((REAssetHandleIsLoaded() & 1) == 0)
        {
          rf::getMessage((rf *)"Loading renderSyntheticEnvironment provider failed!", buf);
          rf::internal::logAssert((const char *)buf);
          if (SBYTE7(v135) < 0) {
            operator delete(*(void **)buf);
          }
          rf::internal::debugBreakHandler(v114);
        }
        *(void *)simd_float4x4 buf = REAssetManagerCreateAssetHandle();
        uint64_t v7 = *(void *)(a1 + 32);
        *(void *)(a1 + 32) = *(void *)buf;
        if (v7) {
          RERelease();
        }
        *(void *)simd_float4x4 buf = 0;
        RESharedPtr<REAsset>::~RESharedPtr(buf);
        REAssetHandleLoadNow();
        if ((REAssetHandleIsLoaded() & 1) == 0)
        {
          rf::getMessage((rf *)"Loading composeSyntheticEnvironment provider failed!", buf);
          rf::internal::logAssert((const char *)buf);
          if (SBYTE7(v135) < 0) {
            operator delete(*(void **)buf);
          }
          rf::internal::debugBreakHandler(v115);
        }
        RESceneAddRenderGraphFileProviderArray();
        *(void *)(a1 + 40) = RESceneRenderGraphFileProviderArrayAdd();
        *(void *)(a1 + 48) = RESceneRenderGraphFileProviderArrayAdd();
        *(void *)simd_float4x4 buf = REAssetManagerCreateAssetHandle();
        uint64_t v8 = *(void *)(a1 + 56);
        *(void *)(a1 + 56) = *(void *)buf;
        if (v8) {
          RERelease();
        }
        *(void *)simd_float4x4 buf = 0;
        RESharedPtr<REAsset>::~RESharedPtr(buf);
        REAssetHandleLoadNow();
        if ((REAssetHandleIsLoaded() & 1) == 0)
        {
          rf::getMessage((rf *)"Loading syntheticEnvironmentUnlit material failed!", buf);
          rf::internal::logAssert((const char *)buf);
          if (SBYTE7(v135) < 0) {
            operator delete(*(void **)buf);
          }
          rf::internal::debugBreakHandler(v116);
        }
      }
    }
    for (uint64_t i = *(void **)(v4 + 2696); i; uint64_t i = (void *)*i)
    {
      *(_DWORD *)simd_float4x4 buf = 1;
      std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::emplace_back<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation::Type,std::string const&>((void *)(a1 + 112), (int *)buf, (uint64_t)(i + 2));
    }
    for (j = *(void **)&v128[41].__m_.__opaque[24]; j; j = (void *)*j)
    {
      *(_DWORD *)simd_float4x4 buf = 0;
      std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::emplace_back<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation::Type,std::string const&>((void *)(a1 + 112), (int *)buf, (uint64_t)(j + 2));
    }
    BOOL v11 = *(uint64_t **)&v128[42].__m_.__opaque[40];
    if (v11)
    {
      uint64_t v12 = *(void *)(a1 + 152);
      do
      {
        uint64_t v13 = *(void *)(a1 + 120);
        uint64_t v14 = *(void *)(a1 + 128);
        uint64_t v15 = 42 * ((v14 - v13) >> 3) - 1;
        if (v14 == v13) {
          uint64_t v15 = 0;
        }
        if (v15 == v12 + *(void *)(a1 + 144))
        {
          std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::__add_back_capacity((void *)(a1 + 112));
          uint64_t v13 = *(void *)(a1 + 120);
          uint64_t v14 = *(void *)(a1 + 128);
        }
        if (v14 == v13)
        {
          unint64_t v17 = 0;
        }
        else
        {
          unint64_t v16 = *(void *)(a1 + 152) + *(void *)(a1 + 144);
          unint64_t v17 = *(void *)(v13 + 8 * (v16 / 0x2A)) + 96 * (v16 % 0x2A);
        }
        if (*((char *)v11 + 39) < 0) {
          std::string::__init_copy_ctor_external(&block, (const std::string::value_type *)v11[2], v11[3]);
        }
        else {
          std::string block = *(std::string *)(v11 + 2);
        }
        long long v18 = *((_OWORD *)v11 + 4);
        *(_OWORD *)simd_float4x4 buf = *((_OWORD *)v11 + 3);
        long long v135 = v18;
        long long v19 = *((_OWORD *)v11 + 6);
        long long v136 = *((_OWORD *)v11 + 5);
        long long v137 = v19;
        *(_DWORD *)unint64_t v17 = 2;
        uint64_t v20 = (std::string *)(v17 + 8);
        if (SHIBYTE(block.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v20, block.__r_.__value_.__l.__data_, block.__r_.__value_.__l.__size_);
          int v24 = SHIBYTE(block.__r_.__value_.__r.__words[2]);
          long long v25 = v135;
          *(_OWORD *)(v17 + 32) = *(_OWORD *)buf;
          *(_OWORD *)(v17 + 48) = v25;
          long long v26 = v137;
          *(_OWORD *)(v17 + 64) = v136;
          *(_OWORD *)(v17 + 80) = v26;
          if (v24 < 0) {
            operator delete(block.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          long long v21 = *(_OWORD *)&block.__r_.__value_.__l.__data_;
          *(void *)(v17 + 24) = *((void *)&block.__r_.__value_.__l + 2);
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
          long long v22 = v135;
          *(_OWORD *)(v17 + 32) = *(_OWORD *)buf;
          *(_OWORD *)(v17 + 48) = v22;
          long long v23 = v137;
          *(_OWORD *)(v17 + 64) = v136;
          *(_OWORD *)(v17 + 80) = v23;
        }
        uint64_t v12 = *(void *)(a1 + 152) + 1;
        *(void *)(a1 + 152) = v12;
        BOOL v11 = (uint64_t *)*v11;
      }
      while (v11);
    }
    if (*(unsigned char *)(a2 + 32) && *(unsigned char *)(a2 + 16))
    {
      if (*(unsigned char *)(a1 + 160))
      {
LABEL_41:
        std::mutex::unlock(v128);
        return;
      }
      long long v27 = (void *)(a1 + 72);
      v125 = (unsigned __int8 *)(a1 + 88);
      id v126 = (unint64_t *)(a1 + 96);
      uint64_t v127 = *(void *)(a2 + 24);
      long long v121 = (float *)(a1 + 104);
      uint64_t v28 = *(void *)(a2 + 8);
      CFStringRef domain = (const __CFString *)*MEMORY[0x263F376B0];
      uuid_t v120 = (void *)(a1 + 72);
      uint64_t v118 = v28;
      while (1)
      {
        if (!*(void *)(a1 + 152)) {
          goto LABEL_41;
        }
        unint64_t v29 = *(void *)(a1 + 144);
        uint64_t v30 = *(void *)(*(void *)(a1 + 120) + 8 * (v29 / 0x2A));
        unint64_t v31 = v29 % 0x2A;
        int v32 = *(_DWORD *)(v30 + 96 * v31);
        if (v32 == 2)
        {
          uint64_t v47 = v30 + 96 * v31;
          if (std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, (unsigned __int8 *)(v47 + 8)))
          {
            if (REEntityGetSceneNullable() != v127)
            {
              rf::getMessage((rf *)"Asset entity doesn't belong to the right scene", buf);
              rf::internal::logAssert((const char *)buf);
              if (SBYTE7(v135) < 0) {
                operator delete(*(void **)buf);
              }
              rf::internal::debugBreakHandler(v113);
            }
            RETransformComponentGetComponentType();
            REEntityGetComponentByClass();
            RETransformComponentSetWorldMatrix4x4F();
          }
          else
          {
            float32x4_t v50 = rf::realityFusionLogObject(0);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              if (*(char *)(v47 + 31) >= 0) {
                uint64_t v51 = v47 + 8;
              }
              else {
                uint64_t v51 = *(void *)(v47 + 8);
              }
              *(_DWORD *)simd_float4x4 buf = 136315138;
              *(void *)&uint8_t buf[4] = v51;
              _os_log_impl(&dword_235A7C000, v50, OS_LOG_TYPE_DEFAULT, "Trying to update unknown synthetic asset %s", buf, 0xCu);
            }
          }
          goto LABEL_174;
        }
        if (v32 == 1)
        {
          uint64_t v42 = v30 + 96 * v31 + 8;
          if (std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, (unsigned __int8 *)v42))
          {
            if (REEntityGetSceneNullable() != v127)
            {
              rf::getMessage((rf *)"Asset entity doesn't belong to the right scene", buf);
              rf::internal::logAssert((const char *)buf);
              if (SBYTE7(v135) < 0) {
                operator delete(*(void **)buf);
              }
              rf::internal::debugBreakHandler(v112);
            }
            REEntitySetParent();
            int8x16_t v43 = std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, (unsigned __int8 *)v42);
            if (v43)
            {
              int8x8_t v44 = *(int8x8_t *)(a1 + 80);
              unint64_t v45 = *((void *)v43 + 1);
              uint8x8_t v46 = (uint8x8_t)vcnt_s8(v44);
              v46.i16[0] = vaddlv_u8(v46);
              if (v46.u32[0] > 1uLL)
              {
                if (v45 >= *(void *)&v44) {
                  v45 %= *(void *)&v44;
                }
              }
              else
              {
                v45 &= *(void *)&v44 - 1;
              }
              uint64_t v53 = *(unsigned __int8 **)(*v27 + 8 * v45);
              do
              {
                uint64_t v54 = v53;
                uint64_t v53 = *(unsigned __int8 **)v53;
              }
              while (v53 != v43);
              if (v54 == v125) {
                goto LABEL_148;
              }
              unint64_t v55 = *((void *)v54 + 1);
              if (v46.u32[0] > 1uLL)
              {
                if (v55 >= *(void *)&v44) {
                  v55 %= *(void *)&v44;
                }
              }
              else
              {
                v55 &= *(void *)&v44 - 1;
              }
              if (v55 != v45)
              {
LABEL_148:
                if (!*(void *)v43) {
                  goto LABEL_149;
                }
                unint64_t v56 = *(void *)(*(void *)v43 + 8);
                if (v46.u32[0] > 1uLL)
                {
                  if (v56 >= *(void *)&v44) {
                    v56 %= *(void *)&v44;
                  }
                }
                else
                {
                  v56 &= *(void *)&v44 - 1;
                }
                if (v56 != v45) {
LABEL_149:
                }
                  *(void *)(*v27 + 8 * v45) = 0;
              }
              uint64_t v92 = *(void *)v43;
              if (*(void *)v43)
              {
                unint64_t v93 = *(void *)(v92 + 8);
                if (v46.u32[0] > 1uLL)
                {
                  if (v93 >= *(void *)&v44) {
                    v93 %= *(void *)&v44;
                  }
                }
                else
                {
                  v93 &= *(void *)&v44 - 1;
                }
                if (v93 != v45)
                {
                  *(void *)(*v27 + 8 * v93) = v54;
                  uint64_t v92 = *(void *)v43;
                }
              }
              *(void *)uint64_t v54 = v92;
              *(void *)int8x16_t v43 = 0;
              --*v126;
              *(void *)simd_float4x4 buf = v43;
              *(void *)&buf[8] = a1 + 88;
              LOBYTE(v135) = 1;
              std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>>>>::reset[abi:ne180100]((uint64_t)buf);
            }
          }
          else
          {
            float32x4_t v48 = rf::realityFusionLogObject(0);
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              if (*(char *)(v42 + 23) >= 0) {
                uint64_t v49 = v42;
              }
              else {
                uint64_t v49 = *(void *)v42;
              }
              *(_DWORD *)simd_float4x4 buf = 136315138;
              *(void *)&uint8_t buf[4] = v49;
              _os_log_impl(&dword_235A7C000, v48, OS_LOG_TYPE_DEFAULT, "Trying to remove unknown synthetic asset %s", buf, 0xCu);
            }
          }
          goto LABEL_174;
        }
        if (!v32) {
          break;
        }
LABEL_174:
        unint64_t v105 = *(void *)(a1 + 144);
        uint64_t v106 = *(void *)(*(void *)(a1 + 120) + 8 * (v105 / 0x2A));
        if (*(char *)(v106 + 96 * (v105 % 0x2A) + 31) < 0)
        {
          operator delete(*(void **)(v106 + 96 * (v105 % 0x2A) + 8));
          unint64_t v105 = *(void *)(a1 + 144);
        }
        uint64_t v107 = *(void *)(a1 + 152) - 1;
        unint64_t v108 = v105 + 1;
        *(void *)(a1 + 144) = v108;
        *(void *)(a1 + 152) = v107;
        if (v108 >= 0x54)
        {
          operator delete(**(void ***)(a1 + 120));
          *(void *)(a1 + 120) += 8;
          *(void *)(a1 + 144) -= 42;
        }
        if (*(unsigned char *)(a1 + 160)) {
          goto LABEL_41;
        }
      }
      uint64_t v33 = v30 + 96 * v31;
      long long v36 = *(uint64_t **)(v33 + 8);
      long long v35 = (unsigned __int8 *)(v33 + 8);
      long long v34 = v36;
      if ((v35[23] & 0x80u) == 0) {
        long long v37 = (uint64_t *)v35;
      }
      else {
        long long v37 = v34;
      }
      uint64_t v38 = objc_msgSend(NSString, "stringWithUTF8String:", v37, v117);
      float32x4_t v39 = [NSURL fileURLWithPath:v38];
      float32x4_t v40 = std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(v27, v35);
      if (v40)
      {
        uint64_t v41 = *((void *)v40 + 5);
LABEL_164:
        RESubsceneComponentGetComponentType();
        uint64_t ComponentByClass = (rf *)REEntityGetComponentByClass();
        if (ComponentByClass)
        {
          long long v95 = rf::realityFusionLogObject(ComponentByClass);
          if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
          {
            if ((v35[23] & 0x80u) == 0) {
              long long v96 = (const std::string::value_type *)v35;
            }
            else {
              long long v96 = *(const std::string::value_type **)v35;
            }
            LODWORD(v141) = 136315138;
            *(void *)((char *)&v141 + 4) = v96;
            _os_log_impl(&dword_235A7C000, v95, OS_LOG_TYPE_DEFAULT, "Synthetic asset at path %s is already loaded", (uint8_t *)&v141, 0xCu);
          }

          if (*(void *)(a1 + 192))
          {
            CFErrorRef v97 = CFErrorCreate(0, domain, 1, 0);
            std::function<void ()(NSURL *,NSError *)>::operator()(a1 + 168, v39, v97);
            CFRelease(v97);
          }
        }
        else
        {
          float32x4_t v124 = v38;
          uint64_t v98 = RESceneImportOperationCreateWithURL();
          RESceneImportOperationSetUnitType();
          RESceneImportOperationSetIsolateFromEngine();
          RESceneImportOperationSetCompressTextures();
          *(void *)&long long v141 = 0;
          *((void *)&v141 + 1) = &v141;
          uint64_t v142 = 0x2020000000;
          uint64_t v143 = 0;
          *(unsigned char *)(a1 + 160) = 1;
          id v100 = *(NSObject **)(a1 + 200);
          uint64_t v99 = *(NSObject **)(a1 + 208);
          block.__r_.__value_.__r.__words[0] = MEMORY[0x263EF8330];
          block.__r_.__value_.__l.__size_ = 3221225472;
          block.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke;
          float32x4_t v130 = &unk_264C68408;
          float32x4_t v131 = &v141;
          uint64_t v132 = v98;
          dispatch_group_async(v99, v100, &block);
          uint64_t v101 = MEMORY[0x237DEDE90](v28);
          uint64_t v102 = MEMORY[0x237DEDE50](v28);
          long long v103 = REAssetManagerGetEngineQueue();
          long long v104 = *(NSObject **)(a1 + 208);
          *(void *)simd_float4x4 buf = MEMORY[0x263EF8330];
          *(void *)&buf[8] = 3221225472;
          *(void *)&long long v135 = ___ZN2rf9data_flow8consumer28SyntheticEnvironmentConsumer24addSyntheticAssetToSceneERKNSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEP7RESceneP16REServiceLocator_block_invoke_2;
          *((void *)&v135 + 1) = &unk_264C68430;
          *((void *)&v136 + 1) = &v141;
          *(void *)&long long v137 = a1;
          *((void *)&v137 + 1) = v41;
          uint64_t v138 = v98;
          *(void *)&long long v136 = v39;
          uint64_t v139 = v102;
          uint64_t v140 = v101;
          dispatch_group_notify(v104, v103, buf);

          uint64_t v38 = v124;
          _Block_object_dispose(&v141, 8);
        }

        goto LABEL_174;
      }
      float32x4_t v122 = v39;
      float32x4_t v123 = v38;
      if (!*(void *)(a1 + 64) || REEntityGetSceneNullable() != v127)
      {
        *(void *)&long long v141 = REEntityCreate();
        uint64_t v52 = *(void *)(a1 + 64);
        *(void *)(a1 + 64) = v141;
        if (v52) {
          RERelease();
        }
        *(void *)&long long v141 = 0;
        RESharedPtr<REEntity>::~RESharedPtr(&v141);
        REEntitySetName();
        RETransformComponentGetComponentType();
        REEntityAddComponentByClass();
        REAnchorComponentGetComponentType();
        REEntityAddComponentByClass();
        REAnchorComponentSetAnchoredLocally();
        RESceneAddEntity();
        REHideEntity();
      }
      uint64_t v41 = REEntityCreate();
      REEntitySetName();
      RETransformComponentGetComponentType();
      REEntityAddComponentByClass();
      REEntitySetParent();
      REHideEntity();
      RERelease();
      RESharedPtr<REEntity>::fromGet(v41, &v133);
      float32x4_t v57 = (char *)operator new(0x30uLL);
      float32x4_t v58 = v57;
      *(void *)&long long v141 = v57;
      *((void *)&v141 + 1) = a1 + 88;
      LOBYTE(v142) = 0;
      float32x4_t v59 = (unsigned __int8 *)(v57 + 16);
      *(void *)float32x4_t v57 = 0;
      *((void *)v57 + 1) = 0;
      if ((char)v35[23] < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v57 + 16), *(const std::string::value_type **)v35, *((void *)v35 + 1));
      }
      else
      {
        long long v60 = *(_OWORD *)v35;
        *((void *)v57 + 4) = *((void *)v35 + 2);
        *(_OWORD *)float32x4_t v59 = v60;
      }
      v58[5] = v133;
      uint64_t v133 = 0;
      LOBYTE(v142) = 1;
      v58[1] = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v126, (uint64_t)v59);
      unint64_t v61 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v126, (uint64_t)v59);
      v58[1] = v61;
      unint64_t v62 = *(void *)(a1 + 80);
      if (v62)
      {
        unint64_t v63 = v61;
        uint8x8_t v64 = (uint8x8_t)vcnt_s8((int8x8_t)v62);
        v64.i16[0] = vaddlv_u8(v64);
        unint64_t v65 = v64.u32[0];
        if (v64.u32[0] > 1uLL)
        {
          unint64_t v66 = v61;
          if (v62 <= v61) {
            unint64_t v66 = v61 % v62;
          }
        }
        else
        {
          unint64_t v66 = (v62 - 1) & v61;
        }
        long long v67 = *(unsigned __int8 ***)(*v120 + 8 * v66);
        if (v67)
        {
          id v68 = *v67;
          if (*v67)
          {
            unint64_t v117 = v62 - 1;
            do
            {
              unint64_t v69 = *((void *)v68 + 1);
              if (v69 == v63)
              {
                if (std::equal_to<std::string>::operator()[abi:ne180100]((uint64_t)v121, v68 + 16, v59)) {
                  goto LABEL_163;
                }
              }
              else
              {
                if (v65 > 1)
                {
                  if (v69 >= v62) {
                    v69 %= v62;
                  }
                }
                else
                {
                  v69 &= v117;
                }
                if (v69 != v66) {
                  break;
                }
              }
              id v68 = *(unsigned __int8 **)v68;
            }
            while (v68);
          }
        }
      }
      float v70 = (float)(*v126 + 1);
      float v71 = *v121;
      if (v62 && (float)(v71 * (float)v62) >= v70)
      {
LABEL_113:
        int8x8_t v72 = *(int8x8_t *)(a1 + 80);
        unint64_t v73 = v58[1];
        uint8x8_t v74 = (uint8x8_t)vcnt_s8(v72);
        v74.i16[0] = vaddlv_u8(v74);
        if (v74.u32[0] > 1uLL)
        {
          if (v73 >= *(void *)&v72) {
            v73 %= *(void *)&v72;
          }
        }
        else
        {
          v73 &= *(void *)&v72 - 1;
        }
        long long v79 = (void *)*v120;
        simd_float4 v80 = *(void **)(*v120 + 8 * v73);
        if (v80)
        {
          void *v58 = *v80;
        }
        else
        {
          void *v58 = *(void *)v125;
          *(void *)v125 = v58;
          v79[v73] = v125;
          if (!*v58) {
            goto LABEL_162;
          }
          unint64_t v81 = *(void *)(*v58 + 8);
          if (v74.u32[0] > 1uLL)
          {
            if (v81 >= *(void *)&v72) {
              v81 %= *(void *)&v72;
            }
          }
          else
          {
            v81 &= *(void *)&v72 - 1;
          }
          simd_float4 v80 = (void *)(*v120 + 8 * v81);
        }
        *simd_float4 v80 = v58;
LABEL_162:
        ++*v126;
        *(void *)&long long v141 = 0;
LABEL_163:
        std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v141);
        RESharedPtr<REEntity>::~RESharedPtr(&v133);
        long long v27 = (void *)(a1 + 72);
        uint64_t v28 = v118;
        float32x4_t v39 = v122;
        uint64_t v38 = v123;
        goto LABEL_164;
      }
      BOOL v75 = (v62 & (v62 - 1)) != 0;
      if (v62 < 3) {
        BOOL v75 = 1;
      }
      unint64_t v76 = v75 | (2 * v62);
      unint64_t v77 = vcvtps_u32_f32(v70 / v71);
      if (v76 <= v77) {
        int8x8_t prime = (int8x8_t)v77;
      }
      else {
        int8x8_t prime = (int8x8_t)v76;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      }
      int8x8_t v82 = *(int8x8_t *)(a1 + 80);
      if (*(void *)&prime <= *(void *)&v82)
      {
        if (*(void *)&prime >= *(void *)&v82) {
          goto LABEL_113;
        }
        unint64_t v89 = vcvtps_u32_f32((float)*v126 / *v121);
        if (*(void *)&v82 < 3uLL || (uint8x8_t v90 = (uint8x8_t)vcnt_s8(v82), v90.i16[0] = vaddlv_u8(v90), v90.u32[0] > 1uLL))
        {
          unint64_t v89 = std::__next_prime(v89);
        }
        else
        {
          uint64_t v91 = 1 << -(char)__clz(v89 - 1);
          if (v89 >= 2) {
            unint64_t v89 = v91;
          }
        }
        if (*(void *)&prime <= v89) {
          int8x8_t prime = (int8x8_t)v89;
        }
        if (*(void *)&prime >= *(void *)&v82) {
          goto LABEL_113;
        }
        if (!*(void *)&prime)
        {
          float32x4_t v111 = (void *)*v120;
          void *v120 = 0;
          if (v111) {
            operator delete(v111);
          }
          *(void *)(a1 + 80) = 0;
          goto LABEL_113;
        }
      }
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v83 = operator new(8 * *(void *)&prime);
      id v84 = (void *)*v120;
      void *v120 = v83;
      if (v84) {
        operator delete(v84);
      }
      uint64_t v85 = 0;
      *(int8x8_t *)(a1 + 80) = prime;
      do
        *(void *)(*v120 + 8 * v85++) = 0;
      while (*(void *)&prime != v85);
      simd_float4 v86 = *(void **)v125;
      if (!*(void *)v125) {
        goto LABEL_113;
      }
      unint64_t v87 = v86[1];
      uint8x8_t v88 = (uint8x8_t)vcnt_s8(prime);
      v88.i16[0] = vaddlv_u8(v88);
      if (v88.u32[0] > 1uLL)
      {
        if (v87 >= *(void *)&prime) {
          v87 %= *(void *)&prime;
        }
      }
      else
      {
        v87 &= *(void *)&prime - 1;
      }
      *(void *)(*v120 + 8 * v87) = v125;
      uint64_t v109 = (void *)*v86;
      if (!*v86) {
        goto LABEL_113;
      }
      while (1)
      {
        unint64_t v110 = v109[1];
        if (v88.u32[0] > 1uLL)
        {
          if (v110 >= *(void *)&prime) {
            v110 %= *(void *)&prime;
          }
        }
        else
        {
          v110 &= *(void *)&prime - 1;
        }
        if (v110 != v87)
        {
          if (!*(void *)(*v120 + 8 * v110))
          {
            *(void *)(*v120 + 8 * v110) = v86;
            goto LABEL_191;
          }
          *simd_float4 v86 = *v109;
          *uint64_t v109 = **(void **)(*v120 + 8 * v110);
          **(void **)(*v120 + 8 * v110) = v109;
          uint64_t v109 = v86;
        }
        unint64_t v110 = v87;
LABEL_191:
        simd_float4 v86 = v109;
        uint64_t v109 = (void *)*v109;
        unint64_t v87 = v110;
        if (!v109) {
          goto LABEL_113;
        }
      }
    }
LABEL_217:
    std::__throw_bad_optional_access[abi:ne180100]();
  }
}

void sub_235AF3B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::mutex *a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,void *__p,uint64_t a37,int a38,__int16 a39,char a40,char a41)
{
  if (a41 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(a24);
  _Unwind_Resume(a1);
}

void sub_235AF3C38()
{
}

uint64_t std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::~deque[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 8);
  unint64_t v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    uint64_t v4 = (void *)(a1 + 40);
    unint64_t v3 = *(void ***)(a1 + 8);
  }
  else
  {
    uint64_t v4 = (void *)(a1 + 40);
    unint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = &v2[v5 / 0x2A];
    unint64_t v7 = (unint64_t)*v6;
    unint64_t v8 = (unint64_t)*v6 + 96 * (v5 % 0x2A);
    unint64_t v9 = (unint64_t)v2[(*(void *)(a1 + 40) + v5) / 0x2A] + 96 * ((*(void *)(a1 + 40) + v5) % 0x2A);
    if (v8 != v9)
    {
      do
      {
        if (*(char *)(v8 + 31) < 0)
        {
          operator delete(*(void **)(v8 + 8));
          unint64_t v7 = (unint64_t)*v6;
        }
        v8 += 96;
        if (v8 - v7 == 4032)
        {
          unint64_t v10 = (unint64_t)v6[1];
          ++v6;
          unint64_t v7 = v10;
          unint64_t v8 = v10;
        }
      }
      while (v8 != v9);
      uint64_t v2 = *(void ***)(a1 + 8);
      unint64_t v3 = *(void ***)(a1 + 16);
    }
  }
  *uint64_t v4 = 0;
  unint64_t v11 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      unint64_t v3 = *(void ***)(a1 + 16);
      uint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v11 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v12 = v11 >> 3;
  if (v12 == 1)
  {
    uint64_t v13 = 21;
    goto LABEL_16;
  }
  if (v12 == 2)
  {
    uint64_t v13 = 42;
LABEL_16:
    *(void *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      uint64_t v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    uint64_t v16 = *(void *)(a1 + 8);
    uint64_t v15 = *(void *)(a1 + 16);
    if (v15 != v16) {
      *(void *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::emplace_back<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation::Type,std::string const&>(void *a1, int *a2, uint64_t a3)
{
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = 42 * ((v7 - v6) >> 3) - 1;
  if (v7 == v6) {
    uint64_t v8 = 0;
  }
  if (v8 == a1[5] + a1[4])
  {
    std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::__add_back_capacity(a1);
    uint64_t v6 = a1[1];
    uint64_t v7 = a1[2];
  }
  if (v7 == v6)
  {
    unint64_t v10 = 0;
  }
  else
  {
    unint64_t v9 = a1[5] + a1[4];
    unint64_t v10 = *(void *)(v6 + 8 * (v9 / 0x2A)) + 96 * (v9 % 0x2A);
  }
  int v11 = *a2;
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  *(_DWORD *)unint64_t v10 = v11;
  unint64_t v12 = (std::string *)(v10 + 8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(v12, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    int v14 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    *(_OWORD *)(v10 + 32) = xmmword_235AF75E0;
    *(_OWORD *)(v10 + 48) = xmmword_235AF75F0;
    *(_OWORD *)(v10 + 64) = xmmword_235AF7600;
    *(_OWORD *)(v10 + 80) = xmmword_235AF7AA0;
    if (v14 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v13 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v10 + 24) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
    *(_OWORD *)(v10 + 32) = xmmword_235AF75E0;
    *(_OWORD *)(v10 + 48) = xmmword_235AF75F0;
    *(_OWORD *)(v10 + 64) = xmmword_235AF7600;
    *(_OWORD *)(v10 + 80) = xmmword_235AF7AA0;
  }
  ++a1[5];
}

void sub_235AF3F48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::deque<rf::data_flow::consumer::SyntheticEnvironmentConsumer::Operation>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    a1[4] = v4;
    unint64_t v5 = (void *)a1[1];
    uint64_t v6 = (char *)a1[2];
    uint64_t v9 = *v5;
    uint64_t v7 = (char *)(v5 + 1);
    uint64_t v8 = v9;
    a1[1] = v7;
    if (v6 != (char *)a1[3]) {
      goto LABEL_41;
    }
    uint64_t v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v38 = 1;
      }
      else {
        unint64_t v38 = (uint64_t)&v6[-*a1] >> 2;
      }
      float32x4_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v38);
      float32x4_t v40 = &v39[8 * (v38 >> 2)];
      uint64_t v42 = &v39[8 * v41];
      int8x16_t v43 = (uint64_t *)a1[1];
      uint64_t v6 = v40;
      uint64_t v44 = a1[2] - (void)v43;
      if (v44)
      {
        uint64_t v6 = &v40[v44 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v45 = 8 * (v44 >> 3);
        uint8x8_t v46 = &v39[8 * (v38 >> 2)];
        do
        {
          uint64_t v47 = *v43++;
          *(void *)uint8x8_t v46 = v47;
          v46 += 8;
          v45 -= 8;
        }
        while (v45);
      }
      goto LABEL_29;
    }
LABEL_5:
    uint64_t v11 = v10 >> 3;
    BOOL v12 = v10 >> 3 < -1;
    uint64_t v13 = (v10 >> 3) + 2;
    if (v12) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v11 + 1;
    }
    uint64_t v15 = -(v14 >> 1);
    uint64_t v16 = v14 >> 1;
    unint64_t v17 = &v7[-8 * v16];
    int64_t v18 = v6 - v7;
    if (v6 != v7)
    {
      memmove(&v7[-8 * v16], v7, v6 - v7);
      uint64_t v7 = (char *)a1[1];
    }
    uint64_t v6 = &v17[v18];
    a1[1] = &v7[8 * v15];
    a1[2] = &v17[v18];
    goto LABEL_41;
  }
  uint64_t v20 = (char *)a1[2];
  long long v19 = (char *)a1[3];
  long long v21 = (char *)*a1;
  long long v22 = (char *)a1[1];
  unint64_t v23 = (v20 - v22) >> 3;
  uint64_t v24 = (uint64_t)&v19[-*a1];
  if (v23 < v24 >> 3)
  {
    long long v25 = operator new(0xFC0uLL);
    long long v26 = v25;
    if (v19 != v20)
    {
      *(void *)uint64_t v20 = v25;
LABEL_42:
      a1[2] += 8;
      return;
    }
    if (v22 == v21)
    {
      if (v20 == v22) {
        unint64_t v49 = 1;
      }
      else {
        unint64_t v49 = (v19 - v22) >> 2;
      }
      uint64_t v50 = 2 * v49;
      uint64_t v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v49);
      long long v22 = &v51[(v50 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v53 = (uint64_t *)a1[1];
      uint64_t v54 = v22;
      uint64_t v55 = a1[2] - (void)v53;
      if (v55)
      {
        uint64_t v54 = &v22[v55 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v56 = 8 * (v55 >> 3);
        float32x4_t v57 = &v51[(v50 + 6) & 0xFFFFFFFFFFFFFFF8];
        do
        {
          uint64_t v58 = *v53++;
          *(void *)float32x4_t v57 = v58;
          v57 += 8;
          v56 -= 8;
        }
        while (v56);
      }
      float32x4_t v59 = (char *)*a1;
      *a1 = v51;
      a1[1] = v22;
      a1[2] = v54;
      a1[3] = &v51[8 * v52];
      if (v59)
      {
        operator delete(v59);
        long long v22 = (char *)a1[1];
      }
    }
    *((void *)v22 - 1) = v26;
    uint64_t v7 = (char *)a1[1];
    uint64_t v6 = (char *)a1[2];
    a1[1] = v7 - 8;
    uint64_t v8 = *((void *)v7 - 1);
    a1[1] = v7;
    if (v6 != (char *)a1[3])
    {
LABEL_41:
      *(void *)uint64_t v6 = v8;
      goto LABEL_42;
    }
    uint64_t v10 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v82 = 1;
      }
      else {
        unint64_t v82 = (uint64_t)&v6[-*a1] >> 2;
      }
      float32x4_t v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v82);
      float32x4_t v40 = &v39[8 * (v82 >> 2)];
      uint64_t v42 = &v39[8 * v83];
      id v84 = (uint64_t *)a1[1];
      uint64_t v6 = v40;
      uint64_t v85 = a1[2] - (void)v84;
      if (v85)
      {
        uint64_t v6 = &v40[v85 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v86 = 8 * (v85 >> 3);
        unint64_t v87 = &v39[8 * (v82 >> 2)];
        do
        {
          uint64_t v88 = *v84++;
          *(void *)unint64_t v87 = v88;
          v87 += 8;
          v86 -= 8;
        }
        while (v86);
      }
LABEL_29:
      float32x4_t v48 = (char *)*a1;
      *a1 = v39;
      a1[1] = v40;
      a1[2] = v6;
      a1[3] = v42;
      if (v48)
      {
        operator delete(v48);
        uint64_t v6 = (char *)a1[2];
      }
      goto LABEL_41;
    }
    goto LABEL_5;
  }
  uint64_t v27 = v24 >> 2;
  if (v19 == v21) {
    unint64_t v28 = 1;
  }
  else {
    unint64_t v28 = v27;
  }
  unint64_t v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v28);
  uint64_t v31 = v30;
  int v32 = operator new(0xFC0uLL);
  uint64_t v33 = &v29[8 * v23];
  long long v34 = &v29[8 * v31];
  if (v23 == v31)
  {
    uint64_t v35 = 8 * v23;
    if (v20 - v22 < 1)
    {
      uint64_t v60 = v35 >> 2;
      if (v20 == v22) {
        unint64_t v61 = 1;
      }
      else {
        unint64_t v61 = v60;
      }
      unint64_t v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v61);
      uint64_t v33 = &v62[8 * (v61 >> 2)];
      long long v34 = &v62[8 * v63];
      if (v29) {
        operator delete(v29);
      }
      unint64_t v29 = v62;
    }
    else
    {
      uint64_t v36 = v35 >> 3;
      if (v36 >= -1) {
        unint64_t v37 = v36 + 1;
      }
      else {
        unint64_t v37 = v36 + 2;
      }
      v33 -= 8 * (v37 >> 1);
    }
  }
  *(void *)uint64_t v33 = v32;
  uint8x8_t v64 = v33 + 8;
  for (uint64_t i = a1[2]; i != a1[1]; i -= 8)
  {
    if (v33 == v29)
    {
      if (v64 >= v34)
      {
        if (v34 == v29) {
          unint64_t v70 = 1;
        }
        else {
          unint64_t v70 = (v34 - v29) >> 2;
        }
        float v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<rf::data_flow::provider::InputData *>>(v70);
        unint64_t v73 = v71;
        uint64_t v33 = &v71[(2 * v70 + 6) & 0xFFFFFFFFFFFFFFF8];
        uint64_t v75 = v64 - v29;
        BOOL v74 = v64 == v29;
        uint8x8_t v64 = v33;
        if (!v74)
        {
          uint8x8_t v64 = &v33[v75 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v76 = 8 * (v75 >> 3);
          unint64_t v77 = v33;
          unint64_t v78 = (uint64_t *)v29;
          do
          {
            uint64_t v79 = *v78++;
            *(void *)unint64_t v77 = v79;
            v77 += 8;
            v76 -= 8;
          }
          while (v76);
        }
        long long v34 = &v71[8 * v72];
        if (v29) {
          operator delete(v29);
        }
        unint64_t v29 = v73;
      }
      else
      {
        uint64_t v66 = (v34 - v64) >> 3;
        if (v66 >= -1) {
          uint64_t v67 = v66 + 1;
        }
        else {
          uint64_t v67 = v66 + 2;
        }
        uint64_t v68 = v67 >> 1;
        uint64_t v33 = &v29[8 * (v67 >> 1)];
        unint64_t v69 = v29;
        if (v64 != v29)
        {
          memmove(v33, v29, v64 - v29);
          unint64_t v69 = v64;
        }
        uint8x8_t v64 = &v69[8 * v68];
      }
    }
    uint64_t v80 = *(void *)(i - 8);
    *((void *)v33 - 1) = v80;
    v33 -= 8;
  }
  unint64_t v81 = (char *)*a1;
  *a1 = v29;
  a1[1] = v33;
  a1[2] = v64;
  a1[3] = v34;
  if (v81)
  {
    operator delete(v81);
  }
}

void sub_235AF4398(_Unwind_Exception *a1)
{
  operator delete(v2);
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  unint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    unint64_t v2 = a2;
    do
    {
      BOOL v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,RESharedPtr<REEntity>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,RESharedPtr<REEntity>>,0>(uint64_t a1)
{
  RESharedPtr<REEntity>::~RESharedPtr((void *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    unint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,RESharedPtr<REEntity>>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,RESharedPtr<REEntity>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,RESharedPtr<REEntity>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void RFSyntheticARDataProviderCreate(void *a1)
{
  v2[5] = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2[0] = &unk_26E8F69A8;
  v2[1] = rf::data_flow::provider::SyntheticARData::sampleDataAllAtOnce;
  v2[3] = v2;
  v2[4] = 0;
  if (qword_26AB58C20 != -1) {
    dispatch_once(&qword_26AB58C20, &__block_literal_global_16);
  }
  _CFRuntimeCreateInstance();
  operator new();
}

void sub_235AF4788(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void RFSyntheticARDataProviderAddSourceAsset(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  unint64_t v6 = [MEMORY[0x263F08850] defaultManager];
  uint8x8_t v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 16);
    CFStringRef v10 = CFURLCopyFileSystemPath((CFURLRef)v5, kCFURLPOSIXPathStyle);
    CFStringRef v11 = v10;
    if (v10)
    {
      applesauce::CF::details::CFString_get_value<true>(v10, (uint64_t)v15);
      CFRelease(v11);
      if (v16 >= 0) {
        uint64_t v12 = (char *)v15;
      }
      else {
        uint64_t v12 = (char *)v15[0];
      }
      std::string::basic_string[abi:ne180100]<0>(__p, v12);
      rf::data_flow::provider::SyntheticARDataProvider::addData(v9 + 8, a2, (long long *)__p);
      if (v14 < 0) {
        operator delete(__p[0]);
      }
      if (v16 < 0) {
        operator delete(v15[0]);
      }
    }
  }
}

void sub_235AF48E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }

  _Unwind_Resume(a1);
}

void RFSyntheticARDataProviderSetAssetTransform(uint64_t a1, unint64_t a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6)
{
  uint64_t v6 = *(void *)(a1 + 16);
  v7[0] = (__int128)a3;
  v7[1] = (__int128)a4;
  v7[2] = (__int128)a5;
  v7[3] = (__int128)a6;
  rf::data_flow::provider::SyntheticARDataProvider::setDataTransform(v6 + 8, a2, v7);
}

void RFSyntheticARDataProviderRemoveSourceAsset(uint64_t a1, unint64_t a2)
{
}

void RFSyntheticARDataProviderReset(uint64_t a1)
{
}

void RFSyntheticARDataProviderSetFrameInputFromARSession(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 16);
  id v5 = (std::__shared_weak_count *)v4[13];
  uint64_t v9 = v4[12];
  CFStringRef v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v11 = v4[14];
  uint64_t v6 = (std::__shared_weak_count *)operator new(0x48uLL);
  v6->__shared_owners_ = 0;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E8F6A78;
  uint64_t v7 = rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider((uint64_t)&v6[1], v3, &v9);
  atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  int v8 = (std::__shared_weak_count *)v4[16];
  v4[15] = v7;
  v4[16] = v6;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void sub_235AF4A5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  std::__shared_weak_count::~__shared_weak_count(v12);
  operator delete(v14);
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }

  _Unwind_Resume(a1);
}

uint64_t RFSyntheticARDataProviderSetServiceLocator(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(result + 16) + 72) = a2;
  return result;
}

void RFSyntheticARDataProviderProvideProbes(uint64_t a1, unint64_t a2, const unsigned __int8 *a3)
{
}

void std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::~__func()
{
}

void *std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26E8F69A8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E8F69A8;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 8))(a2, a3, a4);
}

uint64_t std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &),std::allocator<void (*)(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>,void ()(rf::data_flow::provider::InputFrame const&,rf::data_flow::provider::SyntheticARData &,rf::data_flow::provider::InputData &)>::target_type()
{
}

void ___ZN2rf17ClassRegistrationINS_14CustomCFObjectINS_9data_flow8provider23SyntheticARDataProviderEEEE13registerClassEv_block_invoke()
{
  size_t v0 = 0;
  int v1 = 1;
  for (char i = 114; ; char i = aStdStringViewR_27[v0++ + 51])
  {
    if (i == 91)
    {
      int v3 = 1;
      goto LABEL_8;
    }
    if (i == 93) {
      break;
    }
    if (!i)
    {
      size_t v0 = 0;
      HIBYTE(v9) = 0;
      unint64_t v4 = __dst;
      goto LABEL_18;
    }
LABEL_9:
    ;
  }
  int v3 = -1;
LABEL_8:
  v1 += v3;
  if (v1) {
    goto LABEL_9;
  }
  if (v0 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v0 >= 0x17)
  {
    uint64_t v5 = (v0 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v0 | 7) != 0x17) {
      uint64_t v5 = v0 | 7;
    }
    uint64_t v6 = v5 + 1;
    unint64_t v4 = (void **)operator new(v5 + 1);
    __dst[1] = (void *)v0;
    int64_t v9 = v6 | 0x8000000000000000;
    __dst[0] = v4;
    goto LABEL_17;
  }
  HIBYTE(v9) = v0;
  unint64_t v4 = __dst;
  if (v0) {
LABEL_17:
  }
    memcpy(v4, "rf::data_flow::provider::SyntheticARDataProvider]", v0);
LABEL_18:
  *((unsigned char *)v4 + v0) = 0;
  xmmword_26AB58C28 = 0u;
  xmmword_26AB58C38 = 0u;
  xmmword_26AB58C48 = 0u;
  unk_26AB58C58 = 0u;
  xmmword_26AB58C68 = 0u;
  unk_26AB58C78 = 0u;
  uint64_t v7 = __dst;
  if (v9 < 0) {
    uint64_t v7 = (void **)__dst[0];
  }
  *((void *)&xmmword_26AB58C28 + 1) = v7;
  *(void *)&xmmword_26AB58C38 = rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::initCallback;
  *(void *)&xmmword_26AB58C48 = rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::finalizeCallback;
  qword_26AB58C60 = (uint64_t)rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyFormattingDescriptionCallback;
  *(void *)&xmmword_26AB58C68 = rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyDebugDescriptionCallback;
  _MergedGlobals_17 = _CFRuntimeRegisterClass();
  if (SHIBYTE(v9) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_235AF4D20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::initCallback(uint64_t result)
{
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t *rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::finalizeCallback(uint64_t a1)
{
  return std::unique_ptr<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject,std::default_delete<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject>>::reset[abi:ne180100]((uint64_t *)(a1 + 16), 0);
}

uint64_t rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyFormattingDescriptionCallback()
{
  return 0;
}

uint64_t rf::ClassRegistration<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>>::copyDebugDescriptionCallback()
{
  return 0;
}

uint64_t *std::unique_ptr<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject,std::default_delete<rf::CustomCFObject<rf::data_flow::provider::SyntheticARDataProvider>::BridgableObject>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    rf::data_flow::provider::SyntheticARDataProvider::~SyntheticARDataProvider((rf::data_flow::provider::SyntheticARDataProvider *)(v2 + 8));
    JUMPOUT(0x237DEE2B0);
  }
  return result;
}

void std::__shared_ptr_emplace<rf::data_flow::provider::ARSessionInputFrameProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E8F6A78;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<rf::data_flow::provider::ARSessionInputFrameProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E8F6A78;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x237DEE2B0);
}

void std::__shared_ptr_emplace<rf::data_flow::provider::ARSessionInputFrameProvider>::__on_zero_shared(uint64_t a1)
{
}

uint64_t rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(uint64_t a1, void *a2, uint64_t *a3)
{
  v10[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v7 = *a3;
  uint64_t v6 = a3[1];
  *(void *)a1 = &unk_26E8F5AC8;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 24) = a3[2];
  *(void *)a1 = &unk_26E8F6AC8;
  id v8 = v5;
  *(void *)(a1 + 32) = v8;
  v10[0] = &unk_26E8F6B00;
  v10[1] = a1;
  v10[3] = v10;
  *(void *)(a1 + 40) = [[ARSessionFrameObserver alloc] initWithCallback:v10];
  std::__function::__value_func<void ()(rf::data_flow::provider::InputFrame &&)>::~__value_func[abi:ne180100](v10);
  [*(id *)(a1 + 32) _addObserver:*(void *)(a1 + 40)];

  return a1;
}

void sub_235AF4F60(_Unwind_Exception *a1)
{
  *(void *)uint64_t v1 = v2;
  id v5 = *(std::__shared_weak_count **)(v1 + 16);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }

  _Unwind_Resume(a1);
}

void rf::data_flow::provider::ARSessionInputFrameProvider::~ARSessionInputFrameProvider(id *this)
{
  [this[4] _removeObserver:this[5]];
  id v2 = this[4];
  this[4] = 0;

  *this = &unk_26E8F5AC8;
  int v3 = (std::__shared_weak_count *)this[2];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  uint64_t vars8;

  rf::data_flow::provider::ARSessionInputFrameProvider::~ARSessionInputFrameProvider(this);
  JUMPOUT(0x237DEE2B0);
}

void std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::~__func()
{
}

void *std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26E8F6B00;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26E8F6B00;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::operator()(uint64_t a1, long long *a2)
{
  return rf::data_flow::provider::InputFrameProvider::provideData(*(void *)(a1 + 8), a2);
}

uint64_t std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0,std::allocator<rf::data_flow::provider::ARSessionInputFrameProvider::ARSessionInputFrameProvider(ARSession *,rf::data_flow::DataGraph::Evaluator<rf::data_flow::provider::InputFrame> const&)::$_0>,void ()(rf::data_flow::provider::InputFrame&&)>::target_type()
{
}

uint64_t *re::foundationCoreLogObjects(re *this)
{
  {
    re::foundationCoreLogObjects(void)::logObjects = (uint64_t)os_log_create("com.apple.re", "Foundation.Core");
  }
  return &re::foundationCoreLogObjects(void)::logObjects;
}

BOOL re::internal::enableSignposts(re::internal *this, uint64_t a2)
{
  {
    unsigned int v6 = a2;
    char v7 = (char)this;
    a2 = v6;
    LOBYTE(this) = v7;
    if (v3)
    {
      re::Defaults::intValue((re::Defaults *)"enableSignposts", (const char *)v6, (uint64_t)v8);
      if (v8[0]) {
        BOOL v4 = v9 == 0;
      }
      else {
        BOOL v4 = 0;
      }
      char v5 = !v4;
      re::internal::enableSignposts(BOOL,BOOL)::value = v5;
      a2 = v6;
      LOBYTE(this) = v7;
    }
  }
  if ((this & 1) == 0) {
    return re::internal::enableSignposts(BOOL,BOOL)::value != 0;
  }
  re::internal::enableSignposts(BOOL,BOOL)::value = a2;
  return a2;
}

void re::Defaults::intValue(re::Defaults *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  BOOL v4 = ;
  if (v4)
  {
    unsigned int v6 = v4;
    *(_DWORD *)(a3 + 4) = [v4 intValue];
    BOOL v4 = v6;
    char v5 = 1;
  }
  else
  {
    char v5 = 0;
  }
  *(unsigned char *)a3 = v5;
}

id anonymous namespace'::getValue(_anonymous_namespace_ *this, const char *a2)
{
  int v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s.%s", "com.apple.re", this);
  char v5 = [v3 objectForKey:v4];
  if (!v5)
  {
    unsigned int v6 = [NSString stringWithUTF8String:this];
    char v7 = [v3 objectForKey:v6];
    if (v7)
    {
      char v5 = v7;
      id v8 = v6;
    }
    else
    {
      uint64_t v9 = [v4 rangeOfString:@"." options:4];
      CFStringRef v10 = [v4 substringToIndex:v9];
      id v8 = [v4 substringFromIndex:v9 + 1];

      if ([(__CFString *)v10 isEqualToString:@"com.apple.re.network.multipeerservice"])
      {

        CFStringRef v10 = @"com.apple.renetwork.multipeerservice";
      }
      uint64_t v11 = [v3 dictionaryForKey:v10];
      char v5 = [v11 objectForKey:v8];

      if (!v5) {
        goto LABEL_9;
      }
    }
    uint64_t v12 = *re::foundationCoreLogObjects(v7);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)simd_float4x4 buf = 0;
    }
LABEL_9:
  }
  return v5;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53E8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

uint64_t REAABBInit()
{
  return MEMORY[0x270F1BC88]();
}

uint64_t REAREnvironmentProbeComponentGetComponentType()
{
  return MEMORY[0x270F1BCB0]();
}

uint64_t REAREnvironmentProbeComponentSetClippingPointLux()
{
  return MEMORY[0x270F1BCD0]();
}

uint64_t REAREnvironmentProbeComponentSetExtents()
{
  return MEMORY[0x270F1BCD8]();
}

uint64_t REAREnvironmentProbeComponentSetIdentifier()
{
  return MEMORY[0x270F1BCE0]();
}

uint64_t REAREnvironmentProbeComponentSetTexture()
{
  return MEMORY[0x270F1BCE8]();
}

uint64_t REAREnvironmentProbeComponentSetUseAsBackground()
{
  return MEMORY[0x270F1BCF0]();
}

uint64_t REAcousticMeshComponentGetARMesh()
{
  return MEMORY[0x270F1BEC0]();
}

uint64_t REAcousticMeshComponentGetComponentType()
{
  return MEMORY[0x270F1BEC8]();
}

uint64_t REAcousticMeshComponentSetARMesh()
{
  return MEMORY[0x270F1BED8]();
}

uint64_t REAcousticMeshComponentSetLastUpdateTimestamp()
{
  return MEMORY[0x270F1BEE0]();
}

uint64_t REAnchorComponentGetAnchorIdentifier()
{
  return MEMORY[0x270F1BF48]();
}

uint64_t REAnchorComponentGetAnchoredLocally()
{
  return MEMORY[0x270F1BF50]();
}

uint64_t REAnchorComponentGetComponentType()
{
  return MEMORY[0x270F1BF58]();
}

uint64_t REAnchorComponentGetIsAnchorExternal()
{
  return MEMORY[0x270F1BF60]();
}

uint64_t REAnchorComponentGetRequiresLocalAnchoring()
{
  return MEMORY[0x270F1BF68]();
}

uint64_t REAnchorComponentGetSendIsAnchoredToClient()
{
  return MEMORY[0x270F1BF70]();
}

uint64_t REAnchorComponentGetWorldTransform()
{
  return MEMORY[0x270F1BF78]();
}

uint64_t REAnchorComponentSetAnchorIdentifier()
{
  return MEMORY[0x270F1BF80]();
}

uint64_t REAnchorComponentSetAnchoredLocally()
{
  return MEMORY[0x270F1BF88]();
}

uint64_t REAnchorComponentSetEnableShadows()
{
  return MEMORY[0x270F1BF90]();
}

uint64_t REAnchorComponentSetIsAnchorExternal()
{
  return MEMORY[0x270F1BF98]();
}

uint64_t REAnchorComponentSetRequiresLocalAnchoring()
{
  return MEMORY[0x270F1BFA8]();
}

uint64_t REAnchorComponentSetSendIsAnchoredToClient()
{
  return MEMORY[0x270F1BFB0]();
}

uint64_t REAnchorComponentSetWorldTransform()
{
  return MEMORY[0x270F1BFB8]();
}

uint64_t REAnchorShadowMarkerComponentGetComponentType()
{
  return MEMORY[0x270F1BFC0]();
}

uint64_t REAnchorShadowMarkerSetFloorPlane()
{
  return MEMORY[0x270F1BFC8]();
}

uint64_t REAnchorShadowMarkerSetPlaneExists()
{
  return MEMORY[0x270F1BFD0]();
}

uint64_t REAnchorShadowMarkerSetPointAndNormal()
{
  return MEMORY[0x270F1BFD8]();
}

uint64_t REAnchoringComponentGetComponentType()
{
  return MEMORY[0x270F1BFE0]();
}

uint64_t REAnchoringComponentGetCoordinateSpaceOfDescriptorTransform()
{
  return MEMORY[0x270F1BFE8]();
}

uint64_t REAnchoringComponentGetDescriptorAlignment()
{
  return MEMORY[0x270F1BFF0]();
}

uint64_t REAnchoringComponentGetDescriptorAnchorIdentifier()
{
  return MEMORY[0x270F1BFF8]();
}

uint64_t REAnchoringComponentGetDescriptorBounds()
{
  return MEMORY[0x270F1C000]();
}

uint64_t REAnchoringComponentGetDescriptorCachedAnchorIdentifier()
{
  return MEMORY[0x270F1C008]();
}

uint64_t REAnchoringComponentGetDescriptorClassification()
{
  return MEMORY[0x270F1C010]();
}

uint64_t REAnchoringComponentGetDescriptorResourceGroup()
{
  return MEMORY[0x270F1C020]();
}

uint64_t REAnchoringComponentGetDescriptorResourceName()
{
  return MEMORY[0x270F1C028]();
}

uint64_t REAnchoringComponentGetDescriptorResourceStyle()
{
  return MEMORY[0x270F1C030]();
}

uint64_t REAnchoringComponentGetDescriptorTransform()
{
  return MEMORY[0x270F1C038]();
}

uint64_t REAnchoringComponentGetDescriptorType()
{
  return MEMORY[0x270F1C040]();
}

uint64_t REAnchoringComponentGetIsDescriptorWorldTransformDirty()
{
  return MEMORY[0x270F1C048]();
}

uint64_t REAnchoringComponentGetMode()
{
  return MEMORY[0x270F1C050]();
}

uint64_t REAnchoringComponentGetPreviousWorldTransform()
{
  return MEMORY[0x270F1C058]();
}

uint64_t REAnchoringComponentGetScaleFactor()
{
  return MEMORY[0x270F1C060]();
}

uint64_t REAnchoringComponentGetTrackingImageMTLTexture()
{
  return MEMORY[0x270F1C070]();
}

uint64_t REAnchoringComponentGetTrackingImageWidth()
{
  return MEMORY[0x270F1C078]();
}

uint64_t REAnchoringComponentGetWorldScaleOfDescriptorTransform()
{
  return MEMORY[0x270F1C080]();
}

uint64_t REAnchoringComponentGetWorldTransformOfDescriptorTransform()
{
  return MEMORY[0x270F1C088]();
}

uint64_t REAnchoringComponentInitializeWorldTransformIfNeeded()
{
  return MEMORY[0x270F1C090]();
}

uint64_t REAnchoringComponentSetDescriptorCachedAnchorIdentifier()
{
  return MEMORY[0x270F1C0B8]();
}

uint64_t REAnchoringComponentSetDescriptorTransform()
{
  return MEMORY[0x270F1C0E8]();
}

uint64_t REAnchoringComponentUpdateCoordinateSpaceOfDescriptorTransform()
{
  return MEMORY[0x270F1C120]();
}

uint64_t REAssetGetAssetManager()
{
  return MEMORY[0x270F1C3C8]();
}

uint64_t REAssetHandleCopyAssetIdentifierString()
{
  return MEMORY[0x270F1C400]();
}

uint64_t REAssetHandleIsLoaded()
{
  return MEMORY[0x270F1C438]();
}

uint64_t REAssetHandleLoadAsync()
{
  return MEMORY[0x270F1C440]();
}

uint64_t REAssetHandleLoadNow()
{
  return MEMORY[0x270F1C450]();
}

uint64_t REAssetManagerCollisionMeshAssetCreateFromMesh()
{
  return MEMORY[0x270F1C4F8]();
}

uint64_t REAssetManagerCollisionShapeAssetCreateCollisionMesh()
{
  return MEMORY[0x270F1C510]();
}

uint64_t REAssetManagerCreateAssetHandle()
{
  return MEMORY[0x270F1C560]();
}

uint64_t REAssetManagerGetEngineQueue()
{
  return MEMORY[0x270F1C5A0]();
}

uint64_t REAssetManagerMaterialMemoryAssetCreate()
{
  return MEMORY[0x270F1C5E8]();
}

uint64_t REAssetManagerMeshAssetCreateFromModelsWithOptionsAsyncWithError()
{
  return MEMORY[0x270F1C610]();
}

uint64_t REAssetManagerTextureMemoryAssetCreateWithMTLTexture()
{
  return MEMORY[0x270F1C6A8]();
}

uint64_t REAssetServiceMeshAssetCreateMutable()
{
  return MEMORY[0x270F1C738]();
}

uint64_t RECIntrospectionEnumRegister()
{
  return MEMORY[0x270F1CEC0]();
}

uint64_t RECIntrospectionEnumUnregister()
{
  return MEMORY[0x270F1CEC8]();
}

uint64_t RECIntrospectionStructRegister()
{
  return MEMORY[0x270F1CED8]();
}

uint64_t RECIntrospectionStructUnregister()
{
  return MEMORY[0x270F1CEE0]();
}

uint64_t RECameraViewDescriptorsComponentGetComponentType()
{
  return MEMORY[0x270F1CF28]();
}

uint64_t RECameraViewDescriptorsComponentGetRenderOrder()
{
  return MEMORY[0x270F1CF30]();
}

uint64_t REClientAnchorSyncComponentGetAnchorTransform()
{
  return MEMORY[0x270F1D070]();
}

uint64_t REClientAnchorSyncComponentGetComponentType()
{
  return MEMORY[0x270F1D078]();
}

uint64_t REClientAnchorSyncComponentIsAnchored()
{
  return MEMORY[0x270F1D080]();
}

uint64_t REClientAnchorSyncComponentIsExternal()
{
  return MEMORY[0x270F1D088]();
}

uint64_t REClientAnchorSyncComponentSetAnchorTransform()
{
  return MEMORY[0x270F1D090]();
}

uint64_t REClientAnchorSyncComponentSetIsAnchored()
{
  return MEMORY[0x270F1D098]();
}

uint64_t REClientAnchorSyncComponentSetIsExternal()
{
  return MEMORY[0x270F1D0A0]();
}

uint64_t REColliderComponentGetComponentType()
{
  return MEMORY[0x270F1D110]();
}

uint64_t REColliderComponentGetShape()
{
  return MEMORY[0x270F1D130]();
}

uint64_t REColliderComponentSetGroup()
{
  return MEMORY[0x270F1D138]();
}

uint64_t REColliderComponentSetShape()
{
  return MEMORY[0x270F1D150]();
}

uint64_t RECollisionMeshCreateWithFormat()
{
  return MEMORY[0x270F1D1F8]();
}

uint64_t RECollisionMeshDestroy()
{
  return MEMORY[0x270F1D208]();
}

uint64_t RECollisionShapeAssetGetCollisionShape()
{
  return MEMORY[0x270F1D268]();
}

uint64_t RECollisionShapeGetBoundingBox()
{
  return MEMORY[0x270F1D280]();
}

uint64_t REColorManagerSetAverageAREnvLightIntensity()
{
  return MEMORY[0x270F1D2A0]();
}

uint64_t REComponentClassFromType()
{
  return MEMORY[0x270F1D2B0]();
}

uint64_t REComponentCreateByClass()
{
  return MEMORY[0x270F1D2D0]();
}

uint64_t REComponentGetEntity()
{
  return MEMORY[0x270F1D2F0]();
}

uint64_t REComposeMatrix()
{
  return MEMORY[0x270F1D320]();
}

uint64_t RECoordinateSpaceDefinitionComponentGetComponentType()
{
  return MEMORY[0x270F1D410]();
}

uint64_t RECustomComponentGetObject()
{
  return MEMORY[0x270F1D4D8]();
}

uint64_t RECustomComponentGetType()
{
  return MEMORY[0x270F1D4E0]();
}

uint64_t RECustomComponentTypeCreate()
{
  return MEMORY[0x270F1D4E8]();
}

uint64_t RECustomComponentTypeDestroy()
{
  return MEMORY[0x270F1D4F8]();
}

uint64_t RECustomComponentTypeGetContext()
{
  return MEMORY[0x270F1D500]();
}

uint64_t RECustomMatrixCameraComponentGetComponentType()
{
  return MEMORY[0x270F1D528]();
}

uint64_t REDebugRendererDrawTextAtWorldTransform()
{
  return MEMORY[0x270F1D5F0]();
}

uint64_t REECSManagerAddCustomSystem()
{
  return MEMORY[0x270F1D830]();
}

uint64_t REECSManagerGetScene()
{
  return MEMORY[0x270F1D858]();
}

uint64_t REECSManagerGetServiceLocator()
{
  return MEMORY[0x270F1D860]();
}

uint64_t REECSManagerRemoveCustomSystem()
{
  return MEMORY[0x270F1D868]();
}

uint64_t REECSManagerSceneCount()
{
  return MEMORY[0x270F1D878]();
}

uint64_t REEngineGetEventBus()
{
  return MEMORY[0x270F1DAA8]();
}

uint64_t REEntityAddComponentByClass()
{
  return MEMORY[0x270F1DB68]();
}

uint64_t REEntityAddExistingComponent()
{
  return MEMORY[0x270F1DB80]();
}

uint64_t REEntityCalculateWorldMatrix4x4F()
{
  return MEMORY[0x270F1DB90]();
}

uint64_t REEntityComputeMeshBounds()
{
  return MEMORY[0x270F1DBB8]();
}

uint64_t REEntityCreate()
{
  return MEMORY[0x270F1DBD0]();
}

uint64_t REEntityGetChild()
{
  return MEMORY[0x270F1DBE8]();
}

uint64_t REEntityGetChildCount()
{
  return MEMORY[0x270F1DBF0]();
}

uint64_t REEntityGetComponent()
{
  return MEMORY[0x270F1DC00]();
}

uint64_t REEntityGetComponentByClass()
{
  return MEMORY[0x270F1DC10]();
}

uint64_t REEntityGetCustomComponent()
{
  return MEMORY[0x270F1DC20]();
}

uint64_t REEntityGetLocalId()
{
  return MEMORY[0x270F1DC28]();
}

uint64_t REEntityGetName()
{
  return MEMORY[0x270F1DC30]();
}

uint64_t REEntityGetOrAddComponent()
{
  return MEMORY[0x270F1DC38]();
}

uint64_t REEntityGetOrAddComponentByClass()
{
  return MEMORY[0x270F1DC40]();
}

uint64_t REEntityGetParent()
{
  return MEMORY[0x270F1DC50]();
}

uint64_t REEntityGetSceneNullable()
{
  return MEMORY[0x270F1DC60]();
}

uint64_t REEntityGetSelfEnabled()
{
  return MEMORY[0x270F1DC68]();
}

uint64_t REEntityIsActive()
{
  return MEMORY[0x270F1DC88]();
}

uint64_t REEntityIsAnchored()
{
  return MEMORY[0x270F1DC90]();
}

uint64_t REEntityIsEnabledInHierarchy()
{
  return MEMORY[0x270F1DCA0]();
}

uint64_t REEntityRemoveComponentByClass()
{
  return MEMORY[0x270F1DCC8]();
}

uint64_t REEntityRemoveCustomComponent()
{
  return MEMORY[0x270F1DCD0]();
}

uint64_t REEntityRemoveFromSceneOrParent()
{
  return MEMORY[0x270F1DCD8]();
}

uint64_t REEntitySetName()
{
  return MEMORY[0x270F1DCE8]();
}

uint64_t REEntitySetParent()
{
  return MEMORY[0x270F1DCF0]();
}

uint64_t REEntitySetSelfEnabled()
{
  return MEMORY[0x270F1DCF8]();
}

uint64_t REEntitySubtreeLoadFromAsset()
{
  return MEMORY[0x270F1DD08]();
}

uint64_t REEnumBuilderAddCase()
{
  return MEMORY[0x270F1DD38]();
}

uint64_t REEnumBuilderCreate()
{
  return MEMORY[0x270F1DD40]();
}

uint64_t REEnumBuilderDestroy()
{
  return MEMORY[0x270F1DD48]();
}

uint64_t REEnumBuilderInit()
{
  return MEMORY[0x270F1DD50]();
}

uint64_t REEventBusMakeID()
{
  return MEMORY[0x270F1DD70]();
}

uint64_t REEventBusSubscribeBlock()
{
  return MEMORY[0x270F1DD80]();
}

uint64_t REEventBusUnsubscribe()
{
  return MEMORY[0x270F1DD90]();
}

uint64_t REGeomModelDescriptorAddAttributeVector3F()
{
  return MEMORY[0x270F1DFD0]();
}

uint64_t REGeomModelDescriptorAddAttributeVector4F()
{
  return MEMORY[0x270F1DFD8]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeUInt32()
{
  return MEMORY[0x270F1E010]();
}

uint64_t REGeomModelDescriptorAddIndexedAttributeVector3F()
{
  return MEMORY[0x270F1E028]();
}

uint64_t REGeomModelDescriptorCreate()
{
  return MEMORY[0x270F1E048]();
}

uint64_t REHideEntity()
{
  return MEMORY[0x270F1E180]();
}

uint64_t REIsEntityHidden()
{
  return MEMORY[0x270F1E400]();
}

uint64_t REMakeSRTFromMatrix()
{
  return MEMORY[0x270F1E4D8]();
}

uint64_t REMaterialAssetGetTextureAsset()
{
  return MEMORY[0x270F1E6D0]();
}

uint64_t REMaterialParameterBlockArrayComponentGetBlockAtIndex()
{
  return MEMORY[0x270F1E840]();
}

uint64_t REMaterialParameterBlockArrayComponentGetComponentType()
{
  return MEMORY[0x270F1E850]();
}

uint64_t REMaterialParameterBlockArrayComponentSetBlockAtIndex()
{
  return MEMORY[0x270F1E878]();
}

uint64_t REMaterialParameterBlockSetBool()
{
  return MEMORY[0x270F1E8A8]();
}

uint64_t REMaterialParameterBlockSetTextureFromAsset()
{
  return MEMORY[0x270F1E8D0]();
}

uint64_t REMeshAssetReplaceAllWithModel()
{
  return MEMORY[0x270F1ECF8]();
}

uint64_t REMeshAttributesDescriptorCreate()
{
  return MEMORY[0x270F1ED98]();
}

uint64_t REMeshComponentAddMaterial()
{
  return MEMORY[0x270F1EE30]();
}

uint64_t REMeshComponentGetComponentType()
{
  return MEMORY[0x270F1EE50]();
}

uint64_t REMeshComponentGetMaterialAtIndex()
{
  return MEMORY[0x270F1EE58]();
}

uint64_t REMeshComponentGetMaterialCount()
{
  return MEMORY[0x270F1EE60]();
}

uint64_t REMeshComponentGetMesh()
{
  return MEMORY[0x270F1EE70]();
}

uint64_t REMeshComponentRemoveAllMaterials()
{
  return MEMORY[0x270F1EE78]();
}

uint64_t REMeshComponentSetMaterialAtIndex()
{
  return MEMORY[0x270F1EE88]();
}

uint64_t REMeshComponentSetMesh()
{
  return MEMORY[0x270F1EE98]();
}

uint64_t REMeshDefinitionCreateWithAttributes()
{
  return MEMORY[0x270F1EEA0]();
}

uint64_t REMeshDefinitionSetAttributeWithData()
{
  return MEMORY[0x270F1EEA8]();
}

uint64_t REMeshDefinitionSetIndicesWithData()
{
  return MEMORY[0x270F1EEC8]();
}

uint64_t REMeshModelDefinitionAppendTriangles()
{
  return MEMORY[0x270F1EF00]();
}

uint64_t REMeshModelDefinitionCreate()
{
  return MEMORY[0x270F1EF18]();
}

uint64_t RENetworkComponentDisableSyncForComponent()
{
  return MEMORY[0x270F1EFD8]();
}

uint64_t RENetworkComponentGetComponentType()
{
  return MEMORY[0x270F1EFE0]();
}

uint64_t RENetworkComponentIsAuthoritative()
{
  return MEMORY[0x270F1EFF0]();
}

uint64_t RENetworkComponentOwnerPeerID()
{
  return MEMORY[0x270F1F008]();
}

uint64_t RENetworkMarkComponentDirty()
{
  return MEMORY[0x270F1F038]();
}

uint64_t RENetworkMarkEntityMetadataDirty()
{
  return MEMORY[0x270F1F040]();
}

uint64_t REPerspectiveCameraComponentGetComponentType()
{
  return MEMORY[0x270F1F178]();
}

uint64_t REPrimitiveRenderAddContext()
{
  return MEMORY[0x270F1F4F0]();
}

uint64_t REPrimitiveRenderAddLine()
{
  return MEMORY[0x270F1F4F8]();
}

uint64_t REPrimitiveRenderAddShape()
{
  return MEMORY[0x270F1F500]();
}

uint64_t REPrimitiveRenderAddStaticMesh()
{
  return MEMORY[0x270F1F508]();
}

uint64_t REPrimitiveRenderSetLineColor()
{
  return MEMORY[0x270F1F510]();
}

uint64_t REPrimitiveRenderSetLineWidth()
{
  return MEMORY[0x270F1F518]();
}

uint64_t REPrimitiveRenderSetMeshMaterial()
{
  return MEMORY[0x270F1F520]();
}

uint64_t REPrimitiveRenderSetMeshMaterialTechniqueMapping()
{
  return MEMORY[0x270F1F528]();
}

uint64_t REPrimitiveRenderSetShapeColor()
{
  return MEMORY[0x270F1F530]();
}

uint64_t REPrimitiveRenderSetShapeMaterial()
{
  return MEMORY[0x270F1F538]();
}

uint64_t REPrimitiveRenderSetShapeScale()
{
  return MEMORY[0x270F1F540]();
}

uint64_t REPrimitiveRenderStaticMeshAddStandardAttribute()
{
  return MEMORY[0x270F1F548]();
}

uint64_t REPrimitiveRenderStaticMeshAddUniformCustomAttributeFloat()
{
  return MEMORY[0x270F1F550]();
}

uint64_t REPrimitiveRenderStaticMeshAddUniformCustomAttributeFloat3()
{
  return MEMORY[0x270F1F558]();
}

uint64_t REPrimitiveRenderStaticMeshAddUniformCustomAttributeFloat4()
{
  return MEMORY[0x270F1F560]();
}

uint64_t REPrimitiveRenderStaticMeshSetIndexCount()
{
  return MEMORY[0x270F1F570]();
}

uint64_t REPrimitiveRenderStaticMeshSetVertexCount()
{
  return MEMORY[0x270F1F578]();
}

uint64_t REProbeClusterExclusionComponentGetComponentType()
{
  return MEMORY[0x270F1F580]();
}

uint64_t RERelease()
{
  return MEMORY[0x270F1F850]();
}

uint64_t RERenderManagerGetEnableProbeLightingLegacyBlur()
{
  return MEMORY[0x270F1F9B0]();
}

uint64_t RERenderManagerGetProbeManager()
{
  return MEMORY[0x270F1F9C0]();
}

uint64_t RERenderManagerIsBeingUpdated()
{
  return MEMORY[0x270F1F9D8]();
}

uint64_t RERenderManagerMaterialParameterBlockCreateWithAsset()
{
  return MEMORY[0x270F1F9E0]();
}

uint64_t RERenderManagerSetEnableProbeExposureAdjustment()
{
  return MEMORY[0x270F1F9F0]();
}

uint64_t RERenderManagerSetEnableProbeLightingLegacyBlur()
{
  return MEMORY[0x270F1F9F8]();
}

uint64_t RERenderManagerSetProbeClampCeil()
{
  return MEMORY[0x270F1FA08]();
}

uint64_t RERenderManagerSetProbeClampFloor()
{
  return MEMORY[0x270F1FA10]();
}

uint64_t RERenderManagerSetProbeIntensityExpSmoothFactor()
{
  return MEMORY[0x270F1FA18]();
}

uint64_t RERenderManagerSetProbeIntensityScale()
{
  return MEMORY[0x270F1FA20]();
}

uint64_t RERetain()
{
  return MEMORY[0x270F1FA58]();
}

uint64_t RERigidBodyComponentGetComponentType()
{
  return MEMORY[0x270F1FAE0]();
}

uint64_t RERigidBodyComponentSetMotionType()
{
  return MEMORY[0x270F1FBC0]();
}

uint64_t RESRTMatrix()
{
  return MEMORY[0x270F1FC08]();
}

uint64_t RESceneAddEntity()
{
  return MEMORY[0x270F1FC28]();
}

uint64_t RESceneAddRenderGraphFileProviderArray()
{
  return MEMORY[0x270F1FC30]();
}

uint64_t RESceneGetComponentsOfClass()
{
  return MEMORY[0x270F1FCB8]();
}

uint64_t RESceneGetComponentsOfCustomType()
{
  return MEMORY[0x270F1FCC0]();
}

uint64_t RESceneGetECSManagerNullable()
{
  return MEMORY[0x270F1FCD0]();
}

uint64_t RESceneGetEntitiesArray()
{
  return MEMORY[0x270F1FCD8]();
}

uint64_t RESceneGetEventBus()
{
  return MEMORY[0x270F1FCE8]();
}

uint64_t RESceneGetUniqueName()
{
  return MEMORY[0x270F1FD08]();
}

uint64_t RESceneImportOperationCreateWithURL()
{
  return MEMORY[0x270F1FD38]();
}

uint64_t RESceneImportOperationGetSceneAsset()
{
  return MEMORY[0x270F1FD40]();
}

uint64_t RESceneImportOperationPublishToEngine()
{
  return MEMORY[0x270F1FD68]();
}

uint64_t RESceneImportOperationSetCompressTextures()
{
  return MEMORY[0x270F1FD78]();
}

uint64_t RESceneImportOperationSetIsolateFromEngine()
{
  return MEMORY[0x270F1FD88]();
}

uint64_t RESceneImportOperationSetUnitType()
{
  return MEMORY[0x270F1FDA8]();
}

uint64_t RESceneRemoveEntity()
{
  return MEMORY[0x270F1FDD0]();
}

uint64_t RESceneRenderGraphFileProviderArrayAdd()
{
  return MEMORY[0x270F1FDD8]();
}

uint64_t RESceneRenderGraphFileProviderArrayRemove()
{
  return MEMORY[0x270F1FDE0]();
}

uint64_t RESceneUnderstandingComponentGetComponentType()
{
  return MEMORY[0x270F1FE28]();
}

uint64_t RESceneUnderstandingComponentGetIdentifierPtr()
{
  return MEMORY[0x270F1FE30]();
}

uint64_t RESceneUnderstandingComponentGetSourceType()
{
  return MEMORY[0x270F1FE38]();
}

uint64_t RESceneUnderstandingComponentIsEntityType()
{
  return MEMORY[0x270F1FE40]();
}

uint64_t RESceneUnderstandingComponentSetEntityType()
{
  return MEMORY[0x270F1FE48]();
}

uint64_t RESceneUnderstandingComponentSetIdentifier()
{
  return MEMORY[0x270F1FE50]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentGetComponentType()
{
  return MEMORY[0x270F1FE58]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentIsShadowEnabled()
{
  return MEMORY[0x270F1FE60]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetDepthFeatheringEnabled()
{
  return MEMORY[0x270F1FE68]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetOcclusionEnabled()
{
  return MEMORY[0x270F1FE70]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetPhysicsEnabled()
{
  return MEMORY[0x270F1FE78]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetShadowEnabled()
{
  return MEMORY[0x270F1FE80]();
}

uint64_t RESceneUnderstandingRenderOptionsComponentSetWireframeEnabled()
{
  return MEMORY[0x270F1FE88]();
}

uint64_t RESceneUnderstandingRootComponentGetComponentType()
{
  return MEMORY[0x270F1FE90]();
}

uint64_t RESceneUnderstandingRootComponentSetUpdateId()
{
  return MEMORY[0x270F1FE98]();
}

uint64_t REServiceLocatorGetAssetManager()
{
  return MEMORY[0x270F1FED0]();
}

uint64_t REServiceLocatorGetColorManager()
{
  return MEMORY[0x270F1FEE8]();
}

uint64_t REServiceLocatorGetECSService()
{
  return MEMORY[0x270F1FEF8]();
}

uint64_t REServiceLocatorGetEngine()
{
  return MEMORY[0x270F1FF00]();
}

uint64_t REServiceLocatorGetRenderManager()
{
  return MEMORY[0x270F1FF38]();
}

uint64_t REServiceLocatorGetSceneUnderstandingService()
{
  return MEMORY[0x270F1FF48]();
}

uint64_t REServiceLocatorGetShadowService()
{
  return MEMORY[0x270F1FF50]();
}

uint64_t REShadowClusterRootComponentGetClusterBound()
{
  return MEMORY[0x270F1FF78]();
}

uint64_t REShadowManagerClearShadowClusterRootUpdateHandler()
{
  return MEMORY[0x270F1FF80]();
}

uint64_t REShadowManagerGetShadowEnabled()
{
  return MEMORY[0x270F1FF88]();
}

uint64_t REShadowManagerGetShadowPatchFlatteningEnabled()
{
  return MEMORY[0x270F1FF90]();
}

uint64_t REShadowManagerSetShadowClusterRootUpdateHandler()
{
  return MEMORY[0x270F1FF98]();
}

uint64_t REStructBuilderAddMemberCStyleArrayDataTypeWithTag()
{
  return MEMORY[0x270F20580]();
}

uint64_t REStructBuilderAddMemberDataTypeWithTag()
{
  return MEMORY[0x270F20588]();
}

uint64_t REStructBuilderAddMemberEnumWithTag()
{
  return MEMORY[0x270F20590]();
}

uint64_t REStructBuilderCreate()
{
  return MEMORY[0x270F20598]();
}

uint64_t REStructBuilderInit()
{
  return MEMORY[0x270F205A8]();
}

uint64_t RESubsceneComponentGetComponentType()
{
  return MEMORY[0x270F205B0]();
}

uint64_t RETextureAssetCopyToDestination()
{
  return MEMORY[0x270F20618]();
}

uint64_t RETextureImportOperationCopyTextureDescriptor()
{
  return MEMORY[0x270F20740]();
}

uint64_t RETextureImportOperationCreateAsset()
{
  return MEMORY[0x270F20750]();
}

uint64_t RETextureImportOperationCreateWithData()
{
  return MEMORY[0x270F20778]();
}

uint64_t RETextureImportOperationSetMipmapMode()
{
  return MEMORY[0x270F207D0]();
}

uint64_t RETransformComponentGetComponentType()
{
  return MEMORY[0x270F20F50]();
}

uint64_t RETransformComponentGetLocalSRT()
{
  return MEMORY[0x270F20F60]();
}

uint64_t RETransformComponentGetWorldMatrix4x4F()
{
  return MEMORY[0x270F20F80]();
}

uint64_t RETransformComponentGetWorldPose()
{
  return MEMORY[0x270F20F90]();
}

uint64_t RETransformComponentGetWorldPosition()
{
  return MEMORY[0x270F20F98]();
}

uint64_t RETransformComponentSetLocalSRT()
{
  return MEMORY[0x270F20FC0]();
}

uint64_t RETransformComponentSetWorldMatrix4x4F()
{
  return MEMORY[0x270F20FE0]();
}

uint64_t RETransformComponentSetWorldSRT()
{
  return MEMORY[0x270F20FF0]();
}

uint64_t REVFXSceneComponentAddCollisionPlane()
{
  return MEMORY[0x270F216F0]();
}

uint64_t REVFXSceneComponentGetComponentType()
{
  return MEMORY[0x270F21700]();
}

uint64_t REVFXSceneComponentNeedCollisionPlanes()
{
  return MEMORY[0x270F217B0]();
}

uint64_t REVFXSceneComponentRemoveCollisionPlane()
{
  return MEMORY[0x270F217B8]();
}

uint64_t REVFXSceneComponentUpdateCollisionPlane()
{
  return MEMORY[0x270F218A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98290](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__stem(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F982C8](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

void std::string::~string(std::string *this)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  return (std::bad_cast *)MEMORY[0x270F98E48](this);
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x270F98EE8](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x270F98F30](lpsrc, lpstype, lpdtype, s2d);
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x270ED9F48]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int raise(int a1)
{
  return MEMORY[0x270EDB0D0](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate(uuid_t out)
{
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}