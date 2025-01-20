void sub_1B045F518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,uint64_t a48,std::__shared_weak_count *a49)
{
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  std::__shared_weak_count *v54;

  _Block_object_dispose(&a39, 8);
  if (a49) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a49);
  }

  if (a24 < 0) {
    operator delete(__p);
  }
  v54 = *(std::__shared_weak_count **)(a13 + 8);
  if (v54) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v54);
  }
  _Unwind_Resume(a1);
}

void ML3ImportSession::_getDefaultEmptyGenre(ML3ImportSession *this)
{
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<ML3GenreData>::~shared_ptr[abi:ne180100], &ML3ImportSession::_getDefaultEmptyGenre(void)::__emptyGenreData, &dword_1B022D000);
  }
  if (ML3ImportSession::_getDefaultEmptyGenre(void)::onceToken != -1) {
    dispatch_once(&ML3ImportSession::_getDefaultEmptyGenre(void)::onceToken, &__block_literal_global_408);
  }
  uint64_t v2 = qword_1E9B320F0;
  *(void *)this = ML3ImportSession::_getDefaultEmptyGenre(void)::__emptyGenreData;
  *((void *)this + 1) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
}

void ML3ImportSession::_getArtistInfo(void *a1, uint64_t a2, uint64_t **a3)
{
  uint64_t v285 = *MEMORY[0x1E4F143B8];
  uint64_t v253 = 0;
  v254 = &v253;
  uint64_t v255 = 0x4012000000;
  v256 = __Block_byref_object_copy__283;
  v257 = __Block_byref_object_dispose__284;
  v258 = "";
  v260 = 0;
  uint64_t v259 = 0;
  uint64_t v247 = 0;
  v248 = (id *)&v247;
  uint64_t v249 = 0x3032000000;
  v250 = __Block_byref_object_copy__286;
  v251 = __Block_byref_object_dispose__287;
  id v252 = 0;
  uint64_t v4 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 32))(*a3, 167772180);
  uint64_t v240 = 0;
  v241 = (const std::string *)&v240;
  uint64_t v242 = 0x4812000000;
  v243 = __Block_byref_object_copy__288;
  v244 = __Block_byref_object_dispose__289;
  uint64_t v245 = 0;
  (*(void (**)(void **__return_ptr))(**a3 + 24))(&v235);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v246, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    v235 = &unk_1F08C3230;
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v246 = __s;
  }
  v235 = 0;
  v236 = &v235;
  __s.__r_.__value_.__r.__words[0] = 0x4812000000;
  __s.__r_.__value_.__l.__size_ = (std::string::size_type)__Block_byref_object_copy__288;
  __s.__r_.__value_.__r.__words[2] = (std::string::size_type)__Block_byref_object_dispose__289;
  uint64_t v238 = 0;
  (*(void (**)(void **__return_ptr))(**a3 + 168))(&v230);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v239, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v230 = &unk_1F08C3230;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v239 = __p;
  }
  v230 = 0;
  v231 = &v230;
  __p.__r_.__value_.__r.__words[0] = 0x4812000000;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)__Block_byref_object_copy__288;
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)__Block_byref_object_dispose__289;
  uint64_t v233 = 0;
  (*(void (**)(void **__return_ptr))(**a3 + 24))(&v225);
  if (SHIBYTE(v227.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v234, v227.__r_.__value_.__l.__data_, v227.__r_.__value_.__l.__size_);
    v225 = &unk_1F08C3230;
    if (SHIBYTE(v227.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v227.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v234 = v227;
  }
  v225 = 0;
  v226 = &v225;
  v227.__r_.__value_.__r.__words[0] = 0x4812000000;
  v227.__r_.__value_.__l.__size_ = (std::string::size_type)__Block_byref_object_copy__288;
  v227.__r_.__value_.__r.__words[2] = (std::string::size_type)__Block_byref_object_dispose__289;
  uint64_t v228 = 0;
  (*(void (**)(unsigned char *__return_ptr))(**a3 + 176))(buf);
  if ((v282[7] & 0x80000000) != 0)
  {
    std::string::__init_copy_ctor_external(&v229, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if ((v282[7] & 0x80000000) != 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&v229.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    v229.__r_.__value_.__r.__words[2] = *(void *)v282;
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 32))(*a3, 16777217);
  uint64_t v195 = v4;
  char v6 = MLMediaTypeByStandardizingMediaType(v5);
  BOOL v7 = (v6 & 8) == 0;
  uint64_t v8 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 32))(*a3, 167772176);
  v9 = *a3;
  uint64_t v10 = **a3;
  uint64_t v11 = (*a3)[1];
  uint64_t v224 = v11;
  uint64_t v197 = (*(uint64_t (**)(uint64_t *, uint64_t))(v10 + 32))(v9, 318767118);
  uint64_t v198 = v8;
  if (*((unsigned char *)*a3 + 16) && !*((unsigned char *)*a3 + 17))
  {
    v18 = *(void **)(a2 + 16);
    v19 = [NSNumber numberWithLongLong:v11];
    v274 = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v274 count:1];
    v21 = [v18 executeQuery:@"SELECT item_artist_pid FROM item WHERE ROWID = ?" withParameters:v20];

    v22 = [v21 objectForFirstRowAndColumn];
    if ([v22 longLongValue])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&buf[24] = 0;
      v192 = v21;
      char v23 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 56))(*a3, 167772161);
      char v24 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 56))(*a3, 167772167);
      char v25 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 56))(*a3, 167772162);
      char v26 = (*(uint64_t (**)(uint64_t *, uint64_t))(**a3 + 56))(*a3, 167772168);
      v27 = *(void **)(a2 + 16);
      v273 = v22;
      v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v273 count:1];
      v29 = [v27 executeQuery:@"SELECT item_artist, sort_item_artist, series_name, sort_series_name, representative_item_pid, store_id, grouping_key, sync_id, classical_experience_available FROM item_artist WHERE item_artist_pid=?", v28 withParameters];
      v206[0] = MEMORY[0x1E4F143A8];
      v206[1] = 3321888768;
      v206[2] = ___ZN16ML3ImportSession14_getArtistInfoENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke;
      v206[3] = &unk_1F08C8780;
      char v219 = v23;
      char v220 = v24;
      v208 = &v240;
      v209 = &v235;
      char v221 = v25;
      char v222 = v26;
      v210 = &v230;
      v211 = &v225;
      v212 = buf;
      v213 = &v247;
      BOOL v223 = v7;
      v31 = *a3;
      v30 = (std::__shared_weak_count *)a3[1];
      uint64_t v215 = a2;
      v216 = v31;
      v217 = v30;
      if (v30) {
        atomic_fetch_add_explicit(&v30->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v214 = &v253;
      id v207 = v22;
      uint64_t v218 = v11;
      v21 = v192;
      [v29 enumerateRowsWithBlock:v206];

      if (v217) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v217);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v32 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v11;
        _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_ERROR, "No existing artist PID for update item %lli", buf, 0xCu);
      }
    }
    unint64_t v17 = v198;
  }
  else
  {
    v12 = *(void **)(a2 + 8);
    v13 = ML3CPPBridgeString((const UInt8 *)&v241[2], 0);
    if ((v6 & 8) != 0)
    {
      v14 = &stru_1F08D4D70;
    }
    else
    {
      ML3CPPBridgeString((const UInt8 *)v231 + 48, 0);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v15 = [v12 artistGroupingKeyForArtistName:v13 seriesName:v14];
    id v16 = v248[5];
    v248[5] = (id)v15;

    if ((v6 & 8) == 0) {
    unint64_t v17 = v198;
    }
    if (!([v248[5] length] | v198))
    {
      *a1 = 0;
      a1[1] = 0;
      goto LABEL_249;
    }
  }
  if (!v254[6] && [v248[5] length])
  {
    id v45 = v248[5];
    v46 = buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4012000000;
    *(void *)&buf[24] = __Block_byref_object_copy__283;
    *(void *)v282 = __Block_byref_object_dispose__284;
    *(void *)&v282[8] = "";
    *(void *)&v282[16] = 0;
    v283 = 0;
    if (v17)
    {
      v47 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>((void *)(a2 + 968), v17);
      if (v47)
      {
        uint64_t v49 = v47[3];
        v48 = (std::__shared_weak_count *)v47[4];
        if (v48)
        {
          atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
          v50 = v283;
          *(void *)&v282[16] = v49;
          v283 = v48;
          if (v50) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v50);
          }
        }
        else
        {
          *(void *)&v282[16] = v47[3];
          v283 = 0;
        }
        v176 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v275.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)v275.__r_.__value_.__r.__words + 4) = (std::string::size_type)v45;
          WORD2(v275.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v275.__r_.__value_.__r.__words[1] + 6) = v17;
          _os_log_impl(&dword_1B022D000, v176, OS_LOG_TYPE_DEFAULT, "Found artist with grouping key=%p, sourceID=%lld", (uint8_t *)&v275, 0x16u);
        }

        v46 = *(unsigned char **)&buf[8];
        uint64_t v70 = *(void *)(*(void *)&buf[8] + 48);
        unint64_t v17 = v198;
      }
      else
      {
        uint64_t v70 = 0;
        v46 = buf;
      }
    }
    else
    {
      uint64_t v70 = 0;
    }
    if (v45 && !v70)
    {
      ML3CPPStringFromData((NSData *)&v275, v45);
      v177 = std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::find<std::string>((void *)(a2 + 1088), (unsigned __int8 *)&v275);
      if (SHIBYTE(v275.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v275.__r_.__value_.__l.__data_);
      }
      v46 = *(unsigned char **)&buf[8];
      if (v177)
      {
        uint64_t v179 = *((void *)v177 + 5);
        uint64_t v178 = *((void *)v177 + 6);
        if (v178) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v178 + 8), 1uLL, memory_order_relaxed);
        }
        v180 = (std::__shared_weak_count *)*((void *)v46 + 7);
        *((void *)v46 + 6) = v179;
        *((void *)v46 + 7) = v178;
        if (v180) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v180);
        }
        v181 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v275.__r_.__value_.__l.__data_) = 134217984;
          *(std::string::size_type *)((char *)v275.__r_.__value_.__r.__words + 4) = (std::string::size_type)v45;
          _os_log_impl(&dword_1B022D000, v181, OS_LOG_TYPE_DEFAULT, "Found artist with grouping key=%p", (uint8_t *)&v275, 0xCu);
        }

        v46 = *(unsigned char **)&buf[8];
        unint64_t v17 = v198;
      }
    }
    uint64_t v182 = *((void *)v46 + 6);
    if (v182) {
      goto LABEL_284;
    }
    if (v45 && v17)
    {
      objc_msgSend(@"SELECT item_artist, sort_item_artist, series_name, sort_series_name, rowid, store_id, IFNULL(sort_item_artist, ML3SortString(item_artist)), IFNULL(IFNULL(sort_series_name, ML3SortString(series_name)), IFNULL(sort_item_artist, ML3SortString(item_artist))), sync_id, classical_experience_available FROM item_artist ", "stringByAppendingString:", @"WHERE (ROWID = ? OR sync_id = ?) OR grouping_key = ?");
      v183 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v184 = [NSNumber numberWithLongLong:v198];
      v284.__r_.__value_.__r.__words[0] = (std::string::size_type)v184;
      v185 = [NSNumber numberWithLongLong:v198];
      v284.__r_.__value_.__l.__size_ = (std::string::size_type)v185;
      v284.__r_.__value_.__r.__words[2] = (std::string::size_type)v45;
      uint64_t v186 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v284 count:3];
    }
    else
    {
      if (!v17)
      {
        if (v45)
        {
          objc_msgSend(@"SELECT item_artist, sort_item_artist, series_name, sort_series_name, rowid, store_id, IFNULL(sort_item_artist, ML3SortString(item_artist)), IFNULL(IFNULL(sort_series_name, ML3SortString(series_name)), IFNULL(sort_item_artist, ML3SortString(item_artist))), sync_id, classical_experience_available FROM item_artist ", "stringByAppendingString:", @"WHERE grouping_key = ?");
          v183 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v284.__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
          v187 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v284 count:1];
        }
        else
        {
          v187 = 0;
          v183 = @"SELECT item_artist, sort_item_artist, series_name, sort_series_name, rowid, store_id, IFNULL(sort_item_artist, ML3SortString(item_artist)), IFNULL(IFNULL(sort_series_name, ML3SortString(series_name)), IFNULL(sort_item_artist, ML3SortString(item_artist))), sync_id, classical_experience_available FROM item_artist ";
        }
        goto LABEL_283;
      }
      objc_msgSend(@"SELECT item_artist, sort_item_artist, series_name, sort_series_name, rowid, store_id, IFNULL(sort_item_artist, ML3SortString(item_artist)), IFNULL(IFNULL(sort_series_name, ML3SortString(series_name)), IFNULL(sort_item_artist, ML3SortString(item_artist))), sync_id, classical_experience_available FROM item_artist ", "stringByAppendingString:", @"WHERE(ROWID = ? OR sync_id = ?)");
      v183 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v184 = [NSNumber numberWithLongLong:v198];
      v284.__r_.__value_.__r.__words[0] = (std::string::size_type)v184;
      v185 = [NSNumber numberWithLongLong:v198];
      v284.__r_.__value_.__l.__size_ = (std::string::size_type)v185;
      uint64_t v186 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v284 count:2];
    }
    v187 = (void *)v186;

LABEL_283:
    v188 = [*(id *)(a2 + 16) executeQuery:v183 withParameters:v187];
    v275.__r_.__value_.__r.__words[0] = MEMORY[0x1E4F143A8];
    v275.__r_.__value_.__l.__size_ = 3221225472;
    v275.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN16ML3ImportSession22_getExistingArtistInfoEP6NSDatax_block_invoke;
    v276 = &unk_1E5FB76C8;
    uint64_t v279 = a2;
    v278 = buf;
    id v277 = v45;
    uint64_t v280 = v198;
    [v188 enumerateRowsWithBlock:&v275];

    v46 = *(unsigned char **)&buf[8];
    uint64_t v182 = *(void *)(*(void *)&buf[8] + 48);
LABEL_284:
    uint64_t v189 = *((void *)v46 + 7);
    if (v189) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v189 + 8), 1uLL, memory_order_relaxed);
    }
    _Block_object_dispose(buf, 8);
    if (v283) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v283);
    }

    *(void *)&long long v190 = v182;
    *((void *)&v190 + 1) = v189;
    v191 = (std::__shared_weak_count *)v254[7];
    *((_OWORD *)v254 + 3) = v190;
    if (v191) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v191);
    }
  }
  if (!v254[6])
  {
    if ([v248[5] length])
    {
      uint64_t IntegerUUID = v198;
      if (!v198) {
        uint64_t IntegerUUID = ML3CreateIntegerUUID();
      }
      v52 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = (std::string::__raw *)&v241[2];
        if (SHIBYTE(v241[2].__r_.__value_.__r.__words[2]) < 0) {
          v53 = (std::string::__raw *)v53->__words[0];
        }
        v54 = v236 + 6;
        if (*((char *)v236 + 71) < 0) {
          v54 = (void *)*v54;
        }
        v55 = v231 + 6;
        if (*((char *)v231 + 71) < 0) {
          v55 = (void *)*v55;
        }
        v56 = v226 + 6;
        if (*((char *)v226 + 71) < 0) {
          v56 = (void *)*v56;
        }
        *(_DWORD *)buf = 134219010;
        *(void *)&buf[4] = IntegerUUID;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v53;
        *(_WORD *)&buf[22] = 2082;
        *(void *)&buf[24] = v54;
        *(_WORD *)v282 = 2082;
        *(void *)&v282[2] = v55;
        *(_WORD *)&v282[10] = 2082;
        *(void *)&v282[12] = v56;
        _os_log_impl(&dword_1B022D000, v52, OS_LOG_TYPE_DEFAULT, "creating new artist entry: pid=%lld, name='%{public}s', sortName='%{public}s', series='%{public}s', sortSeries='%{public}s'", buf, 0x34u);
      }

      v57 = v241;
      v58 = (std::string::__raw *)&v241[2];
      v59 = v236;
      v60 = (std::string *)(v236 + 6);
      v61 = v231;
      v62 = v226;
      uint64_t v63 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(a2, (uint64_t)(v236 + 6), (uint64_t)&v241[2]);
      uint64_t v193 = v64;
      uint64_t v194 = v63;
      uint64_t v65 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(a2, (uint64_t)(v226 + 6), (uint64_t)(v231 + 6));
      uint64_t v67 = v66;
      v69 = operator new(0xD8uLL);
      v69[1] = 0;
      v69[2] = 0;
      void *v69 = &unk_1F08C7528;
      if (SHIBYTE(v57[2].__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)buf, v57[2].__r_.__value_.__l.__data_, v57[2].__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)buf = *(_OWORD *)v58->__words;
        *(void *)&buf[16] = v58->__words[2];
      }
      if (*((char *)v59 + 71) < 0) {
        std::string::__init_copy_ctor_external(&v275, (const std::string::value_type *)v59[6], (std::string::size_type)v59[7]);
      }
      else {
        std::string v275 = *v60;
      }
      if (*((char *)v61 + 71) < 0) {
        std::string::__init_copy_ctor_external(&v284, (const std::string::value_type *)v61[6], (std::string::size_type)v61[7]);
      }
      else {
        std::string v284 = *(std::string *)((unsigned char *)v61 + 2);
      }
      if (*((char *)v62 + 71) < 0) {
        std::string::__init_copy_ctor_external(&v263, (const std::string::value_type *)v62[6], (std::string::size_type)v62[7]);
      }
      else {
        std::string v263 = *(std::string *)((unsigned char *)v62 + 2);
      }
      long long v261 = 0uLL;
      uint64_t v262 = 0;
      ML3ArtistData::ML3ArtistData((uint64_t)(v69 + 3), IntegerUUID, (long long *)buf, (long long *)&v275, (long long *)&v284, (long long *)&v263, v195, v68, v194, v193, v65, v67, v198, &v261, v197 != 0, 0, 0);
      if (SHIBYTE(v263.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v263.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v284.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v284.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v275.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v275.__r_.__value_.__l.__data_);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      *(void *)&long long v71 = v69 + 3;
      *((void *)&v71 + 1) = v69;
      v72 = (std::__shared_weak_count *)v254[7];
      *((_OWORD *)v254 + 3) = v71;
      if (v72) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v72);
      }
      std::allocate_shared[abi:ne180100]<ML3ArtistImportItem,std::allocator<ML3ArtistImportItem>,std::shared_ptr<ML3ArtistData> &,NSData * {__strong}&,long long &,void>(&v275, v254[6], (std::__shared_weak_count *)v254[7], v248 + 5, &v224);
      *(void *)buf = IntegerUUID;
      *(_OWORD *)&buf[8] = *(_OWORD *)&v275.__r_.__value_.__l.__data_;
      std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t *)(a2 + 1840), IntegerUUID, (uint64_t)buf);
      if (*(void *)&buf[16]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[16]);
      }
      ML3CPPStringFromData((NSData *)&v275, v248[5]);
      *(_OWORD *)buf = *(_OWORD *)&v275.__r_.__value_.__l.__data_;
      std::string::size_type v73 = v275.__r_.__value_.__r.__words[2];
      memset(&v275, 0, sizeof(v275));
      uint64_t v75 = v254[6];
      uint64_t v74 = v254[7];
      *(void *)&buf[16] = v73;
      *(void *)&buf[24] = v75;
      *(void *)v282 = v74;
      if (v74) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v74 + 8), 1uLL, memory_order_relaxed);
      }
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3ArtistData>>>(a2 + 1088, buf, (uint64_t)buf);
      if (*(void *)v282) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)v282);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (SHIBYTE(v275.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v275.__r_.__value_.__l.__data_);
      }
    }
    goto LABEL_247;
  }
  uint64_t v33 = *(int *)(a2 + 32);
  uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(10, 167772161);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__specialRules + 56 * PropertyIndex + 4 * v33) != -1)
  {
    uint64_t v35 = v254[6];
    uint64_t v36 = HIBYTE(v241[2].__r_.__value_.__r.__words[2]);
    if ((v36 & 0x80u) == 0) {
      std::string::size_type size = HIBYTE(v241[2].__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v241[2].__r_.__value_.__l.__size_;
    }
    uint64_t v38 = *(unsigned __int8 *)(v35 + 31);
    int v39 = (char)v38;
    if ((v38 & 0x80u) != 0) {
      uint64_t v38 = *(void *)(v35 + 16);
    }
    if (size == v38)
    {
      p_data = (const void **)&v241[2].__r_.__value_.__l.__data_;
      v43 = *(unsigned __int8 **)(v35 + 8);
      v41 = (unsigned __int8 *)(v35 + 8);
      v42 = v43;
      if (v39 >= 0) {
        v44 = v41;
      }
      else {
        v44 = v42;
      }
      if ((v36 & 0x80) != 0)
      {
        if (!memcmp(*p_data, v44, v241[2].__r_.__value_.__l.__size_)) {
          goto LABEL_114;
        }
      }
      else
      {
        if (!*((unsigned char *)&v241[2].__r_.__value_.__s + 23)) {
          goto LABEL_114;
        }
        while (*(unsigned __int8 *)p_data == *v44)
        {
          p_data = (const void **)((char *)p_data + 1);
          ++v44;
          if (!--v36) {
            goto LABEL_114;
          }
        }
      }
    }
    v76 = (std::__shared_weak_count *)a3[1];
    v205[0] = *a3;
    v205[1] = v76;
    if (v76) {
      atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v205, 0xA000001u);
    if (v76) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v76);
    }
    if ((shouldPreserveTrackProperty & 1) == 0)
    {
      v78 = *(void **)(a2 + 16);
      v79 = ML3CPPBridgeString((const UInt8 *)&v241[2], 1);
      v272[0] = v79;
      v80 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v272[1] = v80;
      v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v272 count:2];
      [v78 executeUpdate:@"UPDATE item_artist SET item_artist = ? WHERE ROWID = ?" withParameters:v81 error:0];

      std::string::operator=((std::string *)(v254[6] + 8), v241 + 2);
    }
  }
LABEL_114:
  uint64_t v82 = *(int *)(a2 + 32);
  uint64_t v83 = ML3TrackRulesGetPropertyIndex(10, 167772167);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__specialRules + 56 * v83 + 4 * v82) != -1)
  {
    v84 = (void *)*((unsigned __int8 *)v236 + 71);
    if (*((char *)v236 + 71) < 0)
    {
      if (!v236[7]) {
        goto LABEL_135;
      }
    }
    else if (!*((unsigned char *)v236 + 71))
    {
LABEL_135:
      if ((v84 & 0x80) != 0) {
        v84 = v236[7];
      }
      goto LABEL_139;
    }
    uint64_t v85 = v254[6];
    v86 = v236[7];
    if ((char)v84 >= 0) {
      v87 = (void *)*((unsigned __int8 *)v236 + 71);
    }
    else {
      v87 = v236[7];
    }
    v88 = (void *)*(unsigned __int8 *)(v85 + 55);
    int v89 = (char)v88;
    if ((char)v88 < 0) {
      v88 = *(void **)(v85 + 40);
    }
    if (v87 == v88)
    {
      v90 = (const void **)(v236 + 6);
      if (v89 >= 0) {
        v91 = (unsigned __int8 *)(v85 + 32);
      }
      else {
        v91 = *(unsigned __int8 **)(v85 + 32);
      }
      if ((v84 & 0x80) != 0)
      {
        int v93 = memcmp(*v90, v91, (size_t)v236[7]);
        v84 = v86;
        if (!v93)
        {
LABEL_139:
          if (v84) {
            goto LABEL_157;
          }
          uint64_t v85 = v254[6];
          LOBYTE(v89) = *(unsigned char *)(v85 + 55);
LABEL_141:
          if ((v89 & 0x80) != 0)
          {
            if (!*(void *)(v85 + 40)) {
              goto LABEL_157;
            }
          }
          else if (!(_BYTE)v89)
          {
            goto LABEL_157;
          }
        }
      }
      else
      {
        if (!*((unsigned char *)v236 + 71)) {
          goto LABEL_141;
        }
        uint64_t v92 = *((unsigned __int8 *)v236 + 71);
        while (*(unsigned __int8 *)v90 == *v91)
        {
          v90 = (const void **)((char *)v90 + 1);
          ++v91;
          if (!--v92) {
            goto LABEL_135;
          }
        }
      }
    }
    v94 = (std::__shared_weak_count *)a3[1];
    v204[0] = *a3;
    v204[1] = v94;
    if (v94) {
      atomic_fetch_add_explicit(&v94->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v95 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v204, 0xA000007u);
    if (v94) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v94);
    }
    if ((v95 & 1) == 0)
    {
      if (*((char *)v236 + 71) < 0) {
        v96 = v236[7];
      }
      else {
        v96 = (void *)*((unsigned __int8 *)v236 + 71);
      }
      v97 = *(void **)(a2 + 16);
      if (v96) {
        ML3CPPBridgeString((const UInt8 *)v236 + 48, 1);
      }
      else {
      v98 = [MEMORY[0x1E4F1CA98] null];
      }
      v271[0] = v98;
      v99 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v271[1] = v99;
      v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v271 count:2];
      [v97 executeUpdate:@"UPDATE item_artist SET sort_item_artist = ? WHERE ROWID = ?" withParameters:v100 error:0];

      std::string::operator=((std::string *)(v254[6] + 32), (const std::string *)v236 + 2);
      uint64_t v101 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(a2, (uint64_t)(v236 + 6), (uint64_t)&v241[2]);
      uint64_t v102 = v254[6];
      *(void *)(v102 + 112) = v101;
      *(void *)(v102 + 120) = v103;
      v104 = *(void **)(a2 + 16);
      v105 = [NSNumber numberWithLongLong:v101];
      v270[0] = v105;
      v106 = [NSNumber numberWithInteger:*(void *)(v254[6] + 120)];
      v270[1] = v106;
      v107 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v270[2] = v107;
      v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v270 count:3];
      [v104 executeUpdate:@"UPDATE item SET item_artist_order=?, item_artist_order_section=? WHERE item_artist_pid=?", v108, 0 withParameters error];
    }
  }
LABEL_157:
  uint64_t v109 = *(int *)(a2 + 32);
  uint64_t v110 = ML3TrackRulesGetPropertyIndex(10, 167772162);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__specialRules + 56 * v110 + 4 * v109) != -1)
  {
    uint64_t v111 = v254[6];
    uint64_t v112 = *((unsigned __int8 *)v231 + 71);
    if ((v112 & 0x80u) == 0) {
      v113 = (void *)*((unsigned __int8 *)v231 + 71);
    }
    else {
      v113 = v231[7];
    }
    v114 = (void *)*(unsigned __int8 *)(v111 + 79);
    int v115 = (char)v114;
    if ((char)v114 < 0) {
      v114 = *(void **)(v111 + 64);
    }
    if (v113 == v114)
    {
      v116 = (const void **)(v231 + 6);
      v119 = *(unsigned __int8 **)(v111 + 56);
      v117 = (unsigned __int8 *)(v111 + 56);
      v118 = v119;
      if (v115 >= 0) {
        v120 = v117;
      }
      else {
        v120 = v118;
      }
      if ((v112 & 0x80) != 0)
      {
        if (!memcmp(*v116, v120, (size_t)v231[7])) {
          goto LABEL_181;
        }
      }
      else
      {
        if (!*((unsigned char *)v231 + 71)) {
          goto LABEL_181;
        }
        while (*(unsigned __int8 *)v116 == *v120)
        {
          v116 = (const void **)((char *)v116 + 1);
          ++v120;
          if (!--v112) {
            goto LABEL_181;
          }
        }
      }
    }
    v121 = (std::__shared_weak_count *)a3[1];
    v203[0] = *a3;
    v203[1] = v121;
    if (v121) {
      atomic_fetch_add_explicit(&v121->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v122 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v203, 0xA000002u);
    if (v121) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v121);
    }
    if ((v122 & 1) == 0)
    {
      v123 = *(void **)(a2 + 16);
      v124 = ML3CPPBridgeString((const UInt8 *)v231 + 48, 1);
      v269[0] = v124;
      v125 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v269[1] = v125;
      v126 = [MEMORY[0x1E4F1C978] arrayWithObjects:v269 count:2];
      [v123 executeUpdate:@"UPDATE item_artist SET series_name = ? WHERE ROWID = ?" withParameters:v126 error:0];

      std::string::operator=((std::string *)(v254[6] + 56), (const std::string *)v231 + 2);
    }
  }
LABEL_181:
  uint64_t v127 = *(int *)(a2 + 32);
  uint64_t v128 = ML3TrackRulesGetPropertyIndex(10, 167772168);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__specialRules + 56 * v128 + 4 * v127) == -1) {
    goto LABEL_223;
  }
  v129 = (void *)*((unsigned __int8 *)v226 + 71);
  if (*((char *)v226 + 71) < 0)
  {
    if (!v226[7]) {
      goto LABEL_202;
    }
  }
  else if (!*((unsigned char *)v226 + 71))
  {
LABEL_202:
    if ((v129 & 0x80) != 0) {
      v129 = v226[7];
    }
LABEL_205:
    if (v129) {
      goto LABEL_223;
    }
    uint64_t v130 = v254[6];
    LOBYTE(v134) = *(unsigned char *)(v130 + 103);
    goto LABEL_207;
  }
  uint64_t v130 = v254[6];
  v131 = v226[7];
  if ((char)v129 >= 0) {
    v132 = (void *)*((unsigned __int8 *)v226 + 71);
  }
  else {
    v132 = v226[7];
  }
  v133 = (void *)*(unsigned __int8 *)(v130 + 103);
  int v134 = (char)v133;
  if ((char)v133 < 0) {
    v133 = *(void **)(v130 + 88);
  }
  if (v132 != v133) {
    goto LABEL_211;
  }
  v135 = (const void **)(v226 + 6);
  if (v134 >= 0) {
    v136 = (unsigned __int8 *)(v130 + 80);
  }
  else {
    v136 = *(unsigned __int8 **)(v130 + 80);
  }
  if ((v129 & 0x80) != 0)
  {
    int v138 = memcmp(*v135, v136, (size_t)v226[7]);
    v129 = v131;
    if (v138) {
      goto LABEL_211;
    }
    goto LABEL_205;
  }
  if (*((unsigned char *)v226 + 71))
  {
    uint64_t v137 = *((unsigned __int8 *)v226 + 71);
    while (*(unsigned __int8 *)v135 == *v136)
    {
      v135 = (const void **)((char *)v135 + 1);
      ++v136;
      if (!--v137) {
        goto LABEL_202;
      }
    }
    goto LABEL_211;
  }
LABEL_207:
  if ((v134 & 0x80) != 0)
  {
    if (!*(void *)(v130 + 88)) {
      goto LABEL_223;
    }
LABEL_211:
    v139 = (std::__shared_weak_count *)a3[1];
    v202[0] = *a3;
    v202[1] = v139;
    if (v139) {
      atomic_fetch_add_explicit(&v139->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v140 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v202, 0xA000008u);
    if (v139) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v139);
    }
    if ((v140 & 1) == 0)
    {
      if (*((char *)v226 + 71) < 0) {
        v141 = v226[7];
      }
      else {
        v141 = (void *)*((unsigned __int8 *)v226 + 71);
      }
      v142 = *(void **)(a2 + 16);
      if (v141) {
        ML3CPPBridgeString((const UInt8 *)v226 + 48, 1);
      }
      else {
      v143 = [MEMORY[0x1E4F1CA98] null];
      }
      v268[0] = v143;
      v144 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v268[1] = v144;
      v145 = [MEMORY[0x1E4F1C978] arrayWithObjects:v268 count:2];
      [v142 executeUpdate:@"UPDATE item_artist SET sort_series_name = ? WHERE ROWID = ?" withParameters:v145 error:0];

      std::string::operator=((std::string *)(v254[6] + 80), (const std::string *)v226 + 2);
      uint64_t v146 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(a2, (uint64_t)(v226 + 6), (uint64_t)(v231 + 6));
      uint64_t v147 = v254[6];
      *(void *)(v147 + 128) = v146;
      *(void *)(v147 + 136) = v148;
      v149 = *(void **)(a2 + 16);
      v150 = [NSNumber numberWithLongLong:v146];
      v267[0] = v150;
      v151 = [NSNumber numberWithInteger:*(void *)(v254[6] + 136)];
      v267[1] = v151;
      v152 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v267[2] = v152;
      v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:v267 count:3];
      [v149 executeUpdate:@"UPDATE item SET series_name_order=?, series_name_order_section=? WHERE item_artist_pid=?", v153, 0 withParameters error];
    }
    goto LABEL_223;
  }
  if ((_BYTE)v134) {
    goto LABEL_211;
  }
LABEL_223:
  if (v195)
  {
    uint64_t v154 = v254[6];
    if (v195 != *(void *)(v154 + 104))
    {
      *(void *)(v154 + 104) = v195;
      v155 = *(void **)(a2 + 16);
      v156 = objc_msgSend(NSNumber, "numberWithLongLong:");
      v266[0] = v156;
      v157 = [NSNumber numberWithLongLong:*(void *)v254[6]];
      v266[1] = v157;
      v158 = [MEMORY[0x1E4F1C978] arrayWithObjects:v266 count:2];
      [v155 executeUpdate:@"UPDATE item_artist SET store_id = ? WHERE ROWID = ?" withParameters:v158 error:0];
    }
  }
  if (v198 && v198 != *(void *)(v254[6] + 144))
  {
    uint64_t v159 = *(int *)(a2 + 32);
    uint64_t v160 = ML3TrackRulesGetPropertyIndex(10, 167772176);
    if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
      dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
    }
    if (*(_DWORD *)(__specialRules + 56 * v160 + 4 * v159) != -1)
    {
      v161 = (std::__shared_weak_count *)a3[1];
      v201[0] = *a3;
      v201[1] = v161;
      if (v161) {
        atomic_fetch_add_explicit(&v161->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v162 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v201, 0xA000010u);
      if (v161) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v161);
      }
      if ((v162 & 1) == 0)
      {
        v163 = *(void **)(a2 + 16);
        v164 = [NSNumber numberWithLongLong:v198];
        v265[0] = v164;
        v165 = [NSNumber numberWithLongLong:*(void *)v254[6]];
        v265[1] = v165;
        v166 = [MEMORY[0x1E4F1C978] arrayWithObjects:v265 count:2];
        [v163 executeUpdate:@"UPDATE item_artist SET sync_id = ? WHERE ROWID = ?" withParameters:v166 error:0];

        *(void *)(v254[6] + 144) = v198;
      }
    }
  }
  if (*(unsigned char *)(v254[6] + 176) != (v197 != 0))
  {
    uint64_t v167 = *(int *)(a2 + 32);
    uint64_t v168 = ML3TrackRulesGetPropertyIndex(19, 318767118);
    if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
      dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
    }
    if (*(_DWORD *)(__artistRules + 56 * v168 + 4 * v167) != -1)
    {
      v169 = (std::__shared_weak_count *)a3[1];
      v200[0] = *a3;
      v200[1] = v169;
      if (v169) {
        atomic_fetch_add_explicit(&v169->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v170 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v200, 0x1300000Eu);
      if (v169) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v169);
      }
      if ((v170 & 1) == 0)
      {
        v171 = *(void **)(a2 + 16);
        v172 = [NSNumber numberWithBool:v197 != 0];
        v264[0] = v172;
        v173 = [NSNumber numberWithLongLong:*(void *)v254[6]];
        v264[1] = v173;
        v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v264 count:2];
        [v171 executeUpdate:@"UPDATE item_artist SET classical_experience_available = ? WHERE ROWID = ?" withParameters:v174 error:0];

        *(void *)(v254[6] + 144) = v198;
      }
    }
  }
LABEL_247:
  uint64_t v175 = v254[7];
  *a1 = v254[6];
  a1[1] = v175;
  if (v175) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v175 + 8), 1uLL, memory_order_relaxed);
  }
LABEL_249:
  _Block_object_dispose(&v225, 8);
  if (SHIBYTE(v229.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v229.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v230, 8);
  if (SHIBYTE(v234.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v234.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v235, 8);
  if (SHIBYTE(v239.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v239.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v240, 8);
  if (SHIBYTE(v246.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v246.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v247, 8);

  _Block_object_dispose(&v253, 8);
  if (v260) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v260);
  }
}

void sub_1B0461798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,void *__p,uint64_t a61,int a62,__int16 a63)
{
  _Block_object_dispose((const void *)(v78 - 208), 8);
  v80 = *(std::__shared_weak_count **)(v78 - 152);
  if (v80) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v80);
  }

  _Block_object_dispose(&a54, 8);
  if (a65 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a66, 8);
  if (a73 < 0) {
    operator delete(a72);
  }
  _Block_object_dispose(&a74, 8);
  if (SLOBYTE(STACK[0x23F]) < 0) {
    operator delete((void *)STACK[0x228]);
  }
  _Block_object_dispose(&STACK[0x240], 8);
  if (SLOBYTE(STACK[0x287]) < 0) {
    operator delete((void *)STACK[0x270]);
  }
  _Block_object_dispose(&STACK[0x288], 8);

  _Block_object_dispose(&STACK[0x2B8], 8);
  if (STACK[0x2F0]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)STACK[0x2F0]);
  }
  _Unwind_Resume(a1);
}

void ML3ImportSession::_getAlbumArtistInfo(void *a1, uint64_t a2, void *a3)
{
  uint64_t v236 = *MEMORY[0x1E4F143B8];
  uint64_t v204 = 0;
  v205 = &v204;
  uint64_t v206 = 0x4012000000;
  id v207 = __Block_byref_object_copy__283;
  v208 = __Block_byref_object_dispose__284;
  v209 = "";
  v211 = 0;
  uint64_t v210 = 0;
  uint64_t v198 = 0;
  v199 = (void **)&v198;
  uint64_t v200 = 0x3032000000;
  v201 = __Block_byref_object_copy__286;
  v202 = __Block_byref_object_dispose__287;
  id v203 = 0;
  uint64_t v162 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 167772181);
  uint64_t v191 = 0;
  v192 = (const std::string *)&v191;
  uint64_t v193 = 0x4812000000;
  uint64_t v194 = __Block_byref_object_copy__288;
  uint64_t v195 = __Block_byref_object_dispose__289;
  uint64_t v196 = 0;
  (*(void (**)(void **__return_ptr))(*(void *)*a3 + 152))(&v186);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v197, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    uint64_t v186 = &unk_1F08C3230;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v197 = __p;
  }
  uint64_t v186 = 0;
  v187 = &v186;
  __p.__r_.__value_.__r.__words[0] = 0x4812000000;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)__Block_byref_object_copy__288;
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)__Block_byref_object_dispose__289;
  uint64_t v189 = 0;
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 160))(buf);
  if (SBYTE7(v231) < 0)
  {
    std::string::__init_copy_ctor_external(&v190, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v231) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&v190.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    v190.__r_.__value_.__r.__words[2] = v231;
  }
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 24))(buf);
  if (SBYTE7(v231) < 0)
  {
    std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v231) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    __str.__r_.__value_.__r.__words[2] = v231;
  }
  v164 = a1;
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 167772177);
  uint64_t v163 = *(void *)(*a3 + 8);
  uint64_t v165 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 301989901);
  int v161 = v165 != 0;
  uint64_t v166 = v6;
  if (*(unsigned char *)(*a3 + 16) && !*(unsigned char *)(*a3 + 17))
  {
    v13 = *(void **)(a2 + 16);
    v14 = [NSNumber numberWithLongLong:v163];
    BOOL v223 = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v223 count:1];
    id v16 = [v13 executeQuery:@"SELECT album_artist_pid FROM item WHERE ROWID = ?" withParameters:v15];

    unint64_t v17 = [v16 objectForFirstRowAndColumn];
    if ([v17 longLongValue])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&buf[24] = 0;
      char v18 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772163);
      char v19 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772169);
      v20 = *(void **)(a2 + 16);
      char v222 = v17;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v222 count:1];
      v22 = [v20 executeQuery:@"SELECT album_artist, sort_album_artist, representative_item_pid, store_id, grouping_key, sync_id, cloud_universal_library_id, classical_experience_available, liked_state, liked_state_changed_date FROM album_artist WHERE album_artist_pid=?", v21 withParameters];
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3321888768;
      v172[2] = ___ZN16ML3ImportSession19_getAlbumArtistInfoENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke;
      v172[3] = &unk_1F08C8748;
      char v183 = v18;
      char v184 = v19;
      v174 = &v191;
      uint64_t v175 = &v186;
      v176 = buf;
      v177 = &v198;
      uint64_t v24 = *a3;
      char v23 = (std::__shared_weak_count *)a3[1];
      uint64_t v179 = a2;
      uint64_t v180 = v24;
      v181 = v23;
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v178 = &v204;
      id v173 = v17;
      uint64_t v182 = v163;
      [v22 enumerateRowsWithBlock:v172];

      if (v181) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v181);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      char v25 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v163;
        _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_ERROR, "No existing albumArtist PID for update item %lli", buf, 0xCu);
      }
    }
    unint64_t v12 = v166;
  }
  else
  {
    BOOL v7 = *(void **)(a2 + 8);
    uint64_t v8 = ML3CPPBridgeString((const UInt8 *)&v192[2], 0);
    uint64_t v9 = [v7 groupingKeyForString:v8];
    uint64_t v10 = v199[5];
    v199[5] = (void *)v9;

    if (SHIBYTE(v192[2].__r_.__value_.__r.__words[2]) < 0) {
      std::string::size_type size = v192[2].__r_.__value_.__l.__size_;
    }
    else {
      std::string::size_type size = HIBYTE(v192[2].__r_.__value_.__r.__words[2]);
    }
    unint64_t v12 = v166;
    if (!size || !v199[5])
    {
      *a1 = 0;
      a1[1] = 0;
      goto LABEL_198;
    }
  }
  if (!v205[6] && [v199[5] length])
  {
    id v38 = v199[5];
    int v39 = buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4012000000;
    *(void *)&buf[24] = __Block_byref_object_copy__283;
    *(void *)&long long v231 = __Block_byref_object_dispose__284;
    *((void *)&v231 + 1) = "";
    uint64_t v232 = 0;
    uint64_t v233 = 0;
    if (v12)
    {
      v40 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>((void *)(a2 + 1048), v12);
      if (v40)
      {
        uint64_t v42 = v40[3];
        v41 = (std::__shared_weak_count *)v40[4];
        if (v41)
        {
          atomic_fetch_add_explicit(&v41->__shared_owners_, 1uLL, memory_order_relaxed);
          v43 = v233;
          uint64_t v232 = v42;
          uint64_t v233 = v41;
          if (v43) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v43);
          }
        }
        else
        {
          uint64_t v232 = v40[3];
          uint64_t v233 = 0;
        }
        v142 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v224.__r_.__value_.__l.__data_) = 134218240;
          *(std::string::size_type *)((char *)v224.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          WORD2(v224.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v224.__r_.__value_.__r.__words[1] + 6) = v12;
          _os_log_impl(&dword_1B022D000, v142, OS_LOG_TYPE_DEFAULT, "Found album artist with grouping key=%p, sourceID=%lld", (uint8_t *)&v224, 0x16u);
        }

        int v39 = *(unsigned char **)&buf[8];
        uint64_t v60 = *(void *)(*(void *)&buf[8] + 48);
        unint64_t v12 = v166;
      }
      else
      {
        uint64_t v60 = 0;
        int v39 = buf;
      }
    }
    else
    {
      uint64_t v60 = 0;
    }
    if (v38 && !v60)
    {
      ML3CPPStringFromData((NSData *)&v224, v38);
      v143 = std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::find<std::string>((void *)(a2 + 1128), (unsigned __int8 *)&v224);
      if (SHIBYTE(v224.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v224.__r_.__value_.__l.__data_);
      }
      int v39 = *(unsigned char **)&buf[8];
      if (v143)
      {
        uint64_t v145 = *((void *)v143 + 5);
        uint64_t v144 = *((void *)v143 + 6);
        if (v144) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v144 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v146 = (std::__shared_weak_count *)*((void *)v39 + 7);
        *((void *)v39 + 6) = v145;
        *((void *)v39 + 7) = v144;
        if (v146) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v146);
        }
        uint64_t v147 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v224.__r_.__value_.__l.__data_) = 134217984;
          *(std::string::size_type *)((char *)v224.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
          _os_log_impl(&dword_1B022D000, v147, OS_LOG_TYPE_DEFAULT, "Found album artist with grouping key=%p", (uint8_t *)&v224, 0xCu);
        }

        int v39 = *(unsigned char **)&buf[8];
        unint64_t v12 = v166;
      }
    }
    uint64_t v148 = *((void *)v39 + 6);
    if (v148) {
      goto LABEL_231;
    }
    if (v38 && v12)
    {
      uint64_t v149 = objc_msgSend(@"SELECT album_artist, sort_album_artist, rowid, store_id, IFNULL(sort_album_artist, ML3SortString(album_artist)), sync_id, cloud_universal_library_id, classical_experience_available, liked_state, liked_state_changed_date, sort_order, sort_order_section FROM album_artist ", "stringByAppendingString:", @"WHERE (ROWID = ? OR sync_id = ?) OR grouping_key = ?");
      v150 = [NSNumber numberWithLongLong:v166];
      uint64_t v160 = (__CFString *)v149;
      *(void *)&long long v234 = v150;
      v151 = [NSNumber numberWithLongLong:v166];
      *((void *)&v234 + 1) = v151;
      id v235 = v38;
      uint64_t v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v234 count:3];
    }
    else
    {
      if (!v12)
      {
        if (v38)
        {
          uint64_t v159 = objc_msgSend(@"SELECT album_artist, sort_album_artist, rowid, store_id, IFNULL(sort_album_artist, ML3SortString(album_artist)), sync_id, cloud_universal_library_id, classical_experience_available, liked_state, liked_state_changed_date, sort_order, sort_order_section FROM album_artist ", "stringByAppendingString:", @"WHERE grouping_key = ?");
          *(void *)&long long v234 = v38;
          uint64_t v154 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v234 count:1];
          uint64_t v160 = (__CFString *)v159;
          [*(id *)(a2 + 16) executeQuery:v159 withParameters:v154];
        }
        else
        {
          uint64_t v154 = 0;
          uint64_t v160 = @"SELECT album_artist, sort_album_artist, rowid, store_id, IFNULL(sort_album_artist, ML3SortString(album_artist)), sync_id, cloud_universal_library_id, classical_experience_available, liked_state, liked_state_changed_date, sort_order, sort_order_section FROM album_artist ";
          [*(id *)(a2 + 16) executeQuery:@"SELECT album_artist, sort_album_artist, rowid, store_id, IFNULL(sort_album_artist, ML3SortString(album_artist)), sync_id, cloud_universal_library_id, classical_experience_available, liked_state, liked_state_changed_date, sort_order, sort_order_section FROM album_artist ", 0 withParameters];
        }
        goto LABEL_230;
      }
      uint64_t v153 = objc_msgSend(@"SELECT album_artist, sort_album_artist, rowid, store_id, IFNULL(sort_album_artist, ML3SortString(album_artist)), sync_id, cloud_universal_library_id, classical_experience_available, liked_state, liked_state_changed_date, sort_order, sort_order_section FROM album_artist ", "stringByAppendingString:", @"WHERE (ROWID = ? OR sync_id = ?)");
      v150 = [NSNumber numberWithLongLong:v166];
      uint64_t v160 = (__CFString *)v153;
      *(void *)&long long v234 = v150;
      v151 = [NSNumber numberWithLongLong:v166];
      *((void *)&v234 + 1) = v151;
      uint64_t v152 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v234 count:2];
    }
    uint64_t v154 = (void *)v152;

    [*(id *)(a2 + 16) executeQuery:v160 withParameters:v154];
    v155 = LABEL_230:;
    v224.__r_.__value_.__r.__words[0] = MEMORY[0x1E4F143A8];
    v224.__r_.__value_.__l.__size_ = 3221225472;
    v224.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN16ML3ImportSession27_getExistingAlbumArtistInfoEP6NSDatax_block_invoke;
    v225 = &unk_1E5FB76C8;
    uint64_t v228 = a2;
    std::string v227 = buf;
    id v226 = v38;
    uint64_t v229 = v166;
    [v155 enumerateRowsWithBlock:&v224];

    int v39 = *(unsigned char **)&buf[8];
    uint64_t v148 = *(void *)(*(void *)&buf[8] + 48);
LABEL_231:
    uint64_t v156 = *((void *)v39 + 7);
    if (v156) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v156 + 8), 1uLL, memory_order_relaxed);
    }
    _Block_object_dispose(buf, 8);
    if (v233) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v233);
    }

    *(void *)&long long v157 = v148;
    *((void *)&v157 + 1) = v156;
    v158 = (std::__shared_weak_count *)v205[7];
    *((_OWORD *)v205 + 3) = v157;
    unint64_t v12 = v166;
    if (v158) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v158);
    }
  }
  if (!v205[6])
  {
    if ([v199[5] length])
    {
      uint64_t v44 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 16777217);
      __int16 v45 = MLMediaTypeByStandardizingMediaType(v44);
      uint64_t IntegerUUID = v12;
      if (!v12) {
        uint64_t IntegerUUID = ML3CreateIntegerUUID();
      }
      v47 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = (std::string::__raw *)&v192[2];
        if (SHIBYTE(v192[2].__r_.__value_.__r.__words[2]) < 0) {
          v48 = (std::string::__raw *)v48->__words[0];
        }
        uint64_t v49 = v187 + 6;
        if (*((char *)v187 + 71) < 0) {
          uint64_t v49 = (void *)*v49;
        }
        p_str = &__str;
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)buf = 134218754;
        *(void *)&buf[4] = IntegerUUID;
        *(_WORD *)&buf[12] = 2082;
        *(void *)&buf[14] = v48;
        *(_WORD *)&buf[22] = 2082;
        *(void *)&buf[24] = v49;
        LOWORD(v231) = 2082;
        *(void *)((char *)&v231 + 2) = p_str;
        _os_log_impl(&dword_1B022D000, v47, OS_LOG_TYPE_DEFAULT, "creating new album_artist entry: pid=%lld, name='%{public}s', sortName='%{public}s', ulid='%{public}s'", buf, 0x2Au);
      }

      v51 = v192;
      v52 = v187;
      v53 = (std::string *)(v187 + 6);
      v54 = (std::string::__raw *)&v192[2];
      uint64_t v55 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(a2, (uint64_t)(v187 + 6), (uint64_t)&v192[2]);
      uint64_t v57 = v56;
      v59 = operator new(0xD8uLL);
      v59[1] = 0;
      v59[2] = 0;
      void *v59 = &unk_1F08C7528;
      if (SHIBYTE(v51[2].__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)buf, v51[2].__r_.__value_.__l.__data_, v51[2].__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)buf = *(_OWORD *)v54->__words;
        *(void *)&buf[16] = v54->__words[2];
      }
      if (*((char *)v52 + 71) < 0) {
        std::string::__init_copy_ctor_external(&v224, (const std::string::value_type *)v52[6], (std::string::size_type)v52[7]);
      }
      else {
        std::string v224 = *v53;
      }
      long long v234 = 0uLL;
      id v235 = 0;
      uint64_t v214 = 0;
      long long v213 = 0uLL;
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v212, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      }
      else {
        std::string v212 = __str;
      }
      ML3ArtistData::ML3ArtistData((uint64_t)(v59 + 3), IntegerUUID, (long long *)buf, (long long *)&v224, &v234, &v213, v162, v58, v55, v57, 0, 0x7FFFFFFFFFFFFFFFLL, v166, (long long *)&v212, v165 != 0, 1, 0);
      if (SHIBYTE(v212.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v212.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v224.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v224.__r_.__value_.__l.__data_);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      *(void *)&long long v61 = v59 + 3;
      *((void *)&v61 + 1) = v59;
      v62 = (std::__shared_weak_count *)v205[7];
      *((_OWORD *)v205 + 3) = v61;
      if (v62) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v62);
      }
      uint64_t v63 = v205[6];
      uint64_t v64 = (std::__shared_weak_count *)v205[7];
      uint64_t v65 = v163;
      if ((v45 & 0x400) != 0) {
        uint64_t v65 = 0;
      }
      *(void *)&long long v234 = v65;
      std::allocate_shared[abi:ne180100]<ML3AlbumArtistImportItem,std::allocator<ML3AlbumArtistImportItem>,std::shared_ptr<ML3ArtistData> &,NSData * {__strong}&,long long,void>(&v224, v63, v64, v199 + 5, (uint64_t *)&v234);
      *(void *)buf = IntegerUUID;
      *(_OWORD *)&buf[8] = *(_OWORD *)&v224.__r_.__value_.__l.__data_;
      std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t *)(a2 + 2040), IntegerUUID, (uint64_t)buf);
      if (*(void *)&buf[16]) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[16]);
      }
      ML3CPPStringFromData((NSData *)&v224, v199[5]);
      *(_OWORD *)buf = *(_OWORD *)&v224.__r_.__value_.__l.__data_;
      std::string::size_type v66 = v224.__r_.__value_.__r.__words[2];
      memset(&v224, 0, sizeof(v224));
      uint64_t v68 = v205[6];
      uint64_t v67 = v205[7];
      *(void *)&buf[16] = v66;
      *(void *)&buf[24] = v68;
      *(void *)&long long v231 = v67;
      if (v67) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v67 + 8), 1uLL, memory_order_relaxed);
      }
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3ArtistData>>>(a2 + 1128, buf, (uint64_t)buf);
      if ((void)v231) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v231);
      }
      if ((buf[23] & 0x80000000) != 0) {
        operator delete(*(void **)buf);
      }
      if (SHIBYTE(v224.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v224.__r_.__value_.__l.__data_);
      }
    }
    goto LABEL_196;
  }
  uint64_t v26 = *(int *)(a2 + 32);
  uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(10, 167772163);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__specialRules + 56 * PropertyIndex + 4 * v26) != -1)
  {
    uint64_t v28 = v205[6];
    uint64_t v29 = HIBYTE(v192[2].__r_.__value_.__r.__words[2]);
    if ((v29 & 0x80u) == 0) {
      std::string::size_type v30 = HIBYTE(v192[2].__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v30 = v192[2].__r_.__value_.__l.__size_;
    }
    uint64_t v31 = *(unsigned __int8 *)(v28 + 31);
    int v32 = (char)v31;
    if ((v31 & 0x80u) != 0) {
      uint64_t v31 = *(void *)(v28 + 16);
    }
    if (v30 == v31)
    {
      p_data = (const void **)&v192[2].__r_.__value_.__l.__data_;
      uint64_t v36 = *(unsigned __int8 **)(v28 + 8);
      v34 = (unsigned __int8 *)(v28 + 8);
      uint64_t v35 = v36;
      if (v32 >= 0) {
        v37 = v34;
      }
      else {
        v37 = v35;
      }
      if ((v29 & 0x80) != 0)
      {
        if (!memcmp(*p_data, v37, v192[2].__r_.__value_.__l.__size_)) {
          goto LABEL_104;
        }
      }
      else
      {
        if (!*((unsigned char *)&v192[2].__r_.__value_.__s + 23)) {
          goto LABEL_104;
        }
        while (*(unsigned __int8 *)p_data == *v37)
        {
          p_data = (const void **)((char *)p_data + 1);
          ++v37;
          if (!--v29) {
            goto LABEL_104;
          }
        }
      }
    }
    v69 = (std::__shared_weak_count *)a3[1];
    v171[0] = *a3;
    v171[1] = v69;
    if (v69) {
      atomic_fetch_add_explicit(&v69->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v171, 0xA000003u);
    if (v69) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v69);
    }
    if ((shouldPreserveTrackProperty & 1) == 0)
    {
      long long v71 = *(void **)(a2 + 16);
      v72 = ML3CPPBridgeString((const UInt8 *)&v192[2], 1);
      v221[0] = v72;
      std::string::size_type v73 = [NSNumber numberWithLongLong:*(void *)v205[6]];
      v221[1] = v73;
      uint64_t v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v221 count:2];
      [v71 executeUpdate:@"UPDATE album_artist SET album_artist = ? WHERE ROWID = ?" withParameters:v74 error:0];

      std::string::operator=((std::string *)(v205[6] + 8), v192 + 2);
    }
  }
LABEL_104:
  uint64_t v75 = *(int *)(a2 + 32);
  uint64_t v76 = ML3TrackRulesGetPropertyIndex(10, 167772169);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__specialRules + 56 * v76 + 4 * v75) != -1)
  {
    v77 = (void *)*((unsigned __int8 *)v187 + 71);
    if (*((char *)v187 + 71) < 0)
    {
      if (!v187[7]) {
        goto LABEL_125;
      }
    }
    else if (!*((unsigned char *)v187 + 71))
    {
LABEL_125:
      if ((v77 & 0x80) != 0) {
        v77 = v187[7];
      }
      goto LABEL_129;
    }
    uint64_t v78 = v205[6];
    v79 = v187[7];
    if ((char)v77 >= 0) {
      v80 = (void *)*((unsigned __int8 *)v187 + 71);
    }
    else {
      v80 = v187[7];
    }
    v81 = (void *)*(unsigned __int8 *)(v78 + 55);
    int v82 = (char)v81;
    if ((char)v81 < 0) {
      v81 = *(void **)(v78 + 40);
    }
    if (v80 == v81)
    {
      uint64_t v83 = (const void **)(v187 + 6);
      if (v82 >= 0) {
        v84 = (unsigned __int8 *)(v78 + 32);
      }
      else {
        v84 = *(unsigned __int8 **)(v78 + 32);
      }
      if ((v77 & 0x80) != 0)
      {
        int v86 = memcmp(*v83, v84, (size_t)v187[7]);
        v77 = v79;
        if (!v86)
        {
LABEL_129:
          if (v77) {
            goto LABEL_147;
          }
          uint64_t v78 = v205[6];
          LOBYTE(v82) = *(unsigned char *)(v78 + 55);
          goto LABEL_131;
        }
      }
      else
      {
        if (!*((unsigned char *)v187 + 71))
        {
LABEL_131:
          if ((v82 & 0x80) != 0)
          {
            if (!*(void *)(v78 + 40)) {
              goto LABEL_147;
            }
          }
          else if (!(_BYTE)v82)
          {
            goto LABEL_147;
          }
          goto LABEL_135;
        }
        uint64_t v85 = *((unsigned __int8 *)v187 + 71);
        while (*(unsigned __int8 *)v83 == *v84)
        {
          uint64_t v83 = (const void **)((char *)v83 + 1);
          ++v84;
          if (!--v85) {
            goto LABEL_125;
          }
        }
      }
    }
LABEL_135:
    v87 = (std::__shared_weak_count *)a3[1];
    v170[0] = *a3;
    v170[1] = v87;
    if (v87) {
      atomic_fetch_add_explicit(&v87->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v88 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v170, 0xA000009u);
    if (v87) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v87);
    }
    if ((v88 & 1) == 0)
    {
      if (*((char *)v187 + 71) < 0) {
        int v89 = v187[7];
      }
      else {
        int v89 = (void *)*((unsigned __int8 *)v187 + 71);
      }
      v90 = *(void **)(a2 + 16);
      if (v89) {
        ML3CPPBridgeString((const UInt8 *)v187 + 48, 1);
      }
      else {
      v91 = [MEMORY[0x1E4F1CA98] null];
      }
      v220[0] = v91;
      uint64_t v92 = [NSNumber numberWithLongLong:*(void *)v205[6]];
      v220[1] = v92;
      int v93 = [MEMORY[0x1E4F1C978] arrayWithObjects:v220 count:2];
      [v90 executeUpdate:@"UPDATE album_artist SET sort_album_artist = ? WHERE ROWID = ?" withParameters:v93 error:0];

      std::string::operator=((std::string *)(v205[6] + 32), (const std::string *)v187 + 2);
      uint64_t v94 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(a2, (uint64_t)(v187 + 6), (uint64_t)&v192[2]);
      uint64_t v95 = v205[6];
      *(void *)(v95 + 112) = v94;
      *(void *)(v95 + 120) = v96;
      v97 = *(void **)(a2 + 16);
      v98 = [NSNumber numberWithLongLong:v94];
      v219[0] = v98;
      v99 = [NSNumber numberWithInteger:*(void *)(v205[6] + 120)];
      v219[1] = v99;
      v100 = [NSNumber numberWithLongLong:*(void *)v205[6]];
      v219[2] = v100;
      uint64_t v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v219 count:3];
      [v97 executeUpdate:@"UPDATE item SET album_artist_order=?, album_artist_order_section=? WHERE album_artist_pid=?", v101, 0 withParameters error];
    }
  }
LABEL_147:
  if (v162)
  {
    uint64_t v102 = v205[6];
    if (v162 != *(void *)(v102 + 104))
    {
      *(void *)(v102 + 104) = v162;
      uint64_t v103 = *(void **)(a2 + 16);
      v104 = objc_msgSend(NSNumber, "numberWithLongLong:");
      v218[0] = v104;
      v105 = [NSNumber numberWithLongLong:*(void *)v205[6]];
      v218[1] = v105;
      v106 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:2];
      [v103 executeUpdate:@"UPDATE album_artist SET store_id = ? WHERE ROWID = ?" withParameters:v106 error:0];
    }
  }
  if (v166 && v166 != *(void *)(v205[6] + 144))
  {
    uint64_t v107 = *(int *)(a2 + 32);
    uint64_t v108 = ML3TrackRulesGetPropertyIndex(18, 301989898);
    if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
      dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
    }
    if (*(_DWORD *)(__albumArtistRules + 56 * v108 + 4 * v107) != -1)
    {
      uint64_t v109 = (std::__shared_weak_count *)a3[1];
      v169[0] = *a3;
      v169[1] = v109;
      if (v109) {
        atomic_fetch_add_explicit(&v109->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v110 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v169, 0x1200000Au);
      if (v109) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v109);
      }
      if ((v110 & 1) == 0)
      {
        uint64_t v111 = *(void **)(a2 + 16);
        uint64_t v112 = [NSNumber numberWithLongLong:v166];
        v217[0] = v112;
        v113 = [NSNumber numberWithLongLong:*(void *)v205[6]];
        v217[1] = v113;
        v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:v217 count:2];
        [v111 executeUpdate:@"UPDATE album_artist SET sync_id = ? WHERE ROWID = ?" withParameters:v114 error:0];

        *(void *)(v205[6] + 144) = v166;
      }
    }
  }
  uint64_t v115 = *(int *)(a2 + 32);
  uint64_t v116 = ML3TrackRulesGetPropertyIndex(18, 301989899);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__albumArtistRules + 56 * v116 + 4 * v115) == -1) {
    goto LABEL_186;
  }
  uint64_t v117 = v205[6];
  uint64_t v118 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v119 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v119 = __str.__r_.__value_.__l.__size_;
  }
  uint64_t v120 = *(unsigned __int8 *)(v117 + 175);
  int v121 = (char)v120;
  if ((v120 & 0x80u) != 0) {
    uint64_t v120 = *(void *)(v117 + 160);
  }
  if (v119 != v120) {
    goto LABEL_180;
  }
  v124 = *(unsigned __int8 **)(v117 + 152);
  char v122 = (unsigned __int8 *)(v117 + 152);
  v123 = v124;
  if (v121 >= 0) {
    v125 = v122;
  }
  else {
    v125 = v123;
  }
  if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    if (memcmp(__str.__r_.__value_.__l.__data_, v125, __str.__r_.__value_.__l.__size_))
    {
LABEL_180:
      uint64_t v127 = (std::__shared_weak_count *)a3[1];
      v168[0] = *a3;
      v168[1] = v127;
      if (v127) {
        atomic_fetch_add_explicit(&v127->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v128 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v168, 0x1200000Bu);
      if (v127) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v127);
      }
      if ((v128 & 1) == 0)
      {
        v129 = *(void **)(a2 + 16);
        uint64_t v130 = ML3CPPBridgeString((const UInt8 *)&__str, 1);
        v216[0] = v130;
        v131 = [NSNumber numberWithLongLong:*(void *)v205[6]];
        v216[1] = v131;
        v132 = [MEMORY[0x1E4F1C978] arrayWithObjects:v216 count:2];
        [v129 executeUpdate:@"UPDATE album_artist SET cloud_universal_library_id = ? WHERE ROWID = ?" withParameters:v132 error:0];

        std::string::operator=((std::string *)(v205[6] + 152), &__str);
      }
    }
  }
  else if (*((unsigned char *)&__str.__r_.__value_.__s + 23))
  {
    v126 = &__str;
    while (v126->__r_.__value_.__s.__data_[0] == *v125)
    {
      v126 = (std::string *)((char *)v126 + 1);
      ++v125;
      if (!--v118) {
        goto LABEL_186;
      }
    }
    goto LABEL_180;
  }
LABEL_186:
  if (*(unsigned __int8 *)(v205[6] + 176) != v161)
  {
    uint64_t v133 = *(int *)(a2 + 32);
    uint64_t v134 = ML3TrackRulesGetPropertyIndex(18, 301989901);
    if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
      dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
    }
    if (*(_DWORD *)(__albumArtistRules + 56 * v134 + 4 * v133) != -1)
    {
      v135 = (std::__shared_weak_count *)a3[1];
      v167[0] = *a3;
      v167[1] = v135;
      if (v135) {
        atomic_fetch_add_explicit(&v135->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v136 = ML3ImportSession::_shouldPreserveTrackProperty(a2, (uint64_t)v167, 0x1200000Du);
      if (v135) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v135);
      }
      if ((v136 & 1) == 0)
      {
        uint64_t v137 = *(void **)(a2 + 16);
        int v138 = [NSNumber numberWithBool:v165 != 0];
        v215[0] = v138;
        v139 = [NSNumber numberWithLongLong:*(void *)v205[6]];
        v215[1] = v139;
        char v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v215 count:2];
        [v137 executeUpdate:@"UPDATE album_artist SET classical_experience_available = ? WHERE ROWID = ?" withParameters:v140 error:0];

        *(unsigned char *)(v205[6] + 176) = v161;
      }
    }
  }
LABEL_196:
  uint64_t v141 = v205[7];
  void *v164 = v205[6];
  v164[1] = v141;
  if (v141) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v141 + 8), 1uLL, memory_order_relaxed);
  }
LABEL_198:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v186, 8);
  if (SHIBYTE(v190.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v190.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v191, 8);
  if (SHIBYTE(v197.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v197.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v198, 8);

  _Block_object_dispose(&v204, 8);
  if (v211) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v211);
  }
}

void sub_1B04635EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62,uint64_t a63)
{
  _Block_object_dispose((const void *)(v77 - 208), 8);
  v79 = *(std::__shared_weak_count **)(v77 - 152);
  if (v79) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v79);
  }

  if (a54 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a56, 8);
  if (a67 < 0) {
    operator delete(a62);
  }
  _Block_object_dispose(&a68, 8);
  if (a73 < 0) {
    operator delete(a72);
  }
  _Block_object_dispose(&a74, 8);

  _Block_object_dispose(&STACK[0x220], 8);
  if (STACK[0x258]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)STACK[0x258]);
  }
  _Unwind_Resume(a1);
}

void ML3ImportSession::_getAlbumInfo(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  v396[1] = *MEMORY[0x1E4F143B8];
  uint64_t v374 = a4;
  uint64_t v366 = 0;
  v367 = &v366;
  uint64_t v368 = 0x4012000000;
  v369 = __Block_byref_object_copy__349;
  v370 = __Block_byref_object_dispose__350;
  v371 = "";
  v373 = 0;
  uint64_t v372 = 0;
  uint64_t v360 = 0;
  v361 = &v360;
  uint64_t v362 = 0x3032000000;
  v363 = __Block_byref_object_copy__286;
  v364 = __Block_byref_object_dispose__287;
  id v365 = 0;
  uint64_t v353 = 0;
  v354 = (const std::string *)&v353;
  uint64_t v355 = 0x4812000000;
  v356 = __Block_byref_object_copy__288;
  v357 = __Block_byref_object_dispose__289;
  uint64_t v358 = 0;
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 24))(buf);
  if (SBYTE7(v382) < 0)
  {
    std::string::__init_copy_ctor_external(&v359, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v382) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&v359.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    v359.__r_.__value_.__r.__words[2] = v382;
  }
  uint64_t v346 = 0;
  v347 = (const std::string *)&v346;
  uint64_t v348 = 0x4812000000;
  v349 = __Block_byref_object_copy__288;
  v350 = __Block_byref_object_dispose__289;
  uint64_t v351 = 0;
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 24))(buf);
  if (SBYTE7(v382) < 0)
  {
    std::string::__init_copy_ctor_external(&v352, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v382) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&v352.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    v352.__r_.__value_.__r.__words[2] = v382;
  }
  uint64_t v339 = 0;
  v340 = (long long *)&v339;
  uint64_t v341 = 0x4812000000;
  v342 = __Block_byref_object_copy__288;
  v343 = __Block_byref_object_dispose__289;
  uint64_t v344 = 0;
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 24))(buf);
  if (SBYTE7(v382) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v382) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    __p.__r_.__value_.__r.__words[2] = v382;
  }
  v337[0] = 0;
  v337[1] = v337;
  v337[2] = 0x2020000000;
  char v338 = 0;
  uint64_t v6 = *a3;
  if (*(unsigned char *)(*a3 + 17))
  {
    char v7 = 1;
  }
  else
  {
    char v7 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 56))(v6, 167772185);
    uint64_t v6 = *a3;
  }
  char v338 = v7;
  uint64_t v333 = 0;
  v334 = &v333;
  uint64_t v335 = 0x2020000000;
  uint64_t v336 = 0;
  uint64_t v336 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 32))(v6, 167772185);
  uint64_t v329 = 0;
  v330 = &v329;
  uint64_t v331 = 0x2020000000;
  uint64_t v332 = 0;
  uint64_t v332 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 167772186);
  uint64_t v325 = 0;
  v326 = &v325;
  uint64_t v327 = 0x2020000000;
  uint64_t v328 = 0;
  uint64_t v328 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 167772182);
  uint64_t v321 = 0;
  v322 = &v321;
  uint64_t v323 = 0x2020000000;
  uint64_t v324 = 0;
  uint64_t v324 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 117440516);
  uint64_t v317 = 0;
  v318 = &v317;
  uint64_t v319 = 0x2020000000;
  uint64_t v320 = 0;
  uint64_t v320 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 33554438);
  uint64_t v313 = 0;
  v314 = &v313;
  uint64_t v315 = 0x2020000000;
  uint64_t v316 = 0;
  uint64_t v316 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 100663300);
  uint64_t v309 = 0;
  v310 = &v309;
  uint64_t v311 = 0x2020000000;
  BOOL v312 = 0;
  BOOL v312 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 16777246) != 0;
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 24))(buf);
  if (SBYTE7(v382) < 0)
  {
    std::string::__init_copy_ctor_external(&v308, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v382) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&v308.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    v308.__r_.__value_.__r.__words[2] = v382;
  }
  (*(void (**)(unsigned char *__return_ptr))(*(void *)*a3 + 24))(buf);
  if (SBYTE7(v382) < 0)
  {
    std::string::__init_copy_ctor_external(&v307, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
    *(void *)buf = &unk_1F08C3230;
    if (SBYTE7(v382) < 0) {
      operator delete(*(void **)&buf[16]);
    }
  }
  else
  {
    *(_OWORD *)&v307.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
    v307.__r_.__value_.__r.__words[2] = v382;
  }
  uint64_t v8 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 16777248);
  uint64_t v303 = 0;
  v304 = (char *)&v303;
  uint64_t v305 = 0x2020000000;
  std::string::size_type size = HIBYTE(v308.__r_.__value_.__r.__words[2]);
  if ((v308.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v308.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    BOOL v10 = 1;
  }
  else if (v8)
  {
    std::string::size_type v11 = HIBYTE(v307.__r_.__value_.__r.__words[2]);
    if ((v307.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v11 = v307.__r_.__value_.__l.__size_;
    }
    BOOL v10 = v11 != 0;
  }
  else
  {
    BOOL v10 = 0;
  }
  BOOL v306 = v10;
  if ((*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 33554462)) {
    char v254 = 1;
  }
  else {
    char v254 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 16777248);
  }
  uint64_t v12 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 167772175);
  uint64_t v256 = *(void *)(*a3 + 8);
  uint64_t v13 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 285212693);
  int v257 = v13 != 0;
  v14 = (unsigned char *)*a3;
  unint64_t v262 = v12;
  uint64_t v263 = a2;
  uint64_t v253 = v13;
  if (*(unsigned char *)(*a3 + 16) && !v14[17])
  {
    v20 = *(void **)(a2 + 16);
    v21 = [NSNumber numberWithLongLong:v256];
    v392 = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v392 count:1];
    char v23 = [v20 executeQuery:@"SELECT album_pid FROM item WHERE ROWID = ?" withParameters:v22];

    uint64_t v24 = [v23 objectForFirstRowAndColumn];
    if ([v24 longLongValue])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      *(void *)&buf[24] = 0;
      v250 = v24;
      char v25 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772164);
      char v26 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772170);
      char v27 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772186);
      char v28 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772182);
      char v247 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 16777246);
      char v29 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 33554438);
      char v30 = v27;
      char v31 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 100663300);
      int v32 = *(void **)(v263 + 16);
      v391 = v250;
      uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v391 count:1];
      v34 = [v32 executeQuery:@"SELECT album, sort_album, feed_url, user_rating, liked_state, all_compilations, season_number, representative_item_pid, grouping_key, album_year, contains_classical_work, user_rating_is_derived, sync_id, classical_experience_available, liked_state_changed_date, store_id, cloud_library_id, album_artist_pid FROM album WHERE album_pid=?", v33 withParameters];
      v273[0] = MEMORY[0x1E4F143A8];
      v273[1] = 3321888768;
      v273[2] = ___ZN16ML3ImportSession13_getAlbumInfoENSt3__110shared_ptrI13ML3ImportItemEEx_block_invoke;
      v273[3] = &unk_1F08C8860;
      char v295 = v25;
      char v296 = v26;
      std::string v275 = &v353;
      v276 = &v346;
      id v277 = &v339;
      v278 = v337;
      char v297 = v28;
      uint64_t v279 = &v333;
      uint64_t v280 = &v325;
      char v298 = v247;
      v281 = &v309;
      v282 = &v321;
      char v299 = v29;
      v283 = buf;
      std::string v284 = &v317;
      char v300 = v254;
      char v301 = v30;
      uint64_t v285 = &v303;
      v286 = &v329;
      char v302 = v31;
      v287 = &v313;
      v288 = &v360;
      a2 = v263;
      uint64_t v290 = v263;
      uint64_t v291 = a4;
      uint64_t v35 = (std::__shared_weak_count *)a3[1];
      uint64_t v292 = *a3;
      v293 = v35;
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v289 = &v366;
      uint64_t v24 = v250;
      id v274 = v250;
      uint64_t v294 = v256;
      [v34 enumerateRowsWithBlock:v273];

      if (v293) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v293);
      }
      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v44 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v256;
        _os_log_impl(&dword_1B022D000, v44, OS_LOG_TYPE_ERROR, "No existing album PID for update item %lli", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v15 = (*(uint64_t (**)(unsigned char *, uint64_t))(*(void *)v14 + 32))(v14, 16777217);
    uint64_t v16 = MLMediaTypeByStandardizingMediaType(v15);
    if (v322[3]
      || (SHIBYTE(v354[2].__r_.__value_.__r.__words[2]) < 0
        ? (std::string::size_type v19 = v354[2].__r_.__value_.__l.__size_)
        : (std::string::size_type v19 = HIBYTE(v354[2].__r_.__value_.__r.__words[2])),
          (v16 & 0x10042) != 0 ? (BOOL v42 = a4 == 0) : (BOOL v42 = 1),
          v42 ? (int v43 = 0) : (int v43 = 1),
          v19 || v43))
    {
      uint64_t v18 = *a3;
      unint64_t v17 = (std::__shared_weak_count *)a3[1];
      if (v17) {
        atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(unsigned char *__return_ptr, uint64_t, uint64_t))(*(void *)v18 + 24))(buf, v18, 167772164);
      if (SBYTE7(v382) < 0)
      {
        std::string::__init_copy_ctor_external(&v375, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
      }
      else
      {
        *(_OWORD *)&v375.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
        v375.__r_.__value_.__r.__words[2] = v382;
      }
      uint64_t v36 = ML3CPPBridgeString((const UInt8 *)&v375, 1);
      if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v375.__r_.__value_.__l.__data_);
      }
      *(void *)buf = &unk_1F08C3230;
      if (SBYTE7(v382) < 0) {
        operator delete(*(void **)&buf[16]);
      }
      v37 = [*(id *)(a2 + 8) groupingKeyForString:v36];
      (*(void (**)(unsigned char *__return_ptr, uint64_t, uint64_t))(*(void *)v18 + 24))(buf, v18, 100663323);
      if (SBYTE7(v382) < 0)
      {
        std::string::__init_copy_ctor_external(&v375, *(const std::string::value_type **)&buf[16], *(std::string::size_type *)&buf[24]);
      }
      else
      {
        *(_OWORD *)&v375.__r_.__value_.__l.__data_ = *(_OWORD *)&buf[16];
        v375.__r_.__value_.__r.__words[2] = v382;
      }
      id v38 = ML3CPPBridgeString((const UInt8 *)&v375, 1);
      if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v375.__r_.__value_.__l.__data_);
      }
      *(void *)buf = &unk_1F08C3230;
      if (SBYTE7(v382) < 0) {
        operator delete(*(void **)&buf[16]);
      }
      uint64_t v39 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v18 + 32))(v18, 117440516);
      v40 = [[ML3AlbumGroupingIdentifier alloc] initWithAlbumArtistPersistentID:a4 groupingKey:v37 feedURL:v38 seasonNumber:v39 compilation:(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v18 + 32))(v18, 16777246) != 0];

      v41 = (void *)v361[5];
      v361[5] = (uint64_t)v40;

      if (v17) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v17);
      }
    }
  }
  if (!v367[6])
  {
    __int16 v45 = [(id)v361[5] groupingKey];
    if ([v45 length] || objc_msgSend((id)v361[5], "albumArtistPersistentID"))
    {
    }
    else
    {
      BOOL v66 = [(id)v361[5] seasonNumber] == 0;

      if (v66) {
        goto LABEL_115;
      }
    }
    id v46 = (id)v361[5];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4012000000;
    *(void *)&buf[24] = __Block_byref_object_copy__349;
    *(void *)&long long v382 = __Block_byref_object_dispose__350;
    *((void *)&v382 + 1) = "";
    v384 = 0;
    uint64_t v383 = 0;
    if (v262)
    {
      v47 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>((void *)(a2 + 1008), v262);
      if (v47)
      {
        uint64_t v49 = v47[3];
        v48 = (std::__shared_weak_count *)v47[4];
        if (!v48)
        {
          uint64_t v383 = v47[3];
          v384 = 0;
          if (v46)
          {
LABEL_89:
            if (!*(void *)(*(void *)&buf[8] + 48))
            {
              v51 = [v46 keyValue];
              ML3CPPStringFromData((NSData *)&v375, v51);
              v52 = std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::find<std::string>((void *)(a2 + 1248), (unsigned __int8 *)&v375);
              if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v375.__r_.__value_.__l.__data_);
              }

              if (v52)
              {
                uint64_t v53 = *(void *)&buf[8];
                uint64_t v55 = *((void *)v52 + 5);
                uint64_t v54 = *((void *)v52 + 6);
                if (v54) {
                  atomic_fetch_add_explicit((atomic_ullong *volatile)(v54 + 8), 1uLL, memory_order_relaxed);
                }
                uint64_t v56 = *(std::__shared_weak_count **)(v53 + 56);
                *(void *)(v53 + 48) = v55;
                *(void *)(v53 + 56) = v54;
                if (v56) {
                  std::__shared_weak_count::__release_shared[abi:ne180100](v56);
                }
              }
            }
          }
LABEL_97:
          uint64_t v57 = *(void *)&buf[8];
          uint64_t v58 = *(void *)(*(void *)&buf[8] + 48);
          if (!v58)
          {
            objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v46, "albumArtistPersistentID"));
            v251 = (long long *)objc_claimAutoreleasedReturnValue();
            v59 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
            uint64_t v60 = objc_msgSend(@"SELECT album, sort_album, feed_url, rowid, grouping_key, album_artist_pid, season_number, all_compilations, user_rating, liked_state, album_year, (CASE WHEN season_number > 0 THEN season_number ELSE IFNULL(sort_album, album) END), contains_classical_work, user_rating_is_derived, sync_id, classical_experience_available, store_id, liked_state_changed_date, cloud_library_id FROM album ", "stringByAppendingString:", @"WHERE ");
            long long v61 = v60;
            if (v262)
            {
              v62 = [v60 stringByAppendingString:@"(ROWID=? OR sync_id=?) OR"];

              uint64_t v63 = [NSNumber numberWithLongLong:v262];
              *(void *)&long long v395 = v63;
              uint64_t v64 = [NSNumber numberWithLongLong:v262];
              *((void *)&v395 + 1) = v64;
              uint64_t v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v395 count:2];
              [v59 addObjectsFromArray:v65];
            }
            else
            {
              v62 = v60;
            }
            uint64_t v67 = [v46 groupingKey];
            if ([v67 length])
            {
              uint64_t v68 = [v62 stringByAppendingString:@"(grouping_key IN (?) AND album_artist_pid = ?)"];

              v393 = v67;
              v394 = v251;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v393 count:2];
            }
            else
            {
              uint64_t v68 = [v62 stringByAppendingString:@"(grouping_key IS NULL AND album_artist_pid = ?)"];

              v393 = v251;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v393 count:1];
            v69 = };
            [v59 addObjectsFromArray:v69];
            uint64_t v70 = (void *)v68;

            long long v71 = [*(id *)(a2 + 16) executeQuery:v68 withParameters:v59];
            v375.__r_.__value_.__r.__words[0] = MEMORY[0x1E4F143A8];
            v375.__r_.__value_.__l.__size_ = 3221225472;
            v375.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN16ML3ImportSession21_getExistingAlbumInfoEP26ML3AlbumGroupingIdentifierx_block_invoke;
            v376 = &unk_1E5FB76C8;
            uint64_t v379 = a2;
            v378 = buf;
            id v377 = v46;
            unint64_t v380 = v262;
            [v71 enumerateRowsWithBlock:&v375];

            uint64_t v57 = *(void *)&buf[8];
            uint64_t v58 = *(void *)(*(void *)&buf[8] + 48);
          }
          uint64_t v72 = *(void *)(v57 + 56);
          if (v72) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v72 + 8), 1uLL, memory_order_relaxed);
          }
          _Block_object_dispose(buf, 8);
          if (v384) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v384);
          }

          *(void *)&long long v73 = v58;
          *((void *)&v73 + 1) = v72;
          uint64_t v74 = (std::__shared_weak_count *)v367[7];
          *((_OWORD *)v367 + 3) = v73;
          if (v74) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v74);
          }
          goto LABEL_115;
        }
        atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
        v50 = v384;
        uint64_t v383 = v49;
        v384 = v48;
        if (v50) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v50);
        }
      }
    }
    if (v46) {
      goto LABEL_89;
    }
    goto LABEL_97;
  }
LABEL_115:
  if (v367[6])
  {
    uint64_t v75 = *(int *)(a2 + 32);
    uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(10, 167772164);
    if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
      dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
    }
    if (*(_DWORD *)(__specialRules + 56 * PropertyIndex + 4 * v75) != -1)
    {
      uint64_t v77 = v367[6];
      uint64_t v78 = HIBYTE(v354[2].__r_.__value_.__r.__words[2]);
      if ((v78 & 0x80u) == 0) {
        std::string::size_type v79 = HIBYTE(v354[2].__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v79 = v354[2].__r_.__value_.__l.__size_;
      }
      uint64_t v80 = *(unsigned __int8 *)(v77 + 31);
      int v81 = (char)v80;
      if ((v80 & 0x80u) != 0) {
        uint64_t v80 = *(void *)(v77 + 16);
      }
      if (v79 == v80)
      {
        p_data = (const void **)&v354[2].__r_.__value_.__l.__data_;
        uint64_t v85 = *(unsigned __int8 **)(v77 + 8);
        uint64_t v83 = (unsigned __int8 *)(v77 + 8);
        v84 = v85;
        if (v81 >= 0) {
          int v86 = v83;
        }
        else {
          int v86 = v84;
        }
        if ((v78 & 0x80) != 0)
        {
          if (!memcmp(*p_data, v86, v354[2].__r_.__value_.__l.__size_)) {
            goto LABEL_175;
          }
        }
        else
        {
          if (!*((unsigned char *)&v354[2].__r_.__value_.__s + 23)) {
            goto LABEL_175;
          }
          while (*(unsigned __int8 *)p_data == *v86)
          {
            p_data = (const void **)((char *)p_data + 1);
            ++v86;
            if (!--v78) {
              goto LABEL_175;
            }
          }
        }
      }
      uint64_t v118 = (std::__shared_weak_count *)a3[1];
      v272[0] = *a3;
      v272[1] = v118;
      if (v118) {
        atomic_fetch_add_explicit(&v118->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v272, 0xA000004u);
      if (v118) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v118);
      }
      if ((shouldPreserveTrackProperty & 1) == 0)
      {
        uint64_t v120 = *(void **)(v263 + 16);
        int v121 = ML3CPPBridgeString((const UInt8 *)&v354[2], 1);
        v390[0] = v121;
        char v122 = [NSNumber numberWithLongLong:*(void *)v367[6]];
        v390[1] = v122;
        v123 = [MEMORY[0x1E4F1C978] arrayWithObjects:v390 count:2];
        [v120 executeUpdate:@"UPDATE album SET albuuint64_t m = ? WHERE ROWID = ?" withParameters:v123 error:0];

        std::string::operator=((std::string *)(v367[6] + 8), v354 + 2);
      }
    }
LABEL_175:
    uint64_t v124 = *(int *)(v263 + 32);
    uint64_t v125 = ML3TrackRulesGetPropertyIndex(10, 167772170);
    if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
      dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
    }
    uint64_t v126 = v263;
    if (*(_DWORD *)(__specialRules + 56 * v125 + 4 * v124) == -1)
    {
LABEL_217:
      uint64_t v152 = v367[6];
      if (v334[3] != *(_DWORD *)(v152 + 56))
      {
        uint64_t v153 = *(int *)(v126 + 32);
        uint64_t v154 = ML3TrackRulesGetPropertyIndex(10, 167772185);
        if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
          dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
        }
        uint64_t v126 = v263;
        if (*(_DWORD *)(__specialRules + 56 * v154 + 4 * v153) == -1)
        {
          uint64_t v152 = v367[6];
        }
        else
        {
          v155 = *(void **)(v263 + 16);
          std::string::basic_string[abi:ne180100]<0>(&v375, "UPDATE album SET user_rating = ? WHERE ROWID = ?");
          *(void *)buf = v334[3];
          *(_DWORD *)&buf[24] = 0;
          LOBYTE(v382) = 1;
          *((void *)&v382 + 1) = *(void *)v367[6];
          int v385 = 0;
          v386[0] = 1;
          v396[0] = 0;
          long long v395 = 0uLL;
          v393 = &v395;
          LOBYTE(v394) = 0;
          *(void *)&long long v395 = operator new(0x50uLL);
          *((void *)&v395 + 1) = v395;
          v396[0] = v395 + 80;
          *((void *)&v395 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>*>((uint64_t)v396, (uint64_t)buf, (uint64_t)&v387, v395);
          ML3ImportExecuteVariadicStatement(v155, (const UInt8 *)&v375, (uint64_t *)&v395);
          v393 = &v395;
          std::vector<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v393);
          for (uint64_t i = 0; i != -80; i -= 40)
          {
            if (v386[i]) {
              std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v382 + i + 8);
            }
          }
          if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v375.__r_.__value_.__l.__data_);
          }
          uint64_t v152 = v367[6];
          *(_DWORD *)(v152 + 56) = v334[3];
        }
      }
      if (v330[3] != *(unsigned __int8 *)(v152 + 60))
      {
        uint64_t v157 = *(int *)(v126 + 32);
        uint64_t v158 = ML3TrackRulesGetPropertyIndex(10, 167772186);
        if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
          dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
        }
        uint64_t v126 = v263;
        if (*(_DWORD *)(__specialRules + 56 * v158 + 4 * v157) != -1)
        {
          uint64_t v159 = *(void **)(v263 + 16);
          std::string::basic_string[abi:ne180100]<0>(&v375, "UPDATE album SET user_rating_is_derived = ? WHERE ROWID = ?");
          *(void *)buf = v330[3];
          *(_DWORD *)&buf[24] = 0;
          LOBYTE(v382) = 1;
          *((void *)&v382 + 1) = *(void *)v367[6];
          int v385 = 0;
          v386[0] = 1;
          v396[0] = 0;
          long long v395 = 0uLL;
          v393 = &v395;
          LOBYTE(v394) = 0;
          *(void *)&long long v395 = operator new(0x50uLL);
          *((void *)&v395 + 1) = v395;
          v396[0] = v395 + 80;
          *((void *)&v395 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>*>((uint64_t)v396, (uint64_t)buf, (uint64_t)&v387, v395);
          ML3ImportExecuteVariadicStatement(v159, (const UInt8 *)&v375, (uint64_t *)&v395);
          v393 = &v395;
          std::vector<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v393);
          for (uint64_t j = 0; j != -80; j -= 40)
          {
            if (v386[j]) {
              std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v382 + j + 8);
            }
          }
          if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v375.__r_.__value_.__l.__data_);
          }
          *(unsigned char *)(v367[6] + 60) = v330[3] != 0;
        }
      }
      uint64_t v161 = *(int *)(v126 + 32);
      uint64_t v162 = ML3TrackRulesGetPropertyIndex(10, 167772182);
      if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
        dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
      }
      uint64_t v163 = v263;
      if (*(_DWORD *)(__specialRules + 56 * v162 + 4 * v161) != -1)
      {
        uint64_t v163 = v263;
        if ((*(unsigned int (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 167772182))
        {
          if (v326[3] != *(_DWORD *)(v367[6] + 64))
          {
            v164 = (std::__shared_weak_count *)a3[1];
            v270[0] = *a3;
            v270[1] = v164;
            if (v164) {
              atomic_fetch_add_explicit(&v164->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            char v165 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v270, 0xA000016u);
            if (v164) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v164);
            }
            if ((v165 & 1) == 0)
            {
              uint64_t v166 = *(void **)(v263 + 16);
              std::string::basic_string[abi:ne180100]<0>(&v375, "UPDATE album SET liked_state = ? WHERE ROWID = ?");
              *(void *)buf = v326[3];
              *(_DWORD *)&buf[24] = 0;
              LOBYTE(v382) = 1;
              *((void *)&v382 + 1) = *(void *)v367[6];
              int v385 = 0;
              v386[0] = 1;
              v396[0] = 0;
              long long v395 = 0uLL;
              v393 = &v395;
              LOBYTE(v394) = 0;
              *(void *)&long long v395 = operator new(0x50uLL);
              *((void *)&v395 + 1) = v395;
              v396[0] = v395 + 80;
              *((void *)&v395 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>*>((uint64_t)v396, (uint64_t)buf, (uint64_t)&v387, v395);
              ML3ImportExecuteVariadicStatement(v166, (const UInt8 *)&v375, (uint64_t *)&v395);
              v393 = &v395;
              std::vector<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v393);
              for (uint64_t k = 0; k != -80; k -= 40)
              {
                if (v386[k]) {
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v382 + k + 8);
                }
              }
              if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v375.__r_.__value_.__l.__data_);
              }
              *(_DWORD *)(v367[6] + 64) = v326[3];
            }
          }
        }
      }
      uint64_t v168 = *(int *)(v163 + 32);
      uint64_t v169 = ML3TrackRulesGetPropertyIndex(2, 33554438);
      if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
        dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
      }
      uint64_t v170 = v263;
      if (*(_DWORD *)(__itemExtraRules + 56 * v169 + 4 * v168) != -1)
      {
        uint64_t v170 = v263;
        if ((*(unsigned int (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 33554438))
        {
          if (v318[3] != *(_DWORD *)(v367[6] + 68))
          {
            v171 = (std::__shared_weak_count *)a3[1];
            v269[0] = *a3;
            v269[1] = v171;
            if (v171) {
              atomic_fetch_add_explicit(&v171->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            char v172 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v269, 0x2000006u);
            if (v171) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v171);
            }
            if ((v172 & 1) == 0)
            {
              id v173 = (void *)v367[6];
              uint64_t v175 = *(char **)(v263 + 464);
              unint64_t v174 = *(void *)(v263 + 472);
              if ((unint64_t)v175 >= v174)
              {
                v177 = *(char **)(v263 + 456);
                uint64_t v178 = (v175 - v177) >> 3;
                unint64_t v179 = v178 + 1;
                if ((unint64_t)(v178 + 1) >> 61) {
                  goto LABEL_406;
                }
                uint64_t v180 = v174 - (void)v177;
                if (v180 >> 2 > v179) {
                  unint64_t v179 = v180 >> 2;
                }
                BOOL v181 = (unint64_t)v180 >= 0x7FFFFFFFFFFFFFF8;
                unint64_t v182 = 0x1FFFFFFFFFFFFFFFLL;
                if (!v181) {
                  unint64_t v182 = v179;
                }
                if (v182)
                {
                  unint64_t v182 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v182);
                  uint64_t v170 = v263;
                  v177 = *(char **)(v263 + 456);
                  uint64_t v175 = *(char **)(v263 + 464);
                }
                else
                {
                  uint64_t v183 = 0;
                }
                char v184 = (void *)(v182 + 8 * v178);
                unint64_t v185 = v182 + 8 * v183;
                void *v184 = *v173;
                v176 = v184 + 1;
                while (v175 != v177)
                {
                  uint64_t v186 = *((void *)v175 - 1);
                  v175 -= 8;
                  *--char v184 = v186;
                }
                *(void *)(v170 + 456) = v184;
                *(void *)(v170 + 464) = v176;
                *(void *)(v170 + 472) = v185;
                if (v177) {
                  operator delete(v177);
                }
              }
              else
              {
                *(void *)uint64_t v175 = *v173;
                v176 = v175 + 8;
              }
              *(void *)(v170 + 464) = v176;
              *(_DWORD *)(v367[6] + 68) = v318[3];
            }
          }
        }
      }
      if (((v254 & 1) != 0 || !*(unsigned char *)(*a3 + 16) || *(unsigned char *)(*a3 + 17))
        && *(_DWORD *)(v367[6] + 88) != v304[24])
      {
        uint64_t v187 = *(int *)(v170 + 32);
        uint64_t v188 = ML3TrackRulesGetPropertyIndex(2, 33554462);
        if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
          dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
        }
        uint64_t v170 = v263;
        if (*(_DWORD *)(__itemExtraRules + 56 * v188 + 4 * v187) != -1)
        {
          uint64_t v189 = (std::__shared_weak_count *)a3[1];
          v268[0] = *a3;
          v268[1] = v189;
          if (v189) {
            atomic_fetch_add_explicit(&v189->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          char v190 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v268, 0x200001Eu);
          if (v189) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v189);
          }
          if ((v190 & 1) == 0)
          {
            uint64_t v191 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v191, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v192 = *(void *)v367[6];
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v192;
              _os_log_impl(&dword_1B022D000, v191, OS_LOG_TYPE_DEFAULT, "contains_classical_work differs for album %lld", buf, 0xCu);
            }

            uint64_t v193 = (void *)v367[6];
            uint64_t v195 = *(char **)(v263 + 488);
            unint64_t v194 = *(void *)(v263 + 496);
            if ((unint64_t)v195 >= v194)
            {
              std::string v197 = *(char **)(v263 + 480);
              uint64_t v198 = (v195 - v197) >> 3;
              unint64_t v199 = v198 + 1;
              if ((unint64_t)(v198 + 1) >> 61) {
                goto LABEL_406;
              }
              uint64_t v200 = v194 - (void)v197;
              if (v200 >> 2 > v199) {
                unint64_t v199 = v200 >> 2;
              }
              BOOL v181 = (unint64_t)v200 >= 0x7FFFFFFFFFFFFFF8;
              unint64_t v201 = 0x1FFFFFFFFFFFFFFFLL;
              if (!v181) {
                unint64_t v201 = v199;
              }
              if (v201)
              {
                unint64_t v201 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v201);
                uint64_t v170 = v263;
                std::string v197 = *(char **)(v263 + 480);
                uint64_t v195 = *(char **)(v263 + 488);
              }
              else
              {
                uint64_t v202 = 0;
              }
              id v203 = (void *)(v201 + 8 * v198);
              unint64_t v204 = v201 + 8 * v202;
              *id v203 = *v193;
              uint64_t v196 = v203 + 1;
              while (v195 != v197)
              {
                uint64_t v205 = *((void *)v195 - 1);
                v195 -= 8;
                *--id v203 = v205;
              }
              *(void *)(v170 + 480) = v203;
              *(void *)(v170 + 488) = v196;
              *(void *)(v170 + 496) = v204;
              if (v197) {
                operator delete(v197);
              }
            }
            else
            {
              *(void *)uint64_t v195 = *v193;
              uint64_t v196 = v195 + 8;
            }
            *(void *)(v170 + 488) = v196;
            *(_DWORD *)(v367[6] + 88) = v304[24];
          }
        }
      }
      uint64_t v206 = *(int *)(v170 + 32);
      uint64_t v207 = ML3TrackRulesGetPropertyIndex(1, 16777246);
      if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
        dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
      }
      uint64_t v208 = v263;
      if (*(_DWORD *)(__itemRules + 56 * v207 + 4 * v206) == -1) {
        goto LABEL_341;
      }
      uint64_t v208 = v263;
      if (!(*(unsigned int (**)(void, uint64_t))(*(void *)*a3 + 56))(*a3, 16777246)
        || *((unsigned __int8 *)v310 + 24) == *(unsigned __int8 *)(v367[6] + 136))
      {
        goto LABEL_341;
      }
      v209 = (std::__shared_weak_count *)a3[1];
      v267[0] = *a3;
      v267[1] = v209;
      if (v209) {
        atomic_fetch_add_explicit(&v209->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v210 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v267, 0x100001Eu);
      if (v209) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v209);
      }
      if (v210) {
        goto LABEL_341;
      }
      v211 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v212 = *(void *)v367[6];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v212;
        _os_log_impl(&dword_1B022D000, v211, OS_LOG_TYPE_DEFAULT, "is_compilation differs for album %lld", buf, 0xCu);
      }

      long long v213 = (void *)v367[6];
      uint64_t v214 = *(char **)(v263 + 512);
      unint64_t v215 = *(void *)(v263 + 520);
      if ((unint64_t)v214 < v215)
      {
        *(void *)uint64_t v214 = *v213;
        v216 = v214 + 8;
LABEL_340:
        *(void *)(v208 + 512) = v216;
        *(unsigned char *)(v367[6] + 136) = *((unsigned char *)v310 + 24);
LABEL_341:
        if (v262 && v262 != *(void *)(v367[6] + 96))
        {
          uint64_t v226 = *(int *)(v208 + 32);
          uint64_t v227 = ML3TrackRulesGetPropertyIndex(17, 285212691);
          if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
            dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
          }
          uint64_t v208 = v263;
          if (*(_DWORD *)(__albumRules + 56 * v227 + 4 * v226) != -1)
          {
            uint64_t v228 = (std::__shared_weak_count *)a3[1];
            v266[0] = *a3;
            v266[1] = v228;
            if (v228) {
              atomic_fetch_add_explicit(&v228->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            char v229 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v266, 0x11000013u);
            if (v228) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v228);
            }
            if ((v229 & 1) == 0)
            {
              v230 = *(void **)(v263 + 16);
              std::string::basic_string[abi:ne180100]<0>(&v375, "UPDATE album SET sync_id = ? WHERE ROWID = ?");
              *(void *)buf = v262;
              *(_DWORD *)&buf[24] = 0;
              LOBYTE(v382) = 1;
              *((void *)&v382 + 1) = *(void *)v367[6];
              int v385 = 0;
              v386[0] = 1;
              v396[0] = 0;
              long long v395 = 0uLL;
              v393 = &v395;
              LOBYTE(v394) = 0;
              *(void *)&long long v395 = operator new(0x50uLL);
              *((void *)&v395 + 1) = v395;
              v396[0] = v395 + 80;
              *((void *)&v395 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>*>((uint64_t)v396, (uint64_t)buf, (uint64_t)&v387, v395);
              ML3ImportExecuteVariadicStatement(v230, (const UInt8 *)&v375, (uint64_t *)&v395);
              v393 = &v395;
              std::vector<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v393);
              for (uint64_t m = 0; m != -80; m -= 40)
              {
                if (v386[m]) {
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v382 + m + 8);
                }
              }
              if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v375.__r_.__value_.__l.__data_);
              }
              *(void *)(v367[6] + 96) = v262;
            }
          }
        }
        uint64_t v232 = v314[3];
        if (v232 && v232 != *(void *)(v367[6] + 104))
        {
          uint64_t v233 = *(int *)(v208 + 32);
          uint64_t v234 = ML3TrackRulesGetPropertyIndex(17, 285212696);
          if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
            dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
          }
          uint64_t v208 = v263;
          if (*(_DWORD *)(__albumRules + 56 * v234 + 4 * v233) != -1)
          {
            id v235 = (std::__shared_weak_count *)a3[1];
            v265[0] = *a3;
            v265[1] = v235;
            if (v235) {
              atomic_fetch_add_explicit(&v235->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            char v236 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v265, 0x11000018u);
            if (v235) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v235);
            }
            if ((v236 & 1) == 0)
            {
              v237 = *(void **)(v263 + 16);
              std::string::basic_string[abi:ne180100]<0>(&v375, "UPDATE album SET store_id = ? WHERE ROWID = ?");
              *(void *)buf = v314[3];
              *(_DWORD *)&buf[24] = 0;
              LOBYTE(v382) = 1;
              *((void *)&v382 + 1) = *(void *)v367[6];
              int v385 = 0;
              v386[0] = 1;
              v396[0] = 0;
              long long v395 = 0uLL;
              v393 = &v395;
              LOBYTE(v394) = 0;
              *(void *)&long long v395 = operator new(0x50uLL);
              *((void *)&v395 + 1) = v395;
              v396[0] = v395 + 80;
              *((void *)&v395 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>*>((uint64_t)v396, (uint64_t)buf, (uint64_t)&v387, v395);
              ML3ImportExecuteVariadicStatement(v237, (const UInt8 *)&v375, (uint64_t *)&v395);
              v393 = &v395;
              std::vector<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v393);
              for (uint64_t n = 0; n != -80; n -= 40)
              {
                if (v386[n]) {
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v382 + n + 8);
                }
              }
              if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v375.__r_.__value_.__l.__data_);
              }
              *(void *)(v367[6] + 104) = v314[3];
            }
          }
        }
        if (*(unsigned __int8 *)(v367[6] + 137) != v257)
        {
          uint64_t v239 = *(int *)(v208 + 32);
          uint64_t v240 = ML3TrackRulesGetPropertyIndex(17, 285212693);
          if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
            dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
          }
          if (*(_DWORD *)(__albumRules + 56 * v240 + 4 * v239) != -1)
          {
            v241 = (std::__shared_weak_count *)a3[1];
            v264[0] = *a3;
            v264[1] = v241;
            if (v241) {
              atomic_fetch_add_explicit(&v241->__shared_owners_, 1uLL, memory_order_relaxed);
            }
            char v242 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v264, 0x11000015u);
            if (v241) {
              std::__shared_weak_count::__release_shared[abi:ne180100](v241);
            }
            if ((v242 & 1) == 0)
            {
              v243 = *(void **)(v263 + 16);
              std::string::basic_string[abi:ne180100]<0>(&v375, "UPDATE album SET classical_experience_available = ? WHERE ROWID = ?");
              buf[0] = v257;
              *(_DWORD *)&buf[24] = 2;
              LOBYTE(v382) = 1;
              *((void *)&v382 + 1) = *(void *)v367[6];
              int v385 = 0;
              v386[0] = 1;
              v396[0] = 0;
              long long v395 = 0uLL;
              v393 = &v395;
              LOBYTE(v394) = 0;
              *(void *)&long long v395 = operator new(0x50uLL);
              *((void *)&v395 + 1) = v395;
              v396[0] = v395 + 80;
              *((void *)&v395 + 1) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>> const*,std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>*>((uint64_t)v396, (uint64_t)buf, (uint64_t)&v387, v395);
              ML3ImportExecuteVariadicStatement(v243, (const UInt8 *)&v375, (uint64_t *)&v395);
              v393 = &v395;
              std::vector<std::optional<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v393);
              for (iuint64_t i = 0; ii != -80; ii -= 40)
              {
                if (v386[ii]) {
                  std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)&v382 + ii + 8);
                }
              }
              if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v375.__r_.__value_.__l.__data_);
              }
              *(unsigned char *)(v367[6] + 137) = v257;
            }
          }
        }
        goto LABEL_391;
      }
      v217 = *(char **)(v263 + 504);
      uint64_t v218 = (v214 - v217) >> 3;
      unint64_t v219 = v218 + 1;
      if (!((unint64_t)(v218 + 1) >> 61))
      {
        uint64_t v220 = v215 - (void)v217;
        if (v220 >> 2 > v219) {
          unint64_t v219 = v220 >> 2;
        }
        BOOL v181 = (unint64_t)v220 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v221 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v181) {
          unint64_t v221 = v219;
        }
        if (v221)
        {
          unint64_t v221 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v221);
          uint64_t v208 = v263;
          v217 = *(char **)(v263 + 504);
          uint64_t v214 = *(char **)(v263 + 512);
        }
        else
        {
          uint64_t v222 = 0;
        }
        BOOL v223 = (void *)(v221 + 8 * v218);
        unint64_t v224 = v221 + 8 * v222;
        *BOOL v223 = *v213;
        v216 = v223 + 1;
        while (v214 != v217)
        {
          uint64_t v225 = *((void *)v214 - 1);
          v214 -= 8;
          *--BOOL v223 = v225;
        }
        *(void *)(v208 + 504) = v223;
        *(void *)(v208 + 512) = v216;
        *(void *)(v208 + 520) = v224;
        if (v217) {
          operator delete(v217);
        }
        goto LABEL_340;
      }
LABEL_406:
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v127 = HIBYTE(v347[2].__r_.__value_.__r.__words[2]);
    if (SHIBYTE(v347[2].__r_.__value_.__r.__words[2]) < 0)
    {
      if (!v347[2].__r_.__value_.__l.__size_) {
        goto LABEL_196;
      }
    }
    else if (!*((unsigned char *)&v347[2].__r_.__value_.__s + 23))
    {
LABEL_196:
      if ((v127 & 0x80) != 0) {
        std::string::size_type v127 = v347[2].__r_.__value_.__l.__size_;
      }
      goto LABEL_199;
    }
    uint64_t v128 = v367[6];
    std::string::size_type v129 = v347[2].__r_.__value_.__l.__size_;
    if ((v127 & 0x80u) == 0) {
      std::string::size_type v130 = HIBYTE(v347[2].__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v130 = v347[2].__r_.__value_.__l.__size_;
    }
    uint64_t v131 = *(unsigned __int8 *)(v128 + 55);
    int v132 = (char)v131;
    if ((v131 & 0x80u) != 0) {
      uint64_t v131 = *(void *)(v128 + 40);
    }
    if (v130 == v131)
    {
      uint64_t v133 = (const void **)&v347[2].__r_.__value_.__l.__data_;
      if (v132 >= 0) {
        uint64_t v134 = (unsigned __int8 *)(v128 + 32);
      }
      else {
        uint64_t v134 = *(unsigned __int8 **)(v128 + 32);
      }
      if ((v127 & 0x80) != 0)
      {
        int v136 = memcmp(*v133, v134, v347[2].__r_.__value_.__l.__size_);
        std::string::size_type v127 = v129;
        if (!v136)
        {
LABEL_199:
          if (v127) {
            goto LABEL_217;
          }
          uint64_t v128 = v367[6];
          LOBYTE(v132) = *(unsigned char *)(v128 + 55);
LABEL_201:
          if ((v132 & 0x80) != 0)
          {
            if (!*(void *)(v128 + 40)) {
              goto LABEL_217;
            }
          }
          else if (!(_BYTE)v132)
          {
            goto LABEL_217;
          }
        }
      }
      else
      {
        if (!*((unsigned char *)&v347[2].__r_.__value_.__s + 23)) {
          goto LABEL_201;
        }
        uint64_t v135 = HIBYTE(v347[2].__r_.__value_.__r.__words[2]);
        while (*(unsigned __int8 *)v133 == *v134)
        {
          uint64_t v133 = (const void **)((char *)v133 + 1);
          ++v134;
          if (!--v135) {
            goto LABEL_196;
          }
        }
      }
    }
    uint64_t v137 = (std::__shared_weak_count *)a3[1];
    v271[0] = *a3;
    v271[1] = v137;
    if (v137) {
      atomic_fetch_add_explicit(&v137->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v138 = ML3ImportSession::_shouldPreserveTrackProperty(v263, (uint64_t)v271, 0xA00000Au);
    if (v137) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v137);
    }
    if ((v138 & 1) == 0)
    {
      if (SHIBYTE(v347[2].__r_.__value_.__r.__words[2]) < 0) {
        std::string::size_type v139 = v347[2].__r_.__value_.__l.__size_;
      }
      else {
        std::string::size_type v139 = HIBYTE(v347[2].__r_.__value_.__r.__words[2]);
      }
      char v140 = *(void **)(v263 + 16);
      if (v139) {
        ML3CPPBridgeString((const UInt8 *)&v347[2], 1);
      }
      else {
      uint64_t v141 = [MEMORY[0x1E4F1CA98] null];
      }
      v389[0] = v141;
      v142 = [NSNumber numberWithLongLong:*(void *)v367[6]];
      v389[1] = v142;
      v143 = [MEMORY[0x1E4F1C978] arrayWithObjects:v389 count:2];
      [v140 executeUpdate:@"UPDATE album SET sort_albuuint64_t m = ? WHERE ROWID = ?" withParameters:v143 error:0];

      std::string::operator=((std::string *)(v367[6] + 32), v347 + 2);
      uint64_t v144 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v263, (uint64_t)&v347[2], (uint64_t)&v354[2]);
      uint64_t v145 = v367[6];
      *(void *)(v145 + 72) = v144;
      *(void *)(v145 + 80) = v146;
      uint64_t v147 = *(void **)(v263 + 16);
      uint64_t v148 = [NSNumber numberWithLongLong:v144];
      v388[0] = v148;
      uint64_t v149 = [NSNumber numberWithInteger:*(void *)(v367[6] + 80)];
      v388[1] = v149;
      v150 = [NSNumber numberWithLongLong:*(void *)v367[6]];
      v388[2] = v150;
      v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:v388 count:3];
      [v147 executeUpdate:@"UPDATE item SET album_order=?, album_order_section=? WHERE album_pid=?", v151, 0 withParameters error];
      uint64_t v126 = v263;
    }
    goto LABEL_217;
  }
  uint64_t v87 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a3 + 32))(*a3, 16777217);
  __int16 v246 = MLMediaTypeByStandardizingMediaType(v87);
  uint64_t IntegerUUID = v262;
  if (!v262) {
    uint64_t IntegerUUID = ML3CreateIntegerUUID();
  }
  v258 = [(id)v361[5] groupingKey];
  v393 = v258;
  int v89 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    v90 = (std::string::__raw *)&v354[2];
    if (SHIBYTE(v354[2].__r_.__value_.__r.__words[2]) < 0) {
      v90 = (std::string::__raw *)v90->__words[0];
    }
    v91 = (std::string::__raw *)&v347[2];
    if (SHIBYTE(v347[2].__r_.__value_.__r.__words[2]) < 0) {
      v91 = (std::string::__raw *)v91->__words[0];
    }
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = IntegerUUID;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = v90;
    *(_WORD *)&buf[22] = 2082;
    *(void *)&buf[24] = v91;
    LOWORD(v382) = 2048;
    *(void *)((char *)&v382 + 2) = a4;
    _os_log_impl(&dword_1B022D000, v89, OS_LOG_TYPE_DEFAULT, "creating new album entry: pid=%lld, name='%{public}s', sortName='%{public}s', artistId=%lld", buf, 0x2Au);
  }

  unint64_t v261 = IntegerUUID;
  uint64_t v92 = v354;
  int v93 = v347;
  uint64_t v94 = v334;
  uint64_t v95 = v330;
  v248 = v318;
  uint64_t v249 = v326;
  uint64_t v96 = a2;
  v97 = (std::string *)&v347[2];
  v98 = (std::string::__raw *)&v354[2];
  uint64_t v255 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v96, (uint64_t)&v347[2], (uint64_t)&v354[2]);
  uint64_t v252 = v99;
  v100 = v304;
  uint64_t v101 = v314;
  uint64_t v102 = v310;
  uint64_t v103 = operator new(0xB0uLL);
  v103[1] = 0;
  v103[2] = 0;
  *uint64_t v103 = &unk_1F08C74B8;
  if (SHIBYTE(v92[2].__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)buf, v92[2].__r_.__value_.__l.__data_, v92[2].__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)buf = *(_OWORD *)v98->__words;
    *(void *)&buf[16] = v98->__words[2];
  }
  if (SHIBYTE(v93[2].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v375, v93[2].__r_.__value_.__l.__data_, v93[2].__r_.__value_.__l.__size_);
  }
  else {
    std::string v375 = *v97;
  }
  int v104 = *((_DWORD *)v94 + 6);
  char v105 = v95[3] != 0;
  int v106 = *((_DWORD *)v249 + 6);
  int v107 = *((_DWORD *)v248 + 6);
  int v108 = v100[24];
  uint64_t v109 = v101[3];
  v396[0] = 0;
  long long v395 = 0uLL;
  ML3AlbumData::ML3AlbumData((uint64_t)(v103 + 3), v261, (long long *)buf, (long long *)&v375, v104, v105, v106, v107, v255, v252, v108, v262, v109, &v395, *((unsigned char *)v102 + 24), v253 != 0, 0);
  if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v375.__r_.__value_.__l.__data_);
  }
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  *(void *)&long long v110 = v103 + 3;
  *((void *)&v110 + 1) = v103;
  uint64_t v111 = (std::__shared_weak_count *)v367[7];
  *((_OWORD *)v367 + 3) = v110;
  if (v111) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v111);
  }
  uint64_t v112 = (void *)v361[5];
  if (v112)
  {
    v113 = [v112 keyValue];
    ML3CPPStringFromData((NSData *)&v375, v113);
    *(_OWORD *)buf = *(_OWORD *)&v375.__r_.__value_.__l.__data_;
    std::string::size_type v114 = v375.__r_.__value_.__r.__words[2];
    memset(&v375, 0, sizeof(v375));
    uint64_t v116 = v367[6];
    uint64_t v115 = v367[7];
    *(void *)&buf[16] = v114;
    *(void *)&buf[24] = v116;
    *(void *)&long long v382 = v115;
    if (v115) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v115 + 8), 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3AlbumData>>>(v263 + 1248, buf, (uint64_t)buf);
    if ((void)v382) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v382);
    }
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
    if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v375.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v117 = v256;
  if ((v246 & 0x400) != 0) {
    uint64_t v117 = 0;
  }
  *(void *)&long long v395 = v117;
  std::allocate_shared[abi:ne180100]<ML3AlbumImportItem,std::allocator<ML3AlbumImportItem>,std::shared_ptr<ML3AlbumData> &,std::string &,BOOL &,NSData * {__strong}&,long long,long long &,long long &,BOOL &,void>(&v375, v367[6], (std::__shared_weak_count *)v367[7], v340 + 3, (unsigned __int8 *)v310 + 24, (void **)&v393, (uint64_t *)&v395, &v374, v322 + 3, v304 + 24);
  *(void *)buf = v261;
  *(_OWORD *)&buf[8] = *(_OWORD *)&v375.__r_.__value_.__l.__data_;
  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ImportItem>>>((uint64_t *)(v263 + 2248), v261, (uint64_t)buf);
  if (*(void *)&buf[16]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[16]);
  }

LABEL_391:
  uint64_t v245 = v367[7];
  *a1 = v367[6];
  a1[1] = v245;
  if (v245) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v245 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v303, 8);
  if (SHIBYTE(v307.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v307.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v308.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v308.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v309, 8);
  _Block_object_dispose(&v313, 8);
  _Block_object_dispose(&v317, 8);
  _Block_object_dispose(&v321, 8);
  _Block_object_dispose(&v325, 8);
  _Block_object_dispose(&v329, 8);
  _Block_object_dispose(&v333, 8);
  _Block_object_dispose(v337, 8);
  _Block_object_dispose(&v339, 8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v346, 8);
  if (SHIBYTE(v352.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v352.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v353, 8);
  if (SHIBYTE(v359.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v359.__r_.__value_.__l.__data_);
  }
  _Block_object_dispose(&v360, 8);

  _Block_object_dispose(&v366, 8);
  if (v373) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v373);
  }
}

void sub_1B04667D4(_Unwind_Exception *a1)
{
  if (SLOBYTE(STACK[0x237]) < 0) {
    operator delete((void *)STACK[0x220]);
  }
  if (SLOBYTE(STACK[0x257]) < 0) {
    operator delete((void *)STACK[0x240]);
  }
  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x280], 8);
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2E0], 8);
  _Block_object_dispose(&STACK[0x300], 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x360], 8);
  if (SLOBYTE(STACK[0x3A7]) < 0) {
    operator delete((void *)STACK[0x390]);
  }
  _Block_object_dispose(&STACK[0x3A8], 8);
  if (SLOBYTE(STACK[0x3EF]) < 0) {
    operator delete((void *)STACK[0x3D8]);
  }
  _Block_object_dispose(&STACK[0x3F0], 8);
  if (SLOBYTE(STACK[0x437]) < 0) {
    operator delete((void *)STACK[0x420]);
  }
  _Block_object_dispose(&STACK[0x438], 8);

  _Block_object_dispose(&STACK[0x468], 8);
  if (STACK[0x4A0]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)STACK[0x4A0]);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__349(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__350(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN16ML3ImportSession13_getAlbumInfoENSt3__110shared_ptrI13ML3ImportItemEEx_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 160);
  memset(&v67, 0, sizeof(v67));
  memset(__str, 0, sizeof(__str));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v3, (uint64_t)__str, 3uLL);
  if (!*(unsigned char *)(a1 + 200)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), __str);
  }
  if (!*(unsigned char *)(a1 + 201)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), &__str[1]);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(char *)(v5 + 71) < 0)
  {
    if (*(void *)(v5 + 56)) {
      goto LABEL_10;
    }
  }
  else if (*(unsigned char *)(v5 + 71))
  {
    goto LABEL_10;
  }
  std::string::operator=((std::string *)(v5 + 48), &v67);
LABEL_10:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = (int)[v3 intForColumnIndex:3];
  }
  if (!*(unsigned char *)(a1 + 202)) {
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = (int)[v3 intForColumnIndex:4];
  }
  if (!*(unsigned char *)(a1 + 203)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [v3 intForColumnIndex:5] != 0;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = [v3 int64ForColumnIndex:6];
  }
  *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = [v3 int64ForColumnIndex:7];
  uint64_t v6 = [v3 dataForColumnIndex:8];
  if (!*(unsigned char *)(a1 + 204)) {
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = [v3 int64ForColumnIndex:9];
  }
  if (!*(unsigned char *)(a1 + 205)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = [v3 intForColumnIndex:10] != 0;
  }
  if (!*(unsigned char *)(a1 + 206)) {
    *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 24) = (int)[v3 intForColumnIndex:11];
  }
  uint64_t v7 = [v3 int64ForColumnIndex:12];
  int v8 = [v3 intForColumnIndex:13];
  uint64_t v9 = [v3 int64ForColumnIndex:14];
  if (!*(unsigned char *)(a1 + 207)) {
    *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = [v3 int64ForColumnIndex:15];
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 cStringForColumnIndex:16]);
  uint64_t v55 = v9;
  int v56 = v8;
  uint64_t v57 = v7;
  uint64_t v10 = [v3 int64ForColumnIndex:17];
  std::string::size_type v11 = [ML3AlbumGroupingIdentifier alloc];
  uint64_t v12 = ML3CPPBridgeString((const UInt8 *)&v67, 0);
  uint64_t v13 = -[ML3AlbumGroupingIdentifier initWithAlbumArtistPersistentID:groupingKey:feedURL:seasonNumber:compilation:](v11, "initWithAlbumArtistPersistentID:groupingKey:feedURL:seasonNumber:compilation:", v10, v6, v12, [v3 int64ForColumnIndex:6], objc_msgSend(v3, "intForColumnIndex:", 5) != 0);

  v14 = [ML3AlbumGroupingIdentifier alloc];
  uint64_t v15 = *(void *)(a1 + 168);
  uint64_t v16 = *(void **)(v4 + 8);
  unint64_t v17 = ML3CPPBridgeString((const UInt8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 0);
  uint64_t v18 = [v16 groupingKeyForString:v17];
  std::string::size_type v19 = ML3CPPBridgeString((const UInt8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), 0);
  uint64_t v20 = [(ML3AlbumGroupingIdentifier *)v14 initWithAlbumArtistPersistentID:v15 groupingKey:v18 feedURL:v19 seasonNumber:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) compilation:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
  uint64_t v21 = *(void *)(*(void *)(a1 + 144) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;

  uint64_t v23 = *(int *)(v4 + 32);
  uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(1, 16777225);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__itemRules + 56 * PropertyIndex + 4 * v23) == -1
    || ([*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) isEqual:v13] & 1) != 0)
  {
    goto LABEL_34;
  }
  char v25 = *(std::__shared_weak_count **)(a1 + 184);
  v60[0] = *(void *)(a1 + 176);
  v60[1] = v25;
  if (v25) {
    atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(v4, (uint64_t)v60, 0x1000009u);
  char v27 = shouldPreserveTrackProperty;
  if (v25)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    if (v27)
    {
LABEL_34:
      uint64_t v53 = v13;
      uint64_t v54 = v6;
      if (SHIBYTE(__str[0].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v59, __str[0].__r_.__value_.__l.__data_, __str[0].__r_.__value_.__l.__size_);
      }
      else {
        std::string v59 = __str[0];
      }
      if (SHIBYTE(__str[1].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v58, __str[1].__r_.__value_.__l.__data_, __str[1].__r_.__value_.__l.__size_);
      }
      else {
        std::string v58 = __str[1];
      }
      uint64_t v28 = [*(id *)(a1 + 32) longLongValue];
      int v29 = [v3 int64ForColumnIndex:3];
      int v30 = [v3 intForColumnIndex:11];
      int v31 = [v3 int64ForColumnIndex:4];
      int v32 = [v3 int64ForColumnIndex:9];
      uint64_t v33 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v4, (uint64_t)&v58, (uint64_t)&v59);
      uint64_t v51 = v34;
      uint64_t v52 = v33;
      int v50 = v30;
      int v35 = [v3 intForColumnIndex:10];
      uint64_t v36 = *(void *)(*(void *)(a1 + 136) + 8);
      int v37 = [v3 intForColumnIndex:5];
      id v38 = operator new(0xB0uLL);
      int v49 = v35;
      v38[1] = 0;
      v38[2] = 0;
      *id v38 = &unk_1F08C74B8;
      int v39 = v32;
      if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v64, v59.__r_.__value_.__l.__data_, v59.__r_.__value_.__l.__size_);
      }
      else {
        std::string v64 = v59;
      }
      int v40 = v29;
      uint64_t v41 = v28;
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v63, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
      }
      else {
        std::string v63 = v58;
      }
      uint64_t v42 = *(void *)(v36 + 24);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v62, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v62 = __p;
      }
      ML3AlbumData::ML3AlbumData((uint64_t)(v38 + 3), v41, (long long *)&v64, (long long *)&v63, v40, v50 != 0, v31, v39, v52, v51, v49, v57, v42, (long long *)&v62, v37 != 0, v56 != 0, v55);
      uint64_t v13 = v53;
      uint64_t v6 = v54;
      if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v62.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v63.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v64.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v64.__r_.__value_.__l.__data_);
      }
      *(void *)&long long v43 = v38 + 3;
      *((void *)&v43 + 1) = v38;
      uint64_t v44 = *(void *)(*(void *)(a1 + 152) + 8);
      __int16 v45 = *(std::__shared_weak_count **)(v44 + 56);
      *(_OWORD *)(v44 + 4_Block_object_dispose(&STACK[0x200], 8) = v43;
      if (v45) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v45);
      }
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v58.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v59.__r_.__value_.__l.__data_);
      }
      goto LABEL_61;
    }
  }
  else if (shouldPreserveTrackProperty)
  {
    goto LABEL_34;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) == *(void *)(a1 + 192))
  {
    v47 = *(void **)(v4 + 16);
    uint64_t v65 = *(void *)(a1 + 32);
    v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
    [v47 executeUpdate:@"UPDATE album SET representative_item_pid=0 WHERE album_pid=?" withParameters:v48 error:0];
  }
LABEL_61:

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  for (uint64_t i = 0; i != -9; i -= 3)
  {
    if (SHIBYTE(v67.__r_.__value_.__r.__words[i + 2]) < 0) {
      operator delete(*(void **)((char *)&v67.__r_.__value_.__l.__data_ + i * 8));
    }
  }
}

void sub_1B046781C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,void *__p,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51)
{
  if (a45 < 0) {
    operator delete(__p);
  }

  uint64_t v57 = 0;
  uint64_t v58 = v55 - 176;
  while (1)
  {
    if (*(char *)(v58 + v57 + 71) < 0) {
      operator delete(*(void **)(v58 + v57 + 48));
    }
    v57 -= 24;
    if (v57 == -72)
    {

      _Unwind_Resume(a1);
    }
  }
}

void ___ZN16ML3ImportSession21_getExistingAlbumInfoEP26ML3AlbumGroupingIdentifierx_block_invoke(void **a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = (uint64_t *)a1[6];
  v63[0] = 0;
  long long v62 = 0u;
  memset(v61, 0, sizeof(v61));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v5, (uint64_t)v61, 3uLL);
  if (SHIBYTE(v61[0].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v60, v61[0].__r_.__value_.__l.__data_, v61[0].__r_.__value_.__l.__size_);
  }
  else {
    std::string v60 = v61[0];
  }
  if (SHIBYTE(v61[1].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v59, v61[1].__r_.__value_.__l.__data_, v61[1].__r_.__value_.__l.__size_);
  }
  else {
    std::string v59 = v61[1];
  }
  if (SHIBYTE(v63[0]) < 0)
  {
    std::string::__init_copy_ctor_external(&v58, (const std::string::value_type *)v62, *((std::string::size_type *)&v62 + 1));
  }
  else
  {
    *(_OWORD *)&v58.__r_.__value_.__l.__data_ = v62;
    v58.__r_.__value_.__r.__words[2] = v63[0];
  }
  uint64_t v7 = [v5 int64ForColumnIndex:3];
  id v38 = [v5 objectAtIndexedSubscript:4];
  uint64_t v37 = [v5 int64ForColumnIndex:5];
  int v8 = [v5 intForColumnIndex:6];
  int v9 = [v5 intForColumnIndex:7];
  int v57 = v9;
  int v56 = [v5 intForColumnIndex:8];
  int v55 = [v5 intForColumnIndex:9];
  int v54 = [v5 intForColumnIndex:10];
  uint64_t v10 = [v5 objectAtIndexedSubscript:11];
  if (v10)
  {
    std::string::size_type v11 = (void *)v6[3];
    uint64_t v12 = [v5 objectAtIndexedSubscript:11];
    uint64_t v13 = [v11 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 ML3NameOrderValue];
    *(void *)&long long v53 = v14;
    *((void *)&v53 + 1) = v15;
  }
  else
  {
    uint64_t v14 = 0;
    long long v53 = *(_OWORD *)"";
  }

  uint64_t v16 = [v5 objectAtIndexedSubscript:11];
  if (v16) {
    BOOL v17 = v14 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  int v18 = v17;

  if (v18)
  {
    std::string::size_type v19 = [v5 objectAtIndexedSubscript:11];
    *(void *)&long long v53 = ML3ImportSession::_getNameOrderForString((ML3ImportSession *)v6, v19);
    *((void *)&v53 + 1) = v20;
  }
  int v52 = [v5 intForColumnIndex:12];
  int v51 = [v5 intForColumnIndex:13];
  uint64_t v50 = [v5 int64ForColumnIndex:14];
  BOOL v49 = [v5 intForColumnIndex:15] != 0;
  uint64_t v48 = [v5 int64ForColumnIndex:16];
  uint64_t v47 = [v5 int64ForColumnIndex:17];
  std::string::basic_string[abi:ne180100]<0>(v45, (char *)[v5 cStringForColumnIndex:18]);
  std::allocate_shared[abi:ne180100]<ML3AlbumData,std::allocator<ML3AlbumData>,long long &,std::string &,std::string &,int &,int &,int &,int &,ML3NameOrder &,int &,long long &,long long &,std::string &,int &,BOOL &,long long &,void>(__p, v7, (uint64_t)&v60, (uint64_t)&v59, &v56, &v51, &v55, &v54, (uint64_t *)&v53, &v52, &v50, &v48, (uint64_t)v45, &v57, (char *)&v49, &v47);
  uint64_t v21 = *((void *)a1[5] + 1);
  v22 = *(std::__shared_weak_count **)(v21 + 56);
  *(_OWORD *)(v21 + 4_Block_object_dispose(&STACK[0x200], 8) = *(_OWORD *)__p;
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (a1[4])
  {
    uint64_t v23 = [ML3AlbumGroupingIdentifier alloc];
    uint64_t v24 = ML3CPPBridgeString((const UInt8 *)&v58, 1);
    char v25 = [(ML3AlbumGroupingIdentifier *)v23 initWithAlbumArtistPersistentID:v37 groupingKey:v38 feedURL:v24 seasonNumber:v8 compilation:v9 != 0];

    if (v25 && [(ML3AlbumGroupingIdentifier *)v25 isEqual:a1[4]])
    {
      *a4 = 1;
      char v26 = [(ML3AlbumGroupingIdentifier *)v25 keyValue];
      ML3CPPStringFromData(v39, v26);
      uint64_t v27 = *((void *)a1[5] + 1);
      *(_OWORD *)std::string __p = *(_OWORD *)&v39[0].super.isa;
      uint64_t v28 = v40;
      v39[0].super.isa = 0;
      v39[1].super.isa = 0;
      int v40 = 0;
      uint64_t v30 = *(void *)(v27 + 48);
      int v29 = *(std::__shared_weak_count **)(v27 + 56);
      uint64_t v42 = v28;
      uint64_t v43 = v30;
      uint64_t v44 = v29;
      if (v29) {
        atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3AlbumData>>>((uint64_t)(v6 + 156), (unsigned __int8 *)__p, (uint64_t)__p);
      if (v44) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v44);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v40) < 0) {
        operator delete(v39[0].super.isa);
      }
    }
  }
  unint64_t v31 = (unint64_t)a1[7];
  if (v31)
  {
    uint64_t v32 = *((void *)a1[5] + 1);
    uint64_t v34 = *(void **)(v32 + 48);
    uint64_t v33 = *(std::__shared_weak_count **)(v32 + 56);
    __p[0] = a1[7];
    __p[1] = v34;
    uint64_t v42 = v33;
    if (v33) {
      atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3AlbumData>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3AlbumData>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3AlbumData>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3AlbumData>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3AlbumData>>>(v6 + 126, v31, (uint64_t)__p);
    if (v42) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v42);
    }
  }
  if (v46 < 0) {
    operator delete(v45[0]);
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
  for (uint64_t i = 0; i != -9; i -= 3)
  {
    if (SHIBYTE(v63[i]) < 0) {
      operator delete((void *)v63[i - 2]);
    }
  }
}

void sub_1B0467ED4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52)
{
  std::pair<std::string const,std::shared_ptr<ML3AlbumData>>::~pair((uint64_t)&a26);
  if (a25 < 0) {
    operator delete(__p);
  }

  if (a37 < 0) {
    operator delete(a32);
  }

  if (a52 < 0) {
    operator delete(a47);
  }
  if (*(char *)(v55 - 217) < 0) {
    operator delete(*(void **)(v55 - 240));
  }
  if (*(char *)(v55 - 185) < 0) {
    operator delete(*(void **)(v55 - 208));
  }
  uint64_t v57 = 0;
  uint64_t v58 = v55 - 176;
  while (1)
  {
    if (*(char *)(v58 + v57 + 71) < 0) {
      operator delete(*(void **)(v58 + v57 + 48));
    }
    v57 -= 24;
    if (v57 == -72)
    {

      _Unwind_Resume(a1);
    }
  }
}

void __destroy_helper_block_ea8_176c41_ZTSNSt3__110shared_ptrI13ML3ImportItemEE(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 184);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t __copy_helper_block_ea8_176c41_ZTSNSt3__110shared_ptrI13ML3ImportItemEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 184);
  *(void *)(result + 176) = *(void *)(a2 + 176);
  *(void *)(result + 184) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

__n128 __Block_byref_object_copy__283(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__284(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN16ML3ImportSession19_getAlbumArtistInfoENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 80);
  memset(__str, 0, sizeof(__str));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v3, (uint64_t)__str, 2uLL);
  if (!*(unsigned char *)(a1 + 112)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), __str);
  }
  if (!*(unsigned char *)(a1 + 113)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), &__str[1]);
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 int64ForColumnIndex:2];
  uint64_t v5 = [v3 int64ForColumnIndex:3];
  uint64_t v6 = [v3 dataForColumnIndex:4];
  uint64_t v7 = [v3 int64ForColumnIndex:5];
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 cStringForColumnIndex:6]);
  int v8 = [v3 intForColumnIndex:7];
  int v9 = [v3 intForColumnIndex:8];
  uint64_t v33 = [v3 int64ForColumnIndex:9];
  uint64_t v10 = *(void **)(v4 + 8);
  std::string::size_type v11 = ML3CPPBridgeString((const UInt8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 0);
  uint64_t v12 = [v10 groupingKeyForString:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = *(int *)(v4 + 32);
  uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(1, 16777228);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__itemRules + 56 * PropertyIndex + 4 * v15) == -1
    || ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isEqualToData:v6] & 1) != 0)
  {
    goto LABEL_13;
  }
  BOOL v17 = *(std::__shared_weak_count **)(a1 + 96);
  v35[0] = *(void *)(a1 + 88);
  v35[1] = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(v4, (uint64_t)v35, 0x100000Cu);
  char v19 = shouldPreserveTrackProperty;
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    if (v19)
    {
LABEL_13:
      int v32 = v9;
      if (SHIBYTE(__str[1].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v34, __str[1].__r_.__value_.__l.__data_, __str[1].__r_.__value_.__l.__size_);
      }
      else {
        std::string v34 = __str[1];
      }
      uint64_t v20 = [*(id *)(a1 + 32) longLongValue];
      uint64_t v21 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v4, (uint64_t)&v34, (uint64_t)__str);
      uint64_t v23 = v22;
      char v25 = operator new(0xD8uLL);
      v25[1] = 0;
      v25[2] = 0;
      *char v25 = &unk_1F08C7528;
      if (SHIBYTE(__str[0].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v43, __str[0].__r_.__value_.__l.__data_, __str[0].__r_.__value_.__l.__size_);
      }
      else {
        std::string v43 = __str[0];
      }
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v42, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
      }
      else {
        std::string v42 = v34;
      }
      long long v40 = 0uLL;
      uint64_t v41 = 0;
      uint64_t v39 = 0;
      long long v38 = 0uLL;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v37, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v37 = __p;
      }
      ML3ArtistData::ML3ArtistData((uint64_t)(v25 + 3), v20, (long long *)&v43, (long long *)&v42, &v40, &v38, v5, v24, v21, v23, 0, 0x7FFFFFFFFFFFFFFFLL, v7, (long long *)&v37, v8 != 0, v32, v33);
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v37.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v42.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v43.__r_.__value_.__l.__data_);
      }
      *(void *)&long long v26 = v25 + 3;
      *((void *)&v26 + 1) = v25;
      uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v28 = *(std::__shared_weak_count **)(v27 + 56);
      *(_OWORD *)(v27 + 4_Block_object_dispose(&STACK[0x200], 8) = v26;
      if (v28) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v28);
      }
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v34.__r_.__value_.__l.__data_);
      }
      goto LABEL_35;
    }
  }
  else if (shouldPreserveTrackProperty)
  {
    goto LABEL_13;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 104))
  {
    uint64_t v30 = *(void **)(v4 + 16);
    uint64_t v44 = *(void *)(a1 + 32);
    unint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
    [v30 executeUpdate:@"UPDATE album_artist SET representative_item_pid=0 WHERE album_artist_pid=?" withParameters:v31 error:0];
  }
LABEL_35:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  for (unint64_t i = 0; i != 0x1FFFFFFFFFFFFFFALL; i -= 3)
  {
    if (SHIBYTE(__str[1].__r_.__value_.__r.__words[i + 2]) < 0) {
      operator delete(__str[i / 3 + 1].__r_.__value_.__l.__data_);
    }
  }
}

void sub_1B046856C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a34 < 0) {
    operator delete(__p);
  }

  uint64_t v45 = 0;
  uint64_t v46 = v43 - 144;
  while (1)
  {
    if (*(char *)(v46 + v45 + 47) < 0) {
      operator delete(*(void **)(v46 + v45 + 24));
    }
    v45 -= 24;
    if (v45 == -48)
    {

      _Unwind_Resume(a1);
    }
  }
}

void ___ZN16ML3ImportSession27_getExistingAlbumArtistInfoEP6NSDatax_block_invoke(void **a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = (uint64_t *)a1[6];
  memset(v50, 0, sizeof(v50));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v6, (uint64_t)v50, 2uLL);
  if (SHIBYTE(v50[0].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v49, v50[0].__r_.__value_.__l.__data_, v50[0].__r_.__value_.__l.__size_);
  }
  else {
    std::string v49 = v50[0];
  }
  if (SHIBYTE(v50[1].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v48, v50[1].__r_.__value_.__l.__data_, v50[1].__r_.__value_.__l.__size_);
  }
  else {
    std::string v48 = v50[1];
  }
  uint64_t v8 = [v6 int64ForColumnIndex:2];
  uint64_t v47 = [v6 int64ForColumnIndex:3];
  int v9 = [v6 objectAtIndexedSubscript:4];
  if (v9)
  {
    uint64_t v10 = (void *)v7[3];
    std::string::size_type v11 = [v6 objectAtIndexedSubscript:4];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 ML3NameOrderValue];
    v46[0] = v13;
    v46[1] = v14;
  }
  else
  {
    uint64_t v13 = 0;
    *(_OWORD *)uint64_t v46 = *(_OWORD *)"";
  }

  uint64_t v15 = [v6 objectAtIndexedSubscript:3];
  if (v15) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  int v17 = v16;

  if (v17)
  {
    int v18 = [v6 objectAtIndexedSubscript:4];
    v46[0] = ML3ImportSession::_getNameOrderForString((ML3ImportSession *)v7, v18);
    v46[1] = v19;
  }
  uint64_t v45 = [v6 int64ForColumnIndex:5];
  std::string::basic_string[abi:ne180100]<0>(v43, (char *)[v6 cStringForColumnIndex:6]);
  BOOL v42 = [v6 intForColumnIndex:7] != 0;
  int v41 = [v6 intForColumnIndex:8];
  uint64_t v40 = [v6 int64ForColumnIndex:9];
  v39[0] = [v6 int64ForColumnIndex:10];
  v39[1] = (int)[v6 intForColumnIndex:11];
  v32[0] = 0;
  v32[1] = 0;
  uint64_t v33 = 0;
  __p[0] = 0;
  __p[1] = 0;
  std::string v37 = 0;
  std::allocate_shared[abi:ne180100]<ML3ArtistData,std::allocator<ML3ArtistData>,long long &,std::string &,std::string &,std::string,std::string,long long &,ML3NameOrder &,ML3NameOrder &,long long &,std::string &,BOOL &,int &,long long &,void>(&v38, v8, (uint64_t)&v49, (uint64_t)&v48, (uint64_t)v32, (uint64_t)__p, &v47, v46, v39, &v45, (uint64_t)v43, (char *)&v42, &v41, &v40);
  uint64_t v20 = *((void *)a1[5] + 1);
  uint64_t v21 = *(std::__shared_weak_count **)(v20 + 56);
  *(_OWORD *)(v20 + 4_Block_object_dispose(&STACK[0x200], 8) = v38;
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  if (SHIBYTE(v37) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v33) < 0) {
    operator delete(v32[0]);
  }
  uint64_t v22 = a1[4];
  if (v22)
  {
    ML3CPPStringFromData((NSData *)__p, v22);
    uint64_t v23 = *((void *)a1[5] + 1);
    *(_OWORD *)int v32 = *(_OWORD *)__p;
    uint64_t v24 = v37;
    __p[0] = 0;
    __p[1] = 0;
    std::string v37 = 0;
    uint64_t v26 = *(void *)(v23 + 48);
    char v25 = *(std::__shared_weak_count **)(v23 + 56);
    uint64_t v33 = v24;
    uint64_t v34 = v26;
    int v35 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3ArtistData>>>((uint64_t)(v7 + 141), (unsigned __int8 *)v32, (uint64_t)v32);
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    if (SHIBYTE(v33) < 0) {
      operator delete(v32[0]);
    }
    if (SHIBYTE(v37) < 0) {
      operator delete(__p[0]);
    }
  }
  unint64_t v27 = (unint64_t)a1[7];
  if (v27)
  {
    uint64_t v28 = *((void *)a1[5] + 1);
    uint64_t v30 = *(void **)(v28 + 48);
    int v29 = *(std::__shared_weak_count **)(v28 + 56);
    v32[0] = a1[7];
    v32[1] = v30;
    uint64_t v33 = v29;
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ArtistData>>>(v7 + 131, v27, (uint64_t)v32);
    if (v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
  }
  *a4 = 1;
  if (v44 < 0) {
    operator delete(v43[0]);
  }
  if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v48.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v49.__r_.__value_.__l.__data_);
  }
  for (unint64_t i = 0; i != 0x1FFFFFFFFFFFFFFALL; i -= 3)
  {
    if (SHIBYTE(v50[1].__r_.__value_.__r.__words[i + 2]) < 0) {
      operator delete(v50[i / 3 + 1].__r_.__value_.__l.__data_);
    }
  }
}

void sub_1B0468AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (*(char *)(v38 - 153) < 0) {
    operator delete(*(void **)(v38 - 176));
  }
  uint64_t v40 = 0;
  uint64_t v41 = v38 - 144;
  while (1)
  {
    if (*(char *)(v41 + v40 + 47) < 0) {
      operator delete(*(void **)(v41 + v40 + 24));
    }
    v40 -= 24;
    if (v40 == -48)
    {

      _Unwind_Resume(a1);
    }
  }
}

void __destroy_helper_block_ea8_88c41_ZTSNSt3__110shared_ptrI13ML3ImportItemEE(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 96);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t __copy_helper_block_ea8_88c41_ZTSNSt3__110shared_ptrI13ML3ImportItemEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 96);
  *(void *)(result + 8_Block_object_dispose(&STACK[0x200], 8) = *(void *)(a2 + 88);
  *(void *)(result + 96) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void ___ZN16ML3ImportSession14_getArtistInfoENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 96);
  memset(v49, 0, sizeof(v49));
  memset(__str, 0, sizeof(__str));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v3, (uint64_t)__str, 4uLL);
  if (!*(unsigned char *)(a1 + 128)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), __str);
  }
  if (!*(unsigned char *)(a1 + 129)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), &__str[1]);
  }
  if (!*(unsigned char *)(a1 + 130)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), v49);
  }
  if (!*(unsigned char *)(a1 + 131)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 64) + 8) + 48), &v49[1]);
  }
  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v3 int64ForColumnIndex:4];
  uint64_t v5 = [v3 int64ForColumnIndex:5];
  id v6 = [v3 dataForColumnIndex:6];
  uint64_t v7 = [v3 int64ForColumnIndex:7];
  int v37 = [v3 intForColumnIndex:8];
  uint64_t v8 = *(void **)(v4 + 8);
  int v9 = ML3CPPBridgeString((const UInt8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 0);
  uint64_t v36 = v7;
  int v10 = *(unsigned __int8 *)(a1 + 132);
  if (*(unsigned char *)(a1 + 132))
  {
    ML3CPPBridgeString((const UInt8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), 0);
    std::string::size_type v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    std::string::size_type v11 = &stru_1F08D4D70;
  }
  uint64_t v12 = [v8 artistGroupingKeyForArtistName:v9 seriesName:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (v10) {
  uint64_t v15 = *(int *)(v4 + 32);
  }
  uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(1, 16777220);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__itemRules + 56 * PropertyIndex + 4 * v15) == -1
    || ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) isEqualToData:v6] & 1) != 0)
  {
    goto LABEL_22;
  }
  int v17 = *(std::__shared_weak_count **)(a1 + 112);
  v40[0] = *(void *)(a1 + 104);
  v40[1] = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(v4, (uint64_t)v40, 0x1000004u);
  char v19 = shouldPreserveTrackProperty;
  if (v17)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    if (v19)
    {
LABEL_22:
      int v35 = v6;
      if (SHIBYTE(__str[1].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v39, __str[1].__r_.__value_.__l.__data_, __str[1].__r_.__value_.__l.__size_);
      }
      else {
        std::string v39 = __str[1];
      }
      if (SHIBYTE(v49[1].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v38, v49[1].__r_.__value_.__l.__data_, v49[1].__r_.__value_.__l.__size_);
      }
      else {
        std::string v38 = v49[1];
      }
      uint64_t v20 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v4, (uint64_t)&v39, (uint64_t)__str);
      uint64_t v22 = v21;
      uint64_t v23 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v4, (uint64_t)&v38, (uint64_t)v49);
      uint64_t v25 = v24;
      uint64_t v26 = [*(id *)(a1 + 32) longLongValue];
      uint64_t v28 = operator new(0xD8uLL);
      v28[1] = 0;
      v28[2] = 0;
      void *v28 = &unk_1F08C7528;
      if (SHIBYTE(__str[0].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v46, __str[0].__r_.__value_.__l.__data_, __str[0].__r_.__value_.__l.__size_);
      }
      else {
        std::string v46 = __str[0];
      }
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v45, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
      }
      else {
        std::string v45 = v39;
      }
      if (SHIBYTE(v49[0].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v44, v49[0].__r_.__value_.__l.__data_, v49[0].__r_.__value_.__l.__size_);
      }
      else {
        std::string v44 = v49[0];
      }
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v43, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
      }
      else {
        std::string v43 = v38;
      }
      long long v41 = 0uLL;
      uint64_t v42 = 0;
      ML3ArtistData::ML3ArtistData((uint64_t)(v28 + 3), v26, (long long *)&v46, (long long *)&v45, (long long *)&v44, (long long *)&v43, v5, v27, v20, v22, v23, v25, v36, &v41, v37 != 0, 0, 0);
      id v6 = v35;
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v43.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v44.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v45.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v46.__r_.__value_.__l.__data_);
      }
      *(void *)&long long v29 = v28 + 3;
      *((void *)&v29 + 1) = v28;
      uint64_t v30 = *(void *)(*(void *)(a1 + 88) + 8);
      unint64_t v31 = *(std::__shared_weak_count **)(v30 + 56);
      *(_OWORD *)(v30 + 4_Block_object_dispose(&STACK[0x200], 8) = v29;
      if (v31) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v31);
      }
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v38.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v39.__r_.__value_.__l.__data_);
      }
      goto LABEL_54;
    }
  }
  else if (shouldPreserveTrackProperty)
  {
    goto LABEL_22;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) == *(void *)(a1 + 120))
  {
    uint64_t v33 = *(void **)(v4 + 16);
    uint64_t v47 = *(void *)(a1 + 32);
    uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v33 executeUpdate:@"UPDATE item_artist SET representative_item_pid=0 WHERE item_artist_pid=?" withParameters:v34 error:0];
  }
LABEL_54:

  for (unint64_t i = 0; i != 0x1FFFFFFFFFFFFFF4; i -= 3)
  {
    if (SHIBYTE(v49[1].__r_.__value_.__r.__words[i + 2]) < 0) {
      operator delete(v49[i / 3 + 1].__r_.__value_.__l.__data_);
    }
  }
}

void sub_1B04691B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,void *__p,uint64_t a47,int a48,__int16 a49,char a50,char a51,uint64_t a52,void *a53,uint64_t a54,int a55,__int16 a56,char a57,char a58)
{
  uint64_t v63 = 0;
  uint64_t v64 = v61 - 192;
  while (1)
  {
    if (*(char *)(v64 + v63 + 95) < 0) {
      operator delete(*(void **)(v64 + v63 + 72));
    }
    v63 -= 24;
    if (v63 == -96)
    {

      _Unwind_Resume(a1);
    }
  }
}

void ___ZN16ML3ImportSession22_getExistingArtistInfoEP6NSDatax_block_invoke(void **a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = (uint64_t *)a1[6];
  memset(v62, 0, sizeof(v62));
  long long v61 = 0u;
  memset(v60, 0, sizeof(v60));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v6, (uint64_t)v60, 4uLL);
  if (SHIBYTE(v60[0].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v59, v60[0].__r_.__value_.__l.__data_, v60[0].__r_.__value_.__l.__size_);
  }
  else {
    std::string v59 = v60[0];
  }
  if (SHIBYTE(v60[1].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v58, v60[1].__r_.__value_.__l.__data_, v60[1].__r_.__value_.__l.__size_);
  }
  else {
    std::string v58 = v60[1];
  }
  if (SBYTE7(v62[0]) < 0)
  {
    std::string::__init_copy_ctor_external(&v57, (const std::string::value_type *)v61, *((std::string::size_type *)&v61 + 1));
  }
  else
  {
    *(_OWORD *)&v57.__r_.__value_.__l.__data_ = v61;
    v57.__r_.__value_.__r.__words[2] = *(void *)&v62[0];
  }
  if (SHIBYTE(v62[1]) < 0) {
    std::string::__init_copy_ctor_external(&v56, *((const std::string::value_type **)&v62[0] + 1), *(std::string::size_type *)&v62[1]);
  }
  else {
    std::string v56 = *(std::string *)((char *)v62 + 8);
  }
  uint64_t v8 = [v6 int64ForColumnIndex:4];
  uint64_t v55 = [v6 int64ForColumnIndex:5];
  int v9 = [v6 objectAtIndexedSubscript:6];
  if (v9)
  {
    int v10 = (void *)v7[3];
    std::string::size_type v11 = [v6 objectAtIndexedSubscript:6];
    uint64_t v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 ML3NameOrderValue];
    v54[0] = v13;
    v54[1] = v14;
  }
  else
  {
    uint64_t v13 = 0;
    *(_OWORD *)int v54 = *(_OWORD *)"";
  }

  uint64_t v15 = [v6 objectAtIndexedSubscript:6];
  if (v15) {
    BOOL v16 = v13 == 0;
  }
  else {
    BOOL v16 = 0;
  }
  int v17 = v16;

  if (v17)
  {
    int v18 = [v6 objectAtIndexedSubscript:6];
    v54[0] = ML3ImportSession::_getNameOrderForString((ML3ImportSession *)v7, v18);
    v54[1] = v19;
  }
  uint64_t v20 = [v6 objectAtIndexedSubscript:7];
  if (v20)
  {
    uint64_t v21 = (void *)v7[3];
    uint64_t v22 = [v6 objectAtIndexedSubscript:7];
    uint64_t v23 = [v21 objectForKeyedSubscript:v22];
    uint64_t v24 = [v23 ML3NameOrderValue];
    *(void *)&long long v53 = v24;
    *((void *)&v53 + 1) = v25;
  }
  else
  {
    uint64_t v24 = 0;
    long long v53 = *(_OWORD *)"";
  }

  uint64_t v26 = [v6 objectAtIndexedSubscript:7];
  if (v26) {
    BOOL v27 = v24 == 0;
  }
  else {
    BOOL v27 = 0;
  }
  int v28 = v27;

  if (v28)
  {
    long long v29 = [v6 objectAtIndexedSubscript:7];
    *(void *)&long long v53 = ML3ImportSession::_getNameOrderForString((ML3ImportSession *)v7, v29);
    *((void *)&v53 + 1) = v30;
  }
  uint64_t v52 = [v6 int64ForColumnIndex:8];
  BOOL v51 = [v6 intForColumnIndex:9] != 0;
  __p[0] = 0;
  __p[1] = 0;
  std::string v46 = 0;
  int v49 = 0;
  int v50 = 0;
  std::allocate_shared[abi:ne180100]<ML3ArtistData,std::allocator<ML3ArtistData>,long long &,std::string &,std::string &,std::string &,std::string &,long long &,ML3NameOrder &,ML3NameOrder &,long long &,std::string,BOOL &,int,int,void>(v43, v8, (uint64_t)&v59, (uint64_t)&v58, (uint64_t)&v57, (uint64_t)&v56, &v55, v54, (uint64_t *)&v53, &v52, (uint64_t)__p, (char *)&v51, &v50, &v49);
  uint64_t v31 = *((void *)a1[5] + 1);
  int v32 = *(std::__shared_weak_count **)(v31 + 56);
  *(_OWORD *)(v31 + 4_Block_object_dispose(&STACK[0x200], 8) = *(_OWORD *)&v43[0].super.isa;
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  if (SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v33 = a1[4];
  if (v33)
  {
    ML3CPPStringFromData(v43, v33);
    uint64_t v34 = *((void *)a1[5] + 1);
    *(_OWORD *)std::string __p = *(_OWORD *)&v43[0].super.isa;
    int v35 = v44;
    v43[0].super.isa = 0;
    v43[1].super.isa = 0;
    std::string v44 = 0;
    uint64_t v37 = *(void *)(v34 + 48);
    uint64_t v36 = *(std::__shared_weak_count **)(v34 + 56);
    std::string v46 = v35;
    uint64_t v47 = v37;
    std::string v48 = v36;
    if (v36) {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3ArtistData>>>((uint64_t)(v7 + 136), (unsigned __int8 *)__p, (uint64_t)__p);
    if (v48) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v48);
    }
    if (SHIBYTE(v46) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v44) < 0) {
      operator delete(v43[0].super.isa);
    }
  }
  unint64_t v38 = (unint64_t)a1[7];
  if (v38)
  {
    uint64_t v39 = *((void *)a1[5] + 1);
    long long v41 = *(void **)(v39 + 48);
    uint64_t v40 = *(std::__shared_weak_count **)(v39 + 56);
    __p[0] = a1[7];
    __p[1] = v41;
    std::string v46 = v40;
    if (v40) {
      atomic_fetch_add_explicit(&v40->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ArtistData>>>>::__emplace_unique_key_args<long long,std::pair<long long const,std::shared_ptr<ML3ArtistData>>>(v7 + 121, v38, (uint64_t)__p);
    if (v46) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v46);
    }
  }
  *a4 = 1;
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v57.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v58.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v59.__r_.__value_.__l.__data_);
  }
  for (uint64_t i = 0; i != -96; i -= 24)
  {
    if (*((char *)&v62[1] + i + 15) < 0) {
      operator delete(*(void **)((char *)v62 + i + 8));
    }
  }
}

void sub_1B04697E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55)
{
  if (a48 < 0) {
    operator delete(__p);
  }
  if (a55 < 0) {
    operator delete(a50);
  }
  if (*(char *)(v56 - 201) < 0) {
    operator delete(*(void **)(v56 - 224));
  }
  uint64_t v58 = 0;
  uint64_t v59 = v56 - 192;
  while (1)
  {
    if (*(char *)(v59 + v58 + 95) < 0) {
      operator delete(*(void **)(v59 + v58 + 72));
    }
    v58 -= 24;
    if (v58 == -96)
    {

      _Unwind_Resume(a1);
    }
  }
}

void __destroy_helper_block_ea8_104c41_ZTSNSt3__110shared_ptrI13ML3ImportItemEE(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 112);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t __copy_helper_block_ea8_104c41_ZTSNSt3__110shared_ptrI13ML3ImportItemEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 112);
  *(void *)(result + 104) = *(void *)(a2 + 104);
  *(void *)(result + 112) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void ___ZN16ML3ImportSession21_getDefaultEmptyGenreEv_block_invoke()
{
  v0 = (char *)operator new(0x50uLL);
  *((void *)v0 + 1) = 0;
  *((void *)v0 + 2) = 0;
  *(void *)v0 = &unk_1F08C74F0;
  *(_OWORD *)(v0 + 56) = *(_OWORD *)"";
  *(_OWORD *)(v0 + 40) = 0u;
  *((void *)v0 + 9) = 0;
  v1 = (std::__shared_weak_count *)qword_1E9B320F0;
  qword_1E9B320F0 = (uint64_t)v0;
  *(_OWORD *)(v0 + 24) = 0u;
  ML3ImportSession::_getDefaultEmptyGenre(void)::__emptyGenreData = (uint64_t)(v0 + 24);
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__shared_ptr_emplace<ML3GenreData>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
}

void std::__shared_ptr_emplace<ML3GenreData>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C74F0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void std::__shared_ptr_emplace<ML3GenreData>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C74F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::shared_ptr<ML3GenreData>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

uint64_t std::__shared_ptr_emplace<ML3GenreImportItem>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<ML3GenreImportItem>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7608;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void std::__shared_ptr_emplace<ML3GenreImportItem>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7608;
  std::__shared_weak_count::~__shared_weak_count(this);
}

__n128 __Block_byref_object_copy__395(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__396(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN16ML3ImportSession21_getExistingGenreInfoEP6NSDatax_block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[6];
  memset(&v86, 0, sizeof(v86));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v5, (uint64_t)&v86, 1uLL);
  uint64_t v8 = [v5 objectAtIndexedSubscript:0];
  if (v8)
  {
    int v9 = *(void **)(v7 + 24);
    int v10 = [v5 objectAtIndexedSubscript:0];
    std::string::size_type v11 = [v9 objectForKeyedSubscript:v10];
    uint64_t NameOrderForString = [v11 ML3NameOrderValue];
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t NameOrderForString = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  uint64_t v15 = [v5 objectAtIndexedSubscript:1];

  if (v15 && !NameOrderForString)
  {
    BOOL v16 = [v5 objectAtIndexedSubscript:0];
    uint64_t NameOrderForString = ML3ImportSession::_getNameOrderForString((ML3ImportSession *)v7, v16);
    uint64_t v14 = v17;
  }
  uint64_t v18 = [v5 int64ForColumnIndex:2];
  uint64_t v19 = [v5 objectAtIndexedSubscript:1];
  uint64_t v20 = [v19 longLongValue];
  uint64_t v21 = operator new(0x50uLL);
  v21[1] = 0;
  v21[2] = 0;
  void *v21 = &unk_1F08C74F0;
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v87, v86.__r_.__value_.__l.__data_, v86.__r_.__value_.__l.__size_);
  }
  else {
    std::string v87 = v86;
  }
  v21[3] = v20;
  uint64_t v22 = (std::string *)(v21 + 4);
  if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v20 = v87.__r_.__value_.__r.__words[0];
    std::string::__init_copy_ctor_external(v22, v87.__r_.__value_.__l.__data_, v87.__r_.__value_.__l.__size_);
    v21[7] = NameOrderForString;
    v21[8] = v14;
    v21[9] = v18;
    operator delete((void *)v20);
  }
  else
  {
    *(_OWORD *)&v22->__r_.__value_.__l.__data_ = *(_OWORD *)&v87.__r_.__value_.__l.__data_;
    v21[6] = *((void *)&v87.__r_.__value_.__l + 2);
    v21[7] = NameOrderForString;
    v21[8] = v14;
    v21[9] = v18;
  }
  *(void *)&long long v23 = v21 + 3;
  *((void *)&v23 + 1) = v21;
  uint64_t v24 = *(void *)(a1[5] + 8);
  uint64_t v25 = *(std::__shared_weak_count **)(v24 + 56);
  *(_OWORD *)(v24 + 4_Block_object_dispose(&STACK[0x200], 8) = v23;
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }

  uint64_t v26 = (void *)a1[4];
  if (!v26) {
    goto LABEL_61;
  }
  uint64_t v27 = *(void *)(a1[5] + 8);
  id v83 = v6;
  ML3CPPStringFromData((NSData *)__p, v26);
  uint64_t NameOrderForString = v7 + 1208;
  unint64_t v28 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)__p);
  unint64_t v29 = v28;
  unint64_t v30 = *(void *)(v7 + 1216);
  if (v30)
  {
    uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)v30);
    v31.i16[0] = vaddlv_u8(v31);
    unint64_t v32 = v31.u32[0];
    if (v31.u32[0] > 1uLL)
    {
      uint64_t v20 = v28;
      if (v28 >= v30) {
        uint64_t v20 = v28 % v30;
      }
    }
    else
    {
      uint64_t v20 = (v30 - 1) & v28;
    }
    uint64_t v33 = *(void ***)(*(void *)NameOrderForString + 8 * v20);
    if (v33)
    {
      for (uint64_t i = *v33; i; uint64_t i = *(void **)i)
      {
        unint64_t v35 = *((void *)i + 1);
        if (v35 == v29)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)__p))
          {
            id v6 = v83;
            goto LABEL_55;
          }
        }
        else
        {
          if (v32 > 1)
          {
            if (v35 >= v30) {
              v35 %= v30;
            }
          }
          else
          {
            v35 &= v30 - 1;
          }
          if (v35 != v20) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x38uLL);
  uint64_t v36 = (void *)(v7 + 1224);
  v87.__r_.__value_.__r.__words[0] = (std::string::size_type)i;
  v87.__r_.__value_.__l.__size_ = v7 + 1224;
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v29;
  uint64_t v37 = v85;
  *((_OWORD *)i + 1) = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v85 = 0;
  *((void *)i + 5) = 0;
  *((void *)i + 6) = 0;
  *((void *)i + 4) = v37;
  v87.__r_.__value_.__s.__data_[16] = 1;
  float v38 = (float)(unint64_t)(*(void *)(v7 + 1232) + 1);
  float v39 = *(float *)(v7 + 1240);
  if (!v30 || (float)(v39 * (float)v30) < v38)
  {
    BOOL v40 = 1;
    if (v30 >= 3) {
      BOOL v40 = (v30 & (v30 - 1)) != 0;
    }
    unint64_t v41 = v40 | (2 * v30);
    unint64_t v42 = vcvtps_u32_f32(v38 / v39);
    if (v41 <= v42) {
      size_t v43 = v42;
    }
    else {
      size_t v43 = v41;
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(v7 + 1208, v43);
    unint64_t v30 = *(void *)(v7 + 1216);
    if ((v30 & (v30 - 1)) != 0)
    {
      if (v29 >= v30) {
        uint64_t v20 = v29 % v30;
      }
      else {
        uint64_t v20 = v29;
      }
    }
    else
    {
      uint64_t v20 = (v30 - 1) & v29;
    }
  }
  uint64_t v44 = *(void *)NameOrderForString;
  std::string v45 = *(void **)(*(void *)NameOrderForString + 8 * v20);
  if (v45)
  {
    *(void *)uint64_t i = *v45;
    id v6 = v83;
  }
  else
  {
    *(void *)uint64_t i = *v36;
    *uint64_t v36 = i;
    *(void *)(v44 + 8 * v20) = v36;
    id v6 = v83;
    if (!*(void *)i) {
      goto LABEL_54;
    }
    unint64_t v46 = *(void *)(*(void *)i + 8);
    if ((v30 & (v30 - 1)) != 0)
    {
      if (v46 >= v30) {
        v46 %= v30;
      }
    }
    else
    {
      v46 &= v30 - 1;
    }
    std::string v45 = (void *)(*(void *)NameOrderForString + 8 * v46);
  }
  *std::string v45 = i;
LABEL_54:
  v87.__r_.__value_.__r.__words[0] = 0;
  ++*(void *)(v7 + 1232);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v87);
LABEL_55:
  uint64_t v48 = *(void *)(v27 + 48);
  uint64_t v47 = *(void *)(v27 + 56);
  if (v47) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v47 + 8), 1uLL, memory_order_relaxed);
  }
  int v49 = (std::__shared_weak_count *)*((void *)i + 6);
  *((void *)i + 5) = v48;
  *((void *)i + 6) = v47;
  if (v49) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v49);
  }
  if (SHIBYTE(v85) < 0) {
    operator delete(__p[0]);
  }
LABEL_61:
  unint64_t v50 = a1[7];
  if (!v50) {
    goto LABEL_139;
  }
  uint64_t v51 = *(void *)(a1[5] + 8);
  unint64_t v52 = *(void *)(v7 + 896);
  if (v52)
  {
    uint8x8_t v53 = (uint8x8_t)vcnt_s8((int8x8_t)v52);
    v53.i16[0] = vaddlv_u8(v53);
    if (v53.u32[0] > 1uLL)
    {
      uint64_t NameOrderForString = a1[7];
      if (v50 >= v52) {
        uint64_t NameOrderForString = v50 % v52;
      }
    }
    else
    {
      uint64_t NameOrderForString = (v52 - 1) & v50;
    }
    int v54 = *(void ***)(*(void *)(v7 + 888) + 8 * NameOrderForString);
    if (v54)
    {
      for (uint64_t j = *v54; j; uint64_t j = (void *)*j)
      {
        unint64_t v56 = j[1];
        if (v56 == v50)
        {
          if (j[2] == v50) {
            goto LABEL_135;
          }
        }
        else
        {
          if (v53.u32[0] > 1uLL)
          {
            if (v56 >= v52) {
              v56 %= v52;
            }
          }
          else
          {
            v56 &= v52 - 1;
          }
          if (v56 != NameOrderForString) {
            break;
          }
        }
      }
    }
  }
  uint64_t j = operator new(0x28uLL);
  std::string v57 = (void *)(v7 + 904);
  *uint64_t j = 0;
  j[1] = v50;
  j[3] = 0;
  j[4] = 0;
  j[2] = v50;
  float v58 = (float)(unint64_t)(*(void *)(v7 + 912) + 1);
  float v59 = *(float *)(v7 + 920);
  if (!v52 || (float)(v59 * (float)v52) < v58)
  {
    BOOL v60 = 1;
    if (v52 >= 3) {
      BOOL v60 = (v52 & (v52 - 1)) != 0;
    }
    unint64_t v61 = v60 | (2 * v52);
    unint64_t v62 = vcvtps_u32_f32(v58 / v59);
    if (v61 <= v62) {
      int8x8_t prime = (int8x8_t)v62;
    }
    else {
      int8x8_t prime = (int8x8_t)v61;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v52 = *(void *)(v7 + 896);
    }
    if (*(void *)&prime > v52) {
      goto LABEL_91;
    }
    if (*(void *)&prime < v52)
    {
      unint64_t v70 = vcvtps_u32_f32((float)*(unint64_t *)(v7 + 912) / *(float *)(v7 + 920));
      if (v52 < 3 || (uint8x8_t v71 = (uint8x8_t)vcnt_s8((int8x8_t)v52), v71.i16[0] = vaddlv_u8(v71), v71.u32[0] > 1uLL))
      {
        unint64_t v70 = std::__next_prime(v70);
      }
      else
      {
        uint64_t v72 = 1 << -(char)__clz(v70 - 1);
        if (v70 >= 2) {
          unint64_t v70 = v72;
        }
      }
      if (*(void *)&prime <= v70) {
        int8x8_t prime = (int8x8_t)v70;
      }
      if (*(void *)&prime >= v52)
      {
        unint64_t v52 = *(void *)(v7 + 896);
      }
      else
      {
        if (prime)
        {
LABEL_91:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v64 = operator new(8 * *(void *)&prime);
          uint64_t v65 = *(void **)(v7 + 888);
          *(void *)(v7 + 88_Block_object_dispose(&STACK[0x200], 8) = v64;
          if (v65) {
            operator delete(v65);
          }
          uint64_t v66 = 0;
          *(int8x8_t *)(v7 + 896) = prime;
          do
            *(void *)(*(void *)(v7 + 888) + 8 * v66++) = 0;
          while (*(void *)&prime != v66);
          std::string v67 = (void *)*v57;
          if (*v57)
          {
            unint64_t v68 = v67[1];
            uint8x8_t v69 = (uint8x8_t)vcnt_s8(prime);
            v69.i16[0] = vaddlv_u8(v69);
            if (v69.u32[0] > 1uLL)
            {
              if (v68 >= *(void *)&prime) {
                v68 %= *(void *)&prime;
              }
            }
            else
            {
              v68 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v7 + 888) + 8 * v6_Block_object_dispose(&STACK[0x200], 8) = v57;
            long long v73 = (void *)*v67;
            if (*v67)
            {
              do
              {
                unint64_t v74 = v73[1];
                if (v69.u32[0] > 1uLL)
                {
                  if (v74 >= *(void *)&prime) {
                    v74 %= *(void *)&prime;
                  }
                }
                else
                {
                  v74 &= *(void *)&prime - 1;
                }
                if (v74 != v68)
                {
                  uint64_t v75 = *(void *)(v7 + 888);
                  if (!*(void *)(v75 + 8 * v74))
                  {
                    *(void *)(v75 + 8 * v74) = v67;
                    goto LABEL_116;
                  }
                  *std::string v67 = *v73;
                  *long long v73 = **(void **)(*(void *)(v7 + 888) + 8 * v74);
                  **(void **)(*(void *)(v7 + 888) + 8 * v74) = v73;
                  long long v73 = v67;
                }
                unint64_t v74 = v68;
LABEL_116:
                std::string v67 = v73;
                long long v73 = (void *)*v73;
                unint64_t v68 = v74;
              }
              while (v73);
            }
          }
          unint64_t v52 = (unint64_t)prime;
          goto LABEL_120;
        }
        int v82 = *(void **)(v7 + 888);
        *(void *)(v7 + 88_Block_object_dispose(&STACK[0x200], 8) = 0;
        if (v82) {
          operator delete(v82);
        }
        unint64_t v52 = 0;
        *(void *)(v7 + 896) = 0;
      }
    }
LABEL_120:
    if ((v52 & (v52 - 1)) != 0)
    {
      if (v50 >= v52) {
        uint64_t NameOrderForString = v50 % v52;
      }
      else {
        uint64_t NameOrderForString = v50;
      }
    }
    else
    {
      uint64_t NameOrderForString = (v52 - 1) & v50;
    }
  }
  uint64_t v76 = *(void *)(v7 + 888);
  uint64_t v77 = *(void **)(v76 + 8 * NameOrderForString);
  if (v77)
  {
    *uint64_t j = *v77;
  }
  else
  {
    *uint64_t j = *v57;
    void *v57 = j;
    *(void *)(v76 + 8 * NameOrderForString) = v57;
    if (!*j) {
      goto LABEL_134;
    }
    unint64_t v78 = *(void *)(*j + 8);
    if ((v52 & (v52 - 1)) != 0)
    {
      if (v78 >= v52) {
        v78 %= v52;
      }
    }
    else
    {
      v78 &= v52 - 1;
    }
    uint64_t v77 = (void *)(*(void *)(v7 + 888) + 8 * v78);
  }
  void *v77 = j;
LABEL_134:
  ++*(void *)(v7 + 912);
LABEL_135:
  uint64_t v80 = *(void *)(v51 + 48);
  uint64_t v79 = *(void *)(v51 + 56);
  if (v79) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v79 + 8), 1uLL, memory_order_relaxed);
  }
  int v81 = (std::__shared_weak_count *)j[4];
  j[3] = v80;
  j[4] = v79;
  if (v81) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v81);
  }
LABEL_139:
  if (SHIBYTE(v86.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v86.__r_.__value_.__l.__data_);
  }
}

void sub_1B046A3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>>>>::reset[abi:ne180100]((uint64_t)&a23);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }

  _Unwind_Resume(a1);
}

void ___ZN16ML3ImportSession24_getDefaultEmptyComposerEv_block_invoke()
{
  v0 = (char *)operator new(0x68uLL);
  *((void *)v0 + 1) = 0;
  *((void *)v0 + 2) = 0;
  *(void *)v0 = &unk_1F08C7560;
  *((_OWORD *)v0 + 5) = *(_OWORD *)"";
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  *((void *)v0 + 9) = 0;
  *((void *)v0 + 12) = 0;
  v1 = (std::__shared_weak_count *)qword_1E9B320D0;
  qword_1E9B320D0 = (uint64_t)v0;
  *(_OWORD *)(v0 + 24) = 0u;
  ML3ImportSession::_getDefaultEmptyComposer(void)::__emptyComposerData = (uint64_t)(v0 + 24);
  if (v1)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void std::__shared_ptr_emplace<ML3ComposerData>::__on_zero_shared(uint64_t a1)
{
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 55) < 0)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    operator delete(v2);
  }
}

void std::__shared_ptr_emplace<ML3ComposerData>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7560;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void std::__shared_ptr_emplace<ML3ComposerData>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C7560;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::shared_ptr<ML3ComposerData>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

__n128 __Block_byref_object_copy__376(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  return result;
}

void __Block_byref_object_dispose__377(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN16ML3ImportSession16_getComposerInfoENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 80);
  memset(__str, 0, sizeof(__str));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v3, (uint64_t)__str, 2uLL);
  if (!*(unsigned char *)(a1 + 112)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), __str);
  }
  if (!*(unsigned char *)(a1 + 113)) {
    std::string::operator=((std::string *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), &__str[1]);
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 int64ForColumnIndex:2];
  id v5 = [v3 dataForColumnIndex:3];
  uint64_t v6 = [v3 int64ForColumnIndex:4];
  uint64_t v7 = *(void **)(v4 + 8);
  uint64_t v8 = ML3CPPBridgeString((const UInt8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 0);
  uint64_t v9 = [v7 groupingKeyForString:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
  std::string::size_type v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(int *)(v4 + 32);
  uint64_t PropertyIndex = ML3TrackRulesGetPropertyIndex(1, 16777231);
  if (_ML3InitializeTrackRulesIfNeeded___once != -1) {
    dispatch_once(&_ML3InitializeTrackRulesIfNeeded___once, &__block_literal_global_108);
  }
  if (*(_DWORD *)(__itemRules + 56 * PropertyIndex + 4 * v12) == -1
    || ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isEqualToData:v5] & 1) != 0)
  {
    goto LABEL_13;
  }
  uint64_t v14 = *(std::__shared_weak_count **)(a1 + 96);
  v29[0] = *(void *)(a1 + 88);
  v29[1] = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int shouldPreserveTrackProperty = ML3ImportSession::_shouldPreserveTrackProperty(v4, (uint64_t)v29, 0x100000Fu);
  char v16 = shouldPreserveTrackProperty;
  if (v14)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    if (v16)
    {
LABEL_13:
      if (SHIBYTE(__str[1].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, __str[1].__r_.__value_.__l.__data_, __str[1].__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = __str[1];
      }
      uint64_t v17 = objc_msgSend(*(id *)(a1 + 32), "longLongValue", __p.__r_.__value_.__r.__words[0]);
      uint64_t v18 = ML3ImportSession::_effectiveNameOrderForSortNameAndFallback(v4, (uint64_t)&__p, (uint64_t)__str);
      uint64_t v20 = v19;
      uint64_t v21 = operator new(0x68uLL);
      v21[1] = 0;
      v21[2] = 0;
      void *v21 = &unk_1F08C7560;
      if (SHIBYTE(__str[0].__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v31, __str[0].__r_.__value_.__l.__data_, __str[0].__r_.__value_.__l.__size_);
      }
      else {
        std::string v31 = __str[0];
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v30, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }
      else {
        std::string v30 = __p;
      }
      ML3ComposerData::ML3ComposerData((uint64_t)(v21 + 3), v17, (long long *)&v31, (long long *)&v30, v18, v20, v6);
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v30.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      *(void *)&long long v22 = v21 + 3;
      *((void *)&v22 + 1) = v21;
      uint64_t v23 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v24 = *(std::__shared_weak_count **)(v23 + 56);
      *(_OWORD *)(v23 + 4_Block_object_dispose(&STACK[0x200], 8) = v22;
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_30;
    }
  }
  else if (shouldPreserveTrackProperty)
  {
    goto LABEL_13;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == *(void *)(a1 + 104))
  {
    uint64_t v26 = *(void **)(v4 + 16);
    uint64_t v32 = *(void *)(a1 + 32);
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v26 executeUpdate:@"UPDATE composer SET representative_item_pid=0 WHERE composer_pid=?" withParameters:v27 error:0];
  }
LABEL_30:

  for (unint64_t i = 0; i != 0x1FFFFFFFFFFFFFFALL; i -= 3)
  {
    if (SHIBYTE(__str[1].__r_.__value_.__r.__words[i + 2]) < 0) {
      operator delete(__str[i / 3 + 1].__r_.__value_.__l.__data_);
    }
  }
}

void sub_1B046AA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,char a32)
{
  uint64_t v36 = 0;
  while (1)
  {
    if (*(&a32 + v36 + 47) < 0) {
      operator delete(*(void **)(&a32 + v36 + 24));
    }
    v36 -= 24;
    if (v36 == -48)
    {

      _Unwind_Resume(a1);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3ComposerData>>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v7 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    uint64_t v12 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (unint64_t i = *v12; i; unint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, a2)) {
            return;
          }
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t v15 = (void *)(a1 + 16);
  char v16 = (char *)operator new(0x38uLL);
  v39[0] = v16;
  v39[1] = a1 + 16;
  char v40 = 0;
  *(void *)char v16 = 0;
  *((void *)v16 + 1) = v8;
  uint64_t v17 = (std::string *)(v16 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v17, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v16 + 4) = *(void *)(a3 + 16);
  }
  *(_OWORD *)(v16 + 40) = *(_OWORD *)(a3 + 24);
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  char v40 = 1;
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v9 || (float)(v19 * (float)v9) < v18)
  {
    BOOL v20 = 1;
    if (v9 >= 3) {
      BOOL v20 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v9);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      int8x8_t prime = (int8x8_t)v22;
    }
    else {
      int8x8_t prime = (int8x8_t)v21;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v9 = *(void *)(a1 + 8);
    if (*(void *)&prime > v9) {
      goto LABEL_33;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v30 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v9 < 3 || (uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
      {
        unint64_t v30 = std::__next_prime(v30);
      }
      else
      {
        uint64_t v32 = 1 << -(char)__clz(v30 - 1);
        if (v30 >= 2) {
          unint64_t v30 = v32;
        }
      }
      if (*(void *)&prime <= v30) {
        int8x8_t prime = (int8x8_t)v30;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = *(void *)(a1 + 8);
      }
      else
      {
        if (prime)
        {
LABEL_33:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v24 = operator new(8 * *(void *)&prime);
          uint64_t v25 = *(void **)a1;
          *(void *)a1 = v24;
          if (v25) {
            operator delete(v25);
          }
          uint64_t v26 = 0;
          *(int8x8_t *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v26++) = 0;
          while (*(void *)&prime != v26);
          uint64_t v27 = (void *)*v15;
          if (*v15)
          {
            unint64_t v28 = v27[1];
            uint8x8_t v29 = (uint8x8_t)vcnt_s8(prime);
            v29.i16[0] = vaddlv_u8(v29);
            if (v29.u32[0] > 1uLL)
            {
              if (v28 >= *(void *)&prime) {
                v28 %= *(void *)&prime;
              }
            }
            else
            {
              v28 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v2_Block_object_dispose(&STACK[0x200], 8) = v15;
            uint64_t v33 = (void *)*v27;
            if (*v27)
            {
              do
              {
                unint64_t v34 = v33[1];
                if (v29.u32[0] > 1uLL)
                {
                  if (v34 >= *(void *)&prime) {
                    v34 %= *(void *)&prime;
                  }
                }
                else
                {
                  v34 &= *(void *)&prime - 1;
                }
                if (v34 != v28)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v34))
                  {
                    *(void *)(*(void *)a1 + 8 * v34) = v27;
                    goto LABEL_58;
                  }
                  void *v27 = *v33;
                  *uint64_t v33 = **(void **)(*(void *)a1 + 8 * v34);
                  **(void **)(*(void *)a1 + 8 * v34) = v33;
                  uint64_t v33 = v27;
                }
                unint64_t v34 = v28;
LABEL_58:
                uint64_t v27 = v33;
                uint64_t v33 = (void *)*v33;
                unint64_t v28 = v34;
              }
              while (v33);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_62;
        }
        float v38 = *(void **)a1;
        *(void *)a1 = 0;
        if (v38) {
          operator delete(v38);
        }
        unint64_t v9 = 0;
        *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 0;
      }
    }
LABEL_62:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  unint64_t v35 = *(void **)(*(void *)a1 + 8 * v3);
  uint64_t v36 = v39[0];
  if (v35)
  {
    *(void *)v39[0] = *v35;
LABEL_75:
    *unint64_t v35 = v36;
    goto LABEL_76;
  }
  *(void *)v39[0] = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v36;
  *(void *)(*(void *)a1 + 8 * v3) = v15;
  if (*(void *)v36)
  {
    unint64_t v37 = *(void *)(*(void *)v36 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v37 >= v9) {
        v37 %= v9;
      }
    }
    else
    {
      v37 &= v9 - 1;
    }
    unint64_t v35 = (void *)(*(void *)a1 + 8 * v37);
    goto LABEL_75;
  }
LABEL_76:
  v39[0] = 0;
  ++*(void *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>>>>::reset[abi:ne180100]((uint64_t)v39);
}

void sub_1B046AF90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<ML3AlbumData>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<ML3ComposerImportItem>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::__shared_ptr_emplace<ML3ComposerImportItem>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C76B0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void std::__shared_ptr_emplace<ML3ComposerImportItem>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F08C76B0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t ML3ComposerData::ML3ComposerData(uint64_t a1, uint64_t a2, long long *a3, long long *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)a1 = a2;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 8), *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v12 = *a3;
    *(void *)(a1 + 24) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = v12;
  }
  uint64_t v13 = (std::string *)(a1 + 32);
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v13, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v14 = *a4;
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x200], 8) = *((void *)a4 + 2);
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
  }
  *(void *)(a1 + 56) = a5;
  *(void *)(a1 + 64) = a6;
  *(void *)(a1 + 72) = a7;
  return a1;
}

void sub_1B046B0E8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN16ML3ImportSession24_getExistingComposerInfoEP6NSDatax_block_invoke(void *a1, void *a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = a1[6];
  memset(v71, 0, sizeof(v71));
  ML3DatabaseRowGetHomogeneousColumns<std::string>(v3, (uint64_t)v71, 2uLL);
  if (SHIBYTE(v71[0].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v69, v71[0].__r_.__value_.__l.__data_, v71[0].__r_.__value_.__l.__size_);
  }
  else {
    std::string v69 = v71[0];
  }
  if (SHIBYTE(v71[1].__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v68, v71[1].__r_.__value_.__l.__data_, v71[1].__r_.__value_.__l.__size_);
  }
  else {
    std::string v68 = v71[1];
  }
  id v5 = [v3 objectAtIndexedSubscript:2];
  uint64_t v6 = [v5 longLongValue];

  unint64_t v7 = [v3 objectAtIndexedSubscript:4];
  uint64_t v8 = [v7 longLongValue];

  unint64_t v9 = [v3 objectAtIndexedSubscript:3];
  if (v9)
  {
    uint8x8_t v10 = *(void **)(v4 + 24);
    unint64_t v11 = [v3 objectAtIndexedSubscript:3];
    long long v12 = [v10 objectForKeyedSubscript:v11];
    uint64_t NameOrderForString = [v12 ML3NameOrderValue];
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t NameOrderForString = 0;
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }

  char v16 = [v3 objectAtIndexedSubscript:1];
  if (v16) {
    BOOL v17 = NameOrderForString == 0;
  }
  else {
    BOOL v17 = 0;
  }
  int v18 = v17;

  if (v18)
  {
    float v19 = [v3 objectAtIndexedSubscript:3];
    uint64_t NameOrderForString = ML3ImportSession::_getNameOrderForString((ML3ImportSession *)v4, v19);
    uint64_t v15 = v20;
  }
  unint64_t v21 = operator new(0x68uLL);
  v21[1] = 0;
  v21[2] = 0;
  void *v21 = &unk_1F08C7560;
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v65, v69.__r_.__value_.__l.__data_, v69.__r_.__value_.__l.__size_);
  }
  else {
    std::string v65 = v69;
  }
  char v22 = HIBYTE(v68.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v70, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
  }
  else {
    std::string v70 = v68;
  }
  ML3ComposerData::ML3ComposerData((uint64_t)(v21 + 3), v6, (long long *)&v65, (long long *)&v70, NameOrderForString, v15, v8);
  if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v70.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v65.__r_.__value_.__l.__data_);
  }
  *(void *)&long long v23 = v21 + 3;
  *((void *)&v23 + 1) = v21;
  uint64_t v24 = *(void *)(a1[5] + 8);
  uint64_t v25 = *(std::__shared_weak_count **)(v24 + 56);
  *(_OWORD *)(v24 + 4_Block_object_dispose(&STACK[0x200], 8) = v23;
  if (v25) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v25);
  }
  uint64_t v26 = (void *)a1[4];
  if (v26)
  {
    ML3CPPStringFromData((NSData *)&v70, v26);
    uint64_t v27 = *(void *)(a1[5] + 8);
    *(_OWORD *)&v65.__r_.__value_.__l.__data_ = *(_OWORD *)&v70.__r_.__value_.__l.__data_;
    std::string::size_type v28 = v70.__r_.__value_.__r.__words[2];
    memset(&v70, 0, sizeof(v70));
    uint64_t v30 = *(void *)(v27 + 48);
    uint8x8_t v29 = *(std::__shared_weak_count **)(v27 + 56);
    v65.__r_.__value_.__r.__words[2] = v28;
    uint64_t v66 = v30;
    std::string v67 = v29;
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ComposerData>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<ML3ComposerData>>>(v4 + 1168, (unsigned __int8 *)&v65, (uint64_t)&v65);
    if (v67) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v67);
    }
    if (SHIBYTE(v65.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v65.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v70.__r_.__value_.__l.__data_);
    }
  }
  unint64_t v31 = a1[7];
  if (!v31) {
    goto LABEL_118;
  }
  long long v32 = *(_OWORD *)(*(void *)(a1[5] + 8) + 48);
  long long v64 = v32;
  if (*((void *)&v32 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v32 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v33 = *(void *)(v4 + 936);
  if (v33)
  {
    uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
    v34.i16[0] = vaddlv_u8(v34);
    if (v34.u32[0] > 1uLL)
    {
      uint64_t v6 = v31;
      if (v31 >= v33) {
        uint64_t v6 = v31 % v33;
      }
    }
    else
    {
      uint64_t v6 = (v33 - 1) & v31;
    }
    unint64_t v35 = *(void **)(*(void *)(v4 + 928) + 8 * v6);
    if (v35)
    {
      for (unint64_t i = (void *)*v35; i; unint64_t i = (void *)*i)
      {
        unint64_t v37 = i[1];
        if (v37 == v31)
        {
          if (i[2] == v31)
          {
            unint64_t v62 = (std::__shared_weak_count *)*((void *)&v64 + 1);
            goto LABEL_115;
          }
        }
        else
        {
          if (v34.u32[0] > 1uLL)
          {
            if (v37 >= v33) {
              v37 %= v33;
            }
          }
          else
          {
            v37 &= v33 - 1;
          }
          if (v37 != v6) {
            break;
          }
        }
      }
    }
  }
  float v38 = (char *)operator new(0x28uLL);
  float v39 = (void *)(v4 + 944);
  *(void *)float v38 = 0;
  *((void *)v38 + 1) = v31;
  *((void *)v38 + 2) = v31;
  *(_OWORD *)(v38 + 24) = v64;
  float v40 = (float)(unint64_t)(*(void *)(v4 + 952) + 1);
  float v41 = *(float *)(v4 + 960);
  if (!v33 || (float)(v41 * (float)v33) < v40)
  {
    BOOL v42 = 1;
    if (v33 >= 3) {
      BOOL v42 = (v33 & (v33 - 1)) != 0;
    }
    unint64_t v43 = v42 | (2 * v33);
    unint64_t v44 = vcvtps_u32_f32(v40 / v41);
    if (v43 <= v44) {
      int8x8_t prime = (int8x8_t)v44;
    }
    else {
      int8x8_t prime = (int8x8_t)v43;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v33 = *(void *)(v4 + 936);
    }
    if (*(void *)&prime > v33) {
      goto LABEL_71;
    }
    if (*(void *)&prime < v33)
    {
      unint64_t v52 = vcvtps_u32_f32((float)*(unint64_t *)(v4 + 952) / *(float *)(v4 + 960));
      if (v33 < 3 || (uint8x8_t v53 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v53.i16[0] = vaddlv_u8(v53), v53.u32[0] > 1uLL))
      {
        unint64_t v52 = std::__next_prime(v52);
      }
      else
      {
        uint64_t v54 = 1 << -(char)__clz(v52 - 1);
        if (v52 >= 2) {
          unint64_t v52 = v54;
        }
      }
      if (*(void *)&prime <= v52) {
        int8x8_t prime = (int8x8_t)v52;
      }
      if (*(void *)&prime >= v33)
      {
        unint64_t v33 = *(void *)(v4 + 936);
      }
      else
      {
        if (prime)
        {
LABEL_71:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v46 = operator new(8 * *(void *)&prime);
          uint64_t v47 = *(void **)(v4 + 928);
          *(void *)(v4 + 92_Block_object_dispose(&STACK[0x200], 8) = v46;
          if (v47) {
            operator delete(v47);
          }
          uint64_t v48 = 0;
          *(int8x8_t *)(v4 + 936) = prime;
          do
            *(void *)(*(void *)(v4 + 928) + 8 * v48++) = 0;
          while (*(void *)&prime != v48);
          int v49 = (void *)*v39;
          if (*v39)
          {
            unint64_t v50 = v49[1];
            uint8x8_t v51 = (uint8x8_t)vcnt_s8(prime);
            v51.i16[0] = vaddlv_u8(v51);
            if (v51.u32[0] > 1uLL)
            {
              if (v50 >= *(void *)&prime) {
                v50 %= *(void *)&prime;
              }
            }
            else
            {
              v50 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)(v4 + 928) + 8 * v50) = v39;
            uint64_t v55 = (void *)*v49;
            if (*v49)
            {
              do
              {
                unint64_t v56 = v55[1];
                if (v51.u32[0] > 1uLL)
                {
                  if (v56 >= *(void *)&prime) {
                    v56 %= *(void *)&prime;
                  }
                }
                else
                {
                  v56 &= *(void *)&prime - 1;
                }
                if (v56 != v50)
                {
                  uint64_t v57 = *(void *)(v4 + 928);
                  if (!*(void *)(v57 + 8 * v56))
                  {
                    *(void *)(v57 + 8 * v56) = v49;
                    goto LABEL_96;
                  }
                  *int v49 = *v55;
                  void *v55 = **(void **)(*(void *)(v4 + 928) + 8 * v56);
                  **(void **)(*(void *)(v4 + 928) + 8 * v56) = v55;
                  uint64_t v55 = v49;
                }
                unint64_t v56 = v50;
LABEL_96:
                int v49 = v55;
                uint64_t v55 = (void *)*v55;
                unint64_t v50 = v56;
              }
              while (v55);
            }
          }
          unint64_t v33 = (unint64_t)prime;
          goto LABEL_100;
        }
        uint64_t v63 = *(void **)(v4 + 928);
        *(void *)(v4 + 92_Block_object_dispose(&STACK[0x200], 8) = 0;
        if (v63) {
          operator delete(v63);
        }
        unint64_t v33 = 0;
        *(void *)(v4 + 936) = 0;
      }
    }
LABEL_100:
    if ((v33 & (v33 - 1)) != 0)
    {
      if (v31 >= v33) {
        uint64_t v6 = v31 % v33;
      }
      else {
        uint64_t v6 = v31;
      }
    }
    else
    {
      uint64_t v6 = (v33 - 1) & v31;
    }
  }
  uint64_t v58 = *(void *)(v4 + 928);
  float v59 = *(void **)(v58 + 8 * v6);
  if (v59)
  {
    *(void *)float v38 = *v59;
  }
  else
  {
    *(void *)float v38 = *v39;
    *float v39 = v38;
    *(void *)(v58 + 8 * v6) = v39;
    if (!*(void *)v38) {
      goto LABEL_114;
    }
    unint64_t v60 = *(void *)(*(void *)v38 + 8);
    if ((v33 & (v33 - 1)) != 0)
    {
      if (v60 >= v33) {
        v60 %= v33;
      }
    }
    else
    {
      v60 &= v33 - 1;
    }
    float v59 = (void *)(*(void *)(v4 + 928) + 8 * v60);
  }
  void *v59 = v38;
LABEL_114:
  ++*(void *)(v4 + 952);
  unint64_t v62 = 0;
LABEL_115:
  if (v62) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v62);
  }
  char v22 = HIBYTE(v68.__r_.__value_.__r.__words[2]);
LABEL_118:
  if (v22 < 0) {
    operator delete(v68.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v69.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v69.__r_.__value_.__l.__data_);
  }
  for (unint64_t j = 0; j != 0x1FFFFFFFFFFFFFFALL; j -= 3)
  {
    if (SHIBYTE(v71[1].__r_.__value_.__r.__words[j + 2]) < 0) {
      operator delete(v71[j / 3 + 1].__r_.__value_.__l.__data_);
    }
  }
}

void sub_1B046B878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::~__shared_weak_count(v39);
  operator delete(v42);
  if (a24 < 0) {
    operator delete(a19);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  uint64_t v43 = 0;
  uint64_t v44 = v40 - 144;
  while (1)
  {
    if (*(char *)(v44 + v43 + 47) < 0) {
      operator delete(*(void **)(v44 + v43 + 24));
    }
    v43 -= 24;
    if (v43 == -48)
    {

      _Unwind_Resume(a1);
    }
  }
}

uint64_t ML3ImportSession::updateTrack(uint64_t a1, uint64_t *a2, int a3, int a4)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(void **__return_ptr))(*(void *)*a2 + 88))(__p);
    unint64_t v9 = v67 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136446722;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a4;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "update track %{public}s, processCollectionsAsStandaloneEntities=%{BOOL}u, ignoreNonExistingTrack=%{BOOL}u", buf, 0x18u);
    if (v67 < 0) {
      operator delete(__p[0]);
    }
  }

  ++*(_DWORD *)(a1 + 156);
  if ([*(id *)(a1 + 1576) count])
  {
    if (a3) {
      goto LABEL_14;
    }
  }
  else if (*(void *)(a1 + 1536) == *(void *)(a1 + 1528) || (a3 & 1) != 0)
  {
    goto LABEL_13;
  }
  uint64_t result = ML3ImportSession::flush((ML3ImportSession *)a1, 0);
  if (!result) {
    return result;
  }
LABEL_13:
  if (!a3)
  {
    unint64_t v21 = (std::__shared_weak_count *)a2[1];
    v62[0] = *a2;
    v62[1] = v21;
    if (v21) {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t TrackPersistentID = ML3ImportSession::_getTrackPersistentID(a1, v62);
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
    if (TrackPersistentID)
    {
      uint64_t v23 = *a2;
      *(void *)(v23 + _Block_object_dispose(&STACK[0x200], 8) = TrackPersistentID;
      *(unsigned char *)(v23 + 16) = 1;
      uint64_t v24 = (std::__shared_weak_count *)a2[1];
      v61[0] = v23;
      v61[1] = (uint64_t)v24;
      if (v24) {
        atomic_fetch_add_explicit(&v24->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      char v25 = ML3ImportSession::_prepareTrackData(a1, v61, 0);
      if (v24) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v24);
      }
      if (v25)
      {
        uint64_t v26 = *(void **)(a1 + 1584);
        uint64_t v27 = [NSNumber numberWithLongLong:TrackPersistentID];
        [v26 addObject:v27];

        std::string::size_type v28 = *(uint64_t **)(a1 + 1560);
        unint64_t v29 = *(void *)(a1 + 1568);
        if ((unint64_t)v28 >= v29)
        {
          uint64_t v48 = *(void *)(a1 + 1552);
          uint64_t v49 = ((uint64_t)v28 - v48) >> 4;
          unint64_t v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 60) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v51 = v29 - v48;
          if (v51 >> 3 > v50) {
            unint64_t v50 = v51 >> 3;
          }
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v52 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v52 = v50;
          }
          uint64_t v70 = a1 + 1568;
          uint8x8_t v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v52);
          uint64_t v54 = &v53[16 * v49];
          *(void *)buf = v53;
          *(void *)&buf[8] = v54;
          std::string v69 = &v53[16 * v55];
          long long v56 = *(_OWORD *)a2;
          *(_OWORD *)uint64_t v54 = *(_OWORD *)a2;
          if (*((void *)&v56 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v56 + 1) + 8), 1uLL, memory_order_relaxed);
          }
          *(void *)&buf[16] = v54 + 16;
          std::vector<std::shared_ptr<ML3ImportItem>>::__swap_out_circular_buffer((void *)(a1 + 1552), buf);
          unint64_t v31 = *(void **)(a1 + 1560);
          std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)buf);
        }
        else
        {
          uint64_t *v28 = *a2;
          uint64_t v30 = a2[1];
          v28[1] = v30;
          if (v30) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(v30 + 8), 1uLL, memory_order_relaxed);
          }
          unint64_t v31 = v28 + 2;
          *(void *)(a1 + 1560) = v28 + 2;
        }
        *(void *)(a1 + 1560) = v31;
        uint64_t v57 = *a2;
        uint64_t v58 = (std::__shared_weak_count *)a2[1];
        v60[0] = v57;
        v60[1] = v58;
        if (v58) {
          atomic_fetch_add_explicit(&v58->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        ML3ImportSession::_addTrackDataToSourceMaps(a1, v60);
        if (v58) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v58);
        }
        if (*(void *)(a1 + 1560) - *(void *)(a1 + 1552) >= 0x3E71uLL)
        {
          int v59 = _os_feature_enabled_impl();
          return ML3ImportSession::flush((ML3ImportSession *)a1, v59);
        }
        return 1;
      }
      uint64_t v36 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_ERROR, "failed to prepare track data", buf, 2u);
      }
    }
    else
    {
      unint64_t v33 = os_log_create("com.apple.amp.medialibrary", "Import");
      BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
      if (a4)
      {
        if (v34)
        {
          uint64_t v35 = *(void *)(*a2 + 8);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v35;
          _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_ERROR, "updateTrack ignoring non-existing track with pid %lld", buf, 0xCu);
        }

        return 1;
      }
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_ERROR, "updateTrack called for unknown track", buf, 2u);
      }
    }
    return 0;
  }
LABEL_14:
  unint64_t v11 = (std::__shared_weak_count *)a2[1];
  v65[0] = *a2;
  v65[1] = (uint64_t)v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  int v12 = ML3ImportSession::_prepareTrackForImport(a1, v65, a4, 0);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  if (!v12)
  {
    uint64_t v13 = (std::__shared_weak_count *)a2[1];
    v64[0] = *a2;
    v64[1] = (uint64_t)v13;
    if (v13) {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v14 = ML3ImportSession::_prepareTrackData(a1, v64, 1);
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (v14)
    {
      uint64_t v15 = *(void **)(a1 + 1584);
      char v16 = [NSNumber numberWithLongLong:*(void *)(*a2 + 8)];
      [v15 addObject:v16];

      BOOL v17 = *(uint64_t **)(a1 + 1560);
      unint64_t v18 = *(void *)(a1 + 1568);
      if ((unint64_t)v17 >= v18)
      {
        uint64_t v37 = *(void *)(a1 + 1552);
        uint64_t v38 = ((uint64_t)v17 - v37) >> 4;
        unint64_t v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 60) {
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v40 = v18 - v37;
        if (v40 >> 3 > v39) {
          unint64_t v39 = v40 >> 3;
        }
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v41 = v39;
        }
        uint64_t v70 = a1 + 1568;
        BOOL v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v41);
        uint64_t v43 = &v42[16 * v38];
        *(void *)buf = v42;
        *(void *)&buf[8] = v43;
        std::string v69 = &v42[16 * v44];
        long long v45 = *(_OWORD *)a2;
        *(_OWORD *)uint64_t v43 = *(_OWORD *)a2;
        if (*((void *)&v45 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v45 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        *(void *)&buf[16] = v43 + 16;
        std::vector<std::shared_ptr<ML3ImportItem>>::__swap_out_circular_buffer((void *)(a1 + 1552), buf);
        uint64_t v20 = *(void **)(a1 + 1560);
        std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)buf);
      }
      else
      {
        *BOOL v17 = *a2;
        uint64_t v19 = a2[1];
        v17[1] = v19;
        if (v19) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v20 = v17 + 2;
        *(void *)(a1 + 1560) = v17 + 2;
      }
      *(void *)(a1 + 1560) = v20;
      uint64_t v46 = *a2;
      uint64_t v47 = (std::__shared_weak_count *)a2[1];
      v63[0] = v46;
      v63[1] = v47;
      if (v47) {
        atomic_fetch_add_explicit(&v47->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      ML3ImportSession::_addTrackDataToSourceMaps(a1, v63);
      if (v47) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v47);
      }
      if (*(void *)(a1 + 1560) - *(void *)(a1 + 1552) >= 0x3E71uLL) {
        return ML3ImportSession::flush((ML3ImportSession *)a1, 0);
      }
      return 1;
    }
    long long v32 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B022D000, v32, OS_LOG_TYPE_ERROR, "failed to prepare track data", buf, 2u);
    }
  }
  return 0;
}

void sub_1B046C08C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3ImportSession::removeTrack(uint64_t a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)*a2 + 88))(__p);
    id v5 = v21 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "removing track %{public}s", buf, 0xCu);
    if (v21 < 0) {
      operator delete(*(void **)__p);
    }
  }

  if (*(void *)(a1 + 1536) == *(void *)(a1 + 1528) && *(void *)(a1 + 1560) == *(void *)(a1 + 1552)) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = ML3ImportSession::flush((ML3ImportSession *)a1, 0);
  }
  unint64_t v7 = (std::__shared_weak_count *)a2[1];
  uint64_t v18 = *a2;
  uint64_t v19 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t TrackPersistentID = ML3ImportSession::_getTrackPersistentID(a1, &v18);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  unint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Import");
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (TrackPersistentID)
  {
    if (v10)
    {
      *(_DWORD *)std::string __p = 134217984;
      *(void *)&__p[4] = TrackPersistentID;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "removing track %lld", __p, 0xCu);
    }

    ++*(_DWORD *)(a1 + 160);
    if (*(void *)(a1 + 1536) == *(void *)(a1 + 1528) && *(void *)(a1 + 1560) == *(void *)(a1 + 1552)
      || (int v11 = _os_feature_enabled_impl(), ML3ImportSession::flush((ML3ImportSession *)a1, v11)))
    {
      int v12 = *(void **)(a1 + 1584);
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", TrackPersistentID, v18, v19);
      [v12 addObject:v13];

      char v14 = *(void **)(a1 + 1576);
      uint64_t v15 = [NSNumber numberWithLongLong:TrackPersistentID];
      [v14 addObject:v15];

      if ((unint64_t)[*(id *)(a1 + 1576) count] < 0x3E8)
      {
        return 1;
      }
      else
      {
        int v16 = _os_feature_enabled_impl();
        return ML3ImportSession::flush((ML3ImportSession *)a1, v16);
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (v10)
    {
      *(_WORD *)std::string __p = 0;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "failed to locate track to delete. oh well", __p, 2u);
    }
  }
  return v6;
}

void sub_1B046C408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ML3ImportSession::addContainer(uint64_t a1, uint64_t *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(long long *__return_ptr))(*(void *)*a2 + 88))(&__p);
    id v5 = SHIBYTE(v45) >= 0 ? &__p : (long long *)__p;
    *(_DWORD *)buf = 136446210;
    uint64_t v43 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "adding container %{public}s", buf, 0xCu);
    if (SHIBYTE(v45) < 0) {
      operator delete((void *)__p);
    }
  }

  if (*(void *)(a1 + 1536) == *(void *)(a1 + 1528)
    && *(void *)(a1 + 1560) == *(void *)(a1 + 1552)
    && ![*(id *)(a1 + 1576) count]
    && *(void *)(a1 + 2352) == *(void *)(a1 + 2344)
    || (uint64_t result = ML3ImportSession::flush((ML3ImportSession *)a1, 1), result))
  {
    unint64_t v7 = (std::__shared_weak_count *)a2[1];
    v41[0] = *a2;
    v41[1] = v7;
    if (v7) {
      atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t ContainerPersistentID = ML3ImportSession::_getContainerPersistentID(a1, v41);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
    if (ContainerPersistentID)
    {
      ++*(_DWORD *)(a1 + 168);
      *(unsigned char *)(*a2 + 16) = 1;
    }
    else
    {
      ++*(_DWORD *)(a1 + 164);
      unint64_t ContainerPersistentID = *(void *)(*a2 + 8);
      if (!ContainerPersistentID)
      {
        unint64_t v9 = (std::__shared_weak_count *)a2[1];
        if (v9) {
          atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unint64_t ContainerPersistentID = ML3CreateIntegerUUID();
        BOOL v10 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(__p) = 134217984;
          *(void *)((char *)&__p + 4) = ContainerPersistentID;
          _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "created new container pid %lld", (uint8_t *)&__p, 0xCu);
        }

        if (v9) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v9);
        }
      }
    }
    if (*(unsigned char *)(a1 + 1512)) {
      std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__erase_unique<long long>((void *)(a1 + 768), ContainerPersistentID);
    }
    uint64_t v11 = *a2;
    *(void *)(v11 + _Block_object_dispose(&STACK[0x200], 8) = ContainerPersistentID;
    int v12 = (std::__shared_weak_count *)a2[1];
    v40[0] = v11;
    v40[1] = (uint64_t)v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v13 = ML3ImportSession::_prepareContainerData(a1, v40);
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    if (v13)
    {
      char v14 = *(unint64_t **)(a1 + 2304);
      unint64_t v15 = *(void *)(a1 + 2312);
      if ((unint64_t)v14 >= v15)
      {
        BOOL v17 = *(unint64_t **)(a1 + 2296);
        uint64_t v18 = v14 - v17;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61) {
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v20 = v15 - (void)v17;
        if (v20 >> 2 > v19) {
          unint64_t v19 = v20 >> 2;
        }
        BOOL v21 = (unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v21) {
          unint64_t v22 = v19;
        }
        if (v22)
        {
          unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v22);
          char v14 = *(unint64_t **)(a1 + 2304);
          BOOL v17 = *(unint64_t **)(a1 + 2296);
        }
        else
        {
          uint64_t v23 = 0;
        }
        uint64_t v24 = (unint64_t *)(v22 + 8 * v18);
        unint64_t v25 = v22 + 8 * v23;
        *uint64_t v24 = ContainerPersistentID;
        int v16 = v24 + 1;
        while (v14 != v17)
        {
          unint64_t v26 = *--v14;
          *--uint64_t v24 = v26;
        }
        *(void *)(a1 + 2296) = v24;
        *(void *)(a1 + 2304) = v16;
        *(void *)(a1 + 2312) = v25;
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        unint64_t *v14 = ContainerPersistentID;
        int v16 = v14 + 1;
      }
      *(void *)(a1 + 2304) = v16;
      uint64_t v27 = *(uint64_t **)(a1 + 2328);
      unint64_t v28 = *(void *)(a1 + 2336);
      if ((unint64_t)v27 >= v28)
      {
        uint64_t v31 = *(void *)(a1 + 2320);
        uint64_t v32 = ((uint64_t)v27 - v31) >> 4;
        unint64_t v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 60) {
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v34 = v28 - v31;
        if (v34 >> 3 > v33) {
          unint64_t v33 = v34 >> 3;
        }
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v35 = v33;
        }
        uint64_t v47 = a1 + 2336;
        uint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v35);
        uint64_t v37 = &v36[16 * v32];
        *(void *)&long long __p = v36;
        *((void *)&__p + 1) = v37;
        uint64_t v46 = &v36[16 * v38];
        long long v39 = *(_OWORD *)a2;
        *(_OWORD *)uint64_t v37 = *(_OWORD *)a2;
        if (*((void *)&v39 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v39 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        long long v45 = v37 + 16;
        std::vector<std::shared_ptr<ML3ImportItem>>::__swap_out_circular_buffer((void *)(a1 + 2320), &__p);
        uint64_t v30 = *(void **)(a1 + 2328);
        std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)&__p);
      }
      else
      {
        uint64_t *v27 = *a2;
        uint64_t v29 = a2[1];
        v27[1] = v29;
        if (v29) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v29 + 8), 1uLL, memory_order_relaxed);
        }
        uint64_t v30 = v27 + 2;
        *(void *)(a1 + 232_Block_object_dispose(&STACK[0x200], 8) = v27 + 2;
      }
      *(void *)(a1 + 232_Block_object_dispose(&STACK[0x200], 8) = v30;
      if (v30 == *(void **)(a1 + 2320)) {
        return 1;
      }
      else {
        return ML3ImportSession::flush((ML3ImportSession *)a1, 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_1B046C8B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3ImportSession::_prepareContainerData(uint64_t a1, uint64_t *a2)
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)&buf, *a2, 184549384);
  if (SHIBYTE(v215.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external((std::string *)v211, v215.__r_.__value_.__l.__data_, v215.__r_.__value_.__l.__size_);
  }
  else {
    *(std::string *)v211 = v215;
  }
  uint64_t v156 = 0;
  uint64_t v157 = 0;
  uint64_t v158 = 0;
  *(void *)v171 = &v156;
  v171[8] = 0;
  uint64_t v156 = (long long *)operator new(0x18uLL);
  uint64_t v157 = v156;
  uint64_t v158 = (char *)v156 + 24;
  uint64_t v157 = (long long *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v158, (long long *)v211, (long long *)&v211[12], (std::string *)v156);
  if (SHIBYTE(v211[11]) < 0) {
    operator delete(*(void **)v211);
  }
  *(void *)&long long buf = &unk_1F08C3230;
  if (SHIBYTE(v215.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v215.__r_.__value_.__l.__data_);
  }
  memset(v155, 0, sizeof(v155));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)v155, v156, v157, 0xAAAAAAAAAAAAAAABLL * (((char *)v157 - (char *)v156) >> 3));
  char v4 = ML3ImportSession::_processSortableNames(a1, v155);
  *(void *)&long long buf = v155;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  uint64_t v152 = a1;
  if ((v4 & 1) == 0)
  {
    unint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "failed to process sort strings", (uint8_t *)&buf, 2u);
    }

    goto LABEL_70;
  }
  uint64_t v6 = *a2;
  id v5 = (std::__shared_weak_count *)a2[1];
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (((*(void *)(*(void *)(a1 + 664) + (((unint64_t)*(int *)(a1 + 32) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> *(_DWORD *)(a1 + 32)) & 1) == 0)
  {
    v150 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:500];
    if (*(unsigned char *)(v6 + 16))
    {
      uint64_t j = v6 & 0xFFFFFFFFFFFFLL | 0x63C1000000000000;
      if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v6 + 56))(v6, 218103812))
      {
LABEL_28:
        unint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 32))(v6, 201326593);
        if (v13
          && !std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>((void *)(*(void *)(a1 + 616) + 40 * *(int *)(a1 + 32)), v13))
        {
          char v14 = [NSNumber numberWithLongLong:v13];
          [v150 addObject:v14];
        }
        if ((unint64_t)[v150 count] < 0x1F4)
        {
          if ([v150 count])
          {
            unint64_t v15 = ML3TrackRulesIdentityPropertyForSource(*(unsigned int *)(a1 + 32));
            int v16 = objc_msgSend(&stru_1F08D4D70, "stringByPaddingToLength:withString:startingAtIndex:", 2 * objc_msgSend(v150, "count") - 1, @",?", 1);
            BOOL v17 = [NSString stringWithFormat:@"SELECT ROWID,%@ FROM item_store WHERE %@ IN (%@)", v15, v15, v16];
            uint64_t j = [*(id *)(a1 + 16) executeQuery:v17 withParameters:v150];
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v215.__r_.__value_.__r.__words[0] = (std::string::size_type)___ZN16ML3ImportSession25_prepareContainerItemDataENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke;
            v215.__r_.__value_.__l.__size_ = (std::string::size_type)&__block_descriptor_40_e40_v32__0__ML3DatabaseRow_8__NSError_16_B24l;
            v215.__r_.__value_.__r.__words[2] = a1;
            [(id)j enumerateRowsWithBlock:&buf];
          }
        }
        else
        {
          ML3ImportSession::_populateExistingTrackIdentifiersForSource((ML3ImportSession *)a1, *(unsigned int *)(a1 + 32));
        }

        goto LABEL_36;
      }
    }
    else
    {
      uint64_t j = v6 & 0xFFFFFFFFFFFFLL | 0x63C1000000000000;
    }
    (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(*(void *)v6 + 80))(&buf, v6, 218103812);
    for (unint64_t i = (uint64_t *)buf; i != *((uint64_t **)&buf + 1); i += 2)
    {
      uint64_t v9 = *i;
      BOOL v10 = (std::__shared_weak_count *)i[1];
      if (v10) {
        atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      unint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 32))(v9, 234881030);
      if (!std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>((void *)(*(void *)(a1 + 616) + 40 * *(int *)(a1 + 32)), v11))
      {
        int v12 = [NSNumber numberWithLongLong:v11];
        [v150 addObject:v12];
      }
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
    }
    *(void *)v211 = &buf;
    std::vector<std::shared_ptr<ML3ImportItem>>::__destroy_vector::operator()[abi:ne180100]((void ***)v211);
    goto LABEL_28;
  }
LABEL_36:
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  uint64_t v18 = (std::__shared_weak_count *)a2[1];
  v154[0] = *a2;
  v154[1] = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v19 = ML3ImportSession::_prepareArtwork(a1, (uint64_t)v154, 184549450, 5uLL);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  if ((v19 & 1) == 0)
  {
    uint64_t v34 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "failed to prepare container artwork", (uint8_t *)&buf, 2u);
    }

    goto LABEL_70;
  }
  uint64_t v20 = (std::__shared_weak_count *)a2[1];
  v153[0] = *a2;
  v153[1] = v20;
  if (v20) {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v21 = ML3ImportSession::_prepareArtworkFromSecondarySource(a1, v153, 218103810, 218103811, 5uLL);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  if ((v21 & 1) == 0)
  {
    unint64_t v35 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_ERROR, "failed to prepare container secondary source artwork", (uint8_t *)&buf, 2u);
    }

LABEL_70:
    uint64_t v36 = 0;
    goto LABEL_71;
  }
  uint64_t v23 = (void *)*a2;
  unint64_t v22 = (std::__shared_weak_count *)a2[1];
  if (v22) {
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v149 = v22;
  uint64_t v24 = v23[1];
  unint64_t v25 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Preparing container authors", (uint8_t *)&buf, 2u);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  v215.__r_.__value_.__r.__words[0] = 0x5812000000;
  v215.__r_.__value_.__l.__size_ = (std::string::size_type)__Block_byref_object_copy__586;
  memset(v216, 0, sizeof(v216));
  v215.__r_.__value_.__r.__words[2] = (std::string::size_type)__Block_byref_object_dispose__587;
  uint64_t v217 = 0;
  int v218 = 1065353216;
  *(void *)v211 = 0;
  *(void *)&v211[4] = v211;
  *(void *)&v211[8] = 0x5812000000;
  *(void *)&v211[12] = __Block_byref_object_copy__586;
  memset(&v211[20], 0, 32);
  *(void *)&v211[16] = __Block_byref_object_dispose__587;
  uint64_t v212 = 0;
  int v213 = 1065353216;
  *(void *)v171 = 0;
  *(void *)&v171[8] = v171;
  *(void *)&v171[16] = 0x5812000000;
  *(void *)&v171[24] = __Block_byref_object_copy__588;
  memset(&v171[40], 0, 32);
  *(void *)&v171[32] = __Block_byref_object_dispose__589;
  uint64_t v172 = 0;
  int v173 = 1065353216;
  *(void *)&long long v166 = 0;
  *((void *)&v166 + 1) = &v166;
  *(void *)&long long v167 = 0x5812000000;
  *((void *)&v167 + 1) = __Block_byref_object_copy__586;
  memset(&v168[8], 0, 32);
  *(void *)uint64_t v168 = __Block_byref_object_dispose__587;
  uint64_t v169 = 0;
  int v170 = 1065353216;
  long long v182 = 0u;
  long long v183 = 0u;
  int v184 = 1065353216;
  unint64_t v26 = *(void **)(a1 + 16);
  uint64_t v27 = [NSNumber numberWithLongLong:v24];
  unint64_t v204 = v27;
  unint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v204 count:1];
  v151 = [v26 executeQuery:@"SELECT container_author_pid, cloud_id, is_pending, role, position FROM container_author JOIN person USING (person_pid) WHERE container_pid = ?", v28 withParameters];

  v159[0] = (void **)MEMORY[0x1E4F143A8];
  v159[1] = (void **)3221225472;
  uint64_t v160 = ___ZN16ML3ImportSession34_prepareContainerAuthorImportItemsENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke;
  uint64_t v161 = &unk_1E5FB7740;
  p_long long buf = &buf;
  uint64_t v163 = v171;
  v164 = v211;
  char v165 = &v166;
  [v151 enumerateRowsWithBlock:v159];
  v198.__r_.__value_.__r.__words[0] = 0;
  v198.__r_.__value_.__l.__size_ = (std::string::size_type)&v198;
  v198.__r_.__value_.__r.__words[2] = 0x5812000000;
  unint64_t v199 = __Block_byref_object_copy__593;
  *(_OWORD *)&v200[8] = 0u;
  long long v201 = 0u;
  *(void *)uint64_t v200 = __Block_byref_object_dispose__594;
  uint64_t v202 = 0;
  int v203 = 1065353216;
  uint64_t v187 = (__CFString *)MEMORY[0x1E4F143A8];
  uint64_t v188 = 3221225472;
  std::string __s = (std::string::value_type *)___ZN16ML3ImportSession34_prepareContainerAuthorImportItemsENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke_595;
  std::string::size_type v190 = (std::string::size_type)&unk_1E5FB7768;
  uint64_t v197 = v24;
  uint64_t v191 = (__CFString *)&buf;
  uint64_t v192 = (__CFString *)v171;
  uint64_t v193 = (__CFString *)v211;
  unint64_t v194 = &v166;
  uint64_t v196 = v152;
  uint64_t v195 = &v198;
  uint64_t v29 = (void (**)(void, void, void, void))MEMORY[0x1B3E93EE0](&v187);
  if ((*(unsigned int (**)(void *, uint64_t))(*v23 + 56))(v23, 218103813))
  {
    (*(void (**)(uint8_t *__return_ptr, void *, uint64_t))(*v23 + 80))(v208, v23, 218103813);
    uint64_t v30 = *(uint8_t **)v208;
    if (*(uint8_t **)v208 == v209)
    {
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v31 = 0;
      do
      {
        uint64_t v32 = *(void *)v30;
        unint64_t v33 = (std::__shared_weak_count *)*((void *)v30 + 1);
        if (v33)
        {
          atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
          v177 = v33;
          atomic_fetch_add_explicit(&v33->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          v177 = 0;
        }
        uint64_t v176 = v32;
        ((void (**)(void, uint64_t *, void, uint64_t))v29)[2](v29, &v176, 0, v31);
        if (v177) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v177);
        }
        if (v33) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v33);
        }
        v30 += 16;
        ++v31;
      }
      while (v30 != v209);
    }
    (*(void (**)(void **__return_ptr, void *, uint64_t))(*v23 + 80))(&v179, v23, 218103814);
    long long v64 = (uint64_t *)v179;
    if (v179 != v180)
    {
      do
      {
        uint64_t v65 = *v64;
        uint64_t v66 = (std::__shared_weak_count *)v64[1];
        if (v66)
        {
          atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
          uint64_t v175 = v66;
          atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        else
        {
          uint64_t v175 = 0;
        }
        uint64_t v174 = v65;
        ((void (**)(void, uint64_t *, uint64_t, uint64_t))v29)[2](v29, &v174, 1, v31);
        if (v175) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v175);
        }
        if (v66) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v66);
        }
        v64 += 2;
        ++v31;
      }
      while (v64 != v180);
    }
    for (uint64_t j = *(void *)(*((void *)&buf + 1) + 64); j; uint64_t j = *(void *)j)
    {
      if (*(char *)(j + 39) < 0) {
        std::string::__init_copy_ctor_external(&v178, *(const std::string::value_type **)(j + 16), *(void *)(j + 24));
      }
      else {
        std::string v178 = *(std::string *)(j + 16);
      }
      uint64_t v67 = *(void *)(j + 40);
      if (!std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::find<std::string>((void *)(v198.__r_.__value_.__l.__size_ + 48), (unsigned __int8 *)&v178))
      {
        std::string v68 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          int v205 = 134217984;
          *(void *)uint64_t v206 = v67;
          _os_log_impl(&dword_1B022D000, v68, OS_LOG_TYPE_DEFAULT, "Removing container author pid %lld", (uint8_t *)&v205, 0xCu);
        }

        std::string v69 = *(void **)(v152 + 2632);
        uint64_t v70 = [NSNumber numberWithLongLong:v67];
        [v69 addObject:v70];

        ++*(_DWORD *)(v152 + 196);
      }
      if (SHIBYTE(v178.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v178.__r_.__value_.__l.__data_);
      }
    }
    v178.__r_.__value_.__r.__words[0] = (std::string::size_type)&v179;
    std::vector<std::shared_ptr<ML3ImportItem>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v178);
    unint64_t v179 = v208;
    std::vector<std::shared_ptr<ML3ImportItem>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v179);
  }

  _Block_object_dispose(&v198, 8);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node(*((void ***)&v201 + 1));
  uint64_t v71 = *(void **)&v200[16];
  *(void *)&v200[16] = 0;
  if (v71) {
    operator delete(v71);
  }

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__deallocate_node(0);
  _Block_object_dispose(&v166, 8);
  std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::~__hash_table((uint64_t)&v168[16]);
  _Block_object_dispose(v171, 8);
  std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::~__hash_table((uint64_t)&v171[48]);
  _Block_object_dispose(v211, 8);
  std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::~__hash_table((uint64_t)&v211[24]);
  _Block_object_dispose(&buf, 8);
  std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::~__hash_table((uint64_t)&v216[8]);
  if (v149) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v149);
  }
  uint64_t v72 = (std::__shared_weak_count *)a2[1];
  v143 = (void *)*a2;
  if (v72) {
    atomic_fetch_add_explicit(&v72->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v140 = v72;
  char v138 = [(ML3Entity *)[ML3Container alloc] initWithPersistentID:v143[1] inLibrary:*(void *)(v152 + 8)];
  long long v73 = [(ML3Entity *)v138 valueForProperty:@"keep_local"];
  [v73 integerValue];

  v142 = [MEMORY[0x1E4F1CA48] array];
  if (*((unsigned char *)v143 + 17) || (*(unsigned int (**)(void *, uint64_t))(*v143 + 56))(v143, 218103812))
  {
    unint64_t v74 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      (*(void (**)(long long *__return_ptr))(*v143 + 88))(&buf);
      uint64_t v75 = v215.__r_.__value_.__s.__data_[7] >= 0 ? &buf : (long long *)buf;
      *(_DWORD *)v211 = 136446210;
      *(void *)&v211[2] = v75;
      _os_log_impl(&dword_1B022D000, v74, OS_LOG_TYPE_DEFAULT, "preparing container_items for container %{public}s", (uint8_t *)v211, 0xCu);
      if (v215.__r_.__value_.__s.__data_[7] < 0) {
        operator delete((void *)buf);
      }
    }

    (*(void (**)(uint64_t **__return_ptr))(*v143 + 80))(&v185);
    uint64_t v76 = v186;
    uint64_t v77 = v185;
    std::unordered_map<unsigned long long,long long>::unordered_map((uint64_t)v159, *(void *)(v152 + 616) + 40 * *(int *)(v152 + 32));
    uint64_t v78 = (char *)v76 - (char *)v77;
    uint64_t v144 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v78 >> 4];
    uint64_t v141 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v78 >> 4];
    unint64_t v137 = v78;
    uint64_t v145 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v78 >> 4];
    long long v182 = 0u;
    long long v183 = 0u;
    int v184 = 1065353216;
    uint64_t v79 = v185;
    if (v185 != v186)
    {
      unint64_t v80 = 0;
      do
      {
        uint64_t j = *v79;
        int v81 = (std::__shared_weak_count *)v79[1];
        if (v81) {
          atomic_fetch_add_explicit(&v81->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        *(void *)&long long buf = v80;
        int v82 = std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t *)&v182, v80, (uint64_t *)&buf);
        if (v81) {
          atomic_fetch_add_explicit(&v81->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        id v83 = (std::__shared_weak_count *)v82[4];
        v82[3] = j;
        v82[4] = v81;
        if (v83) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v83);
        }
        unint64_t v84 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)j + 32))(j, 234881030);
        uint64_t v85 = [NSNumber numberWithLongLong:v84];
        [v145 addObject:v85];

        std::string v86 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>(v159, v84);
        if (v86)
        {
          std::string v87 = [NSNumber numberWithLongLong:v86[3]];
          [v144 addObject:v87];

          (*(void (**)(long long *__return_ptr, uint64_t, uint64_t))(*(void *)j + 24))(&buf, j, 234881028);
          (*(void (**)(_WORD *__return_ptr, uint64_t, uint64_t))(*(void *)j + 24))(v211, j, 234881029);
          if (BYTE8(buf) | LOBYTE(v211[4]))
          {
            uint64_t j = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
            if (BYTE8(buf))
            {
              char v88 = NSString;
              if (SHIBYTE(v215.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external((std::string *)v171, v215.__r_.__value_.__l.__data_, v215.__r_.__value_.__l.__size_);
              }
              else {
                *(std::string *)v171 = v215;
              }
              v91 = v171[23] >= 0 ? v171 : *(unsigned char **)v171;
              uint64_t v92 = [v88 stringWithUTF8String:v91];
              [(id)j setObject:v92 forKeyedSubscript:@"uuid"];

              if ((v171[23] & 0x80000000) != 0) {
                operator delete(*(void **)v171);
              }
            }
            if (LOBYTE(v211[4]))
            {
              int v93 = NSString;
              if (SHIBYTE(v211[19]) < 0) {
                std::string::__init_copy_ctor_external((std::string *)v171, *(const std::string::value_type **)&v211[8], *(std::string::size_type *)&v211[12]);
              }
              else {
                *(std::string *)v171 = *(std::string *)&v211[8];
              }
              uint64_t v94 = v171[23] >= 0 ? v171 : *(unsigned char **)v171;
              uint64_t v95 = [v93 stringWithUTF8String:v94];
              [(id)j setObject:v95 forKeyedSubscript:@"position_uuid"];

              if ((v171[23] & 0x80000000) != 0) {
                operator delete(*(void **)v171);
              }
            }
            uint64_t v96 = [NSNumber numberWithUnsignedInteger:v80];
            [v141 setObject:j forKeyedSubscript:v96];
          }
          *(void *)v211 = &unk_1F08C3230;
          if (SHIBYTE(v211[19]) < 0) {
            operator delete(*(void **)&v211[8]);
          }
          *(void *)&long long buf = &unk_1F08C3230;
          if (SHIBYTE(v215.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v215.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          int v89 = [NSNumber numberWithLongLong:v84];
          [v142 addObject:v89];

          uint64_t j = (uint64_t)os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled((os_log_t)j, OS_LOG_TYPE_ERROR))
          {
            (*(void (**)(long long *__return_ptr))(*v143 + 88))(&buf);
            v90 = v215.__r_.__value_.__s.__data_[7] >= 0 ? &buf : (long long *)buf;
            *(_DWORD *)v211 = 134218242;
            *(void *)&v211[2] = v84;
            v211[6] = 2082;
            *(void *)&v211[7] = v90;
            _os_log_impl(&dword_1B022D000, (os_log_t)j, OS_LOG_TYPE_ERROR, "failed to map itemSourceID=%lld for container %{public}s", (uint8_t *)v211, 0x16u);
            if (v215.__r_.__value_.__s.__data_[7] < 0) {
              operator delete((void *)buf);
            }
          }
        }
        if (v81) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v81);
        }
        v79 += 2;
        ++v80;
      }
      while (v79 != v186);
    }
    std::string::size_type v139 = [[ML3ContainerItemDiffOperation alloc] initWithContainerPersistentID:v143[1] updatedItemsPersistentIDs:v144 updatedItemsProperties:v141 connection:*(void *)(v152 + 16)];
    [(ML3ContainerItemDiffOperation *)v139 start];
    [(ML3ContainerItemDiffOperation *)v139 waitUntilFinished];
    v97 = [(ML3ContainerItemDiffOperation *)v139 containerItemsToDelete];
    memset(v171, 0, 64);
    obuint64_t j = v97;
    uint64_t v98 = [obj countByEnumeratingWithState:v171 objects:&buf count:16];
    if (v98)
    {
      uint64_t v99 = **(void **)&v171[16];
      do
      {
        for (uint64_t k = 0; k != v98; ++k)
        {
          if (**(void **)&v171[16] != v99) {
            objc_enumerationMutation(obj);
          }
          uint64_t v101 = *(void **)(*(void *)&v171[8] + 8 * k);
          uint64_t v102 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v103 = [v101 persistentID];
            *(_DWORD *)v211 = 134217984;
            *(void *)&v211[2] = v103;
            _os_log_impl(&dword_1B022D000, v102, OS_LOG_TYPE_DEFAULT, "deleting container_item with persistent-id: %lld", (uint8_t *)v211, 0xCu);
          }

          uint64_t j = *(void *)(v152 + 2560);
          int v104 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v101, "persistentID"));
          [(id)j addObject:v104];

          ++*(_DWORD *)(v152 + 184);
        }
        uint64_t v98 = [obj countByEnumeratingWithState:v171 objects:&buf count:16];
      }
      while (v98);
    }

    char v105 = [(ML3ContainerItemDiffOperation *)v139 containerItemsToUpdate];
    memset(v168, 0, 32);
    long long v166 = 0u;
    long long v167 = 0u;
    id v147 = v105;
    if ([v147 countByEnumeratingWithState:&v166 objects:v211 count:16])
    {
      int v106 = (void *)**((void **)&v166 + 1);
      v198.__r_.__value_.__r.__words[0] = [**((id **)&v166 + 1) newPosition];
      int v107 = std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>((uint64_t *)&v182, v198.__r_.__value_.__r.__words[0], (uint64_t *)&v198);
      uint64_t v109 = v107[3];
      uint64_t v108 = v107[4];
      if (v108) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v108 + 8), 1uLL, memory_order_relaxed);
      }
      (*(void (**)(__CFString **__return_ptr, uint64_t, uint64_t))(*(void *)v109 + 24))(&v187, v109, 234881028);
      (*(void (**)(uint8_t *__return_ptr, uint64_t, uint64_t))(*(void *)v109 + 24))(v208, v109, 234881029);
      id v110 = [v106 occurrenceID];
      std::string::basic_string[abi:ne180100]<0>(&v198, (char *)[v110 UTF8String]);
      unint64_t v179 = &unk_1F08C3230;
      LOBYTE(v180) = 1;
      if (SHIBYTE(v198.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&v181, v198.__r_.__value_.__l.__data_, v198.__r_.__value_.__l.__size_);
        if (SHIBYTE(v198.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v198.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string v181 = v198;
      }

      uint64_t v111 = [v106 persistentID];
      uint64_t v112 = os_log_create("com.apple.amp.medialibrary", "Import");
      BOOL v113 = os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT);
      if (v111)
      {
        if (v113)
        {
          std::string::size_type v114 = [v106 newPosition];
          std::string::size_type v115 = [v106 persistentID];
          uint64_t v116 = [v106 previousPosition];
          uint64_t v117 = [v106 newPosition];
          LODWORD(v198.__r_.__value_.__l.__data_) = 134218752;
          *(std::string::size_type *)((char *)v198.__r_.__value_.__r.__words + 4) = v114;
          WORD2(v198.__r_.__value_.__r.__words[1]) = 2048;
          *(std::string::size_type *)((char *)&v198.__r_.__value_.__r.__words[1] + 6) = v115;
          HIWORD(v198.__r_.__value_.__r.__words[2]) = 2048;
          unint64_t v199 = (uint64_t (*)(uint64_t, uint64_t))v116;
          *(_WORD *)uint64_t v200 = 2048;
          *(void *)&void v200[2] = v117;
          _os_log_impl(&dword_1B022D000, v112, OS_LOG_TYPE_DEFAULT, "mapped item at position %lld to existing container_item with pid %lld (update position: %lld -> %lld)", (uint8_t *)&v198, 0x2Au);
        }

        operator new();
      }
      if (v113)
      {
        std::string::size_type v118 = [v106 newPosition];
        LODWORD(v198.__r_.__value_.__l.__data_) = 134217984;
        *(std::string::size_type *)((char *)v198.__r_.__value_.__r.__words + 4) = v118;
        _os_log_impl(&dword_1B022D000, v112, OS_LOG_TYPE_DEFAULT, "creating new container_item for item at position %lld", (uint8_t *)&v198, 0xCu);
      }

      operator new();
    }

    uint64_t v119 = v152;
    unint64_t v120 = 0x1E4F28000uLL;
    if ([obj count])
    {
      uint64_t v121 = [v147 count];
      if (!(v121 | *((void *)&v183 + 1)))
      {
        char v122 = [MEMORY[0x1E4F1CA60] dictionary];
        v123 = v160;
        if (v160)
        {
          do
          {
            uint64_t v124 = v123[2];
            uint64_t v125 = [*(id *)(v120 + 3792) numberWithLongLong:v123[3]];
            uint64_t v126 = [*(id *)(v120 + 3792) numberWithUnsignedLongLong:v124];
            [v122 setObject:v125 forKeyedSubscript:v126];

            v123 = (void *)*v123;
            uint64_t v119 = v152;
            unint64_t v120 = 0x1E4F28000;
          }
          while (v123);
        }
        std::string::size_type v127 = (void *)MEMORY[0x1E4F77950];
        uint64_t v187 = @"sourceMapDict";
        uint64_t v188 = @"itemSourceIDS";
        v198.__r_.__value_.__r.__words[0] = (std::string::size_type)v122;
        v198.__r_.__value_.__l.__size_ = (std::string::size_type)v145;
        std::string __s = (std::string::value_type *)@"unmappedIDS";
        std::string::size_type v190 = (std::string::size_type)@"updatedItemPersistentIDs";
        v198.__r_.__value_.__r.__words[2] = (std::string::size_type)v142;
        unint64_t v199 = (uint64_t (*)(uint64_t, uint64_t))v144;
        uint64_t v128 = *(void *)(v119 + 2560);
        uint64_t v191 = @"deletedContainerItemPersistentIDs";
        uint64_t v192 = @"containerItemsToUpdate";
        *(void *)uint64_t v200 = v128;
        *(void *)&v200[8] = v147;
        uint64_t v193 = @"name";
        std::string::size_type v129 = NSString;
        (*(void (**)(uint8_t *__return_ptr))(*v143 + 88))(v208);
        if (SHIBYTE(v210) >= 0) {
          std::string::size_type v130 = v208;
        }
        else {
          std::string::size_type v130 = *(uint8_t **)v208;
        }
        uint64_t v131 = [v129 stringWithUTF8String:v130];
        *(void *)&v200[16] = v131;
        int v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v198 forKeys:&v187 count:7];
        *(void *)&long long v207 = v132;
        uint64_t v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v207 count:1];
        [v127 snapshotWithDomain:*MEMORY[0x1E4F778D0] type:@"Bug" subType:@"EmptyContainerItemImportBug" context:@"Missing reporting_adam_id in PAF event" triggerThresholdValues:0 events:v133 completion:0];

        if (SHIBYTE(v210) < 0) {
          operator delete(*(void **)v208);
        }
      }
    }
    uint64_t v134 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v134, OS_LOG_TYPE_DEFAULT))
    {
      int v135 = DWORD2(v183);
      (*(void (**)(void **__return_ptr))(*v143 + 88))(&v179);
      int v136 = v181.__r_.__value_.__s.__data_[7] >= 0 ? (std::string::value_type *)&v179 : (std::string::value_type *)v179;
      *(_DWORD *)uint64_t v208 = 67109634;
      *(_DWORD *)&v208[4] = v135;
      LOWORD(v209) = 1024;
      *(_DWORD *)((char *)&v209 + 2) = v137 >> 4;
      HIWORD(v209) = 2080;
      char v210 = v136;
      _os_log_impl(&dword_1B022D000, v134, OS_LOG_TYPE_DEFAULT, "mapped %d/%d items for container %s", v208, 0x18u);
      if (v181.__r_.__value_.__s.__data_[7] < 0) {
        operator delete(v179);
      }
    }

    std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>>>::~__hash_table((uint64_t)&v182);
    std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v159);
    v159[0] = (void **)&v185;
    std::vector<std::shared_ptr<ML3ImportItem>>::__destroy_vector::operator()[abi:ne180100](v159);
  }

  if (v140) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v140);
  }
  uint64_t v36 = 1;
LABEL_71:
  uint64_t v37 = (ML3ImportSession *)v152;
  uint64_t v38 = (void *)*a2;
  long long v39 = (std::__shared_weak_count *)a2[1];
  if (v39) {
    atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v40 = ML3ContainerRulesIdentityImportPropertyForSource(*(unsigned int *)(v152 + 32));
  unint64_t v41 = (*(uint64_t (**)(void *, uint64_t))(*v38 + 32))(v38, v40);
  *(void *)&long long buf = v41;
  if (v41)
  {
    uint64_t v42 = v38[1];
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v152 + 2368, v41, &buf)[3] = v42;
    if (!v39) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
  uint64_t v46 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    v211[0] = 0;
    _os_log_impl(&dword_1B022D000, v46, OS_LOG_TYPE_ERROR, "no identity property for container import item", (uint8_t *)v211, 2u);
  }

  uint64_t v37 = (ML3ImportSession *)v152;
  if (v39) {
LABEL_75:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100](v39);
LABEL_76:
  unint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)*a2 + 32))(*a2, 184549392);
  *(void *)v211 = v43;
  if (!v43) {
    goto LABEL_125;
  }
  uint64_t ContainerPersistentID = ML3ImportSession::_getContainerPersistentID(v37, v43);
  if (!ContainerPersistentID)
  {
    uint64_t v47 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v43;
      _os_log_impl(&dword_1B022D000, v47, OS_LOG_TYPE_DEFAULT, "couldnt find parent container with source id %lld - deferring mapping until the end", (uint8_t *)&buf, 0xCu);
    }

    unint64_t v48 = *(void *)(*a2 + 8);
    uint64_t v37 = (ML3ImportSession *)v152;
    uint64_t v49 = (uint64_t *)(v152 + 2408);
    unint64_t v50 = *(void *)(v152 + 2416);
    if (v50)
    {
      uint8x8_t v51 = (uint8x8_t)vcnt_s8((int8x8_t)v50);
      v51.i16[0] = vaddlv_u8(v51);
      if (v51.u32[0] > 1uLL)
      {
        uint64_t j = *(void *)(*a2 + 8);
        if (v48 >= v50) {
          uint64_t j = v48 % v50;
        }
      }
      else
      {
        uint64_t j = (v50 - 1) & v48;
      }
      unint64_t v52 = *(void ***)(*v49 + 8 * j);
      if (v52)
      {
        for (uint64_t m = *v52; m; uint64_t m = (void *)*m)
        {
          unint64_t v53 = m[1];
          if (v53 == v48)
          {
            if (m[2] == v48) {
              goto LABEL_124;
            }
          }
          else
          {
            if (v51.u32[0] > 1uLL)
            {
              if (v53 >= v50) {
                v53 %= v50;
              }
            }
            else
            {
              v53 &= v50 - 1;
            }
            if (v53 != j) {
              break;
            }
          }
        }
      }
    }
    uint64_t m = operator new(0x20uLL);
    *uint64_t m = 0;
    m[1] = v48;
    m[2] = v48;
    m[3] = 0;
    float v54 = (float)(unint64_t)(*(void *)(v152 + 2432) + 1);
    float v55 = *(float *)(v152 + 2440);
    if (!v50 || (float)(v55 * (float)v50) < v54)
    {
      BOOL v56 = 1;
      if (v50 >= 3) {
        BOOL v56 = (v50 & (v50 - 1)) != 0;
      }
      unint64_t v57 = v56 | (2 * v50);
      unint64_t v58 = vcvtps_u32_f32(v54 / v55);
      if (v57 <= v58) {
        size_t v59 = v58;
      }
      else {
        size_t v59 = v57;
      }
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>((uint64_t)v49, v59);
      unint64_t v50 = *(void *)(v152 + 2416);
      if ((v50 & (v50 - 1)) != 0)
      {
        if (v48 >= v50) {
          uint64_t j = v48 % v50;
        }
        else {
          uint64_t j = v48;
        }
      }
      else
      {
        uint64_t j = (v50 - 1) & v48;
      }
    }
    uint64_t v60 = *v49;
    unint64_t v61 = *(void **)(*v49 + 8 * j);
    if (v61)
    {
      *uint64_t m = *v61;
    }
    else
    {
      *uint64_t m = *(void *)(v152 + 2424);
      *(void *)(v152 + 2424) = m;
      *(void *)(v60 + 8 * j) = v152 + 2424;
      if (!*m)
      {
LABEL_123:
        ++*(void *)(v152 + 2432);
        goto LABEL_124;
      }
      unint64_t v62 = *(void *)(*m + 8);
      if ((v50 & (v50 - 1)) != 0)
      {
        if (v62 >= v50) {
          v62 %= v50;
        }
      }
      else
      {
        v62 &= v50 - 1;
      }
      unint64_t v61 = (void *)(*v49 + 8 * v62);
    }
    *unint64_t v61 = m;
    goto LABEL_123;
  }
  uint64_t m = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)v37 + 2368, v43, v211);
  unint64_t v43 = ContainerPersistentID;
LABEL_124:
  m[3] = v43;
LABEL_125:
  if ((*(unsigned int (**)(uint64_t, uint64_t))(*(void *)*a2 + 56))(*a2, 184549407)) {
    *((unsigned char *)v37 + 1516) = 1;
  }
  *(void *)&long long buf = &v156;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
  return v36;
}

void sub_1B046EEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, std::__shared_weak_count *a16, void *a17, void *a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  if (SLOBYTE(STACK[0x4D7]) < 0) {
    operator delete((void *)STACK[0x4C0]);
  }

  std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>>>::~__hash_table((uint64_t)&STACK[0x360]);
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&a61);
  a61 = (uint64_t)&STACK[0x390];
  std::vector<std::shared_ptr<ML3ImportItem>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a61);

  if (a16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a16);
  }
  STACK[0x360] = (unint64_t)&a58;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&STACK[0x360]);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<unsigned long long,long long>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, *(void *)(a2 + 8));
  id v5 = *(void **)(a2 + 16);
  if (v5)
  {
    uint64_t v6 = (void *)(a1 + 16);
    unint64_t v7 = *(void *)(a1 + 8);
    do
    {
      unint64_t v8 = v5[2];
      if (v7)
      {
        uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
        v9.i16[0] = vaddlv_u8(v9);
        if (v9.u32[0] > 1uLL)
        {
          unint64_t v2 = v5[2];
          if (v8 >= v7) {
            unint64_t v2 = v8 % v7;
          }
        }
        else
        {
          unint64_t v2 = (v7 - 1) & v8;
        }
        BOOL v10 = *(void **)(*(void *)a1 + 8 * v2);
        if (v10)
        {
          for (unint64_t i = (void *)*v10; i; unint64_t i = (void *)*i)
          {
            unint64_t v12 = i[1];
            if (v12 == v8)
            {
              if (i[2] == v8) {
                goto LABEL_41;
              }
            }
            else
            {
              if (v9.u32[0] > 1uLL)
              {
                if (v12 >= v7) {
                  v12 %= v7;
                }
              }
              else
              {
                v12 &= v7 - 1;
              }
              if (v12 != v2) {
                break;
              }
            }
          }
        }
      }
      unint64_t v13 = operator new(0x20uLL);
      void *v13 = 0;
      v13[1] = v8;
      *((_OWORD *)v13 + 1) = *((_OWORD *)v5 + 1);
      float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
      float v15 = *(float *)(a1 + 32);
      if (!v7 || (float)(v15 * (float)v7) < v14)
      {
        BOOL v16 = (v7 & (v7 - 1)) != 0;
        if (v7 < 3) {
          BOOL v16 = 1;
        }
        unint64_t v17 = v16 | (2 * v7);
        unint64_t v18 = vcvtps_u32_f32(v14 / v15);
        if (v17 <= v18) {
          size_t v19 = v18;
        }
        else {
          size_t v19 = v17;
        }
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__rehash<true>(a1, v19);
        unint64_t v7 = *(void *)(a1 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v8 >= v7) {
            unint64_t v2 = v8 % v7;
          }
          else {
            unint64_t v2 = v8;
          }
        }
        else
        {
          unint64_t v2 = (v7 - 1) & v8;
        }
      }
      uint64_t v20 = *(void *)a1;
      char v21 = *(void **)(*(void *)a1 + 8 * v2);
      if (v21)
      {
        void *v13 = *v21;
      }
      else
      {
        void *v13 = *v6;
        *uint64_t v6 = v13;
        *(void *)(v20 + 8 * v2) = v6;
        if (!*v13) {
          goto LABEL_40;
        }
        unint64_t v22 = *(void *)(*v13 + 8);
        if ((v7 & (v7 - 1)) != 0)
        {
          if (v22 >= v7) {
            v22 %= v7;
          }
        }
        else
        {
          v22 &= v7 - 1;
        }
        char v21 = (void *)(*(void *)a1 + 8 * v22);
      }
      void *v21 = v13;
LABEL_40:
      ++*(void *)(a1 + 24);
LABEL_41:
      id v5 = (void *)*v5;
    }
    while (v5);
  }
  return a1;
}

void sub_1B046F91C(_Unwind_Exception *a1)
{
  std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(uint64_t *a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v5 = a2;
  unint64_t v7 = a1[1];
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    uint8x8_t v9 = *(void ***)(*a1 + 8 * v3);
    if (v9)
    {
      for (unint64_t i = *v9; i; unint64_t i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == a2)
        {
          if (i[2] == a2) {
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
  unint64_t v12 = a1 + 2;
  unint64_t i = operator new(0x28uLL);
  *unint64_t i = 0;
  i[1] = v5;
  uint64_t v13 = *a3;
  i[3] = 0;
  i[4] = 0;
  i[2] = v13;
  float v14 = (float)(unint64_t)(a1[3] + 1);
  float v15 = *((float *)a1 + 8);
  if (v7 && (float)(v15 * (float)v7) >= v14)
  {
    unint64_t v5 = v3;
    goto LABEL_64;
  }
  BOOL v16 = 1;
  if (v7 >= 3) {
    BOOL v16 = (v7 & (v7 - 1)) != 0;
  }
  unint64_t v17 = v16 | (2 * v7);
  unint64_t v18 = vcvtps_u32_f32(v14 / v15);
  if (v17 <= v18) {
    int8x8_t prime = (int8x8_t)v18;
  }
  else {
    int8x8_t prime = (int8x8_t)v17;
  }
  if (*(void *)&prime == 1)
  {
    int8x8_t prime = (int8x8_t)2;
  }
  else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
  {
    int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    unint64_t v7 = a1[1];
  }
  if (*(void *)&prime <= v7)
  {
    if (*(void *)&prime >= v7) {
      goto LABEL_60;
    }
    unint64_t v26 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
    if (v7 < 3 || (uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v27.i16[0] = vaddlv_u8(v27), v27.u32[0] > 1uLL))
    {
      unint64_t v26 = std::__next_prime(v26);
    }
    else
    {
      uint64_t v28 = 1 << -(char)__clz(v26 - 1);
      if (v26 >= 2) {
        unint64_t v26 = v28;
      }
    }
    if (*(void *)&prime <= v26) {
      int8x8_t prime = (int8x8_t)v26;
    }
    if (*(void *)&prime >= v7)
    {
      unint64_t v7 = a1[1];
      goto LABEL_60;
    }
    if (!*(void *)&prime)
    {
      unint64_t v35 = (void *)*a1;
      *a1 = 0;
      if (v35) {
        operator delete(v35);
      }
      unint64_t v7 = 0;
      a1[1] = 0;
      goto LABEL_60;
    }
  }
  if (*(void *)&prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  uint64_t v20 = operator new(8 * *(void *)&prime);
  char v21 = (void *)*a1;
  *a1 = (uint64_t)v20;
  if (v21) {
    operator delete(v21);
  }
  uint64_t v22 = 0;
  a1[1] = (uint64_t)prime;
  do
    *(void *)(*a1 + 8 * v22++) = 0;
  while (*(void *)&prime != v22);
  uint64_t v23 = (void *)*v12;
  if (*v12)
  {
    unint64_t v24 = v23[1];
    uint8x8_t v25 = (uint8x8_t)vcnt_s8(prime);
    v25.i16[0] = vaddlv_u8(v25);
    if (v25.u32[0] > 1uLL)
    {
      if (v24 >= *(void *)&prime) {
        v24 %= *(void *)&prime;
      }
    }
    else
    {
      v24 &= *(void *)&prime - 1;
    }
    *(void *)(*a1 + 8 * v24) = v12;
    uint64_t v29 = (void *)*v23;
    if (*v23)
    {
      do
      {
        unint64_t v30 = v29[1];
        if (v25.u32[0] > 1uLL)
        {
          if (v30 >= *(void *)&prime) {
            v30 %= *(void *)&prime;
          }
        }
        else
        {
          v30 &= *(void *)&prime - 1;
        }
        if (v30 != v24)
        {
          if (!*(void *)(*a1 + 8 * v30))
          {
            *(void *)(*a1 + 8 * v30) = v23;
            goto LABEL_56;
          }
          *uint64_t v23 = *v29;
          void *v29 = **(void **)(*a1 + 8 * v30);
          **(void **)(*a1 + 8 * v30) = v29;
          uint64_t v29 = v23;
        }
        unint64_t v30 = v24;
LABEL_56:
        uint64_t v23 = v29;
        uint64_t v29 = (void *)*v29;
        unint64_t v24 = v30;
      }
      while (v29);
    }
  }
  unint64_t v7 = (unint64_t)prime;
LABEL_60:
  if ((v7 & (v7 - 1)) != 0)
  {
    if (v7 <= v5) {
      v5 %= v7;
    }
  }
  else
  {
    v5 &= v7 - 1;
  }
LABEL_64:
  uint64_t v31 = *a1;
  uint64_t v32 = *(void **)(*a1 + 8 * v5);
  if (v32)
  {
    *unint64_t i = *v32;
LABEL_72:
    void *v32 = i;
    goto LABEL_73;
  }
  *unint64_t i = *v12;
  void *v12 = i;
  *(void *)(v31 + 8 * v5) = v12;
  if (*i)
  {
    unint64_t v33 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v33 >= v7) {
        v33 %= v7;
      }
    }
    else
    {
      v33 &= v7 - 1;
    }
    uint64_t v32 = (void *)(*a1 + 8 * v33);
    goto LABEL_72;
  }
LABEL_73:
  ++a1[3];
  return i;
}

void sub_1B046FD24(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,void *>>>::operator()[abi:ne180100](1, v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ContainerItemImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B046FDA4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::shared_ptr<ML3ImportItem>>>>::~__hash_table(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      char v4 = (std::__shared_weak_count *)v2[4];
      if (v4) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v4);
      }
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v5 = *(void **)a1;
  *(void *)a1 = 0;
  if (v5) {
    operator delete(v5);
  }
  return a1;
}

uint64_t std::__shared_ptr_pointer<ML3ContainerItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ContainerItemImportItem>,std::allocator<ML3ContainerItemImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_26ML3ContainerItemImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3ContainerItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ContainerItemImportItem>,std::allocator<ML3ContainerItemImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3ContainerItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ContainerItemImportItem>,std::allocator<ML3ContainerItemImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

uint64_t __Block_byref_object_copy__588(uint64_t result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0;
  *(void *)(result + 4_Block_object_dispose(&STACK[0x200], 8) = v2;
  *(void *)(result + 56) = a2[7];
  a2[7] = 0;
  uint64_t v5 = a2[8];
  unint64_t v3 = a2 + 8;
  uint64_t v4 = v5;
  *(void *)(result + 64) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 56);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 64;
    *unint64_t v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t __Block_byref_object_dispose__589(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::~__hash_table(a1 + 48);
}

void ___ZN16ML3ImportSession34_prepareContainerAuthorImportItemsENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 int64ForColumnIndex:0];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v5 cStringForColumnIndex:1]);
  uint64_t v8 = *(void *)(a1[4] + 8) + 48;
  float v14 = __p;
  *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v8, (unsigned __int8 *)__p, (long long **)&v14)+ 5) = v7;
  LODWORD(v7) = [v5 intForColumnIndex:2];
  uint8x8_t v9 = (uint64_t *)(*(void *)(a1[5] + 8) + 48);
  float v14 = __p;
  std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v9, (unsigned __int8 *)__p, (long long **)&v14)[40] = v7 != 0;
  LODWORD(v7) = [v5 intForColumnIndex:3];
  uint64_t v10 = *(void *)(a1[6] + 8) + 48;
  float v14 = __p;
  *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v10, (unsigned __int8 *)__p, (long long **)&v14)+ 5) = (int)v7;
  LODWORD(v7) = [v5 intForColumnIndex:4];
  uint64_t v11 = *(void *)(a1[7] + 8) + 48;
  float v14 = __p;
  *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v11, (unsigned __int8 *)__p, (long long **)&v14)+ 5) = (int)v7;
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1B04700C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__593(uint64_t a1, uint64_t a2)
{
  return std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__hash_table(a1 + 48, (uint64_t *)(a2 + 48));
}

uint64_t __Block_byref_object_dispose__594(uint64_t a1)
{
  return std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table(a1 + 48);
}

void ___ZN16ML3ImportSession34_prepareContainerAuthorImportItemsENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke_595(void *a1, uint64_t *a2, int a3, uint64_t a4)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a1[9];
  if (!a3)
  {
    uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)*a2 + 32))(*a2, 251658243);
    (*(void (**)(uint64_t *__return_ptr))(*(void *)*a2 + 72))(&v35);
    uint64_t v9 = v35;
    if (v35) {
      goto LABEL_5;
    }
LABEL_9:
    char v33 = 0;
    memset(&__p, 0, sizeof(__p));
    goto LABEL_47;
  }
  uint64_t v9 = *a2;
  uint64_t v10 = (std::__shared_weak_count *)a2[1];
  uint64_t v35 = *a2;
  uint64_t v36 = v10;
  uint64_t v11 = 0;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (!v9) {
    goto LABEL_9;
  }
LABEL_5:
  (*(void (**)(void **__return_ptr))(*(void *)v9 + 24))(&v32);
  if (!v33) {
    goto LABEL_47;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v31, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v31 = __p;
  }
  uint64_t v12 = *(void *)(a1[4] + 8) + 48;
  *(void *)long long buf = &v31;
  uint64_t v13 = *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v12, (unsigned __int8 *)&v31, (long long **)buf)+ 5);
  float v14 = v36;
  uint64_t v29 = v35;
  unint64_t v30 = v36;
  if (v36) {
    atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t PersonPersistentID = ML3ImportSession::_getPersonPersistentID(v8, (uint64_t)&v29);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (!PersonPersistentID)
  {
    char v21 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      (*(void (**)(unsigned char *__return_ptr))(*(void *)v35 + 88))(buf);
      uint64_t v22 = v40 >= 0 ? buf : *(unsigned char **)buf;
      *(_DWORD *)uint64_t v44 = 136315138;
      *(void *)&v44[4] = v22;
      _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEFAULT, "Adding new person entry for author: %s", v44, 0xCu);
      if (SHIBYTE(v40) < 0) {
        operator delete(*(void **)buf);
      }
    }

    uint64_t v23 = v36;
    uint64_t v27 = v35;
    uint64_t v28 = v36;
    if (v36) {
      atomic_fetch_add_explicit(&v36->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    ML3ImportSession::addPerson(v8, &v27);
    if (v23) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    if (v13) {
      goto LABEL_17;
    }
LABEL_38:
    uint64_t v24 = objc_msgSend(*(id *)(v8 + 136), "nextPersistentID", v27, v28, v29, v30, *(_OWORD *)&v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__r.__words[2]);
    uint8x8_t v25 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      (*(void (**)(uint8_t *__return_ptr))(*(void *)v35 + 88))(v44);
      unint64_t v26 = v45 >= 0 ? v44 : *(uint8_t **)v44;
      *(_DWORD *)long long buf = 134218754;
      *(void *)&uint8_t buf[4] = v24;
      __int16 v38 = 2080;
      long long v39 = v26;
      __int16 v40 = 2048;
      *(void *)unint64_t v41 = v11;
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = a3;
      _os_log_impl(&dword_1B022D000, v25, OS_LOG_TYPE_DEFAULT, "Adding new author entry with pid %lld for %s: role=%lld, isPending=%d", buf, 0x26u);
      if (v45 < 0) {
        operator delete(*(void **)v44);
      }
    }

    operator new();
  }
  if (!v13) {
    goto LABEL_38;
  }
LABEL_17:
  BOOL v16 = (uint64_t *)(*(void *)(a1[5] + 8) + 48);
  *(void *)long long buf = &v31;
  if (std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v16, (unsigned __int8 *)&v31, (long long **)buf)[40] != a3|| (uint64_t v17 = *(void *)(a1[6] + 8) + 48, *(void *)buf = &v31, v11 != *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v17, (unsigned __int8 *)&v31, (long long **)buf)+ 5))|| (v18 = *(void *)(a1[7] + 8) + 48, *(void *)buf = &v31, *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v18, (unsigned __int8 *)&v31, (long long **)buf)+ 5) != a4))
  {
    size_t v19 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      (*(void (**)(uint8_t *__return_ptr))(*(void *)v35 + 88))(v44);
      if (v45 >= 0) {
        uint64_t v20 = v44;
      }
      else {
        uint64_t v20 = *(uint8_t **)v44;
      }
      *(_DWORD *)long long buf = 134219010;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v38 = 2080;
      long long v39 = v20;
      __int16 v40 = 1024;
      *(_DWORD *)unint64_t v41 = a3;
      *(_WORD *)&v41[4] = 2048;
      *(void *)&v41[6] = v11;
      __int16 v42 = 2048;
      uint64_t v43 = a4;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "Updating author entry with pid %lld for %s: isPending=%d, role=%lld, position=%lld", buf, 0x30u);
      if (v45 < 0) {
        operator delete(*(void **)v44);
      }
    }

    ++*(_DWORD *)(v8 + 192);
    operator new();
  }
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>(*(void *)(a1[8] + 8) + 48, (unsigned __int8 *)&v31, (uint64_t)&v31);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
LABEL_47:
  uint64_t v32 = &unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
}

void sub_1B0470918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,std::__shared_weak_count *a28)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a28);
  }
  _Unwind_Resume(a1);
}

void ML3ImportSession::addPerson(uint64_t a1, uint64_t *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(long long *__return_ptr))(*(void *)*a2 + 88))(&__p);
    id v5 = v28.__r_.__value_.__s.__data_[7] >= 0 ? &__p : (long long *)__p;
    LODWORD(buf.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "adding person %{public}s", (uint8_t *)&buf, 0xCu);
    if (v28.__r_.__value_.__s.__data_[7] < 0) {
      operator delete((void *)__p);
    }
  }

  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v24 = *a2;
  uint8x8_t v25 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t PersonPersistentID = ML3ImportSession::_getPersonPersistentID(a1, (uint64_t)&v24);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (PersonPersistentID)
  {
    ++*(_DWORD *)(a1 + 204);
    *(unsigned char *)(*a2 + 16) = 1;
  }
  else
  {
    ++*(_DWORD *)(a1 + 200);
    uint64_t v8 = (std::__shared_weak_count *)a2[1];
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t PersonPersistentID = objc_msgSend(*(id *)(a1 + 88), "nextPersistentID", v24, v25);
    uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(__p) = 134217984;
      *(void *)((char *)&__p + 4) = PersonPersistentID;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "created new person pid %lld", (uint8_t *)&__p, 0xCu);
    }

    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  uint64_t v10 = *a2;
  *(void *)(*a2 + _Block_object_dispose(&STACK[0x200], 8) = PersonPersistentID;
  uint64_t v11 = *(void **)(a1 + 2496);
  unint64_t v12 = *(void *)(a1 + 2504);
  if ((unint64_t)v11 >= v12)
  {
    uint64_t v15 = *(void *)(a1 + 2488);
    uint64_t v16 = ((uint64_t)v11 - v15) >> 4;
    unint64_t v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 60) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = v12 - v15;
    if (v18 >> 3 > v17) {
      unint64_t v17 = v18 >> 3;
    }
    if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v19 = v17;
    }
    v28.__r_.__value_.__r.__words[2] = a1 + 2504;
    uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<ML3ImportItem>>>(v19);
    char v21 = &v20[16 * v16];
    *(void *)&long long __p = v20;
    *((void *)&__p + 1) = v21;
    v28.__r_.__value_.__l.__size_ = (std::string::size_type)&v20[16 * v22];
    long long v23 = *(_OWORD *)a2;
    *(_OWORD *)char v21 = *(_OWORD *)a2;
    if (*((void *)&v23 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v23 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    v28.__r_.__value_.__r.__words[0] = (std::string::size_type)(v21 + 16);
    std::vector<std::shared_ptr<ML3ImportItem>>::__swap_out_circular_buffer((void *)(a1 + 2488), &__p);
    float v14 = *(void **)(a1 + 2496);
    std::__split_buffer<std::shared_ptr<ML3ImportItem>>::~__split_buffer((uint64_t)&__p);
  }
  else
  {
    *uint64_t v11 = v10;
    uint64_t v13 = a2[1];
    v11[1] = v13;
    if (v13) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    }
    float v14 = v11 + 2;
    *(void *)(a1 + 2496) = v11 + 2;
  }
  *(void *)(a1 + 2496) = v14;
  (*(void (**)(long long *__return_ptr))(*(void *)*a2 + 24))(&__p);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&buf, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
    *(void *)&long long __p = &unk_1F08C3230;
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v28.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string buf = v28;
  }
  *(void *)&long long __p = &buf;
  *((void *)std::__hash_table<std::__hash_value_type<std::string,long long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,long long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,long long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,long long>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1 + 2448, (unsigned __int8 *)&buf, (long long **)&__p)+ 5) = PersonPersistentID;
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
}

void sub_1B0470DA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ContainerAuthorImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B0470E84(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

char *std::__hash_table<std::__hash_value_type<std::string,BOOL>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,BOOL>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,BOOL>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,BOOL>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t *a1, unsigned __int8 *a2, long long **a3)
{
  unint64_t v7 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
  unint64_t v8 = v7;
  unint64_t v9 = a1[1];
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }
    unint64_t v12 = *(void ***)(*a1 + 8 * v3);
    if (v12)
    {
      uint64_t v13 = (char *)*v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = *((void *)v13 + 1);
          if (v14 == v8)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v13 + 16, a2)) {
              return v13;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v9) {
                v14 %= v9;
              }
            }
            else
            {
              v14 &= v9 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          uint64_t v13 = *(char **)v13;
        }
        while (v13);
      }
    }
  }
  uint64_t v13 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v13 = 0;
  *((void *)v13 + 1) = v8;
  uint64_t v15 = (std::string *)(v13 + 16);
  uint64_t v16 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v15, *(const std::string::value_type **)v16, *((void *)v16 + 1));
  }
  else
  {
    long long v17 = *v16;
    *((void *)v13 + 4) = *((void *)v16 + 2);
    *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v17;
  }
  uint64_t v18 = a1 + 2;
  v13[40] = 0;
  float v19 = (float)(unint64_t)(a1[3] + 1);
  float v20 = *((float *)a1 + 8);
  if (!v9 || (float)(v20 * (float)v9) < v19)
  {
    BOOL v21 = 1;
    if (v9 >= 3) {
      BOOL v21 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v22 = v21 | (2 * v9);
    unint64_t v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23) {
      int8x8_t prime = (int8x8_t)v23;
    }
    else {
      int8x8_t prime = (int8x8_t)v22;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v9 = a1[1];
    if (*(void *)&prime > v9) {
      goto LABEL_33;
    }
    if (*(void *)&prime < v9)
    {
      unint64_t v31 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v9 < 3 || (uint8x8_t v32 = (uint8x8_t)vcnt_s8((int8x8_t)v9), v32.i16[0] = vaddlv_u8(v32), v32.u32[0] > 1uLL))
      {
        unint64_t v31 = std::__next_prime(v31);
      }
      else
      {
        uint64_t v33 = 1 << -(char)__clz(v31 - 1);
        if (v31 >= 2) {
          unint64_t v31 = v33;
        }
      }
      if (*(void *)&prime <= v31) {
        int8x8_t prime = (int8x8_t)v31;
      }
      if (*(void *)&prime >= v9)
      {
        unint64_t v9 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_33:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint8x8_t v25 = operator new(8 * *(void *)&prime);
          unint64_t v26 = (void *)*a1;
          *a1 = (uint64_t)v25;
          if (v26) {
            operator delete(v26);
          }
          uint64_t v27 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v27++) = 0;
          while (*(void *)&prime != v27);
          std::string v28 = (void *)*v18;
          if (*v18)
          {
            unint64_t v29 = v28[1];
            uint8x8_t v30 = (uint8x8_t)vcnt_s8(prime);
            v30.i16[0] = vaddlv_u8(v30);
            if (v30.u32[0] > 1uLL)
            {
              if (v29 >= *(void *)&prime) {
                v29 %= *(void *)&prime;
              }
            }
            else
            {
              v29 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v29) = v18;
            uint64_t v34 = (void *)*v28;
            if (*v28)
            {
              do
              {
                unint64_t v35 = v34[1];
                if (v30.u32[0] > 1uLL)
                {
                  if (v35 >= *(void *)&prime) {
                    v35 %= *(void *)&prime;
                  }
                }
                else
                {
                  v35 &= *(void *)&prime - 1;
                }
                if (v35 != v29)
                {
                  if (!*(void *)(*a1 + 8 * v35))
                  {
                    *(void *)(*a1 + 8 * v35) = v28;
                    goto LABEL_58;
                  }
                  void *v28 = *v34;
                  void *v34 = **(void **)(*a1 + 8 * v35);
                  **(void **)(*a1 + 8 * v35) = v34;
                  uint64_t v34 = v28;
                }
                unint64_t v35 = v29;
LABEL_58:
                std::string v28 = v34;
                uint64_t v34 = (void *)*v34;
                unint64_t v29 = v35;
              }
              while (v34);
            }
          }
          unint64_t v9 = (unint64_t)prime;
          goto LABEL_62;
        }
        __int16 v40 = (void *)*a1;
        *a1 = 0;
        if (v40) {
          operator delete(v40);
        }
        unint64_t v9 = 0;
        a1[1] = 0;
      }
    }
LABEL_62:
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }
    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }
  uint64_t v36 = *a1;
  uint64_t v37 = *(void **)(*a1 + 8 * v3);
  if (v37)
  {
    *(void *)uint64_t v13 = *v37;
LABEL_75:
    void *v37 = v13;
    goto LABEL_76;
  }
  *(void *)uint64_t v13 = *v18;
  void *v18 = v13;
  *(void *)(v36 + 8 * v3) = v18;
  if (*(void *)v13)
  {
    unint64_t v38 = *(void *)(*(void *)v13 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v38 >= v9) {
        v38 %= v9;
      }
    }
    else
    {
      v38 &= v9 - 1;
    }
    uint64_t v37 = (void *)(*a1 + 8 * v38);
    goto LABEL_75;
  }
LABEL_76:
  ++a1[3];
  return v13;
}

void sub_1B04712D4(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::string,void *>>>::operator()[abi:ne180100](0, v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<ML3ContainerAuthorImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ContainerAuthorImportItem>,std::allocator<ML3ContainerAuthorImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_28ML3ContainerAuthorImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3ContainerAuthorImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ContainerAuthorImportItem>,std::allocator<ML3ContainerAuthorImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3ContainerAuthorImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ContainerAuthorImportItem>,std::allocator<ML3ContainerAuthorImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void ___ZN16ML3ImportSession25_prepareContainerItemDataENSt3__110shared_ptrI13ML3ImportItemEE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  unint64_t v8 = [v5 numberForColumnIndex:0];
  unint64_t v9 = [v8 longLongValue];

  unint64_t v14 = v9;
  uint8x8_t v10 = [v5 numberForColumnIndex:1];
  unint64_t v11 = [v10 longLongValue];

  uint64_t v12 = *(void *)(v7 + 616) + 40 * *(int *)(v7 + 32);
  unint64_t v13 = v11;
  std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long &&>,std::tuple<>>(v12, v11, &v13)[3] = v9;
  std::__hash_table<std::__hash_value_type<long long,unsigned long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,unsigned long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,unsigned long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,unsigned long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((float *)(*(void *)(v7 + 640) + 40 * *(int *)(v7 + 32)), v9, &v14)[3] = v11;
}

void sub_1B0471484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ML3ImportSession::removeContainer(uint64_t a1, uint64_t *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)*a2 + 88))(__p);
    id v5 = v17 >= 0 ? __p : *(unsigned char **)__p;
    *(_DWORD *)std::string buf = 136446210;
    float v19 = v5;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "removing container %{public}s", buf, 0xCu);
    if (v17 < 0) {
      operator delete(*(void **)__p);
    }
  }

  if (!ML3ImportSession::flush((ML3ImportSession *)a1, 0)) {
    return 0;
  }
  id v6 = (std::__shared_weak_count *)a2[1];
  uint64_t v14 = *a2;
  uint64_t v15 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t ContainerPersistentID = ML3ImportSession::_getContainerPersistentID(a1, &v14);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (ContainerPersistentID)
  {
    *(void *)(*a2 + _Block_object_dispose(&STACK[0x200], 8) = ContainerPersistentID;
    unint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long __p = 134217984;
      *(void *)&__p[4] = ContainerPersistentID;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "removing container %lld", __p, 0xCu);
    }

    ++*(_DWORD *)(a1 + 172);
    unint64_t v9 = [ML3Container alloc];
    os_log_t v10 = -[ML3Entity initWithPersistentID:inLibrary:](v9, "initWithPersistentID:inLibrary:", ContainerPersistentID, *(void *)(a1 + 8), v14, v15);
    uint64_t v11 = [v10 deleteFromLibrary];
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long __p = 0;
        _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "failed to delete playlist", __p, 2u);
      }
    }
  }
  else
  {
    os_log_t v10 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long __p = 0;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "failed to find playlist to delete - ignoring", __p, 2u);
    }
    uint64_t v11 = 1;
  }

  return v11;
}

void sub_1B0471758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ML3ImportSession::finish(ML3ImportSession *this)
{
  uint64_t v2 = ML3ImportSession::flush(this, 1);
  if (v2) {
    ML3ImportSession::_finishImport((id *)this);
  }
  return v2;
}

void ML3ImportSession::_finishImport(id *this)
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl(&dword_1B022D000, v1, OS_LOG_TYPE_DEFAULT, "finishing import", buf, 2u);
  }

  uint64_t v2 = (ML3ImportSession *)this;
  if (*((unsigned char *)this + 1512))
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v2 = (ML3ImportSession *)this;
      if (this[104])
      {
        unint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          id v4 = this[104];
          *(_DWORD *)std::string buf = 134217984;
          *(void *)&uint8_t buf[4] = v4;
          _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "removing %lu album_artists not re-added by the reset import", buf, 0xCu);
        }

        ML3AlbumArtistRulesRemovalSourceIdentityPropertyForSource(*((unsigned int *)this + 8));
        int v170 = (NSArray *)objc_claimAutoreleasedReturnValue();
        if (v170)
        {
          v164 = [NSString stringWithFormat:@"UPDATE album_artist SET %@='', liked_state=?, liked_state_changed_date=? WHERE album_artist_pid=?", v170];
          id v5 = (ML3ImportSession *)this;
          long long v167 = [NSString stringWithFormat:@"UPDATE album_artist SET %@=0, liked_state=?, liked_state_changed_date=? WHERE album_artist_pid=?", v170];
          id v6 = this[103];
          if (v6)
          {
            while (1)
            {
              uint64_t v7 = v6[2];
              unint64_t v8 = (void *)*((void *)v5 + 2);
              if (*((_DWORD *)v5 + 8) == 2)
              {
                v213[0] = &unk_1F0912400;
                unint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
                v213[1] = v9;
                os_log_t v10 = [NSNumber numberWithLongLong:v7];
                v213[2] = v10;
                uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v213 count:3];
                id v200 = 0;
                char v12 = [v8 executeUpdate:v164 withParameters:v11 error:&v200];
                id v13 = v200;
              }
              else
              {
                v212[0] = &unk_1F0912400;
                unint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
                v212[1] = v9;
                os_log_t v10 = [NSNumber numberWithLongLong:v7];
                v212[2] = v10;
                uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v212 count:3];
                id v199 = 0;
                char v12 = [v8 executeUpdate:v167 withParameters:v11 error:&v199];
                id v13 = v199;
              }

              if ((v12 & 1) == 0) {
                break;
              }

              id v6 = (void *)*v6;
              id v5 = (ML3ImportSession *)this;
              if (!v6) {
                goto LABEL_15;
              }
            }
            uint64_t v16 = os_log_create("com.apple.amp.medialibrary", "Import");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)std::string buf = 138543618;
              *(void *)&uint8_t buf[4] = v170;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(void *)&buf[14] = v7;
              _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "failed to remove source property=%{public}@ for albumArtistPID=%lld", buf, 0x16u);
            }

            BOOL v14 = 0;
          }
          else
          {
LABEL_15:
            BOOL v14 = 1;
          }
        }
        else
        {
          BOOL v14 = 1;
        }

        uint64_t v2 = (ML3ImportSession *)this;
      }
      else
      {
        BOOL v14 = 1;
      }
      if (!*((void *)v2 + 109)) {
        goto LABEL_42;
      }
      char v17 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *((void *)v2 + 109);
        *(_DWORD *)std::string buf = 134217984;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl(&dword_1B022D000, v17, OS_LOG_TYPE_DEFAULT, "removing %lu albums not re-added by the reset import", buf, 0xCu);
      }

      ML3AlbumRulesRemovalSourceIdentityPropertyForSource(*((unsigned int *)this + 8));
      v171 = (NSArray *)objc_claimAutoreleasedReturnValue();
      if (v171)
      {
        char v165 = [NSString stringWithFormat:@"UPDATE album SET %@='', liked_state=?, liked_state_changed_date=? WHERE album_pid=?", v171];
        float v19 = (ML3ImportSession *)this;
        uint64_t v168 = [NSString stringWithFormat:@"UPDATE album SET %@=0, liked_state=?, liked_state_changed_date=? WHERE album_artist_pid=?", v171];
        uint64_t v20 = this[108];
        if (v20)
        {
          while (1)
          {
            uint64_t v21 = v20[2];
            unint64_t v22 = (void *)*((void *)v19 + 2);
            if (*((_DWORD *)v19 + 8) == 2)
            {
              v211[0] = &unk_1F0912400;
              unint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
              v211[1] = v23;
              uint64_t v24 = [NSNumber numberWithLongLong:v21];
              v211[2] = v24;
              uint8x8_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:3];
              id v198 = 0;
              char v26 = [v22 executeUpdate:v165 withParameters:v25 error:&v198];
              id v27 = v198;
            }
            else
            {
              v210[0] = &unk_1F0912400;
              unint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
              v210[1] = v23;
              uint64_t v24 = [NSNumber numberWithLongLong:v21];
              v210[2] = v24;
              uint8x8_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:3];
              id v197 = 0;
              char v26 = [v22 executeUpdate:v168 withParameters:v25 error:&v197];
              id v27 = v197;
            }

            if ((v26 & 1) == 0) {
              break;
            }

            uint64_t v20 = (void *)*v20;
            float v19 = (ML3ImportSession *)this;
            if (!v20)
            {
              BOOL v14 = 1;
              goto LABEL_39;
            }
          }
          std::string v28 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)std::string buf = 138543618;
            *(void *)&uint8_t buf[4] = v171;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v21;
            _os_log_impl(&dword_1B022D000, v28, OS_LOG_TYPE_ERROR, "failed to remove source property=%{public}@ for albumPID=%lld", buf, 0x16u);
          }

          BOOL v14 = 0;
        }
LABEL_39:
      }
    }
    else
    {
      BOOL v14 = 1;
    }
    uint64_t v2 = (ML3ImportSession *)this;
LABEL_42:
    if (*((void *)v2 + 94))
    {
      unint64_t v29 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = *((void *)v2 + 94);
        *(_DWORD *)std::string buf = 134217984;
        *(void *)&uint8_t buf[4] = v30;
        _os_log_impl(&dword_1B022D000, v29, OS_LOG_TYPE_DEFAULT, "removing %lu tracks not re-added by the reset import", buf, 0xCu);
      }

      uint64_t v172 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:this[94]];
      unint64_t v31 = (ML3ImportSession *)this;
      for (i = this[93]; i; unint64_t v31 = (ML3ImportSession *)this)
      {
        uint64_t v33 = [NSNumber numberWithLongLong:i[2]];
        [(NSArray *)v172 addObject:v33];

        unint64_t i = (void *)*i;
      }
      BOOL v14 = ML3ImportSession::_removeTracksFromLibrary(v31, v172);
      if (!v14)
      {
        uint64_t v34 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)std::string buf = 0;
          _os_log_impl(&dword_1B022D000, v34, OS_LOG_TYPE_ERROR, "failed to remove remaining tracks", buf, 2u);
        }
      }
      uint64_t v2 = (ML3ImportSession *)this;
    }
    BOOL v15 = v14;
    if (*((void *)v2 + 99))
    {
      unint64_t v35 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v36 = *((void *)v2 + 99);
        *(_DWORD *)std::string buf = 134217984;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl(&dword_1B022D000, v35, OS_LOG_TYPE_DEFAULT, "removing %lu containers not re-added by the reset import", buf, 0xCu);
      }

      uint64_t v2 = (ML3ImportSession *)this;
      uint64_t v37 = this[98];
      if (v37)
      {
        while (1)
        {
          uint64_t v38 = v37[2];
          int v173 = [(ML3Entity *)[ML3Container alloc] initWithPersistentID:v38 inLibrary:this[1]];
          if (![(ML3Entity *)v173 deleteFromLibrary]) {
            break;
          }

          uint64_t v37 = (void *)*v37;
          if (!v37)
          {
            BOOL v14 = 1;
            goto LABEL_62;
          }
        }
        long long v39 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 134217984;
          *(void *)&uint8_t buf[4] = v38;
          _os_log_impl(&dword_1B022D000, v39, OS_LOG_TYPE_ERROR, "failed to delete container %lld", buf, 0xCu);
        }

        BOOL v14 = 0;
LABEL_62:
        uint64_t v2 = (ML3ImportSession *)this;
      }
      BOOL v15 = v14;
    }
    goto LABEL_64;
  }
  BOOL v15 = 1;
LABEL_64:
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1088);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1128);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1248);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1168);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1208);
  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::clear((uint64_t)v2 + 968);
  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::clear((uint64_t)v2 + 1048);
  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::clear((uint64_t)v2 + 1008);
  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::clear((uint64_t)v2 + 928);
  std::__hash_table<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,std::shared_ptr<ML3ImportItem>>>>::clear((uint64_t)v2 + 888);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1288);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<ML3ArtistData>>>>::clear((uint64_t)v2 + 1328);
  if (!v15)
  {
    int v166 = 0;
    goto LABEL_123;
  }
  if ((ML3ImportSession::_enableTriggers((id *)v2) & 1) == 0)
  {
    size_t v59 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      uint64_t v60 = "failed to re-create triggers";
      goto LABEL_120;
    }
    goto LABEL_121;
  }
  if (*((unsigned char *)this + 1513))
  {
    __int16 v40 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEFAULT, "re-building indexes after large import", buf, 2u);
    }

    long long v195 = 0u;
    long long v196 = 0u;
    long long v193 = 0u;
    long long v194 = 0u;
    unint64_t v41 = +[ML3MusicLibrary indexSchemaSQL];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v193 objects:v209 count:16];
    if (!v42)
    {
LABEL_112:

      size_t v59 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
        uint64_t v60 = "failed to re-create indexes";
        goto LABEL_120;
      }
      goto LABEL_121;
    }
    uint64_t v43 = *(void *)v194;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v194 != v43) {
          objc_enumerationMutation(v41);
        }
        if (([this[2] executeUpdate:*(void *)(*((void *)&v193 + 1) + 8 * j)] & 1) == 0) {
          goto LABEL_112;
        }
      }
      uint64_t v42 = [v41 countByEnumeratingWithState:&v193 objects:v209 count:16];
    }
    while (v42);

    if (([this[2] executeUpdate:@"PRAGMA analysis_limit=400;"] & 1) == 0)
    {
      char v45 = _ML3LogCategoryImport();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_1B022D000, v45, OS_LOG_TYPE_ERROR, "failed to set ANALYZE limit", buf, 2u);
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v47 = v46;
    unint64_t v48 = _ML3LogCategoryImport();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_1B022D000, v48, OS_LOG_TYPE_DEFAULT, "Starting to run ANALYZE...", buf, 2u);
    }

    if (([this[2] executeUpdate:@"ANALYZE;"] & 1) == 0)
    {
      uint64_t v49 = _ML3LogCategoryImport();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_1B022D000, v49, OS_LOG_TYPE_ERROR, "failed to perform ANALYZE", buf, 2u);
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v51 = v50;
    unint64_t v52 = _ML3LogCategoryImport();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 134217984;
      *(double *)&uint8_t buf[4] = v51 - v47;
      _os_log_impl(&dword_1B022D000, v52, OS_LOG_TYPE_DEFAULT, "Finished running ANALYZE... Took %g", buf, 0xCu);
    }
  }
  memset(v216, 0, sizeof(v216));
  long long v217 = 0u;
  long long v218 = 0u;
  v214[0] = objc_opt_class();
  v214[1] = objc_opt_class();
  v214[2] = objc_opt_class();
  v214[3] = objc_opt_class();
  v214[4] = objc_opt_class();
  uint64_t v174 = [MEMORY[0x1E4F1C978] arrayWithObjects:v214 count:5];
  uint64_t v53 = [(NSArray *)v174 countByEnumeratingWithState:v216 objects:buf count:16];
  if (!v53) {
    goto LABEL_102;
  }
  uint64_t v54 = **(void **)&v216[16];
  while (2)
  {
    for (uint64_t k = 0; k != v53; ++k)
    {
      if (**(void **)&v216[16] != v54) {
        objc_enumerationMutation(v174);
      }
      BOOL v56 = *(void **)(*(void *)&v216[8] + 8 * k);
      if (*((_DWORD *)this + 40) || (*((_DWORD *)this + 39) + *((_DWORD *)this + 38)) > 0x13)
      {
        if (([v56 canonicalizeCollectionRepresentativeItemsInLibrary:this[1] usingConnection:this[2]] & 1) == 0)
        {
          os_log_t v160 = os_log_create("com.apple.amp.medialibrary", "Import");
          if (!os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
          {
LABEL_117:

            p_super = &v174->super;
            goto LABEL_118;
          }
          *(_WORD *)long long v201 = 0;
          unint64_t v61 = "failed to canonicalize collection representative item pids";
LABEL_116:
          _os_log_impl(&dword_1B022D000, v160, OS_LOG_TYPE_ERROR, v61, v201, 2u);
          goto LABEL_117;
        }
      }
      else if (([v56 updateRepresentativeItemPersistentIDsInLibrary:this[1] persistentIDs:this[198] usingConnection:this[2]] & 1) == 0)
      {
        os_log_t v160 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (!os_log_type_enabled(v160, OS_LOG_TYPE_ERROR)) {
          goto LABEL_117;
        }
        *(_WORD *)long long v201 = 0;
        unint64_t v61 = "failed to update representative item pids";
        goto LABEL_116;
      }
    }
    uint64_t v53 = [(NSArray *)v174 countByEnumeratingWithState:v216 objects:buf count:16];
    if (v53) {
      continue;
    }
    break;
  }
LABEL_102:

  unint64_t v57 = (ML3ImportSession *)this;
  if ((*((unsigned char *)this + 1512) || *((_DWORD *)this + 40) > 0x63u || *((_DWORD *)this + 58) || *((_DWORD *)this + 55))
    && (v58 = +[ML3Collection removeOrphanedCollectionsInLibrary:this[1] usingConnection:this[2]], unint64_t v57 = (ML3ImportSession *)this, !v58))
  {
    p_super = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v201 = 0;
      _os_log_impl(&dword_1B022D000, p_super, OS_LOG_TYPE_ERROR, "failed to de-orphan collections", v201, 2u);
    }
LABEL_118:

    size_t v59 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      uint64_t v60 = "failed to apply finishing collection changes";
      goto LABEL_120;
    }
  }
  else
  {
    if ([*((id *)v57 + 7) commitUpdates])
    {
      int v166 = 1;
      goto LABEL_122;
    }
    size_t v59 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)std::string buf = 0;
      uint64_t v60 = "failed to commit sort map changes";
LABEL_120:
      _os_log_impl(&dword_1B022D000, v59, OS_LOG_TYPE_ERROR, v60, buf, 2u);
    }
  }
LABEL_121:

  int v166 = 0;
LABEL_122:
  uint64_t v2 = (ML3ImportSession *)this;
LABEL_123:
  [*((id *)v2 + 2) executeQuery:@"SELECT value FROM _MLDatabaseProperties WHERE key = 'MLCloudAccountID'"];
  uint64_t v175 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v63 = [(NSArray *)v175 objectForFirstRowAndColumn];
  uint64_t v64 = [v63 longLongValue];

  int v65 = v166;
  if (v64) {
    int v65 = 0;
  }
  uint64_t v66 = v175;
  if (v65 == 1 && [this[90] count])
  {
    uint64_t v67 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v68 = [this[90] count];
      *(_DWORD *)std::string buf = 134217984;
      *(void *)&uint8_t buf[4] = v68;
      _os_log_impl(&dword_1B022D000, v67, OS_LOG_TYPE_DEFAULT, "inserting %lu tracks into purchase playlist", buf, 0xCu);
    }

    std::string v69 = [this[1] currentDevicePurchasesPlaylist];
    char v70 = [v69 appendTracksWithPersistentIDs:this[90] notify:0];

    if ((v70 & 1) == 0)
    {
      uint64_t v71 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_impl(&dword_1B022D000, v71, OS_LOG_TYPE_ERROR, "failed to update purchased playlist", buf, 2u);
      }
    }
    uint64_t v66 = v175;
    [this[90] removeAllObjects];
  }

  uint64_t v72 = (ML3ImportSession *)this;
  id v73 = this[1];
  memset(buf, 0, 24);
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(buf, *((const void **)v72 + 287), *((void *)v72 + 288), (uint64_t)(*((void *)v72 + 288) - *((void *)v72 + 287)) >> 3);
  id v74 = this[2];
  v188[0] = MEMORY[0x1E4F143A8];
  v188[1] = 3321888768;
  v188[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke;
  v188[3] = &unk_1F08C8900;
  uint64_t v191 = 0;
  uint64_t v192 = 0;
  long long __p = 0;
  uint64_t v162 = *(void **)buf;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, *(const void **)buf, *(uint64_t *)&buf[8], (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 3);
  id v163 = v73;
  id v189 = v163;
  [v74 enqueueBlockForTransactionCommit:v188];
  if (this[304])
  {
    uint64_t v75 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      id v76 = this[304];
      *(_DWORD *)v216 = 134217984;
      *(void *)&v216[4] = v76;
      _os_log_impl(&dword_1B022D000, v75, OS_LOG_TYPE_DEFAULT, "re-trying %lu orphaned playlists", v216, 0xCu);
    }

    uint64_t v72 = (ML3ImportSession *)this;
    for (m = this[303]; m; uint64_t v72 = (ML3ImportSession *)this)
    {
      uint64_t v78 = m[2];
      unint64_t v79 = m[3];
      uint64_t ContainerPersistentID = ML3ImportSession::_getContainerPersistentID(v72, v79);
      if (ContainerPersistentID)
      {
        int v81 = (void *)*((void *)v72 + 2);
        int v82 = [NSNumber numberWithLongLong:ContainerPersistentID];
        v208[0] = v82;
        id v83 = [NSNumber numberWithLongLong:v78];
        v208[1] = v83;
        unint64_t v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v208 count:2];
        [v81 executeUpdate:@"UPDATE container SET parent_pid = ? WHERE container_pid = ?" withParameters:v84 error:0];
      }
      else
      {
        int v82 = os_log_create("com.apple.amp.medialibrary", "Import");
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v216 = 134218240;
          *(void *)&v216[4] = v78;
          *(_WORD *)&v216[12] = 2048;
          *(void *)&v216[14] = v79;
          _os_log_impl(&dword_1B022D000, v82, OS_LOG_TYPE_ERROR, "failed to find parent of orphaned container. container_pid=%lld, parentSourceId=%lld", v216, 0x16u);
        }
      }

      uint64_t m = (void *)*m;
    }
  }
  uint64_t v85 = (void *)*((void *)v72 + 57);
  std::string v86 = (void *)*((void *)v72 + 58);
  if (v85 != v86)
  {
    do
    {
      std::string v87 = [NSNumber numberWithLongLong:*v85];
      id v88 = this[2];
      v207[0] = v87;
      v207[1] = v87;
      int v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v207 count:2];
      [v88 executeUpdate:@"UPDATE album SET album_year = (SELECT IFNULL(MAX(year), 0) FROM item_extra JOIN item USING(item_pid) WHERE item.album_pid = ?) WHERE album_pid = ?", v89, 0 withParameters error];

      ++v85;
    }
    while (v85 != v86);
    uint64_t v72 = (ML3ImportSession *)this;
    uint64_t v85 = this[57];
  }
  *((void *)v72 + 5_Block_object_dispose(&STACK[0x200], 8) = v85;
  v90 = (void *)*((void *)v72 + 60);
  v91 = (void *)*((void *)v72 + 61);
  if (v90 != v91)
  {
    do
    {
      uint64_t v92 = *v90;
      int v93 = [NSNumber numberWithLongLong:*v90];
      uint64_t v94 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v216 = 134217984;
        *(void *)&v216[4] = v92;
        _os_log_impl(&dword_1B022D000, v94, OS_LOG_TYPE_DEFAULT, "updating contains_classical_work for album %lld", v216, 0xCu);
      }

      id v95 = this[2];
      v206[0] = v93;
      v206[1] = v93;
      uint64_t v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:v206 count:2];
      [v95 executeUpdate:@"UPDATE album SET contains_classical_work=(CASE WHEN EXISTS (SELECT album_pid FROM item JOIN item_extra USING (item_pid) WHERE album_pid=? AND classical_work!='' OR (show_composer=1 AND grouping!='')) THEN 1 ELSE 0 END) WHERE album_pid=?" withParameters:v96 error:0];

      ++v90;
    }
    while (v90 != v91);
    uint64_t v72 = (ML3ImportSession *)this;
    v90 = this[60];
  }
  *((void *)v72 + 61) = v90;
  v97 = (void *)*((void *)v72 + 63);
  uint64_t v98 = (void *)*((void *)v72 + 64);
  if (v97 != v98)
  {
    do
    {
      uint64_t v99 = *v97;
      v100 = [NSNumber numberWithLongLong:*v97];
      uint64_t v101 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v216 = 134217984;
        *(void *)&v216[4] = v99;
        _os_log_impl(&dword_1B022D000, v101, OS_LOG_TYPE_DEFAULT, "updating all_compilations for album %lld", v216, 0xCu);
      }

      id v102 = this[2];
      v205[0] = v100;
      v205[1] = v100;
      uint64_t v103 = [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:2];
      [v102 executeUpdate:@"UPDATE album SET all_compilations=(SELECT IFNULL(MIN(is_compilation), 0) FROM item WHERE item.album_pid = ?) WHERE album_pid = ?", v103, 0 withParameters error];

      ++v97;
    }
    while (v97 != v98);
    uint64_t v72 = (ML3ImportSession *)this;
    v97 = this[63];
  }
  *((void *)v72 + 64) = v97;
  if (*((_DWORD *)v72 + 8) != 6)
  {
    if (!v166) {
      goto LABEL_173;
    }
LABEL_172:
    [*((id *)v72 + 2) executeUpdate:@"DELETE FROM _MLDatabaseProperties WHERE key = 'MLResetCollectionsOnNextImport'"];
    goto LABEL_173;
  }
  uint64_t v169 = [MEMORY[0x1E4F1CA48] array];
  int v104 = [*((id *)v72 + 2) executeQuery:@"SELECT person_pid, cloud_id, name FROM person WHERE NOT EXISTS (SELECT * FROM container_item_person WHERE container_item_person.person_pid = person.person_pid) AND NOT EXISTS (SELECT * FROM container_author WHERE container_author.person_pid = person.person_pid)"];
  v186[0] = MEMORY[0x1E4F143A8];
  v186[1] = 3221225472;
  v186[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_210;
  v186[3] = &unk_1E5FB83F8;
  id v105 = v169;
  id v187 = v105;
  [v104 enumerateRowsWithBlock:v186];

  if ([v105 count])
  {
    int v106 = +[ML3DatabaseStatementRenderer defaultRenderer];
    int v107 = objc_msgSend(v106, "statementWithPrefix:inParameterCount:", @"DELETE FROM person WHERE ROWID", objc_msgSend(v105, "count"));
    id v108 = this[2];
    id v185 = 0;
    char v109 = [v108 executeUpdate:v107 withParameters:v105 error:&v185];
    id v110 = v185;
    LOBYTE(v166) = v109;
    if ((v109 & 1) == 0)
    {
      uint64_t v111 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v216 = 138543362;
        *(void *)&v216[4] = v110;
        _os_log_impl(&dword_1B022D000, v111, OS_LOG_TYPE_ERROR, "Failed to remove orphaned persons. err=%{public}@", v216, 0xCu);
      }
    }
  }
  uint64_t v112 = [MEMORY[0x1E4F1CA48] array];
  BOOL v113 = [this[2] executeQuery:@"SELECT container_item_reaction_pid, container_item_pid, person_pid FROM container_item_reaction WHERE NOT EXISTS (SELECT * FROM container_item WHERE container_item.container_item_pid =container_item_reaction.container_item_pid)"];
  v183[0] = MEMORY[0x1E4F143A8];
  v183[1] = 3221225472;
  v183[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_217;
  v183[3] = &unk_1E5FB83F8;
  id v114 = v112;
  id v184 = v114;
  [v113 enumerateRowsWithBlock:v183];

  if ([v114 count])
  {
    std::string::size_type v115 = +[ML3DatabaseStatementRenderer defaultRenderer];
    uint64_t v116 = objc_msgSend(v115, "statementWithPrefix:inParameterCount:", @"DELETE FROM container_item_reaction WHERE ROWID", objc_msgSend(v114, "count"));
    id v117 = this[2];
    id v182 = 0;
    char v118 = [v117 executeUpdate:v116 withParameters:v114 error:&v182];
    id v119 = v182;
    LOBYTE(v166) = v118;
    if ((v118 & 1) == 0)
    {
      unint64_t v120 = os_log_create("com.apple.amp.medialibrary", "Import");
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v216 = 138543362;
        *(void *)&v216[4] = v119;
        _os_log_impl(&dword_1B022D000, v120, OS_LOG_TYPE_ERROR, "Failed to remove orphaned reactions. err=%{public}@", v216, 0xCu);
      }
    }
  }

  uint64_t v72 = (ML3ImportSession *)this;
  if (v166) {
    goto LABEL_172;
  }
LABEL_173:
  uint64_t v121 = *((void *)v72 + 8);
  if (v121 && v121 != *((void *)v72 + 2))
  {
    objc_msgSend(*((id *)v72 + 1), "checkInDatabaseConnection:");
    char v122 = (void *)*((void *)v72 + 8);
    *((void *)v72 + _Block_object_dispose(&STACK[0x200], 8) = 0;

    uint64_t v72 = (ML3ImportSession *)this;
  }
  v123 = (void *)*((void *)v72 + 7);
  *((void *)v72 + 7) = 0;

  uint64_t v124 = NSString;
  uint64_t v125 = [this[1] databasePath];
  uint64_t v126 = [v125 stringByStandardizingPath];
  std::string::size_type v127 = [v124 stringWithFormat:@"com.apple.MusicLibrary.importFinished-%@", v126];

  id v128 = v127;
  notify_post((const char *)[v128 UTF8String]);
  std::string::size_type v129 = (ML3ImportSession *)this;
  if (*((_DWORD *)this + 54) && *((_DWORD *)this + 39)
    || *((_DWORD *)this + 48) + *((_DWORD *)this + 47) + *((_DWORD *)this + 49)
    || *((_DWORD *)this + 58)
     + *((_DWORD *)this + 56)
     + *((_DWORD *)this + 41)
     + *((_DWORD *)this + 43)
     + *((_DWORD *)this + 38)
     + *((_DWORD *)this + 40) != -*((_DWORD *)this + 46) - (*((_DWORD *)this + 44) + *((_DWORD *)this + 45)))
  {
    id v130 = this[2];
    v180[0] = MEMORY[0x1E4F143A8];
    v180[1] = 3221225472;
    v180[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_224;
    v180[3] = &unk_1E5FB75F0;
    id v181 = v163;
    [v130 enqueueBlockForTransactionCommit:v180];

    std::string::size_type v129 = (ML3ImportSession *)this;
  }
  if (MSVDeviceOSIsInternalInstall())
  {
    CFPreferencesAppSynchronize(@"com.apple.medialibrary");
    if (CFPreferencesGetAppBooleanValue(@"DuplicateVideosAlert", @"com.apple.medialibrary", 0))
    {
      uint64_t v131 = (void *)*((void *)v129 + 2);
      v177[0] = MEMORY[0x1E4F143A8];
      v177[1] = 3221225472;
      v177[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_2_231;
      v177[3] = &unk_1E5FB7668;
      unint64_t v179 = v129;
      id v178 = v163;
      [v131 enqueueBlockForTransactionCommit:v177];

      std::string::size_type v129 = (ML3ImportSession *)this;
    }
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v133 = v132;
  double v134 = *((double *)v129 + 30);
  int v135 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v216 = 134218240;
    *(void *)&v216[4] = v129;
    *(_WORD *)&v216[12] = 2048;
    *(double *)&v216[14] = v133 - v134;
    _os_log_impl(&dword_1B022D000, v135, OS_LOG_TYPE_DEFAULT, "finished import session %p in %.2f seconds", v216, 0x16u);
  }

  int v136 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
  {
    int v137 = *((_DWORD *)this + 38);
    int v138 = *((_DWORD *)this + 39);
    int v139 = *((_DWORD *)this + 40);
    *(_DWORD *)v216 = 67109632;
    *(_DWORD *)&v216[4] = v137;
    *(_WORD *)&v216[8] = 1024;
    *(_DWORD *)&v216[10] = v138;
    *(_WORD *)&v216[14] = 1024;
    *(_DWORD *)&v216[16] = v139;
    _os_log_impl(&dword_1B022D000, v136, OS_LOG_TYPE_DEFAULT, "    tracks: %d adds %d updates %d deletes", v216, 0x14u);
  }

  char v140 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
  {
    int v141 = *((_DWORD *)this + 41);
    int v142 = *((_DWORD *)this + 42);
    int v143 = *((_DWORD *)this + 43);
    *(_DWORD *)v216 = 67109632;
    *(_DWORD *)&v216[4] = v141;
    *(_WORD *)&v216[8] = 1024;
    *(_DWORD *)&v216[10] = v142;
    *(_WORD *)&v216[14] = 1024;
    *(_DWORD *)&v216[16] = v143;
    _os_log_impl(&dword_1B022D000, v140, OS_LOG_TYPE_DEFAULT, "    containers: %d adds %d updates %d deletes", v216, 0x14u);
  }

  uint64_t v144 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEFAULT))
  {
    int v145 = *((_DWORD *)this + 53);
    int v146 = *((_DWORD *)this + 54);
    int v147 = *((_DWORD *)this + 55);
    *(_DWORD *)v216 = 67109632;
    *(_DWORD *)&v216[4] = v145;
    *(_WORD *)&v216[8] = 1024;
    *(_DWORD *)&v216[10] = v146;
    *(_WORD *)&v216[14] = 1024;
    *(_DWORD *)&v216[16] = v147;
    _os_log_impl(&dword_1B022D000, v144, OS_LOG_TYPE_DEFAULT, "    albums: %d adds %d updates %d deletes", v216, 0x14u);
  }

  uint64_t v148 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
  {
    int v149 = *((_DWORD *)this + 56);
    int v150 = *((_DWORD *)this + 57);
    int v151 = *((_DWORD *)this + 58);
    *(_DWORD *)v216 = 67109632;
    *(_DWORD *)&v216[4] = v149;
    *(_WORD *)&v216[8] = 1024;
    *(_DWORD *)&v216[10] = v150;
    *(_WORD *)&v216[14] = 1024;
    *(_DWORD *)&v216[16] = v151;
    _os_log_impl(&dword_1B022D000, v148, OS_LOG_TYPE_DEFAULT, "    artists: %d adds %d updates %d deletes", v216, 0x14u);
  }

  uint64_t v152 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
  {
    int v153 = *((_DWORD *)this + 50);
    int v154 = *((_DWORD *)this + 51);
    int v155 = *((_DWORD *)this + 52);
    *(_DWORD *)v216 = 67109632;
    *(_DWORD *)&v216[4] = v153;
    *(_WORD *)&v216[8] = 1024;
    *(_DWORD *)&v216[10] = v154;
    *(_WORD *)&v216[14] = 1024;
    *(_DWORD *)&v216[16] = v155;
    _os_log_impl(&dword_1B022D000, v152, OS_LOG_TYPE_DEFAULT, "    persons: %d adds %d updates %d deletes", v216, 0x14u);
  }

  if (*((unsigned char *)this + 1521))
  {
    uint64_t v156 = (void *)MEMORY[0x1E4F77950];
    uint64_t v202 = @"importSource";
    uint64_t v157 = [NSNumber numberWithInt:*((unsigned int *)this + 8)];
    int v203 = v157;
    uint64_t v158 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v203 forKeys:&v202 count:1];
    unint64_t v204 = v158;
    uint64_t v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v204 count:1];
    [v156 snapshotWithDomain:*MEMORY[0x1E4F778D0] type:@"Bug" subType:@"Invalid Import State" context:@"Error importing payload" triggerThresholdValues:0 events:v159 completion:0];
  }
  if (__p)
  {
    uint64_t v191 = __p;
    operator delete(__p);
  }
  if (v162) {
    operator delete(v162);
  }
}

void sub_1B0473674(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *__p,uint64_t a47)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN16ML3ImportSession13_finishImportEv_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  if ((const void *)v3 != v2)
  {
    id v4 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3321888768;
    v6[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_2;
    v6[3] = &__block_descriptor_56_ea8_32c39_ZTSNSt3__16vectorIxNS_9allocatorIxEEEE_e31_v16__0__ML3DatabaseConnection_8l;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    long long __p = 0;
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v2, v3, (v3 - (uint64_t)v2) >> 3);
    [v4 databaseConnectionAllowingWrites:1 withBlock:v6];
    if (__p)
    {
      unint64_t v8 = __p;
      operator delete(__p);
    }
  }
  return [*(id *)(a1 + 32) notifyContentsDidChange];
}

void sub_1B0473A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN16ML3ImportSession13_finishImportEv_block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 numberForColumnIndex:0];
  id v5 = [v3 stringForColumnIndex:1];
  id v6 = [v3 stringForColumnIndex:2];
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "purging orphaned person %{public}@: %{public}@, %{public}@", (uint8_t *)&v8, 0x20u);
  }

  [*(id *)(a1 + 32) addObject:v4];
}

void sub_1B0473BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN16ML3ImportSession13_finishImportEv_block_invoke_217(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 numberForColumnIndex:0];
  id v5 = [v3 numberForColumnIndex:1];
  id v6 = [v3 numberForColumnIndex:2];
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Import");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "purging orphaned reaaction pid %{public}@; container_item_pid=%{public}@, person_pid=%{public}@",
      (uint8_t *)&v8,
      0x20u);
  }

  [*(id *)(a1 + 32) addObject:v4];
}

void sub_1B0473D10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN16ML3ImportSession13_finishImportEv_block_invoke_224(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) notifyEntitiesAddedOrRemoved];
    id v3 = *(void **)(v2 + 32);
    return [v3 notifyAssistantContentsDidChange];
  }
  return result;
}

void ___ZN16ML3ImportSession13_finishImportEv_block_invoke_2_231(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = os_log_create("com.apple.amp.medialibrary", "Import");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "Checking for Duplicate Videos...", buf, 2u);
    }

    *(void *)std::string buf = 0;
    char v17 = buf;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v5 = [MEMORY[0x1E4F28E78] string];
    id v6 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_233;
    v13[3] = &unk_1E5FB7640;
    BOOL v15 = buf;
    id v7 = v5;
    id v14 = v7;
    [v6 databaseConnectionAllowingWrites:0 withBlock:v13];
    int v8 = v17[24];
    uint64_t v9 = os_log_create("com.apple.amp.medialibrary", "Import");
    __int16 v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = *(_DWORD *)(v3 + 32);
        *(_DWORD *)uint64_t v20 = 67109378;
        int v21 = v11;
        __int16 v22 = 2112;
        id v23 = v7;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Duplicate Videos Detected after source %d import!\n%@", v20, 0x12u);
      }

      ML3ShowFileRadarAlert(@"Duplicate Video Detected", @"The media library service has detected that a duplicate video has been imported.", v7);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = *(_DWORD *)(v3 + 32);
        *(_DWORD *)uint64_t v20 = 67109120;
        int v21 = v12;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "No Duplicate Videos found after source %d import.", v20, 8u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
}

void sub_1B0473FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZN16ML3ImportSession13_finishImportEv_block_invoke_233(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 executeQuery:@"SELECT store_item_id, title, media_type FROM item JOIN item_store USING(item_pid) JOIN item_extra USING(item_pid) WHERE store_item_id IN (SELECT store_item_id FROM item JOIN item_store USING(item_pid) GROUP BY store_item_id HAVING COUNT() > 1 AND store_item_id !=0 AND media_type IN (512,2048)) AND is_ota_purchased = 1 AND purchase_history_id = 0"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = ___ZN16ML3ImportSession13_finishImportEv_block_invoke_2_237;
  v6[3] = &unk_1E5FB7618;
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  [v3 enumerateRowsWithBlock:v6];
}

void sub_1B04740B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void ___ZN16ML3ImportSession13_finishImportEv_block_invoke_2_237(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5 && !a3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  id v6 = *(void **)(a1 + 32);
  id v10 = v5;
  long long v7 = [v5 objectAtIndexedSubscript:0];
  int v8 = [v10 objectAtIndexedSubscript:1];
  uint64_t v9 = [v10 objectAtIndexedSubscript:2];
  [v6 appendFormat:@"%@ | %@ | %@\n", v7, v8, v9];
}

void sub_1B0474194(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_40c39_ZTSNSt3__16vectorIxNS_9allocatorIxEEEE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 4_Block_object_dispose(&STACK[0x200], 8) = v2;
    operator delete(v2);
  }
}

void *__copy_helper_block_ea8_40c39_ZTSNSt3__16vectorIxNS_9allocatorIxEEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 4_Block_object_dispose(&STACK[0x200], 8) = 0;
  uint64_t v2 = (void *)(a1 + 40);
  v2[2] = 0;
  return std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(v2, *(const void **)(a2 + 40), *(void *)(a2 + 48), (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3);
}

void ___ZN16ML3ImportSession13_finishImportEv_block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v4 = *(void **)(a1 + 32);
  for (unint64_t i = *(void **)(a1 + 40); v4 != i; ++v4)
    +[ML3Container reloadContainedMediaTypesForContainerWithPersistID:*v4 usingConnection:v5];
}

void sub_1B0474278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __destroy_helper_block_ea8_32c39_ZTSNSt3__16vectorIxNS_9allocatorIxEEEE(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    *(void *)(a1 + 40) = v2;
    operator delete(v2);
  }
}

void *__copy_helper_block_ea8_32c39_ZTSNSt3__16vectorIxNS_9allocatorIxEEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t v2 = (void *)(a1 + 32);
  v2[2] = 0;
  return std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(v2, *(const void **)(a2 + 32), *(void *)(a2 + 40), (uint64_t)(*(void *)(a2 + 40) - *(void *)(a2 + 32)) >> 3);
}

void sub_1B04743E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22393(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22394(uint64_t a1)
{
}

void sub_1B04745AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0474B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0474C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B0474CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B0474D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0474E54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B0474EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0474F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0474FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0475050(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B04750AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047511C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047523C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B04752BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

sqlite3_int64 ML3DatabaseRowInt64ForColumnIndex(uint64_t a1, int a2)
{
  return sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 8), a2);
}

uint64_t ML3DatabaseRowIntForColumnIndex(uint64_t a1, int a2)
{
  return sqlite3_column_int(*(sqlite3_stmt **)(a1 + 8), a2);
}

uint64_t ML3ContainerItemOccurrenceID(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, "stringByAppendingFormat:", @"_%lld", a2);
}

__CFString *ML3ContainerItemOccurrencePrefix(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  id v14 = v13;
  if (a1 && a5 == 8 && a6)
  {
    BOOL v15 = (char *)&v35 + 1;
    uint64_t quot = a1;
    do
    {
      lldiv_t v17 = lldiv(quot, 10);
      uint64_t quot = v17.quot;
      if (v17.rem >= 0) {
        LOBYTE(v1_Block_object_dispose(&STACK[0x200], 8) = v17.rem;
      }
      else {
        uint64_t v18 = -v17.rem;
      }
      *(v15 - 2) = v18 + 48;
      char v19 = (const UInt8 *)(v15 - 2);
      --v15;
    }
    while (v17.quot);
LABEL_18:
    if (a1 < 0)
    {
      *(v15 - 2) = 45;
      char v19 = (const UInt8 *)(v15 - 2);
    }
    id v23 = (char *)((char *)&v35 - (char *)v19);
LABEL_21:
    CFStringRef v24 = CFStringCreateWithBytes(0, v19, (CFIndex)v23, 0x8000100u, 0);
    goto LABEL_22;
  }
  if (a1 && a7 == 3 && (a6 & 1) == 0)
  {
    BOOL v15 = (char *)&v35 + 1;
    uint64_t v20 = a1;
    do
    {
      lldiv_t v21 = lldiv(v20, 10);
      uint64_t v20 = v21.quot;
      if (v21.rem >= 0) {
        LOBYTE(v22) = v21.rem;
      }
      else {
        uint64_t v22 = -v21.rem;
      }
      *(v15 - 2) = v22 + 48;
      char v19 = (const UInt8 *)(v15 - 2);
      --v15;
    }
    while (v21.quot);
    goto LABEL_18;
  }
  if (![v13 length])
  {
    if (a3)
    {
      id v27 = (char *)&v35 + 1;
      uint64_t v28 = a3;
      do
      {
        lldiv_t v29 = lldiv(v28, 10);
        uint64_t v28 = v29.quot;
        if (v29.rem >= 0) {
          LOBYTE(v30) = v29.rem;
        }
        else {
          uint64_t v30 = -v29.rem;
        }
        *(v27 - 2) = v30 + 48;
        char v19 = (const UInt8 *)(v27 - 2);
        --v27;
      }
      while (v29.quot);
      if (a3 < 0)
      {
        *(v27 - 2) = 45;
        char v19 = (const UInt8 *)(v27 - 2);
      }
    }
    else
    {
      unint64_t v31 = (char *)&v35 + 1;
      uint64_t v32 = a4;
      do
      {
        lldiv_t v33 = lldiv(v32, 10);
        uint64_t v32 = v33.quot;
        if (v33.rem >= 0) {
          LOBYTE(v34) = v33.rem;
        }
        else {
          uint64_t v34 = -v33.rem;
        }
        *(v31 - 2) = v34 + 48;
        char v19 = (const UInt8 *)(v31 - 2);
        --v31;
      }
      while (v33.quot);
      if (a4 < 0)
      {
        *(v31 - 2) = 45;
        char v19 = (const UInt8 *)(v31 - 2);
      }
    }
    id v23 = (char *)((char *)&v35 - (char *)v19);
    goto LABEL_21;
  }
  CFStringRef v24 = v14;
LABEL_22:
  uint8x8_t v25 = (__CFString *)v24;

  return v25;
}

id ML3DatabaseImportDataForDAAPFilePaths(void *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v16;
    unint64_t v5 = 0x1E4F28000uLL;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v7 = [*(id *)(v5 + 2816) currentHandler];
          [NSString stringWithUTF8String:"NSData *ML3DatabaseImportDataForDAAPFilePaths(NSArray *__strong)"];
          v9 = unint64_t v8 = v5;
          [v7 handleFailureInFunction:v9 file:@"ML3DatabaseImport.m" lineNumber:270 description:@"DAAP file path must be a string."];

          unint64_t v5 = v8;
        }
        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v3);
  }
  id v14 = 0;
  id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v1 format:200 options:0 error:&v14];
  id v11 = v14;
  if (v11)
  {
    int v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string buf = 138543362;
      id v20 = v11;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "Failed to encode DAAP file paths with error: %{public}@", buf, 0xCu);
    }
  }

  return v10;
}

BOOL ML3ImportDefaultRememberBookmarkTime(__int16 a1)
{
  return (a1 & 0x3B26) != 0;
}

BOOL ML3ImportDefaultExcludeFromShuffle(__int16 a1)
{
  return (a1 & 0x408) == 0;
}

BOOL ML3ContainerItemReactionImportItem::hasValue(ML3ContainerItemReactionImportItem *this, int a2)
{
  return (a2 - 268435458) < 4;
}

uint64_t ML3ContainerItemReactionImportItem::getIntegerValue(ML3ContainerItemReactionImportItem *this, int a2)
{
  switch(a2)
  {
    case 268435459:
      uint64_t v2 = (char *)this + 112;
      return *(void *)v2;
    case 268435461:
      uint64_t v2 = (char *)this + 80;
      return *(void *)v2;
    case 268435460:
      uint64_t v2 = (char *)this + 72;
      return *(void *)v2;
  }
  return 0;
}

std::string *ML3ContainerItemReactionImportItem::getStringValue@<X0>(std::string *this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_1F08C3230;
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  if (a2 == 268435458)
  {
    this = std::string::operator=((std::string *)(a3 + 16), (std::string *)((char *)this + 88));
    *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 1;
  }
  return this;
}

void sub_1B0476DA8(_Unwind_Exception *exception_object)
{
  *(void *)uint64_t v1 = v2;
  if (*(char *)(v1 + 39) < 0) {
    operator delete(*v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3ContainerItemReactionImportItem::isValid(ML3ContainerItemReactionImportItem *this)
{
  return 1;
}

void ML3ContainerItemReactionImportItem::~ML3ContainerItemReactionImportItem(void **this)
{
  ML3ContainerItemReactionImportItem::~ML3ContainerItemReactionImportItem(this);

  JUMPOUT(0x1B3E93610);
}

{
  *this = &unk_1F08C65E0;
  if (*((char *)this + 111) < 0) {
    operator delete(this[11]);
  }
  *this = off_1F08C3148;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)(this + 3));
}

uint64_t ML3ContainerItemReactionImportItem::ML3ContainerItemReactionImportItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, long long *a5, uint64_t a6)
{
  *(_WORD *)(a1 + 16) = 256;
  *(_OWORD *)(a1 + 24) = 0u;
  *(unsigned char *)(a1 + 1_Block_object_dispose(&STACK[0x200], 8) = 1;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 1065353216;
  *(void *)a1 = &unk_1F08C65E0;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  *(void *)(a1 + 64) = a2;
  *(void *)(a1 + 72) = a3;
  *(void *)(a1 + 80) = a4;
  uint64_t v9 = (std::string *)(a1 + 88);
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a5, *((void *)a5 + 1));
  }
  else
  {
    long long v10 = *a5;
    v9->__r_.__value_.__r.__words[2] = *((void *)a5 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(void *)(a1 + 112) = a6;
  *(void *)(a1 + _Block_object_dispose(&STACK[0x200], 8) = a2;
  return a1;
}

void sub_1B0476F30(_Unwind_Exception *a1)
{
  void *v1 = off_1F08C3148;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table(v2);
  _Unwind_Resume(a1);
}

BOOL ML3RestrictionRankInfoIsRestrictedLevel(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  if (v2 <= *a1) {
    return 1;
  }
  uint64_t v3 = a1[2];
  if (v2 < a2)
  {
    BOOL v6 = __OFSUB__(v3, a2);
    BOOL v4 = v3 == a2;
    BOOL v5 = v3 - a2 < 0;
  }
  else
  {
    BOOL v6 = 0;
    BOOL v4 = 1;
    BOOL v5 = 0;
  }
  return !(v5 ^ v6 | v4);
}

uint64_t ML3RestrictionInfoUninitialize()
{
  pthread_mutex_lock(&sRestrictionSettingsLock);
  sRestrictionSettingsInfo = 0;

  return pthread_mutex_unlock(&sRestrictionSettingsLock);
}

id ML3FairPlayHardwareID()
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MGCopyAnswer();
  uint64_t v1 = v0;
  if (!v0)
  {
LABEL_6:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  memset(v10, 0, 24);
  id v2 = v0;
  zxcm2Qme0x([v2 UTF8String], objc_msgSend(v2, "length"), (uint64_t)v10);
  int v4 = v3;
  if (v3)
  {
    BOOL v5 = os_log_create("com.apple.amp.medialibrary", "Library");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      uint64_t v9 = v4;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "ML3FairPlayHardwareID failed. err=%ld", (uint8_t *)&v8, 0xCu);
    }

    goto LABEL_6;
  }
  BOOL v6 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)v10 + 4 length:LODWORD(v10[0])];
LABEL_8:

  return v6;
}

void sub_1B0477A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ML3TrackIntegrityComputeFromTrackData(unsigned int a1, unint64_t a2, void *a3, unint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  CC_SHA1_Init(&c);
  unint64_t data = bswap64(a2);
  CC_SHA1_Update(&c, &data, 8u);
  unint64_t data = bswap64(a1);
  CC_SHA1_Update(&c, &data, 8u);
  id v8 = v7;
  CC_SHA1_Update(&c, (const void *)[v8 UTF8String], objc_msgSend(v8, "length"));
  unint64_t data = bswap64(a4);
  CC_SHA1_Update(&c, &data, 8u);
  CC_SHA1_Final(md, &c);
  unsigned int v16 = 57;
  ML3FairPlayHardwareID();
  id v9 = objc_claimAutoreleasedReturnValue();
  gDmCYFQnze(4, 0, [v9 bytes], objc_msgSend(v9, "length"), (uint64_t)md, 20, (uint64_t)v25, (uint64_t)&v16);
  int v11 = v10;
  if (v10)
  {
    int v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v9 length];
      *(_DWORD *)std::string buf = 134218496;
      uint64_t v20 = v11;
      __int16 v21 = 2048;
      uint64_t v22 = v13;
      __int16 v23 = 1024;
      int v24 = 20;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "FairPlayCandyBarCompute failed with %ld on sugar of %ld length for digest of %d length", buf, 0x1Cu);
    }

    id v14 = 0;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v25 length:v16];
  }

  return v14;
}

void sub_1B0477CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ML3IsCurrentlyRestrictedMedia(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  int v3 = a3;
  unsigned int v5 = sqlite3_value_int(*a3);
  int v6 = sqlite3_value_int(v3[1]);
  int v7 = sqlite3_value_int(v3[2]);
  LODWORD(v3) = sqlite3_value_int(v3[3]);
  ML3RestrictionInfoInitializeIfNecessary();
  if (!v3)
  {
    BOOL v8 = (v5 & 4) != 0 || (v5 & 0x2800) == 0;
    BOOL v9 = v8 && (v5 & 0x200) == 0;
    BOOL v10 = v9 && (v5 & 2) == 0;
    BOOL v11 = !v10 || v6 == 0;
    if (!v11 && v6 != 2) {
      goto LABEL_46;
    }
  }
  if (!byte_1EB551E2B || ((v5 & 2) != 0 ? (BOOL v13 = v6 == 0) : (BOOL v13 = 1), v13))
  {
    if ((v5 & 0x2800) == 0 || (v5 & 4) != 0)
    {
      if ((v5 & 0x200) == 0) {
        goto LABEL_48;
      }
      goto LABEL_43;
    }
  }
  else
  {
    BOOL v14 = v6 != 2;
    if (v6 != 2 || (v5 & 0x2800) == 0 || (v5 & 4) != 0) {
      goto LABEL_41;
    }
  }
  if (qword_1EB551E38 <= qword_1EB551E30) {
    goto LABEL_46;
  }
  BOOL v14 = qword_1EB551E38 < v7 && qword_1EB551E40 > v7;
LABEL_41:
  if (v14 || (v5 & 0x200) == 0)
  {
    if (!v14) {
      goto LABEL_48;
    }
LABEL_46:
    int v17 = 1;
    goto LABEL_49;
  }
LABEL_43:
  if (qword_1EB551E50 <= qword_1EB551E48 || qword_1EB551E50 < v7 && qword_1EB551E58 > v7) {
    goto LABEL_46;
  }
LABEL_48:
  int v17 = (byte_1EB551E2C != 0) & (v5 >> 10);
LABEL_49:

  sqlite3_result_int(a1, v17);
}

void ML3TrackDigestCompute(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  _ML3GetDigestFromSqlite3Values(v4, a2, a3);
  sqlite3_result_blob(a1, v4, 20, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

uint64_t _ML3GetDigestFromSqlite3Values(unsigned __int8 *a1, int a2, sqlite3_value **a3)
{
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  if (a2 >= 1)
  {
    uint64_t v6 = a2;
    do
    {
      int v7 = *a3;
      switch(sqlite3_value_type(*a3))
      {
        case 1:
          unint64_t data = 0;
          unint64_t v8 = bswap64(sqlite3_value_int64(v7));
          goto LABEL_6;
        case 2:
          unint64_t data = 0;
          unint64_t v8 = bswap64(COERCE_UNSIGNED_INT64(sqlite3_value_double(v7)));
LABEL_6:
          unint64_t data = v8;
          p_unint64_t data = &data;
          CC_LONG v10 = 8;
          goto LABEL_11;
        case 3:
          BOOL v11 = (unint64_t *)sqlite3_value_text(v7);
          goto LABEL_9;
        case 4:
          BOOL v11 = (unint64_t *)sqlite3_value_blob(v7);
LABEL_9:
          int v12 = v11;
          CC_LONG v10 = sqlite3_value_bytes(v7);
          p_unint64_t data = v12;
          goto LABEL_11;
        case 5:
          LOBYTE(data) = 0;
          p_unint64_t data = &data;
          CC_LONG v10 = 1;
LABEL_11:
          CC_SHA1_Update(&c, p_data, v10);
          break;
        default:
          break;
      }
      ++a3;
      --v6;
    }
    while (v6);
  }
  return CC_SHA1_Final(a1, &c);
}

void ML3TrackIntegrityCompute(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  _ML3GetDigestFromSqlite3Values(v17, a2, a3);
  int v9 = 57;
  ML3FairPlayHardwareID();
  id v4 = objc_claimAutoreleasedReturnValue();
  gDmCYFQnze(4, 0, [v4 bytes], objc_msgSend(v4, "length"), (uint64_t)v17, 20, (uint64_t)v16, (uint64_t)&v9);
  if (v5)
  {
    int v6 = v5;
    int v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 length];
      *(_DWORD *)std::string buf = 134218496;
      uint64_t v11 = v6;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      __int16 v14 = 1024;
      int v15 = 20;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "FairPlayCandyBarCompute failed with %ld on sugar of %ld length for digest of %d length", buf, 0x1Cu);
    }

    sqlite3_result_null(a1);
  }
  else
  {
    sqlite3_result_blob(a1, v16, v9, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
}

void ML3TrackIntegrityVerify(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2 <= 0)
  {
    sqlite3_result_error(a1, "", 1);
  }
  else
  {
    _ML3GetDigestFromSqlite3Values(v13, a2 - 1, a3 + 1);
    sqlite3_value_blob(*a3);
    sqlite3_value_bytes(*a3);
    int v5 = ML3FairPlayHardwareID();
    if ([v5 length])
    {
      id v6 = v5;
      [v6 bytes];
      [v6 length];
      zLTj();
      int v8 = v7;
      if (v7)
      {
        int v9 = os_log_create("com.apple.amp.medialibrary", "Library");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 134217984;
          uint64_t v12 = v8;
          _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "ML3TrackIntegrityVerify failed. err=%ld", (uint8_t *)&v11, 0xCu);
        }
      }
      BOOL v10 = v8 != -42022;
    }
    else
    {
      BOOL v10 = 1;
    }
    sqlite3_result_int(a1, v10);
  }
}

void ML3CompoundSortKey(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (a2 >= 1)
  {
    uint64_t v7 = a2;
    while (1)
    {
      int v8 = *a3;
      int v9 = sqlite3_value_type(*a3);
      if ((v9 - 1) < 2) {
        break;
      }
      if (v9 == 3)
      {
        BOOL v10 = (unint64_t *)sqlite3_value_text(v8);
LABEL_9:
        uint64_t v14 = v10;
        uint64_t v13 = sqlite3_value_bytes(v8);
        uint64_t v12 = v6;
        int v11 = v14;
LABEL_10:
        [v12 appendBytes:v11 length:v13];
        goto LABEL_11;
      }
      if (v9 == 4)
      {
        BOOL v10 = (unint64_t *)sqlite3_value_blob(v8);
        goto LABEL_9;
      }
LABEL_11:
      ++a3;
      if (!--v7) {
        goto LABEL_12;
      }
    }
    unint64_t v16 = 0;
    unint64_t v16 = bswap64(sqlite3_value_int64(v8));
    int v11 = &v16;
    uint64_t v12 = v6;
    uint64_t v13 = 8;
    goto LABEL_10;
  }
LABEL_12:
  id v15 = v6;
  sqlite3_result_blob(a1, (const void *)[v15 bytes], objc_msgSend(v15, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void ML3SearchStringMatch(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  sqlite3_get_auxdata(a1, 0);
  uint64_t v18 = (ML3MatcherAuxData *)objc_claimAutoreleasedReturnValue();
  int v5 = sqlite3_value_text(*a3);
  id v6 = (const char *)v5;
  if (!v18)
  {
    uint64_t v18 = objc_alloc_init(ML3MatcherAuxData);
    sqlite3_set_auxdata(a1, 0, v18, (void (__cdecl *)(void *))_ML3DestroyCFObjectContext);
    searchUTF8String = v18->_searchUTF8String;
    if (!searchUTF8String) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  searchUTF8String = v18->_searchUTF8String;
  if (!strcmp(searchUTF8String, (const char *)v5)) {
    goto LABEL_11;
  }
  if (searchUTF8String) {
LABEL_4:
  }
    free(searchUTF8String);
LABEL_5:
  v18->_searchUTF8String = strdup(v6);
  int v8 = (void *)[[NSString alloc] initWithUTF8String:v6];
  int v9 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  uint64_t v10 = [v8 rangeOfCharacterFromSet:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F4BE70]);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = v8;
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (*MEMORY[0x1E4F4BEA8] | *MEMORY[0x1E4F4BEA0]) | *MEMORY[0x1E4F4BEB0];
    uint64_t v12 = v8;
  }
  uint64_t v14 = [v11 initWithSearchString:v12 options:v13];
  searchMatcher = v18->_searchMatcher;
  v18->_searchMatcher = (CPSearchMatcher *)v14;

LABEL_11:
  unint64_t v16 = sqlite3_value_text(a3[1]);
  if (v16) {
    int v17 = [(CPSearchMatcher *)v18->_searchMatcher matchesUTF8String:v16];
  }
  else {
    int v17 = 0;
  }
  sqlite3_result_int(a1, v17);
}

void _ML3DestroyCFObjectContext(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void ML3SeasonDisplayName(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v4 = sqlite3_value_int(*a3);
  if ((int)v4 < 1)
  {
    sqlite3_result_null(a1);
  }
  else
  {
    MLLocalizedSeasonDisplayStringForSeasonNumber(v4);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v5 = ML3CopyUTF8StringFromCFString(v6);
    sqlite3_result_text(a1, (const char *)v5, -1, MEMORY[0x1E4F14838]);
  }
}

void ML3SortString(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  int v5 = [NSString stringWithUTF8String:sqlite3_value_text(*a3)];
  uint64_t v7 = [v5 MLSortString];

  if (v7)
  {
    id v6 = ML3CopyUTF8StringFromCFString(v7);
    sqlite3_result_text(a1, (const char *)v6, -1, MEMORY[0x1E4F14838]);
  }
  else
  {
    sqlite3_result_value(a1, *a3);
  }
}

void ML3SortStringWithPrefix(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  int v5 = [NSString stringWithUTF8String:sqlite3_value_text(*a3)];
  uint64_t v7 = [v5 MLSortStringWithPrefix];

  if (v7)
  {
    id v6 = ML3CopyUTF8StringFromCFString(v7);
    sqlite3_result_text(a1, (const char *)v6, -1, MEMORY[0x1E4F14838]);
  }
  else
  {
    sqlite3_result_value(a1, *a3);
  }
}

uint64_t ML3ItemDatabaseImportDataSource::hasValueForKey(uint64_t a1, void *a2, uint64_t a3)
{
  switch((int)a3)
  {
    case 16777218:
    case 16777219:
      if (*(unsigned char *)(*a2 + 17)) {
        return 1;
      }
      int v8 = *(uint64_t (**)(void))(*(void *)*a2 + 56);
      goto LABEL_31;
    case 16777220:
    case 16777225:
    case 16777228:
    case 16777231:
    case 16777234:
      uint64_t v4 = (std::__shared_weak_count *)a2[1];
      uint64_t v12 = *a2;
      uint64_t v13 = v4;
      if (v4) {
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t hasValueForKey = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 80))(a1, &v12) != 0;
      id v6 = v13;
      if (v13) {
        goto LABEL_5;
      }
      return hasValueForKey;
    case 16777221:
    case 16777222:
      uint64_t v7 = *a2;
      if (!*(unsigned char *)(*a2 + 17)) {
        goto LABEL_19;
      }
      return 1;
    case 16777223:
    case 16777224:
      if (*(unsigned char *)(*a2 + 17)) {
        return 1;
      }
      int v8 = *(uint64_t (**)(void))(*(void *)*a2 + 56);
      goto LABEL_31;
    case 16777226:
    case 16777227:
      if (*(unsigned char *)(*a2 + 17)) {
        return 1;
      }
      int v8 = *(uint64_t (**)(void))(*(void *)*a2 + 56);
      goto LABEL_31;
    case 16777229:
    case 16777230:
      if (*(unsigned char *)(*a2 + 17)
        || ((*(uint64_t (**)(void, uint64_t))(*(void *)*a2 + 56))(*a2, 167772163) & 1) != 0)
      {
        return 1;
      }
      uint64_t v7 = *a2;
LABEL_19:
      int v8 = *(uint64_t (**)(void))(*(void *)v7 + 56);
      goto LABEL_31;
    case 16777232:
    case 16777233:
      if (*(unsigned char *)(*a2 + 17)) {
        return 1;
      }
      int v8 = *(uint64_t (**)(void))(*(void *)*a2 + 56);
      goto LABEL_31;
    case 16777235:
    case 16777236:
      if (*(unsigned char *)(*a2 + 17)) {
        return 1;
      }
      int v8 = *(uint64_t (**)(void))(*(void *)*a2 + 56);
      goto LABEL_31;
    case 16777239:
      if (((*(uint64_t (**)(void, uint64_t))(*(void *)*a2 + 56))(*a2, 16777239) & 1) != 0
        || ((*(uint64_t (**)(void, uint64_t))(*(void *)*a2 + 56))(*a2, 16777238) & 1) != 0)
      {
        return 1;
      }
      else
      {
        int v8 = *(uint64_t (**)(void))(*(void *)*a2 + 56);
LABEL_31:
        return v8();
      }
    default:
      uint64_t v10 = (std::__shared_weak_count *)a2[1];
      v11[0] = *a2;
      v11[1] = v10;
      if (v10) {
        atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t hasValueForKey = ML3DatabaseImportDataSource::hasValueForKey(a1, v11, a3);
      if (v10)
      {
        id v6 = v10;
LABEL_5:
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
      return hasValueForKey;
  }
}

void sub_1B0478F98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3ItemDatabaseImportDataSource::integerValueForKey(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  switch((int)a3)
  {
    case 16777217:
      uint64_t v4 = (*(uint64_t (**)(void, uint64_t))(*(void *)*a2 + 32))(*a2, 16777217);
      return MLMediaTypeByStandardizingMediaType(v4);
    case 16777218:
      return *(void *)(a1 + 152);
    case 16777219:
      if (!*(void *)(a1 + 152)) {
        return *(unsigned __int8 *)(a1 + 168);
      }
      return *(void *)(a1 + 160);
    case 16777220:
      uint64_t v5 = *(void *)(a1 + 72);
      return *(void *)v5;
    case 16777221:
      uint64_t v6 = *(void *)(a1 + 72);
      return *(void *)(v6 + 112);
    case 16777222:
      uint64_t v7 = *(void *)(a1 + 72);
      goto LABEL_18;
    case 16777223:
      return *(void *)(*(void *)(a1 + 72) + 128);
    case 16777224:
      uint64_t v8 = *(void *)(a1 + 72);
      if (!*(void *)(v8 + 128)) {
        return *(unsigned __int8 *)(a1 + 168);
      }
      return *(void *)(v8 + 136);
    case 16777225:
      uint64_t v5 = *(void *)(a1 + 104);
      return *(void *)v5;
    case 16777226:
      return *(void *)(*(void *)(a1 + 104) + 72);
    case 16777227:
      uint64_t v9 = *(void *)(a1 + 104);
      if (!*(void *)(v9 + 72)) {
        return *(unsigned __int8 *)(a1 + 168);
      }
      return *(void *)(v9 + 80);
    case 16777228:
      uint64_t v5 = *(void *)(a1 + 88);
      return *(void *)v5;
    case 16777229:
      uint64_t v6 = *(void *)(a1 + 88);
      return *(void *)(v6 + 112);
    case 16777230:
      uint64_t v7 = *(void *)(a1 + 88);
LABEL_18:
      if (!*(void *)(v7 + 112)) {
        return *(unsigned __int8 *)(a1 + 168);
      }
      return *(void *)(v7 + 120);
    case 16777231:
      uint64_t v5 = *(void *)(a1 + 120);
      return *(void *)v5;
    case 16777232:
      return *(void *)(*(void *)(a1 + 120) + 56);
    case 16777233:
      uint64_t v10 = *(void *)(a1 + 120);
      if (!*(void *)(v10 + 56)) {
        return *(unsigned __int8 *)(a1 + 168);
      }
      return *(void *)(v10 + 64);
    case 16777234:
      uint64_t v5 = *(void *)(a1 + 136);
      return *(void *)v5;
    case 16777235:
      return *(void *)(*(void *)(a1 + 136) + 32);
    case 16777236:
      uint64_t v11 = *(void *)(a1 + 136);
      if (*(void *)(v11 + 32)) {
        return *(void *)(v11 + 40);
      }
      else {
        return *(unsigned __int8 *)(a1 + 168);
      }
    case 16777239:
      uint64_t v13 = *a2;
      uint64_t v12 = (std::__shared_weak_count *)a2[1];
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v13 + 32))(v13, 16777239);
      if (v3) {
        goto LABEL_42;
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v13 + 32))(v13, 16777238);
      if (v3) {
        goto LABEL_42;
      }
      uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v13 + 32))(v13, 117440517);
LABEL_41:
      uint64_t v3 = v14;
LABEL_42:
      if (v12) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v12);
      }
      return v3;
    case 16777240:
    case 16777241:
      return v3;
    default:
      uint64_t v16 = *a2;
      uint64_t v12 = (std::__shared_weak_count *)a2[1];
      if (v12) {
        atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v16 + 32))(v16, a3);
      goto LABEL_41;
  }
}

void sub_1B04792B0(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void ML3ItemDatabaseImportDataSource::prepareColumns(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  v10[0] = *(void *)(*(void *)a2 + 8);
  uint64_t v5 = std::__hash_table<std::__hash_value_type<long long,ML3CollectionInfoSet>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,ML3CollectionInfoSet>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,ML3CollectionInfoSet>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,ML3CollectionInfoSet>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v4 + 336, v10[0], v10);
  ML3CollectionInfoSet::operator=((void *)(a1 + 72), v5 + 3);
  (*(void (**)(unint64_t *__return_ptr))(**(void **)a2 + 144))(v10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v12, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v12 = __p;
  }
  uint64_t v6 = ML3CPPBridgeString((const UInt8 *)&v12, 1);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  v10[0] = (unint64_t)&unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v7 = *(id *)(*(void *)(a1 + 24) + 24);
  uint64_t v8 = [v7 objectForKey:v6];
  *(void *)(a1 + 152) = [v8 ML3NameOrderValue];
  *(void *)(a1 + 160) = v9;

  *(unsigned char *)(a1 + 16_Block_object_dispose(&STACK[0x200], 8) = *(unsigned char *)(*(void *)(a1 + 24) + 252);
}

void sub_1B0479488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3ItemDatabaseImportDataSource::getDatabaseTableSchemaClass(ML3ItemDatabaseImportDataSource *this)
{
  return objc_opt_class();
}

uint64_t ML3ItemDatabaseImportDataSource::getImportPropertyGroupKey(ML3ItemDatabaseImportDataSource *this)
{
  return 1;
}

void ML3ItemDatabaseImportDataSource::~ML3ItemDatabaseImportDataSource(ML3ItemDatabaseImportDataSource *this)
{
  *(void *)this = &unk_1F08C5B60;
  id v2 = (std::__shared_weak_count *)*((void *)this + 18);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource((id *)this);

  JUMPOUT(0x1B3E93610);
}

{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  uint64_t vars8;

  *(void *)this = &unk_1F08C5B60;
  id v2 = (std::__shared_weak_count *)*((void *)this + 18);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }

  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource((id *)this);
}

BOOL ML3HomeSharingContainerImportItem::hasValue(ML3HomeSharingContainerImportItem *this, uint64_t a2)
{
  BOOL result = 1;
  if ((int)a2 > 184549399)
  {
    switch(a2)
    {
      case 0xB000018:
        uint64_t v4 = *((void *)this + 8) + 96;
        unsigned int v5 = 1634030407;
        return std::__tree<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>>>::__count_multi<unsigned int>(v4, v5) != 0;
      case 0xB00001F:
        uint64_t v4 = *((void *)this + 8) + 96;
        unsigned int v5 = 1634030416;
        return std::__tree<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>>>::__count_multi<unsigned int>(v4, v5) != 0;
      case 0xB000025:
        return result;
    }
  }
  else
  {
    switch(a2)
    {
      case 0xB000001:
        uint64_t v4 = *((void *)this + 8) + 96;
        unsigned int v5 = 1835624804;
        return std::__tree<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>>>::__count_multi<unsigned int>(v4, v5) != 0;
      case 0xB000013:
        return result;
      case 0xB000015:
        uint64_t v4 = *((void *)this + 8) + 96;
        unsigned int v5 = 1720542056;
        return std::__tree<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>>>::__count_multi<unsigned int>(v4, v5) != 0;
    }
  }

  return ML3DAAPContainerImportItem::hasValue((ML3DAAPImportItem *)this, a2);
}

void ML3HomeSharingContainerImportItem::getDataValue(ML3HomeSharingContainerImportItem *this@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = this;
  uint64_t v4 = a3;
  if (a2 == 184549407)
  {
    if (std::__tree<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::shared_ptr<ML3CPP::Element>>>>::__count_multi<unsigned int>(*((void *)this + 8) + 96, 0x61655350u))
    {
      operator new();
    }
    a3 = v4;
    this = v3;
    a2 = 184549407;
  }

  ML3DAAPContainerImportItem::getDataValue((ML3DAAPImportItem *)this, a2, a3);
}

void sub_1B0479844(_Unwind_Exception *a1)
{
  MEMORY[0x1B3E93610](v1, 0x1091C40934DB768);
  _Unwind_Resume(a1);
}

uint64_t ML3HomeSharingContainerImportItem::getIntegerValue(ML3HomeSharingContainerImportItem *this, uint64_t a2)
{
  if ((int)a2 <= 184549396)
  {
    if (a2 != 184549377)
    {
      if (a2 == 184549395)
      {
        if ((*(uint64_t (**)(ML3HomeSharingContainerImportItem *, uint64_t))(*(void *)this + 32))(this, 184549377) == *((void *)this + 36))return 1; {
        ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v9, *((void *)this + 8), 0x61655053u);
        }
        if (v9) {
          unint64_t v2 = ML3CPP::Element::integerValue(v9) - 10 < 0xFFFFFFFE;
        }
        else {
          unint64_t v2 = 0;
        }
        if (v10) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v10);
        }
        return v2;
      }
      goto LABEL_19;
    }
    uint64_t v5 = *((void *)this + 8);
    unsigned int v6 = 1835624804;
    goto LABEL_13;
  }
  switch(a2)
  {
    case 0xB000015:
      uint64_t v5 = *((void *)this + 8);
      unsigned int v6 = 1720542056;
      goto LABEL_13;
    case 0xB000018:
      uint64_t v5 = *((void *)this + 8);
      unsigned int v6 = 1634030407;
LABEL_13:
      ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v9, v5, v6);
      id v7 = v9;
      if (v9) {
        unint64_t v2 = ML3CPP::Element::integerValue(v9);
      }
      if (v10) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
      if (v7) {
        return v2;
      }
      break;
    case 0xB000025:
      return 3;
  }
LABEL_19:

  return ML3DAAPContainerImportItem::getIntegerValue((ML3DAAPImportItem *)this, a2);
}

uint64_t ML3HomeSharingContainerImportItem::isValid(ML3HomeSharingContainerImportItem *this)
{
  return 1;
}

void ML3HomeSharingContainerImportItem::~ML3HomeSharingContainerImportItem(ML3HomeSharingContainerImportItem *this)
{
  ML3DAAPContainerImportItem::~ML3DAAPContainerImportItem(this);

  JUMPOUT(0x1B3E93610);
}

id ML3HomeSharingTrackImportItem::getDeduplicationPredicates(ML3HomeSharingTrackImportItem *this)
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  uint64_t v3 = (*(uint64_t (**)(ML3HomeSharingTrackImportItem *, uint64_t))(*(void *)this + 32))(this, 100663309);
  if (v3)
  {
    uint64_t v4 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.home_sharing_id" equalToInt64:v3];
    [v2 addObject:v4];
  }

  return v2;
}

void sub_1B0479B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ML3HomeSharingTrackImportItem::getDescription(ML3HomeSharingTrackImportItem *this)
{
  (*(void (**)(ML3HomeSharingTrackImportItem *, uint64_t))(*(void *)this + 32))(this, 100663309);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"<ML3HomeSharingTrackImportItem ", 31);
  *(_DWORD *)((char *)&v5[1] + *(void *)(v5[0] - 24)) = *(_DWORD *)((unsigned char *)&v5[1] + *(void *)(v5[0] - 24)) & 0xFFFFFFB5 | 8;
  uint64_t v1 = (void *)std::ostream::operator<<();
  unint64_t v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)" homeSharingId=", 15);
  *(_DWORD *)((char *)v2 + *(void *)(*v2 - 24) + _Block_object_dispose(&STACK[0x200], 8) = *(_DWORD *)((unsigned char *)v2 + *(void *)(*v2 - 24) + 8) & 0xFFFFFFB5 | 2;
  uint64_t v3 = (void *)std::ostream::operator<<();
  char v8 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v8, 1);
  std::stringbuf::str();
  v5[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v5 + *(void *)(v5[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v5[1] = MEMORY[0x1E4FBA470] + 16;
  if (v6 < 0) {
    operator delete((void *)v5[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1B3E935B0](&v7);
}

void sub_1B0479D44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ML3HomeSharingTrackImportItem::getStringValue(ML3HomeSharingTrackImportItem *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_1F08C3230;
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v4 = (std::string *)(a3 + 16);
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  if ((int)a2 > 100663305)
  {
    if (a2 == 100663306)
    {
LABEL_14:
      std::string::basic_string[abi:ne180100]<0>(&__str, "");
      std::string::operator=(v4, &__str);
      *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 1;
      if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        return;
      }
      uint64_t v5 = (void *)__str.__r_.__value_.__r.__words[0];
      goto LABEL_16;
    }
    if (a2 != 167772173)
    {
LABEL_12:
      ML3DAAPImportItem::getStringValue((ML3DAAPImportItem *)this, a2, (uint64_t)&__str);
      *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = __str.__r_.__value_.__s.__data_[8];
      std::string::operator=(v4, (const std::string *)&__str.__r_.__value_.__r.__words[2]);
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1F08C3230;
      if ((v7 & 0x80000000) == 0) {
        return;
      }
      uint64_t v5 = (void *)__str.__r_.__value_.__r.__words[2];
LABEL_16:
      operator delete(v5);
      return;
    }
  }
  else if (a2 != 33554439)
  {
    if (a2 == 100663304) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v8, *((void *)this + 8), 0x6173666Du);
  if (v8)
  {
    std::string::basic_string[abi:ne180100](&__str, *(void **)(v8 + 48), *(void *)(v8 + 64));
    std::string::operator=(v4, &__str);
    *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 1;
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void sub_1B0479F0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  *(void *)uint64_t v22 = v23;
  if (*(char *)(v22 + 39) < 0) {
    operator delete(*v24);
  }
  _Unwind_Resume(exception_object);
}

BOOL ML3HomeSharingTrackImportItem::isValid(ML3HomeSharingTrackImportItem *this)
{
  return (*(unsigned int (**)(ML3HomeSharingTrackImportItem *, uint64_t))(*(void *)this + 32))(this, 16777217) != 0;
}

void ML3HomeSharingTrackImportItem::~ML3HomeSharingTrackImportItem(ML3DAAPImportItem *this)
{
  ML3DAAPImportItem::~ML3DAAPImportItem(this);

  JUMPOUT(0x1B3E93610);
}

id ML3MemorySQLiteDatabasePathWithName(void *a1)
{
  id v1 = a1;
  if (![v1 length])
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    char v6 = [NSString stringWithUTF8String:"NSString *ML3MemorySQLiteDatabasePathWithName(NSString *__strong)"];
    [v5 handleFailureInFunction:v6 file:@"ML3SqliteUtilities.m" lineNumber:19 description:@"invalid parameter"];
  }
  unint64_t v2 = [v1 stringByReplacingOccurrencesOfString:@":" withString:@"_"];

  uint64_t v3 = [NSString stringWithFormat:@"file:%@?mode=memory&cache=shared", v2];

  return v3;
}

BOOL ML3TruncateDatabase(void *a1, int a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  ppDb = 0;
  id v3 = a1;
  if (sqlite3_open_v2((const char *)[v3 fileSystemRepresentation], &ppDb, 16777218, 0))
  {
    uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "** COULD NOT DELETE DATABASE! **", buf, 2u);
    }

    uint64_t v5 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)std::string buf = 0;
      _os_log_impl(&dword_1B022D000, v5, OS_LOG_TYPE_DEFAULT, "MusicLibrary couldn't create a SQLite handle to truncate.", buf, 2u);
    }

    BOOL v6 = 0;
  }
  else
  {
    if (a2) {
      int v7 = 129;
    }
    else {
      int v7 = 128;
    }
    int v13 = v7;
    int v8 = sqlite3_file_control(ppDb, 0, 101, &v13);
    BOOL v6 = v8 == 0;
    if (v8)
    {
      int v9 = v8;
      uint64_t v10 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = sqlite3_errmsg(ppDb);
        *(_DWORD *)std::string buf = 138543874;
        id v16 = v3;
        __int16 v17 = 2082;
        uint64_t v18 = v11;
        __int16 v19 = 1024;
        int v20 = v9;
        _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "Could not truncate database at path: %{public}@. %{public}s (%d)", buf, 0x1Cu);
      }
    }
    sqlite3_close(ppDb);
  }

  return v6;
}

BOOL ML3CopyDatabase(void *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  uint64_t v21 = 0;
  ppDb = 0;
  id v7 = v5;
  uint64_t v8 = sqlite3_open_v2((const char *)[v7 fileSystemRepresentation], &ppDb, 16777217, 0);
  if (v8)
  {
    int v9 = v8;
    objc_msgSend(NSString, "stringWithFormat:", @"Could not open original database. %s (%d)", sqlite3_errmsg(ppDb), v8);
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = sqlite3_open_v2((const char *)[v6 fileSystemRepresentation], &v21, 16777222, 0);
  if (v12)
  {
    int v9 = v12;
    objc_msgSend(NSString, "stringWithFormat:", @"Could not open database copy. %s (%d)", sqlite3_errmsg(v21), v12);
LABEL_7:
    uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = 0;
    goto LABEL_8;
  }
  uint64_t v13 = sqlite3_file_control(v21, 0, 102, ppDb);
  if (v13)
  {
    int v9 = v13;
    objc_msgSend(NSString, "stringWithFormat:", @"Could not perform copy: %s (%d)", sqlite3_errmsg(v21), v13);
    goto LABEL_7;
  }
  int v20 = sqlite3_exec(v21, "PRAGMA wal_checkpoint(RESTART);", 0, 0, 0);
  if (v20) {
    int v9 = v20;
  }
  else {
    int v9 = 0;
  }
  if (v20) {
    uint64_t v10 = @"Warning: could not checkpoint copied SQLite file.";
  }
  else {
    uint64_t v10 = 0;
  }
  BOOL v11 = v20 == 0;
LABEL_8:
  if (ppDb) {
    sqlite3_close(ppDb);
  }
  if (v21) {
    sqlite3_close(v21);
  }
  if (v10)
  {
    uint64_t v14 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 138543618;
      id v26 = v7;
      __int16 v27 = 2114;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_DEFAULT, "Could not copy database file at path %{public}@. %{public}@", buf, 0x16u);
    }

    if (a3)
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      int v24 = v10;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      __int16 v17 = [v15 errorWithDomain:@"ML3DatabaseErrorDomain" code:v9 userInfo:v16];

      id v18 = v17;
      *a3 = v18;
    }
  }

  return v11;
}

BOOL ML3SQLiteResultIsCorruption(int a1)
{
  return a1 == 11 || a1 == 267 || a1 == 26;
}

id ML3NonQualifiedColumnNameFromProperty(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 rangeOfString:@"."];
  id v3 = v1;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [v1 substringFromIndex:v2 + 1];
  }

  return v3;
}

uint64_t ML3ContainerSeedDatabaseImportDataSource::hasValueForKey(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 == 201326593)
  {
    id v3 = (std::__shared_weak_count *)a2[1];
    v8[0] = *a2;
    v8[1] = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t hasValueForKey = ML3DatabaseImportDataSource::hasValueForKey(a1, v8, 201326593);
  }
  else
  {
    id v3 = (std::__shared_weak_count *)a2[1];
    v7[0] = *a2;
    v7[1] = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t hasValueForKey = ML3DatabaseImportDataSource::hasValueForKey(a1, v7, a3);
  }
  uint64_t v5 = hasValueForKey;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  return v5;
}

void sub_1B047ADCC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

unint64_t ML3ContainerSeedDatabaseImportDataSource::integerValueForKey(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a2;
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  if (a3 == 201326593)
  {
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 32))(v4, 201326593);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
    if (v6)
    {
      std::unordered_map<unsigned long long,long long>::unordered_map((uint64_t)v10, *(void *)(*(void *)(a1 + 24) + 616) + 40 * *(int *)(*(void *)(a1 + 24) + 32));
      id v7 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>(v10, v6);
      if (v7)
      {
        unint64_t v6 = v7[3];
      }
      else
      {
        uint64_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)std::string buf = 134217984;
          unint64_t v12 = v6;
          _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "failed to map container_seed item_pid %lld", buf, 0xCu);
        }
      }
      std::__hash_table<unsigned long long,echo_hash_shift<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)v10);
    }
  }
  else
  {
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 32))(v4, a3);
    if (v5) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
  return v6;
}

void sub_1B047AF90(_Unwind_Exception *exception_object)
{
}

uint64_t ML3ContainerSeedDatabaseImportDataSource::getDatabaseTableSchemaClass(ML3ContainerSeedDatabaseImportDataSource *this)
{
  return objc_opt_class();
}

uint64_t ML3ContainerSeedDatabaseImportDataSource::getImportPropertyGroupKey(ML3ContainerSeedDatabaseImportDataSource *this)
{
  return 12;
}

void ML3ContainerSeedDatabaseImportDataSource::~ML3ContainerSeedDatabaseImportDataSource(id *this)
{
  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource(this);

  JUMPOUT(0x1B3E93610);
}

void sub_1B047B564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1B047BA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047BBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047C000(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL23TranslateDictionaryKeysP12NSDictionaryS0_P19NSMutableDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (v5) {
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

void sub_1B047C0F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B047C2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047C5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047C7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }

  _Unwind_Resume(a1);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ITunesSyncContainerImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B047C8B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncContainerImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncContainerImportItem>,std::allocator<ML3ITunesSyncContainerImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_32ML3ITunesSyncContainerImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncContainerImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncContainerImportItem>,std::allocator<ML3ITunesSyncContainerImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3ITunesSyncContainerImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncContainerImportItem>,std::allocator<ML3ITunesSyncContainerImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void sub_1B047CB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  id v16 = v15;

  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }

  _Unwind_Resume(a1);
}

void sub_1B047D0B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22)
{
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }

  _Unwind_Resume(a1);
}

void sub_1B047D2C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B047D65C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047D8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  if (a14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a14);
  }

  _Unwind_Resume(a1);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ITunesSyncTrackImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B047D9B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncTrackImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncTrackImportItem>,std::allocator<ML3ITunesSyncTrackImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_28ML3ITunesSyncTrackImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncTrackImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncTrackImportItem>,std::allocator<ML3ITunesSyncTrackImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3ITunesSyncTrackImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncTrackImportItem>,std::allocator<ML3ITunesSyncTrackImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void sub_1B047E118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,uint64_t a25,std::__shared_weak_count *a26)
{
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  unint64_t v31 = *(std::__shared_weak_count **)(v29 - 120);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  uint64_t v32 = *(std::__shared_weak_count **)(v29 - 104);
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  if (a24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a24);
  }
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }

  _Unwind_Resume(a1);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ITunesSyncArtistImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B047E370(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3ITunesSyncAlbumImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B047E410(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncAlbumImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncAlbumImportItem>,std::allocator<ML3ITunesSyncAlbumImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_28ML3ITunesSyncAlbumImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncAlbumImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncAlbumImportItem>,std::allocator<ML3ITunesSyncAlbumImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3ITunesSyncAlbumImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncAlbumImportItem>,std::allocator<ML3ITunesSyncAlbumImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncArtistImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncArtistImportItem>,std::allocator<ML3ITunesSyncArtistImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_29ML3ITunesSyncArtistImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3ITunesSyncArtistImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncArtistImportItem>,std::allocator<ML3ITunesSyncArtistImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3ITunesSyncArtistImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3ITunesSyncArtistImportItem>,std::allocator<ML3ITunesSyncArtistImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void sub_1B047EB2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,uint64_t a25,std::__shared_weak_count *a26)
{
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  if (v27) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v27);
  }
  unint64_t v31 = *(std::__shared_weak_count **)(v29 - 120);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  uint64_t v32 = *(std::__shared_weak_count **)(v29 - 104);
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  if (a24) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a24);
  }
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }

  _Unwind_Resume(a1);
}

void sub_1B047EF90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047F1A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B047F430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1B047FEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  ML3ImportSession::~ML3ImportSession((ML3ImportSession *)&STACK[0x3A0]);
  _Unwind_Resume(a1);
}

void sub_1B04800A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1B048051C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1B0480808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0480AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0480C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ML3SubscriptionContainerImportItem::_createImportItemValue(unsigned int a1@<W1>, void *a2@<X2>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  if (a1 == 218103812) {
    operator new();
  }
  uint64_t v3 = a2[1];
  v4[0] = *a2;
  v4[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  ML3DAAPContainerImportItem::_createImportItemValue(a1, (uint64_t)v4, &v5);
}

void sub_1B0480E9C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<ML3ImportItem>::shared_ptr[abi:ne180100]<ML3SubscriptionImportItem,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1B0480F28(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_25ML3SubscriptionImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void ML3SubscriptionImportItem::_createImportItemValue(unsigned int a1@<W1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  if (a1 == 218103812) {
    operator new();
  }
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  ML3DAAPImportItem::_createImportItemValue(a1, &v4);
}

void sub_1B04810FC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

id ML3SubscriptionImportItem::getDeduplicationPredicates(ML3SubscriptionImportItem *this)
{
  v30[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  uint64_t v3 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663305);
  if (v3)
  {
    long long v4 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_saga_id" equalToInt64:v3];
    [v2 addObject:v4];
  }
  uint64_t v5 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663297);
  if (v5)
  {
    id v6 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_item_id" equalToInt64:v5];
    if (v3)
    {
      v30[0] = v6;
      id v7 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_saga_id" equalToInt64:0];
      v30[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
      int v9 = +[ML3CompoundPredicate predicateMatchingPredicates:v8];
      [v2 addObject:v9];

      uint64_t v10 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.subscription_store_item_id" equalToInt64:v5];
      v29[0] = v10;
      BOOL v11 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_item_id" equalToInt64:0];
      v29[1] = v11;
      unint64_t v12 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_saga_id" equalToInt64:0];
      void v29[2] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:3];
      uint64_t v14 = +[ML3CompoundPredicate predicateMatchingPredicates:v13];
      [v2 addObject:v14];
    }
    else
    {
      [v2 addObject:v6];

      uint64_t v10 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.subscription_store_item_id" equalToInt64:v5];
      v28[0] = v10;
      BOOL v11 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_item_id" equalToInt64:0];
      v28[1] = v11;
      unint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
      uint64_t v13 = +[ML3CompoundPredicate predicateMatchingPredicates:v12];
      [v2 addObject:v13];
    }
  }
  uint64_t v15 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663337);
  if (v15)
  {
    if (v3)
    {
      id v16 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.subscription_store_item_id" equalToInt64:v15];
      v27[0] = v16;
      __int16 v17 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_saga_id" equalToInt64:0];
      v27[1] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      __int16 v19 = +[ML3CompoundPredicate predicateMatchingPredicates:v18];
      [v2 addObject:v19];

      if (v5) {
        goto LABEL_15;
      }
      int v20 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_item_id" equalToInt64:v15];
      uint64_t v21 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_saga_id", 0, v20 equalToInt64];
      v26[1] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      uint64_t v23 = +[ML3CompoundPredicate predicateMatchingPredicates:v22];
      [v2 addObject:v23];
    }
    else
    {
      int v24 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.subscription_store_item_id" equalToInt64:v15];
      [v2 addObject:v24];

      if (v5) {
        goto LABEL_15;
      }
      int v20 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.store_item_id" equalToInt64:v15];
      [v2 addObject:v20];
    }
  }
LABEL_15:

  return v2;
}

void sub_1B048162C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ML3SubscriptionImportItem::getSourceIdentifiers@<X0>(ML3SubscriptionImportItem *this@<X0>, BOOL *a2@<X1>, void *a3@<X8>)
{
  std::vector<long long>::vector(a3);
  *a2 = 0;
  uint64_t v6 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663305);
  if (v6) {
    *(void *)(*a3 + 16) = v6;
  }
  uint64_t v7 = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663297);
  if (v7) {
    *(void *)(*a3 + 40) = v7;
  }
  uint64_t result = (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663337);
  if (result) {
    *(void *)(*a3 + 4_Block_object_dispose(&STACK[0x200], 8) = result;
  }
  return result;
}

void sub_1B0481860(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + _Block_object_dispose(&STACK[0x200], 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3SubscriptionImportItem::getDescription(ML3SubscriptionImportItem *this)
{
  (*(void (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663305);
  (*(void (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663297);
  (*(void (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 100663337);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)"<ML3SubscriptionImportItem ", 27);
  *(_DWORD *)((char *)&v8[1] + *(void *)(v8[0] - 24)) = *(_DWORD *)((unsigned char *)&v8[1] + *(void *)(v8[0] - 24)) & 0xFFFFFFB5 | 8;
  uint64_t v2 = (void *)std::ostream::operator<<();
  uint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" sagaId=", 8);
  *(_DWORD *)((char *)v3 + *(void *)(*v3 - 24) + _Block_object_dispose(&STACK[0x200], 8) = *(_DWORD *)((unsigned char *)v3 + *(void *)(*v3 - 24) + 8) & 0xFFFFFFB5 | 2;
  long long v4 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)", storeId=", 10);
  uint64_t v5 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)", subscriptionId=", 17);
  uint64_t v6 = (void *)std::ostream::operator<<();
  char v11 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)&v11, 1);
  std::stringbuf::str();
  v8[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v8 + *(void *)(v8[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v8[1] = MEMORY[0x1E4FBA470] + 16;
  if (v9 < 0) {
    operator delete((void *)v8[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1B3E935B0](&v10);
}

void sub_1B0481B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unint64_t ML3SubscriptionImportItem::getIntegerValue(ML3SubscriptionImportItem *this, uint64_t a2)
{
  if (a2 == 100663345) {
    return 1;
  }
  if (a2 == 234881030) {
    return (*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 234881032);
  }
  return ML3DAAPTrackImportItem::getIntegerValue(this, a2);
}

void ML3SubscriptionImportItem::getStringValue(ML3DAAPImportItem *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_1F08C3230;
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v5 = (std::string *)(a3 + 16);
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  if (a2 != 167772183)
  {
    ML3DAAPImportItem::getStringValue(this, a2, (uint64_t)&__dst);
    *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = BYTE8(__dst);
    std::string::operator=(v5, &v8);
    *(void *)&long long __dst = &unk_1F08C3230;
    if ((SHIBYTE(v8.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
    uint64_t v6 = (void *)v8.__r_.__value_.__r.__words[0];
    goto LABEL_14;
  }
  memset(&__str, 0, sizeof(__str));
  ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v12, *((void *)this + 8), 0x61654361u);
  if (v12)
  {
    std::string::basic_string[abi:ne180100](&__dst, *(void **)(v12 + 48), *(void *)(v12 + 64));
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
    __str.__r_.__value_.__r.__words[2] = v8.__r_.__value_.__r.__words[0];
  }
  else
  {
    ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v10, *((void *)this + 8), 0x61654354u);
    if (v10)
    {
      std::string::basic_string[abi:ne180100](&__dst, *(void **)(v10 + 48), *(void *)(v10 + 64));
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
      __str.__r_.__value_.__r.__words[2] = v8.__r_.__value_.__r.__words[0];
    }
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::string::operator=(v5, &__str);
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 1;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v6 = (void *)__str.__r_.__value_.__r.__words[0];
LABEL_14:
    operator delete(v6);
  }
}

void sub_1B0481D2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }
  unint64_t v31 = *(std::__shared_weak_count **)(v29 - 56);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  *(void *)uint64_t v26 = v27;
  if (*(char *)(v26 + 39) < 0) {
    operator delete(*v28);
  }
  _Unwind_Resume(exception_object);
}

BOOL ML3SubscriptionImportItem::isValid(ML3SubscriptionImportItem *this)
{
  return ((*(uint64_t (**)(ML3SubscriptionImportItem *, uint64_t))(*(void *)this + 32))(this, 16777217) & 0x408) != 0;
}

void ML3SubscriptionImportItem::~ML3SubscriptionImportItem(ML3DAAPImportItem *this)
{
  ML3DAAPImportItem::~ML3DAAPImportItem(this);

  JUMPOUT(0x1B3E93610);
}

id ML3SubscriptionContainerImportItem::getDeduplicationPredicates(ML3SubscriptionContainerImportItem *this)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v3 = ML3DAAPContainerImportItem::getDeduplicationPredicates(this);
  long long v4 = [v2 arrayWithArray:v3];

  uint64_t v5 = (*(uint64_t (**)(ML3SubscriptionContainerImportItem *, uint64_t))(*(void *)this + 32))(this, 184549408);
  if (v5)
  {
    uint64_t v6 = +[ML3ComparisonPredicate predicateWithProperty:@"store_cloud_id" equalToInt64:v5];
    [v4 addObject:v6];
  }
  (*(void (**)(void **__return_ptr, ML3SubscriptionContainerImportItem *, uint64_t))(*(void *)this + 24))(&v12, this, 184549417);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v14, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    uint64_t v12 = &unk_1F08C3230;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v14 = __p;
  }
  std::string::size_type size = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  char v8 = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v14.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    char v9 = ML3CPPBridgeString((const UInt8 *)&v14, 1);
    uint64_t v10 = +[ML3ComparisonPredicate predicateWithProperty:@"cloud_global_id" equalToValue:v9];
    [v4 addObject:v10];

    char v8 = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  }
  if (v8 < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }

  return v4;
}

void sub_1B0482028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void ML3SubscriptionContainerImportItem::getDescription(ML3SubscriptionContainerImportItem *this)
{
  (*(void (**)(void **__return_ptr))(*(void *)this + 24))(&v18);
  (*(void (**)(ML3SubscriptionContainerImportItem *, uint64_t))(*(void *)this + 32))(this, 184549408);
  (*(void (**)(void *__return_ptr, ML3SubscriptionContainerImportItem *, uint64_t))(*(void *)this + 24))(v12, this, 184549417);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v12[0] = &unk_1F08C3230;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v17 = __p;
  }
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"<ML3SubscriptionContainerImportItem ", 36);
  *(_DWORD *)((char *)&v12[1] + *(void *)(v12[0] - 24)) = *(_DWORD *)((unsigned char *)&v12[1] + *(void *)(v12[0] - 24)) & 0xFFFFFFB5 | 8;
  uint64_t v2 = (void *)std::ostream::operator<<();
  uint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" global_id=", 11);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v4 = &v17;
  }
  else {
    long long v4 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)v4, size);
  uint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" cloud_id=", 10);
  *(_DWORD *)((char *)v7 + *(void *)(*v7 - 24) + _Block_object_dispose(&STACK[0x200], 8) = *(_DWORD *)((unsigned char *)v7 + *(void *)(*v7 - 24) + 8) & 0xFFFFFFB5 | 2;
  char v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", name=", 7);
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v11, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
  }
  else {
    std::string v11 = v19;
  }
  if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v9 = &v11;
  }
  else {
    char v9 = (std::string *)v11.__r_.__value_.__r.__words[0];
  }
  if ((v11.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v10 = HIBYTE(v11.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v10 = v11.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)v9, v10);
  char v20 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)&v20, 1);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  std::stringbuf::str();
  v12[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v12 + *(void *)(v12[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v12[1] = MEMORY[0x1E4FBA470] + 16;
  if (v15 < 0) {
    operator delete(v14);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1B3E935B0](&v16);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  id v18 = &unk_1F08C3230;
  if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v19.__r_.__value_.__l.__data_);
  }
}

void sub_1B0482474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  std::ostringstream::~ostringstream((uint64_t)&a15);
  if (*(char *)(v22 - 105) < 0) {
    operator delete(*(void **)(v22 - 128));
  }
  *(void *)(v22 - 96) = &unk_1F08C3230;
  if (*(char *)(v22 - 57) < 0) {
    operator delete(*(void **)(v22 - 80));
  }
  _Unwind_Resume(a1);
}

uint64_t ML3SubscriptionContainerImportItem::getIntegerValue(ML3DAAPImportItem *this, uint64_t a2)
{
  if (a2 == 184549426)
  {
    objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", v2, v3);
    return (uint64_t)v4;
  }
  else
  {
    return ML3DAAPContainerImportItem::getIntegerValue(this, a2);
  }
}

void ML3SubscriptionContainerImportItem::getStringValue(ML3DAAPImportItem *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = &unk_1F08C3230;
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  *(void *)(a3 + 16) = 0;
  uint64_t v5 = (std::string *)(a3 + 16);
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  if (a2 != 184549450)
  {
    ML3DAAPImportItem::getStringValue(this, a2, (uint64_t)&__dst);
    *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = BYTE8(__dst);
    std::string::operator=(v5, &v8);
    *(void *)&long long __dst = &unk_1F08C3230;
    if ((SHIBYTE(v8.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
    uint64_t v6 = (void *)v8.__r_.__value_.__r.__words[0];
    goto LABEL_14;
  }
  memset(&__str, 0, sizeof(__str));
  ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v12, *((void *)this + 8), 0x61654361u);
  if (v12)
  {
    std::string::basic_string[abi:ne180100](&__dst, *(void **)(v12 + 48), *(void *)(v12 + 64));
    *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
    __str.__r_.__value_.__r.__words[2] = v8.__r_.__value_.__r.__words[0];
  }
  else
  {
    ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v10, *((void *)this + 8), 0x61654354u);
    if (v10)
    {
      std::string::basic_string[abi:ne180100](&__dst, *(void **)(v10 + 48), *(void *)(v10 + 64));
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = __dst;
      __str.__r_.__value_.__r.__words[2] = v8.__r_.__value_.__r.__words[0];
    }
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  std::string::operator=(v5, &__str);
  *(unsigned char *)(a3 + _Block_object_dispose(&STACK[0x200], 8) = 1;
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    uint64_t v6 = (void *)__str.__r_.__value_.__r.__words[0];
LABEL_14:
    operator delete(v6);
  }
}

void sub_1B0482700(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,std::__shared_weak_count *a26)
{
  if (a26) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a26);
  }
  unint64_t v31 = *(std::__shared_weak_count **)(v29 - 56);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  *(void *)uint64_t v26 = v27;
  if (*(char *)(v26 + 39) < 0) {
    operator delete(*v28);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ML3SubscriptionContainerImportItem::isValid(ML3DAAPImportItem *this)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t result = ML3DAAPContainerImportItem::isValid(this);
  if (result)
  {
    if (ML3DAAPImportItem::getIntegerValue(this, 184549408) == 1)
    {
      uint64_t v3 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 134217984;
        uint64_t v5 = 1;
        _os_log_impl(&dword_1B022D000, v3, OS_LOG_TYPE_DEFAULT, "ignoring container with cloud id %lld", (uint8_t *)&v4, 0xCu);
      }

      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void ML3SubscriptionContainerImportItem::~ML3SubscriptionContainerImportItem(ML3SubscriptionContainerImportItem *this)
{
  ML3DAAPContainerImportItem::~ML3DAAPContainerImportItem(this);

  JUMPOUT(0x1B3E93610);
}

sqlite3 **DestroySQLExtensions(sqlite3 **pApp)
{
  if (pApp)
  {
    uint64_t v1 = pApp;
    uint64_t v2 = *pApp;
    if (v2)
    {
      sqlite3_create_function(v2, "FindRowForRunningSum_UInt64", 2, 2049, v1, 0, 0, 0);
      sqlite3_create_function(*v1, "CFTimeRelativeToStartOfToday", 1, 2049, v1, 0, 0, 0);
      sqlite3_create_function(*v1, "CFTimeRelativeToEndOfToday", 1, 2049, v1, 0, 0, 0);
    }
    void *v1 = 0;
    JUMPOUT(0x1B3E93610);
  }
  return pApp;
}

__CFString *SQLFunctionName_FindRowForRunningSum()
{
  return @"FindRowForRunningSum_UInt64";
}

__CFString *SQLFunctionName_CFTimeRelativeToStartOfToday()
{
  return @"CFTimeRelativeToStartOfToday";
}

__CFString *SQLFunctionName_CFTimeRelativeToEndOfToday()
{
  return @"CFTimeRelativeToEndOfToday";
}

void ML3SQLiteExtensions::CFTimeRelativeToEndOfToday(ML3SQLiteExtensions *this, sqlite3_context *a2, sqlite3_value **a3, sqlite3_value **a4)
{
  uint64_t v6 = (CFAbsoluteTime *)sqlite3_user_data(this);
  if (v6)
  {
    uint64_t v7 = v6;
    sqlite3_int64 v8 = sqlite3_value_int64(*a3);
    sqlite3_int64 v9 = ML3SQLiteExtensions::CFTimeRelativeToToday(v7, v8, 0);
    sqlite3_result_int64(this, v9);
  }
}

uint64_t ML3SQLiteExtensions::CFTimeRelativeToToday(CFAbsoluteTime *this, uint64_t a2, int a3)
{
  if (!*((unsigned char *)this + 48))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFCalendarIdentifier)*MEMORY[0x1E4F1D198]);
    uint64_t v11 = 0;
    unsigned int v10 = 0;
    CFCalendarDecomposeAbsoluteTime(v7, Current, "yMd", (char *)&v11 + 4, &v11, &v10);
    CFCalendarComposeAbsoluteTime(v7, this + 4, "yMdHms", HIDWORD(v11), v11, v10, 0, 0, 0);
    CFCalendarComposeAbsoluteTime(v7, this + 5, "yMdHms", HIDWORD(v11), v11, v10, 23, 59, 59);
    CFRelease(v7);
    *((unsigned char *)this + 4_Block_object_dispose(&STACK[0x200], 8) = 1;
  }
  uint64_t v8 = 5;
  if (a3) {
    uint64_t v8 = 4;
  }
  return (uint64_t)this[v8] + a2;
}

void ML3SQLiteExtensions::CFTimeRelativeToStartOfToday(ML3SQLiteExtensions *this, sqlite3_context *a2, sqlite3_value **a3, sqlite3_value **a4)
{
  uint64_t v6 = (CFAbsoluteTime *)sqlite3_user_data(this);
  if (v6)
  {
    uint64_t v7 = v6;
    sqlite3_int64 v8 = sqlite3_value_int64(*a3);
    sqlite3_int64 v9 = ML3SQLiteExtensions::CFTimeRelativeToToday(v7, v8, 1);
    sqlite3_result_int64(this, v9);
  }
}

void ML3SQLiteExtensions::Final_FindRowForRunningSum_UInt64(ML3SQLiteExtensions *this, sqlite3_context *a2)
{
  uint64_t v3 = sqlite3_aggregate_context(this, 56);
  if (v3)
  {
    int v4 = v3;
    sqlite3_result_int64(this, v3[3]);
    v4[1] = 0;
    void v4[2] = 0;
    v4[3] = 0;
  }
}

unint64_t ML3SQLiteExtensions::Step_FindRowForRunningSum_UInt64(ML3SQLiteExtensions *this, sqlite3_context *a2, sqlite3_value **a3, sqlite3_value **a4)
{
  int v5 = (int)a2;
  unint64_t result = (unint64_t)sqlite3_aggregate_context(this, 56);
  if (v5 >= 1)
  {
    uint64_t v7 = result;
    if (result)
    {
      if (!*(void *)(result + 16)) {
        *(void *)(result + _Block_object_dispose(&STACK[0x200], 8) = 0;
      }
      sqlite3_int64 v8 = sqlite3_value_int64(*a3);
      int64x2_t v9 = vdupq_n_s64(1uLL);
      v9.i64[0] = v8;
      int64x2_t v10 = vaddq_s64(*(int64x2_t *)(v7 + 8), v9);
      *(int64x2_t *)(v7 + _Block_object_dispose(&STACK[0x200], 8) = v10;
      unint64_t result = sqlite3_value_int64(a3[1]);
      if (v10.i64[0] <= result) {
        *(void *)(v7 + 24) = *(void *)(v7 + 16);
      }
    }
  }
  return result;
}

uint64_t ML3GenreDatabaseImportDataSource::getDatabaseTableSchemaClass(ML3GenreDatabaseImportDataSource *this)
{
  return objc_opt_class();
}

uint64_t ML3GenreDatabaseImportDataSource::getImportPropertyGroupKey(ML3GenreDatabaseImportDataSource *this)
{
  return 21;
}

void ML3GenreDatabaseImportDataSource::~ML3GenreDatabaseImportDataSource(id *this)
{
  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource(this);

  JUMPOUT(0x1B3E93610);
}

void ML3VirtualTableBindingVisitor::~ML3VirtualTableBindingVisitor(ML3VirtualTableBindingVisitor *this)
{
}

void ___ZN18ML3VirtualTableRowC2EP16ML3DatabaseTable_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(void **)(a1 + 32);
  if (([v3 columnConstraints] & 1) == 0)
  {
    uint64_t v24 = [v3 datatype];
    uint64_t v28 = 0;
    v25[0] = 0;
    int v26 = 0;
    char v27 = 1;
    unint64_t v5 = v4[3];
    uint64_t v6 = (uint64_t *)v4[2];
    if ((unint64_t)v6 >= v5)
    {
      uint64_t v8 = v4[1];
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v6 - v8) >> 4);
      if (v9 + 1 > 0x555555555555555) {
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - v8) >> 4);
      uint64_t v11 = 2 * v10;
      if (2 * v10 <= v9 + 1) {
        uint64_t v11 = v9 + 1;
      }
      if (v10 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v12 = 0x555555555555555;
      }
      else {
        unint64_t v12 = v11;
      }
      unint64_t v31 = v4 + 3;
      if (v12)
      {
        if (v12 > 0x555555555555555) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v13 = (char *)operator new(48 * v12);
      }
      else
      {
        uint64_t v13 = 0;
      }
      std::string v14 = (uint64_t *)&v13[48 * v9];
      uint64_t v28 = v13;
      v29.i64[0] = (uint64_t)v14;
      v29.i64[1] = (uint64_t)v14;
      uint64_t v30 = &v13[48 * v12];
      uint64_t *v14 = v24;
      std::__optional_copy_base<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,false>::__optional_copy_base[abi:ne180100]((uint64_t)(v14 + 1), (uint64_t)v25);
      uint64_t v15 = v29.i64[0];
      uint64_t v7 = v29.i64[1] + 48;
      v29.i64[1] += 48;
      uint64_t v17 = v4[1];
      unint64_t v16 = v4[2];
      if (v16 == v17)
      {
        int64x2_t v21 = vdupq_n_s64(v16);
      }
      else
      {
        id v23 = v3;
        uint64_t v18 = 0;
        do
        {
          uint64_t v19 = v15 + v18;
          *(void *)(v19 - 4_Block_object_dispose(&STACK[0x200], 8) = *(void *)(v16 + v18 - 48);
          *(unsigned char *)(v15 + v18 - 40) = 0;
          *(unsigned char *)(v19 - _Block_object_dispose(&STACK[0x200], 8) = 0;
          if (*(unsigned char *)(v16 + v18 - 8))
          {
            *(unsigned char *)(v15 + v18 - 40) = 0;
            *(_DWORD *)(v19 - 16) = -1;
            uint64_t v20 = *(unsigned int *)(v16 + v18 - 16);
            if (v20 != -1)
            {
              ((void (*)(char *))off_1F08D42C8[v20])(&v32);
              *(_DWORD *)(v19 - 16) = v20;
            }
            *(unsigned char *)(v19 - _Block_object_dispose(&STACK[0x200], 8) = 1;
          }
          v18 -= 48;
        }
        while (v16 + v18 != v17);
        v15 += v18;
        int64x2_t v21 = *(int64x2_t *)(v4 + 1);
        uint64_t v7 = v29.i64[1];
        id v3 = v23;
      }
      v4[1] = v15;
      void v4[2] = v7;
      int64x2_t v29 = v21;
      uint64_t v22 = (char *)v4[3];
      v4[3] = v30;
      uint64_t v30 = v22;
      uint64_t v28 = (char *)v21.i64[0];
      std::__split_buffer<ML3VirtualTableColumn>::~__split_buffer((uint64_t)&v28);
    }
    else
    {
      *uint64_t v6 = v24;
      std::__optional_copy_base<std::variant<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,false>::__optional_copy_base[abi:ne180100]((uint64_t)(v6 + 1), (uint64_t)v25);
      uint64_t v7 = (uint64_t)(v6 + 6);
      void v4[2] = v6 + 6;
    }
    void v4[2] = v7;
    if (v27) {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor((uint64_t)v25);
    }
  }
}

void sub_1B0483474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, ...)
{
  va_start(va, a9);
  std::__split_buffer<ML3VirtualTableColumn>::~__split_buffer((uint64_t)va);
  if (a9) {
    std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor(v10);
  }

  _Unwind_Resume(a1);
}

uint64_t std::__split_buffer<ML3VirtualTableColumn>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    *(void *)(a1 + 16) = v2 - 48;
    if (*(unsigned char *)(v2 - 8))
    {
      std::__variant_detail::__dtor<std::__variant_detail::__traits<long long,float,BOOL,std::string,std::shared_ptr<ML3CPPData>>,(std::__variant_detail::_Trait)1>::~__dtor(v2 - 40);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 48;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm4ELm4EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result = *a3;
  *a2 = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  return result;
}

__n128 _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm3ELm3EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, __n128 *a2, __n128 *a3)
{
  __n128 result = *a3;
  a2[1].n128_u64[0] = a3[1].n128_u64[0];
  *a2 = result;
  a3->n128_u64[1] = 0;
  a3[1].n128_u64[0] = 0;
  a3->n128_u64[0] = 0;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm2ELm2EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, unsigned char *a2, unsigned char *a3)
{
  *a2 = *a3;
}

float _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1ELm1EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, _DWORD *a2, float *a3)
{
  float result = *a3;
  *a2 = *(_DWORD *)a3;
  return result;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8ne180100IOZNS0_6__ctorINS0_8__traitsIJxfbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10shared_ptrI10ML3CPPDataEEEEEE19__generic_constructB8ne180100INS0_18__move_constructorISH_LNS0_6_TraitE1EEEEEvRSI_OT_EUlRSO_OT0_E_JRNS0_6__baseILSL_1EJxfbSD_SG_EEEOSW_EEEDcSO_DpT0_(uint64_t a1, void *a2, void *a3)
{
  *a2 = *a3;
}

void sub_1B0485B3C(_Unwind_Exception *a1)
{
}

void sub_1B04867C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 208), 8);
  _Block_object_dispose((const void *)(v32 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24243(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24244(uint64_t a1)
{
}

void sub_1B0487114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1B048757C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24320(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24321(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__24422(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24423(uint64_t a1)
{
}

uint64_t ML3ItemSearchDatabaseImportDataSource::hasValueForKey(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  if ((a3 - 67108865) <= 4)
  {
    uint64_t v3 = (std::__shared_weak_count *)a2[1];
    uint64_t v8 = *a2;
    unint64_t v9 = v3;
    if (v3) {
      atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t hasValueForKey = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 80))(a1, &v8) != 0;
    unint64_t v5 = v9;
    if (!v9) {
      return hasValueForKey;
    }
LABEL_9:
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    return hasValueForKey;
  }
  unint64_t v5 = (std::__shared_weak_count *)a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t hasValueForKey = ML3DatabaseImportDataSource::hasValueForKey(a1, v7, a3);
  if (v5) {
    goto LABEL_9;
  }
  return hasValueForKey;
}

void sub_1B04884F0(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B0488508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (!a12) {
    JUMPOUT(0x1B0488500);
  }
  JUMPOUT(0x1B04884F8);
}

uint64_t ML3ItemSearchDatabaseImportDataSource::integerValueForKey(void *a1, uint64_t *a2, uint64_t a3)
{
  switch((int)a3)
  {
    case 67108865:
      uint64_t v3 = a1[9];
      break;
    case 67108866:
      uint64_t v3 = a1[11];
      break;
    case 67108867:
      uint64_t v3 = a1[13];
      break;
    case 67108868:
      uint64_t v3 = a1[15];
      break;
    case 67108869:
      uint64_t v3 = a1[17];
      break;
    default:
      uint64_t v4 = *a2;
      unint64_t v5 = (std::__shared_weak_count *)a2[1];
      if (v5) {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 32))(v4, a3);
      if (v5) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
      break;
  }
  return v3;
}

void sub_1B04885DC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void ML3ItemSearchDatabaseImportDataSource::prepareColumns(void *a1, uint64_t *a2)
{
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 33554433);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = __p;
  }
  uint64_t v4 = ML3CPPBridgeString((const UInt8 *)&v22, 1);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  v20[0] = &unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 167772161);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = __p;
  }
  unint64_t v5 = ML3CPPBridgeString((const UInt8 *)&v22, 1);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  v20[0] = &unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 167772164);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = __p;
  }
  uint64_t v6 = ML3CPPBridgeString((const UInt8 *)&v22, 1);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  v20[0] = &unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  ML3ImportItem::getSanitizedStringValue((ML3ImportItem *)v20, *a2, 167772165);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = __p;
  }
  uint64_t v7 = ML3CPPBridgeString((const UInt8 *)&v22, 1);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  v20[0] = &unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  (*(void (**)(void *__return_ptr))(*(void *)*a2 + 152))(v20);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = __p;
  }
  uint64_t v8 = ML3CPPBridgeString((const UInt8 *)&v22, 1);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  v20[0] = &unk_1F08C3230;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  id v9 = *(id *)(a1[3] + 24);
  uint64_t v10 = [v9 objectForKey:v4];
  a1[9] = [v10 ML3NameOrderValue];
  a1[10] = v11;

  unint64_t v12 = [v9 objectForKey:v6];
  a1[11] = [v12 ML3NameOrderValue];
  a1[12] = v13;

  std::string v14 = [v9 objectForKey:v5];
  a1[13] = [v14 ML3NameOrderValue];
  a1[14] = v15;

  unint64_t v16 = [v9 objectForKey:v7];
  a1[15] = [v16 ML3NameOrderValue];
  a1[16] = v17;

  uint64_t v18 = [v9 objectForKey:v8];
  a1[17] = [v18 ML3NameOrderValue];
  a1[18] = v19;
}

void sub_1B0488A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a17 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1B0488AE4()
{
}

void sub_1B0488AEC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(a14) < 0) {
    operator delete(a12);
  }
  JUMPOUT(0x1B0488A88);
}

void sub_1B0488B34()
{
}

void sub_1B0488B3C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(a14) < 0) {
    operator delete(a12);
  }
  JUMPOUT(0x1B0488A8CLL);
}

void sub_1B0488B84()
{
}

void sub_1B0488B8C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(a14) < 0) {
    operator delete(a12);
  }
  JUMPOUT(0x1B0488A90);
}

void sub_1B0488BD4()
{
}

void sub_1B0488BDC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (SHIBYTE(a14) < 0) {
    operator delete(a12);
  }
  JUMPOUT(0x1B0488A94);
}

uint64_t ML3ItemSearchDatabaseImportDataSource::getDatabaseTableSchemaClass(ML3ItemSearchDatabaseImportDataSource *this)
{
  return objc_opt_class();
}

uint64_t ML3ItemSearchDatabaseImportDataSource::getImportPropertyGroupKey(ML3ItemSearchDatabaseImportDataSource *this)
{
  return 4;
}

void ML3ItemSearchDatabaseImportDataSource::~ML3ItemSearchDatabaseImportDataSource(id *this)
{
  ML3DatabaseImportDataSource::~ML3DatabaseImportDataSource(this);

  JUMPOUT(0x1B3E93610);
}

uint64_t _MLDUpdateSpotlightIndexBundleForBundleIdentifier(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.Music"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"com.apple.videos"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1B04896C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24607(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24608(uint64_t a1)
{
}

void sub_1B0489E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B048B91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t _MLDUpdateSpotlightIndexVersionForBundle(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 2) {
    return 4;
  }
  uint64_t v6 = v1;
  uint64_t v7 = v2;
  uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3UpdateSpotlightIndexOperation] Trying get the current index version from an unknown bundle", v5, 2u);
  }

  return 0x7FFFFFFFFFFFFFFFLL;
}

void sub_1B048C088(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B048C738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B048CA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B048D114(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1B048E374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24922(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24923(uint64_t a1)
{
}

void sub_1B0490054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t __Block_byref_object_copy__25298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25299(uint64_t a1)
{
}

id ML3DatabaseCreateDiskIOError()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v4[0] = @"Unrecoverable SQLITE_IOERR detected";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ML3DatabaseErrorDomain" code:500 userInfo:v0];

  return v1;
}

id ML3DatabaseCreateCorruptionError()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F28568];
  v4[0] = @"Database corruption has been detected.";
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ML3DatabaseErrorDomain" code:400 userInfo:v0];

  return v1;
}

void sub_1B0492C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B0496C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MIPArtistReadFrom(_DWORD *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x1E5FAE000uLL;
  uint64_t v8 = &OBJC_IVAR___ML3ActiveTransaction__client;
  id v9 = &OBJC_IVAR___ML3ActiveTransaction__client;
  uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      unint64_t v15 = *(void *)(a2 + v14);
      if (v15 == -1 || v15 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v16 = *(unsigned char *)(*(void *)(a2 + *v10) + v15);
      *(void *)(a2 + v14) = v15 + 1;
      v13 |= (unint64_t)(v16 & 0x7F) << v11;
      if ((v16 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v17 = v12++ >= 9;
      if (v17)
      {
        unint64_t v13 = 0;
        int v18 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v18 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    if (v18 || (v13 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
        *((unsigned char *)a1 + v8[715]) |= 0x10u;
        while (1)
        {
          uint64_t v23 = *v3;
          unint64_t v24 = *(void *)(a2 + v23);
          if (v24 == -1 || v24 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v25 = *(unsigned char *)(*(void *)(a2 + *v10) + v24);
          *(void *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0) {
            goto LABEL_73;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            uint64_t v22 = 0;
            goto LABEL_75;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_73:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_75:
        uint64_t v60 = v9[716];
        goto LABEL_96;
      case 2u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 20;
        goto LABEL_41;
      case 3u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 22;
        goto LABEL_41;
      case 4u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 12;
        goto LABEL_41;
      case 5u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v22 = 0;
        *((unsigned char *)a1 + v8[715]) |= 2u;
        while (2)
        {
          uint64_t v34 = *v3;
          unint64_t v35 = *(void *)(a2 + v34);
          if (v35 == -1 || v35 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + *v10) + v35);
            *(void *)(a2 + v34) = v35 + 1;
            v22 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v17 = v33++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_79;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_79:
        uint64_t v60 = 16;
        goto LABEL_96;
      case 6u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 14;
LABEL_41:
        uint64_t v37 = *(void **)&a1[v31];
        *(void *)&a1[v31] = v30;

        goto LABEL_97;
      case 7u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v40 = 0;
        *((unsigned char *)a1 + v8[715]) |= 0x20u;
        while (2)
        {
          uint64_t v41 = *v3;
          unint64_t v42 = *(void *)(a2 + v41);
          if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v10) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v40 |= (unint64_t)(v43 & 0x7F) << v38;
            if (v43 < 0)
            {
              v38 += 7;
              BOOL v17 = v39++ >= 9;
              if (v17)
              {
                LODWORD(v40) = 0;
                goto LABEL_83;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v40) = 0;
        }
LABEL_83:
        a1[18] = v40;
        goto LABEL_97;
      case 8u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v22 = 0;
        *((unsigned char *)a1 + v8[715]) |= 1u;
        while (2)
        {
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v10) + v47);
            *(void *)(a2 + v46) = v47 + 1;
            v22 |= (unint64_t)(v48 & 0x7F) << v44;
            if (v48 < 0)
            {
              v44 += 7;
              BOOL v17 = v45++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_87;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_87:
        uint64_t v60 = 8;
        goto LABEL_96;
      case 9u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v22 = 0;
        *((unsigned char *)a1 + v8[715]) |= 4u;
        while (2)
        {
          uint64_t v51 = *v3;
          unint64_t v52 = *(void *)(a2 + v51);
          if (v52 == -1 || v52 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v10) + v52);
            *(void *)(a2 + v51) = v52 + 1;
            v22 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v17 = v50++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_91;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_91:
        uint64_t v60 = 24;
        goto LABEL_96;
      case 0xAu:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v22 = 0;
        *((unsigned char *)a1 + v8[715]) |= 8u;
        while (2)
        {
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 == -1 || v57 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + *v10) + v57);
            *(void *)(a2 + v56) = v57 + 1;
            v22 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              BOOL v17 = v55++ >= 9;
              if (v17)
              {
                uint64_t v22 = 0;
                goto LABEL_95;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v22 = 0;
        }
LABEL_95:
        uint64_t v60 = 32;
LABEL_96:
        *(void *)((char *)a1 + v60) = v22;
        goto LABEL_97;
      default:
        if ((v13 >> 3) != 50)
        {
          uint64_t result = PBReaderSkipValueWithTag();
          if (!result) {
            return result;
          }
          goto LABEL_97;
        }
        int v26 = v8;
        uint64_t v27 = v9;
        unint64_t v28 = v7;
        id v29 = objc_alloc_init(*(Class *)(v7 + 2536));
        [a1 addLibraryIdentifiers:v29];
        if PBReaderPlaceMark() && (MIPLibraryIdentifierReadFrom((uint64_t)v29, a2))
        {
          PBReaderRecallMark();

          unint64_t v7 = v28;
          id v9 = v27;
          uint64_t v8 = v26;
LABEL_97:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
    }
  }
}

void sub_1B0499770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p)
{
  (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
  *(void *)(v22 - 56) = &a10;
  std::vector<std::unordered_set<std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v22 - 56));
  if (v21)
  {
    operator delete(v21);
    if (!v19) {
      goto LABEL_3;
    }
  }
  else if (!v19)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v19);
LABEL_3:
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionContainerImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionContainerImportItem>,std::allocator<ML3SubscriptionContainerImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI17ML3DAAPImportItemE27__shared_ptr_default_deleteIS1_34ML3SubscriptionContainerImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionContainerImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionContainerImportItem>,std::allocator<ML3SubscriptionContainerImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3SubscriptionContainerImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionContainerImportItem>,std::allocator<ML3SubscriptionContainerImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void sub_1B04999F0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI17ML3DAAPImportItemE27__shared_ptr_default_deleteIS1_25ML3SubscriptionImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3SubscriptionImportItem *,std::shared_ptr<ML3DAAPImportItem>::__shared_ptr_default_delete<ML3DAAPImportItem,ML3SubscriptionImportItem>,std::allocator<ML3SubscriptionImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

void sub_1B0499BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0499E3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1B0499F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MLExceptionsEnabled()
{
  return __exceptionsEnabled;
}

uint64_t MLSetExceptionsEnabled(uint64_t result)
{
  __exceptionsEnabled = result;
  return result;
}

void sub_1B049A364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B049A700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B049C2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27364(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27365(uint64_t a1)
{
}

void sub_1B049C54C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B049CA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MIPMediaItemReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v8 = 0;
    unsigned int v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *v3;
      unint64_t v12 = *(void *)(a2 + v11);
      if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
        break;
      }
      char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
      *(void *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0) {
        goto LABEL_12;
      }
      v8 += 7;
      BOOL v14 = v9++ >= 9;
      if (v14)
      {
        unint64_t v10 = 0;
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    int v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(unsigned char *)(a2 + *v5)) {
      unint64_t v10 = 0;
    }
LABEL_14:
    if (v15 || (v10 & 7) == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    unint64_t v17 = v10 >> 3;
    switch((v10 >> 3))
    {
      case 1u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x80000000uLL;
        while (2)
        {
          uint64_t v21 = *v3;
          unint64_t v22 = *(void *)(a2 + v21);
          if (v22 == -1 || v22 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)(a2 + *v7) + v22);
            *(void *)(a2 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if (v23 < 0)
            {
              v18 += 7;
              BOOL v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_433;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_433:
        uint64_t v302 = 328;
        goto LABEL_627;
      case 2u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 464;
        goto LABEL_403;
      case 3u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 432;
        goto LABEL_403;
      case 4u:
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x10000uLL;
        while (2)
        {
          uint64_t v31 = *v3;
          unint64_t v32 = *(void *)(a2 + v31);
          if (v32 == -1 || v32 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)(a2 + *v7) + v32);
            *(void *)(a2 + v31) = v32 + 1;
            v30 |= (unint64_t)(v33 & 0x7F) << v28;
            if (v33 < 0)
            {
              v28 += 7;
              BOOL v14 = v29++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_437;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_437:
        uint64_t v303 = 136;
        goto LABEL_644;
      case 5u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 8uLL;
        while (2)
        {
          uint64_t v36 = *v3;
          unint64_t v37 = *(void *)(a2 + v36);
          if (v37 == -1 || v37 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)(a2 + *v7) + v37);
            *(void *)(a2 + v36) = v37 + 1;
            v30 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              BOOL v14 = v35++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_441;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_441:
        uint64_t v303 = 32;
        goto LABEL_644;
      case 6u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x2000uLL;
        while (2)
        {
          uint64_t v41 = *v3;
          unint64_t v42 = *(void *)(a2 + v41);
          if (v42 == -1 || v42 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v43 = *(unsigned char *)(*(void *)(a2 + *v7) + v42);
            *(void *)(a2 + v41) = v42 + 1;
            v30 |= (unint64_t)(v43 & 0x7F) << v39;
            if (v43 < 0)
            {
              v39 += 7;
              BOOL v14 = v40++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_445;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_445:
        uint64_t v303 = 112;
        goto LABEL_644;
      case 7u:
        char v44 = 0;
        unsigned int v45 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x200uLL;
        while (2)
        {
          uint64_t v46 = *v3;
          unint64_t v47 = *(void *)(a2 + v46);
          if (v47 == -1 || v47 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v48 = *(unsigned char *)(*(void *)(a2 + *v7) + v47);
            *(void *)(a2 + v46) = v47 + 1;
            v30 |= (unint64_t)(v48 & 0x7F) << v44;
            if (v48 < 0)
            {
              v44 += 7;
              BOOL v14 = v45++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_449;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_449:
        uint64_t v303 = 80;
        goto LABEL_644;
      case 8u:
        char v49 = 0;
        unsigned int v50 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x80uLL;
        while (2)
        {
          uint64_t v51 = *v3;
          unint64_t v52 = *(void *)(a2 + v51);
          if (v52 == -1 || v52 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v53 = *(unsigned char *)(*(void *)(a2 + *v7) + v52);
            *(void *)(a2 + v51) = v52 + 1;
            v30 |= (unint64_t)(v53 & 0x7F) << v49;
            if (v53 < 0)
            {
              v49 += 7;
              BOOL v14 = v50++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_453;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_453:
        uint64_t v303 = 64;
        goto LABEL_644;
      case 9u:
        char v54 = 0;
        unsigned int v55 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x4000000uLL;
        while (2)
        {
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 == -1 || v57 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)(a2 + *v7) + v57);
            *(void *)(a2 + v56) = v57 + 1;
            v20 |= (unint64_t)(v58 & 0x7F) << v54;
            if (v58 < 0)
            {
              v54 += 7;
              BOOL v14 = v55++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_457;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_457:
        uint64_t v302 = 248;
        goto LABEL_627;
      case 0xAu:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v61 = 0;
        *(void *)(a1 + 496) |= 0x40000000000uLL;
        while (2)
        {
          uint64_t v62 = *v3;
          unint64_t v63 = *(void *)(a2 + v62);
          if (v63 == -1 || v63 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v64 = *(unsigned char *)(*(void *)(a2 + *v7) + v63);
            *(void *)(a2 + v62) = v63 + 1;
            v61 |= (unint64_t)(v64 & 0x7F) << v59;
            if (v64 < 0)
            {
              v59 += 7;
              BOOL v14 = v60++ >= 9;
              if (v14)
              {
                uint64_t v61 = 0;
                goto LABEL_461;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v61 = 0;
        }
LABEL_461:
        BOOL v304 = v61 != 0;
        uint64_t v305 = 485;
        goto LABEL_602;
      case 0xBu:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 408;
        goto LABEL_403;
      case 0xCu:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 320;
        goto LABEL_403;
      case 0xDu:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 256;
        goto LABEL_403;
      case 0xEu:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 192;
        goto LABEL_403;
      case 0xFu:
        char v65 = 0;
        unsigned int v66 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x10000000000uLL;
        while (2)
        {
          uint64_t v67 = *v3;
          unint64_t v68 = *(void *)(a2 + v67);
          if (v68 == -1 || v68 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v69 = *(unsigned char *)(*(void *)(a2 + *v7) + v68);
            *(void *)(a2 + v67) = v68 + 1;
            v20 |= (unint64_t)(v69 & 0x7F) << v65;
            if (v69 < 0)
            {
              v65 += 7;
              BOOL v14 = v66++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_465;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_465:
        uint64_t v302 = 480;
        goto LABEL_627;
      case 0x10u:
        char v70 = 0;
        unsigned int v71 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x8000000uLL;
        while (2)
        {
          uint64_t v72 = *v3;
          unint64_t v73 = *(void *)(a2 + v72);
          if (v73 == -1 || v73 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v74 = *(unsigned char *)(*(void *)(a2 + *v7) + v73);
            *(void *)(a2 + v72) = v73 + 1;
            v20 |= (unint64_t)(v74 & 0x7F) << v70;
            if (v74 < 0)
            {
              v70 += 7;
              BOOL v14 = v71++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_469;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_469:
        uint64_t v302 = 252;
        goto LABEL_627;
      case 0x11u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 240;
        goto LABEL_403;
      case 0x12u:
        char v75 = 0;
        unsigned int v76 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x20000000uLL;
        while (2)
        {
          uint64_t v77 = *v3;
          unint64_t v78 = *(void *)(a2 + v77);
          if (v78 == -1 || v78 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v79 = *(unsigned char *)(*(void *)(a2 + *v7) + v78);
            *(void *)(a2 + v77) = v78 + 1;
            v20 |= (unint64_t)(v79 & 0x7F) << v75;
            if (v79 < 0)
            {
              v75 += 7;
              BOOL v14 = v76++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_473;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_473:
        uint64_t v302 = 280;
        goto LABEL_627;
      case 0x13u:
        char v80 = 0;
        unsigned int v81 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x100uLL;
        while (2)
        {
          uint64_t v82 = *v3;
          unint64_t v83 = *(void *)(a2 + v82);
          if (v83 == -1 || v83 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v84 = *(unsigned char *)(*(void *)(a2 + *v7) + v83);
            *(void *)(a2 + v82) = v83 + 1;
            v30 |= (unint64_t)(v84 & 0x7F) << v80;
            if (v84 < 0)
            {
              v80 += 7;
              BOOL v14 = v81++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_477;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_477:
        uint64_t v303 = 72;
        goto LABEL_644;
      case 0x14u:
        char v85 = 0;
        unsigned int v86 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x10000000uLL;
        while (2)
        {
          uint64_t v87 = *v3;
          unint64_t v88 = *(void *)(a2 + v87);
          if (v88 == -1 || v88 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v89 = *(unsigned char *)(*(void *)(a2 + *v7) + v88);
            *(void *)(a2 + v87) = v88 + 1;
            v20 |= (unint64_t)(v89 & 0x7F) << v85;
            if (v89 < 0)
            {
              v85 += 7;
              BOOL v14 = v86++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_481;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_481:
        uint64_t v302 = 264;
        goto LABEL_627;
      case 0x15u:
        char v90 = 0;
        unsigned int v91 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x40uLL;
        while (2)
        {
          uint64_t v92 = *v3;
          unint64_t v93 = *(void *)(a2 + v92);
          if (v93 == -1 || v93 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v94 = *(unsigned char *)(*(void *)(a2 + *v7) + v93);
            *(void *)(a2 + v92) = v93 + 1;
            v30 |= (unint64_t)(v94 & 0x7F) << v90;
            if (v94 < 0)
            {
              v90 += 7;
              BOOL v14 = v91++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_485;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_485:
        uint64_t v303 = 56;
        goto LABEL_644;
      case 0x16u:
        char v95 = 0;
        unsigned int v96 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x10uLL;
        while (2)
        {
          uint64_t v97 = *v3;
          unint64_t v98 = *(void *)(a2 + v97);
          if (v98 == -1 || v98 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v99 = *(unsigned char *)(*(void *)(a2 + *v7) + v98);
            *(void *)(a2 + v97) = v98 + 1;
            v30 |= (unint64_t)(v99 & 0x7F) << v95;
            if (v99 < 0)
            {
              v95 += 7;
              BOOL v14 = v96++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_489;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_489:
        uint64_t v303 = 40;
        goto LABEL_644;
      case 0x17u:
        char v100 = 0;
        unsigned int v101 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x20uLL;
        while (2)
        {
          uint64_t v102 = *v3;
          unint64_t v103 = *(void *)(a2 + v102);
          if (v103 == -1 || v103 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v104 = *(unsigned char *)(*(void *)(a2 + *v7) + v103);
            *(void *)(a2 + v102) = v103 + 1;
            v30 |= (unint64_t)(v104 & 0x7F) << v100;
            if (v104 < 0)
            {
              v100 += 7;
              BOOL v14 = v101++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_493;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_493:
        uint64_t v303 = 48;
        goto LABEL_644;
      case 0x18u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 208;
        goto LABEL_403;
      case 0x19u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 440;
        goto LABEL_403;
      case 0x1Au:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 272;
        goto LABEL_403;
      case 0x1Bu:
        char v105 = 0;
        unsigned int v106 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x4000uLL;
        while (2)
        {
          uint64_t v107 = *v3;
          unint64_t v108 = *(void *)(a2 + v107);
          if (v108 == -1 || v108 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v109 = *(unsigned char *)(*(void *)(a2 + *v7) + v108);
            *(void *)(a2 + v107) = v108 + 1;
            v30 |= (unint64_t)(v109 & 0x7F) << v105;
            if (v109 < 0)
            {
              v105 += 7;
              BOOL v14 = v106++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_497;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_497:
        uint64_t v303 = 120;
        goto LABEL_644;
      case 0x1Cu:
        char v110 = 0;
        unsigned int v111 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x2000000uLL;
        while (2)
        {
          uint64_t v112 = *v3;
          unint64_t v113 = *(void *)(a2 + v112);
          if (v113 == -1 || v113 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v114 = *(unsigned char *)(*(void *)(a2 + *v7) + v113);
            *(void *)(a2 + v112) = v113 + 1;
            v20 |= (unint64_t)(v114 & 0x7F) << v110;
            if (v114 < 0)
            {
              v110 += 7;
              BOOL v14 = v111++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_501;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_501:
        uint64_t v302 = 224;
        goto LABEL_627;
      case 0x1Du:
        char v115 = 0;
        unsigned int v116 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x100000000uLL;
        while (2)
        {
          uint64_t v117 = *v3;
          unint64_t v118 = *(void *)(a2 + v117);
          if (v118 == -1 || v118 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v119 = *(unsigned char *)(*(void *)(a2 + *v7) + v118);
            *(void *)(a2 + v117) = v118 + 1;
            v20 |= (unint64_t)(v119 & 0x7F) << v115;
            if (v119 < 0)
            {
              v115 += 7;
              BOOL v14 = v116++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_505;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_505:
        uint64_t v302 = 344;
        goto LABEL_627;
      case 0x1Eu:
        char v120 = 0;
        unsigned int v121 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x200000000uLL;
        while (2)
        {
          uint64_t v122 = *v3;
          unint64_t v123 = *(void *)(a2 + v122);
          if (v123 == -1 || v123 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v124 = *(unsigned char *)(*(void *)(a2 + *v7) + v123);
            *(void *)(a2 + v122) = v123 + 1;
            v20 |= (unint64_t)(v124 & 0x7F) << v120;
            if (v124 < 0)
            {
              v120 += 7;
              BOOL v14 = v121++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_509;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_509:
        uint64_t v302 = 348;
        goto LABEL_627;
      case 0x1Fu:
        char v125 = 0;
        unsigned int v126 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x400uLL;
        while (2)
        {
          uint64_t v127 = *v3;
          unint64_t v128 = *(void *)(a2 + v127);
          if (v128 == -1 || v128 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v129 = *(unsigned char *)(*(void *)(a2 + *v7) + v128);
            *(void *)(a2 + v127) = v128 + 1;
            v30 |= (unint64_t)(v129 & 0x7F) << v125;
            if (v129 < 0)
            {
              v125 += 7;
              BOOL v14 = v126++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_513;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_513:
        uint64_t v303 = 88;
        goto LABEL_644;
      case 0x20u:
        char v130 = 0;
        unsigned int v131 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x2000000000uLL;
        while (2)
        {
          uint64_t v132 = *v3;
          unint64_t v133 = *(void *)(a2 + v132);
          if (v133 == -1 || v133 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v134 = *(unsigned char *)(*(void *)(a2 + *v7) + v133);
            *(void *)(a2 + v132) = v133 + 1;
            v20 |= (unint64_t)(v134 & 0x7F) << v130;
            if (v134 < 0)
            {
              v130 += 7;
              BOOL v14 = v131++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_517;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_517:
        uint64_t v302 = 416;
        goto LABEL_627;
      case 0x21u:
        char v135 = 0;
        unsigned int v136 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x4000000000uLL;
        while (2)
        {
          uint64_t v137 = *v3;
          unint64_t v138 = *(void *)(a2 + v137);
          if (v138 == -1 || v138 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v139 = *(unsigned char *)(*(void *)(a2 + *v7) + v138);
            *(void *)(a2 + v137) = v138 + 1;
            v20 |= (unint64_t)(v139 & 0x7F) << v135;
            if (v139 < 0)
            {
              v135 += 7;
              BOOL v14 = v136++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_521;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_521:
        uint64_t v302 = 420;
        goto LABEL_627;
      case 0x22u:
        char v140 = 0;
        unsigned int v141 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x800uLL;
        while (2)
        {
          uint64_t v142 = *v3;
          unint64_t v143 = *(void *)(a2 + v142);
          if (v143 == -1 || v143 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v144 = *(unsigned char *)(*(void *)(a2 + *v7) + v143);
            *(void *)(a2 + v142) = v143 + 1;
            v30 |= (unint64_t)(v144 & 0x7F) << v140;
            if (v144 < 0)
            {
              v140 += 7;
              BOOL v14 = v141++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_525;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_525:
        uint64_t v303 = 96;
        goto LABEL_644;
      case 0x23u:
        char v145 = 0;
        unsigned int v146 = 0;
        uint64_t v147 = 0;
        *(void *)(a1 + 496) |= 0x8000000000000uLL;
        while (2)
        {
          uint64_t v148 = *v3;
          unint64_t v149 = *(void *)(a2 + v148);
          if (v149 == -1 || v149 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v150 = *(unsigned char *)(*(void *)(a2 + *v7) + v149);
            *(void *)(a2 + v14_Block_object_dispose(&STACK[0x230], 8) = v149 + 1;
            v147 |= (unint64_t)(v150 & 0x7F) << v145;
            if (v150 < 0)
            {
              v145 += 7;
              BOOL v14 = v146++ >= 9;
              if (v14)
              {
                uint64_t v147 = 0;
                goto LABEL_529;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v147 = 0;
        }
LABEL_529:
        BOOL v304 = v147 != 0;
        uint64_t v305 = 494;
        goto LABEL_602;
      case 0x24u:
        char v151 = 0;
        unsigned int v152 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 4uLL;
        while (2)
        {
          uint64_t v153 = *v3;
          unint64_t v154 = *(void *)(a2 + v153);
          if (v154 == -1 || v154 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v155 = *(unsigned char *)(*(void *)(a2 + *v7) + v154);
            *(void *)(a2 + v153) = v154 + 1;
            v30 |= (unint64_t)(v155 & 0x7F) << v151;
            if (v155 < 0)
            {
              v151 += 7;
              BOOL v14 = v152++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_533;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_533:
        uint64_t v303 = 24;
        goto LABEL_644;
      case 0x25u:
        char v156 = 0;
        unsigned int v157 = 0;
        uint64_t v158 = 0;
        *(void *)(a1 + 496) |= 0x200000000000uLL;
        while (2)
        {
          uint64_t v159 = *v3;
          unint64_t v160 = *(void *)(a2 + v159);
          if (v160 == -1 || v160 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v161 = *(unsigned char *)(*(void *)(a2 + *v7) + v160);
            *(void *)(a2 + v159) = v160 + 1;
            v158 |= (unint64_t)(v161 & 0x7F) << v156;
            if (v161 < 0)
            {
              v156 += 7;
              BOOL v14 = v157++ >= 9;
              if (v14)
              {
                uint64_t v158 = 0;
                goto LABEL_537;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v158 = 0;
        }
LABEL_537:
        BOOL v304 = v158 != 0;
        uint64_t v305 = 488;
        goto LABEL_602;
      case 0x26u:
        char v162 = 0;
        unsigned int v163 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x100000uLL;
        while (2)
        {
          uint64_t v164 = *v3;
          unint64_t v165 = *(void *)(a2 + v164);
          if (v165 == -1 || v165 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v166 = *(unsigned char *)(*(void *)(a2 + *v7) + v165);
            *(void *)(a2 + v164) = v165 + 1;
            v30 |= (unint64_t)(v166 & 0x7F) << v162;
            if (v166 < 0)
            {
              v162 += 7;
              BOOL v14 = v163++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_541;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_541:
        uint64_t v303 = 168;
        goto LABEL_644;
      case 0x27u:
        char v167 = 0;
        unsigned int v168 = 0;
        uint64_t v169 = 0;
        *(void *)(a1 + 496) |= 0x100000000000uLL;
        while (2)
        {
          uint64_t v170 = *v3;
          unint64_t v171 = *(void *)(a2 + v170);
          if (v171 == -1 || v171 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v172 = *(unsigned char *)(*(void *)(a2 + *v7) + v171);
            *(void *)(a2 + v170) = v171 + 1;
            v169 |= (unint64_t)(v172 & 0x7F) << v167;
            if (v172 < 0)
            {
              v167 += 7;
              BOOL v14 = v168++ >= 9;
              if (v14)
              {
                uint64_t v169 = 0;
                goto LABEL_545;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v169 = 0;
        }
LABEL_545:
        BOOL v304 = v169 != 0;
        uint64_t v305 = 487;
        goto LABEL_602;
      case 0x28u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 296;
        goto LABEL_403;
      case 0x29u:
        char v173 = 0;
        unsigned int v174 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x40000000uLL;
        while (2)
        {
          uint64_t v175 = *v3;
          unint64_t v176 = *(void *)(a2 + v175);
          if (v176 == -1 || v176 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v177 = *(unsigned char *)(*(void *)(a2 + *v7) + v176);
            *(void *)(a2 + v175) = v176 + 1;
            v20 |= (unint64_t)(v177 & 0x7F) << v173;
            if (v177 < 0)
            {
              v173 += 7;
              BOOL v14 = v174++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_549;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_549:
        uint64_t v302 = 312;
        goto LABEL_627;
      case 0x2Au:
LABEL_34:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        goto LABEL_645;
      case 0x2Bu:
        char v178 = 0;
        unsigned int v179 = 0;
        uint64_t v180 = 0;
        *(void *)(a1 + 496) |= 0x4000000000000uLL;
        while (2)
        {
          uint64_t v181 = *v3;
          unint64_t v182 = *(void *)(a2 + v181);
          if (v182 == -1 || v182 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v183 = *(unsigned char *)(*(void *)(a2 + *v7) + v182);
            *(void *)(a2 + v181) = v182 + 1;
            v180 |= (unint64_t)(v183 & 0x7F) << v178;
            if (v183 < 0)
            {
              v178 += 7;
              BOOL v14 = v179++ >= 9;
              if (v14)
              {
                uint64_t v180 = 0;
                goto LABEL_553;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v180 = 0;
        }
LABEL_553:
        BOOL v304 = v180 != 0;
        uint64_t v305 = 493;
        goto LABEL_602;
      case 0x2Cu:
        char v184 = 0;
        unsigned int v185 = 0;
        uint64_t v186 = 0;
        *(void *)(a1 + 496) |= 0x2000000000000uLL;
        while (2)
        {
          uint64_t v187 = *v3;
          unint64_t v188 = *(void *)(a2 + v187);
          if (v188 == -1 || v188 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v189 = *(unsigned char *)(*(void *)(a2 + *v7) + v188);
            *(void *)(a2 + v187) = v188 + 1;
            v186 |= (unint64_t)(v189 & 0x7F) << v184;
            if (v189 < 0)
            {
              v184 += 7;
              BOOL v14 = v185++ >= 9;
              if (v14)
              {
                uint64_t v186 = 0;
                goto LABEL_557;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v186 = 0;
        }
LABEL_557:
        BOOL v304 = v186 != 0;
        uint64_t v305 = 492;
        goto LABEL_602;
      case 0x2Du:
        char v190 = 0;
        unsigned int v191 = 0;
        uint64_t v192 = 0;
        *(void *)(a1 + 496) |= 0x800000000000uLL;
        while (2)
        {
          uint64_t v193 = *v3;
          unint64_t v194 = *(void *)(a2 + v193);
          if (v194 == -1 || v194 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v195 = *(unsigned char *)(*(void *)(a2 + *v7) + v194);
            *(void *)(a2 + v193) = v194 + 1;
            v192 |= (unint64_t)(v195 & 0x7F) << v190;
            if (v195 < 0)
            {
              v190 += 7;
              BOOL v14 = v191++ >= 9;
              if (v14)
              {
                uint64_t v192 = 0;
                goto LABEL_561;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v192 = 0;
        }
LABEL_561:
        BOOL v304 = v192 != 0;
        uint64_t v305 = 490;
        goto LABEL_602;
      case 0x2Eu:
        char v196 = 0;
        unsigned int v197 = 0;
        uint64_t v198 = 0;
        *(void *)(a1 + 496) |= 0x20000000000uLL;
        while (2)
        {
          uint64_t v199 = *v3;
          unint64_t v200 = *(void *)(a2 + v199);
          if (v200 == -1 || v200 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v201 = *(unsigned char *)(*(void *)(a2 + *v7) + v200);
            *(void *)(a2 + v199) = v200 + 1;
            v198 |= (unint64_t)(v201 & 0x7F) << v196;
            if (v201 < 0)
            {
              v196 += 7;
              BOOL v14 = v197++ >= 9;
              if (v14)
              {
                uint64_t v198 = 0;
                goto LABEL_565;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v198 = 0;
        }
LABEL_565:
        BOOL v304 = v198 != 0;
        uint64_t v305 = 484;
        goto LABEL_602;
      case 0x2Fu:
        char v202 = 0;
        unsigned int v203 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x8000000000uLL;
        while (2)
        {
          uint64_t v204 = *v3;
          unint64_t v205 = *(void *)(a2 + v204);
          if (v205 == -1 || v205 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v206 = *(unsigned char *)(*(void *)(a2 + *v7) + v205);
            *(void *)(a2 + v204) = v205 + 1;
            v20 |= (unint64_t)(v206 & 0x7F) << v202;
            if (v206 < 0)
            {
              v202 += 7;
              BOOL v14 = v203++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_569;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_569:
        uint64_t v302 = 448;
        goto LABEL_627;
      case 0x30u:
        char v207 = 0;
        unsigned int v208 = 0;
        uint64_t v209 = 0;
        *(void *)(a1 + 496) |= 0x10000000000000uLL;
        while (2)
        {
          uint64_t v210 = *v3;
          unint64_t v211 = *(void *)(a2 + v210);
          if (v211 == -1 || v211 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v212 = *(unsigned char *)(*(void *)(a2 + *v7) + v211);
            *(void *)(a2 + v210) = v211 + 1;
            v209 |= (unint64_t)(v212 & 0x7F) << v207;
            if (v212 < 0)
            {
              v207 += 7;
              BOOL v14 = v208++ >= 9;
              if (v14)
              {
                uint64_t v209 = 0;
                goto LABEL_573;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v209 = 0;
        }
LABEL_573:
        BOOL v304 = v209 != 0;
        uint64_t v305 = 495;
        goto LABEL_602;
      case 0x31u:
        char v213 = 0;
        unsigned int v214 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x1000000uLL;
        while (2)
        {
          uint64_t v215 = *v3;
          unint64_t v216 = *(void *)(a2 + v215);
          if (v216 == -1 || v216 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v217 = *(unsigned char *)(*(void *)(a2 + *v7) + v216);
            *(void *)(a2 + v215) = v216 + 1;
            v20 |= (unint64_t)(v217 & 0x7F) << v213;
            if (v217 < 0)
            {
              v213 += 7;
              BOOL v14 = v214++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_577;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_577:
        uint64_t v302 = 220;
        goto LABEL_627;
      case 0x32u:
        char v218 = 0;
        unsigned int v219 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x400000000uLL;
        while (2)
        {
          uint64_t v220 = *v3;
          unint64_t v221 = *(void *)(a2 + v220);
          if (v221 == -1 || v221 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v222 = *(unsigned char *)(*(void *)(a2 + *v7) + v221);
            *(void *)(a2 + v220) = v221 + 1;
            v20 |= (unint64_t)(v222 & 0x7F) << v218;
            if (v222 < 0)
            {
              v218 += 7;
              BOOL v14 = v219++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_581;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_581:
        uint64_t v302 = 352;
        goto LABEL_627;
      case 0x33u:
        char v223 = 0;
        unsigned int v224 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x800000uLL;
        while (2)
        {
          uint64_t v225 = *v3;
          unint64_t v226 = *(void *)(a2 + v225);
          if (v226 == -1 || v226 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v227 = *(unsigned char *)(*(void *)(a2 + *v7) + v226);
            *(void *)(a2 + v225) = v226 + 1;
            v20 |= (unint64_t)(v227 & 0x7F) << v223;
            if (v227 < 0)
            {
              v223 += 7;
              BOOL v14 = v224++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_585;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_585:
        uint64_t v302 = 216;
        goto LABEL_627;
      case 0x34u:
        char v228 = 0;
        unsigned int v229 = 0;
        uint64_t v230 = 0;
        *(void *)(a1 + 496) |= 0x400000000000uLL;
        while (2)
        {
          uint64_t v231 = *v3;
          unint64_t v232 = *(void *)(a2 + v231);
          if (v232 == -1 || v232 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v233 = *(unsigned char *)(*(void *)(a2 + *v7) + v232);
            *(void *)(a2 + v231) = v232 + 1;
            v230 |= (unint64_t)(v233 & 0x7F) << v228;
            if (v233 < 0)
            {
              v228 += 7;
              BOOL v14 = v229++ >= 9;
              if (v14)
              {
                uint64_t v230 = 0;
                goto LABEL_589;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v230 = 0;
        }
LABEL_589:
        BOOL v304 = v230 != 0;
        uint64_t v305 = 489;
        goto LABEL_602;
      case 0x35u:
        char v234 = 0;
        unsigned int v235 = 0;
        uint64_t v20 = 0;
        *(void *)(a1 + 496) |= 0x1000000000uLL;
        while (2)
        {
          uint64_t v236 = *v3;
          unint64_t v237 = *(void *)(a2 + v236);
          if (v237 == -1 || v237 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v238 = *(unsigned char *)(*(void *)(a2 + *v7) + v237);
            *(void *)(a2 + v236) = v237 + 1;
            v20 |= (unint64_t)(v238 & 0x7F) << v234;
            if (v238 < 0)
            {
              v234 += 7;
              BOOL v14 = v235++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_593;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v20) = 0;
        }
LABEL_593:
        uint64_t v302 = 400;
        goto LABEL_627;
      case 0x36u:
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 392;
        goto LABEL_403;
      case 0x37u:
        char v239 = 0;
        unsigned int v240 = 0;
        uint64_t v241 = 0;
        *(void *)(a1 + 496) |= 0x80000000000uLL;
        while (2)
        {
          uint64_t v242 = *v3;
          unint64_t v243 = *(void *)(a2 + v242);
          if (v243 == -1 || v243 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v244 = *(unsigned char *)(*(void *)(a2 + *v7) + v243);
            *(void *)(a2 + v242) = v243 + 1;
            v241 |= (unint64_t)(v244 & 0x7F) << v239;
            if (v244 < 0)
            {
              v239 += 7;
              BOOL v14 = v240++ >= 9;
              if (v14)
              {
                uint64_t v241 = 0;
                goto LABEL_597;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v241 = 0;
        }
LABEL_597:
        BOOL v304 = v241 != 0;
        uint64_t v305 = 486;
        goto LABEL_602;
      case 0x38u:
        uint64_t v26 = PBReaderReadData();
        uint64_t v27 = 288;
LABEL_403:
        uint64_t v291 = *(void **)(a1 + v27);
        *(void *)(a1 + v27) = v26;

        goto LABEL_645;
      case 0x39u:
        char v245 = 0;
        unsigned int v246 = 0;
        uint64_t v247 = 0;
        *(void *)(a1 + 496) |= 0x1000000000000uLL;
        while (2)
        {
          uint64_t v248 = *v3;
          unint64_t v249 = *(void *)(a2 + v248);
          if (v249 == -1 || v249 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v250 = *(unsigned char *)(*(void *)(a2 + *v7) + v249);
            *(void *)(a2 + v24_Block_object_dispose(&STACK[0x230], 8) = v249 + 1;
            v247 |= (unint64_t)(v250 & 0x7F) << v245;
            if (v250 < 0)
            {
              v245 += 7;
              BOOL v14 = v246++ >= 9;
              if (v14)
              {
                uint64_t v247 = 0;
                goto LABEL_601;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v247 = 0;
        }
LABEL_601:
        BOOL v304 = v247 != 0;
        uint64_t v305 = 491;
LABEL_602:
        *(unsigned char *)(a1 + v305) = v304;
        goto LABEL_645;
      case 0x3Au:
        char v251 = 0;
        unsigned int v252 = 0;
        uint64_t v30 = 0;
        *(void *)(a1 + 496) |= 0x1000uLL;
        while (2)
        {
          uint64_t v253 = *v3;
          unint64_t v254 = *(void *)(a2 + v253);
          if (v254 == -1 || v254 >= *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v255 = *(unsigned char *)(*(void *)(a2 + *v7) + v254);
            *(void *)(a2 + v253) = v254 + 1;
            v30 |= (unint64_t)(v255 & 0x7F) << v251;
            if (v255 < 0)
            {
              v251 += 7;
              BOOL v14 = v252++ >= 9;
              if (v14)
              {
                uint64_t v30 = 0;
                goto LABEL_606;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v30 = 0;
        }
LABEL_606:
        uint64_t v303 = 104;
        goto LABEL_644;
      default:
        switch((int)v17)
        {
          case 200:
            unint64_t v24 = objc_alloc_init(MIPLibraryIdentifier);
            [(id)a1 addLibraryIdentifiers:v24];
            if PBReaderPlaceMark() && (MIPLibraryIdentifierReadFrom((uint64_t)v24, a2))
            {
LABEL_429:
              PBReaderRecallMark();

LABEL_645:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            }
LABEL_647:

            return 0;
          case 201:
            char v256 = 0;
            unsigned int v257 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 0x80000uLL;
            while (2)
            {
              uint64_t v258 = *v3;
              unint64_t v259 = *(void *)(a2 + v258);
              if (v259 == -1 || v259 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v260 = *(unsigned char *)(*(void *)(a2 + *v7) + v259);
                *(void *)(a2 + v25_Block_object_dispose(&STACK[0x230], 8) = v259 + 1;
                v30 |= (unint64_t)(v260 & 0x7F) << v256;
                if (v260 < 0)
                {
                  v256 += 7;
                  BOOL v14 = v257++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_610;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_610:
            uint64_t v303 = 160;
            goto LABEL_644;
          case 202:
            char v261 = 0;
            unsigned int v262 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 0x200000uLL;
            while (2)
            {
              uint64_t v263 = *v3;
              unint64_t v264 = *(void *)(a2 + v263);
              if (v264 == -1 || v264 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v265 = *(unsigned char *)(*(void *)(a2 + *v7) + v264);
                *(void *)(a2 + v263) = v264 + 1;
                v30 |= (unint64_t)(v265 & 0x7F) << v261;
                if (v265 < 0)
                {
                  v261 += 7;
                  BOOL v14 = v262++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_614;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_614:
            uint64_t v303 = 176;
            goto LABEL_644;
          case 203:
            char v266 = 0;
            unsigned int v267 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 1uLL;
            while (2)
            {
              uint64_t v268 = *v3;
              unint64_t v269 = *(void *)(a2 + v268);
              if (v269 == -1 || v269 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v270 = *(unsigned char *)(*(void *)(a2 + *v7) + v269);
                *(void *)(a2 + v26_Block_object_dispose(&STACK[0x230], 8) = v269 + 1;
                v30 |= (unint64_t)(v270 & 0x7F) << v266;
                if (v270 < 0)
                {
                  v266 += 7;
                  BOOL v14 = v267++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_618;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_618:
            uint64_t v303 = 8;
            goto LABEL_644;
          case 204:
            char v271 = 0;
            unsigned int v272 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 0x8000uLL;
            while (2)
            {
              uint64_t v273 = *v3;
              unint64_t v274 = *(void *)(a2 + v273);
              if (v274 == -1 || v274 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v275 = *(unsigned char *)(*(void *)(a2 + *v7) + v274);
                *(void *)(a2 + v273) = v274 + 1;
                v30 |= (unint64_t)(v275 & 0x7F) << v271;
                if (v275 < 0)
                {
                  v271 += 7;
                  BOOL v14 = v272++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_622;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_622:
            uint64_t v303 = 128;
            goto LABEL_644;
          case 205:
            char v276 = 0;
            unsigned int v277 = 0;
            uint64_t v20 = 0;
            *(void *)(a1 + 496) |= 0x800000000uLL;
            while (2)
            {
              uint64_t v278 = *v3;
              unint64_t v279 = *(void *)(a2 + v278);
              if (v279 == -1 || v279 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v280 = *(unsigned char *)(*(void *)(a2 + *v7) + v279);
                *(void *)(a2 + v27_Block_object_dispose(&STACK[0x230], 8) = v279 + 1;
                v20 |= (unint64_t)(v280 & 0x7F) << v276;
                if (v280 < 0)
                {
                  v276 += 7;
                  BOOL v14 = v277++ >= 9;
                  if (v14)
                  {
                    LODWORD(v20) = 0;
                    goto LABEL_626;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              LODWORD(v20) = 0;
            }
LABEL_626:
            uint64_t v302 = 376;
LABEL_627:
            *(_DWORD *)(a1 + v302) = v20;
            goto LABEL_645;
          case 206:
            uint64_t v26 = PBReaderReadString();
            uint64_t v27 = 368;
            goto LABEL_403;
          case 207:
            char v281 = 0;
            unsigned int v282 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 0x40000uLL;
            while (2)
            {
              uint64_t v283 = *v3;
              unint64_t v284 = *(void *)(a2 + v283);
              if (v284 == -1 || v284 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v285 = *(unsigned char *)(*(void *)(a2 + *v7) + v284);
                *(void *)(a2 + v283) = v284 + 1;
                v30 |= (unint64_t)(v285 & 0x7F) << v281;
                if (v285 < 0)
                {
                  v281 += 7;
                  BOOL v14 = v282++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_631;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_631:
            uint64_t v303 = 152;
            goto LABEL_644;
          case 208:
            uint64_t v26 = PBReaderReadString();
            uint64_t v27 = 384;
            goto LABEL_403;
          case 209:
            uint64_t v26 = PBReaderReadString();
            uint64_t v27 = 456;
            goto LABEL_403;
          case 210:
            char v286 = 0;
            unsigned int v287 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 0x400000uLL;
            while (2)
            {
              uint64_t v288 = *v3;
              unint64_t v289 = *(void *)(a2 + v288);
              if (v289 == -1 || v289 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v290 = *(unsigned char *)(*(void *)(a2 + *v7) + v289);
                *(void *)(a2 + v28_Block_object_dispose(&STACK[0x230], 8) = v289 + 1;
                v30 |= (unint64_t)(v290 & 0x7F) << v286;
                if (v290 < 0)
                {
                  v286 += 7;
                  BOOL v14 = v287++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_635;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_635:
            uint64_t v303 = 184;
            goto LABEL_644;
          case 211:
            uint64_t v26 = PBReaderReadString();
            uint64_t v27 = 232;
            goto LABEL_403;
          case 212:
            char v292 = 0;
            unsigned int v293 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 0x20000uLL;
            while (2)
            {
              uint64_t v294 = *v3;
              unint64_t v295 = *(void *)(a2 + v294);
              if (v295 == -1 || v295 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v296 = *(unsigned char *)(*(void *)(a2 + *v7) + v295);
                *(void *)(a2 + v294) = v295 + 1;
                v30 |= (unint64_t)(v296 & 0x7F) << v292;
                if (v296 < 0)
                {
                  v292 += 7;
                  BOOL v14 = v293++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_639;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_639:
            uint64_t v303 = 144;
            goto LABEL_644;
          case 213:
            char v297 = 0;
            unsigned int v298 = 0;
            uint64_t v30 = 0;
            *(void *)(a1 + 496) |= 2uLL;
            while (2)
            {
              uint64_t v299 = *v3;
              unint64_t v300 = *(void *)(a2 + v299);
              if (v300 == -1 || v300 >= *(void *)(a2 + *v4))
              {
                *(unsigned char *)(a2 + *v5) = 1;
              }
              else
              {
                char v301 = *(unsigned char *)(*(void *)(a2 + *v7) + v300);
                *(void *)(a2 + v299) = v300 + 1;
                v30 |= (unint64_t)(v301 & 0x7F) << v297;
                if (v301 < 0)
                {
                  v297 += 7;
                  BOOL v14 = v298++ >= 9;
                  if (v14)
                  {
                    uint64_t v30 = 0;
                    goto LABEL_643;
                  }
                  continue;
                }
              }
              break;
            }
            if (*(unsigned char *)(a2 + *v5)) {
              uint64_t v30 = 0;
            }
LABEL_643:
            uint64_t v303 = 16;
LABEL_644:
            *(void *)(a1 + v303) = v30;
            goto LABEL_645;
          default:
            switch((int)v17)
            {
              case 400:
                unint64_t v24 = objc_alloc_init(MIPSong);
                objc_storeStrong((id *)(a1 + 424), v24);
                if (!PBReaderPlaceMark() || (MIPSongReadFrom((uint64_t)v24, a2) & 1) == 0) {
                  goto LABEL_647;
                }
                goto LABEL_429;
              case 401:
                unint64_t v24 = objc_alloc_init(MIPMovie);
                objc_storeStrong((id *)(a1 + 336), v24);
                if (!PBReaderPlaceMark() || (MIPMovieReadFrom((uint64_t)v24, a2) & 1) == 0) {
                  goto LABEL_647;
                }
                goto LABEL_429;
              case 402:
                unint64_t v24 = objc_alloc_init(MIPTVShow);
                objc_storeStrong((id *)(a1 + 472), v24);
                if (!PBReaderPlaceMark() || (MIPTVShowReadFrom((uint64_t)v24, a2) & 1) == 0) {
                  goto LABEL_647;
                }
                goto LABEL_429;
              case 403:
                unint64_t v24 = objc_alloc_init(MIPPodcast);
                objc_storeStrong((id *)(a1 + 360), v24);
                if (!PBReaderPlaceMark() || !MIPPodcastReadFrom((uint64_t)v24, a2)) {
                  goto LABEL_647;
                }
                goto LABEL_429;
              case 404:
                unint64_t v24 = objc_alloc_init(MIPAudiobook);
                objc_storeStrong((id *)(a1 + 200), v24);
                if PBReaderPlaceMark() && (MIPAudiobookReadFrom((uint64_t)v24, a2)) {
                  goto LABEL_429;
                }
                goto LABEL_647;
              default:
                goto LABEL_34;
            }
        }
    }
  }
}

uint64_t ML3StoreContainerImportItem::getDeduplicationOrderingTerms(ML3StoreContainerImportItem *this)
{
  return 0;
}

id ML3StoreContainerImportItem::getDeduplicationPredicates(id *this)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [this[8] objectForKey:&unk_1F0912580];
  uint64_t v4 = [v3 longLongValue];

  if (v4)
  {
    unint64_t v5 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:v4];
    [v2 addObject:v5];
  }
  uint64_t v6 = [this[8] objectForKey:&unk_1F0912598];
  if (v6)
  {
    unint64_t v7 = +[ML3ComparisonPredicate predicateWithProperty:@"cloud_global_id" equalToValue:v6];
    [v2 addObject:v7];
  }

  return v2;
}

void sub_1B04A7354(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void ML3StoreContainerImportItem::getDescription(ML3StoreContainerImportItem *this)
{
  (*(void (**)(void *__return_ptr))(*(void *)this + 24))(v11);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v11[0] = &unk_1F08C3230;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v17 = __p;
  }
  (*(void (**)(void *__return_ptr, ML3StoreContainerImportItem *, uint64_t))(*(void *)this + 24))(v11, this, 184549417);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    v11[0] = &unk_1F08C3230;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v16 = __p;
  }
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v11);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"<ML3StoreContainerImportItem ", 29);
  *(_DWORD *)((char *)&v11[1] + *(void *)(v11[0] - 24)) = *(_DWORD *)((unsigned char *)&v11[1] + *(void *)(v11[0] - 24)) & 0xFFFFFFB5 | 8;
  id v2 = (void *)std::ostream::operator<<();
  uint64_t v3 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)" name=\"", 7);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v4 = &v17;
  }
  else {
    uint64_t v4 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  uint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)v4, size);
  unint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\", globalID=\"", 13);
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    char v8 = &v16;
  }
  else {
    char v8 = (std::string *)v16.__r_.__value_.__r.__words[0];
  }
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v9 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v9 = v16.__r_.__value_.__l.__size_;
  }
  unint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)v8, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"\">", 2);
  std::stringbuf::str();
  v11[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v11 + *(void *)(v11[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v11[1] = MEMORY[0x1E4FBA470] + 16;
  if (v14 < 0) {
    operator delete(v13);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1B3E935B0](&v15);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
}

void sub_1B04A76D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v17 - 57) < 0) {
    operator delete(*(void **)(v17 - 80));
  }
  _Unwind_Resume(exception_object);
}

void ML3StoreContainerImportItem::getImportItemArrayValue(id *this@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if ((a2 - 218103813) >= 2)
  {
    if (a2 == 218103812)
    {
      [this[8] objectForKeyedSubscript:@"childrenIds"];
      memset(v7, 0, sizeof(v7));
      obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
      if ([obj countByEnumeratingWithState:v7 objects:v8 count:16]) {
        operator new();
      }
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v4 = [NSString stringWithUTF8String:"virtual std::vector<std::shared_ptr<ML3ImportItem>> ML3StoreContainerImportItem::getImportItemArrayValue(MLImportPropertyKey) const"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v4, @"ML3StoreContainerImportItem.mm", 111, @"getImportItemArrayValue called with unknown property key %x", a2);
    }
  }
}

void sub_1B04A7AB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  std::vector<std::shared_ptr<ML3ImportItem>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a26);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_pointer<ML3StoreContainerTrackItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3StoreContainerTrackItemImportItem>,std::allocator<ML3StoreContainerTrackItemImportItem>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"NSt3__110shared_ptrI13ML3ImportItemE27__shared_ptr_default_deleteIS1_36ML3StoreContainerTrackItemImportItemEE"))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<ML3StoreContainerTrackItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3StoreContainerTrackItemImportItem>,std::allocator<ML3StoreContainerTrackItemImportItem>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<ML3StoreContainerTrackItemImportItem *,std::shared_ptr<ML3ImportItem>::__shared_ptr_default_delete<ML3ImportItem,ML3StoreContainerTrackItemImportItem>,std::allocator<ML3StoreContainerTrackItemImportItem>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1B3E93610);
}

uint64_t ML3StoreContainerTrackItemImportItem::getDescription(ML3StoreContainerTrackItemImportItem *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"<ML3StoreContainerTrackItemImportItem ", 38);
  *(_DWORD *)((char *)&v5[1] + *(void *)(v5[0] - 24)) = *(_DWORD *)((unsigned char *)&v5[1] + *(void *)(v5[0] - 24)) & 0xFFFFFFB5 | 8;
  uint64_t v1 = (void *)std::ostream::operator<<();
  id v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)" sync_id=", 9);
  *(_DWORD *)((char *)v2 + *(void *)(*v2 - 24) + _Block_object_dispose(&STACK[0x230], 8) = *(_DWORD *)((unsigned char *)v2 + *(void *)(*v2 - 24) + 8) & 0xFFFFFFB5 | 2;
  uint64_t v3 = (void *)std::ostream::operator<<();
  char v8 = 62;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v8, 1);
  std::stringbuf::str();
  v5[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v5 + *(void *)(v5[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v5[1] = MEMORY[0x1E4FBA470] + 16;
  if (v6 < 0) {
    operator delete((void *)v5[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1B3E935B0](&v7);
}

void sub_1B04A7DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL ML3StoreContainerTrackItemImportItem::hasValue(ML3StoreContainerTrackItemImportItem *this, int a2)
{
  return a2 == 234881030;
}

uint64_t ML3StoreContainerTrackItemImportItem::getIntegerValue(ML3StoreContainerTrackItemImportItem *this, uint64_t a2)
{
  if (a2 == 234881030) {
    return *((void *)this + 8);
  }
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  unint64_t v5 = [NSString stringWithUTF8String:"virtual int64_t ML3StoreContainerTrackItemImportItem::getIntegerValue(MLImportPropertyKey) const"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, @"ML3StoreContainerImportItem.mm", 158, @"ML3StoreContainerTrackItemImportItem::getIntegerValue called with unknown property key %x", a2);

  return 0;
}

void sub_1B04A7EC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ML3StoreContainerTrackItemImportItem::getStringValue(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F08C3230;
  *(unsigned char *)(a2 + _Block_object_dispose(&STACK[0x230], 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  if ((a1 - 234881028) > 6 || ((1 << (a1 - 4)) & 0x43) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"virtual ML3ImportStringValue ML3StoreContainerTrackItemImportItem::getStringValue(MLImportPropertyKey) const"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v5, @"ML3StoreContainerImportItem.mm", 143, @"ML3StoreContainerTrackItemImportItem::getStringValue called with unknown property key %x", a1);
  }
}

void sub_1B04A7FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  *(void *)uint64_t v10 = v11;
  if (*(char *)(v10 + 39) < 0) {
    operator delete(*v13);
  }
  _Unwind_Resume(a1);
}

void ML3StoreContainerTrackItemImportItem::~ML3StoreContainerTrackItemImportItem(ML3StoreContainerTrackItemImportItem *this)
{
  *(void *)this = off_1F08C3148;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)this + 24);

  JUMPOUT(0x1B3E93610);
}

{
  *(void *)this = off_1F08C3148;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)this + 24);
}

BOOL ML3StoreContainerImportItem::hasValue(id *this, uint64_t a2)
{
  if (a2 == 218103812)
  {
    id v2 = [this[8] objectForKeyedSubscript:@"childrenIds"];
    BOOL v3 = [v2 count] != 0;

    return v3;
  }
  else
  {
    return ML3StoreImportItem::hasValue((ML3StoreImportItem *)this, a2);
  }
}

void sub_1B04A8150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ML3StoreContainerImportItem::getIntegerValue(ML3StoreContainerImportItem *this, uint64_t a2)
{
  if (a2 == 184549413) {
    return 2;
  }
  if (a2 == 184549395) {
    return *((unsigned char *)this + 18) == 0;
  }
  return ML3StoreImportItem::getIntegerValue(this, a2);
}

void ML3StoreContainerImportItem::~ML3StoreContainerImportItem(id *this)
{
  *this = off_1F08C3148;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)(this + 3));

  JUMPOUT(0x1B3E93610);
}

{

  *this = off_1F08C3148;
  std::__hash_table<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,ML3ImportValue<std::string>>>>::~__hash_table((uint64_t)(this + 3));
}

uint64_t __Block_byref_object_copy__28174(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28175(uint64_t a1)
{
}

BOOL ML3ArtworkDeviceSupportsASTC()
{
  return +[ML3MusicLibrary deviceSupportsASTC];
}

int64_t ML3ArtworkDevicePreferredImageFormat()
{
  return +[ML3MusicLibrary devicePreferredImageFormat];
}

id ML3ArtworkOriginalArtworkDirectory()
{
  v0 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  uint64_t v1 = [v0 artworkDirectory];

  return v1;
}

id ML3ArtworkRootArtworkCacheDirectory()
{
  v0 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  uint64_t v1 = [v0 rootArtworkCacheDirectory];

  return v1;
}

id ML3ArtworkDirectory()
{
  v0 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  uint64_t v1 = [v0 artworkDirectory];

  return v1;
}

id ML3ArtworkArtworkCacheDirectoryForSize(double a1, double a2)
{
  uint64_t v4 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  unint64_t v5 = objc_msgSend(v4, "artworkCacheDirectoryForSize:", a1, a2);

  return v5;
}

id ML3ArtworkArtworkCacheDirectoryForEffect(void *a1)
{
  id v1 = a1;
  id v2 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  BOOL v3 = [v2 artworkCacheDirectoryForEffect:v1];

  return v3;
}

id ML3ArtworkRelativePathFromToken(uint64_t a1)
{
  return +[ML3MusicLibrary artworkRelativePathFromToken:a1];
}

id ML3ArtworkTokenForArtistHeroArtwork(uint64_t a1)
{
  return +[ML3MusicLibrary artworkTokenForArtistHeroURL:a1];
}

id ML3ArtworkTokenForChapterArtwork(uint64_t a1)
{
  return +[ML3MusicLibrary artworkTokenForChapterWithItemPID:retrievalTime:](ML3MusicLibrary, "artworkTokenForChapterWithItemPID:retrievalTime:", a1);
}

int64_t ML3ArtworkSourceTypeForTrackSource(uint64_t a1)
{
  return +[ML3MusicLibrary artworkSourceTypeForTrackSource:a1];
}

uint64_t ML3ArtworkHasOriginalArtwork(void *a1)
{
  id v1 = a1;
  id v2 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  uint64_t v3 = [v2 hasOriginalArtworkForRelativePath:v1];

  return v3;
}

uint64_t ML3ArtworkIsArtworkFetchable(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a1 isArtworkFetchableForPersistentID:a2 entityType:a3 artworkType:a4 artworkSourceType:a5];
}

uint64_t AppendNestedSearchCriteriaList()
{
  return MEMORY[0x1F412CC00]();
}

uint64_t AppendNumericSearchCriterion()
{
  return MEMORY[0x1F412CC08]();
}

uint64_t AppendSearchCriterion()
{
  return MEMORY[0x1F412CC10]();
}

uint64_t AppendUStringSearchCriterion()
{
  return MEMORY[0x1F412CC18]();
}

uint64_t AppendValueRangeSearchCriterion()
{
  return MEMORY[0x1F412CC20]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9718](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1F40C9720](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9728](c, data, *(void *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9738](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1F40C9740](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9748](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1F40C9778](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C9788](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1F40C97B8](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1F40C97C8](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x1F40D7678](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1F40D7690](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x1F40D7698](calendar, v3, at);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BE8](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E08](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x1F40D8478](alloc, buffer);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84E0](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D8550](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1F40D8680](tokenizer);
}

CFTypeRef CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizerRef tokenizer, CFOptionFlags attribute)
{
  return (CFTypeRef)MEMORY[0x1F40D8690](tokenizer, attribute);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1F40D8698](alloc, string, range.location, range.length, options, locale);
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x1F40D86C0](string, range, transform, reverse);
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x1F40D86F8]();
}

CFTimeInterval CFTimeZoneGetSecondsFromGMT(CFTimeZoneRef tz, CFAbsoluteTime at)
{
  MEMORY[0x1F40D8718](tz, at);
  return result;
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x1F41092C0]();
}

uint64_t ChapterData_CopyProperty()
{
  return MEMORY[0x1F412CC28]();
}

uint64_t ChapterData_Create()
{
  return MEMORY[0x1F412CC30]();
}

uint64_t ChapterData_CreateWithFlattenedData()
{
  return MEMORY[0x1F412CC38]();
}

uint64_t ChapterData_ExportFlattenedData()
{
  return MEMORY[0x1F412CC40]();
}

uint64_t ChapterData_FindURLForTime()
{
  return MEMORY[0x1F412CC48]();
}

uint64_t ChapterData_FindURLTitleForTime()
{
  return MEMORY[0x1F412CC50]();
}

uint64_t ChapterData_GetFlags()
{
  return MEMORY[0x1F412CC58]();
}

uint64_t ChapterData_GetIndChapterTime()
{
  return MEMORY[0x1F412CC60]();
}

uint64_t ChapterData_GetNameCookieForTime()
{
  return MEMORY[0x1F412CC68]();
}

uint64_t ChapterData_GetNumChapters()
{
  return MEMORY[0x1F412CC70]();
}

uint64_t ChapterData_GetPictureCookieForTime()
{
  return MEMORY[0x1F412CC78]();
}

uint64_t ChapterData_GetURLCookieForTime()
{
  return MEMORY[0x1F412CC80]();
}

uint64_t ChapterData_NewChapter()
{
  return MEMORY[0x1F412CC88]();
}

uint64_t ChapterData_Release()
{
  return MEMORY[0x1F412CC90]();
}

uint64_t ChapterData_Retain()
{
  return MEMORY[0x1F412CC98]();
}

uint64_t ChapterData_SetProperty()
{
  return MEMORY[0x1F412CCA0]();
}

uint64_t CountSearchCriteria()
{
  return MEMORY[0x1F412CCA8]();
}

uint64_t DisposeSearchCriteriaList()
{
  return MEMORY[0x1F412CCB0]();
}

uint64_t GetSearchCriteriaListOptions()
{
  return MEMORY[0x1F412CCB8]();
}

uint64_t GetSearchCriterionInfo()
{
  return MEMORY[0x1F412CCC0]();
}

uint64_t GetSearchCriterionInfoBooleanValue()
{
  return MEMORY[0x1F412CCC8]();
}

uint64_t GetSearchCriterionInfoNumericValue()
{
  return MEMORY[0x1F412CCD0]();
}

uint64_t GetSearchCriterionInfoValueRange()
{
  return MEMORY[0x1F412CCD8]();
}

uint64_t GetValueRangeCriteriaEndValue()
{
  return MEMORY[0x1F412CCE0]();
}

uint64_t GetValueRangeCriteriaStartValue()
{
  return MEMORY[0x1F412CCE8]();
}

uint64_t ITImportSearchCriteriaList()
{
  return MEMORY[0x1F412CCF0]();
}

uint64_t InitValueRangeCriteria()
{
  return MEMORY[0x1F412CCF8]();
}

uint64_t LockSearchCriteriaList()
{
  return MEMORY[0x1F412CD00]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x1F412EB88]();
}

uint64_t MSVCopySystemBuildVersion()
{
  return MEMORY[0x1F412EB98]();
}

uint64_t MSVCreateTemporaryFileHandle()
{
  return MEMORY[0x1F412EBA0]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x1F412EBB0]();
}

uint64_t MSVDeviceIsHomePod()
{
  return MEMORY[0x1F412EBC0]();
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x1F412EBC8]();
}

uint64_t MSVDeviceIsiPad()
{
  return MEMORY[0x1F412EBD0]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x1F412EBD8]();
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  return MEMORY[0x1F412EBE0]();
}

uint64_t MSVDeviceSupportsMultipleLibraries()
{
  return MEMORY[0x1F412EBF0]();
}

uint64_t MSVDeviceSupportsSideLoadedMediaContent()
{
  return MEMORY[0x1F412EBF8]();
}

uint64_t MSVEnableDirStatsForDirectory()
{
  return MEMORY[0x1F412EC00]();
}

uint64_t MSVGetDiskUsageForPath()
{
  return MEMORY[0x1F412EC08]();
}

uint64_t MSVGetKernelBootTime()
{
  return MEMORY[0x1F412EC10]();
}

uint64_t MSVGetMaximumScreenScale()
{
  return MEMORY[0x1F412EC18]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x1F412EC20]();
}

uint64_t MSVHomeSharingCacheDirectory()
{
  return MEMORY[0x1F412EC40]();
}

uint64_t MSVImageUtilitiesAddImageToDestination()
{
  return MEMORY[0x1F412EC48]();
}

uint64_t MSVImageUtilitiesAddJPEGToDestination()
{
  return MEMORY[0x1F412EC50]();
}

uint64_t MSVImageUtilitiesCreateDataImageDestination()
{
  return MEMORY[0x1F412EC60]();
}

uint64_t MSVImageUtilitiesMakeBoundingBoxSize()
{
  return MEMORY[0x1F412EC70]();
}

uint64_t MSVMediaLoggingDirectory()
{
  return MEMORY[0x1F412EC88]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x1F412EC90]();
}

uint64_t MSVPropertyListDataClasses()
{
  return MEMORY[0x1F412ECB0]();
}

uint64_t MSVTCCIdentityForCurrentProcess()
{
  return MEMORY[0x1F412ECE0]();
}

uint64_t MSVUnarchivedObjectOfClasses()
{
  return MEMORY[0x1F412ECF0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1F40E72A0](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t NewSearchCriteriaList()
{
  return MEMORY[0x1F412CD08]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1F41471A0]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1F41471F0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1F4147290]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x1F415CBB8]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x1F415CBF0]();
}

uint64_t UnlockSearchCriteriaList()
{
  return MEMORY[0x1F412CD10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1F40D94B8]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1F40D94C0]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1F40D94E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E438](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E440](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5D8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E600](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

std::wstring *__cdecl std::wstring::append(std::wstring *this, const std::wstring::value_type *__s, std::wstring::size_type __n)
{
  return (std::wstring *)MEMORY[0x1F417E680](this, __s, __n);
}

void std::wstring::resize(std::wstring *this, std::wstring::size_type __n, std::wstring::value_type __c)
{
}

void std::wstring::__grow_by(std::wstring *this, std::wstring::size_type __old_cap, std::wstring::size_type __delta_cap, std::wstring::size_type __old_sz, std::wstring::size_type __n_copy, std::wstring::size_type __n_del, std::wstring::size_type __n_add)
{
}

void std::wstring::push_back(std::wstring *this, std::wstring::value_type __c)
{
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1F417E728]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1F417E730]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1F417E740]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1F417E748]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x1F417E760]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1F417E768]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1F417E780]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E868]();
}

{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E8A8]();
}

{
  return MEMORY[0x1F417E8B0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

std::codecvt<wchar_t, char, mbstate_t> *__cdecl std::codecvt<wchar_t,char,__mbstate_t>::codecvt(std::codecvt<wchar_t, char, mbstate_t> *this, size_t __refs)
{
  return (std::codecvt<wchar_t, char, mbstate_t> *)MEMORY[0x1F417ED40](this, __refs);
}

void std::codecvt<wchar_t,char,__mbstate_t>::~codecvt(std::codecvt<wchar_t, char, mbstate_t> *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x1F417EE78](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
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
  return (void *)MEMORY[0x1F417EFA8](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40C9C28]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

double atof(const char *a1)
{
  MEMORY[0x1F40CA498](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

uint64_t ct_green_tea_logger_create()
{
  return MEMORY[0x1F417A378]();
}

uint64_t ct_green_tea_logger_destroy()
{
  return MEMORY[0x1F417A388]();
}

uint64_t dirstat_np()
{
  return MEMORY[0x1F40CB918]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1F40CC1B0](a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1F40CC288](a1, a2, a3, *(void *)&a4);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x1F417A398]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1F4182CB0](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1F4182CB8](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1F4182CD8](strm, version, *(void *)&stream_size);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC810](a1, a2);
  result.reuint64_t m = v3;
  result.uint64_t quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x1F40CC850](a1, a2);
  result.reuint64_t m = v3;
  result.uint64_t quot = v2;
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40CC970](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40CCD70]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD978](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1F40CD9A8](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1F4181B28](sel);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1F40CDF60](__name, __value, *(void *)&__overwrite);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CDFD8](path, name, value, size, *(void *)&position, *(void *)&options);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CE078](*(void *)&a1);
}

void *__cdecl sqlite3_aggregate_context(sqlite3_context *a1, int nBytes)
{
  return (void *)MEMORY[0x1F4181F60](a1, *(void *)&nBytes);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1F4181FD0](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_bind_text16(sqlite3_stmt *a1, int a2, const void *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FF0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_blob_bytes(sqlite3_blob *a1)
{
  return MEMORY[0x1F4182018](a1);
}

int sqlite3_blob_close(sqlite3_blob *a1)
{
  return MEMORY[0x1F4182020](a1);
}

int sqlite3_blob_open(sqlite3 *a1, const char *zDb, const char *zTable, const char *zColumn, sqlite3_int64 iRow, int flags, sqlite3_blob **ppBlob)
{
  return MEMORY[0x1F4182028](a1, zDb, zTable, zColumn, iRow, *(void *)&flags, ppBlob);
}

int sqlite3_blob_read(sqlite3_blob *a1, void *Z, int N, int iOffset)
{
  return MEMORY[0x1F4182030](a1, Z, *(void *)&N, *(void *)&iOffset);
}

int sqlite3_blob_write(sqlite3_blob *a1, const void *z, int n, int iOffset)
{
  return MEMORY[0x1F4182038](a1, z, *(void *)&n, *(void *)&iOffset);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1F4182058](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1F41820B0](a1, *(void *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1F4182120](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1F4182128](db, zName, p, pClientData);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1F4182148](a1, *(void *)&op);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1F4182180](a1, zSQL);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1F4182190](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1F41821A0](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void *__cdecl sqlite3_get_auxdata(sqlite3_context *a1, int N)
{
  return (void *)MEMORY[0x1F41821F8](a1, *(void *)&N);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

sqlite3_stmt *__cdecl sqlite3_next_stmt(sqlite3 *pDb, sqlite3_stmt *pStmt)
{
  return (sqlite3_stmt *)MEMORY[0x1F4182270](pDb, pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v3(sqlite3 *db, const char *zSql, int nByte, unsigned int prepFlags, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182298](db, zSql, *(void *)&nByte, *(void *)&prepFlags, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_error_nomem(sqlite3_context *a1)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_null(sqlite3_context *a1)
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_value(sqlite3_context *a1, sqlite3_value *a2)
{
}

int sqlite3_set_authorizer(sqlite3 *a1, int (__cdecl *xAuth)(void *, int, const char *, const char *, const char *, const char *), void *pUserData)
{
  return MEMORY[0x1F4182350](a1, xAuth, pUserData);
}

void sqlite3_set_auxdata(sqlite3_context *a1, int N, void *a3, void (__cdecl *a4)(void *))
{
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1F41823A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stmt_busy(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B8](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41823C0](pStmt);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1F4182408](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1F4182418](a1);
}

int sqlite3_value_bytes16(sqlite3_value *a1)
{
  return MEMORY[0x1F4182420](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  MEMORY[0x1F4182428](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1F4182440](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

const void *__cdecl sqlite3_value_text16(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182460](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1F4182468](a1);
}

void srandom(unsigned int a1)
{
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1F417F728](*(void *)&code);
}

uint64_t ucol_close()
{
  return MEMORY[0x1F417FD08]();
}

uint64_t ucol_getBound()
{
  return MEMORY[0x1F417FD30]();
}

uint64_t ucol_getSortKey()
{
  return MEMORY[0x1F417FD68]();
}

uint64_t ucol_getVersion()
{
  return MEMORY[0x1F417FD80]();
}

uint64_t ucol_nextSortKeyPart()
{
  return MEMORY[0x1F417FD98]();
}

uint64_t ucol_open()
{
  return MEMORY[0x1F417FDA0]();
}

uint64_t ucol_setAttribute()
{
  return MEMORY[0x1F417FDC8]();
}

void uiter_setString(UCharIterator *iter, const UChar *s, int32_t length)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1F40CE5F8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40CE758](msg);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}