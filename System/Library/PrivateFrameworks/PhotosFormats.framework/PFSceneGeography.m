@interface PFSceneGeography
- (BOOL)indexSupported;
- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4;
- (BOOL)loadOrCreateIndex;
- (c_iterator<boost::unordered::detail::node<boost::interprocess::allocator<pf::SceneGeographyNode,)findPOIHash:(id)a3;
- (char)magic;
- (const)indexLabel;
- (double)popularityForPOI:(id)a3 popularity:(unsigned __int16)a4;
- (double)scoreForPOI:(id)a3 scenes:(id)a4 maxScenesCount:(int64_t)a5 popularityWeight:(double)a6;
- (id).cxx_construct;
- (id)dataArchivePath;
- (id)indexName;
- (id)scenesByScoreForPOIHash:(id)a3;
- (unint64_t)indexFileVersion;
- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3;
@end

@implementation PFSceneGeography

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::unique_ptr<boost::interprocess::basic_managed_mapped_file<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>::reset[abi:ne180100]((uint64_t *)&self->_backingFile);

  objc_storeStrong((id *)&self->_dataArchivePath, 0);
}

- (BOOL)indexSupported
{
  return 1;
}

- (BOOL)loadOrCreateIndex
{
  v4.receiver = self;
  v4.super_class = (Class)PFSceneGeography;
  [(PFCachingArchiveIndex *)&v4 loadOrCreateIndex];
  return self->_floatMap && self->_scenes && self->_poi != 0;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  operator new();
}

- (char)magic
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v2 = [a1 architectureHash];
  id v3 = [a1 dataArchivePath];
  if (stat((const char *)[v3 fileSystemRepresentation], &v12)) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = (v12.st_mode & 0x8000u) != 0;
  }
  int v5 = v4;

  if (v5)
  {
    int v6 = ((unint64_t)(v12.st_mtimespec.tv_sec ^ v12.st_size) >> 32) ^ LODWORD(v12.st_mtimespec.tv_sec) ^ LODWORD(v12.st_size);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v9 = [a1 dataArchivePath];
      int v10 = *__error();
      *(_DWORD *)buf = 138543618;
      v14 = v9;
      __int16 v15 = 1024;
      int v16 = v10;
      _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to get file metadata from dataArchivePath %{public}@: %d.", buf, 0x12u);
    }
    int v6 = 0;
  }
  int v11 = v2;
  v7 = -[PFSceneGeography magic]::buffer;
  snprintf(-[PFSceneGeography magic]::buffer, 0x50uLL, "%s%s%02x%08x%08x", "PFSceneGeography", "02", 2, v11, v6);
  return v7;
}

- (unint64_t)indexFileVersion
{
  return 2;
}

- (id)indexName
{
  dataArchivePath = self->_dataArchivePath;
  if (dataArchivePath)
  {
    id v3 = [(NSString *)dataArchivePath lastPathComponent];
    BOOL v4 = [v3 stringByDeletingPathExtension];
  }
  else
  {
    BOOL v4 = @"PFSceneGeographyData";
  }

  return v4;
}

- (const)indexLabel
{
  return "scenegeography";
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  id v3 = a3;
  operator new();
}

- (c_iterator<boost::unordered::detail::node<boost::interprocess::allocator<pf::SceneGeographyNode,)findPOIHash:(id)a3
{
  int v5 = v3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(PFSceneGeography *)self loadOrCreateIndex];
  if (v6) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::basic_managed_heap_memory((uint64_t)v17);
    poi = self->_poi;
    int v10 = (char *)[v6 UTF8String];
    if (v17[0]) {
      uint64_t v11 = v17[0] - (void)&v16;
    }
    else {
      uint64_t v11 = 1;
    }
    uint64_t v16 = v11;
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::basic_string((uint64_t)v19, v10, &v16);
    unint64_t v12 = boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>::operator()((uint64_t)v19);
    unint64_t v13 = 265 * ((~v12 + (v12 << 21)) ^ ((~v12 + (v12 << 21)) >> 24));
    boost::unordered::detail::table<boost::unordered::detail::map<boost::interprocess::allocator<pf::SceneGeographyNode,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>,boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,pf::SceneGeographyNode,boost::hash<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>>::find_node_impl<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>,std::equal_to<boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>>>(&v18, (uint64_t)poi, 2147483649u * ((21 * (v13 ^ (v13 >> 14))) ^ ((21 * (v13 ^ (v13 >> 14))) >> 28)), (uint64_t)v19);
    v14 = (unsigned char *)((char *)&v18 - v5);
    if (v18 == 1) {
      v14 = 0;
    }
    *(void *)int v5 = &v14[v18];
    boost::container::basic_string<char,std::char_traits<char>,boost::interprocess::allocator<char,boost::interprocess::segment_manager<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>>>::~basic_string((uint64_t)v19);
    boost::interprocess::basic_managed_heap_memory<char,boost::interprocess::rbtree_best_fit<boost::interprocess::null_mutex_family,boost::interprocess::offset_ptr<void,long,unsigned long,0ul>,0ul>,boost::interprocess::iset_index>::~basic_managed_heap_memory(v17);
  }
  else
  {
    *(void *)int v5 = 1;
  }

  return v15;
}

- (id)scenesByScoreForPOIHash:(id)a3
{
  id v4 = a3;
  [(PFSceneGeography *)self findPOIHash:v4];
  int v5 = 0;
  if (v68 != 1 && v68 != -(uint64_t)&v68)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v68 == 1) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = (char *)&v68 + v68;
    }
    uint64_t v11 = *((void *)v8 + 7);
    int v10 = v8 + 56;
    uint64_t v9 = v11;
    int64_t v12 = v10 - (char *)&v69;
    if (v11 == 1) {
      int64_t v12 = 0;
    }
    uint64_t v13 = v12 + v9;
    if (v12 + v9 == 1) {
      int64_t v14 = 0;
    }
    else {
      int64_t v14 = (char *)&v69 - (char *)&v67;
    }
    uint64_t v15 = v14 + v13;
    int64_t v69 = v13;
    int64_t v16 = (char *)&v69 - (char *)&v66;
    if (v13 == 1) {
      int64_t v16 = 0;
    }
    uint64_t v17 = v16 + v13;
    uint64_t v66 = v17;
    uint64_t v67 = v15;
    uint64_t v18 = *((void *)v10 + 1);
    if (v17 == 1 && v18 != 0) {
      __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
    }
    int v5 = (void *)v7;
    id v63 = v4;
    uint64_t v20 = v17 + 2 * v18;
    uint64_t v66 = v20;
    BOOL v21 = v15 == 1;
    v22 = (unsigned __int8 *)&v67 + v15;
    if (v15 == 1) {
      v23 = 0;
    }
    else {
      v23 = (char *)&v67 + v15;
    }
    v24 = (char *)&v66 + v20;
    if (v20 == 1) {
      v24 = 0;
    }
    if (v23 != v24)
    {
      do
      {
        if (v21) {
          __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
        }
        floatMap = self->_floatMap;
        unint64_t v26 = v22[1];
        if (floatMap[2] <= v26) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        uint64_t v27 = floatMap[1];
        v28 = (char *)floatMap + v27 + 8;
        if (v27 == 1) {
          v29 = 0;
        }
        else {
          v29 = v28;
        }
        scenes = self->_scenes;
        unint64_t v31 = *v22;
        if (scenes[2] <= v31) {
          __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
        }
        double v32 = *(double *)&v29[8 * v26];
        uint64_t v33 = scenes[1];
        v34 = (char *)scenes + v33 + 8;
        if (v33 == 1) {
          v35 = 0;
        }
        else {
          v35 = v34;
        }
        v36 = &v35[32 * v31];
        uint64_t v39 = *((void *)v36 + 1);
        v38 = v36 + 8;
        uint64_t v37 = v39;
        int64_t v40 = v38 - (char *)&v69;
        if (v39 == 1) {
          int64_t v41 = 0;
        }
        else {
          int64_t v41 = v38 - (char *)&v69;
        }
        uint64_t v42 = v41 + v37;
        if (v42 == 1) {
          int64_t v43 = 0;
        }
        else {
          int64_t v43 = (char *)&v69 - (char *)&v65;
        }
        uint64_t v44 = v43 + v42;
        uint64_t v65 = v44;
        if (*(void *)v38 == 1) {
          int64_t v40 = 0;
        }
        int64_t v45 = v40 + *(void *)v38;
        int64_t v69 = v45;
        if (v45 == 1) {
          int64_t v46 = 0;
        }
        else {
          int64_t v46 = (char *)&v69 - (char *)&v64;
        }
        int64_t v47 = v46 + v45;
        uint64_t v64 = v47;
        uint64_t v48 = *((void *)v38 + 1);
        if (v48) {
          BOOL v49 = v47 == 1;
        }
        else {
          BOOL v49 = 0;
        }
        if (v49) {
          __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
        }
        uint64_t v50 = v47 + 4 * v48;
        uint64_t v64 = v50;
        BOOL v51 = v44 == 1;
        v52 = (unsigned int *)((char *)&v65 + v44);
        if (v44 == 1) {
          v53 = 0;
        }
        else {
          v53 = (char *)&v65 + v44;
        }
        if (v50 == 1) {
          v54 = 0;
        }
        else {
          v54 = (char *)&v64 + v50;
        }
        if (v53 != v54)
        {
          do
          {
            if (v51) {
              __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
            }
            v55 = [NSNumber numberWithDouble:v32];
            v56 = [NSNumber numberWithUnsignedInt:*v52];
            [v5 setObject:v55 forKeyedSubscript:v56];

            if (v65 == 1) {
              __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
            }
            uint64_t v57 = v65 + 4;
            uint64_t v65 = v57;
            BOOL v51 = v57 == 1;
            v52 = (unsigned int *)((char *)&v65 + v57);
            if (v57 == 1) {
              v58 = 0;
            }
            else {
              v58 = (char *)&v65 + v57;
            }
            if (v64 == 1) {
              v59 = 0;
            }
            else {
              v59 = (char *)&v64 + v64;
            }
          }
          while (v58 != v59);
          uint64_t v15 = v67;
        }
        if (v15 == 1) {
          __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
        }
        v15 += 2;
        uint64_t v67 = v15;
        BOOL v21 = v15 == 1;
        v22 = (unsigned __int8 *)&v67 + v15;
        if (v15 == 1) {
          v60 = 0;
        }
        else {
          v60 = (char *)&v67 + v15;
        }
        if (v66 == 1) {
          v61 = 0;
        }
        else {
          v61 = (char *)&v66 + v66;
        }
      }
      while (v60 != v61);
    }
    id v4 = v63;
  }

  return v5;
}

- (double)popularityForPOI:(id)a3 popularity:(unsigned __int16)a4
{
  int v5 = a4;
  id v7 = a3;
  [(PFSceneGeography *)self findPOIHash:v7];
  BOOL v8 = (char *)&v12 + v12;
  if (v12 == 1 || v8 == 0)
  {
    int v10 = &PFSceneGeographyPOINotFound;
LABEL_11:
    double v4 = *(double *)v10;
    goto LABEL_12;
  }
  if (v5 == 1)
  {
    int v10 = (uint64_t *)(v8 + 32);
    goto LABEL_11;
  }
  if (!v5)
  {
    int v10 = (uint64_t *)(v8 + 40);
    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

- (double)scoreForPOI:(id)a3 scenes:(id)a4 maxScenesCount:(int64_t)a5 popularityWeight:(double)a6
{
  unint64_t v83 = a5;
  v89[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v82 = self;
  id v79 = v9;
  [(PFSceneGeography *)self findPOIHash:v9];
  BOOL v11 = v88 == 1 || v88 == 136 - (void)&vars0;
  if (v11)
  {
    double v12 = *(double *)&PFSceneGeographyPOINotFound;
  }
  else
  {
    unint64_t v13 = [v10 count];
    unint64_t v14 = v83;
    if (v13 < v83) {
      unint64_t v14 = v13;
    }
    if (v14 >= 0xFA) {
      unint64_t v15 = 250;
    }
    else {
      unint64_t v15 = v14;
    }
    MEMORY[0x1F4188790]();
    uint64_t v17 = (double *)((char *)v78 - v16);
    bzero((char *)v78 - v16, v18);
    if (v88 == 1) {
      v19 = 0;
    }
    else {
      v19 = (char *)&v89[-1] + v88;
    }
    uint64_t v20 = *((void *)v19 + 7);
    uint64_t v21 = v19 + 56 - (char *)v89;
    if (v20 == 1) {
      uint64_t v21 = 0;
    }
    uint64_t v22 = v21 + v20;
    if (v22 == 1) {
      uint64_t v23 = 0;
    }
    else {
      uint64_t v23 = 16;
    }
    uint64_t v24 = v23 + v22;
    v89[0] = v22;
    int64_t v25 = (char *)v89 - (char *)&v86;
    if (v22 == 1) {
      int64_t v25 = 0;
    }
    uint64_t v26 = v25 + v22;
    uint64_t v86 = v26;
    uint64_t v87 = v24;
    uint64_t v27 = *((void *)v19 + 8);
    if (v26 == 1 && v27 != 0) {
      __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
    }
    uint64_t v29 = v26 + 2 * v27;
    uint64_t v86 = v29;
    BOOL v30 = v24 == 1;
    unint64_t v31 = (unsigned __int8 *)&v87 + v24;
    if (v24 == 1) {
      double v32 = 0;
    }
    else {
      double v32 = (char *)&v87 + v24;
    }
    uint64_t v33 = (char *)&v86 + v29;
    if (v29 == 1) {
      uint64_t v33 = 0;
    }
    if (v32 == v33) {
      goto LABEL_99;
    }
    v78[0] = v19;
    v78[1] = v78;
    unint64_t v34 = 0;
    unint64_t v35 = 0;
    uint64_t v80 = 40;
    uint64_t v81 = 32;
    double v12 = 0.0;
    do
    {
      if (v30) {
        __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
      }
      floatMap = v82->_floatMap;
      unint64_t v37 = v31[1];
      if (floatMap[2] <= v37) {
        __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
      }
      uint64_t v38 = floatMap[1];
      uint64_t v39 = (char *)floatMap + v38 + 8;
      if (v38 == 1) {
        int64_t v40 = 0;
      }
      else {
        int64_t v40 = v39;
      }
      scenes = v82->_scenes;
      unint64_t v42 = *v31;
      if (scenes[2] <= v42) {
        __assert_rtn("operator[]", "vector.hpp", 1670, "this->m_holder.m_size > n");
      }
      double v43 = *(double *)&v40[8 * v37];
      uint64_t v44 = scenes[1];
      int64_t v45 = (char *)scenes + v44 + 8;
      if (v44 == 1) {
        int64_t v46 = 0;
      }
      else {
        int64_t v46 = v45;
      }
      int64_t v47 = &v46[32 * v42];
      uint64_t v50 = *((void *)v47 + 1);
      BOOL v49 = v47 + 8;
      uint64_t v48 = v50;
      int64_t v51 = v49 - (char *)v89;
      if (v50 == 1) {
        int64_t v52 = 0;
      }
      else {
        int64_t v52 = v49 - (char *)v89;
      }
      uint64_t v53 = v52 + v48;
      uint64_t v54 = v81;
      if (v53 == 1) {
        uint64_t v54 = 0;
      }
      uint64_t v55 = v54 + v53;
      uint64_t v85 = v55;
      if (*(void *)v49 == 1) {
        int64_t v51 = 0;
      }
      int64_t v56 = v51 + *(void *)v49;
      v89[0] = v56;
      uint64_t v57 = v80;
      if (v56 == 1) {
        uint64_t v57 = 0;
      }
      uint64_t v58 = v57 + v56;
      uint64_t v84 = v58;
      uint64_t v59 = *((void *)v49 + 1);
      if (v59) {
        BOOL v60 = v58 == 1;
      }
      else {
        BOOL v60 = 0;
      }
      if (v60) {
        __assert_rtn("operator+=", "vector.hpp", 181, "m_ptr || !off");
      }
      uint64_t v61 = v58 + 4 * v59;
      uint64_t v84 = v61;
      BOOL v11 = v55 == 1;
      BOOL v62 = v55 == 1;
      id v63 = (unsigned int *)((char *)&v85 + v55);
      if (v11) {
        uint64_t v64 = 0;
      }
      else {
        uint64_t v64 = v63;
      }
      if (v61 == 1) {
        uint64_t v65 = 0;
      }
      else {
        uint64_t v65 = (char *)&v84 + v61;
      }
      if (v64 != (unsigned int *)v65)
      {
        do
        {
          if (v62) {
            __assert_rtn("operator*", "vector.hpp", 156, "!!m_ptr");
          }
          uint64_t v66 = [NSNumber numberWithUnsignedInt:*v63];
          int v67 = [v10 containsObject:v66];

          if (v67)
          {
            double v12 = v43 + v12;
            if (v83 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v34 >= v15)
              {
                if (v43 > v17[v35])
                {
                  v17[v35] = v43;
                  if (v15)
                  {
                    unint64_t v68 = 0;
                    double v69 = v43;
                    do
                    {
                      if (v17[v68] < v69)
                      {
                        unint64_t v35 = v68;
                        double v69 = v17[v68];
                      }
                      ++v68;
                    }
                    while (v15 != v68);
                  }
                }
              }
              else
              {
                v17[v34] = v43;
                if (v43 < v17[v35]) {
                  unint64_t v35 = v34;
                }
              }
            }
            ++v34;
          }
          if (v85 == 1) {
            __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
          }
          uint64_t v70 = v85 + 4;
          uint64_t v85 = v70;
          BOOL v62 = v70 == 1;
          id v63 = (unsigned int *)((char *)&v85 + v70);
          if (v70 == 1) {
            v71 = 0;
          }
          else {
            v71 = (char *)&v85 + v70;
          }
          if (v84 == 1) {
            v72 = 0;
          }
          else {
            v72 = (char *)&v84 + v84;
          }
        }
        while (v71 != v72);
        uint64_t v24 = v87;
      }
      if (v24 == 1) {
        __assert_rtn("operator++", "vector.hpp", 168, "!!m_ptr");
      }
      v24 += 2;
      uint64_t v87 = v24;
      BOOL v30 = v24 == 1;
      unint64_t v31 = (unsigned __int8 *)&v87 + v24;
      if (v24 == 1) {
        v73 = 0;
      }
      else {
        v73 = (char *)&v87 + v24;
      }
      if (v86 == 1) {
        v74 = 0;
      }
      else {
        v74 = (char *)&v86 + v86;
      }
    }
    while (v73 != v74);
    if (v34 > v15)
    {
      if (!v15)
      {
LABEL_99:
        double v12 = *(double *)&PFSceneGeographyNoRelevantScenes;
        goto LABEL_100;
      }
      double v12 = 0.0;
      do
      {
        double v75 = *v17++;
        double v12 = v12 + v75;
        --v15;
      }
      while (v15);
    }
    if (v12 == 0.0) {
      goto LABEL_99;
    }
    if (a6 != 0.0)
    {
      if (*(double *)&PFSceneGeographyClipTFIDF >= v12) {
        double v77 = v12;
      }
      else {
        double v77 = *(double *)&PFSceneGeographyClipTFIDF;
      }
      double v12 = (*(double *)(v78[0] + 40) * a6 + (1.0 - a6) * v77)
          / (a6 + (1.0 - a6) * *(double *)&PFSceneGeographyClipTFIDF);
    }
  }
LABEL_100:

  return v12;
}

- (id)dataArchivePath
{
  dataArchivePath = self->_dataArchivePath;
  if (dataArchivePath) {
    id v3 = dataArchivePath;
  }
  else {
    id v3 = @"/System/Library/Photos/Resources/PhotosAtlas/SceneGeography_v1.bz2";
  }

  return v3;
}

@end