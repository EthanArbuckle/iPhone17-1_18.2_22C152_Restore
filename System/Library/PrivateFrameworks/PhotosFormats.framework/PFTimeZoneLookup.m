@interface PFTimeZoneLookup
- (BOOL)indexSupported;
- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4;
- (BOOL)loadOrCreateIndex;
- (CLLocationCoordinate2D)anyCoordinateForTimeZoneName:(id)a3;
- (char)magic;
- (const)indexLabel;
- (id).cxx_construct;
- (id)indexName;
- (id)timeZoneNameForCoordinate:(CLLocationCoordinate2D)a3;
- (unint64_t)indexFileVersion;
- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3;
@end

@implementation PFTimeZoneLookup

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (BOOL)indexSupported
{
  return 1;
}

- (BOOL)loadOrCreateIndex
{
  v4.receiver = self;
  v4.super_class = (Class)PFTimeZoneLookup;
  [(PFCachingArchiveIndex *)&v4 loadOrCreateIndex];
  return self->_rtree != 0;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (char)magic
{
  if (!a1) {
    return 0;
  }
  v1 = -[PFTimeZoneLookup magic]::buffer;
  snprintf(-[PFTimeZoneLookup magic]::buffer, 0x50uLL, "%s%s%02x%08x", "PFTimeZone", "01", 4, [a1 architectureHash]);
  return v1;
}

- (unint64_t)indexFileVersion
{
  return 4;
}

- (id)indexName
{
  return @"PFTimeZoneData";
}

- (const)indexLabel
{
  return "timezone";
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  id v3 = a3;
  operator new();
}

- (CLLocationCoordinate2D)anyCoordinateForTimeZoneName:(id)a3
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (__CFString *)a3;
  if (![(PFTimeZoneLookup *)self loadOrCreateIndex])
  {
    float64x2_t v69 = *(float64x2_t *)MEMORY[0x1E4F1E750];
    goto LABEL_95;
  }
  if ([(__CFString *)v4 isEqualToString:@"US/Pacific"])
  {
    uint64_t v5 = @"America/Los_Angeles";
  }
  else
  {
    if (![(__CFString *)v4 isEqualToString:@"GMT"])
    {
      uint64_t v5 = v4;
      goto LABEL_11;
    }
    uint64_t v5 = @"Europe/London";
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Overriding input timeZone %@ with %@", buf, 0x16u);
  }

LABEL_11:
  v68 = v5;
  std::string::basic_string[abi:ne180100]<0>(&__s1, (char *)[(__CFString *)v68 UTF8String]);
  timezones = self->_timezones;
  uint64_t v9 = timezones[1];
  v8 = (char *)(timezones + 1);
  uint64_t v7 = v9;
  uint64_t v10 = v8 - (char *)buf;
  if (v9 == 1) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v10 + v7;
  if (v11 == 1) {
    int64_t v12 = 0;
  }
  else {
    int64_t v12 = buf - (uint8_t *)&v74;
  }
  uint64_t v13 = v12 + v11;
  *(void *)buf = v11;
  if (v11 == 1) {
    int64_t v14 = 0;
  }
  else {
    int64_t v14 = buf - (uint8_t *)&v75;
  }
  uint64_t v15 = v14 + v11;
  uint64_t v74 = v13;
  uint64_t v75 = v15;
  uint64_t v16 = *((void *)v8 + 1);
  if (v16) {
    BOOL v17 = v15 == 1;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
LABEL_110:
  }
    __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
  while (1)
  {
    uint64_t v18 = v15 + 32 * v16;
    v19 = (uint8_t *)&v74 + v13;
    if (v13 == 1) {
      v19 = 0;
    }
    if (v18 == 1) {
      v20 = 0;
    }
    else {
      v20 = &buf[v18 - 8];
    }
    if (v19 == v20) {
      goto LABEL_92;
    }
    if (v13 == 1) {
      int64_t v21 = 0;
    }
    else {
      int64_t v21 = (char *)&v74 - (char *)&v70;
    }
    uint64_t v22 = v21 + v13;
    uint64_t v70 = v22;
    if (v22 == 1) {
      v23 = 0;
    }
    else {
      v23 = (char *)&v70 + v22;
    }
    if (v23[8])
    {
      uint64_t v26 = v23 - (char *)&v75 + 9;
    }
    else
    {
      uint64_t v24 = *((void *)v23 + 3);
      uint64_t v25 = v23 + 24 - (char *)&v75;
      if (v24 == 1) {
        uint64_t v25 = 0;
      }
      uint64_t v26 = v25 + v24;
    }
    if (v26 == 1) {
      v27 = 0;
    }
    else {
      v27 = (char *)&buf[v26 - 8];
    }
    std::string::basic_string[abi:ne180100]<0>(buf, v27);
    if ((v73 & 0x80u) == 0) {
      size_t v28 = v73;
    }
    else {
      size_t v28 = __n;
    }
    uint64_t v29 = buf[23];
    int v30 = (char)buf[23];
    if ((buf[23] & 0x80u) != 0) {
      uint64_t v29 = *(void *)&buf[8];
    }
    if (v28 != v29)
    {
      BOOL v40 = 0;
      if (((char)buf[23] & 0x80000000) == 0) {
        goto LABEL_66;
      }
LABEL_65:
      operator delete(*(void **)buf);
      goto LABEL_66;
    }
    if ((buf[23] & 0x80u) == 0) {
      v31 = buf;
    }
    else {
      v31 = *(uint8_t **)buf;
    }
    if ((v73 & 0x80) != 0)
    {
      BOOL v40 = memcmp(__s1, v31, __n) == 0;
      goto LABEL_64;
    }
    if (v73)
    {
      uint64_t v32 = v73 - 1;
      p_s1 = &__s1;
      do
      {
        int v35 = *(unsigned __int8 *)p_s1;
        p_s1 = (void **)((char *)p_s1 + 1);
        int v34 = v35;
        int v37 = *v31++;
        int v36 = v37;
        BOOL v39 = v32-- != 0;
        BOOL v40 = v34 == v36;
      }
      while (v34 == v36 && v39);
LABEL_64:
      if ((v30 & 0x80000000) == 0) {
        goto LABEL_66;
      }
      goto LABEL_65;
    }
    BOOL v40 = 1;
    if ((char)buf[23] < 0) {
      goto LABEL_65;
    }
LABEL_66:
    if (v40) {
      break;
    }
    if (v74 == 1) {
      __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
    }
    uint64_t v13 = v74 + 32;
    v41 = self->_timezones;
    uint64_t v44 = v41[1];
    v43 = (char *)(v41 + 1);
    uint64_t v42 = v44;
    uint64_t v45 = v43 - (char *)buf;
    if (v44 == 1) {
      uint64_t v45 = 0;
    }
    uint64_t v46 = v45 + v42;
    *(void *)buf = v46;
    if (v46 == 1) {
      int64_t v47 = 0;
    }
    else {
      int64_t v47 = buf - (uint8_t *)&v75;
    }
    uint64_t v15 = v47 + v46;
    v74 += 32;
    uint64_t v75 = v15;
    uint64_t v16 = *((void *)v43 + 1);
    if (v16) {
      BOOL v48 = v15 == 1;
    }
    else {
      BOOL v48 = 0;
    }
    if (v48) {
      goto LABEL_110;
    }
  }
  v49 = self->_timezones;
  uint64_t v50 = v49[1];
  uint64_t v51 = (char *)(v49 + 1) - (char *)buf;
  if (v50 == 1) {
    uint64_t v51 = 0;
  }
  uint64_t v52 = v51 + v50;
  int64_t v53 = buf - (uint8_t *)&v75;
  if (v52 == 1) {
    int64_t v53 = 0;
  }
  uint64_t v54 = v53 + v52;
  if (v74 == 1) {
    v55 = 0;
  }
  else {
    v55 = (char *)&v74 + v74;
  }
  if (v54 == 1) {
    v56 = 0;
  }
  else {
    v56 = &buf[v54 - 8];
  }
  uint64_t v57 = v55 - (char *)v56;
  if (v55 - (char *)v56 == -32)
  {
LABEL_92:
    float64x2_t v69 = *(float64x2_t *)MEMORY[0x1E4F1E750];
    objc_super v4 = v68;
    goto LABEL_93;
  }
  float64x2_t v69 = *(float64x2_t *)MEMORY[0x1E4F1E750];
  rtree = self->_rtree;
  uint64_t v63 = rtree[3];
  v61 = (char *)(rtree + 3);
  uint64_t v62 = v63;
  objc_super v4 = v68;
  if (v63 == 1)
  {
    v77 = 0;
    memset(buf, 0, sizeof(buf));
  }
  else
  {
    uint64_t v64 = v61 - (char *)&v74 + v62;
    uint64_t v74 = v64;
    memset(buf, 0, sizeof(buf));
    v77 = 0;
    int64_t v65 = (char *)&v74 - (char *)&v75;
    if (v64 == 1) {
      int64_t v65 = 0;
    }
    uint64_t v66 = v65 + v64;
    uint64_t v75 = v66;
    if (v66 == 1) {
      v67 = 0;
    }
    else {
      v67 = &buf[v66 - 8];
    }
    boost::variant<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::apply_visitor<boost::geometry::index::detail::rtree::visitors::iterator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::detail::rtree::options<boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::detail::rtree::insert_default_tag,boost::geometry::index::detail::rtree::choose_by_content_diff_tag,boost::geometry::index::detail::rtree::split_default_tag,boost::geometry::index::detail::rtree::quadratic_tag,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::translator<boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>>>(v67, (char **)buf);
    boost::geometry::index::detail::rtree::visitors::iterator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::detail::rtree::options<boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::detail::rtree::insert_default_tag,boost::geometry::index::detail::rtree::choose_by_content_diff_tag,boost::geometry::index::detail::rtree::split_default_tag,boost::geometry::index::detail::rtree::quadratic_tag,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::translator<boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::search_value((uint64_t)buf);
  }
  while (*(void *)&buf[24])
  {
    if (v57 >> 5 == v77[1].u16[0])
    {
      float64x2_t v69 = vcvtq_f64_f32(*v77);
      break;
    }
    v77 = (float32x2_t *)((char *)v77 + 12);
    boost::geometry::index::detail::rtree::visitors::iterator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::detail::rtree::options<boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::detail::rtree::insert_default_tag,boost::geometry::index::detail::rtree::choose_by_content_diff_tag,boost::geometry::index::detail::rtree::split_default_tag,boost::geometry::index::detail::rtree::quadratic_tag,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::translator<boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::search_value((uint64_t)buf);
  }
  if (*(void *)buf) {
    operator delete(*(void **)buf);
  }
LABEL_93:
  if ((char)v73 < 0) {
    operator delete(__s1);
  }
LABEL_95:

  double v59 = v69.f64[1];
  double v58 = v69.f64[0];
  result.longitude = v59;
  result.latitude = v58;
  return result;
}

- (id)timeZoneNameForCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  uint64_t v5 = self;
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  if (![(PFTimeZoneLookup *)self loadOrCreateIndex]) {
    goto LABEL_8;
  }
  v161.double latitude = latitude;
  v161.double longitude = longitude;
  if (!CLLocationCoordinate2DIsValid(v161)) {
    goto LABEL_8;
  }
  uint64_t v7 = 0;
  BOOL v8 = latitude == 0.0;
  if (longitude != 0.0) {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    if (latitude == 40.0 && longitude == -100.0)
    {
LABEL_8:
      uint64_t v7 = 0;
      goto LABEL_9;
    }
    rtree = v5->_rtree;
    *(float *)&unsigned int v11 = latitude;
    *(float *)&unsigned int v12 = longitude;
    unint64_t v145 = v11 | ((unint64_t)v12 << 32);
    uint64_t v146 = 1;
    int64_t v14 = (char *)(rtree + 3);
    uint64_t v13 = rtree[3];
    if (v13 == 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      *(void *)buf = rtree;
      v152 = &v145;
      __p = 0;
      v154 = 0;
      v155 = 0;
      v156 = 0;
      v157 = 0;
      v158 = 0;
      if (rtree[1])
      {
        uint64_t v16 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*>>>(1uLL);
        v156 = v16;
        v157 = v16;
        v158 = &v16[2 * (void)v6];
        uint64_t v13 = *(void *)v14;
        uint64_t v17 = v146;
      }
      else
      {
        uint64_t v16 = 0;
        uint64_t v17 = 1;
      }
      int64_t v18 = v14 - (char *)&v147;
      if (v13 == 1) {
        int64_t v18 = 0;
      }
      uint64_t v19 = v18 + v13;
      uint64_t v147 = v19;
      if (v17)
      {
        v143 = v5;
        v20 = 0;
        uint64_t v21 = rtree[2];
        while (1)
        {
          uint64_t v22 = v19 == 1 ? 0 : (char *)&v147 + v19;
          if (v21)
          {
            v23 = boost::variant<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::apply_visitor<boost::detail::variant::get_visitor<boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>>(v22);
            if (!v23)
            {
              *(void *)&long long v149 = &unk_1EF7A9E58;
              boost::throw_exception<boost::bad_get>();
            }
            uint64_t v24 = v23 + 1;
            uint64_t v16 = v157;
            if (*v23)
            {
              uint64_t v25 = &v24[3 * *v23];
              uint64_t v26 = v21 - 1;
              v27 = v152;
              v144 = v156;
              uint64_t v28 = ((char *)v157 - (char *)v156) >> 4;
              do
              {
                float v30 = *(float *)v27;
                float v29 = *((float *)v27 + 1);
                float v32 = *((float *)v24 + 2);
                float v31 = *((float *)v24 + 3);
                float v34 = *(float *)v24;
                float v33 = *((float *)v24 + 1);
                double v35 = (v33 - v29) * (v33 - v29) + 0.0;
                if (v29 >= v33) {
                  double v35 = 0.0;
                }
                if (v29 <= v31) {
                  double v36 = v35;
                }
                else {
                  double v36 = v35 + (v29 - v31) * (v29 - v31);
                }
                if (v30 < v34) {
                  double v36 = v36 + (v34 - v30) * (v34 - v30);
                }
                if (v30 > v32) {
                  double v36 = v36 + (v30 - v32) * (v30 - v32);
                }
                if (v28 != v27[1] || *v144 > v36)
                {
                  uint64_t v37 = v24[2];
                  uint64_t v38 = (char *)(v24 + 2) - (char *)&v148;
                  if (v37 == 1) {
                    uint64_t v38 = 0;
                  }
                  uint64_t v39 = v38 + v37;
                  uint64_t v148 = v39;
                  *(double *)&long long v149 = v36;
                  int64_t v40 = (char *)&v148 - (char *)v150;
                  if (v39 == 1) {
                    int64_t v40 = 0;
                  }
                  uint64_t v41 = v40 + v39;
                  *((void *)&v149 + 1) = v26;
                  v150[0] = v40 + v39;
                  if (v20 >= v155)
                  {
                    uint64_t v44 = (char *)__p;
                    unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (unsigned char *)__p) >> 3);
                    unint64_t v46 = v45 + 1;
                    if (v45 + 1 > 0xAAAAAAAAAAAAAAALL) {
                      std::vector<pf::SceneTaxonomyNode const*>::__throw_length_error[abi:ne180100]();
                    }
                    if (0x5555555555555556 * ((v155 - (unsigned char *)__p) >> 3) > v46) {
                      unint64_t v46 = 0x5555555555555556 * ((v155 - (unsigned char *)__p) >> 3);
                    }
                    if (0xAAAAAAAAAAAAAAABLL * ((v155 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
                      unint64_t v47 = 0xAAAAAAAAAAAAAAALL;
                    }
                    else {
                      unint64_t v47 = v46;
                    }
                    if (v47 > 0xAAAAAAAAAAAAAAALL) {
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    }
                    BOOL v48 = (char *)operator new(24 * v47);
                    v49 = &v48[24 * v45];
                    *(_OWORD *)v49 = v149;
                    uint64_t v50 = (char *)((char *)v150 - (v49 + 16));
                    if (v41 == 1) {
                      uint64_t v50 = 0;
                    }
                    *((void *)v49 + 2) = &v50[v41];
                    v43 = v49;
                    if (v20 != v44)
                    {
                      uint64_t v51 = (char *)(v20 - v49);
                      uint64_t v52 = v49;
                      do
                      {
                        v43 = v52 - 24;
                        *(_OWORD *)(v52 - 24) = *(_OWORD *)(v20 - 24);
                        uint64_t v53 = *((void *)v20 - 1);
                        uint64_t v54 = v20 - 24;
                        if (v53 == 1) {
                          v55 = 0;
                        }
                        else {
                          v55 = v51;
                        }
                        *((void *)v52 - 1) = &v55[v53];
                        v20 -= 24;
                        v52 -= 24;
                      }
                      while (v54 != v44);
                    }
                    __p = v43;
                    v155 = &v48[24 * v47];
                    if (v44) {
                      operator delete(v44);
                    }
                    v20 = v49;
                  }
                  else
                  {
                    *(_OWORD *)v20 = v149;
                    uint64_t v42 = (char *)((char *)v150 - (v20 + 16));
                    if (v150[0] == 1) {
                      uint64_t v42 = 0;
                    }
                    *((void *)v20 + 2) = &v42[v150[0]];
                    v43 = (char *)__p;
                  }
                  v20 += 24;
                  v154 = v20;
                  std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::branch_data_comp &,std::__wrap_iter<boost::geometry::index::detail::rtree::visitors::distance_query<boost::geometry::index::rtree<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::members_holder,boost::geometry::index::detail::predicates::nearest<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>>::branch_data *>>((uint64_t)v43, (uint64_t)v20, 0xAAAAAAAAAAAAAAABLL * ((v20 - v43) >> 3));
                }
                v24 += 3;
              }
              while (v24 != v25);
              uint64_t v16 = v157;
            }
          }
          else
          {
            v56 = boost::variant<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::variant_internal_node<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>::apply_visitor<boost::detail::variant::get_visitor<boost::geometry::index::detail::rtree::variant_leaf<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::allocators<boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::model::box<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>,boost::geometry::index::detail::rtree::node_variant_static_tag>,boost::geometry::index::detail::rtree::node_variant_static_tag>>>(v22);
            if (!v56)
            {
              *(void *)&long long v149 = &unk_1EF7A9E58;
              boost::throw_exception<boost::bad_get>();
            }
            uint64_t v57 = (float *)(v56 + 1);
            uint64_t v16 = v157;
            if (*v56)
            {
              double v58 = &v57[3 * *v56];
              double v59 = v152;
              v60 = v156;
              unint64_t v61 = (unint64_t)v157;
              do
              {
                double v62 = *((float *)v59 + 1) - v57[1];
                double v63 = (*(float *)v59 - *v57) * (*(float *)v59 - *v57) + 0.0 + v62 * v62;
                uint64_t v64 = (uint64_t)(v61 - (void)v60) >> 4;
                if (v64 >= v59[1])
                {
                  double v65 = *v60;
                  if (*v60 > v63)
                  {
                    if ((uint64_t)(v61 - (void)v60) >= 17)
                    {
                      uint64_t v66 = 0;
                      uint64_t v67 = *((void *)v60 + 1);
                      v68 = v60;
                      do
                      {
                        float64x2_t v69 = v68;
                        v68 += 2 * v66 + 2;
                        uint64_t v70 = 2 * v66;
                        uint64_t v66 = (2 * v66) | 1;
                        uint64_t v71 = v70 + 2;
                        if (v71 < v64 && *v68 < v68[2])
                        {
                          v68 += 2;
                          uint64_t v66 = v71;
                        }
                        *float64x2_t v69 = *v68;
                        v69[1] = v68[1];
                      }
                      while (v66 <= (uint64_t)((unint64_t)(v64 - 2) >> 1));
                      if (v68 == (double *)(v61 - 16))
                      {
                        double *v68 = v65;
                        *((void *)v68 + 1) = v67;
                      }
                      else
                      {
                        double *v68 = *(double *)(v61 - 16);
                        v68[1] = *(double *)(v61 - 8);
                        *(double *)(v61 - 16) = v65;
                        *(void *)(v61 - 8) = v67;
                        std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::pair_first_less &,std::__wrap_iter<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*> *>>((uint64_t)v60, (uint64_t)(v68 + 2), ((char *)(v68 + 2) - (char *)v60) >> 4);
                        uint64_t v64 = ((char *)v16 - (char *)v60) >> 4;
                        unint64_t v61 = (unint64_t)v16;
                      }
                    }
                    *(double *)(v61 - 16) = v63;
                    *(void *)(v61 - 8) = v57;
                    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::pair_first_less &,std::__wrap_iter<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*> *>>((uint64_t)v60, v61, v64);
                  }
                }
                else
                {
                  if (v61 >= (unint64_t)v158)
                  {
                    unint64_t v72 = v64 + 1;
                    if ((unint64_t)(v64 + 1) >> 60) {
                      std::vector<pf::SceneTaxonomyNode const*>::__throw_length_error[abi:ne180100]();
                    }
                    uint64_t v73 = (char *)v158 - (char *)v60;
                    if (v158 - v60 > v72) {
                      unint64_t v72 = v73 >> 3;
                    }
                    if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF0) {
                      unint64_t v74 = 0xFFFFFFFFFFFFFFFLL;
                    }
                    else {
                      unint64_t v74 = v72;
                    }
                    if (v74) {
                      unint64_t v74 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<double,std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short> const*>>>(v74);
                    }
                    else {
                      v6 = 0;
                    }
                    unint64_t v75 = v74 + 16 * v64;
                    *(double *)unint64_t v75 = v63;
                    *(void *)(v75 + 8) = v57;
                    v76 = v156;
                    v77 = (double *)v75;
                    if (v16 != v156)
                    {
                      do
                      {
                        *((_OWORD *)v77 - 1) = *((_OWORD *)v16 - 1);
                        v77 -= 2;
                        v16 -= 2;
                      }
                      while (v16 != v76);
                      uint64_t v16 = v156;
                    }
                    unint64_t v61 = v75 + 16;
                    v156 = v77;
                    v157 = (double *)(v75 + 16);
                    v158 = (double *)(v74 + 16 * (void)v6);
                    if (v16) {
                      operator delete(v16);
                    }
                  }
                  else
                  {
                    *(double *)unint64_t v61 = v63;
                    *(void *)(v61 + 8) = v57;
                    v61 += 16;
                  }
                  v157 = (double *)v61;
                  v60 = v156;
                  double v59 = v152;
                  uint64_t v78 = v61 - (void)v156;
                  uint64_t v79 = (uint64_t)(v61 - (void)v156) >> 4;
                  if (v79 == v152[1] && v78 >= 17)
                  {
                    int64_t v81 = (unint64_t)(v79 - 2) >> 1;
                    int64_t v82 = v81;
                    do
                    {
                      int64_t v83 = v82;
                      if (v78 >= 32 && v81 >= v82)
                      {
                        uint64_t v84 = (2 * v82) | 1;
                        v85 = &v60[2 * v84];
                        if (2 * v83 + 2 < v79 && *v85 < v85[2])
                        {
                          v85 += 2;
                          uint64_t v84 = 2 * v83 + 2;
                        }
                        v86 = &v60[2 * v83];
                        double v87 = *v85;
                        double v88 = *v86;
                        if (*v85 >= *v86)
                        {
                          uint64_t v89 = *((void *)v86 + 1);
                          do
                          {
                            v90 = v86;
                            v86 = v85;
                            double *v90 = v87;
                            v90[1] = v85[1];
                            if (v81 < v84) {
                              break;
                            }
                            uint64_t v91 = 2 * v84;
                            uint64_t v84 = (2 * v84) | 1;
                            v85 = &v60[2 * v84];
                            uint64_t v92 = v91 + 2;
                            if (v92 < v79 && *v85 < v85[2])
                            {
                              v85 += 2;
                              uint64_t v84 = v92;
                            }
                            double v87 = *v85;
                          }
                          while (*v85 >= v88);
                          double *v86 = v88;
                          *((void *)v86 + 1) = v89;
                        }
                      }
                      int64_t v82 = v83 - 1;
                    }
                    while (v83);
                  }
                  uint64_t v16 = (double *)v61;
                }
                v57 += 3;
              }
              while (v57 != v58);
              v20 = v154;
            }
          }
          v93 = __p;
          v94 = v156;
          if (__p == v20 || v152[1] == ((char *)v16 - (char *)v156) >> 4 && *v156 <= *(double *)__p) {
            break;
          }
          uint64_t v95 = *((void *)__p + 2);
          int64_t v96 = (unsigned char *)__p + 16 - (unsigned char *)&v147;
          if (v95 == 1) {
            int64_t v96 = 0;
          }
          uint64_t v19 = v96 + v95;
          uint64_t v147 = v19;
          uint64_t v21 = *((void *)__p + 1);
          if (v20 - (unsigned char *)__p >= 25)
          {
            uint64_t v97 = 0;
            int64_t v98 = (v20 - (unsigned char *)__p) / 0x18uLL;
            long long v149 = *(_OWORD *)__p;
            int64_t v99 = (unsigned char *)__p + 16 - (unsigned char *)v150;
            if (v95 == 1) {
              int64_t v99 = 0;
            }
            v150[0] = v99 + v95;
            uint64_t v100 = v98 - 2;
            if (v98 < 2) {
              uint64_t v100 = v98 - 1;
            }
            uint64_t v101 = v100 >> 1;
            v102 = (double *)__p;
            do
            {
              v103 = v102;
              uint64_t v104 = v97 + 1;
              v102 += 3 * v97 + 3;
              uint64_t v105 = 2 * v97;
              uint64_t v97 = (2 * v97) | 1;
              int64_t v106 = v105 + 2;
              if (v106 < v98)
              {
                double v107 = v102[3];
                if (*v102 > v107 || *v102 == v107 && *(void *)&v103[3 * v104 + 1] > *((void *)v102 + 4))
                {
                  v102 += 3;
                  uint64_t v97 = v106;
                }
              }
              *(_OWORD *)v103 = *(_OWORD *)v102;
              v108 = (char *)(v102 + 2);
              uint64_t v109 = *((void *)v102 + 2);
              v110 = (char *)((char *)v102 - (char *)v103);
              if (v109 == 1) {
                v110 = 0;
              }
              *((void *)v103 + 2) = &v110[v109];
            }
            while (v97 <= v101);
            v111 = v20 - 24;
            if (v20 - 24 == (char *)v102)
            {
              *(_OWORD *)v102 = v149;
              v118 = (char *)((char *)v150 - v108);
              if (v150[0] == 1) {
                v118 = 0;
              }
              *((void *)v102 + 2) = &v118[v150[0]];
            }
            else
            {
              *(_OWORD *)v102 = *(_OWORD *)v111;
              uint64_t v114 = *((void *)v20 - 1);
              v113 = v20 - 8;
              uint64_t v112 = v114;
              v115 = (char *)(v113 - v108);
              if (v114 == 1) {
                v115 = 0;
              }
              *((void *)v102 + 2) = &v115[v112];
              uint64_t v116 = (uint64_t)(v102 + 3);
              *(_OWORD *)v111 = v149;
              v117 = (char *)((char *)v150 - v113);
              if (v150[0] == 1) {
                v117 = 0;
              }
              *(void *)v113 = &v117[v150[0]];
              std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,boost::geometry::index::detail::rtree::visitors::branch_data_comp &,std::__wrap_iter<boost::geometry::index::detail::rtree::visitors::distance_query<boost::geometry::index::rtree<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::geometry::index::quadratic<32ul,8ul>,boost::geometry::index::indexable<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::geometry::index::equal_to<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>,boost::interprocess::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::members_holder,boost::geometry::index::detail::predicates::nearest<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>>>::branch_data *>>((uint64_t)v93, v116, 0xAAAAAAAAAAAAAAABLL * ((v116 - (uint64_t)v93) >> 3));
              uint64_t v19 = v147;
            }
            v20 = v154;
          }
          v20 -= 24;
          v154 = v20;
        }
        if (v156 == v16)
        {
          unint64_t v119 = 0;
          uint64_t v15 = 0;
        }
        else
        {
          unint64_t v119 = 0;
          uint64_t v15 = 0;
          unint64_t v120 = 0;
          do
          {
            v121 = (uint64_t *)*((void *)v94 + 1);
            if (v119 >= v120)
            {
              unint64_t v123 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v119 - (void)v15) >> 2) + 1;
              if (v123 > 0x1555555555555555) {
                std::vector<pf::SceneTaxonomyNode const*>::__throw_length_error[abi:ne180100]();
              }
              if (0x5555555555555556 * ((uint64_t)(v120 - (void)v15) >> 2) > v123) {
                unint64_t v123 = 0x5555555555555556 * ((uint64_t)(v120 - (void)v15) >> 2);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v120 - (void)v15) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
                unint64_t v124 = 0x1555555555555555;
              }
              else {
                unint64_t v124 = v123;
              }
              if (v124) {
                unint64_t v124 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<boost::geometry::model::point<float,2ul,boost::geometry::cs::cartesian>,unsigned short>>>(v124);
              }
              else {
                v6 = 0;
              }
              uint64_t v125 = *v121;
              unint64_t v126 = v124 + 4 * ((uint64_t)(v119 - (void)v15) >> 2);
              *(_DWORD *)(v126 + 8) = *((_DWORD *)v121 + 2);
              *(void *)unint64_t v126 = v125;
              unint64_t v127 = v126;
              while ((unsigned __int16 *)v119 != v15)
              {
                uint64_t v128 = *(void *)(v119 - 12);
                v119 -= 12;
                int v129 = *(_DWORD *)(v119 + 8);
                *(void *)(v127 - 12) = v128;
                v127 -= 12;
                *(_DWORD *)(v127 + 8) = v129;
              }
              unint64_t v120 = v124 + 12 * (void)v6;
              unint64_t v119 = v126 + 12;
              if (v15) {
                operator delete(v15);
              }
              uint64_t v15 = (unsigned __int16 *)v127;
            }
            else
            {
              uint64_t v122 = *v121;
              *(_DWORD *)(v119 + 8) = *((_DWORD *)v121 + 2);
              *(void *)unint64_t v119 = v122;
              v119 += 12;
            }
            v94 += 2;
          }
          while (v94 != v16);
          uint64_t v16 = v156;
        }
        uint64_t v5 = v143;
      }
      else
      {
        unint64_t v119 = 0;
        uint64_t v15 = 0;
      }
      if (v16)
      {
        v157 = v16;
        operator delete(v16);
      }
      v130 = (boost::container *)__p;
      if (__p) {
        operator delete(__p);
      }
      if ((unsigned __int16 *)v119 != v15)
      {
        unint64_t v131 = v15[4];
        timezones = v5->_timezones;
        unint64_t v133 = timezones[2];
        if (v133 >= v131)
        {
          if (v133 <= v131) {
            boost::container::throw_out_of_range(v130, v6);
          }
          uint64_t v136 = timezones[1];
          v137 = (char *)timezones + v136 + 8;
          if (v136 == 1) {
            v137 = 0;
          }
          v138 = &v137[32 * v131];
          if (v138[8])
          {
            uint64_t v141 = v138 - (char *)buf + 9;
          }
          else
          {
            uint64_t v139 = *((void *)v138 + 3);
            uint64_t v140 = v138 + 24 - (char *)buf;
            if (v139 == 1) {
              uint64_t v140 = 0;
            }
            uint64_t v141 = v140 + v139;
          }
          if (v141 == 1) {
            v142 = 0;
          }
          else {
            v142 = &buf[v141];
          }
          uint64_t v135 = [NSString stringWithUTF8String:v142];
          goto LABEL_199;
        }
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"timezone index out of bounds: %ld", v15[4]);
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      v134 = [NSString stringWithFormat:@"{%.8f, %.8f}", *(void *)&latitude, *(void *)&longitude];
      *(_DWORD *)buf = 138477827;
      *(void *)&buf[4] = v134;
      _os_log_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Timezone name for %{private}@ not found.", buf, 0xCu);
    }
    uint64_t v135 = 0;
    uint64_t v7 = 0;
    if (!v15) {
      goto LABEL_9;
    }
LABEL_199:
    operator delete(v15);
    uint64_t v7 = (void *)v135;
  }
LABEL_9:

  return v7;
}

@end